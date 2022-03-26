/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//
//City Occupation should be an ExecVM with it's own serie of functions for spanw/despawn/reinforcement/loop/succes call
diag_log format ["[CITY OCCUPATION]|WAK|TNA|WMS| _this = %1", _this];

private ["_playerBlackList",""]; 
params[
	["_infoType", "Occupation"],
	["_vehiclesPara", "O_MRAP_02_hmg_F"],
	["_timer", 3600],
	["_grpSizePara", 6],
	["_grpSizeAirAssault", 8],
	["_launcherChance", 15],
	["_skill", 0.5],
	["_loadout", "army"],
	["_occupationRadius", 100],
	["_WPDist" , 40],
	["_altitude", 150]
];

_pos = [];
_flaglist = [];
_locationTarget = [];
_grps = [];
_objects = [];
_Mkrs = [];
_MissionID = format ["%1_%2",_infoType,round time];
_name = "City Invasion"; //"Mission Name"
_difficulty = selectRandom ["Easy","Moderate","Difficult","Hardcore"]; //Difficulty, used in rewards selection
_clnObj = true;
_lootCount = [[3,2,2],[1,2,1],[4,2,1],[1,3,3],[0,0,0]];
_lootType = "military";

//BlackList players, not spawn around
_playerBlackList = allPlayers select {alive _x} apply {[position _x, 300]};

//find territories/players //closest city to player in base first, if no, random
{
	_flag = nearestObjects [position _x, ["Exile_Construction_Flag_Static"],100];
	if (count _flag != 0) then {_flaglist pushBack _flag};
}foreach (allPlayers select {alive _x});

if (count _flaglist != 0 ) then {
	_selectedFlag = selectRandom _flaglist;
	_pos = position _selectedFlag;
	//_flaglist deleteAt (_flaglist find _selectedFlag);
	_locationTarget = [_pos, true, true, true, false]call WMS_fnc_findClst_NamedLocation; //return [position,name]
	//no need to blackList player position, AI will be paradrop at first, then vehicles
}else {
	//if no players in base, find a city // get the list from WMS_Recon_AllCities WMS_Pos_Locals+WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
	_pos = [WMS_AMS_CenterMap, 0, ((worldsize/2)*1.2), 1, 0] call BIS_fnc_findSafePos;
	_locationTarget = [_pos, true, true, true, false]call WMS_fnc_findClst_NamedLocation; //return [position,name]
};
if (count _locationTarget != 2) exitWith {};
_pos = _locationTarget select 0;
//count building
_buildinglist = nearestObjects [_pos, ["House"],100];
if (count _buildinglist == 0) then {};
//count roads
_roadList = _pos nearRoads 100;
if (count _roadList == 0) then {};

//create a trigger zone, one large to detect the player(s) and spawn the AI, one smaller for the conbat zone
//LArge one to activate the mission
_triggOPFOR = createTrigger ["EmptyDetector", _pos, true];
_triggOPFOR setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_triggOPFOR setTriggerArea [1000, 1000, 0, false];
_triggOPFOR setTriggerStatements  
[ 
 	"this",  
  	"
	//Spawn AI in Groups already created
	",  
  	"
	//wait 60~120 secondes, delete the AI but not the groups
	" 
];
//small one to detect (loop) if every AI are dead
_triggPlayer = createTrigger ["EmptyDetector", _pos, true];
_triggPlayer setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_triggPlayer setTriggerArea [_occupationRadius, _occupationRadius, 0, false];
_triggPlayer setTriggerStatements  
[ 
  	"this",  
  	"
	
	",  
  	"
	
	" 
];

//create 2 markers
_MkrBorderName = format ["MkrBorder_%1_Occupation",(round time)];
_MkrBorder = createMarker [_MkrBorderName, _pos];
_MkrBorder setMarkerColor "colorOrange";
_MkrBorder setMarkerShape "ELLIPSE";
_MkrBorder setMarkerBrush "border";
_MkrBorder setMarkerSize [_occupationRadius,_occupationRadius];

_markerIconName = format ["MkrIcon_%1_Occupation",(round time)];
_markerIcon = createMarker [_markerIconName, _pos];
_markerIcon setMarkerType "o_unknown";
_markerIcon setMarkerColor "ColorRed";

