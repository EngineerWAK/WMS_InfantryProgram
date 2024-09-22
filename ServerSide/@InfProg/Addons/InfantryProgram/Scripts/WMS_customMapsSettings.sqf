/**
* WMS_customMapsSettings - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
if (true) then {diag_log format ["[WMS Custom Map Config]|WAK|TNA|WMS| Launching at %1", servertime]};

WMS_OffloadToHC1 = false; //WORKINPROGRESS!!!!! Keep false
/* //export NPC loadouts:
_result = [[],[],[],[],[]];
{
 (_result select 0) pushBackUnique uniform _x;
 (_result select 1) pushBackUnique vest _x;
 (_result select 2) pushBackUnique headgear _x;
 (_result select 3) pushBackUnique backpack _x;
 (_result select 4) pushBackUnique goggles _x;
}forEach allunits;
_result
*/
WMS_Loadout_LocalOPFOR = [ 	//HERE IN CASE IT IS FORGOTEN IN THE CUSTOM SETTINGS
							//this is a new NPC loadout using equipement specific from the map or main mod like german army for GM, VC for SOG, etc...
						   	//this loadout will be changed in customMapSettings
							["U_O_CombatUniform_ocamo"],["rhsusf_plateframe_rifleman"],["rhsusf_opscore_paint_pelt_nsw_cam"],["B_Kitbag_cbr"],["G_Bandanna_Syndikat1"]  //CSAT
						];
						//[["U_B_CTRG_Soldier_Arid_F"],["rhsusf_spcs_ucp"],["rhsusf_hgu56p_visor_mask_green"],["B_Kitbag_sgg"],["G_Balaclava_TI_blk_F"]]; //alternative CTGR

