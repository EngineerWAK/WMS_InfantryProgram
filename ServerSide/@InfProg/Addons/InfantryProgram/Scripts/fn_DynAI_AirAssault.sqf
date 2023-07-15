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

//[_pos,_target,_skill,_loadout,_grpSize,_timer,_choppa1,_choppa2,_dist1,_dist2,_WPDist,_WPType,_WPBeha,_WPComb,_WPSpee] spawn WMS_fnc_DynAI_AirAssault;

if (WMS_IP_LOGs) then {diag_log format ["[AIR ASSAULT]|WAK|TNA|WMS| _this = %1", _this]};
private ["_posStart","_posLand","_Helipad","_gunship","_gunshipGRP","_vehic1","_transport","_transportGRP","_vehic2","_WPT_1","_WPT_1","_WPT_1b","_WPT_2b","_WPT_1c","_WPT_2c","_INFgrp"];
params[  
 "_pos", 
 ["_target", "Patrol"],  //not used yet, can use this to modify management _target = "Occupation";
 ["_skill", 0.65,[0]], //(0.4+(random 0.5)
 ["_loadout", "BlackOps", [""]],  
 ["_grpSize", 4,[0]],  
 ["_timer", 240, [0]],  
 ["_choppa1", ["B_Heli_Transport_01_F",[],[[],[]]], []],  
 ["_choppa2", ["O_Heli_Transport_04_covered_black_F",[],[[],[]]], []],  
 ["_dist1", 1800,[0]],  
 ["_dist2", 3000,[0]],  
 ["_WPDist", 250, [0]],  
 ["_WPType", "SAD", [""]],  
 ["_WPBeha", "COMBAT", [""]],  
 ["_WPComb", "RED", [""]],  
 ["_WPSpee", "NORMAL", [""]],
	["_difficulty", "difficult"]  
];  
 
