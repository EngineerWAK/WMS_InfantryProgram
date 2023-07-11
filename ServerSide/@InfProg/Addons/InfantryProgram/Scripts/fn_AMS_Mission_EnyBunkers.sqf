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

private ["_T","_MissionID","_name","_difficulty","_objects","_objList","_grpInf","_Mkrs","_Mines","_grps","_loadout","_unitFunction","_clnObj","_trigg"];
params[
	["_pos", "random"],  
	["_dir", (random 359), [0]],  
	["_grpCount", 1, [0]],  
	["_unitsCount", 5, [0]],  
	["_skill", 0.5, [0]],
	["_wpts", [50,3]],
	["_radius",50, [0]],
	["_howMany",10, [0]]
];
_name = "Enemy Bunkers";
if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN %2]|WAK|TNA|WMS| _this: %1", _this, _name]};
_T = round servertime;
_tempRadius = _radius;
if (WMS_AMS_ForceRadius)then{
	_radius = WMS_AMS_DefRad;
};
if (_pos == "random" ) then {
	//_radiusObjects = 18;
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
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), _radius, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]],_tempRadius*2] call WMS_fnc_BIS_findSafePosModified;
	};
};
if (WMS_AMS_ForceRadius)then{
	_radius = _tempRadius;
};
_MissionID = []call WMS_fnc_GenerateHexaID;
_difficulty = selectRandom ["Moderate","Difficult","Hardcore"];
_loadout = "army";
_unitFunction = "HeavyBandit";
_launcherChance = 30;
_behavType = "hide"; //NO CAP Unless "CBTpatrol"
_clnObj = WMS_AMS_ClnObj; //WMS_AMS_ClnObj;

private _lootCount = [[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
private _lootType = "military";

switch (_difficulty) do {
	case "Easy"			: {_grpCount = 1; _unitsCount = 3+(round (random 2)); _skill = (0.20 + random 0.25); _wpts = [15,3]; _radius = 30; _howMany = 8;};
	case "Moderate" 	: {_grpCount = 1; _unitsCount = 4+(round (random 2)); _skill = (0.30 + random 0.25); _wpts = [20,3]; _radius = 100; _howMany = 14;_lootCount = [[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]];};
	case "Difficult" 	: {_grpCount = 2; _unitsCount = 3+(round (random 2)); _skill = (0.50 + random 0.25); _wpts = [25,4]; _radius = 125; _howMany = 19;_lootCount = [[3,2,2],[1,2,1],[4,2,1],[1,3,3],[0,0,0]];};
	case "Hardcore" 	: {_grpCount = 2; _unitsCount = 3+(round (random 2)); _skill = (0.70 + random 0.29); _wpts = [30,4]; _radius = 150; _howMany = 30;_lootCount = [[4,2,2],[2,1,1],[5,2,2],[1,3,3],[0,0,0]]; _loadout = "livonia";_unitFunction = "LivoniaPatrol";};
};

_objects 	= selectRandom ["EnemyBunker","EnemyBunkerV2"];
_objList 	= [_pos, _objects, _dir, _missionID,_radius] call WMS_fnc_AMS_SpawnObjects;

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

_Mkrs = [_pos,_difficulty,_name,true] call WMS_fnc_AMS_CreateMarker;

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
	"];

_grpInf2 = [ 
	_pos,
	_missionID,
	1, 				//"_grpCount",//1
	_unitsCount+4, 	//"_unitsCount",//3
	_wpts,			//"_wpts, //[75,4]
	_skill,			//"_skill",//(0.2+random 0.5)
	"MG",			//"_unitFunction",//"Random" //FIRST LETTER CAP
	_loadout,		//"_loadout",//"bandit"
	"garrison",		//"_behavType",//"patrol"
	_launcherChance,//"_launcherChance"//WMS_AMS_LauncherChance
	_difficulty	
] call WMS_fnc_AMS_SpawnGroups; //return an Array of group(s)

_Mines = [
	_pos,
	_radius,	//"_radius", //100
	_howMany	//"_howMany", //20
] call WMS_fnc_AMS_SpawnMineField;
_Mines2 = [
	_pos,
	_radius,//"_radius", //100
	_howMany,//"_howMany", //20
	[WMS_AMS_MineAP] //"_mineType", [""]], //WMS_ATMines
] call WMS_fnc_AMS_SpawnMineField;

_grps = _grpInf+_grpInf2; //array of all the different groups spawned: _grps = _grpInf+_grpVHL;
_Mines = _Mines+_Mines2;
_objList = _objList;
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
	[], //_crate1, _rewardVHL //rewards to keep if mission succes, despawn if mission fail
	_name, //"Mission Name"
	_difficulty, //Difficulty, used in rewards selection
	_clnObj,
	_lootCount,
	_lootType,
	"EnyBunkers"
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
["EventCustom", ["Advanced Mission System", (format ["%1 @ %2, %3",_name, ([_pos select 0, _pos select 1]), _difficulty]), "\A3\ui_f\data\GUI\Cfg\GameTypes\seize_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
WMS_AMS_Missions_Running pushBack "EnyBunkers";
WMS_AMS_MissionsCount = WMS_AMS_MissionsCount+1;