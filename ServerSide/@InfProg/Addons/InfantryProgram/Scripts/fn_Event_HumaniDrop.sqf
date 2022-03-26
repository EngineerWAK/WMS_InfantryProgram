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

//action = "openMap true; onMapSingleClick { onMapSingleClick {}; [player,_pos,'sab_vehic_J',1] remoteExec ['WMS_fnc_ParadropMissionRequest']; openMap false; true };";
diag_log format ["[HUMANITARIAN DROP]|WAK|TNA|WMS| _this = %1", _this];

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
		//[_RDOtruck,["standard",1], ["mast_handler",1,"cover_hide",0,"spare_hide",0,"bench_hide",0,"rear_numplate_hide",1,"light_hide",0]] call BIS_fnc_initVehicle;  //INIT VEHICLE FUCKED UP THANK YOU BOHEMIA
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
 
//WMS_AI_RoamingAIR_Running pushback [time,(time+450),[_grp],[[_vehic,(position _vehic)]],[_RDOtruck,_Wstation],[_Mkr],[_WPT_paradrop,_WPT_paradrop2],""]; 
WMS_AI_RoamingAIR_Running pushback [time,(time+450),[_grp],[[_vehic,(position _vehic)]],[_RDOtruck],[_Mkr],[_WPT_paradrop,_WPT_paradrop2],""]; 
 
waituntil  {_vehic distance2d _pos <= 1600}; 
_Mkr setMarkerAlpha 1;
_smoke = _smokeColor createVehicle _pos;
_vehic flyInHeight 300;
_vehic limitSpeed 200; 
if (_vehic isKindOf "sab_C130_J_C") then { 
	_vehic animatesource ["door_2_2", 1];   
	_vehic animatesource ["door_2_1",1];   
	_vehic animatesource ["ramp_top",1];   
	_vehic animatesource ["ramp_bottom",1]; 
}; 
waituntil  {_vehic distance2d _pos <= 100};
for "i" from 1 to _iterations do {
	_para = WMS_para_Big; 
	_parachute  = createVehicle [_para,(_vehic modelToWorld [0,-20,-10]), [], 5]; 
	//_parachute  setdir winddir; 
	_parachute  setvelocity [0,0,-8]; 
	_cargo = createVehicle [_load ,position _parachute, [],5];  
	clearMagazineCargoGlobal _cargo;     
	clearWeaponCargoGlobal _cargo;     
	clearItemCargoGlobal _cargo;     
	clearBackpackCargoGlobal _cargo; 
	_cargo attachTo [_parachute,[0,0,0]];
	[_cargo]spawn {
		waitUntil {((position (_this select 0)) select 2) < 25};
		detach (_this select 0);
		[(_this select 0),[(selectRandom WMS_humaniDropList),(selectRandom WMS_humaniDropList),(selectRandom WMS_humaniDropList)]] call WMS_fnc_AMS_FillStuff;
		/*params[ //FillStuff
			"_cargo",
			["_itemList", [selectRandom WMS_miscList]],  
			["_magList",[["SmokeShellGreen",1,5],["HandGrenade",1,5]]],  
			["_bagList",[[selectRandom (WMS_Loadout_Livonia select 3),1,2]]],  
			["_weapList",[[selectRandom (WMS_Loadout_Assault select 0),1,5]]] 
		];*/
	};
	uisleep 1.5;
};
uisleep (60+random 30); 
{deleteVehicle _x} forEach units _grp; 
_vehic setDamage 0.8;
