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

//////////////////////////////////////////////////////////////////
// Infantry Program, Dynamic AI, AirAssistance, Events, Advanced Mission System
//////////////////////////////////////////////////////////////////
// Work In Progress:
// - "Dynamic Flight Operations" (iceman/Project hatchet Discord): Troop transport, Cargo transport, Air Assault, CAS (Infantry, Armoured, combined), SAR, CSAR, Maritime
// - Cities Invasion
// ToDo:
// - Delete NPCs in SafeZone
// - 'DynAI + Events' Player Check before spawn
// - Integrated Messages Brodcast
//////////////////////////////////////////////////////////////////
v2.576_2022APR22_GitHub started to work on "Dynamic Flight Operations"
    WMS_fnc_Watch_Events + WMS_InitSystem
    ADDED WMS_fnc_Event_DFO

v2.572_2022APR05_GitHub Altis Bunkers position with high loot to push players to go at some "deserted" places

v2.57_2022APR04_GitHub minor update on WMS_fnc_DynAI_RainObjects

v2.569_2022APR02_GitHub Exile Mod is fully compatible again

v2.55_2022MAR27_GitHub 
    ADDED Variables override for Exile Users in WMS_initsystem
    if (WMS_exileFireAndForget) then {
	    WMS_exileToastMsg 		= true;
	    WMS_PlayerEntity		= "Exile_Unit_Player";
	    WMS_AMS_MkrEasy 		= "ExileMissionEasyIcon";
	    WMS_AMS_MkrModerate 	= "ExileMissionModerateIcon";
	    WMS_AMS_MkrDifficult 	= "ExileMissionDifficultIcon";
	    WMS_AMS_MkrHardcore 	= "ExileMissionHardcoreIcon";
	    WMS_CaptureZone_mkr		= "ExileMissionCapturePointIcon";
	    WMS_AMS_TradersIcons 	= ["ExileTraderZoneIcon","ExileAircraftTraderIcon"];
	    WMS_DynAI_BaseFlag 		= "Exile_Construction_Flag_static";
    };
    ADDED WMS_DynAI_ShowFragMsg in WMS_fnc_DynAI_RwdMsgOnKill
    
v2.548a_2022MAR26_PreRelease on GitHub to try to get back some ExileMod compatibility

v2.528 2022MAR09 converting WAK_ to WMS_, unfortunatly, (OFPEC)

v2.0 InfantryProgram is not developed with Exile Mod in mind anymore (moving to TheLastCartridges), old functions (DB access) will stay but will be filtered

v1.366 2021FEB17
    ADDED WMS_AMS_LumberYard mission
    ADDED WMS_AMS_OldPowerPlant mission
    ADDED WMS_AMS_HappyMarket mission
    ADDED WMS_AMS_GrandPaJoe mission

v1.36 2021FEB14
    ADDED WMS_AMS_JunkYard mission
    ADDED A bunch of infistar (I guess) Items to AI inventory

v1.353 2021JAN28
    ADDED Filter to select position in  WMS_fnc_AMS_Mission_Unified_B //if (typeName _pos == "STRING") then {}

v1.352 2021JAN27
    ADDED WMS_DynAI_BaseAtkLast 		= 1800; //will not start before time > WMS_DynAI_BaseAtkLast
    ADDED WMS_DynAI_BaseAtkCoolDown	    = 3600;

v1.35 2021JAN27
    ADDED WMS_Loadout_AOR1 for AI
    ADDED WMS_Loadout_SURPAT for AI

v1.344 2020DEC29
    ADDED WMS_List_VHL_Namalsk for Namalsk map
    
v1.343 2020DEC26
    REMOVED missionNamespace setVariable from AMS to save some resources
    ADDED Namalsk to WMS_InitSystem, still working on the map
    ADDED WMS_Loadout_AssaultPlus to remove high poser assault rifle from WMS_Loadout_Assault, not used yet
    UPDATED Loadouts 

