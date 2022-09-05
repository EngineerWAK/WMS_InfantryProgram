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
WMS_BlackList 				= []; //list of player's UID "BlackListed" //fatigue/Stamina for now
WMS_InfantryProgram_list 	= [];//list of player's UID autorised to use InfantryProgram Functions					
//////////
WMS_System_Version 			= "v2.65_2022SEP04_GitHub"; //EH "Hit" on NPC
if (true) then {diag_log format ["[WMS Starting Server Side]|WAK|TNA|WMS| Initialisation of the AI system at %1, rev %2", servertime, WMS_System_Version]};
WMS_IP_LOGs 				= false;
WMS_Watch_Triggers_Logs		= false;
WMS_magicSmoke 				= true;
WMS_ServerMarkers 			= true;
WMS_forceNoRain 			= false;
WMS_forceNoFog				= false;
WMS_ServRestart 			= true;
WMS_ServRestartSeconds 		= 18000; //5h
WMS_Thread_Start			= 30;
WMS_CustomizedMap			= ["ruha","xcam_taunus","Lythium","gm_weferlingen_summer","Namalsk","Altis","Tanoa","Malden","Enoch","tem_kujari","vt7"]; //TYPO !!!!!!!!!

WMS_DynamicFlightOps		= true; //Module
WMS_AmbientLife				= true; //Module //AL can spawn A LOT of units/vehicles/waypoints, be sure your box can handle it with other regular mission/roaming AI

WMS_exileFireAndForget 		= false; //FireAndForget is ONLY for Exile DB means Exile mod is running //auto activate WMS_exileToastMsg with Exile override
WMS_exileToastMsg 			= false;

WMS_serverCMDpwd serverCommand "#Lock"; //will be unlocked at WMS_15sec_Watch launch, about 2 minutes after start
{WMS_serverCMDpwd serverCommand format ["#kick %1", (getPlayerUID _x)]}foreach allPlayers;

