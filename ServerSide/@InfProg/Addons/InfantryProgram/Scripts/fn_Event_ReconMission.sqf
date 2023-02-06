/**
* WMS_Event_ReconMission
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

/*WMS_Recon_AllCities = [];
WMS_Recon_pos_list = [];
WMS_Recon_AIgrps = [];
WMS_Recon_Objects = [];
WMS_Recon_Type = ["crate","none","safe","none"];
WMS_Recon_Steps = [3,6,9,12]; //randomSelect
WMS_Recon_Border_Radius = 300;
WMS_Recon_Cap_Radius = 20;
WMS_Recon_Guards = true;
WMS_Recon_Guards_Chance = 75;
WMS_Recon_Guards_Skill = 0.6;*/
diag_log format ["[Event]|WAK|TNA|WMS| Setting-up Recon Mission, %1", time];

diag_log format ["[Event]|WAK|TNA|WMS| Recon Mission, %1 secondes to get positions", 60];
private ["_nextRecon","_transport","_patrolGrp","_captureZone","_positions","_smokeBlue","_flag","_MkrBorder","_triggBorder","_markerName","_triggCapture","_posObjects","_object"];
uisleep 60;
WMS_Recon_AllCities = WMS_Pos_Locals+WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
diag_log format ["[Event]|WAK|TNA|WMS| Recon Mission %1 positions available", count WMS_Recon_AllCities];
for "i" from 1 to (selectrandom WMS_Recon_Steps) do {
	_nextRecon = (selectRandom WMS_Recon_AllCities);
	WMS_Recon_pos_list pushback _nextRecon;
	WMS_Recon_AllCities deleteAt (WMS_Recon_AllCities find _nextRecon);
};
diag_log format ["[Event]|WAK|TNA|WMS| Recon Mission %1 positions recorded", count WMS_Recon_pos_list];

WMS_fnc_recon_DefineVHL = {
	params[ 
		"_target"
	];
	_transport = "none";
	if (vehicle _target isKindOf "man")then{_transport = "foot"} else {
		if (vehicle _target isKindOf "tank")then{_transport = "tank"};
		if (vehicle _target isKindOf "Wheeled_Apc_F")then{_transport = "APC"};
		if (vehicle _target isKindOf "MRAP_01_base_F")then{_transport = "MRAP"};
		if (vehicle _target isKindOf "Truck_F")then{_transport = "truck"};
		if (vehicle _target isKindOf "LSV_01_armed_base_F"||vehicle _target isKindOf "LSV_02_armed_base_F")then{_transport = "LSV"};
		if (vehicle _target isKindOf "helicopter")then{
			if (vehicle _target isKindOf "Heli_Attack_01_base_F"||vehicle _target isKindOf "Heli_Attack_02_base_F")then{_transport = "attack"}else{
				if (vehicle _target isKindOf "Heli_Light_01_armed_base_F")then{_transport = "pawnee"}else{_transport = "chopper"};
			};
		};
	};
_transport; //"none","foot","tank","APC","MRAP","truck","LSV","attack","pawnee","chopper"
};

