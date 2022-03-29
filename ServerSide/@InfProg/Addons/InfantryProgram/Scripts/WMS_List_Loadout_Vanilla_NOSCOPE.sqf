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
NONE
*/
if !(WMS_exileFireAndForget) then {
WMS_AI_inventory = [
	"Antimalaricum","Antibiotic",//"AntimalaricumVaccine",
	"Money_bunch","Money_roll","Money_stack","Money_stack_quest",
	"Laserbatteries","Laserbatteries",
	"Csat_Id_01","Csat_Id_02","Csat_Id_03","Csat_Id_04","Csat_Id_05",
	"FilesSecret","FileNetworkStructure","FileTopSecret","DocumentsSecret","Wallet_ID","FlashDisk","ButaneCanister","Keys"	
];
};
/////////////////////////////////
//			LOADOUTS - DEFAULT IS "VANILLA"
/////////////////////////////////
//Players/BLUFOR Loadouts
WMS_Loadout_AOR2 = [//GREEN
	 [
"U_B_T_Soldier_F"
		 ], //_uniforms
	 [
"V_PlateCarrierGL_rgr",
"V_PlateCarrier1_rgr",
"V_PlateCarrier2_rgr",
"V_PlateCarrierSpec_rgr",
"V_Chestrig_rgr",
"V_TacChestrig_grn_F"
		 ], //_vests
	 [
"H_Watchcap_camo",
"H_Cap_grn",
"H_HelmetB_grass",
"H_HelmetB",
"H_HelmetB_snakeskin",
"H_HelmetSpecB",
"H_HelmetSpecB_paint1",
"H_HelmetSpecB_snakeskin"
		 ], //_helmets
	 [
"B_AssaultPack_rgr",
"B_Carryall_green_F",
"B_FieldPack_green_F",
"B_Kitbag_rgr",
"B_LegStrapBag_olive_F",
"B_TacticalPack_rgr",
"B_ViperHarness_oli_F",
"B_ViperLightHarness_oli_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_M90 = [//WOODLAND
	 [
"U_B_CBRN_Suit_01_Wdl_F",
"U_B_CombatUniform_mcam_wdl_f",
"U_B_CombatUniform_tshirt_mcam_wdL_f",
"U_B_CombatUniform_vest_mcam_wdl_f"
		 ], //_uniforms
	 [
"V_PlateCarrierGL_wdl",
"V_PlateCarrier1_wdl",
"V_PlateCarrier2_wdl",
"V_PlateCarrierSpec_wdl"
		 ], //_vests
	 [
"H_Booniehat_wdl",
"H_MilCap_wdl",
"H_HelmetB_plain_wdl",
"H_HelmetSpecB_wdl",
"H_HelmetB_light_wdl"
		 ], //_helmets
	 [
"B_AssaultPack_wdl_F",
"B_Carryall_wdl_F",
"B_RadioBag_01_wdl_F"
		 ], //_Backpacks
	 [
		 "G_Balaclava_oli"//,"G_Balaclava_blk"
		 ]  //_googles/_facewear
];
WMS_Loadout_Scorpion = [//MTP
	 [
"U_B_CBRN_Suit_01_MTP_F",
"U_B_CombatUniform_mcam",
"U_B_CombatUniform_mcam_tshirt",
"U_B_CombatUniform_mcam_vest",
"U_B_CombatUniform_mcam_worn"
		 ], //_uniforms
	 [
"V_PlateCarrierGL_mtp",
"V_PlateCarrierSpec_mtp"
		 ], //_vests
	 [
"H_Booniehat_mcamo",
"H_Cap_tan_specops_US",
"H_HelmetB_grass",
//"H_HelmetB",
"H_HelmetB_snakeskin",
//"H_HelmetSpecB",
"H_HelmetSpecB_paint1",
"H_HelmetSpecB_snakeskin"
		 ], //_helmets
	 [
"B_Kitbag_mcamo",
"B_AssaultPack_mcamo",
"B_Carryall_mcamo",
"B_RadioBag_01_mtp_F",
"B_TacticalPack_mcamo"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_Tiger = [//GEOMETRIC
	 [
"U_I_E_CBRN_Suit_01_EAF_F",
"U_I_E_Uniform_01_shortsleeve_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_E_Uniform_01_F"
		 ], //_uniforms
	 [
"V_CarrierRigKBT_01_heavy_EAF_F",
"V_CarrierRigKBT_01_light_EAF_F",
"V_CarrierRigKBT_01_EAF_F"
		 ], //_vests
	 [
"H_HelmetCrew_I_E",
"H_Booniehat_eaf",
"H_Tank_eaf_F"
		 ], //_helmets
	 [
"B_AssaultPack_eaf_F",
"B_Carryall_eaf_F",
"B_RadioBag_01_eaf_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_UKtmp = [//GEOMETRIC
	 [
"U_I_E_CBRN_Suit_01_EAF_F",
"U_I_E_Uniform_01_shortsleeve_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_E_Uniform_01_F"
		 ], //_uniforms
	 [
"V_CarrierRigKBT_01_heavy_EAF_F",
"V_CarrierRigKBT_01_light_EAF_F",
"V_CarrierRigKBT_01_EAF_F"
		 ], //_vests
	 [
"H_HelmetCrew_I_E",
"H_Booniehat_eaf",
"H_Tank_eaf_F"
		 ], //_helmets
	 [
"B_AssaultPack_eaf_F",
"B_Carryall_eaf_F",
"B_RadioBag_01_eaf_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_UKwdl = [//GEOMETRIC
	 [
"U_I_E_CBRN_Suit_01_EAF_F",
"U_I_E_Uniform_01_shortsleeve_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_E_Uniform_01_F"
		 ], //_uniforms
	 [
"V_CarrierRigKBT_01_heavy_EAF_F",
"V_CarrierRigKBT_01_light_EAF_F",
"V_CarrierRigKBT_01_EAF_F"
		 ], //_vests
	 [
"H_HelmetCrew_I_E",
"H_Booniehat_eaf",
"H_Tank_eaf_F"
		 ], //_helmets
	 [
"B_AssaultPack_eaf_F",
"B_Carryall_eaf_F",
"B_RadioBag_01_eaf_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_FRce = [//GEOMETRIC
	 [
"U_I_E_CBRN_Suit_01_EAF_F",
"U_I_E_Uniform_01_shortsleeve_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_E_Uniform_01_F"
		 ], //_uniforms
	 [
"V_CarrierRigKBT_01_heavy_EAF_F",
"V_CarrierRigKBT_01_light_EAF_F",
"V_CarrierRigKBT_01_EAF_F"
		 ], //_vests
	 [
"H_HelmetCrew_I_E",
"H_Booniehat_eaf",
"H_Tank_eaf_F"
		 ], //_helmets
	 [
"B_AssaultPack_eaf_F",
"B_Carryall_eaf_F",
"B_RadioBag_01_eaf_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_DEfleck = [//GEOMETRIC
	 [
"U_I_E_CBRN_Suit_01_EAF_F",
"U_I_E_Uniform_01_shortsleeve_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_E_Uniform_01_F"
		 ], //_uniforms
	 [
"V_CarrierRigKBT_01_heavy_EAF_F",
"V_CarrierRigKBT_01_light_EAF_F",
"V_CarrierRigKBT_01_EAF_F"
		 ], //_vests
	 [
"H_HelmetCrew_I_E",
"H_Booniehat_eaf",
"H_Tank_eaf_F"
		 ], //_helmets
	 [
"B_AssaultPack_eaf_F",
"B_Carryall_eaf_F",
"B_RadioBag_01_eaf_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli","G_Balaclava_blk"]  //_googles/_facewear
];

//////////Weapons [WMS_Loadout_Assault, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Loadout_SMG];
WMS_Loadout_Assault = [
	 [
"arifle_AK12_F",
"arifle_AK12_GL_F",
"arifle_AKM_F",
"arifle_AKS_F",
"arifle_AK12U_F",
"arifle_CTAR_blk_F",
"arifle_CTAR_GL_blk_F",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_MX_Black_F",
"arifle_MXC_Black_F",
"arifle_MSBS65_F",
"arifle_MSBS65_black_F",
"arifle_MSBS65_GL_F",
"arifle_MSBS65_GL_black_F",
"arifle_SPAR_01_blk_F",
"arifle_SPAR_02_blk_F",
"arifle_ARX_blk_F"
		], //_mainWeaps
	 [], //_mainWeapsAmmo
	 [
	 "optic_Holosight_arid_F",
	 "optic_Holosight",
	 "optic_ACO_grn",
	 "optic_Holosight_khk_F",
	 "optic_Holosight_blk_F"
		 ], //_scopes
	 [
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_P07_blk_F",
"hgun_P07_khk_F",
"hgun_Pistol_01_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F"
		 ] //_pistols
];
WMS_Loadout_DMR = [
	 [
"srifle_DMR_06_hunter_F",
"arifle_MXM_F",
"arifle_MXM_Black_F",
"arifle_MXM_khk_F",
"arifle_MSBS65_Mark_F",
"arifle_MSBS65_Mark_black_F",
"arifle_MSBS65_Mark_camo_F",
"arifle_MSBS65_Mark_sand_F",
"arifle_SPAR_03_blk_F",
"arifle_SPAR_03_khk_F",
"arifle_SPAR_03_snd_F",
"srifle_DMR_07_blk_F",
"srifle_DMR_07_ghex_F",
"srifle_DMR_07_hex_F",
"srifle_DMR_03_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"srifle_DMR_01_F"
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [
	 "optic_Holosight_arid_F",
	 "optic_Holosight",
	 "optic_ACO_grn",
	 "optic_Holosight_khk_F",
	 "optic_Holosight_blk_F"
		 ], //_scopes
	 [
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_P07_blk_F",
"hgun_P07_khk_F",
"hgun_Pistol_01_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F"
		 ] //_pistols
];
WMS_Loadout_MG = [
	 [
"arifle_CTARS_blk_F",
"arifle_CTARS_ghex_F",
"arifle_CTARS_hex_F",
"arifle_RPK12_F",
"arifle_RPK12_arid_f",
"arifle_RPK12_lush_f",
"LMG_03_F",
"LMG_Mk200_F",
"LMG_Mk200_black_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"arifle_MX_SW_khk_F",
"LMG_Zafir_F"
		], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [], //_scopes
	 [
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_P07_blk_F",
"hgun_P07_khk_F",
"hgun_Pistol_01_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F"
		 ] //_pistols
];
WMS_Loadout_Sniper = [
	 [
"srifle_DMR_05_hex_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_tan_f",
"srifle_GM6_F",
"srifle_GM6_camo_F",
"srifle_GM6_ghex_F",
"srifle_LRR_F",
"srifle_LRR_camo_F",
"srifle_LRR_tna_F",
"srifle_DMR_02_F",
"srifle_DMR_02_camo_F",
"srifle_DMR_02_sniper_F"
		 ], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [
	 "optic_Holosight_arid_F",
	 "optic_Holosight",
	 "optic_ACO_grn",
	 "optic_Holosight_khk_F",
	 "optic_Holosight_blk_F"
	 ], //_scopes
	 [
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_P07_blk_F",
"hgun_P07_khk_F",
"hgun_Pistol_01_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F"
		 ] //_pistols
];
WMS_Loadout_SMG = [
	 [
"hgun_PDW2000_F",
"SMG_05_F",
"SMG_02_F",
"SMG_01_F",
//"SMG_03_black",
"SMG_03_camo",
"SMG_03_hex",
//"SMG_03_khaki",
//"SMG_03C_black",
"SMG_03C_camo",
"SMG_03C_hex"
//"SMG_03C_khaki"
		 ], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 ["optic_Aco_smg","optic_Holosight_smg_blk_F"], //_scopes
	 [
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_01_green_F",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_P07_blk_F",
"hgun_P07_khk_F",
"hgun_Pistol_01_F",
"hgun_Rook40_F",
"hgun_Pistol_heavy_02_F"
		 ] //_pistols
];

//AI LOADOUTS
WMS_Loadout_MCB = [ //BLACK
	 [
"U_O_R_Gorka_01_black_F"
		 ], //_uniforms
	 [
"V_PlateCarrierGL_blk",
"V_PlateCarrier1_blk",
"V_PlateCarrier2_blk",
"V_PlateCarrierSpec_blk",
"V_Chestrig_blk",
"V_BandollierB_blk"
		 ], //_vests
	 [
"H_Cap_blk",
"H_HelmetSpecO_blk",
"H_PASGT_basic_black_F",
"H_HelmetB_black",
"H_HelmetSpecB_blk",
"H_HelmetB_light_black"
		 ], //_helmets
	 [
"B_AssaultPack_blk",
"B_FieldPack_blk",
"B_LegStrapBag_black_F",
"B_RadioBag_01_black_F",
"B_TacticalPack_blk",
"B_ViperHarness_blk_F",
"B_ViperLightHarness_blk_F"
		 ], //_Backpacks
	 ["G_Balaclava_blk"]  //_googles//_facewear
];
WMS_Loadout_M90d = [ //HEX or  //GRENN HEX
	 [
"U_O_T_Soldier_F"
		 ], //_uniforms
	 [
"V_HarnessOGL_ghex_F",
"V_HarnessO_ghex_F",
"V_BandollierB_ghex_F",
"V_SmershVest_01_F", //CONTACT
"V_SmershVest_01_radio_F", //CONTACT
"V_CarrierRigKBT_01_heavy_olive_F", //CONTACT
"V_CarrierRigKBT_01_light_olive_F", //CONTACT
"V_CarrierRigKBT_01_olive_F" //CONTACT
		 ], //_vests
	 [
"H_MilCap_ghex_F",
"H_HelmetSpecO_ghex_F",
"H_HelmetCrew_O_ghex_F",
"H_HelmetLeaderO_ghex_F",
"H_HelmetO_ghex_F"
		 ], //_helmets
	 [
"B_FieldPack_ghex_F",
"B_RadioBag_01_ghex_F",
"B_Carryall_ghex_F",
"B_ViperHarness_ghex_F",
"B_ViperLightHarness_ghex_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli"]  //_googles/_facewear
];
WMS_Loadout_ABU = [ //URBAN
	 [
"U_O_CombatUniform_oucamo"
		], //_uniforms
	 ["V_Chestrig_blk","V_TacVest_blk","V_TacVestIR_blk","V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk"
	 ], //_vests
	 [
"H_HelmetLeaderO_oucamo",
"H_HelmetO_oucamo"
	 ], //_helmets
	 [
"B_Carryall_oucamo",
"B_RadioBag_01_oucamo_F",
"B_FieldPack_oucamo"
	 ], //_Backpacks
	 ["G_Balaclava_blk"]  //_googles/_facewear
];
WMS_Loadout_AOR1 = [ //HEX or  //GRENN HEX
	 [
"U_O_T_Soldier_F"
		 ], //_uniforms
	 [
"V_HarnessOGL_ghex_F",
"V_HarnessO_ghex_F",
"V_BandollierB_ghex_F",
"V_SmershVest_01_F", //CONTACT
"V_SmershVest_01_radio_F", //CONTACT
"V_CarrierRigKBT_01_heavy_olive_F", //CONTACT
"V_CarrierRigKBT_01_light_olive_F", //CONTACT
"V_CarrierRigKBT_01_olive_F" //CONTACT
		 ], //_vests
	 [
"H_MilCap_ghex_F",
"H_HelmetSpecO_ghex_F",
"H_HelmetCrew_O_ghex_F",
"H_HelmetLeaderO_ghex_F",
"H_HelmetO_ghex_F"
		 ], //_helmets
	 [
"B_FieldPack_ghex_F",
"B_RadioBag_01_ghex_F",
"B_Carryall_ghex_F",
"B_ViperHarness_ghex_F",
"B_ViperLightHarness_ghex_F"
		 ], //_Backpacks
	 ["G_Balaclava_oli"]  //_googles/_facewear
];
WMS_Loadout_SURPAT = [ //URBAN
	 [
"U_O_CombatUniform_oucamo"
		], //_uniforms
	 ["V_Chestrig_blk","V_TacVest_blk","V_TacVestIR_blk","V_PlateCarrierGL_blk","V_PlateCarrierSpec_blk"
	 ], //_vests
	 [
"H_HelmetLeaderO_oucamo",
"H_HelmetO_oucamo"
	 ], //_helmets
	 [
"B_Carryall_oucamo",
"B_RadioBag_01_oucamo_F",
"B_FieldPack_oucamo"
	 ], //_Backpacks
	 ["G_Balaclava_blk"]  //_googles/_facewear
];

WMS_Loadout_Scientist = [ //NEED SPECCIFIC STUFF !!!
	 ["U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_Competitor","U_C_man_sport_2_F","U_C_Man_casual_3_F","U_C_Man_casual_5_F"], //_uniforms
	 ["V_BandollierB_blk","V_Chestrig_blk","V_TacVest_blk","V_Pocketed_black_F"], //_vests
	 ["H_Cap_blu","H_MilCap_blue","H_Hat_blue","H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_HeadBandage_bloody_F"], //_helmets
	 ["B_FieldPack_oucamo","B_FieldPack_blk","B_Messenger_IDAP_F"], //_Backpacks
	 []  //_googles/_facewear
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
	 ["V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_TacVestCamo_khk","V_HarnessOSpec_brn","V_TacChestrig_cbr_F"], //_vests
	 ["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","H_MilCap_ghex_F"], //_helmets
	 ["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Loadout_LightWeaps = [
	 ["arifle_Mk20_plain_F","arifle_TRG20_F","hgun_PDW2000_F","SMG_03C_TR_camo","arifle_AKS_F","arifle_SPAR_01_khk_F","sgun_HunterShotgun_01_F"], //_mainWeaps,
	 [], //_mainWeapsAmmo,
	 [], //_scopes
	 ["hgun_P07_F","hgun_Rook40_F"] //_pistols
];
WMS_Loadout_HeavyBandit = [
	 ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_I_L_Uniform_01_tshirt_skull_F","U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_C_E_LooterJacket_01_F"], //_uniforms
	 ["V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierIAGL_oli","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_EOD_coyote_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_heavy_EAF_F"], //_vests
	 ["H_Booniehat_khk","H_Cap_headphones","H_Shemag_olive","H_Shemag_tan","H_Watchcap_khk","H_MilCap_ghex_F","H_CrewHelmetHeli_O","H_PilotHelmetHeli_O","H_PilotHelmetFighter_O","H_HelmetCrew_O","H_HelmetB_light_desert","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetB_camo","H_HelmetSpecB_paint2"], //_helmets
	 ["B_AssaultPack_khk","B_FieldPack_khk","B_OutdoorPack_tan","B_Carryall_ocamo","B_Carryall_taiga_F","B_Carryall_mcamo","B_Kitbag_mcamo","B_Kitbag_cbr"], //_Backpacks
	 []  //_googles/_facewear
];
WMS_Weaps_HeavyBandit = [
	 [ //_mainWeaps,
"arifle_AK12U_arid_f",
"arifle_CTAR_hex_F",
"arifle_CTAR_GL_hex_F",
//"arifle_Mk20_plain_F",
//"arifle_Mk20C_plain_F",
"arifle_MX_F",
//"arifle_MXC_F",
"arifle_SPAR_01_snd_F",
"arifle_SPAR_02_snd_F",
"arifle_ARX_hex_F",	
	 "arifle_AK12_GL_arid_F",
	 "arifle_AK12_arid_F",
	 "arifle_RPK12_arid_F",
	 "arifle_MSBS65_sand_F",
	 "arifle_MSBS65_Mark_sand_F",
	 "arifle_MSBS65_GL_sand_F",
	 "arifle_MSBS65_UBS_sand_F",
	 "LMG_Mk200_black_F",
	 "arifle_MX_SW_F",
	 "LMG_Zafir_F",
	 "srifle_DMR_05_tan_f",
	 "srifle_DMR_06_camo_F",
	 "srifle_GM6_camo_F",
	 "srifle_LRR_tna_F"
	 ],
	 [], //_mainWeapsAmmo,
	 [ //_scopes
	 "optic_Holosight",
	 "optic_ACO_grn",
	 "optic_Holosight_khk_F",
	 "optic_Holosight_blk_F"
	 ],
	 ["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F"
	 ] //_pistols
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
"arifle_AK12_lush_f",
"arifle_AK12_GL_lush_F",
"arifle_AK12U_lush_f",
"arifle_CTAR_ghex_F",
"arifle_CTAR_GL_ghex_F",
//"arifle_Mk20_F",
//"arifle_Mk20C_F",
"arifle_MX_khk_F",
//"arifle_MXC_khk_F",
"arifle_MSBS65_camo_F",
"arifle_MSBS65_GL_camo_F",
"arifle_SPAR_01_khk_F",
"arifle_SPAR_02_khk_F",
"arifle_ARX_ghex_F",
	 "arifle_AK12_arid_F",
	 "arifle_RPK12_arid_F",
	 "arifle_AK12U_arid_F",
	 "arifle_MSBS65_sand_F",
	 "arifle_MSBS65_Mark_sand_F",
	 "arifle_MSBS65_UBS_sand_F",
	 "SMG_03_khaki",
	 "LMG_Mk200_black_F",
	 "srifle_DMR_05_tan_f"
	 ],
	 [], //_mainWeapsAmmo,
	 [ //_scopes
	 "optic_Holosight_arid_F",
	 "optic_Holosight",
	 "optic_ACO_grn",
	 "optic_Holosight_khk_F",
	 "optic_Holosight_blk_F"
	 ],
	 ["hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","hgun_Pistol_heavy_01_F"
	 ] //_pistols
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