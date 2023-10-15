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
//Some "objects" need a position check in a loop to prevent players to move them, like base statics, traders container and maybe some crates
_objToCheck = missionNameSpace getVariable ["WMS_ObjectsToCheck",[]];
_objToCheck pushBack _container;
missionNameSpace setVariable ["WMS_ObjectsToCheck",_objToCheck]; //this will be useful later
_container setVariable ["WMS_SafPosCheckASL",(getPosASL _container)]; //this will be useful later
*/

//action = "openMap true; onMapSingleClick { onMapSingleClick {}; [player,_pos,'sab_vehic_J',1] remoteExec ['WMS_fnc_ParadropMissionRequest']; openMap false; true };";
if (WMS_IP_LOGs) then {diag_log format ["[HUMANITARIAN DROP]|WAK|TNA|WMS| _this = %1", _this]};

private ["_RandomPosPlane","_RandomPosPlaneEnd","_vhl","_vehic","_grp","_WPT_paradrop","_WPT_paradrop2","_Mkr","_parachute","_cargo","_RDOtruck","_Wstation","_smoke"]; 
params[ 
	"_pos", 
	["_type", "Humani"], 
	["_reinforce", false],
	["_plane", (WMS_AI_Planes select 1)],
	["_iterations", 1],
	["_delay", 0],
	["_para", WMS_para_Big],
	["_load", WMS_Humanicrate] //"R3F_WeaponStock" //"CargoNet_01_box_F"
]; 
_RandomPosPlane = [];
_RDOtruck = objNull;
_Wstation = objNull;
_smokeColor = "SmokeShellRed";
_cityTarget = text (nearestLocation [_pos, "NameVillage"]);
if (worldName == "Tanoa") then {  
	_RandomPosPlane = [_pos, 3000, 8000, 0, 2] call BIS_fnc_findSafePos; 
} else { 
	_RandomPosPlane = [_pos, 4000, 8000] call BIS_fnc_findSafePos; 
}; 
_RandomPosPlaneEnd = [_RandomPosPlane, worldSize, (worldSize*1.2)] call BIS_fnc_findSafePos;
uisleep _delay;        
_vhl = [_RandomPosPlane, (0+random 359), _plane, CIVILIAN] call bis_fnc_spawnvehicle;       
_vehic = (_vhl select 0);   
_grp = (_vhl select 2);  
clearMagazineCargoGlobal _vehic;     
clearWeaponCargoGlobal _vehic;     
clearItemCargoGlobal _vehic;     
clearBackpackCargoGlobal _vehic; 
_vehic lockDriver true; 
_vehic setvehiclelock "LOCKEDPLAYER"; 
_vehic setvehiclelock "LOCKED"; 
_vehic flyInHeight 200;   
{  
	removeAllItems _x;  
	removeAllWeapons _x;  
	removeBackpackGlobal _x; 
	_x allowFleeing 0; 
	_x additem "FirstAidKit";  
	_x disableAI "AUTOTARGET";  
	_x disableAI "TARGET";  
} forEach units _grp ;  
_WPT_paradrop = _grp addWaypoint [_pos, 50];       
_WPT_paradrop setWaypointType "MOVE";        
_WPT_paradrop setWaypointCombatMode "BLUE";       
_WPT_paradrop setWaypointbehaviour  "CARELESS";  
_WPT_paradrop2 = _grp addWaypoint [_RandomPosPlaneEnd, 150];       
_WPT_paradrop2 setWaypointType "MOVE";    
 