WMS_fnc_recon_Create_Guards = {
	params[ 
		"_pos", 
		["_type", "infantry"]
	];
	_patrolGrp = objNull;
	if (WMS_DynAI_RdoChatter && !(WMS_FastCombat)) then {
		_sound = format ["A3\sounds_f\sfx\radio\ambient_radio%1.wss",(selectRandom [12,11,2,1,6,8])];
		playSound3D [_sound, player, false, _pos, 2, 1, 0];
	};
	switch (_type) do { 
		case  "infantry" : {
			_patrolGrp = [_pos, OPFOR, (selectRandom [2,3,4,5])] call BIS_fnc_spawnGroup;
			[(units _patrolGrp),'Random',100,WMS_Recon_Guards_Skill,nil,"army",nil,"Recon"] call WMS_fnc_SetUnits;
			[_patrolGrp, _pos, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
			WMS_Recon_AIgrps pushback _patrolGrp;
		}; 
		case  "mines" : {}; 
		case  "aa" : {};
	}; 
	diag_log format ["[Event]|WAK|TNA|WMS| Recon Mission Spawned group %1 at %2", _patrolGrp, _pos];
};

WMS_fnc_recon_Create_Objects = {
	params[ 
		"_pos", 
		["_type", "none"]
	];
	//_posObj = [_pos, 20, 200, 10, 0] call BIS_fnc_findSafePos;
	switch (_type) do {  
		case  "none" : {};
		case  "crate" : {}; 
		case  "safe" : {}; 
		case  "capture" : {
			_captureZone = [];
			for '_i' from 0 to 360 step (150 / WMS_Recon_Cap_Radius)*2 do
				{
  					_posObjects = [(_pos select 0) + ((cos _i) * WMS_Recon_Cap_Radius), (_pos select 1) + ((sin _i) * WMS_Recon_Cap_Radius),0];
  					_object = createVehicle ['Sign_Sphere25cm_F', _posObjects, [], 0, 'CAN_COLLIDE'];
  					_object setObjectTextureGlobal [0, "colorOrange"];
  					_object enableSimulation false;
  					_captureZone pushBack _object;
				};
			WMS_Recon_Objects pushback _captureZone;
		};
	}; 
};

WMS_fnc_Recon_Create_Trigger = {
	_positions = _this;
	_pos = selectRandom _positions;
	WMS_Recon_pos_list deleteAt (WMS_Recon_pos_list find _pos);
	_pos = [_pos, 5, 150, 5, 0] call BIS_fnc_findSafePos;

	if (WMS_Recon_Guards && (random 100) <= WMS_Recon_Guards_Chance) then {
		[_pos] call WMS_fnc_recon_Create_Guards;
	};

	_flag = WMS_OPFOR_Flag createVehicle _pos;
	_smokeBlue = "SmokeShellBlue" createVehicle _pos;

	_MkrBorder = createMarker ["MkrBorder", _pos];
	_MkrBorder setMarkerColor "colorOrange";
	_MkrBorder setMarkerShape "ELLIPSE";
	_MkrBorder setMarkerBrush "border";
	_MkrBorder setMarkerSize [WMS_Recon_Border_Radius,WMS_Recon_Border_Radius];
	_triggBorder = createTrigger ["EmptyDetector", _pos, true];
	_triggBorder setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_triggBorder setTriggerArea [WMS_Recon_Border_Radius-25, WMS_Recon_Border_Radius-25, 0, false];
	_triggBorder setTriggerStatements  
	[ 
  		"this && ({ thisTrigger distance _x <= 300 } count thislist) > 0",  
  		"
			if (WMS_Recon_Guards && count WMS_Recon_AIgrps > 1) then {
				{_x setDamage 1} foreach units (WMS_Recon_AIgrps select 0);
				diag_log format ['[Event]|WAK|TNA|WMS| Recon Mission destroyed group %1', (WMS_Recon_AIgrps select 0)];
				WMS_Recon_AIgrps deleteAt 0;
			};
			deleteVehicle thisTrigger;
		",  
  		"" 
	];

	_markerName = createMarker ["markername", _pos];
	_markerName setMarkerType "o_recon";
	_markerName setMarkerColor "ColorOrange";
	_markerName setMarkerText "Recon Mission";
	_triggCapture = createTrigger ["EmptyDetector", _pos, true]; 
	_triggCapture setVariable ["flag", _flag, false];  
	_triggCapture setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_triggCapture setTriggerArea [WMS_Recon_Cap_Radius, WMS_Recon_Cap_Radius, 0, false];
	_triggCapture setTriggerStatements  
	[ 
  		"this && ({ thisTrigger distance _x <= 20 } count thislist) > 0",  
  		"
			[thisTrigger,(thisTrigger getVariable 'flag'),'markername','MkrBorder',(thisList select 0)] call WMS_fnc_Recon_Delete_trigger;
		",  
  		"" 
	];
};

WMS_fnc_Recon_Delete_trigger = {
	//_speaker = _target nearEntities [WMS_PlayerEntity, WMS_AMS_PlayerDistSucces]; //from AMS
	//[(_speaker select 0), _talk] remoteExec ['say3D',0,false]; //from AMS
	playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg","uspointcaptured"], (_this select 1), false, position (_this select 1), 4, 1, 0]; //from AMS
	deleteVehicle (_this select 1); //flag
	deleteMarker (_this select 2); //central marker
	deleteMarker (_this select 3); //border
	_target = (_this select 4); //first player in the trigger list
	if (count WMS_Recon_pos_list == 0) then { //last trigger, mission succes
		hint 'Mission accomplished soldier!';
		['Mission accomplished soldier!'] remoteExecCall ['SystemChat',_target];
		_smoke = "SmokeShellGreen" createVehicle position (_this select 0); //position thisTrigger
		_smoke setVariable ["AMS_UnlockedBy",_target,true]; //needed for AMS paradrop
		_smoke setVariable ["AMS_MissionID","Recon",true]; //needed for AMS paradrop
		//[_target,_rwds,_lootCount,_lootType,_Msg,_load,_difficulty,_Altitude,_SmokeColor,_LightColor] spawn WMS_fnc_AMS_SpawnRewards; //[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]//[_weap,_bag,_items,_ammoList,_mag]
		[_smoke,[],WMS_Recon_Rewards,"military","Mission Reward",nil,"hardcore",150] spawn WMS_fnc_AMS_SpawnRewards; //"Recon Mission Done" doesnt work yet
		deleteVehicle (_this select 0); //thisTrigger
		{{_x setDamage 1} foreach units _x;} foreach WMS_Recon_AIgrps; //Clean all the groups
		WMS_Recon_AIgrps = []; //reset the spawned group array
		WMS_Recon_AllCities = []; //reset 
		WMS_Recon_pos_list = []; //reset 
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1", "ReconMission"];};
		//execVM "\InfantryProgram\Scripts\WMS_Event_ReconMission.sqf";
		[]spawn WMS_fnc_Event_ReconMission;
	} else {
		hint 'Next Level!';
		['Next Level!'] remoteExecCall ['SystemChat',_target]; 
		deleteVehicle (_this select 0); //thisTrigger
		WMS_Recon_pos_list call WMS_fnc_Recon_Create_Trigger;
	};
	
};
WMS_Recon_pos_list call WMS_fnc_Recon_Create_Trigger;
diag_log format ["[Event]|WAK|TNA|WMS| Recon Mission Launched, %1", time];
