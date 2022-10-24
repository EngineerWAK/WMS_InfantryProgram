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
	["rhsusf_m1025_d",[],[[],[]]],
	["rhsusf_m998_d_2dr",[],[[],[]]],
	["rhsusf_m998_d_4dr_fulltop",[],[[],[]]],
	["rhsusf_m1025_d",[],[[],[]]],
	["rhsusf_m1151_usarmy_d",[],[[],[]]],
	["rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1078A1P2_D_open_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1078A1P2_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1084A1P2_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1084A1P2_B_D_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1083A1P2_B_D_fmtv_usarmy",[],[[],[]]],
	["R3F_MATV_DA",[],[[],[]]],
	["R3F_HEMTT_DA_log",[],[[],[]]],
	["R3F_KAMAZ_DA_VPC",[],[[],[]]],
	["R3F_KAMAZ_DA_fuel",[],[[],[]]],
	["R3F_KAMAZ_DA_trans",[],[[],[]]],
	["R3F_HEMTT_DA_mov",[],[[],[]]],
	["UK3CB_BAF_MAN_HX60_Fuel_Sand",[],[[],[]]],
	["UK3CB_BAF_MAN_HX60_Transport_Sand",[],[[],[]]],
	["UK3CB_BAF_MAN_HX60_Cargo_Sand_A",[],[[],[]]],
	["UK3CB_BAF_LandRover_Soft_FFR_Sand_A",[],[[],[]]],
	["rhs_uaz_vv",["camo",1],[[],[]]], //
	["C_Hatchback_01_black_F",[],[[],[]]],
	["rhs_gaz66_ammo_vv",["camo",1],[[],[]]],
	["rhs_gaz66_vv",["camo",1],[[],[]]],
	["B_LSV_01_unarmed_sand_F",[],[[],[]]],
	["rhsusf_m1240a1_usarmy_d",[],[[],[]]]
];
WMS_OPFOR_CustomVHL_Armed = [
	["I_C_Offroad_02_LMG_F",[],[[],[]]],
	["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A",[],[[],[]]],
	["UK3CB_BAF_Jackal2_L2A1_D",[],[[],[]]],
	["UK3CB_BAF_Husky_Passenger_GPMG_Sand",[],[[],[]]],
	["BWA3_Eagle_FLW100_Tropen",[],[[],[]]],
	["rhs_btr60_vv",["3tone",1],[[],[]]],
	["rhs_prp3_vv",["rhs_sand",1],[[],[]]],
	["rhsusf_m1240a1_m240_usarmy_d",[],[[],[]]],
	["rhsusf_m113d_usarmy",[],[[],[]]],
	["rhsusf_m113d_usarmy_M240",[],[[],[]]],
	["rhsusf_M1239_M2_Deploy_socom_d",[],[[],[]]]
];
WMS_OPFOR_CustomVHL_Spec = [
	["rhs_btr80a_vv",["rhs_sand",1],[[],[]]],
	["rhs_brm1k_vv",["rhs_sand",1],[[],[]]],
	["rhs_t72bc_tv",["rhs_sand",1],[[],[]]],
	["RHS_Ural_Zu23_VV_01",["Camo1",1],[[],[]]],
	["rhs_gaz66_zu23_vv",["Camo",1],[[],[]]],
	["rhs_btr70_vv",["rhs_sand",1],[[],[]]],
	["RHS_M2A3",[],[[],[]]],
	["R3F_PANDUR_DA",[],[[],[]]],
	["rhsusf_m1a2sep1tuskid_usarmy",[],[[],[]]]
];
WMS_OPFOR_CustomAIR_Transport = [
	["RHS_Mi8AMT_vvsc",[],[[],[]]],
	["R3F_MERLIN_DA",[],[[],[]]],
	["O_Heli_Transport_04_covered_black_F",[],[[],[]]], //black taru
	["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //black huron
	["UK3CB_BAF_Merlin_HC3_32",[0,"R3F_Retex\data\MERLIN\Heli_Transport_02_DA_1_R3F_CO.paa",1,"R3F_Retex\data\MERLIN\Heli_Transport_02_DA_2_R3F_CO.paa"],[[],[]]]
];
WMS_OPFOR_CustomAIR_Unarmed = [
	["RHS_Mi8AMT_vvsc",[],[[],[]]],
	["R3F_MERLIN_DA",[],[[],[]]],
	["R3F_LYNX_DA",[],[[],[]]],
	["R3F_AH6_DA",[],[[],[]]],
	["UK3CB_BAF_Wildcat_HMA2_TRN_8A",[0,"R3F_Retex\data\LYNX\heli_light_03_DA_R3F_co.paa"],[[],[]]],
	["RHS_UH60M2_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	["RHS_UH1Y_UNARMED_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]]
];
WMS_OPFOR_CustomAIR_Armed = [
	["RHS_Mi8mt_vv",[],[[],[]]],
	["R3F_LYNX_DA_ARMED",[],[[],[]]],
	["R3F_AH6_DA_ARMED",[],[[],[]]],
	["rhs_uh1h_hidf",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	//["B_CTRG_Heli_Transport_01_sand_F",[],[[],[]]],//GO-FUCK-YOURSELF
	["UK3CB_BAF_Merlin_HC3_18_GPMG",[0,"R3F_Retex\data\MERLIN\Heli_Transport_02_DA_1_R3F_CO.paa",1,"R3F_Retex\data\MERLIN\Heli_Transport_02_DA_2_R3F_CO.paa"],[[],[]]],
	["UK3CB_BAF_Wildcat_AH1_CAS_6A",[0,"R3F_Retex\data\LYNX\heli_light_03_DA_R3F_co.paa"],[[],[]]],
	["RHS_UH60M_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
	["RHS_UH1Y_FFAR_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]],
	["RHS_UH1Y_d",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]],
	["RHS_UH1Y_d_GS",[0,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",1,"a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa"],[[],[]]]
];
WMS_OPFOR_CustomAIR_Spec = [
	["RHS_Ka52_UPK23_vvsc",[],[[],[]]],
	["O_T_VTOL_02_infantry_grey_F",[],[[],[]]],
	["UK3CB_BAF_Apache_AH1",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //from Mi280 ,"\rhsafrf\addons\rhs_mi28\data\rhs_mi28_01_camo_co.paa"
	["RHS_Mi24V_FAB_vvsc",[],[[],[]]],
	["UK3CB_BAF_Wildcat_AH1_CAS_8C",[0,"R3F_Retex\data\LYNX\heli_light_03_DA_R3F_co.paa"],[[],[]]]
];
WMS_OPFOR_CustomSEA = [
	["O_Boat_Armed_01_hmg_F",[],[[],[]]],
	["O_T_Boat_Armed_01_hmg_F",[],[[],[]]]
];
WMS_AMS_LightArmed = [
	["B_T_LSV_01_armed_sand_F",[],[[],[]]],
	["O_LSV_02_armed_black_F",[],[[],[]]],
	["O_G_Offroad_01_AT_F",[],[[],[]]], //RED
	["I_C_Offroad_02_LMG_F",[],[[],[]]],
	["I_C_Offroad_02_AT_F",[],[[],[]]],
	["rhsusf_m1151_m2_v3_usmc_d",[],[[],[]]], //TO ADD TO TRADER
	["rhsusf_m113d_usarmy_M240",[],[[],[]]], //doesnt exist
	["rhs_tigr_sts_3camo_vdv",[],[[],[]]], //TO ADD TO TRADER //
	["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A",[],[[],[]]]
];
WMS_AMS_APC = [
	["B_APC_Wheeled_01_cannon_F",[],[[],[]]], //Marshall
	["B_APC_Wheeled_03_cannon_F",["Guerilla_02",1],[[],[]]],
	["rhs_brm1k_vv",["rhs_sand",1],[[],[]]],
	["RHS_Ural_Zu23_VV_01",["Camo1",1],[[],[]]],
	["rhs_gaz66_zu23_vv",["Camo",1],[[],[]]],
	["rhs_btr70_vv",["rhs_sand",1],[[],[]]],
	["RHS_M2A3",[],[[],[]]],
	["I_E_APC_tracked_03_cannon_F",[],[[],[]]], 
	["O_APC_Tracked_02_cannon_F",[],[[],[]]],
	["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
];
WMS_AMS_HeavyArmed = [
	["rhs_t72bc_tv",["rhs_sand",1],[[],[]]],
	["B_AFV_Wheeled_01_cannon_F",[],[[],[]]], //Rhino
	["B_AFV_Wheeled_01_up_cannon_F",[],[[],[]]], //Rhino up
	["B_MBT_01_cannon_F",[],[[],[]]], //Slammer
	["rhs_t90_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t90sab_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t80u45m", ["tricolor",1],[[],[]]],
	["rhs_t80ue1", ["tricolor",1],[[],[]]],
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
	["O_T_MRAP_02_ghex_F",[],[[],[]]],
	["B_T_MRAP_01_F",[],[[],[]]],
	["I_MRAP_03_F",[],[[],[]]],
	["R3F_FENNEC_CE",[],[[],[]]],
	["R3F_MATV_CE",[],[[],[]]]
];
WMS_AMS_LightArmedRwds = [ //I_LT_01_cannon_F
	["B_LSV_01_armed_olive_F",[],[[],[]]],
	["O_LSV_02_armed_ghex_F",[],[[],[]]],
	["B_G_Offroad_01_armed_F",[],[[],[]]],
	["I_C_Offroad_02_LMG_F",[],[[],[]]]
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
WMS_AMS_ChopperRwds = [
	["B_Heli_Light_01_F",[],[[],[]]],
	["O_Heli_Light_02_unarmed_F",[],[[],[]]],
	["I_Heli_Transport_02_F",[],[[],[]]],
	["I_Heli_light_03_unarmed_F",[],[[],[]]],
	["O_Heli_Transport_04_F",[],[[],[]]],
	["O_Heli_Transport_04_bench_F",[],[[],[]]],
	["I_C_Heli_Light_01_civil_F",[],[[],[]]],
	["I_E_Heli_light_03_unarmed_F",[],[[],[]]],
	["R3F_MERLIN_CE",[],[[],[]]],
	["R3F_LYNX_CE",[],[[],[]]],
	["R3F_AH6_CE",[],[[],[]]],
	["UK3CB_BAF_Vehicles_Merlin_RAF_ZJ124",[],[[],[]]],
	["UK3CB_BAF_Wildcat_Transport_RN_ZZ396",[],[[],[]]],
	["UK3CB_BAF_Merlin_HC3_Cargo",[],[[],[]]],
	["UK3CB_BAF_Merlin_HM2_18",[],[[],[]]],
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