if (worldName == "SPE_Normandy") then { //SPE, GM, SOG
										
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_SPE_GM_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_SPE_GM_SOG.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Crates_ACE_RHS_SOG.sqf"; //keep ACE Default, for now
										WMS_AI_MaxUnits_A 			= 125; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 145; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 170; //stop Base attack and missions
										WMS_AI_Units_Class 			= [ //KEEP OPFOR UNITS ONLY!!!
																		"gm_gc_army_sf_squadleader_mpikms72_80_str","gm_gc_army_sf_machinegunner_lmgrpk_80_str","gm_gc_army_sf_marksman_svd_80_str","gm_gc_army_sf_antitank_mpikms72_rpg7_80_str",
																		"gm_gc_army_sf_demolition_pm63_80_str","gm_gc_army_sf_antitank_mpikms72_rpg18_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str",
																		"gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str",
																		"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_pl_army_sf_squadleader_akmn_80_moro",
																		"gm_pl_army_sf_machinegunner_rpk_80_moro","gm_pl_army_sf_marksman_svd_80_moro","gm_pl_army_sf_antitank_akmn_fagot_80_moro","gm_pl_army_sf_demolition_pm63_80_moro",
																		"gm_pl_army_sf_grenadier_akm_pallad_80_moro"
																	];
										WMS_Loadout_LocalOPFOR 		= [ //this is a new NPC loadout using equipement specific from the map or main mod like german army for GM, VC for SOG, etc...
						   												// this loadout will be changed in customMapSettings
	 																	["U_SPE_ST_Soldier_Camo2","U_SPE_ST_Soldier_Camo","U_SPE_ST_MGunner_E44","U_SPE_ST_Soldier_E44_Camo2","U_SPE_ST_Soldier_E44_Camo","U_SPE_ST_Tank_crew_spring_open"],
																		["Specter_RAV","MCB_LBT_vest","V_CarrierRigKBT_01_light_Olive_F","V_SPE_GER_VestSTG","V_PlateCarrier1_rgr_noflag_F","rhs_6b2_chicom"],
																		["H_SPE_ST_Helmet2","H_SPE_ST_Helmet","H_SPE_ST_Helmet3","H_SPE_GER_HelmetUtility","H_SPE_GER_HelmetUtility_Grass","H_SPE_GER_Helmet_net_painted"],
																		["B_SPE_GER_Tonister41_Frame","B_SPE_GER_A_frame_ST_MGCan","B_SPE_GER_Tonister41_Frame_Full_ST","B_SPE_GER_A_frame_MGCan_zelt","B_SPE_GER_A_frame_Full","B_SPE_GER_Belt_bag_zelt_trop"],
																		["G_Balaclava_Flames1","G_Balaclava_Flecktarn","G_Balaclava_Scarecrow_01","G_Balaclava_Skull1","G_Balaclava_Tropentarn","G_Balaclava_BlueStrips"]//_googles/_facewear
																	];
										WMS_AMS_UnitClass 			= WMS_AI_Units_Class;
										WMS_AI_LaunchersOPF 		= [ //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
																		[
																			"gm_m72a3_oli","gm_pzf44_2_oli",
																			"rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_M136_hp","rhs_weap_M136","vn_rpg2","vn_rpg7","vn_m20a1b1_01","vn_m72"
																		],
																		["vn_sa7","rhs_weap_fim92"],
																		["launch_O_Titan_short_F"]
																	];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["gm_ge_airforce_do28d2_medevac","gm_ge_airforce_do28d2_medevac","gm_ge_airforce_do28d2_medevac"];//["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= [
																		"gm_handgrenade_frag_dm51","gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_rgd5","gm_handgrenade_conc_dm51","gm_handgrenade_conc_dm51a1", //GM Grenades
																		"rhs_mag_an_m14_th3","rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_rgo","rhs_grenade_khattabka_vog25_mag",
																		"vn_m7_grenade_mag","vn_m14_early_grenade_mag","vn_rkg3_grenade_mag","vn_rgd33_grenade_mag",
																		"vn_molotov_grenade_mag","vn_chicom_grenade_mag","vn_f1_grenade_mag","vn_m14_grenade_mag","vn_m34_grenade_mag","vn_m61_grenade_mag","vn_rg42_grenade_mag","vn_rgd5_grenade_mag","vn_t67_grenade_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "vn_bomb_500_mk82_se_ammo", "vn_bomb_500_mk82_dc_ammo", "vn_bomb_2000_gbu8_he_ammo", "rhs_ammo_fab500_m54", "Bo_Mk82","vn_bomb_750_m117_he_ammo","vn_bomb_100_m47_wp_ammo"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","vn_bomb_2000_gbu8_he_ammo","vn_bomb_1000_mk83_he_ammo","vn_bomb_100_m47_wp_ammo","vn_bomb_750_blu1b_fb_ammo","vn_bomb_15000_blu82_dc_ammo"];
																		//vn_bomb_mk36_destructor_mine_ammo //this one do not explode, it stick in the ground and wait... :D
										WMS_DynAI_RainObjects 		= [ //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
																		["Chemlight_blue","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","vn_bomb_mk36_destructor_mine_ammo"],
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"],
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"]
																	];
										WMS_RunnerTypes				= ["ClaymoreDirectionalMine_Remote_Ammo_Scripted","SatchelCharge_Remote_Ammo_Scripted","Sh_155mm_AMOS","vn_bomb_100_m47_wp_ammo"];//["mine","satchel","shell","bomb"] //[3 front, 1 front, 2 front, 1 back]
										WMS_AI_RdoTruck 			= "vn_b_armor_m577_01"; //"rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "gm_pl_army_spg9_tripod"; //"vn_b_rok_army_static_m101_01"; //"rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "vn_o_nva_static_zgu1_01"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 125;
										WMS_C130_Altitude 			= 175;
										WMS_ExtractionChopper_Type 	= ["vn_b_air_uh1d_02_06"];  //infantry program Active List only
										WMS_ExtractionVehicle_Type 	= ["vn_i_armor_m113_acav_04"];  //infantry program Active List only
										WMS_DeliveryChopper_Type 	= ["vn_b_air_oh6a_02"];  //infantry program Active List only
										WMS_Pos_Forests 			= [[9494.79,3399.92,0],[9783.08,3480.52,0],[12044.6,406.423,0],[9469.58,2642.46,0],[8653.28,1356.58,0],[1606.69,2536.37,0],[1648.18,7501.36,0],[998.966,7324.75,0],[3614.67,8915.57,0],[5614.6,9114.27,0],[5760.93,10304.5,0],[2371.16,11396.8,0],[3172.97,12067.2,0],[1557.41,11932.5,0],[361.521,11877.9,0],[7676.29,6540.47,0],[8040.64,6163.11,0],[3806.91,741.29,0]]; //not autoScan
										WMS_Pos_Military 			= [
																		[11105.1,11301.2,0], [11272.3,11120.6,0], [11051.7,10919.8,0], [10803.4,10828.9,0], //St Lo
																		[10994.7,10051.7,0], [10835.9,10238.5,0], [10261.2,10312.6,0], //north airfield, st lo
																		[8409.72,1428.64,0],[8962.97,4018.31,0],[4118.53,9155.36,0],[2914.18,7122.82,0],[3613.49,1365.72,0],[4030.74,3067.38,0], //ckp
																		[8395.4,10355.2,0],[2145.17,9981.55,0],[5036.9,4343.66,0],[8166.22,1082.36,0],//spawnzone militaties
																		[8332.92,5871.59,0],[7497.79,6294.32,0],[7970.25,6562.33,0],[9520.03,3272.08,0],[9909.93,3265.97,0],[9787.57,3718.25,0],[1838.69,3834.36,0],
																		[7939.52,6166.63],[7900.78,5971,0],[7909.17,6335.32,0],[9712.57,3455.85,0] //Bunkers
																		]; //not autoScan
										WMS_Pos_Factory 			= [];
										WMS_DynAI_GunshipMedium 	= ["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[],[]]];//["vn_o_air_mi2_03_04",[],[[],[]]]; //those F U C K I N G Mi2 SOG MUST go away
										WMS_DynAI_GunshipHeavy 		= ["RHS_Mi8MTV3_vvsc",["Camo5",1],[[],[]]];//["vn_o_air_mi2_04_02",[],[[],[]]]; //those F U C K I N G Mi2 SOG MUST go away
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AI_HMG 					= "vn_o_nva_static_dshkm_high_01"; //"rhs_KORD_high_MSV";
										WMS_AI_HMG_Scope 			= "vn_o_pl_static_sgm_high_01"; //no scope but kind of AA
										WMS_AI_HMG_Shield			= "vn_o_vc_static_mg42_high"; //Not a shield but should be fun //"B_G_HMG_02_high_F";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_Arty					= "vn_o_vc_static_mortar_type63"; //"rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["vn_mine_m15","vn_mine_tm57","rhsusf_mine_M19","ATMine"];
										WMS_OPFOR_Flag				= "SPE_FlagCarrier_GER"; //default flag for Bandits, different than AMS so no interactions with findpositions //vn_flag_vc
										WMS_ATMines					= WMS_AMS_MineAT;
										WMS_AMS_SpnDistMission 		= 1500;
										WMS_DynAI_Skills			= [0.06, 0.11, 0.18, 0.23]; //+random 0.15
										WMS_AI_RoamingVHL_citySpawn	= true; //NEW
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_AI_CargoUnits	 		= 1;
										//WMS_SupplyDropCount 		= 2; //default 2
										WMS_HumaniDropCount 		= 4; //default 3
										WMS_AMS_ToRun 				= 3; 
										WMS_AMS_MkrColor			= "ColorOPFOR";
										WMS_AMS_CustomPos			= ["forest"];//"forest" //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["random"];//"factory" //used to spawn "Factory Sales"
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_AMS_CleanMapObj			= true;
										WMS_AMS_ForceRadius			= true; //3m
										WMS_AMS_DefRad				= 8; //Defaut Forced radius. You might want to keep 0 since anyway, objects will be hidden
										WMS_CaptureZone_Vhl			= [["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],["vn_o_armor_ot54_01","vn_o_armor_m41_01","vn_o_armor_t54b_01","vn_o_armor_type63_01"]]; //[air],[gnd] //rhsgref_mi204g_CAS
										WMS_RandomStart_Hour 		= 3;
										WMS_RandomStart_Random 		= 8;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
										WMS_FastNight_Day 			= 7; //day time speed //default 6
										WMS_FastNight_Night 		= 25; //time speed //default 38
										WMS_DynAI_DestroyVHL 		= 60;
										WMS_trigLocals_Chance 		= 75;
										WMS_Forests_Chance			= 60; //40
										WMS_Military_Chance			= 97; //90
										WMS_triggCheck				= 300; //Active triggers will check their area to respawn "dynamic" stuff on players if no NPCs around
										WMS_triggCheckChance		= 65; //chance to send reinforcement at _target position
										WMS_trig_Glob_CoolD 		= 210;
										WMS_trigLocals_CoolD 		= 350;
										WMS_trigVillages_CoolD 		= 350;
										WMS_trigCities_CoolD 		= 350;
										WMS_trigCapitals_CoolD 		= 250;
										WMS_trigHills_CoolD 		= 300;
										WMS_Forests_CoolD			= 300;
										WMS_Military_CoolD			= 140;
										WMS_Military_Size			= 260;

										WMS_AL_VHLmax				= 10; //Max vehicles (all included) running at the same time
										WMS_AL_UnitMax				= 0; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AL_Units				= [//infantry classname, do not mix SIDES!
																	"vn_c_men_22","vn_c_men_29","vn_c_men_30","vn_c_men_32","vn_c_men_18","vn_c_men_06","vn_c_men_08","vn_c_men_01","vn_c_men_03","vn_c_men_09","vn_c_men_11"
																	]; 
										WMS_AL_Vehicles				= [[ //[[AIR],[GROUND],[SEA]]
																	"vn_b_air_uh1b_01_09","vn_b_air_uh1d_04_09","RHS_Mi8amt_civilian","C_Heli_Light_01_civil_F","rhs_uh1h_idap"
																	],[
																	"vn_c_bicycle_02","vn_c_car_02_01","vn_c_bicycle_02","vn_c_car_03_01","vn_c_bicycle_02","vn_c_car_01_01","vn_c_bicycle_02","vn_c_car_04_01"
																	],[
																	"vn_c_boat_01_03","vn_c_boat_01_01","vn_c_boat_02_03","vn_c_boat_02_04","vn_c_boat_08_02","vn_c_boat_07_02","vn_c_boat_07_01","vn_c_boat_08_01"
																	]];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"] //wave 9 & 10
																	];
										//NEW CONVOY EVENT
										WMS_TargetConvoy 			= false;
										WMS_TargetConvoyPos 		= [ //[[pos,dir],[pos,dir],[pos,dir],[pos,dir],...]
																		];
										WMS_TargetConvoyVHL 		= [ //[[logistic],[escort],[SEA_logistic],[SEA_escort]]
																	[//[logistic]
																		"vn_b_wheeled_m54_ammo_airport","vn_o_wheeled_z157_fuel_kr","vn_o_wheeled_z157_repair_kr","vn_o_wheeled_z157_02_kr","vn_o_armor_btr50pk_01_nva65","vn_o_armor_btr50pk_03_nva65",
																		"vn_o_armor_m577_02","vn_o_armor_m577_01","vn_o_wheeled_z157_03_nva65","vn_o_wheeled_z157_01_nva65","vn_o_wheeled_z157_ammo_nvam","rhs_gaz66_ammo_vv",
																		"rhs_gaz66_r142_vv","rhs_gaz66_ap2_vv","rhs_kamaz5350_ammo_vv","RHS_Ural_Repair_VV_01","rhs_zil131_flatbed_cover_vv",
																		"rhs_9k79_K","O_Radar_System_02_F","O_SAM_System_04_F","vn_sa2","vn_o_static_rsna75","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2"
																	],[//[escort]
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_m113_acav_06_kr","vn_o_wheeled_btr40_mg_06_pl","vn_o_wheeled_btr40_mg_03_pl","vn_o_wheeled_z157_mg_02_pl","vn_o_armor_btr50pk_02_nva65","vn_o_armor_m125_01",
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_pt76b_01_nva65","vn_o_armor_t54b_01_nva65","vn_o_armor_type63_01_nva65","vn_o_armor_m41_01","rhsgref_tla_btr60","rhsgref_tla_offroad_armed",
																		"rhs_btr80a_vv","rhs_tigr_sts_3camo_vv","rhs_bmp2k_vv","rhs_bmp1d_vv","rhs_zsu234_aa","rhs_2s1_at_tv",
																		"RHS_M6_wd","rhs_2s3_at_tv","rhs_t72ba_tv","rhs_t80","rhs_bmp3_msv","rhsgref_BRDM2_msv"		
																	],[//[SEA_logistic]
																		"vn_o_boat_08_01_kr","vn_o_boat_08_02_kr","rhsgref_hidf_rhib","vn_b_boat_06_01","B_Boat_Armed_01_minigun_F","B_SDV_01_F","rhsusf_mkvsoc","vn_o_boat_04_01"		
																	],[//[SEA_escort]
																		"O_Boat_Armed_01_hmg_F","vn_o_boat_03_01","vn_o_boat_04_01","vn_b_boat_12_03","vn_b_boat_13_03","vn_b_boat_10_01"				
																	]
																	];
										//NEW CONVOY EVENT\\
										//Arttilery static mission will come later
										/*WMS_AMS_StaticPos_1			= []; //VC //patrol
										WMS_AMS_StaticPos_2			= []; //PATHET //patrol, garrison positions
										WMS_AMS_StaticPos_3			= []; //PAVN  //patrol, garrison positions //ARTY 1
										WMS_AMS_StaticPos_4			= []; //KHMER //patrol, garrison positions //ARTY 2
										execVM "\InfantryProgram\Scripts\AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf";*/
};
if (worldName == "Cam_Lao_Nam") then {
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_Crates_ACE_RHS_SOG.sqf";
										WMS_AI_MaxUnits_A 			= 135; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 155; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 180; //stop Base attack and missions
										WMS_AI_LaunchersOPF 		= [ //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
																		["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_M136_hp","rhs_weap_M136","vn_rpg2","vn_rpg7","vn_m20a1b1_01","vn_m72"],
																		["vn_sa7","rhs_weap_fim92"],
																		["launch_O_Titan_short_F"]
																	];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_rgo","rhs_grenade_khattabka_vog25_mag",
																		"vn_m7_grenade_mag","vn_m14_early_grenade_mag","vn_rkg3_grenade_mag","vn_rgd33_grenade_mag",
																		"vn_molotov_grenade_mag","vn_chicom_grenade_mag","vn_f1_grenade_mag","vn_m14_grenade_mag","vn_m34_grenade_mag","vn_m61_grenade_mag","vn_rg42_grenade_mag","vn_rgd5_grenade_mag","vn_t67_grenade_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "vn_bomb_500_mk82_se_ammo", "vn_bomb_500_mk82_dc_ammo", "vn_bomb_2000_gbu8_he_ammo", "rhs_ammo_fab500_m54", "Bo_Mk82","vn_bomb_750_m117_he_ammo","vn_bomb_100_m47_wp_ammo"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","vn_bomb_2000_gbu8_he_ammo","vn_bomb_1000_mk83_he_ammo","vn_bomb_100_m47_wp_ammo","vn_bomb_750_blu1b_fb_ammo","vn_bomb_15000_blu82_dc_ammo"];
																		//vn_bomb_mk36_destructor_mine_ammo //this one do not explode, it stick in the ground and wait... :D
										WMS_DynAI_RainObjects 		= [ //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
																		["Chemlight_blue","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","vn_bomb_mk36_destructor_mine_ammo"],
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"],
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"]
																	];
										WMS_RunnerTypes				= ["ClaymoreDirectionalMine_Remote_Ammo_Scripted","SatchelCharge_Remote_Ammo_Scripted","Sh_155mm_AMOS","vn_bomb_100_m47_wp_ammo"];//["mine","satchel","shell","bomb"] //[3 front, 1 front, 2 front, 1 back]
										WMS_AI_RdoTruck 			= "vn_b_armor_m577_01"; //"rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "vn_b_rok_army_static_m101_01"; //"rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "vn_o_nva_static_zgu1_01"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 150;
										WMS_C130_Altitude 			= 200;
										WMS_ExtractionChopper_Type 	= ["vn_b_air_uh1d_02_06"];  //infantry program Active List only
										WMS_ExtractionVehicle_Type 	= ["vn_i_armor_m113_acav_04"];  //infantry program Active List only
										WMS_DeliveryChopper_Type 	= ["vn_b_air_oh6a_02"];  //infantry program Active List only
										WMS_Pos_Forests 			= [ //more
											[12428,6089.27,0],[13155.1,5990.56,0],[13918.5,5868.82,0],[12493.8,6849.33,0],[13194.6,7250.75,0],[13925.1,7382.36,0],[14543.6,6359.08,0],[17333.8,4917.93,0],[17603.6,4266.45,0],[17245,3460.32,0],[16787.6,5460.82,0],
											[15958.5,4674.44,0],[11470.5,4009.81,0],[12368.8,3506.39,0],[13040,3256.33,0],[14777.3,3868.33,0],[16304,3144.46,0],[12812.9,7849.58,0],[11654.8,7721.26,0],[11536.3,8405.64,0],[10917.7,8770.87,0],[12293.1,8336.55,0],
											[2955.23,19622.3,0],[4024.58,18809.6,0],[4952.44,19260.3,0],[3787.67,17783,0],[1264.02,16944,0],[5544.69,18552.9,0],[5567.72,17829.1,0],[3626.45,14848,0],[3044.07,14255.8,0],[648.734,13683.3,0],[1820.08,13551.7,0],
											[3758.06,14140.6,0],[6321.2,16266.2,0],[8091.38,13903.7,0],[2685.43,12936.4,0],[3554.06,12196.1,0],[4935.99,11906.5,0],[6367.27,12311.2,0],[754.025,11528.1,0],[770.477,12465.9,0],[1945.11,10916.1,0],[3646.19,10995.1,0],
											[2935.49,10491.7,0],[609.252,9771.12,0],[6564.68,11054.3,0],[7179.97,10583.8,0],[4044.32,9583.57,0],[1007.38,9083.45,0],[6479.14,9850.08,0],[7726.16,9353.25,0],[1273.89,8224.68,0],[3527.74,8570.16,0],
											[4843.86,8813.64,0],[5728.95,9076.86,0],[6627.2,8514.22,0],[5531.53,8135.84,0],[5511.79,7234.3,0],[6390.3,7777.2,0],[6600.88,7007.27,0],[6801.59,5207.48,0],[8028.87,6691.4,0],[10493.3,6438.05,0],[9542.4,6704.56,0],
											[13372.3,8843.26,0],[10157.7,9790.86,0],[13191.3,10248.2,0],[14517.3,10103.4,0],[15244.5,10034.3,0],[12924.8,10926,0],[13033.4,11682.8,0],[10292.6,11751.9,0],[9381.18,11817.7,0],[9947.11,11083.9,0],[11822.6,11620.3,0],
											[11079,11774.9,0],[8673.76,12400.1,0],[13767.1,12143.4,0],[12240.4,15868,0],[11539.6,15631.1,0],[11006.6,16572.2,0],[9604.92,17513.2,0],[10315.6,16930.8,0],[14060,16618.2,0],[9920.79,19572.9,0],[10664.4,19207.7,0],
											[7926.87,19589.4,0],[14912.2,19368.9,0],[16228.3,15864.8,0],[12780.1,14670.4,0],[15920.5,11976.3,0],[17781.5,10666.6,0],[17944.5,9978.17,0],[18790.9,9962.64,0],[14908.5,8469.23,0],[14444.7,1968.98,0],
											[8370.29,17959.9,0],[7277.31,18378.2,0],[2806.54,3562.21,0],[6373.83,13725.9,0],[5097.96,12959.4,0],[8415.98,8711.45,0]]; //not autoScan
										/*WMS_Pos_Forests				=[//less
											[13194.6,7250.75,0],[17333.8,4917.93,0],[11470.5,4009.81,0],[12368.8,3506.39,0],[12689.5,7959.99,0],[11654.8,7721.26,0],[10661.4,8538.98,0],[2955.23,19622.3,0],[4024.58,18809.6,0],
											[3787.67,17783,0],[5567.72,17829.1,0],[3626.45,14848,0],[3044.07,14255.8,0],[648.734,13683.3,0],[1820.08,13551.7,0],[6321.2,16266.2,0],[8091.38,13903.7,0],[2685.43,12936.4,0],[3554.06,12196.1,0],[4935.99,11906.5,0],
											[6367.27,12311.2,0],[825.025,11486.6,0],[770.477,12465.9,0],[1945.11,10916.1,0],[3646.19,10995.1,0],[2935.49,10491.7,0],[6564.68,11054.3,0],[7179.97,10583.8,0],[3933.63,9575.06,0],[1007.38,9083.45,0],
											[6479.14,9850.08,0],[7726.16,9353.25,0],[1273.89,8224.68,0],[3512.42,8563.35,0],[5728.95,9076.86,0],[6634.88,8562.23,0],[5531.53,8135.84,0],[5511.79,7234.3,0],[6600.88,7007.27,0],[6801.59,5207.48,0],
											[8028.87,6691.4,0],[10493.3,6438.05,0],[12996.5,10420.4,0],[15244.5,10034.3,0],[13071.9,11553.4,0],[9839.71,11264.6,0],[11822.6,11620.3,0],[10720.2,11809.1,0],[8673.76,12400.1,0],[10808.8,16729.6,0],
											[9604.92,17513.2,0],[14060,16618.2,0],[10664.4,19207.7,0],[14762.3,19285.5,0],[16228.3,15864.8,0],[14444.7,1968.98,0],[8370.29,17959.9,0],[7277.31,18378.2,0],[2806.54,3562.21,0],[6373.83,13725.9,0],
											[5097.96,12959.4,0],[8415.98,8711.45,0]];*/
										WMS_Pos_Military 			= [
											[2215.69,13393.5,0],[1036.47,9391.75,0],[4908.9,13643.2,0],[6029.16,13901.9,0],[12412.9,19362.1,0],[13533.6,19192.9,0],[6930.94,5402.79,0],[6840.31,4553.8,0],[8140.09,5389.21,0],[2262.79,4027.41,0],[2043.68,3958.12,0],
											[1872.52,4199.2,0],[11519.2,6482.52,0],[11452.2,6154.57,0],[11373.9,5760.34,0],[16080.5,3645.85,0],[15105,4706.5,0],[17168.8,5580.39,0],[17452.4,5575.77,0],[16241.9,6284.29,0],[16316.8,6542.98,0],[16839.3,6413.86,0],
											[15704,7244.87,0],[15908.4,7586.65,0],[16611.3,7681.2,0],[16939.2,7476.65,0],[16149.8,7176.37,0],[17602.9,6766.45,0],[18617.7,6080.44,0],[17879.2,5796.49,0],[19239.5,7250.14,0],[20160.5,6605.22,0],[20065,7281.91,0],
											[19347.6,5677.69,0],[19189.8,5336.49,0],[19444.4,4577.14,0],[18620.3,8357.75,0],[17629.2,9431.19,0],[16323.4,8118.78,0],[15937.9,7976.11,0],[16269,7612.43,0],[16941.7,7119.42,0],[16035.2,6801.08,0],[15556.6,6791.52,0],
											[14707.9,6945.11,0],[13749.9,8393.47,0],[12854,8505.16,0],[14775,9617.43,0],[16167.6,11039.8,0],[15446.7,12028.7,0],[15876.5,12304.1,0],[16278.2,12287.7,0],[14132.5,12802.5,0],[15648.7,13530.7,0],[14395.5,15904.1,0],
											[13306.2,17335.9,0],[12024,17625.8,0],[11819,16813.4,0],[12677.2,17354.1,0],[12135.5,16571.5,0],[11986.8,18325.6,0],[12949.2,18650.3,0],[14781.7,18454.6,0],[14791.4,16181.4,0],[12480.6,13311,0],[12941.2,13732.6,0],
											[14509.2,15273,0],[14655.1,15607.1,0],[14511,16469.7,0],[14414.6,18280.7,0],[14184.9,18819.5,0],[16647.6,6726.87,0],[18104.2,6209.21,0],[11167.4,14821.8,0],[15214.1,4456.82,0],[15381.7,4647.97,0],[14837.5,6792.94,0],
											[18519.4,8520.39,0],[12159.7,17707.1,0],[19161.6,13520.9,0],[2112.71,4316.92,0],
											[3218.44,9059.68,0], //CheckPoints
											[4637.63,18975,0],[3665.86,17874.3,0],[3282.48,15529.5,0],[2598.48,18698.8,0],[2527.77,18379.2,0],[3425.55,19078.4,0],[3299.52,18553.9,0],[3987.18,18647.9,0],[19780,3686.79,0],[15956.7,18252.4,0] //Bunkers
											]; //not autoScan
										WMS_Pos_Factory 			= [
											[14732,16140,0],[14772.1,16082.1,0],[14822,16126.1,0],[14561.3,15948.7,0],[14445,15981.6,0],[14649.8,15622.7,0],[14798.4,15632.7,0],[14651.7,15225.3,0],[14362.4,15292.7,0],[14403.3,15253.9,0],[14824.2,16226.4,0],
											[15263.6,13723.3,0],[15273.1,13768,0],[15127.8,13570.1,0],[15073.3,13496.6,0],[14655.2,13136.5,0],[14592.9,13164.9,0],[14540.6,12967.7,0],[14823.5,12782.8,0],[13827.3,13592.1,0],[13852.5,13645.7,0],[13799.8,13652.1,0],
											[13723.2,13649.1,0],[13728.6,13711.2,0],[13687.7,13724.1,0],[13619.1,13657.3,0],[13595.5,13727.7,0],[13592.8,13816.9,0],[13489.7,13825.2,0],[13474.4,13827.2,0],[13208.5,14075.8,0],[13129.3,14190,0],[13424.5,14150,0],
											[13411.3,14218.7,0],[13496.1,14223.5,0],[14067.2,13559.4,0],[14106.6,13609.5,0],[13952.9,13104.8,0],[13902.4,13154.8,0],[13975.7,13196.1,0],[13674,13136.9,0],[12673.9,13403.8,0],[12635.7,13406.3,0],[12632.3,13348.8,0],
											[12649.5,13069.6,0],[16975.6,9050,0],[16966,9123.68,0],[17054.5,9091.41,0],[17090.1,9128.74,0],[17143.7,8967.02,0],[17762.5,9439.14,0],[18139.5,6306.25,0],[18121.3,6363.81,0],[17912.3,5878.37,0],[17867.6,5937.77,0],
											[17972.8,5853.88,0],[16131.9,3568.89,0],[16035.6,3525.65,0],[16087.9,3477.46,0],[15977.3,3581.39,0],[15942.2,3660.49,0],[16101.3,3720.48,0],[3013.6,8737.16,0],[2974.86,8728.39,0],[3026.73,8684.55,0],[3006.31,8764.71,0],
											[3240.51,8721.34,0],[3206.86,8711.09,0],[3017.46,8882.49,0],[1082.2,15242.1,0],[13030.7,17093.7,0],[13012.3,17076.7,0],[13054.3,17009.2,0],[13274,16853.4,0]];
										WMS_DynAI_GunshipMedium 	= ["vn_o_air_mi2_03_04",[],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["vn_o_air_mi2_04_02",[],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AI_HMG 					= "vn_o_nva_static_dshkm_high_01"; //"rhs_KORD_high_MSV";
										WMS_AI_HMG_Scope 			= "vn_o_pl_static_sgm_high_01"; //no scope but kind of AA
										WMS_AI_HMG_Shield			= "vn_o_vc_static_mg42_high"; //Not a shield but should be fun //"B_G_HMG_02_high_F";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_Arty					= "vn_o_vc_static_mortar_type63"; //"rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["vn_mine_m15","vn_mine_tm57","rhsusf_mine_M19","ATMine"];
										WMS_OPFOR_Flag				= "vn_flag_vc"; //default flag for Bandits, different than AMS so no interactions with findpositions //vn_flag_vc
										WMS_ATMines					= WMS_AMS_MineAT;
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_DynAI_Skills			= [0.06, 0.12, 0.20, 0.29]; //+random 0.15
										WMS_AI_RoamingVHL_citySpawn	= true; //NEW
										WMS_AI_RoamingVHLcount 		= 16; //10
										WMS_AI_CargoUnits	 		= 1;
										//WMS_SupplyDropCount 		= 2; //default 2
										//WMS_HumaniDropCount 		= 4; //default 3
										WMS_AMS_ToRun 				= 3; 
										WMS_AMS_CustomPos			= ["forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_AMS_CleanMapObj			= false;
										WMS_AMS_ForceRadius			= true; //3m
										WMS_CaptureZone_Vhl			= [["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],["vn_o_armor_ot54_01","vn_o_armor_m41_01","vn_o_armor_t54b_01","vn_o_armor_type63_01"]]; //[air],[gnd] //rhsgref_mi204g_CAS
										WMS_RandomStart_Hour 		= 4;
										WMS_RandomStart_Random 		= 8;
										WMS_FastNight_Morning 		= 5.5; //morning start at
										WMS_FastNight_Evening		= 17.7; //evening start at
										WMS_FastNight_Day 			= 4; //day time speed //default 6
										WMS_FastNight_Night 		= 25; //time speed //default 38
										WMS_DynAI_DestroyVHL 		= 60;
										WMS_triggCheck				= 300; //Active triggers will check their area to respawn "dynamic" stuff on players if no NPCs around
										WMS_triggCheckChance		= 65; //chance to send reinforcement at _target position
										WMS_trig_Glob_CoolD 		= 240;
										WMS_Forests_CoolD			= 300;
										WMS_Military_CoolD			= 170;
										WMS_AL_VHLmax				= 10; //Max vehicles (all included) running at the same time
										WMS_AL_UnitMax				= 0; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AL_VhlBalance			= [2,2,0,2,2,2,2,2]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AI_Units_Class 			= [ //KEEP OPFOR UNITS ONLY!!!
																	"vn_o_men_nva_dc_01","vn_o_men_nva_dc_13","vn_o_men_nva_dc_08",
																	"vn_o_men_nva_marine_03","vn_o_men_nva_marine_10","vn_o_men_nva_marine_04"];
										WMS_AMS_UnitClass 			= WMS_AI_Units_Class;
										WMS_AL_Units				= [//infantry classname, do not mix SIDES!
																	"vn_c_men_22","vn_c_men_29","vn_c_men_30","vn_c_men_32","vn_c_men_18","vn_c_men_06","vn_c_men_08","vn_c_men_01","vn_c_men_03","vn_c_men_09","vn_c_men_11"
																	]; 
										WMS_AL_Vehicles				= [[ //[[AIR],[GROUND],[SEA]]
																	"vn_b_air_uh1b_01_09","vn_b_air_uh1d_04_09","RHS_Mi8amt_civilian","C_Heli_Light_01_civil_F","rhs_uh1h_idap"
																	],[
																	"vn_c_bicycle_02","vn_c_car_02_01","vn_c_bicycle_02","vn_c_car_03_01","vn_c_bicycle_02","vn_c_car_01_01","vn_c_bicycle_02","vn_c_car_04_01"
																	],[
																	"vn_c_boat_01_03","vn_c_boat_01_01","vn_c_boat_02_03","vn_c_boat_02_04","vn_c_boat_08_02","vn_c_boat_07_02","vn_c_boat_07_01","vn_c_boat_08_01"
																	]];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"] //wave 9 & 10
																	];
										//NEW CONVOY EVENT
										WMS_TargetConvoy 			= true;
										WMS_TargetConvoyPos 		= [ //[[pos,dir],[pos,dir],[pos,dir],[pos,dir],...]
																		[[1752,19119.6,0],128.123],[[2456.8,19032.9,0],107.245],[[3245.03,18640.3,0],114.336],[[3990.04,19370.1,0],171.398],[[4145.37,19072.3,0],286.022],[[936.396,19242.3,0],167.424],[[1178.06,18497.9,0],121.314],[[3863.73,18041,0],61.8472],[[3949.97,18177.2,0],131.355],[[5238.88,16871.5,0],309.446],[[5726.07,17053.2,0],182.067],[[4860.03,18664.8,0],59.4442],[[2475.35,17087.1,0],325.033],[[2532.89,17118.5,0],122.879],[[2515.03,17424.6,0],176.452],[[2945.05,16783,0],32.6304],[[4868.83,15134.1,0],58.9835],[[5133.59,15362.1,0],215.521],[[5734.36,15068.4,0],286.93],[[5960.17,15102.5,0],114.704],[[5046.03,13567.1,0],306.518],[[4800.93,13716.5,0],49.1899],[[2250.13,15350.3,0],216.175],[[2121.12,15415.8,0],97.6128],[[1101.58,15198.7,0],340.798],[[1102.2,14997.8,0],218.36],[[1453.76,15306.2,0],262.172],[[1420.77,12550.4,0],6.31924],[[1610.17,12608.6,0],305.358],[[1636.3,12478.7,0],348.381],[[2007.7,12656.8,0],156.311],[[1667.15,12900.2,0],101.46],[[1299.8,13768.2,0],293.88],[[1350.1,13606.3,0],143.69],[[2625.63,13546.1,0],317.733],[[3087.61,12772.6,0],139.385],[[3092.96,12024.8,0],286.046],[[2929.33,11785.2,0],70.5683],[[1007.09,10202.8,0],126.721],[[1655.84,9518.7,0],227.454],[[1619.35,9438.73,0],0],[[1426.4,9487.01,0],97.8215],[[601.989,12021,0],13.083],[[2043.12,3963.34,0],301.314],[[2281.19,4074.38,0],337.788],[[2309.7,3980.13,0],90.3019],[[2464,4249.91,0],20.835],[[3213.52,3957.29,0],282.702],[[1884.03,3826.09,0],311.531],[[2549,3064.98,0],96.3762],[[6744.58,4559.93,0],0],[[6779.92,4651.17,0],269.945],[[6940.98,4487.18,0],270.111],[[6921.5,5247.35,0],178.826],[[7052.68,4109.28,0],24.3227],[[6702.73,4156.12,0],135.53],[[8714.14,5545.99,0],30.3562],[[8821.58,5673.37,0],236.112],[[3313.21,7682.29,0],89.4427],[[3458.57,7747.54,0],139.052],[[3055.49,7741.12,0],345.672],[[3050.45,8724.25,0],304.484],[[2907.39,8750.08,0],70.6838],[[3332.99,9002.82,0],119.88],[[3220.4,8731.56,0],1.72494],[[3644.58,9020.13,0],237.518],[[1605.64,8476.47,0],15.68],[[1620.02,8706.42,0],176.234],[[2852.47,11078.7,0],115.024],[[3199.44,10691.8,0],328.003],[[4393.92,11737.3,0],88.1625],[[4242.45,11820.1,0],326.467],[[5137.64,9758.13,0],105.726],[[5299.18,9543.96,0],279.155],[[5175.63,8807.37,0],20.3201],[[5751.07,9202.57,0],88.1121],[[6140.96,9539.59,0],158.056],[[7239.54,9203.34,0],298.013],[[7418.53,9083.14,0],123.848],[[6823.62,9375.03,0],341.927],[[6853.45,10378.4,0],270.005],[[7188.37,11595.5,0],289.371],[[7071.53,11815,0],91.9177],[[7397.42,11781.2,0],275.204],[[7651.3,11802.9,0],183.05],[[6327.74,11861.3,0],178.043],[[5827.3,12143.7,0],173.972],[[5863.56,9895.99,0],270.374],[[5280.82,17515,0],141.883],[[5857.1,18819.8,0],130.008],[[6295.64,18772.2,0],252.952],[[7370.58,18955.6,0],82.8154],[[8029.87,18439.4,0],41.5759],[[7437.4,17322.2,0],302.26],[[7751.56,17415.8,0],154.727],[[6836.17,16618.5,0],227.738],[[9173.1,16410.4,0],192.118],[[9087.54,16583.3,0],311.08],[[9327.74,16255.2,0],241.566],[[9370.54,17231.1,0],129.391],[[9784.88,17245.2,0],243.467],[[10333.1,17257.6,0],90.7434],[[10818.9,18925.7,0],142.84],[[10387.1,18653.5,0],168.499],[[10775,17992.5,0],26.0135],[[11972.5,17783.1,0],1.28971],[[12116,17828.1,0],273.469],[[12185,17607.1,0],92.4049],[[12177.8,18790.2,0],115.055],[[11693.5,19947.3,0],177.648],[[12302.4,19558.6,0],112.041],[[12403.8,19267.9,0],82.7397],[[12712.3,19339,0],275.068],[[13496.3,19111,0],312.395],[[13519.7,19202.5,0],207.923],[[13036.3,19351.9,0],74.222],[[13868.4,18352.9,0],261.903],[[14393.9,18012.9,0],85.6207],[[14877.1,18385.5,0],208.076],[[12750,17181.3,0],94.515],[[12650.2,17348,0],359.146],[[13133.2,16879.7,0],188.106],[[13111.7,15898.6,0],78.0282],[[11825.8,16811,0],116.731],[[11991.1,16665.7,0],288.699],[[14550.7,15882.6,0],117.113],[[14674.4,16029.8,0],33.5718],[[14852,16149.4,0],179.398],[[14773.6,15612.9,0],27.7305],[[14262.6,14714.4,0],82.4773],[[14399.4,15353,0],93.6175],[[8963.71,7154.33,0],27.3515],[[9722.8,9259.8,0],186.761],[[9419.06,11423.6,0],279.486],[[8854.88,12611.7,0],148.487],[[12422.4,10665.9,0],43.2743],[[12689.7,10566.2,0],172.229],[[12596.4,9938.89,0],319.985],[[12539.8,9584.76,0],277.552],[[12720.5,9138.2,0],207.749],[[12581.8,8597.26,0],313.226],[[12877.6,8489.02,0],211.191],[[13051.1,8093.93,0],299.859],[[11353.4,6288.59,0],31.8421],[[11502.2,6427.48,0],195.281],[[11472.4,6602.05,0],51.532],[[11526.7,14586,0],292.072],[[11301.7,14906.2,0],179.551],[[11872.2,14251.6,0],90.5817],[[12009.9,14383.8,0],357.896],[[11819.7,13394.4,0],343.026],[[17179.8,9592.4,0],249.154],[[17529,9438.44,0],141.323],[[17865.1,9381.88,0],99.949],[[18245.2,8870.74,0],270.38],[[17032.6,7103.19,0],87.6754],[[16044,7131.71,0],1.77304],[[15630.8,6903.01,0],336.453],[[15926.1,6795.44,0],88.7065],[[16326.6,6496.31,0],180.638],[[16603.1,6178.14,0],111.625],[[16912.4,6078.79,0],290.824],[[17131.4,5597.94,0],88.6323],[[18283.9,4240.4,0],87.6836],[[18623.7,4063.38,0],1.41203],[[16022.9,3719.79,0],19.2608],[[16126.8,3663.14,0],136.673],[[13820.7,1295.05,0],89.0926],[[15711,2331.73,0],55.4139],[[15650.2,2796.4,0],101.237],[[14515,2502.97,0],49.6979],[[11955,3870.11,0],273.626],[[10319.2,4635.98,0],12.2792],[[14689.7,13053.9,0],60.9453],[[14322.7,13068.1,0],174.861],[[14102.6,12897.4,0],71.2087],[[12847.6,13287.1,0],340.401],[[12895,13302.3,0],75.3749], //ground
																		[[1442.39,19143.9,0],269.271],[[2223.28,17778,0],263.244],[[2530.54,17231,0],287.976],[[3253.25,16525.7,0],101.98],[[1984.18,15584.4,0],22.2873],[[1193.19,15180.8,0],158.993],[[4959.27,15173.5,0],142.436],[[5794.85,15008.6,0],272.316],[[6654.72,14190.2,0],333.328],[[6489.89,12962,0],165.92],[[7207.22,11819.5,0],0],[[7697.31,11264.3,0],341.964],[[8809.5,10703.7,0],346.803],[[10692.6,13333.9,0],263.241],[[13191.4,13987.7,0],157.349],[[13045.9,14202.8,0],324.143],[[13781.4,13503.5,0],114.501],[[14399.8,13301.2,0],94.1859],[[14880.5,13345.7,0],42.3817],[[16067.7,13522.9,0],128.897],[[14879,15930.2,0],140.123],[[14863.2,15770,0],154.214],[[13173.4,18982,0],117.153],[[15803.5,18574.8,0],253.439],[[15931,18012.6,0],77.1633],[[16485,16193,0],330.959],[[17050.1,15646.9,0],222.841],[[19554,17553,0],204.787],[[18025.9,15520,0],292.451],[[19156.7,13619,0],0],[[19083.1,13552.7,0],60.9625],[[14979.9,14523.6,0],60.2907],[[18175.3,12262.9,0],140.222],[[19771.7,12859.8,0],230.308],[[20094.9,9847.76,0],291.054],[[19270.8,7940.77,0],144.104],[[19783.9,7273.37,0],354.317],[[19885,7179.8,0],291.812],[[18216.2,6450.72,0],63.4549],[[18072.4,5977.77,0],136.379],[[18504.3,4303.23,0],224.702],[[18605.6,5357.41,0],134.451],[[16929.8,2898.92,0],121.796],[[17102.5,9363.16,0],229.219],[[16726.6,9231.7,0],253.225],[[17517.6,9597.15,0],43.4964],[[17356.5,10510.8,0],6.14689],[[17412.6,9880.3,0],331.965],[[18157.6,10629.9,0],202.069],[[16953.3,12143.2,0],77.7946],[[15921.1,8128.96,0],358.096],[[16072.3,8819.42,0],240.056],[[15288,7762.63,0],164.956],[[15473,6567.49,0],116.709],[[15303.5,6310.32,0],296.439],[[15021.5,5609.75,0],291.965],[[14828.2,5527.5,0],208.959],[[13917.9,4592.37,0],201.242],[[13611.3,4702.46,0],59.5489],[[15646.7,2744.92,0],287.463],[[15684.3,2385.52,0],16.2199],[[14585.1,2631.13,0],331.244],[[11903,13774.9,0],120.657],[[11985.3,17627.9,0],11.8876],[[11565.8,6404.83,0],13.0785],[[11888.1,6508.96,0],129.827],[[12031.1,5880.94,0],90.4007],[[10349.9,7394.98,0],68.4921],[[9229.54,7229.83,0],72.1328],[[9001.58,7276.52,0],140.355],[[9117.19,9173.74,0],136.15],[[17715.4,7290.86,0],138.593],[[8281.28,9988.56,0],215.92],[[7334.8,9261.49,0],188.829],[[7187.73,9103.06,0],83.831],[[6997.31,7760.92,0],127.96],[[7446.63,6982.66,0],352.553],[[8164.34,6113.02,0],295.574],[[7138.46,4026.86,0],11.2485],[[7149.5,4316.35,0],157.998],[[6464.21,4736.3,0],320.49],[[6526.26,5511.21,0],203.607],[[7600.82,5680.28,0],302.876],[[7655.59,6203.59,0],287.835],[[9037.83,5796.16,0],149.068],[[8295.83,4725.81,0],87.9235],[[5162.14,6834.29,0],227.989],[[3341.57,7600.54,0],264.125],[[4068.79,9278.05,0],238.705],[[4051,7740.36,0],95.7509],[[2812.15,8545.69,0],167.436],[[2952.62,8644.18,0],328.146],[[1586.81,9210.34,0],47.7167],[[1700.32,9455.65,0],196.089],[[2895.92,9252.07,0],215.189],[[1763.72,8531.94,0],54.2647],[[2338.67,7750.47,0],205.762],[[11912.6,3505.76,0],0],[[11678,3306.98,0],225.169],[[11334.7,3482.62,0],98.7137],[[12530.3,3012.99,0],276.949],[[13248.1,2460.14,0],138.861],[[14018.6,1160.45,0],154.237],[[2473.28,4395.16,0],57.9007],[[2455.65,4494.86,0],175.313],[[2423.87,2820.43,0],236.87],[[2732.79,2588.09,0],309.294],[[3326.17,4074.55,0],138.546] //sea
																	];
										WMS_TargetConvoyVHL 		= [ //[[logistic],[escort],[SEA_logistic],[SEA_escort]]
																	[
																		"vn_b_wheeled_m54_ammo_airport","vn_o_wheeled_z157_fuel_kr","vn_o_wheeled_z157_repair_kr","vn_o_wheeled_z157_02_kr","vn_o_armor_btr50pk_01_nva65","vn_o_armor_btr50pk_03_nva65",
																		"vn_o_armor_m577_02","vn_o_armor_m577_01","vn_o_wheeled_z157_03_nva65","vn_o_wheeled_z157_01_nva65","vn_o_wheeled_z157_ammo_nvam","rhs_gaz66_ammo_vv",
																		"rhs_gaz66_r142_vv","rhs_gaz66_ap2_vv","rhs_kamaz5350_ammo_vv","RHS_Ural_Repair_VV_01","rhs_zil131_flatbed_cover_vv",
																		"rhs_9k79_K","O_Radar_System_02_F","O_SAM_System_04_F","vn_sa2","vn_o_static_rsna75","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2"
																	],[
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_m113_acav_06_kr","vn_o_wheeled_btr40_mg_06_pl","vn_o_wheeled_btr40_mg_03_pl","vn_o_wheeled_z157_mg_02_pl","vn_o_armor_btr50pk_02_nva65","vn_o_armor_m125_01",
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_pt76b_01_nva65","vn_o_armor_t54b_01_nva65","vn_o_armor_type63_01_nva65","vn_o_armor_m41_01","rhsgref_tla_btr60","rhsgref_tla_offroad_armed",
																		"rhs_btr80a_vv","rhs_tigr_sts_3camo_vv","rhs_bmp2k_vv","rhs_bmp1d_vv","rhs_zsu234_aa","rhs_2s1_at_tv",
																		"RHS_M6_wd","rhs_2s3_at_tv","rhs_t72ba_tv","rhs_t80","rhs_bmp3_msv","rhsgref_BRDM2_msv"		
																	],[
																		"vn_o_boat_08_01_kr","vn_o_boat_08_02_kr","rhsgref_hidf_rhib","vn_b_boat_06_01","B_Boat_Armed_01_minigun_F","B_SDV_01_F","rhsusf_mkvsoc","vn_o_boat_04_01"		
																	],[
																		"O_Boat_Armed_01_hmg_F","vn_o_boat_03_01","vn_o_boat_04_01","vn_b_boat_12_03","vn_b_boat_13_03","vn_b_boat_10_01"				
																	]
																	];
										//NEW CONVOY EVENT\\
										WMS_AMS_MissionList 	= 	[ //missions themself and weight
																	["MissionTest1",0],
																	["MissionTest2",0],
																	["ForestCamp",3], //"forest" positions
																	["HomeDepot",2],
																	["CombatPatrol",3],
																	["EnyBunkers",2], //AP mines
																	["Arbeit",1],
																	["ArmedBandits",2],
																	["C192Crash",2],
																	["AmazonWH",2],
																	["TransmissionTower",2],
																	["GunsX3",2], //"utility" truck reward, NPC armored
																	["Arena",0], //this one is pretty hardcore on the objects and NPCs xD
																	["LightArmoredSteal",2], //Light Armored Reward
																	["HeliSteal",2], //helicopter reward
																	["AABattery",2], //no move crate
																	["Escobar",2],
																	["Forgotten",2],
																	["Radar",2], //big crate reward
																	["Construction",2], //truck reward
																	["OldTemple",2],  //no move crate
																	["JunkYard",2], //truck reward
																	["OldPowerPlant",2], //vehicle reward, armed/armored NPC
																	["Market",2], //small truck reward
																	["GrandPaJoe",2],
																	["LumberYard",3], //"forest" positions
																	["Factory",4], //"factory" positions
																	["FieldHospital",2],
																	["Object172M",1], //Armored Reward and NPCs
																	["uncleabrams",1], //Armored Reward and NPCs
																	["thecommunity",2],
																	["shipyard",2], //small vehicle reward
																	["occupation",3], //location/cities positions
																	["commsrelay",2], //"comms" vehicle reward
																	["strelnikovtrain",2],
																	["bastogne",3], //"forest" positions
																	["blackhawk",2],
																	//STATICS MISSIONS, MUST HAVE POSITIONS!!!
																	["VC Arty",10],
																	["VC Patrol",5],
																	//OUTPOSTS
																	["OutpostAlpha",1],
																	["OutpostBravo",1],
																	["OutpostCharlie",1],
																	["OutpostDelta",1], //+V2
																	["OutpostEcho",1],
																	["OutpostFoxtrot",1],
																	["OutpostGolf",1] //+V2
																	];
										WMS_AMS_StaticPos_1			= []; //VC //patrol
										WMS_AMS_StaticPos_2			= []; //PATHET //patrol, garrison positions
										WMS_AMS_StaticPos_3			= []; //PAVN  //patrol, garrison positions //ARTY 1
										WMS_AMS_StaticPos_4			= []; //KHMER //patrol, garrison positions //ARTY 2
										execVM "\InfantryProgram\Scripts\AMS_StaticMissionsOBJ_Cam_Lao_Nam.sqf";
																	//////////bottom of this function
																	/*if (WMS_AMS_CleanMapObj && WMS_AMS_ForceRadius && WMS_AMS_CanSelect)then {
																		if (true) then {diag_log format ["[WMS_CustomMapsSettings]|WAK|TNA|WMS| Starting pre_selection of AMS Positions at %1", servertime]};
																		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
																		for "_i" from 1 to 20 do
																		{
																			_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), WMS_AMS_DefRad, 0, WMS_AMS_MaxGrad, 0, WMS_AMS_preSelectPos+_blackList, [([] call BIS_fnc_randomPos),[]],100] call WMS_fnc_BIS_findSafePosModified;
																			if ((count _pos) == 2) then {WMS_AMS_preSelectPos pushBack _pos};
																		};
																		WMS_AMS_CanSelect = false;
																		if (true) then {diag_log format ["[WMS_CustomMapsSettings]|WAK|TNA|WMS| Pre_selection of AMS Positions DONE at %1, %2 positions", servertime, count WMS_AMS_preSelectPos]};
																	};*/
};
if (worldName == "lingor3") then {
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_AI_MaxUnits_A 			= 130; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 150; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 170; //stop Base attack and missions
										WMS_AL_VhlBalance			= [1,2,0,1,1,0,1,2]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AL_UnitMax				= 10; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 100;
										WMS_C130_Altitude 			= 150;
										WMS_Pos_Forests 			= [[2227.16,4405.92,0],[1482.49,2501.01,0],[916.32,4070.2,0],[5627.07,1575.15,0],[6178.56,2036.9,0],[9264.04,1895.63,0],[9595.54,3150.29,0],[9838.21,3968.9,0],[8820.17,4086.9,0],
																	[8281.14,4226.69,0],[5248.83,3945.87,0],[5294.63,5235.12,0],[5484.81,5942.43,0],[4789.01,5987.61,0],[5164.92,6347.26,0],[3726.11,7971.07,0],[3236.75,7803.36,0],[3604.34,7529.95,0],[2805.95,7666.8,0],
																	[2370.93,7784.23,0],[3054.14,8458.73,0],[1881.11,9550.79,0],[1394.39,9592.21,0],[603.133,9696.28,0],[808.965,9037.32,0],[1710.9,5907.02,0],[6924.44,5524.93,0],[8960.24,8308.45,0]]; //not autoScan
										WMS_Pos_Military 			= [
																	[6122.35,9533.76,0],[2337.07,6249.89,0],[3709.98,4182.6,0],[8366.83,3058.35,0],[646.191,1023.03,0], //added stuff around spawns
																	[3382.33,8270.18,0],[457.751,9103.92,0],[1151.75,8060.98,0],[2583.19,4980.15,0],[5394.52,5385.79,0],[8488,7594.77,0],[5906.04,3758.45,0],[9083.87,4127.11,0],[8429.59,1939.7,0],[6203.61,2362.88,0],[2342.59,1855.73,0], //CKP
																	[2442.05,7738.71,0],[3398.24,7397.77,0],[8623.15,3852.99],[8244.64,4591.1],[9998.9,3899.49], //added bunkers
																	[516.058,10002.3,0],[717.364,9993.99,0] //big north/west military
																	]; //not autoScan
										WMS_Pos_Factory 			= [[1382.73,626.765,0],[3972.9,1136.55,0],[3899.84,1179.3,0],[4083.98,1118.85,0],[3866.08,1422.5,0],[3305.68,1248.69,0],[4146.81,2432.42,0],[6772.29,2532.46,0],[6801.13,2498.18,0],[6768.35,2772.11,0],[7663.98,1653.1,0],
																	[7679.76,1691.25,0],[9184.58,2273.93,0],[9211.66,2169.23,0],[9294.96,3843.68,0],[8859.01,3887.31,0],[8901.64,4327.08,0],[3981.85,9386.32,0],[4079.07,9295.92,0],[3065.94,8052.13,0],
																	[398.602,8504.34,0],[439.209,8608.04,0],[685.014,7245.11,0],[1028.79,6104.69,0],[880.839,5886.39,0],[2721.59,5446.46,0],[6854.97,4501.1,0],[5790.77,4713.38,0],[5739.25,4808.89,0],
																	[3526.32,3750.1,0],[845.979,3188.99,0],[4080.7,4359.48,0]];
										WMS_DynAI_GunshipMedium 	= ["rhs_uh1h_hidf",["hidf_tan",1],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",["hidf_tan",1],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 3; //with all the reinforcement and vehicles crew, 3 missions it's a lot
										WMS_AMS_CustomPos			= ["forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										//WMS_AI_HMG_Scope 			= "O_HMG_01_high_F";
										//WMS_AI_HMG_Shield			= "B_G_HMG_02_high_F";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_Arty					= "rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["rhsusf_mine_M19","ATMine"];
										WMS_ATMines					= ["rhs_mine_TM43","ATMine"]; //"ATMine";"BWA3_DM31AT";
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_AI_RoamingVHLcount 		= 12; //10
										WMS_AI_CargoUnits	 		= 2;
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_FastNight_Morning 		= 6; //morning start at
										WMS_FastNight_Evening		= 17.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 60;
										WMS_trig_Glob_CoolD 		= 240;
										WMS_Forests_CoolD			= 300;
										WMS_Military_CoolD			= 240;
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
																	
										//NEW CONVOY EVENT
										WMS_TargetConvoy 			= true;
										WMS_TargetConvoyPos 		= [ //[[pos,dir],[pos,dir],[pos,dir],[pos,dir],...]
																		[[617.068,10032.2,0],132.455],[[540.259,9948.74,0],273.318],[[254.774,9799.53,0],141.377],[[703.835,9853.39,0],132.455],[[147.279,9281.4,0],134.494],[[363.276,9065.78,0],304.763],[[187.964,8600.68,0],3.37617],[[463.553,8574.77,0],206.216],[[472.003,8924.45,0],224.161],[[820.612,9071.3,0],99.0018],[[1045.46,9070.36,0],218.909],[[813.84,8257.48,0],129.928],[[834.488,8200.9,0],36.4827],[[1066.59,7775.58,0],87.9508],[[1380.98,7652.29,0],276.391],[[1383.54,7534.76,0],104.915],[[1305.95,7396.08,0],177.773],[[1245.48,7315.66,0],267.902],[[712.489,7246.54,0],59.7713],[[832.218,7206.6,0],299.184],[[2064.3,8627.4,0],54.663],[[1963.87,8735.29,0],136.161],[[1478.33,9270.84,0],129.761],[[1390.06,9333.85,0],308.523],[[2867.34,9907.12,0],292.262],[[3019.15,9918.47,0],102.266],[[2522.91,10036.8,0],204.626],[[2483.06,10067.6,0],346.546],[[3213.89,9307.49,0],89.1153],[[3365.72,9292.82,0],259.612],[[3146.43,9367.55,0],358.943],[[4034.55,9245,0],352.712],[[3979.82,9354.08,0],172.825],[[3984.33,9203.45,0],270.332],[[3055.92,8042.94,0],279.858],[[3065,8116.9,0],100.386],[[3115.62,8039.33,0],0.0111901],[[4702.8,8284.76,0],126.394],[[4657.72,8375.1,0],37.2963],[[4199.26,7574.39,0],356.728],[[4259.95,7450.27,0],62.5172],[[4340.42,7689.29,0],268.047],[[8523.76,7928.34,0],111.223],[[8425.99,7904.23,0],317.901],[[8162.95,7218.35,0],179.648],[[8215.51,7244.31,0],359.35],[[8991.77,5884.24,0],281.398],[[9086.63,5885.99,0],358.204],[[2936.86,6485.32,0],176.619],[[2987.73,6523.83,0],355.254],[[3198.32,5855.15,0],179.716],[[3072.16,5838.54,0],270.24],[[3296.18,6123.61,0],269.994],[[395.517,5970.15,0],141.059],[[204.24,5709.26,0],357.695],[[405.539,6104.91,0],262.036],[[896.292,5881.15,0],29.1441],[[952.422,5984.9,0],218.87],[[883.604,5619.23,0],348.745],[[858.757,5563.74,0],79.4047],[[970.936,5294.48,0],269.49],[[582.816,5287.69,0],10.6417],[[617.05,4686.05,0],11.8541],[[1918.86,4354.18,0],179.722],[[1980.9,4566.16,0],90.3135],[[4396.42,5087.89,0],108.586],[[4359.88,5088.49,0],20.195],[[4328.82,5515.28,0],120.527],[[4390.31,4986.95,0],107.836],[[2585.38,3798.34,0],266.032],[[2964.46,3791.35,0],164.462],[[2891.34,3643.1,0],73.2676],[[3345.54,3581.74,0],132.455],[[3546.58,3793.58,0],357.181],[[3272.96,3833.57,0],242.985],[[6473.71,4250.62,0],10.4196],[[6598.65,4278.16,0],99.6308],[[6011.77,4761.39,0],359.929],[[5961.71,4771.78,0],89.3418],[[5795.25,4477.04,0],211.921],[[5762.79,4495.02,0],0.358231],[[4860.85,6567.57,0],14.4136],[[4830.39,6714.98,0],146.414],[[2583.13,7640.41,0],2.71973],[[2626.55,7629.79,0],91.3114],[[6121.86,5790.72,0],358.288],[[6041.45,5700.55,0],198.943],[[5180.48,5551.82,0],187.412],[[5039.67,5555.84,0],302.067],[[7167.1,5820,0],206.436],[[7065.93,5683.68,0],295.266],[[6968.46,5979.5,0],88.3237],[[9120.12,5197.29,0],179.385],[[9223.98,5101.76,0],88.5494],[[9331.71,3763.32,0],282.524],[[9174.52,3912.01,0],359.685],[[7529.06,2907.69,0],286.835],[[7408.81,2979.35,0],110.296],[[6756.95,3392.04,0],89.3929],[[6692.39,3425.45,0],179.371],[[8360.08,759.493,0],351.098],[[8327.45,760.17,0],75.7741],[[6762.78,1635.14,0],329.043],[[6792.03,1742.19,0],81.0142],[[6827.18,2142.5,0],60.6176],[[6711.88,2131.63,0],291.085],[[7641.59,1624.08,0],160.586],[[7353.53,1950.17,0],71.7318],[[9689.27,1307.23,0],292.547],[[2654.61,2446.45,0],350.573],[[2163.71,2303.54,0],177.096],[[522.108,3524.29,0],163.309],[[615.432,3502.87,0],257.363],[[1727.5,488.565,0],353.6],[[1778.71,571.403,0],213.581],[[1790.02,753.852,0],216.152],[[917.96,2518.17,0],303.604],[[891.024,2606.64,0],180.852],
																		[[9754.1,1127.11,0],263.645],[[9823.76,1395.01,0],125.793],[[9437.97,1389.18,0],223.31],[[8369.9,961.641,0],228.813],[[8564.05,848.814,0],77.9281],[[6589.21,1617.96,0],196.393],[[6954.75,2378.12,0],89.5259],[[6874.92,2490.11,0],0.325783],[[6817.31,2755.7,0],180.951],[[6664.25,2692.63,0],273.596],[[7235.07,2974.05,0],180.656],[[6795.54,3504.73,0],31.7946],[[9102.71,5266.58,0],263.645],[[9472.79,5068.25,0],170.679],[[8045.41,7210.64,0],308.445],[[8186.19,7111.58,0],96.0628],[[8308.79,7948.33,0],166.97],[[8389.11,7764.65,0],294.605],[[4767.31,8352.76,0],131.531],[[4558.22,8439.97,0],225.12],[[4915.93,8684.69,0],305.424],[[4136.31,9127.25,0],253.708],[[4142.83,9319.71,0],157.253],[[3862.31,9080.93,0],35.2771],[[3227.38,9227.9,0],268.145],[[3061.72,9445.67,0],344.91],[[3160.67,10010.9,0],127.48],[[3408.64,9799.23,0],56.9119],[[2361.09,10025.7,0],174.511],[[2427.57,10193.8,0],263.645],[[1370.02,9250.46,0],125.662],[[1505.13,9081.06,0],11.0788],[[8756.45,3680.65,0],248.572],[[9413.7,3638.59,0],17.5775],[[6545.04,1313.96,0],3.76285],[[1674.67,377.241,0],89.9664],[[1896.99,512.559,0],208.571],[[1781.26,875.935,0],44.536],[[2562.81,2348.87,0],184.6],[[2801.35,2353.34,0],104.551],[[2542.92,2516.41,0],263.645],[[2037.05,2381.88,0],112.722],[[2008.76,2080.19,0],237.16],[[1004.71,2575.43,0],333.974],[[816.863,2496.18,0],129.57],[[555.436,3404.44,0],98.229],[[658.556,3625.29,0],299.688],[[1750.49,4648.14,0],244.922],[[1495.95,4514.52,0],30.8702],[[1074.75,5308.42,0],144.587],[[1182.94,4932.98,0],192.763],[[811.726,4787.07,0],130.3],[[430.618,4757.94,0],314.939],[[464.028,5159.22,0],281.81],[[252.348,5451.37,0],99.7944],[[127.376,5744.73,0],213.337],[[282.785,5986.42,0],348.295],[[394.989,6273.38,0],282.284],[[968.927,6967.69,0],119.698],[[1220.62,7222.35,0],212.534],[[1239.22,6957.01,0],347.63],[[542.034,7687.58,0],20.0579],[[357.921,7137.37,0],356.61],[[719.06,7927.18,0],95.905],[[1126.89,7885.12,0],67.0917],[[799.181,8355.16,0],33.5456],[[1723.41,7615.85,0],2.09021],[[2919.35,8077.45,0],193.898],[[2820.63,8039.79,0],300.728],[[2753.32,8663.64,0],270.639],[[2058.45,8479.71,0],212.994],[[1897.92,8270.27,0],72.2429],[[570.08,8728.46,0],150.237],[[1128.72,8989.32,0],354.818],[[124.818,8476.2,0],118.612],[[215.877,9068.39,0],216.563],[[447.588,9475.94,0],303.646],[[536.46,9344.77,0],256.027],[[354.363,9671.77,0],189.33],[[154.089,9908.52,0],170.848],[[686.623,10168.4,0],96.2975],[[959.937,9450.24,0],150.241],[[6700.16,4079.54,0],170.609],[[6466.5,4164.11,0],294.05],[[6123.94,4766.21,0],358.608],[[5988.03,4912.57,0],284.553],[[5584.36,4848.86,0],3.9219],[[4399.83,5208.55,0],293.991],[[4508.74,5143.2,0],72.8346],[[3920.94,5259.55,0],42.7276],[[3421.62,5294.27,0],79.4193],[[3127.44,5723.43,0],278.798],[[3269.68,5849.61,0],357.364],[[2781.59,5567.53,0],298.194],[[3680.76,5898.27,0],197.431],[[7179.43,5920.76,0],314.385],[[7280.83,5725.35,0],182.265],[[6930.39,9677.97,0],81.8083],[[9819.1,10115.7,0],263.645],[[9312.25,6031.22,0],318.808]
																	];
										WMS_TargetConvoyVHL 		= [ //[[logistic],[escort],[SEA_logistic],[SEA_escort]]
																	[
																		"rhs_gaz66_ammo_vv","rhs_gaz66_r142_vv","rhs_gaz66_ap2_vv","rhs_kamaz5350_ammo_vv","RHS_Ural_Repair_VV_01","rhs_zil131_flatbed_cover_vv",
																		"rhs_9k79_K","O_Radar_System_02_F","O_SAM_System_04_F","O_SAM_System_04_F","O_SAM_System_04_F","O_SAM_System_04_F","O_SAM_System_04_F","O_SAM_System_04_F"
																	],[
																		"RHS_M6_wd","rhs_zsu234_aa","RHS_M6_wd","rhs_zsu234_aa","rhsgref_tla_btr60","rhsgref_tla_offroad_armed",
																		"rhs_btr80a_vv","rhs_tigr_sts_3camo_vv","rhs_bmp2k_vv","rhs_bmp1d_vv","rhs_zsu234_aa","rhs_2s1_at_tv",
																		"RHS_M6_wd","rhs_2s3_at_tv","rhs_t72ba_tv","rhs_t80","rhs_bmp3_msv","rhsgref_BRDM2_msv"		
																	],[
																		"rhsgref_hidf_rhib","B_Boat_Armed_01_minigun_F","B_SDV_01_F","rhsusf_mkvsoc"		
																	],[
																		"O_Boat_Armed_01_hmg_F","rhsusf_mkvsoc","B_Boat_Armed_01_minigun_F"	
																	]
																	];
										//NEW CONVOY EVENT\\
};
if (worldName == "tem_cham") then {	//same as ruha, mostly but CHAM use Global Mobilization assets
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_CHAM_gm.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_CHAM_gm.sqf";
										WMS_AI_MaxUnits_A 			= 140; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 160; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 180; //stop Base attack and missions
										WMS_AI_Units_Class 			= [ //KEEP OPFOR UNITS ONLY!!!
																		"gm_gc_army_sf_squadleader_mpikms72_80_str","gm_gc_army_sf_machinegunner_lmgrpk_80_str","gm_gc_army_sf_marksman_svd_80_str","gm_gc_army_sf_antitank_mpikms72_rpg7_80_str",
																		"gm_gc_army_sf_demolition_pm63_80_str","gm_gc_army_sf_antitank_mpikms72_rpg18_80_str","gm_gc_army_squadleader_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str",
																		"gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_machinegunner_lmgrpk74_80_str","gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str","gm_gc_army_antitank_mpiak74n_rpg7_80_str",
																		"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_gc_army_rifleman_mpiak74n_80_str","gm_pl_army_sf_squadleader_akmn_80_moro",
																		"gm_pl_army_sf_machinegunner_rpk_80_moro","gm_pl_army_sf_marksman_svd_80_moro","gm_pl_army_sf_antitank_akmn_fagot_80_moro","gm_pl_army_sf_demolition_pm63_80_moro",
																		"gm_pl_army_sf_grenadier_akm_pallad_80_moro"
																	];
										WMS_Loadout_LocalOPFOR 		= [ //this is a new NPC loadout using equipement specific from the map or main mod like german army for GM, VC for SOG, etc...
						   												// this loadout will be changed in customMapSettings
	 																	["rhsgref_uniform_flecktarn_full","rhsgref_uniform_gorka_1_f","rhs_uniform_afghanka_moldovan_ttsko_desat","rhs_uniform_mvd_izlom","gm_xx_army_uniform_fighter_04_grn","gm_ge_army_uniform_crew_90_flk"],
																		["gm_ge_vest_armor_90_rifleman_flk","gm_dk_army_vest_54_rifleman","V_CarrierRigKBT_01_light_Olive_F","gm_ge_vest_armor_90_leader_flk","V_PlateCarrier1_rgr_noflag_F","rhs_6b13_6sh92_vog","rhs_lifchik_vog","gm_ge_vest_armor_90_machinegunner_flk"],
																		["gm_xx_headgear_headwrap_crew_01_flk","rhsgref_helmet_m1940","rhsgref_helmet_pasgt_flecktarn","gm_ge_headgear_hat_90_flk","gm_ge_headgear_hat_boonie_flk","gm_ge_bgs_headgear_m35_53_net_blk"],
																		["B_AssaultPack_rgr","rhs_sidor","gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_flk","gm_pl_army_backpack_80_oli","gm_ge_backpack_satchel_80_blk"],
																		["G_Balaclava_Flames1","G_Balaclava_Flecktarn","G_Balaclava_Scarecrow_01","G_Balaclava_Skull1","G_Balaclava_Tropentarn","G_Balaclava_BlueStrips"]//_googles/_facewear
																	];
										WMS_AMS_UnitClass 			= WMS_AI_Units_Class;
										WMS_AL_VHLmax				= 14; //Max vehicles (all included) running at the same time
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AL_UnitMax				= 10; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AL_Vehicles				= [[ //[[AIR],[GROUND],[SEA]]
																		"gm_gc_civ_mi2p","gm_ge_adak_bo105m_vbh","RHS_Mi8t_civilian",
																		"C_Heli_Light_01_civil_F","C_IDAP_Heli_Transport_02_F","C_Heli_light_01_digital_F","C_Heli_light_01_shadow_F"
																	],[
																		"gm_gc_ff_p601","gm_gc_dp_p601","gm_gc_civ_ural375d_cargo","gm_ge_ff_typ1200","gm_ge_pol_typ1200","gm_ge_dbp_typ1200","gm_ge_dbp_typ247","gm_ge_dbp_typ251","gm_ge_ff_u1300l_medic","gm_ge_civ_w123","gm_ge_taxi_w123",
																		"RHS_Ural_Open_Civ_01","rhsgref_un_zil131_flatbed",
																		"C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_01_F","C_Offroad_01_comms_F","C_Offroad_01_repair_F","C_Quadbike_01_F","C_SUV_01_F","C_Tractor_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_medevac_F","C_Van_02_transport_F"
																	],[
																		"C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Rubberboat","C_Boat_Transport_02_F","C_Scooter_Transport_01_F"
																	]];
										WMS_AI_LaunchersOPF 		= [["gm_m72a3_oli","gm_pzf44_2_oli","rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["gm_ge_airforce_do28d2_medevac","gm_ge_airforce_do28d2_medevac","gm_ge_airforce_do28d2_medevac"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["gm_handgrenade_frag_dm51","gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_rgd5","gm_handgrenade_conc_dm51","gm_handgrenade_conc_dm51a1", //GM Grenades
																		"HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "gm_pl_army_spg9_tripod"; //roadBlock "rhs_D30_at_msv"
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 100;
										WMS_C130_Altitude 			= 200;
										WMS_Pos_Forests 			= [[2563.04,4390.98,0],[949.503,7824.58,0],[2995.88,7414.85,0],[1661.87,6304.73,0],[1230.78,5241.38,0],[2811.94,6394.72,0],[3305.54,5669.11,0],[631.694,4170.68,0],[1578.91,2556.35,0],[1009.62,1675.81,0],[318.523,2069.07,0],[1618.5,4135.01,0],[4458.61,3629.26,0],[3653.57,3250.63,0],[4495.37,3015.37,0],[5318.42,2606.16,0],[4986.43,1588.48,0],[6569.98,1032.91,0],[7431.99,345.098,0],[6687.02,401.608,0],[7258.67,2287.12,0],[6829.09,2776.96,0],[6640.04,3507.89,0],[7446.81,4005.25,0],[4426.52,1101.23,0],[5382.9,280.85,0],[1314.61,255.088,0],[3977.97,5007.08,0],[4864.12,4479.73,0],[7361.6,5669.74,0],[6442.06,6489.51,0],[7084,6304.44,0],[4259.87,6804.69,0],[5382.4,7641.75,0],[4841.03,7911.3,0],[6021.57,7851.02,0],[6184.2,7272.12,0],[7989.44,7023.54,0]]; //not autoScan
										WMS_Forests_Size			= 300; //default 250 (radius, so *2)
										WMS_Pos_Military 			= [ [7411.86,6306.18,0],[7121.58,6022.76,0],[7451.38,5795.97,0],[7676.09,5462.71,0],//Map bunkers
																		[362.079,5441.36,0],[1349.27,1084.6,0],[4859.76,3573.69,0],[3333.45,5932.5,0],[7078.14,6637.09,0],[1571.48,4120.26,0],//bunkers
																		[5367,1443.28,0], [4117.64,1962.58,0],[2884.5,3194.29,0],[876.708,3389.88,0],[4277.99,6104.97,0],[5622.11,3243.03,0],[7103.62,5074.65,0],[2382.33,7779.38,0],[4238.18,7444.24,0],[7914.81,3180.36,0] //Checkpoints
																		]; //not autoScan
										WMS_Pos_Factory 			= [[1125.31,6656.69,0],[1030.44,6662.45,0],[1317.48,5876.93,0],[3931.22,6624.68,0],[4389.1,6448.52,0],[4369.63,6423.77,0],[4971.58,6280.5,0],[5389.89,5946.36,0],[5373.64,6012.78,0],[6945.93,6926.75,0],[6646.49,5305.46,0],[6849.68,5043.55,0],[6487.59,4535.72,0],[6537.62,4484.03,0],[6504.47,4445.54,0],[6392.96,4383.17,0],[5573.68,3422.64,0],[2782.75,3682.63,0],[2517.81,5063.9,0],[687.87,3766.21,0],[407.94,3282.14,0],[368.211,3277.28,0],[3736.67,2586.31,0],[3775.98,2520.07,0],[3732.99,2515.08,0],[3189.08,1669.59,0],[3167.94,1722.25,0],[3279.67,1662.18,0],[5927.81,2628.4,0],[5846.01,1384.45,0],[5794.28,1440.58,0],[7236.2,1376.31,0],[6551.66,758.107,0],[6498.1,760.159,0],[1613.77,728.007,0]]; //need room for small camoNet
										WMS_DynAI_GunshipMedium 	= ["rhs_uh1h_hidf",["hidf_tan",1],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",["hidf_tan",1],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 3; //with all the reinforcement and vehicles crew, 3 missions it's a lot
										WMS_AMS_CustomPos			= ["forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										WMS_AI_Arty					= "rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["rhsusf_mine_M19","ATMine","rhs_mine_TM43","gm_minestatic_at_tm46","gm_minestatic_at_dm21","gm_minestatic_at_mn111"];//"gm_minestatic_at_ptm3"
										WMS_ATMines					= ["ATMine","gm_minestatic_at_dm21","gm_minestatic_at_mn111"]; //"ATMine";"BWA3_DM31AT";
										WMS_RunnerTypes				= ["ClaymoreDirectionalMine_Remote_Ammo_Scripted","SatchelCharge_Remote_Ammo_Scripted","rhs_ammo_3of69m","rhs_ammo_fab500_m54"];//["mine","satchel","shell","bomb"]
										WMS_AMS_SpnDistMission 		= 1550;
										WMS_AI_RoamingVHL_citySpawn	= true; //NEW //now default is true
										WMS_AI_RoamingVHLcount 		= 11; //10
										WMS_AI_CargoUnits	 		= 3;
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_SupplyDropCount 		= 1; //default 2
										WMS_HumaniDropCount 		= 4; //default 3
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 60;
										WMS_trig_Glob_CoolD 		= 240;
										WMS_Forests_CoolD			= 300;
										WMS_Military_CoolD			= 240;
										//Let's make it more challenging on Ruha //FastCombat	
										WMS_FastCombat 				= true;
										WMS_CaptureZone_Lyt			= ["layout1","layout2","layout6","layout4","layout5","layout6"]; //layouts objects are in fn_Event_CaptureZone.sqf //removed the farm layout3
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
if (worldName == "ruha") then {	
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_NIA.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_AI_MaxUnits_A 			= 120; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 140; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 160; //stop Base attack and missions
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AL_UnitMax				= 10; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 100;
										WMS_C130_Altitude 			= 150;
										WMS_Pos_Forests 			= [[6320.07,1751.57,0],[5302.77,1273.65,0],[3806.43,423.051,0],[3323.91,323.613,0],[6481.24,586.263,0],[386.418,1134.46,0],[1832.73,1447.56,0],[4714.71,2229.96,0],[657.673,3101.96,0],[1798.39,3362.77,0],
																	[1532.31,3926.54,0],[873.698,5288.54,0],[1463.81,5083.06,0],[807.836,6044.63,0],[3597.71,7288.08,0],[4114.06,6758.56,0],[6174.19,4118.85,0],[6535.11,3285.61,0],[7615.23,3127.55,0],[7241.14,2508.45,0],[7765.39,653.808,0],
																	[7920.82,4410.52,0],[7883.94,5975.38,0],[7520.39,6302.05,0],[7462.43,7774.7,0],[5036.11,6934.31,0],[4187.82,6157.15,0],[3161.96,4914.27,0],[2436.86,5012.96,0],[1629.43,5616.59,0],[1736.29,7888.2,0],[428.557,7138.67,0],
																	[4599.15,3355.43,0],[4633.86,4878.11,0]]; //not autoScan
										WMS_Pos_Military 			= [[2230.98,1771.36,0],[3972.38,1213.48,0],[7195.73,2091.9,0],[2021.85,4266.97,0],[6340.01,4918.37,0],[5482.62,6291.1,0],[3263.59,6156.12,0],[1828.95,6732.7,0],[6730.52,5713.27,0],[4327.51,4629.13,0],[1419.24,3103.3,0],[2353.7,6427.54,0],[5793.47,2702.06,0]]; //not autoScan
										WMS_Pos_Factory 			= [[1243.48,336.638,0],[1381.3,124.435,0],[2269.47,1047.05,0],[6631.5,1590.15,0],[6730.27,1624.5,0],[5271.05,2230.36,0],[5162.36,2181.81,0],[7682.21,6528.97,0],[7654.32,6516.9,0],[6210.32,6236.47,0],
																	[5532.65,6461.09,0],[5489.07,6501.68,0],[6003.1,7347.64,0],[3457.86,7123.09,0],[3458.51,7077.92,0],[3477.43,1988.16,0],[2345.53,2757.31,0]]; //need room for small camoNet
										WMS_DynAI_GunshipMedium 	= ["rhs_uh1h_hidf",["hidf_tan",1],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",["hidf_tan",1],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 2; //with all the reinforcement and vehicles crew, 3 missions it's a lot
										WMS_AMS_CustomPos			= ["forest","forest","forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										//WMS_AI_HMG_Scope 			= "O_HMG_01_high_F";
										//WMS_AI_HMG_Shield			= "B_G_HMG_02_high_F";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_Arty					= "rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["rhsusf_mine_M19"];
										WMS_ATMines					= ["rhs_mine_TM43"]; //"ATMine";"BWA3_DM31AT";
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_AI_RoamingVHLcount 		= 12; //10
										WMS_AI_CargoUnits	 		= 4;
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_FastNight_Morning 		= 4; //morning start at
										WMS_FastNight_Evening		= 18.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 60;
										WMS_trig_Glob_CoolD 		= 240;
										WMS_Forests_CoolD			= 300;
										WMS_Military_CoolD			= 240;
										//Let's make it more challenging on Ruha //FastCombat	
										WMS_FastCombat 				= true;
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
if (worldName == "Lythium") then {	
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_NIA.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_forceNoRain 			= true;
										WMS_forceNoFog				= true;
										WMS_WaterSource				= "Land_Jbad_Misc_Well_C";
										WMS_AI_MaxUnits_A 			= 150; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 170; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 190; //stop Base attack and missions
										WMS_Pos_Forests 			= [[4016.49,6725.05],[1475.77,4844.81],[6079.54,11874.3],[14641.4,14868.3],[14424.3,16079.4],[11506.7,15314.4],[18644.3,13940.6],[16116.3,19444],[17541.2,19964.2],[14612.3,20065.9],[12605.1,19715.4],[7194.16,19952.9],[8311.11,1501.89],
																	[4740.28,19376.1],[8358.91,19393.1],[9472.76,20065.9],[3952.71,19987.1],[8355.8,4914.06],[17904.5,2572.98],[18995.7,2332.19],[19670.1,841.903],[19708.8,3727.73],[10217.5,9031.39],[7353.69,13156.4]]; //not autoScan
										WMS_Pos_Military 			= [[18425.1,16016.6],[14255.8,2496.32],[11467.3,10938.6],[10753.9,5372.2],[4554.38,10614.5],[15812.3,12616.3],[4709.4,2379.13],[12200.3,17299.2],[11603.2,18649.8],[16111.2,945.549],[13954.2,3425.8],[15115.4,4379.31],[15780.6,5599.83],[13833.8,17900.1],[11540.5,17742.7],[3834.83,17825.5],
																	[4993.25,17503.5],[5307.1,10752.8],[9679.91,11342.3],[10913.9,7573.5],[11866.8,2362.4],[12306.1,2068.87]]; //not autoScan //need enough space to land a chopper //Pyrgos military, south Zaros, south airfield, NE Agios Georgios, NO Frini, E stavros, SO Zeloran,
										WMS_Pos_Factory 			= [[11100.8,3115.68,0],[11959.1,6145.07,0],[11981.9,6170.45,0],[10017.2,1356.97,0],[10045.5,1414.89,0],[15165.4,443.856,0],[15128.4,466.511,0],[16471.1,5964.25,0],[16456.5,6033.17,0],[16922.7,6189.69,0],[16280,6485.06,0],[16347.3,6789.66,0],
																	[16311.6,6774.14,0],[13908.7,17771,0],[13943.6,17749.9,0],[13564,18015.2,0],[13192.8,17562,0],[13089.5,17575.1,0],[11595.2,18309.4,0],[11218.8,16820.1,0],[4140.79,17450.9,0],[4159.53,17490.4,0],[4398.66,13069.4,0],[6054.56,9788.18,0],[9033.56,16173.5,0],
																	[9012.06,16174.9,0],[10333.7,10892.9,0],[10347.2,10854.7,0],[10267.8,10636.9,0]]; //need room for small camoNet
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_IP_Extract_Alt 			= 350;
										WMS_C130_Altitude 			= 350;
										WMS_DynAI_GunshipMedium 	= ["rhs_uh1h_hidf",["hidf_tan",1],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",["hidf_tan",1],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 4;
										WMS_AMS_ReinforceCoolD 		= 45;
										WMS_AMS_CustomPos			= ["forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_SpnDistMission 		= 3500;
										WMS_AI_RoamingVHLcount 		= 17; //10
										WMS_AI_CargoUnits	 		= 2;
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 17.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 25;
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										//DFO
										WMS_DFO_Choppers			= [["vtx_MH60M_DAP","vtx_MH60M_DAP_MLASS"],["vtx_HH60","vtx_MH60M","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
										WMS_DFO_NPCvehicles			= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
																	["RHS_Ka52_vvsc","RHS_Mi24V_vvsc","RHS_Mi8MTV3_vvsc"],
																	["RHS_Mi24Vt_vvsc","RHS_Mi8mt_vvsc"],
																	["rhs_ka60_c","RHS_Mi8T_vvsc"],
																	["rhsgref_ins_zsu234","rhsgref_ins_t72bb","rhsgref_ins_bmp2e","rhsgref_ins_2s1_at","rhs_t80ue1"],//AA first
																	["rhsgref_ins_ural_Zu23","rhsgref_ins_btr70","rhsgref_ins_btr60","rhsgref_BRDM2_ins","rhs_btr80a_msv"],//"AA" first
																	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","O_LSV_02_armed_F","O_G_Offroad_01_armed_F","rhs_tigr_sts_3camo_vmf"],
																	["rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_zil131_open","rhs_tigr_m_3camo_vmf"],
																	["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
																	["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod","rhsgref_ins_DSHKM","rhs_KORD_high_VDV"],//AA first
																	["O_T_Boat_Armed_01_hmg_F"]];
										WMS_DFO_NPCs				= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
																	["rhs_vdv_combatcrew","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_medic","rhs_mvd_izlom_arifleman_rpk","rhs_mvd_izlom_machinegunner","rhs_vdv_efreitor","rhs_vdv_rifleman","rhs_vdv_grenadier"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
																	["B_W_Helicrew_F","rhsusf_socom_swcc_crewman","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_jtac","rhsusf_usmc_marpat_wd_stinger","B_T_ghillie_tna_F","rhsusf_usmc_lar_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","B_soldier_LAT2_F"], //crew first //in arma civillian can not have weapon...
																	["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
										//ARMORED SERVER
										AMS_ArmoredServer = false;
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
if (worldName == "gm_weferlingen_summer") then {
										if (true) then {diag_log format ["[MISSION MAP]|WAK|TNA|WMS| Detetected map for AI setup is: %1", worldname]};
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_weferlingen.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_weferlingen.sqf";
										WMS_AI_MaxUnits_A 			= 125;
										WMS_AI_MaxUnits_B 			= 140;
										WMS_AI_MaxUnits_C 			= 155;
										WMS_Pos_Military 			= [[13506.2,9279.24,0],[14353,15758.3,0],[11614.8,17687.1,0],[13427,4068.38,0],[15113.1,2306.51,0],
																		[2758,19395,0],[16533,18130,0],[2520,11133,0],[11883,4665,0] //bunkers
																		];
										WMS_Pos_Forests 			= [[11344.4,15354.1,0],[9303.45,14038.2,0],[20012,13673.9,0],[14707,13986.9,0],[2339.8,17888.3,0],[1451.54,11532.9,0],[4912.05,9883.98,0],[736.129,6828.21,0],[4786.81,8180.67,0],[7148.74,8057.84,0],[8255.69,6810.13,0],[2422.81,2876.99,0],[2948.04,19545,0],[7262.82,3388.75,0],[8666.46,2846.63,0],[10100.4,2972.03,0],[12244.8,4149.45,0],[12265,8775.93,0],[14488.7,7303.12,0],[18295.1,6409.52,0],[17505.9,2850.27,0],[19084.6,3187.94,0],[4857.7,19545.8,0],[13593,592.352,0],[12693,1849.46,0],[10332.3,1324.52,0],[634.327,15114.6,0]];
										//WMS_Pos_Factory 			= [];
										WMS_WaterSource				= "land_gm_euro_misc_waterpump_01";
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Humanicrate 			= "CargoNet_01_box_F"; //"CargoNet_01_box_F" R3F_WeaponStock
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000]]
										//WMS_DeliveryChopper_Type 	= ["R3F_AH6_FS"];
										WMS_CamoNet_Small 			= "CamoNet_wdl_F";
										WMS_CamoNet_Open 			= "CamoNet_wdl_open_F";
										WMS_CamoNet_Big 			= "CamoNet_wdl_big_F";
										WMS_AI_RoamingVHLcount 		= 16; //10
										WMS_RandomStart_Hour 		= 3;
										WMS_RandomStart_Random 		= 6;
										WMS_FastNight_Morning 		= 4; //morning start at
										WMS_FastNight_Evening		= 19.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 25;
										WMS_AMS_remRPG 				= 75;
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_ToRun 				= 4;
										WMS_Forests_Size			= 500;
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_DynAI_GunshipLight 		= ["rhs_uh1h_hidf",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
};
if (worldName == "Altis") then {	
									if (missionName == "TheLastCartridges_SOG_Special") then { //ALL OF THIS IS IN WMS_yourServCustSettings.sqf to keep things cleaner //NOPE, it's messed up so everything here for now
		/////////////////////////////////////////////////////////////////////////
		//SOG SPECIAL
		/////////////////////////////////////////////////////////////////////////
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_Crates_ACE_RHS_SOG.sqf";
										WMS_forceNoFog				= true;
										WMS_AI_MaxUnits_A 			= 140; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 165; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 190; //stop Base attack and missions
										WMS_Pos_Forests 			= [[4358.39,18767.3,0],[3681.54,18395.7,0],[2889.47,19979.5,0],[3302.02,20703.5,0],[3826.2,21799.7,0],[3956.3,21254.3,0],[5549.58,21388,0],[4228.95,22215.2,0],[6616.83,19200.7,0],[8338.43,23208.9,0],
																		[7174.29,20686.1,0],[8083.19,18882,0],[6126.05,16848.4,0],[14304.1,21952.5,0],[23865.5,22523.3,0],[23240.2,22503.7,0],[23902.9,23063.3,0],[26027.8,22565.2,0],[24065.5,15786.8,0],[11670.8,8949.45,0],[8376.4,22088.5,0]]; //not autoScan
										WMS_Pos_Military 			= [
																		//SOG Static Mission militaries
																		[23939,17509.2,0],[17718.4,17304.2,0],[15140.5,18271.9,0],[16197.4,10516.7,0],[16724.5,13554.5,0],[7345.62,17853.7,0],
																		//
																		[11509,15790.9,0],[16989.6,15056.5,0],[21654,17615,0],[21069,8508.56,0],[10790.6,10572.3,0],[22164.4,21016.9,0], //roadblock
																		[21934.3,21008.7,0],[21736.2,20993.7,0], //GhostHotel
																		[3670.48,20122.4,0],[6861.44,21804.1,0],[10983.1,6845.54,0],[7686.66,13273.4,0],//bunkers
																		[17568.3,13279.4,0],[17504.8,13079.7,0],[17303.6,13186.6,0],// Pyrgos military [17434,13166.3,0],
																		[8302.45,10084,0],[20799.3,7245.89,0],[20949.2,19238.4,0],[14208,21222.3,0],[12465.6,15197.3,0],[16602.3,19016.5,0],
																		[08550,20900,0],[07850,16670,0],[12820,16700,0],[12300,8900,0],[13600,12220,0],[14270,13040,0],[13810,18950,0],[16010,17000,0],[18450,14280,0],[20050,06700,0],[23050,07280,0],[23050,18850,0],[23500,21140,0],[20600,20103,0]]; //not autoScan //need enough space to land a chopper //Pyrgos military, south Zaros, south airfield, NE Agios Georgios, NO Frini, E stavros, SO Zeloran,
										WMS_Pos_Factory				= [[12624.6,16335.8,0],[12576.3,16396.6,0],[15497.9,16269,0],[15290.5,16238.2,0],[14353.2,18943.3,0],[14327.6,18984,0],[7827.92,16127.6,0],[7881.8,16153.9,0],[11239,15655.3,0],[11223.7,15684.2,0],[10268.6,14808.3,0],
																		[10233.1,14854.4,0],[10127,15044.3,0],[10099.7,15078.3,0],[9523.92,15116.1,0],[9587.76,15074.3,0],[6063.43,16230.6,0],[6089.87,16273.4,0],[6239.52,16271.1,0],[6277.66,16212.6,0],[4540.3,15415.5,0],[4212.97,15020.3,0],
																		[4185.08,15045.7,0],[3771.11,12360.9,0],[3858.33,12424.7,0],[8226.51,10906.9,0],[8170.44,10916,0],[21658.9,7786.43,0],[20268.5,8793.69,0],[20242.5,8838.65,0],[20423.9,11465.3,0],[20443.1,11451.7,0],[20583.4,15646.4,0],
																		[20612.7,15621.5,0],[20748.6,15744.5,0],[20831.1,15772.1,0],[21263.6,16561,0],[25397.9,20321.5,0],[25398.3,20367.8,0],[25304.4,21808.6,0],[27022.7,21500.4,0],[27051.6,21468.6,0],[7569.19,12187.3,0],[5336.42,14472.7,0],
																		[5383.63,14519.2,0],[6366.21,14893.9,0],[6724.62,15356.9,0],[9743.92,12544.2,0],[11395.5,14261.4,0],[11459.7,14267.2,0],[5410.11,17912.6,0],[5374.12,17921.8,0],[14650.2,21387.7,0]];
										WMS_AI_LaunchersOPF 		= [ //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
																		["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_M136_hp","rhs_weap_M136","vn_rpg2","vn_rpg7","vn_m20a1b1_01","vn_m72"],
																		["vn_sa7","rhs_weap_fim92"],
																		["launch_O_Titan_short_F"]
																	];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_rgo","rhs_grenade_khattabka_vog25_mag",
																		"vn_m7_grenade_mag","vn_m14_early_grenade_mag","vn_rkg3_grenade_mag","vn_rgd33_grenade_mag",
																		"vn_molotov_grenade_mag","vn_chicom_grenade_mag","vn_f1_grenade_mag","vn_m14_grenade_mag","vn_m34_grenade_mag","vn_m61_grenade_mag","vn_rg42_grenade_mag","vn_rgd5_grenade_mag","vn_t67_grenade_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "vn_bomb_500_mk82_se_ammo", "vn_bomb_500_mk82_dc_ammo", "vn_bomb_2000_gbu8_he_ammo", "rhs_ammo_fab500_m54", "Bo_Mk82","vn_bomb_750_m117_he_ammo","vn_bomb_100_m47_wp_ammo"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","vn_bomb_2000_gbu8_he_ammo","vn_bomb_1000_mk83_he_ammo","vn_bomb_100_m47_wp_ammo","vn_bomb_750_blu1b_fb_ammo","vn_bomb_15000_blu82_dc_ammo"];
																		//vn_bomb_mk36_destructor_mine_ammo //this one do not explode, it stick in the ground and wait... :D
										WMS_DynAI_RainObjects 		= [ //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
																		["Chemlight_blue","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","vn_bomb_mk36_destructor_mine_ammo"],
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"],
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"]
																	];
										WMS_RunnerTypes				= ["ClaymoreDirectionalMine_Remote_Ammo_Scripted","SatchelCharge_Remote_Ammo_Scripted","Sh_155mm_AMOS","vn_bomb_100_m47_wp_ammo"];//["mine","satchel","shell","bomb"] //[3 front, 1 front, 2 front, 1 back]
										WMS_AI_RdoTruck 			= "vn_b_armor_m577_01"; //"rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "vn_b_rok_army_static_m101_01"; //"rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "vn_o_nva_static_zgu1_01"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_ExtractionChopper_Type 	= ["vn_b_air_uh1d_02_06"];  //infantry program Active List only
										WMS_ExtractionVehicle_Type 	= ["vn_i_armor_m113_acav_04"];  //infantry program Active List only
										WMS_DeliveryChopper_Type 	= ["vn_b_air_oh6a_02"];  //infantry program Active List only
										WMS_DynAI_GunshipMedium 	= ["vn_o_air_mi2_03_04",[],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["vn_o_air_mi2_04_02",[],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 4;
										WMS_AMS_CustomPos			= ["forest","random"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_SpnDistMission 		= 3000;
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_AMS_remRPG 				= 90;
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= false;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
										WMS_FastNight_Night 		= 25;  //time speed
										WMS_DynAI_DestroyVHL 		= 40;
										WMS_AI_HMG 					= "vn_o_nva_static_dshkm_high_01"; //"rhs_KORD_high_MSV";
										WMS_AI_HMG_Scope 			= "vn_o_pl_static_sgm_high_01"; //no scope but kind of AA
										WMS_AI_HMG_Shield			= "vn_o_vc_static_mg42_high"; //Not a shield but should be fun //"B_G_HMG_02_high_F";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_Arty					= "vn_o_vc_static_mortar_type63"; //"rhs_2b14_82mm_msv";
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_AI_RoamingVHL_Skill		= [0.1, 0.2]; //skill + selectRandom //lower, with SOG, they will shoot through the their windshield, 9mm oneshot you in the face
										WMS_AMS_MineAT 				= ["vn_mine_m15","vn_mine_tm57","rhsusf_mine_M19","ATMine"];
										WMS_OPFOR_Flag				= "vn_flag_vc"; //default flag for Bandits, different than AMS so no interactions with findpositions //vn_flag_vc
										WMS_AI_Units_Class 			= [ //KEEP OPFOR UNITS ONLY!!!
																	"vn_o_men_nva_dc_01","vn_o_men_nva_dc_13","vn_o_men_nva_dc_08",
																	"vn_o_men_nva_marine_03","vn_o_men_nva_marine_10","vn_o_men_nva_marine_04"];
										WMS_AMS_UnitClass 			= WMS_AI_Units_Class;
										WMS_AL_Units				= [//infantry classname, do not mix SIDES!
																	"vn_c_men_22","vn_c_men_29","vn_c_men_30","vn_c_men_32","vn_c_men_18","vn_c_men_06","vn_c_men_08","vn_c_men_01","vn_c_men_03","vn_c_men_09","vn_c_men_11"
																	]; 
										WMS_AL_Vehicles				= [[ //[[AIR],[GROUND],[SEA]]
																	"vn_b_air_uh1b_01_09","vn_b_air_uh1d_04_09","RHS_Mi8amt_civilian","C_Heli_Light_01_civil_F","rhs_uh1h_idap"
																	],[
																	"vn_c_bicycle_02","vn_c_car_02_01","vn_c_bicycle_02","vn_c_car_03_01","vn_c_bicycle_02","vn_c_car_01_01","vn_c_bicycle_02","vn_c_car_04_01"
																	],[
																	"vn_c_boat_01_03","vn_c_boat_01_01","vn_c_boat_02_03","vn_c_boat_02_04","vn_c_boat_08_02","vn_c_boat_07_02","vn_c_boat_07_01","vn_c_boat_08_01"
																	]];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","vn_m7_grenade_ammo","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["vn_m34_grenade_ammo","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst","vn_bomb_mk36_destructor_mine_ammo"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","vn_bomb_750_m117_he_ammo","vn_bomb_mk36_destructor_mine_ammo","vn_bomb_100_m47_wp_ammo"] //wave 9 & 10
																	];
										//NEW CONVOY EVENT
										WMS_TargetConvoy 			= true;
										WMS_TargetConvoyPos 		= [ //[[pos,dir],[pos,dir],[pos,dir],[pos,dir],...]
																		[[4592.14,21491,0],27.4013],[[3011.52,20271,0],176.833],[[3164.48,21900,0],328.967],[[6868.48,22172.9,0],353.077],[[3615.77,13036,0],1.66753],[[3778.24,12355.3,0],136.932],[[4191.8,15044.2,0],270.057],[[5968.06,13781.6,0],112.343],[[6907.59,12624.7,0],282.034],[[5027.25,11174.1,0],317.424],[[3413.83,14294.8,0],320.806],[[8579.86,15086.2,0],313.446],[[10511.7,15508.8,0],91.6482],[[10088.4,11681.7,0],229.634],[[9880.59,12184.8,0],141.16],[[9212.21,11470.3,0],179.289],[[8390.22,10137.7,0],246.675],[[11737.7,9028.97,0],352.033],[[11474,8404.86,0],64.2766],[[8794.67,7574.08,0],50.4069],[[11572.8,7043.66,0],278.331],[[10953.9,10162.5,0],35.057],[[11421,10001.2,0],211.059],[[3077.92,18161.8,0],113.291],[[3810.48,17768.6,0],293.607],[[8486.98,19811.6,0],37.2224],[[9323.04,19340.3,0],102.682],[[9443.45,20289.7,0],340.031],[[9731.71,22308.6,0],93.5569],[[8844.76,23444.6,0],104.862],[[11294.9,20456.9,0],84.7725],[[11720.7,22739.6,0],100.062],[[14207.3,21735,0],40.3496],[[15723.5,21692.8,0],242.35],[[14711.8,20124.6,0],144.182],[[11042,16889,0],247.819],[[13591.1,12190.4,0],1.66692],[[14080.1,12977.5,0],273.02],[[20707.9,15750.3,0],148.733],[[21292.3,16368.3,0],313.834],[[20984.8,16996.6,0],222.754],[[20987,19324.7,0],303.22],[[21572.5,19496.4,0],130.088],[[21783.7,20997.1,0],228.342],[[21933.5,20973.9,0],267.094],[[24609.7,23734,0],333.566],[[24856.1,23215.4,0],148.368],[[26120.3,22658,0],16.6434],[[26550.3,22745.9,0],160.404],[[26921.6,23146.6,0],149.592],[[27083.2,23286,0],45.3249],[[27603.2,23200.8,0],314.937],[[27497.9,21504,0],322.787],[[23693.2,23103.1,0],22.4221],[[5985.77,18441.4,0],212.083],[[5588.08,17965,0],57.8907],[[5563.32,17471.2,0],214.579],[[20539.5,8898,0],146.035],[[20460.3,8812.69,0],290.234],[[20730.4,10119.7,0],145.611],[[20928.2,10394.5,0],35.9732],[[18598,6575.16,0],82.5335],[[20370.8,6088.68,0],132.441],[[21420.9,6752.35,0],294.351],//ground
																		[[22216.8,8594.11,0],216.481],[[21940.8,5966.95,0],300.024],[[3231.19,12854.1,0],188.381],[[3799.13,17237.7,0],274.875],[[4172.42,16424.7,0],188.383],[[3375.71,13983.7,0],123.363],[[2297.41,11533,0],198.642],[[8193.65,7359.74,0],188.392],[[7857.53,7563.36,0],76.5582],[[8764.4,8361.9,0],357.16],[[12129.9,6458.67,0],237.294],[[11390,6379.89,0],123.866],[[12729.5,8615.52,0],7.18493],[[11606.6,10154.9,0],216.906],[[11093.3,10380,0],164.989],[[10063.3,10472.2,0],305.578],[[10077.1,11150,0],265.462],[[14038.3,11597.4,0],60.5524],[[13456.4,11745.5,0],17.7236],[[13327.8,12118.5,0],205.214],[[13710.1,12440.8,0],93.8867],[[14034.5,12863.8,0],105.317],[[14231.4,13127.1,0],264.62],[[18325.1,8115.47,0],336.188],[[18483.9,6189.79,0],148.252],[[22032,4802.57,0],86.3195],[[22727.7,13849.4,0],224.681],[[22863.4,14646.8,0],316.737],[[26189.4,19974.6,0],6.52778],[[27641.9,20789.3,0],256.562],[[28003.2,22551.5,0],346.533],[[27790.4,23235.1,0],176.399],[[27948.7,23785,0],255.912],[[27627.3,24481.5,0],188.385],[[28437.4,25850.4,0],317.921],[[25223.3,23593.3,0],338.019],[[24785.4,23859.2,0],188.058],[[23273.7,24122,0],128.931],[[20826.7,20303.8,0],188.385],[[20614.7,19550,0],217.397],[[21065.1,19973.8,0],247.409],[[16676.4,21931.2,0],9.58326],[[16075.6,22136.5,0],31.5521],[[15638.3,22340.5,0],146.358],[[14931.9,22936.3,0],234.088],[[13842.1,23184.4,0],230.733],[[12549.7,23218.4,0],129.55],[[12009.1,22975.4,0],209.953],[[11153.8,22776.4,0],101.398],[[10763.1,22586.4,0],216.378],[[9670.95,22386.1,0],69.8102],[[8580.35,24718.2,0],85.3367],[[7573.84,23182.8,0],233.894],[[6265.97,22663.6,0],135.132],[[2998.5,22101.7,0],252.979],[[2643.88,21972.6,0],167.676],[[2544.57,19702.6,0],226.288],[[2931.17,18170.1,0],5.47376],[[2915.17,18680.1,0],179.631],[[24309.6,15388.9,0],234.285],[[21657.6,20779.8,0],178.777],[[22223.4,21767.5,0],43.8013],[[21435.4,21224.8,0],250.529] //sea
																		];
										WMS_TargetConvoyVHL 		= [ //[[logistic],[escort],[SEA_logistic],[SEA_escort]]
																	[
																		"vn_o_wheeled_z157_04_nvam", //missile transport
																		"vn_b_wheeled_m54_ammo_airport","vn_o_wheeled_z157_fuel_kr","vn_o_wheeled_z157_repair_kr","vn_o_wheeled_z157_02_kr","vn_o_armor_btr50pk_01_nva65","vn_o_armor_btr50pk_03_nva65",
																		"vn_o_armor_m577_02","vn_o_armor_m577_01","vn_o_wheeled_z157_03_nva65","vn_o_wheeled_z157_01_nva65","vn_o_wheeled_z157_ammo_nvam","rhs_gaz66_ammo_vv",
																		"rhs_gaz66_r142_vv","rhs_gaz66_ap2_vv","rhs_kamaz5350_ammo_vv","RHS_Ural_Repair_VV_01","rhs_zil131_flatbed_cover_vv",
																		"rhs_9k79_K","O_Radar_System_02_F","O_SAM_System_04_F","vn_sa2","vn_o_static_rsna75","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2","O_SAM_System_04_F","vn_sa2"
																	],[
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_m113_acav_06_kr","vn_o_wheeled_btr40_mg_06_pl","vn_o_wheeled_btr40_mg_03_pl","vn_o_wheeled_z157_mg_02_pl","vn_o_armor_btr50pk_02_nva65","vn_o_armor_m125_01",
																		"RHS_M6_wd","rhs_zsu234_aa","vn_b_wheeled_m54_mg_02","vn_o_wheeled_btr40_mg_03_pl","vn_o_armor_pt76b_01_nva65","vn_o_armor_t54b_01_nva65","vn_o_armor_type63_01_nva65","vn_o_armor_m41_01","rhsgref_tla_btr60","rhsgref_tla_offroad_armed",
																		"rhs_btr80a_vv","rhs_tigr_sts_3camo_vv","rhs_bmp2k_vv","rhs_bmp1d_vv","rhs_zsu234_aa","rhs_2s1_at_tv",
																		"RHS_M6_wd","rhs_2s3_at_tv","rhs_t72ba_tv","rhs_t80","rhs_bmp3_msv","rhsgref_BRDM2_msv"		
																	],[
																		"vn_o_boat_08_01_kr","vn_o_boat_08_02_kr","rhsgref_hidf_rhib","vn_b_boat_06_01","B_Boat_Armed_01_minigun_F","B_SDV_01_F","rhsusf_mkvsoc","vn_o_boat_04_01"		
																	],[
																		"O_Boat_Armed_01_hmg_F","vn_o_boat_03_01","vn_o_boat_04_01","vn_b_boat_12_03","vn_b_boat_13_03","vn_b_boat_10_01"				
																	]
																	];
										//NEW CONVOY EVENT\\
										WMS_AMS_MissionList 	= 	[ //missions themself and weight
																	["MissionTest1",0],
																	["MissionTest2",0],
																	["ForestCamp",1], //"forest" positions
																	["HomeDepot",2],
																	["CombatPatrol",3],
																	["EnyBunkers",4], //AP mines
																	["Arbeit",3],
																	["ArmedBandits",2],
																	["C192Crash",2],
																	["AmazonWH",2],
																	["TransmissionTower",2],
																	["GunsX3",3], //"utility" truck reward, NPC armored
																	["Arena",0], //this one is pretty hardcore on the objects and NPCs xD
																	["LightArmoredSteal",2], //Light Armored Reward
																	["HeliSteal",2], //helicopter reward
																	["AABattery",3], //no move crate
																	["Escobar",2],
																	["Forgotten",2],
																	["Radar",3], //big crate reward
																	["Construction",2], //truck reward
																	["OldTemple",2],  //no move crate
																	["JunkYard",2], //truck reward
																	["OldPowerPlant",2], //vehicle reward, armed/armored NPC
																	["Market",2], //small truck reward
																	["GrandPaJoe",2],
																	["LumberYard",2], //"forest" positions
																	["Factory",4], //"factory" positions
																	["FieldHospital",2],
																	["Object172M",1], //Armored Reward and NPCs
																	["uncleabrams",1], //Armored Reward and NPCs
																	["thecommunity",2],
																	["shipyard",2], //small vehicle reward
																	["occupation",3], //location/cities positions
																	["commsrelay",2], //"comms" vehicle reward
																	["strelnikovtrain",2],
																	["bastogne",1], //"forest" positions
																	["blackhawk",2],
																	//STATICS MISSIONS, MUST HAVE POSITIONS!!!
																	["VC Arty",15],
																	//["VC Patrol",5], //not yet
																	//OUTPOSTS
																	["OutpostAlpha",1],
																	["OutpostBravo",1],
																	["OutpostCharlie",1],
																	["OutpostDelta",1], //+V2
																	["OutpostEcho",1],
																	["OutpostFoxtrot",1],
																	["OutpostGolf",1] //+V2
																	];
										WMS_AMS_StaticPos_1			= []; //VC //patrol
										WMS_AMS_StaticPos_2			= []; //PATHET //patrol, garrison positions
										WMS_AMS_StaticPos_3			= []; //PAVN  //patrol, garrison positions //ARTY 1
										WMS_AMS_StaticPos_4			= []; //KHMER //patrol, garrison positions //ARTY 2
										execVM "\InfantryProgram\Scripts\AMS_StaticMissionsOBJ_Altis_SOG.sqf";
									} else {
			/////////////////////////////////////////////////////////////////////////
			//REGULAR ALTIS
			/////////////////////////////////////////////////////////////////////////
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_forceNoFog				= true;
										WMS_AI_MaxUnits_A 			= 140; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 165; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 190; //stop Base attack and missions
										WMS_Pos_Forests 			= [[4358.39,18767.3,0],[3681.54,18395.7,0],[2889.47,19979.5,0],[3302.02,20703.5,0],[3826.2,21799.7,0],[3956.3,21254.3,0],[5549.58,21388,0],[4228.95,22215.2,0],[6616.83,19200.7,0],[8338.43,23208.9,0],
																		[7174.29,20686.1,0],[8083.19,18882,0],[6126.05,16848.4,0],[14304.1,21952.5,0],[23865.5,22523.3,0],[23240.2,22503.7,0],[23902.9,23063.3,0],[26027.8,22565.2,0],[24065.5,15786.8,0],[11670.8,8949.45,0],[8376.4,22088.5,0]]; //not autoScan
										WMS_Pos_Military 			= [
																		[11509,15790.9,0],[16989.6,15056.5,0],[21654,17615,0],[21069,8508.56,0],[10790.6,10572.3,0],[22164.4,21016.9,0], //roadblock
																		[21934.3,21008.7,0],[21736.2,20993.7,0], //GhostHotel
																		[3670.48,20122.4,0],[6861.44,21804.1,0],[10983.1,6845.54,0],[7686.66,13273.4,0],//bunkers
																		[17568.3,13279.4,0],[17504.8,13079.7,0],[17303.6,13186.6,0],// Pyrgos military [17434,13166.3,0],
																		[8302.45,10084,0],[20799.3,7245.89,0],[20949.2,19238.4,0],[14208,21222.3,0],[12465.6,15197.3,0],[16602.3,19016.5,0],
																		[08550,20900,0],[07850,16670,0],[12820,16700,0],[12300,8900,0],[13600,12220,0],[14270,13040,0],[13810,18950,0],[16010,17000,0],[18450,14280,0],[20050,06700,0],[23050,07280,0],[23050,18850,0],[23500,21140,0],[20600,20103,0]]; //not autoScan //need enough space to land a chopper //Pyrgos military, south Zaros, south airfield, NE Agios Georgios, NO Frini, E stavros, SO Zeloran,
										WMS_Pos_Factory				= [[12624.6,16335.8,0],[12576.3,16396.6,0],[15497.9,16269,0],[15290.5,16238.2,0],[14353.2,18943.3,0],[14327.6,18984,0],[7827.92,16127.6,0],[7881.8,16153.9,0],[11239,15655.3,0],[11223.7,15684.2,0],[10268.6,14808.3,0],
																		[10233.1,14854.4,0],[10127,15044.3,0],[10099.7,15078.3,0],[9523.92,15116.1,0],[9587.76,15074.3,0],[6063.43,16230.6,0],[6089.87,16273.4,0],[6239.52,16271.1,0],[6277.66,16212.6,0],[4540.3,15415.5,0],[4212.97,15020.3,0],
																		[4185.08,15045.7,0],[3771.11,12360.9,0],[3858.33,12424.7,0],[8226.51,10906.9,0],[8170.44,10916,0],[21658.9,7786.43,0],[20268.5,8793.69,0],[20242.5,8838.65,0],[20423.9,11465.3,0],[20443.1,11451.7,0],[20583.4,15646.4,0],
																		[20612.7,15621.5,0],[20748.6,15744.5,0],[20831.1,15772.1,0],[21263.6,16561,0],[25397.9,20321.5,0],[25398.3,20367.8,0],[25304.4,21808.6,0],[27022.7,21500.4,0],[27051.6,21468.6,0],[7569.19,12187.3,0],[5336.42,14472.7,0],
																		[5383.63,14519.2,0],[6366.21,14893.9,0],[6724.62,15356.9,0],[9743.92,12544.2,0],[11395.5,14261.4,0],[11459.7,14267.2,0],[5410.11,17912.6,0],[5374.12,17921.8,0],[14650.2,21387.7,0]];
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [
																	["Chemlight_blue","Land_HumanSkull_F"],
																	["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],
																	["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],
																	["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],
																	["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_IP_Extract_Alt 			= 50;
										WMS_C130_Altitude 			= 100;
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 4;
										WMS_AMS_CustomPos			= ["forest","random"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_SpnDistMission 		= 3000;
										WMS_AI_RoamingVHLcount 		= 16; //10
										WMS_AMS_remRPG 				= 90;
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= false;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
										WMS_FastNight_Night 		= 25;  //time speed
										WMS_DynAI_DestroyVHL 		= 40;
										//DFO
										WMS_DFO_Choppers			= [["vtx_MH60M_DAP","vtx_MH60M_DAP_MLASS"],["vtx_HH60","vtx_MH60M","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
										WMS_DFO_NPCvehicles			= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
																	["RHS_Ka52_vvsc","RHS_Mi24V_vvsc","RHS_Mi8MTV3_vvsc"],
																	["RHS_Mi24Vt_vvsc","RHS_Mi8mt_vvsc"],
																	["rhs_ka60_c","RHS_Mi8T_vvsc"],
																	["rhsgref_ins_zsu234","rhsgref_ins_t72bb","rhsgref_ins_bmp2e","rhsgref_ins_2s1_at","rhs_t80ue1"],//AA first
																	["rhsgref_ins_ural_Zu23","rhsgref_ins_btr70","rhsgref_ins_btr60","rhsgref_BRDM2_ins","rhs_btr80a_msv"],//"AA" first
																	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","O_LSV_02_armed_F","O_G_Offroad_01_armed_F","rhs_tigr_sts_3camo_vmf"],
																	["rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_zil131_open","rhs_tigr_m_3camo_vmf"],
																	["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
																	["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod","rhsgref_ins_DSHKM","rhs_KORD_high_VDV"],//AA first
																	["O_T_Boat_Armed_01_hmg_F"]];
										WMS_DFO_NPCs				= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
																	["rhs_vdv_combatcrew","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_medic","rhs_mvd_izlom_arifleman_rpk","rhs_mvd_izlom_machinegunner","rhs_vdv_efreitor","rhs_vdv_rifleman","rhs_vdv_grenadier"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
																	["B_W_Helicrew_F","rhsusf_socom_swcc_crewman","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_jtac","rhsusf_usmc_marpat_wd_stinger","B_T_ghillie_tna_F","rhsusf_usmc_lar_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","B_soldier_LAT2_F"], //crew first //in arma civillian can not have weapon...
																	["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
									};

if (worldName == "Tanoa") then {		
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_NIA.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										WMS_AI_MaxUnits_A 			= 180; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 200; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 220; //stop Base attack and missions
										WMS_Pos_Forests 			= [[12193.6,7207.56,0],[12639.7,9537.74,0],[13591.7,10381.7,0],[12243.8,11276.9,0],[11535.8,11695.9,0],[9956.77,10682.4,0],[10753.5,10952.8,0],[11375.6,8931.61,0],[7497.7,9963.66,0],[6727.14,9690.13,0],[9911.93,7563.84,0],[9842.73,8452.56,0],[10533.2,8929.57,0],[9278.99,9216.45,0],[8808.65,8472.57,0],[8376.15,11540.1,0],[8829.97,12827,0],[9694.37,3121.78,0],[10497.3,3184.76,0],[12239.6,1843.9,0],[11578.4,4795.89,0],[10594.4,4271.09,0],
																		[6610.61,7946.48,0],[5724.33,8332.38,0],[8658.8,7111.09,0],[7293.34,9328.91,0],[11410.9,6882.1,0],[13047.8,8955.74,0],[12954.5,8395.98,0],[12725.5,10630.8,0],[13734.8,11148.1,0],[7356.95,11640,0],[6525.8,11869,0],[7857.34,12861.3,0],[9061.66,12208.3,0],[11868.9,9447.65,0],[7849.6,11064,0],[12239.3,11963.5,0],[11247.7,12709.2,0],[8155.14,8440.38,0],[9316.4,8006.42,0],[8900.22,4393.79,0],[10045.2,3684.74,0],[11742.9,3577.15,0],[12309.7,3466.95,0],[13036.5,2677.12,0],[10675,2357,0],[12480.8,4290.99,0],[12277.7,4945.42,0],[11093.1,7743.86,0],[10464.5,10244.4,0],[3763.8,12059.4,0],[3496.7,13251.2,0],[3163.37,11494.7,0],[2910.05,9267.1,0],[1391.92,7897.4,0],[2952.28,5908.95,0],[3936.72,5734.41,0],[2370.46,7168.01,0],[1756.06,7386.77,0],[2640.43,6302.26,0],[2078.65,2976.67,0],[2292.4,2492.43,0],[2770.22,2296.55,0],[1740.01,864.082,0],[1027,2875.89,0],[4668.97,1955.79,0],[4279.31,4255.43,0],[12517.4,14201,0],[11188,10099.2,0],[13297.9,9762.78,0],[5028.1,9353.63,0],[8416.88,1340.24,0]]; //not autoScan
										
										WMS_Pos_Military 			= [
																	[6427.537,6176.689,0], //added Bunkers
																	[6705.458,6374.059,0], //added Bunkers
																	[4787.29,1672.02,0.396053], //added Bunkers
																	[1308.72,8119.34,0], //added Bunkers
																	[10591.2,2306.1,1.01215], //added Bunkers
																	[3122.89,11705.3,0], //added Bunkers
																	[6180.5,4466.67,0], //added CKP
																	[4286.15,3304.89,0], //added CKP
																	[3206.07,6602.53,0], //added CKP
																	[10015.2,4053.63,0], //added CKP
																	[9036.73,9930.56,0], //added CKP
																	[13322.9,11107.3,0], //added CKP
																	[3601.69,2181.18,0], //added military
																	[2674.76,12317,0], //added military
																	[11020.8,11500.2,0], //added military
																	[11348.4,6605.89,0], //kotomo forest
																	[9963.01,12069.9,0], //volcano
																	[6718.56,10149.7,0], //Georgetown
																	[1250.64,7885.81,0], //tavu
																	[2560.72,9041.82,0], //sosovu
																	[3093.44,9247.47,0], //sosovu
																	[3646.34,9543.61,0], //yasa
																	[2217.07,11622.5,0], //tuvanaka
																	[4071.46,12562,0], //south vehicle range
																	[2312.37,13205.3,0], //Training base
																	[9019.26,13265.3,0], //La rochelle
																	[5960.44,11623.8,0] //Nicolet
																	]; //not autoScan //need enough space to land a chopper
										WMS_Pos_Factory 			= [[13609.4,11800.5,0],[13341,12164.3,0],[14038.6,12275.9,0],[13279.4,13732,0],[12280.4,13973.1,0],[4196.66,11695.3,0],[2009.82,11818.3,0],[2041.16,12002.6,0],[2355.71,13289.9,0],
																		[2939.81,13096.3,0],[9094.33,13798.3,0],[8989.85,13796.1,0],[8697.3,13831.5,0],[5506.36,11956.7,0],[5390.33,11206.7,0],[5306.85,11134.8,0],[5597.04,11017.8,0],[5446.72,10070.9,0],[5537.19,10092.6,0],[5618.79,10191.6,0],[4216.73,8472.55,0],
																		[9459.27,7525.05,0],[9410,7565.81,0],[11233.4,5389.14,0],[11753.3,6943.94,0],[11787.3,6881.21,0],[12686.9,7498.36,0],[14592.4,10984.7,0],[12283.3,10372.3,0],[11911.5,10283.3,0],[12044,10602.9,0],[11834.3,11142.1,0],[8300.53,10338.8,0],[8270.5,10385.3,0],[8430.16,10323.4,0],
																		[8491.51,10243.3,0],[7481.31,8530.06,0],[7367.17,8520.75,0],[7440.35,8465.83,0],[8121.65,7703.07,0], [12449.9,3994.18,0],[11795.2,2286.13,0],[9417.8,4005.77,0],[5585.57,3977.97,0],[5635.41,4029.41,0],[5219.42,3658.98,0],[5253.58,3629.42,0],
																		[2270.92,6332.64,0]];
										WMS_IP_Extract_Alt 			= 100;
										WMS_C130_Altitude 			= 150;
										WMS_RandomStart_Hour 		= 3;
										WMS_RandomStart_Random 		= 6;
										WMS_FastNight_Evening		= 17.5; //evening start at //night -1 hour
										WMS_FastNight_Night 		= 25;  //time speed
										WMS_forceNoFog				= true;
										WMS_forceNorain 			= true;
										WMS_DynAI_Skills			= [0.06, 0.11, 0.18, 0.23]; //+random 0.15
										WMS_AL_VhlBalance			= [2,2,0,2,0,2,1,2]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Humanicrate 			= "CargoNet_01_box_F"; //"CargoNet_01_box_F" R3F_WeaponStock
										WMS_CamoNet_Small 			= "CamoNet_ghex_F";
										WMS_CamoNet_Open 			= "CamoNet_ghex_open_F";
										WMS_CamoNet_Big 			= "CamoNet_ghex_big_F";
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","ACE_acc_pointer_red"];
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_CustomPos			= ["forest","random"];
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AI_VHLwptDist 			= 2500;
										WMS_AI_RoamingVHL_citySpawn	= true; //NEW
										WMS_AI_RoamingVHLcount 		= 16; //10
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_AMS_remRPG 				= 80;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_AMS_ForceRadius			= true;
										WMS_AMS_CleanMapObj			= true;
										WMS_AI_RoamingVHL_remRPG 	= true;
										WMS_AI_Para_remRPG 			= false;
										WMS_AI_INFpatrol_remRPG 	= false;
										WMS_DynAI_remRPG 			= true;
										WMS_AI_CargoUnits	 		= 2;
										WMS_AMS_ToRun 				= 4;
										WMS_DFO_Choppers			= [["vtx_MH60M_DAP","vtx_MH60M_DAP_MLASS"],["vtx_HH60","vtx_MH60M","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
										WMS_DFO_NPCvehicles			= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
																	["RHS_Ka52_vvsc","RHS_Mi24V_vvsc","RHS_Mi8MTV3_vvsc"],
																	["RHS_Mi24Vt_vvsc","RHS_Mi8mt_vvsc"],
																	["rhs_ka60_c","RHS_Mi8T_vvsc"],
																	["rhsgref_ins_zsu234","rhsgref_ins_t72bb","rhsgref_ins_bmp2e","rhsgref_ins_2s1_at","rhs_t80ue1"],//AA first
																	["rhsgref_ins_ural_Zu23","rhsgref_ins_btr70","rhsgref_ins_btr60","rhsgref_BRDM2_ins","rhs_btr80a_msv"],//"AA" first
																	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","O_LSV_02_armed_F","O_G_Offroad_01_armed_F","rhs_tigr_sts_3camo_vmf"],
																	["rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_zil131_open","rhs_tigr_m_3camo_vmf"],
																	["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
																	["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod","rhsgref_ins_DSHKM","rhs_KORD_high_VDV"],//AA first
																	["O_T_Boat_Armed_01_hmg_F"]];
										WMS_DFO_NPCs				= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
																	["rhs_vdv_combatcrew","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_medic","rhs_mvd_izlom_arifleman_rpk","rhs_mvd_izlom_machinegunner","rhs_vdv_efreitor","rhs_vdv_rifleman","rhs_vdv_grenadier"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
																	["B_W_Helicrew_F","rhsusf_socom_swcc_crewman","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_jtac","rhsusf_usmc_marpat_wd_stinger","B_T_ghillie_tna_F","rhsusf_usmc_lar_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","B_soldier_LAT2_F"], //crew first //in arma civillian can not have weapon...
																	["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
if (worldName == "Enoch") then {		//Livonia
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_Namalsk.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_NIA.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_AI_MaxUnits_A 			= 180; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 200; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 220; //stop Base attack and missions
										WMS_forceNoRain				= true; //minus 10fps if rain on Livonia !? WTF!?
										WMS_RandomStart_Hour 		= 4;
										WMS_RandomStart_Random 		= 6;
										WMS_FastNight_Morning 		= 6.5; //morning start at
										WMS_FastNight_Evening		= 16; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_Pos_Forests 			= [[500.584,1247.81,0],[1892.32,907.544,0],[3009.21,892.555,0],[3638.92,920.341,0],[4258.47,576.722,0],[1501.81,2115.15,0],[3354.25,1533.77,0],[4563.54,1466.81,0],[5919.6,1434.21,0],[7771.24,1566.92,0],
																	[8280.91,575.626,0],[8685.91,1431.13,0],[9787.44,726.707,0],[11570.6,1384.29,0],[10618.7,2197.06,0],[12275,596.979,0],[9680.48,2393.97,0],[11795.2,2611.64,0],[12171.1,3120.27,0],[10917.7,3124.75,0],
																	[9572.52,3207.32,0],[10262.2,3613.31,0],[9118.06,3783.94,0],[8022.92,3082.07,0],[7666.52,4138.54,0],[6911.73,2533.74,0],[5719.95,2753.25,0],[5299.88,4171.53,0],[4431.87,2820.49,0],[3842.05,3130.27,0],
																	[2783.97,2689.91,0],[2005.79,3571.1,0],[2874.43,3887.01,0],[1370.33,3070.76,0],[1986.86,4268.1,0],[3571.67,4873,0],[3870.32,5701.85,0],[3875.22,4243.32,0],[5171.35,6221.99,0],[9342.29,5166.41,0],[8569.64,4878.93,0],
																	[10940.3,5514.07,0],[11845.3,6539.8,0],[12086,8849.75,0],[12396.3,11490.2,0],[12490.5,10639.5,0],[12092.8,12202,0],[7429.94,10787.1,0],[8512.76,10942,0],[4704.95,12447.1,0],[2054.08,12079.1,0],[1358.3,12024.5,0],
																	[1309.64,11022.8,0],[445.936,11744.1,0],[425.94,10044.8,0],[403.38,6580.51,0],[2111.42,8297.66,0],[5808.35,9109.53,0],[3065.6,4498.14,0]]; //not autoScan
										WMS_Pos_Military 			= [[9905.06,3799.11,0.00143433],[2222.99,10861.5,0.00138855],[2058.74,11151.4,0.00145721],[4946.38,2147.22,0.00137329],[4847.26,853.432,0.00143433],[8168.58,10779.1,0.00149155],[7906.54,9760.36,0.00141907],[9076.36,6654.9,0.00143433],[7833.93,5839.28,0.00143433],[6411.45,8169.19,0.00143433],[5633.6,3825.52,0.00143433],[7352.71,2843.94,0.00156403],[7404.92,2605.67,0.00144196],[6382.37,4781.92,0.00143433],[2554.64,5517.89,0.00135803],
																		[8150.39,8492.32,0],[8103.29,8720.86,0],[7896.09,8830.35,0] //Zapadlisko
																		]; //not autoScan //need enough space to land a chopper
										WMS_Pos_Factory 			= [[7332.18,2610.15,0],[7338.58,2804.32,0],[7276.07,2949.69,0],[7609.2,2648.74,0],[10202,2198.22,0],[11515.8,453.393,0],[11425,503.708,0],[11569.6,388.934,0],[1669.84,3658.66,0],[2552.94,5515.91,0],[5564.78,3748.91,0],
																	[6502.83,3797.7,0],[6456.05,3841.48,0],[11308.7,4199.76,0],[11495.6,4632,0],[11494.4,7001.17,0],[11555,7032.4,0],[11561.5,7090.13,0],[11024.1,8939.69,0],[11049.3,8993.89,0],[10913.9,9009.97,0],[11374.5,9338.86,0],[11374.1,9478.25,0],
																	[11427.1,9414.55,0],[11128.8,11404.3,0],[11159.9,11438.9,0],[9281.87,11160.5,0],[9348,11193.3,0],[8429.14,11250,0],[6429.28,11035.6,0],[6352.76,11009.6,0],[5211.93,10476.2,0],[5124.17,10380.3,0],[5054.75,10535.8,0],[1974.41,9517.49,0],
																	[1380.71,7997.95,0],[1367.86,7965.06,0],[1749.38,7661.46,0],[1644.95,7618.3,0],[1565.66,7540.32,0],[1417.23,7499.08,0],[1282.85,7664.82,0],[1317.51,7809.19,0],[1324.77,7876.33,0],[1914.51,7686.26,0],[2031.75,7708.33,0],[3153.81,7055.44,0],
																	[3084.19,7068.05,0],[4909.47,5421.75,0],[5211.63,5661.19,0],[5212.11,5691.29,0],[6357.02,4743.8,0],[6404.38,4837.89,0],[6445.61,4802.18,0],[2382.48,11469.4,0],[3083.12,11987,0],[3145.07,12039.4,0]];
										WMS_IP_Extract_Alt 			= 75;
										WMS_C130_Altitude 			= 150;
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Humanicrate 			= "CargoNet_01_box_F"; //"CargoNet_01_box_F"
										WMS_CamoNet_Small 			= "CamoNet_wdl_F";
										WMS_CamoNet_Open 			= "CamoNet_wdl_open_F";
										WMS_CamoNet_Big 			= "CamoNet_wdl_big_F";
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_DynAI_GunshipLight 		= ["rhs_uh1h_hidf",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_AI_RoamingVHLcount 		= 14; //10
										WMS_DynAI_DestroyVHL 		= 30;
										WMS_AMS_ToRun 				= 4;
										WMS_AMS_remRPG 				= 90;
										WMS_AMS_SpnDistMission 		= 2500; //minimum distance from another mission to spawn a mission
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_CustomPos			= ["forest"];//["forest","forest","forest","random"];
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										//WMS_AI_HMG_Scope 			= "O_HMG_01_high_F";
										//WMS_AI_HMG_Shield			= "B_G_HMG_02_high_F";
										//WMS_AI_Arty				= "rhs_2b14_82mm_msv"; //ssems like NPC doesnt know how to use RHS mortar
										//WMS_AI_GMG 				= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AI_RoamingVHL_remRPG 	= false;
										WMS_AI_Para_remRPG 			= true;
										WMS_AI_INFpatrol_remRPG 	= false;
										WMS_DynAI_remRPG 			= false;
										WMS_AMS_ClnObj 				= false;
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										//DFO
										WMS_DFO_Choppers			= [["vtx_MH60M_DAP","vtx_MH60M_DAP_MLASS"],["vtx_HH60","vtx_MH60M","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
										WMS_DFO_NPCvehicles			= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
																	["RHS_Ka52_vvsc","RHS_Mi24V_vvsc","RHS_Mi8MTV3_vvsc"],
																	["RHS_Mi24Vt_vvsc","RHS_Mi8mt_vvsc"],
																	["rhs_ka60_c","RHS_Mi8T_vvsc"],
																	["rhsgref_ins_zsu234","rhsgref_ins_t72bb","rhsgref_ins_bmp2e","rhsgref_ins_2s1_at","rhs_t80ue1"],//AA first
																	["rhsgref_ins_ural_Zu23","rhsgref_ins_btr70","rhsgref_ins_btr60","rhsgref_BRDM2_ins","rhs_btr80a_msv"],//"AA" first
																	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","O_LSV_02_armed_F","O_G_Offroad_01_armed_F","rhs_tigr_sts_3camo_vmf"],
																	["rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_zil131_open","rhs_tigr_m_3camo_vmf"],
																	["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
																	["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod","rhsgref_ins_DSHKM","rhs_KORD_high_VDV"],//AA first
																	["O_T_Boat_Armed_01_hmg_F"]];
										WMS_DFO_NPCs				= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
																	["rhs_vdv_combatcrew","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_medic","rhs_mvd_izlom_arifleman_rpk","rhs_mvd_izlom_machinegunner","rhs_vdv_efreitor","rhs_vdv_rifleman","rhs_vdv_grenadier"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
																	["B_W_Helicrew_F","rhsusf_socom_swcc_crewman","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_jtac","rhsusf_usmc_marpat_wd_stinger","B_T_ghillie_tna_F","rhsusf_usmc_lar_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","B_soldier_LAT2_F"], //crew first //in arma civillian can not have weapon...
																	["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};
if (worldName == "vt7") then {//Virolahti
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_NIA.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										WMS_AI_MaxUnits_A 			= 125;
										WMS_AI_MaxUnits_B 			= 140;
										WMS_AI_MaxUnits_C 			= 155;
										WMS_FastNight_Morning 		= 4; //morning start at
										WMS_FastNight_Evening		= 17; //evening start at
										WMS_Forests_Size			= 350;
										WMS_Pos_Forests 			= [
											[2938.9,16247.5,0],[1414.13,16136.1,0],[1223.95,13935.5,0],[2799.67,14297.7,0],[5262.86,15610.8,0],[7155.53,15438.8,0],[6476.34,17313.3,0],[8043,14506,0],[8568.24,13401.2,0],[4601.78,12848.8,0],
											[3053.23,12332.6,0],[11303.1,14868.3,0],[8704.07,16353.4,0],[13268.2,15493.1,0],[13621.4,16579.8,0],[16853,16776.4,0],[6371.5,10688.3,0],[9776.98,12182.2,0],[12721.6,12673.5,0],[13520.1,13607.6,0],[17533.4,16544.9,0],
											[15626.8,15464.8,0],[4569.09,14421.6,0],[4092.52,15570.7,0],[6108.15,14932.4,0],[3484.54,10293.7,0],[2226.74,10908.7,0],[511.025,7630.07,0],[1152.18,9291.61,0],[4342.34,8404.16,0],[3071.75,6820.81,0],[1550.95,5980.26,0],
											[2190.34,5497.52,0],[941.116,4474.68,0],[302.865,3484.57,0],[1936.68,1826.21,0],[1996.69,2529.92,0],[5874.02,3076.52,0],[8867.13,2567.89,0],[9584.43,2166.2,0],[8067.13,3042.16,0],[7891.6,3977.18,0],[6814.8,4598.28,0],
											[5041.22,5098.69,0],[5026.94,6091.26,0],[4805.95,7241.29,0],[2836.7,8862.54,0],[10235.6,3970.29,0],[8703.75,4682,0],[13398.2,3968.14,0],[13430.9,4911.88,0],[11911.6,4928.24,0],[10430.8,5711.84,0],[15681.6,5066.58,0],[16437,5747.46,0],
											[12164.7,5833.17,0],[6669.96,6324.18,0],[8484,8491.08,0],[5646.15,8436.41,0],[7445.27,10379.7,0],[5596.45,11980,0],[12414.8,9474.6,0],[11390.1,10767.9,0],[13220.8,10868.1,0],[14555.1,11505.7,0],[14591.6,9570.23,0],[12060.9,17074.5,0]]; //not autoScan
										WMS_Pos_Military 			= [
											[15071,15086.9,0],[12198.9,13637.4,0],[6799.99,12921.8,0],[2427.68,12685,0],[4258.66,10853,0],[11278.5,10717,0],[14393.6,12503.3,0],[13066.4,9554.33,0],[14684.7,5967.07,0],[11763.5,5187.08,0],[9857.09,5886.74,0],
											[7571.06,705.581,0],[7810.61,354.346],[7531.29,457.565],//south island
											[923.902,2943.37,0], //south airfield
											[15466.4,16531.4,0], ///north airport
											[6939.98,13718.8,0], //East, west trader
											[2087.81,12119.9,0], //West, west trader
											[5609.35,9424.69,0] //Harju spawn
											]; //not autoScan //need enough space to land a chopper 
										WMS_Pos_Factory 			= [
											[13943.6,10132.8,0],[13295.2,10015,0],[14489,10349,0],[14357.1,10383.8,0],[14073.8,10825.4,0],[16753.7,16028.8,0],[14912.2,15199.6,0],[14934.6,14857.9,0],[14881.9,14735,0],[14959,14774.7,0],[15124.9,14710.6,0],
											[14881.4,14288.7,0],[14947.6,14268.1,0],[14176.3,13308.4,0],[11816.6,16238.3,0],[9031.96,16278.3,0],[1091.76,16799.3,0],[508.657,17014.5,0],[1746.47,14588.8,0],[1549.74,14219.6,0],[2195.8,13173.4,0],
											[2280.82,13346.6,0],[2854.95,8605.62,0],[2537.71,6070.17,0],[2419.16,5931.3,0],[10339.9,4397.68,0],[10612,4471.48,0],[16608.4,4337.14,0],[16422,4631.91,0],[16067.9,6868.46,0],[16119.9,6892.46,0],[14843.2,7495.46,0],
											[14822.1,7524.21,0],[14570.7,8164.03,0],[14558.8,8188.58,0],[13562.8,8050.69,0],[6331.21,8767.65,0],[6250.71,8766.52,0],[10850.3,13084.9,0],[10886.2,13207,0],[11008.2,13088.4,0],[11032,12969.7,0],[10759.9,13191.7,0],
											[10780.6,13151.7,0],[11003.4,13220.6,0],[11022,12633.7,0],[1098.07,2026.85,0]];	
										WMS_AI_Attachements			= ["acc_flashlight","acc_pointer_IR","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_sc","rhsusf_acc_anpeq15_bk_top_h","rhsusf_acc_anpeq15_wmx_h","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_light_top_sc","rhsusf_acc_anpeq16a_top"];
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Humanicrate 			= "CargoNet_01_box_F"; //"CargoNet_01_box_F"
										WMS_CamoNet_Small 			= "CamoNet_wdl_F";
										WMS_CamoNet_Open 			= "CamoNet_wdl_open_F";
										WMS_CamoNet_Big 			= "CamoNet_wdl_big_F";
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_DynAI_GunshipLight 		= ["rhs_uh1h_hidf",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipMedium 	= ["rhs_uh1h_hidf",["hidf_tan",1],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",["hidf_tan",1],[[],[]]];
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_DynAI_DestroyVHL 		= 40;
										WMS_AMS_ToRun 				= 3;
										WMS_AMS_remRPG 				= 90;
										WMS_AMS_SpnDistMission 		= 2500; //minimum distance from another mission to spawn a mission
										WMS_AMS_CustomPosFact		= ["factory"]; //"factory","random" //used to spawn "Factory Sales"
										WMS_AMS_CustomPos			= ["forest"];//["forest","forest","forest","random"];
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										WMS_AI_Arty					= "rhs_2b14_82mm_msv";
										WMS_AMS_MineAT 				= ["rhsusf_mine_M19","ATMine","rhs_mine_TM43"];//"gm_minestatic_at_ptm3"
										WMS_ATMines					= ["rhsusf_mine_M19","ATMine","rhs_mine_TM43"]; //"ATMine";"BWA3_DM31AT";
										WMS_RunnerTypes				= ["ClaymoreDirectionalMine_Remote_Ammo_Scripted","SatchelCharge_Remote_Ammo_Scripted","rhs_ammo_3of69m","rhs_ammo_fab500_m54"];//["mine","satchel","shell","bomb"]
										WMS_AI_RoamingVHL_remRPG 	= false;
										WMS_AI_Para_remRPG 			= true;
										WMS_AI_INFpatrol_remRPG 	= false;
										WMS_DynAI_remRPG 			= false;
										WMS_AMS_ClnObj 				= false;
										WMS_AL_VhlBalance			= [2,1,0,1,1,0,2,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										//DFO
										WMS_DFO_Choppers			= [["vtx_MH60M_DAP","vtx_MH60M_DAP_MLASS"],["vtx_HH60","vtx_MH60M","vtx_UH60M"],["B_Heli_Transport_03_unarmed_F","vtx_UH60M_SLICK"],["vtx_UH60M_MEDEVAC"]];//Hatchet
										WMS_DFO_NPCvehicles			= [//[[AIR_HEAVY],[AIR_LIGHT],[AIR_UNARMED],[HEAVY],[APC],[LIGHT],[UNARMED],[CIV],[STATICS],["BOATS"]]
																	["RHS_Ka52_vvsc","RHS_Mi24V_vvsc","RHS_Mi8MTV3_vvsc"],
																	["RHS_Mi24Vt_vvsc","RHS_Mi8mt_vvsc"],
																	["rhs_ka60_c","RHS_Mi8T_vvsc"],
																	["rhsgref_ins_zsu234","rhsgref_ins_t72bb","rhsgref_ins_bmp2e","rhsgref_ins_2s1_at","rhs_t80ue1"],//AA first
																	["rhsgref_ins_ural_Zu23","rhsgref_ins_btr70","rhsgref_ins_btr60","rhsgref_BRDM2_ins","rhs_btr80a_msv"],//"AA" first
																	["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_spg9","O_LSV_02_armed_F","O_G_Offroad_01_armed_F","rhs_tigr_sts_3camo_vmf"],
																	["rhsgref_ins_uaz_open","rhsgref_ins_gaz66","rhsgref_ins_ural","rhsgref_ins_zil131_open","rhs_tigr_m_3camo_vmf"],
																	["C_Hatchback_01_F","C_Offroad_02_unarmed_F","C_Van_02_medevac_F","C_Truck_02_transport_F"],
																	["rhsgref_ins_ZU23","rhsgref_ins_Igla_AA_pod","rhsgref_ins_DSHKM","rhs_KORD_high_VDV"],//AA first
																	["O_T_Boat_Armed_01_hmg_F"]];
										WMS_DFO_NPCs				= [ //[[OPFOR],[CIV_SOLDIER],[CIV]] //mainly for standalone version
																	["rhs_vdv_combatcrew","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_medic","rhs_mvd_izlom_arifleman_rpk","rhs_mvd_izlom_machinegunner","rhs_vdv_efreitor","rhs_vdv_rifleman","rhs_vdv_grenadier"], //"O_Soldier_AA_F", no AA for now, it's pain in the ass for debugging //crew first //AA second
																	["B_W_Helicrew_F","rhsusf_socom_swcc_crewman","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_jtac","rhsusf_usmc_marpat_wd_stinger","B_T_ghillie_tna_F","rhsusf_usmc_lar_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","B_soldier_LAT2_F"], //crew first //in arma civillian can not have weapon...
																	["C_Man_Paramedic_01_F","C_Man_UtilityWorker_01_F","C_journalist_F","C_Man_Fisherman_01_F","C_man_polo_1_F","C_Man_casual_1_F_afro_sick"]];
										WMS_CaptureZone_Vhl			= [ //[air],[gnd]
																		["rhs_mi28n_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Ka52_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8AMTSh_vvsc"],
																		["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72bb_tv","rhs_t72bd_tv","rhs_t80bvk","rhs_t90am_tv","rhs_bmd1r","rhs_bmd2","rhs_bmd4m_vdv","rhs_bmp1k_vdv","rhs_bmp2_vdv"]
																	];
										WMS_JudgementDay_Drop 		= [ //because otherwhise that wont be fun, custom rain object at each wave
																		["SmokeShellRed","Chemlight_blue","Land_HumanSkull_F"], //wave 1 & 2
																		["SmokeShellRed","rhs_ammo_nspn_red","rhs_ammo_fakels"], //wave 3 & 4
																		["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_an_m14_th3 ","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 5 & 6
																		["rhs_ammo_an_m14_th3","rhs_rpg7v2_type63_airburst","rhs_ammo_m397","rhs_rpg7v2_type63_airburst"], //wave 7 & 8
																		["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","rhs_ammo_fab500_m54","Bo_Mk82"] //wave 9 & 10
																	];
										};

if (worldName == "Malden") then {	//VERY OUTDATED
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_Vanilla.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_Vanilla.sqf";
										WMS_IP_Extract_Alt 			= 150;
										WMS_C130_Altitude 			= 200;
										WMS_Pos_Forests 			= [[6641.14,5438.44,0],[7677.63,4397.54,0],[9532.81,3773.76,0],[5359.17,3179.15,0],[4288.83,2440.78,0],[5024.37,4920.24,0],[4240.45,3952.49,0],[4667.78,4734.19,0],[2544.42,3975.66,0],[2849.36,4839.3,0],[2887.26,5244.03,0],[3448.67,5544.87,0],[4408.6,9561.49,0],[6695.16,9544.73,0],[7053.38,9671.02,0]]; //not autoScan									
										//WMS_Pos_Military 			= [];
										//WMS_Pos_Factory 			= [];
										WMS_Forests_Size			= 200; //small forest on Malden
										WMS_SupplyDropCount 		= 1;
										WMS_AMS_ToRun 				= 3;
										WMS_HeliCrashCount 			= 4;
										WMS_AI_RoamingVHLcount 		= 12; //10
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_AI_HMG_Scope 			= WMS_AI_HMG;
										WMS_RandomStartTime 		= false;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 19; //evening start at
										WMS_FastNight_Day 			= 30;  //time speed
										WMS_FastNight_Night 		= 5;  //time speed
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AMS_CustomPos			= ["random"];
									};
if (worldName == "tem_kujari") then {	//OUTDATED //I used Kujari as Custom Armored combat server so the roaming AI drives Tanks, not quadbikes ^^
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","BWA3_PzF3_Tandem_Loaded","BWA3_Bunkerfaust_Loaded","BWA3_RGW90_Loaded"],["rhs_weap_igla"],["launch_O_Titan_short_F"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["BWA3_PzF3_Tandem_Loaded","BWA3_Bunkerfaust_Loaded","BWA3_RGW90_Loaded"],["R3F_STINGER"],["R3F_ERYX"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","BWA3_DM51A1","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000]]
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Humanicrate 			= "R3F_WeaponStock"; //"CargoNet_01_box_F"
										WMS_AI_Units_Class 			= ["C_man_p_fugitive_F_afro"]	;
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_RandomStart_Hour 		= 5;
										WMS_RandomStart_Random 		= 6;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 33;
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_AI_CargoUnits	 		= 1; //2
										WMS_AI_RoamingVHL_MaxKick	= 5; // 8 //_vhl setVariable ["WMS_KickVehAss",0,true];
										WMS_AMS_ClnObj 				= false;
										WMS_SupplyDrop 				= true;
										WMS_DynAI_LauncherChance 	= 50;
										WMS_AMS_LauncherChance		= 50;
										WMS_Pos_Forests 			= [[5169.4409,4805.3608,0],[5833.5952,4947.6152,0],[3803.8057,5646.3115,0],[4543.3008,5314.8135,0],[6200.7935,5641.2129,0],[7357.2744,5270.3018,0],[7529.7798,6069.5811,0],[9185.8398,5155.2979,0],[10703.894,5391.0547,0],[12348.45,4643.5283,0],[13308.734,3873.001,0],[13774.503,4603.2773,0],[14665.786,5000.0391,0],[15470.813,5195.5479,0],[15522.565,4534.2725,0],[15844.577,5770.5674,0],[13555.997,6840.1055,0],[12474.958,6874.6074,0],[12934.973,7346.123,0],[12417.456,8007.3965,0],[11319.168,8064.8994,0],[11411.17,8668.6709,0],[12653.217,8754.9238,0],[15719.964,6402.3535,0],[15742.306,7112.3252,0],[14192.442,8938.7451,0],[13611.777,9822.3623,0],[14564.823,10175.81,0],[13722.229,10702.825,0],[13086.508,10387.434,0],[14073.407,11350.262,0],[15668.838,11600.388,0],[13605.908,13513.137,0],[14029.071,13056.632,0],[14359.911,12058.986,0],[11168.805,13727.291,0],[10479.681,10723.533,0],[8354.6631,8978.6475,0],[9140.7305,7321.1787,0],[13406.425,6023.4473,0],[15039.49,3614.5586,0],[12217.949,11967.743,0],[13175.075,13028.97,0],[11625.164,13002.945,0],[16195.919,4679.8916,0]]; //not autoScan
										//ARMORED SERVER
										AMS_ArmoredServer = true;
									};

if (worldName == "xcam_taunus") then {//OUTDATED	//NOTE THAT TAUNUS IS VERY LAGGY SERVER<>CLIENT
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_WaterSource				= "Land_Jbad_Misc_Well_C";
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_Planes				= ["RHS_AN2","RHS_AN2","RHS_AN2"];//heavy, medium, light //GNT_C185F spawn on the ground //sab_C130_J_C
										WMS_AI_grenades 			= ["HandGrenade","MiniGrenade","rhs_mag_rgd5","SmokeShellRed","rhs_mag_m67","rhs_mag_m7a3_cs","rhs_mag_mk3a2","rhs_mag_an_m14_th3",
																		"rhs_grenade_m1939e_f_mag","rhs_grenade_sthgr43_heerfrag_mag","rhs_grenade_sthgr43_SSfrag_mag","rhs_grenade_m15_mag","ACE_M14",
																		"ACE_CTS9","ACE_M84","rhs_grenade_mkii_mag","rhs_grenade_mkiiia1_mag","rhs_mag_plamyam","rhs_mag_rgo","rhs_grenade_khattabka_vog17_mag","rhs_grenade_khattabka_vog25_mag"];
										WMS_BombList 				= ["rhs_ammo_rbk500_ofab50", "Bo_GBU12_LGB", "Bomb_03_F", "Bomb_04_F", "ammo_Bomb_SDB", "rhs_ammo_fab500_m54", "Bo_Mk82"]; //DynAI bombing is (select 0)										
										WMS_DynAI_EODBombs 			= ["Bomb_04_F","Bomb_03_F","rhs_ammo_kab500","rhs_ammo_fab500_m54"];
										WMS_DynAI_RainObjects 		= [["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]; //Rain Objects [[<1000rep],[1000 to 25000],[25000 to 75000],[> 75000],[reinforcementpunisher]]
										WMS_AI_RdoTruck 			= "rhs_gaz66_r142_vdv";
										WMS_AI_ATstation 			= "rhs_D30_at_msv"; //roadBlock
										WMS_AI_AAstation 			= "RHS_ZU23_VDV"; //AA battery
										WMS_AMS_Crate_noMove 		= "rhs_weapon_crate"; //"CargoNet_01_box_F"
										WMS_Pos_Forests 			= [[6833.19,9802.74,0],[8804.01,9730.42,0],[6214.59,8088.38,0],[2854.98,2115.75,0],[949.651,1537.96,0],[11489.9,2516.1,0],[19761.5,1499.38,0],[18469.5,386.97,0],[15863.5,4790.41,0],[19707.2,5582.24,0],
																	[18049.8,6338.81,0],[19418.7,10198.6,0],[19623.9,12904.3,0],[19339.6,14480,0],[16092.2,15650.1,0],[17297.5,16506.1,0],[19326.8,16752.9,0],[17957.9,18686,0],[15256.2,16848.3,0],[12601.8,15085.1,0],[12015.2,18608.3,0],
																	[10357.8,18098.6,0],[10546.9,19547.6,0],[13525.1,20028.5,0],[8514.42,19954.8,0],[6238.3,18400,0],[6209.45,19688.7,0],[9019.62,17040.9,0],[7644.34,14918.7,0],[6150.43,15938.1,0],[2938.22,17505.8,0],[3569.77,19939,0],
																	[777.516,19717.8,0],[787.134,17409.6,0],[3428.71,16181.8,0],[1780.93,15694.5,0],[3819.82,13809.5,0],[3428.71,12629.7,0],[3015.16,11004.4,0],[4662.94,11664.8,0],[2149.6,8148.02,0],[3572.97,9564.99,0],[5239.99,6984.32,0],
																	[1899.55,6070.66,0],[2245.77,4653.7,0],[9949.27,11326.9,0],[9324.14,13394.6,0],[8131.58,11298,0],[10080.2,7420.58,0],[12636.9,8435.69,0],[8709.92,5077.99,0],[8213.02,4029.69,0],[14701.2,8387.13,0],[14848.8,12259.3,0],
																	[11754.6,9992.2,0],[11232.6,13326,0]]; //not autoScan
										WMS_Pos_Military 			= [[9060.47,19349.3],[4871.25,13179],[14168.3,12272.3],[10390.4,3584.51],[19005.3,18957.6],
																	[17242.1,4856.92,0],[18529.8,5246.4,0],[19699.1,6147.35,0],[19727.8,6418.58,0],[19165.4,6358.27,0],[19258.1,7856.46,0],[3122.5,11432.2,0],[9856.18,12699.8,0]]; //not autoScan //need enough space to land a chopper //Pyrgos military, south Zaros, south airfield, NE Agios Georgios, NO Frini, E stavros, SO Zeloran,
										WMS_Pos_Factory 			= [[6899.64,1535.22,0],[6930.92,1568.09,0],[13006.2,762.41,0],[12966.9,684.222,0],[14245.8,1187.19,0],[14236,1231.4,0],[19447.7,389.167,0],[18462.3,2903.24,0],[18540.6,2942.46,0],[18133.4,2512.56,0],
																	[18168.9,2530.49,0],[18726.5,3620.12,0],[18688.8,3612.12,0],[18638,5457.56,0],[18579.4,5506.19,0],[18666.7,5567.18,0],[16476.4,5809.55,0],[16570.7,5754.54,0],[18203.5,8922.47,0],[18260.6,9036.45,0],[18004.1,10212.6,0],
																	[18032.9,10175.6,0],[19437.8,11119.1,0],[19489,11071.6,0],[19536.4,11121.3,0],[17518.6,11785.8,0],[17525.4,11816.3,0],[15579.3,18320.2,0],[15473,18272.4,0],[15492.2,18356.7,0],[15959.5,18377.6,0],[15971.7,18383.6,0],
																	[13954,17525.6,0],[15483.4,15892.2,0],[12661.3,16317.4,0],[12714.5,17047.5,0],[14473.9,19349.6,0],[14485.3,19300.1,0],[11528.6,18439.7,0],[11535.3,18455.3,0],[9266.8,19226.6,0],[9236.21,19270.6,0],[8093.15,17954.1,0],
																	[8068.06,18025.2,0],[4267.54,20224,0],[4325.61,20148.9,0],[2409.07,20100.8,0],[2390.68,20076.8,0],[916.996,19296.4,0],[956.071,19303.1,0],[1211.6,14720.4,0],[1208.39,14797.2,0],[3830.66,5408.97,0],[3841.21,5519.04,0],
																	[2431.11,1339.67,0],[4435.89,13189.7,0],[4273.26,13210.2,0],[6383.18,15115.5,0],[6362.06,15185.6,0],[9976.94,16053.4,0],[9958.77,16071.3,0],[15739.6,12919,0],[15674.8,12924.8,0],[10113.5,5381.05,0],[13120.6,4742.75,0],
																	[13169.7,4769.09,0],[14030.6,10548.2,0],[14124.9,10577.9,0]]; //need room for small camoNet
										WMS_AMS_CustomPos			= ["forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales
										};
//ARMORED SERVER
if (AMS_ArmoredServer)then {
	[]spawn {
		uisleep 3;
	if (true) then {diag_log format ["[WMS Custom Map Config]|WAK|TNA|WMS| ArmoredServer vehicle config %1", servertime]};
	WMS_OPFOR_CustomVHL_Unarmed = [
		["rhs_tigr_m_3camo_msv",[],[[],[]]],
		["rhsusf_M1238A1_socom_d",[],[[],[]]],
		["rhsusf_M1239_socom_d",[],[[],[]]],
		["rhsusf_m998_d_4dr_fulltop",[],[[],[]]],
		["rhsusf_m1025_d",[],[[],[]]],
		["rhsusf_m1151_usarmy_d",[],[[],[]]],
		["rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",[],[[],[]]],
		["rhsusf_M1084A1P2_B_D_fmtv_usarmy",[],[[],[]]],
		["rhsusf_M1083A1P2_B_D_fmtv_usarmy",[],[[],[]]],
		["rhsusf_M1232_usarmy_d",[],[[],[]]],
		["rhsusf_M1078A1P2_B_D_fmtv_usarmy",[],[[],[]]],
		["rhs_uaz_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\uaz_main_ind_co.paa"],[[],[]]], //
		["rhs_gaz66_ammo_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
		["rhsusf_m1240a1_usarmy_d",[],[[],[]]]
	];
	WMS_OPFOR_CustomVHL_Armed = [	
		["rhsusf_m1165a1_gmv_m134d_m240_socom_d",[],[[],[]]],
		["I_C_Offroad_02_LMG_F",[],[[],[]]],
		["rhsusf_m1151_m240_v2_usarmy_d",[],[[],[]]],
		["O_G_Offroad_01_armed_F",[],[[],[]]],
		["O_G_Offroad_01_AT_F",[],[[],[]]],
		["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",[],[[],[]]],
		["rhsusf_m1240a1_m240_uik_usarmy_d",[],[[],[]]],
		//["rhsusf_m1240a1_m2_uik_usarmy_d",[],[[],[]]],
		//["rhsusf_M1232_M2_usarmy_d",[],[[],[]]],
		["rhsusf_m113d_usarmy",[],[[],[]]],
		["rhsusf_m113d_usarmy_supply",[],[[],[]]],
		["B_APC_Wheeled_01_cannon_F",[],[[],[]]],
		["RHS_M2A2",[],[[],[]]],
		["RHS_M2A3_BUSKIII",[],[[],[]]],
		["rhsusf_m1a1aimd_usarmy",[],[[],[]]],
		["rhsusf_m1a2sep1tuskiid_usarmy",[],[[],[]]],
		["rhs_btr70_msv", ["rhs_sand",1],[[],[]]],
		["rhs_btr80a_msv", ["rhs_sand",1],[[],[]]],
		["rhs_bmd1k", ["Camo1",1],[[],[]]],
		["rhs_bmd2m", ["Camo2",1],[[],[]]],
		["rhs_brm1k_vdv", ["rhs_sand",1],[[],[]]],
		["rhs_bmp2e_vdv", ["rhs_sand",1],[[],[]]],
		["rhs_t72ba_tv", ["rhs_sand",1],[[],[]]],
		["rhs_t72bb_tv", ["rhs_sand",1],[[],[]]],
		["rhs_t90_tv", ["rhs_sand",1],[[],[]]],
		["rhs_t90sab_tv", ["rhs_sand",1],[[],[]]],
		["rhs_t80u45m", ["tricolor",1],[[],[]]],
		["rhs_t80ue1", ["tricolor",1],[[],[]]],
		["rhs_btr60_vv", ["3tone",1],[[],[]]]
	];
	};
};
//////////
if (isdedicated && WMS_AMS_CleanMapObj && WMS_AMS_ForceRadius && WMS_AMS_CanSelect)then {
	if (true) then {diag_log format ["[WMS_CustomMapsSettings]|WAK|TNA|WMS| Starting pre_selection of AMS Positions at %1", servertime]};
	_preSelectPosBlackList = [];
	_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
	for "_i" from 1 to 30 do
	{
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), WMS_AMS_DefRad, 0, WMS_AMS_MaxGrad, 0, _preSelectPosBlackList+_blackList, [([] call BIS_fnc_randomPos),[]],100] call WMS_fnc_BIS_findSafePosModified;
		if ((count _pos) == 2 && (((_pos select 0) + (_pos select 1)) != 0)) then {
			WMS_AMS_preSelectPos pushBack _pos;
			_preSelectPosBlackList pushBack [_pos,(WMS_AMS_SpnDistMission*1.5)]; //blacklist works much better with a radius of exclusion
			};
	};
	WMS_AMS_CanSelect = false;//to prevent server to "re-select" position if FastCombat change from true to false
	if (true) then {diag_log format ["[WMS_CustomMapsSettings]|WAK|TNA|WMS| Pre_selection of AMS Positions DONE at %1, %2 positions", servertime, count WMS_AMS_preSelectPos]};
};