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

//[_target, _RandomPosSpawn, _artyChanceHE,rounds] spawn WMS_fnc_DynAI_arty;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[ARTY COUNTER]|WAK|TNA|WMS| _this = %1", _this]};
private ["_posTargetCounter","_O_Arty82mm"];
params[
	"_target",
	"_RandomPosSpawn",
	["_artyChanceHE",50,[0]],
	["_rounds", (2+random 4),[0]]
];
 _posTargetCounter = position _target;
playSound3D ["a3\dubbing_f\showcase_infantry\35_Mortars\showcase_infantry_35_mortars_BRA_0.ogg", _target, false, position _target, 2,1,0];
_O_Arty82mm = [_RandomPosSpawn, (0+random 359), "O_Mortar_01_F", OPFOR] call bis_fnc_spawnvehicle;
(_O_Arty82mm select 0) setVehicleAmmo 1;
(_O_Arty82mm select 0) setVehicleLock "LOCKEDPLAYER";
(_O_Arty82mm select 0) setUnloadInCombat [false, false];
(_O_Arty82mm select 0) allowCrewInImmobile true;
uisleep 3;
if((random 100) <= _artyChanceHE) then {
	_O_Arty82mm doArtilleryFire [_posTargetCounter, "8Rnd_82mm_Mo_shells", _rounds];
	uisleep 30;
	deletevehicle (_O_Arty82mm select 0);
{	deletevehicle _x} forEach units (_O_Arty82mm select 2);
} else {
	_O_Arty82mm doArtilleryFire [_posTargetCounter, "8Rnd_82mm_Mo_Smoke_white", _rounds];
	uisleep 30;
	deletevehicle (_O_Arty82mm select 0);
	{deletevehicle _x} forEach units (_O_Arty82mm select 2);
};