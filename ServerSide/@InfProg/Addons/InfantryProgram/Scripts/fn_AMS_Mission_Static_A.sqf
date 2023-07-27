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

/*
from N to N+2 group
from N to N+3 units/group
No AI vehicles
No reward Vehicle
1 type of behaviour _behavType for all (selectRandom if more than one)
+ 1 Garrisson group N units, _option used to pass [_unitCount, _unitFunction, _behavType] #2
*/
/*
private _name = ["Unified Mission A1","Unified Mission A2","Unified Mission A3"];
private _difficulty = ["Easy", "Moderate","Difficult","Hardcore"];
private _loadout = ["ABU"];
private _unitFunction = ["Assault"];
private _behavType = ["CBTpatrol"];
private _lootCounts = [
	[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
	[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
	[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
	[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
	];
private _lootType = "military";
private _launcherChance = 50;
private _clnObj = true;
private _objects = [["Land_House_1W01_F",[0,8,0],0,"flat"],["Land_MysteriousBell_01_F",[-0.9,5.4,0],0,"flat"]];
private _radiusObjects = 8;
private _vehicAI = nil;
private _vehicRwd = nil;
private _option = [6,"MG","garrison"]; //[_unitCount, _unitFunction, _behavType] #2

[
"random",
(random 359),
1,
3,
0.5,
[20,3],
30,
5,
[_name,_difficulty,_loadout,_unitFunction,_behavType,_lootCounts,_lootType,_launcherChance,_clnObj,_objects,_radiusObjects,_vehicAI,_vehicRwd, _option]
] call WMS_fnc_AMS_Mission_Static_A;*/
private ["_static","_tempclass","_temppos","_tempdir","_T","_absc","_ordo","_MissionID","_name","_difficulty","_objects","_objList","_grpInf","_Mkrs","_Mines","_grps","_loadout","_unitFunction","_clnObj","_lootType","_vehicAI","_vehicRwd","_trigg"];
params[
	"_pos",
	["_dir", (random 359), [0]],  
	["_grpCount", 1, [0]],  
	["_unitsCount", 3, [0]],  
	["_skill", 0.5, [0]],
	["_wpts", [20,3]],
	["_radius",200, [0]],
	["_howMany",5, [0]],
	["_uniParams",[]], //[[_name],[_difficulty],[_loadout],[_unitFunction],[_behavType],_lootCounts,_lootType,_launcherChance,_clnObj,[_objects],_radiusObjects,_vehicAI,_vehicRwd, _option]
	["_mission","error"]
];
_name 			= selectRandom (_uniParams select 0); 	// "fucking name"
_difficulty 	= selectRandom (_uniParams select 1);	// first letter CAP
_loadout 		= selectRandom (_uniParams select 2);	// "army";
_unitFunction 	= selectRandom (_uniParams select 3);	// "Assault"; //first letter CAP
_behavType 		= selectRandom (_uniParams select 4);	// "hide"; //NO CAP Unless "CBTpatrol"
_lootCounts 	= (_uniParams select 5);	// [[[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]],[[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]],[[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]],[[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]]]; //[_weap,_bag,_items,_ammoList,_mag] for the 4 levels
_lootType 		= (_uniParams select 6); 	// "military";
_launcherChance = (_uniParams select 7); 	// 30;
_clnObj 		= (_uniParams select 8); 	// WMS_AMS_ClnObj;
_objects 		= (_uniParams select 9); 	// [["Land_House_1W01_F",[0,8,0],0,"flat"],["Land_MysteriousBell_01_F",[-0.9,5.4,0],0,"flat"]]
_radiusObjects 	= (_uniParams select 10);
_option 		= (_uniParams select 13); //used to pass the _unitFunction #2
_lootCount = (_lootCounts select 0);
_MissionID = []call WMS_fnc_GenerateHexaID;
if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN %2]|WAK|TNA|WMS| _this: %1", _this, _name]};
//_T = round servertime;
_garUnitsCnt = (_option select 0); //VC patrol do not garrison, they patrol mostly
_rwd = objNull;
_posList = [];
_staticList = [];
//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Start Mission _pos selection, server time %1, %2", serverTime, _name]};
/////////////////

