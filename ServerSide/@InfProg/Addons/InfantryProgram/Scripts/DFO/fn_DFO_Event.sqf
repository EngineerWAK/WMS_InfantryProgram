/**
* WMS_fnc_DFO_Event - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_Event	= { //The one called by the addAction, filtered by WMS_DFO_MaxRunning and probably diag_fps
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event _this %1', _this]};
	private [
		"_playerUID","_createChopper","_DFO_status","_DFO_BaseHelipads","_helipadList","_grps","_vhls","_objs","_mkrs","_pos","_radiusObjects","_MaxGrad","_posTypes","_createCIVinf","_createOPFORinf","_createCIVvhl","_createOPFORvhl","_MissionHexaID","_timeToDelete",
		"_objects","_unit","_OPFinfCount","_CIVinfCount","_smokePickUp","_selectedChoprs","_crewCount","_OPFORvhlCnt","_OPFORvhlType","_CIVinfGrp","_CIVinfGrp2","_cargoObject","_missionName","_updatedTimer","_MissionPath","_MsnPathCoord","_posBase","_posLZ1","_posLZ2","_reinforce","_blackList","_mkrList","_triggList"
		];
	params [
		"_playerObject", //event manager won't spawn a mission but acrivate the menu for player to call a mission
		"_DFO_Object", //the object where the mission is called from
		["_mission", (selectRandom (WMS_DFO_MissionTypes select 2))]
	];
	if ((count WMS_DFO_Running) > WMS_DFO_MaxRunning) exitWith {['Too many Flight Ops already running'] remoteExec ['SystemChat',(owner _playerObject)]}; //need some Diag_log too
	_radiusObjects 	= 5;
	_MaxGrad 		= WMS_AMS_MaxGrad;
	_MissionPath 	= selectRandom WMS_DFO_MissionPaths;
	_MissionStart 	= "BASE";  //Dynamic //define where is the pickup/infantry spawn //["AIR","BASE","LZ1"] //AIR will come later, JVMF or ACE function from pilot sit
	_MissionFinish 	= "LZ1"; //Dynamic //where to bring them
	_posTypes 		= ["random"]; //"random", "forest", "city", "local", "military", WMS_DFO_SarSeaPosition, "bases"
	_civType 		= "unarmed"; //Dynamic //"armed"
	_missionName 	= "DFO Mission"; //Dynamic 
	_createCIVinf 	= false; //Mission defined //soldiers will be civilian as well for now, so they are neutral unless "airassault"
	_createOPFORinf = false; //Mission defined
	_createCIVvhl 	= false; //Mission defined //not used for now
	_createOPFORvhl = false; //Mission defined
	_createCargo 	= false; //Mission defined
	_smokePickUp	= false; //Mission defined
	_reinforce 		= WMS_DFO_Reinforcement; //Mission defined
	_selectedChoprs = selectRandom WMS_DFO_Choppers; //Mission defined
	_createChopper 	= WMS_DFO_CreateChopper; //Mission defined
	_updatedTimer 	= WMS_DFO_Timer; //Mission defined
	_cargoObject 	= objNull; //Mission created
	_CIVinfGrp 		= objNull; //Mission created
	_CIVinfGrp2 	= objNull; //Mission created //"airassault"
	_OPFORinfGrp 	= objNull; //Mission created
	_unit			= objNull; //Mission created
	_objects		= [];
	_OPFORvhlType 	= [4]; //Dynamic //[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"],["BOATS"]]
	_OPFORvhlCnt 	= 1; //Dynamic
	_crewCount 		= 3; //Dynamic
	_CIVinfCount	= 2;
	_OPFinfCount	= 6;
	_timeToDelete 	= (time+_updatedTimer);
	_pos 			= getPosATL _DFO_Object; //default
	_posBase 		= [worldsize/2,worldsize/2,0]; //default middle of the map
	_posLZ1  		= [0,worldsize,0]; //default
	_posLZ2  		= [worldsize,0,0]; //default
	_infType 		= "CIV"; //default //"OPFOR","CIV_ARMED","CIV"
	_grps 			= [[],[]]; //pushback [[OPFOR],[CIV]]
	_vhls 			= [[],[]]; //pushback [[OPFOR],[CIV]]
	_objs			= []; //pushback
	_mkrs			= []; //pushback
	_MsnPathCoord 	= []; //pushback
	_blackList 		= []; //KEEP EMPTY
	_loadoutsCIV 	= []; //KEEP EMPTY
	_playerUID 		= getPlayerUID _playerObject;
	//if the pilote is already in a chopper, no need to spawn one (call mission from chopper)
	if(vehicle _playerObject != _playerObject) then {_createChopper = false;};
	//look around if there is already a "BASE" position
	_helipadList =  nearestObjects [_pos, ["Land_HelipadSquare_F","Land_HelipadRescue_F","Land_HelipadCivil_F","Land_HelipadCircle_F"], 150, true];
	_DFO_BaseHelipads = [];
	if (count _helipadList != 0) then {
		{
			_DFO_status = _x getVariable ["WMS_DFO_BaseHelipad",false];
			if (_DFO_status) then {_DFO_BaseHelipads pushBack _X};
		}forEach _helipadList;
		if (count _DFO_BaseHelipads != 0) then {
			_posBase = getPosATL (_DFO_BaseHelipads select 0);
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event helipad already initialized %1 @ %2', (_helipadList select 0),_posBase]};
		}else {
			_posBase = getPosATL (_helipadList select 0);
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event initializing helipad %1 @ %2', (_helipadList select 0),_posBase]};
			[_posBase, "notFull"] call WMS_fnc_DFO_BuildBase;
			(_helipadList select 0) setVariable ["WMS_DFO_BaseHelipad",true];
			if !(_posBase in WMS_DFO_BasePositions)then{
				WMS_DFO_BasePositions pushBack _posBase;
			};
		};
	} else {
		//if not, create one
		_posBase = [_pos, 0, 150, 20, 0, _MaxGrad, 0, [], [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
		[_posBase] call WMS_fnc_DFO_BuildBase;
		WMS_DFO_BasePositions pushBack _posBase;
		if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Creating helipad @ %1', _posBase]};
	};
	//generate Mission Hexa ID
	//_MissionHexaID = [] call WMS_fnc_DFO_generateHexaID;
	_MissionHexaID = [] call WMS_fnc_GenerateHexaID;
	//setParameters depending the mission:
	switch (_mission) do {
		case "inftransport" : {
			_posTypes 		= ["random","local","bases"];
			_missionName 	= "Infantry Transport";
			_missionStart 	= selectRandom ["BASE","LZ1"];
			_createCIVinf	= true;
			_CIVinfCount	= selectRandom [2,3,4,5,6,7,8];
			_civType 		= selectRandom ["unarmed","armed"];
			_smokePickUp	= WMS_DFO_SmokeAtLZ;
			_reinforce 		= selectRandom [false,true,false];
			_selectedChoprs = WMS_DFO_Choppers select (selectRandom [1,1,1,2]);//[["pylons"],["doorGunners"],["transport"],["medevac"]];
			if (_missionStart == "BASE") then {_missionFinish = _MissionPath select 1;_civType = "armed";} else {_missionFinish = _MissionPath select 2};
		};
		case "cargotransport" : {
			_posTypes 		= ["random","local","bases"];
			_missionName 	= "Cargo Delivery";
			_missionStart 	= selectRandom ["BASE","LZ1"];
			_createCargo 	= true;
			_reinforce 		= false;
			_selectedChoprs = WMS_DFO_Choppers select 2;
			if (_missionStart == "BASE") then {_missionFinish = _MissionPath select 1} else {_missionFinish = _MissionPath select 2};
		};
		case "casinf" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "CAS Infantry";
			_MissionStart 	= "LZ1";
			_reinforce 		= selectRandom [true,false];
			_createOPFORinf = true; //AA launchers //LMG
			_OPFinfCount	= selectRandom [5,6,7,8,9,10];
			_selectedChoprs = WMS_DFO_Choppers select 0;
		};
		case "casarmored" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "CAS Armored";
			_MissionStart 	= "LZ1";
			_createOPFORvhl = true; //heavy
			_OPFORvhlType 	= [3,4];
			_OPFORvhlCnt 	= selectRandom [2,3,4];
			_reinforce 		= selectRandom [true,false];
			_selectedChoprs = WMS_DFO_Choppers select 0;
		};
		case "cascombined" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_posTypes 		= ["random","local","military"]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "CAS Combined";
			_MissionStart 	= "LZ1";
			_createOPFORvhl = true;
			_OPFORvhlType 	= [0,1,3,4,5,8];
			_OPFORvhlCnt 	= selectRandom [3,4,5];
			_createOPFORinf = true;
			_OPFinfCount	= selectRandom [5,6,7,8,9,10];
			_reinforce 		= selectRandom [true,false];
			_selectedChoprs = WMS_DFO_Choppers select 0;
		};
		case "sar" : { //"LZ1"->"BASE"
			_posTypes 		= ["random",WMS_DFO_SarSeaPosition,WMS_DFO_SarSeaPosition]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "Search And Rescue";
			_MissionStart 	= "LZ1";
			_MissionFinish 	= "BASE";
			_createCIVinf 	= true; //not armed
			_CIVinfCount	= selectRandom [2,3,4,5,6,7,8];
			_reinforce 		= false;
			_smokePickUp	= WMS_DFO_SmokeAtLZ;
			_selectedChoprs = WMS_DFO_Choppers select 3; //medevac
		};
		case "csar" : { //"LZ1"->"BASE"
			_posTypes 		= ["random",WMS_DFO_SarSeaPosition]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "Combat Search And Rescue";
			_MissionStart 	= "LZ1";
			_MissionFinish 	= "BASE";
			_createCIVinf 	= true; //not armed
			_CIVinfCount	= selectRandom [2,3,4,5,6,7,8];
			_createOPFORvhl = true; //light
			_OPFORvhlType 	= [5,8];
			_smokePickUp	= WMS_DFO_SmokeAtLZ;
			_reinforce 		= selectRandom [true,false];
			_selectedChoprs = [WMS_DFO_Choppers select 1 select 0];
		};
		case "airassault" : { //destroy target or capture zone
			_posTypes 		= ["local","city","military"]; //"random","forest","city","local","military",WMS_DFO_SarSeaPosition
			_missionName 	= "Air Assault";
			_createCIVinf 	= true; //military at _MissionStart or civilian at _MissionFinish or both ?
			_CIVinfCount	= selectRandom [4,5,6,7,8];
			_createOPFORinf = true;
			_OPFinfCount	= selectRandom [5,6,7,8,9,10];
			_createOPFORvhl = true; //light/APC
			_reinforce 		= false; //KEEP false for now or it will be a mess
			_smokePickUp	= WMS_DFO_SmokeAtLZ;
			_OPFORvhlType 	= [4,5,8];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_selectedChoprs = WMS_DFO_Choppers select (selectRandom [0,0,1]);//[["pylons"],["doorGunners"],["transport"],["medevac"]];
			if("LZ2" in _MissionPath) then {
				_MissionStart = "LZ1"; //pickup
				_MissionFinish = "LZ2"; //drop/cover
			}else {
				_MissionStart = "BASE"; //pickup
				_MissionFinish = "LZ1"; //drop/cover
			};
		};
		case "medevac" : { //MEDEVAC will use some ACE medical variables like "ace_medical_inpain","ace_isunconscious","ace_medical_pain","ace_medical_bloodvolume","ace_medical_fractures","ace_medical_bodypartdamage"
			_posTypes 		= ["random","random","bases"];
			_missionName 	= "MEDEVAC";
			_civType 		= selectRandom ["unarmed","armed"];
			_MissionStart 	= "LZ1";
			_MissionFinish 	= "BASE";
			_createCIVinf 	= true; //not armed
			_CIVinfCount	= selectRandom [2,3,4,5];
			_reinforce 		= false;
			_smokePickUp	= true;
			_selectedChoprs = WMS_DFO_Choppers select 3; //medevac
		};
	};
	//select mission position(s)
	_MsnPathCoord pushBack _posBase;
	private _posType = selectRandom _posTypes;
	if (_mission == "airassault" && {_MissionStart == "LZ1"}) then {
		_posLZ1 = [_pos] call WMS_fnc_DFO_ConvertTypeToCoord;
	} else {
		_posLZ1 = [_pos,_posType] call WMS_fnc_DFO_ConvertTypeToCoord;
	};
	uisleep 1;
	if (_mission == "medevac" && {surfaceIsWater _posLZ1}) then { //MEDEVAC over water create very weird behaviors
		_posLZ1 = [_pos] call WMS_fnc_DFO_ConvertTypeToCoord;
	};
	uisleep 1;
	_MsnPathCoord pushBack _posLZ1;
	if ("LZ2" in _MissionPath) then {
		if (_mission == "airassault") then {
			_posLZ2 = [_posLZ1,_posType] call WMS_fnc_DFO_ConvertTypeToCoord;
		}else{
			_posLZ2 = [_posLZ1] call WMS_fnc_DFO_ConvertTypeToCoord;
		};
	};
	uisleep 1;
	if ("LZ2" in _MissionPath) then{_MsnPathCoord pushBack _posLZ2}else {_MsnPathCoord pushBack _posBase};
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
	if (_createChopper) then { //should not be used with WMS_TheLastCartridges but anyway the chopper can not sell (addAction/sell), however Exile Mod will sell it (sell/Classname)
		private _selectedChoppa = (selectRandom _selectedChoprs);
		//if (_selectedChoppa == "vtx_MH60S_GAU21L" && {_CIVinfCount > 5})then{_selectedChoppa = "vtx_MH60S"}; //only 5 cargo seats in "vtx_MH60S_GAU21L" //REMOVED BY HATCHET
		if (_selectedChoppa == "vtx_UH60M_SLICK" && {_CIVinfCount > 4})then{_selectedChoppa = "vtx_UH60M"}; //only 4 cargo seats in "vtx_UH60M_SLICK"
		_choppa = createVehicle [_selectedChoppa, _posBase, [], 0, "NONE"];
		//_choppa setDir (random 359); 
		_choppa setDir (windDir-180);
		clearMagazineCargoGlobal _choppa; 
		clearWeaponCargoGlobal _choppa; 
		clearItemCargoGlobal _choppa; 
		clearBackpackCargoGlobal _choppa;
		_choppa setVariable ["WMS_StartPosition",_posBase];
		if(_mission == "medevac") then {
			_choppa addItemCargoGlobal ["ACE_personalAidKit",2];
			_choppa addItemCargoGlobal ["ACE_bloodIV",5];
			_choppa addItemCargoGlobal ["ACE_bloodIV_500",5];
			_choppa addItemCargoGlobal ["ACE_bloodIV_250",10];
			_choppa addItemCargoGlobal ["ACE_elasticBandage",10];
			_choppa addItemCargoGlobal ["ACE_fieldDressing",10];
			_choppa addItemCargoGlobal ["ACE_splint",10];
			_choppa addItemCargoGlobal ["ACE_tourniquet",10];
			_choppa addItemCargoGlobal ["ACE_epinephrine",5];
			_choppa addItemCargoGlobal ["ACE_morphine",5];
			_choppa addItemCargoGlobal ["ACE_bodyBag",5];
			_choppa setVariable ["ace_medical_isMedicalFacility", true, true];
			_choppa setVariable ["WMS_resetFatigueTimer", time, true];
			if (_selectedChoppa == "vtx_UH60M_MEDEVAC") then{
				_choppa addItemCargoGlobal ["vtx_stretcher_item",4];
			};
		};
		if (WMS_DFO_CreateChopper) then {
			_choppa addMPEventHandler ["mpkilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO][Vehicle EH] WMS_fnc_DFO_Event _this %1', _this]};
			_posBase = _unit getVariable ["WMS_StartPosition",[]];
			if !(count _posBase == 0) then {
				[(typeOf _unit),_posBase]spawn WMS_fnc_DFO_RespawnMissionChopper;
			}else{
				if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO][Vehicle EH] WMS_fnc_DFO_Event _this %1', _this]};
			};}
			];
		};
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
		_choppa,
		[
			"<t size='1' color='#068604'>Return Chopper to DFO HQ</t>",
			"
				_target = _this select 0; _caller = _this select 1;
				_target removeAllMPEventHandlers 'MPKilled';
				_chopperPos = getPosATL _target;
				_target enableDynamicSimulation false;
				_target enableSimulation false;
				_target setPos [worldSize,worldsize,-100];
				_target setDamage 1;
				_lootHolder = createVehicle ['WeaponHolderSimulated', _chopperPos, [], 0, 'CAN_COLLIDE'];
				for '_i' from 1 to 6 do {
					_lootHolder addItemCargoGlobal [selectRandom (WMS_DFO_Reward select 2),1];
				};
			",//_lootHolder = createVehicle ['WeaponHolderSimulated_scripted', _chopperPos, [], 0, 'CAN_COLLIDE'];
			[], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			"
				(alive _target) &&
				{(vehicle _this == _this)} &&
				{count (crew _target) == 0};
			",
			5
		]
		] remoteExec [
			"addAction",
			owner _playerObject, //0 for all players //2 server only //-2 everyone but the server
			false //JIP
		];
	};
	//CIV Vehicle
	if (_createCIVvhl) then {}; //Nothing is using civilian vehicle yet
	//OPFOR Vehicle
	if (_createOPFORvhl) then {
		if (_mission != "airassault") then {
			private _vhlReturns = [_MissionHexaID,_playerObject,EAST,_pos,_OPFORvhlCnt,_OPFORvhlType,_mission,_MissionFinish,_playerUID] call WMS_fnc_DFO_CreateVhls; //[_vhls,_grps,_faction] //[[],[],side]
			uisleep 1;
			if ((_vhlReturns select 2) == EAST) then {
				{(_vhls select 0) pushback _x}forEach (_vhlReturns select 0);
				{(_grps select 0) pushback _x}forEach (_vhlReturns select 1);
			}else{
				{(_vhls select 1) pushback _x}forEach (_vhlReturns select 0);
				{(_grps select 1) pushback _x}forEach (_vhlReturns select 1);
			};
		};
	};
	//create mission cargo (crate)
	if (_createCargo) then {
		_cargo = selectRandom WMS_DFO_CargoType;
		_cargoObject = createVehicle [_cargo, _pos, [], 0, "NONE"];
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
			for "_i" from 1 to _CIVinfCount do {
				if (surfaceIsWater _missionFinish) then {
					if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Unit position overWater ! %1', _pos]};
					_fuckingPOS = ATLtoASL _missionFinish;
					_unit = _CIVinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 2)), _fuckingPOS, [], 3, "NONE"];
					_unit setVariable ["WMS_RealFuckingSide",CIVILIAN];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
					if ((getPosASL _unit )select 2 < 0) then {
						if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Moving Unit to the surface ! %1', _pos]};
						_unit setPosASL [((getpos _unit) select 0), ((getpos _unit) select 1), (_missionFinish select 2)+0.5];
					}else {	
						_unit disableAI "PATH";
					};
				}else{	
					_unit = _CIVinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 2)), _missionFinish, [], 3, "NONE"];
					_unit setVariable ["WMS_RealFuckingSide",CIVILIAN];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
				};	
			};
			[_CIVinfGrp, _missionFinish, 75, 5, "MOVE", "CARELESS", "BLUE", "NORMAL", "DIAMOND", "", [1,2,3]] call CBA_fnc_taskPatrol;
			_CIVinfGrp2 = createGroup [WEST, false];
			for "_i" from 1 to _CIVinfCount do {
				if (surfaceIsWater _pos) then {
					if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Unit position overWater ! %1', _pos]};
					_fuckingPOS = ATLtoASL _pos;
					_unit = _CIVinfGrp2 createUnit [(selectRandom (WMS_DFO_NPCs select 1)), _fuckingPOS, [], 3, "NONE"];
					_unit setVariable ["WMS_RealFuckingSide",WEST];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
					if ((getPosASL _unit )select 2 < 0) then {
						if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Moving Unit to the surface ! %1', _pos]};
						_unit setPosASL [((getpos _unit) select 0), ((getpos _unit) select 1), (_pos select 2)+0.5];
					}else {	
						_unit disableAI "PATH";
					};
				}else{	
					_unit = _CIVinfGrp2 createUnit [(selectRandom (WMS_DFO_NPCs select 1)), _pos, [], 3, "NONE"];
					_unit setVariable ["WMS_RealFuckingSide",WEST];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
				};	
			};
			{
				_x setUnitPos "MIDDLE";
				_x allowDamage false; //you don't want those dudes to get killed by roaming AI before you pick them up
			}forEach units _CIVinfGrp2;
			(_grps select 1) pushback _CIVinfGrp2;
			private _unitsDatas = missionNameSpace getVariable ["WMS_DFO_UnitsToManage", []];
			_unitsDatas pushBack [_MissionHexaID,(units _CIVinfGrp2)];
			missionNameSpace setVariable ["WMS_DFO_UnitsToManage", _unitsDatas];
			if (WMS_DFO_Standalone) then {
				[(units _CIVinfGrp2),[_MissionHexaID,_playerObject,"airassault","CIV_ARMED",_playerUID]] call WMS_fnc_DFO_SetUnits;
			} else {
				//[(units _CIVinfGrp),'Random',100,WMS_Recon_Guards_Skill,"army"] call WMS_fnc_DynAI_SetUnitOPF; //NOPE not for now
				[(units _CIVinfGrp2),[_MissionHexaID,_playerObject,"airassault","CIV_ARMED",_playerUID]] call WMS_fnc_DFO_SetUnits;
			};
		}else{
			_CIVinfGrp = createGroup [CIVILIAN, false];
			for "_i" from 1 to _CIVinfCount do {
				if (surfaceIsWater _pos) then {
					if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Unit position overWater ! %1', _pos]};
					_fuckingPOS = ATLtoASL _pos;
					_unit = _CIVinfGrp createUnit [(selectRandom _loadoutsCIV), _fuckingPOS, [], 3, "NONE"];
					_unit setVariable ["WMS_RealFuckingSide",CIVILIAN];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
					if ((getPosASL _unit )select 2 < 0) then {
						if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Event Moving Unit to the surface ! %1', _pos]};
						_unit setPosASL [((getpos _unit) select 0), ((getpos _unit) select 1), (_pos select 2)+0.5];
					}else {	
						_unit disableAI "PATH";
					};
				}else{	
					if (_mission == "medevac") then {
						_unit = _CIVinfGrp createUnit [(selectRandom _loadoutsCIV), _pos, [], 15, "NONE"];
					}else {
						_unit = _CIVinfGrp createUnit [(selectRandom _loadoutsCIV), _pos, [], 3, "NONE"];
					};
					_unit setVariable ["WMS_RealFuckingSide",CIVILIAN];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
				};	
			};
			if (_mission == "medevac") then {
				private _target = selectRandom (units _CIVinfGrp); //this one will need a real medical attention
				_target setUnitPos "DOWN";
				_target setVariable ["WMS_InjuredCanMove", false,true];
				_target setVariable ["ace_isunconscious", true, true];
				_target setUnconscious true;
				{
					if (_x != _target) then {
						//_x setUnitPos selectRandom ["DOWN","MIDDLE"];
						_x disableAI "ANIM";
						_x disableAI "TARGET";
						_x disableAI "AUTOTARGET";
						_x disableAI "MOVE";
						[_x, (selectRandom ["Acts_CivilInjuredArms_1", "Acts_CivilInjuredChest_1", "Acts_CivilInjuredGeneral_1", "Acts_CivilInjuredHead_1", "Acts_CivilInjuredLegs_1", "Acts_SittingWounded_loop"])] remoteExec ["switchMove"];
					};
					_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
					removeAllItems _x;
				}forEach units _CIVinfGrp;
				_objects = [_pos,"MEDEVAC"]call WMS_fnc_DFO_BuildBase;
			}else{
				_CIVinfGrp setFormation "FILE";
				{
					_x setUnitPos "MIDDLE";
					_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
				}forEach units _CIVinfGrp;
			};
			_CIVinfGrp setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
			private _unitsDatas = missionNameSpace getVariable ["WMS_DFO_UnitsToManage", []];
			_unitsDatas pushBack [_MissionHexaID,(units _CIVinfGrp)];
			missionNameSpace setVariable ["WMS_DFO_UnitsToManage", _unitsDatas];
		};
		(_grps select 1) pushback _CIVinfGrp;
		if (WMS_DFO_Standalone) then {
			[(units _CIVinfGrp),[_MissionHexaID,_playerObject,_mission,_infType,_playerUID]] call WMS_fnc_DFO_SetUnits;
		} else {
			//[(units _CIVinfGrp),'Random',100,WMS_Recon_Guards_Skill,"army"] call WMS_fnc_DynAI_SetUnitOPF; //NOPE not for now
			[(units _CIVinfGrp),[_MissionHexaID,_playerObject,_mission,_infType,_playerUID]] call WMS_fnc_DFO_SetUnits;
		};
	};
	//OPFOR
	if (_createOPFORinf) then {
		_infType = "OPFOR";
		_OPFORinfGrp = createGroup [EAST, false];
		if (_mission == "airassault") then {
			for "_i" from 1 to _OPFinfCount do {
				if (surfaceIsWater _missionFinish) then {
					_fuckingPOS = ATLtoASL _missionFinish;
					private _unit = _OPFORinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 0)), _fuckingPOS, [], 3, "NONE"];
					_unit disableAI "PATH";
				}else{	
					_unit = _OPFORinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 0)), [_missionFinish select 0,_missionFinish select 1,0], [], 3, "NONE"];
				};
				_unit setVariable ["WMS_RealFuckingSide",EAST];
				_unit setVariable ["WMS_HexaID",_MissionHexaID];			
			};
			[_OPFORinfGrp] call CBA_fnc_taskDefend; //GARRISON
		}else{
			for "_i" from 1 to _OPFinfCount do {
				if (surfaceIsWater _pos) then { //works but messy	
					_fuckingPOS = ATLtoASL _pos;
					private _unit = _OPFORinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 0)), _fuckingPOS, [], 3, "NONE"];
					_unit disableAI "PATH";
				}else{	
					_unit = _OPFORinfGrp createUnit [(selectRandom (WMS_DFO_NPCs select 0)), [_pos select 0,_pos select 1,0], [], 3, "NONE"];
				};
				_unit setVariable ["WMS_RealFuckingSide",EAST];
				_unit setVariable ["WMS_HexaID",_MissionHexaID];
			};
			[_OPFORinfGrp, _pos, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};
		(_grps select 0) pushback _OPFORinfGrp;
		[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,_infType,_playerUID]] call WMS_fnc_DFO_SetUnits;
	};
	//create mission/LZ marker
	_mkrs = [_pos,_MissionStart,[_MissionHexaID,_playerObject,nil,_mission,_MsnPathCoord,_missionName,_MissionFinish]] call WMS_fnc_DFO_CreateMkr;
	//create mission zone trigger
	if (_mission == "airassault") then {
		_triggList = [_pos,_MissionStart,[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,nil,nil,nil,_playerUID],[0,1,EAST,_pos,_OPFORvhlCnt,_OPFORvhlType,3,6]] call WMS_fnc_DFO_CreateTrigger;
	} else {
		_triggList = [_pos,_MissionStart,[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,nil,nil,nil,_playerUID]] call WMS_fnc_DFO_CreateTrigger;
	};
	{_objs pushback _x}forEach _triggList;
	if (_Mission == "sar" || _Mission == "csar")then{(_triggList select 0) attachTo [(leader _CIVinfGrp), [0,0,0]];};
	//create reinforcement trigger
	private _triggListREIN = [];
	private _triggListSIGN = [];
	if (_reinforce && WMS_DFO_Reinforcement) then {
		_triggListREIN = [_posLZ1,"reinforce",[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,_reinforce,_smokePickUp,nil,_playerUID]] call WMS_fnc_DFO_CreateTrigger;
		};
	{_objs pushback _x}forEach _triggListREIN;
	//create smoke pickup trigger
	if(_smokePickUp)then{
		if (_mission == "sar"||_mission == "csar") then {
			if (surfaceIsWater (position (leader ((_grps select 1) select 0)))) then {
				_triggListSIGN = [getPosATL (leader ((_grps select 1) select 0)),"signal",[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,_reinforce,_smokePickUp,((_grps select 1) select 0),_playerUID]] call WMS_fnc_DFO_CreateTrigger;
			};
		} else{
			_triggListSIGN = [getPosATL (leader ((_grps select 1) select 0)),"signal",[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,_reinforce,_smokePickUp,((_grps select 1) select 0),_playerUID]] call WMS_fnc_DFO_CreateTrigger;
		};
		
	};
	{_objs pushback _x}forEach _triggListSIGN;
	//Notifications
	if (WMS_DFO_UseJVMF) then {
		private _statusInf = "NO";
		private _statusVhl = "NO";
		private _statusRei = "NO";
		if (_createOPFORinf)then{_statusInf = "YES"};
		if (_createOPFORvhl)then{_statusVhl = "YES"};
		if (_reinforce)then{_statusRei = "YES"};
			[toUpper _mission,"DFO HQ",name _playerObject,0,[
				"Dynamic Flight Ops",
				"Mission Assigned",
				_missionName,
				format["Expected Infantry: %1",_statusInf],
				format["Expected Vehicles: %1",_statusVhl],
				format["Expected Reinforcement: %1",_statusRei],
				"","","",""
				],[_pos],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF;
		};
	if (WMS_exileToastMsg) then {
		_sessionID = _playerObject getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', (format ["%1 @ %2, %3min Timer",_missionName, ([round(_posLZ1 select 0), round(_posLZ1 select 1)]),round (_updatedTimer/60)])]]] call ExileServer_system_network_send_to;
	} else {
		["EventCustom", ["Dynamic Flight Ops", (format ["%1 @ %2, %3min Timer",_missionName, ([round(_posLZ1 select 0), round(_posLZ1 select 1)]),round (_updatedTimer/60)]), "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
	};
	{_objs pushBack _x}forEach _objects; //from MEDEVAC
	//System/Management
	WMS_DFO_LastCall = time;
	WMS_DFO_Running pushback [time,_timeToDelete,_grps,_vhls,_objs,_mkrs,_cargoObject,"DFO",[_MissionHexaID,_playerObject,_mission,_MsnPathCoord,_missionName,_MissionFinish],_MissionHexaID];
	publicVariable "WMS_DFO_Running";
	publicVariable "WMS_DFO_LastCall";
//};