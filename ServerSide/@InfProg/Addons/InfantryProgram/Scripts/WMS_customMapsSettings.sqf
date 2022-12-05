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
if (WMS_MapName == "ruha") then {	
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										WMS_AI_MaxUnits_A 			= 120; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 140; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 160; //stop Base attack and missions
										//WMS_DynamicFlightOps		= false; //Module //DFO, for Arma "Pilots" who want to keep busy, call from a chopper or from DFO base(s)
										//WMS_AmbientLife				= true;
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
										WMS_AL_UnitMax				= 10; //Max units (groups if _CombatBehav true) patroling at the same time
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
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
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 2; //with all the reinforcement and vehicles crew, 3 missions it's a lot
										WMS_AMS_CustomPos			= ["forest","forest","forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
										//WMS_AI_HMG_Scope 			= "O_HMG_01_high_F";
										//WMS_AI_HMG_Shield			= "B_G_HMG_02_high_F";
										WMS_AI_Arty					= "rhs_2b14_82mm_msv";
										//WMS_AI_GMG 					= "O_GMG_01_high_F"; //AMS AA battery //"RHS_ZU23_VDV"
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_AI_RoamingVHLcount 		= 12; //10
										WMS_AI_CargoUnits	 		= 4;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_FastNight_Morning 		= 4; //morning start at
										WMS_FastNight_Evening		= 18.5; //evening start at
										WMS_FastNight_Night 		= 20;  //time speed
										WMS_DynAI_DestroyVHL 		= 40;
										WMS_trig_Glob_CoolD 		= 240;
										WMS_Forests_CoolD			= 1200;
										WMS_Military_CoolD			= 240;
										//Let's make it more challenging on Ruha //FastCombat	
										WMS_FastCombat 				= true;
										};
if (WMS_MapName == "Lythium") then {	
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
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
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
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_AMS_ToRun 				= 4;
										WMS_AMS_CustomPos			= ["forest","forest","random"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										WMS_AMS_SpnDistMission 		= 3500;
										WMS_AI_RoamingVHLcount 		= 18; //10
										WMS_AI_CargoUnits	 		= 2;
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
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
										AMS_ArmoredServer = true;
										};
if (WMS_MapName == "gm_weferlingen_summer") then {
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
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_ToRun 				= 4;
										WMS_Forests_Size			= 500;
										WMS_para_small				= "rhs_d6_Parachute";
										WMS_DynAI_GunshipLight 		= ["rhs_uh1h_hidf",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipMedium 	= ["RHS_UH60M_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										WMS_DynAI_GunshipHeavy 		= ["rhs_uh1h_hidf_gunship",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]];
										
										WMS_AL_VhlBalance			= [1,1,0,1,1,0,1,1]; //0 = AIR, 1 = GROUND, 2 = SEA //Random select at vehicle creation
};
if (WMS_MapName == "Altis") then {	
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										//execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										WMS_forceNoFog				= true;
										WMS_AI_MaxUnits_A 			= 130; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 150; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 170; //stop Base attack and missions
										WMS_Pos_Forests 			= [[4358.39,18767.3,0],[3681.54,18395.7,0],[2889.47,19979.5,0],[3302.02,20703.5,0],[3826.2,21799.7,0],[3956.3,21254.3,0],[5549.58,21388,0],[4228.95,22215.2,0],[6616.83,19200.7,0],[8338.43,23208.9,0],
																		[7174.29,20686.1,0],[8083.19,18882,0],[6126.05,16848.4,0],[14304.1,21952.5,0],[23865.5,22523.3,0],[23240.2,22503.7,0],[23902.9,23063.3,0],[26027.8,22565.2,0],[24065.5,15786.8,0],[11670.8,8949.45,0],[8376.4,22088.5,0]]; //not autoScan
										WMS_Pos_Military 			= [[21934.3,21008.7,0],[21736.2,20993.7,0], //GhostHotel
																		[3670.48,20122.4,0],[6861.44,21804.1,0],[10983.1,6845.54,0],[7686.66,13273.4,0],//bunkers
																		[17568.3,13279.4,0],[17504.8,13079.7,0],[17303.6,13186.6,0],// Pyrgos military [17434,13166.3,0],
																		[8302.45,10084,0],[20799.3,7245.89,0],[20949.2,19238.4,0],[14208,21222.3,0],[12465.6,15197.3,0],[16602.3,19016.5,0],
																		[08550,20900,0],[07850,16670,0],[12820,16700,0],[12300,8900,0],[13600,12220,0],[14270,13040,0],[13810,18950,0],[16010,17000,0],[18450,14280,0],[20050,06700,0],[23050,07280,0],[23050,18850,0],[23500,21140,0],[20600,20103,0]]; //not autoScan //need enough space to land a chopper //Pyrgos military, south Zaros, south airfield, NE Agios Georgios, NO Frini, E stavros, SO Zeloran,
										WMS_Pos_Factory				= [[12624.6,16335.8,0],[12576.3,16396.6,0],[15497.9,16269,0],[15290.5,16238.2,0],[14353.2,18943.3,0],[14327.6,18984,0],[7827.92,16127.6,0],[7881.8,16153.9,0],[11239,15655.3,0],[11223.7,15684.2,0],[10268.6,14808.3,0],
																		[10233.1,14854.4,0],[10127,15044.3,0],[10099.7,15078.3,0],[9523.92,15116.1,0],[9587.76,15074.3,0],[6063.43,16230.6,0],[6089.87,16273.4,0],[6239.52,16271.1,0],[6277.66,16212.6,0],[4540.3,15415.5,0],[4212.97,15020.3,0],
																		[4185.08,15045.7,0],[3771.11,12360.9,0],[3858.33,12424.7,0],[8226.51,10906.9,0],[8170.44,10916,0],[21658.9,7786.43,0],[20268.5,8793.69,0],[20242.5,8838.65,0],[20423.9,11465.3,0],[20443.1,11451.7,0],[20583.4,15646.4,0],
																		[20612.7,15621.5,0],[20748.6,15744.5,0],[20831.1,15772.1,0],[21263.6,16561,0],[25397.9,20321.5,0],[25398.3,20367.8,0],[25304.4,21808.6,0],[27022.7,21500.4,0],[27051.6,21468.6,0],[7569.19,12187.3,0],[5336.42,14472.7,0],
																		[5383.63,14519.2,0],[6366.21,14893.9,0],[6724.62,15356.9,0],[9743.92,12544.2,0],[11395.5,14261.4,0],[11459.7,14267.2,0],[5410.11,17912.6,0],[5374.12,17921.8,0],[14650.2,21387.7,0]];
										WMS_AI_LaunchersOPF 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_M136","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
										WMS_AI_LaunchersBLU 		= [["rhs_weap_rpg26","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_M136","rhs_weap_m72a7","launch_RPG7_F"],["rhs_weap_igla","rhs_weap_fim92"],["launch_O_Titan_short_F","rhs_weap_fgm148"]]; //[_rocketLauncher,[_AAMissiles],[ATMissiles]];
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
										WMS_AMS_ClnObj 				= false;
										WMS_AMS_DelMissionFlag 		= false;
										WMS_FastNight_Morning 		= 5; //morning start at
										WMS_FastNight_Evening		= 18; //evening start at
										WMS_FastNight_Night 		= 25;  //time speed
										WMS_DynAI_DestroyVHL 		= 25;
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
										};
if (WMS_MapName == "Tanoa") then {		
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_RHS.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_RHS_Hatchet.sqf";
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
										WMS_AI_RoamingVHLcount 		= 16; //10
										WMS_AMS_SpnDistMission 		= 2000;
										WMS_AMS_ClnObj 				= true;
										WMS_AMS_DelMissionFlag 		= true;
										WMS_AI_RoamingVHL_remRPG 	= true;
										WMS_AI_Para_remRPG 			= false;
										WMS_AI_INFpatrol_remRPG 	= true;
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
										};
if (WMS_MapName == "Enoch") then {		//Livonia
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
										};
if (WMS_MapName == "vt7") then {//Virolahti
										execVM "\InfantryProgram\Scripts\WMS_List_Loadout_FullMod.sqf";
										execVM "\InfantryProgram\Scripts\WMS_List_VHL_FullMod.sqf";
										WMS_AI_MaxUnits_A 			= 180; //Stop adding cargo units  //((OPFOR countSide allUnits) < WMS_AI_MaxUnits_A)
										WMS_AI_MaxUnits_B 			= 200; //stop to spawn Roaming VHL/cargo units //Stop AMS reinforce
										WMS_AI_MaxUnits_C 			= 220; //stop Base attack and missions
										WMS_FastNight_Morning 		= 4; //morning start at
										WMS_FastNight_Evening		= 17; //evening start at
										WMS_Forests_Size			= 350;
										WMS_Pos_Forests 			= [[2938.9,16247.5,0],[1414.13,16136.1,0],[1223.95,13935.5,0],[2799.67,14297.7,0],[5262.86,15610.8,0],[7155.53,15438.8,0],[6476.34,17313.3,0],[8043,14506,0],[8568.24,13401.2,0],[4601.78,12848.8,0],
										[3053.23,12332.6,0],[11303.1,14868.3,0],[8704.07,16353.4,0],[13268.2,15493.1,0],[13621.4,16579.8,0],[16853,16776.4,0],[6371.5,10688.3,0],[9776.98,12182.2,0],[12721.6,12673.5,0],[13520.1,13607.6,0],[17533.4,16544.9,0],
										[15626.8,15464.8,0],[4569.09,14421.6,0],[4092.52,15570.7,0],[6108.15,14932.4,0],[3484.54,10293.7,0],[2226.74,10908.7,0],[511.025,7630.07,0],[1152.18,9291.61,0],[4342.34,8404.16,0],[3071.75,6820.81,0],[1550.95,5980.26,0],
										[2190.34,5497.52,0],[941.116,4474.68,0],[302.865,3484.57,0],[1936.68,1826.21,0],[1996.69,2529.92,0],[5874.02,3076.52,0],[8867.13,2567.89,0],[9584.43,2166.2,0],[8067.13,3042.16,0],[7891.6,3977.18,0],[6814.8,4598.28,0],
										[5041.22,5098.69,0],[5026.94,6091.26,0],[4805.95,7241.29,0],[2836.7,8862.54,0],[10235.6,3970.29,0],[8703.75,4682,0],[13398.2,3968.14,0],[13430.9,4911.88,0],[11911.6,4928.24,0],[10430.8,5711.84,0],[15681.6,5066.58,0],[16437,5747.46,0],
										[12164.7,5833.17,0],[6669.96,6324.18,0],[8484,8491.08,0],[5646.15,8436.41,0],[7445.27,10379.7,0],[5596.45,11980,0],[12414.8,9474.6,0],[11390.1,10767.9,0],[13220.8,10868.1,0],[14555.1,11505.7,0],[14591.6,9570.23,0],[12060.9,17074.5,0]]; //not autoScan
										WMS_Pos_Military 			= [
											[923.902,2943.37,0], //south airfield
											[15466.4,16531.4,0], ///north airport
											[6939.98,13718.8,0], //East, west trader
											[2087.81,12119.9,0], //West, west trader
											[5609.35,9424.69,0] //Harju spawn
											]; //not autoScan //need enough space to land a chopper 
										//WMS_Pos_Factory 			= [];	
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
										WMS_AI_RoamingVHLcount 		= 15; //10
										WMS_DynAI_DestroyVHL 		= 40;
										WMS_AMS_ToRun 				= 5;
										WMS_AMS_remRPG 				= 90;
										WMS_AMS_SpnDistMission 		= 2500; //minimum distance from another mission to spawn a mission
										WMS_AMS_CustomPosFact		= ["factory"]; //used to spawn "Factory Sales"
										//WMS_AMS_CustomPos			= ["forest"];//["forest","forest","forest","random"];
										WMS_AI_HMG 					= "rhs_KORD_high_MSV";
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
										};

if (WMS_MapName == "Malden") then {	//VERY OUTDATED
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
if (WMS_MapName == "tem_kujari") then {	//OUTDATED //I used Kujari as Custom Armored combat server so the roaming AI drives Tanks, not quadbikes ^^
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
										WMS_AI_Units_Class 			= "C_man_p_fugitive_F_afro"	;
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
										WMS_OPFOR_CustomVHL_Unarmed = [
											["RHS_UAZ_MSV_01",["Camo3",1],[[],[]]],
											["rhs_uaz_open_MSV_01",["Camo3",1],[[],[]]],
											["O_G_Offroad_01_F",[],[[],[]]],
											["R3F_KAMAZ_DA_trans",[],[[],[]]],
											["R3F_KAMAZ_DA_fuel",[],[[],[]]],
											["R3F_FENNEC_DA",[],[[],[]]],
											["R3F_MATV_DA",[],[[],[]]],
											["O_Truck_03_ammo_F",[],[[],[]]],
											["O_Truck_03_repair_F",[],[[],[]]],
											["rhsusf_M977A4_REPAIR_BKIT_usarmy_d",[],[[],[]]],
											["rhsusf_M1239_socom_d",[],[[],[]]],
											["rhsusf_M1238A1_socom_d",[],[[],[]]],
											["rhsusf_m1240a1_usarmy_d",[],[[],[]]]
										];
										WMS_OPFOR_CustomVHL_Armed = [	
											["O_G_Offroad_01_armed_F",[],[[],[]]],
											["O_G_Offroad_01_AT_F",[],[[],[]]],
											["O_LSV_02_AT_F",[],[[],[]]],
											["O_T_LSV_02_AT_F",[],[[],[]]],
											["UK3CB_BAF_Jackal2_L111A1_D",[],[[],[]]],
											["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A",[],[[],[]]],
											["UK3CB_BAF_LandRover_WMIK_Milan_Sand_A",[],[[],[]]],
											["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",[],[[],[]]],
											["rhsusf_m1240a1_m240_uik_usarmy_d",[],[[],[]]],
											["rhsusf_m1240a1_m2_uik_usarmy_d",[],[[],[]]],
											["rhsusf_M1232_M2_usarmy_d",[],[[],[]]],
											["rhsusf_m113d_usarmy",[],[[],[]]],
											["rhsusf_m113d_usarmy_supply",[],[[],[]]],
											["B_APC_Wheeled_01_cannon_F",[],[[],[]]],
											//["R3F_PANDUR_DA",[],[[],[]]],
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

if (WMS_MapName == "xcam_taunus") then {//OUTDATED	//NOTE THAT TAUNUS IS VERY LAGGY SERVER<>CLIENT
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
										WMS_AMS_CustomPos			= ["forest","forest","forest"]; //used to spawn "combatPatrol" and LumberYard" in the forest but some maps doesnt have "forest" zones
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
		["rhsusf_m1240a1_m2_uik_usarmy_d",[],[[],[]]],
		["rhsusf_M1232_M2_usarmy_d",[],[[],[]]],
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