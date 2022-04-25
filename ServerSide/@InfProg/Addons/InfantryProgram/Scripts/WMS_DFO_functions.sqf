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
WMS_DynamicFlightOps	= false; //NOT READY YET
WMS_DFO_Standalone		= false;
WMS_DFO_CancelOnKIA		= false;
WMS_DFO_Reinforcement	= false;
WMS_DFO_CreateChopper	= false;
WMS_DFO_UseJVMF			= false;
WMS_DFO_RemoveDup		= true; //delete dead NPC primary weapons and backpack
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
//WMS_DFO_Choppers		= [["vtx_MH60M_DAP","vtx_MH60S_Pylons"],["vtx_MH60S_GAU21L","vtx_HH60","vtx_MH60M","vtx_MH60S","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
WMS_DFO_NPCvehicles		= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS]]
						["O_Heli_Attack_02_dynamicLoadout_F"],
						["O_Heli_Light_02_dynamicLoadout_F"],
						["O_Heli_Transport_04_covered_F"],
						["O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"],//AA first
						["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F"],//"AA" first
						["O_MRAP_02_hmg_F","O_LSV_02_armed_F","O_G_Offroad_01_armed_F"],
						["O_Truck_02_medical_F","O_Truck_02_Ammo_F"],
						["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
						["O_static_AA_F","O_Mortar_01_F","O_GMG_01_high_F","O_HMG_01_high_F"]];//AA first