if (typeName _pos == "STRING") then {//static mission do not really need to find a position but need a player check after a random select in the static array
	//need a random select on the right array
	/*
	WMS_AMS_StaticPos_1			= []; //VC //patrol
	WMS_AMS_StaticPos_2			= []; //PATHET //patrol, garrison positions
	WMS_AMS_StaticPos_3			= []; //PAVN  //patrol, garrison positions //ARTY 1
	WMS_AMS_StaticPos_4			= []; //KHMER //patrol, garrison positions //ARTY 2
	*/
	if (_mission == "VC Arty")then {_posList = WMS_AMS_StaticPos_3+WMS_AMS_StaticPos_4}; //"VC Artillery Position" and "Stolen Howitzers"
	if (_mission == "VC Patrol")then {_posList = WMS_AMS_StaticPos_1+WMS_AMS_StaticPos_2}; //"VC Patrol" and "VC Camp"
	_pos = selectRandom _posList;
	//need a player check
	_playersPosList = allPlayers select {alive _x && (_x distance2D _pos < 350)} apply {GetPosATL _x};
	if !(count _playersPosList == 0) then {//if no player, spawn the mission, if player, random select another position (1 time)
		_pos = selectRandom _posList;
		_playersPosList = allPlayers select {alive _x && (_x distance2D _pos < 350)} apply {GetPosATL _x};
		if !(count _playersPosList == 0) then {_pos = "notOK!"};
	};	
	if (typeName _pos != "STRING") then {
		//if no player, spawn the mission and delete the position from the array
		if(_pos in WMS_AMS_StaticPos_1)then{
			WMS_AMS_StaticPos_1 deleteAt (WMS_AMS_StaticPos_1 find _pos);
			_name = "VC Patrol"; //those names should come from a variable so it would be easier to get it dynamic depending the map/mods
			_garUnitsCnt = 0;
			_rwd = [_pos,WMS_AMS_Crate_S,_missionID] call WMS_fnc_AMS_CreateReward;
		}else{
			if(_pos in WMS_AMS_StaticPos_2)then{
				WMS_AMS_StaticPos_2 deleteAt (WMS_AMS_StaticPos_2 find _pos);
				_name = "VC Camp";
				_rwd = [_pos,WMS_AMS_Crate_S,_missionID] call WMS_fnc_AMS_CreateReward;
			}else{
				if(_pos in WMS_AMS_StaticPos_3)then{
					WMS_AMS_StaticPos_3 deleteAt (WMS_AMS_StaticPos_3 find _pos);
					_name = "VC Artillery Position";
					_staticList = _pos nearObjects ["StaticWeapon", 200];
					_rwd = [_pos,WMS_AMS_Crate_XL,_missionID] call WMS_fnc_AMS_CreateReward;
				}else{
					if(_pos in WMS_AMS_StaticPos_4)then{
						WMS_AMS_StaticPos_4 deleteAt (WMS_AMS_StaticPos_4 find _pos);
						_name = "Stolen Howitzers";
						_staticList = _pos nearObjects ["StaticWeapon", 200];
						_rwd = [_pos,WMS_AMS_Crate_XL,_missionID] call WMS_fnc_AMS_CreateReward;
					};
				};
			};
		};
	};
};
//if player on the position, exitWith{};
if (typeName _pos == "STRING") exitWith {diag_log format ["[AMS MISSION SPAWN]|WAK|TNA|WMS|Position not available! %1", _name]};
//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission _pos selection DONE, server time %1, %2", serverTime, _name]};
/////////////////
uisleep 1;
_Mkrs = [_pos,_difficulty,_name,true] call WMS_fnc_AMS_CreateMarker;

