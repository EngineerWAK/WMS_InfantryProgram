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
/*
MODS LIST:
ACE3, RHSAFRF, RHSUSAF, RHSGREF, VSM National Gear Pack
*/
if !(WMS_exileFireAndForget) then {
WMS_AI_inventory = [//"AntimalaricumVaccine",//"Laptop_Unfolded",
	"gm_ge_army_medkit_80","gm_bayonet_6x3_wud","gm_suppressor_safloryt_blk","gm_c79a1_oli","gm_zfk4x25_blk","gm_explosive_petn_charge","gm_explosive_plnp_charge","gm_1rnd_67mm_heat_dm22a1_g3",//GM
	"ACE_EarPlugs","ACE_EarPlugs",
	"rhs_ec200_sand_mag","rhs_ec75_sand_mag","1Rnd_HE_Grenade_shell","rhs_rpg7_OG7V_mag","rhs_VOG25",//explo
	"Antimalaricum","Antibiotic",
	"ACE_bloodIV_250","ACE_plasmaIV_250","ACE_bloodIV_500","ACE_plasmaIV_500","ACE_salineIV_250","ACE_splint",
	"Money_bunch","Money_roll","Money_stack","Money_stack_quest",
	"Laserbatteries",
	"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05","Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05", //twice, since now there is a lot more items in the list
	"FilesSecret","FileNetworkStructure","FileTopSecret","DocumentsSecret","Wallet_ID","FlashDisk","ButaneCanister","Keys","Laptop_closed","SatPhone",
		//SOG others
	"vn_b_item_bandage_01","vn_b_item_bugjuice_01","vn_b_item_cigs_01","vn_b_item_gunoil_01","vn_b_item_lighter_01","vn_b_item_rations_01","vn_prop_med_dysentery","vn_prop_med_antibiotics","vn_prop_med_antimalaria",
	"vn_prop_med_antivenom","vn_prop_med_painkillers","vn_prop_med_wormpowder",
		/////
	//"ACE_Can_Franta","ACE_Can_RedGull","ACE_Can_Spirit","ACE_Canteen","ACE_Canteen_Empty","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Empty","ACE_WaterBottle_Half",
	//"ACE_Humanitarian_Ration","ACE_MRE_BeefStew","ACE_MRE_ChickenTikkaMasala","ACE_MRE_ChickenHerbDumplings","ACE_MRE_CreamChickenSoup","ACE_MRE_CreamTomatoSoup","ACE_MRE_LambCurry","ACE_MRE_MeatballsPasta","ACE_MRE_SteakVegetables",
	"ACE_RangeTable_82mm","ACE_artilleryTable","ACE_Chemlight_Shield","ACE_DeadManSwitch","ACE_HuntIR_monitor","ACE_IR_Strobe_Item","ACE_Flashlight_XL50","ACE_microDAGR","ACE_RangeCard","ACE_Sunflower_Seeds",
	"ACE_UAVBattery","rhsusf_acc_harris_bipod","rhsusf_acc_kac_grip","rhsusf_acc_rvg_blk","rhsusf_acc_grip3","muzzle_snds_acp","muzzle_snds_L","rhsgref_mg42_acc_AAsight","rhsusf_acc_LEUPOLDMK4_2_d",
	"vn_prop_drink_01","vn_prop_drink_02","vn_prop_drink_03","vn_prop_drink_04","vn_prop_drink_05","vn_prop_drink_06","vn_prop_drink_10",
	"vn_prop_food_meal_01_01","vn_prop_food_meal_01_02","vn_prop_food_meal_01_03","vn_prop_food_meal_01_04","vn_prop_food_meal_01_05","vn_prop_food_meal_01_06","vn_prop_food_meal_01_07",
	"vn_prop_food_meal_01_08","vn_prop_food_meal_01_09","vn_prop_food_meal_01_10","vn_prop_food_meal_01_11","vn_prop_food_meal_01_12","vn_prop_food_meal_01_13","vn_prop_food_meal_01_14",
	"vn_prop_food_meal_01_15","vn_prop_food_meal_01_16","vn_prop_food_meal_01_17","vn_prop_food_meal_01_18",
	"vn_o_item_firstaidkit","vn_b_item_medikit_01","vn_b_item_wiretap","vn_b_item_firstaidkit","vn_o_3x_l1a1","vn_o_3x_sks","vn_o_1_5x_k98k",//,"vn_b_item_trapkit" that's a freaking mine detector
	"vn_o_4x_svd","vn_o_3x_m84","vn_o_4x_m16","vn_b_type56","vn_b_m1903","vn_b_m4956","vn_s_hp","vn_s_mc10","vn_s_sten","vn_molotov_grenade_mag",
	"rhs_pdu4","ACE_Yardage450","rhsusf_bino_lrf_Vector21","ACE_Vector","I_UavTerminal","ACE_RangeCard","ACE_Flashlight_Maglite_ML300L","rhsusf_bino_m24_ARD","rhsusf_bino_leopold_mk4","rhsusf_bino_lerca_1200_black",
	"Laserdesignator_03"
	];
};

/////////////////////////////////
//			LOADOUTS - DEFAULT IS "VANILLA"
/////////////////////////////////
//Players/BLUFOR Loadouts

