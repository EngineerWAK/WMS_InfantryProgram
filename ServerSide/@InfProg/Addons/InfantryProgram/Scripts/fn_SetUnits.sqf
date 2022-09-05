/**
* WMS_DFO_SetUnits - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//From AmbientLife
/*
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_setUnits _this %1', _this]};
private [];
params [
	"_units",
	["_options", []],
	["_skills",WMS_AL_Skills]
];
{
	//setSkill
	_x setSkill ["spotDistance", 	(_skills select 0)];
	_x setSkill ["spotTime", 		(_skills select 1)];
	_x setSkill ["aimingAccuracy", 	(_skills select 2)];
	_x setSkill ["aimingShake", 	(_skills select 3)];
	_x setSkill ["aimingSpeed", 	(_skills select 4)];
	_x setSkill ["reloadSpeed", 	(_skills select 5)];
	_x setSkill ["courage", 		(_skills select 6)];
	_x setSkill ["commanding", 		(_skills select 7)];
	_x setSkill ["general", 		(_skills select 8)];
	_x setVariable ["WMS_DFO_options",_options];
	_x allowFleeing 0;
	_x setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
	_x addEventHandler ["Killed", " 
	[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_UnitEH;
	"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
}forEach _units;
*/
///////////////

if (WMS_IP_LOGs) then {diag_log format ["[OPFOR AI SETUP]|WAK|TNA|WMS| _this = %1", _this]};
private ["_RealFuckingSide","_poptabs","_unit","_weapRandom","_weapRandomNoSnipNoMG","_mainWeap","_pistol","_expl1","_expl2","_expl3","_launcher","_sniper","_skills"];
params[
	["_units",[]],
	["_unitFunction","Assault"],
	["_launcherChance", 25],
	["_skill", 0.5],
	["_difficulty", "moderate"],
	["_loadout", "army"],
	["_weaps", WMS_Loadout_Assault],
	["_info", 'AMS'], //"AMS","DYNAI","whatever"
	["_options", []] //AL
];
//[_units,_unitFunction,_launcherChance,_skill,_loadout,_weaps,_info,_difficulty]; //OLD
//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
_weapRandom = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Weaps_HeavyBandit];
_weapRandomNoSnipNoMG = [WMS_Loadout_Assault, WMS_Loadout_Assault, WMS_Loadout_SMG, WMS_Loadout_DMR];
switch (toLower _loadout) do {
	case "civilian" : {_loadout = WMS_Loadout_Civilian; _weaps = WMS_Loadout_LightWeaps};
	case "bandit" 	: {_loadout = WMS_Loadout_Bandit; _weaps = WMS_Loadout_LightWeaps};
	case "heavybandit" 	: {_loadout = WMS_Loadout_HeavyBandit; _weaps = WMS_Weaps_HeavyBandit};
	case "army" 	: {_loadout = selectRandom [WMS_Loadout_M90d, WMS_Loadout_ABU, WMS_Loadout_MCB, WMS_Loadout_AOR1, WMS_Loadout_SURPAT]};
	case "abu" 		: {_loadout = WMS_Loadout_ABU;};
	case "m90d" 	: {_loadout = WMS_Loadout_M90d;};
	case "aor1" 	: {_loadout = WMS_Loadout_AOR1;};
	case "surpat" 	: {_loadout = WMS_Loadout_SURPAT;};
	case "blackops" : {_loadout = WMS_Loadout_MCB;};
	case "livonia" 	: {
						_loadout = WMS_Loadout_Livonia;
						_weaps = WMS_Weaps_LivoniaMix; 
						_weapRandom = [WMS_Weaps_LivoniaMix];
						_weapRandomNoSnipNoMG = [WMS_Weaps_LivoniaMix];
						};
	case "army_b" 		: {_Loadout = selectrandom [WMS_Loadout_AOR2, WMS_Loadout_M90, WMS_Loadout_Scorpion, WMS_Loadout_Tiger, WMS_Loadout_DEfleck]};
	case "aor2" 		: {_Loadout = WMS_Loadout_AOR2};
	case "m90" 			: {_Loadout = WMS_Loadout_M90};
	case "scorpion" 	: {_Loadout = WMS_Loadout_Scorpion};
	case "tiger" 		: {_Loadout = WMS_Loadout_Tiger};
	case "fleck"		: {_Loadout = WMS_Loadout_DEfleck};
};
_skills = [_skill,_difficulty]call WMS_fnc_AMS_ConvertSkills;
_sniper = [1,0.95,0.95,0.95];
_poptabs = 50;
{
	_unit = _x;
	removeAllItems _unit;
	removeAllWeapons _unit;
	removeBackpackGlobal _unit;
	removeUniform _unit;
	//
	_RealFuckingSide = _unit getVariable ["WMS_RealFuckingSide",OPFOR];
	if (_info == "AMS") then {_poptabs = (WMS_AMS_poptabsUnits select 0) + round (random(WMS_AMS_poptabsUnits select 1))};//for Exile Mod
	if (_info == "DYNAI") then {_poptabs = (WMS_DynAI_poptabsINF select 0) + round (random(WMS_DynAI_poptabsINF select 1))}; //for Exile Mod
	if (_info == "AL") then {_poptabs = (WMS_DynAI_poptabsINF select 0) + round (random(WMS_DynAI_poptabsINF select 1))}; //for Exile Mod
	switch (toLower _difficulty) do {
		case "easy"			: {_sniper = [1,0.8,0.9,0.8];};
		case "moderate" 	: {_poptabs = round _poptabs*1.5;_sniper = [1,0.85,0.85,0.85];};
		case "difficult" 	: {_poptabs = _poptabs*2;_sniper = [1,0.9,0.9,0.9];};
		case "hardcore" 	: {_poptabs = round _poptabs*2.5};
		case "static" 		: {_poptabs = round _poptabs*0.5}; //no static yet
	};
	//if (primaryWeapon _unit isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"]) then { 
	if ((primaryWeapon _unit) in WMS_AMS_sniperList) then {
		_unit setSkill ["spotDistance", (_sniper select 0)];
		_unit setSkill ["spotTime", 	(_sniper select 1)];
		_unit setSkill ["aimingAccuracy", 	(_sniper select 2)];
		_unit setSkill ["aimingShake", 	(_sniper select 3)];
		_unit setVariable ["WMS_skills",[(_sniper select 0),(_sniper select 1),(_sniper select 2),(_sniper select 3),(_skills select 4),(_skills select 5),(_skills select 5),(_skills select 6),(_skills select 8)],true]; //will be used for AI killfeed on player EH killed
		//_unit setName (selectRandom ["John McClane","John Rambo","Lucky Luke","Vasily Zaitsev","John Wick"]);
		_unit setName selectRandom [["John McClane","John","McClane"],["John Rambo","John","Rambo"],["Lucky Luke","Lucky","Luke"],["Vasily Zaitsev","Vasily","Zaitsev"],["John Wick","John","Wick"]];
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
			_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
			_pistol = [_unit, selectrandom (_weaps select 3), 2] call BIS_fnc_addWeapon;
			_unit additem selectRandom WMS_AI_grenades;
		};
		case  "random" : {
			_weaps = selectRandom _weapRandom;
			_mainWeap = [_unit, selectrandom (_weaps select 0), 5, 0] call BIS_fnc_addWeapon;
			_unit addPrimaryWeaponItem selectrandom (_weaps select 2);
			_pistol = [_unit, selectrandom (WMS_Loadout_Sniper select 3), 2] call BIS_fnc_addWeapon;
			_unit additem selectRandom WMS_AI_grenades;
		};
		case  "suicidebomber" : {
			_unit forceaddUniform selectrandom (_loadout select 0); 
			_unit addVest selectrandom (_loadout select 1);
			removeBackpackGlobal _unit;
			_unit addBackpack "B_Parachute";
		};
		case  "livoniapatrol" : {
			_mainWeap = [_unit, selectrandom (WMS_Weaps_LivoniaMix select 0), 5, 0] call BIS_fnc_addWeapon;
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_LivoniaMix select 2);
			_pistol = [_unit, selectrandom (WMS_Weaps_LivoniaMix select 3), 1] call BIS_fnc_addWeapon; 
			_unit addGoggles selectrandom (_loadout select 4);
			_unit additem selectRandom WMS_AI_grenades;
			_unit additem selectRandom WMS_AI_grenades;
			_unit additem selectRandom WMS_AI_grenades;
		};
		case  "heavybandit" : {
			_mainWeap = [_unit, selectrandom (WMS_Weaps_HeavyBandit select 0), 5, 0] call BIS_fnc_addWeapon;
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_HeavyBandit select 2);
			_pistol = [_unit, selectrandom (WMS_Weaps_HeavyBandit select 3), 1] call BIS_fnc_addWeapon; 
			_unit addGoggles selectrandom (_loadout select 4);
			_unit additem selectRandom WMS_AI_grenades;
			_unit additem selectRandom WMS_AI_grenades;
		};
		default {
			_mainWeap = [_unit, selectrandom (WMS_Loadout_Assault select 0), 5, 0] call BIS_fnc_addWeapon;
			_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Assault select 2);
			_pistol = [_unit, selectrandom (WMS_Loadout_Assault select 3), 2] call BIS_fnc_addWeapon;
		};
	};
	
	if (random 100 > 50) then {
		_unit addPrimaryWeaponItem (selectrandom WMS_AI_Attachements);
	};
	_items = (WMS_AI_Additems select 0) + round (random (WMS_AI_Additems select 1));
	for "_i" from 1 to _items do {
		_unit additem (selectRandom WMS_AI_inventory);
	};
