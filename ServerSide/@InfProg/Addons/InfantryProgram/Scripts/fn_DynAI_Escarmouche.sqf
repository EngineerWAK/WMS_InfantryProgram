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

// [[0,0,0],120, 2+random 2,50,(0.3+(random 0.55)),"bandit"] call WMS_fnc_DynAI_Escarmouche;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAI ESCARMOUCHE]|WAK|TNA|WMS| _this = %1", _this]};
private ["_safePos","_safePos2","_grps","_InfGrp_O","_InfGrp_B"];
params[
	"_pos",
	["_timer", 120],
	["_AIcount", (2+random 2)],
	["_launcherChance", 10],
	["_skill", (0.2+random 0.4)],
	["_loadout", "bandit"],
 	["_difficulty", "moderate"]
];
_safePos = [_pos, 5, 50, 3, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
_safePos2 = [_safePos, 30, 75, 3, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
_grps = [];
/////Bandits OPFOR
_InfGrp_O = createGroup [OPFOR, false];
_grps pushBack _InfGrp_O;
for "_i" from 1 to _AIcount do {
	"O_Soldier_F" createUnit [
		_safePos, 
		_InfGrp_O
	];
	uisleep 0.1;
};
{_x setVariable ["WMS_RealFuckingSide",OPFOR]}foreach units _InfGrp_O;
[(units _InfGrp_O),'Assault',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
[_InfGrp_O, _Pos, 75, 3, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
/////Civilians BLUFOR
_InfGrp_B = createGroup [BLUFOR, false];
_grps pushBack _InfGrp_B;
for "_i" from 1 to _AIcount do {
	"B_Soldier_F" createUnit [
		_safePos2, 
		_InfGrp_B
	];
	uisleep 0.1;
};
{_x setVariable ["WMS_RealFuckingSide",BLUFOR]}foreach units _InfGrp_B;
//[units _InfGrp_B,'Assault',_launcherChance,_skill,'civilian'] call WMS_fnc_DynAI_SetUnitBLU;
//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
[units _InfGrp_B,'Assault',_launcherChance,_skill,nil,'civilian',nil,"DYNAI"] call WMS_fnc_SetUnits;
[_InfGrp_B, _Pos, 75, 3, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;

WMS_DynAI_Running pushback [time,(time+(_timer)),_grps,[],[],[],[],""];
