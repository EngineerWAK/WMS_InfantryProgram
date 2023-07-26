/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2023 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//////////////////////////////////////////////////////////////////<br/>
// Infantry Program, Dynamic AI, AirAssistance, Events, Advanced Mission System<br/>
//////////////////////////////////////////////////////////////////<br/>
// Work In Progress:<br/>
// - Cities Invasion (probably not)<br/>
// ToDo:<br/>
// - 'DynAI + Events' Player Check before spawn<br/>
//////////////////////////////////////////////////////////////////<br/>
v2.855_2023JUL26_GitHub <br/>
    Introducing "Static Missions" with "dynamic" NPC artillery (at least for Cam_Lao_Nam but can work for any map) <br/>
    Build all your static missions in the mission editor on the map you want tp play them, export to sqf, put this sqf in \InfantryProgram\Scripts\ and call it from WMS_customMapsSettings. <br/>
    One file for all the missions on the map. I use 4 different flags (hidden) to get the position and push the positions in 4 different arrays. <br/>
    WMS_fnc_AMS_Mission_Static_A to manage the missions spawn from the 4 postions arrays <br/>
    WMS_fnc_Mission_Static_DoFire to force artillery to fire on random named positions <br/>
    WMS_AMS_ArtyDoFire 		= ["vn_o_pl_static_d44_01","vn_b_aus_army_static_m101_02","vn_o_kr_static_h12"]; <br/>
    WMS_AMS_MissionList [ <br/>
        ... <br/>
        //STATICS <br/>
        ["VC Arty",5], <br/>
        ["VC Patrol",5], <br/>
        ... <br/>
    ]; <br/>
    WMS_AMS_StaticPos_1			= []; //VC //patrol //pushback from AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf <br/>
    WMS_AMS_StaticPos_2			= []; //PATHET //patrol, garrison positions //pushback from AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf <br/>
    WMS_AMS_StaticPos_3			= []; //PAVN  //patrol, garrison positions //ARTY 1 //pushback from AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf <br/>
    WMS_AMS_StaticPos_4			= []; //KHMER //patrol, garrison positions //ARTY 2 //pushback from AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf <br/>
    execVM "\InfantryProgram\Scripts\AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf"; <br/>

v2.827_2023JUL09_GitHub <br/>
    SOG Prairie Fire Setup and loadouts, big update!

v2.806_2023FEB09_GitHub <br/>
    Updated the Roaming vehicles, if all the crew leave the vehicle > 300m, they will be destroyed after 3 checks (3*30 sec). To prevent useless vehicle crew walking around the map. <br/>
    
v2.794_2023JAN25_GitHub <br/>
    ADDED Judgement Day mission, can be called fron the Infantry Computer. 10 waves of NPC spawning in the building around + few civilians running<br/>
        WMS_fnc_JudgementDay<br/>
        WMS_JudgementDay	 	= true;<br/>
        WMS_JudgementDay_Run 	= false;<br/>
        WMS_JudgementDay_Rad 	= 100;<br/>
        WMS_JMD_PlayerTrigList 	= [];<br/>
        WMS_JudgementDay_Array 	= [nil,[0,0,0],0,[],[],[],[],["JMD_mkr1","JMD_mkr2","JMD_mkr3","_JMD_mkr4","_JMD_mkr5"],[]];<br/>

v2.756_2022NOV12_GitHub<br/>
    ADDED in WMS_fnc_SetUnits "headshot" eventHandler on NPCs for Missions And roamings. Without helmet, ACE deal(should) more Damage to the NPCs and no need 5 headshots with 7.62AP to kill a bandit<br/>
        WMS_HeadShotSound 		= false;//"Head Shhhhotttttt!" or not, when headshot to NPC //It's fun but 3 bullets in a NPC's leg and arma think it's a headshot...<br/>
        WMS_AMS_HSDamageKill	= 4.5;  //amount of damage to the head/face to instantly kill a NPC //[O Alpha 2-5:4,""head"",4.18725,bis_o2_6004,""rhs_ammo_762x51_M80_Ball"",16,bis_o2_6004,""ace_hdbracket""]<br/>
        WMS_AMS_HelmetDamage	= 2;    //amount of damage to the head/face to remove NPC's helmet, keep in mind than a shot in the leg can trigger head damage... thank you bohemia!<br/>
        WMS_DYNAI_HSDamageKill	= 3.5;  //amount of damage to the head/face to instantly kill a NPC //[O Alpha 2-5:4,""head"",4.18725,bis_o2_6004,""rhs_ammo_762x51_M80_Ball"",16,bis_o2_6004,""ace_hdbracket""]<br/>
        WMS_DYNAI_HelmetDamage	= 1.9;  //amount of damage to the head/face to remove NPC's helmet, keep in mind than a shot in the leg can trigger head damage... thank you bohemia!<br/>
        This need an update in mpmissions files for sounds<br/>