//spawn para, probably when player get in the smaller trigger, paradrop behind
_paraGrp = [[(_pos select 0),(_pos select 1),200], OPFOR, _grpSizepara] call BIS_fnc_spawnGroup;
_grps pushBack _paraGrp;
_leaderParaGrp = Leader _paraGrp;
{ 
	_randomSpawnPos = [[(_pos select 0),(_pos select 1),200] , 0, 100, 0, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
	_x setpos [(_randomSpawnPos select 0),(_randomSpawnPos select 1),200]; 
} forEach units _paraGrp ;
[(units _paraGrp),'Para',_launcherChance,_skill,_loadout] call WMS_fnc_DynAI_SetUnitOPF; //'para' won't be enough, need a specific "OccPara" with EH

//maybe paradrop a light vehicle for _paraGrp, LOCKPLAYER
_parachute 	= createVehicle [WMS_para_Big,[_pos select 0, _pos select 1, _altitude], [], 5];
_parachute 	setPos [_pos select 0, _pos select 1, _altitude];
_parachute 	setdir winddir;
_parachute 	setvelocity [0,0,-8];

_cargo = createVehicle [_vehiclesPara ,position _parachute, [],5];
_cargo attachTo [_parachute,[0,0,0]];

_cargo setvehiclelock "LOCKEDPLAYER";
_paraGrp addVehicle _cargo;
_paradrop_process = { //NOPE
	_cargo = (_this select 0); //NOPE
	_parachute = (_this select 1); //NOPE
	waitUntil {((position _cargo) select 2) < 25};
	_smoke = "SmokeShellRed" createVehicle position _cargo;
	_smoke attachTo [_cargo,[0,0,1]];
	sleep 4;
	detach _cargo;
	sleep 5;
	deleteVehicle _parachute;
	_cargo allowdamage true;
};
[_cargo,_parachute]spawn _paradrop_process; //NOPE

//spawn Air assault for 2nd group
//[_pos,_target,_skill,_loadout,_grpSize,_timer,_choppa1,_choppa2,_dist1,_dist2,_WPDist,_WPType,_WPBeha,_WPComb,_WPSpee] spawn WMS_fnc_DynAI_AirAssault;
_AirAssaultData = [_pos, _flag, _skill, _loadout, _grpSizeAirAssault, _timer,nil,nil,nil,nil,_WPDist] spawn WMS_fnc_DynAI_AirAssault; //NOPE //if no base _flag not define

//spawn ground vehicle for 3rd group
//[_pos, _target, _timer,_skill,_grpSide,_loadout,_VHLfull,_lockPlayer,_useMarker,_dist1,_dist2,_WPDist] spawn WMS_fnc_infantryProgram_VHLpatrol;
_VHLPatrolData = [_pos, _flag, _timer, _skill, OPFOR, _loadout,nil,true,false,nil,nil,200,_infoType] spawn WMS_fnc_infantryProgram_VHLpatrol; //NOPE //if no base _flag not define

//spawn "building garrison" group for 4rd group if "ANYPLAYER" trigger is off

//spawn mines field
//[_pos, _radius, _howMany, _mineType, _fireExplode, _signs, _steps]call WMS_fnc_AMS_SpawnMineField
_mines = [_pos, _occupationRadius*0.75, 30, "ATMine", true, true]call WMS_fnc_AMS_SpawnMineField;

//set _grps waypoints
if (WMS_DynAI_Steal) then {
	[_paraGrp, _pos, _WPDist, 5, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "this call WMS_fnc_DynAI_Steal", [5,10,15]] call CBA_fnc_taskPatrol;
	} else {
	[_paraGrp, _pos, _WPDist, 5, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "", [5,10,15]] call CBA_fnc_taskPatrol; 
};


//WMS_AMS_Running_Array pushback [
WMS_Invasion_Array pushback [//AMS Format, managed by AMS_Watch
	_pos,
	(time + _timer + random _timer), //Time to finish //diag_tickTime
	_grps, //[_INFgrp1,_INFgrp2,_VHLgrp], //groups
	[], //[_vehic1, _vehic2], //AI vehicles
	_objects, //objects
	[],//_Mines
	_Mkrs, //marker
	[], //waypoints //CBA Takes care of that
	_MissionID, //option //MissionID 
	[], //_crate1, _rewardVHL //rewards to keep if mission succes, despawn if mission fail
	_name, //"Mission Name"
	_difficulty, //Difficulty, used in rewards selection
	_clnObj, //"Mission Name"
	_lootCount,
	_lootType
];