WMS_InfantryProgram_Vehicles = [ //Maybe add _vehicle setvariable ["IP_ExtractionVehicle", true, true]; to the extraction vehicles at spawn and use it to filter
	//"Exile_Bike_MountainBike", //bike from XM8
	//"B_Quadbike_01_F",
	"Steerable_Parachute_F", //parachute

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
/////////////////////////////////
//			CRATES ITEMS
/////////////////////////////////
if !(WMS_exileFireAndForget) then {execVM "\InfantryProgram\Scripts\WMS_List_Crates_Vanilla.sqf"}else{execVM "\InfantryProgram\Scripts\WMS_List_Crates_Exile.sqf"};
/////////////////////////////////
//			VARIABLES
/////////////////////////////////
WMS_AllDeadsMgr				= [];
WMS_Player_AllDeads			= 1800; //Not Used Yet
WMS_AMS_AllDeads			= 1200;
WMS_DynAI_AllDeads			= 600;
WMS_DFO_AllDeads			= 180;
WMS_Others_AllDeads			= 90; //Not Used Yet
//C130 variables
WMS_MoveInCargo_C130_LastTime 		= time;
WMS_InfantryProgram_C130CoolDown 	= 300;
WMS_C130_Altitude 					= 150;
WMS_C130_Type 						= "B_T_VTOL_01_infantry_blue_F"; // WMS_MoveInCargo_C130_LastTime = WMS_ServRestartSeconds to hide C130 call
//Camps Variables
WMS_Compo_BunkerCamp_LastTime 		= time;
WMS_Compo_BunkerCamp_CoolDown 		= 750;
//ArtySupport variables
WMS_IP_ArtySup_LastT 		= time;
WMS_IP_ArtySup_CoolD 		= 600; //600
//BlackFich Support variables
WMS_IP_BlackFishSup_LastT 	= time;
WMS_IP_BlackFishSup_CoolD 	= 1200;
//Extraction variables 
WMS_IP_ExtractChop_LastT 	= time;
WMS_IP_ExtractChop_CoolD 	= 300;
WMS_IP_Extract_Alt 			= 150; //Default
WMS_Extraction_GND_LastTime = time;
WMS_Extraction_GND_CoolDown = 400;
WMS_ExtractionChopper_Type 	= ["I_E_Heli_light_03_unarmed_F"]; //Default //hellcat
WMS_ExtractionVehicle_Type 	= ["I_APC_tracked_03_cannon_F"]; //Default
WMS_DeliveryChopper_Type 	= ["I_E_Heli_light_03_unarmed_F"]; //Default
//Infantry chopper variables
WMS_INFbyChopper_LastTime 	= time;
WMS_INFbyChopper_CoolDown 	= 300;
WMS_INFsquad_LastTime 		= time;
WMS_INFsquad_CoolDown 		= 900;
WMS_WDtrader_LastTime 		= time;
WMS_WDtrader_CoolDown 		= 400;
//using this vehicle give cumulative reward
WMS_Riding_Rwd 		= false;
WMS_RidingCount 	= 3; //how many positive check before adding the respect
WMS_RidingDist 		= 10; //Distance to ride to validate the count
WMS_ThanksForRiding = "Exile_bike_MountainBike"; //NOT ANYMORE
//////////////////////////////
//Fast Night
//////////////////////////////
WMS_RandomStartTime 	= true;
WMS_RandomStart_Hour 	= 5;
WMS_RandomStart_Random 	= 4;
WMS_Date 				= [2022,8,25,7,00];//full moon
WMS_FastNight 			= true;
WMS_FastNight_Morning 	= 7; //morning start at
WMS_FastNight_Evening 	= 15; //morning start at
WMS_FastNight_Morn_Even = 2; //time speed
WMS_FastNight_Day 		= 6; //time speed
WMS_FastNight_Night 	= 38;  //time speed
//////////////////////////////
//Camp/events spawns
//////////////////////////////
WMS_Events 				= true;
WMS_Events_list 		= [];//Leave it empty //for events scheduler
WMS_Events_Running		= [];//Leave it empty //for events manager/cleanup

WMS_RepairCamp 			= true;
WMS_RepairCampCount 	= 1;
WMS_RepairCampDelay 	= 500;

WMS_HeliCrash 			= true;
WMS_HeliCrashCount 		= 3;
WMS_HeliCrashDelay 		= 900;

WMS_SupplyDrop 			= true;
WMS_SupplyCrate			= "C_IDAP_supplyCrate_F"; //Orange
WMS_SupplyDropCount 	= 2;
WMS_SupplyDropDelay 	= 1100; //+random 60
WMS_SupplyDropMkr 		= "o_support";
WMS_SupplyColor			= "ColorOrange";

WMS_HumaniDrop 			= true;
WMS_HumaniDropMkr		= "c_plane";
WMS_UmaniDropColor		= "ColorCIV";
WMS_Humanicrate 		= "CargoNet_01_box_F";//"R3F_WeaponStock" //"CargoNet_01_box_F"
WMS_HumaniDropCount 	= 3;
WMS_HumaniDropDelay 	= 1200; //+random 60

WMS_ReconMission		= true;
WMS_ReconMissionCount	= 1; //0 or 1, not more Recon Mission at the same time
WMS_ReconMissionDelay	= 600;
	//WMS_Recon_Type 			= ["crate","none","safe","none"];//Not used yet
WMS_Recon_Steps 		= [3,6,9,12]; //randomSelect
WMS_Recon_Rewards		= [[6,1,3],[3,1,2],[6,1,2],[1,3,3],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag]
WMS_Recon_Border_Radius = 300;
WMS_Recon_Cap_Radius 	= 20;
WMS_Recon_Guards 		= true;
WMS_Recon_Guards_Chance = 75;
WMS_Recon_Guards_Skill 	= 0.6;
WMS_Recon_AllCities 	= [];//Leave it empty
WMS_Recon_pos_list 		= [];//Leave it empty
WMS_Recon_AIgrps 		= [];//Leave it empty
WMS_Recon_Objects 		= [];//Leave it empty

WMS_CaptureZone			= true; //many stuff is setup in the function itself WMS_fnc_CaptureZone
WMS_CaptureZoneDelay	= 300;
WMS_CaptureZone_Rad 	= [25,35,50]; //Capture zone Radius //only _radius select 0 is used
WMS_CaptureZone_Tmr		= [240, 400, 600, 900]; //time to capture the zone //easy, moderate, difficult, hardcore
WMS_CaptureZone_Obj 	= [];//Leave it empty //layout + sphere for cleanup
WMS_CaptureZone_mkr		= "selector_selectedEnemy";
	//WMS_CaptureZone_Wav		= [5,7,9]; //AI Waves to come
	//WMS_CaptureZone_Dis		= [100,300]; //AI waves spawn distances
	//WMS_CaptureZone_Bdr 		= []; //Sign_Sphere25cm_F objects
//////////////////////////////
//AmbientLife
//////////////////////////////
WMS_AL_Version		= "v0.26_2022JUN06";
if (WMS_AmbientLife) then {
//WMS_AmbientLife		= true;
WMS_AL_Standalone	= false; //Keep true if you don't use WMS_DFO or WMS_InfantryProgram
WMS_AL_LOGs			= false; //Debug
WMS_AL_IncludeLoc	= true; //will include "nameLocal" locations in the position list
WMS_AL_StripOffUnit = false; //Remove or not NPC loadout when they die
WMS_AL_LockVehicles = false; //lock vehicles for players
WMS_AL_VHLmax		= 10; //Max vehicles (all included) running at the same time
WMS_AL_UnitMax		= 5; //Max units (groups if _CombatBehav true) patroling at the same time
WMS_AL_VhlBalance	= [2,1,0,1,1,2,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
WMS_AL_Skills		= [0.8, 0.7, 0.2, 0.3, 0.3, 0.6, 0, 0.5, 0.5]; //"spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"

WMS_AL_CombatBehav	= false;
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
WMS_DFO_Version			= "v1.13_2022JUL31_GitHub";
if (WMS_DynamicFlightOps) then {
//WMS_DynamicFlightOps	= true;
WMS_DFO_LOGs			= false; //For Debug
WMS_DFO_Standalone		= false; //keep true if you don't use WMS_InfantryProgram
WMS_DFO_CreateChopper	= false; //if your mission file doesn't have choppers available
WMS_DFO_Reinforcement	= true; //Each mission has it's own type of reinforcement
WMS_DFO_UseJVMF			= true; //https://github.com/Project-Hatchet/H-60
WMS_DFO_RemoveDup		= true; //delete dead NPC's primary weapon and backpack
WMS_DFO_UsePilotsList 	= false; //if you want to limit DFO use to some players
WMS_DFO_SmokeAtLZ		= true; //pop a smoke/flare on the group you have to pickUp
WMS_DFO_HideLZTarget	= false; //hide the target spawned at the LZ (actualy just return it, texture only on one side)
WMS_DFO_InfUnlOverride	= false; //admins can force it "on the fly" in the console
WMS_DFO_InfUnloadType 	= 3; //0: dump, 1: land, 2: rappel (Advanced Rappeling), 3: fastrope (not yet) //this should be dynamic unless override
WMS_DFO_PilotsList		= []; //Player UID, Only those players will be able to use DFO if WMS_DFO_UsePilotsList
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
publicVariable "WMS_DFO_Running";
publicVariable "WMS_DFO_MaxRunning";
publicVariable "WMS_DFO_LastCall";
publicVariable "WMS_DFO_CoolDown";
publicVariable "WMS_DFO_UsePilotsList";
publicVariable "WMS_DFO_PilotsList";
publicVariable "WMS_DFO_MissionTypes";
publicVariable "WMS_DFO_AceIsRunning";
publicVariable "WMS_DFO_Reward";
//Maps custom settings
if (worldName in WMS_DFO_NoSeaMaps) then {
	WMS_DFO_SarSeaPosition	= "random";
};
};
//////////////////////////////
//AI variables
//////////////////////////////
WMS_AI_forceInfKillCount= false; //ACE fuckedup infantry kill on the scoreBoard
WMS_AI_LaunchersOPF 	= [["launch_RPG7_F","launch_RPG7_F","launch_RPG7_F","launch_RPG7_F","launch_RPG32_F","launch_MRAWS_sand_rail_F"],["launch_O_Titan_F"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
WMS_AI_LaunchersBLU 	= [["launch_RPG7_F","launch_RPG32_F","launch_MRAWS_sand_rail_F"],["launch_B_Titan_F"],["launch_B_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
WMS_AI_Planes			= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //sab_C130_J_C // NO AN2_A2 without EXILE
WMS_AI_RdoTruck 		= "I_E_Offroad_01_comms_F"; //Humanidrop //"rhs_gaz66_r142_vdv" "I_E_Offroad_01_comms_F"
WMS_AI_ATstation 		= "O_HMG_02_high_F"; //roadBlock //AMS C192 //rhs_D30_at_msv //Better be an HMG than AT Titan static
WMS_AI_AAstation 		= "O_static_AA_F"; //AMS AA battery //"RHS_ZU23_VDV"
WMS_AI_HMG 				= "O_HMG_02_high_F";
WMS_AI_HMG_Scope 		= "O_HMG_01_high_F";
WMS_AI_HMG_Shield		= "B_G_HMG_02_high_F";
WMS_AI_GMG 				= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
WMS_AI_Attachements		= ["acc_flashlight","acc_pointer_IR"];
WMS_AI_Units_Class 		= selectRandom ["O_G_Soldier_F","O_Soldier_F","O_T_Soldier_A_F","O_R_Gorka_F"];//,"O_G_Engineer_F","O_T_Engineer_F","O_Engineer_F" "C_man_p_fugitive_F_afro"
WMS_AI_Additems 		= [1,2];
WMS_AI_MaxUnits_A 		= 100; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
WMS_AI_MaxUnits_B 		= 110; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
WMS_AI_MaxUnits_C 		= 120; //stop Base attack and missions
WMS_AI_AddCargoUnits 	= true;
WMS_AI_CargoUnits	 	= 2;
//paratroopers:
WMS_AI_OPFORParadrop_LastTime 	= time;
WMS_AI_bluforParadrop_LastTime 	= time;
WMS_AI_Para_remRPG 				= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_Paradrop_Watch 			= [];
//Intantry:
WMS_AI_OPFORPatrol_LastTime 	= time;
WMS_AI_OPFORpatrol_CoolDown 	= 900;
WMS_AI_INFpatrol_remRPG 		= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_OPFORpatrol_Running 		= [];//Leave it empty //WMS_OPFORpatrol_Running pushBack [time,(time+(_patrolTimer+(random _patrolTimer))),[_paraGrp],[],[],[],[],""];
WMS_AI_OPFORpatrol_LastTarget	= [];//Leave it empty //WMS_OPFORpatrol_LastTarget set [0,_target];
WMS_AI_PlayerDistToDespawnINF 	= 300;
WMS_AI_grenades 				= ["HandGrenade","MiniGrenade","SmokeShellRed"];
WMS_AI_bluforPatrol_LastTime 	= time;
WMS_AI_bluforPatrol_CoolDown 	= 900;
WMS_AI_bluforPatrol_Running 	= [];//Leave it empty //WMS_OPFORpatrol_Running pushBack [time,(time+(_patrolTimer+(random _patrolTimer))),[_paraGrp],[],_PatrolVRmkrList,[],[],""];
//Vehicle Ground:
WMS_AI_RoamingVHL				= true;
WMS_AI_RoamingVHL_KillRep		= 250;
WMS_AI_RoamingVHL_KillMoney		= 1500;
WMS_AI_RoamingVHL_LastTime 		= time;
WMS_AI_RoamingVHL_Skill			= [0.25, 0.35]; //skill + selectRandom
WMS_AI_RoamingVHL_remRPG 		= true; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_AI_RoamingVHL_Running 		= [];//Leave it empty //for cleanup
WMS_AI_RoamingVHLcount 			= 10; //10
WMS_AI_RoamingVHL_MaxKick 		= 8; // 8 //_vhl setVariable ["WMS_KickVehAss",0,true];
WMS_AI_PatrolTimer_VHL 			= 1500; //+(random 300)
WMS_AI_PlayerDistToDespawnVHL 	= 500;
WMS_AI_VHLwptDist 				= 5000;
//Vehicle Air:
WMS_AI_RoamingAIR				= true;
WMS_AI_RoamingAIR_LastTime 		= time;
WMS_AI_RoamingAIR_Skill			= [0.25, 0.35]; //skill + selectRandom
WMS_AI_RoamingAIR_Running 		= [];//Leave it empty //for cleanup
WMS_AI_RoamingAIRcount 			= 2; //2
WMS_AI_PatrolTimer_AIR 			= 2500; //+(random 300)
WMS_AI_PlayerDistToDespawnAIR 	= 1000;
WMS_AI_AIRwptDist 				= 7500;
//////////////////////////////
//Dynamic Threat setup
//////////////////////////////
WMS_DynAI 					= true;
WMS_DynAI_Skills			= [0.08, 0.15, 0.25, 0.35]; //+random 0.15
WMS_DynAI_RepLvlAdapt		= [1000, 24000, 50000]; //0/easy/1000/moderate/24000/difficult/50000/hardcore
WMS_DynAI_threatFrequency 	= 900; //will be *2 if only 1 player
WMS_DynAI_addPoptabsINF 	= false;
WMS_DynAI_poptabsINF 		= [25,50]; //poptabs on the AIs [minimum+Random]
WMS_DynAI_addPoptabsVHL 	= false;
WMS_DynAI_poptabsVHL 		= [250,750]; //poptabs in vehicles [minimum+Random]
WMS_DynAI_ejectDeads 		= true;
WMS_DynAI_RdoChatter		= true; //radio noise on patrol/building/roadblock AI spawn
WMS_DynAI_Steal 			= true; // if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal}; //optional: _lookingFor, _distance //from waypoint action maybe
WMS_DynAI_stealDist 		= 250;
WMS_DynAI_Steal_Cooldown 	= 120; //General cooldown in secondes
WMS_DynAI_Steal_last 		= 60; //first/last time function checked for vehicles //if (time > (WMS_DynAI_Steal_last + WMS_DynAI_Steal_Cooldown)) then {fnc};
WMS_DynAI_sysChatMsg 		= 1; //0: nothing, 1: general, 2: group, 3: player
WMS_DynAI_ShowFragMsg 		= true;
WMS_DynAI_RespectRwdOnKill 	= true;
WMS_DynAI_respectBonus 		= 100;
WMS_DynAI_distBonusMax 		= 300;
WMS_DynAI_distBonusCoef 	= 0.333; //bonus = respectBonus - (distance*distBonusCoef)
WMS_DynAI_distToFlag 		= 100;
	//WMS_DynAI_distToBuildings = 50;
WMS_DynAI_distToPlayers 	= 250; //Minimum distance to spawn AI from player
WMS_DynAI_traderDistance	= 200; 
WMS_DynAI_BuildingCount 	= 5;
WMS_DynAI_MinPosInBuildgs 	= 2;
WMS_DynAI_MinDistBuildgs 	= 75;
WMS_DynAI_DestroyVHL 		= 50; //chance to destroy vehicles if killed is group leader
WMS_DynAI_remRPG 			= false; //(_this select 0) removeWeapon (secondaryWeapon (_this select 0));
WMS_DynAI_LauncherChance 	= 15;
WMS_DynAI_MaxRunning		= 5;
WMS_DynAI_RunningCount 		= 0; //DO NOT CHANGE
WMS_DynAI_Running 			= [];//Leave it empty
WMS_DynAI_LastTarget 		= [];//Leave it empty
WMS_DynAI_LastTime 			= time;
WMS_DynAI_TargetList 		= [];//Leave it empty
WMS_DynAI_GunshipLight 		= ["B_Heli_Light_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]];
WMS_DynAI_GunshipMedium 	= ["B_CTRG_Heli_Transport_01_sand_F",[],[[],[]]];
WMS_DynAI_GunshipHeavy 		= ["B_Heli_Attack_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]]; //Mi-48 is fucking too heavy but nothing else for now
WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["SmokeShellRed","Chemlight_blue","mini_Grenade","Land_HumanSkull_F"],["SmokeShellRed","Chemlight_blue","mini_Grenade","GrenadeHand"],["SmokeShellRed","mini_Grenade","GrenadeHand"],["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","GrenadeHand","GrenadeHand"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000]]
WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F"];
//Base attack:
WMS_DynAI_useBaseAtk 		= true;
WMS_DynAI_BaseFlag 			= "rhsgref_serhat_radar"; //will try to do something with the RHS "radar" object
WMS_DynAI_BaseAtkLast 		= time;
WMS_DynAI_BaseAtkCoolDown	= 2700; //45 minutes
WMS_DynAI_BaseATKReinforce	= true;
WMS_DynAI_BaseATKReinforce_Last = time;
WMS_DynAI_BaseATKReinforce_CD = 120; //cooldown between reinforce
WMS_DynAI_BaseAtkUIDList 	= [];//Leave it empty //Players UID list already spoted
WMS_DynAI_BaseAtkTList 		= [];//Leave it empty //Territories already spoted
WMS_DynAI_BaseAtkRunning 	= 0;
WMS_DynAI_BaseAtkMax 		= 1;
//Cities Invasion
WMS_Invasion 				= false; //very far from ready...
WMS_Invasion_Array 			= [];//Leave it empty
////////////////////
//MISSION AI
////////////////////
WMS_AMS 				= true;
WMS_AMS_Steal 			= true;
WMS_AMS_AllowMissiles 	= true;
WMS_AMS_DelMissionFlag 	= true; //mission Flag prevent another mission to spawn at the same place
WMS_AMS_ejectDeads		= true;
WMS_AMS_DestroyStatics 	= true; //with ACE, this one need a variable on the NPC to destroy the static when the NPC die
WMS_AMS_AddActionOnReward = true;
WMS_AMS_DestroyVHL 		= 90;
WMS_AMS_VHL_KillRep		= 300;
WMS_AMS_VHL_KillMoney	= 3000;
WMS_AMS_Reinforce  		= true;
WMS_AMS_LastReinforce 	= time;
WMS_AMS_ReinforceCoolD 	= 300;
	//WMS_AMS_AdjustedSkills = false; //Not Used Yet
	//WMS_AMS_AdjustSkillsDist = 399;
WMS_AMS_addPoptabsUnits = false;
WMS_AMS_poptabsUnits 	= [25,25];
WMS_AMS_addPoptabsRwd 	= false; //Add poptabs in the mission reward crate/vehicle
WMS_AMS_PoptabsRwd 		= [1000,500]; //Add poptabs in the mission reward crate/vehicle
			   //skills = "spotDistance","spotTime","aimingAccuracy","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"//,"endurance"
WMS_AMS_skillsMin 		= [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0.1, 0.1];
WMS_AMS_skillsMax 		= [1, 0.85, 0.85, 0.7, 0.8, 0.8, 0, 1, 0.85];
WMS_AMS_skilleasy 		= [0.80, 0.8, 0.3, 0.3, 0.3, 0.6, 0, 0.6, 0.6];
WMS_AMS_skillmoderate 	= [0.85, 0.9, 0.4, 0.4, 0.4, 0.6, 0, 0.6, 0.8];
WMS_AMS_skilldifficult 	= [0.90, 0.95, 0.6, 0.5, 0.5, 0.8, 0, 0.8, 1];
WMS_AMS_skillhardcore 	= [0.95, 1, 0.7, 0.6, 0.6, 1, 0, 1, 1];
WMS_AMS_skillstatic 	= [1, 1, 0.075, 0.5, 0.2, 0.5, 0, 0.2, 0.8];
//WMS_AMS_skillsniper 	= [1,0.95,0.95,0.95];  //set in fn_DynAI_SetUnitOPF and fn_AMS_SetUnits
WMS_AMS_sniperList		= [ //This list can contain mods weapons, it's just a check, it will modify NPC skills if they have a weapon from this list
							"srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F",
							"srifle_GM6_ghex_F","srifle_GM6_camo_F","srifle_GM6_F",
							"rhs_weap_m24sws_blk","rhs_weap_m24sws_d","rhs_weap_m24sws_wd","rhs_weap_m24sws",
							"rhs_weap_m40a5_wd","rhs_weap_m40a5_w","rhs_weap_m40a5",
							"rhs_weap_t5000",
							"rhs_weap_m38_rail",
							"rhs_weap_XM2010_wd","rhs_weap_XM2010_d","rhs_weap_XM2010_sa","rhs_weap_XM2010"
						];
WMS_AMS_Flag 			= "Flag_Syndikat_F"; //flag will get a _flag setVariable ["AMS_MissionID",_missionID,true];
WMS_AMS_UnitClass 		= selectRandom ["O_G_Soldier_F","O_Soldier_F","O_T_Soldier_A_F"]; //AI classename, will be used to create mission AIs, Maybe engineer can repair in Exile?
WMS_AMS_LauncherChance 	= 25;
WMS_AMS_remRPG 			= 50;
WMS_AMS_Crate_S 		= "Box_NATO_Wps_F";
WMS_AMS_Crate_L 		= "I_supplyCrate_F"; //B_supplyCrate_F if above the IDAP crate, it will be removed from logistic/moving system [R3F]
WMS_AMS_Crate_XL 		= "B_CargoNet_01_ammo_F";
WMS_AMS_Crate_noMove 	= "CargoNet_01_box_F"; //"CargoNet_01_box_F" //"rhs_weapon_crate"
WMS_AMS_MineAP 			= "APERSTripMine"; //"APERSMine"
WMS_AMS_MineAT 			= "ATMine"; //BWA3_DM31AT
WMS_AMS_MineSign 		= "Land_Sign_MinesTall_English_F";
WMS_AMS_ToRun 			= 3;
WMS_AMS_MinFPS 			= 15; //diag_fps
WMS_AMS_WaitToStart 	= 30; //better spawn the first mission BEFORE the server unlock, the first mission create a ~25 seconds lag for whatever reason
WMS_AMS_LastSpawn 		= -600;
WMS_AMS_MissionTimeout 	= [9600, 900];//[1800, 600]
WMS_AMS_TbtwMissions 	= [240, 120];
WMS_AMS_MaxGrad 		= 0.15;
WMS_AMS_RangeList 		= [300,500,750,1000,1500]; //Killer distance for AI reinforcement
WMS_AMS_sysChatMsg 		= 1; //0: nothing, 1: general, 2: group, 3: player
WMS_AMS_ShowFragMsg 	= true;
WMS_AMS_RespectRwdOnKill = true; //150|750|0.2 //100|750|0.133
WMS_AMS_respectBonus	= 100;
WMS_AMS_distBonusMax 	= 750;
WMS_AMS_distBonusCoef 	= 0.133; //bonus = respectBonus - (distance*distBonusCoef)
WMS_AMS_PlayerDistDelete = 1200;
WMS_AMS_PlayerDistSucces = 100;
WMS_AMS_SpnDistPlayer 	= 750;
WMS_AMS_SpnDistTrader 	= 400;
WMS_AMS_SpnDistTerrit 	= 200;
WMS_AMS_SpnDistMission 	= 950;
WMS_AMS_ClnObj 			= true;
WMS_AMS_ClnObjT 		= 60; //objects cleaning delay after unlock the mission
	//WMS_AMS_AlarmSpawn 	= true;
WMS_AMS_AlarmCln 		= true;
	//WMS_AMS_TimeToWatch 	= 25; //AMS missions are checked from the 15 secondes loop WMS_15sec_Watch.sqf
WMS_AMS_Running_Array 	= [];//Leave it empty //super big array with all missions running
WMS_AMS_Missions 		= [];//Leave it empty //processed/weighted missions list
WMS_AMS_Missions_Running = [];//Leave it empty //Mission actualy running to be sure all running missions are different
WMS_AMS_MissionsCount 	= 0;
WMS_AMS_Mission_ID 		= 0;
WMS_AMS_MkrEasy 		= "Contact_circle1"; //"ExileMissionEasyIcon";
WMS_AMS_MkrModerate 	= "Contact_circle3"; //"ExileMissionModerateIcon";
WMS_AMS_MkrDifficult 	= "Contact_circle4"; //"ExileMissionDifficultIcon";
WMS_AMS_MkrHardcore 	= "Contact_circle2"; //"ExileMissionHardcoreIcon";
WMS_AMS_TradersIcons 	= ["Select"]; //no traders anymore "ExileTraderZoneIcon","ExileAircraftTraderIcon"
WMS_AMS_CustomPos		= ["forest","forest","forest","random"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
WMS_AMS_CustomPosFact	= ["random"]; //used to spawn "Factory Sales"
WMS_AMS_MissionList 	= [
							["MissionTest1",1],
							["MissionTest2",1],
							["ForestCamp",1],
							["HomeDepot",1],
							["CombatPatrol",1],
							["EnyBunkers",1],
							["Arbeit",1],
							["ArmedBandits",1],
							["C192Crash",1],
							["AmazonWH",1],
							["TransmissionTower",1],
							["GunsX3",1],
							["Arena",0], //this one is pretty hardcore on the objects and NPCs xD
							["LightArmoredSteal",1],
							["HeliSteal",1],
							["AABattery",1],
							["Escobar",1],
							["Forgotten",1],
							["Radar",1],
							["Construction",1],
							["OldTemple",1],
							["JunkYard",1],
							["OldPowerPlant",1],
							["Market",1],
							["GrandPaJoe",1],
							["LumberYard",2],
							["Factory",2],
							["FieldHospital",2],
							["Object172M",2],
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
WMS_DynAI_triggers 		= true;
WMS_Pos_AutoScan 		= true; //KEEP TRUE UNLESS YOU KNOW WHAT YOU ARE DOING
WMS_activatedTriggs 	= [];//Leave it empty
WMS_Trigg_Reinforce		= true;
WMS_trigMaxSpeed		= 100;
WMS_triggCheck			= 600;
WMS_triggCheckChance	= 50; 	//chance to send reinforcement at _target position
WMS_triggCheckDist		= 300;	//minimun player distance from other AI to send reinforcement
WMS_Pos_Rdz 			= 50; 	//randomize trigger position

WMS_trigLocals_Size 	= 350;
WMS_trigVillages_Size 	= 350;
WMS_trigCities_Size 	= 400;
WMS_trigCapitals_Size 	= 450;
WMS_trigHills_Size 		= 600;
WMS_Forests_Size		= 250;
WMS_Military_Size		= 200;

WMS_trig_Glob_CoolD 	= 300;
WMS_trigLocals_CoolD 	= 600;
WMS_trigVillages_CoolD 	= 550;
WMS_trigCities_CoolD 	= 600;
WMS_trigCapitals_CoolD 	= 500;
WMS_trigHills_CoolD 	= 600;
WMS_Forests_CoolD		= 600;
WMS_Military_CoolD		= 400;

WMS_trigLocals_Chance 	= 40;
WMS_trigVillages_Chance = 45;
WMS_trigCities_Chance 	= 55;
WMS_trigCapitals_Chance = 65;
WMS_trigHills_Chance 	= 33;
WMS_Forests_Chance		= 40;
WMS_Military_Chance		= 90;

WMS_trig_Glob_LastT 	= 0;
WMS_trigLocals_LastT 	= 0;
WMS_trigVillages_LastT 	= 0;
WMS_trigCities_LastT 	= 0;
WMS_trigCapitals_LastT 	= 0;
WMS_trigHills_LastT 	= 0;
WMS_Forests_LastT		= 0;
WMS_Military_LastT		= 0;

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

WMS_CustomTrig_activate 	= false; //if (time > (WMS_trig_Glob_LastT + WMS_trig_Glob_CoolD) && time > (WMS_CustomTrig_LastT + WMS_CustomTrig_CoolD) && (player distance2d trigPos) > (WMS_CustomTrig_Size/2)) then {};
WMS_Pos_Custom_Rdz 			= 0;
WMS_Pos_CustomTrig 			= []; // AutoScan
WMS_CustomTrig_Size			= 200;
WMS_CustomTrig_ClassName 	= "";//Exile_Container_OldChest
WMS_CustomTrig_Max			= 25; //if more than this number of custom detected, no triggers created
WMS_CustomTrig_LastT		= 0;
WMS_CustomTrig_CoolD		= 600;
WMS_CustomTrig_Chance		= 60;
////////////////////
//default Objects
////////////////////
WMS_PlayerEntity		= "I_Survivor_F"; //"Exile_Unit_Player"; //used for blacklist, player distance check //(count ((position _x select 0) nearEntities [WMS_PlayerEntity, 200]) == 0)

WMS_Utility_Item_1 		= "ACE_Cellphone"; //"Exile_Item_FireExtinguisher"; //used for haloJump in Exile
WMS_Utility_Item_2 		= "rhs_radio_R187P1"; //"Exile_Item_OldChestKit"; //Used for InfantryProgram Action in Exile
WMS_CamoNet_Small 		= "CamoNet_INDP_F"; //Default
WMS_CamoNet_Open 		= "CamoNet_INDP_open_F"; //Default
WMS_CamoNet_Big 		= "CamoNet_INDP_big_F"; //Default
WMS_para_Big			= "B_Parachute_02_F";
WMS_para_small			= "NonSteerable_Parachute_F"; //rhs_d6_Parachute
WMS_BombList 			= ["Bomb_03_F", "Bomb_04_F"]; //DynAI bombing is (select 0)
WMS_ATMines				= "ATMine"; //"ATMine";"BWA3_DM31AT";
WMS_DirectionnalMines 	= ["APERSTripMine"];
WMS_WaterSource			= "Land_ConcreteWell_02_F"; //ACE

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

WMS_MapName = worldname;
MISSION_ROOT = format ["mpmissions\%1.%2\", "__cur_mp", WMS_MapName]; //I should remove this

if (WMS_MapName in WMS_CustomizedMap) then {
	execVM "\InfantryProgram\Scripts\WMS_customMapsSettings.sqf";
}else {
	execVM "\InfantryProgram\Scripts\WMS_List_VHL_Vanilla.sqf";
	execVM "\InfantryProgram\Scripts\WMS_List_Loadout_Vanilla.sqf";
};

//Variables override for Exile Users
if (WMS_exileFireAndForget) then {
	WMS_exileToastMsg 		= true;
	WMS_PlayerEntity		= "Exile_Unit_Player";
	WMS_AMS_MkrEasy 		= "ExileMissionEasyIcon";
	WMS_AMS_MkrModerate 	= "ExileMissionModerateIcon";
	WMS_AMS_MkrDifficult 	= "ExileMissionDifficultIcon";
	WMS_AMS_MkrHardcore 	= "ExileMissionHardcoreIcon";
	//WMS_CaptureZone_mkr		= "ExileMissionCapturePointIcon"; //this messup with the marker color
	WMS_AMS_TradersIcons 	= ["ExileTraderZoneIcon","ExileAircraftTraderIcon"];
	WMS_DynAI_BaseFlag 		= "Exile_Construction_Flag_static";
	WMS_Utility_Item_1 		= "Exile_Item_FireExtinguisher"; //used for haloJump in Exile
	WMS_Utility_Item_2 		= "Exile_Item_OldChestKit"; //Used for InfantryProgram Action in Exile	
	WMS_DynAI_addPoptabsINF = true;
	WMS_DynAI_addPoptabsVHL = true;
	WMS_AMS_addPoptabsUnits = true;
	WMS_AMS_addPoptabsRwd 	= true;
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

publicVariable "WMS_InfantryProgram_list";
publicVariable "WMS_IP_Active_list";
publicVariable "WMS_InfantryProgram_Vehicles";
publicVariable "WMS_Compo_BunkerCamp_LastTime";
publicVariable "WMS_Compo_BunkerCamp_CoolDown";
publicVariable "WMS_IP_ArtySup_LastT";
publicVariable "WMS_IP_ArtySup_CoolD";
publicVariable "WMS_IP_BlackFishSup_LastT";
publicVariable "WMS_IP_BlackFishSup_CoolD";
publicVariable "WMS_IP_ExtractChop_LastT";
publicVariable "WMS_IP_ExtractChop_CoolD";
publicVariable "WMS_Extraction_GND_LastTime";
publicVariable "WMS_Extraction_GND_CoolDown";
publicVariable "WMS_INFbyChopper_LastTime";
publicVariable "WMS_INFbyChopper_CoolDown";
publicVariable "WMS_INFsquad_LastTime";
publicVariable "WMS_INFsquad_CoolDown";
publicVariable "WMS_WDtrader_LastTime";
publicVariable "WMS_WDtrader_CoolDown";
publicVariable "WMS_MoveInCargo_C130_LastTime";
publicVariable "WMS_InfantryProgram_C130CoolDown";
// Random server start time
if (WMS_RandomStartTime) then {
	WMS_Date = [(WMS_Date select 0), (WMS_Date select 1), (WMS_Date select 2), WMS_RandomStart_Hour+floor (random WMS_RandomStart_Random), 00];
	setdate WMS_Date;
	//[[], {setDate WMS_Date}] remoteExec ["call",0,"JIP_id_setDate"];
	publicVariable "WMS_Date";
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
WMS_IP_Active_list = [];
publicVariable "WMS_IP_Active_list";
publicVariable "WMS_exileFireAndForget";
if (WMS_ServerMarkers) then {execVM "\InfantryProgram\Scripts\WMS_ServerMarkers.sqf"};
// Init System Watchs
[]spawn WMS_fnc_sys_Init_Watchs;