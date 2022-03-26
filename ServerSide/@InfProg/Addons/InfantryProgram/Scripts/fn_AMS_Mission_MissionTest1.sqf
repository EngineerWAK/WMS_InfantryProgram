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

	private ["_T","_absc","_ordo","_MissionID","_name","_difficulty","_objects","_objList","_grpInf","_Mkrs","_Mines","_grps","_vehic","_VHL","_VHLgrp","_trigg"];
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
	_name = "Mission ONE";
	if (WMS_AMS_LOGs) then {diag_log format ["[AMS MISSION SPAWN %2]|WAK|TNA|WMS| _this: %1", _this, _name]};
	_T = round servertime;
	if (_pos == "random" ) then {
		_radiusObjects = 8;
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), _radiusObjects, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	};
	_absc = floor (_pos select 0);
	_ordo = floor (_pos select 1);
	_MissionID = format ["%1_%2_%3_%4",WMS_AMS_Mission_ID,_T,_absc,_ordo];

	_difficulty = selectRandom ["Easy","Moderate","Difficult","Hardcore"];
	_loadout = "bandit";
	_launcherChance = 20;
	_unitFunction = "Assault";
	_behavType = "patrol"; //NO CAP Unless "CBTpatrol"
	_clnObj = WMS_AMS_ClnObj;
	private _lootCount = [[1,1,2],[1,1,1],[2,1,1],[1,2,2],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
	private _lootType = "random";

	switch (toLower _difficulty) do {
		case "easy"			: {_grpCount = 1; _unitsCount = (3+(round random 2)); _skill = (0.20 + random 0.25); _wpts = [25,3]; _radius = 30; _howMany = 5;};
		case "moderate" 	: {_grpCount = 1; _unitsCount = (4+(round random 2)); _skill = (0.30 + random 0.25); _wpts = [50,3]; _radius = 50; _howMany = 10;_lootCount = [[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]; _loadout = selectRandom ["bandit","army"]};
		case "difficult" 	: {_grpCount = 2; _unitsCount = (3+(round random 3)); _skill = (0.50 + random 0.25); _wpts = [80,4]; _radius = 75; _howMany = 15;_lootCount = [[3,2,2],[1,2,1],[4,2,1],[1,3,3],[0,0,0]]; _loadout = selectRandom ["army","heavyBandit"]; _unitFunction = "HeavyBandit"};
		case "hardcore" 	: {_grpCount = 3; _unitsCount = (3+(round random 2)); _skill = (0.70 + random 0.29); _wpts = [125,4]; _radius = 100; _howMany = 25;_lootCount = [[4,2,2],[2,1,1],[5,2,2],[1,3,3],[0,0,0]]; _loadout = "livonia";_unitFunction = "LivoniaPatrol";};
	};

	_objects = [
		//[WMS_AMS_Flag],
		["CamoNet_OPFOR_open_F",[0,0,0],90]
	];
	_objList = [_pos, _objects, _dir, _missionID] call WMS_fnc_AMS_SpawnObjects;

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
_trigg setVariable ["_CallAIgroup",[_grpInf, _pos],true];
_trigg setTriggerArea [25, 25, 0, false];
_trigg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigg setTriggerStatements ["this", 
	"
	if (WMS_AMS_LOGs) then {Diag_log format ['|WAK|TNA|WMS| AMS MISSION TRIGGER,  thisList = %1, thisTrigger = %2', (thisList select 0), thisTrigger];};
	_CallBackAIgroup = thisTrigger getVariable ['_CallAIgroup',[[],[0,0,0]]];
	_CallBackAIgroup call WMS_fnc_AMS_callBackAIgroups;
	", 
	"
	"];

	_Mines = [
		_pos,
		_radius,//"_radius", //100
		_howMany//"_howMany", //20
		//"_mineType", [""]], //WMS_ATMines
		//"_fireExplode", //false
		//"_signs", //true
		//"_steps" //36
	] call WMS_fnc_AMS_SpawnMineField;

	_vehic = [
		_pos,
		_skill,
		"Assault",//_unitFunction,
		_loadout,
		"patrol", //"patrol"
		_wpts,
		_missionID,
		nil,//"O_G_Offroad_01_armed_F"
		false, //_strictPos //true for statics with coordinates
		_difficulty
	] call WMS_fnc_AMS_SpawnAiVHL; //return [_VHL,_VHLgrp]
	_VHL = (_vehic select 0);
	_VHLgrp = (_vehic select 1);

	_grps = _grpInf+_VHLgrp; //array of all the different groups spawned: _grps = _grpInf+_grpVHL;
	WMS_AMS_Running_Array pushback [
		_pos,
		(time + (WMS_AMS_MissionTimeout select 0) + random (WMS_AMS_MissionTimeout select 1)), //Time to finish //diag_tickTime
		_grps, //[_INFgrp1,_INFgrp2,_VHLgrp], //groups
		[_VHL], //[_vehic1, _vehic2], //AI vehicles
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
		"MissionTest1"
	];
//["TaskAssigned", ["infantry Program", _msgx]] remoteExec ["BIS_fnc_showNotification", -2];
["EventCustom", ["Advanced Mission System", (format ["%1 @ %2, %3",_name, ([_pos select 0, _pos select 1]), _difficulty]), "\A3\ui_f\data\GUI\Cfg\GameTypes\seize_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
	WMS_AMS_Missions_Running pushBack "MissionTest1";
	WMS_AMS_Mission_ID = WMS_AMS_Mission_ID+1;
	WMS_AMS_MissionsCount = WMS_AMS_MissionsCount+1;
	