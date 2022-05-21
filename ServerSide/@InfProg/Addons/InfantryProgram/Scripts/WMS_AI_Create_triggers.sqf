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
//execVM "\TNACommunity\Scripts\WMS_AI_Create_triggers.sqf";
[] spawn {
Diag_log format ['|WAK|TNA|WMS| Creating %1 Local Triggers', (count WMS_Pos_Locals)];
{
private _trigLocals = nil;
if (WMS_Pos_Rdz != 0) then {_trigLocals = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigLocals = createTrigger ["EmptyDetector", _x]};
//_trigLocals setVariable ["WMS_triggRef",[position _trigLocals, _trigLocals, round time],true];
_trigLocals setTriggerArea [WMS_trigLocals_Size, WMS_trigLocals_Size, 0, false, WMS_trigLocals_Size];
_trigLocals setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigLocals setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| LOCAL TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
private _triggTime = round Time;
thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_trigLocals_LastT + WMS_trigLocals_CoolD))} && {((random 100) < WMS_trigLocals_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_trigLocals_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'LOCAL'] call WMS_fnc_DynAI_selScen;
		};
","if (WMS_IP_LOGs) then {Diag_Log '***** LOCAL TRIGGER test end *****'};
private _trigRef = thisTrigger getVariable 'WMS_triggRef';
WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);"];
}forEach WMS_Pos_Locals;
uisleep 1;

Diag_log format ['|WAK|TNA|WMS| Creating %1 Village Triggers', (count WMS_Pos_Villages)];
{
private _trigVillages = nil;
if (WMS_Pos_Rdz != 0) then {_trigVillages = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigVillages = createTrigger ["EmptyDetector", _x]};
//_trigVillages setVariable ["WMS_triggRef",[position _trigVillages, _trigVillages, round time],true];
_trigVillages setTriggerArea [WMS_trigVillages_Size, WMS_trigVillages_Size, 0, false, WMS_trigVillages_Size];
_trigVillages setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigVillages setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| VILLAGE TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
private _triggTime = round Time;
thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_trigVillages_LastT + WMS_trigVillages_CoolD))} && {((random 100) < WMS_trigVillages_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_trigVillages_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'VILLAGE'] call WMS_fnc_DynAI_selScen;
		};
","if (WMS_IP_LOGs) then {Diag_Log '***** VILLAGE TRIGGER test end *****';};
private _trigRef = thisTrigger getVariable 'WMS_triggRef';
WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);"];
}forEach WMS_Pos_Villages;
uisleep 1;

Diag_log format ['|WAK|TNA|WMS| Creating %1 City Triggers', (count WMS_Pos_Cities)];
{
private _trigCities = nil;
if (WMS_Pos_Rdz != 0) then {_trigCities = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigCities = createTrigger ["EmptyDetector", _x]};
//_trigCities setVariable ["WMS_triggRef",[position _trigCities, _trigCities, round time],true];
_trigCities setTriggerArea [WMS_trigCities_Size, WMS_trigCities_Size, 0, false, WMS_trigCities_Size];
_trigCities setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigCities setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| CITY TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
private _triggTime = round Time;
thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_trigCities_LastT + WMS_trigCities_CoolD))} && {((random 100) < WMS_trigCities_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_trigCities_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'CITY'] call WMS_fnc_DynAI_selScen;
		};
","if (WMS_IP_LOGs) then {Diag_Log '***** CITY TRIGGER test end *****';};
private _trigRef = thisTrigger getVariable 'WMS_triggRef';
WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);"];
}forEach WMS_Pos_Cities;
uisleep 1;

Diag_log format ['|WAK|TNA|WMS| Creating %1 Capital Triggers', (count WMS_Pos_Capitals)];
{
private _trigCapitals = nil;
if (WMS_Pos_Rdz != 0) then {_trigCapitals = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigCapitals = createTrigger ["EmptyDetector", _x]};
//_trigCapitals setVariable ["WMS_triggRef",[position _trigCapitals, _trigCapitals, round time],true];
_trigCapitals setTriggerArea [WMS_trigCapitals_Size, WMS_trigCapitals_Size, 0, false, WMS_trigCapitals_Size];
_trigCapitals setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigCapitals setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| CAPITAL TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
private _triggTime = round Time;
thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_trigCapitals_LastT + WMS_trigCapitals_CoolD))} && {((random 100) < WMS_trigCapitals_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_trigCapitals_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'CAPITAL'] call WMS_fnc_DynAI_selScen;
		};
","if (WMS_IP_LOGs) then {Diag_Log '***** CAPITAL TRIGGER test end *****';};
private _trigRef = thisTrigger getVariable 'WMS_triggRef';
WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);"];
}forEach WMS_Pos_Capitals;
uisleep 1;

