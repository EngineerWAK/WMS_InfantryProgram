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

// [[0,0,0],_radius,120, 2+random 2,50,(0.3+(random 0.55)),"bandit"] call WMS_fnc_DynAI_BuildingGuards;
//[_pos,_radius,_timer,_grpSize,_launcherChance,_skill,_loadout] spawn WMS_fnc_DynAI_BuildingGuards;
//[(position thisTrigger),100,120,(2+round(random 2)),10,(0.3+(random 0.55)),(selectRandom ['bandit','army'])] spawn WMS_fnc_DynAI_BuildingGuards;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAI BUILDING GUARDS]|WAK|TNA|WMS| _this = %1", _this]};
private ["_posList","_grps","_InfGrp_O","_grpSTR","_number","_sound"];
params[
	"_pos",
	["_radius", 75],
	["_timer", 120],
	["_AIcount", (2+round(random 2))],
	["_launcherChance", 25],
	["_skill", (0.3+random 0.6)],
	["_loadout", "army"],
 	["_difficulty", "difficult"]
];
_posList = [];
_grps = [];
_HC1 = missionNameSpace getVariable ["WMS_HC1",false];
_HC1_ID = 2;
if (isDedicated && _HC1)then{
	{if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
/////
if (count (_pos nearObjects ["Building", _radius]) > 0) then {
	_posList = [nearestBuilding _pos] call BIS_fnc_buildingPositions;
} else {
	_pos = [_pos, 0, 30, 1, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
};
/////Bandits OPFOR
	_InfGrp_O = createGroup [OPFOR, false];
	_grps pushBack _InfGrp_O;
	for "_i" from 1 to _AIcount do {
		if (count _posList >= 1) then { _pos = selectRandom _posList};
			(selectRandom WMS_AI_Units_Class) createUnit [
			_pos, 
			_InfGrp_O
		];
	uisleep 0.1;
	};
	
	if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
		if (true) then {diag_log format ["[WMS_fnc_DynAI_BuildingGuards]|WMS|TNA|WAK| Offloading group to HC1, ID = %1, group = %2, pos = %3", _HC1_ID, _InfGrp_O,_pos]};
		_InfGrp_O setGroupOwner _HC1_ID;
		[(units _InfGrp_O),'Assault',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] remoteExec ["WMS_fnc_SetUnits",_HC1_ID];
		if (WMS_DynAI_Steal) then {
			[units _InfGrp_O, _Pos, 25, 4, "SENTRY", "STEALTH", "YELLOW", "NORMAL", "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] remoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID];
		} else {
			[units _InfGrp_O, _Pos, 25, 4, "SENTRY", "STEALTH", "YELLOW", "NORMAL", "COLUMN", "", [1,2,3]] remoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID];
		};
	}else{
		[(units _InfGrp_O),'Assault',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
		if (WMS_DynAI_Steal) then {
			[_InfGrp_O, _Pos, 25, 4, "SENTRY", "STEALTH", "YELLOW", "NORMAL", "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
		} else {
			[_InfGrp_O, _Pos, 25, 4, "SENTRY", "STEALTH", "YELLOW", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};
	};
	WMS_CustomTrig_LastT = time;
	WMS_trig_Glob_LastT = time;
if (WMS_DynAI_RdoChatter && !(WMS_FastCombat)) then {
	_number = selectRandom [12,11,2,1,6,8];
	_sound = format ["A3\sounds_f\sfx\radio\ambient_radio%1.wss",_number];
	playSound3D [_sound, player, false, _pos, 2, 1, 0];
};
_grpSTR = format ["%1", _InfGrp_O]; //keep the group name in case <NULL-group>
WMS_DynAI_Running pushback [time,(time+(_timer)),_grps,[],[],[],[],_grpSTR];