v1.342 2020DEC20
    IMPROVED System Watch start to prevent Markers update error
    ADDED WMS_fnc_sys_Init_Watchs with WMS_Thread_Start timer
    ADDED Christmas Song Intro

v1.341 2020DEC19
    ADDED Advanced Events Manager in WMS_fnc_Watch_Events
    ADDED Helicrash Song to HeliCrash events
    TWEAKED WMS_fnc_Event_SupplyDrop to fit the new Advanced Event Manager, mines and markers should now despawn after NPC dead and crate reached (trigger)

v1.34 2020DEC18
    TWEAKED A lot!
        WMS_InitSystem.sqf //Old Player Watch
        WMS_15sec_watch.sqf
        WMS_30sec_watch.sqf
        WMS_60sec_watch.sqf
        WMS_90sec_watch.sqf
        WMS_120sec_watch.sqf
        WMS_240sec_watch.sqf
		WMS_fnc_sys_FastNights
		WMS_fnc_sys_roamingVHLspawn
		WMS_fnc_sys_ServerMarkersUpdate
		WMS_fnc_sys_ServerRestart
		WMS_fnc_Watch_AMS
		WMS_fnc_Watch_Events 
		WMS_fnc_Watch_Players 
		WMS_fnc_Watch_RoamingINF //Old WatchnDestroy
		WMS_fnc_Watch_RoamingVhl
		WMS_fnc_Watch_Triggers
    ADDED All Recon Mission Variables
    ADDED WMS_CustomizedMap = ["Altis","Tanoa","Malden","Enoch","tem_kujari","Vt7"];  and default loadout/vehicles for other maps
    ADDED WMS_MapeName = worldName;

v1.335 2020DEC16
    TWEAKED Base Attack AI Skills (lowered ~20%) //Base lvl1 = 0.15 to 0.3, lvl2 & lvl3 = 0.15 to 0.35, , lvl4 & lvl5 = 0.2 to 0.4, lvl6 & lvl7 = 0.25 to 0.5, lvl8 & lvl9 = 0.3 to 0.55, lvl10 0.35 to 0.6
    FIXED Base attack reinforcement vehicles Kickass variable, no self-destroy if the vehicle camp at the door
    ADDED "Recon Mission" marker name
    TWEAKED Recon Mission reward, bigger loot equivalent to Hardcore mission reward
    ADDED Day/night time filter to base attack, (sunOrMoon > 0.9), no night time base attack

v1.334 2020DEC15
    ADDED WMS_DynAI_Skills	= [0.15, 0.3, 0.45, 0.6]; //+random 0.15 //lowered DynAI skills, adjusted to Player Respect [0/1000, 1001/25000, 25001/75000, >75001]
    TWEAKED Altis AI Count: WMS_AI_MaxUnits_C = 200; WMS_AI_RoamingVHLcount = 20;
    TWEAKED Base Attack groups spawns

v1.333 2020DEC07
    TWEAKED Base Attack Reinforcement: _flag setVariable ["BaseATKReinforce", ["runner","paradrop","VHLpatrol","AIRpatrol","AIRassault","runner","paradrop"],true];

v1.332 2020DEC06
    REMOVED Crows from Base Attack: local only not Global
    
v1.331 2020DEC05
    ADDED Basic Base Attack, 6 to 20 AI, 2 to 4 grps
    ADDED Reinforcement to Base Attack

v1.33 2020DEC04
    ADDED Forest Zones on Malden
    ADDED chat message for the Bike cumulative reward //["Congratulation Ridder! There is some respect for your ride"] remoteExecCall ['SystemChat',_x];
    ADDED CSAT Texture for AI Blackfoot, Huron, Pawnee //["B_Heli_Attack_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]];
    ADDED BBQcamp to DynAI, Trigger spawn only
    FIXED Humanidrop RDO vehicle WMS_AI_RdoTruck = "I_E_Offroad_01_comms_F";
    TWEAKED WMS_AI_Create_Triggers from "GUER" to "ANYPLAYER" to try to stop AI to activate triggers

