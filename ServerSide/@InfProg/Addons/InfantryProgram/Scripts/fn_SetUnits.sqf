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
	case "diver" 	: {_loadout = WMS_Loadout_Diver;};
	case "scientist": {_loadout = WMS_Loadout_Scientist;};//not ready yet
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
_sniper = WMS_AMS_skillsniper; //[1,0.95,0.95,0.95]
_mainWeap = objNull;
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
		case "easy"			: {_sniper = [(_sniper select 0),((_sniper select 1)-0.15),((_sniper select 2)-0.15),((_sniper select 3)-0.15)];};//[1,0.8,0.9,0.8]
		case "moderate" 	: {_poptabs = round _poptabs*1.5;_sniper = [(_sniper select 0),((_sniper select 1)-0.1),((_sniper select 2)-0.1),((_sniper select 3)-0.1)];};//[1,0.85,0.85,0.85]
		case "difficult" 	: {_poptabs = _poptabs*2;_sniper = [(_sniper select 0),((_sniper select 1)-0.05),((_sniper select 2)-0.05),((_sniper select 3)-0.05)];};//[1,0.9,0.9,0.9]
		case "hardcore" 	: {_poptabs = round _poptabs*2.5};
		case "static" 		: {_poptabs = round _poptabs*0.5}; //no static yet
	};
	if(WMS_ForceDiverOverWater && {surfaceIsWater (position _unit)})then{
		_unit forceaddUniform selectrandom (WMS_Loadout_Diver select 0); 
		_unit addVest selectrandom (WMS_Loadout_Diver select 1);
		_unit addHeadGear selectrandom (WMS_Loadout_Diver select 2);
		_unit addBackpack selectrandom (WMS_Loadout_Diver select 3);
		_weapRandomNoSnipNoMG = [WMS_Weaps_Diver];
		_unit addGoggles selectrandom (WMS_Loadout_Diver select 4);
		if(_unitFunction != "para" || _unitFunction != "suicidebomber" || _unitFunction != "diver" )then{_unitFunction = "diver"};
	}else{
		_unit forceaddUniform selectrandom (_loadout select 0); 
		_unit addVest selectrandom (_loadout select 1); 
		_unit addHeadGear selectrandom (_loadout select 2);
		_unit addBackpack selectrandom (_loadout select 3);
	};
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
			_unit addVest selectrandom (WMS_AMS_SniperLoadout select 1);
			_unit addHeadGear selectrandom (WMS_AMS_SniperLoadout select 0);
			_mags = ((getArray (configfile >> "CfgWeapons" >> _mainWeap >> "magazines")) select 0);
			_unit addMagazine _mags;
			_unit addMagazine _mags;
			_unit addMagazine _mags;
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
			_unit addVest selectrandom (WMS_AMS_SniperLoadout select 1);
			_unit addHeadGear selectrandom (WMS_AMS_SniperLoadout select 0);
			_mags = ((getArray (configfile >> "CfgWeapons" >> _mainWeap >> "magazines")) select 0);
			_unit addMagazine _mags;
			_unit addMagazine _mags;
			_unit addMagazine _mags;
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
			_unit addVest selectrandom (WMS_AMS_SniperLoadout select 1);
			_unit addHeadGear selectrandom (WMS_AMS_SniperLoadout select 0);
			_mags = ((getArray (configfile >> "CfgWeapons" >> _mainWeap >> "magazines")) select 0);
			_unit addMagazine _mags;
			_unit addMagazine _mags;
			_unit addMagazine _mags;
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
			_unit addVest selectrandom (WMS_AMS_SniperLoadout select 1);
			_unit addHeadGear selectrandom (WMS_AMS_SniperLoadout select 0);
			_mags = ((getArray (configfile >> "CfgWeapons" >> _mainWeap >> "magazines")) select 0);
			_unit addMagazine _mags;
			_unit addMagazine _mags;
			_unit addMagazine _mags;
		}else{
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_HeavyBandit select 2);
		};
		_pistol = [_unit, selectrandom (WMS_Weaps_HeavyBandit select 3), 1] call BIS_fnc_addWeapon; 
		_unit addGoggles selectrandom (_loadout select 4);
		_unit additem selectRandom WMS_AI_grenades;
		_unit additem selectRandom WMS_AI_grenades;
	};
		case  "diver" : {
			_mainWeap = [_unit, selectrandom (WMS_Weaps_Diver select 0), 5, 0] call BIS_fnc_addWeapon;
			_unit addPrimaryWeaponItem selectrandom (WMS_Weaps_Diver select 2);
			_pistol = [_unit, selectrandom (WMS_Weaps_Diver select 3), 1] call BIS_fnc_addWeapon; 
			_unit addGoggles selectrandom (WMS_Loadout_Diver select 4);
			_unit additem selectRandom WMS_AI_grenades;
			_unit additem selectRandom WMS_AI_grenades;
		};
		case  "suicidebomber" : {
			_unit forceaddUniform selectrandom (_loadout select 0); 
			_unit addVest selectrandom (_loadout select 1);
			removeBackpackGlobal _unit;
			_unit addBackpack "B_Parachute";
		};
		default {
			_mainWeap = [_unit, selectrandom (WMS_Loadout_Assault select 0), 5, 0] call BIS_fnc_addWeapon;
			if (_mainWeap in WMS_AMS_sniperList) then {
				_unit addPrimaryWeaponItem selectrandom (WMS_Loadout_Sniper select 2); 
			_unit addVest selectrandom (WMS_AMS_SniperLoadout select 1);
			_unit addHeadGear selectrandom (WMS_AMS_SniperLoadout select 0);
			_mags = ((getArray (configfile >> "CfgWeapons" >> _mainWeap >> "magazines")) select 0);
			_unit addMagazine _mags;
			_unit addMagazine _mags;
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
		_unit setName selectRandom [["Master Sergeant Gunnery Beckett","Master Sergeant Gunnery","Beckett"],["Bob Lee Swagger","Bob Lee","Swagger"],["Jack Reacher","Jack","Reacher"],["John McClane","John","McClane"],["John Rambo","John","Rambo"],["Lucky Luke","Lucky","Luke"],["Vasily Zaitsev","Vasily","Zaitsev"],["John Wick","John","Wick"]];
		if (WMS_IP_LOGs) then {diag_log format ["[AMS/DynAI AI SETUP]|WAK|TNA|WMS|We Got A Sniper Here! %1, %2", (name _unit), (primaryWeapon _unit)]};
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
		//////////EVENTHANDLER(s)//////////AMS//AMS//AMS//AMS//AMS//AMS//AMS//AMS//AMS//AMS//
		_unit addEventHandler ["HandleDamage", { 
			params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
			//if (WMS_IP_LOGs) then {Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits fucking useless eventHandler HandleDamage, _this = %1",_this]}; //this one spam A LOT of logs
			if (
				isPlayer _source && 
				{alive _unit} && 
				{(_selection == "head") || (_selection == "face_hub")}&& 
				{(vehicle _unit) isKindOf "man"} && 
				{(vehicle _source) isKindOf "man"} &&
				{_damage >= WMS_AMS_HSDamageKill}
			) then {
				if (headgear _unit != "") then {playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2]};
				//[_unit, 1, "head", _projectile, _source] call ace_medical_fnc_addDamageToUnit; //ERROR: addDamageToUnit - badUnit
				[_unit,_source] call WMS_fnc_AMS_EHonKilled;
				_unit removeEventHandler ["HandleDamage", 0];
				if (WMS_HeadShotSound)then{["HeadShot"] remoteexec ["playsound",(owner _source)]};
				Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot Kill, _this = %1",_this];
				if (alive _unit) then {//looks stupid but it seems that the NPC sometimes die before the setDamage 1
					_unit setDamage 1;
					_source addPlayerScores [1,0,0,0,0];
				}; 
			}else {
				if (
					isPlayer _source && 
					{alive _unit} && 
					{(_selection == "head") || (_selection == "face_hub")} && 
					{headgear _unit != ""} && 
					{_damage >= WMS_AMS_HelmetDamage} && 
					{(vehicle _source) isKindOf "man"} && 
					{(vehicle _unit) isKindOf "man" || (vehicle _unit) isKindOf "StaticWeapon"}
				) then {
					playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2];
    				_h = headgear _unit;
    				removeHeadgear _unit;
    				_nv = ((assignedItems _unit) select {_x find "NV" > -1}) select 0;
					if (isNil "_nv") then {_unit unlinkItem _nv};
    				_w = createVehicle ["WeaponHolderSimulated",ASLtoATL eyePos _unit,[],0,"CAN_COLLIDE"];
    				_w addItemCargoGlobal [_h,1];
    				_w setVelocity [5 * sin (_source getdir _unit), 5 * cos (_source getDir _unit), 0.3];
    				_w addTorque [random 0.02, random .02, random .02];
					Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot remove Helmet, _this = %1",_this];
					WMS_AllDeadsMgr pushBack [_w,(serverTime+WMS_Others_AllDeads)];
  				};
			};
		}];
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
			//////////EVENTHANDLER(s)//////////DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//DYNAI//
			if (_RealFuckingSide == OPFOR || _RealFuckingSide == EAST) then { //yes it's the same but you never know
				_unit addEventHandler ["HandleDamage", {
					params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
					//if (WMS_IP_LOGs) then {Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits fucking useless eventHandler HandleDamage, _this = %1",_this]}; //this one spam A LOT of logs
					if (
						isPlayer _source && 
						{alive _unit} && 
						{(_selection == "head") || (_selection == "face_hub")} && 
						//{(vehicle _source) isKindOf "man"} && 
						{(vehicle _unit) isKindOf "man"} &&
						{_damage >= WMS_DYNAI_HSDamageKill}
					) then {
						if (headgear _unit != "") then {playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2]};
						//[_unit, 1, "head", _projectile, _source] call ace_medical_fnc_addDamageToUnit; //ERROR: addDamageToUnit - badUnit
						[_unit,_source] call WMS_fnc_DynAI_RwdMsgOnKill;
						_unit removeEventHandler ["HandleDamage", 0];
						if (WMS_HeadShotSound)then{["HeadShot"] remoteexec ["playsound",(owner _source)]};
						Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot Kill, _this = %1",_this];
						if (alive _unit) then {//looks stupid but it seems that the NPC sometimes die before the setDamage 1
							_unit setDamage 1;
							_source addPlayerScores [1,0,0,0,0];
						}; 
					}else {
						if (
							isPlayer _source && 
							{_damage >= WMS_DYNAI_HelmetDamage} && 
							{alive _unit} && 
							{(_selection == "head") || (_selection == "face_hub")} && 
							{headgear _unit != ""} && 
							//{(vehicle _source) isKindOf "man"} && 
							{(vehicle _unit) isKindOf "man"}
						) then {
							playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2];
    						_h = headgear _unit;
    						removeHeadgear _unit;
    						_nv = ((assignedItems _unit) select {_x find "NV" > -1}) select 0;
							if (isNil "_nv") then {_unit unlinkItem _nv};
    						_w = createVehicle ["WeaponHolderSimulated",ASLtoATL eyePos _unit,[],0,"CAN_COLLIDE"];
    						_w addItemCargoGlobal [_h,1];
    						_w setVelocity [5 * sin (_source getdir _unit), 5 * cos (_source getDir _unit), 0.3];
    						_w addTorque [random 0.02, random .02, random .02];
							Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot remove Helmet, _this = %1",_this];
							WMS_AllDeadsMgr pushBack [_w,(serverTime+WMS_Others_AllDeads)];
  						};
					};
				}];
				_unit addEventHandler ["Hit", {
					params ["_unit", "_source", "_damage", "_instigator"];
					if (isPlayer _instigator && {alive _unit} && {vehicle _instigator == _instigator}) then {
						_acc = _unit skill "aimingAccuracy";
						_unit setSkill ["aimingAccuracy", (_acc*0.8)];
						//if (WMS_IP_LOGs) then {format ['Target Hit, %1', (_unit skill "aimingAccuracy")] remoteexec ['hint', (owner _instigator)]}; //debug
					};
				}];
				/*_unit addEventHandler ["HitPart",{ //Fire ONLY if "_target", "_shooter" are on the same computer, nothing more useless, thank you bohemia
					//"head is (_this select 2)
					//(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
					Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits fucking useless eventHandler HitPart, Head Only (maybe) = %1",(_this select 2)];
				}];*/
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