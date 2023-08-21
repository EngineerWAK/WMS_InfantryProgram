/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2023 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
	Target Convoy event spawn a "convoy" 3~4 vehicles, "resting" on the road/side of the road/sea.
	All weapons authorized, no punishment, no abuse check, made to use all the crap we usualy can't on missions like artillery, planes, bombes, whatever, at any distance.
	Need a friendly message. probably no rewards for the "kills" but spawn rewards crate after dead units check by trigger or loop, so players have to come back to get the loot.
	Create another loot won't be server performance friendly, probably add a check in the 60 or 90sec watch.
*/
/*
WMS_TargetConvoy = true;
WMS_TargetConvoyDelay = 1500;
WMS_TargetConvoyLoot = [[7,1,3],[2,1,2],[5,1,2],[1,3,3],[0,0,0]];//[_weap,_bag,_items,_ammoList,_mag] //how many type, now may from type, + random
WMS_TargetConvoyPos = [ //[[pos,dir],[pos,dir],[pos,dir],[pos,dir],...]
		[[15621.1,11118.3,0],56.47], //ground
		[[15483.2,11218.5,0],131.26] //sea
	];
WMS_TargetConvoyVHL = [ //[[logistic],[escort],[SEA_logistic],[SEA_escort]]
	[
		"vn_b_wheeled_m54_ammo_airport",
		"vn_o_wheeled_z157_fuel_vcmf"
	],[
		"vn_o_wheeled_z157_mg_02_nvam",
		"vn_o_wheeled_btr40_mg_03_vcmf"		
	],[
		"vn_b_boat_12_03",
		"vn_o_boat_03_01"		
	],[
		"vn_b_boat_12_03",
		"vn_o_boat_03_01"				
	]
];
WMS_TargetConvoyUnits = []; //pushBack from convoy spawn
WMS_TargetConvoyMkrs = []; //pushBack
WMS_TargetConvoyPosRew = []; //pushBack
*/

private ["_AAlist","_MkrBorder","_Mkr","_mkrPos","_vehic","_gunSits","_GunnersGrp","_DriversGrp","_posFront","_posBack","_space","_posDir","_pos","_dir","_vhl1","_vhl2","_vhl3","_array","_vhl1Obj","_vhl2Obj","_vhl3Obj"];

if (count WMS_TargetConvoyPos == 0) exitWith {diag_log "friendly error message no position in the list"};
_posFailed = true;
	_TargetConvoyPos = [];
	_posDir = selectRandom WMS_TargetConvoyPos;
	//need a player check here
	_playersClose = allPlayers select {(_posDir select 0) distance _x < 500};
if (count _playersClose == 0)then{
	_posFailed = false;
}else{
	for"_i"from 1 to (count WMS_TargetConvoyPos) do {
		_a = 0;
		_playersClose = allPlayers select {(WMS_TargetConvoyPos select _a select 0) distance _x < 500};
		if (count _playersClose == 0)then{
			_posFailed = false;
			_posDir = (WMS_TargetConvoyPos select _a);
		};
		if !(_posFailed) exitwith {diag_log "friendly error message NEW position available"};
		_a = _a+1;
	};
};
if (_posFailed)exitWith {diag_log "friendly error message player present EVERYWHERE!"};
_AAlist = [
	"O_Radar_System_02_F",
	"O_SAM_System_04_F",
	"vn_sa2",
	"vn_o_static_rsna75"
];
WMS_TargetConvoyPos deleteAt (WMS_TargetConvoyPos find _posDir);
_pos = _posDir select 0;
_dir = _posDir select 1;
WMS_TargetConvoyPosRew = _pos;
_space = 25; //space front/back to spawn the other vehicles
_vhl1 = ""; //escort
_vhl2 = ""; //logistic
_vhl3 = ""; //escort OR logistic
if (surFaceIsWater _pos)then{
	_space = 40;
	_vhl1 = selectRandom (WMS_TargetConvoyVHL select 2);
	_vhl2 = selectRandom (WMS_TargetConvoyVHL select 3);
	//_array = selectRandom [2,3,2,3,2];
	_array = 3;
	_vhl3 = selectRandom (WMS_TargetConvoyVHL select _array);
}else{
	_vhl1 = selectRandom (WMS_TargetConvoyVHL select 0);
	_vhl2 = selectRandom (WMS_TargetConvoyVHL select 1);
	//_array = selectRandom [0,1,0,1,0];
	_array = 1;
	_vhl3 = selectRandom (WMS_TargetConvoyVHL select _array);
};

