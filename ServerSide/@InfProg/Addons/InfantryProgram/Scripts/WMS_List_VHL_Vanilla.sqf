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
	//["Exile_Car_V3S_Open",[],[[],[]]] FUCKING BROKEN 
["O_MRAP_02_F",[],[[],[]]],
["O_LSV_02_unarmed_F",[],[[],[]]],
["O_G_Offroad_01_F",[],[[],[]]],
["O_G_Offroad_01_repair_F",[],[[],[]]],
["O_Truck_03_transport_F",[],[[],[]]],
["O_Truck_03_covered_F",[],[[],[]]],
["O_Truck_02_transport_F",[],[[],[]]],
["O_Truck_02_covered_F",[],[[],[]]],
	["Exile_Car_Van_Guerilla02",[],[[],[]]],
	["Exile_Car_Van_Guerilla03",[],[[],[]]],
	["Exile_Car_V3S_Covered",[],[[],[]]],
	["Exile_Car_HMMWV_UNA_Desert",[],[[],[]]],
	["Exile_Car_Van_Box_Guerilla02",[],[[],[]]],
	["Exile_Car_Van_Box_Guerilla03",[],[[],[]]],
	["Exile_Car_Offroad_Guerilla10",[],[[],[]]],
	["Exile_Car_Offroad_Guerilla11",[],[[],[]]],
	["Exile_Car_Offroad_Guerilla06",[],[[],[]]],
	["Lada_Civ_04",[],[[],[]]]
	//["B_LSV_01_unarmed_sand_F",[],[[],[]]],
];
WMS_OPFOR_CustomVHL_Armed = [
	["O_G_Offroad_01_AT_F",[],[[],[]]],
	["O_G_Offroad_01_armed_F",[],[[],[]]],
	["O_MRAP_02_hmg_F",[],[[],[]]],
	["O_LSV_02_armed_F",[],[[],[]]],
	["Exile_Car_HMMWV_M134_Desert",[],[[],[]]],
	["Exile_Car_Offroad_Armed_Guerilla10",[],[[],[]]]
];
WMS_OPFOR_CustomVHL_Spec = [ //Heavy armed
	["O_APC_Tracked_02_cannon_F",[],[[],[]]],
	["O_APC_Wheeled_02_rcws_v2_F",[],[[],[]]]
];
WMS_OPFOR_CustomAIR_Transport = [
	["O_Heli_Transport_04_bench_F",[],[[],[]]], //taru
	["O_Heli_Transport_04_covered_F",[],[[],[]]], //black taru
	["B_Heli_Transport_03_unarmed_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa", 1,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]] //black huron
];
WMS_OPFOR_CustomAIR_Unarmed = [
["B_Heli_Light_01_F",[],[[],[]]], //littleBird
["O_Heli_Light_02_unarmed_F",[],[[],[]]], //orca
["O_Heli_Transport_04_F",[],[[],[]]], //taru
["O_Heli_Transport_04_bench_F",[],[[],[]]] //taru
];
WMS_OPFOR_CustomAIR_Armed = [
["O_Heli_Light_02_dynamicLoadout_F",[],[[],[]]], //orca
["B_Heli_Light_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]], //pawnee
["B_CTRG_Heli_Transport_01_sand_F",[],[[],[]]] //ghostHawk
];
WMS_OPFOR_CustomAIR_Spec = [//attack choppers
["B_Heli_Attack_01_dynamicLoadout_F",[0,"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa"],[[],[]]] //"O_Heli_Attack_02_dynamicLoadout_F" //Mi48 //"a3\air_f_beta\heli_attack_02\data\heli_attack_02_body1_co.paa","a3\air_f_beta\heli_attack_02\data\heli_attack_02_body2_co.paa"
];
WMS_OPFOR_CustomSEA = [
	["O_Boat_Armed_01_hmg_F",[],[[],[]]],
	["O_T_Boat_Armed_01_hmg_F",[],[[],[]]]
];
WMS_AMS_LightArmed = [
	//["B_T_LSV_01_armed_sand_F",[],[[],[]]],
["O_MRAP_02_hmg_F",[],[[],[]]],
["O_LSV_02_armed_F",[],[[],[]]],
["O_G_Offroad_01_AT_F",[],[[],[]]],
["O_G_Offroad_01_armed_F",[],[[],[]]],
	//["O_LSV_02_armed_black_F",[],[[],[]]],
	["Exile_Car_Offroad_Armed_Guerilla12",[],[[],[]]],
	["O_G_Offroad_01_AT_F",[],[[],[]]], //RED
	["I_C_Offroad_02_LMG_F",[],[[],[]]],
	["I_C_Offroad_02_AT_F",[],[[],[]]],
	["HMMWV_M2_des",[],[[],[]]],
	["HMMWV_M134_des",[],[[],[]]]
];
WMS_AMS_APC = [
["O_APC_Tracked_02_cannon_F",[],[[],[]]],
["O_APC_Wheeled_02_rcws_v2_F",[],[[],[]]],
	["B_APC_Wheeled_01_cannon_F",[],[[],[]]], //Marshall
	["B_APC_Wheeled_03_cannon_F",["Guerilla_02",1],[[],[]]],
	["B_AFV_Wheeled_01_cannon_F",[],[[],[]]],
	["I_E_APC_tracked_03_cannon_F",[],[[],[]]]
];
WMS_AMS_HeavyArmed = [
	["B_AFV_Wheeled_01_cannon_F",[],[[],[]]], //Rhino
	["B_AFV_Wheeled_01_up_cannon_F",[],[[],[]]], //Rhino up
	["B_MBT_01_cannon_F",[],[[],[]]] //Slammer
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
WMS_AMS_LightArmedRwds = [ //I_LT_01_cannon_F
	["B_LSV_01_armed_olive_F",[],[[],[]]],
	["O_LSV_02_armed_ghex_F",[],[[],[]]],
	["B_G_Offroad_01_armed_F",[],[[],[]]],
	["I_C_Offroad_02_LMG_F",[],[[],[]]]
];
//NEW
WMS_AMS_ArmoredREDRwds = [
	["O_T_APC_Tracked_02_cannon_ghex_F",[],[[],[]]]
];
WMS_AMS_ArmoredBLUERwds = [
	["B_T_APC_Wheeled_01_cannon_F",[],[[],[]]],
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