switch (_difficulty) do {
	case "Easy"			: {
		_unitsCount = _unitsCount+(round (random 2)); _skill = (0.10 + random 0.15);
		};
	case "Moderate" 	: {
		_unitsCount = _unitsCount+1+(round (random 2)); _skill = (0.20 + random 0.20); _howMany = _howMany*2; _lootCount = (_lootCounts select 1);
		};
	case "Difficult" 	: {
		_grpCount = _grpCount+1; _unitsCount = _unitsCount+(round (random 2)); 	_skill = (0.30 + random 0.25); _howMany = _howMany*3;_lootCount =  (_lootCounts select 2);
		};
	case "Hardcore" 	: {
		_grpCount = _grpCount+2; _unitsCount = _unitsCount+(round (random 2)); _skill = (0.40 + random 0.25); _howMany = _howMany*4;_lootCount =  (_lootCounts select 3);
		};
};

_flag = createVehicle [WMS_AMS_Flag, _pos, [], 0, "CAN_COLLIDE"];
_flag setVariable ["AMS_MissionID",_missionID,true];
_flag setVariable ["AMS_MissionStatus","RUNNING",true];
_flag setVariable ["AMS_MissionID",_missionID,true];
if (_mission == "VC Arty") then {
	_flag setVariable ["WMS_AMS_DoFire",true];
	_flag setVariable ["WMS_AMS_DoFireNext",serverTime+90];
	_garUnitsCnt = (count _staticList)+3;
}else{
	_flag setVariable ["WMS_AMS_DoFire",false];
	_flag setVariable ["WMS_AMS_DoFireNext",WMS_ServRestartSeconds];
};
//_flag setVariable ["WMS_StaticsList", _staticsList]; //no statics skill managment yet
_objList = [_flag]; //no objects to spawn with static missions, just the flag

