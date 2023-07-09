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
	"vn_o_item_firstaidkit","vn_b_item_medikit_01","vn_b_item_trapkit","vn_b_item_wiretap","vn_b_item_firstaidkit","vn_o_3x_l1a1","vn_o_3x_sks","vn_o_1_5x_k98k",
	"vn_o_4x_svd","vn_o_3x_m84","vn_o_4x_m16","vn_b_type56","vn_b_m1903","vn_b_m4956","vn_s_hp","vn_s_mc10","vn_s_sten","vn_molotov_grenade_mag",
	"vn_b_item_bandage_01","vn_b_item_bugjuice_01","vn_b_item_cigs_01","vn_b_item_gunoil_01","vn_b_item_lighter_01","vn_b_item_rations_01",
	"rhs_pdu4","ACE_Yardage450","rhsusf_bino_lrf_Vector21","ACE_Vector","I_UavTerminal","ACE_RangeCard","ACE_Flashlight_Maglite_ML300L","rhsusf_bino_m24_ARD","rhsusf_bino_leopold_mk4","rhsusf_bino_lerca_1200_black",
	"Laserdesignator_03"
	];
};

/////////////////////////////////
//			LOADOUTS - DEFAULT IS "VANILLA"
/////////////////////////////////
//Players/BLUFOR Loadouts
WMS_Loadout_AOR2 = [
	 ["AOR2_Camo_Cyre","AOR2_Camo_Cyre_GS","AOR2_Camo_Cyre_GP"], //_uniforms
	 ["AOR2_Vest_1","AOR2_Vest_3","AOR2_Vest_5"], //_vests
	 ["AOR2_Helmet1","AOR2_Helmet2","AOR2_Boonie"], //_helmets
	 ["AOR2_Backpack_Compact","AOR2_Backpack_KitBag","B_ViperHarness_ghex_F"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_M90 = [
	 ["M90_Camo_Cyre","M90_Camo_Cyre_GS","M90_Camo_Cyre_GP"], //_uniforms
	 ["M90_Vest_1","M90_Vest_2","M90_Vest_3","M90_Vest_4"], //_vests
	 ["M90_Helmet1","M90_Helmet2","M90_Boonie"], //_helmets
	 ["M90_Backpack_KitBag","B_AssaultPack_rgr","B_Carryall_oli"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_Scorpion = [
	 ["Scorpion_Camo_Cyre","Scorpion_Camo_Cyre_GS","Scorpion_Camo_Cyre_GP"], //_uniforms
	 ["Scorpion_Vest_1","Scorpion_Vest_3","Scorpion_Vest_5","Scorpion_Vest_6","Scorpion_Vest_7"], //_vests
	 ["Scorpion_Helmet1","Scorpion_Helmet2","Scorpion_Boonie"], //_helmets
	 ["Scorpion_Backpack_Compact","Scorpion_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_Tiger = [
	 ["Tiger_Camo_Cyre","Tiger_Camo_Cyre_GS","Tiger_Camo_Cyre_GP"], //_uniforms
	 ["Tiger_Vest_1","Tiger_Vest_3","Tiger_Vest_5"], //_vests
	 ["Tiger_Helmet1","Tiger_Helmet2","Tiger_Boonie"], //_helmets
	 ["Tiger_Backpack_Compact","Tiger_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_UKtmp = WMS_Loadout_AOR2; //I don't use 3CB anymore
WMS_Loadout_UKwdl = WMS_Loadout_M90; //I don't use 3CB anymore
WMS_Loadout_FRce = WMS_Loadout_Scorpion; //I don't use R3F anymore
WMS_Loadout_DEfleck = WMS_Loadout_Tiger; //I don't use BWM anymore

//////////Weapons [WMS_Loadout_Assault, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Loadout_SMG];
WMS_Loadout_Assault = [//545 556 57 58
	[ //_mainWeaps
		"arifle_MX_F","arifle_SPAR_01_khk_F","arifle_MXC_F","arifle_Mk20_plain_F",//NPC doesnt know how to use SDAR outside of water
		"vn_f1_smg","vn_ppsh41","vn_type64","vn_mat49","vn_k50m","vn_m45","vn_mp40","vn_pps52", //SMGs
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","rhs_weap_aks74n_npz","rhs_weap_savz58v","vn_xm177_m203_camo","vn_xm177_camo","vn_m16_xm148","vn_m16_camo","vn_type56","vn_ak_01"
	],
	[], //_mainWeapsAmmo
	["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230"], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
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
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_DMR = [
	[	
		"srifle_DMR_07_blk_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_06_hunter_F","srifle_DMR_03_F","arifle_MSBS65_Mark_black_F",
		"rhs_weap_svdp_npz","rhs_weap_sr25_ec",
		"vn_m14a1","vn_sks_gl","vn_m4956_gl","vn_l1a1_01_gl","vn_l1a1_xm148"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["rhsusf_acc_ACOG_USMC","rhsusf_acc_su230","optic_DMS"], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_MG = [ //arifle_RPK12_F, LMG_Mk200_black_F
	[
		"arifle_CTARS_blk_F","arifle_RPK12_F","arifle_MX_SW_Black_F",
		"rhs_weap_fnmag","rhs_weap_m249","rhs_weap_pkp","rhs_weap_rpk74m","rhs_weap_mg42",
		"vn_dp28","vn_mg42","vn_pk","vn_rpd","vn_rpd_shorty_01","vn_l4"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	[], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_Sniper = [
	[
		"srifle_LRR_F",
		"rhs_weap_m24sws_d","rhs_weap_m40a5","rhs_weap_m38_rail","rhs_weap_t5000","rhs_weap_XM2010_d",
		"vn_k98k","vn_m1891","vn_m1903","vn_m36","vn_m38","vn_m9130","vn_vz54","vn_svd"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["optic_DMS","optic_KHS_blk","optic_AMS","optic_lrps","rhsusf_acc_M8541","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_M8541_mrds","rhsusf_acc_nxs_5522x56_md","rhsusf_acc_nxs_3515x50f1_md_sun","rhsusf_acc_M8541_low"], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_SMG = [
	[
		//"rhs_weap_pp2000", "SMG_01_F", "SMG_02_F", "SMG_03C_black", "SMG_05_F", "rhsusf_weap_MP7A2","rhs_weap_m3a1","rhs_weap_savz61",
		"vn_f1_smg","vn_ppsh41","vn_izh54_shorty","vn_m3a1","vn_sten","vn_type64","vn_k50m","vn_l2a3","vn_mat49","vn_m45","vn_mat49_vc","vn_mpu","vn_mp40","vn_m1928_tommy","vn_pps43","vn_vz61"
	], //_mainWeaps,
	[], //_mainWeapsAmmo,
	["optic_Aco_smg","optic_Holosight_smg_blk_F"], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];


//removing some bulshit about Antitank vests and helmet managed by ACE
//Black: 	"H_Beret_blk","H_Cap_blk","rhsusf_hgu56p_visor_mask_black_skull","rhsgref_helmet_m1942","H_Bandanna_gry","H_Cap_usblack"
			//"V_Pocketed_black_F","V_Chestrig_blk","V_BandollierB_blk"
//brown:	"H_Booniehat_khk_hs","H_Booniehat_tan","H_Watchcap_cbr","H_Bandanna_sand","H_Bandanna_cbr","H_Cap_brn_SPECOPS"
			//"V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"
//green:	"H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_taiga","H_Watchcap_khk","H_Bandanna_khk","H_Cap_grn","H_Cap_oli"
			//"V_Chestrig_rgr","V_Chestrig_oli","V_HarnessOGL_ghex_F","V_TacVest_oli"
WMS_Loadout_SURPAT = [//grey green brown
	["SURPAT_TP_Camo","SURPAT_TP_Camo_SS","SURPAT_Camo_Cyre","SURPAT_Camo_Cyre_TP","SURPAT_Camo_Cyre_TS"],//Uniform
	["SURPAT_Vest_1","SURPAT_Vest_2","SURPAT_Vest_3","SURPAT_Vest_4","SURPAT_Vest_5","SURPAT_Vest_6","SURPAT_Vest_7","vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"],//Vest
	["vn_o_helmet_nva_10","vn_o_helmet_nva_09","vn_o_helmet_vc_05","vn_o_helmet_vc_04","vn_o_helmet_nva_03",
	"SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet3","H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli"],//Helmet,"H_Watchcap_khk","SURPAT_Boonie"
	["vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","SURPAT_Backpack_Compact","SURPAT_Backpack_Kitbag"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles/_facewear
];
WMS_Loadout_AOR1 = [//desert
	["AOR1_Camo_SS","AOR1_TP_Camo","AOR1_Camo_Cyre","AOR1_Camo_Cyre_TS","AOR1_Camo_Cyre_TP","AOR1_Camo_Cyre_GP","vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_09_02","vn_o_uniform_pl_army_03_11"],//Uniform
	["AOR1_Vest_1","AOR1_Vest_2","AOR1_Vest_3","AOR1_Vest_4","AOR1_Vest_5","vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"],//Vest
	["AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"],//Helmet,"AOR1_Boonie","H_Bandanna_sand","H_Bandanna_cbr"
	["vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","AOR1_Backpack_Kitbag","AOR1_Backpack_Compact","B_Kitbag_cbr"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles//_facewear
];
WMS_Loadout_MCB = [ //black
	 ["MCB_Camo_Cyre","MCB_Camo_Cyre_TS","MCB_Camo_Cyre_TP","MCB_Camo_Cyre_GS","MCB_Camo_Cyre_GP","vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_01_01","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_mf_03_07","vn_o_uniform_vc_mf_09_07"], //_uniforms
	 ["MCB_Vest_1","MCB_Vest_2","MCB_Vest_3","MCB_Vest_4","MCB_Vest_5","MCB_Vest_6","MCB_Vest_7","vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"], //_vests
	 ["MCB_Helmet1","MCB_Helmet1","MCB_Helmet2","MCB_Helmet1","MCB_Helmet1","MCB_Helmet2","vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01","vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01"], //,"rhsgref_helmet_m1942","H_Beret_blk"_helmets,"H_Bandanna_gry","MCB_Boonie"
	 ["MCB_Backpack_Compact","MCB_Backpack_KitBag","MCB_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles//_facewear
];
WMS_Loadout_M90d = [//desert
	 ["M90d_Camo_Cyre","M90d_Camo_Cyre_GS","M90d_Camo_Cyre_GP","vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_09_02","vn_o_uniform_pl_army_03_11"], //_uniforms
	 ["M90d_Vest_1","M90d_Vest_2","M90d_Vest_3","M90d_Vest_4","vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"], //_vests
	 ["M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_nva_06","vn_o_pl_cap_01_01","vn_b_boonie_09_07"], //_helmets,"H_Watchcap_cbr","M90d_Boonie""H_Bandanna_sand","H_Bandanna_cbr",
	 ["vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","M90d_Backpack_KitBag","B_AssaultPack_ocamo","B_Carryall_ocamo"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk","vn_b_acc_m17_01","vn_o_acc_goggles_03"]  //_googles/_facewear
];
WMS_Loadout_ABU = [ //grey
	 ["ABU_BS_Camo","ABU_BS_Camo_SS","ABU_Camo","ABU_Camo_SS","ABU_GP_Camo","ABU_GP_Camo_SS","ABU_BP_Camo","ABU_BP_Camo_SS","vn_o_uniform_vc_01_03","vn_o_uniform_vc_03_03","vn_o_uniform_vc_05_03"], //_uniforms
	 ["ABU_Vest_1","ABU_Vest_2","ABU_Vest_3","ABU_Vest_4","ABU_Vest_5","vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08"], //_vests
	 ["ABU_Helmet1","ABU_Helmet2","ABU_Helmet1","ABU_Helmet2","vn_o_boonie_nva_02_02","vn_o_helmet_nva_10","vn_o_helmet_nva_09","vn_o_pl_cap_02_02"], //_helmets,"H_Beret_blk","H_Bandanna_gry","H_Bandanna_gry","ABU_Boonie","ABU_Cap"
	 ["vn_o_pack_01","vn_o_pack_02","vn_o_pack_03","vn_o_pack_05","vn_o_pack_04","ABU_Backpack_Compact","ABU_Backpack_Kitbag","MCB_Backpack_Kitbag"], //_Backpacks
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
	 ["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	 ["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_HeadBandage_bloody_F","H_Hat_Tinfoil_F","rhs_cossack_papakha","rhs_ushanka","vn_c_conehat_02","vn_c_conehat_01","vn_o_helmet_zsh3_02","vn_o_helmet_nva_10","vn_o_helmet_tsh3_01"], //_helmets
	 ["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_Bandit = [
	[	 //_uniforms
		"vn_o_uniform_nva_army_01_03","vn_o_uniform_nva_army_10_04","vn_o_uniform_nva_army_03_04","vn_o_uniform_nva_army_05_04","vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_reg_11_08","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_reg_11_09",
		"vn_o_uniform_vc_reg_11_10","vn_o_uniform_vc_reg_12_09","vn_o_uniform_vc_02_02","vn_o_uniform_vc_02_03","vn_o_uniform_vc_03_02","vn_o_uniform_vc_03_03","vn_o_uniform_vc_05_01","vn_o_uniform_vc_mf_09_07"
	],
	[ //_vests
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08","vn_o_vest_vc_01","vn_o_vest_vc_05","vn_o_vest_vc_04","vn_o_vest_vc_03","vn_o_vest_vc_02", //light vest
		"rhsgref_6b23_khaki_medic","rhsgref_6b23_ttsko_forest_rifleman","rhsgref_6b23_ttsko_mountain_rifleman","rhs_6b3_AK_2","rhs_6b3_VOG","rhs_6b23_6sh116_vog_od","rhs_6b23_engineer" //better vest
	],
	[ //_helmets
		"H_Booniehat_khk","H_Cap_headphones","H_Watchcap_khk","H_MilCap_ghex_F", //vanilla
		"vn_o_boonie_nva_02_02","vn_o_cap_01","vn_o_cap_02","vn_o_helmet_nva_10","vn_o_helmet_shl61_01","vn_o_helmet_nva_09","vn_o_helmet_nva_03","vn_o_helmet_nva_08","vn_o_helmet_vc_05","vn_o_helmet_vc_04"
	],
	[ //_Backpacks
		"vn_o_pack_04","vn_o_pack_08","vn_o_pack_06","vn_o_pack_07","vn_o_pack_03","vn_o_pack_05","vn_o_pack_01","vn_o_pack_02"
	],
	[]  //_googles/_facewear
];
WMS_Loadout_LightWeaps = [
	[ //_mainWeaps,
		"arifle_Mk20_plain_F","arifle_TRG20_F","arifle_AKS_F","sgun_HunterShotgun_01_F",
		"vn_f1_smg","vn_ppsh41","vn_type64","vn_mat49","vn_k50m","vn_m45","vn_mp40","vn_pps52", //SMGs
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","vn_xm177","vn_m16","vn_ak_01"
	],
	[], //_mainWeapsAmmo,
	["optic_Holosight","optic_ACO_grn","optic_MRCO","optic_Arco","optic_Holosight_khk_F","optic_Holosight_blk_F"], //_scopes
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_HeavyBandit = [
	[
		"vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_12_02","vn_o_uniform_nva_army_02_02","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_dc_13_07","vn_o_uniform_nva_dc_13_08","vn_o_uniform_nva_dc_13_04","vn_o_uniform_nva_dc_13_02",
		"vn_o_uniform_nva_army_01_03","vn_o_uniform_nva_army_10_04","vn_o_uniform_nva_army_03_04","vn_o_uniform_nva_army_05_04","vn_o_uniform_pl_army_01_12","vn_o_uniform_pl_army_04_12","vn_o_uniform_pl_army_02_13","vn_o_uniform_pl_army_01_14",
		"vn_o_uniform_vc_mf_01_07","vn_o_uniform_vc_reg_11_08","vn_o_uniform_vc_mf_11_07","vn_o_uniform_vc_reg_11_09","vn_o_uniform_vc_reg_11_10","vn_o_uniform_vc_reg_12_09","vn_o_uniform_vc_02_02","vn_o_uniform_vc_02_03"
	], //_uniforms
	[
		"vn_o_vest_01","vn_o_vest_06","vn_o_vest_03","vn_o_vest_07","vn_o_vest_02","vn_o_vest_08","vn_o_vest_vc_01","vn_o_vest_vc_05","vn_o_vest_vc_04","vn_o_vest_vc_03","vn_o_vest_vc_02", //light vest
		"rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki_sniper","rhsgref_6b23_khaki",'rhsgref_6b23_ttsko_forest','rhsgref_6b23_ttsko_mountain_nco','rhsgref_6b23_ttsko_mountain_sniper','rhsgref_6b23_ttsko_mountain', //better vest
		'rhs_6b3_R148','rhs_6b3_AK','rhs_6b3_AK_3','rhs_6b3_RPK','rhs_6b3_VOG_2','rhs_6b23_6sh92_vog','rhs_6b23_medic','rhs_6b23_rifleman','rhs_6b23_sniper', //better vest
		"rhs_6b45_mg","rhs_6b45_off","rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_light" //MUCH better vest
	],
	[	 //_helmets
		"vn_o_boonie_nva_02_02","vn_o_boonie_nva_02_01","vn_o_cap_01","vn_o_cap_02","vn_o_helmet_nva_10","vn_o_helmet_shl61_01","vn_o_helmet_nva_09","vn_o_helmet_tsh3_01","vn_o_helmet_zsh3_02","vn_o_helmet_nva_01",
		"vn_o_helmet_nva_03","vn_o_helmet_nva_05","vn_o_helmet_nva_08","vn_o_helmet_vc_05","vn_o_helmet_vc_04"
	],
	[ //_Backpacks
		"vn_o_pack_04","vn_o_pack_06","vn_o_pack_07","vn_o_pack_03","vn_o_pack_05","vn_o_pack_01","vn_o_pack_02","vn_o_pack_t884_01"
	],
	[]  //_googles/_facewear
];
WMS_Weaps_HeavyBandit = [
	[ //_mainWeaps,
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
	"vn_wmg42",
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
	["vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
];
WMS_Loadout_Livonia = [
	["U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_F"], //_uniforms
	[ //_vests
		"rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_mg",
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
		"vn_m1897", //shotgun
		"vn_m16_camo",
		"vn_m16_xm148",
		"vn_xm177e1_camo",
		"vn_xm177_camo",
		"vn_xm177_m203_camo",
		"vn_l1a1_xm148_camo",
		"vn_l1a1_03_camo",
		"vn_l1a1_01_camo",
		"vn_m14_camo",
		"vn_k98k",
		"vn_m40a1_camo", //only here, do not spawn in the editor
		"vn_m1903",
		"vn_m63a_cdo",
		"vn_rpd_shorty",
		"vn_m60",
		"arifle_ARX_ghex_F",
		"rhs_weap_hk416d145_wd",
		"rhs_weap_m4a1_wd",
		"rhs_weap_m14_wd",
		"rhs_weap_XM2010_sa",
		"rhs_weap_m40a5_wd",
		"rhs_weap_m24sws_wd",
		"arifle_RPK12_arid_F",
		"arifle_AK12U_arid_F",
		"arifle_MSBS65_Mark_camo_F",
		"arifle_MSBS65_camo_F",
		"arifle_MSBS65_GL_camo_F",
		"SMG_03_khaki",
		"LMG_Mk200_black_F",
		"rhs_weap_sr25_ec_wd"
	],
	[], //_mainWeapsAmmo,
	[ //_scopes
		"optic_Holosight_arid_F",
	 	"optic_Arco_arid_F",
	 	"optic_Arco_AK_arid_F",
	 	"optic_DMS_weathered_Kir_F"
	],
	["vn_izh54_p","vn_m10","vn_m1911","vn_vz61_p","vn_hp","vn_type64","vn_m1895","vn_ppk","vn_fkb1_pm","vn_p38"] //_pistols
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
	["vn_izh54_p","vn_m10","vn_m1911","vn_vz61_p","vn_hp","vn_type64","rhsusf_weap_MP7A2_folded_desert","rhs_weap_pp2000_folded"] //pistol //NPC doesnt lnpw how to use SDAR outside of weater, they need better secondary
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