switch (_type) do { 
	case  "Humani" : {
		["|*|*|*|*|*| Random Event |*|*|*|*|*|"] remoteexec ['SystemChat',0];
		_msgx = format ["Humanitarian paradrop around %1", _cityTarget];
		[_msgx] remoteexec ['SystemChat',0];
		if (WMS_exileToastMsg) then {
			["toastRequest", ["InfoTitleAndText", [_msgx]]] call ExileServer_system_network_send_broadcast;
			
		} else {
			//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
			//["TaskAssigned", ["infantry Program", _msgx]] remoteExec ["BIS_fnc_showNotification", -2];
			["EventCustomBlue", ["infantry Program", _msgx, "\A3\ui_f\data\map\VehicleIcons\iconParachute_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
		};
		["|*|*|*|*|*| Random Event |*|*|*|*|*|"] remoteexec ['SystemChat',0]; 
		_Mkr = createMarker [format ["WMS_MkrHumaDrop_%1",round time], _pos]; 
		_Mkr setMarkerAlpha 0;  
		_Mkr setMarkerType WMS_HumaniDropMkr; 
		_Mkr setMarkerText  format ["Humanitarian Drop, Wind %1 %2m/s",(round windDir),(round vectorMagnitude wind)];  
		_Mkr setMarkerColor WMS_UmaniDropColor;
		_RDOtruck = createVehicle [WMS_AI_RdoTruck,_pos,[],10,"NONE"];//"rhs_gaz66_r142_vdv"
		_RDOtruck setDir (random 359);
		[_RDOtruck,false, ["mast_handler",1,"cover_hide",0,"spare_hide",0,"bench_hide",0,"rear_numplate_hide",1,"light_hide",0]] call BIS_fnc_initVehicle;
		if (_vehic isKindOf "rhs_gaz66_r142_vdv") then { 
			_vehic animatesource ["mast_handler", 1];
		}; 
		//_RDOtruck lockDriver true; 
		_RDOtruck setvehiclelock "LOCKEDPLAYER"; 
		_RDOtruck setvehiclelock "LOCKED";
		//_Wstation = createVehicle ["Land_PortableWeatherStation_01_olive_F",_pos,[],10,"NONE"];
		_smokeColor = "SmokeShellPurple";
	}; 
};
	_triggHD1600 = createTrigger ["EmptyDetector", _pos, true]; 
	_triggHD1600 triggerAttachVehicle [_vehic];
	_triggHD1600 setVariable ["WMS_mkr", _Mkr, false];  
	_triggHD1600 setVariable ["WMS_veh", _vehic, false];   
	_triggHD1600 setVariable ["WMS_smk", _smokeColor, false];   
	_triggHD1600 setVariable ["WMS_pos", _pos, false];
	_triggHD1600 setTriggerActivation ["VEHICLE", "PRESENT", true]; 
	_triggHD1600 setTriggerArea [1600, 1600, 0, false];
	_triggHD1600 setTriggerStatements  
	[ 
  		"this",  
  		"
			_mkr = thisTrigger getVariable 'WMS_mkr';
			_veh = thisTrigger getVariable 'WMS_veh';
			_smk = thisTrigger getVariable 'WMS_smk';
			_pos = thisTrigger getVariable 'WMS_pos';
			_Mkr setMarkerAlpha 1;
			_smk createVehicle _pos;
			_veh flyInHeight 300;
			_veh limitSpeed 200; 
			if (_veh isKindOf 'sab_C130_J_C') then { 
				_veh animatesource ['door_2_2', 1];   
				_veh animatesource ['door_2_1',1];   
				_veh animatesource ['ramp_top',1];   
				_veh animatesource ['ramp_bottom',1]; 
			}; 
			deleteVehicle thisTrigger;
		",  
  		"" 
	];

	_triggHD150 = createTrigger ["EmptyDetector", _pos, true]; 
	_triggHD150 triggerAttachVehicle [_vehic];
	_triggHD150 setVariable ["WMS_load", _load, false];  
	_triggHD150 setVariable ["WMS_veh", _vehic, false];   
	_triggHD150 setVariable ["WMS_ite", _iterations, false];   
	_triggHD150 setVariable ["WMS_grp", _grp, false];
	_triggHD150 setTriggerActivation ["VEHICLE", "PRESENT", true]; 
	_triggHD150 setTriggerArea [200, 200, 0, false];
	_triggHD150 setTriggerStatements  
	[ 
  		"this",  
  		"
			_load = thisTrigger getVariable 'WMS_load';
			_veh = thisTrigger getVariable 'WMS_veh';
			_ite = thisTrigger getVariable 'WMS_ite';
			_grp = thisTrigger getVariable 'WMS_grp';
			_veh flyInHeight 500;
			_veh limitSpeed 500;
			for 'i' from 1 to _ite do {
				_para = WMS_para_Big; 
				_parachute  = createVehicle [_para,(_veh modelToWorld [(-5+(random 10)),(-25+(random 10)),(-25+(random 10))]), [], 5];
				_parachute  setvelocity [0,0,-8]; 
				_cargo = createVehicle [_load ,position _parachute, [],5];
				[_cargo, _cargo] call ace_common_fnc_claim;
				_cargo setVariable ['vn_log_enablePickup', false];
				clearMagazineCargoGlobal _cargo;     
				clearWeaponCargoGlobal _cargo;     
				clearItemCargoGlobal _cargo;     
				clearBackpackCargoGlobal _cargo; 
				_cargo attachTo [_parachute,[0,0,0]];
				[_cargo,_grp,_veh]spawn {
					waitUntil {((position (_this select 0)) select 2) < 25};
					detach (_this select 0);
					[
						(_this select 0),
						[
							(selectRandom (WMS_humaniDropList select 0)),
							(selectRandom (WMS_humaniDropList select 0)),
							(selectRandom (WMS_humaniDropList select 0)),
							(selectRandom (WMS_humaniDropList select 0))
						],
						[
							(selectRandom (WMS_humaniDropList select 1)),
							(selectRandom (WMS_humaniDropList select 1))
						],
						[
							(selectRandom (WMS_humaniDropList select 2))
						],
						[
							(selectRandom (WMS_humaniDropList select 3))
						]
					] call WMS_fnc_AMS_FillStuff;
					uisleep (60+random 30); 
					{deleteVehicle _x} forEach units (_this select 1); 
					(_this select 2) setDamage 0.9;
				};
			};
			deleteVehicle thisTrigger;
		",  
  		"" 
	];
 
WMS_AI_RoamingAIR_Running pushback [time,(time+450),[_grp],[[_vehic,(position _vehic)]],[_RDOtruck],[_Mkr],[_WPT_paradrop,_WPT_paradrop2],""]; 