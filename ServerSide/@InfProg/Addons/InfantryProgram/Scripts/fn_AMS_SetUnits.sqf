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
*/////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//AMS_SETUNITS IS NOT CALLED ANYMORE, SEE WMS_fnc_SetUnits////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/*
[
	[_units], 			// the Unit to set
	_unitFunction,			// Unit options // "BunkerMG", "Assault", "random"
	_launcherChance,// 0~100 chance
	_skill,			// 0.1~1
	_difficulty,
	_loadout,		// loadOut type, "bandit", "army", "civilian" or "BlackOps"
	_weaps
	] call WMS_fnc_AMS_SetUnits;

*/
if (WMS_IP_LOGs) then {diag_log format ["[AMS AI SETUP]|WAK|TNA|WMS| _this = %1", _this]};
private ["_skills","_poptabs","_unit","_weapRandom","_weapRandomNoSnipNoMG","_mainWeap","_pistol","_launcher","_sniper"];
params[
	["_units",[]],
	["_unitFunction","Assault"],
	["_launcherChance", 25],
	["_skill", 0.5],
	["_difficulty", "Hardcore"],
	["_loadout", "army"],
	["_weaps", WMS_Weaps_HeavyBandit],
	["_info", 'AMS'] //"AMS","DYNAI","whatever"
];
_weapRandom = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Weaps_HeavyBandit];
_weapRandomNoSnipNoMG = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_DMR];
switch (toLower _loadout) do {
	case "civilian" 	: {_loadout = WMS_Loadout_Civilian; _weaps = WMS_Loadout_LightWeaps};
	case "bandit" 		: {_loadout = WMS_Loadout_Bandit; _weaps = WMS_Loadout_LightWeaps};
	case "heavybandit" 	: {_loadout = WMS_Loadout_HeavyBandit; _weaps = WMS_Weaps_HeavyBandit};
	case "army" 		: {_loadout = selectRandom [WMS_Loadout_M90d, WMS_Loadout_ABU, WMS_Loadout_MCB, WMS_Loadout_SURPAT, WMS_Loadout_AOR1]};
	case "abu" 			: {_loadout = WMS_Loadout_ABU;};
	case "m90d" 		: {_loadout = WMS_Loadout_M90d;};
	case "aor1" 		: {_loadout = WMS_Loadout_AOR1;};
	case "surpat" 		: {_loadout = WMS_Loadout_SURPAT;};
	case "blackops" 	: {_loadout = WMS_Loadout_MCB;};
	case "livonia" 		: {
							_loadout = WMS_Loadout_Livonia;
							_weaps = WMS_Weaps_LivoniaMix; 
							_weapRandom = [WMS_Weaps_LivoniaMix];
							_weapRandomNoSnipNoMG = [WMS_Weaps_LivoniaMix];
						};
};
_skills = [_skill,_difficulty]call WMS_fnc_AMS_ConvertSkills;
_sniper = [1,0.95,0.95,0.95];
_mainWeap = objNull;
{
_unit = _x;
removeAllItems _unit;
removeAllWeapons _unit;
removeBackpackGlobal _unit;
removeUniform _unit;
//
_poptabs = (WMS_AMS_poptabsUnits select 0) + round (random(WMS_AMS_poptabsUnits select 1)); //for Exile Mod
switch (toLower _difficulty) do {
	case "easy"			: {_sniper = [1,0.8,0.9,0.8];};
	case "moderate" 	: {_poptabs = round _poptabs*1.5;_sniper = [1,0.85,0.85,0.85];};
	case "difficult" 	: {_poptabs = _poptabs*2;_sniper = [1,0.9,0.9,0.9];};
	case "hardcore" 	: {_poptabs = round _poptabs*2.5};
	case "static" 		: {_poptabs = round _poptabs*0.5};
};
_unit forceaddUniform selectrandom (_loadout select 0); 
_unit addVest selectrandom (_loadout select 1); 
_unit addHeadGear selectrandom (_loadout select 2);
_unit addBackpack selectrandom (_loadout select 3);
_unit additem "FirstAidKit";
//_unit setVariable ["AMS_AdjustedSkills",WMS_AMS_AdjustedSkills]; //not used yet

switch (toLower _unitFunction) do {
	case  "bunkermg" : {
		_unit disableAI "PATH"; 
		_unit setUnitPos "MIDDLE";
		_mainWeap = [_unit, selectrandom (WMS_Loadout_MG select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_MG select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
	};
	case  "assault" : {
		_mainWeap = [_unit, selectrandom (WMS_Loadout_Assault select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Assault select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
		_unit additem selectRandom WMS_AI_grenades;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "mg" : {
		_mainWeap = [_unit, selectrandom (WMS_Loadout_MG select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_MG select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_MG select 3), 2] call BIS_fnc_addWeapon;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "smg" : {
		_mainWeap = [_unit, selectrandom (WMS_Loadout_SMG select 0), 5, 0] call BIS_fnc_addWeapon;
		_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_SMG select 2);
		_pistol = [_unit, selectrandom (WMS_Loadout_SMG select 3), 2] call BIS_fnc_addWeapon;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "para" : {
		_weaps = selectRandom _weapRandomNoSnipNoMG;
		removeBackpackGlobal _unit;
		_unit addBackpack "B_Parachute";
		_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
		if (_mainWeap in WMS_AMS_sniperList) then {
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2);
		}else{
			_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
		};
		_pistol = [_unit, selectrandom (_weaps select 3), 2] call BIS_fnc_addWeapon;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "random" : {
		_weaps = selectRandom _weapRandom;
		_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
		if (_mainWeap in WMS_AMS_sniperList) then {
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2);
		}else{
			_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
		};
		_pistol = [_unit, selectrandom (WMS_Loadout_Sniper select 3), 2] call BIS_fnc_addWeapon;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "livoniapatrol" : {
		_mainWeap = [_unit, selectrandom (WMS_Weaps_LivoniaMix select 0), 5, 0] call BIS_fnc_addWeapon;
		if (_mainWeap in WMS_AMS_sniperList) then {
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2);
		}else{
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_LivoniaMix select 2);
		};
		_pistol = [_unit, selectrandom (WMS_Weaps_LivoniaMix select 3), 1] call BIS_fnc_addWeapon; 
		_unit addGoggles selectrandom (_loadout select 4);
		_unit additem selectRandom WMS_AI_grenades;
		_unit additem selectRandom WMS_AI_grenades;
		_unit additem selectRandom WMS_AI_grenades;
	};
	case  "heavybandit" : {
		_mainWeap = [_unit, selectrandom (WMS_Weaps_HeavyBandit select 0), 5, 0] call BIS_fnc_addWeapon;
		if (_mainWeap in WMS_AMS_sniperList) then {
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2);
		}else{
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_HeavyBandit select 2);
		};
		_pistol = [_unit, selectrandom (WMS_Weaps_HeavyBandit select 3), 1] call BIS_fnc_addWeapon; 
		_unit addGoggles selectrandom (_loadout select 4);
		_unit additem selectRandom WMS_AI_grenades;
		_unit additem selectRandom WMS_AI_grenades;
	};
	default {
		_mainWeap = [_unit, selectrandom (WMS_Loadout_Assault select 0), 5, 0] call BIS_fnc_addWeapon;
		if (_mainWeap in WMS_AMS_sniperList) then {
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2);
		}else{
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Assault select 2);
		};
		_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
	};
};

//if (primaryWeapon _unit isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"]) then { 
if (_mainWeap in WMS_AMS_sniperList) then {
	_unit setSkill ["spotDistance", (_sniper select 0)];
	_unit setSkill ["spotTime", 	(_sniper select 1)];
	_unit setSkill ["aimingAccuracy", 	(_sniper select 2)];
	_unit setSkill ["aimingShake", 	(_sniper select 3)];
	_unit setVariable ["WMS_skills",[(_sniper select 0),(_sniper select 1),(_sniper select 2),(_sniper select 3),(_skills select 4),(_skills select 5),(_skills select 5),(_skills select 6),(_skills select 8)],true]; //will be used for AI killfeed on player EH killed
	//_unit setName selectRandom ["John McClane","John Rambo","Lucky Luke","Vasily Zaitsev","John Wick"];
	_unit setName selectRandom [["John McClane","John","McClane"],["John Rambo","John","Rambo"],["Lucky Luke","Lucky","Luke"],["Vasily Zaitsev","Vasily","Zaitsev"],["John Wick","John","Wick"]];
	if (true) then {diag_log format ["[AMS AI SETUP]|WAK|TNA|WMS|We Got A Sniper Here! %1, %2", (name _unit), (primaryWeapon _unit)]};
} else {
	_unit setSkill ["spotDistance", (_skills select 0)];
	_unit setSkill ["spotTime", 	(_skills select 1)];
	_unit setSkill ["aimingAccuracy", 	(_skills select 2)];
	_unit setSkill ["aimingShake", 	(_skills select 3)];
	_unit setVariable ["WMS_skills",_skills,true]; //will be used for AI killfeed on player EH killed
};
_unit setSkill ["aimingSpeed", 	(_skills select 4)];
_unit setSkill ["reloadSpeed", 	(_skills select 5)];
_unit setSkill ["courage", 		(_skills select 6)];
_unit setSkill ["commanding", 	(_skills select 7)];
_unit setSkill ["general", 		(_skills select 8)];
_unit setVariable ["WMS_Difficulty",_difficulty, true]; //will be used for AI killfeed on player EH killed
_unit allowFleeing 0;
//
	
if (random 100 > 50) then {
	_unit addPrimaryWeaponItem (selectrandom WMS_AI_Attachements);
};
_items = (WMS_AI_Additems select 0) + round (random (WMS_AI_Additems select 1));
for "_i" from 1 to _items do {
	_unit additem (selectRandom WMS_AI_inventory);
};

if((random 100) <= _launcherChance) then { 
	if(WMS_AMS_AllowMissiles) then {
		_launcher = [_unit, selectrandom ((WMS_AI_LaunchersOPF select 0)+(WMS_AI_LaunchersOPF select 1)+(WMS_AI_LaunchersOPF select 2)), 2] call BIS_fnc_addWeapon;
	} else {
		_launcher = [_unit, selectrandom (WMS_AI_LaunchersOPF select 0), 1] call BIS_fnc_addWeapon;
	};
};
if (WMS_AMS_addPoptabsUnits) then {
	_unit setVariable ["ExileMoney",(floor _poptabs),true];
};
//////////EVENTHANDLER(s)//////////
_unit addEventHandler ["Killed", "
		[(_this select 0),(_this select 1),(_this select 2),_unitFunction,_difficulty] call WMS_fnc_AMS_EHonKilled;	
"];
}forEach _units;