v2.739_2022NOV02_GitHub<br/>
    ADDED to fn_AMS_EHonKilled.sqf:<br/>
        WMS_AMS_StripOnArmoredK	= true; //remove all gears/weapons if NPC killed from tank/apc/RCWS<br/>
        WMS_AMS_TrappOnArmoredK	= true; //create a mine at the deadbody if NPC killed from tank/apc/RCWS<br/>
    ADDED New Missions to AMS:<br/>
        "commsrelay","strelnikovtrain","bastogne","blackhawk"<br/>

v2.7_2022OCT20_GitHub<br/>
    Introducing "Fast Combat" options WMS_FastCombat = true; (dafault = false)<br/>
        Reduce all cooldowns<br/>
        Increase chances for triggers to spawn NPCs more often<br/>
        Reduce dynamic threat timers/coefs<br/>
        Add a Fast Combat Activation Marker on the map (bottom)<br/>
        Logged Admins can activate/deactivate Fast Combat anytime in the console<br/>

v2.576_2022APR22_GitHub started to work on "Dynamic Flight Operations"
    WMS_fnc_Watch_Events + WMS_InitSystem<br/><br/>
    ADDED WMS_fnc_Event_DFO<br/>

v2.572_2022APR05_GitHub Altis Bunkers position with high loot to push players to go at some "deserted" places<br/>

v2.57_2022APR04_GitHub minor update on WMS_fnc_DynAI_RainObjects<br/>

v2.569_2022APR02_GitHub Exile Mod is fully compatible again<br/>

v2.55_2022MAR27_GitHub<br/>
    ADDED Variables override for Exile Users in WMS_initsystem<br/>
    if (WMS_exileFireAndForget) then {<br/>
	    WMS_exileToastMsg 		= true;<br/>
	    WMS_PlayerEntity		= "Exile_Unit_Player";<br/>
	    WMS_AMS_MkrEasy 		= "ExileMissionEasyIcon";<br/>
	    WMS_AMS_MkrModerate 	= "ExileMissionModerateIcon";<br/>
	    WMS_AMS_MkrDifficult 	= "ExileMissionDifficultIcon";<br/>
	    WMS_AMS_MkrHardcore 	= "ExileMissionHardcoreIcon";<br/>
	    WMS_CaptureZone_mkr		= "ExileMissionCapturePointIcon";<br/>
	    WMS_AMS_TradersIcons 	= ["ExileTraderZoneIcon","ExileAircraftTraderIcon"];<br/>
	    WMS_DynAI_BaseFlag 		= "Exile_Construction_Flag_static";<br/>
    };<br/>
    ADDED WMS_DynAI_ShowFragMsg in WMS_fnc_DynAI_RwdMsgOnKill<br/>
    
v2.548a_2022MAR26_PreRelease on GitHub to try to get back some ExileMod compatibility<br/>

v2.528 2022MAR09 converting WAK_ to WMS_, unfortunatly, (OFPEC)<br/>

v2.0 InfantryProgram is not developed with Exile Mod in mind anymore (moving to TheLastCartridges), old functions (DB access) will stay but will be filtered<br/>

v1.366 2021FEB17<br/>
    ADDED WMS_AMS_LumberYard mission<br/>
    ADDED WMS_AMS_OldPowerPlant mission<br/>
    ADDED WMS_AMS_HappyMarket mission<br/>
    ADDED WMS_AMS_GrandPaJoe mission<br/>

v1.36 2021FEB14<br/>
    ADDED WMS_AMS_JunkYard mission<br/>
    ADDED A bunch of infistar (I guess) Items to AI inventory<br/>

v1.353 2021JAN28<br/>
    ADDED Filter to select position in  WMS_fnc_AMS_Mission_Unified_B //if (typeName _pos == "STRING") then {}<br/>

v1.352 2021JAN27<br/>
    ADDED WMS_DynAI_BaseAtkLast 		= 1800; //will not start before time > WMS_DynAI_BaseAtkLast<br/>
    ADDED WMS_DynAI_BaseAtkCoolDown	    = 3600;<br/>

v1.35 2021JAN27<br/>
    ADDED WMS_Loadout_AOR1 for AI<br/>
    ADDED WMS_Loadout_SURPAT for AI<br/>

v1.344 2020DEC29<br/>
    ADDED WMS_List_VHL_Namalsk for Namalsk map<br/>
    