WMS_Loadout_AORU = [//NEW Not used yet //light green/tan camo
	[//Uniform
		"AORU_Camo_Cyre_Tee","AORU_Camo_Cyre","AORU_Camo_Cyre_GP","AORU_Camo_Cyre_GS","AORU_Camo_Cyre_TP","AORU_Camo_Cyre_TS","AORU_Camo","AORU_Camo_BDU_GP","AORU_Camo_BDU_TP","AORU_Camo_BDU",
		"AORU_GP_Camo","AORU_GS_Camo","AORU_TP_Camo","AORU_TS_Camo","AORU_Camo_SS","AORU_GP_Camo_SS","AORU_GS_Camo_SS","AORU_TP_Camo_SS","AORU_TS_Camo_SS"
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"AORU_Backpack_Compact","AORU_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_CADPAT = [//NEW Not used yet //tropic/green camo
	[//Uniform
		//"CADPAT_Camo_Cyre_TP","CADPAT_Camo_BDU_GP","CADPAT_Camo_BDU_TP","CADPAT_Camo_BDU","CADPAT_TP_Camo","CADPAT_TP_Camo_SS" //meh
		"CADPAT_Camo_Cyre_Tee","CADPAT_Camo_Cyre","CADPAT_Camo_Cyre_GP","CADPAT_Camo_Cyre_GS","CADPAT_Camo_Cyre_TS","CADPAT_Camo","CADPAT_GP_Camo","CADPAT_GS_Camo",
		"CADPAT_TS_Camo","CADPAT_Camo_SS","CADPAT_GP_Camo_SS","CADPAT_GS_Camo_SS","CADPAT_TS_Camo_SS"
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"CADPAT_Backpack_Compact","CADPAT_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_MARPAT = [//NEW Not used yet //brown/green camo
	[//Uniform
		//"MarPat_Camo_Cyre_Tee","MarPat_Camo_BDU_GP","MarPat_Camo_BDU","MarPat_TP_Camo_SS","MarPat_Camo_BDU_TP","MarPat_TP_Camo" //meh, ok for AI
		"MarPat_Camo_Cyre","MarPat_Camo_Cyre_TP","MarPat_Camo_Cyre_TS","MarPat_Camo_Cyre_GS","MarPat_Camo","MarPat_TS_Camo","MarPat_GS_Camo","MarPat_Camo_SS",
		"MarPat_Camo_Cyre_GP","MarPat_GP_Camo","MarPat_TS_Camo_SS","MarPat_GP_Camo_SS","MarPat_GS_Camo_SS"
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"MarPat_Backpack_Compact","MarPat_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_DualTex = [//NEW Not used yet //green/brown/black camo
	[//Uniform
		//"DualTex_Camo_Cyre_Tee","DualTex_Camo_BDU_GP","DualTex_Camo_BDU_TP","DualTex_Camo_BDU","DualTex_TP_Camo","DualTex_TP_Camo_SS"//meh
		"DualTex_Camo_Cyre","DualTex_Camo_Cyre_GP","DualTex_Camo_Cyre_GS","DualTex_Camo_Cyre_TP","DualTex_Camo_Cyre_TS","DualTex_Camo","DualTex_GP_Camo","DualTex_GS_Camo",
		"DualTex_TS_Camo","DualTex_Camo_SS","DualTex_GP_Camo_SS","DualTex_GS_Camo_SS","DualTex_TS_Camo_SS"
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"DualTex_Backpack_Compact","DualTex_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_M81 = [//NEW Not used yet
	[//Uniform
		//"M81_Camo_crye_Tee","M81_Camo_BDU_TP","M81_Camo_BDU_GP","M81_Camo_BDU","M81_TP_Camo","M81_TP_Camo_SS" //meh
		"M81_Camo_crye","M81_Camo_crye_TP","M81_Camo_crye_GP","M81_Camo_crye_GS","M81_TS_Camo","M81_Camo_SS","M81_Camo_crye_TS","M81_GP_Camo_SS","M81_Camo","M81_GP_Camo","M81_GS_Camo","M81_TS_Camo_SS","M81_GS_Camo_SS"
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F"//,//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"M81_Backpack_Compact","M81_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_OGA_O = [//NEW Not used yet
	[//Uniform
		"OGA_G_Camo","OGA_G_Camo_SS","OGA_GP_Camo","OGA_GP_Camo_SS","OGA_Camo_Cyre_GP","OGA_Camo_Cyre_Green" //green pants
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"OGA_G_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_OGA_T = [//NEW Not used yet
	[//Uniform
		"OGA_GS_Camo","OGA_GS_Camo_SS","OGA_Camo_Cyre","OGA_Camo_Cyre_GS","OGA_Camo","OGA_Camo_SS" //TAN pants
	],
	[//Vest
		//"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet
		"H_Booniehat_mcamo","H_Cap_tan_specops_US","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetSpecB_paint1","H_HelmetSpecB_snakeskin"//,//vanilla
		//"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F",//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"OGA_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];
WMS_Loadout_ProHon = [//NEW Not used yet
	[
		//"Project_Honor_Camo_Cyre_Tee","Project_Honor_Camo_BDU_GP","Project_Honor_Camo_BDU_TP","Project_Honor_Camo_BDU","Project_Honor_TP_Camo","Project_Honor_TP_Camo_SS" //meh
		"Project_Honor_Camo_Cyre","Project_Honor_Camo_Cyre_GP","Project_Honor_Camo_Cyre_GS","Project_Honor_Camo_Cyre_TP","Project_Honor_Camo_Cyre_TS","Project_Honor_Camo","Project_Honor_GS_Camo",
		"Project_Honor_TS_Camo","Project_Honor_TS_Camo_SS","Project_Honor_GP_Camo","Project_Honor_Camo_SS","Project_Honor_GP_Camo_SS","Project_Honor_GS_Camo_SS"
	],
	[//Vest
		
	],
	[//Helmet
		"H_MilCap_ghex_F","H_HelmetSpecO_ghex_F","H_HelmetCrew_O_ghex_F","H_HelmetLeaderO_ghex_F","H_HelmetO_ghex_F"//,//vanilla
		//"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"Project_Honor_Backpack_Compact","Project_Honor_Backpack_Kitbag"
		//"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","B_Kitbag_cbr"
	],
	[ //_googles//_facewear
		"G_Balaclava_oli"
	]
];

WMS_Loadout_M90 = [
	[
		//"M90_Camo_Cyre_Tee","M90_Camo_BDU_GP","M90_Camo_BDU_TP","M90_Camo_BDU","M90_TP_Camo","M90_TP_Camo_SS" //meh
		"M90_Camo_Cyre","M90_Camo_Cyre_GP","M90_Camo_Cyre_TP","M90_Camo_Cyre_TS","M90_Camo",
		"M90_GP_Camo","M90_GS_Camo","M90_TS_Camo","M90_Camo_SS","M90_GP_Camo_SS","M90_GS_Camo_SS","M90_TS_Camo_SS","M90_Camo_Cyre_GS"
	], //_uniforms
	 ["M90_Vest_1","M90_Vest_2","M90_Vest_3","M90_Vest_4"], //_vests
	 ["M90_Helmet1","M90_Helmet2","M90_Boonie"], //_helmets
	 ["M90_Backpack_KitBag","B_AssaultPack_rgr","B_Carryall_oli"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_Tiger = [//Tiger is also called for NPC loadouts, sometimes
	[
		//"Tiger_Camo_BDU_GP","Tiger_Camo_BDU_TP","Tiger_Camo_BDU" //meh
		"Tiger_Camo_Cyre_Tee","Tiger_Camo_Cyre","Tiger_Camo_Cyre_GP","Tiger_Camo_Cyre_GS","Tiger_Camo_Cyre_TP","Tiger_Camo_Cyre_TS","Tiger_Camo",
		"Tiger_GP_Camo","Tiger_GS_Camo","Tiger_TP_Camo","Tiger_TS_Camo","Tiger_Camo_SS","Tiger_GP_Camo_SS","Tiger_GS_Camo_SS","Tiger_TP_Camo_SS","Tiger_TS_Camo_SS"
	], //_uniforms
	 ["Tiger_Vest_1","Tiger_Vest_3","Tiger_Vest_5"], //_vests
	 ["Tiger_Helmet1","Tiger_Helmet2","Tiger_Boonie"], //_helmets
	 ["Tiger_Backpack_Compact","Tiger_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_Scorpion = [
	[
		//"Scorpion_Camo_Cyre_Tee","Scorpion_Camo_BDU_GP","Scorpion_Camo_BDU_TP","Scorpion_Camo_BDU","Scorpion_TP_Camo","Scorpion_TP_Camo_SS" //meh
		"Scorpion_Camo_Cyre","Scorpion_Camo_Cyre_GP","Scorpion_Camo_Cyre_GS","Scorpion_Camo_Cyre_TP","Scorpion_Camo_Cyre_TS","Scorpion_Camo",
		"Scorpion_GP_Camo","Scorpion_GS_Camo","Scorpion_TS_Camo","Scorpion_Camo_SS","Scorpion_GP_Camo_SS","Scorpion_GS_Camo_SS","Scorpion_TS_Camo_SS"
	], //_uniforms
	 ["Scorpion_Vest_1","Scorpion_Vest_3","Scorpion_Vest_5","Scorpion_Vest_6","Scorpion_Vest_7"], //_vests
	 ["Scorpion_Helmet1","Scorpion_Helmet2","Scorpion_Boonie"], //_helmets
	 ["Scorpion_Backpack_Compact","Scorpion_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_AOR2 = [
	[
		//"AOR2_Camo_Cyre_Tee","AOR2_Camo_BDU_GP","AOR2_Camo_BDU_TP","AOR2_Camo_BDU","AOR2_TP_Camo","AOR2_TP_Camo_SS", //meh
		"AOR2_Camo_Cyre","AOR2_Camo_Cyre_GP","AOR2_Camo_Cyre_GS","AOR2_Camo_Cyre_TP","AOR2_Camo_Cyre_TS","AOR2_Camo","AOR2_GP_Camo","AOR2_GS_Camo","AOR2_TS_Camo","AOR2_Camo_SS","AOR2_GP_Camo_SS","AOR2_GS_Camo_SS","AOR2_TS_Camo_SS"
	], //_uniforms
	["AOR2_Vest_1","AOR2_Vest_3","AOR2_Vest_5"], //_vests
	["AOR2_Helmet1","AOR2_Helmet2","AOR2_Boonie"], //_helmets
	["AOR2_Backpack_Compact","AOR2_Backpack_KitBag","B_ViperHarness_ghex_F"], //_Backpacks
	["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_UKtmp = []; //I don't use 3CB anymore //used only for player loadout in InfantryProgram
WMS_Loadout_UKwdl = []; //I don't use 3CB anymore //used only for player loadout in InfantryProgram
WMS_Loadout_FRce = []; //I don't use R3F anymore //used only for player loadout in InfantryProgram
WMS_Loadout_DEfleck = []; //I don't use BWM anymore //used only for player loadout in InfantryProgram

//////////Weapons [WMS_Loadout_Assault, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Loadout_SMG];
WMS_Loadout_Assault = [//545 556 57 58
	[ //_mainWeaps
		"gm_c7a1_blk","gm_m16a1_blk","gm_mpiak74n_brn","gm_mpiaks74n_prp","gm_mpiaks74nk_prp", //GM
		"arifle_MX_F","arifle_SPAR_01_khk_F","arifle_MXC_F","arifle_Mk20_plain_F",//NPC doesnt know how to use SDAR outside of water
		"vn_f1_smg","vn_ppsh41","vn_type64_smg","vn_mat49","vn_k50m","vn_m45","vn_mp40","vn_pps52", //SMGs
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","rhs_weap_aks74n_npz","rhs_weap_savz58v","vn_xm177_m203_camo","vn_xm177_camo","vn_m16_xm148","vn_m16_camo","vn_type56","vn_ak_01"
	],
	[], //_mainWeapsAmmo
	["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_AssaultPlus = [//66 68 762
	[
		"arifle_ARX_blk_F","arifle_Katiba_C_F","arifle_MX_Black_F","arifle_AK12_F","arifle_AK12U_F", "arifle_MSBS65_black_F","arifle_SPAR_03_blk_F",
		"vn_xm177_m203_camo","vn_xm177_camo","vn_m16_xm148","vn_m16_camo","vn_type56","vn_ak_01", //from _Assault
		"vn_kbkg","vn_l1a1_xm148","vn_l1a1_03","vn_m4956","vn_svd","vn_sks","vn_m63a_cdo","vn_m1897",
		"rhs_weap_l1a1","rhs_weap_savz58v_ris_fold","rhs_weap_ak103_npz","rhs_weap_ak104_zenitco_b33","rhs_weap_akm_zenitco01_b33","rhs_weap_mk17_STD" //RHS
		], //_mainWeaps
	[], //_mainWeapsAmmo
	["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_DMR = [
	[	
		"srifle_DMR_07_blk_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_06_hunter_F","srifle_DMR_03_F","arifle_MSBS65_Mark_black_F",
		"rhs_weap_svdp_npz","rhs_weap_sr25_ec",
		"vn_m14a1","vn_sks_gl","vn_m4956_gl","vn_l1a1_01_gl","vn_l1a1_xm148"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["rhsusf_acc_ACOG_USMC","rhsusf_acc_su230","optic_DMS"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_MG = [ //arifle_RPK12_F, LMG_Mk200_black_F
	[
		"gm_mg3_blk","gm_hmgpkm_prp","gm_lmgm62_blk","gm_rpk_wud","gm_lmgrpk_brn", //GM
		"arifle_CTARS_blk_F","arifle_RPK12_F","arifle_MX_SW_Black_F",
		"rhs_weap_fnmag","rhs_weap_m249","rhs_weap_pkp","rhs_weap_rpk74m","rhs_weap_mg42",
		"vn_dp28","vn_mg42","vn_pk","vn_rpd","vn_rpd_shorty_01","vn_l4"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	[], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_Sniper = [
	[
		"srifle_LRR_F",
		"rhs_weap_m24sws_d","rhs_weap_m40a5","rhs_weap_m38_rail","rhs_weap_t5000","rhs_weap_XM2010_d",
		"vn_k98k","vn_m1891","vn_m1903","vn_m36","vn_m38","vn_m9130","vn_vz54","vn_svd"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["optic_DMS","optic_KHS_blk","optic_AMS","optic_lrps","rhsusf_acc_M8541","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_M8541_mrds","rhsusf_acc_nxs_5522x56_md","rhsusf_acc_nxs_3515x50f1_md_sun","rhsusf_acc_M8541_low"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_SMG = [
	[
		"gm_mp2a1_blk","gm_pm63_blk",
		"rhs_weap_pp2000", "SMG_01_F", "SMG_02_F", "SMG_03C_black", "SMG_05_F", "rhsusf_weap_MP7A2","rhs_weap_m3a1","rhs_weap_savz61",
		"vn_f1_smg","vn_ppsh41","vn_izh54_shorty","vn_m3a1","vn_sten","vn_type64_smg","vn_k50m","vn_l2a3","vn_mat49","vn_m45","vn_mat49_vc","vn_mpu","vn_mp40","vn_m1928_tommy","vn_pps43","vn_vz61"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["optic_Aco_smg","optic_Holosight_smg_blk_F"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];


//removing some bulshit about Antitank vests and helmet managed by ACE
//Black: 	"H_Beret_blk","H_Cap_blk","rhsusf_hgu56p_visor_mask_black_skull","rhsgref_helmet_m1942","H_Bandanna_gry","H_Cap_usblack"
			//"V_Pocketed_black_F","V_Chestrig_blk","V_BandollierB_blk"
//brown:	"H_Booniehat_khk_hs","H_Booniehat_tan","H_Watchcap_cbr","H_Bandanna_sand","H_Bandanna_cbr","H_Cap_brn_SPECOPS"
			//"V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"
//green:	"H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_taiga","H_Watchcap_khk","H_Bandanna_khk","H_Cap_grn","H_Cap_oli"
			//"V_Chestrig_rgr","V_Chestrig_oli","V_HarnessOGL_ghex_F","V_TacVest_oli"

/*private _result = []; 
private _gun = false; 
{ 
  _result pushback uniform _x;
}forEach allUnits;
_result*/

WMS_Loadout_Multican_T = [//NEW NOT USED YET //Multicam Tan for AI
	[//Uniform
		//"vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_09_02","vn_o_uniform_pl_army_03_11"
		//"MC_Camo_Cyre_GP","MC_Camo_Cyre_GS","MC_Camo_BDU_GP","MC_GP_Camo","MC_GS_Camo","MC_GP_Camo_SS","MC_GS_Camo_SS" //some green
		"MC_Camo_Cyre_Tee","MC_Camo_Cyre","MC_Camo_Cyre_TP","MC_Camo_Cyre_TS","MC_Camo","MC_Camo_BDU_TP","MC_Camo_BDU","MC_TP_Camo","MC_TS_Camo","MC_Camo_SS","MC_TP_Camo_SS","MC_TS_Camo_SS"
	],
	[//Vest
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"
	],
	[//Helmet,"H_Bandanna_sand","H_Bandanna_cbr"
		"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"
	],
	[//Backpack
		"B_Kitbag_cbr",
		"MC_Backpack_Kitbag"
	],
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles//_facewear
];
WMS_Loadout_AOR1 = [//desert
	[//Uniform
		"vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_09_02","vn_o_uniform_pl_army_03_11",
		"AOR1_Camo_Cyre_Tee","AOR1_Camo_Cyre","AOR1_Camo_Cyre_GP","AOR1_Camo_Cyre_GS","AOR1_Camo_Cyre_TP","AOR1_Camo_Cyre_TS","AOR1_Camo","AOR1_Camo_BDU_GP","AOR1_Camo_BDU_TP","AOR1_Camo_BDU","AOR1_GP_Camo",
		"AOR1_GS_Camo","AOR1_TP_Camo","AOR1_TS_Camo","AOR1_Camo_SS","AOR1_GP_Camo_SS","AOR1_GS_Camo_SS","AOR1_TP_Camo_SS","AOR1_TS_Camo_SS"
	],
	[//Vest
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08",
		"AOR1_Vest_1","AOR1_Vest_2","AOR1_Vest_3","AOR1_Vest_4","AOR1_Vest_5"
	],
	[//Helmet,"H_Bandanna_sand","H_Bandanna_cbr"
		"vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07",
		"AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","AOR1_Boonie"
	],
	[//Backpack
		"B_Kitbag_cbr",
		"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05",
		"AOR1_Backpack_Kitbag","AOR1_Backpack_Compact"
	],
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles//_facewear
];
WMS_Loadout_MCB = [ //black
	[
		"U_O_R_Gorka_01_black_F", //vanilla
		"vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_01_01","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_mf_03_07","vn_o_uniform_vc_mf_09_07",
		"MCB_Camo_Cyre_Tee","MCB_Camo_Cyre","MCB_Camo_Cyre_GP","MCB_Camo_Cyre_GS","MCB_Camo_Cyre_TP","MCB_Camo_Cyre_TS","MCB_Camo","MCB_Camo_BDU_GP","MCB_Camo_BDU_TP",
		"MCB_Camo_BDU","MCB_GP_Camo","MCB_GS_Camo","MCB_TP_Camo","MCB_TS_Camo","MCB_Camo_SS","MCB_GP_Camo_SS","MCB_GS_Camo_SS","MCB_TP_Camo_SS","MCB_TS_Camo_SS"
	], //_uniforms
	[
		"V_PlateCarrierGL_blk","V_PlateCarrier1_blk","V_PlateCarrier2_blk","V_PlateCarrierSpec_blk","V_Chestrig_blk","V_BandollierB_blk", //vanilla
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08",
		"MCB_Vest_1","MCB_Vest_2","MCB_Vest_3","MCB_Vest_4","MCB_Vest_5","MCB_Vest_6","MCB_Vest_7"
	], //_vests
	[
		"H_Cap_blk","H_HelmetSpecO_blk","H_PASGT_basic_black_F","H_HelmetB_black","H_HelmetSpecB_blk","H_HelmetB_light_black", //vanilla
		"vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01","vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01",
		"MCB_Helmet1","MCB_Helmet1","MCB_Helmet2","MCB_Helmet1","MCB_Helmet1","MCB_Helmet2"
	], //,"rhsgref_helmet_m1942","H_Beret_blk"_helmets,"H_Bandanna_gry","MCB_Boonie"
	[
		"B_AssaultPack_blk","B_FieldPack_blk","B_LegStrapBag_black_F","B_RadioBag_01_black_F","B_TacticalPack_blk","B_ViperHarness_blk_F","B_ViperLightHarness_blk_F",//vanilla
		"MCB_Backpack_Compact","MCB_Backpack_KitBag","MCB_Backpack_KitBag"
	], //_Backpacks
	["G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles//_facewear
];
WMS_Loadout_SURPAT = [//grey green brown
	[
		//"SURPAT_Camo_Cyre_GP","SURPAT_GP_Camo","SURPAT_GP_Camo_SS" //meh, green pants
		"SURPAT_Camo_Cyre_Tee","SURPAT_Camo_Cyre","SURPAT_Camo_Cyre_TS","SURPAT_Camo_Cyre_GS","SURPAT_Camo_Cyre_TP","SURPAT_Camo","SURPAT_Camo_BDU_GP",
		"SURPAT_Camo_BDU_TP","SURPAT_Camo_BDU","SURPAT_GS_Camo","SURPAT_TP_Camo","SURPAT_TS_Camo","SURPAT_Camo_SS","SURPAT_GS_Camo_SS","SURPAT_TP_Camo_SS","SURPAT_TS_Camo_SS"
	],//Uniform
	[
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08",
		"SURPAT_Vest_1","SURPAT_Vest_2","SURPAT_Vest_3","SURPAT_Vest_4","SURPAT_Vest_5","SURPAT_Vest_6","SURPAT_Vest_7"
	],//Vest
	[
		"H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli",
		"vn_o_helmet_nva_10","vn_o_helmet_nva_09","vn_o_helmet_vc_05","vn_o_helmet_vc_04","vn_o_helmet_nva_03",
		"SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet3"
	],//Helmet,"H_Watchcap_khk","SURPAT_Boonie"
	[
		"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05",
		"SURPAT_Backpack_Compact","SURPAT_Backpack_Kitbag"
	],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles/_facewear
];
WMS_Loadout_M90d = [//desert
	[
		"vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_09_02","vn_o_uniform_pl_army_03_11",
		"M90d_Camo_Cyre_Tee","M90d_Camo_Cyre","M90d_Camo_Cyre_GP","M90d_Camo_Cyre_GS","M90d_Camo_Cyre_TP","M90d_Camo_Cyre_TS","M90d_Camo","M90d_Camo_BDU_GP","M90d_Camo_BDU_TP","M90d_Camo_BDU","M90d_GP_Camo",
		"M90d_GS_Camo","M90d_TP_Camo","M90d_TS_Camo","M90d_Camo_SS","M90d_GP_Camo_SS","M90d_GS_Camo_SS","M90d_TP_Camo_SS","M90d_TS_Camo_SS"
	], //_uniforms
	[
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08",
		"M90d_Vest_1","M90d_Vest_2","M90d_Vest_3","M90d_Vest_4"
	], //_vests
	[
		"vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07",
		"M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","vn_o_helmet_nva_03"
	], //_helmets,"H_Watchcap_cbr","M90d_Boonie""H_Bandanna_sand","H_Bandanna_cbr",
	[
		"B_AssaultPack_ocamo","B_Carryall_ocamo",
		"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05",
		"M90d_Backpack_KitBag"
	], //_Backpacks
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles/_facewear
];
WMS_Loadout_ABU = [ //grey
	[
		"vn_o_uniform_vc_01_03","vn_o_uniform_vc_03_03","vn_o_uniform_vc_05_03",
		"ABU_Camo_Cyre_Tee","ABU_Camo_Cyre","ABU_Camo_Cyre_GP","ABU_Camo_Cyre_GS","ABU_Camo_Cyre_TP","ABU_Camo_Cyre_TS","ABU_Camo","ABU_Camo_BDU_GP","ABU_Camo_BDU_TP",
		"ABU_Camo_BDU","ABU_BP_Camo","ABU_BS_Camo","ABU_GP_Camo","ABU_GS_Camo","ABU_Camo_SS","ABU_BS_Camo_SS","ABU_GP_Camo_SS","ABU_GS_Camo_SS"
	], //_uniforms
	[
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08",
		"ABU_Vest_1","ABU_Vest_2","ABU_Vest_3","ABU_Vest_4","ABU_Vest_5"
	], //_vests
	[
		"vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_nva_09","vn_o_pl_cap_02_02",
		"ABU_Helmet1","ABU_Helmet2","ABU_Helmet1","ABU_Helmet2","ABU_Boonie","ABU_Cap"
	], //_helmets,"H_Beret_blk","H_Bandanna_gry","H_Bandanna_gry"
	[
		"vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","vn_o_pack_04",
		"ABU_Backpack_Compact","ABU_Backpack_Kitbag","MCB_Backpack_Kitbag"
	], //_Backpacks
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles/_facewear
];

WMS_Loadout_Civilian = [
	["U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_Competitor","U_C_man_sport_2_F","U_C_Man_casual_3_F","U_C_Man_casual_5_F"], //_uniforms
	["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_HeadBandage_bloody_F","vn_c_conehat_02","vn_c_conehat_01"], //_helmets
	["B_FieldPack_oucamo","B_FieldPack_blk","vn_c_pack_01"], //_Backpacks
	[]  //_googles/_facewear
];
WMS_Loadout_Scientist = [ //NEED SPECIFIC STUFF !!!
	 ["U_C_CBRN_Suit_01_White_F","U_C_CBRN_Suit_01_Blue_F","rhs_uniform_cossack","U_C_Driver_1_orange","U_C_WorkerCoveralls","U_C_Uniform_Scientist_01_F"], //_uniforms
	 ["gm_dk_army_vest_m00_win","V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	 ["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_HeadBandage_bloody_F","H_Hat_Tinfoil_F","rhs_cossack_papakha","rhs_ushanka","vn_c_conehat_02","vn_c_conehat_01","vn_o_helmet_zsh3_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01"], //_helmets
	 ["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"], //_Backpacks
	 [
		"gm_gc_army_facewear_schm41m","gm_ge_facewear_m65","gm_gc_army_facewear_schm41m","gm_ge_facewear_m65",
		"G_AirPurifyingRespirator_02_black_F","G_AirPurifyingRespirator_01_F",
		"gm_ge_facewear_sunglasses","gm_gc_army_facewear_dustglasses"
		]  //_googles/_facewear
];
WMS_Loadout_Bandit = [
	[	 //_uniforms
		"U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F",
		"vn_o_uniform_nva_army_01_03","vn_o_uniform_nva_army_10_04","vn_o_uniform_nva_army_03_04","vn_o_uniform_nva_army_05_04","vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_reg_11_08","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_reg_11_09",
		"vn_o_uniform_vc_reg_11_10","vn_o_uniform_vc_reg_12_09","vn_o_uniform_vc_02_02","vn_o_uniform_vc_02_03","vn_o_uniform_vc_03_02","vn_o_uniform_vc_03_03","vn_o_uniform_vc_05_01","vn_o_uniform_vc_mf_09_07",
		"gm_xx_army_uniform_fighter_02_oli","gm_xx_army_uniform_fighter_03_blk","gm_xx_army_uniform_fighter_01_oli","gm_xx_army_uniform_fighter_04_wdl","gm_xx_army_uniform_fighter_01_m84","gm_xx_army_uniform_fighter_03_brn",
		"gm_xx_army_uniform_fighter_01_alp","gm_xx_army_uniform_fighter_02_wdl","gm_xx_army_uniform_fighter_04_grn"
	],
	[ //_vests
		"gm_dk_army_vest_m00_m84","gm_dk_army_vest_m00_m84_machinegunner","gm_gc_vest_combatvest3_str","gm_ge_vest_90_demolition_flk","gm_ge_vest_armor_90_rifleman_flk", //GM
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08","vn_o_vest_vc_01","vn_o_vest_vc_05","vn_o_vest_vc_04","vn_o_vest_vc_03","vn_o_vest_vc_02", //light vest
		"rhsgref_6b23_khaki_medic","rhsgref_6b23_ttsko_forest_rifleman","rhsgref_6b23_ttsko_mountain_rifleman","rhs_6b3_AK_2","rhs_6b3_VOG","rhs_6b23_6sh116_vog_od","rhs_6b23_engineer" //better vest
	],
	[ //_helmets
		"H_Booniehat_khk","H_Cap_headphones","H_Watchcap_khk","H_MilCap_ghex_F", //vanilla
		"H_SPE_ST_Helmet2","H_SPE_ST_Helmet3","H_SPE_GER_HelmetUtility","H_SPE_GER_HelmetCamo3_OS","H_SPE_GER_HelmetUtility_Grass_OS",//SPE
		"H_SPE_GER_HelmetUtility_Oak","H_SPE_GER_Helmet_ns_wire","H_SPE_GER_Helmet_net_painted",//SPE
		"vn_o_boonie_nva_02_02","vn_o_cap_01","vn_o_cap_02","vn_o_helmet_nva_10","vn_o_helmet_shl61_01","vn_o_helmet_nva_09","vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_vc_05","vn_o_helmet_vc_04"
	],
	[ //_Backpacks
		"B_SPE_GER_Tonister41_Frame_Full","B_SPE_GER_Tonister41_Frame","B_SPE_GER_MedicBackpack_Empty","B_SPE_GER_Tonister41_Frame_Full_ST","B_SPE_GER_A_frame_MGCan", //SPE
		"B_SPE_GER_A_frame_zeltbahn_licht","B_SPE_GER_Belt_bag_zelt_trop","B_SPE_GER_Radio","B_SPE_GER_A_frame_ST_zeltbahn","B_SPE_GER_Tonister34_canvas", //SPE
		"gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_flk","gm_ge_army_backpack_90_trp","gm_ge_army_backpack_80_oli", //GM
		"vn_o_pack_04","vn_o_pack_08","vn_o_pack_06","vn_o_pack_07","vn_o_pack_03","vn_o_pack_05","vn_o_pack_01","vn_o_pack_02"
	],
	[]  //_googles/_facewear
];
WMS_Loadout_LightWeaps = [
	[ //_mainWeaps,
		"SPE_Flammenwerfer41",//SPE
		"SPE_G43","SPE_M3_GreaseGun","SPE_MP40","SPE_Sten_Mk2","SPE_M1919A4","SPE_MG34",//SPE
	 	"gm_akm_wud","gm_c7a1_oli","gm_m16a1_blk","gm_mpiak74n_brn", //GM
		"arifle_Mk20_plain_F","arifle_TRG20_F","arifle_AKS_F","sgun_HunterShotgun_01_F",
		"vn_f1_smg","vn_ppsh41","vn_type64_smg","vn_mat49","vn_k50m","vn_m45","vn_mp40","vn_pps52", //SMGs
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","vn_xm177","vn_m16","vn_ak_01"
	],
	[], //_mainWeapsAmmo,
	["optic_Holosight","optic_ACO_grn","optic_MRCO","optic_Arco","optic_Holosight_khk_F","optic_Holosight_blk_F"], //_scopes
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_HeavyBandit = [
	[ //_uniforms
		"U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F",
		"U_I_C_Soldier_Bandit_5_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_C_E_LooterJacket_01_F",
		"U_SPE_ST_Soldier_Camo2","U_SPE_ST_Hauptsturmfuhrer","U_SPE_ST_Soldier_Camo","U_SPE_GER_LW_pilot","U_SPE_GER_Tank_crew_private", //SPE crap
		"U_SPE_ST_Mix_E44","U_SPE_ST_Mix_E44_roll","U_SPE_ST_Unterofficier_E44","U_SPE_GER_Soldier_camo","U_SPE_GER_Soldier_camo5",//SPE
		"rhsgref_uniform_reed","rhs_uniform_mvd_izlom","rhsgref_uniform_specter","rhs_uniform_vdv_emr_des","rhs_uniform_vdv_mflora","rhs_uniform_6sh122_gloves_v1","rhs_uniform_6sh122_gloves_v2","rhsgref_uniform_para_ttsko_urban","rhsgref_uniform_ttsko_mountain","rhsgref_uniform_flecktarn",
		"vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_12_02","vn_o_uniform_nva_army_02_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_dc_13_07","vn_o_uniform_nva_dc_13_08","vn_o_uniform_nva_dc_13_04","vn_o_uniform_nva_dc_13_02",
		"vn_o_uniform_nva_army_01_03","vn_o_uniform_nva_army_10_04","vn_o_uniform_nva_army_03_04","vn_o_uniform_nva_army_05_04","vn_o_uniform_pl_army_01_12","vn_o_uniform_pl_army_04_12","vn_o_uniform_pl_army_02_13","vn_o_uniform_pl_army_01_14",
		"vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_reg_11_08","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_reg_11_09","vn_o_uniform_vc_reg_11_10","vn_o_uniform_vc_reg_12_09","vn_o_uniform_vc_02_02","vn_o_uniform_vc_02_03"
	],
	[
		"gm_dk_army_vest_m00_m84","gm_dk_army_vest_m00_m84_machinegunner","gm_gc_vest_combatvest3_str","gm_ge_vest_90_demolition_flk","gm_ge_vest_armor_90_rifleman_flk", //GM
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08","vn_o_vest_vc_01","vn_o_vest_vc_05","vn_o_vest_vc_04","vn_o_vest_vc_03","vn_o_vest_vc_02", //light vest
		"rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki_sniper","rhsgref_6b23_khaki",'rhsgref_6b23_ttsko_forest','rhsgref_6b23_ttsko_mountain_nco','rhsgref_6b23_ttsko_mountain_sniper','rhsgref_6b23_ttsko_mountain', //better vest
		'rhs_6b3_R148','rhs_6b3_AK','rhs_6b3_AK_3','rhs_6b3_RPK','rhs_6b3_VOG_2','rhs_6b23_6sh92_vog','rhs_6b23_medic','rhs_6b23_rifleman','rhs_6b23_sniper', //better vest
		"rhs_6b45_mg","rhs_6b45_off","rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_light" //MUCH better vest
	],
	[	 //_helmets
		"H_SPE_ST_Helmet2","H_SPE_ST_Helmet3","H_SPE_GER_HelmetUtility","H_SPE_GER_HelmetCamo3_OS","H_SPE_GER_HelmetUtility_Grass_OS",//SPE
		"H_SPE_GER_HelmetUtility_Oak","H_SPE_GER_Helmet_ns_wire","H_SPE_GER_Helmet_net_painted",//SPE
		"vn_o_boonie_nva_02_02","vn_o_boonie_nva_02_01","vn_o_cap_01","vn_o_cap_02","vn_o_helmet_nva_10","vn_o_helmet_shl61_01","vn_o_helmet_nva_09","vn_o_helmet_tsh3_01","vn_o_helmet_zsh3_02","vn_o_helmet_nva_01",
		"vn_o_helmet_nva_03","vn_o_helmet_nva_05","vn_o_helmet_nva_08","vn_o_helmet_vc_05","vn_o_helmet_vc_04"
	],
	[ //_Backpacks
		"B_SPE_GER_Tonister41_Frame_Full","B_SPE_GER_Tonister41_Frame","B_SPE_GER_MedicBackpack_Empty","B_SPE_GER_Tonister41_Frame_Full_ST","B_SPE_GER_A_frame_MGCan", //SPE
		"B_SPE_GER_A_frame_zeltbahn_licht","B_SPE_GER_Belt_bag_zelt_trop","B_SPE_GER_Radio","B_SPE_GER_A_frame_ST_zeltbahn","B_SPE_GER_Tonister34_canvas", //SPE
		"gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_flk","gm_ge_army_backpack_90_trp","gm_ge_army_backpack_80_oli", //GM
		"vn_o_pack_04","vn_o_pack_06","vn_o_pack_07","vn_o_pack_03","vn_o_pack_05","vn_o_pack_01","vn_o_pack_02","vn_o_pack_t884_01"
	],
	[]  //_googles/_facewear
];
WMS_Weaps_HeavyBandit = [
	[ //_mainWeaps,
	"SPE_M2_Flamethrower",
	"SPE_STG44",
	"SPE_FM_24_M29",
	"SPE_M1918A2_BAR",
	"SPE_M1919A6",
	"SPE_MG42",
	"gm_rpk_wud",
	"gm_akm_wud",
	"gm_c7a1_oli",
	"gm_m16a1_blk",
	"gm_mpiak74n_brn",
	"gm_g3a3_oli",
	"gm_g3a4_oli",
	"gm_g3a3_dmr_blk",
	"gm_lmgrpk_brn",
	"gm_hmgpkm_prp",
	"gm_lmgm62_blk",
	"gm_lmgrpk74n_brn",
	"vn_m16",
	"vn_m2carbine",
	"vn_xm16e1",
	"vn_xm177e1",
	"vn_xm177_xm148",
	"vn_xm177_stock",
	"vn_l1a1_02",
	"vn_m4956",
	"vn_sks",
	"vn_vz54",
	"vn_m1891",
	"vn_m38",
	"vn_rpd_shorty_01",
	"vn_dp28",
	"vn_mg42",
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_m16a4_imod",
	"rhs_weap_mk18_KAC",
	"rhs_weap_sr25_ec_d",
	"rhs_weap_m24sws_d",
	"rhs_weap_m249",
	"rhs_weap_m38_rail",
	"rhs_weap_t5000",
	"srifle_LRR_tna_F"
	],
	[], //_mainWeapsAmmo,
	[ //_scopes
	"rhsusf_acc_M8541",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG_RMR",
	"optic_Arco_arid_F",
	"optic_Arco_AK_arid_F",
	"optic_DMS_weathered_Kir_F",
	"optic_SOS",
	"optic_LRPS",
	"optic_AMS"
	],
	["vn_m10","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_Livonia = [
	[
		"U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_F"//,
		//"VSM_CSAT_MulticamTropic_Camo","VSM_CSAT_AOR2_Camo" //VSM AIO
	], //_uniforms
	[ //_vests
		"rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_mg",
		"V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_EAF_F",
		"vn_b_vest_anzac_01","vn_b_vest_anzac_06","vn_b_vest_anzac_03","vn_b_vest_anzac_05","vn_b_vest_anzac_04","vn_b_vest_usmc_03","vn_b_vest_usmc_01","vn_b_vest_usmc_04","vn_b_vest_usarmy_14","vn_b_vest_seal_02",
		"rhs_6b3_holster","rhs_6b3_R148","rhs_6b3_AK","rhs_6b3_AK_2","rhs_6b3_AK_3","rhs_6b3_RPK","rhs_6b3_VOG","rhs_6b3_VOG_2","rhs_6b45_mg","rhs_6b45_off","rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_light"
	],
	[ //_helmets
		"vn_o_helmet_nva_03","vn_o_helmet_vc_05","vn_o_helmet_vc_04","vn_b_helmet_t56_01_02","vn_b_helmet_svh4_02_04","vn_b_boonie_01_08","vn_o_helmet_nva_03","vn_o_helmet_vc_05","vn_o_helmet_vc_04","vn_b_helmet_t56_01_02","vn_b_helmet_svh4_02_04","vn_b_boonie_01_08", //2 times
		"rhs_6b27m_digi","rhs_6b28_ess","rhs_6b47_emr_2","rhs_6b7_1m_olive","rhsusf_cvc_green_helmet","H_HelmetAggressor_F","H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Booniehat_taiga","rhsusf_hgu56p_visor_mask_green"
	],
	[ //_Backpacks
		"B_Carryall_taiga_F","B_FieldPack_taiga_F","B_Carryall_taiga_F","B_FieldPack_taiga_F","B_RadioBag_01_hex_F","B_AssaultPack_cbr","B_Carryall_cbr","B_FieldPack_cbr","B_Kitbag_cbr", //vanilla
		"vn_o_pack_07","vn_o_pack_06","vn_b_pack_trp_04_02","vn_b_pack_trp_02_02","vn_b_pack_trp_03_02","vn_b_pack_trp_01_02","vn_b_pack_lw_02","vn_b_pack_lw_05","vn_b_pack_m41_05"
	],
	[  //_googles/_facewear
		"G_RegulatorMask_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_02_black_F","G_Balaclava_blk",
		"vn_b_acc_m17_02","vn_o_acc_goggles_03","vn_o_poncho_01_01"
	]
];
WMS_Weaps_LivoniaMix = [
	[ //_mainWeaps,
		//"vn_m1897", //shotgun
		"gm_svd_wud",
		"gm_g3a4_ebr_oli",
		"gm_gvm75_grn",
		"gm_gvm75carb_grn",
		"gm_lmgrpk_prp",
		"vn_m16_camo",
		"vn_m16_xm148",
		"vn_xm177e1_camo",
		"vn_xm177_camo",
		"srifle_LRR_tna_F",
		"srifle_LRR_F",
		"srifle_LRR_camo_F",
		"vn_xm177_m203_camo",
		"vn_l1a1_xm148_camo",
		"vn_l1a1_03_camo",
		"vn_l1a1_01_camo",
		"srifle_DMR_03_khaki_F",
		"srifle_DMR_03_woodland_F",
		"srifle_DMR_04_Tan_F", //ASP-1 kir
		"vn_m14_camo",
		//"vn_k98k",
		"vn_m40a1_camo", //only here, do not spawn in the editor
		//"vn_m1903",
		"vn_m63a_cdo",
		"vn_rpd_shorty",
		"srifle_DMR_07_ghex_F", //QBU
		"vn_mg42",
		"vn_m60",
		"arifle_MXM_khk_F",
		"vn_m60",
		"vn_m60",
		"arifle_ARX_ghex_F",
		"rhs_weap_hk416d145_wd",
		"rhs_weap_m4a1_wd",
		"rhs_weap_m14_wd",
		"rhs_weap_XM2010_sa",
		"rhs_weap_m40a5_wd",
		"rhs_weap_m24sws_wd",
		"arifle_MXM_khk_F",
		"arifle_RPK12_arid_F",
		"arifle_AK12U_arid_F",
		"arifle_MSBS65_Mark_camo_F",
		"arifle_MSBS65_camo_F",
		"arifle_MXM_khk_F",
		"arifle_MSBS65_GL_camo_F",
		//"SMG_03_khaki",
		"LMG_Mk200_black_F",
		"rhs_weap_sr25_ec_wd"
	],
	[], //_mainWeapsAmmo,
	[ //_scopes
		"optic_Holosight_arid_F",
	 	"optic_Arco_arid_F",
	 	"optic_Arco_AK_arid_F",
	 	"optic_DMS_weathered_Kir_F",
	 	"optic_DMS_weathered_Kir_F",
	 	"optic_DMS_weathered_Kir_F"
	],
	["vn_izh54_p","vn_m10","vn_m1911","vn_vz61_p","vn_hp","vn_type64_smg","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_diver = [
	["U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit","vn_b_uniform_seal_09_01"], //uniforms
	["V_RebreatherIA","V_RebreatherIR","V_RebreatherB"], //vests
	["H_Beret_blk","H_HelmetSpecO_blk","H_HelmetB_black","H_HelmetSpecB_blk","H_HelmetB_light_black"], //helmets
	["B_AssaultPack_blk","B_LegStrapBag_black_F","B_RadioBag_01_black_F","B_TacticalPack_blk","B_ViperHarness_blk_F","B_ViperLightHarness_blk_F"], //backpacks
	["G_O_Diving","vn_b_acc_seal_01"] //facewears
	];
WMS_Weaps_Diver = [
	["arifle_SDAR_F","vn_mk1_udg"], //primary
	[], //primaryAmmo not used
	["optic_Holosight_blk_F"], //scope
	["vn_izh54_p","vn_m10","vn_m1911","vn_vz61_p","vn_hp","vn_type64_smg","rhsusf_weap_MP7A2_folded_desert","rhs_weap_pp2000_folded"] //pistol //NPC doesnt lnpw how to use SDAR outside of weater, they need better secondary
];

publicVariable "WMS_Loadout_AOR2";
publicVariable "WMS_Loadout_M90";
publicVariable "WMS_Loadout_Scorpion";
publicVariable "WMS_Loadout_Tiger";
publicVariable "WMS_Loadout_UKtmp";
publicVariable "WMS_Loadout_UKwdl";
publicVariable "WMS_Loadout_FRce";
publicVariable "WMS_Loadout_DEfleck";
publicVariable "WMS_Loadout_Assault";
publicVariable "WMS_Loadout_AssaultPlus";
publicVariable "WMS_Loadout_DMR";
publicVariable "WMS_Loadout_MG";
publicVariable "WMS_Loadout_Sniper";
publicVariable "WMS_Loadout_SMG";

/* //UNIFORMS
VSM_CSAT_MulticamTropic_Camo
VSM_AOR1_BDU_od_pants_Camo
VSM_AOR1_BDU_tan_pants_Camo
VSM_AOR1_BDU_Camo
VSM_M81_BDU_od_pants_Camo
VSM_M81_BDU_tan_pants_Camo
VSM_M81_BDU_Camo
VSM_Multicam_BDU_od_pants_Camo
VSM_Multicam_BDU_tan_pants_Camo
VSM_Multicam_BDU_Camo
VSM_MulticamTropic_BDU_od_pants_Camo
VSM_MulticamTropic_BDU_tan_pants_Camo
VSM_MulticamTropic_BDU_Camo
VSM_OCP_BDU_od_pants_Camo
VSM_OCP_BDU_tan_pants_Camo
VSM_OCP_BDU_Camo
VSM_ProjectHonor_BDU_od_pants_Camo
VSM_ProjectHonor_BDU_tan_pants_Camo
VSM_ProjectHonor_BDU_Camo
VSM_AOR1_Crye_grey_pants_Camo
VSM_AOR1_Crye_grey_shirt_Camo
VSM_AOR1_Crye_od_pants_Camo
VSM_AOR1_Crye_od_shirt_Camo
VSM_AOR1_Crye_tan_pants_Camo
VSM_AOR1_Crye_tan_shirt_Camo
VSM_AOR1_Crye_Camo
VSM_M81_Crye_grey_pants_Camo
VSM_M81_Crye_grey_shirt_Camo
VSM_M81_Crye_od_pants_Camo
VSM_M81_Crye_od_shirt_Camo
VSM_M81_Crye_tan_pants_Camo
VSM_M81_Crye_tan_shirt_Camo
VSM_M81_Crye_Camo
VSM_Multicam_Crye_grey_pants_Camo
VSM_Multicam_Crye_grey_shirt_Camo
VSM_Multicam_Crye_od_pants_Camo
VSM_Multicam_Crye_od_shirt_Camo
VSM_Multicam_Crye_tan_pants_Camo
VSM_Multicam_Crye_tan_shirt_Camo
VSM_Multicam_Crye_Camo
VSM_MulticamTropic_Crye_grey_pants_Camo
VSM_MulticamTropic_Crye_grey_shirt_Camo
VSM_MulticamTropic_Crye_od_pants_Camo
VSM_MulticamTropic_Crye_od_shirt_Camo
VSM_MulticamTropic_Crye_tan_pants_Camo
VSM_MulticamTropic_Crye_tan_shirt_Camo
VSM_MulticamTropic_Crye_Camo
VSM_OCP_Crye_grey_pants_Camo
VSM_OCP_Crye_grey_shirt_Camo
VSM_OCP_Crye_od_pants_Camo
VSM_OCP_Crye_od_shirt_Camo
VSM_OCP_Crye_tan_pants_Camo
VSM_OCP_Crye_tan_shirt_Camo
VSM_OCP_Crye_Camo
VSM_OGA_Crye_Grey_pants_Camo
VSM_OGA_Crye_od_pants_Camo
VSM_OGA_Crye_grey_od_pants_Camo
VSM_OGA_Crye_grey_tan_pants_Camo
VSM_OGA_Crye_grey_Camo
VSM_OGA_Crye_od_grey_pants_Camo
VSM_OGA_Crye_od_tan_pants_Camo
VSM_OGA_Crye_od_Camo
VSM_OGA_Crye_Camo
VSM_ProjectHonor_Crye_grey_pants_Camo
VSM_ProjectHonor_Crye_grey_shirt_Camo
VSM_ProjectHonor_Crye_od_pants_Camo
VSM_ProjectHonor_Crye_od_shirt_Camo
VSM_ProjectHonor_Crye_tan_pants_Camo
VSM_ProjectHonor_Crye_tan_shirt_Camo
VSM_ProjectHonor_Crye_Camo
VSM_Scorpion_Crye_grey_pants_Camo
VSM_Scorpion_Crye_grey_shirt_Camo
VSM_Scorpion_Crye_od_pants_Camo
VSM_Scorpion_Crye_od_shirt_Camo
VSM_Scorpion_Crye_tan_pants_Camo
VSM_Scorpion_Crye_tan_shirt_Camo
VSM_Scorpion_Crye_Camo
VSM_AOR1_casual_Camo
VSM_M81_casual_Camo
VSM_Multicam_casual_Camo
VSM_MulticamTropic_casual_Camo
VSM_OCP_casual_Camo
VSM_OGA_grey_casual_Camo
VSM_OGA_OD_casual_Camo
VSM_OGA_tan_casual_Camo
VSM_ProjectHonor_casual_Camo
VSM_Scorpion_casual_Camo
VSM_AOR1_Crye_SS_grey_pants_Camo
VSM_AOR1_Crye_SS_grey_shirt_Camo
VSM_AOR1_Crye_SS_od_pants_Camo
VSM_AOR1_Crye_SS_od_shirt_Camo
VSM_AOR1_Crye_SS_tan_pants_Camo
VSM_AOR1_Crye_SS_tan_shirt_Camo
VSM_AOR1_Crye_SS_Camo
VSM_M81_Crye_SS_grey_pants_Camo
VSM_M81_Crye_SS_grey_shirt_Camo
VSM_M81_Crye_SS_od_pants_Camo
VSM_M81_Crye_SS_od_shirt_Camo
VSM_M81_Crye_SS_tan_pants_Camo
VSM_M81_Crye_SS_tan_shirt_Camo
VSM_M81_Crye_SS_Camo
VSM_Multicam_Crye_SS_grey_pants_Camo
VSM_Multicam_Crye_SS_grey_shirt_Camo
VSM_Multicam_Crye_SS_od_pants_Camo
VSM_Multicam_Crye_SS_od_shirt_Camo
VSM_Multicam_Crye_SS_tan_pants_Camo
VSM_Multicam_Crye_SS_tan_shirt_Camo
VSM_Multicam_Crye_SS_Camo
VSM_MulticamTropic_Crye_SS_grey_pants_Camo
VSM_MulticamTropic_Crye_SS_grey_shirt_Camo
VSM_MulticamTropic_Crye_SS_od_pants_Camo
VSM_MulticamTropic_Crye_SS_od_shirt_Camo
VSM_MulticamTropic_Crye_SS_tan_pants_Camo
VSM_MulticamTropic_Crye_SS_tan_shirt_Camo
VSM_MulticamTropic_Crye_SS_Camo
VSM_OCP_Crye_SS_grey_pants_Camo
VSM_OCP_Crye_SS_grey_shirt_Camo
VSM_OCP_Crye_SS_od_pants_Camo
VSM_OCP_Crye_SS_od_shirt_Camo
VSM_OCP_Crye_SS_tan_pants_Camo
VSM_OCP_Crye_SS_tan_shirt_Camo
VSM_OCP_Crye_SS_Camo
VSM_OGA_Crye_SS_grey_pants_Camo
VSM_OGA_Crye_SS_od_pants_Camo
VSM_OGA_Crye_SS_grey_od_pants_Camo
VSM_OGA_Crye_SS_grey_tan_pants_Camo
VSM_OGA_Crye_SS_grey_Camo
VSM_OGA_Crye_SS_OD_grey_pants_Camo
VSM_OGA_Crye_SS_OD_tan_pants_Camo
VSM_OGA_Crye_SS_od_Camo
VSM_OGA_Crye_SS_Camo
VSM_ProjectHonor_Crye_SS_grey_pants_Camo
VSM_ProjectHonor_Crye_SS_grey_shirt_Camo
VSM_ProjectHonor_Crye_SS_od_pants_Camo
VSM_ProjectHonor_Crye_SS_od_shirt_Camo
VSM_ProjectHonor_Crye_SS_tan_pants_Camo
VSM_ProjectHonor_Crye_SS_tan_shirt_Camo
VSM_ProjectHonor_Crye_SS_Camo
VSM_Scorpion_Crye_SS_grey_pants_Camo
VSM_Scorpion_Crye_SS_grey_shirt_Camo
VSM_Scorpion_Crye_SS_od_pants_Camo
VSM_Scorpion_Crye_SS_od_shirt_Camo
VSM_Scorpion_Crye_SS_tan_pants_Camo
VSM_Scorpion_Crye_SS_tan_shirt_Camo
VSM_Scorpion_Crye_SS_Camo
VSM_AOR1_Crye_Tee_Camo
VSM_M81_Crye_Tee_Camo
VSM_Multicam_Crye_Tee_Camo
VSM_MulticamTropic_Crye_Tee_Camo
VSM_OCP_Crye_Tee_Camo
VSM_ProjectHonor_Crye_Tee_Camo
VSM_Scorpion_Crye_Tee_Camo
VSM_AOR1_od_pants_Camo
VSM_AOR1_od_shirt_Camo
VSM_AOR1_tan_pants_Camo
VSM_AOR1_tan_shirt_Camo
VSM_AOR1_Camo
VSM_M81_od_pants_Camo
VSM_M81_od_shirt_Camo
VSM_M81_tan_pants_Camo
VSM_M81_tan_shirt_Camo
VSM_M81_Camo
VSM_Multicam_od_pants_Camo
VSM_Multicam_od_shirt_Camo
VSM_Multicam_tan_pants_Camo
VSM_Multicam_tan_shirt_Camo
VSM_Multicam_Camo
VSM_MulticamTropic_od_pants_Camo
VSM_MulticamTropic_od_shirt_Camo
VSM_MulticamTropic_tan_pants_Camo
VSM_MulticamTropic_tan_shirt_Camo
VSM_MulticamTropic_Camo
VSM_OCP_od_pants_Camo
VSM_OCP_od_shirt_Camo
VSM_OCP_tan_pants_Camo
VSM_OCP_tan_shirt_Camo
VSM_OCP_Camo
VSM_OGA_od_pants_Camo
VSM_OGA_od_tan_pants_Camo
VSM_OGA_od_Camo
VSM_OGA_Camo
VSM_ProjectHonor_od_pants_Camo
VSM_ProjectHonor_od_shirt_Camo
VSM_ProjectHonor_tan_pants_Camo
VSM_ProjectHonor_tan_shirt_Camo
VSM_ProjectHonor_Camo
VSM_AOR1_od_pants_Camo_SS
VSM_AOR1_od_shirt_Camo_SS
VSM_AOR1_tan_pants_Camo_SS
VSM_AOR1_tan_shirt_Camo_SS
VSM_AOR1_Camo_SS
VSM_M81_od_pants_Camo_SS
VSM_M81_od_shirt_Camo_SS
VSM_M81_tan_pants_Camo_SS
VSM_M81_tan_shirt_Camo_SS
VSM_M81_Camo_SS
VSM_Multicam_od_pants_Camo_SS
VSM_Multicam_od_shirt_Camo_SS
VSM_Multicam_tan_pants_Camo_SS
VSM_Multicam_tan_shirt_Camo_SS
VSM_Multicam_Camo_SS
VSM_MulticamTropic_od_pants_Camo_SS
VSM_MulticamTropic_od_shirt_Camo_SS
VSM_MulticamTropic_tan_pants_Camo_SS
VSM_MulticamTropic_tan_shirt_Camo_SS
VSM_MulticamTropic_Camo_SS
VSM_OCP_od_pants_Camo_SS
VSM_OCP_od_shirt_Camo_SS
VSM_OCP_tan_pants_Camo_SS
VSM_OCP_tan_shirt_Camo_SS
VSM_OCP_Camo_SS
VSM_OGA_od_pants_Camo_SS
VSM_OGA_od_tan_pants_Camo_SS
VSM_OGA_od_Camo_SS
VSM_OGA_Camo_SS
VSM_ProjectHonor_od_pants_Camo_SS
VSM_ProjectHonor_od_shirt_Camo_SS
VSM_ProjectHonor_tan_pants_Camo_SS
VSM_ProjectHonor_tan_shirt_Camo_SS
VSM_ProjectHonor_Camo_SS
VSM_AOR1_Camo_TShirt
VSM_M81_Camo_TShirt
VSM_Multicam_Camo_TShirt
VSM_MulticamTropic_Camo_TShirt
VSM_OCP_Camo_TShirt
VSM_ProjectHonor_Camo_TShirt
Alpine_Crye_Camo
Alpine_white_Crye_camo
Alpine_Crye_SS_Camo
Alpine_white_Crye_SS_camo
Multicam_Alpine_casual_Camo
Alpine_Massif_Camo
Alpine_Massif_Camo_SS
Arid_Arid_Camo
Arid_Arid_SS_Camo
Arid_Crye_Camo
Multicam_Arid_Black_casual_Camo
Multicam_Arid_Blue_casual_Camo
Multicam_Arid_casual_Camo
Arid_Crye_SS_Camo
Black_Black_Camo
Black_Black_SS_Camo
black_Crye_Camo
Multicam_black_casual_Camo
Black_Crye_SS_Camo
black_Crye2_Camo
//AOR2
VSM_CSAT_AOR2_Camo
AOR2_camo
AOR2_SS_camo
AOR2_Camo_TShirt
AOR_2_BlkCasual_camo
AOR_2_BCasual_camo
AOR_2_TCasual_camo
AOR_2_Crye_Tee_Camo
AOR_2_Grey_Crye_Camo
AOR_2_Crye_Camo
AOR_2_GreySS_Crye_Camo
AOR_2_CryeSS_Camo
*/
///////////////////////////
/* //vest
"VSM_LBT1961_Black";
"VSM_LBT1961_CB";
"VSM_LBT1961_GRN";
“VSM_MBSS_CB”;
“VSM_MBSS_Green”;
“VSM_MBSS_TAN”;
“VSM_MBSS_WTF”; //pink I guess
“VSM_MBSS_PACA_CB”;
“VSM_MBSS_PACA_Green”;
“VSM_MBSS_PACA_TAN”;
“VSM_MBSS_PACA_WTF”; //pink I guess

//BONUS M81 //editor
"VSM_FAPC_Breacher_M81"
"VSM_FAPC_MG_M81"
"VSM_FAPC_Operator_M81"
“VSM_CarrierRig_Breacher_M81”
“VSM_CarrierRig_Operator_M81”
“VSM_CarrierRig_Gunner_M81”
"VSM_LBT6094_breacher_M81";
"VSM_LBT6094_MG_M81";
"VSM_LBT6094_operator_M81";
“VSM_RAV_Breacher_M81”;
“VSM_RAV_MG_M81”;
“VSM_RAV_operator_M81”;

//Alpine
“dr_ALPfapc_br”
“dr_ALPfapc_mg”
“dr_ALPfapc_op”
“dr_ALPlbt_br”
“dr_ALPlbt_mg”
“dr_ALPlbt_op”
“dr_ALPpar_br”
“dr_ALPpar_mg”
“dr_ALPpar_op”
“dr_ALPfapc_br”
“dr_ALPfapc_br”
//Arid
"LBT1961_Arid";
“CarrierRig_Breacher_Arid”
“CarrierRig_Operator_Arid”
“CarrierRig_Gunner_Arid”
“dr_ARDfapc_br”
“dr_ARDfapc_mg”
“dr_ARDfapc_op”
“dr_ARDlbt_br”
“dr_ARDlbt_mg”
“dr_ARDlbt_op”
“dr_ARDpar_br”
“dr_ARDpar_mg”
“dr_ARDpar_op”
“dr_ARDfapc_br”
//Multicam
"VSM_FAPC_Breacher_Multicam";
"VSM_FAPC_MG_Multicam";
"VSM_FAPC_Operator_Multicam";
"VSM_CarrierRig_Breacher_Multicam";
"VSM_CarrierRig_Gunner_Multicam";
"VSM_CarrierRig_Operator_Multicam";
"VSM_LBT6094_breacher_Multicam";
"VSM_LBT6094_MG_Multicam";
"VSM_LBT6094_operator_Multicam";
“VSM_RAV_Breacher_Multicam”;
“VSM_RAV_MG_Multicam”;
“VSM_RAV_operator_Multicam”;
"VSM_FAPC_Breacher_Multicam";
//MulticamTropic
"VSM_FAPC_Breacher_MulticamTropic";
"VSM_FAPC_MG_MulticamTropic";
"VSM_FAPC_Operator_MulticamTropic";
"VSM_CarrierRig_Breacher_MulticamTropic";
"VSM_CarrierRig_Gunner_MulticamTropic";
"VSM_CarrierRig_Operator_MulticamTropic";
"VSM_LBT6094_breacher_MulticamTropic";
"VSM_LBT6094_MG_MulticamTropic";
"VSM_LBT6094_operator_MulticamTropic";
“VSM_RAV_Breacher_MulticamTropic”;
“VSM_RAV_MG_MulticamTropic”;
“VSM_RAV_operator_MulticamTropic”;
//OCP
"VSM_FAPC_MG_OCP";
"VSM_FAPC_Operator_OCP";
"VSM_CarrierRig_Breacher_OCP";
"VSM_CarrierRig_Gunner_OCP";
"VSM_CarrierRig_Operator_OCP";
"VSM_LBT6094_breacher_OCP";
"VSM_LBT6094_MG_OCP";
"VSM_LBT6094_operator_OCP";
“VSM_RAV_Breacher_OCP”;
“VSM_RAV_MG_OCP”;
“VSM_RAV_operator_OCP”;
//ProjectHonor
"VSM_FAPC_Breacher_ProjectHonor";
"VSM_FAPC_MG_ProjectHonor";
"VSM_FAPC_Operator_ProjectHonor";
"VSM_CarrierRig_Breacher_ProjectHonor";
"VSM_CarrierRig_Gunner_ProjectHonor";
"VSM_CarrierRig_Operator_ProjectHonor";
"VSM_LBT6094_breacher_ProjectHonor";
"VSM_LBT6094_MG_ProjectHonor";
"VSM_LBT6094_operator_ProjectHonor";
“VSM_RAV_Breacher_ProjectHonor”;
“VSM_RAV_MG_ProjectHonor”;
“VSM_RAV_operator_ProjectHonor”;
//OGA
"VSM_LBT1961_OGA_OD"
"VSM_FAPC_Breacher_OGA"
"VSM_FAPC_MG_OGA"
"VSM_FAPC_Operator_OGA"
"VSM_CarrierRig_Breacher_OGA"
"VSM_CarrierRig_Gunner_OGA"
"VSM_CarrierRig_Operator_OGA"
"VSM_LBT6094_breacher_OGA"
"VSM_LBT6094_MG_OGA"
"VSM_LBT6094_operator_OGA"
“VSM_RAV_Breacher_OGA”
“VSM_RAV_MG_OGA”
“VSM_RAV_operator_OGA”
“VSM_OGA_IOTV_2”
“VSM_OGA_OD_IOTV_2”
“VSM_OGA_IOTV_1”
“VSM_OGA_OD_IOTV_1”
“VSM_OGA_Vest_2”
“VSM_OGA_OD_Vest_2”
“VSM_OGA_Vest_1”
“VSM_OGA_OD_Vest_1”
“VSM_OGA_OD_Vest_3”
“VSM_OGA_Vest_3”
//AOR1
"VSM_FAPC_Breacher_AOR1";
"VSM_FAPC_MG_AOR1";
"VSM_FAPC_Operator_AOR1";
"VSM_CarrierRig_Breacher_AOR1";
"VSM_CarrierRig_Gunner_AOR1";
"VSM_CarrierRig_Operator_AOR1";
"VSM_LBT6094_breacher_AOR1";
"VSM_LBT6094_MG_AOR1";
"VSM_LBT6094_operator_AOR1";
“VSM_RAV_Breacher_AOR1”;
“VSM_RAV_MG_AOR1”;
“VSM_RAV_operator_AOR1”;
//MCB
"VSM_MBSS_BLK";
"VSM_MBSS_PACA_BLK";
“dr_BLKfapc_mg”
“dr_BLKfapc_op”
“dr_BLKlbt_br”
“dr_BLKlbt_mg”
“dr_BLKlbt_op”
“dr_BLKpar_br”
“dr_BLKpar_mg”
“dr_BLKpar_op”
“dr_BLKfapc_br”
//AOR2
"LBT1961_AOR2";
“dr_AOR2fapc_mg”
“dr_AOR2fapc_op”
“dr_AOR2lbt_br”
“dr_AOR2lbt_mg”
“dr_AOR2lbt_op”
“dr_AOR2par_br”
“dr_AOR2par_mg”
“dr_AOR2par_op”
“CarrierRig_Breacher_AOR2”
“CarrierRig_Operator_AOR2”
“CarrierRig_Gunner_AOR2”
*/
///////////////////////////////////
/*//backpack
Black_Backpack_kitbag
Black_backpack_Compact
Black_Carryall
Arid_Backpack_kitbag
Arid_Backpack_Compact
Arid_Carryall
Alpine_backpack_kitbag
Alpine_Backpack_Compact
Alpine_Carryall
AOR2_Backpack_kitbag
AOR2_Backpack_Compact
AOR2_CarryAll
VSM_ProjectHonor_Backpack_Kitbag
VSM_ProjectHonor_Backpack_Compact
VSM_ProjectHonor_carryall
VSM_OCP_Backpack_Kitbag
VSM_OGA_Backpack_Compact
VSM_OGA_OD_Backpack_Kitbag
VSM_OGA_Backpack_Kitbag
VSM_OGA_OD_Backpack_Compact
VSM_OGA_Backpack_Compact
VSM_OGA_OD_carryall
VSM_OGA_carryall
VSM_OCP_carryall
VSM_MulticamTropic_Backpack_Kitbag
VSM_MulticamTropic_Backpack_Compact
VSM_MulticamTropic_carryall
VSM_Multicam_Backpack_Kitbag
VSM_Multicam_Backpack_Compact
VSM_Multicam_carryall
VSM_M81_Backpack_Kitbag
VSM_M81_Backpack_Compact
VSM_M81_carryall
VSM_AOR1_Backpack_Kitbag
VSM_AOR1_Backpack_Compact
VSM_AOR1_carryall
*/
/*

23:26:29 Inventory item with given name: [black_black_SS_Uniform] not found
23:26:30 Inventory item with given name: [black_Crye_SS_Uniform] not found
23:26:31 Inventory item with given name: [black_Crye_Uniform] not found
23:26:31 Inventory item with given name: [black_black_Uniform] not found
23:26:40 Inventory item with given name: [Multicam_black_Casual_uniform] not found
*/