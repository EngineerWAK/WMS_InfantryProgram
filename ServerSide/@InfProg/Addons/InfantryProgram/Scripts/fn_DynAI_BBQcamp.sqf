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

// [[0,0,0],120, 2+random 2,50,(0.3+(random 0.55)),"bandit"] call WMS_fnc_DynAI_BBQcamp;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAI BBQ Camp]|WAK|TNA|WMS| _this = %1", _this]};
private ["_unitsClass","_safePos","_safePos2","_grps","_InfGrp_O","_fire"];
params[
	"_pos",
	["_timer", 300],
	["_AIcount", (3+random 2)],
	["_launcherChance", 20],
	["_skill", (0.2+random 0.4)],
	["_loadout", "bandit"],
 	["_difficulty", "difficult"]
];
_safePos = [_pos, 0, 25, 2, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
_grps = [];
_unitsClass = selectRandom WMS_AI_Units_Class;
_HC1 = missionNameSpace getVariable ["WMS_HC1",false];
_HC1_ID = 2;
if (isServer && _HC1)then{
	{if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
/////BBQ Object(s)
_fire = createVehicle ["Campfire_burning_F", _safePos, [], 0, "NONE"];
_flag = createVehicle [WMS_OPFOR_Flag, _safePos, [], 5, "NONE"];
/////Bandits OPFOR
_InfGrp_O = createGroup [OPFOR, false];
_grps pushBack _InfGrp_O;
for "_i" from 1 to _AIcount do {
		_unitsClass createUnit [
		_safePos, 
		_InfGrp_O
	];
uisleep 0.1;
};
[(units _InfGrp_O),'Assault',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;

		if (isServer && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			if (true) then {diag_log format ["[WMS_fnc_DynAI_BBQcamp]|WMS|TNA|WAK| Offloading group to HC1, ID = %1, group = %2", _HC1_ID, _InfGrp_O]};
			_InfGrp_O setGroupOwner _HC1_ID;
			//{_x setGroupOwner _HC1_ID}forEach units _InfGrp_O;
			[units _InfGrp_O, _safePos, 10, 3, "SENTRY", "SAFE", "RED", "NORMAL", "DIAMOND", "", [1,2,3]] remoteExec ["WMS_fnc_RemoteTaskPatrol",_HC1_ID];
		}else{
			[_InfGrp_O, _safePos, 10, 3, "SENTRY", "SAFE", "RED", "NORMAL", "DIAMOND", "", [1,2,3]] call CBA_fnc_taskPatrol;
		};

WMS_DynAI_Running pushback [time,(time+(_timer)),_grps,[],[_fire,_flag],[],[],""];
