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

//action = "openMap true; onMapSingleClick { onMapSingleClick {}; [player,_pos,'sab_C130_J',1] remoteExec ['WMS_fnc_ParadropMissionRequest']; openMap false; true };";
if (WMS_InfantryProgram_LOGs) then {diag_log format ["[C130]|WAK|TNA|WMS| C130 Paradrop, _this = %1", _this]};
private ["_RandomPosPlane","_RandomPosPlaneEnd","_vhl","_vehic","_grp","_WPT_paradrop","_WPT_paradrop2"];
params[
	"_target",
	"_pos",
	"_paraGroup",
	"_vehicVarName",
	["_plane", WMS_C130_Type] //"sab_C130_J"
];
_RandomPosPlane = [];
if (worldName == "Tanoa") then { _RandomPosPlane = [_pos, 3000, 7000, 0, 2] call BIS_fnc_findSafePos } else {
	_RandomPosPlane = [_pos, 3000, 5000] call BIS_fnc_findSafePos;
};
_RandomPosPlaneEnd = [_RandomPosPlane, worldSize, (worldSize*1.2)] call BIS_fnc_findSafePos;       
_vhl = [_RandomPosPlane, (0+random 359), _plane, BLUFOR] call bis_fnc_spawnvehicle;      
_vehic = (_vhl select 0);  
_grp = (_vhl select 2); 
clearMagazineCargoGlobal _vehic;    
clearWeaponCargoGlobal _vehic;    
clearItemCargoGlobal _vehic;    
clearBackpackCargoGlobal _vehic;
_vehic addBackpackCargoGlobal ["B_Parachute", 10]; //maybe add a paradrop for the players backpacks
_vehic setvehicleVarName _vehicVarName;
WMS_MoveInCargo_C130 = _vehic; //from _vehic to _vehicVarName do not work
publicVariable "WMS_MoveInCargo_C130";
WMS_MoveInCargo_C130_LastTime = time;
publicVariable "WMS_MoveInCargo_C130_LastTime";
_vehic lockDriver true; 
_vehic lockTurret [[-1], true]; 
_vehic lockTurret [[0], true]; 
_vehic lockTurret [[1], true]; 
_vehic flyInHeight WMS_C130_Altitude;  
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
_WPT_paradrop2 setWaypointCombatMode "BLUE";      
_WPT_paradrop2 setWaypointbehaviour  "CARELESS"; 

uisleep 3; 
if (_paraGroup == 0) then {
	[_target, _vehic] remoteExec ['moveinCargo',(owner _target)];
} else {
	{
		[_x, _vehic] remoteExec ['moveinCargo',(owner _x)];
	} foreach (units(group _target)); //I think this shit never worked xD
};

if (WMS_InfantryProgram_LOGs) then {
	diag_log format ["[C130]|WAK|TNA|WMS| %1 Halo Jump from C130 @ %2",(_this select 0),(_this select 1)];
}; 

systemchat format ["%1 Halo Jump from C130 @ %2",name (_this select 0),(_this select 1)]; 
if (WMS_exileToastMsg) then {["toastRequest", ["InfoTitleAndText", [format ["%1 is Halo Jumping!",name (_this select 0)]]]] call ExileServer_system_network_send_broadcast}; 
//[_vehic, _pos, _grp, _WPT_paradrop, _WPT_paradrop2] spawn {
	private _c130 = _vehic;
	waituntil  {_c130 distance2d _pos <= 1700}; 
	_c130 flyInHeight 400; 
	_c130 limitSpeed 200;
	systemchat format ["%1 Opening doors, get in position.",_c130]; 
 	if (WMS_exileToastMsg) then {["toastRequest", ["InfoTitleAndText", [format ["%1 Opening doors, get in position.",_c130]]]] call ExileServer_system_network_send_broadcast};
	_c130 animatesource	["door_2_2", 1];
	_c130 animatesource	["door_2_1",1];
	_c130 animatesource	["ramp",1];
	_c130 animatesource	["ramp_top",1];
	_c130 animatesource	["ramp_bottom",1];
	uisleep 35;
	systemchat format ["%1 Closing doors, paradrop mission done.",_c130]; 
 	if (WMS_exileToastMsg) then {["toastRequest", ["InfoTitleAndText", [format ["%1 Closing doors, paradrop done.",_c130]]]] call ExileServer_system_network_send_broadcast}; 
	_c130 limitSpeed 400;
	_c130 animatesource	["door_2_2", 0]; 
	_c130 animatesource	["door_2_1",0]; 
	_c130 animatesource	["ramp",0];
	_c130 animatesource	["ramp_top",0];
	_c130 animatesource	["ramp_bottom",0];
	uisleep (60+random 30);
	{deleteVehicle _x} forEach units _grp;
	deleteVehicle _c130;
	//[(_this select 2),[],[],[_WPT_paradrop,_WPT_paradrop2]] call WMS_fnc_lvl2_cleanup;
	[_grp,[],[],[_WPT_paradrop,_WPT_paradrop2]] call WMS_fnc_lvl2_cleanup;
	

//16:12:37   Error units: Type Number, expected Object,Side,Group
//16:12:37 File InfantryProgram\scripts\fn_lvl2_cleanUp.sqf..., line 13
//};