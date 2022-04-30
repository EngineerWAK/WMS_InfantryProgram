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
	So there is the the "Chopper only" version, player (pilots?) activated and "repeatable".
	Standalone version will come after, when everything will be running fine.
	1-Build the skeleton to fit in the existing WMS_InfantryProgram framework
	2-Create a basic empty mission (probably "cargotransport") to test the call/spawn/triggers/succes/fail/cleanup
	3-Build and test each mission one by one
	4-Export a Standalone version
*/
////////////////////////////
//FUNCTIONS:
////////////////////////////
WMS_DFO_CollectPos = {
	private _worldCenter 	= [worldsize/2,worldsize/2,0]; 
	private _worldDiameter 	= ((worldsize/2)*1.413);
	if (WMS_fnc_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[DFO] collecting LOCALS positions'};
	{WMS_Pos_Locals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameLocal"],_worldDiameter]);
	if (WMS_fnc_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[DFO] collecting VILLAGES positions'};
	{WMS_Pos_Villages pushback position _x}forEach (nearestLocations [_worldCenter, ["nameVillage"],_worldDiameter]);
	if (WMS_fnc_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[DFO] collecting CITIES positions'};
	{WMS_Pos_Cities pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCity"],_worldDiameter]);
	if (WMS_fnc_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[DFO] collecting CAPITALS positions'};
	{WMS_Pos_Capitals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCityCapital"],_worldDiameter]);
};
WMS_fnc_DFO_ConvertTypeToCoord = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_ConvertTypeToCoord _this %1', _this]};
	params [
		["_pos",[worldSize/2,worldSize/2]],
		["_posType","random"],
		["_radiusObjects",10],
		["_MaxGrad",WMS_AMS_MaxGrad],
		["_options",[]]

	];
	private _blackList = [];
	private _return = [];
	if (WMS_DFO_Standalone) then {
		_blackList = allPlayers select {alive _x} apply {[position _x, 900]};
	}else {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
	};
	if (_posType == "random") then {
		_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	} else {
		if(_posType == "forest" && {count WMS_Pos_Forests != 0})then{
			_return = selectRandom WMS_Pos_Forests;
		}else{
			if(_posType == "city" && {count WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals != 0})then{
				_return = selectRandom WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
			}else{
				if(_posType == "local" && {count WMS_Pos_Locals != 0})then{
					_return = selectRandom WMS_Pos_Locals;
				}else{
					if(_posType == "military" && {count WMS_Pos_Military != 0})then{
						_return = selectRandom WMS_Pos_Military;
					}else{
						if(_posType == "sea")then{
							//use random but 2 "must be on water"
							_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), 5, 2, 0.5, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
						}else{
							//back to "random"
							_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
						};
					};
				};
			};
		};
	};
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_ConvertTypeToCoord _return %1', _return]};
	_return
};
WMS_fnc_DFO_createBaseAction = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_createBaseAction _this %1', _this]};
	
	WMS_DFO_BasePositions = missionNameSpace getVariable ["WMS_DFO_BasePositions", []];
	
	private _ObjToAddAction = missionNameSpace getVariable ["WMS_DFO_ObjToAddAction", []]; //objects from mission.sqm will push themself there
	//Standalone will need to create an object to add the action where to call a mission
	if (count _ObjToAddAction == 0) then { 
		//bad Idea but why not. The object should be placed in the mission editor or anytime before calling this function
		/* 
		//Init:
		private _ObjToAddAction = missionNameSpace getVariable ["WMS_DFO_ObjToAddAction", []];
		_ObjToAddAction pushBack _this;
		missionNameSpace setVariable ["WMS_DFO_ObjToAddAction",_ObjToAddAction];
		*/
		//no object to call the mission from, create the Object/Unit at a random position
		private _defaultPos = [[worldSize,worldSize,0], 0, worldSize, 22, 0, 0.10, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
		[_defaultPos,"FULL"] call WMS_fnc_DFO_BuildBase;
		_mkrName = format ["DFO_mkrBase_%1",time];
		_MkrLZ = createMarker [_mkrName, _defaultPos];
		_MkrLZ setMarkerType "b_hq";
		_MkrLZ setMarkerText "DFO";
	};
	{
		[_x]call WMS_fnc_DFO_addAction;
	}forEach _ObjToAddAction;

	if(WMS_DFO_UseJVMF) then {
		private _payload = "";
		private _payload2 = "";
		private _BasePositions = [];
		private _MissionTypes = "";
		//["inftransport","cargotransport","airassault","casinf","casarmored","cascombined","sar","csar"]
		if("inftransport" in WMS_DFO_MissionTypes || "cargotransport" in WMS_DFO_MissionTypes) then {_MissionTypes = _MissionTypes +"Transport, "};
		if("airassault" in WMS_DFO_MissionTypes) then {_MissionTypes = _MissionTypes +"Air Assault, "};
		if("casinf" in WMS_DFO_MissionTypes || "casarmored" in WMS_DFO_MissionTypes || "cascombined" in WMS_DFO_MissionTypes) then {_MissionTypes = _MissionTypes +"CAS, "};
		if("sar" in WMS_DFO_MissionTypes || "csar" in WMS_DFO_MissionTypes) then {_MissionTypes = _MissionTypes +"Search & Rescue"};
		if ((count WMS_DFO_BasePositions) == 0)then{
			_payload = "No DFO Bases positions registered yet";
			_payload2 = "DFO Bases are usualy around AirField (Traders)";
		}else{
			if (count WMS_DFO_BasePositions > 2) then { //JVMF 50 characteres limit per ligne
				_BasePositions = [WMS_DFO_BasePositions select 0, WMS_DFO_BasePositions select 1];
			}else {
				_BasePositions = WMS_DFO_BasePositions;
			};
			_payload = "DFO Bases Known positions (first two):";
			_payload2 = format ["%1",WMS_DFO_BasePositions];
		};
		[
      		"WELCOME", // TITLE
       		"DFO HQ", // SENDER
       		"ALL", // RECIPIENTS
      		0, //MSG TYPE
      		[
          		"Dynamic Flight Ops is now Activated",
           		"Go to DFO base(s) to request a mission",
				_payload,
           		_payload2,
           		"Available Missions:",
           		_MissionTypes,
				"",
				"",
				"",
				""
       		], //MSG TEXT //MUST BE AT LEAST 10 LINES
       		[_BasePositions select 0], // MSG DATA //[]
       		[
            	[
                	format ["%1:%2",(date select 3),(date select 4)],
                	"DFO HQ",
                	"SENT"
            	]
        	] // REPLIES
   		] call WMS_fnc_DFO_JVMF;
	};

	if (WMS_DFO_Standalone) then {
		[]call WMS_DFO_CollectPos;
		//Cleanup loop
		while {true} do {
			{
				if (((_x select 7) == "DFO")) then { //if it's not "DFO", it's really fuckedUp
					_x call WMS_fnc_DFO_Cleanup;
				};
			}forEach WMS_DFO_Running;
			uisleep 60;
		};
	};
};
WMS_fnc_DFO_BuildBase = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_BuildBase _this %1', _this]};
	params [
		"_pos",
		["_option", "HELIPAD"] //"FULL","HELIPAD"
	];
	_BaseObjects = []; //PUSHBACK
	[];
	_DFO_BaseObjects = [
		["Sign_Arrow_Large_Green_F",[-12.5,0,0],0],
		["Sign_Arrow_Large_Green_F",[0,-12.5,0],0],
		["Sign_Arrow_Large_Green_F",[12.5,0,0],0],
		["Sign_Arrow_Large_Green_F",[0,12.5,0],0],
		["Sign_Arrow_Large_Green_F",[8.8,8.8,0],45],
		["Sign_Arrow_Large_Green_F",[-8.9,8.8,0],45],
		["Sign_Arrow_Large_Green_F",[-8.8,-8.9,0],45],
		["Sign_Arrow_Large_Green_F",[8.8,-8.8,0],45]
	];
	if (_option == "FULL" || _option == "HELIPAD" ) then {
		_DFO_BaseObjects = _DFO_BaseObjects + [["Land_HelipadCircle_F",[0,0,0],0]];
	};
	if (_option == "FULL") then {
		//add The screen to call the action
		_DFO_BaseObjects = _DFO_BaseObjects + [
			["Land_TripodScreen_01_large_F",[-14.1,5.1,0],110],
			["CamoNet_INDP_open_F",[16.1,-15.3,0],128.4],
			["Campfire_burning_F",[-16.3,19,0],0],
			["Land_Cargo_House_V1_F",[-11.1,18.8,0],332.3],
			["Land_Cargo_Patrol_V1_F",[-18.9,7.5,0],108.6],
			["Land_Cargo_Patrol_V1_F",[19.5,-6.7,0],286.6],
			["Land_HBarrier_3_F",[22.5,-13.8,0],268.1],
			["Land_HBarrier_3_F",[21.1,-16.5,0],320.4],
			["Land_HBarrier_5_F",[6.7,-24.9,0],61.2],
			["Land_HBarrier_5_F",[4.2,-20.3,0],61.2],
			["Land_HBarrier_5_F",[10.8,-24.9,0],331.6],
			["Land_HBarrier_Big_F",[0,-17,0],0],
			["Land_HBarrier_Big_F",[-21,3.2,0],19.3],
			["Land_HBarrier_Big_F",[-7.9,-15.1,0],27.8],
			["Land_HBarrier_Big_F",[-14,-9.7,0],55.4],
			["Land_HBarrier_Big_F",[-16.9,-2.1,0],82.8],
			["Land_HBarrier_Big_F",[-22.6,8.8,0],110.6],
			["Land_HBarrier_Big_F",[-15.9,6,0],110.6],
			["Land_HBarrier_Big_F",[-19.1,19.8,0],138.8],
			["Land_HBarrier_Big_F",[-12.4,24.6,0],152.5],
			["Land_HBarrier_Big_F",[-7.8,15.1,0],152.5],
			["Land_HBarrier_Big_F",[0,17,0],180],
			["Land_HBarrier_Big_F",[21.3,-3.1,0],201.9],
			["Land_HBarrier_Big_F",[7.9,15,0],207.8],
			["Land_HBarrier_Big_F",[13.7,10,0],233.8],
			["Land_HBarrier_Big_F",[-7.2,21.6,0],245.1],
			["Land_HBarrier_Big_F",[16.8,2.6,0],261.2],
			["Land_HBarrier_Big_F",[23.3,-8.1,0],289],
			["Land_HBarrier_Big_F",[16.1,-5.5,0],289],
			["Land_HBarrier_Big_F",[7.8,-15.1,0],332.5],
			["Land_LampShabby_F",[11.1,-13.1,2.17],47.7],
			["Land_Medevac_house_V1_F",[10.3,-19.4,0],240.9],
			["Land_SignM_WarningMilitaryArea_english_F",[-23.3,11.1,0],107]
		];
	};
	
	private _compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
	private _dirCompo = (Random 359);
	_compoRefPoint setDir _dirCompo;
	{
		_object = createVehicle [(_x select 0), [0,0,4000], [], 0, "CAN_COLLIDE"];
		_object setdir _dirCompo + (_x select 2);
		_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
		_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
		_gradient = surfaceNormal position _object;
		_object setvectorup _gradient;
		_object allowDamage false;
		_object enableSimulationGlobal true;
		if ((_x select 0) == "Land_HelipadCircle_F") then {
			_object setVariable ["WMS_DFO_BaseHelipad",true];
			WMS_DFO_BasePositions pushBack (position _object);
			/*
			if(isServer)then{
				private _BasePositions = missionNameSpace getVariable ["WMS_DFO_BasePositions", []];
				_BasePositions pushBack (position this);
				missionNameSpace setVariable ["WMS_DFO_BasePositions",_BasePositions];
			};*/
		};
		_BaseObjects pushBack _object;
		if ((_x select 0) == "Land_TripodScreen_01_large_F")then{
			[_object]call WMS_fnc_DFO_addAction;
		};
	}forEach _DFO_BaseObjects;
	if !(_option == "NOTRIGGER") then {
		private _triggMission = createTrigger ["EmptyDetector", _pos, true];  
		_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_triggMission setTriggerArea [12.5, 12.5, 0, false];
		_triggMission setTriggerStatements  
		[ 
  			"this && ({ (getPosATL _x) select 2 <= 10 } count thislist) > 0",  
  			"	
	  			'Dynamic Flight Ops, Do not Park here' remoteExec ['hint', (owner (thisList select 0))]; 
	  			'Dynamic Flight Ops, Do not Park here' remoteExec ['systemChat', (owner (thisList select 0))]; 
			",  
  			"
	  			'Dynamic Flight Ops, Thank you for your visit' remoteExec ['hint', (owner (thisList select 0))]; 
	  			'Dynamic Flight Ops, Thank you for your visit' remoteExec ['systemChat', (owner (thisList select 0))]; 
			" 
		];
	};
	deleteVehicle _compoRefPoint;
	_BaseObjects
};
WMS_fnc_DFO_addAction = { //can be called afterwards to add DFO action(s) to a new object
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_addAction _this %1', _this]};
	private ["_pos"];
	params ["_objectToActivate"];
	[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
		_objectToActivate,
		[
			"<t size='0.9' color='#80c606'>Request Air Operation</t>",//_display,
			"	
				_target = _this select 0; _caller = _this select 1;
				if (WMS_DFO_UsePilotsList)then{
					if((getPlayerUID _caller) in WMS_DFO_PilotsList)then{
						[_caller,_target] remoteExec ['WMS_fnc_Event_DFO', 2];
						hint 'Contacting Air Operations HQ';
					}else{
						hint 'DFO only for selected pilots, contact admins';
					};
				}else{
					[_caller,_target] remoteExec ['WMS_fnc_Event_DFO', 2];
					hint 'Contacting Air Operations HQ';
				};
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
WMS_fnc_Event_DFO	= { //The one called by the addAction, filtered by WMS_DFO_MaxRunning and probably diag_fps
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_Event_DFO _this %1', _this]};
	private [
		"_grps","_vhls","_objs","_mkrs","_pos","_radiusObjects","_MaxGrad","_posTypes","_createCIVinf","_createOPFORinf","_createCIVvhl","_createOPFORvhl","_MissionHexaID","_timeToDelete",
		"_selectedChoppers","_crewCount","_OPFORvhlCnt","_OPFORvhlType","_CIVinfGrp","_CIVinfGrp2","_cargoObject","_missionName","_updatedTimer","_MissionPath","_MissionPathCoord","_posBase","_posLZ1","_posLZ2","_reinforce","_blackList","_mkrList","_triggList"
		];
	params [
		"_playerObject", //event manager won't spawn a mission but acrivate the menu for player to call a mission
		"_DFO_Object", //the object where the mission is called from
		["_mission", (selectRandom WMS_DFO_MissionTypes)]
	];
	if ((count WMS_DFO_Running) > WMS_DFO_MaxRunning) exitWith {['Too many Flight Ops already running'] remoteExec ['SystemChat',(owner _playerObject)]}; //need some Diag_log too
	_radiusObjects 	= 5;
	_MaxGrad 		= WMS_AMS_MaxGrad;
	_MissionPath 	= selectRandom WMS_DFO_MissionPaths;
	_MissionStart 	= "BASE";  //Dynamic //define where is the pickup/infantry spawn //["AIR","BASE","LZ1"] //AIR will come later, JVMF or ACE function from pilot sit
	_MissionFinish 	= "LZ1"; //Dynamic //where to bring them
	_posTypes 		= ["random"]; //"random","forest","city","local","military","sea"
	_civType 		= "unarmed"; //Dynamic //"armed"
	_missionName 	= "DFO Mission"; //Dynamic 
	_cargoObject 	= objNull;
	_CIVinfGrp 		=  objNull;
	_CIVinfGrp2 	=  objNull; //"airassault"
	_OPFORinfGrp 	= objNull;
	_OPFORvhlType 	= [4]; //Dynamic //[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"],["BOATS"]]
	_OPFORvhlCnt 	= 1;
	_crewCount 		= 3;
	_reinforce 		= WMS_DFO_Reinforcement;
	_createCIVinf 	= false; //soldiers will be civilian as well for now, they are neutral
	_createOPFORinf = false;
	_createCIVvhl 	= false; //not used for now
	_createOPFORvhl = false;
	_createCargo 	= false;
	_updatedTimer 	= WMS_DFO_Timer;
	_timeToDelete 	= (time+_updatedTimer);
	_selectedChoppers = selectRandom WMS_DFO_Choppers;

	_grps = [[],[]]; //pushback [[OPFOR],[CIV]]
	_vhls = [[],[]]; //pushback [[OPFOR],[CIV]]
	_objs = []; //pushback
	_mkrs = []; //pushback
	_MissionPathCoord 	= []; //pushback
	_blackList 			= []; //KEEP EMPTY
	_loadoutsCIV 		= []; //KEEP EMPTY

	_pos  		= position _DFO_Object;  //default
	_posBase 	= [worldsize/2,worldsize/2,0]; //default middle of the map
	_posLZ1  	= [0,worldsize,0]; //default
	_posLZ2  	= [worldsize,0,0]; //default
	_infType 	= "CIV"; //default //"OPFOR","CIV_ARMED","CIV"
	//look around if there is already a "BASE" position //"Land_HelipadSquare_F","Land_HelipadRescue_F","Land_HelipadEmpty_F","Land_HelipadCivil_F","Land_HelipadCircle_F"
	private _helipadList =  nearestObjects [_pos, ["Land_HelipadSquare_F","Land_HelipadRescue_F","Land_HelipadCivil_F","Land_HelipadCircle_F"], 150];
	private _DFO_BaseHelipads = [];
	if (count _helipadList != 0) then {
		{
			private _DFO_status = _x getVariable ["WMS_DFO_BaseHelipad",false];
			if (_DFO_status) then {_DFO_BaseHelipads pushBack _X};
		}forEach _helipadList;
		if (count _DFO_BaseHelipads != 0) then {
			_posBase = position (_DFO_BaseHelipads select 0);
		}else {
			_posBase = position (_helipadList select 0);
			_nil = [_posBase, "notFull"] call WMS_fnc_DFO_BuildBase;
			(_helipadList select 0) setVariable ["WMS_DFO_BaseHelipad",true];
			WMS_DFO_BasePositions pushBack _posBase;
		};
	} else {
		//if not, create one
		_posBase = [_pos, 0, 150, 20, 0, _MaxGrad, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
		_nil = [_posBase] call WMS_fnc_DFO_BuildBase;
		WMS_DFO_BasePositions pushBack _posBase;
	};
	/*
	if (WMS_DFO_Standalone) then {
		_blackList = allPlayers select {alive _x} apply {[position _x, 900]};
	}else {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull; //WMS_InfantryProgram
	};*/
	//generate Mission Hexa ID
	_MissionHexaID = [] call WMS_fnc_DFO_generateHexaID;
	//setParameters depending the mission:
	switch (_mission) do {
		case "inftransport" : {
			_missionName 	= "Infantry Transport";
			_missionStart 	= selectRandom ["BASE","LZ1"];
			_createCIVinf	= true;
			_civType 		= selectRandom ["unarmed","armed"];
			_selectedChoppers = WMS_DFO_Choppers select 2;
			if (_missionStart == "BASE") then {_missionFinish = _MissionPath select 1;_civType = "armed";} else {_missionFinish = _MissionPath select 2};
		};
		case "cargotransport" : {
			_missionName 	= "Cargo Delivery";
			_missionStart 	= selectRandom ["BASE","LZ1"];
			_createCargo 	= true;
			_selectedChoppers = WMS_DFO_Choppers select 2;
			if (_missionStart == "BASE") then {_missionFinish = _MissionPath select 1} else {_missionFinish = _MissionPath select 2};
		};
		case "casinf" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military","sea"
			_missionName 	= "CAS Infantry";
			_MissionStart 	= "LZ1";
			_createOPFORinf = true; //AA launchers //LMG
			_selectedChoppers = WMS_DFO_Choppers select 0;
		};
		case "casarmored" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military","sea"
			_missionName 	= "CAS Armored";
			_MissionStart 	= "LZ1";
			_createOPFORvhl = true; //heavy
			_OPFORvhlType 	= [3,4];
			_OPFORvhlCnt 	= selectRandom [1,2,3];
			_selectedChoppers = WMS_DFO_Choppers select 0;
		};
		case "cascombined" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military","sea"
			_missionName 	= "CAS Combined";
			_MissionStart 	= "LZ1";
			_createOPFORvhl = true;
			_OPFORvhlType 	= [0,1,3,4,5];
			_OPFORvhlCnt 	= selectRandom [2,3,4];
			_createOPFORinf = true;
			_selectedChoppers = WMS_DFO_Choppers select 0;
		};
		case "sar" : { //"LZ1"->"BASE"
			_posTypes 		= ["random","sea","sea","forest"]; //"random","forest","city","local","military","sea"
			_missionName 	= "Search And Rescue";
			_MissionStart 	= "LZ1";
			_MissionFinish 	= "BASE";
			_createCIVinf 	= true; //not armed
			_selectedChoppers = WMS_DFO_Choppers select 3;
		};
		case "csar" : { //"LZ1"->"BASE"
			_posTypes 		= ["random","sea"]; //"random","forest","city","local","military","sea"
			_missionName 	= "Combat Search And Rescue";
			_MissionStart 	= "LZ1";
			_MissionFinish 	= "BASE";
			_createCIVinf 	= true; //not armed
			_createOPFORvhl = true; //light
			_OPFORvhlType 	= [5];
			_selectedChoppers = [WMS_DFO_Choppers select 1 select 0];
		};
		case "airassault" : { //destroy target or capture zone
			_posTypes 		= ["local","city","military"]; //"random","forest","city","local","military","sea"
			_missionName 	= "Air Assault";
			_createCIVinf 	= true; //military at _MissionStart or civilian at _MissionFinish or both ?
			_createOPFORinf = true;
			_createOPFORvhl = true; //light/APC
			_OPFORvhlType 	= [4,5];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_selectedChoppers = WMS_DFO_Choppers select 0;//[["pylons"],["doorGunners"],["transport"],["medevac"]];
			if("LZ2" in _MissionPath) then {
				_MissionStart = "LZ1"; //pickup
				_MissionFinish = "LZ2"; //drop/cover
			}else {
				_MissionStart = "BASE"; //pickup
				_MissionFinish = "LZ1"; //drop/cover
			};
		};
		case "maritime" : {_missionName = "If you see this, its fuckedUp";}; //this one will definitly need way more work
	};

	//select mission position(s)
	//can be from one of the already registered zone like WMS_Pos_Villages or WMS_Pos_Forests or all mixed
	_MissionPathCoord pushBack _posBase;
	/*if (_Mission == "sar" || _Mission == "csar")then {
		_posLZ1 = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 2, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	} else {
		_posLZ1 = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	};*/
	private _posType = selectRandom _posTypes;
	if (_mission == "airassault" && {_MissionStart == "LZ1"}) then {
		_posLZ1 = [_pos] call WMS_fnc_DFO_ConvertTypeToCoord;
		//_pozLZ2 = [_posLZ1,_posType] call WMS_fnc_DFO_ConvertTypeToCoord;
	} else {
		_posLZ1 = [_pos,_posType] call WMS_fnc_DFO_ConvertTypeToCoord;
	};
	uisleep 1;
	_MissionPathCoord pushBack _posLZ1;
	if ("LZ2" in _MissionPath) then {
		if (_mission == "airassault") then {
			_posLZ2 = [_posLZ1,_posType] call WMS_fnc_DFO_ConvertTypeToCoord;
		}else{
			_posLZ2 = [_posLZ1] call WMS_fnc_DFO_ConvertTypeToCoord;
		};
	};
	uisleep 1;
	if ("LZ2" in _MissionPath) then{_MissionPathCoord pushBack _posLZ2}else {_MissionPathCoord pushBack _posBase};
	if (_MissionStart == "BASE")then {_pos = _posBase};
	if (_MissionStart == "LZ1")then {_pos = _posLZ1};
	if (_MissionFinish == "BASE")then {
		_MissionFinish = _posBase
	}else {
		if (_MissionFinish == "LZ1")then {
			_MissionFinish = _posLZ1
		}else {
			if (_MissionFinish == "LZ2")then {
				_MissionFinish = _posLZ2
			};
		};
	};
		
	//chopper, for the poors
	if (WMS_DFO_createChopper) then { //should not be used with WMS_TheLastCartridges but anyway the chopper can not sell (addAction/sell), however Exile Mod will sell it (sell/Classname)
		//do not pushback to _vhls but addAction on it "pack to get the reward" or something
		private _choppa = (selectRandom _selectedChoppers) createVehicle _posBase;
		_choppa setDir (random 359);
		clearMagazineCargoGlobal _choppa; 
		clearWeaponCargoGlobal _choppa; 
		clearItemCargoGlobal _choppa; 
		clearBackpackCargoGlobal _choppa;
	};
	//CIV Vehicle
	if (_createCIVvhl) then {}; //Nothing is using civilian vehicle yet
	//OPFOR Vehicle
	if (_createOPFORvhl) then {
		//define what type of vehicle, depending what type of mission
		if (surfaceIsWater _pos) then {_OPFORvhlType = [9]};
		private _OPFvehicles = [];
		private _veh = objNull;
		for "_i" from 1 to _OPFORvhlCnt do {
			private _vhlType = selectRandom _OPFORvhlType; //number from an array
			private _vhlCN = selectRandom (WMS_DFO_NPCvehicles select _vhlType); ///classname from array in an array
			if (_mission == "airassault") then {
				_veh = createVehicle [_vhlCN, _MissionFinish, [], 75, "NONE"];
			}else{
				_veh = createVehicle [_vhlCN, _pos, [], 75, "NONE"];
			};
			_veh setDir (random 359);
			_OPFvehicles pushback _veh;
			(_vhls select 0) pushback _veh;
			_veh setVehiclelock "LOCKEDPLAYER";
			clearMagazineCargoGlobal _veh; 
			clearWeaponCargoGlobal _veh; 
			clearItemCargoGlobal _veh; 
			clearBackpackCargoGlobal _veh;
		};
		//vehicle crew
		_infType = "OPFOR";
		{
			private _OPFORinfGrp = createGroup [OPFOR, false];
			if (_x iskindof "helicopter") then {_crewCount = 2};
			for "_i" from 1 to _crewCount do { //GROUND = 3 AIR = 2
				(WMS_DFO_NPCs select 0 select 0) createUnit [(position _x), _OPFORinfGrp]; //yes, vehicle crew are flying helicopters, what a shame
			};
			_OPFORinfGrp addvehicle _x;
			(units _OPFORinfGrp) orderGetIn true;
			(_grps select 0) pushback _OPFORinfGrp; //need a check on this one
			if (_mission == "airassault") then {
				//[_OPFORinfGrp, _pos, 300, 4, "MOVE", "AWARE", WMS_DFO_OPFORcbtMod, "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
				[_OPFORinfGrp] call CBA_fnc_taskDefend;
				{
					_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
				}forEach units _OPFORinfGrp;
				_OPFORinfGrp setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
			}else{
				[_OPFORinfGrp, _pos, 300, 4, "MOVE", "AWARE", WMS_DFO_OPFORcbtMod, "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
			};
			[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits;
		}forEach _OPFvehicles;
	};
	//create mission cargo (crate)
	if (_createCargo) then {
		_cargo = selectRandom WMS_DFO_CargoType;
		_cargoObject = _cargo createVehicle [(_pos select 0), (_pos select 1), 2];
		clearMagazineCargoGlobal _cargoObject; 
		clearWeaponCargoGlobal _cargoObject; 
		clearItemCargoGlobal _cargoObject; 
		clearBackpackCargoGlobal _cargoObject; 
		_cargoObject allowdamage false;
	};
	//create mission NPCs
	//CIV
	if (_createCIVinf) then {
		if(_civType == "armed") then {
			_loadoutsCIV = (WMS_DFO_NPCs select 1);
			_infType = "CIV_ARMED";
		} else {
			_loadoutsCIV = (WMS_DFO_NPCs select 2);
			_infType = "CIV";
		};
		if (_mission == "airassault") then {
			_CIVinfGrp = createGroup [CIVILIAN, false];
			for "_i" from 1 to (selectRandom [4,6,8]) do {
				(selectRandom (WMS_DFO_NPCs select 2)) createUnit [_missionFinish, _CIVinfGrp];		
			};
			[_CIVinfGrp, _missionFinish, 75, 5, "MOVE", "CARELESS", "BLUE", "NORMAL", "DIAMOND", "", [1,2,3]] call CBA_fnc_taskPatrol;
			_CIVinfGrp2 = createGroup [WEST, false];
			for "_i" from 1 to (selectRandom [3,4,5,6]) do {
				(selectRandom (WMS_DFO_NPCs select 1)) createUnit [_pos, _CIVinfGrp2];		
			};
			{
				_x setUnitPos "MIDDLE";
				_x allowDamage false; //you don't want those dudes to get killed by roaming AI before you pick them up
			}forEach units _CIVinfGrp2;
			(_grps select 1) pushback _CIVinfGrp2;
			_playerObject setVariable ["WMS_DFO_UnitsToManage", (units _CIVinfGrp2)];
			if (WMS_DFO_Standalone) then {
				[(units _CIVinfGrp2),[_MissionHexaID,_playerObject,"airassault","CIV_ARMED"]] call WMS_fnc_DFO_SetUnits;
			} else {
				//[(units _CIVinfGrp),'Random',100,WMS_Recon_Guards_Skill,"army"] call WMS_fnc_DynAI_SetUnitOPF; //NOPE not for now
				[(units _CIVinfGrp2),[_MissionHexaID,_playerObject,"airassault","CIV_ARMED"]] call WMS_fnc_DFO_SetUnits;
			};
		}else{
			_CIVinfGrp = createGroup [CIVILIAN, false];
			for "_i" from 1 to (selectRandom [2,4,6,8]) do {
				(selectRandom _loadoutsCIV) createUnit [_pos, _CIVinfGrp];		
			};
			{
				_x setUnitPos "MIDDLE";
				_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
			}forEach units _CIVinfGrp;
			_CIVinfGrp setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
			_playerObject setVariable ["WMS_DFO_UnitsToManage", (units _CIVinfGrp)];
		};
		(_grps select 1) pushback _CIVinfGrp;
		if (WMS_DFO_Standalone) then {
			[(units _CIVinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits;
		} else {
			//[(units _CIVinfGrp),'Random',100,WMS_Recon_Guards_Skill,"army"] call WMS_fnc_DynAI_SetUnitOPF; //NOPE not for now
			[(units _CIVinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits;
		};
	};
	//OPFOR
	if (_createOPFORinf) then {
		_infType = "OPFOR";
		_OPFORinfGrp = createGroup [EAST, false];
		if (_mission == "airassault") then {
			for "_i" from 1 to (selectRandom [4,6,8,10]) do {
				(selectRandom (WMS_DFO_NPCs select 0)) createUnit [_MissionFinish, _OPFORinfGrp];
			};
			//[_OPFORinfGrp, _MissionFinish, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
			[_OPFORinfGrp] call CBA_fnc_taskDefend; //GARRISON
		}else{
			for "_i" from 1 to (selectRandom [4,6,8,10]) do {
				(selectRandom (WMS_DFO_NPCs select 0)) createUnit [_pos, _OPFORinfGrp];
			};
			[_OPFORinfGrp, _pos, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};
		(_grps select 0) pushback _OPFORinfGrp;
		[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits;
	};
	//create mission/LZ marker
	_mkrs = [_pos,_MissionStart,[_MissionHexaID,_playerObject,nil,_mission,_MissionPathCoord,_missionName,_MissionFinish]] call WMS_fnc_DFO_CreateMkr;
	//create mission zone trigger
	_triggList = [_pos,_MissionStart,[_MissionHexaID,_playerObject,_mkrs,_mission,_MissionPathCoord,_missionName,_MissionFinish]] call WMS_fnc_DFO_CreateTrigger;
	{_objs pushback _x}forEach _triggList;
	if (_Mission == "sar" || _Mission == "csar")then{(_triggList select 0) attachTo [(leader _CIVinfGrp), [0,0,0]];};
	//create reinforcement trigger
	if (WMS_DFO_Reinforcement && _reinforce) then {
		private _triggList2 = [_posLZ1,"reinforcement",[_MissionHexaID,_playerObject,_mkrs,_mission,_MissionPathCoord,_missionName,_MissionFinish]] call WMS_fnc_DFO_CreateTrigger;
		{_objs pushback _x}forEach _triggList2;
	};
	//Notifications
	if (WMS_DFO_UseJVMF) then {
			[toUpper _mission,"DFO HQ",name _playerObject,0,["Dynamic Flight Ops","New Mission Assigned",_missionName,format["Expected OPFOR Infantry: %1",_createOPFORinf],format["Expected OPFOR Vehicles: %1",_createOPFORvhl],format["Expected OPFOR Reinforcement: %1",_reinforce],"","","",""],[_pos],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF;
		};
	if (WMS_exileToastMsg) then {
		_sessionID = _playerObject getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', (format ["%1 @ %2, %3min Timer",_missionName, ([round(_posLZ1 select 0), round(_posLZ1 select 1)]),round (_updatedTimer/60)])]]] call ExileServer_system_network_send_to;
	} else {
		["EventCustom", ["Dynamic Flight Ops", (format ["%1 @ %2, %3min Timer",_missionName, ([round(_posLZ1 select 0), round(_posLZ1 select 1)]),round (_updatedTimer/60)]), "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
	};
	//System/Management
	WMS_DFO_LastCall = time;
	WMS_DFO_Running pushback [time,_timeToDelete,_grps,_vhls,_objs,_mkrs,_cargoObject,"DFO",[_MissionHexaID,_playerObject,_mission,_MissionPathCoord,_missionName,_MissionFinish],_MissionHexaID];
	publicVariable "WMS_DFO_Running";
	publicVariable "WMS_DFO_LastCall";
};
WMS_fnc_DFO_generateHexaID = {	//will be used to find the mission data in arrays
	private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
	private _hexaArray = [];
	for "_i" from 1 to 8 do {
		_hexaArray pushBack	(selectRandom _hexaBase);
	};
	private _MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_generateHexaID _MissionHexaID %1', _MissionHexaID]};
	_MissionHexaID
};
WMS_fnc_DFO_CreateMkr = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateMkr _this %1', _this]};
	private ["_MkrList","_mkrType","_MkrColor","_MkrBorder","_MkrLZ","_mkrName"];
	params [
		"_pos",
		["_type","BASE"],
		["_options",[]] //[_MissionHexaID,_playerObject,nil,_mission,_MissionPathCoord,_missionName]
	];
	_MkrList = [];
	_mkrType = WMS_DFO_Markers select 0;
	_MkrColor = WMS_DFO_MkrColors select 0;
	_mission = _options select 3;
	if (_mission == "casarmored" || _mission == "cascombined") then {_MkrColor = WMS_DFO_MkrColors select 2};
	private _playerObject = _options select 1;
	private _missionName = _options select 5;
	if (_mission == "sar" || _mission == "csar") then {
		_pos = [((_pos select 0)-WMS_DFO_MkrRandomDist)+ random (WMS_DFO_MkrRandomDist *2),((_pos select 1)-WMS_DFO_MkrRandomDist)+ random (WMS_DFO_MkrRandomDist *2),0]
	};
	if !(_type == "BASE") then {
		_mkrName = format ["DFO_markerBorder_%1",time];
		_MkrBorder = createMarker [_mkrName, _pos];
		_MkrBorder setMarkerColor "colorOrange";
		_MkrBorder setMarkerShape "ELLIPSE";
		_MkrBorder setMarkerBrush "border";
		_MkrBorder setMarkerSize [300,300];
		_MkrList pushback _mkrName;
	}else {
		_MkrType = WMS_DFO_Markers select 1;
		_MkrColor = WMS_DFO_MkrColors select 1;
	};
	_mkrName = format ["DFO_markerLZ_%1",time];
	_MkrLZ = createMarker [_mkrName, _pos];
	_MkrLZ setMarkerType _mkrType;
	_MkrLZ setMarkerColor _MkrColor;
	_MkrLZ setMarkerText format ["%1 %2",_missionName,(name _playerObject)];
	_MkrList pushBack _mkrName;
	_MkrList
};
WMS_fnc_DFO_CreateTrigger = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger _this %1', _this]};
	private ["_triggList","_triggMission","_triggReinf","_mission"];
	params [
		"_pos",
		["_triggType", "whatever"],
		["_options",[]] //[_MissionHexaID,_playerObject,_mkrs,_mission,_MissionPathCoord,_missionName,_MissionFinish]
	];
	_triggList = [];
	_mission = _options select 3;
	if (_triggType isEqualTo "LZ1" || _triggType isEqualTo "BASE") then {
		//trigger mission itself
		if !(_mission == "casinf" || _mission == "casarmored" || _mission == "cascombined") then { //CAS do not need trigger, the cleanup is every minute check and no RTB
		_triggMission = createTrigger ["EmptyDetector", _pos, true]; 
		_triggMission setVariable ["WMS_DFO_triggData", _options, false];  
		_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true]; //should be activated by the "pilot" only
		_triggMission setTriggerArea [12.5, 12.5, 0, false];
		_triggMission setTriggerStatements  
		[ 
  			"this && ({ (position _x) select 2 <= 10 } count thislist) > 0",   //getPosATL
  			"	
		  		private _datas = (thisTrigger getVariable 'WMS_DFO_triggData');
				private _pilot = (_datas select 1);
				private _mission = (_datas select 3);
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger LZ1 | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_datas select 0), name _pilot , (_datas select 2), _mission, (_datas select 4)]};
				if (((vehicle _pilot) in thisList) && {(vehicle _pilot) isKindOf 'Helicopter'} && {speed (vehicle _pilot) < 15}) then {
					if(_mission == 'sar' || _mission == 'csar' || _mission == 'airassault' || _mission == 'inftransport') then {[vehicle _pilot , _pilot ] call WMS_fnc_DFO_infLoad};
					_datas call WMS_fnc_DFO_nextStepMkrTrigg;
					{deleteMarker _x}forEach (_datas select 2);
					deleteVehicle thisTrigger;
				}else{
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger LZ1 | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_datas select 0), name _pilot , (_datas select 2), _mission, (_datas select 4)]};
					'Dynamic Flight Ops, mission is in progress' remoteExec ['hint', (owner (thisList select 0))];
				};
			",  
  			"" 
		];
		_triggList pushBack _triggMission;
		};
	};
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
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger REINFORCE | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_datas select 0), name (_datas select 1), (_datas select 2), (_datas select 3), (_datas select 4)]};
				['LZ1'] call WMS_fnc_DFO_Reinforce;
				deleteVehicle thisTrigger;
			",  
  			"" 
		];
		_triggList pushBack _triggReinf;
	};
	_triggList
};
WMS_fnc_DFO_Reinforce = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce _this %1', _this]};
	};
WMS_fnc_DFO_NextStepMkrTrigg = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg _this %1', _this]};
	params [
		["_MissionHexaID","zzzzzzzz"],
		["_playerObject", objNull],
		["_mkrs",[]], //useless in this case, the new marker could go here if needed
		["_mission","sar"],
		["_MissionPathCoord", [[0,0,0],[0,0,0],[0,0,0]]],
		["_missionName","DFO Mission"],
		["_MissionFinish", [0,0,0]]
		];
	//if (isnil _playerObject) exitWith { //nope
	if (_MissionHexaID ==  "zzzzzzzz") exitWith {
		if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg params fuckedUp _MissionHexaID %1', _MissionHexaID]};
		};
	//create last step to finish the mission RTB Or LZ2
	private _pos = _MissionFinish;
	private _createTrigg = true;
	//CREATE THE MARKER
	private _mkrName = format ["DFO_markerEnd_%1",time];
	_MkrLZ = createMarker [_mkrName, _pos];
	_MkrLZ setMarkerType (WMS_DFO_Markers select 1);
	if (_mission == 'airassault') then {
		_MkrLZ setMarkerColor (WMS_DFO_MkrColors select 2);
	} else {
		_MkrLZ setMarkerColor (WMS_DFO_MkrColors select 1);
	};
	_MkrLZ setMarkerText format ["%1 %2",_missionName,(name _playerObject)];
	private _playerVarMkr = missionNameSpace getVariable ["WMS_DFO_MarkerToDelete",[]];
	_playerVarMkr pushBack [_MissionHexaID,_mkrName];
	missionNameSpace setVariable ["WMS_DFO_MarkerToDelete",_playerVarMkr];
	//CREATE OBJECTS TO MARK THE ZONE
	if !(_pos isEqualTo (_MissionPathCoord select 0)) then {
		private _objects = [_pos,"NOTRIGGER"]call WMS_fnc_DFO_BuildBase;
		private _playerVarObj = missionNameSpace getVariable ["WMS_DFO_MarkerToDelete",[]];
		_playerVarObj pushBack [_MissionHexaID,_objects];
		missionNameSpace setVariable ["WMS_DFO_ObjectToDelete",_playerVarObj];
	};
	//CREATE THE TRIGGER
	private _triggMission = createTrigger ["EmptyDetector", _pos, true]; 
	private _playerVarTrigg = missionNameSpace getVariable ["WMS_DFO_TriggerToDelete",[]];
	_playerVarTrigg pushBack [_MissionHexaID,_triggMission];
	missionNameSpace setVariable ["WMS_DFO_TriggerToDelete",_playerVarTrigg]; //for CleanUp timeOut, death, disconnect, success? //or mayne in missionNameSpace since it include hexaID
	_triggMission setVariable ["WMS_DFO_triggData", [_MissionHexaID,_playerObject,_mkrName,_mission,_MissionPathCoord,_missionName,_MissionFinish], false];  
	_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true]; //should be activated by the "pilot" only
	_triggMission setTriggerArea [15, 15, 0, false];
	_triggMission setTriggerStatements  
	[ 
  		"this && ({ (position _x) select 2 <= 10 } count thislist) > 0",   
  		"	
			private _datas = (thisTrigger getVariable 'WMS_DFO_triggData');
			private _pilot = (_datas select 1);
			private _mission = (_datas select 3);
			if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger END | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 | ThisList %6', (_datas select 0), name (_datas select 1), (_datas select 2), (_datas select 3), (_datas select 4), thisList]};
			if (((vehicle _pilot) in thisList) && {(vehicle _pilot) isKindOf 'Helicopter'} && {speed _pilot < 15}) then {
				if(_mission == 'sar' || _mission == 'csar' || _mission == 'airassault' || _mission == 'inftransport') then {[vehicle _pilot, _pilot] call WMS_fnc_DFO_infUnLoad};
				_datas call WMS_fnc_DFO_CallForCleanup;
				deleteVehicle thisTrigger;
			}else{
				'Dynamic Flight Ops, Do not Park here' remoteExec ['hint', (owner (thisList select 0))];
			};
		",  
  		"" 
	];
	//Notifications
	//if (WMS_DFO_UseJVMF) then {["WELCOME","DFO HQ","ALL",0,["Dynamic Flight Ops","","","","","","","","",""],[],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF};
	if (WMS_exileToastMsg) then {
		_sessionID = _playerObject getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', (format ["%1 @ %2, phase 2",_missionName, ([round(_pos select 0), round(_pos select 1)])])]]] call ExileServer_system_network_send_to;
	} else {
		["EventCustom", ["Dynamic Flight Ops", (format ["%1 @ %2, phase 2",_missionName, ([round(_pos select 0), round(_pos select 1)])]), "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
	};
};
WMS_fnc_DFO_MissionSucces = { //reward the pilot for the great job depending the mission
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_MissionSucces _this %1', _this]};
	private [];
	params [
		"_playerObject",
		["_typeOfMission", "sar"]
	];
	//WMS_DFO_Reward = [500,2000]; //["rep","money"]
	if (WMS_DFO_UseJVMF) then {["SUCCESS","DFO HQ",name _playerObject,0,["DFO Mission Success","","","","","","","","",""],[],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF};
	if (WMS_exileToastMsg) then {
		_sessionID = _playerObject getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Dynamic Flight Ops', 'Mission SUCCES!!!']]] call ExileServer_system_network_send_to;
	} else {
			["TaskSucceeded", ["Dynamic Flight Ops", "Mission SUCCES!!!"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
	};

};
WMS_fnc_DFO_PunishPunks = { //will be use to remind to those getting in the mission zone that it's not their mission, ACE broken legs and things like that
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_PunishPunks _this %1', _this]};
	};
WMS_fnc_DFO_JVMF = { //if (WMS_DFO_UseJVMF) then {[blablablabla] call WMS_fnc_DFO_JVMF;};
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_JVMF _this %1', _this]};
	//Hatchet stuff as reference:
	//private _message = [_id, _sender, _recipient, 2, _messageContent, [_position], [[_timestamp, _sender, "SENT"]]]; 
    //_message call vtx_uh60_jvmf_fnc_attemptSendMessage;
	/*
    private _typeText = switch (_type) do {
        case 0: {"FRTXT "};
        case 1: {"CASREQ"};
        case 2: {"POSRPT"};
        case 3: {"MEDEVC"};
    };*/
	//vtx_uh60_jvmf_fnc_submitMessage: Creates and sends a JVMF message from a creation dialog
	_this call vtx_uh60_jvmf_fnc_attemptSendMessage;
	};
WMS_fnc_DFO_SetUnits = { //For Standalone but not only //will use regular loadout from unit classname
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_SetUnits _this %1', _this]};
	private [];
	params [
		"_units",
		//["_infType","CIV"], //"OPFOR","CIV_ARMED","CIV"
		["_options", []], //[_MissionHexaID,_playerObject,_mission,_infType] //_infType= "OPFOR","CIV_ARMED","CIV"
		["_skills",[0.80, 0.8, 0.3, 0.3, 0.3, 0.6, 0, 0.6, 0.6]] //WMS_AMS_skilleasy
	];
	{
		//setSkill
		_x setSkill ["spotDistance", 	(_skills select 0)];
		_x setSkill ["spotTime", 		(_skills select 1)];
		_x setSkill ["aimingAccuracy", 	(_skills select 2)];
		_x setSkill ["aimingShake", 	(_skills select 3)];
		_x setSkill ["aimingSpeed", 	(_skills select 4)];
		_x setSkill ["reloadSpeed", 	(_skills select 5)];
		_x setSkill ["courage", 		(_skills select 6)];
		_x setSkill ["commanding", 		(_skills select 7)];
		_x setSkill ["general", 		(_skills select 8)];
		_x setVariable ["WMS_skills",_skills,true]; //will be used for AI killfeed on player EH killed (WMS_InfantryProgram)
		_x setVariable ["WMS_DFO_options",_options];
		_x allowFleeing 0;

		_x addEventHandler ["Killed", " 
		[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_DFO_UnitEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	}forEach _units
}; 
WMS_fnc_DFO_UnitEH = { //For Standalone but not only
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_UnitEH _this %1', _this]};
	private ["_dist","_options","_payload"];
	params [
		"_killed",
		"_killer",
		"_instigator"
	];
	_options = _killed getVariable ["WMS_DFO_options",[]]; //[_MissionHexaID,_playerObject,_mission,_infType] //_infType= "OPFOR","CIV_ARMED","CIV"
	if (isplayer _killer) then {
		_dist = (_killer distance _killed);
		_payload = [[format ["KIA %1, %2M AWAY, %3 ", toUpper(name _killed),round _dist, (_options select 3)]]];
		if (_killer == (_options select 1) || vehicle _killer == vehicle (_options select 1)) then { //multi chopper missions will become a problem so no punishment on the player, just cleanup the bodies
			if !(WMS_DFO_RemoveDup) then {
				_killed removeWeapon (primaryWeapon _killed);
				removeBackpackGlobal _killed;
			};
			moveOut _killed;
			if !(WMS_DFO_Standalone) then { //displayKillStats needs to be client side in MPmission
				[_payload,"DFO"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)];
				//add kill count WMS_InfantryProgram/ExileMod
			}else {
				[_payload,"DFO"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)]; //NEED TO CHANGE THIS FOR STANDALONE 
			};
			//[format ["KIA %1, %2M AWAY, %3 ", toUpper(name _killed)],_dist, (_options select 3)] remoteExecCall ['SystemChat',_killer];
			[format ["Killed %1, %2m away, %3 ", (name _killed),_dist, (_options select 3)]] remoteExec ['SystemChat',(owner _killer)];

		} else {
			removeAllItems _killed;
			removeAllWeapons _killed;
			removeBackpackGlobal _killed;
			removeVest _killed;
			moveOut _killed;
		};
		if !((_options select 3) == "OPFOR")then {
			//here need a selectRandom broken limbs for the _killer
			removeAllItems _killed;
			removeAllWeapons _killed;
			removeBackpackGlobal _killed;
			removeVest _killed;
			"SmokeShellYellow" createVehicle (position _killed);
		};
	} else {
		removeAllItems _killed;
		removeAllWeapons _killed;
		removeBackpackGlobal _killed;
	};
};
WMS_fnc_DFO_infLoad = { //easy way: _unit moveInCargo _chopper;
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infLoad _this %1', _this]};
	params [
		"_vehiceObject",
		"_pilotObject"
	];
	private _Units = _pilotObject getVariable ["WMS_DFO_UnitsToManage", []];
	{
		if (alive _x) then {
			_x assignAsCargo _vehiceObject;
			_x setUnitPos "AUTO";
			_x allowDamage true;
		};
	}forEach _Units;
	if (surfaceIsWater (position _vehiceObject)) then {
		{_x moveInCargo _vehiceObject}forEach _units;
	}else {
		if (side (_units select 0) == WEST ) then { //That would be "airassault"
			{_x moveInAny _vehiceObject}forEach _units;
		}else{
			_Units orderGetIn true;
		};
	};	
}; 
WMS_fnc_DFO_infUnLoad = { //easy way: moveOut _unit;
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infUnLoad _this %1', _this]};
	params [
		"_vehiceObject",
		"_pilotObject"
	];
	{
		if !(isPlayer _x) then {
			moveOut _x;
			unassignVehicle _x;
			if (side _x == BLUFOR && {_x == Leader _x})then {;
				[group _x, position _x, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
			}
		};
	}forEach crew _vehiceObject;
};
WMS_fnc_DFO_CallForCleanup = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CallForCleanup _this %1', _this]};
	params ["_MissionHexaID","_playerObject","_mkrName","_mission","_MissionPathCoord"];
	private _result = []; 
	{ 
		_found = _x find _MissionHexaID;
		_result pushback _found;
	}forEach WMS_DFO_Running;
	_DFOeventArrayRef = _result find 9; //NOT 0 FOR THIS ONE

	if (_DFOeventArrayRef == -1) exitWith {if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CallForCleanup MissionID %1 doesnt exist, result', _MissionHexaID,_result]};};
	private _DFOeventArray = WMS_DFO_Running select _DFOeventArrayRef;
	[_DFOeventArray]spawn {
		uisleep 5;
		(_this select 0) call WMS_fnc_DFO_Cleanup;
	};
};

WMS_fnc_DFO_Cleanup = {
	if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup _this %1', _this]};
	private [
		"_timeToDelete","_grpArrays","_grpOPFOR","_grpCIV","_vhl","_vhlOPFOR","_vhlCIV","_obj","_mkr","_cargo",
		"_passenger","_options","_MissionFinish","_succes","_cntOPFOR","_cntVhlOPFOR","_cntCIV","_playerObject"
		];
	_timeToDelete = (_this select 1);
	_grpArrays = (_this select 2); //[[],[]]
	_grpOPFOR = _grpArrays select 0; //[]
	_grpCIV = _grpArrays select 1; //[]
	_vhl = (_this select 3); //[[],[]]
	_vhlOPFOR = _vhl select 0; //[]
	_vhlCIV = _vhl select 1; //[]
	_obj = (_this select 4); //[mines, signs, triggers, Jump Target, whatever]
	_mkr = (_this select 5); //[]
	_cargo = (_this select 6); //object //no waypoints, can be used for the cargoObject
	_options = (_this select 8); //[_MissionHexaID,_playerObject,_mission,_MissionPathCoord] //_MissionFinish should be (_MissionPathCoord select 2)
	_playerObject =  _options select 1;
	_MissionFinish = _options select 5;
	_succes = false;
	_cntOPFOR = 0;
	_cntVhlOPFOR = 0;
	_cntCIV = 0;
	_passenger = 0;
	{
		_cntOPFOR = _cntOPFOR + ({alive _x} count units _x);
	} foreach _grpOPFOR;
	{
		_cntCIV = _cntCIV + ({alive _x} count units _x);
		_passenger = _cntCIV + ({vehicle _x != _x} count units _x);
	} foreach _grpCIV;
	switch (_options select 2) do {
		case "inftransport": { //CIV Alive at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 30}) then {_succes = true};
		};
		case "cargotransport": { //_cargo at _MissionFinish, alive _cargo
			if(alive _cargo && {(position _cargo) distance _MissionFinish < 12.5}) then {_succes = true};
		};
		case "casinf": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "casarmored": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "cascombined": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "sar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 25}) then {_succes = true};
		};
		case "csar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, no need to kill OPFOR, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 25}) then {_succes = true};
		};
		case "airassault": { //destroy target or capture zone at _MissionFinish, _cntOPFOR = 0, _vhlOPFOR != alive //the capture will do a "call for Cleanup/victory"
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};

			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0} && {_cntCIV != 0}) then {_succes = true};
		};
		case "maritime": { //this one will definitly need way more work
		};
	};
	if (_succes == true || time >= _timeToDelete) then {
				//THOSE 2 BIG CHUNKS ARE INDENTICAL beside [_playerObject]call WMS_fnc_DFO_MissionSucces; and the fail massage, need to compact this
		private _MarkerToDelete = missionNameSpace getVariable ["WMS_DFO_MarkerToDelete",[]];
		if (count _MarkerToDelete != 0) then {
			private _result = []; 
			{ 
				_found = _x find (_options select 0);
				_result pushback _found;
			}forEach _MarkerToDelete;
			_MarkerToDeleteRef = _result find 0;
			if (_MarkerToDeleteRef != -1) then {
				private _MarkerToDeleteData = _MarkerToDelete select _MarkerToDeleteRef;
				if (count _MarkerToDeleteData == 2) then {
					if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup _MarkerToDeleteData %1', _MarkerToDeleteData]};
					deleteMarker (_MarkerToDeleteData select 1);
					_MarkerToDelete deleteAt _MarkerToDeleteRef;
					missionNameSpace setVariable ["WMS_DFO_MarkerToDelete",_MarkerToDelete];
				};
			}else{
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup Mission HexaID not found %1 in %2', (_options select 0),_MarkerToDelete]};
			};
		}else{
			if (WMS_fnc_DFO_LOGs) then {'|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup No Marker to Delete'};
		};

		private _TriggerToDelete = missionNameSpace getVariable ["WMS_DFO_TriggerToDelete",[]]; // [[_MissionHexaID,_triggName]]
		if (count _TriggerToDelete != 0) then {
			private _result = []; 
			{ 
				_found = _x find (_options select 0);
				_result pushback _found;
			}forEach _TriggerToDelete;
			_TriggerToDeleteRef = _result find 0;
			if (_TriggerToDeleteRef != -1) then {
				private _TriggerToDeleteData = _TriggerToDelete select _TriggerToDeleteRef;
				if (count _TriggerToDeleteData == 2) then {
					if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup _TriggerToDeleteData %1', _TriggerToDeleteData]};
					missionNameSpace setVariable ["WMS_DFO_TriggerToDelete",_TriggerToDelete];
					deleteVehicle  (_TriggerToDeleteData select 1);
					_TriggerToDelete deleteAt _TriggerToDeleteRef;
				};
			}else{
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup Mission HexaID not found %1 in %2', (_options select 0),_TriggerToDelete]};
			};
		}else{
			if (WMS_fnc_DFO_LOGs) then {'|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup No Trigger to Delete'};
		};

		//Units/Groups spawned at LZ2 will also need a custom cleanup
		private _ObjectToDelete = missionNameSpace getVariable ["WMS_DFO_ObjectToDelete",[]]; // [[_MissionHexaID,_triggName]]
		if (count _ObjectToDelete != 0) then {
			private _result = []; 
			{ 
				_found = _x find (_options select 0);
				_result pushback _found;
			}forEach _ObjectToDelete;
			_ObjectToDeleteRef = _result find 0;
			if (_ObjectToDeleteRef != -1) then {
				private _ObjectToDeleteData = _ObjectToDelete select _ObjectToDeleteRef;
				if (count _ObjectToDeleteData == 2) then {
					if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup _ObjectToDeleteData %1', _ObjectToDeleteData]};
					missionNameSpace setVariable ["WMS_DFO_ObjectToDelete",_ObjectToDelete];
					{deleteVehicle _x}forEach (_ObjectToDeleteData select 1);
					_ObjectToDelete deleteAt _ObjectToDeleteRef;
				};
			}else{
				if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup Mission HexaID not found %1 in %2', (_options select 0),_ObjectToDelete]};
			};
		}else{
			if (WMS_fnc_DFO_LOGs) then {'|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup No Object to Delete'};
		};
		//Units/Groups spawned at LZ2 will also need a custom cleanup
		private _GroupToDelete = missionNameSpace getVariable ["WMS_DFO_GroupToDelete",[]]; // [[_MissionHexaID,group]]
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpCIV;
		{deleteVehicle _x;} forEach _vhlOPFOR; 
		{deleteVehicle _x;} forEach _vhlCIV;
		{deleteVehicle _x;} forEach _obj; 
		{deleteMarker _x;} forEach _mkr; 
		{deleteGroup _x;} forEach _grpOPFOR; 
		{deleteGroup _x;} forEach _grpCIV;
		//deleteVehicle _cargo; //I guess cargo can stay, its not a big deal
		_playerObject setVariable ["WMS_DFO_UnitsToManage", nil];
		WMS_DFO_Running deleteAt (WMS_DFO_Running find _this); //BE SURE ABOUT THIS ONE, HexaID Check
	};
	if (_succes == true) then {
		//VICTORY!!!
		{
			{_x setDamage 1} forEach units _x;
		} forEach _grpOPFOR; 
		//send victory message and rewards
		[_playerObject]call WMS_fnc_DFO_MissionSucces;
	};
	if (time >= _timeToDelete) then {
		//FAIL!!!
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpOPFOR;
		detach _cargo;
		deleteVehicle _cargo;
		//send fail message
		if (WMS_DFO_UseJVMF) then {["FAIL","DFO HQ",name _playerObject,0,["Dynamic Flight Ops","Mission Faild","","","","","","","",""],[],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF};
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['Dynamic Flight Ops', 'Mission FAILED!!!']]] call ExileServer_system_network_send_to;
		} else {
			["TaskFailed", ["Dynamic Flight Ops", "Mission FAILED!!!"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
	};
};
//////////
[] call WMS_fnc_DFO_createBaseAction;
if (WMS_fnc_DFO_LOGs) then {'|WAK|TNA|WMS|[DFO] WMS_DFO_Functions, System Started'};