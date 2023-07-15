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

//uisleep 120+60;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 60sec Watch started at %1", time];
WMS_ServRestart15minWarning = true; //allow the 15min "hint" warning message (1 time)
WMS_FastCombatActive = false; //prevent fast combat variables to re-set every minutes but only each time it's activated/deactivated
if !(WMS_FastCombat) then {WMS_FastCombatActive = true;}; //force the regular VARs if no Fast Combat by default
while {true} do {
	//uisleep 59; //MOVED MIDDLE TO GET NEW VARs AS FAST AS POSSIBLE //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
	//Fast combat, re-set the variables
	if (WMS_FastCombat) then {
		if !(WMS_FastCombatActive) then {
			WMS_DynAI_threatFrequency_T = WMS_DynAI_threatFrequencyFC; // = 300;
			WMS_DynAI_threatCoefs_T 	= WMS_DynAI_threatCoefsFC; // 	= [1.5,1.35,1.15]; //[1player,2players,3players]
			WMS_triggCheck_T 			= WMS_triggCheck_FC; //			= 240; //triggers are set at server start, it'll need some work to dynamicaly change the vars
			WMS_triggCheck_Ch_T 		= WMS_triggCheck_ChFC; //		= 90; //chances to trigger
			WMS_trigLocals_Ch_T 		= WMS_trigLocals_ChFC; //		= 70; //chances to trigger
			WMS_trigVillages_Ch_T		= WMS_trigVillages_ChFC; // 	= 75; //chances to trigger
			WMS_trigCities_Ch_T 		= WMS_trigCities_ChFC; // 		= 80; //chances to trigger
			WMS_trigCapitals_Ch_T 		= WMS_trigCapitals_ChFC; //		= 85; //chances to trigger
			WMS_trigHills_Ch_T 			= WMS_trigHills_ChFC; //		= 55; //chances to trigger
			WMS_Forests_Ch_T 			= WMS_Forests_ChFC; //			= 55; //chances to trigger
			WMS_Military_Ch_T 			= WMS_Military_ChFC; //			= 95; //chances to trigger
			
			WMS_trig_Glob_CoolD_T 		= (WMS_trig_Glob_CoolD*WMS_TriggCoolDownCoefFC); // 	= 300; //global trigger cooldown
			WMS_trigLocals_CoolD_T		= (WMS_trigLocals_CoolD*WMS_TriggCoolDownCoefFC); // 	= 600; //cooldown of the different triggers
			WMS_trigVillages_CoolD_T 	= (WMS_trigVillages_CoolD*WMS_TriggCoolDownCoefFC); // 	= 550;
			WMS_trigCities_CoolD_T 		= (WMS_trigCities_CoolD*WMS_TriggCoolDownCoefFC); // 	= 600;
			WMS_trigCapitals_CoolD_T 	= (WMS_trigCapitals_CoolD*WMS_TriggCoolDownCoefFC); // 	= 500;
			WMS_trigHills_CoolD_T 		= (WMS_trigHills_CoolD*WMS_TriggCoolDownCoefFC); //		= 600;
			WMS_Forests_CoolD_T 		= (WMS_Forests_CoolD*WMS_TriggCoolDownCoefFC); //		= 600;
			WMS_Military_CoolD_T 		= (WMS_Military_CoolD*WMS_TriggCoolDownCoefFC); //		= 400;
			
			WMS_Player_AllDeads			= WMS_Player_AllDeads*0.5;
			WMS_AMS_AllDeads			= WMS_AMS_AllDeads*0.5;
			WMS_DynAI_AllDeads			= WMS_DynAI_AllDeads*0.5;
			WMS_DFO_AllDeads			= WMS_DFO_AllDeads*0.5;
			WMS_Others_AllDeads			= WMS_Others_AllDeads*0.5;

			WMS_AI_Para_remRPG 			= true;
			WMS_AI_INFpatrol_remRPG 	= true;
			WMS_AI_RoamingVHL_remRPG 	= true;
			WMS_DynAI_remRPG 			= true;
			WMS_AMS_remRPG 				= 100;

			WMS_FastCombatActive = true;
		};
	}else{
		if (WMS_FastCombatActive) then {
			WMS_DynAI_threatFrequency_T = WMS_DynAI_threatFrequency; // = 900;
			WMS_DynAI_threatCoefs_T 	= WMS_DynAI_threatCoefs; // 	= [2,1.5,1.2]; //[1player,2players,3players]
			WMS_triggCheck_T 			= WMS_triggCheck; //			= 600; //triggers are set at server start, it'll need some work to dynamicaly change the vars
			WMS_triggCheck_Ch_T 		= WMS_triggCheckChance; //		= 50; //chances to trigger
			WMS_trigLocals_Ch_T 		= WMS_trigLocals_Chance; //		= 40; //chances to trigger
			WMS_trigVillages_Ch_T		= WMS_trigVillages_Chance; // 	= 45; //chances to trigger
			WMS_trigCities_Ch_T 		= WMS_trigCities_Chance; // 	= 55; //chances to trigger
			WMS_trigCapitals_Ch_T 		= WMS_trigCapitals_Chance; //	= 56; //chances to trigger
			WMS_trigHills_Ch_T 			= WMS_trigHills_Chance; //		= 33; //chances to trigger
			WMS_Forests_Ch_T 			= WMS_Forests_Chance; //		= 40; //chances to trigger
			WMS_Military_Ch_T 			= WMS_Military_Chance; //		= 90; //chances to trigger
			
			WMS_trig_Glob_CoolD_T 		= WMS_trig_Glob_CoolD; // 		= 300; //global trigger cooldown
			WMS_trigLocals_CoolD_T		= WMS_trigLocals_CoolD; // 		= 600; //cooldown of the different triggers
			WMS_trigVillages_CoolD_T 	= WMS_trigVillages_CoolD; // 	= 550;
			WMS_trigCities_CoolD_T 		= WMS_trigCities_CoolD; // 		= 600;
			WMS_trigCapitals_CoolD_T 	= WMS_trigCapitals_CoolD; // 	= 500;
			WMS_trigHills_CoolD_T 		= WMS_trigHills_CoolD ; //		= 600;
			WMS_Forests_CoolD_T 		= WMS_Forests_CoolD; //			= 600;
			WMS_Military_CoolD_T 		= WMS_Military_CoolD; //		= 400;

			WMS_Player_AllDeads			= WMS_Player_AllDeads*2;
			WMS_AMS_AllDeads			= WMS_AMS_AllDeads*2;
			WMS_DynAI_AllDeads			= WMS_DynAI_AllDeads*2;
			WMS_DFO_AllDeads			= WMS_DFO_AllDeads*2;
			WMS_Others_AllDeads			= WMS_Others_AllDeads*2;

			execVM "\InfantryProgram\Scripts\WMS_customMapsSettings.sqf";
			WMS_FastCombatActive = false;
		};
	};
	uisleep 59;
	call WMS_fnc_AllDeadsMgr;
	if (isDedicated) then {
		//weather
		if (WMS_forceNoRain && {Rain != 0}) then{10 setRain 0};
		if (WMS_forceNoFog && {fog != 0}) then{10 setFog 0};
		//Player Watch, the Original one
		if (count allPlayers != 0) then {call WMS_fnc_Watch_Players};
		//fast Night
		if (WMS_FastNight) then {call WMS_fnc_sys_FastNights};
		//Server restart 
		if (WMS_ServRestart && {serverTime > (WMS_ServRestartSeconds-900)}) then {
			[] spawn WMS_fnc_sys_ServerRestart; //I don't like this "spawn"
		};
	};
	///////////////////////////////
	//DFO
	///////////////////////////////
	if (isDedicated && WMS_DynamicFlightOps) then { //isDedicated for now
		if (count WMS_DFO_Running != 0) then {
			{
				if (((_x select 7) == "DFO")) then { //if it's not "DFO", it's really fuckedUp
					_x call WMS_fnc_DFO_Cleanup;
				};
			}forEach WMS_DFO_Running;
		};
		if (count WMS_DFO_RunReinforce != 0) then {
			{
				if ((_x select 7) == "REINF" && {time > (_x select 1)}) then { //do not call the reinforcement cleanup if time has not come
					_x call WMS_fnc_DFO_RinforceCleanup; //["HexaID", time to delete, [_grps], [_vhls], [_objects],"","","REINF"]
				};
			}forEach WMS_DFO_RunReinforce;
		};
	};
	/////////////////////////////
	//JUDGEMENT DAY
	/////////////////////////////
	if (isDedicated && WMS_JudgementDay && {WMS_JudgementDay_Run}) then { //isDedicated for now
		_unitsToWatch = [];
		{
			{
				if (alive _x && {speed _x <= 2}) then {_unitsToWatch pushBack _x};
			}forEach units _x;
		}forEach (WMS_JudgementDay_Array select 4);
		if (count _unitsToWatch != 0) then {
			[_unitsToWatch] call WMS_JMD_watch_OPF;
		};
	};
};