_GunnersUnits = [];
_vhl1Obj = objNull;
if(_vhl1 in _AAlist)then{
	_GunnersGrp = createGroup [OPFOR, true];
	_AAFull = [_pos, _dir, _vhl1, _GunnersGrp] call bis_fnc_spawnvehicle;
	_vhl1Obj = (_AAFull select 0); 
	//_grpAA = (_AAFull select 2);
	{_GunnersUnits pushBack _x;}forEach units (_AAFull select 2);
}else{
	_vhl1Obj = _vhl1 createVehicle [0,0,800];
	_vhl1Obj allowDamage false;
	_vhl1Obj setDir _dir;
	_vhl1Obj setPos _pos;
};

_posFront = _vhl1Obj modelToWorld [0, _space, 0.5]; //give it some wiggle room in case it's not flat 
_posBack = _vhl1Obj modelToWorld [0, -_space, 0.5];

_vhl2Obj = _vhl2 createVehicle [0,0,800];
_vhl2Obj allowDamage false;
_vhl2Obj setDir _dir;
_vhl2Obj setPos _posFront;

_vhl3Obj = _vhl3 createVehicle [0,0,800];
_vhl3Obj allowDamage false;
_vhl3Obj setDir _dir;
_vhl3Obj setPos _posBack;

//Infantry grps, "drivers", gunners
_GunnersGrp = grpNull;
_DriversGrp = createGroup [OPFOR, true];
_DriversGrp setVariable ["lambs_danger_disableGroupAI", true];

{
	if (surfaceIsWater _pos) then {
		(selectRandom WMS_AI_Units_Class) createUnit [_pos, _DriversGrp, "this moveinAny _vehic"];
	}else{
		(selectRandom WMS_AI_Units_Class) createUnit [_pos, _DriversGrp, ""];
	};
	_x lockDriver true;
	_x setvehiclelock "LOCKEDPLAYER";
	_x Setfuel 0;
	_x forceSpeed 0;
	_allowTurret = false;
	_gunSits = _x emptyPositions "Gunner";
	if (_gunSits != 0 && {!(typeOf _x in _AAlist)})then{
		_GunnersGrp = createGroup [OPFOR, true];
		_allowTurret = true;
		_GunnersGrp addVehicle _x;
		_GunnersGrp setVariable ["lambs_danger_disableGroupAI", true];
	};
	_turArray = allTurrets [_x, false];
	diag_log format ["friendly message, this vehicle %1, turrets %2",TypeOf _x, _turArray];
	_turSits = count _turArray;
	_arrayRef = 0;
	clearMagazineCargoGlobal _x; 
	clearWeaponCargoGlobal _x; 
	clearItemCargoGlobal _x; 
	clearBackpackCargoGlobal _x;
	WMS_TargetConvoyUnits pushBack _x;
	_x allowDamage true;
	if (_turSits != 0 && {_allowTurret}) then {
		for "_i" from 1 to _turSits do {
			_unit = _GunnersGrp createUnit [(selectRandom WMS_AI_Units_Class), _pos, [], 25, "NONE"];
			_unit assignAsTurret [_x, (_turArray select _arrayRef)];
			_GunnersUnits pushBack _unit;
			_arrayRef = (_arrayRef+1);
			diag_log format ["friendly message, this unit %1, group %2, is assigned to %3",_unit, (group _unit), (assignedVehicle _unit)];
		};	
	};
	//(units _GunnersGrp) orderGetIn true;
}forEach [_vhl1Obj,_vhl2Obj,_vhl3Obj];

if !(_vhl1 in _AAlist)then{
	_GunnersUnits orderGetIn true;
};