v1.343 2020DEC26<br/>
    REMOVED missionNamespace setVariable from AMS to save some resources<br/>
    ADDED Namalsk to WMS_InitSystem, still working on the map<br/>
    ADDED WMS_Loadout_AssaultPlus to remove high poser assault rifle from WMS_Loadout_Assault, not used yet<br/>
    UPDATED Loadouts<br/>

v1.342 2020DEC20<br/>
    IMPROVED System Watch start to prevent Markers update error<br/>
    ADDED WMS_fnc_sys_Init_Watchs with WMS_Thread_Start timer<br/>
    ADDED Christmas Song Intro<br/>

v1.341 2020DEC19<br/>
    ADDED Advanced Events Manager in WMS_fnc_Watch_Events<br/>
    ADDED Helicrash Song to HeliCrash events<br/>
    TWEAKED WMS_fnc_Event_SupplyDrop to fit the new Advanced Event Manager, mines and markers should now despawn after NPC dead and crate reached (trigger)<br/>

v1.34 2020DEC18<br/>
    TWEAKED A lot!<br/>
        WMS_InitSystem.sqf //Old Player Watch<br/>
        WMS_15sec_watch.sqf<br/>
        WMS_30sec_watch.sqf<br/>
        WMS_60sec_watch.sqf<br/>
        WMS_90sec_watch.sqf<br/>
        WMS_120sec_watch.sqf<br/>
        WMS_240sec_watch.sqf<br/>
		WMS_fnc_sys_FastNights<br/>
		WMS_fnc_sys_roamingVHLspawn<br/>
		WMS_fnc_sys_ServerMarkersUpdate<br/>
		WMS_fnc_sys_ServerRestart<br/>
		WMS_fnc_Watch_AMS<br/>
		WMS_fnc_Watch_Events<br/>
		WMS_fnc_Watch_Players<br/>
		WMS_fnc_Watch_RoamingINF //Old WatchnDestroy<br/>
		WMS_fnc_Watch_RoamingVhl<br/>
		WMS_fnc_Watch_Triggers<br/>
    ADDED All Recon Mission Variables<br/>
    ADDED WMS_CustomizedMap = ["Altis","Tanoa","Malden","Enoch","tem_kujari","Vt7"];  and default loadout/vehicles for other maps<br/>
    ADDED WMS_MapeName = worldName;<br/>

v1.335 2020DEC16<br/>
    TWEAKED Base Attack AI Skills (lowered ~20%) //Base lvl1 = 0.15 to 0.3, lvl2 & lvl3 = 0.15 to 0.35, , lvl4 & lvl5 = 0.2 to 0.4, lvl6 & lvl7 = 0.25 to 0.5, lvl8 & lvl9 = 0.3 to 0.55, lvl10 0.35 to 0.6<br/>
    FIXED Base attack reinforcement vehicles Kickass variable, no self-destroy if the vehicle camp at the door<br/>
    ADDED "Recon Mission" marker name<br/>
    TWEAKED Recon Mission reward, bigger loot equivalent to Hardcore mission reward<br/>
    ADDED Day/night time filter to base attack, (sunOrMoon > 0.9), no night time base attack<br/>

v1.334 2020DEC15<br/>
    ADDED WMS_DynAI_Skills	= [0.15, 0.3, 0.45, 0.6]; //+random 0.15 //lowered DynAI skills, adjusted to Player Respect [0/1000, 1001/25000, 25001/75000, >75001]<br/>
    TWEAKED Altis AI Count: WMS_AI_MaxUnits_C = 200; WMS_AI_RoamingVHLcount = 20;<br/>
    TWEAKED Base Attack groups spawns<br/>

v1.333 2020DEC07<br/>
    TWEAKED Base Attack Reinforcement: _flag setVariable ["BaseATKReinforce", ["runner","paradrop","VHLpatrol","AIRpatrol","AIRassault","runner","paradrop"],true];<br/>

v1.332 2020DEC06<br/>
    REMOVED Crows from Base Attack: local only not Global<br/>
    
v1.331 2020DEC05<br/>
    ADDED Basic Base Attack, 6 to 20 AI, 2 to 4 grps<br/>
    ADDED Reinforcement to Base Attack<br/>

v1.33 2020DEC04
    ADDED Forest Zones on Malden<br/>
    ADDED chat message for the Bike cumulative reward //["Congratulation Ridder! There is some respect for your ride"] remoteExecCall ['SystemChat',_x];<br/>
    ADDED CSAT Texture for AI Blackfoot, Huron, Pawnee //["B_Heli_Attack_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]];<br/>
    ADDED BBQcamp to DynAI, Trigger spawn only<br/>
    FIXED Humanidrop RDO vehicle WMS_AI_RdoTruck = "I_E_Offroad_01_comms_F";<br/>
    TWEAKED WMS_AI_Create_Triggers from "GUER" to "ANYPLAYER" to try to stop AI to activate triggers<br/>