_posStart = [_pos, _Dist1, _Dist2, 30, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;  
_posInfGrp = _posStart;
_posLand = _pos; 
_units = [];
for "_i" from 1 to _grpSize do {
	_units pushBack (selectRandom WMS_AI_Units_Class);
};
_HC1 = missionNameSpace getVariable ["WMS_HC1",false];
_HC1_ID = 2;
if (isDedicated && _HC1)then{
	{if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
if(surfaceIsWater _pos)then{
	_posLand = [_pos, 5, 350, 25, 1, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;  
	_posInfGrp = [_pos, 50, 200, 1, 1, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
}else{
	_posLand = [_pos, 5, 350, 25, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;  
	_posInfGrp = [_pos, 150, 300, 1, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
};
_Helipad = "Land_HelipadEmpty_F" createVehicle _posLand;  
uisleep 1;  
_gunship = [_posStart, (random 359), _choppa1 select 0, OPFOR] call bis_fnc_spawnvehicle; 
/*
//init texture
_VHLcountC1 = count (_choppa1 select 1);
if (_VHLcountC1 != 0) then {
	_VHLcount0 = (_choppa1 select 1 select 0);
	_VHLcount1 = (_choppa1 select 1 select 1);
	if ((_VHLcountC1 == 2) && {typeName _VHLcount0 == "STRING"} && {typeName _VHLcount1 == "SCALAR"}) then {[ _vehic, _VHLcount0] call BIS_fnc_initVehicle};
	if ((_VHLcountC1 == 2) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]};
	if ((_VHLcountC1 == 4) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _vehic setObjectTextureGlobal [(_choppa1 select 1 select 2),(_choppa1 select 1 select 3)]};
};*/ 
_gunshipGRP = _gunship select 2;  
_vehic1 = _gunship select 0;
_vehic1 lockDriver true;
_vehic1 setVehicleLock "LOCKEDPLAYER";
_vehic1 setUnloadInCombat [true, false];
_vehic1 allowCrewInImmobile true;
[(units _gunshipGRP), "SMG", 0, _skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits; //'SMG' won't be enough, need a specific "OccSMG" with EH
_WPT_1 = _gunshipGRP addWaypoint [_pos, 50];         
_WPT_1 setWaypointType "MOVE";  
_WPT_1 setwaypointSpeed "NORMAL";  
_WPT_1 setWaypointCombatMode "GREEN";  
_WPT_1 setWaypointbehaviour  "SAFE"; 
  
waitUntil  {(_vehic1 distance2D _posStart) > 800};
 
_WPT_2 = _gunshipGRP addWaypoint [_pos, 150];         
_WPT_2 setWaypointType "SENTRY";  
_WPT_2 setwaypointSpeed "LIMITED";  
_WPT_2 setWaypointCombatMode "RED";  
_WPT_2 setWaypointbehaviour  "COMBAT";   
  
_transport = [_posStart, (random 359), _choppa2 select 0, OPFOR] call bis_fnc_spawnvehicle;
_transportGRP = _transport select 2;  
_vehic2 = _transport select 0;
_vehic2 lockDriver true;
_vehic2 setVehicleLock "LOCKEDPLAYER";
//_vehic2 setUnloadInCombat [true, false];
//_vehic2 allowCrewInImmobile true;
[(units _transportGRP), "SMG", 0, (0.5+(random 0.4)),_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;  //'SMG' won't be enough, need a specific "OccSMG" with EH
  
_WPT_1b = _transportGRP addWaypoint [_posLand, 25];  
_WPT_1b setWaypointType "TR UNLOAD";  
_WPT_1b setwaypointSpeed "NORMAL";  
_WPT_1b setWaypointCombatMode "BLUE";  
_WPT_1b setWaypointbehaviour  "CARELESS"; 

uisleep 1;
_INFgrp = [_posInfGrp, EAST, _units] call BIS_fnc_spawnGroup;
{ 
 _x moveInCargo _vehic2; 
}forEach units _INFgrp;

uisleep 1; 
[(units _INFgrp), "Random", 15, _skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits; //'Random' won't be enough, need a specific "OccRandom" with EH
//uisleep 1;

		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			if (true) then {diag_log format ["[WMS_fnc_DynAI_AirAssault]|WMS|TNA|WAK| Offloading group to HC1, ID = %1, group = %2", _HC1_ID, _INFgrp]};
			_INFgrp setGroupOwner _HC1_ID;
			[(units _INFgrp), "Random", 15, _skill,_difficulty,_loadout,nil,"DYNAI"] remoteExec ["WMS_fnc_SetUnits",_HC1_ID];
			if (WMS_DynAI_Steal) then { //CBA create a FUCKING waypoint at _posStart so those morons run ALL THE WAY BACK to there
				[units _INFgrp, _pos, _WPDist, 4, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] remoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID];
			} else {
				[units _INFgrp, _pos, _WPDist, 4, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]] remoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID]; //NEW //if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal};
			};
			uisleep 3;
		}else{
			[(units _INFgrp), "Random", 15, _skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
			if (WMS_DynAI_Steal) then { //CBA create a FUCKING waypoint at _posStart so those morons run ALL THE WAY BACK to there
				[_INFgrp, _pos, _WPDist, 4, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
			} else {
				[_INFgrp, _pos, _WPDist, 4, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol; //NEW //if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal};
			}; 
			uisleep 3;
			deleteWaypoint [_INFgrp, 0];
		};

//uisleep 3;
//deleteWaypoint [_INFgrp, 0]; //CBA create a FUCKING waypoint at _posStart so those morons run ALL THE WAY BACK to there
_WPT_2b = _transportGRP addWaypoint [[-1000,-1000,0], 150];  
_WPT_2b setWaypointType "MOVE";    

_AirAssaultData = [time,(time+_timer),[_INFgrp,_gunshipGRP,_transportGRP],[_vehic1,_vehic2],[_Helipad],[],[_WPT_1,_WPT_2,_WPT_1b,_WPT_2b],""];
WMS_DynAI_Running pushback _AirAssaultData;

_AirAssaultData //probably doesnt work in "spawn"