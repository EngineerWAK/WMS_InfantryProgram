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
	"hlc_acc_DBALPL_side_FL","hlc_acc_Surefiregrip","HLC_optic_DocterV","hlc_optic_HensoldtZO_lo_Docter","rhsusf_acc_su230a_mrds_c",
	"ACE_EarPlugs","ACE_EarPlugs",
	"rhs_ec200_sand_mag","rhs_ec75_sand_mag","1Rnd_HE_Grenade_shell","rhs_rpg7_OG7V_mag","rhs_VOG25",//explo
	"Antimalaricum","Antibiotic",
	"ACE_bloodIV_250","ACE_plasmaIV_250","ACE_bloodIV_500","ACE_plasmaIV_500","ACE_salineIV_250","ACE_splint",
	"Money_bunch","Money_roll","Money_stack","Money_stack_quest",
	"Laserbatteries","Laserbatteries",
	"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05",//"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05", //twice, since now there is a lot more items in the list
	"FilesSecret","FileNetworkStructure","FileTopSecret","DocumentsSecret","Wallet_ID","FlashDisk","ButaneCanister","Keys",
	"ACE_Can_Franta","ACE_Can_RedGull","ACE_Can_Spirit","ACE_Canteen","ACE_Canteen_Empty","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Empty","ACE_WaterBottle_Half",
	"ACE_Humanitarian_Ration","ACE_MRE_BeefStew","ACE_MRE_ChickenTikkaMasala","ACE_MRE_ChickenHerbDumplings","ACE_MRE_CreamChickenSoup","ACE_MRE_CreamTomatoSoup","ACE_MRE_LambCurry","ACE_MRE_MeatballsPasta","ACE_MRE_SteakVegetables",
	"ACE_RangeTable_82mm","ACE_artilleryTable","ACE_Chemlight_Shield","ACE_DeadManSwitch","ACE_HuntIR_monitor","ACE_IR_Strobe_Item","ACE_Flashlight_XL50","ACE_microDAGR","ACE_RangeCard","ACE_Sunflower_Seeds","ACE_UAVBattery","rhsusf_acc_harris_bipod",
	"rhsusf_acc_kac_grip","rhsusf_acc_rvg_blk","rhsusf_acc_grip3","muzzle_snds_acp","muzzle_snds_L","rhsgref_mg42_acc_AAsight","rhsusf_acc_LEUPOLDMK4_2_d",
	"rhsusf_acc_ACOG_MDO","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_g33_xps3_tan","ACE_HuntIR_M203","Laptop_closed",
	"rhs_pdu4","ACE_Yardage450","rhsusf_bino_lrf_Vector21","ACE_Vector","I_UavTerminal","rhs_tr8_periscope","SatPhone","ACE_RangeCard","ACE_Flashlight_Maglite_ML300L","rhsusf_bino_m24_ARD","rhsusf_bino_leopold_mk4","rhsusf_bino_lerca_1200_black",
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
	 [
		"hlc_rifle_RU556","hlc_rifle_bcmjack","hlc_rifle_G36CV","hlc_rifle_hk33ka3","hlc_rifle_aek971_mtk","hlc_rifle_ACR_full_Black","hlc_rifle_SG551SB_RIS","hlc_rifle_auga3_b", //NIarms
		"arifle_MX_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_GL_khk_F","rhs_weap_savz58v","rhs_weap_savz58v_ris_fold","arifle_MXC_F","arifle_Katiba_C_F","arifle_Mk20_plain_F",//"arifle_SDAR_F", //NPC doesnt know how to use SDAR outside of water
		"SMG_03_TR_black","arifle_CTAR_blk_F","arifle_SPAR_01_blk_F",
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","rhs_weap_aks74n_npz","rhs_weap_hk416d10_LMT","rhs_weap_m16a4_imod","rhs_weap_m4a1_blockII","rhsusf_weap_MP7A2","rhs_weap_m21a_pr","rhs_weap_VHSd2" //RHS
		], //_mainWeaps
	 [], //_mainWeapsAmmo
	 ["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230"], //_scopes
	 ["hgun_p07_f","rhs_weap_tt33","hlc_pistol_C96_Wartime"] //_pistols
];
WMS_Loadout_AssaultPlus = [//66 68 762
	 [
		"hlc_rifle_ACR68_mid_black","hlc_rifle_ACR68_Carb_black","hlc_rifle_slr107u_MTK","hlc_rifle_G36KMLIC","hlc_rifle_g3ka4",//,"hlc_rifle_vendimus" //NIarms
		"arifle_ARX_blk_F","arifle_Katiba_C_F","arifle_MX_Black_F","arifle_AK12_F",
		"arifle_AK12U_F", "arifle_MSBS65_black_F", //Contact DLC
		"rhs_weap_l1a1","arifle_SPAR_03_blk_F",
		"rhs_weap_ak103_npz","rhs_weap_ak104_zenitco_b33","rhs_weap_akm_zenitco01_b33","rhs_weap_mk17_STD" //RHS
		], //_mainWeaps
	 [], //_mainWeapsAmmo
	 ["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230"], //_scopes
	 ["hgun_p07_f","hlc_pistol_C96_Wartime"] //_pistols
];
WMS_Loadout_DMR = [
	 [	
		"hlc_rifle_FAL5000Rail","hlc_rifle_g3sg1ris","hlc_rifle_M14_Bipod_Rail","hlc_rifle_M21_Rail",//NIarms
		"srifle_DMR_07_blk_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_06_hunter_F",
		"rhs_weap_svdp_npz","rhs_weap_sr25_ec",
		"srifle_DMR_03_F",
		"arifle_MSBS65_Mark_black_F" //contact DLC
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["rhsusf_acc_ACOG_USMC","rhsusf_acc_su230","optic_DMS"], //_scopes
	 ["hgun_p07_f","hlc_pistol_P239_40"] //_pistols
];
WMS_Loadout_MG = [ //arifle_RPK12_F, LMG_Mk200_black_F
	 [
		"hlc_lmg_minimipara","hlc_rifle_RPK12","rhs_weap_m249","hlc_lmg_m60","rhs_weap_mg42","LMG_03_F","hlc_rifle_MG36",//NIarms
		"arifle_SPAR_02_khk_F","arifle_CTARS_blk_F",
		"rhs_weap_fnmag","rhs_weap_m240G","rhs_weap_m240B","LMG_03_F","rhs_weap_m249","arifle_MX_SW_Black_F","rhs_weap_pkp","rhs_weap_rpk74m",
		"rhs_weap_mg42","LMG_03_F","rhs_weap_pkp",
		"arifle_RPK12_F", "LMG_Mk200_black_F" //contact DLC
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [], //_scopes
	 ["hgun_p07_f"] //_pistols
];
WMS_Loadout_Sniper = [
	 [
		"hlc_rifle_awmagnum","hlc_rifle_awmagnum_BL","hlc_rifle_awmagnum_FDE","hlc_rifle_FN3011Modern","hlc_rifle_M1903A1_unertl",
		"rhs_weap_m24sws_d","rhs_weap_m40a5","rhs_weap_m38_rail","rhs_weap_t5000","rhs_weap_XM2010_d",
		"srifle_LRR_F"
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_DMS","optic_KHS_blk","optic_AMS","optic_lrps","rhsusf_acc_M8541","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_M8541_mrds","rhsusf_acc_nxs_5522x56_md","rhsusf_acc_nxs_3515x50f1_md_sun","rhsusf_acc_M8541_low"], //_scopes
	 ["hgun_p07_f","hlc_pistol_P239_357"] //_pistols
];
WMS_Loadout_SMG = [
	 [
		"hlc_smg_mp5a3","hlc_smg_mp5sd6","hlc_smg_9mmar","hlc_smg_mp5k_PDW","hlc_rifle_auga2para_b",
		"rhs_weap_pp2000", "SMG_01_F", "SMG_02_F", "SMG_03C_black", "SMG_05_F", "rhsusf_weap_MP7A2","rhs_weap_m3a1","rhs_weap_savz61"
	 ], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_Aco_smg","optic_Holosight_smg_blk_F"], //_scopes
	 ["hgun_p07_f"] //_pistols
];

//AI LOADOUTS
//removing some bulshit about Antitank vests and helmet managed by ACE
//Black: 	"H_Beret_blk","H_Cap_blk","rhsusf_hgu56p_visor_mask_black_skull","rhsgref_helmet_m1942","H_Bandanna_gry","H_Cap_usblack"
			//"V_Pocketed_black_F","V_Chestrig_blk","V_BandollierB_blk"
//brown:	"H_Booniehat_khk_hs","H_Booniehat_tan","H_Watchcap_cbr","H_Bandanna_sand","H_Bandanna_cbr","H_Cap_brn_SPECOPS"
			//"V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"
//green:	"H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_taiga","H_Watchcap_khk","H_Bandanna_khk","H_Cap_grn","H_Cap_oli"
			//"V_Chestrig_rgr","V_Chestrig_oli","V_HarnessOGL_ghex_F","V_TacVest_oli"
WMS_Loadout_SURPAT = [//grey green brown
	["SURPAT_TP_Camo","SURPAT_TP_Camo_SS","SURPAT_Camo_Cyre","SURPAT_Camo_Cyre_TP","SURPAT_Camo_Cyre_TS"],//Uniform
	["SURPAT_Vest_1","SURPAT_Vest_2","SURPAT_Vest_3","SURPAT_Vest_4","SURPAT_Vest_5","SURPAT_Vest_6","SURPAT_Vest_7","V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"],//Vest
	["SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet1","SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet3","H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_oli","H_Cap_grn","H_Cap_oli"],//Helmet,"H_Watchcap_khk","SURPAT_Boonie"
	["SURPAT_Backpack_Compact","SURPAT_Backpack_Kitbag"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_AOR1 = [//desert
	["AOR1_Camo_SS","AOR1_TP_Camo","AOR1_Camo_Cyre","AOR1_Camo_Cyre_TS","AOR1_Camo_Cyre_TP","AOR1_Camo_Cyre_GP"],//Uniform
	["AOR1_Vest_1","AOR1_Vest_2","AOR1_Vest_3","AOR1_Vest_4","AOR1_Vest_5","V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"],//Vest
	["AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","AOR1_Helmet1","AOR1_Helmet1","AOR1_Helmet2","H_Booniehat_khk_hs","H_Booniehat_tan","H_Watchcap_cbr","H_Cap_brn_SPECOPS"],//Helmet,"AOR1_Boonie","H_Bandanna_sand","H_Bandanna_cbr"
	["AOR1_Backpack_Kitbag","AOR1_Backpack_Compact","B_Kitbag_cbr"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk"]  //_googles//_facewear
];
WMS_Loadout_MCB = [ //black
	 ["MCB_Camo_Cyre","MCB_Camo_Cyre_TS","MCB_Camo_Cyre_TP","MCB_Camo_Cyre_GS","MCB_Camo_Cyre_GP"], //_uniforms
	 ["MCB_Vest_1","MCB_Vest_2","MCB_Vest_3","MCB_Vest_4","MCB_Vest_5","MCB_Vest_6","MCB_Vest_7","V_Pocketed_black_F","V_Chestrig_blk","V_BandollierB_blk"], //_vests
	 ["MCB_Helmet1","MCB_Helmet1","MCB_Helmet2","MCB_Helmet1","MCB_Helmet1","MCB_Helmet2","H_HelmetSpecO_blk","H_HelmetB_black","H_HelmetSpecB_blk","H_HelmetB_light_black","H_Cap_blk","rhsusf_hgu56p_visor_mask_black_skull","H_Cap_usblack"], //,"rhsgref_helmet_m1942","H_Beret_blk"_helmets,"H_Bandanna_gry","MCB_Boonie"
	 ["MCB_Backpack_Compact","MCB_Backpack_KitBag","MCB_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles//_facewear
];
WMS_Loadout_M90d = [//desert
	 ["M90d_Camo_Cyre","M90d_Camo_Cyre_GS","M90d_Camo_Cyre_GP"], //_uniforms
	 ["M90d_Vest_1","M90d_Vest_2","M90d_Vest_3","M90d_Vest_4","V_Chestrig_khk","V_HarnessOGL_gry","rhs_lifchik_vog","V_TacVest_brn"], //_vests
	 ["M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","M90d_Helmet1","M90d_Helmet1","M90d_Helmet2","H_Booniehat_khk_hs","H_Booniehat_tan","H_Cap_brn_SPECOPS"], //_helmets,"H_Watchcap_cbr","M90d_Boonie""H_Bandanna_sand","H_Bandanna_cbr",
	 ["M90d_Backpack_KitBag","B_AssaultPack_ocamo","B_Carryall_ocamo"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_ABU = [ //grey
	 ["ABU_Camo_Cyre_Tee", "ABU_BS_Camo","ABU_BS_Camo_SS","ABU_Camo","ABU_Camo_Cyre","ABU_Camo_Cyre_GS","ABU_Camo_Cyre_TP","ABU_Camo_Cyre_TS","ABU_Camo_SS","ABU_GP_Camo","ABU_GP_Camo_SS","ABU_GS_Camo","ABU_GS_Camo_SS","ABU_Camo_Cyre_GP","ABU_BP_Camo","ABU_BP_Camo_SS"], //_uniforms
	 ["V_Chestrig_blk","V_TacVest_blk","V_TacVestIR_blk","ABU_Vest_1","ABU_Vest_2","ABU_Vest_3","ABU_Vest_4","ABU_Vest_5","V_Pocketed_black_F","V_Chestrig_blk","V_BandollierB_blk"], //_vests
	 ["H_HelmetB_black","H_HelmetB_plain_blk","ABU_Helmet1","ABU_Helmet2","H_HelmetB_black","H_HelmetB_plain_blk","ABU_Helmet1","ABU_Helmet2","H_Beret_blk","H_Cap_blk","H_Cap_usblack","H_Cap_blk","H_Cap_usblack"], //_helmets,"H_Beret_blk","H_Bandanna_gry","H_Bandanna_gry","ABU_Boonie","ABU_Cap"
	 ["B_Bergen_blk","B_FieldPack_blk","B_OutdoorPack_blk","B_TacticalPack_blk","ABU_Backpack_Compact","ABU_Backpack_Kitbag","MCB_Backpack_Kitbag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];

WMS_Loadout_Civilian = [
	 ["U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_Competitor","U_C_man_sport_2_F","U_C_Man_casual_3_F","U_C_Man_casual_5_F"], //_uniforms
	 ["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	 ["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_HeadBandage_bloody_F"], //_helmets
	 ["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_Scientist = [ //NEED SPECIFIC STUFF !!!
	 ["U_C_CBRN_Suit_01_White_F","U_C_CBRN_Suit_01_Blue_F","rhs_uniform_cossack","U_C_Driver_1_orange","U_C_WorkerCoveralls","U_C_Uniform_Scientist_01_F"], //_uniforms
	 ["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	 ["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_HeadBandage_bloody_F","H_Hat_Tinfoil_F","rhs_cossack_papakha","rhs_ushanka"], //_helmets
	 ["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_Bandit = [
	 ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F"], //_uniforms
	 ["V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVestCamo_khk","V_HarnessOSpec_brn","V_TacChestrig_cbr_F"], //_vests
	 ["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","H_MilCap_ghex_F"], //_helmets
	 ["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_LightWeaps = [
	 [
		"arifle_Mk20_plain_F","arifle_TRG20_F","hgun_PDW2000_F","SMG_03C_TR_camo","arifle_AKS_F","arifle_SPAR_01_khk_F",
	 	"sgun_HunterShotgun_01_F"], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_Holosight","optic_ACO_grn","optic_MRCO","optic_Arco","optic_Holosight_khk_F","optic_Holosight_blk_F"], //_scopes
	 ["hgun_P07_F","hgun_Rook40_F"] //_pistols
];
WMS_Loadout_HeavyBandit = [
	["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_C_E_LooterJacket_01_F"], //_uniforms
	 //["V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVestCamo_khk","V_HarnessOSpec_brn","V_TacChestrig_cbr_F","V_PlateCarrierGL_rgr"], //_vests
	[
		"rhs_6b45_desert","rhs_6b23_ML_6sh92_vog","rhs_6b5_sniper_ttsko","rhsusf_iotv_ocp_Squadleader",
		"Specter_MBSS_light_TAN","Specter_MBSS","MCB_LBT_vest",//VSM
		"rhs_6b2_chicom","rhs_6b2_lifchik","rhs_6sh117_grn","rhs_6sh117_rifleman","rhs_6sh92_vog","rhs_6sh92_vsr_radio","rhs_6b3_VOG_2","rhsgref_TacVest_ERDL"//RHS light
	],
	[	
		"rhs_6b26","rhs_6b28_flora","rhs_6b27m_ml","rhsusf_ach_bare_des_headset","rhsusf_cvc_ess","rhsusf_ach_helmet_headset_ocp_alt","rhs_altyn","H_HelmetSpecO_ghex_F","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand",
		"H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","H_MilCap_ghex_F"
	], //_helmets
	["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan","B_Carryall_ocamo","B_Carryall_taiga_F","B_Carryall_mcamo","B_Kitbag_mcamo","B_Kitbag_cbr"], //_Backpacks
	[]  //_googles/_facewear
];
WMS_Weaps_HeavyBandit = [
	[ //_mainWeaps,
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_m16a4_imod",
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_mk18_KAC",
	"rhs_weap_m27iar",
	"rhs_weap_sr25_ec_d",
	"rhs_weap_m24sws_d",
	"rhs_weap_m40a5_d",
	"rhs_weap_m240B",
	"rhs_weap_m249",
	"rhs_weap_m38_rail",
	"rhs_weap_t5000",
	"arifle_AK12_GL_arid_F",
	"arifle_AK12_arid_F",
	"arifle_RPK12_arid_F",
	"arifle_MSBS65_sand_F",
	"arifle_MSBS65_Mark_sand_F",
	"arifle_MSBS65_GL_sand_F",
	"arifle_MSBS65_UBS_sand_F",
	"LMG_Mk200_black_F",
	"arifle_MX_SW_F",
	//"LMG_Zafir_F",
	"srifle_DMR_06_olive_F",
	//"srifle_DMR_05_tan_f",//Cyrus
	"srifle_DMR_06_camo_F", //M14
	//"srifle_GM6_camo_F", //REMOVE THE FUCKING 50cal FUCKIN MACHINE GUN, FUCK YOU ARMA!!!!!!!!!!!!!!!!!!!!!!!
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
	["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hlc_pistol_P239_40"] //_pistols
];
WMS_Loadout_Livonia = [
	["U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_F"], //_uniforms
	[
		"rhs_6b45_rifleman","rhs_6b45_rifleman_2","rhs_6b45_grn","rhs_6b45_mg",
		"V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_heavy_Olive_F","V_SmershVest_01_radio_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_Olive_F","V_CarrierRigKBT_01_Olive_F"], //_vests
	[
		"rhs_6b27m_digi","rhs_6b28_ess","rhs_6b47_emr_2","rhs_6b7_1m_olive","rhsusf_cvc_green_helmet",
		"H_HelmetAggressor_F","H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Booniehat_taiga","rhsusf_hgu56p_visor_mask_green"
	], //_helmets
	 ["B_Carryall_taiga_F","B_FieldPack_taiga_F","B_Carryall_taiga_F","B_FieldPack_taiga_F","B_RadioBag_01_hex_F","B_AssaultPack_cbr","B_Carryall_cbr","B_FieldPack_cbr","B_Kitbag_cbr"], //_Backpacks //,"I_E_UGV_02_Demining_backpack_F"
	 ["G_RegulatorMask_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_02_black_F","G_Bandanna_tan","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Weaps_LivoniaMix = [
	 [ //_mainWeaps,
	"hlc_rifle_ACR_SBR_green",
	"hlc_rifle_ACR68_SBR_green",
	"hlc_rifle_ACR_Carb_green",
	"hlc_rifle_auga3_GL",
	"hlc_rifle_auga3",
	"hlc_rifle_g3a3",
	"hlc_rifle_416D10_wdl",
	"hlc_rifle_416D20_wdl",
	"hlc_wp_SCAR_PDW_camo",
	"hlc_lmg_mk46mod1", //LMG
	"hlc_lmg_MG42KWS_g", //LMG
	"hlc_rifle_FN3011Tactical_green", //sniper
	"hlc_rifle_awmagnum", //sniper
	"arifle_ARX_ghex_F",
	"rhs_weap_hk416d10_LMT_wd",
	"rhs_weap_hk416d145_wd",
	"rhs_weap_m4a1_wd",
	"rhs_weap_m4a1_m203s_wd",
	"rhs_weap_m14_wd",
	"rhs_weap_XM2010_sa", //sniper
	"rhs_weap_m40a5_wd", //sniper
	"rhs_weap_m24sws_wd", //sniper
	 "arifle_AK12_arid_F",
	 "arifle_RPK12_arid_F",
	 "arifle_AK12U_arid_F",
	 "arifle_MSBS65_sand_F",
	 "arifle_MSBS65_Mark_sand_F",
	 "arifle_MSBS65_UBS_sand_F",
	 "SMG_03_khaki",
	 "LMG_Mk200_black_F", //LMG
	 "rhs_weap_sr25_ec_wd",
	 "srifle_DMR_07_ghex_F", //QBU
	 "srifle_DMR_01_F" //vs121
	 //"srifle_DMR_02_camo_F" //MAR-10
	 ],
	 [], //_mainWeapsAmmo,
	 [ //_scopes
	 "optic_Holosight_arid_F",
	 "optic_Arco_arid_F",
	 "optic_Arco_AK_arid_F",
	 "optic_DMS_weathered_Kir_F"
	 ],
	 ["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hlc_pistol_P239_357"] //_pistols
];
WMS_Loadout_diver = [
	["U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit"], //uniforms
	["V_RebreatherIA","V_RebreatherIR","V_RebreatherB"], //vests
	["H_Beret_blk","H_HelmetSpecO_blk","H_HelmetB_black","H_HelmetSpecB_blk","H_HelmetB_light_black"], //helmets
	["B_AssaultPack_blk","B_LegStrapBag_black_F","B_RadioBag_01_black_F","B_TacticalPack_blk","B_ViperHarness_blk_F","B_ViperLightHarness_blk_F"], //backpacks
	["G_Diving","G_I_Diving","G_O_Diving","G_B_Diving"] //facewears
	];
WMS_Weaps_Diver = [
	["arifle_SDAR_F"], //primary
	[], //primaryAmmo not used
	["optic_Holosight_blk_F"], //scope
	["rhsusf_weap_MP7A2_folded_desert","rhs_weap_pp2000_folded","rhs_weap_savz61_folded","rhsusf_weap_m1911a1","hgun_Pistol_heavy_02_F"] //pistol //NPC doesnt lnpw how to use SDAR outside of weater, they need better secondary
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