WMS_DFO_NPCs			= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
						["O_Soldier_AA_F","O_crew_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_AR_F"], //AA first //crew second
						["B_helicrew_F","B_soldier_AR_F","B_Soldier_GL_F","B_soldier_M_F","B_Soldier_F"], //crew first //in arma civillian can not have weapon...
						["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
WMS_DFO_Markers			= ["n_support","n_hq"]; //["mission","RTB"]; //["loc_heli","mil_end_noShadow"]
WMS_DFO_MkrColors		= ["colorOrange","colorGreen"]; //["mission","RTB"];
WMS_DFO_Reward			= [500,2000]; //["rep","money"]
WMS_DFO_MissionPaths	= [["base","LZ1","Base"],["base","LZ1","LZ2"]]; // "takeoff/mission/complet"
WMS_DFO_BasePositions	= []; //KEEP EMPTY //will be pushed back from "somewhere"
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
		["_type","BASE"],
		["_options",[]] //not used yet
	];
	_MkrList = [];
	_mkrType = WMS_DFO_Markers select 0;
	_MkrColor = WMS_DFO_MkrColors select 0;
	if !(_type == "BASE") then {
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
	
	if (_triggType == "LZ1") then {
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
				diag_log format ['[Event]|WAK|TNA|WMS| DFO Reinforcement trigger activated %1', (position thisTrigger)];
				deleteVehicle thisTrigger;
			",  
  			"" 
		];
		_triggList pushBack _triggReinf;
	};
	_triggList
};
WMS_fnc_DFO_NextStepMkrTrigg = { //create last step to finish the mission RTB Or LZ2
	//(thisTrigger getVariable 'WMS_DFO_triggData') call WMS_fnc_DFO_nextStepMkrTrigg;
	//need to auto-delete at succes/fail
	//WMS_DFO_Markers select 1;
	//WMS_DFO_MkrColors select 1;
	//if (_MissionFinish == "LZ2")then {_pos = _posLZ2};
	//if (_MissionFinish == "BASE")then {_pos = _posBase};
};
WMS_fnc_DFO_MissionSucces = {
	private [];
	params [
		"_playerObject",
		["_typeOfMission", "sar"]
	];
	//reward the pilote for the great job depending the mission
	//WMS_DFO_Reward = [500,2000]; //["rep","money"]

};
WMS_fnc_DFO_PunishPunks = {}; //will be use to remind to those getting in the mission zone that it's not their mission, ACE broken legs and things like that
WMS_fnc_DFO_JVMF = {};//if (WMS_DFO_UseJVMF) then {[blablablabla] call WMS_fnc_DFO_JVMF;};
WMS_fnc_DFO_SetUnits = { //For Standalone but not only //will use regular loadout from unit classname
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
		[(_this select 0),(_this select 1)] call WMS_fnc_DFO_UnitEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	}forEach _units
}; 
WMS_fnc_DFO_UnitEH = { //For Standalone but not only
	private ["_distance","_options","_payload"];
	params [
		"_killed",
		"_killer"
	];
	_options = _killed getVariable ["WMS_DFO_options",[]]; //[_MissionHexaID,_playerObject,_mission,_infType] //_infType= "OPFOR","CIV_ARMED","CIV"
	if (isplayer _killer) then {
		_distance = (_killer distance _killed);
		_payload = [[format ["KIA %1, %2M AWAY, %3 ", toUpper(name _killed)],_distance,toUpper (side _killed)]];
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
				//[_payload,"DFO"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)]; //still needs to be client side/MPmission
			};
			[_payload] remoteExecCall ['SystemChat',_killer];

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
		//removeVest _killed;
		//_killed removeWeapon (primaryWeapon _killed);
		//_killed removeWeapon (secondaryWeapon _killed);
		//moveOut _killed;
	};
	//////////
};
WMS_fnc_DFO_infLoad = {}; //easy way: _unit moveInCargo _chopper;
WMS_fnc_DFO_infUnLoad = {}; //easy way: moveOut _unit;
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
	if ((count WMS_DFO_Running) > WMS_DFO_MaxRunning) exitWith {['Too many Flight Ops already running'] remoteExecCall ['SystemChat',_playerObject]}; //need some Diag_log too
	_grps = [[],[]]; //pushback [[OPFOR],[CIV]]
	_vhls = [[],[]]; //pushback [[OPFOR],[CIV]]
	_objs = []; //pushback
	_mkrs = []; //pushback
	_MissionPathCoord = []; //pushback
	_blackList = []; //KEEP EMPTY
	_loadoutsCIV = []; //KEEP EMPTY
	_infType = ""; //KEEP EMPTY //"OPFOR","CIV_ARMED","CIV"

	_pos  = position _DFO_Object; //will need a safe position around to land/drop
	_radiusObjects = 5;
	_MaxGrad = WMS_AMS_MaxGrad;
	_MissionPath = selectRandom WMS_DFO_MissionPaths;
	_MissionStart = "BASE";  //define where is the pickup/infantry spawn //["AIR","BASE","LZ1"] //AIR will come later, JVMF or ACE function from pilot sit
	_MissionFinish = "LZ1"; //where to bring them
	_posBase = [_pos, 0, 100, 20, 0, _MaxGrad, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	_posLZ1  = [worldsize/2,worldsize/2,0]; //default middle of the map
	_posLZ2  = _posLZ1; //default middle of the map
		_posType = "random"; //"random","forest","sea","buildings","military" //should be dynamic depending the mission
	_civType = "unarmed"; //"armed"
	_OPFORvhlType = ["APC"];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
	_OPFORvhlCnt = 1;
	_reinforce = WMS_DFO_Reinforcement;
	_createCIVinf 	= false; //soldiers will be civilian as well for now, they are neutral
	_createOPFORinf = false;
	_createCIVvhl 	= false; //not used for now
	_createOPFORvhl = false;
	_createCargo 	= false;
		_launch 		= false; //will be used as filter to prevent mission to be created if something is wrong: if !(_launch) exitWith {};
	_updatedTimer = WMS_DFO_Timer;
	_timeToDelete = (time+_updatedTimer);

	if (WMS_DFO_Standalone) then { 
		WMS_DFO_Standalone = false; //Standalone not ready yet
		WMS_exileToastMsg = false;
		_blackList = allPlayers select {alive _x} apply {[position _x, 900]};
		//WMS_Events_Running = [];
	}else {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
	};
	//generate Mission Hexa ID
	_MissionHexaID = [] call WMS_fnc_DFO_generateHexaID;
	//setParameters depending the mission:
	switch (_mission) do {
		case "inftransport" : { //maybe add some bad dudes at _missionFinish
			_missionStart = selectRandom ["BASE","LZ1"];
			_missionFinish = (_MissionPath select ((count _MissionPath)-1) );
			_createCIVinf = true;
			_civType = selectRandom ["unarmed","armed"];
			};
		case "cargotransport" : {
			_missionStart = selectRandom ["BASE","LZ1"];
			_missionFinish = (_MissionPath select ((count _MissionPath)-1) );
			_createCargo 	= true;
		};
		case "airassault" : { //destroy target or capture zone
			if("LZ2" in _MissionPath) then {
			_MissionStart = "LZ1"; //pickup
			_MissionFinish = "LZ2"; //drop/cover //those dudes will probably beed to be BLUFOR to be able to do something...
			};
			_createCIVinf = true; //military at _MissionStart or civilian at _MissionFinish
			_civType = "armed"; //only military for now
			_createOPFORinf = true;
			_createOPFORvhl = true; //light/APC
			//_OPFORvhlType = ["LIGHT","APC"];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlType = [4,5];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlCnt = selectRandom [1,2];
			};
		case "casinf" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_MissionStart = "LZ1";
			_createOPFORinf = true; //AA launchers //LMG
			};
		case "casarmored" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_MissionStart = "LZ1";
			_createOPFORvhl = true; //heavy
			//_OPFORvhlType = ["HEAVY","APC"];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlType = [3,4];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlCnt = selectRandom [1,2,3];
		};
		case "cascombined" : { //mission (LZ1) succes wen target destroyed, No RTB/LZ2
			_MissionStart = "LZ1";
			_createOPFORvhl = true;
			//_OPFORvhlType = ["AIR_HEAVY","AIR_LIGHT","HEAVY","APC","LIGHT"];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlType = [0,1,3,4,5];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlCnt = selectRandom [2,3,4];
			_createOPFORinf = true;
		};
		case "sar" : { //"LZ1"->"BASE"
			_MissionStart = "LZ1";
			_MissionFinish = "BASE";
			_createCIVinf = true; //not armed
			};
		case "csar" : { //"LZ1"->"BASE"
			_MissionStart = "LZ1";
			_MissionFinish = "BASE";
			_createCIVinf = true; //not armed
			_createOPFORvhl = selectRandom [true,false]; //light
			//_OPFORvhlType = ["LIGHT"];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			_OPFORvhlType = [5];//[["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
		};
		case "maritime" : {}; //this one will definitly need way more work
	};

	//select mission position(s)
		//can be from one of the already registered zone like WMS_Pos_Villages or WMS_Pos_Forests or all mixed
		_MissionPathCoord pushBack _posBase;
		_posLZ1 = [_posLZ1, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
		_MissionPathCoord pushBack _posLZ1;
		if ("LZ2" in _MissionPath) then {
			_posLZ2 = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
			_MissionPathCoord pushBack _posLZ2;
		}else {_MissionPathCoord pushBack _posBase};
		if (_MissionStart == "BASE")then {_pos = _posBase};
		if (_MissionStart == "LZ1")then {_pos = _posLZ1};
		//if (_MissionFinish == "LZ2")then {_pos = _posLZ2}; //NOPE NOT HERE
		//if (_MissionFinish == "BASE")then {_pos = _posBase}; //NOPE NOT HERE
	//create mission/LZ marker
		_mkrs = [_posLZ1,"LZ1"] call WMS_fnc_DFO_CreateMkr; //_options should contain [HexaID,pilote,mission markers,mission type,_MissionPathCoord]
	//create mission vehicles
		//chopper
		if (WMS_DFO_createChopper) then { //should not be used with WMS_TheLastCartridges but anyway the chopper can not sell (addAction/sell), however Exile Mod will sell it (sell/Classname)
			//do not pushback to _vhls but addAction on it "pack to get the reward" or something
		};
		//CIV
		if (_createCIVvhl) then {};
		//OPFOR
		if (_createOPFORvhl) then {
			//need to define what type of vehicle, depending what type of mission
			//_OPFORvhlType = [3,4]; //WMS_DFO_NPCvehicles = [["AIR_HEAVY"],["AIR_LIGHT"],["AIR_UNARMED"],["HEAVY"],["APC"],["LIGHT"],["UNARMED"],["CIV"],["STATICS"]]
			//_OPFORvhlCnt = 3;
			private _OPFvehicles = [];
			for "_i" from 1 to _OPFORvhlCnt do {
				private _vhlType = selectRandom _OPFORvhlType; //number from an array
				private _vhlCN = selectRandom (WMS_DFO_NPCvehicles select _vhlType); ///classname from array in an array
				private _veh = createVehicle [_vhlCN, _pos, [], 75, "NONE"];
				_OPFvehicles pushback _veh;
				clearMagazineCargoGlobal _veh; 
				clearWeaponCargoGlobal _veh; 
				clearItemCargoGlobal _veh; 
				clearBackpackCargoGlobal _veh;
			};
			//vehicle crew
			_infType = "OPFOR";
			private _unitsOPFORinfGrp = [];
			private _crewCount = 3;
			{
				private _OPFORinfGrp = createGroup [OPFOR, false];
				if (_x iskindof "helicopter") then {_crewCount = 2};
				for "_i" from 1 to _crewCount do { //GROUND = 3 AIR = 2
					(WMS_DFO_NPCs select 0 select 0) createUnit [(position _x), _OPFORinfGrp]; //yes, vehicle crew are flying helicopters, sue me
				};
				_unitsOPFORinfGrp pushBack (units _OPFORinfGrp);
				_OPFORinfGrp addvehicle _x;
				(units _OPFORinfGrp) orderGetIn true;
				(_grps select 0) pushback _OPFORinfGrp; //need a check on this one
				[_OPFORinfGrp, _pos, 300, 4, "MOVE", "AWARE", "YELLOW", "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
			}forEach _OPFvehicles;
			[_unitsOPFORinfGrp,[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits; //_infType will be used in the EH to get different result //_options [_MissionHexaID,_playerObject,_mission]
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
			_CIVinfGrp = createGroup [CIVILIAN, false];
			for "_i" from 1 to (selectRandom [2,4,6,8]) do {
				(selectRandom _loadoutsCIV) createUnit [_pos, _CIVinfGrp];
			};
			(_grps select 1) pushback _CIVinfGrp;
			if (WMS_DFO_Standalone) then {
				[(units _CIVinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits; //_infType will be used in the EH to get different result
			} else {

				//[(units _CIVinfGrp),'Random',100,WMS_Recon_Guards_Skill,"army"] call WMS_fnc_DynAI_SetUnitOPF; //NOPE not for now
			};
		};
		//OPFOR
		if (_createOPFORinf) then {
			_infType = "OPFOR";
			_OPFORinfGrp = createGroup [OPFOR, false];
			[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,_infType]] call WMS_fnc_DFO_SetUnits; //_infType will be used in the EH to get different result
			for "_i" from 1 to (selectRandom [4,6,8,10]) do {
				(selectRandom (WMS_DFO_NPCs select 0)) createUnit [_pos, _OPFORinfGrp];
			};
			(_grps select 0) pushback _OPFORinfGrp;
			[_OPFORinfGrp, _pos, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};
	//create mission zone trigger
		_triggList = [_posLZ1,"LZ1",[_MissionHexaID,_playerObject,_mkrs,_mission,_MissionPathCoord]] call WMS_fnc_DFO_CreateTrigger; //_options should contain [HexaID,pilote,mission markers,mission type,_MissionPathCoord]
		{_objs pushback _x}forEach _triggList;
	//create reinforcement trigger
		if (WMS_DFO_Reinforcement && _reinforce) then {
			//auto delete at the first reinforcement
			_triggList2 = [_posLZ1,"reinforcement",[_MissionHexaID,_playerObject,_mkrs,_mission,_MissionPathCoord]] call WMS_fnc_DFO_CreateTrigger; //_options should contain [HexaID,pilote,mission markers,mission type,_MissionPathCoord]
			{_objs pushback _x}forEach _triggList2;
		};
	//Notifications
		if (WMS_DFO_UseJVMF) then {["blablablabla"] call WMS_fnc_DFO_JVMF};
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', (format ["%1 @ %2",_mission, ([_posLZ1 select 0, _posLZ1 select 1])])]]] call ExileServer_system_network_send_to;
		} else {
			["EventCustom", ["Dynamic Flight Ops", (format ["%1 @ %2",_mission, ([_posLZ1 select 0, _posLZ1 select 1])]), "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
	//System/Management
	WMS_DFO_LastCall = time;
	WMS_DFO_Running pushback [_timeToDelete,_MissionHexaID,_playerObject,_mission];
	WMS_Events_Running pushBack [time,_timeToDelete,_grps,_vhls,_objs,_mkrs,_cargoObject,"DFO",[_MissionHexaID,_playerObject,_mission,_MissionPathCoord]];
	publicVariable "WMS_DFO_Running";
	publicVariable "WMS_DFO_LastCall";
};
WMS_fnc_DFO_CallForCleanup = {
	private [
		"_timeToDelete","_grpArrays","_grpOPFOR","_grpCIV","_vhl","_vhlOPFOR","_vhlCIV","_obj","_mkr","_cargo",
		"_options","_MissionFinish","_succes","_cntOPFOR","_cntVhlOPFOR","_cntCIV"
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
	_MissionFinish = _options select 3 select 2;
	_playerObject =  _options select 1;
	_succes = false;
	_cntOPFOR = 0;
	_cntVhlOPFOR = 0;
	_cntCIV = 0;
	{
		_cntOPFOR = _cntOPFOR + ({alive _x} count units _x);
	} foreach _grpOPFOR;
	{
		_cntCIV = _cntCIV + ({alive _x} count units _x);
	} foreach _grpCIV;
	switch (_options select 2) do {
		case "inftransport": { //CIV Alive at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 50}) then {_succes = true};
		};
		case "cargotransport": { //_cargo at _MissionFinish, alive _cargo
			if(alive _cargo && {(position _cargo) distance _MissionFinish < 50}) then {_succes = true};
		};
		case "airassault": { //destroy target or capture zone at _MissionFinish, _cntOPFOR = 0, _vhlOPFOR != alive //the capture will do a "call for Cleanup/victory"
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0} && {_cntCIV != 0}) then {_succes = true};
		};
		case "casinf": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "casarmored": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "cascombined": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_succes = true};
		};
		case "sar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 50}) then {_succes = true};
		};
		case "csar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, no need to kill OPFOR, _cntCIV != 0
			if(_cntCIV != 0 && {(position (leader (_grpCIV select 0))) distance _MissionFinish < 50}) then {_succes = true};
		};
		case "maritime": { //this one will definitly need way more work
		};
	};
	if (_succes == true) then {
				//VICTORY!!! cleanup
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpOPFOR; 
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
		WMS_Events_Running deleteAt (WMS_Events_Running find _x); //BE SURE ABOUT THIS ONE, HexaID Check
		//send victory message and rewards
		if (WMS_DFO_UseJVMF) then {["blablablabla"] call WMS_fnc_DFO_JVMF};
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Dynamic Flight Ops', 'Mission SUCCES!!!']]] call ExileServer_system_network_send_to;
		} else {
			["TaskSucceeded", ["Dynamic Flight Ops", "Mission SUCCES!!!"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
		[_playerObject]call WMS_fnc_DFO_MissionSucces;
	};
	if (_timeToDelete > time) then {
		//FAIL!!! cleanup
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpOPFOR; 
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
		WMS_Events_Running deleteAt (WMS_Events_Running find _this); //BE SURE ABOUT THIS ONE, HexaID Check
		//send fail message
		if (WMS_DFO_UseJVMF) then {["blablablablaBOOOOOOOOOOHHHHHHH"] call WMS_fnc_DFO_JVMF};
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