//but, neet to set up the statics:
if (_mission == "VC Arty")then {
	//let's say 200m radius check to find statics, activate them and unlock them for NPCs
	{
		//_x enableDynamicSimulation true; _x lock 3;_x allowDamage true; _x setDamage 0;(vehicle _x) setVehicleAmmo 1;
		_tempPos = getposASL _x;
		_tempDir = getDir _x;
		_tempclass = typeOf _x;
		deleteVehicle _x;
		_static = _tempclass createVehicle [-150,-150,500];
		_static setDir _tempDir;
		_static setPosASL _tempPos;
		_static lock 3;
		_static setVariable ["WMS_AMS_StaticOBJ", true];
		_static enableRopeAttach false;
		[_static, _static] call ace_common_fnc_claim; 
		_static setVariable ['vn_log_enablePickup', false];
		_static enableWeaponDisassembly false;
	}forEach _staticList;
};
uisleep 5;

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Spawning first group, server time %1, %2", serverTime, _name]};
/////////////////
_grpInf = [ 
		_pos,
		_missionID,
		_grpCount, 		//"_grpCount",//1
		_unitsCount, 	//"_unitsCount",//3
		_wpts,			//"_wpts, //[75,4]
		_skill,			//"_skill",//(0.2+random 0.5)
		_unitFunction,	//"_unitFunction",//"random"
		_loadout,		//"_loadout",//"bandit"
		_behavType,		//"_behavType",//"patrol"
		_launcherChance,//"_launcherChance"//WMS_AMS_LauncherChance
		_difficulty
] call WMS_fnc_AMS_SpawnGroups; //return an Array of group(s)
uisleep 5;
//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Spawning second group, server time %1, %2", serverTime, _name]};
/////////////////
_grpInf2 = [grpNull];
if (_garUnitsCnt != 0) then {
	_grpInf2 = [ 
		_pos,
		_missionID,
		1, 				//"_grpCount",//1
		_garUnitsCnt, 	//"_unitsCount",//3
		_wpts,			//"_wpts, //[75,4]
		_skill,			//"_skill",//(0.2+random 0.5)
		(_option select 1),		//"_unitFunction",//"Random" //FIRST LETTER CAP
		_loadout,		//"_loadout",//"bandit"
		(_option select 2),		//"_behavType",//"patrol"
		_launcherChance,//"_launcherChance"//WMS_AMS_LauncherChance
		_difficulty	
	] call WMS_fnc_AMS_SpawnGroups; //return an Array of group(s)
};
uisleep 5;

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Creating markers and trigger, server time %1, %2", serverTime, _name]};
/////////////////
_trigg = [_pos,(_grpInf+_grpInf2)]call WMS_fnc_AMS_createTriggCallBackGrps;
/*
_trigg =  createTrigger ["EmptyDetector", _pos, true];
_trigg setVariable ["WMS_CallAIgroup",[_grpInf, _pos],true];
_trigg setTriggerArea [5, 5, 0, false];
_trigg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigg setTriggerStatements ["this && ({ thisTrigger distance _x <= 5 } count thislist) > 0", 
	"
	if (true) then {Diag_log format ['|WAK|TNA|WMS| AMS MISSION TRIGGER,  thisList = %1, thisTrigger = %2', (thisList select 0), thisTrigger];};
	_CallBackAIgroup = thisTrigger getVariable ['WMS_CallAIgroup',[[],[0,0,0]]];
	_CallBackAIgroup call WMS_fnc_AMS_callBackAIgroups;
	deleteVehicle thisTrigger;
	", 
	"
	"];*/

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Spawning mineField, server time %1, %2", serverTime, _name]};
/////////////////
_Mines = [
	_pos,
	_radius,	//"_radius", //100
	_howMany	//"_howMany", //20
	//"_mineType", [""]], //WMS_ATMines
	//"_fireExplode", //false
	//"_signs", //true
	//"_steps" //36
] call WMS_fnc_AMS_SpawnMineField;
uisleep 5;
//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|MineField Spawned, server time %1, %2", serverTime, _name]};
/////////////////
_grps = _grpInf+_grpInf2; //array of all the different groups spawned: _grps = _grpInf+_grpVHL;

WMS_AMS_Running_Array pushback [
	_pos,
	(time + (WMS_AMS_MissionTimeout select 0) + random (WMS_AMS_MissionTimeout select 1)), //Time to finish //diag_tickTime
	_grps, //[_INFgrp1,_INFgrp2,_VHLgrp], //groups
	[], //[_vehic1, _vehic2], //AI vehicles
	_objList, //objects
	_Mines+[_trigg],
	_Mkrs, //marker
	[], //waypoints //CBA Takes care of that
	_MissionID, //option //MissionID 
	[_rwd], //_crate1, _rewardVHL //rewards to keep if mission succes, despawn if mission fail
	_name, //"Mission Name"
	_difficulty, //Difficulty, used in rewards selection
	_clnObj,
	_lootCount,
	_lootType,
	_mission
];
//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission registered in the system, server time %1, %2", serverTime, _name]};
/////////////////
//WMS_AMS_Abuse:
//"hexaID_AMS_Start"
if (WMS_AMS_Abuse) then {
	_unitsCnt = 0;
	{
		_unitsCnt = _unitsCnt+(count (units _x));
	}forEach _grps;
	missionNameSpace setVariable [format["%1_AMS_Start",_MissionID],_unitsCnt];
};
["EventCustom", ["Advanced Mission System", (format ["%1 @ %2, %3",_name, ([round (_pos select 0), round (_pos select 1)]), _difficulty]), "\A3\ui_f\data\GUI\Cfg\GameTypes\seize_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
WMS_AMS_Missions_Running pushBack _mission;
WMS_AMS_MissionsCount = WMS_AMS_MissionsCount+1;

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission SPAWNED, server time %1, %2", serverTime, _name]};
/////////////////