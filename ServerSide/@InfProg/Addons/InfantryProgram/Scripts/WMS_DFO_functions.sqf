/**
* WMS_DFO_functions.sqf - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
	The DFO idea from Iceman/Project Hatchet Discord (https://discord.gg/YsRWVPvNeF) 
	was pretty close to mine when I built the module WMS_Event_ReconMission last year, which is running very basic and will probably stay this way.
	So there is the the "Chopper only" version, player (pilotes?) activated and "repeatable".
	Standalone version will come after, when everything will be running fine.
	1-Build the skeleton to fit in the existing WMS_InfantryProgram framework
	2-Create a basic empty mission (probably "cargotransport") to test the call/spawn/triggers/succes/fail/cleanup
	3-Build and test each mission one by one
	4-Export a Standalone version
*/
/*
from WMS_initSystem or initServer or even just from here:
WMS_DynamicFlightOps	= false; //NOT READY YET
WMS_DFO_Standalone		= false;
WMS_DFO_CancelOnKIA		= false;
WMS_DFO_Reinforcement	= false;
WMS_DFO_CreateChopper	= false;
WMS_DFO_UseJVMF			= false;
WMS_DFO_MaxRunning		= 3;
WMS_DFO_CoolDown		= 300;
WMS_DFO_LastCall		= (time-WMS_DFO_CoolDown);
WMS_DFO_Timer			= 900;
WMS_DFO_MinMaxDist		= [4000,6000];
WMS_DFO_ReinfTriggDist	= 1000;
WMS_DFO_MkrRandomDist	= 500;
WMS_DFO_CargoType		= ["CargoNet_01_barrels_F","C_IDAP_CargoNet_01_supplies_F","CargoNet_01_box_F"];
WMS_DFO_MissionTypes	= ["inftransport","cargotransport","airassault","casinf","casarmored","cascombined","sar","csar","maritime"];// Troop transport, Cargo transport, Air Assault, CAS (Infantry, Armoured, combined), SAR, CSAR, Maritime
WMS_DFO_Choppers		= [["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],["B_Heli_Transport_01_F"],["B_Heli_Transport_03_unarmed_green_F","I_Heli_light_03_unarmed_F"],["C_IDAP_Heli_Transport_02_F"]]; //[["pylons","pylons"],["doorGunners","doorGunners"],["transport","transport"],["medevac","medevac"]];
WMS_DFO_Markers			= ["n_support","n_hq"]; //["mission","RTB"]; //["loc_heli","mil_end_noShadow"]
WMS_DFO_MkrColors		= ["colorOrange","colorGreen"]; //["mission","RTB"];
WMS_DFO_Reward			= [500,2000]; //["rep","money"]
WMS_DFO_MissionPaths	= [["base","LZ1","Base"],["base","LZ1","LZ2"]]; // "takeoff/mission/complet"
WMS_DFO_ObjToAddAction	= []; //KEEP EMPTY //will be pushed back from "somewhere"
WMS_DFO_Running			= []; //KEEP EMPTY //[["TimeToDelete","MissionHexaID",_playerObject,_mission]]
publicVariable "WMS_DFO_Running";
publicVariable "WMS_DFO_MaxRunning";
publicVariable "WMS_DFO_LastCall";
publicVariable "WMS_DFO_CoolDown";

from WMS_initSystem (WMS_DynamicFlightOps) or initServer (true)
// Start DynamicFlightOps
if (WMS_DynamicFlightOps)then {execVM "\InfantryProgram\Scripts\WMS_DFO_functions.sqf"};
*/