v1.3 2020DEC03<br/>
    SPLIT WMS_PlayerWatch to unify the system with an "Arma Vanilla" loadouts/vehicles by default.<br/>
    ADDED WMS_list_Crates_vanilla<br/>
    ADDED WMS_list_Loadout_vanilla<br/>
    ADDED WMS_list_Loadout_vanilla_NOSCOPE<br/>
    ADDED WMS_list_Loadout_FullMod<br/>
    ADDED WMS_list_VHL_vanilla<br/>
    ADDED WMS_list_VHL_FullMod<br/>
    ADDED to MPmission WMS_DshkmOnPandur<br/>
    ADDED to MPmission WMS_OldChestOnPandur<br/>
    ADDED to MPmission WMS_OpforVHL_Radar<br/>
    ADDED to MPmission WMS_QuantumComputer (admin for now)<br/>
    ADDED ReconMission (Need to be added to the Event_watch)<br/>
    ADDED Cumulative Reward for Ridding Bike (N checks, Every 60 seconde if bike moved x meters, add x respect to the ridder)<br/>

No update in the change log for... some time<br/>

v1.253 2019AUG30<br/>
    ADDED WMS_fnc_AMS_Mission_HomeDepot<br/>
    ADDED WMS_SupplyList = [];<br/>
    ADDED WMS_ToolList = [];<br/>
    ADDED WMS_MeatList = [];<br/>
    ADDED WMS_AMS_addPoptabsRwd = true; //Add poptabs in the mission reward crate/vehicle<br/>
    ADDED WMS_AMS_PoptabsRwd = [1000,500]; //"intermediate": *1.5; "difficult": *2; "hardcore": *2.5;<br/>
    TWEAKED WMS_fnc_AMS_SpawnRewards for loot type<br/>
    FIXED WMS_fnc_infantryProgram_VHLpatrol empty turrets on some AI patrols {WMS_AI_Units_Class createUnit [_randomPosTarget, _VHLgrp, "this moveinTurret [_vehic, _x]"];}forEach (allTurrets _vehic);<br/>

v1.252 2019AUG29<br/>
    ADDED WMS_fnc_AMS_Mission_GuardedTower<br/>
    TWEAKED WMS_fnc_AMS_SpawnRewards for difficulty adaptative loot //_lootCount = [[1,1,2],[1,1,1],[2,1,1],[1,2,2],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]<br/>
    TWEAKED WMS_AMS_Running_Array pushback []; //Mines have now their hown Array to despawn<br/>

v1.251 2019AUG28<br/>
    ADDED WMS_fnc_AMS_Mission_ForestCamp<br/>
    ADDED DoD sounds to Missions unlock<br/>

v1.25 2019AUG27<br/>
    ACTIVATED AMS - firt 2 test missions<br/>
    ADDED WMS_AMS_Watch<br/>
    ADDED WMS_fnc_AMS_Succes<br/>
    ADDED WMS_fnc_AMS_TimedOut<br/>
    ADDED WMS_fnc_AMS_SpawnRewards to replace paradrop_RLA_Unifed for AMS<br/>

v1.24 2019AUG20<br/>
    ADDED Cleaner for empty group in WMS_AI_RoamingVhl_Watch<br/>
        if ((count units ((_x select 2) select 0)) < 1) then {
				if (WMS_IP_LOGs) then {diag_log format ["[30 sec AI VHL Watch]|WAK|TNA|WMS| %1 is no more, rest in peace and get the fuck out of the Array", _x]};
				_x set [1,0];
			};<br/>
    ADDED WMS_fnc_AMS_CreateMarker<br/>
    ADDED WMS_fnc_AMS_FillStuff<br/>
    ADDED WMS_fnc_AMS_SpawnGroups<br/>
    ADDED WMS_fnc_AMS_SpawnMineFild<br/>
    ADDED WMS_fnc_AMS_SpawnObjects<br/>
    ADDED WMS_fnc_AMS_SpnAiBlkListFull<br/>
    ADDED WMS_humaniDropList = [];<br/>

v1.23 2019AUG19<br/>
    ADDED WMS_Event_Watch to manage different events to spawn on the server (AI/Humani Drops, Repair camps, heliCrashs)<br/>
        WMS_Events = true;<br/>
        WMS_EventsDelay = 120;<br/>
        WMS_Events_list = [];<br/>
    ADDED DeadManSwitch to the suicide Bomber<br/>