////////////////AMS/DYNAI/WHATEVER CHANGES
	if (_info == "AMS") then {
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
		_unit addEventHandler ["Hit", {
			params ["_unit", "_source", "_damage", "_instigator"];
			if (isPlayer _instigator && {vehicle _instigator == _instigator}) then {
				_acc = _unit skill "aimingAccuracy";
				_unit setSkill ["aimingAccuracy", (_acc*0.8)];
			};
		}];
		_unit addEventHandler ["Killed", "
		[(_this select 0),(_this select 1),_unitFunction,_difficulty] call WMS_fnc_AMS_EHonKilled;	
		"];

	} else{
		if (_info == "DYNAI") then {
			if((random 100) <= _launcherChance) then { 
				_launcher = [_unit, selectrandom (WMS_AI_LaunchersOPF select 0), 1] call BIS_fnc_addWeapon;
			};
			if (WMS_DynAI_addPoptabsINF) then {
				_poptabs = (WMS_DynAI_poptabsINF select 0) + round (random(WMS_DynAI_poptabsINF select 1));
				_unit setVariable ["ExileMoney",_poptabs,true];
			};
			//////////EVENTHANDLER(s)//////////
			if (_RealFuckingSide == OPFOR || _RealFuckingSide == EAST) then { //yes it's the same but you never know
				_unit addEventHandler ["Hit", {
					params ["_unit", "_source", "_damage", "_instigator"];
					if (isPlayer _instigator && {vehicle _instigator == _instigator}) then {
						_acc = _unit skill "aimingAccuracy";
						_unit setSkill ["aimingAccuracy", (_acc*0.8)];
						//format ['Target Hit, %1', damage _unit] remoteexec ['SystemChat', (owner _instigator)]; //works but no damage number
						format ['Target Hit, %1', (_unit skill "aimingAccuracy")] remoteexec ['hint', (owner _instigator)]; //works but no damage number
					};
				}];
				/* NOPE
				_unit addEventHandler ["HitPart", {
					(_this select 2) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
					diag_log format ["[OPFOR AI HITPART][HEAD]|WAK|TNA|WMS| _this select 2 = %1", (_this select 2)];
					format ['HeadShot, %1', damage _target] remoteexec ['SystemChat', (owner _shooter)];
				}];
				*/
				_unit addEventHandler ["Killed", " 
					[(_this select 0),(_this select 1)] call WMS_fnc_DynAI_RwdMsgOnKill;
				"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
			} else { //Need a "PunishPunk call here"
				_unit addEventHandler ["killed", "
					if (WMS_DynAI_remRPG) then {(_this select 0) removeWeapon (secondaryWeapon (_this select 0))};
					if (isplayer (_this select 1) && (damage (_this select 1) < 0.9)) then {
						removeAllWeapons (_this select 0);
						deleteVehicle (_this select 0);
						(_this select 1) setdamage (damage(_this select 1)+0.15);
						private _msgx = format ['%2 is a Dick, he killed %1', name (_this select 0), name (_this select 1)];
						[_msgx] remoteexec ['SystemChat',0];
						private _sessionID = (_this select 1) getVariable ['ExileSessionID',''];
						[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['STOP doing that, Fat Fuck', '-15% heath']]] call ExileServer_system_network_send_to;
					};
				"];
			};
		} else{
			if (_info == "AL") then {

			} else{
				if (_info == "whatever") then {} else{};
			};
		};
	};
}forEach _units;