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

//[player,_timer] spawn WMS_fnc_AMS_Annihilator
private ["_pos","_posStart","_posStop","_planeFull","_plane","_grp","_unit","_laserT","_wpt1","_posUAV"];
params[  
	"_ref", 
	["_timer", 120, [0]]
	];

if (WMS_IP_LOGs) then {diag_log format ["[AMS ANNIHILATOR]|WAK|TNA|WMS| _this = %1", _this]};
_pos = GetPosATL _ref;
//private _target = _pos nearObjects ["building", 150] select 0;
//systemchat format [str (TypeOf _target)];
[format ['%1 Killed a VIP, Sending Annihilator', (name _ref)]] remoteExecCall ['SystemChat',_ref];
_posStart = [_pos, 3000, 5000, 0, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; 
_posStop = [_pos, 2000, 5000] call BIS_fnc_findSafePos; 
_posUAV = [_pos, 300, 800] call BIS_fnc_findSafePos;
_planeFull = [_posStart, (random 359), "O_Plane_CAS_02_F", EAST] call bis_fnc_spawnvehicle;  //O_UAV_01_F
_plane = (_planeFull select 0); 
_grp = (_planeFull select 2); 
_unit = leader _grp; 
_UAVFull = [_posUAV, (random 359), "O_UAV_01_F", EAST] call bis_fnc_spawnvehicle;
_UAV = (_UAVFull select 0);
_UAVgrp = (_UAVFull select 2);
_UAV flyInHeight 500; 
_laserT = createVehicle ["LaserTargetE", _pos, [], 0, "NONE"]; 
_laserT attachto [_ref, [0, 0, 0]];
//systemchat format [str (TypeOf _laserT)]; 
_unit disableAI "AUTOTARGET"; 
_unit allowFleeing 0;
_unit setSkill 1; 
_plane setUnloadInCombat [false,false];

_UAVwpt = _UAVgrp addWaypoint [_pos, 250];         
_UAVwpt setWaypointType "SAD";   
_UAVwpt setwaypointSpeed "FULL";   
_UAVwpt setWaypointCombatMode "RED";   
_UAVwpt setWaypointbehaviour "COMBAT";
{  
	_x disableAI "AUTOTARGET"; 
	_x allowFleeing 0;
	_x setSkill 1; 
	_x selectWeapon "Laserdesignator_mounted";
	_x doWatch (vehicle _ref); 
	_x doTarget (vehicle _ref);
	_x commandFire (vehicle _ref);
}foreach units _UAVgrp;

_wpt1 = _grp addWaypoint [_pos, 250];         
_wpt1 setWaypointType "SAD";   
_wpt1 setwaypointSpeed "FULL";   
_wpt1 setWaypointCombatMode "RED";   
_wpt1 setWaypointbehaviour "COMBAT"; 
_unit selectWeapon "Missile_AGM_01_Plane_CAS_02_F";
_unit doWatch _laserT; 
_unit doTarget _laserT;
_unit commandFire _laserT;
[format ["Annihilator Locked on %1, Target %2m Away", (name _ref),(_plane distance2D _ref)]] remoteExecCall ['SystemChat',_ref];
WMS_DynAI_Running pushback [time,(time+_timer),[_grp,_UAVgrp],[_unit,_laserT,_UAV],[],[],[_wpt1,_UAVwpt],""];
 
waitUntil {_plane aimedAtTarget [_laserT] > 0.4};
[format ["Annihilator Report: Bomb: %1, 30mm: %2, AP: %3, AGM: %4", (_plane aimedAtTarget [_laserT,"Bomb_03_Plane_CAS_02_F"]), (_plane aimedAtTarget [_laserT,"Cannon_30mm_Plane_CAS_02_F"]), (_plane aimedAtTarget [_laserT,"Rocket_03_AP_Plane_CAS_02_F"]), (_plane aimedAtTarget [_laserT,"Missile_AGM_01_Plane_CAS_02_F"])]] remoteExecCall ['SystemChat',_ref];
/*systemchat format [str (_plane aimedAtTarget [_laserT])];
systemchat format [str (canFire _plane)];
systemchat format ["Bomb: %1", (_plane aimedAtTarget [_laserT,"Bomb_03_Plane_CAS_02_F"])];
systemchat format ["30mm: %1", (_plane aimedAtTarget [_laserT,"Cannon_30mm_Plane_CAS_02_F"])];
systemchat format ["AP: %1", (_plane aimedAtTarget [_laserT,"Rocket_03_AP_Plane_CAS_02_F"])];
systemchat format ["AGM: %1", (_plane aimedAtTarget [_laserT,"Missile_AGM_01_Plane_CAS_02_F"])];*/  
 
//_unit forceWeaponFire ["Missile_AGM_01_Plane_CAS_02_F",0];
_unit forceWeaponFire [currentMuzzle _unit,currentMuzzle _unit];
[format ["%2 READY TO FIRE! RIP %1", (name _ref), _unit]] remoteExecCall ['SystemChat',_ref];
 
 /*private _wpt2 = _grp addWaypoint [_posStop, 250];         
 _wpt2 setWaypointType "MOVE"; 
 _wpt2 setwaypointSpeed "FULL"; 
 _wpt2 setWaypointCombatMode "GREEN"; 
 _wpt2 setWaypointbehaviour  "SAFE";*/ 
 /*
 _wpt1 setWaypointType "MOVE";  
 _wpt1 setwaypointSpeed "FULL"; 
 _wpt1 setWaypointCombatMode "GREEN"; 
 _wpt1 setWaypointbehaviour  "SAFE";
 _unit doMove _posStop;*/
