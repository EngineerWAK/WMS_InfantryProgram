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
[
	_x, 			// the Unit to set
	"MG",			// Unit options // "BunkerMG", "Assault"
	_launcherChance,// 0~100 chance
	_skill,			// 0.1~1
	_loadout		// loadOut type, "bandit", "army" or "civilian"
	] call WMS_fnc_DynAI_SetAI;

*/
if (WMS_IP_LOGs) then {diag_log format ["[BLUFOR AI SETUP]|WAK|TNA|WMS| _this = %1", _this]};
private ["_mainWeap","_pistol","_weapRandom"];
params[
	"_units", //[]
	["_unitFunction","Assault",[""]],
	["_launcherChance", 25,[0]],
	["_skill", 0.5,[0]],
	["_difficulty", "moderate"],
	["_loadout", "AOR2",[""]],
	["_weaps", WMS_Loadout_Assault],
	["_info", 'AMS'], //"AMS","DYNAI","whatever"
	["_options", []] //AL
];
//[_units,_unitFunction,_launcherChance,_skill,_loadout,_weaps,_info,_difficulty]; //OLD
//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
switch _loadout do { //"civilian","bandit","army","AOR2","M90","scorpion","tiger","fleck"
	case "civilian" : {_loadout = WMS_Loadout_Civilian; _weaps = WMS_Loadout_LightWeaps};
	case "bandit" : {_loadout = WMS_Loadout_Bandit; _weaps = WMS_Loadout_LightWeaps};
	case "army_b" : {_Loadout = selectrandom [WMS_Loadout_AOR2, WMS_Loadout_M90, WMS_Loadout_Scorpion, WMS_Loadout_Tiger, WMS_Loadout_DEfleck]};
	case "AOR2" : {_Loadout = WMS_Loadout_AOR2};
	case "M90" : {_Loadout = WMS_Loadout_M90};
	case "scorpion" : {_Loadout = WMS_Loadout_Scorpion};
	case "tiger" : {_Loadout = WMS_Loadout_Tiger};
	case "fleck" : {_Loadout = WMS_Loadout_DEfleck};
};
if (WMS_IP_LOGs) then {diag_log format ["[BLUFOR AI SETUP]|WAK|TNA|WMS| _units = %1", _units]};
_weapRandom = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_SMG, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper];
_weapRandomNoSnipNoMG = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_DMR];
{
	_unit = _x;
_unit setSkill _skill;
_unit allowFleeing 0;
removeAllItems _unit;
removeAllWeapons _unit;
removeBackpackGlobal _unit; 
_unit forceaddUniform selectrandom (_loadout select 0); 
_unit addVest selectrandom (_loadout select 1); 
_unit addHeadGear selectrandom (_loadout select 2); 
_unit addBackpack selectrandom (_loadout select 3); 
_unit additem "FirstAidKit";
_unit addGoggles "G_Balaclava_oli";
switch (_unitFunction) do { //"BunkerMG","Assault","SMG","Para","Random","SuicideBomber"
	case  "BunkerMG" : {
		_unit disableAI "PATH"; 
		_unit setUnitPos "MIDDLE";
		_mainWeap = [_unit, selectrandom (WMS_Loadout_MG select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_MG select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "Assault" : {
		_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "SMG" : {
		_mainWeap = [_unit, selectrandom (WMS_Loadout_SMG select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_SMG select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_SMG select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "Para" : {
		_weaps = selectRandom _weapRandomNoSnipNoMG;
		removeBackpackGlobal _unit;
		_unit addBackpack "B_Parachute";
		_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
		_pistol = [_unit, selectrandom (_weaps select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "Random" : {
		_weaps = selectRandom _weapRandom;
		_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_Sniper select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "SuicideBomber" : {
	};
};

if((random 100) <= _launcherChance) then { private _launcher = [_unit, selectrandom ["BWA3_PzF3_Tandem_Loaded","BWA3_Bunkerfaust_Loaded","BWA3_RGW90_Loaded"], 1] call BIS_fnc_addWeapon;};
	_unit addEventHandler ["killed", "
	if (WMS_DynAI_remRPG) then {(_this select 0) removeWeapon (secondaryWeapon (_this select 0))};
	if (isplayer (_this select 1) && (damage (_this select 1) < 0.9)) then {
		removeAllWeapons (_this select 0);
		deleteVehicle (_this select 0);
		(_this select 1) setdamage (damage(_this select 1)+0.15);
		private _msgx = format ['%2 is a Dick, he killed %1', (_this select 0), (_this select 1)];
		[_msgx] remoteexec ['SystemChat',0];
		private _sessionID = (_this select 1) getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['STOP doing that, Dick!', '-15% heath']]] call ExileServer_system_network_send_to;
	};
"];
}forEach _units;