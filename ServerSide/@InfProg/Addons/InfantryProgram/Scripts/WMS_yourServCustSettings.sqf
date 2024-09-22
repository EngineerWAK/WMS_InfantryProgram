/**
* WMS_yourServCustSettings.sqf
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2023 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//I will (almost) never  update this file, use it to keep your own variables config like in WMS_customMapsSettings (which I update sometimes)

/*	
WMS_DynamicFlightOps		= false/true; //Won't work here
WMS_AmbientLife				= false/true; //Won't work here
WMS_exileFireAndForget 		= false/true; //Won't work here
*/

//for exemple, for you Paul or others who use AI skills modifier mods, well, you don't need, you can set it here, extremly low aiming accuracy, change the 3rd data in the arrays:
/*
			   //skills = "spotDistance","spotTime","AIMINGACCURACY","aimingShake","aimingSpeed","reloadSpeed","courage","commanding","general"
WMS_AMS_skillsMin 		= [0.1, 0.1, 0.005, 0.1, 0.1, 0.1, 0, 0.1, 0.1]; //MINIMUM skill mission NPCs can have //will be used to compile custom skills
WMS_AMS_skillsMax 		= [1, 0.85, 0.008, 0.7, 0.8, 0.8, 0, 1, 0.85]; //MAXIMUM skill mission NPCs can have //will be used to compile custom skills
WMS_AMS_skilleasy 		= [0.80, 0.8, 0.005, 0.3, 0.2, 0.6, 0, 0.6, 0.6];
WMS_AMS_skillmoderate 	= [0.85, 0.9, 0.006, 0.4, 0.3, 0.6, 0, 0.6, 0.8];
WMS_AMS_skilldifficult 	= [0.90, 0.95, 0.007, 0.5, 0.4, 0.8, 0, 0.8, 1];
WMS_AMS_skillhardcore 	= [0.95, 1, 0.008, 0.6, 0.5, 1, 0, 1, 1];
WMS_AMS_skillstatic 	= [0.9, 0.9, 0.005, 0.25, 0.2, 0.5, 0, 0.2, 0.6]; //what ever you do, Statics destroy your ass... this skill is apply on the NPC when he get on the static (EH "getin")
WMS_AMS_skillsniper 	= [1,0.95,0.9,0.9];  //hardcore level, easy = -0.15, moderate = -0.1, difficult = -0.05 //"spotDistance","spotTime","aimingAccuracy","aimingShake"
*/
/////////////////////////////////////////////////////
//THIS IS TNA/WMS CUSTOM CONFIG FOR ALTIS_SOG_SPECIAL, it will override the Altis customConfig in WMS_customMapsSettings.sqf if (missionName == "TheLastCartridges_SOG_Special")
/////////////////////////////////////////////////////
/*
if (worldName == "Altis") then {	
									if (missionName == "TheLastCartridges_SOG_Special") then { //ALL OF THIS SHOULD GO HERE to keep things cleaner
										//Those lists are already filtered in WMS_customMapssettings.sqf
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_SOG.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_Crates_ACE_RHS_SOG.sqf";
										{WMS_Pos_Military pushback _x} forEach [[23939,17509.2,0],[17718.4,17304.2,0],[15140.5,18271.9,0],[16197.4,10516.7,0],[16724.5,13554.5,0],[7345.62,17853.7,0]];//static missions flags
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
									};
};
*/