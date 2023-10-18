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
////////////////////
//OPFOR Vehicles with custom textures ["vehicleClasseName",["texture 0","texture 1"],[[weaponToRemove, position],[weaponToAdd, position]]]; 
//[ cursorTarget, ["rhs_sand",1],  true, false ] call BIS_fnc_initVehicle; 
//[ _vehicle, [(_CustomVHL select 1 select 0),(_CustomVHL select 1 select 1)], true, false ] call BIS_fnc_initVehicle;
////////////////////
WMS_OPFOR_CustomVHL_Unarmed = [
	["rhs_tigr_m_3camo_msv",[],[[],[]]],
	["rhsusf_M1238A1_socom_d",[],[[],[]]],
	["rhsusf_M1239_socom_d",[],[[],[]]],
	["rhsusf_mrzr4_d",[],[[],[]]],
	["rhsusf_m1025_d",[],[[],[]]],
	["rhsusf_m998_d_2dr",[],[[],[]]],
	["rhsusf_m998_d_4dr_fulltop",[],[[],[]]],
	["rhsusf_m998_d_4dr_fulltop",[],[[],[]]],
	["rhsusf_m998_d_4dr_fulltop",[],[[],[]]],
	["rhsusf_m1025_d",[],[[],[]]],
	["rhsusf_m1151_usarmy_d",[],[[],[]]],
	["rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1078A1P2_D_open_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1078A1P2_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1084A1P2_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1084A1P2_B_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1083A1P2_B_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1232_usarmy_d",[],[[],[]]],
	["rhsusf_M1078A1P2_B_D_fmtv_usarmy",[],[[],[]]],
	["rhs_uaz_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\uaz_main_ind_co.paa"],[[],[]]], //
	["rhs_uaz_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\uaz_main_ind_co.paa"],[[],[]]], //
	["rhs_uaz_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\uaz_main_ind_co.paa"],[[],[]]], //
	["rhs_uaz_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\uaz_main_ind_co.paa"],[[],[]]], //
	//["C_SUV_01_F",[],[[],[]]],
	["rhs_gaz66_ammo_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_gaz66_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_gaz66_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_gaz66_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["B_LSV_01_unarmed_sand_F",[],[[],[]]],
	["rhsusf_m1240a1_usarmy_d",[],[[],[]]]
];
WMS_OPFOR_CustomVHL_Armed = [
	["rhsusf_m1165a1_gmv_m134d_m240_socom_d",[],[[],[]]],
	//["I_C_Offroad_02_LMG_F",[],[[],[]]],
	["rhsusf_m1151_m240_v2_usarmy_d",[],[[],[]]],
	["rhsusf_m1151_m240_v2_usarmy_d",[],[[],[]]],
	["rhs_btr60_vv",[0,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\btr60_body_co.paa",1,"rhsgref\addons\rhsgref_vehicles_ret\data\tak\btr60_details_co.paa"],[[],[]]],
	["rhs_prp3_vv",[1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa",2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa",5,"rhsafrf\addons\rhs_bmp_camo\data\bmp_6_desert_co.paa"],[[],[]]],
	["rhsusf_m1240a1_m240_usarmy_d",[],[[],[]]],
	["rhsusf_m1240a1_m240_uik_usarmy_d",[],[[],[]]],
	["rhsusf_m113d_usarmy",[],[[],[]]],
	["rhsusf_m113d_usarmy_M240",[],[[],[]]],
	["rhsusf_m113d_usarmy_M240",[],[[],[]]],
	["rhsusf_stryker_m1127_m2_d",["Tan",1],[[],[]]], //useless
	//["rhsusf_M1239_M2_Deploy_socom_d",[],[[],[]]] //NOPE
	["rhsgref_BRDM2_HQ_msv",["takistan",1],[[],[]]]
];
WMS_OPFOR_CustomVHL_Spec = [
	["rhs_btr80a_vv",[0,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_01_tri01_co.paa",1,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_02_tri01_co.paa",2,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_03_tri01_co.paa"],[[],[]]],
	["rhs_brm1k_vv",[1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa",2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa",4,"rhsafrf\addons\rhs_bmp_camo\data\bmp_5_desert_co.paa"],[[],[]]],
	["rhs_t72bc_tv",[0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01_sand_co.paa",1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02_sand_co.paa",2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"],[[],[]]],
	["RHS_Ural_Zu23_VV_01",[0,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_tka_co.paa",1,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_open_tka_co.paa"],[[],[]]],
	["rhs_gaz66_zu23_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_btr70_vv",[0,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_1_co.paa",1,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_2_co.paa"],[[],[]]],
	["RHS_M2A3",[],[[],[]]],
	//["R3F_PANDUR_DA",[],[[],[]]],
	["rhsusf_m1a2sep1tuskid_usarmy",[],[[],[]]]
];
WMS_OPFOR_CustomAIR_Transport = [
	["RHS_Mi24Vt_vvsc",["Camo3",1],[[],[]]], //one minigun
	["RHS_Mi8AMT_vvsc",[],[[],[]]],
	["rhsgref_ins_Mi8amt",["Camo5",1],[[],[]]],
	["O_Heli_Transport_04_covered_black_F",[],[[],[]]], //black taru
	["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]] //black huron
];
WMS_OPFOR_CustomAIR_Unarmed = [
	["RHS_Mi8AMT_vvsc",[],[[],[]]],
	["rhsgref_ins_Mi8amt",["Camo5",1],[[],[]]],
	["RHS_UH60M2_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	["RHS_UH1Y_UNARMED_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]]
];
WMS_OPFOR_CustomAIR_Armed = [
	["RHS_Mi24Vt_vvsc",["Camo3",1],[[],[]]], //one minigun
	["RHS_Mi8mt_vv",[],[[],[]]],
	["rhs_uh1h_hidf",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	//["B_CTRG_Heli_Transport_01_sand_F",[],[[],[]]],//GO-FUCK-YOURSELF
	["RHS_UH60M_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	["RHS_UH1Y_FFAR_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]],
	["RHS_UH1Y_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]],
	["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]]
];
WMS_OPFOR_CustomAIR_Spec = [
	//["UK3CB_BAF_Apache_AH1",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //from Mi280 ,"\rhsafrf\addons\rhs_mi28\data\rhs_mi28_01_camo_co.paa"
	//["UK3CB_BAF_Wildcat_AH1_CAS_8C",[0,"R3F_Retex\data\LYNX\heli_light_03_DA_R3F_co.paa"],[[],[]]],
	//["O_T_VTOL_02_infantry_grey_F",[],[[],[]]], //big OP shit from bohemia, as usual
	["RHS_Ka52_UPK23_vvsc",[],[[],[]]],
	["RHS_Mi8AMTSh_UPK23_vvsc",[],[[],[]]],
	["RHS_Mi8MTV3_UPK23_vvsc",[],[[],[]]],
	["RHS_Mi24P_vvsc",[],[[],[]]],
	["RHS_Mi24V_FAB_vvsc",[],[[],[]]]
];
WMS_OPFOR_CustomSEA = [
	["O_Boat_Armed_01_hmg_F",[],[[],[]]],
	["O_T_Boat_Armed_01_hmg_F",[],[[],[]]]
];
WMS_AMS_LightArmed = [
	["rhsusf_m1165a1_gmv_m134d_m240_socom_d",[],[[],[]]],
	["B_T_LSV_01_armed_sand_F",[],[[],[]]],
	["O_LSV_02_armed_black_F",[],[[],[]]],
	["O_G_Offroad_01_AT_F",[],[[],[]]], //RED
	["I_C_Offroad_02_LMG_F",[],[[],[]]],
	["I_C_Offroad_02_AT_F",[],[[],[]]],
	["rhsusf_m1151_m2_v3_usmc_d",[],[[],[]]], //TO ADD TO TRADER
	["rhsusf_m113d_usarmy_M240",[],[[],[]]], //doesnt exist
	["rhs_tigr_sts_3camo_vdv",[],[[],[]]] //TO ADD TO TRADER //
];
WMS_AMS_APC = [
	["B_APC_Wheeled_01_cannon_F",[],[[],[]]], //Marshall
	["B_APC_Wheeled_03_cannon_F",["Guerilla_02",1],[[],[]]],
	["rhs_brm1k_vv",[1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa",2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa",4,"rhsafrf\addons\rhs_bmp_camo\data\bmp_5_desert_co.paa"],[[],[]]],
	["RHS_Ural_Zu23_VV_01",[0,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_tka_co.paa",1,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_open_tka_co.paa"],[[],[]]],
	["rhs_gaz66_zu23_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_btr70_vv",[0,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_1_co.paa",1,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_2_co.paa"],[[],[]]],
	["RHS_M2A3",[],[[],[]]],
	["I_E_APC_tracked_03_cannon_F",[],[[],[]]], 
	["O_APC_Tracked_02_cannon_F",[],[[],[]]],
	["rhs_btr80a_vv",[0,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_01_tri01_co.paa",1,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_02_tri01_co.paa",2,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_03_tri01_co.paa"],[[],[]]]
];
WMS_AMS_HeavyArmed = [
	["rhs_t72bc_tv",[0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01_sand_co.paa",1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02_sand_co.paa",2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"],[[],[]]],
	["B_AFV_Wheeled_01_cannon_F",[],[[],[]]], //Rhino
	["B_AFV_Wheeled_01_up_cannon_F",[],[[],[]]], //Rhino up
	["B_MBT_01_cannon_F",[],[[],[]]], //Slammer
	["rhs_t90_tv", [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_01_sand_co.paa",4,"rhsafrf\addons\rhs_t72_camo\data\rhs_t90am_01_sand_co.paa",6,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_e_01_sand_co.paa"],[[],[]]],
	["rhs_t90sab_tv", [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_01_sand_co.paa",4,"rhsafrf\addons\rhs_t72_camo\data\rhs_t90am_01_sand_co.paa",6,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_e_01_sand_co.paa"],[[],[]]],
	["rhs_t80u45m", [0,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_01_co.paa",1,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_02_co.paa",2,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_03_co.paa"],[[],[]]],
	["rhs_t80ue1", [0,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_01_co.paa",1,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_02_co.paa",2,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_03_co.paa"],[[],[]]],
	["rhsusf_m1a2sep1tuskid_usarmy",[],[[],[]]]
];
WMS_AMS_LightRwds = [
	["B_LSV_01_unarmed_olive_F",[],[[],[]]],
	["B_CTRG_LSV_01_light_F",[],[[],[]]],
	["O_LSV_02_unarmed_ghex_F",[],[[],[]]],
	["I_E_Offroad_01_covered_F",[],[[],[]]],
	["I_E_Offroad_01_comms_F",[],[[],[]]],
	["B_G_Van_01_transport_F",[],[[],[]]],
	["B_G_Van_01_fuel_F",[],[[],[]]],
	["B_G_Offroad_01_F",[],[[],[]]],
	["C_Offroad_02_unarmed_blue_F",[],[[],[]]]
];
WMS_AMS_TruckRwds = [
	["O_T_Truck_03_transport_ghex_F",[],[[],[]]],
	["O_T_Truck_03_covered_ghex_F",[],[[],[]]],
	["O_T_Truck_03_device_ghex_F",[],[[],[]]],
	["O_T_Truck_03_fuel_ghex_F",[],[[],[]]],
	["B_T_Truck_01_transport_F",[],[[],[]]],
	["B_T_Truck_01_covered_F",[],[[],[]]],
	["B_T_Truck_01_mover_F",[],[[],[]]],
	["O_T_Truck_02_transport_F",[],[[],[]]],
	["O_T_Truck_02_F",[],[[],[]]],
	["B_T_Truck_01_flatbed_F",[],[[],[]]],
	["I_E_Truck_02_F",[],[[],[]]],
	["I_E_Truck_02_transport_F",[],[[],[]]]
];
WMS_AMS_SpclRwds = [
	["B_Truck_01_ammo_F",[],[[],[]]],
	["B_T_Truck_01_ammo_F",[],[[],[]]],
	["O_Truck_03_ammo_F",[],[[],[]]],
	["O_Truck_02_Ammo_F",[],[[],[]]],
	["O_T_Truck_03_ammo_ghex_F",[],[[],[]]],
	["O_Truck_03_device_F",[],[[],[]]],
	["O_T_Truck_03_device_ghex_F",[],[[],[]]],
	["O_T_Truck_03_repair_ghex_F",[],[[],[]]], //repair
	["I_E_Truck_02_Box_F",[],[[],[]]], //repair
	["I_E_Truck_02_Ammo_F",[],[[],[]]],
	["I_E_Truck_02_fuel_F",[],[[],[]]],
	["O_T_Truck_02_fuel_F",[],[[],[]]],
	["O_T_Truck_03_fuel_ghex_F",[],[[],[]]],
	["B_T_Truck_01_fuel_F",[],[[],[]]],
	["O_T_Truck_02_Ammo_F",[],[[],[]]]
];
WMS_AMS_ArmoredLightRwds = [
	//["R3F_FENNEC_CE",[],[[],[]]],
	//["R3F_MATV_CE",[],[[],[]]],
	["rhsusf_m1240a1_m2crows_usarmy_wd",[],[[],[]]],
	["rhsusf_m1240a1_m240_uik_usarmy_wd",[],[[],[]]],
	["rhsusf_m1240a1_m2_uik_usarmy_wd",[],[[],[]]],
	["rhsusf_M1117_W",[],[[],[]]],
	["rhsusf_CGRCAT1A2_Mk19_usmc_wd",[],[[],[]]],
	["rhsusf_CGRCAT1A2_M2_usmc_wd",[],[[],[]]],
	["rhsgref_BRDM2_vdv",[],[[],[]]],
	["rhsgref_BRDM2_ATGM_vdv",[],[[],[]]],
	["O_T_MRAP_02_ghex_F",[],[[],[]]],
	["B_T_MRAP_01_F",[],[[],[]]],
	["I_MRAP_03_F",[],[[],[]]]
];
//NEW
WMS_AMS_ArmoredREDRwds = [
	["rhs_t72ba_tv",[],[[],[]]],
	["rhs_t72bb_tv",[],[[],[]]],
	["rhs_t72bc_tv",[],[[],[]]],
	["rhs_t72bd_tv",[],[[],[]]],
	["rhs_t72be_tv",[],[[],[]]],
	["rhs_t80",[],[[],[]]],
	["rhs_t80b",[],[[],[]]],
	["rhs_t80bk",[],[[],[]]],
	["rhs_t80bvk",[],[[],[]]],
	["rhs_t80um",[],[[],[]]],
	["rhs_t90_tv",[],[[],[]]],
	["rhs_t90saa_tv",[],[[],[]]],
	["rhs_t90sm_tv",[],[[],[]]],
	["rhs_t90a_tv",[],[[],[]]],
	["rhs_t90sab_tv",[],[[],[]]]
];
WMS_AMS_ArmoredBLUERwds = [
	["rhsusf_m1a1aimwd_usarmy",[],[[],[]]],
	["rhsusf_m1a2sep1tuskiiwd_usarmy",[],[[],[]]],
	["rhsusf_m1a2sep2wd_usarmy",[],[[],[]]],
	["rhsusf_m1a1fep_wd",[],[[],[]]],
	["rhsusf_m1a1hc_wd",[],[[],[]]],
	["B_T_APC_Wheeled_01_cannon_F",[],[[],[]]],
	["rhsusf_stryker_m1134_d",[],[[],[]]],
	["RHS_M2A2_wd",[],[[],[]]],
	["RHS_M2A2_BUSKI_WD",[],[[],[]]],
	["RHS_M2A3_wd",[],[[],[]]],
	["RHS_M2A3_BUSKI_wd",[],[[],[]]],
	["RHS_M2A3_BUSKIII_wd",[],[[],[]]],
	["O_T_APC_Tracked_02_cannon_ghex_F",[],[[],[]]],
	["B_APC_Wheeled_03_cannon_F",[],[[],[]]],
	["B_T_AFV_Wheeled_01_cannon_F",[],[[],[]]]
];
//NEW
WMS_AMS_LightArmedRwds = [ //I_LT_01_cannon_F
	["B_LSV_01_armed_olive_F",[],[[],[]]],
	["O_LSV_02_armed_ghex_F",[],[[],[]]],
	["B_G_Offroad_01_armed_F",[],[[],[]]],
	["I_C_Offroad_02_LMG_F",[],[[],[]]]
];
WMS_AMS_ChopperRwds = [
	["B_Heli_Light_01_F",[],[[],[]]],
	["O_Heli_Light_02_unarmed_F",[],[[],[]]],
	["I_Heli_Transport_02_F",[],[[],[]]],
	["I_Heli_light_03_unarmed_F",[],[[],[]]],
	["O_Heli_Transport_04_F",[],[[],[]]],
	["O_Heli_Transport_04_bench_F",[],[[],[]]],
	["I_C_Heli_Light_01_civil_F",[],[[],[]]],
	["I_E_Heli_light_03_unarmed_F",[],[[],[]]],
	["vtx_UH60M_MEDEVAC",[],[[],[]]],
	["vtx_UH60M_SLICK",[],[[],[]]],
	["vtx_HH60",[],[[],[]]],
	["vtx_UH60M",[],[[],[]]],
	["vtx_MH60M",[],[[],[]]],
	//["vtx_MH60S",[],[[],[]]], //REMOVED BY HATCHET
	//["vtx_MH60S_GAU21L",[],[[],[]]], //REMOVED BY HATCHET
	//["vtx_MH60S_Pylons",[],[[],[]]], //REMOVED BY HATCHET
	["vtx_MH60M_DAP",[],[[],[]]],
	["RHS_Mi24Vt_vvs",[],[[],[]]], //1 minigun
	["RHS_Mi8mt_Cargo_vvs",[],[[],[]]],
	["RHS_Mi8amt_civilian",[],[[],[]]]
];
WMS_AMS_CIVRwds = [
	["C_Hatchback_01_F",[],[[],[]]],
	["C_Hatchback_01_sport_F",[],[[],[]]],
	["C_Offroad_02_unarmed_F",[],[[],[]]],
	["C_Offroad_01_F",[],[[],[]]],
	["C_SUV_01_F",[],[[],[]]],
	["C_Van_01_transport_F",[],[[],[]]],
	["C_Van_01_box_F",[],[[],[]]],
	["C_Van_02_vehicle_F",[],[[],[]]],
	["C_Van_02_transport_F",[],[[],[]]],
	["C_IDAP_Offroad_02_unarmed_F",[],[[],[]]],
	["C_IDAP_Offroad_01_F",[],[[],[]]],
	["C_IDAP_Van_02_vehicle_F",[],[[],[]]],
	["C_IDAP_Van_02_transport_F",[],[[],[]]]
];
WMS_AMS_COMMSRwds = [
	["B_GEN_Offroad_01_comms_F",[],[[],[]]],
	["I_E_Offroad_01_comms_F",[],[[],[]]],
	["C_Offroad_01_comms_F",[],[[],[]]],
	["I_LT_01_scout_F",[],[[],[]]],
	["O_Truck_03_device_F",[],[[],[]]],
	["O_T_Truck_03_device_ghex_F",[],[[],[]]],
	["rhsusf_m1152_sicps_usarmy_wd",[],[[],[]]],
	["rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1230_M2_usarmy_wd",[],[[],[]]],
	["rhsusf_CGRCAT1A2_M2_usmc_wd",[],[[],[]]],
	["rhs_tigr_sts_msv",[],[[],[]]],
	["rhs_gaz66_r142_msv",[],[[],[]]],
	["rhsgref_BRDM2UM_msv",[],[[],[]]],
	["rhs_prp3_msv",[],[[],[]]]
];
WMS_AMS_MEDRwds = [
	["B_Truck_01_medical_F",[],[[],[]]],
	["B_T_Truck_01_medical_F",[],[[],[]]],
	["O_Truck_02_medical_F",[],[[],[]]],
	["O_Truck_03_medical_F",[],[[],[]]],
	["O_T_Truck_03_medical_ghex_F",[],[[],[]]],
	["O_T_Truck_02_Medical_F",[],[[],[]]],
	["I_E_Truck_02_Medical_F",[],[[],[]]],
	["C_IDAP_Van_02_medevac_F",[],[[],[]]],
	["rhsusf_m113_usarmy_medical",[],[[],[]]],
	["rhsusf_M1230a1_usarmy_wd",[],[[],[]]],
	["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",[],[[],[]]]
];