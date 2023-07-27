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
+ 1 reward vehicle
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
] call WMS_fnc_AMS_Mission_Unified_B;*/
private ["_T","_MissionID","_name","_difficulty","_objects","_objList","_grpInf","_Mkrs","_Mines","_grps","_loadout","_unitFunction","_clnObj","_lootType","_vehicAI","_vehicRwd","_trigg"];
params[
	["_pos", "random"],  
	["_dir", (random 359), [0]],  
	["_grpCount", 1, [0]],  
	["_unitsCount", 3, [0]],  
	["_skill", 0.5, [0]],
	["_wpts", [20,3]],
	["_radius",30, [0]],
	["_howMany",5, [0]],
	["_uniParams",[]], //[[_name],[_difficulty],[_loadout],[_unitFunction],[_behavType],_lootCounts,_lootType,_launcherChance,_clnObj,[_objects],_radiusObjects,_vehicAI,_vehicRwd, _option]
	["_mission","error"], //mission string from the "mission to select" array 
	["_forceParaRwd",false]
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
//_vehicAI 		= selectRandom (_uniParams select 11);
_vehicRwd 		= selectRandom (_uniParams select 12);
_option 		= (_uniParams select 13); //used to pass the _unitFunction #2
_lootCount 		= (_lootCounts select 0);
_MissionID 		= []call WMS_fnc_GenerateHexaID;
if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN %2]|WAK|TNA|WMS| _this: %1", _this, _name]};
_T = round servertime;
_tempRadius = _radiusObjects;
if (WMS_AMS_ForceRadius)then{
	_radiusObjects = WMS_AMS_DefRad;
};

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Start Mission _pos selection, server time %1, %2", serverTime, _name]};
/////////////////

if (typeName _pos == "STRING") then {
	if (_pos == "random" ) then {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
	//////////NEW//////////
	if (count WMS_AMS_preSelectPos != 0) then {
		if (count allPlayers != 0)then{
			_playersPos = [];
			_preSelectPos = [];
			{_playersPos pushBack (position _x)}forEach allPlayers;
			{
				_npPos = [_playersPos, _x] call BIS_fnc_nearestPosition;
				if (_npPos distance2d _x > 300) then {_preSelectPos pushBack _x};
			}forEach WMS_AMS_preSelectPos;
			if (count _preSelectPos != 0) then {
				_pos = selectRandom _preSelectPos;
				WMS_AMS_preSelectPos deleteAt (WMS_AMS_preSelectPos find _pos);
			}else{
				_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), _radius, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]],_tempRadius*2] call WMS_fnc_BIS_findSafePosModified;
			};
		}else{
			_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), _radius, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]],_tempRadius*2] call WMS_fnc_BIS_findSafePosModified;
		};
	}else{
	//////////NEW\\\\\\\\\\
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), _radiusObjects, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]],(_tempRadius*2)] call WMS_fnc_BIS_findSafePosModified;
	};
	};
};

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission _pos selection DONE, server time %1, %2", serverTime, _name]};
/////////////////
uisleep 1;
_Mkrs = [_pos,_difficulty,_name,true] call WMS_fnc_AMS_CreateMarker;

if (WMS_AMS_ForceRadius)then{
	_radiusObjects = _tempRadius;
};

switch (_difficulty) do {
	case "Easy"			: {
		_unitsCount = _unitsCount+(round (random 2)); _skill = (0.20 + random 0.25);
		};
	case "Moderate" 	: {
		_unitsCount = _unitsCount+1+(round (random 2)); _skill = (0.30 + random 0.25); _wpts = [35,3]; _radius = _radius*2; _howMany = _howMany*2; _lootCount = (_lootCounts select 1);
		};
	case "Difficult" 	: {
		_grpCount = _grpCount+1; _unitsCount = _unitsCount+(round (random 2)); 	_skill = (0.50 + random 0.25); _wpts = [55,4]; _radius = _radius*3; _howMany = _howMany*3;_lootCount =  (_lootCounts select 2);
		};
	case "Hardcore" 	: {
		_grpCount = _grpCount+2; _unitsCount = _unitsCount+1+(round (random 2)); _skill = (0.70 + random 0.29); _wpts = [75,4]; _radius = _radius*4; _howMany = _howMany*4;_lootCount =  (_lootCounts select 3);
		};
};

_objList = [_pos, _objects, _dir, _missionID,_radiusObjects] call WMS_fnc_AMS_SpawnObjects;
uisleep 5;

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

_grpInf2 = [ 
	_pos,
	_missionID,
	1, 				//"_grpCount",//1
	(_option select 0), 	//"_unitsCount",//3
	_wpts,			//"_wpts, //[75,4]
	_skill,			//"_skill",//(0.2+random 0.5)
	(_option select 1),		//"_unitFunction",//"Random" //FIRST LETTER CAP
	_loadout,		//"_loadout",//"bandit"
	(_option select 2),		//"_behavType",//"patrol"
	_launcherChance,//"_launcherChance"//WMS_AMS_LauncherChance
	_difficulty	
] call WMS_fnc_AMS_SpawnGroups; //return an Array of group(s)
uisleep 5;

_trigg = [_pos,(_grpInf+_grpInf2)]call WMS_fnc_AMS_createTriggCallBackGrps;

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
_rwd = ObjNull;
if (_forceParaRwd) then {
	_rwd = _vehicRwd; //if (typeName (_rwds select 0) == "STRING")
} else {
	_rwd = [_pos,_vehicRwd,_missionID] call WMS_fnc_AMS_CreateReward; //if (typeName (_rwds select 0) == "OBJECT")
};

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
//WMS_AMS_Abuse:
//"hexaID_AMS_Start"
if (WMS_AMS_Abuse) then {
	_unitsCnt = 0;
	{
		_unitsCnt = _unitsCnt+(count (units _x));
	}forEach _grps;
	missionNameSpace setVariable [format["%1_AMS_Start",_MissionID],_unitsCnt];
};
//["TaskAssigned", ["infantry Program", _msgx]] remoteExec ["BIS_fnc_showNotification", -2];
["EventCustom", ["Advanced Mission System", (format ["%1 @ %2, %3",_name, ([round (_pos select 0), round (_pos select 1)]), _difficulty]), "\A3\ui_f\data\GUI\Cfg\GameTypes\seize_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
WMS_AMS_Missions_Running pushBack _mission;
//WMS_AMS_Mission_ID = WMS_AMS_Mission_ID+1;//DEPRECATED
WMS_AMS_MissionsCount = WMS_AMS_MissionsCount+1;

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission SPAWNED, server time %1, %2", serverTime, _name]};
/////////////////