v1.3 2020DEC03
    SPLIT WMS_PlayerWatch to unify the system with an "Arma Vanilla" loadouts/vehicles by default.
    ADDED WMS_list_Crates_vanilla
    ADDED WMS_list_Loadout_vanilla
    ADDED WMS_list_Loadout_vanilla_NOSCOPE
    ADDED WMS_list_Loadout_FullMod
    ADDED WMS_list_VHL_vanilla
    ADDED WMS_list_VHL_FullMod
    ADDED to MPmission WMS_DshkmOnPandur
    ADDED to MPmission WMS_OldChestOnPandur
    ADDED to MPmission WMS_OpforVHL_Radar
    ADDED to MPmission WMS_QuantumComputer (admin for now)
    ADDED ReconMission (Need to be added to the Event_watch)
    ADDED Cumulative Reward for Ridding Bike (N checks, Every 60 seconde if bike moved x meters, add x respect to the ridder)

No update in the change log for... some time

v1.253 2019AUG30
    ADDED WMS_fnc_AMS_Mission_HomeDepot
    ADDED WMS_SupplyList = [];
    ADDED WMS_ToolList = [];
    ADDED WMS_MeatList = [];
    ADDED WMS_AMS_addPoptabsRwd = true; //Add poptabs in the mission reward crate/vehicle
    ADDED WMS_AMS_PoptabsRwd = [1000,500]; //"intermediate": *1.5; "difficult": *2; "hardcore": *2.5;
    TWEAKED WMS_fnc_AMS_SpawnRewards for loot type
    FIXED WMS_fnc_infantryProgram_VHLpatrol empty turrets on some AI patrols {WMS_AI_Units_Class createUnit [_randomPosTarget, _VHLgrp, "this moveinTurret [_vehic, _x]"];}forEach (allTurrets _vehic);

v1.252 2019AUG29
    ADDED WMS_fnc_AMS_Mission_GuardedTower
    TWEAKED WMS_fnc_AMS_SpawnRewards for difficulty adaptative loot //_lootCount = [[1,1,2],[1,1,1],[2,1,1],[1,2,2],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
    TWEAKED WMS_AMS_Running_Array pushback []; //Mines have now their hown Array to despawn

v1.251 2019AUG28
    ADDED WMS_fnc_AMS_Mission_ForestCamp
    ADDED DoD sounds to Missions unlock

v1.25 2019AUG27
    ACTIVATED AMS - firt 2 test missions
    ADDED WMS_AMS_Watch
    ADDED WMS_fnc_AMS_Succes
    ADDED WMS_fnc_AMS_TimedOut
    ADDED WMS_fnc_AMS_SpawnRewards to replace paradrop_RLA_Unifed for AMS

v1.24 2019AUG20
    ADDED Cleaner for empty group in WMS_AI_RoamingVhl_Watch
        if ((count units ((_x select 2) select 0)) < 1) then {
				if (WMS_AI_RoamingVhl_Logs) then {diag_log format ["[30 sec AI VHL Watch]|WAK|TNA|WMS| %1 is no more, rest in peace and get the fuck out of the Array", _x]};
				_x set [1,0];
			};
    ADDED WMS_fnc_AMS_CreateMarker
    ADDED WMS_fnc_AMS_FillStuff
    ADDED WMS_fnc_AMS_SpawnGroups
    ADDED WMS_fnc_AMS_SpawnMineFild
    ADDED WMS_fnc_AMS_SpawnObjects
    ADDED WMS_fnc_AMS_SpnAiBlkListFull
    ADDED WMS_humaniDropList = [];

