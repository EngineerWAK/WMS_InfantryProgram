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
["rhsgref_ins_uaz_open",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
["rhsgref_tla_offroad",["Guerilla_05",1],[[],[]]],
["O_LSV_02_unarmed_F",[],[[],[]]],
["rhs_gaz66_ammo_vmf",["camo",1],[[],[]]], //["camo",1],
["rhs_gaz66o_vmf",["camo",1],[[],[]]], //["camo",1],
["rhs_gaz66_ap2_vmf",["camo",1],[[],[]]], //["camo",1],
["rhs_gaz66_r142_vmf",["camo",1],[[],[]]], //["camo",1],
["rhs_gaz66_vmf",["camo",1],[[],[]]], //["camo",1],
["rhsgref_BRDM2UM_vmf",["3tone",1],[[],[]]], //["3tone",1],
["RHS_Ural_Open_VMF_01",["Camo1",1],[[],[]]], //["Camo1",1],
["RHS_Ural_Fuel_VMF_01",["Camo1",1],[[],[]]], //["Camo1",1],
["RHS_Ural_Ammo_VMF_01",["Camo1",1],[[],[]]], //["Camo1",1],
["RHS_Ural_Repair_VMF_01",["Camo1",1],[[],[]]], //["Camo1",1],
["O_G_Offroad_01_repair_F",["Guerilla_05",1],[[],[]]] //["Guerilla_05",1]
];
WMS_OPFOR_CustomVHL_Armed = [
["rhsgref_ins_uaz_dshkm",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
//["rhsgref_ins_uaz_spg9",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];//GOFUCKYOURSELF
["O_LSV_02_armed_F",[],[[],[]]],
["rhsgref_BRDM2_HQ_vmf",["3tone",1],[[],[]]], //["3tone",1],
//["rhsgref_BRDM2_vmf",["3tone",1],[[],[]]], //["3tone",1], //NOPE
//["rhsgref_tla_offroad_at",["Guerilla_05",1],[[],[]]], //GOFUCKYOURSELF
["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A",[],[[],[]]],
["rhsgref_tla_offroad_armed",["Guerilla_05",1],[[],[]]],
["rhs_btr60_vmf",["3tone",1],[[],[]]]//["3tone",1],
];
WMS_OPFOR_CustomVHL_Spec = [ //Heavy armed
["rhsgref_ins_uaz_spg9",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
["rhsgref_tla_offroad_at",["Guerilla_05",1],[[],[]]],
["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A",[],[[],[]]],
	["rhs_btr70_msv", ["rhs_sand",1],[[],[]]],
	["rhs_btr80a_msv", ["rhs_sand",1],[[],[]]],
["rhs_btr60_vmf",["3tone",1],[[],[]]],//["3tone",1],
["rhs_brm1k_vmf",["rhs_sand",1],[[],[]]] //["rhs_sand",1],
];
WMS_OPFOR_CustomAIR_Transport = [
["rhs_ka60_c",[],[[],[]]],
["RHS_UH60M2_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
["RHS_CH_47F_light",[],[[],[]]],
["RHS_Mi8T_vvsc",["Camo5",1],[[],[]]], //["Camo5",1],
["RHS_Mi8mt_vvsc",["Camo5",1],[[],[]]], //["Camo5",1],
	["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]] //black huron
];
WMS_OPFOR_CustomAIR_Unarmed = [
["rhs_ka60_c",[],[[],[]]],
["RHS_UH60M2_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
["RHS_Mi8T_vvsc",["Camo5",1],[[],[]]] //["Camo5",1],
];
WMS_OPFOR_CustomAIR_Armed = [
["O_Heli_Light_02_dynamicLoadout_F",[0,"rhsafrf\addons\rhs_a3retex\data\heli_light_02_ext_c_co.paa"],[[],[]]], //orca
["RHS_UH60M_d",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa",1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]],
["RHS_CH_47F_light",[],[[],[]]],
["RHS_Mi8mt_vvsc",["Camo5",1],[[],[]]], //["Camo5",1],
	["B_Heli_Light_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]] //pawnee
];
WMS_OPFOR_CustomAIR_Spec = [//attack choppers
["RHS_Mi8MTV3_vvsc",["Camo5",1],[[],[]]] //["Camo5",1],
];
WMS_OPFOR_CustomSEA = [
	["O_Boat_Armed_01_hmg_F",[],[[],[]]],
	["O_T_Boat_Armed_01_hmg_F",[],[[],[]]]
];
WMS_AMS_LightArmed = [
["rhsgref_ins_uaz_dshkm",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
["rhsgref_ins_uaz_spg9",[0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"],[[],[]]], // [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
["O_LSV_02_armed_F",[],[[],[]]],
["rhsgref_BRDM2_HQ_vmf",["3tone",1],[[],[]]], //["3tone",1],
["rhsgref_BRDM2_vmf",["3tone",1],[[],[]]], //["3tone",1],
["rhsgref_tla_offroad_at",["Guerilla_05",1],[[],[]]],
["rhsgref_tla_offroad_armed",["Guerilla_05",1],[[],[]]],
	["rhsusf_m1151_m2_v3_usmc_d",[],[[],[]]],
	["rhsusf_m113d_usarmy_M240",[],[[],[]]]
];
WMS_AMS_APC = [
["rhs_brm1k_vmf",["rhs_sand",1],[[],[]]], //["rhs_sand",1],
["rhs_btr80a_vv",["rhs_sand",1],[[],[]]],
	["RHS_M2A2",[],[[],[]]],
	["rhs_btr70_msv", ["rhs_sand",1],[[],[]]],
	["rhs_btr80a_msv", ["rhs_sand",1],[[],[]]],
	["O_APC_Tracked_02_cannon_F",[],[[],[]]],
	["O_APC_Wheeled_02_rcws_v2_F",[],[[],[]]],
	["B_APC_Wheeled_01_cannon_F",[],[[],[]]], //Marshall
	["B_APC_Wheeled_03_cannon_F",["Guerilla_02",1],[[],[]]],
	["B_AFV_Wheeled_01_cannon_F",[],[[],[]]],
	["I_E_APC_tracked_03_cannon_F",[],[[],[]]]
];
WMS_AMS_HeavyArmed = [
	["RHS_M2A3_BUSKIII",[],[[],[]]],
	//["rhs_btr60_vv", ["3tone",1],[[],[]]],
	["rhsusf_m1a1aimd_usarmy",[],[[],[]]],
	["rhsusf_m1a2sep1tuskiid_usarmy",[],[[],[]]],
	["rhs_bmd1k", ["Camo1",1],[[],[]]],
	["rhs_bmd2m", ["Camo2",1],[[],[]]],
	["rhs_brm1k_vdv", ["rhs_sand",1],[[],[]]],
	["rhs_bmp2e_vdv", ["rhs_sand",1],[[],[]]],
	["rhs_t72ba_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t72bb_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t90_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t90sab_tv", ["rhs_sand",1],[[],[]]],
	["rhs_t80u45m", ["tricolor",1],[[],[]]],
	["rhs_t80ue1", ["tricolor",1],[[],[]]]
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
	["I_MRAP_03_F",[],[[],[]]]
];
WMS_AMS_LightArmedRwds = [
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
	["I_E_Heli_light_03_unarmed_F",[],[[],[]]]
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
	["O_T_Truck_03_device_ghex_F",[],[[],[]]]
];