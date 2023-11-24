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

	private ["_T","_MissionID","_name","_difficulty","_objects","_objList","_grpInf","_Mkrs","_Mines","_grps","_loadout","_forest","_unitFunction","_trigg"];
	params[
		["_pos", "forest"],  //"random"
		["_dir", (random 359), [0]],  
		["_grpCount", 1, [0]],  
		["_unitsCount", 5, [0]],  
		["_skill", 0.5, [0]],
		["_wpts", [50,3]],
		["_radius",50, [0]],
		["_howMany",10, [0]]
	];
	_name = "Forest Camp";
	if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN %2]|WAK|TNA|WMS| _this: %1", _this, _name]};
	_T = round servertime;
	_tempRadius = _radius;
	if (WMS_AMS_ForceRadius)then{
		_radius = WMS_AMS_DefRad;
	};

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Start Mission _pos selection, server time %1, %2", serverTime, _name]};
/////////////////

	if (_pos == "forest" ) then {
		_forest = selectRandom WMS_Pos_Forests;
		//_radiusObjects = 5;
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
		_pos = [_forest, 0, 400, _tempRadius, 0, 0.45, 0, _blackList, [([] call BIS_fnc_randomPos),[]],25] call WMS_fnc_BIS_findSafePosModified;
	};

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission _pos selection DONE, server time %1, %2", serverTime, _name]};
/////////////////
uisleep 1;
	if (WMS_AMS_ForceRadius)then{
		_radius = _tempRadius;
	};
	_MissionID = []call WMS_fnc_GenerateHexaID;

	_difficulty = selectRandom ["Easy","Moderate","Difficult","Hardcore"];
	_loadout = "bandit";
	_unitFunction = "Assault";
	_launcherChance = 20;
	_behavType = "CBTpatrol"; //NO CAP Unless "CBTpatrol"
	_clnObj = WMS_AMS_ClnObj;
	_Mkrs = [_pos,_difficulty,_name,true] call WMS_fnc_AMS_CreateMarker;
	
	private _lootCount = [[1,1,2],[1,1,1],[2,1,1],[1,2,1],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
	private _lootType = "military";

	switch (toLower _difficulty) do {
		case "easy"			: {_grpCount = 1; _unitsCount = (3+(round random 2)); _skill = (0.20 + random 0.25); _wpts = [25,3]; _radius = 30; _howMany = 5;};
		case "moderate" 	: {_grpCount = 1; _unitsCount = (4+(round random 2)); _skill = (0.30 + random 0.25); _wpts = [50,3]; _radius = 50; _howMany = 10;_lootCount = [[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]; _loadout = selectRandom ["heavyBandit","bandit","army"]};
		case "difficult" 	: {_grpCount = 2; _unitsCount = (3+(round random 3)); _skill = (0.50 + random 0.25); _wpts = [80,4]; _radius = 75; _howMany = 15;_lootCount = [[3,2,2],[1,2,1],[4,2,1],[1,3,3],[0,0,0]]; _loadout = selectRandom ["heavyBandit","army"]};
		case "hardcore" 	: {_grpCount = 3; _unitsCount = (3+(round random 2)); _skill = (0.70 + random 0.29); _wpts = [125,4]; _radius = 100; _howMany = 25;_lootCount = [[4,2,2],[2,1,1],[5,2,2],[1,3,3],[0,0,0]]; _loadout = "livonia";_unitFunction = "LivoniaPatrol";};
	};
	_objects = "forestcamp";
	_objList = [_pos, _objects, _dir, _missionID,_radius] call WMS_fnc_AMS_SpawnObjects;
uisleep 1;
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
uisleep 1;

_trigg = [_pos,_grpInf]call WMS_fnc_AMS_createTriggCallBackGrps;

	_rwd = [_pos,WMS_AMS_Crate_S,_missionID] call WMS_fnc_AMS_CreateReward;
	/*_Mines = [
		_pos,
		_radius,//"_radius", //100
		_howMany//"_howMany", //20
		//"_mineType", [""]], //WMS_ATMines
		//"_fireExplode", //false
		//"_signs", //true
		//"_steps" //36
	] call WMS_fnc_AMS_SpawnMineField;*/
	_grps = _grpInf; //array of all the different groups spawned: _grps = _grpInf+_grpVHL;
	_objList = _objList;
	WMS_AMS_Running_Array pushback [
		_pos,
		(time + (WMS_AMS_MissionTimeout select 0) + random (WMS_AMS_MissionTimeout select 1)), //Time to finish //diag_tickTime
		_grps, //[_INFgrp1,_INFgrp2,_VHLgrp], //groups
		[], //[_vehic1, _vehic2], //AI vehicles
		_objList, //objects
		[_trigg],//_Mines
		_Mkrs, //marker
		[], //waypoints //CBA Takes care of that
		_MissionID, //option //MissionID 
		[_rwd], //_crate1, _rewardVHL //rewards to keep if mission succes, despawn if mission fail
		_name, //"Mission Name"
		_difficulty, //Difficulty, used in rewards selection
		_clnObj, //"Mission Name"
		_lootCount,
		_lootType,
		"ForestCamp"
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
	WMS_AMS_Missions_Running pushBack "ForestCamp";
	WMS_AMS_MissionsCount = WMS_AMS_MissionsCount+1;

//SPAWN LAG DEBUG
if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission SPAWNED, server time %1, %2", serverTime, _name]};
/////////////////
	