Diag_log format ['|WAK|TNA|WMS| Creating %1 Hills Triggers', (count WMS_Pos_Hills)];
{
private _trigHills = nil;
if (WMS_Pos_Rdz != 0) then {_trigHills = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigHills = createTrigger ["EmptyDetector", _x]};
//_trigHills setVariable ["WMS_triggRef",[position _trigHills, _trigHills, round time],true];
_trigHills setTriggerArea [WMS_trigHills_Size, WMS_trigHills_Size, 0, false, WMS_trigHills_Size];
_trigHills setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigHills setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| HILL TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
private _triggTime = round Time;
thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_trigHills_LastT + WMS_trigHills_CoolD))} && {((random 100) < WMS_trigHills_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_trigHills_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'HILL'] call WMS_fnc_DynAI_selScen;
		};
","if (WMS_IP_LOGs) then {Diag_Log '***** HILL TRIGGER test end *****'};
private _trigRef = thisTrigger getVariable 'WMS_triggRef';
WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);"];
}forEach WMS_Pos_Hills;

if ((count WMS_Pos_Forests) > 0) then {
	Diag_log format ['|WAK|TNA|WMS| Creating %1 Forests Triggers', (count WMS_Pos_Forests)];
	{
	private _trigForest = createTrigger ["EmptyDetector", _x];
	_trigForest setTriggerArea [WMS_Forests_Size, WMS_Forests_Size, 0, false, WMS_Forests_Size];
	_trigForest setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigForest setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| FOREST TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_Forests_LastT + WMS_Forests_CoolD))} && {((random 100) < WMS_Forests_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_Forests_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'FOREST'] call WMS_fnc_DynAI_selScen;
		};	
	","if (WMS_IP_LOGs) then {Diag_Log '***** FOREST TRIGGER test end *****';};"];
	}forEach WMS_Pos_Forests;
uisleep 1;
};

if ((count WMS_Pos_Military) > 0) then {
	Diag_log format ['|WAK|TNA|WMS| Creating %1 Military Triggers', (count WMS_Pos_Military)];
	{
	private _trigMilitary = createTrigger ["EmptyDetector", _x];
	_trigMilitary setTriggerArea [WMS_Military_Size, WMS_Military_Size, 0, false, WMS_Military_Size];
	_trigMilitary setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigMilitary setTriggerStatements ["this",
"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| MILITARY TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_Military_LastT + WMS_Military_CoolD))} && {((random 100) < WMS_Military_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_Military_LastT = time;
			[(thisList select 0), (position thisTrigger), 'trigger', 'MILITARY'] call WMS_fnc_DynAI_selScen;
		};	
	","if (WMS_IP_LOGs) then {Diag_Log '***** MILITARY TRIGGER test end *****';};"];
	}forEach WMS_Pos_Military;
uisleep 1;
};

if (((count WMS_Pos_CustomTrig) > 0) && ((count WMS_Pos_CustomTrig) < (WMS_CustomTrig_Max))) then {
	Diag_log format ['|WAK|TNA|WMS| Creating %1 Customs Triggers', (count WMS_Pos_CustomTrig)];
	{
	private _trigCustom = nil;
	if (WMS_Pos_Custom_Rdz != 0) then {_trigCustom = createTrigger ["EmptyDetector", [[[_x, WMS_Pos_Custom_Rdz]],[]] call BIS_fnc_randomPos]} else {_trigCustom = createTrigger ["EmptyDetector", _x]};
	_trigCustom setTriggerArea [WMS_CustomTrig_Size, WMS_CustomTrig_Size, 0, false, WMS_CustomTrig_Size];
	_trigCustom setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigCustom setTriggerStatements [
		"this",
		"if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS| CUSTOM TRIGGER,  thisList = %1, thisTrigger = %2 *****', (thisList select 0), thisTrigger];};
		if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && {(time > (WMS_CustomTrig_LastT + WMS_CustomTrig_CoolD))} && {((random 100) < WMS_CustomTrig_Chance)} && {(speed (thisList select 0) < WMS_trigMaxSpeed)}) then {
			WMS_trig_Glob_LastT = time;
			WMS_CustomTrig_LastT = time;
			[(position thisTrigger),100,120,(2+round(random 2)),10,(0.3+(random 0.55)),(selectRandom ['bandit','army'])] spawn WMS_fnc_DynAI_BuildingGuards;
		};
		",
		"if (WMS_IP_LOGs) then {Diag_Log '***** CUSTOM TRIGGER test end *****';};"
		];
	}forEach WMS_Pos_CustomTrig;
uisleep 1;
};
};