WMS_fnc_DFO_createBaseAction = {
	//Standalone will need to create an helipad+mission start/complete Zone+an object to add the action where to call a missionConfigFile
	//Not standalone can use the traders vehicles spawn as mission start/complete Zone and a new "DFO" trader/Object to call a mission
	if (count WMS_DFO_ObjToAddAction == 0) then { 
		//bad Idea but why not. The object should be placed in the mission editor or anytime before calling this function and in the init "WMS_DFO_ObjToAddAction pushBack _this"
		//no object to call the mission from, create the Object/Unit at a random position
		//WMS_DFO_ObjToAddAction pushback _DFO_Object;
	};
	{
		[_x]call WMS_fnc_DFO_addAction;
	}forEach WMS_DFO_ObjToAddAction;
};
WMS_fnc_DFO_addAction = { //can be called afterwards to add DFO action(s) to a new object
	private ["_pos"];
	params ["_objectToActivate"];
	[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
		_objectToActivate,
		[
			"<t size='0.9' color='#80c606'>Request Air Operation</t>",//_display,
			"	
				_target = _this select 0; _caller = _this select 1;
				[_caller,_target] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			",
			[], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			"
			(alive _target) &&
			{(vehicle _this == _this)} &&
			{(count WMS_DFO_Running) <= WMS_DFO_MaxRunning} &&
			{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)};
			",
			5
		]
	] remoteExec [
		"addAction",
		0,
		true //jip
	];
};
WMS_fnc_DFO_generateHexaID = {	//will be used to find the mission data in arrays
	private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
	private _hexaArray = [];
	for "_i" from 1 to 8 do {
		_hexaArray pushBack	(selectRandom _hexaBase);
	};
	private _MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];
	_MissionHexaID
};
WMS_fnc_DFO_CreateMkr = {
	private ["_MkrList","_mkrType","_MkrColor","_MkrBorder","_MkrLZ"];
	params [
		"_pos", //need a randomize WMS_DFO_MkrRandomDist
		["_type","base"],
		["_options",[]] //not used yet
	];
	_MkrList = [];
	_mkrType = WMS_DFO_Markers select 0;
	_MkrColor = WMS_DFO_MkrColors select 0;
	if !(_type == "base") then {
		_MkrBorder = createMarker ["DFO_MkrBorder", _pos]; //need a dynamic name 
		_MkrBorder setMarkerColor "colorOrange";
		_MkrBorder setMarkerShape "ELLIPSE";
		_MkrBorder setMarkerBrush "border";
		_MkrBorder setMarkerSize [300,300];
		_MkrList pushback _MkrBorder;
	}else {
		_MkrType = WMS_DFO_Markers select 1;
		_MkrColor = WMS_DFO_MkrColors select 1;
	};
	_MkrLZ = createMarker ["DFO_markername", _pos]; //need a dynamic name
	_MkrLZ setMarkerType _mkrType;
	_MkrLZ setMarkerColor _MkrColor;
	_MkrLZ setMarkerText "DFO Mission"; //need a dynamic name with pilote name like "DFO WAKeupneo CSAR"
	_MkrList pushBack _MkrLZ;
	_MkrList
};
WMS_fnc_DFO_CreateTrigger = {
	private ["_triggList","_triggMission","_triggReinf"];
	params [
		"_pos",
		["_triggType", "whatever"],
		["_options",[]] //data need to transfer to next level should contain HexaID,pilote,mission marker,mission type,_MissionPathCoord
	];
	_triggList = [];
	//trigger mission itself
	_triggMission = createTrigger ["EmptyDetector", _pos, true]; 
	_triggMission setVariable ["WMS_DFO_triggData", _options, false];  
	_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true]; //should be activated by the "pilote" only
	_triggMission setTriggerArea [15, 15, 0, false];
	_triggMission setTriggerStatements  
	[ 
  		"this",  
  		"	
		  	private _datas = (thisTrigger getVariable 'WMS_DFO_triggData');
			diag_log format ['[Event]|WAK|TNA|WMS| DFO Mission trigger activated %1', (position thisTrigger)];
			_datas call WMS_fnc_DFO_nextStepMkrTrigg;
			{deleteMarker _x}forEach (_datas select 2);
			deleteVehicle thisTrigger;
		",  
  		"" 
	];
	_triggList pushBack _triggMission;
	if (_triggType == "reinforce") then {
		//trigger reinforcement
		_triggReinf = createTrigger ["EmptyDetector", _pos, true];
		_triggMission setVariable ["WMS_DFO_triggData", _options, false];
		_triggReinf setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
		_triggReinf setTriggerArea [WMS_DFO_ReinfTriggDist, WMS_DFO_ReinfTriggDist, 0, false];
		_triggReinf setTriggerStatements  
		[ 
  			"this",  
  			"
				diag_log format ['[Event]|WAK|TNA|WMS| DFO Reinforcement trigger activated %1', (position thisTrigger)];
				deleteVehicle thisTrigger;
			",  
  			"" 
		];
		_triggList pushBack _triggReinf;
	};
	_triggList
};
WMS_fnc_DFO_nextStepMkrTrigg = {
	//(thisTrigger getVariable 'WMS_DFO_triggData') call WMS_fnc_DFO_nextStepMkrTrigg;
	//need to auto-delete at succes/fail
	//WMS_DFO_Markers select 1;
	//WMS_DFO_MkrColors select 1;
};
WMS_fnc_DFO_infLoad = {};
WMS_fnc_DFO_infUnLoad = {};
WMS_fnc_Event_DFO	= { //The one called by the addAction, filtered by WMS_DFO_MaxRunning and probably diag_fps
	private [
		"_grps","_vhls","_objs","_mkrs","_launch","_pos","_radiusObjects","_MaxGrad","_posType","_createCIVinf","_createOPFORinf","_createCIVvhl","_createOPFORvhl","_MissionHexaID","_timeToDelete",
		"_updatedTimer","_MissionPath","_MissionPathCoord","_posBase","_posLZ1","_posLZ2","_reinforce","_blackList","_mkrList","_triggList"
		];
	params [
		"_playerObject", //event manager won't spawn a mission but acrivate the menu for player to call a mission
		"_DFO_Object", //the object where the mission is called from
		["_mission", (selectRandom WMS_DFO_MissionTypes)]
	];
	_grps = []; //pushback
	_vhls = []; //pushback
	_objs = []; //pushback
	_mkrs = []; //pushback
	_pos  = position _DFO_Object; //will need a safe position around to land/drop
	_radiusObjects = 5;
	_MaxGrad = WMS_AMS_MaxGrad;
	_MissionPath = selectRandom WMS_DFO_MissionPaths;
	_MissionPathCoord = [];
	_posBase = [_pos, 0, 100, 20, 0, _MaxGrad, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	_posLZ1  = [worldsize/2,worldsize/2,0]; //default middle of the map
	_posLZ2  = _posLZ1; //default middle of the map
	_posType = "random"; //"random","forest","sea","buildings","military" //should be dynamic depending the mission
	_reinforce = WMS_DFO_Reinforcement;
	_createCIVinf 	= false; //soldiers will be civilian as well for now, they are neutral
	_createOPFORinf = false;
	_createCIVvhl 	= false;
	_createOPFORvhl = false;
	_createCargo 	= false;
	_launch 		= false; //will be used as filter to prevent mission to be created if something is wrong: if !(_launch) exitWith {};
	_updatedTimer = WMS_DFO_Timer;
	_timeToDelete = (time+_updatedTimer);

	if (WMS_DFO_Standalone) then { 
		WMS_DFO_Standalone = false; //Standalone not ready yet
		//WMS_Events_Running = [];
	}else {

	};
	//generate Mission Hexa ID
	_MissionHexaID = [] call WMS_fnc_DFO_generateHexaID;
	//setParameters depending the mission:
	switch (_mission) do {
		case "inftransport" : {};
		case "cargotransport" : {}; //that will be the test mission
		case "airassault" : {};
		case "casinf" : {};
		case "casarmored" : {};
		case "cascombined" : {};
		case "sar" : {};
		case "csar" : {};
		case "maritime" : {}; //this one will definitly need way more work
	};
	//select mission position(s)
		//no player around
		//can be random
		//can be from one of the already registered zone like WMS_Pos_Villages or WMS_Pos_Forests or all mixed
		//probably need a filter to not spawn near a player, player base (WMS_TheLastCartridges or Exile Mod)
		_MissionPathCoord pushBack _posBase;
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull; //that will need a replacement for standalone
		_posLZ1 = [_posLZ1, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
		_MissionPathCoord pushBack _posLZ1;
		if ("LZ2" in _MissionPath) then {
			_posLZ2 = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
			_MissionPathCoord pushBack _posLZ2;
		};
	//create mission/LZ marker
		_mkrList = [_posLZ1,"LZ1"] call WMS_fnc_DFO_CreateMkr; //_options should contain [HexaID,pilote,mission markers,mission type,_MissionPathCoord]
		_triggList = [_posLZ1,"reinforcement",[_MissionHexaID,_playerObject,nil,_mkrList,_mission,_MissionPathCoord]] call WMS_fnc_DFO_CreateTrigger; //_options should contain [HexaID,pilote,mission markers,mission type,_MissionPathCoord]

	//create mission vehicles
		//chopper
		if (WMS_DFO_createChopper) then { //should not be used with WMS_TheLastCartridges but anyway the chopper can not sell (addAction/sell), however Exile Mod will sell it (sell/Classname)
			//do not pushback to _vhls but addAction on it "pack to get the reward"
		};
		//CIV
		if (_createCIVvhl) then {};
		//OPFOR
		if (_createOPFORvhl) then {};
	//create mission cargo (crate)
		if (_createCargo) then {
			//_cargo = selectRandom WMS_DFO_CargoType;
		};
	//create mission NPCs
		//CIV
		if (_createCIVinf) then {};
		//OPFOR
		if (_createOPFORinf) then {};
	//create mission zone trigger

	//create reinforcement trigger
	if (WMS_DFO_Reinforcement && _reinforce) then {
		//auto delete at the first reinforcement
	};

	WMS_DFO_LastCall = time;
	WMS_DFO_Running pushback [_timeToDelete,_MissionHexaID,_playerObject,_mission];
	WMS_Events_Running pushBack [time,_timeToDelete,_grps,_vhls,_objs,_mkrs,[],"DFO",_MissionHexaID];
	publicVariable "WMS_DFO_Running";
	publicVariable "WMS_DFO_LastCall";
};
//////////
[] call WMS_fnc_DFO_createBaseAction;