v1.23 2019AUG19
    ADDED WMS_Event_Watch to manage different events to spawn on the server (AI/Humani Drops, Repair camps, heliCrashs)
        WMS_Events = true;
        WMS_EventsDelay = 120;
        WMS_Events_list = [];
    ADDED DeadManSwitch to the suicide Bomber

v1.22 2019AUG18
    ADDED WMS_fnc_Event_HumaniDrop (empty crate for now)
        WMS_HumaniDrop = true;
        WMS_HumaniDropCount = 1;
        WMS_HumaniDropDelay = 1100;
    ADDED Alarm on the stolen vehicle for WMS_fnc_DynAI_steal
		playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", _x, false, (position _x), 2, 1, 0];

v1.21 2019AUG13
    ADDED Infantry patrols to AI SupplyDrops
    ADDED Livonia loadout/weaps to AI
        WMS_Loadout_Livonia = [];
        WMS_Weaps_LivoniaMix = [];
    FIXED WMS_ATMines	= "BWA3_DM31AT";

v1.2 2019AUG12
    ADDED hidden community trader for some RHSAFRF equipement

v1.2 2019AUG09
    ADDED AI SupplyDrops function

v1.13 2019MAR04
    ADDED ejection Dead AI from their vehicles
    ADDED variable to triggers + activated triggers array
        WMS_activatedTriggs 	= [];
        Activation:
            thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];
            WMS_activatedTriggs pushBack [thisTrigger, _triggTime];
        Desactivation:
            private _trigRef = thisTrigger getVariable 'WMS_triggRef';
            WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);
    ADDED Trigger Check and reinforce
        WMS_triggCheck			= 600+(random 300); //calculated at server start
        WMS_triggCheckChance	= 50; //chance to send reinforcement
        WMS_triggCheckDist		= 200; //minimun player distance from other AI to send reinforcement
        if (random 100 < WMS_triggCheckChance && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B) && (_target distance2D (_target findNearestEnemy _target)) > WMS_triggCheckDist) then {
            [_target, position _target, "reinforcement"] call WMS_fnc_DynAI_selScen;
            };
    
v1.12 2019MAR03
    ADDED Poptabs on AI + AI's vehicles
        WMS_DynAI_addPoptabsINF     = true;
        WMS_DynAI_poptabsINF        = [25,50];
        WMS_DynAI_addPoptabsVHL     = true;
        WMS_DynAI_poptabsVHL        = [250,750];
    ADDED reward on AI kill
        WMS_DynAI_RespectRwdOnKill  = true;
        WMS_DynAI_respectBonus      = 150;
        WMS_DynAI_distBonusMax      = 750;
        WMS_DynAI_distBonusCoef     = 0.2;

v1.11 2019MAR02
    ADDED randomize position for triggers
        WMS_Pos_Rdz         = 50;
        WMS_Pos_Custom_Rdz 	= 0;
    ADDED Chance to trigger action or not
        WMS_trigLocals_Chance 	= 40;
        WMS_trigVillages_Chance = 50;
        WMS_trigCities_Chance 	= 60;
        WMS_trigCapitals_Chance = 70;
        WMS_trigHills_Chance 	= 33;
        WMS_Forests_Chance		= 50;
        WMS_Military_Chance		= 80;
        WMS_CustomTrig_Chance	= 60;

v1.1 2019FEB26
    ADDED ABU loadout for OPFOR units
        WMS_Loadout_ABU = [];
    ADDED Transport Helicopters List
        WMS_OPFOR_CustomAIR_Transport = [];
    ADDED Steal player's Vehicles function to AI groups 
        [_grp] call WMS_fnc_DynAI_Steal;
        WMS_DynAI_Steal = true;
        WMS_DynAI_stealDist = 300;
    ADDED Cargo Units for VHL patrols 
        WMS_DynAI_AddCargoUnits = true; 
        WMS_DynAI_CargoUnits = 2;
    FIXED the Traders filter for Dynamic Threat.
    ACTIVATED Dynamic Threat with BaseAttack filter

v1.0 2019FEB24