v1.22 2019AUG18<br/>
    ADDED WMS_fnc_Event_HumaniDrop (empty crate for now)<br/>
        WMS_HumaniDrop = true;<br/>
        WMS_HumaniDropCount = 1;<br/>
        WMS_HumaniDropDelay = 1100;<br/>
    ADDED Alarm on the stolen vehicle for WMS_fnc_DynAI_steal<br/>
		playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", _x, false, (position _x), 2, 1, 0];<br/>

v1.21 2019AUG13<br/>
    ADDED Infantry patrols to AI SupplyDrops<br/>
    ADDED Livonia loadout/weaps to AI<br/>
        WMS_Loadout_Livonia = [];<br/>
        WMS_Weaps_LivoniaMix = [];<br/>
    FIXED WMS_ATMines	= "BWA3_DM31AT";<br/>

v1.2 2019AUG12<br/>
    ADDED hidden community trader for some RHSAFRF equipement<br/>

v1.2 2019AUG09<br/>
    ADDED AI SupplyDrops function<br/>

v1.13 2019MAR04<br/>
    ADDED ejection Dead AI from their vehicles<br/>
    ADDED variable to triggers + activated triggers array<br/>
        WMS_activatedTriggs 	= [];<br/>
        Activation:<br/>
            thisTrigger setVariable ['WMS_triggRef',[thisTrigger, _triggTime],true];<br/>
            WMS_activatedTriggs pushBack [thisTrigger, _triggTime];<br/>
        Desactivation:<br/>
            private _trigRef = thisTrigger getVariable 'WMS_triggRef';<br/>
            WMS_activatedTriggs deleteAt (WMS_activatedTriggs find _trigRef);<br/>
    ADDED Trigger Check and reinforce<br/>
        WMS_triggCheck			= 600+(random 300); //calculated at server start<br/>
        WMS_triggCheckChance	= 50; //chance to send reinforcement<br/>
        WMS_triggCheckDist		= 200; //minimun player distance from other AI to send reinforcement<br/>
        if (random 100 < WMS_triggCheckChance && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B) && (_target distance2D (_target findNearestEnemy _target)) > WMS_triggCheckDist) then {<br/>
            [_target, position _target, "reinforcement"] call WMS_fnc_DynAI_selScen;<br/>
            };
    
v1.12 2019MAR03<br/>
    ADDED Poptabs on AI + AI's vehicles<br/>
        WMS_DynAI_addPoptabsINF     = true;<br/>
        WMS_DynAI_poptabsINF        = [25,50];<br/>
        WMS_DynAI_addPoptabsVHL     = true;<br/>
        WMS_DynAI_poptabsVHL        = [250,750];<br/>
    ADDED reward on AI kill<br/>
        WMS_DynAI_RespectRwdOnKill  = true;<br/>
        WMS_DynAI_respectBonus      = 150;<br/>
        WMS_DynAI_distBonusMax      = 750;<br/>
        WMS_DynAI_distBonusCoef     = 0.2;<br/>

v1.11 2019MAR02<br/>
    ADDED randomize position for triggers<br/>
        WMS_Pos_Rdz         = 50;<br/>
        WMS_Pos_Custom_Rdz 	= 0;<br/>
    ADDED Chance to trigger action or not<br/>
        WMS_trigLocals_Chance 	= 40;<br/>
        WMS_trigVillages_Chance = 50;<br/>
        WMS_trigCities_Chance 	= 60;<br/>
        WMS_trigCapitals_Chance = 70;<br/>
        WMS_trigHills_Chance 	= 33;<br/>
        WMS_Forests_Chance		= 50;<br/>
        WMS_Military_Chance		= 80;<br/>
        WMS_CustomTrig_Chance	= 60;<br/>

v1.1 2019FEB26<br/>
    ADDED ABU loadout for OPFOR units<br/>
        WMS_Loadout_ABU = [];<br/>
    ADDED Transport Helicopters List<br/>
        WMS_OPFOR_CustomAIR_Transport = [];<br/>
    ADDED Steal player's Vehicles function to AI groups<br/>
        [_grp] call WMS_fnc_DynAI_Steal;<br/>
        WMS_DynAI_Steal = true;<br/>
        WMS_DynAI_stealDist = 300;<br/>
    ADDED Cargo Units for VHL patrols<br/>
        WMS_DynAI_AddCargoUnits = true;<br/>
        WMS_DynAI_CargoUnits = 2;<br/>
    FIXED the Traders filter for Dynamic Threat.<br/>
    ACTIVATED Dynamic Threat with BaseAttack filter<br/>

v1.0 2019FEB24