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
if !(WMS_exileFireAndForget) then {
WMS_AI_inventory = [ //ADD ACE3 ITEMS LATER
	"Antimalaricum","AntimalaricumVaccine","Antibiotic",
	"ACE_bloodIV_250","ACE_plasmaIV_250","ACE_salineIV_250","ACE_splint",
	"Money_bunch","Money_roll","Money_stack","Money_stack_quest",
	"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05",
	"FilesSecret","FileNetworkStructure","FileTopSecret","DocumentsSecret","Wallet_ID","FlashDisk","ButaneCanister","Keys",
	"ACE_Can_Franta","ACE_Can_RedGull","ACE_Can_Spirit","ACE_Canteen","ACE_Canteen_Empty","ACE_Canteen_Half","ACE_WaterBottle","ACE_WaterBottle_Empty","ACE_WaterBottle_Half",
	"ACE_Humanitarian_Ration","ACE_MRE_BeefStew","ACE_MRE_ChickenTikkaMasala","ACE_MRE_ChickenHerbDumplings","ACE_MRE_CreamChickenSoup","ACE_MRE_CreamTomatoSoup","ACE_MRE_LambCurry","ACE_MRE_MeatballsPasta","ACE_MRE_SteakVegetables"
];};
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
WMS_Loadout_UKtmp = [
	 ["UK3CB_BAF_U_JumperUniform_DPMT","UK3CB_BAF_U_CombatUniform_DPMT_RM","UK3CB_BAF_U_Smock_DPMT"], //_uniforms
	 ["UK3CB_BAF_V_Osprey_DPMT1","UK3CB_BAF_V_Osprey_DPMT2","UK3CB_BAF_V_Osprey_DPMT3","UK3CB_BAF_V_Osprey_DPMT4","UK3CB_BAF_V_Osprey_DPMT5","UK3CB_BAF_V_Osprey_DPMT6","UK3CB_BAF_V_Osprey_DPMT7","UK3CB_BAF_V_Osprey_DPMT8","UK3CB_BAF_V_Osprey_DPMT9"], //_vests
	 ["UK3CB_BAF_H_Mk6_DPMT_A","UK3CB_BAF_H_Mk6_DPMT_C","UK3CB_BAF_H_Mk6_DPMT_D","UK3CB_BAF_H_Mk6_DPMT_F","UK3CB_BAF_H_Boonie_DPMT"], //_helmets
	 ["UK3CB_BAF_B_Bergen_DPMT_SL_A","UK3CB_BAF_B_Carryall_DPMT","UK3CB_BAF_B_KitBag_DPMT","UK3CB_BAF_B_Bergen_DPMT_JTAC_H_A","UK3CB_BAF_B_Bergen_DPMT_JTAC_A"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_UKwdl = [
	 ["UK3CB_BAF_U_JumperUniform_DPMW","UK3CB_BAF_U_CombatUniform_DPMW_RM","UK3CB_BAF_U_Smock_DPMW"], //_uniforms
	 ["UK3CB_BAF_V_Osprey_DPMW1","UK3CB_BAF_V_Osprey_DPMW2","UK3CB_BAF_V_Osprey_DPMW3","UK3CB_BAF_V_Osprey_DPMW4","UK3CB_BAF_V_Osprey_DPMW5","UK3CB_BAF_V_Osprey_DPMW6","UK3CB_BAF_V_Osprey_DPMW7","UK3CB_BAF_V_Osprey_DPMW8","UK3CB_BAF_V_Osprey_DPMW9"], //_vests
	 ["UK3CB_BAF_H_Mk6_DPMW_A","UK3CB_BAF_H_Mk6_DPMW_C","UK3CB_BAF_H_Mk6_DPMW_D","UK3CB_BAF_H_Mk6_DPMW_F","UK3CB_BAF_H_Boonie_DPMW"], //_helmets
	 ["UK3CB_BAF_B_Bergen_DPMW_SL_A","UK3CB_BAF_B_Carryall_DPMW","UK3CB_BAF_B_KitBag_DPMW","UK3CB_BAF_B_Bergen_DPMW_JTAC_H_A","UK3CB_BAF_B_Bergen_DPMW_JTAC_A"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_FRce = [
	 ["R3F_uniform_urr","R3F_uniform_urr_medic","R3F_uniform_f1","R3F_uniform_f1_medic","R3F_uniform_pilot"], //_uniforms
	 ["R3F_veste_ce600","R3F_veste_APSO_CE","R3F_veste_APSO_EOD_CE","R3F_veste_ce600"], //_vests
	 ["R3F_casque_spectra","R3F_casque_spectra_bleu","R3F_casque_spectra_vert","R3F_casque_spectra_EOD","R3F_chapeaubrousse_CE"], //_helmets
	 ["R3F_sac_radio_TFR_Lourd_CE","R3F_sac_moyen_CE","R3F_sac_moyen_medic_CE","R3F_sac_lourd_CE","R3F_sac_lourd_NOIR","R3F_sac_moyen_medic_NOIR"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_DEfleck = [
	 ["BWA3_Uniform_Fleck","BWA3_Uniform2_Fleck"], //_uniforms
	 ["BWA3_Vest_Fleck","BWA3_Vest_Rifleman_Fleck","BWA3_Vest_MachineGunner_Fleck","BWA3_Vest_Grenadier_Fleck","BWA3_Vest_Medic_Fleck","BWA3_Vest_Marksman_Fleck","BWA3_Vest_Leader_Fleck","BWA3_Vest_JPC_Rifleman_Fleck","BWA3_Vest_JPC_Leader_Fleck","BWA3_Vest_JPC_Radioman_Fleck"], //_vests
	 ["BWA3_OpsCore_Fleck","BWA3_OpsCore_Fleck_Patch","BWA3_OpsCore_Fleck_Camera","BWA3_M92_Fleck","BWA3_Booniehat_Fleck"], //_helmets
	 ["BWA3_AssaultPack_Fleck","BWA3_Kitbag_Fleck","BWA3_Kitbag_Fleck_medic","BWA3_PatrolPack_Fleck","BWA3_CarryAll_Fleck"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];

//////////Weapons [WMS_Loadout_Assault, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Loadout_SMG];
WMS_Loadout_Assault = [//545 556 57 58
	 [
		"SMG_03_TR_black","arifle_CTAR_blk_F","arifle_SPAR_01_blk_F",
		//Contact DLC
		"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak74m_npz","rhs_weap_aks74n_npz","rhs_weap_hk416d10_LMT","rhs_weap_m16a4_imod","rhs_weap_m4a1_blockII","rhsusf_weap_MP7A2","rhs_weap_m21a_pr","rhs_weap_VHSd2", //RHS
		"R3F_Famas_F1","R3F_Famas_G2","R3F_SCAR_L_BLACK","R3F_HK416M",//R3f
		"hlc_rifle_RU556","hlc_rifle_bcmjack","hlc_rifle_G36CV","hlc_rifle_hk33ka3","hlc_rifle_aek971_mtk","hlc_rifle_ACR_full_Black","hlc_rifle_SG551SB_RIS","hlc_rifle_auga3_b", //NIarms
		"UK3CB_BAF_L85A2_RIS","UK3CB_BAF_L85A3","UK3CB_BAF_L22A2" //3CB
		], //_mainWeaps
	 [], //_mainWeapsAmmo
	 ["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230","RKSL_optic_LDS","UK3CB_BAF_SUIT"], //_scopes
	 ["hgun_p07_f","hlc_pistol_P239","rhs_weap_tt33"] //_pistols
];
WMS_Loadout_AssaultPlus = [//66 68 762
	 [
		"arifle_Katiba_C_F","arifle_MX_Black_F","arifle_AK12_F",
		"hlc_rifle_ACR68_mid_black","hlc_rifle_ACR68_Carb_black","hlc_rifle_vendimus","hlc_rifle_slr107u_MTK","hlc_rifle_G36KMLIC","hlc_rifle_g3ka4", //NIarms
		"arifle_AK12U_F", "arifle_MSBS65_black_F", //Contact DLC
		"rhs_weap_ak103_npz","rhs_weap_ak104_zenitco_b33","rhs_weap_akm_zenitco01_b33","rhs_weap_mk17_STD", //RHS
		"r3f_SCAR_H_BLACK","r3f_HK417s_HG",//R3f
		"BWA3_G27" //BWA 
		], //_mainWeaps
	 [], //_mainWeapsAmmo
	 ["optic_mrco","rhsusf_acc_ACOG_USMC","rhs_acc_okp7_picatinny","rhsusf_acc_compm4","rhsusf_acc_su230","RKSL_optic_LDS","UK3CB_BAF_SUIT"], //_scopes
	 ["hlc_pistol_P229R_Combat","hlc_pistol_P229R_40Combat","hlc_pistol_P229R_357Combat"] //_pistols
];
WMS_Loadout_DMR = [
	 [
		"UK3CB_BAF_L129A1","hlc_rifle_FAL5000Rail","hlc_rifle_g3sg1ris","hlc_rifle_M14_Bipod_Rail","hlc_rifle_M21_Rail","srifle_DMR_03_F","R3F_SCAR_H_PR_20pcs_TAN","rhs_weap_svdp_npz","rhs_weap_sr25_ec","BWA3_G28",
		"arifle_MSBS65_Mark_black_F" //contact DLC
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["rhsusf_acc_ACOG_USMC","rhsusf_acc_su230","RKSL_optic_LDS","R3F_SB_PM_BLACK","optic_DMS","BWA3_optic_PMII_ShortdotCC","BWA3_optic_PMII_DMR"], //_scopes
	 ["hlc_pistol_P229R_Combat","hlc_pistol_P229R_40Combat","hlc_pistol_P229R_357Combat"] //_pistols
];
WMS_Loadout_MG = [ //arifle_RPK12_F, LMG_Mk200_black_F
	 [
		"hlc_lmg_minimipara","hlc_rifle_RPK12","rhs_weap_m249","hlc_lmg_m60","rhs_weap_mg42","LMG_03_F","hlc_rifle_MG36","rhs_weap_pkp",
		"R3F_FN_MAG58",//R3F
		"BWA3_MG4",//BWmod
		"arifle_RPK12_F", "LMG_Mk200_black_F", //contact DLC
		"UK3CB_BAF_L110A2RIS" //3CB
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [], //_scopes
	 ["hlc_pistol_P229R_Combat","hlc_pistol_P229R_40Combat","hlc_pistol_P229R_357Combat"] //_pistols
];
WMS_Loadout_Sniper = [
	 ["hlc_rifle_awmagnum","hlc_rifle_awmagnum_BL","hlc_rifle_awmagnum_FDE","hlc_rifle_FN3011Modern","hlc_rifle_M1903A1_unertl","BWA3_G29","srifle_LRR_F","UK3CB_BAF_L115A3_DE"], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_DMS","BWA3_optic_PMII_ShortdotCC","BWA3_optic_PMII_DMR","BWA3_optic_M5Xi_MSR","BWA3_optic_Hensoldt","optic_KHS_blk"], //_scopes
	 ["hlc_smg_mp5k","hlc_pistol_P229R_40Combat","hlc_pistol_P229R_357Combat"] //_pistols
];
WMS_Loadout_SMG = [
	 ["hlc_smg_mp510","hlc_smg_mp5a3","hlc_smg_mp5sd6","hlc_smg_9mmar","hlc_smg_mp5k_PDW","hlc_rifle_auga2para_b","rhs_weap_pp2000"], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_Aco_smg","optic_Holosight_smg_blk_F","BWA3_optic_MicroT2","BWA3_optic_CompM2","BWA3_optic_EOTech552"], //_scopes
	 ["hlc_pistol_P229R_Combat","hlc_pistol_P229R_40Combat","hlc_pistol_P229R_357Combat"] //_pistols
];

//AI LOADOUTS
WMS_Loadout_SURPAT = [
	["SURPAT_TP_Camo","SURPAT_TP_Camo_SS","SURPAT_Camo_Cyre","SURPAT_Camo_Cyre_TP","SURPAT_Camo_Cyre_TS"],//Uniform
	["SURPAT_Vest_1","SURPAT_Vest_2","SURPAT_Vest_3","SURPAT_Vest_4","SURPAT_Vest_5","SURPAT_Vest_6","SURPAT_Vest_7"],//Vest
	["SURPAT_Helmet1","SURPAT_Helmet2","SURPAT_Helmet3","SURPAT_Boonie"],//Helmet
	["SURPAT_Backpack_Compact","SURPAT_Backpack_Kitbag"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_AOR1 = [
	["AOR1_Camo_SS","AOR1_TP_Camo","AOR1_Camo_Cyre","AOR1_Camo_Cyre_TS","AOR1_Camo_Cyre_TP","AOR1_Camo_Cyre_GP"],//Uniform
	["AOR1_Vest_1","AOR1_Vest_2","AOR1_Vest_3","AOR1_Vest_4","AOR1_Vest_5","BWA3_Vest_JPC_Radioman_Tropen"],//Vest
	["AOR1_Helmet1","AOR1_Helmet2","AOR1_Boonie"],//Helmet
	["AOR1_Backpack_Kitbag","AOR1_Backpack_Compact","B_Kitbag_cbr","BWA3_AssaultPack_Tropen","BWA3_PatrolPack_Tropen","BWA3_Carryall_Tropen"],//Backpack
	["G_Balaclava_oli","G_Balaclava_blk"]  //_googles//_facewear
];
WMS_Loadout_MCB = [
	 ["MCB_Camo_Cyre","MCB_Camo_Cyre_TS","MCB_Camo_Cyre_TP","MCB_Camo_Cyre_GS","MCB_Camo_Cyre_GP"], //_uniforms
	 ["MCB_Vest_1","MCB_Vest_2","MCB_Vest_3","MCB_Vest_4","MCB_Vest_5","MCB_Vest_6","MCB_Vest_7"], //_vests
	 ["MCB_Helmet1","MCB_Helmet2","MCB_Boonie"], //_helmets
	 ["MCB_Backpack_Compact","MCB_Backpack_KitBag","MCB_Backpack_KitBag"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles//_facewear
];
WMS_Loadout_M90d = [
	 ["M90d_Camo_Cyre","M90d_Camo_Cyre_GS","M90d_Camo_Cyre_GP"], //_uniforms
	 ["M90d_Vest_1","M90d_Vest_2","M90d_Vest_3","M90d_Vest_4"], //_vests
	 ["M90d_Helmet1","M90d_Helmet2","M90d_Boonie"], //_helmets
	 ["M90d_Backpack_KitBag","B_AssaultPack_ocamo","B_Carryall_ocamo"], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_ABU = [
	 ["ABU_Camo_Cyre_Tee", "ABU_BS_Camo","ABU_BS_Camo_SS","ABU_Camo","ABU_Camo_Cyre","ABU_Camo_Cyre_GS","ABU_Camo_Cyre_TP","ABU_Camo_Cyre_TS","ABU_Camo_SS","ABU_GP_Camo","ABU_GP_Camo_SS","ABU_GS_Camo","ABU_GS_Camo_SS","ABU_Camo_Cyre_GP","ABU_BP_Camo","ABU_BP_Camo_SS"], //_uniforms
	 ["V_Chestrig_blk","V_TacVest_blk","V_TacVestIR_blk","V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk","ABU_Vest_1","ABU_Vest_2","ABU_Vest_3","ABU_Vest_4","ABU_Vest_5"], //_vests
	 ["H_HelmetB_black","H_HelmetB_plain_blk","H_HelmetSpecB_blk","H_HelmetSpecO_blk","ABU_Boonie","ABU_Cap","ABU_Helmet1","ABU_Helmet2"], //_helmets
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
WMS_Loadout_Bandit = [
	 ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F"], //_uniforms
	 [
		 "gm_dk_army_vest_m00_m84","gm_dk_army_vest_m00_m84_machinegunner","gm_gc_vest_combatvest3_str","gm_ge_vest_90_demolition_flk","gm_ge_vest_armor_90_rifleman_flk",
		 "V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVestCamo_khk","V_HarnessOSpec_brn","V_TacChestrig_cbr_F"], //_vests
	 ["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","R3F_beret","H_MilCap_ghex_F"], //_helmets
	 [
		 "gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_flk","gm_ge_army_backpack_90_trp","gm_ge_army_backpack_80_oli",
		 "B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan"
	 ], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_LightWeaps = [
	 [
	 "gm_akm_wud","gm_c7a1_oli","gm_m16a1_blk","gm_mpiak74n_brn",
	 "arifle_Mk20_plain_F","arifle_TRG20_F","hgun_PDW2000_F","SMG_03C_TR_camo","arifle_AKS_F","arifle_SPAR_01_khk_F",
	 "sgun_HunterShotgun_01_F"], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_Holosight","optic_ACO_grn","optic_MRCO","optic_Arco","optic_Holosight_khk_F","optic_Holosight_blk_F"], //_scopes
	 ["hgun_P07_F","hgun_Rook40_F"] //_pistols
];
WMS_Loadout_HeavyBandit = [
	 ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_C_E_LooterJacket_01_F"], //_uniforms
	 [
		"gm_dk_army_vest_m00_m84","gm_dk_army_vest_m00_m84_machinegunner","gm_gc_vest_combatvest3_str","gm_ge_vest_90_demolition_flk","gm_ge_vest_armor_90_rifleman_flk",
		"V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierIAGL_oli","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_EOD_coyote_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_heavy_EAF_F"
	 ], //_vests	
	 ["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","R3F_beret","H_MilCap_ghex_F","H_CrewHelmetHeli_O","H_PilotHelmetHeli_O","H_PilotHelmetFighter_O","H_HelmetCrew_O","H_HelmetB_light_desert","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetB_camo","H_HelmetSpecB_paint2"], //_helmets
	 [
		 "gm_dk_army_backpack_73_oli","gm_ge_army_backpack_90_flk","gm_ge_army_backpack_90_trp","gm_ge_army_backpack_80_oli",
		 "B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan","B_Carryall_ocamo","B_Carryall_taiga_F","B_Carryall_mcamo","B_Kitbag_mcamo","B_Kitbag_cbr"
	 ], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Weaps_HeavyBandit = [
	 [ //_mainWeaps,
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
	"rhs_weap_hk416d10_LMT",
	"rhs_weap_m16a4_imod",
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_mk18_KAC",
	"rhs_weap_m27iar",
	"rhs_weap_sr25_ec",
	"rhs_weap_m24sws_d",
	"rhs_weap_m40a5_d",
	"rhs_weap_m249",
	
	 "arifle_AK12_GL_arid_F",
	 "arifle_AK12_arid_F",
	 "arifle_MSBS65_sand_F",
	 "arifle_MSBS65_Mark_sand_F",
	 "arifle_MSBS65_GL_sand_F",
	 "arifle_MSBS65_UBS_sand_F",
	 "arifle_MX_SW_F",
	 //"LMG_Zafir_F",
	 "srifle_DMR_05_tan_f",
	 "srifle_DMR_06_camo_F",
	 "srifle_GM6_camo_F",
	 "srifle_LRR_tna_F"
	 ],
	 [], //_mainWeapsAmmo,
	 [ //_scopes
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_EOTECH",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG_RMR",
	"rhsusf_acc_M8541",
	"rhsusf_acc_LEUPOLDMK4",
	 "optic_Arco_arid_F",
	 "optic_Arco_AK_arid_F",
	 "optic_DMS_weathered_Kir_F",
	 "optic_SOS",
	 "optic_LRPS",
	 "optic_AMS"
	 ],
	 ["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F"] //_pistols
];
WMS_Loadout_Livonia = [
	 ["U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_F"], //_uniforms
	 ["V_SmershVest_01_F","V_SmershVest_01_radio_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_Olive_F"], //_vests
	 ["H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Booniehat_taiga"], //_helmets
	 ["B_Carryall_taiga_F","B_FieldPack_taiga_F","B_Carryall_taiga_F","B_FieldPack_taiga_F","I_E_UGV_02_Science_backpack_F","B_RadioBag_01_hex_F","B_AssaultPack_cbr","B_Carryall_cbr","B_FieldPack_cbr","B_Kitbag_cbr","B_LegStrapBag_coyote_F"], //_Backpacks //,"I_E_UGV_02_Demining_backpack_F"
	 ["G_RegulatorMask_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_02_black_F","G_Bandanna_tan","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Weaps_LivoniaMix = [
	 [ //_mainWeaps,
	"rhs_weap_hk416d10_LMT_wd",
	"rhs_weap_hk416d145_wd",
	"rhs_weap_m4a1_wd",
	"rhs_weap_m4a1_m203s_wd",
	"rhs_weap_m14_wd",
	"rhs_weap_XM2010_sa",
	 //"arifle_AK12_GL_arid_F",
	 "arifle_AK12_arid_F",
	 "arifle_RPK12_arid_F",
	 "arifle_AK12U_arid_F",
	 "arifle_MSBS65_sand_F",
	 "arifle_MSBS65_Mark_sand_F",
	 //"arifle_MSBS65_GL_sand_F",
	 "arifle_MSBS65_UBS_sand_F",
	 "SMG_03_khaki",
	 "LMG_Mk200_black_F",
	 //"srifle_DMR_06_hunter_F",
	 "srifle_DMR_05_tan_f"
	 ],
	 [], //_mainWeapsAmmo,
	 [ //_scopes
	 "optic_Holosight_arid_F",
	 "optic_Arco_arid_F",
	 "optic_Arco_AK_arid_F",
	 "optic_DMS_weathered_Kir_F"
	 ],
	 ["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","Exile_Weapon_Taurus","hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","Exile_Weapon_Taurus","hlc_pistol_DL44"] //_pistols
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