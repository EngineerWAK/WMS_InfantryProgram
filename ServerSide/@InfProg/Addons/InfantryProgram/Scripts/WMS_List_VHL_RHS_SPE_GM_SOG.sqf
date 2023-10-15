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
/* //sort vehicle from editor console
private _result = [];
private _gun = false;
{
	if !(_x isKindOf "man")then {
		if !(_x isKindOf "CamCurator") then {
			if !((_x isKindOf "air") || (_x isKindOf "tank") || (_x isKindOf "Wheeled_Apc_F")) then {
				_gunSits = _x emptyPositions "Gunner";
				if (_gunSits == 0)then{_gun = false}else{_gun = true};
				_cfg = [_x]  call BIS_fnc_getVehicleCustomization;
				if (_gun) then {
					_result pushBack [typeOf _x,_cfg select 0,[[_gun],[]]];
				};
			};
		};
	};
}forEach ([2040.92,7222.8,0] nearObjects 1000);
_result
*/
WMS_OPFOR_CustomVHL_Unarmed = [
	["vn_o_armor_btr50pk_03_nva65",["btr50_10",1],[[false],[]]], //unarmed from "tank"

	["gm_gc_army_ural375d_cargo",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_ural4320_repair",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_ural44202",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_brdm2um",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_btr60pa",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_uaz469_cargo",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_ural4320_reammo",["gm_gc_des",1],[[false],[]]],
	["gm_gc_army_ural375d_refuel",["gm_gc_des",1],[[false],[]]],
	["gm_ge_army_typ253_mp",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_army_iltis_cargo",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_army_u1300l_medic",["gm_ge_trp_rc",1],[[false],[]]],
	["gm_ge_army_typ253_cargo",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_army_u1300l_firefighter",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_army_typ247_cargo",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_army_typ1200_cargo",["gm_ge_trp",1],[[false],[]]],
	["gm_ge_bgs_w123_cargo",["gm_carc_tan",1],[[false],[]]],
	//["gm_ge_army_fuchsa0_command",["gm_ge_trp",1],[[false],[]]], //true !!! //MG42
	["vn_o_wheeled_btr40_02_nva65",["btr_07",1],[[false],[]]],
	["vn_o_wheeled_btr40_01_nva65",["btr_07",1],[[false],[]]],
	["vn_o_car_04_01",["Green",1],[[false],[]]],
	["vn_b_wheeled_m54_repair_airport",["airport",1],[[false],[]]],
	["vn_b_wheeled_m54_fuel_airport",["airport",1],[[false],[]]],
	["vn_b_wheeled_m54_ammo_airport",["airport",1],[[false],[]]],
	["vn_b_wheeled_m54_01_airport",["airport",1],[[false],[]]],
	["vn_b_wheeled_m151_01_rok_army",["m151_13",1],[[false],[]]],
	["SPE_ST_OpelBlitz_Repair",["Camo1",1],[[false],[]]],
	["SPE_ST_OpelBlitz_Open",["Camo1",1],[[false],[]]],
	["SPE_ST_OpelBlitz_Fuel",["Camo1",1],[[false],[]]],
	["SPE_ST_OpelBlitz_Ammo",["Camo1",1],[[false],[]]],
	["SPE_ST_OpelBlitz_Ambulance",["Camo1",1],[[false],[]]],
	["rhs_gaz66_flat_vv",["camo",1],[[false],[]]],
	["rhs_gaz66_ap2_vv",["camo",1],[[false],[]]],
	["rhs_gaz66_repair_vv",["camo",1],[[false],[]]],
	["rhs_zil131_vv",["CHDKZ",1],[[false],[]]],
	["rhs_zil131_open_vv",["CHDKZ",1],[[false],[]]],
	["SPE_ST_OpelBlitz",["Camo1",1],[[false],[]]],
	["rhs_uaz_open_vv",["Takistan",1],[[false],[]]],
	["rhs_uaz_open_vv",["Takistan",1],[[false],[]]],
	["rhs_uaz_open_vv",["Takistan",1],[[false],[]]],
	["rhs_gaz66_vv",["camo",1],[[false],[]]],
	["rhs_gaz66_ammo_vv",["camo",1],[[false],[]]],
	["rhs_gaz66o_vv",["camo",1],[[false],[]]]
	];

WMS_OPFOR_CustomVHL_Armed = [
	["gm_ge_army_fuchsa0_command",["gm_ge_trp",1],[[false],[]]], //true !!! //MG42
	["gm_ge_army_m113a1g_command",["gm_ge_trp",1],[[true],[]]], //MG42
	//["gm_gc_army_btr60pa_dshkm",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_btr60pb",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_p601",["gm_carc_tan",1],[[true],[]]],
	//["gm_gc_army_brdm2",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_ural375d_mlrs",["gm_gc_des",1],[[true],[]]],
	//["gm_gc_army_uaz469_dshkm",["gm_gc_des",1],[[true],[]]],
	["gm_ge_army_iltis_mg3",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_iltis_mg3",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_u1300l_container",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_u1300l_repair",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_u1300l_cargo",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_u1300l_cargo",["gm_ge_trp",1],[[true],[]]],
	["vn_o_armor_m113_acav_03",["m113_42",1],[[true],[]]], //m60
	["vn_o_wheeled_btr40_mg_01_nva65",["btr_07",1],[[true],[]]],
	["vn_o_wheeled_btr40_mg_04_nva65",["btr_09",1],[[true],[]]],
	["vn_b_wheeled_m151_mg_01_rok_army",["m151_13",1],[[true],[]]],
	["SPE_ST_SdKfz250_1",["Dunkelgelb_Camo2",1],[[true],[]]],
	//["SPE_ST_OpelBlitz_Flak38",[],[[true],[]]],
	//["vn_o_wheeled_btr40_mg_03_nva65",["btr_07",1],[[true],[]]], //ZSU 23-4
	//["rhs_gaz66_zu23_vv",["camo",1],[[true],[]]],
	//["RHS_Ural_Zu23_VV_01",["Camo1",1],[[true],[]]],
	["RHS_BM21_VV_01",["Camo",1],[[true],[]]]
	];

WMS_OPFOR_CustomVHL_Spec = [ //"tank", will need to adjust
	["gm_gc_army_pt76b",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_t55am2b",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_zsu234v1",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_bmp1sp2",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_t55",["gm_gc_des",1],[[true],[]]],
	["gm_gc_army_t55ak",["gm_gc_des",1],[[true],[]]],
	["gm_ge_army_bpz2a0",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_Leopard1a1",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_Leopard1a3",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_Leopard1a5",["gm_ge_trp",1],[[true],[]]],
	["gm_ge_army_gepard1a1",["gm_ge_trp",1],[[true],[]]],
	//["vn_o_armor_btr50pk_03_nva65",["btr50_10",1],[[false],[]]], //unarmed
	["vn_o_armor_m125_01",["m125_42",1],[[true],[]]], //M2 + mortar
	["vn_o_armor_type63_01_nva65",["type63_05",1],[[true],[]]],
	["vn_o_armor_btr50pk_02_nva65",["btr50_10",1],[[true],[]]],
	["vn_o_armor_btr50pk_01_nva65",["btr50_10",1],[[true],[]]],
	["vn_o_armor_m113_acav_01",["m113_42",1],[[true],[]]], //M2
	["vn_o_armor_pt76a_01_nva65",["pt76a_05",1],[[true],[]]],
	["vn_o_armor_pt76b_01_nva65",["pt76b_05",1],[[true],[]]],
	["vn_o_armor_m41_01",["m41_07",1],[[true],[]]],
	["vn_o_armor_ot54_01_nva65",["t54b_11",1],[[true],[]]],
	["vn_o_armor_t54b_01_nva65",["t54b_11",1],[[true],[]]],
	["SPE_ST_PzKpfwIII_J",["Camo1",1],[[true],[]]],
	["SPE_Nashorn",["standard",1],[[true],[]]],
	["SPE_PzKpfwIII_L",["Camo4",1],[[true],[]]],
	["SPE_PzKpfwIII_M",["Camo4",1],[[true],[]]],
	["rhs_2s1_at_tv",["ChDKZ",1],[[true],[]]],
	["rhs_2s3_at_tv",["rhs_tri",1],[[true],[]]],
	["rhs_bmp2e_vdv",["rhs_sand",1],[[true],[]]],
	["rhs_brm1k_vdv",["rhs_sand",1],[[true],[]]],
	["rhs_prp3_vdv",["rhs_sand",1],[[true],[]]],
	["rhs_bmp3mera_msv",["rhs_sand",1],[[true],[]]],
	["SPE_ST_PzKpfwVI_H1",["Zimmerit_Camo2",1],[[true],[]]],
	["SPE_PzKpfwIII_N",["Camo4",1],[[true],[]]],
	["SPE_PzKpfwIV_G",["Camo6",1],[[true],[]]],
	["rhs_bmd1p",["Camo1",1],[[true],[]]],
	["rhs_bmd1r",["Camo1",1],[[true],[]]],
	["rhs_bmd2",["Camo2",1],[[true],[]]],
	["rhs_bmp1_vdv",["rhs_sand",1],[[true],[]]],
	["rhsgref_ins_zsu234",["Takistan",1],[[true],[]]],
	["rhs_t80um",["tricolor",1],[[true],[]]],
	["rhs_t90a_tv",["rhs_Sand",1],[[true],[]]],
	["rhs_t72be_tv",["rhs_Sand",1],[[true],[]]],
	["rhs_t72bb_tv",["rhs_Sand",1],[[true],[]]]
];

WMS_OPFOR_CustomAIR_Transport = [
	["gm_ge_army_ch53gs",["gm_ge_olo",1],[[false],[]]],
	["gm_gc_airforce_mi2p",["gm_gc_brb",1],[[false],[]]],
	["gm_gc_airforce_mi2sr",["gm_gc_brb",1],[[false],[]]],
	//["gm_gc_airforce_mi2t",["gm_gc_brb",1],[[false],[]]], //true, door PK
	//["gm_pl_airforce_mi2urpg",["gm_pl_wdl",1],[[true],[]]], // Side canon, AA miss, AT miss,
	//["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[false],[]]], //true, 4 HMG
	//["gm_gc_airforce_mi2urn",["gm_gc_brb",1],[[false],[]]], //true, 2 rockets pods
	//["vn_o_air_mi2_02_01",["camo3",1],[[false],[]]], //s h i t ambulance
	//["vn_o_air_mi2_03_02",[],[[false],[]]], //true, side cannon, door PK
	//["gm_ge_army_bo105m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	//["gm_ge_army_bo105p1m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	//["vn_o_air_mi2_01_03",[],[[true],[]]], //door PK
	//["vn_o_air_mi2_04_02",[],[[false],[]]], //true, side cannon, rocket pods, door PK
	//["vn_o_air_mi2_03_06",[],[[false],[]]], //true, side cannon, side LMGs, door PK
	//["gm_ge_army_bo105p_pah1",["gm_ge_hornet",1],[[true],[]]], //side HOT x6
	["RHS_Mi8mt_Cargo_vvsc",["Camo5",1],[[false],[]]],
	["RHS_Mi8T_vvsc",["Camo5",1],[[false],[]]],
	["RHS_Mi24Vt_vvsc",["Camo3",1],[[true],[]]], //minigun only
	//["RHS_Mi24V_vvsc",["Camo3",1],[[true],[]]],
	["rhs_ka60_c",["vvs_camo",1],[[false],[]]],
	//["RHS_Ka52_vvsc",["Camo",1],[[true],[]]],
	//["RHS_Mi24P_vvsc",["Camo3",1],[[true],[]]],
	["RHS_CH_47F_light",["Desert",1],[[true],[]]],
	["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]], //true!!! 2 door PK
	//["RHS_Mi8MTV3_heavy_vvsc",["Camo5",1],[[false],[]]], //true, obviously
	//["RHS_Mi8MTV3_vvsc",["Camo5",1],[[false],[]]], //true, obviously
	//["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //black huron
	["O_Heli_Transport_04_covered_black_F",[],[[],[]]] //black taru
];
WMS_OPFOR_CustomAIR_Unarmed = [ //all choppers, need to select the right ones
	//["gm_ge_army_ch53gs",["gm_ge_olo",1],[[false],[]]], //unarmed but freacking big and noisy
	["gm_gc_airforce_mi2p",["gm_gc_brb",1],[[false],[]]],
	["gm_gc_airforce_mi2p",["gm_gc_brb",1],[[false],[]]],
	["gm_gc_airforce_mi2sr",["gm_gc_brb",1],[[false],[]]],
	["gm_gc_airforce_mi2sr",["gm_gc_brb",1],[[false],[]]],
	["gm_ge_army_bo105m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	["gm_ge_army_bo105p1m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	//["gm_gc_airforce_mi2t",["gm_gc_brb",1],[[false],[]]], //true, door PK
	//["gm_pl_airforce_mi2urpg",["gm_pl_wdl",1],[[true],[]]], // Side canon, AA miss, AT miss,
	//["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[false],[]]], //true, 4 HMG
	//["gm_gc_airforce_mi2urn",["gm_gc_brb",1],[[false],[]]], //true, 2 rockets pods
	["vn_o_air_mi2_02_01",["camo3",1],[[false],[]]],
	//["vn_o_air_mi2_03_02",[],[[false],[]]], //true, side cannon, door PK
	//["vn_o_air_mi2_01_03",[],[[true],[]]], //door PK
	//["vn_o_air_mi2_04_02",[],[[false],[]]], //true, side cannon, rocket pods, door PK
	//["vn_o_air_mi2_03_06",[],[[false],[]]], //true, side cannon, side LMGs, door PK
	//["gm_ge_army_bo105p_pah1",["gm_ge_hornet",1],[[true],[]]], //side HOT x6
	["RHS_Mi8mt_Cargo_vvsc",["Camo5",1],[[false],[]]],
	["RHS_Mi8T_vvsc",["Camo5",1],[[false],[]]],
	//["RHS_Mi24Vt_vvsc",["Camo3",1],[[true],[]]], //minigun only
	//["RHS_Mi24V_vvsc",["Camo3",1],[[true],[]]],
	["rhs_ka60_c",["vvs_camo",1],[[false],[]]]
	//["RHS_Ka52_vvsc",["Camo",1],[[true],[]]],
	//["RHS_Mi24P_vvsc",["Camo3",1],[[true],[]]],
	//["RHS_CH_47F_light",["Desert",1],[[true],[]]],
	//["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]] //true!!! 2 door PK
	//["RHS_Mi8MTV3_heavy_vvsc",["Camo5",1],[[false],[]]], //true, obviously
	//["RHS_Mi8MTV3_vvsc",["Camo5",1],[[false],[]]], //true, obviously
	//["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //black huron
	//["O_Heli_Transport_04_covered_black_F",[],[[],[]]] //black taru
];
WMS_OPFOR_CustomAIR_Armed = [ //all choppers, need to select the right ones
	//["gm_ge_army_ch53gs",["gm_ge_olo",1],[[false],[]]],
	//["gm_gc_airforce_mi2p",["gm_gc_brb",1],[[false],[]]],
	//["gm_gc_airforce_mi2sr",["gm_gc_brb",1],[[false],[]]],
	["gm_gc_airforce_mi2t",["gm_gc_brb",1],[[false],[]]], //true, door PK
	["gm_gc_airforce_mi2t",["gm_gc_brb",1],[[false],[]]], //true, door PK
	["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[false],[]]], //true, 4 HMG
	["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[false],[]]], //true, 4 HMG
	//["gm_pl_airforce_mi2urpg",["gm_pl_wdl",1],[[true],[]]], // Side canon, AA miss, AT miss,
	//["gm_gc_airforce_mi2urn",["gm_gc_brb",1],[[false],[]]], //true, 2 rockets pods
	//["vn_o_air_mi2_02_01",["camo3",1],[[false],[]]],
	//["vn_o_air_mi2_03_02",[],[[false],[]]], //true, side cannon, door PK
	//["gm_ge_army_bo105m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	//["gm_ge_army_bo105p1m_vbh",["gm_ge_hornet",1],[[false],[]]], //+3 cargo
	["vn_o_air_mi2_01_03",[],[[true],[]]], //door PK
	//["vn_o_air_mi2_04_02",[],[[false],[]]], //true, side cannon, rocket pods, door PK
	//["vn_o_air_mi2_03_06",[],[[false],[]]], //true, side cannon, side LMGs, door PK
	//["gm_ge_army_bo105p_pah1",["gm_ge_hornet",1],[[true],[]]], //side HOT x6
	//["RHS_Mi8mt_Cargo_vvsc",["Camo5",1],[[false],[]]],
	//["RHS_Mi8T_vvsc",["Camo5",1],[[false],[]]],
	["RHS_Mi24Vt_vvsc",["Camo3",1],[[true],[]]], //minigun only
	["RHS_Mi24V_vvsc",["Camo3",1],[[true],[]]],
	//["rhs_ka60_c",["vvs_camo",1],[[false],[]]],
	//["RHS_Ka52_vvsc",["Camo",1],[[true],[]]],
	//["RHS_Mi24P_vvsc",["Camo3",1],[[true],[]]],
	["RHS_CH_47F_light",["Desert",1],[[true],[]]],
	["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]], //true!!! 2 door PK
	["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]], //true!!! 2 door PK
	["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]], //true!!! 2 door PK
	//["RHS_Mi8MTV3_heavy_vvsc",["Camo5",1],[[false],[]]], //true, obviously
	["RHS_Mi8MTV3_vvsc",["Camo5",1],[[false],[]]] //true, obviously
	//["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //black huron
	//["O_Heli_Transport_04_covered_black_F",[],[[],[]]] //black taru
];
WMS_OPFOR_CustomAIR_Spec = [ //all choppers, need to select the right ones
	//["gm_ge_army_ch53gs",["gm_ge_olo",1],[[false],[]]],
	//["gm_gc_airforce_mi2p",["gm_gc_brb",1],[[false],[]]],
	//["gm_gc_airforce_mi2sr",["gm_gc_brb",1],[[false],[]]],
	//["gm_gc_airforce_mi2t",["gm_gc_brb",1],[[false],[]]], //true, door PK
	["gm_pl_airforce_mi2urpg",["gm_pl_wdl",1],[[true],[]]], // Side canon, AA miss, AT miss,
	["gm_gc_airforce_mi2us",["gm_gc_brb",1],[[false],[]]], //true, 4 HMG
	["gm_gc_airforce_mi2urn",["gm_gc_brb",1],[[false],[]]], //true, 2 rockets pods
	["gm_ge_army_bo105p_pah1",["gm_ge_hornet",1],[[true],[]]], //side HOT x6
	//["vn_o_air_mi2_02_01",["camo3",1],[[false],[]]],
	//["vn_o_air_mi2_03_02",[],[[false],[]]], //true, side cannon, door PK
	//["gm_ge_army_bo105m_vbh",["gm_ge_hornet",1],[[false],[]]],
	//["gm_ge_army_bo105p1m_vbh",["gm_ge_hornet",1],[[false],[]]],
	//["vn_o_air_mi2_01_03",[],[[true],[]]], //door PK
	//["vn_o_air_mi2_04_02",[],[[false],[]]], //true, side cannon, rocket pods, door PK
	//["vn_o_air_mi2_03_06",[],[[false],[]]], //true, side cannon, side LMGs, door PK
	//["RHS_Mi8mt_Cargo_vvsc",["Camo5",1],[[false],[]]],
	//["RHS_Mi8T_vvsc",["Camo5",1],[[false],[]]],
	//["RHS_Mi24Vt_vvsc",["Camo3",1],[[true],[]]], //minigun only
	["RHS_Mi24V_vvsc",["Camo3",1],[[true],[]]],
	//["rhs_ka60_c",["vvs_camo",1],[[false],[]]],
	["RHS_Ka52_vvsc",["Camo",1],[[true],[]]],
	["RHS_Mi24P_vvsc",["Camo3",1],[[true],[]]],
	//["RHS_CH_47F_light",["Desert",1],[[true],[]]],
	//["RHS_Mi8mt_vvsc",["Camo5",1],[[false],[]]],
	["RHS_Mi8MTV3_heavy_vvsc",["Camo5",1],[[false],[]]]
	//["RHS_Mi8MTV3_vvsc",["Camo5",1],[[false],[]]],
	//["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //black huron
	//["O_Heli_Transport_04_covered_black_F",[],[[],[]]] //black taru
];
WMS_OPFOR_CustomSEA = [
	["vn_o_boat_01_mg_02_kr",[],[[],[]]],
	["vn_o_boat_02_mg_04_kr",[],[[],[]]],
	["vn_o_boat_03_01",[],[[],[]]],
	["vn_o_boat_04_01",[],[[],[]]],
	["vn_i_boat_12_03_fank_71",[],[[],[]]],
	["vn_b_boat_11_01",[],[[],[]]],
	["vn_b_boat_06_01",[],[[],[]]]
	//["O_Boat_Armed_01_hmg_F",[],[[],[]]],
	//["O_T_Boat_Armed_01_hmg_F",[],[[],[]]]
];
WMS_AMS_LightArmed = [
	["vn_b_wheeled_m274_mg_03_01",["m274_03",1],[[],[]]],
	["vn_b_wheeled_m274_mg_01_01",["m274_03",1],[[],[]]],
	["vn_o_wheeled_btr40_mg_02_nva65",["btr_04",1],[[],[]]],
	["vn_o_wheeled_btr40_mg_01_nva65",["btr_04",1],[[],[]]],
	["vn_o_wheeled_btr40_mg_04_nva65",["btr_04",1],[[],[]]],
	["vn_o_wheeled_btr40_mg_06_nva65",["btr_04",1],[[],[]]],
	["vn_o_wheeled_z157_mg_01_vcmf",[],[[],[]]], //Old truck DSHKM
	["vn_o_car_04_mg_01_kr",["Yellow",1],[[],[]]], //old delivery truck LMG
	["vn_b_wheeled_m151_mg_01_rok_army",["m151_14",1],[[],[]]],//jeep .30
	//
	//["rhsusf_m1165a1_gmv_m134d_m240_socom_d",[],[[],[]]],
	["B_T_LSV_01_armed_sand_F",[],[[],[]]],
	//["O_LSV_02_armed_black_F",[],[[],[]]],
	["O_G_Offroad_01_AT_F",[],[[],[]]], //RED
	//["I_C_Offroad_02_LMG_F",[],[[],[]]],
	//["I_C_Offroad_02_AT_F",[],[[],[]]],
	//["rhsusf_m1151_m2_v3_usmc_d",[],[[],[]]], //TO ADD TO TRADER
	["rhsusf_m113d_usarmy_M240",[],[[],[]]], //doesnt exist
	["rhs_tigr_sts_3camo_vdv",[],[[],[]]] //TO ADD TO TRADER //
];
WMS_AMS_APC = [
	["vn_o_armor_m113_acav_02_kr",["m113_49",1],[[],[]]],
	["vn_o_armor_m113_acav_06_kr",["m113_49",1],[[],[]]],
	["vn_o_armor_m113_acav_03_kr",["m113_49",1],[[],[]]],
	["vn_o_armor_m125_01",["m113_49",1],[[],[]]], //M113 mortar
	["vn_o_armor_btr50pk_02",["btr50_10",1],[[],[]]],//BTR50 ZSU
	["vn_o_armor_btr50pk_01",["btr50_10",1],[[],[]]],//BTR50 LMG
	//
	//["B_APC_Wheeled_01_cannon_F",[],[[],[]]], //Marshall
	//["B_APC_Wheeled_03_cannon_F",["Guerilla_02",1],[[],[]]],
	["rhs_brm1k_vv",[1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa",2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa",4,"rhsafrf\addons\rhs_bmp_camo\data\bmp_5_desert_co.paa"],[[],[]]],
	["RHS_Ural_Zu23_VV_01",[0,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_tka_co.paa",1,"rhsafrf\addons\rhs_a2port_car\ural\data\ural_open_tka_co.paa"],[[],[]]],
	["rhs_gaz66_zu23_vv",[0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa",1,"rhsafrf\addons\rhs_gaz66\data\tentru_co.paa"],[[],[]]],
	["rhs_btr70_vv",[0,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_1_co.paa",1,"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_2_co.paa"],[[],[]]],
	//["RHS_M2A3",[],[[],[]]],
	["I_E_APC_tracked_03_cannon_F",[],[[],[]]], 
	["O_APC_Tracked_02_cannon_F",[],[[],[]]],
	["rhs_btr80a_vv",[0,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_01_tri01_co.paa",1,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_02_tri01_co.paa",2,"rhsafrf\addons\rhs_btr80_camo\data\rhs_btr80_03_tri01_co.paa"],[[],[]]]
];
WMS_AMS_HeavyArmed = [
	["vn_o_armor_m41_01",[],[[],[]]],//TANK
	["vn_o_armor_ot54_01",[],[[],[]]],//TANK
	["vn_o_armor_pt76a_01",[],[[],[]]],//TANK
	["vn_o_armor_pt76b_01",[],[[],[]]],//TANK
	["vn_o_armor_t54b_01",["t54b_11",1],[[],[]]],//TANK
	["vn_o_armor_type63_01",[],[[],[]]],//TANK
	//
	["rhs_t72bc_tv",[0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01_sand_co.paa",1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02_sand_co.paa",2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"],[[],[]]],
	//["B_AFV_Wheeled_01_cannon_F",[],[[],[]]], //Rhino
	//["B_AFV_Wheeled_01_up_cannon_F",[],[[],[]]], //Rhino up
	//["B_MBT_01_cannon_F",[],[[],[]]], //Slammer
	["rhs_t90_tv", [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_01_sand_co.paa",4,"rhsafrf\addons\rhs_t72_camo\data\rhs_t90am_01_sand_co.paa",6,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_e_01_sand_co.paa"],[[],[]]],
	["rhs_t90sab_tv", [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_01_sand_co.paa",4,"rhsafrf\addons\rhs_t72_camo\data\rhs_t90am_01_sand_co.paa",6,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b3_e_01_sand_co.paa"],[[],[]]]
	//["rhs_t80u45m", [0,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_01_co.paa",1,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_02_co.paa",2,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_03_co.paa"],[[],[]]],
	//["rhs_t80ue1", [0,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_01_co.paa",1,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_02_co.paa",2,"rhsafrf\addons\rhs_t80u_camo\data\rhs_t80u_tricolor_03_co.paa"],[[],[]]],
	//["rhsusf_m1a2sep1tuskid_usarmy",[],[[],[]]]
];
WMS_AMS_LightRwds = [
	["vn_b_wheeled_m151_01",[],[[],[]]],
	["vn_b_wheeled_m274_01_01",[],[[],[]]],
	["vn_b_wheeled_m274_02_01",[],[[],[]]],
	["vn_b_wheeled_lr2a_02_aus_army",[],[[],[]]],
	["vn_b_wheeled_lr2a_01_aus_army",[],[[],[]]],
	["vn_b_wheeled_m151_01_aus_army",[],[[],[]]],
	["vn_b_wheeled_m151_02_aus_army",[],[[],[]]],
	["vn_b_wheeled_m54_01_aus_army",[],[[],[]]],
	["vn_c_car_01_01",[],[[],[]]],
	["vn_c_car_03_01",[],[[],[]]],
	["vn_c_car_02_01",[],[[],[]]],
	["vn_c_wheeled_m151_02",[],[[],[]]],
	["vn_c_car_04_01",[],[[],[]]],
	//
	["B_LSV_01_unarmed_olive_F",[],[[],[]]],
	["B_CTRG_LSV_01_light_F",[],[[],[]]],
	["O_LSV_02_unarmed_ghex_F",[],[[],[]]],
	//["I_E_Offroad_01_covered_F",[],[[],[]]],
	//["I_E_Offroad_01_comms_F",[],[[],[]]],
	["B_G_Van_01_transport_F",[],[[],[]]],
	["B_G_Van_01_fuel_F",[],[[],[]]],
	["B_G_Offroad_01_F",[],[[],[]]],
	["C_Offroad_02_unarmed_blue_F",[],[[],[]]]
];
WMS_AMS_TruckRwds = [
	["vn_c_car_04_01",[],[[],[]]],
	["vn_b_wheeled_m54_01",[],[[],[]]],
	["vn_b_wheeled_m54_01_sog",[],[[],[]]],
	["vn_b_wheeled_m54_02_sog",[],[[],[]]],
	["vn_b_wheeled_m54_02",[],[[],[]]],
	["vn_o_wheeled_z157_01_nva65",[],[[],[]]],
	["vn_o_wheeled_z157_02_nva65",[],[[],[]]],
	//
	["O_T_Truck_03_transport_ghex_F",[],[[],[]]],
	["O_T_Truck_03_covered_ghex_F",[],[[],[]]],
	//["O_T_Truck_03_device_ghex_F",[],[[],[]]],
	//["O_T_Truck_03_fuel_ghex_F",[],[[],[]]],
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
	["vn_b_wheeled_m54_03_usmc",[],[[],[]]],
	["vn_b_wheeled_m54_repair_usmc",[],[[],[]]],
	["vn_b_wheeled_m54_fuel_usmc",[],[[],[]]],
	["vn_b_wheeled_m54_ammo_usmc",[],[[],[]]],
	["vn_b_wheeled_m54_mg_03",[],[[],[]]],
	["vn_b_wheeled_m54_mg_01",[],[[],[]]],
		["vn_b_wheeled_m54_03_usmc",[],[[],[]]],
		["vn_b_wheeled_m54_repair_usmc",[],[[],[]]],
		["vn_b_wheeled_m54_fuel_usmc",[],[[],[]]],
		["vn_b_wheeled_m54_ammo_usmc",[],[[],[]]],
		["vn_b_wheeled_m54_mg_03",[],[[],[]]],
		["vn_b_wheeled_m54_mg_01",[],[[],[]]],
	//
	["B_Truck_01_ammo_F",[],[[],[]]],
	["B_T_Truck_01_ammo_F",[],[[],[]]],
	["O_Truck_03_ammo_F",[],[[],[]]],
	["O_Truck_02_Ammo_F",[],[[],[]]],
	["O_T_Truck_03_ammo_ghex_F",[],[[],[]]],
	//["O_Truck_03_device_F",[],[[],[]]],
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
	["vn_b_armor_m113_acav_04",[],[[],[]]],
	["vn_b_armor_m113_acav_02",[],[[],[]]],
	["vn_b_armor_m113_acav_01",[],[[],[]]],
	["vn_b_armor_m113_acav_06",[],[[],[]]],
	["vn_b_armor_m113_acav_03",[],[[],[]]],
	["vn_b_armor_m113_acav_05",[],[[],[]]],
	["vn_b_armor_m132_01",[],[[],[]]],
	["vn_o_wheeled_btr40_mg_05_pl",[],[[],[]]],
	["vn_o_wheeled_btr40_mg_02_pl",[],[[],[]]],
	["vn_o_wheeled_btr40_mg_04_pl",[],[[],[]]],
	//
	//["rhsusf_m1240a1_m2crows_usarmy_wd",[],[[],[]]],
	//["rhsusf_m1240a1_m240_uik_usarmy_wd",[],[[],[]]],
	//["rhsusf_m1240a1_m2_uik_usarmy_wd",[],[[],[]]],
	["rhsusf_M1117_W",[],[[],[]]],
	//["rhsusf_CGRCAT1A2_Mk19_usmc_wd",[],[[],[]]],
	//["rhsusf_CGRCAT1A2_M2_usmc_wd",[],[[],[]]],
	["rhsgref_BRDM2_vdv",[],[[],[]]],
	["rhsgref_BRDM2_ATGM_vdv",[],[[],[]]],
	["O_T_MRAP_02_ghex_F",[],[[],[]]],
	["B_T_MRAP_01_F",[],[[],[]]],
	["I_MRAP_03_F",[],[[],[]]]
];
//NEW
WMS_AMS_ArmoredREDRwds = [
	["vn_o_armor_m41_01",[],[[],[]]],
	["vn_o_armor_ot54_01",[],[[],[]]],
	["vn_o_armor_pt76a_01",[],[[],[]]],
	["vn_o_armor_pt76b_01",[],[[],[]]],
	["vn_o_armor_t54b_01",[],[[],[]]],
	["vn_o_armor_type63_01",[],[[],[]]],
	//
	["rhs_t72ba_tv",[],[[],[]]],
	["rhs_t72bb_tv",[],[[],[]]],
	["rhs_t72bc_tv",[],[[],[]]],
	["rhs_t72bd_tv",[],[[],[]]],
	["rhs_t72be_tv",[],[[],[]]],
	//["rhs_t80",[],[[],[]]],
	//["rhs_t80b",[],[[],[]]],
	//["rhs_t80bk",[],[[],[]]],
	//["rhs_t80bvk",[],[[],[]]],
	//["rhs_t80um",[],[[],[]]],
	["rhs_t90_tv",[],[[],[]]]
	//["rhs_t90saa_tv",[],[[],[]]],
	//["rhs_t90sm_tv",[],[[],[]]],
	//["rhs_t90a_tv",[],[[],[]]],
	//["rhs_t90sab_tv",[],[[],[]]]
];
WMS_AMS_ArmoredBLUERwds = [
	["vn_b_armor_m41_01_01",[],[[],[]]],
	["vn_b_armor_m48_01_01",[],[[],[]]],
	["vn_b_armor_m67_01_01",[],[[],[]]],
	["vn_i_armor_type63_01",[],[[],[]]],
		["vn_b_armor_m41_01_01",[],[[],[]]],
		["vn_b_armor_m48_01_01",[],[[],[]]],
		["vn_b_armor_m67_01_01",[],[[],[]]],
		["vn_i_armor_type63_01",[],[[],[]]],
//
	["rhsusf_m1a1aimwd_usarmy",[],[[],[]]],
	//["rhsusf_m1a2sep1tuskiiwd_usarmy",[],[[],[]]],
	//["rhsusf_m1a2sep2wd_usarmy",[],[[],[]]],
	["rhsusf_m1a1fep_wd",[],[[],[]]],
	["rhsusf_m1a1hc_wd",[],[[],[]]],
	["B_T_APC_Wheeled_01_cannon_F",[],[[],[]]],
	//["rhsusf_stryker_m1134_d",[],[[],[]]],
	["RHS_M2A2_wd",[],[[],[]]],
	//["RHS_M2A2_BUSKI_WD",[],[[],[]]],
	["RHS_M2A3_wd",[],[[],[]]],
	//["RHS_M2A3_BUSKI_wd",[],[[],[]]],
	//["RHS_M2A3_BUSKIII_wd",[],[[],[]]],
	//["O_T_APC_Tracked_02_cannon_ghex_F",[],[[],[]]],
	["B_APC_Wheeled_03_cannon_F",[],[[],[]]],
	["B_T_AFV_Wheeled_01_cannon_F",[],[[],[]]]
];
//NEW
WMS_AMS_LightArmedRwds = [ //I_LT_01_cannon_F
	["vn_b_wheeled_m151_mg_04",[],[[],[]]],
	["vn_b_wheeled_m151_mg_03_mp",[],[[],[]]],
	["vn_b_wheeled_m151_mg_05",[],[[],[]]],
	["vn_b_wheeled_m274_mg_03_01",[],[[],[]]],
	["vn_b_wheeled_lr2a_mg_02_aus_army",[],[[],[]]],
	["vn_b_wheeled_lr2a_mg_03_aus_army",[],[[],[]]],
	//
	["B_LSV_01_armed_olive_F",[],[[],[]]],
	["O_LSV_02_armed_ghex_F",[],[[],[]]],
	["B_G_Offroad_01_armed_F",[],[[],[]]],
	["I_C_Offroad_02_LMG_F",[],[[],[]]]
];
WMS_AMS_ChopperRwds = [
	["vn_i_air_ch34_01_02",[],[[],[]]],
	["vn_i_air_ch34_02_01",[],[[],[]]],
	["vn_i_air_uh1c_07_01",[],[[],[]]],
	["vn_i_air_uh1c_02_01",[],[[],[]]],
	["vn_i_air_uh1c_01_01",[],[[],[]]],
	["vn_i_air_uh1d_01_01",[],[[],[]]],
	["vn_i_air_uh1d_02_01",[],[[],[]]],
	["vn_b_air_ah1g_02",[],[[],[]]],
	["vn_b_air_ah1g_08",[],[[],[]]],
	["vn_b_air_ah1g_08",[],[[],[]]],
	["vn_b_air_oh6a_01",[],[[],[]]],
	["vn_b_air_oh6a_05",[],[[],[]]],
	["vn_b_air_oh6a_02",[],[[],[]]],
	["vn_b_air_ch34_04_02",[],[[],[]]],
	["vn_b_air_ch34_03_01",[],[[],[]]]
	//
	//["B_Heli_Light_01_F",[],[[],[]]],
	//["O_Heli_Light_02_unarmed_F",[],[[],[]]],
	//["I_Heli_Transport_02_F",[],[[],[]]],
	//["I_Heli_light_03_unarmed_F",[],[[],[]]],
	//["O_Heli_Transport_04_F",[],[[],[]]],
	//["O_Heli_Transport_04_bench_F",[],[[],[]]],
	//["I_C_Heli_Light_01_civil_F",[],[[],[]]],
	//["I_E_Heli_light_03_unarmed_F",[],[[],[]]],
	//["vtx_UH60M_MEDEVAC",[],[[],[]]],
	//["vtx_UH60M_SLICK",[],[[],[]]],
	//["vtx_HH60",[],[[],[]]],
	//["vtx_UH60M",[],[[],[]]],
	//["vtx_MH60M",[],[[],[]]],
	//["vtx_MH60S",[],[[],[]]], //REMOVED BY HATCHET
	//["vtx_MH60S_GAU21L",[],[[],[]]], //REMOVED BY HATCHET
	//["vtx_MH60S_Pylons",[],[[],[]]], //REMOVED BY HATCHET
	//["vtx_MH60M_DAP",[],[[],[]]],
	//["RHS_Mi24Vt_vvs",[],[[],[]]], //1 minigun
	//["RHS_Mi8mt_Cargo_vvs",[],[[],[]]],
	//["RHS_Mi8amt_civilian",[],[[],[]]]
];
WMS_AMS_CIVRwds = [
	["vn_c_car_01_01",[],[[],[]]],
	["vn_c_car_03_01",[],[[],[]]],
	["vn_c_car_02_01",[],[[],[]]],
	["vn_c_wheeled_m151_02",[],[[],[]]],
	["vn_c_wheeled_m151_01",[],[[],[]]],
	["vn_c_car_01_02",[],[[],[]]],
	["vn_c_car_04_01",[],[[],[]]],
	//
	["C_Hatchback_01_F",[],[[],[]]],
	["C_Hatchback_01_sport_F",[],[[],[]]],
	["C_Offroad_02_unarmed_F",[],[[],[]]],
	["C_Offroad_01_F",[],[[],[]]],
	//["C_SUV_01_F",[],[[],[]]],
	["C_Van_01_transport_F",[],[[],[]]],
	["C_Van_01_box_F",[],[[],[]]],
	["C_Van_02_vehicle_F",[],[[],[]]],
	["C_Van_02_transport_F",[],[[],[]]]
	//["C_IDAP_Offroad_02_unarmed_F",[],[[],[]]],
	//["C_IDAP_Offroad_01_F",[],[[],[]]],
	//["C_IDAP_Van_02_vehicle_F",[],[[],[]]],
	//["C_IDAP_Van_02_transport_F",[],[[],[]]]
];
WMS_AMS_COMMSRwds = [
	["vn_b_wheeled_m54_03",[],[[],[]]],
	["vn_b_armor_m577_01",[],[[],[]]],
		["vn_b_wheeled_m54_03",[],[[],[]]],
		["vn_b_armor_m577_01",[],[[],[]]],
		["vn_b_wheeled_m54_03",[],[[],[]]],
		["vn_b_armor_m577_01",[],[[],[]]],
	//
	["B_GEN_Offroad_01_comms_F",[],[[],[]]],
	["I_E_Offroad_01_comms_F",[],[[],[]]],
	["C_Offroad_01_comms_F",[],[[],[]]],
	//["I_LT_01_scout_F",[],[[],[]]],
	["O_Truck_03_device_F",[],[[],[]]],
	["O_T_Truck_03_device_ghex_F",[],[[],[]]],
	["rhsusf_m1152_sicps_usarmy_wd",[],[[],[]]],
	["rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy",[],[[],[]]],
	["rhsusf_M1230_M2_usarmy_wd",[],[[],[]]],
	["rhsusf_CGRCAT1A2_M2_usmc_wd",[],[[],[]]],
	//["rhs_tigr_sts_msv",[],[[],[]]],
	["rhs_gaz66_r142_msv",[],[[],[]]],
	["rhsgref_BRDM2UM_msv",[],[[],[]]]
	//["rhs_prp3_msv",[],[[],[]]]
];
WMS_AMS_MEDRwds = [
	["vn_b_armor_m577_02",[],[[],[]]],
	["vn_b_wheeled_lr2a_03_aus_army",[],[[],[]]],
		["vn_b_armor_m577_02",[],[[],[]]],
		["vn_b_wheeled_lr2a_03_aus_army",[],[[],[]]],
		["vn_b_armor_m577_02",[],[[],[]]],
		["vn_b_wheeled_lr2a_03_aus_army",[],[[],[]]],
	//
	["B_Truck_01_medical_F",[],[[],[]]],
	["B_T_Truck_01_medical_F",[],[[],[]]],
	["O_Truck_02_medical_F",[],[[],[]]],
	["O_Truck_03_medical_F",[],[[],[]]],
	["O_T_Truck_03_medical_ghex_F",[],[[],[]]],
	["O_T_Truck_02_Medical_F",[],[[],[]]],
	["I_E_Truck_02_Medical_F",[],[[],[]]],
	//["C_IDAP_Van_02_medevac_F",[],[[],[]]],
	["rhsusf_m113_usarmy_medical",[],[[],[]]],
	["rhsusf_M1230a1_usarmy_wd",[],[[],[]]]
	//["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",[],[[],[]]]
];