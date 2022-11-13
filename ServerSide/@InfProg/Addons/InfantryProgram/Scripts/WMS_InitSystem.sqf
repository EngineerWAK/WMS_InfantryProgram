/**
* WMS_initSystem - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
WMS_serverCMDpwd			= "CHANGEME";
WMS_BlackList 				= [];	//list of player's UID "BlackListed" //define the player at 100000 respect far all AI spawn/reinforcement with custom setup in WMS_fnc_DynAI_selScen
WMS_InfantryProgram_list 	= [];	//list of player's UID autorised to use InfantryProgram Functions, Do not use in Exile right newOverlay
WMS_ServRestartSeconds 		= 18000; //5h	
WMS_DynamicFlightOps		= true; //Module //DFO, for Arma "Pilots" who want to keep busy, call from a chopper or from DFO base(s)
WMS_AmbientLife				= false; //Module  //spawn some little dudes, flying, drivinng, walking using boats, CIVILIAN by default //AL can spawn A LOT of units/vehicles/waypoints, be sure your box can handle it with other regular mission/roaming AI
WMS_exileFireAndForget 		= false; //FireAndForget is ONLY for Exile DB means Exile mod is running //auto activate WMS_exileToastMsg with Exile override
WMS_exileToastMsg 			= false; //Exile message system
WMS_IP_LOGs 				= false; //RPT logs
WMS_FastCombat				= false; //Activate NPC "Fast Combat": Accelerate Triggers/respawn, reduce cooldowns, can be changed during the round, the server will addapt
WMS_Watch_Triggers_Logs		= false; //RPT logs
WMS_magicSmoke 				= true; //puff of smoke/shaft/flare when NPC despawn
WMS_ServerMarkers 			= true;	//show Server FPS, AI and Deads count on the map
WMS_forceNoRain 			= false; //no more rain!
WMS_forceNoFog				= false; //no more fucking fog!
WMS_ServRestart 			= true;	//will shut down the server after WMS_ServRestartSeconds
///////////////NEW///////////////////////////////
WMS_HeadShotSound 			= true;
/////////////////////////////////////////////////
///////////ALL VARIABLES, UPDATE ONLY AFTER HERE
/////////////////////////////////////////////////
WMS_System_Version 			= "v2.756_2022NOV12_GitHub"; //SetPatrol Adjustment | working on EH "HandleDamage" for NPC (mostly for Headshot)
WMS_Thread_Start			= 15;	//how much to wait before starting all InfantryProgram loops
WMS_SVRstartLock 			= 90; //better spawn the first AMS mission BEFORE the server unlock, the first mission create a ~25 seconds lag for whatever reason
WMS_CustomizedMap			= ["ruha","xcam_taunus","Lythium","gm_weferlingen_summer","Altis","Tanoa","Malden","Enoch","tem_kujari","vt7"]; //TYPO !!!!!!!!! //Maps with custom config in WMS_customMapsSettings
if (true) then {diag_log format ["[WMS Starting Server Side]|WAK|TNA|WMS| Initialisation of the AI system at %1, rev %2", servertime, WMS_System_Version]};

/////////////MOVED UP!!!!!!
//WMS_ServRestartSeconds 	= 18000; //5h
//WMS_IP_LOGs 				= false; //RPT logs
//WMS_FastCombat			= false; //Activate NPC "Fast Combat": Accelerate Triggers/respawn, reduce cooldowns, can be changed during the round, the server will addapt
//WMS_Watch_Triggers_Logs	= false; //RPT logs
//WMS_magicSmoke 			= true; //puff of smoke/shaft/flare when NPC despawn
//WMS_ServerMarkers 		= true;	//show Server FPS, AI and Deads count on the map
//WMS_forceNoRain 			= false; //no more rain!
//WMS_forceNoFog			= false; //no more fucking fog!
//WMS_ServRestart 			= true;	//will shut down the server after WMS_ServRestartSeconds
//WMS_DynamicFlightOps		= true; //Module //DFO, for Arma "Pilots" who want to keep busy, call from a chopper or from DFO base(s)
//WMS_AmbientLife			= false; //Module  //spawn some little dudes, flying, drivinng, walking using boats, CIVILIAN by default //AL can spawn A LOT of units/vehicles/waypoints, be sure your box can handle it with other regular mission/roaming AI
//WMS_exileFireAndForget 	= false; //FireAndForget is ONLY for Exile DB means Exile mod is running //auto activate WMS_exileToastMsg with Exile override
//WMS_exileToastMsg 		= false; //Exile message system
/////////////MOVED UP!!!!!!

WMS_serverCMDpwd serverCommand "#Lock"; //will be unlocked at WMS_15sec_Watch launch
{WMS_serverCMDpwd serverCommand format ["#kick %1", (getPlayerUID _x)]}foreach allPlayers; //kick all players trying to connect before the server is locked-ready-unlocked

WMS_InfantryProgram_Vehicles = [ //Maybe add _vehicle setvariable ["IP_ExtractionVehicle", true, true]; to the extraction vehicles at spawn and use it to filter
	//"Exile_Bike_MountainBike", //bike from XM8
	//"B_Quadbike_01_F",
	"Steerable_Parachute_F", //parachute
	"rhsgref_hidf_canoe",

	"UK3CB_BAF_Static_M6_Deployed", //mortar
	"UK3CB_BAF_Static_M6", //mortar
	
	"I_E_Heli_light_03_unarmed_F", //default Chopper, not in the trader
	"UK3CB_BAF_Wildcat_AH1_TRN_8A", //Extraction chopper

	"I_APC_tracked_03_cannon_F", //Extraction vehicle test

	"UK3CB_BAF_RHIB_GPMG", //boat
	"sab_C130_J", //Paradrop plane if SAB
	"RHS_C130J", //Paradrop plane if RHS
	"B_T_VTOL_01_infantry_blue_F" //Paradrop plane default, yeah, that's the Bohemia C130...
];
WMS_RCWS_Vhls = [ //I don't like them, player does, because they are OP, so let's give them the vehicles, with the reinforcement to go with it. //do not wast time with tank/APC here they are already filtered
	"B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F",
	"O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F",
	"I_MRAP_03_gmg_F","I_MRAP_03_hmg_F",
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F", //"O_APC_Wheeled_02_rcws_v2_F",//I use unarmed version of the marid most of the time, for logistic
	"rhsusf_m1151_m2crows_usarmy_wd","rhsusf_m1151_mk19crows_usarmy_wd","rhsusf_M1220_M153_M2_usarmy_wd","rhsusf_M1220_M153_MK19_usarmy_wd","rhsusf_m1240a1_m2crows_usarmy_wd","rhsusf_m1240a1_mk19crows_usarmy_wd","rhsusf_m1151_m2crows_usmc_wd","rhsusf_m1151_mk19crows_usmc_wd","rhsusf_m1240a1_m2crows_usmc_wd","rhsusf_m1240a1_mk19crows_usmc_wd",
	"rhsusf_M1238A1_M2_socom_d","rhsusf_M1238A1_Mk19_socom_d","rhsusf_M1239_M2_socom_d","rhsusf_M1239_MK19_socom_d","rhsusf_m1245_m2crows_socom_d","rhsusf_m1245_mk19crows_socom_d","rhsusf_m1245_m2crows_socom_deploy","rhsusf_m1245_mk19crows_socom_deploy","rhsusf_m1151_m2crows_usmc_d","rhsusf_m1151_mk19crows_usmc_d","rhsusf_m1240a1_m2crows_usmc_d","rhsusf_m1240a1_mk19crows_usmc_d"
];
/////////////////////////////////
//			CRATES ITEMS
/////////////////////////////////
if !(WMS_exileFireAndForget) then {
		execVM "\InfantryProgram\Scripts\WMS_List_Crates_ACE_RHS.sqf" //"\InfantryProgram\Scripts\WMS_List_Crates_Vanilla.sqf"
	}else{
		execVM "\InfantryProgram\Scripts\WMS_List_Crates_Exile.sqf"
};
/////////////////////////////////
//			VARIABLES
/////////////////////////////////
WMS_Currency 				= "Money"; //test for personalized currency name
////////////
WMS_AllDeadsMgr				= []; //will cleanup dead bodies after x secondes
WMS_Player_AllDeads			= 1800; //Not Used Yet
WMS_AMS_AllDeads			= 1200;
WMS_DynAI_AllDeads			= 600;
WMS_DFO_AllDeads			= 180;
WMS_Others_AllDeads			= 90; //Not Used Yet
//C130 variables
WMS_MoveInCargo_C130_LastTime 		= time; //infantry program Active List only, halo jump from "C130"
WMS_InfantryProgram_C130CoolDown 	= 300;
WMS_C130_Altitude 					= 150;
WMS_C130_Type 						= "B_T_VTOL_01_infantry_blue_F";
//Camps Variables
WMS_Compo_BunkerCamp_LastTime 		= time; //infantry program Active List only, build a small camp
WMS_Compo_BunkerCamp_CoolDown 		= 750;
//ArtySupport variables
WMS_IP_ArtySup_LastT 		= time; //infantry program Active List only, call artillery on target
WMS_IP_ArtySup_CoolD 		= 600; //600
//BlackFich Support variables
WMS_IP_BlackFishSup_LastT 	= time; //infantry program Active List only, call BlackFish/AC130 support
WMS_IP_BlackFishSup_CoolD 	= 1200;
//Extraction variables 
WMS_IP_ExtractChop_LastT 	= time; //infantry program Active List only (or from a "new" radio), call extracion chopper
WMS_IP_ExtractChop_CoolD 	= 300;
WMS_IP_Extract_Alt 			= 150; //Default
WMS_Extraction_GND_LastTime = time; //infantry program Active List only, call a ground extraction (IFV/APC)
WMS_Extraction_GND_CoolDown = 400;
WMS_ExtractionChopper_Type 	= ["I_E_Heli_light_03_unarmed_F"];  //infantry program Active List only
WMS_ExtractionVehicle_Type 	= ["I_APC_tracked_03_cannon_F"];  //infantry program Active List only
WMS_DeliveryChopper_Type 	= ["I_E_Heli_light_03_unarmed_F"];  //infantry program Active List only
//Infantry chopper variables
WMS_INFbyChopper_LastTime 	= time;  //infantry program Active List only, call an infantry group backup
WMS_INFbyChopper_CoolDown 	= 300;
WMS_INFsquad_LastTime 		= time;
WMS_INFsquad_CoolDown 		= 900;
WMS_WDtrader_LastTime 		= time; //infantry program Active List only, call a wast dump trader(Exile), not supported anymore but function probably still there
WMS_WDtrader_CoolDown 		= 400;
//using this vehicle give cumulative reward
WMS_Riding_Rwd 		= true; 	//give a reward for riding bicycle
WMS_RidingCount 	= 3; 		//how many positive check before adding the respect
WMS_RidingDist 		= 10; 		//Distance to ride to validate the count
WMS_ThanksForRiding = "rhsgref_hidf_canoe"; //"Exile_bike_MountainBike"; //NOT ANYMORE
//////////////////////////////
//Fast Night
//////////////////////////////
WMS_RandomStartTime 	= true;
WMS_RandomStart_Hour 	= 5;
WMS_RandomStart_Random 	= 4;
WMS_Date 				= [2022,8,25,7,00];//full moon
WMS_FastNight 			= true;
WMS_FastNight_Morning 	= 7; 	//morning start at
WMS_FastNight_Evening 	= 15; 	//evening start at, 1 hour before the night
WMS_FastNight_Morn_Even = 2; 	//morning/evening time speed
WMS_FastNight_Day 		= 6; 	//day time speed
WMS_FastNight_Night 	= 38;  	//night time speed
//////////////////////////////
//Camp/events spawns
//////////////////////////////
WMS_Events 				= true;

WMS_RepairCamp 			= true; //spawn a logistic camp on the map, ammo/repair/fuel
WMS_RepairCampCount 	= 1;
WMS_RepairCampDelay 	= 500;

WMS_HeliCrash 			= true;	//spawn Helicrash layout on the map, 1 crate and few NPCs
WMS_HeliCrashCount 		= 3;
WMS_HeliCrashDelay 		= 900;

WMS_SupplyDrop 			= true;	//spawn an OPFOR paradrop on the map (Forest), 1 crate, few NPCs, lot of AT mines
WMS_SupplyCrate			= "C_IDAP_supplyCrate_F"; //Orange
WMS_SupplyDropCount 	= 2;
WMS_SupplyDropDelay 	= 1100; //+random 60
WMS_SupplyDropMkr 		= "o_support";
WMS_SupplyColor			= "ColorOrange";

WMS_HumaniDrop 			= true;	//spawn a humanitarian paradrop on the map, 1 plane, 1 to 3 crates, no NPC
WMS_HumaniDropMkr		= "c_plane";
WMS_UmaniDropColor		= "ColorCIV";
WMS_Humanicrate 		= "CargoNet_01_box_F";//"R3F_WeaponStock" //"CargoNet_01_box_F"
WMS_HumaniDropCount 	= 3;
WMS_HumaniDropDelay 	= 1200; //+random 60

WMS_ReconMission		= true; //spawn a "recon" mission, 1 flag, few NPCs, get the flag to spawn the next mission, big crate at the last mission (3 to 12)
WMS_ReconMissionCount	= 1; //0 or 1, NOT MORE Recon Mission at the same time
WMS_ReconMissionDelay	= 600;
	//WMS_Recon_Type 			= ["crate","none","safe","none"];//Not used yet
WMS_Recon_Steps 		= [3,6,9,12]; //randomSelect
WMS_Recon_Rewards		= [[6,1,3],[3,1,2],[6,1,2],[1,3,3],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
WMS_Recon_Border_Radius = 300;
WMS_Recon_Cap_Radius 	= 20;
WMS_Recon_Guards 		= true;
WMS_Recon_Guards_Chance = 75;
WMS_Recon_Guards_Skill 	= 0.6;

WMS_CaptureZone			= true; //Kill the first group of NPC, get inside and stay alive until the end of the timer //many stuff is setup in the function itself WMS_fnc_CaptureZone
WMS_CaptureZoneDelay	= 300;
WMS_CaptureZone_Rad 	= [25,35,50]; //Capture zone Radius //only _radius select 0 is used
WMS_CaptureZone_Tmr		= [240, 400, 600, 900]; //time to capture the zone //easy, moderate, difficult, hardcore
WMS_CaptureZone_mkr		= "selector_selectedEnemy";
	//WMS_CaptureZone_Wav		= [5,7,9]; //AI Waves to come
	//WMS_CaptureZone_Dis		= [100,300]; //AI waves spawn distances
	//WMS_CaptureZone_Bdr 		= []; //Sign_Sphere25cm_F objects
//////////////////////////////
//AmbientLife
//////////////////////////////
WMS_AL_Version		= "v0.26_2022JUN06";
if (WMS_AmbientLife) then { //spawn some little dudes, flying, drivinng, walking using boats, CIVILIAN by default
//WMS_AmbientLife		= true; //moved UP
WMS_AL_Standalone	= false; //Keep true if you don't use WMS_DFO or WMS_InfantryProgram
WMS_AL_LOGs			= false; //Debug
WMS_AL_IncludeLoc	= true; //will include "nameLocal" locations in the position list
WMS_AL_StripOffUnit = false; //Remove or not NPC loadout when they die
WMS_AL_LockVehicles = false; //lock vehicles for players
WMS_AL_VHLmax		= 10; //Max vehicles (all included) running at the same time
WMS_AL_UnitMax		= 5; //Max units (groups if _CombatBehav true) patroling at the same time
WMS_AL_VhlBalance	= [2,1,0,1,1,2,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
WMS_AL_Skills		= [0.8, 0.7, 0.2, 0.3, 0.3, 0.6, 0, 0.5, 0.5]; //"spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"

WMS_AL_CombatBehav	= false; //if you want to use it as hostile roaming AI
WMS_AL_Faction		= CIVILIAN;
WMS_AL_Units		= [//infantry classname, do not mix factions!
						"C_man_p_beggar_F","C_man_1","C_Man_casual_1_F","C_Man_casual_2_F","C_Man_casual_3_F","C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F",
						"C_Man_ConstructionWorker_01_Black_F","C_Man_ConstructionWorker_01_Blue_F","C_Man_ConstructionWorker_01_Red_F","C_Man_ConstructionWorker_01_Vrana_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F"
					]; 
WMS_AL_Vehicles		= [[ //[[AIR],[GROUND],[SEA]]
						"C_Heli_Light_01_civil_F","C_IDAP_Heli_Transport_02_F","C_Heli_light_01_digital_F","C_Heli_light_01_shadow_F"
					],[
						"C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_01_F","C_Offroad_01_comms_F","C_Offroad_01_repair_F","C_Quadbike_01_F","C_SUV_01_F","C_Tractor_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_medevac_F","C_Van_02_transport_F"
					],[
						"C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Rubberboat","C_Boat_Transport_02_F","C_Scooter_Transport_01_F"
					]];
WMS_AL_AceIsRunning = true; //Automatic
WMS_AL_LastUsedPos	= [0,0,0]; //Dynamic
WMS_AL_Running		= [[],[]]; //array of arrays of data [[VEHICLES],[INFANTRY]] //[HexaID,time,group,vehicle]
};
//////////////////////////////
//Dynamic Flight Ops
//////////////////////////////
WMS_DFO_Version			= "v1.15_2022OCT19_GitHub";
if (WMS_DynamicFlightOps) then { //Dynamic Flight Operations, for REAL Arma "pilots"!
//WMS_DynamicFlightOps	= true; //moved UP
WMS_DFO_LOGs			= false; //For Debug
WMS_DFO_Standalone		= false; //keep true if you don't use WMS_InfantryProgram
WMS_DFO_CreateChopper	= false; //if your mission file doesn't have choppers available
WMS_DFO_Reinforcement	= true; //Each mission has it's own type of reinforcement
WMS_DFO_UseJVMF			= true; //https://github.com/Project-Hatchet/H-60
WMS_DFO_RemoveDup		= true; //delete dead NPC's primary weapon and backpack
WMS_DFO_UsePilotsList 	= true; //if you want to limit DFO use to some players
WMS_DFO_SmokeAtLZ		= true; //pop a smoke/flare on the group you have to pickUp
WMS_DFO_HideLZTarget	= false; //hide the target spawned at the LZ (actualy just return it, texture only on one side)
WMS_DFO_InfUnlOverride	= false; //admins can force it "on the fly" in the console
WMS_DFO_InfUnloadType 	= 3; //0: dump, 1: land, 2: rappel (Advanced Rappeling), 3: fastrope (not yet) //this should be dynamic unless override
WMS_DFO_InfLoadType 	= 0; //0 = orderGetIn (need to land), 1 = moveInAny (no need to land but no animation)
WMS_DFO_PilotsList		= []+WMS_InfantryProgram_list; //Player UID, Only those players will be able to use DFO if WMS_DFO_UsePilotsList
WMS_DFO_MaxRunning		= 3; //Max missions can run in the same time
WMS_DFO_CoolDown		= 600; //time before the next mission can be called
WMS_DFO_Timer			= 1800; //timer before mission timeOut, no reset/extend
WMS_DFO_MinMaxDist		= [3000,6000]; //minimum and maximum distance the next step of the mission will be, unless "custom" position like "forest","cities", etc...
WMS_DFO_TriggMaxSpeed	= 18; //Maximum speed in the trigger to unlock the next level of the mission *1.5 for Medevac
WMS_DFO_ReinfTriggDist	= 1000; //distance trigger will call reinforcement
WMS_DFO_MkrRandomDist	= 500; //random distance to place the marker from SAR CSAR missions otherwise there is no "search"
WMS_DFO_Reward			= [500,2000,['ACE_Can_Franta','ACE_Can_RedGull','ACE_MRE_LambCurry','ACE_MRE_MeatballsPasta','ACE_bloodIV_500','ACE_morphine','ACE_quikclot']]; //["rep","money",items for chopper return]
WMS_DFO_SarSeaPosition	= "sea"; //"sea" or "random" //some maps doesnt have water
WMS_DFO_NoSeaMaps 		= ["ruha","xcam_taunus","Lythium","gm_weferlingen_summer","Enoch","tem_kujari","juju_kalahari"];
WMS_DFO_OPFORcbtMod		= "YELLOW"; //Vehicle crew only //"WHITE" : Hold fire, engage at will/loose formation //"YELLOW" : Fire at will, keep formation //"RED" : Fire at will, engage at will/loose formation
WMS_DFO_CargoType		= ["CargoNet_01_barrels_F","C_IDAP_CargoNet_01_supplies_F","CargoNet_01_box_F"];
WMS_DFO_MissionTypes	= [["inftransport","cargotransport","sar","medevac"],["airassault","casinf","casarmored","cascombined","csar"],["inftransport","cargotransport","airassault","casinf","casarmored","cascombined","csar","sar","medevac"]];// [[CHILL],[COMBAT],[RANDOM]]
WMS_DFO_Reinforcements	= ["paradrop","paradrop","paradrop","VHLpatrol","VHLpatrol","AIRpatrol","AIRassault"]; //["AIRpatrol","VHLpatrol","paradrop","AIRassault"] //TYPO!!!
WMS_DFO_NPCskills		= [0.8, 0.7, 0.2, 0.3, 0.3, 0.6, 0, 0.5, 0.5]; //"spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"
WMS_DFO_ExclusionZone	= []; //[[[x,y,z],radius],[[x,y,z],radius],[[x,y,z],radius],[[x,y,z],radius]]; will work for "random" and "sea" spawns, not for forests/locals/bases or others
//VANILLA:
WMS_DFO_Choppers		= [["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],["B_Heli_Transport_01_F"],["B_Heli_Transport_03_unarmed_green_F","I_Heli_light_03_unarmed_F"],["C_IDAP_Heli_Transport_02_F"]]; //[["pylons","pylons"],["doorGunners","doorGunners"],["transport","transport"],["medevac","medevac"]];
WMS_DFO_NPCvehicles		= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
						["O_Heli_Attack_02_dynamicLoadout_F"],
						["O_Heli_Light_02_dynamicLoadout_F"],
						["O_Heli_Transport_04_covered_F"],
						["O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"],//AA first
						["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F"],//"AA" first
						["O_MRAP_02_hmg_F","O_LSV_02_armed_F","O_G_Offroad_01_armed_F"],
						["O_Truck_02_medical_F","O_Truck_02_Ammo_F"],
						["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
						["O_static_AA_F","O_Mortar_01_F","O_GMG_01_high_F","O_HMG_01_high_F"],//AA first
						["O_T_Boat_Armed_01_hmg_F"]];
WMS_DFO_NPCs			= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
						["O_crew_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_AR_F"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
						["B_helicrew_F","B_soldier_AR_F","B_Soldier_GL_F","B_soldier_M_F","B_Soldier_F"], //crew first //in arma civillian can not have weapon...
						["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
WMS_DFO_Markers			= ["loc_heli","mil_end_noShadow"]; //["mission","RTB"]; //["n_support","n_hq"]; //["loc_heli","mil_end_noShadow"]
WMS_DFO_MkrColors		= ["colorOrange","colorGreen","colorRed"]; //["mission","RTB", "bigDanger"];
WMS_DFO_MissionPaths	= [["BASE","LZ1","BASE"],["BASE","LZ1","LZ2"]]; // "takeoff/mission/complet" //the first "BASE" could become "AIR" if mission called during flight
WMS_DFO_LastCall		= (time-WMS_DFO_CoolDown);
WMS_DFO_Running			= []; //KEEP EMPTY
WMS_DFO_RunReinforce	= []; //KEEP EMPTY
	//WMS_DFO_ToDelete		= []; //KEEP EMPTY //[timeToDelete,[objects]]
WMS_DFO_AceIsRunning 	= false; //this should go in WMS_InfantryProgram
publicVariable "WMS_DFO_Running"; //NO TOUCH
publicVariable "WMS_DFO_MaxRunning"; //NO TOUCH
publicVariable "WMS_DFO_LastCall"; //NO TOUCH
publicVariable "WMS_DFO_CoolDown"; //NO TOUCH
publicVariable "WMS_DFO_UsePilotsList"; //NO TOUCH
publicVariable "WMS_DFO_PilotsList"; //NO TOUCH
publicVariable "WMS_DFO_MissionTypes"; //NO TOUCH
publicVariable "WMS_DFO_AceIsRunning"; //NO TOUCH
publicVariable "WMS_DFO_Reward"; //NO TOUCH
//Maps custom settings
if (worldName in WMS_DFO_NoSeaMaps) then {
	WMS_DFO_SarSeaPosition	= "random";
};
};
//////////////////////////////
//AI variables
//////////////////////////////
	//WMS_AI_forceInfKillCount= false; //ACE fuckedup infantry kill on the scoreBoard //not used anymore
WMS_ForceDiverOverWater	= true; //will force Diving loadout if the NPC spawn over/in water
WMS_AI_LaunchersOPF 	= [["launch_RPG7_F","launch_RPG7_F","launch_RPG7_F","launch_RPG7_F","launch_RPG32_F","launch_MRAWS_sand_rail_F"],["launch_O_Titan_F"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
WMS_AI_LaunchersBLU 	= [["launch_RPG7_F","launch_RPG32_F","launch_MRAWS_sand_rail_F"],["launch_B_Titan_F"],["launch_B_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
WMS_AI_Planes			= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //sab_C130_J_C // NO AN2_A2 without EXILE
WMS_AI_RdoTruck 		= "I_E_Offroad_01_comms_F"; //Humanidrop //"rhs_gaz66_r142_vdv" "I_E_Offroad_01_comms_F"
WMS_AI_ATstation 		= "O_HMG_02_high_F"; //roadBlock //AMS C192 //rhs_D30_at_msv //Better be an HMG than AT Titan static
WMS_AI_AAstation 		= "O_static_AA_F"; //AMS AA battery //"RHS_ZU23_VDV"
WMS_AI_HMG 				= "O_HMG_02_high_F";
WMS_AI_HMG_Scope 		= "O_HMG_01_high_F";
WMS_AI_HMG_Shield		= "B_G_HMG_02_high_F";
WMS_AI_Arty				= "O_Mortar_01_F";
WMS_AI_GMG 				= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
WMS_AI_Attachements		= ["acc_flashlight","acc_pointer_IR"]; //lot of RHS stuff on customMapsSetting TANOA
WMS_AI_Units_Class 		= selectRandom ["O_G_Soldier_F","O_Soldier_F","O_T_Soldier_A_F","O_R_Gorka_F"];//,"O_G_Engineer_F","O_T_Engineer_F","O_Engineer_F" "C_man_p_fugitive_F_afro"
WMS_AI_Additems 		= [1,2]; //items to ad to NPCs inventory, select 0 + random select 1
WMS_AI_MaxUnits_A 		= 100; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
WMS_AI_MaxUnits_B 		= 110; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
WMS_AI_MaxUnits_C 		= 120; //stop Base attack and missions spawn
WMS_AI_AddCargoUnits 	= true; //add NPCs in vehicles cargo
WMS_AI_CargoUnits	 	= 2;
//paratroopers:
WMS_AI_Para_remRPG 				= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_OPFORParadrop_LastTime 	= time;//NO TOUCH
WMS_AI_bluforParadrop_LastTime 	= time;//NO TOUCH
//Intantry:
WMS_AI_grenades 				= ["HandGrenade","MiniGrenade","SmokeShellRed"];
WMS_AI_PlayerDistToDespawnINF 	= 300;
WMS_AI_OPFORpatrol_CoolDown 	= 900;
WMS_AI_INFpatrol_remRPG 		= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_OPFORPatrol_LastTime 	= time;//NO TOUCH
WMS_AI_bluforPatrol_LastTime 	= time;
WMS_AI_bluforPatrol_CoolDown 	= 900;
//Vehicle Ground:
WMS_AI_RoamingVHL				= true;
WMS_AI_RoamingVHL_KillRep		= 250;
WMS_AI_RoamingVHL_KillMoney		= 1500;
WMS_AI_RoamingVHL_LastTime 		= time;
WMS_AI_RoamingVHL_Skill			= [0.15, 0.35]; //skill + selectRandom
WMS_AI_RoamingVHL_remRPG 		= true; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_RoamingVHLcount 			= 10; //how many of them max
WMS_AI_RoamingVHL_MaxKick 		= 8; //if the vehicle is stuck or doesnt move, it will be destroyed after x checks //_vhl setVariable ["WMS_KickVehAss",0,true];
WMS_AI_PatrolTimer_VHL 			= 1500; //+(random 300)
WMS_AI_PlayerDistToSpawnVHL 	= 500;
WMS_AI_PlayerDistToDespawnVHL 	= 500;
WMS_AI_VHLwptDist 				= 5000;
//Vehicle Air:
WMS_AI_RoamingAIR				= true;
WMS_AI_RoamingAIR_LastTime 		= time; //NO TOUCH
WMS_AI_RoamingAIR_Skill			= [0.15, 0.35]; //skill + selectRandom
WMS_AI_RoamingAIRcount 			= 2; //how many of them max
WMS_AI_PatrolTimer_AIR 			= 2500; //+(random 300)
WMS_AI_PlayerDistToDespawnAIR 	= 1000;
WMS_AI_AIRwptDist 				= 7500;
//////////////////////////////
//Dynamic Threat setup
//////////////////////////////
WMS_DynAI 					= true; //dynamic AI/event will "randomly" spawn on one of the players every x seconds WMS_DynAI_threatFrequency. NPCs skill adapt to the player respect
WMS_DYNAI_HSDamageKill		= 2.5; //amount od damage to the head/face to instantly kill a NPC //[O Alpha 2-5:4,""head"",4.18725,bis_o2_6004,""rhs_ammo_762x51_M80_Ball"",16,bis_o2_6004,""ace_hdbracket""]
WMS_DynAI_Skills			= [0.08, 0.15, 0.25, 0.35]; //+random 0.15
WMS_DynAI_RepLvlAdapt		= [1000, 24000, 50000]; //0/easy/1000/moderate/24000/difficult/50000/hardcore
WMS_DynAI_threatFrequency 	= 900; //will be *2 if only 1 player and *1.5 time if 2 players
WMS_DynAI_threatCoefs 		= [2,1.5,1.2]; //[1player,2players,3players]
WMS_DynAI_addPoptabsINF 	= false; //Exile mod
WMS_DynAI_poptabsINF 		= [25,50]; //poptabs on the AIs [minimum+Random]
WMS_DynAI_addPoptabsVHL 	= false; //Exile mod
WMS_DynAI_addItemsVHL 		= true; //Exile mod
WMS_DynAI_CargoItems		= [1,0,2,1,1,2]; //0 = nothing, 1 = random items, 2 = AMS_FillStuff include weaps
WMS_DynAI_poptabsVHL 		= [250,750]; //poptabs in vehicles [minimum+Random]
WMS_DynAI_ejectDeads 		= true; //eject dead bodies from the vehicle
WMS_DynAI_RdoChatter		= true; //radio noise on patrol/building/roadblock AI spawn
WMS_DynAI_Steal 			= true; //NPCs will try to steal unlocked players vehicles. if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal}; //optional: _lookingFor, _distance //from waypoint action maybe
WMS_DynAI_stealDist 		= 250;
WMS_DynAI_Steal_Cooldown 	= 120; //General cooldown in secondes
WMS_DynAI_Steal_last 		= 60; //first/last time function checked for vehicles //if (time > (WMS_DynAI_Steal_last + WMS_DynAI_Steal_Cooldown)) then {fnc};
WMS_DynAI_sysChatMsg 		= 1; //0: nothing, 1: general, 2: group, 3: player
WMS_DynAI_ShowFragMsg 		= true; //display some informations about the kill
WMS_DynAI_RespectRwdOnKill 	= true;	//give respect to the player/killer depending the distance, closer = more respect
WMS_DynAI_respectBonus 		= 100; //max respect at 0m from the target
WMS_DynAI_distBonusMax 		= 300; //maximum distance to get respect
WMS_DynAI_distBonusCoef 	= 0.333; //bonus = respectBonus - (distance*distBonusCoef)
WMS_DynAI_distToFlag 		= 100; //used for Base Attack, if player/target less than WMS_DynAI_distToFlag m from territory center = base attack
	//WMS_DynAI_distToBuildings = 50; //not used
	//WMS_DynAI_BuildingCount 	= 5; //not used
WMS_DynAI_distToPlayers 	= 250; //Minimum distance to spawn AI from player
WMS_DynAI_traderDistance	= 200;  //Minimum distance to spawn AI from traders
WMS_DynAI_MinPosInBuildgs 	= 2; //minimun building positions to use the building for NPCs spawn
WMS_DynAI_MinDistBuildgs 	= 75; //minimum distance between player/target and the building to use to spawn the NPCs
WMS_DynAI_DestroyVHL 		= 50; //chance to destroy vehicles if killed is group leader
WMS_DynAI_remRPG 			= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_DynAI_LauncherChance 	= 15;
WMS_DynAI_MaxRunning		= 5; //maximum dynamic AI event running in the same time
WMS_DynAI_RunningCount 		= 0; //DO NOT CHANGE, KEEP 0
WMS_DynAI_LastTime 			= time; //NO TOUCH
WMS_DynAI_GunshipLight 		= ["B_Heli_Light_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]];
WMS_DynAI_GunshipMedium 	= ["B_CTRG_Heli_Transport_01_sand_F",[],[[],[]]];
WMS_DynAI_GunshipHeavy 		= ["B_Heli_Attack_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]]; //Mi-48 is fucking too heavy but nothing else for now
WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["SmokeShellRed","Chemlight_blue","mini_Grenade","Land_HumanSkull_F"],["SmokeShellRed","Chemlight_blue","mini_Grenade","GrenadeHand"],["SmokeShellRed","mini_Grenade","GrenadeHand"],["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","GrenadeHand","GrenadeHand"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000]]
WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F"]; //some forest triggers will detonate a bomb around the center of the forest's trigger
//Base attack:
WMS_DynAI_useBaseAtk 		= true; //Base attack if the player/target is near a territory
WMS_DynAI_BaseFlag 			= "rhsgref_serhat_radar"; //the "flag" className
WMS_DynAI_BaseAtkCoolDown	= 2700; //45 minutes
WMS_DynAI_BaseAtkLast 		= time; //NO TOUCH, unless you want the base attack to be available earlier/later
WMS_DynAI_BaseATKReinforce	= true; //keep it true, otherwise base attack are boring
WMS_DynAI_BaseATKReinforce_CD = 120; //cooldown between reinforce
WMS_DynAI_BaseATKReinforce_Last = time; //NO TOUCH
WMS_DynAI_BaseAtkRunning 	= 0; //NO TOUCH, KEEP 0
WMS_DynAI_BaseAtkMax 		= 1; //not sure mmore than base attack can run in the same time, would be quite a mess with coolDown/reinforcements
//Cities Invasion
WMS_Invasion 				= false; //very, VERY far from ready...
WMS_Invasion_Array 			= [];//Leave it empty
////////////////////
//FastCombat overrides, don't be a chiken
////////////////////
WMS_DynAI_threatFrequencyFC = 300;
WMS_DynAI_threatCoefsFC 	= [1.5,1.35,1.15]; //[1player,2players,3players]
WMS_triggCheck_FC			= 240; //triggers are set at server start, it'll need some work to dynamicaly change the vars
WMS_triggCheck_ChFC			= 90; //chances to trigger
WMS_trigLocals_ChFC 		= 70; //chances to trigger
WMS_trigVillages_ChFC 		= 75; //chances to trigger
WMS_trigCities_ChFC 		= 80; //chances to trigger
WMS_trigCapitals_ChFC 		= 85; //chances to trigger
WMS_trigHills_ChFC 			= 55; //chances to trigger
WMS_Forests_ChFC			= 65; //chances to trigger
WMS_Military_ChFC			= 95; //chances to trigger
WMS_TriggCoolDownCoefFC		= 0.5; //recalculate all original triggers cooldown with this coefficient
//WMS_fnc_AllDeadsMgr coef *0.5 for all
//WMS_DynAI_RdoChatter		= false; //overrides in the spawns themself
//WMS_DynAI_BaseATKReinforce_CD = 120; //cooldown between reinforce divided by 2 in fast combat
////////////////////
//MISSION AI
////////////////////
WMS_AMS 				= true; //Dymanic Missions with missions layouts, multigroups NPCs, reward when ALL NPC dead
WMS_AMS_Steal 			= true; //they will be looking for players vehicles to steal
WMS_AMS_AllowMissiles 	= true;	//give NPCs or not locking missiles launchers (AA/AT)
WMS_AMS_DelMissionFlag 	= true; //mission Flag prevent another mission to spawn at the same place
WMS_AMS_ejectDeads		= true;	//Eject deads from vehicles
WMS_AMS_DestroyStatics 	= true; //with ACE, this one need a variable on the NPC to destroy the static when the NPC die
WMS_AMS_AddActionOnReward = true; //will create a AddAction on the crate to sell it at the traders Zone (the last cartridges), might want to keep that false if Exile
WMS_AMS_StripOnArmoredK	= true; //remove all gears/weapons if NPC killed from tank/apc/RCWS
WMS_AMS_TrappOnArmoredK	= true; //create a mine at the deadbody if NPC killed from tank/apc/RCWS
WMS_AMS_HSDamageKill	= 3; //amount od damage to the head/face to instantly kill a NPC //[O Alpha 2-5:4,""head"",4.18725,bis_o2_6004,""rhs_ammo_762x51_M80_Ball"",16,bis_o2_6004,""ace_hdbracket""]
WMS_AMS_DestroyVHL 		= 90; //Chances to destroy NPC mission vehicle
WMS_AMS_VHL_KillRep		= 300; //respect reward for destroying NPCs vehicle
WMS_AMS_VHL_KillMoney	= 3000; //money reward for destroying NPCs vehicle
WMS_AMS_Reinforce  		= true; //reinforce mission NPCs 
WMS_AMS_LastReinforce 	= time;
WMS_AMS_ReinforceCoolD 	= 120;
WMS_AMS_addPoptabsUnits = false; //Exile
WMS_AMS_poptabsUnits 	= [25,25]; //Exile
WMS_AMS_addPoptabsRwd 	= false;  //Exile //Add poptabs in the mission reward crate/vehicle
WMS_AMS_PoptabsRwd 		= [1000,500]; //Add poptabs in the mission reward crate/vehicle
			   //skills = "spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"//,"endurance"
WMS_AMS_skillsMin 		= [0.1, 0.1, 0.005, 0.1, 0.1, 0.1, 0, 0.1, 0.1]; //MINIMUM skill mission NPCs can have //will be used to compile custom skills
WMS_AMS_skillsMax 		= [1, 0.85, 0.85, 0.7, 0.8, 0.8, 0, 1, 0.85]; //MAXIMUM skill mission NPCs can have //will be used to compile custom skills
WMS_AMS_skilleasy 		= [0.80, 0.8, 0.3, 0.3, 0.2, 0.6, 0, 0.6, 0.6];
WMS_AMS_skillmoderate 	= [0.85, 0.9, 0.4, 0.4, 0.3, 0.6, 0, 0.6, 0.8];
WMS_AMS_skilldifficult 	= [0.90, 0.95, 0.6, 0.5, 0.4, 0.8, 0, 0.8, 1];
WMS_AMS_skillhardcore 	= [0.95, 1, 0.7, 0.6, 0.5, 1, 0, 1, 1];
WMS_AMS_skillstatic 	= [1, 1, 0.005, 0.5, 0.2, 0.5, 0, 0.2, 0.8]; //what ever you do, Statics destroy your ass... this skill is apply on the NPC when he get on the static (EH "getin")
WMS_AMS_skillsniper 	= [1,0.95,0.9,0.9];  //hardcore level, easy = -0.15, moderate = -0.1, difficult = -0.05 //"spotDistance","spotTime","aimingAccuracy","aimingShake"
WMS_AMS_SniperLoadout	= [["H_Cap_grn_BI"],["V_Chestrig_rgr","V_SmershVest_01_radio_F"]]; //[[headGears],[vests]]//custom "loadout" for NPC snipers, lighter gear so they don't neet 15 headshots to get killed
WMS_AMS_sniperList		= [ //This list can contain mods weapons, it's just a check, it will modify NPC skills if they have a weapon from this list
							"srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F",
							"srifle_GM6_ghex_F","srifle_GM6_camo_F","srifle_GM6_F",
							"hlc_rifle_FN3011Tactical_green","hlc_rifle_awmagnum","hlc_rifle_awmagnum_BL","hlc_rifle_awmagnum_FDE","hlc_rifle_FN3011Modern","hlc_rifle_M1903A1_unertl",
							"rhs_weap_m24sws_blk","rhs_weap_m24sws_d","rhs_weap_m24sws_wd","rhs_weap_m24sws",
							"rhs_weap_m40a5_wd","rhs_weap_m40a5_d","rhs_weap_m40a5","rhs_weap_dsr1",
							"rhs_weap_t5000",
							"rhs_weap_m38_rail",
							"rhs_weap_XM2010_wd","rhs_weap_XM2010_d","rhs_weap_XM2010_sa","rhs_weap_XM2010"
						];
WMS_AMS_UnitClass 		= selectRandom ["O_G_Soldier_F","O_Soldier_F","O_T_Soldier_A_F"]; //AI classename, will be used to create mission AIs, Maybe engineer can repair in Exile?
WMS_AMS_LauncherChance 	= 25; //% chance to get a launcher
WMS_AMS_remRPG 			= 50; //% chance to delete the launcher at NPC death
WMS_AMS_Crate_S 		= "Box_NATO_Wps_F"; //Mission small crate
WMS_AMS_Crate_L 		= "I_supplyCrate_F";  //Mission medium crate //B_supplyCrate_F if above the IDAP crate, it will be removed from logistic/moving system [R3F]
WMS_AMS_Crate_XL 		= "B_CargoNet_01_ammo_F"; //Mission big crate
WMS_AMS_Crate_noMove 	= "CargoNet_01_box_F"; //a crate you don't want player to move around "CargoNet_01_box_F" //"rhs_weapon_crate"
WMS_AMS_MineAP 			= "APERSTripMine"; //"APERSMine" "APERSBoundingMine"
WMS_AMS_MineAT 			= "ATMine"; //WMS_ATMines is curently used by WMS_AMS
WMS_AMS_MineSign 		= "Land_Sign_MinesTall_English_F"; //signs around mine fields
WMS_AMS_ToRun 			= 3; //how many missions maximun at the same time
WMS_AMS_MinFPS 			= 15; //diag_fps, above this, missions won't spawn
WMS_AMS_LastSpawn 		= -600;//Keep minus so first mission can spawn before server unlock
WMS_AMS_MissionTimeout 	= [9000, 1800]; //_this select 0 + random _this select 1
WMS_AMS_TbtwMissions 	= [300, 120]; //Time between 2 missions to spawn //_this select 0 + random _this select 1
WMS_AMS_MaxGrad 		= 0.15; //terrain grade max to spawn a mission
WMS_AMS_RangeList 		= [300,500,750,1000,1500]; //Killer distance for AI reinforcement
WMS_AMS_sysChatMsg 		= 1; //frag messages in system chat 0: nothing, 1: general, 2: group, 3: player
WMS_AMS_ShowFragMsg 	= true;
WMS_AMS_RespectRwdOnKill = true; //150|750|0.2 //100|750|0.133
WMS_AMS_respectBonus	= 100; //maximum respect to get from NPC kill
WMS_AMS_distBonusMax 	= 750; //maximum distance to get respect
WMS_AMS_distBonusCoef 	= 0.133; //bonus = respectBonus - (distance*distBonusCoef)
WMS_AMS_PlayerDistDelete = 1200; //if no player closer than this, mission can time out, no reset of the time out
WMS_AMS_PlayerDistSucces = 100; //distance player to flag to unlock the mission (succes)
WMS_AMS_SpnDistPlayer 	= 750; //minimum distance from player to spawn a mission
WMS_AMS_SpnDistTrader 	= 400; //minimum distance from traders to spawn a mission
WMS_AMS_SpnDistTerrit 	= 200; //minimum distance from territory to spawn a mission
WMS_AMS_SpnDistMission 	= 950; //minimum distance from another mission to spawn a mission
WMS_AMS_ClnObj 			= true; //after succes, despawn mission layout //some missions with towers won't despawn to prevent player fall/death xD
WMS_AMS_ClnObjT 		= 60; //objects cleaning delay after unlock the mission
WMS_AMS_AlarmCln 		= true;
	//WMS_AMS_TimeToWatch 	= 25; //AMS missions are checked from the 15 secondes loop WMS_15sec_Watch.sqf
WMS_AMS_MissionsCount 	= 0; //KEEP 0
WMS_AMS_Mission_ID 		= 0; //KEEP 0
WMS_AMS_MkrEasy 		= "Contact_circle1"; //"ExileMissionEasyIcon"; //Mission Map Marker
WMS_AMS_MkrModerate 	= "Contact_circle3"; //"ExileMissionModerateIcon"; //Mission Map Marker
WMS_AMS_MkrDifficult 	= "Contact_circle4"; //"ExileMissionDifficultIcon"; //Mission Map Marker
WMS_AMS_MkrHardcore 	= "Contact_circle2"; //"ExileMissionHardcoreIcon"; //Mission Map Marker
WMS_AMS_TradersIcons 	= ["Select"]; //"ExileTraderZoneIcon","ExileAircraftTraderIcon" //map marker to check to find traders
WMS_AMS_CustomPos		= ["random"];//["forest","forest","forest","random"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
WMS_AMS_CustomPosFact	= ["random"]; //used to spawn "Factory Sales" //"random" or "factory"
WMS_AMS_MissionList 	= [ //missions themself and weight
							["MissionTest1",1],
							["MissionTest2",1],
							["ForestCamp",1], //"forest" positions
							["HomeDepot",1],
							["CombatPatrol",1],
							["EnyBunkers",1], //AP mines
							["Arbeit",1],
							["ArmedBandits",1],
							["C192Crash",1],
							["AmazonWH",1],
							["TransmissionTower",1],
							["GunsX3",1], //"utility" truck reward, NPC armored
							["Arena",0], //this one is pretty hardcore on the objects and NPCs xD
							["LightArmoredSteal",1], //Light Armored Reward
							["HeliSteal",1], //helicopter reward
							["AABattery",1], //no move crate
							["Escobar",1],
							["Forgotten",1],
							["Radar",1], //big crate reward
							["Construction",1], //truck reward
							["OldTemple",1],  //no move crate
							["JunkYard",1], //truck reward
							["OldPowerPlant",1], //vehicle reward, armed/armored NPC
							["Market",1], //small truck reward
							["GrandPaJoe",1],
							["LumberYard",1], //"forest" positions
							["Factory",1], //"factory" positions
							["FieldHospital",1],
							["Object172M",1], //Armored Reward and NPCs
							["uncleabrams",1], //Armored Reward and NPCs
							["thecommunity",2],
							["shipyard",2], //small vehicle reward
							["occupation",2], //location/cities positions
							["commsrelay",2], //"comms" vehicle reward
							["strelnikovtrain",2],
							["bastogne",2], //"forest" positions
							["blackhawk",2],
							//OUTPOSTS
							["OutpostAlpha",1],
							["OutpostBravo",1],
							["OutpostCharlie",1],
							["OutpostDelta",1], //+V2
							["OutpostEcho",1],
							["OutpostFoxtrot",1],
							["OutpostGolf",1] //+V2
						];
////////////////////
// Create The Dynamic AI triggers
////////////////////
WMS_DynAI_triggers 		= true; //will create a bunch of triggers to spawn "dynamic" stuff on players
WMS_Pos_AutoScan 		= true; //KEEP TRUE UNLESS YOU KNOW WHAT YOU ARE DOING, AND YOU PROBABLY DON'T
WMS_Trigg_Reinforce		= true;
WMS_trigMaxSpeed		= 100; //maximum spead to fire up the trigger, there is no point to spawn infantry group in a forest for a jet flying around
WMS_triggCheck			= 600; //Active triggers will check their area to respawn "dynamic" stuff on players if no NPCs around
WMS_triggCheckChance	= 50; 	//chance to send reinforcement at _target position
WMS_triggCheckDist		= 300;	//minimun player distance from other AI to send reinforcement
WMS_Pos_Rdz 			= 50; 	//randomize trigger position, so the trigger is not always at the same position

WMS_trigLocals_Size 	= 350; //size of the different triggers
WMS_trigVillages_Size 	= 350;
WMS_trigCities_Size 	= 400;
WMS_trigCapitals_Size 	= 450;
WMS_trigHills_Size 		= 600;
WMS_Forests_Size		= 250;
WMS_Military_Size		= 200;

WMS_trig_Glob_CoolD 	= 300; //global trigger cooldown
WMS_trigLocals_CoolD 	= 600; //cooldown of the different triggers
WMS_trigVillages_CoolD 	= 550;
WMS_trigCities_CoolD 	= 600;
WMS_trigCapitals_CoolD 	= 500;
WMS_trigHills_CoolD 	= 600;
WMS_Forests_CoolD		= 600;
WMS_Military_CoolD		= 400;

WMS_trigLocals_Chance 	= 40; //chances to trigger different triggers
WMS_trigVillages_Chance = 45;
WMS_trigCities_Chance 	= 55;
WMS_trigCapitals_Chance = 65;
WMS_trigHills_Chance 	= 33;
WMS_Forests_Chance		= 40;
WMS_Military_Chance		= 90;

WMS_trig_Glob_LastT 	= 0; //KEEP 0
WMS_trigLocals_LastT 	= 0; //KEEP 0
WMS_trigVillages_LastT 	= 0; //KEEP 0
WMS_trigCities_LastT 	= 0; //KEEP 0
WMS_trigCapitals_LastT 	= 0; //KEEP 0
WMS_trigHills_LastT 	= 0; //KEEP 0
WMS_Forests_LastT		= 0; //KEEP 0
WMS_Military_LastT		= 0; //KEEP 0

WMS_Pos_Locals 		= []; // AutoScan
WMS_Pos_Villages	= []; // AutoScan
WMS_Pos_Cities 		= []; // AutoScan
WMS_Pos_Capitals 	= []; // AutoScan
WMS_Pos_Hills 		= []; // AutoScan
WMS_Pos_Forests 	= []; //not autoScan //No randomized positions //YOU NEED FOREST POSITION FOR SOME AMS MISSIONS or use WMS_AMS_CustomPos = ["random"];
WMS_Pos_Military 	= []; //not autoScan //No randomized positions //need enough space to land a chopper

WMS_Pos_Factory 	= []; //used to spawn missions not for trigger, yet //YOU NEED FACTORIES POSITION FOR SOME AMS MISSIONS or use WMS_AMS_CustomPosFact = ["random"];
WMS_Pos_Custom 		= []; //position ASLW //used in DFO for now
WMS_Roads			= []; //PushBack RoadObjects
WMS_SeaPos			= []; //PushBack sea positions around coasts
//WMS_Pos_EntryPoint 	= []; //not autoScan //Just trigger WMS_trig_Glob_LastT to prevent player to get roaming AI while spawning in a trigger

WMS_CustomTrig_activate 	= false; //if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD_T) && time > (WMS_CustomTrig_LastT + WMS_CustomTrig_CoolD) && (player distance2d trigPos) > (WMS_CustomTrig_Size/2)) then {};
WMS_Pos_Custom_Rdz 			= 0;
WMS_Pos_CustomTrig 			= []; // AutoScan
WMS_CustomTrig_Size			= 200;
WMS_CustomTrig_ClassName 	= "";//Exile_Container_OldChest //at server start will create triggers on this object className
WMS_CustomTrig_Max			= 25; //if more than this number of custom detected, no triggers created
WMS_CustomTrig_LastT		= 0;
WMS_CustomTrig_CoolD		= 600;
WMS_CustomTrig_Chance		= 60;
////////////////////
//default Objects
////////////////////
WMS_PlayerEntity		= "I_Survivor_F"; //"Exile_Unit_Player"; //used for blacklist, player distance check //(count ((position _x select 0) nearEntities [WMS_PlayerEntity, 200]) == 0)

WMS_OPFOR_Flag			= "Flag_CSAT_F"; //default flag for Bandits, different than AMS so no interactions with findpositions
WMS_BLUE_Flag			= "Flag_blue_F"; //default flag for Allieds, different than AMS so no interactions with findpositions
WMS_AMS_Flag 			= "Flag_Syndikat_F"; //flag will get a _flag setVariable ["AMS_MissionID",_missionID,true];
WMS_Utility_Item_1 		= "ACE_Cellphone"; //"Exile_Item_FireExtinguisher"; //used for haloJump in Exile (with infantry program)
WMS_Utility_Item_2 		= "rhs_radio_R187P1"; //"Exile_Item_OldChestKit"; //Used for InfantryProgram Actions
WMS_CamoNet_Small 		= "CamoNet_INDP_F"; //Default
WMS_CamoNet_Open 		= "CamoNet_INDP_open_F"; //Default
WMS_CamoNet_Big 		= "CamoNet_INDP_big_F"; //Default
WMS_para_Big			= "B_Parachute_02_F"; //vehicle/crates paradrop
WMS_para_small			= "NonSteerable_Parachute_F"; //small crates paradrop //rhs_d6_Parachute
WMS_BombList 			= ["Bomb_03_F", "Bomb_04_F"]; //DynAI bombing is (select 0)
WMS_ATMines				= "ATMine"; //"ATMine";"BWA3_DM31AT";
WMS_DirectionnalMines 	= ["APERSTripMine"]; //those mines spawned with WMS_fnc_AMS_SpawnMineField will have random directions
WMS_WaterSource			= "Land_ConcreteWell_02_F"; //ACE //Force this object to become a watersource (server start check)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

WMS_MapName = worldname;
MISSION_ROOT = format ["mpmissions\%1.%2\", "__cur_mp", WMS_MapName]; //I should remove this crap

if (WMS_MapName in WMS_CustomizedMap) then {
	execVM "\InfantryProgram\Scripts\WMS_customMapsSettings.sqf";
}else {
	execVM "\InfantryProgram\Scripts\WMS_List_VHL_Vanilla.sqf";
	execVM "\InfantryProgram\Scripts\WMS_List_Loadout_Vanilla.sqf";
};

//Variables override for Exile Users
if (WMS_exileFireAndForget) then {
	WMS_Currency 			= "Poptabs";
	WMS_exileToastMsg 		= true;
	WMS_PlayerEntity		= "Exile_Unit_Player";
	WMS_AMS_MkrEasy 		= "ExileMissionEasyIcon";
	WMS_AMS_MkrModerate 	= "ExileMissionModerateIcon";
	WMS_AMS_MkrDifficult 	= "ExileMissionDifficultIcon";
	WMS_AMS_MkrHardcore 	= "ExileMissionHardcoreIcon";
	//WMS_CaptureZone_mkr		= "ExileMissionCapturePointIcon"; //this messup with the marker color
	WMS_AMS_TradersIcons 	= ["ExileTraderZoneIcon","ExileAircraftTraderIcon"];
	WMS_DynAI_BaseFlag 		= "Exile_Construction_Flag_static";
	WMS_Utility_Item_1 		= "Exile_Item_FireExtinguisher"; //used for haloJump in Exile (infantry program)
	WMS_Utility_Item_2 		= "Exile_Item_OldChestKit"; //Used for InfantryProgram Actions	
	WMS_DynAI_addPoptabsINF = true;
	WMS_DynAI_addPoptabsVHL = true;
	WMS_AMS_addPoptabsUnits = true;
	WMS_AMS_addPoptabsRwd 	= true;
	WMS_AMS_AddActionOnReward = false;
	WMS_AI_inventory = [
		"Money_bunch","Money_roll","Money_stack","Money_stack_quest", //give a price at the trader to those
		//"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05", //used to "Claim reward" in TheLastCartridges
		"FilesSecret","FileNetworkStructure","DocumentsSecret","FileTopSecret","Wallet_ID","FlashDisk","ButaneCanister","Keys",
		"Exile_Item_CordlessScrewdriver","Exile_Item_Hammer","Exile_Item_BurlapSack","Exile_Headgear_GasMask","Exile_Item_Wrench","Exile_Item_OilCanister",
		"Exile_Item_CatSharkFilet_Raw","Exile_Item_TunaFilet_Raw","Exile_Item_AlsatianSteak_Raw","Exile_Item_TurtleFilet_Raw","Exile_Item_SheepSteak_Raw",
		"Exile_Item_FinSteak_Raw","Exile_Item_GoatSteak_Raw","Exile_Item_ChickenFilet_Raw","Exile_Item_RoosterFilet_Raw","Exile_Item_MackerelFilet_Raw",
		"Exile_Item_MulletFilet_Raw","Exile_Item_OrnateFilet_Raw","Exile_Item_RabbitSteak_Raw","Exile_Item_SalemaFilet_Raw","Exile_Item_SnakeFilet_Raw",
		"Exile_Item_Raisins","Exile_Item_EMRE","Exile_Item_Moobar","Exile_Item_SeedAstics","Exile_Item_Noodles","Exile_Item_Cheathas",
		"Exile_Item_PlasticBottleCoffee","Exile_Item_PlasticBottleFreshWater","Exile_Item_PowerDrink","Exile_Item_EnergyDrink","Exile_Item_MountainDupe","Exile_Item_Beer","Exile_Item_ChocolateMilk",
		"Exile_Item_WaterCanisterDirtyWater","Exile_Item_Storagecratekit","Exile_Item_Sand","Exile_Item_MetalScrews","Exile_Item_CanOpener","Land_TentDome_F_Kit","Exile_Item_CampFireKit",
		"Exile_Item_ToiletPaper","Exile_Item_Matches","Exile_Item_Knife","Exile_Item_CookingPot",
		"Exile_Item_RubberDuck","Exile_Item_Rope","Exile_Item_MobilePhone","Exile_Item_FireExtinguisher","Exile_Item_DuctTape",
		"Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_InstaDoc"
	];
};
//////////FRIENDS!!!//////////
Resistance setFriend [East, 0];
East setFriend [Resistance, 0];
Resistance setFriend [WEST, 1];
WEST setFriend [Resistance, 1];
Resistance setFriend [CIVILIAN, 1];
CIVILIAN setFriend [Resistance, 1];
WEST setFriend [CIVILIAN, 1];
CIVILIAN setFriend [WEST, 1];
East setFriend [CIVILIAN, 0.8];
CIVILIAN setFriend [East, 0.8];

////////////////////////////////////////////////////
//////////NOTHING TO SETUP AFTER THIS
////////////////////////////////////////////////////
publicVariable "WMS_InfantryProgram_list";//NO TOUCH
publicVariable "WMS_IP_Active_list";//NO TOUCH
publicVariable "WMS_InfantryProgram_Vehicles";//NO TOUCH
publicVariable "WMS_Compo_BunkerCamp_LastTime";//NO TOUCH
publicVariable "WMS_Compo_BunkerCamp_CoolDown";//NO TOUCH
publicVariable "WMS_IP_ArtySup_LastT";//NO TOUCH
publicVariable "WMS_IP_ArtySup_CoolD";//NO TOUCH
publicVariable "WMS_IP_BlackFishSup_LastT";//NO TOUCH
publicVariable "WMS_IP_BlackFishSup_CoolD";//NO TOUCH
publicVariable "WMS_IP_ExtractChop_LastT";//NO TOUCH
publicVariable "WMS_IP_ExtractChop_CoolD";//NO TOUCH
publicVariable "WMS_Extraction_GND_LastTime";//NO TOUCH
publicVariable "WMS_Extraction_GND_CoolDown";//NO TOUCH
publicVariable "WMS_INFbyChopper_LastTime";//NO TOUCH
publicVariable "WMS_INFbyChopper_CoolDown";//NO TOUCH
publicVariable "WMS_INFsquad_LastTime";//NO TOUCH
publicVariable "WMS_INFsquad_CoolDown";//NO TOUCH
publicVariable "WMS_WDtrader_LastTime";//NO TOUCH
publicVariable "WMS_WDtrader_CoolDown";//NO TOUCH
publicVariable "WMS_MoveInCargo_C130_LastTime";//NO TOUCH
publicVariable "WMS_InfantryProgram_C130CoolDown";//NO TOUCH
// Random server start time
if (WMS_RandomStartTime) then {
	WMS_Date = [(WMS_Date select 0), (WMS_Date select 1), (WMS_Date select 2), WMS_RandomStart_Hour+floor (random WMS_RandomStart_Random), 00];
	setdate WMS_Date;
	if (true) then {diag_log format ["[SERVER DATE/TIME]|WAK|TNA|WMS| Changing server date/time, target time: %1, real time: %2", WMS_Date, date]};
};
WMS_AMS_CenterMap = [worldsize/2,worldsize/2,0];
WMS_AMS_TradersArr = [];
{
	_markerType = markertype _x;
	_traderPos = getMarkerPos _x;
	if (_markerType in WMS_AMS_TradersIcons) then {
		WMS_AMS_TradersArr pushBack [_traderPos,WMS_AMS_SpnDistTrader];
	};
}forEach allMapMarkers;
// Get position from location and water position
[] call WMS_fnc_CollectPos;
// Create triggers
if (WMS_DynAI_triggers) then {execVM "\InfantryProgram\Scripts\WMS_AI_Create_triggers.sqf"};
// Start Random Events system
if (WMS_Events) 		then {execVM "\InfantryProgram\Scripts\WMS_Event_Start.sqf"};
// Start Mission system
if (WMS_AMS)			then {execVM "\InfantryProgram\Scripts\WMS_AMS_Start.sqf"};
// Start DynamicFlightOps
if (WMS_DynamicFlightOps)then {execVM "\InfantryProgram\Scripts\DFO\WMS_DFO_init.sqf"};
// Start Ambient Life
if (WMS_AmbientLife)	then {execVM "\InfantryProgram\Scripts\AL\WMS_AL_Functions.sqf"};
// Territory Protection system
//if (true) 				then {execVM "\InfantryProgram\Scripts\WMS_TerritoryProtection.sqf"};
//Server Info Markers
WMS_markerFPS = objNull;
WMS_markerUnits = objNull;
WMS_markerUnitsCIV = objNull;
WMS_markerDeads = objNull;
//Managment Arrays
WMS_Events_list 				= [];//Leave it empty //for events scheduler
WMS_Events_Running				= [];//Leave it empty //for events manager/cleanup
WMS_Recon_AllCities 			= [];//Leave it empty
WMS_Recon_pos_list 				= [];//Leave it empty
WMS_Recon_AIgrps 				= [];//Leave it empty
WMS_Recon_Objects 				= [];//Leave it empty
WMS_CaptureZone_Obj 			= [];//Leave it empty //layout + sphere for cleanup
WMS_AI_Paradrop_Watch 			= [];//NO TOUCH
WMS_AI_OPFORpatrol_Running 		= [];//Leave it empty //WMS_OPFORpatrol_Running pushBack [time,(time+(_patrolTimer+(random _patrolTimer))),[_paraGrp],[],[],[],[],""];
WMS_AI_OPFORpatrol_LastTarget	= [];//Leave it empty //WMS_OPFORpatrol_LastTarget set [0,_target];
WMS_AI_bluforPatrol_Running 	= [];//Leave it empty //WMS_OPFORpatrol_Running pushBack [time,(time+(_patrolTimer+(random _patrolTimer))),[_paraGrp],[],_PatrolVRmkrList,[],[],""];
WMS_AI_RoamingVHL_Running 		= [];//Leave it empty //for cleanup
WMS_AI_RoamingAIR_Running 		= [];//Leave it empty //for cleanup
WMS_DynAI_Running 				= [];//Leave it empty
WMS_DynAI_LastTarget 			= [];//Leave it empty
WMS_DynAI_TargetList 			= [];//Leave it empty
WMS_DynAI_BaseAtkUIDList 		= [];//Leave it empty //Players UID list already spoted
WMS_DynAI_BaseAtkTList 			= [];//Leave it empty //Territories already spoted
WMS_AMS_Running_Array 			= [];//Leave it empty //super big array with all missions running
WMS_AMS_Missions 				= [];//Leave it empty //processed/weighted missions list
WMS_AMS_Missions_Running 		= [];//Leave it empty //Mission actualy running to be sure all running missions are different
WMS_activatedTriggs 			= []; //Leave it empty
WMS_IP_Active_list 				= []; //player get in there if they are in the InfantryProgram list and they do "join the program" on the built computer
publicVariable "WMS_IP_Active_list";
publicVariable "WMS_exileFireAndForget";
publicVariable "WMS_ServRestartSeconds"; //so TheLastCartridges clients can get the timer for the statBar
if (WMS_ServerMarkers) then {execVM "\InfantryProgram\Scripts\WMS_ServerMarkers.sqf"};
// Init System Watchs
[]spawn WMS_fnc_sys_Init_Watchs;