//Infantry loadouts//skills//EH, probably no message to display but kill count, no punishment, obviously
//lets keep the original loadouts, just remove the primary weapon and items
{
	removeAllItems _x;
	removeAllWeapons _x;
	_x additem "FirstAidKit";
	[_x, selectrandom (WMS_Loadout_SMG select 0), 5, 0] call BIS_fnc_addWeapon;
	_x setSkill ["spotDistance", 	1];
	_x setSkill ["spotTime", 		1];
	_x setSkill ["aimingAccuracy", 	0.2];
	_x setSkill ["aimingShake", 	0.5];
	_x setSkill ["aimingSpeed", 	0.2];
	_x setSkill ["reloadSpeed", 	0.9];
	_x setSkill ["courage", 		0.1];
	_x setSkill ["commanding", 		0.1];
	_x setSkill ["general", 		0.7];
	_x allowFleeing 0;
	_x setRank selectRandom ["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"];
	WMS_TargetConvoyUnits pushBack _x;
	//_x setVariable ["lambs_danger_disableAI", true];
	//_x setVariable ["WMS_RealFuckingSide",OPFOR];
	_x addMPEventHandler ["MPKilled", " 
		if(isDedicated)then{
			[_this select 0,_this select 1,_this select 2] call WMS_fnc_EHonKilled_Basic;
		};
	"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
}forEach _GunnersUnits;
{
	removeAllItems _x;
	removeAllWeapons _x;
	if !(surfaceIsWater _pos) then {
		removeBackpack _x;
		_x addBackpackGlobal "B_Carryall_cbr";
		[_x, selectrandom (WMS_AI_LaunchersOPF select (selectRandom [1,2])), 3] call BIS_fnc_addWeapon;
	}else{
		removeUniform _x;
		removeVest _x;
		_x addUniform "U_O_Wetsuit";
		_x addVest "V_RebreatherIA";
		_x addGoggles "G_O_Diving";
	};
	_x additem "FirstAidKit";
	[_x, selectrandom (WMS_Loadout_Assault select 0), 5, 0] call BIS_fnc_addWeapon;
	_x setSkill ["spotDistance", 	1];
	_x setSkill ["spotTime", 		1];
	_x setSkill ["aimingAccuracy", 	0.2];
	_x setSkill ["aimingShake", 	0.5];
	_x setSkill ["aimingSpeed", 	0.2];
	_x setSkill ["reloadSpeed", 	0.9];
	_x setSkill ["courage", 		0.1];
	_x setSkill ["commanding", 		0.1];
	_x setSkill ["general", 		0.5];
	_x allowFleeing 0;
	_x setRank selectRandom ["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"];
	WMS_TargetConvoyUnits pushBack _x;
	_x setVariable ["lambs_danger_disableAI", true];
	_x setVariable ["WMS_RealFuckingSide",OPFOR];
	_x addMPEventHandler ["MPKilled", " 
		if(isDedicated)then{
			[_this select 0,_this select 1,_this select 2] call WMS_fnc_EHonKilled_Basic;
		};
	"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
}forEach (units _DriversGrp);
//Map marker, radom +-500m
_mkrPos = [(((_pos select 0) -750)+random 1500),(((_pos select 1) -750)+random 1500)];
_Mkr = createMarker [format ["WMS_CVY_Mkr_%1",round(time)], _mkrPos];
_Mkr setMarkerType "o_antiair";
_Mkr setMarkerText "Lost Enemy Convoy, All Weapons Allowed";
_Mkr setMarkerColor "colorEAST";
WMS_TargetConvoyMkrs pushBack _Mkr;

_MkrBorder = createMarker [format ["WMS_CVY_MkrBorder_%1",round(time)], _mkrPos];
_MkrBorder setMarkerColor "colorOrange";
_MkrBorder setMarkerShape "ELLIPSE";
_MkrBorder setMarkerBrush "border";
_MkrBorder setMarkerSize [1250,1250];
WMS_TargetConvoyMkrs pushBack _MkrBorder;

//reward crate ? or trigger
//see WMS_90Sec_Watch

//friendly message broadcast "Lost Enemy Convoy, blablabla"
["EventCustom", ["Lost Enemy Convoy", (format ["An Enemy Convoy is Lost around %1, Destroy it!",([round (_mkrPos select 0), round (_mkrPos select 1)])]), "\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
