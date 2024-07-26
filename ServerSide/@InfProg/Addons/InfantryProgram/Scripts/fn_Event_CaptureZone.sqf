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
WMS_CaptureZone			= false;
WMS_CaptureZone_Rad 	= [10,20,50]; //Capture zone Radius
WMS_CaptureZone_Tmr		= 300; //time to capture the zone
WMS_CaptureZone_Wav		= [5,7,9]; //AI Waves to come
WMS_CaptureZone_Dis		= [100,300]; //AI waves spawn distances
WMS_CaptureZone_Obj 	= []; //layout + sphere for cleanup
//WMS_CaptureZone_Bdr 	= []; //Sign_Sphere25cm_F objects //local to the function
*/
if (WMS_IP_LOGs) then {diag_log format ["[EVENT CAPTUREZONE]|WAK|TNA|WMS| _this = %1", _this]};
private ["_textureR","_textureG","_textureB","_zoneStatus_Running","_posObjects","_object","_triggCapture","_triggContest","_CaptureZone_Bdr","_talk","_phone"];
params[
	["_pos", "random"],
	["_layout", "empty"],
	["_radius", WMS_CaptureZone_Rad],
	["_timer", WMS_CaptureZone_Tmr],
	["_type", "random"] //easy, moderate, difficult, hardore, I guess
];
if (typeName _pos == "STRING") then {
	if (_pos == "random" ) then {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), 20, 0, WMS_AMS_MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_findSafePos;
	};
};

_textureR = "#(rgb,8,8,3)color(255,0,0,1)"; 
_textureG = "#(rgb,8,8,3)color(0,255,0,1)"; 
_textureB = "#(rgb,8,8,3)color(0,0,255,1)";
_zoneStatus_Running = true;
WMS_zoneStatus_Neutral = true; 	//BLUE 	//reset
WMS_zoneStatus_Capture = false; 	//GREEN //timer
WMS_zoneStatus_Contest = false; 	//RED 	//pause
WMS_captureTimerCount = 0;
_CaptureZone_Bdr = [];
_CaptureZone_Obj = [];
_unitsR = 5;
_grpsR = 1;
_startR = 15;
_cooldR = 60;
_cumulCoolD = _startR;
_distR = [150, 300];
_rewards = [[3,1,1],
			[1,1,2],
			[3,1,2],
			[1,3,3],
			[0,0,0]];//[_weap,_bag,_items,_ammoList,_mag]
WMS_captureZoneEvents = [[_startR,'ground']]; //[[time, event], [time, event], [time, event]]

if (_type == "random") then {_type = selectRandom ["easy", "moderate", "difficult", "hardore"]};

switch (tolower _type) do
{
	case "easy": {
		_unitsR = 2 + round random 2;
		_grpsR = selectRandom [1,2,1];
		_cooldR = 50 +random 5;
		_distR = [150, 250];
		if (typeName _timer == "ARRAY") then {
			_timer = (_timer select 0);
		};
		_rewards = [
			[5,1,3], //how many type, now may from type, + random
			[1,1,2],
			[5,1,2],
			[1,3,3],
			[0,0,0]
			];
	};
	case "moderate": {
		_unitsR = 3 + round random 2;
		_grpsR = selectRandom [1,2];
		_cooldR = 65 +random 5;
		_distR = [125, 200];
		if (typeName _timer == "ARRAY") then {
			_timer = (_timer select 1);
		};
		_rewards = [
			[7,1,3],
			[2,1,2],
			[5,1,2],
			[1,3,3],
			[0,0,0]];
	};
	case "difficult": {
		_unitsR = 4 + round random 1;
		_grpsR = selectRandom [2,1,2];
		_cooldR = 80 +random 5;
		_distR = [100, 250];
		if (typeName _timer == "ARRAY") then {
			_timer = (_timer select 2);
		};
		_rewards = [
			[9,1,3],
			[2,1,2],
			[5,1,2],
			[1,3,3],
			[0,0,0]];
	};
	case "hardcore": {
		_unitsR = 3 + round random 3;
		_grpsR = selectRandom [1,3,2];
		_cooldR = 95 +random 5;
		_distR = [80, 200];
		if (typeName _timer == "ARRAY") then {
			_timer = (_timer select 3);
		};
		_rewards = [
			[11,1,3],
			[3,1,2],
			[5,1,2],
			[1,3,3],
			[0,0,0]];
	};
	default {
		_unitsR = 5;
		_grpsR = 1;
		_cooldR = 60;
		_timer = 300;
		_distR = [150, 300];
		_rewards = [
			[4,1,2],
			[1,1,2],
			[2,1,2],
			[1,2,2],
			[0,0,0]];
	};
};
_iterations = round _timer/_cooldR;
/* //in the trigger
WMS_captureZoneEvents = [[_startR,'ground']];
for '_i' from 2 to _iterations do {
	_cumulCoolD = round (_cumulCoolD + _cooldR + (random 5));
	WMS_captureZoneEvents pushback [_cumulCoolD,'ground'];
};*/

WMS_fnc_spawnCaptureZoneObjects = {
	params [
		"_pos",
		["_layout","empty"]
	];
	_dirFlag = random 360;
	if (WMS_IP_LOGs) then {diag_log format ["[CAPTUREZONE_OBJECTS]|WAK|TNA|WMS| _this = %1", _this]};
	_compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
	_compoRefPoint setDir _dirFlag;
	_objects = [["FirePlace_burning_F",[-2.66703,-5.399602,0],46.8]];
	_objectsList = [];
	/*_layout1 = [
		[WMS_OPFOR_Flag,[0,0,0],0],
		["Land_Bunker_01_blocks_3_F",[8.2,15.7,0],38.8],
		["Land_Bunker_01_blocks_3_F",[14.8,-11.2,0],123.4],
		["Land_Bunker_01_blocks_3_F",[7.1,-15.4,0],156.8],
		["Land_Bunker_01_blocks_3_F",[-2.3,-19.1,0],208.4],
		["Land_Bunker_01_blocks_3_F",[-19.7,-1,0],266.5],
		["Land_Bunker_01_blocks_3_F",[-18.2,9.3,0],301.5],
		["Land_Bunker_01_small_F",[-9.3,-10.2,0],43.7],
		["Land_Bunker_01_small_F",[-7.4,12,0],148.6],
		["Land_Bunker_01_small_F",[13,-0.4,0],269.7],
		["Land_Mil_WallBig_4m_battered_F",[-3.4,-12.9,0],8.9],
		["Land_Mil_WallBig_4m_battered_F",[-13.4,-6.5,0],35],
		["Land_Mil_WallBig_4m_battered_F",[-14,0.3,0],83.3],
		["Land_Mil_WallBig_4m_battered_F",[-13.9,4.2,0],102.1],
		["Land_Mil_WallBig_4m_battered_F",[4.9,10.9,0],201.6],
		["Land_Mil_WallBig_4m_battered_F",[8.1,8.7,0],228.8],
		["Land_Mil_WallBig_4m_battered_F",[10.3,5.5,0],240.6],
		["Land_Mil_WallBig_4m_battered_F",[12,-5.9,0],294.1],
		["Land_Mil_WallBig_4m_damaged_center_F",[1.8,15.5,0],227.1],
		["Land_Mil_WallBig_4m_damaged_left_F",[-16.3,-3.8,0],52.5],
		["Land_Mil_WallBig_4m_damaged_left_F",[-1.4,12.6,0],178.4],
		["Land_Mil_WallBig_4m_damaged_left_F",[9.7,-9.2,0],314.1],
		["Land_Mil_WallBig_4m_damaged_right_F",[-12,7.4,0],138],
		["Land_Mil_WallBig_4m_damaged_right_F",[0.7,-13,0],351],
		["Land_SandbagBarricade_01_half_F",[1.9,3.6,0],5.5],
		["Land_SandbagBarricade_01_half_F",[2.6,-3,0],148.6],
		["Land_SandbagBarricade_01_half_F",[-2.5,-3.6,0],196.8],
		["Land_SandbagBarricade_01_half_F",[-4.7,1.8,0],288.1]
		];
	_layout2 = [ //Old Bunkers
		[WMS_OPFOR_Flag,[0,0,0],0],
		["CamoNet_ghex_open_F",[0,0,0],269.2],
		["Land_BagFence_01_long_green_F",[-1.1,-6.4,0],10.8],
		["Land_BagFence_01_long_green_F",[1.5,-6.2,0],340.4],
		["Land_BagFence_01_round_green_F",[-4.8,-4.5,0],58.4],
		["Land_BagFence_01_round_green_F",[-3.3,5.5,0],149.4],
		["Land_PillboxBunker_01_big_F",[8.3,-1.2,0],88.7],
		["Land_PillboxBunker_01_hex_F",[1.8,10.3,0],102.1],
		["Land_PillboxBunker_01_hex_F",[4,-12.3,0],241.5],
		["Land_PillboxBunker_01_hex_F",[-7.6,-11.2,0],271.1],
		["Land_PillboxBunker_01_rectangle_F",[-11.2,1.6,0],270],
		["Land_PillboxWall_01_3m_round_F",[-1.2,10.3,0],0.3],
		["Land_PillboxWall_01_3m_round_F",[-14.6,-9.4,0],270.6],
		["Land_PillboxWall_01_6m_round_F",[4.6,7.1,0],57.6],
		["Land_PillboxWall_01_6m_round_F",[10.3,-8.6,0],90],
		["Land_PillboxWall_01_6m_round_F",[-0.2,-15.4,0],180],
		["Land_PillboxWall_01_6m_round_F",[-11.9,-10.7,0],180],
		["Land_PillboxWall_01_6m_round_F",[-11.7,4.4,0],270],
		["Land_PillboxWall_01_6m_round_F",[-11.1,-4.6,0],270],
		["Land_PillboxWall_01_6m_round_F",[-9.5,9,0],319.8]
		];
	_layout3 = [ //Farm
		[WMS_OPFOR_Flag,[0,0,0],0],
		["Land_Barricade_01_10m_F",[-9,11.8,0],330.8],
		["Land_Barricade_01_4m_F",[-11.9,-12.2,0],248.7],
		["Land_FirewoodPile_01_F",[-0.9,9.9,0],93],
		["Land_House_1W01_F",[-8.3,-0.5,0],270],
		["Land_House_1W08_F",[5.7,-9.1,0],180],
		["Land_House_2W05_F",[9.2,8.8,0],0],
		["Land_Hutch_01_F",[-4.2,-12.8,0],359.3],
		["Land_TimberPile_05_F",[13.6,0.3,0],0],
		["Land_WoodenWall_03_s_5m_v2_F",[11.8,-16.1,0],0],
		["Land_WoodenWall_03_s_5m_v2_F",[14.3,-13.6,0],270],
		["Land_WoodenWall_05_m_4m_v1_F",[-8.3,-13.5,0],0],
		["Land_WoodenWall_05_m_4m_v1_F",[-0.5,10.4,0],2.3],
		["Land_WoodenWall_05_m_4m_v2_F",[-11.1,-9.6,0],84],
		["Land_WoodPile_02_F",[13.1,-8.3,0],0]
		];
	_layout4 = [ //Outpost
		[WMS_OPFOR_Flag,[0,0,0],0],
		["Land_Cargo_House_V3_F",[3.9,6.4,0],90,"flat"],
		["Land_Cargo_House_V3_F",[-6,-6,0],180.6,"flat"],
		["Land_Cargo_Patrol_V3_F",[-9.8,9.4,0],90,"flat"],
		["Land_Cargo_Patrol_V3_F",[9.4,-10,0],270,"flat"],
		["Land_HBarrier_3_F",[-10.8,1.7,0],0],
		["Land_HBarrier_3_F",[12.4,4.7,0],0],
		["Land_HBarrier_3_F",[-3.2,-19.7,0],32.4],
		["Land_HBarrier_3_F",[-19.7,-4,0],49.3],
		["Land_HBarrier_3_F",[17.4,0.4,0],108.2],
		["Land_HBarrier_3_F",[-18.5,2.4,0],108.2],
		["Land_HBarrier_5_F",[13.4,8.3,0],271.7],
		["Land_HBarrier_Big_F",[6.3,-13.7,0],0],
		["Land_HBarrier_Big_F",[-7,13.8,0],0],
		["Land_HBarrier_Big_F",[-13.6,5.1,0],90],
		["Land_HBarrierWall4_F",[-12,-8.2,0],273.3],
		["Land_HBarrierWall6_F",[5.1,12.6,0],0],
		["Land_HBarrierWall6_F",[11.5,-5,0],90],
		["Land_HBarrierWall6_F",[-5.8,-12.7,0],184.1],
		["Land_HBarrierWall_corner_F",[11.6,12.8,0],0],
		["Land_HBarrierWall_corner_F",[11.7,-11.9,0],90],
		["Land_HBarrierWall_corner_F",[-11.6,-12.6,0],180],
		["Land_HBarrierWall_corner_F",[-12.5,12,0],270],
		["Land_SandbagBarricade_01_half_F",[0.1,19.8,0],28.4],
		["Land_SandbagBarricade_01_half_F",[-3.3,11.8,0],88.1],
		["Land_SandbagBarricade_01_half_F",[2.3,-18.8,0],142.2],
		["Land_SandbagBarricade_01_half_F",[14.9,-1.4,0],179.3],
		["Land_SandbagBarricade_01_half_F",[-15.4,-11.5,0],182],
		["Land_SandbagBarricade_01_half_F",[-8.5,0.4,0],221.7],
		["Land_SandbagBarricade_01_half_F",[-17.2,-10.2,0],250.9],
		["Land_SandbagBarricade_01_half_F",[2.6,-11.8,0],269.3],
		["Land_SandbagBarricade_01_half_F",[-13.6,-4.5,0],271],
		["Land_SandbagBarricade_01_half_F",[-2.2,19.6,0],323.5]
		];
	_layout5 = [ //matchupicatchu
		[WMS_OPFOR_Flag,[0,0,0],0],
		["Land_AncientHead_01_F",[0,5.2,0],0,"flat"],
		["Land_AncientStatue_01_F",[6.7,-5.8,0],139.9,"flat"],
		["Land_AncientStatue_02_F",[-6.8,-5.9,0],216.8,"flat"],
		["Land_BasaltKerb_01_2m_d_F",[-17.4,13.3,0],168.8],
		["Land_BasaltKerb_01_4m_F",[-18.5,9.3,0],238.6],
		["Land_BasaltKerb_01_pile_F",[-13.1,10.2,0],41.4],
		["Land_BasaltKerb_01_pile_F",[-13.8,8.3,0],238.3],
		["Land_BasaltKerb_01_platform_F",[8,13,5.94],0,"flat"],
		["Land_BasaltKerb_01_platform_F",[2.8,12.7,7.47],1.9,"flat"],
		["Land_BasaltKerb_01_platform_F",[12.6,6.5,4.09],90,"flat"],
		["Land_BasaltKerb_01_platform_F",[-7.7,12,4.09],105.6,"flat"],
		["Land_BasaltKerb_01_platform_F",[-12.1,7.4,4.08],180.2,"flat"],
		["Land_BasaltKerb_01_platform_F",[-9.3,8.6,4.06],307.8,"flat"],
		["Land_BasaltWall_01_4m_F",[12.4,-12,-1.76],181.1,"flat"],
		["Land_BasaltWall_01_8m_F",[-0.5,10.5,5.98],0,"flat"],
		["Land_BasaltWall_01_8m_F",[6.8,10.5,5.98],0,"flat"],
		["Land_BasaltWall_01_8m_F",[-9.9,1.1,5.98],89.5,"flat"],
		["Land_BasaltWall_01_8m_F",[-12.7,-7.5,0],90,"flat"],
		["Land_BasaltWall_01_8m_F",[-7.4,-8.8,5.98],179.5,"flat"],
		["Land_BasaltWall_01_8m_F",[-0.2,-8.7,5.98],179.5,"flat"],
		["Land_BasaltWall_01_8m_F",[7.1,-8.6,5.98],179.5,"flat"],
		["Land_BasaltWall_01_8m_F",[12.4,6,-3.17],267.8,"flat"],
		["Land_BasaltWall_01_8m_F",[9.5,-6.5,5.98],269.6,"flat"],
		["Land_BasaltWall_01_8m_F",[9.4,0.7,5.98],269.6,"flat"],
		["Land_BasaltWall_01_8m_F",[12.3,-7.1,0],269.6,"flat"],
		["Land_BasaltWall_01_8m_F",[9.3,8,5.98],269.6,"flat"],
		["Land_BasaltWall_01_d_left_F",[4.1,12.5,0],0,"flat"],
		["Land_BasaltWall_01_d_left_F",[-12,-11.7,0],0.5,"flat"],
		["Land_BasaltWall_01_d_left_F",[12.2,9.4,0],90,"flat"],
		["Land_BasaltWall_01_d_left_F",[-9.7,-2.4,6.05],90,"flat"],
		["Land_BasaltWall_01_d_left_F",[-4.6,10.4,5.89],180,"flat"],
		["Land_BasaltWall_01_d_left_F",[10.4,-11.9,0],180,"flat"],
		["Land_BasaltWall_01_d_left_F",[-12.8,6.2,0],270,"flat"],
		["Land_BasaltWall_01_d_right_F",[11.5,12.3,0],0,"flat"],
		["Land_BasaltWall_01_d_right_F",[-6,12.7,0],0,"flat"],
		["Land_BasaltWall_01_d_right_F",[-9.6,-7,6.04],89,"flat"],
		["Land_BasaltWall_01_d_right_F",[-9.9,4.7,6.06],90,"flat"],
		["Land_BasaltWall_01_d_right_F",[12.3,3.9,0],90,"flat"],
		["Land_BasaltWall_01_d_right_F",[5.8,-11.8,0],180,"flat"],
		["Land_BasaltWall_01_d_right_F",[-5.2,-11.7,0],359.4,"flat"],
		["Land_BasaltWall_01_gate_F",[0.5,-12.3,0],0,"flat"],
		["Land_BasaltWall_01_gate_F",[-13.4,0,0],90,"flat"],
		["Land_BasaltWall_01_gate_F",[0.1,13.1,0],180,"flat"],
		["Land_BasaltWall_01_gate_F",[12.9,0.1,0],270,"flat"],
		["Land_PetroglyphWall_01_F",[11.2,18,0],0,"flat"],
		["Land_PetroglyphWall_01_F",[-7.8,17.8,0],145.1,"flat"],
		["Land_PetroglyphWall_01_F",[-6.5,-16.9,0],145.1,"flat"],
		["Land_PetroglyphWall_01_F",[19.5,-4.4,0],287.3,"flat"],
		["Land_PetroglyphWall_02_F",[13.6,6.4,-0.3],270,"flat"],
		["Land_RM_boulder1",[-18.9,11.3,0],0],
		["Land_RM_boulder3",[4.9,13,7.41],166.9],
		["Land_RM_boulder3",[2.3,8.3,3.89],267.6],
		["Land_RM_boulder4",[18.8,-1.1,0],36.6],
		["Land_RM_boulder4",[-1.7,9.7,8.54],76.5],
		["Land_RM_boulder4",[-17.4,-5.9,0],218],
		["Land_RM_boulder4",[10.1,11.6,5.65],259.4],
		["Land_RM_boulder5",[2.5,17.9,0],0],
		["Land_RM_boulder5",[-18.7,-3.6,0],314.2],
		["Land_StoneTanoa_01_F",[0.2,-5.3,0],0]
		];
	_layout6 = [ //old castle
		[WMS_OPFOR_Flag,[0,0,0],0],
		["Land_CastleRuins_01_bastion_F",[6.9,-0.9,0],0,"flat"],
		["Land_CastleRuins_01_wall_10m_F",[-7.1,-11.2,-1.5],54.5,"flat"],
		["Land_CastleRuins_01_wall_10m_F",[-10.2,9.1,-1.5],105.7,"flat"],
		["Land_CastleRuins_01_wall_10m_F",[-5,12.1,-1.5],194.7,"flat"],
		["Land_CastleRuins_01_wall_10m_F",[10.6,-13.4,0],309.2,"flat"],
		["Land_CastleRuins_01_wall_d_L_F",[10.5,7.1,0],91.7,"flat"],
		["Land_CastleRuins_01_wall_d_L_F",[-2.5,-16.6,-1.5],217.5,"flat"],
		["Land_CastleRuins_01_wall_d_L_F",[5.3,-18.3,0],333.8,"flat"],
		["Land_CastleRuins_01_wall_d_R_F",[-11.4,2.2,-1.5],90.5,"flat"],
		["Land_CastleRuins_01_wall_d_R_F",[0.1,4,0],182.3,"flat"],
		["Land_CastleRuins_01_wall_d_R_F",[15.7,-8.2,0],323.1,"flat"],
		["Land_DeerStand_01_F",[7.6,-10.9,0],309,"flat"],
		["Land_DeerStand_02_F",[-9,-5.1,0],83,"flat"],
		["Land_LampIndustrial_01_F",[1.9,-3.9,0],224.1,"flat"],
		["Land_SharpStone_01",[-1,-15.6,0],0],
		["Land_SharpStone_02",[17.4,-4.8,0],310.2],
		["Land_StoneWall_02_s_10m_F",[-13.4,-7.3,0.5],72.1,"flat"],
		["Land_StoneWall_02_s_10m_F",[10.3,11.7,0.5],179.9,"flat"],
		["Land_StoneWall_02_s_10m_F",[16.6,7,0],239.3],"flat",
		["Land_StoneWell_01_F",[-4,1.2,0],0]
		];*/
	switch (tolower _layout) do
	{
		case "empty": {
			_objects = [];
		};
		case "layout1": {
			_objects = [
				[WMS_OPFOR_Flag,[0,0,0],0],
				["Land_Bunker_01_blocks_3_F",[8.2,15.7,0],38.8],
				["Land_Bunker_01_blocks_3_F",[14.8,-11.2,0],123.4],
				["Land_Bunker_01_blocks_3_F",[7.1,-15.4,0],156.8],
				["Land_Bunker_01_blocks_3_F",[-2.3,-19.1,0],208.4],
				["Land_Bunker_01_blocks_3_F",[-19.7,-1,0],266.5],
				["Land_Bunker_01_blocks_3_F",[-18.2,9.3,0],301.5],
				["Land_Bunker_01_small_F",[-9.3,-10.2,0],43.7],
				["Land_Bunker_01_small_F",[-7.4,12,0],148.6],
				["Land_Bunker_01_small_F",[13,-0.4,0],269.7],
				["Land_Mil_WallBig_4m_battered_F",[-3.4,-12.9,0],8.9],
				["Land_Mil_WallBig_4m_battered_F",[-13.4,-6.5,0],35],
				["Land_Mil_WallBig_4m_battered_F",[-14,0.3,0],83.3],
				["Land_Mil_WallBig_4m_battered_F",[-13.9,4.2,0],102.1],
				["Land_Mil_WallBig_4m_battered_F",[4.9,10.9,0],201.6],
				["Land_Mil_WallBig_4m_battered_F",[8.1,8.7,0],228.8],
				["Land_Mil_WallBig_4m_battered_F",[10.3,5.5,0],240.6],
				["Land_Mil_WallBig_4m_battered_F",[12,-5.9,0],294.1],
				["Land_Mil_WallBig_4m_damaged_center_F",[1.8,15.5,0],227.1],
				["Land_Mil_WallBig_4m_damaged_left_F",[-16.3,-3.8,0],52.5],
				["Land_Mil_WallBig_4m_damaged_left_F",[-1.4,12.6,0],178.4],
				["Land_Mil_WallBig_4m_damaged_left_F",[9.7,-9.2,0],314.1],
				["Land_Mil_WallBig_4m_damaged_right_F",[-12,7.4,0],138],
				["Land_Mil_WallBig_4m_damaged_right_F",[0.7,-13,0],351],
				["Land_SandbagBarricade_01_half_F",[1.9,3.6,0],5.5],
				["Land_SandbagBarricade_01_half_F",[2.6,-3,0],148.6],
				["Land_SandbagBarricade_01_half_F",[-2.5,-3.6,0],196.8],
				["Land_SandbagBarricade_01_half_F",[-4.7,1.8,0],288.1]
			];
		};
		case "layout2" : {
			_objects = [ //Old Bunkers
				[WMS_OPFOR_Flag,[0,0,0],0],
				["CamoNet_ghex_open_F",[0,0,0],269.2],
				["Land_BagFence_01_long_green_F",[-1.1,-6.4,0],10.8],
				["Land_BagFence_01_long_green_F",[1.5,-6.2,0],340.4],
				["Land_BagFence_01_round_green_F",[-4.8,-4.5,0],58.4],
				["Land_BagFence_01_round_green_F",[-3.3,5.5,0],149.4],
				["Land_PillboxBunker_01_big_F",[8.3,-1.2,0],88.7],
				["Land_PillboxBunker_01_hex_F",[1.8,10.3,0],102.1],
				["Land_PillboxBunker_01_hex_F",[4,-12.3,0],241.5],
				["Land_PillboxBunker_01_hex_F",[-7.6,-11.2,0],271.1],
				["Land_PillboxBunker_01_rectangle_F",[-11.2,1.6,0],270],
				["Land_PillboxWall_01_3m_round_F",[-1.2,10.3,0],0.3],
				["Land_PillboxWall_01_3m_round_F",[-14.6,-9.4,0],270.6],
				["Land_PillboxWall_01_6m_round_F",[4.6,7.1,0],57.6],
				["Land_PillboxWall_01_6m_round_F",[10.3,-8.6,0],90],
				["Land_PillboxWall_01_6m_round_F",[-0.2,-15.4,0],180],
				["Land_PillboxWall_01_6m_round_F",[-11.9,-10.7,0],180],
				["Land_PillboxWall_01_6m_round_F",[-11.7,4.4,0],270],
				["Land_PillboxWall_01_6m_round_F",[-11.1,-4.6,0],270],
				["Land_PillboxWall_01_6m_round_F",[-9.5,9,0],319.8]
			];
		};
		case "layout3": {
			_objects = [ //Farm
				[WMS_OPFOR_Flag,[0,0,0],0],
				["Land_Barricade_01_10m_F",[-9,11.8,0],330.8],
				["Land_Barricade_01_4m_F",[-11.9,-12.2,0],248.7],
				["Land_FirewoodPile_01_F",[-0.9,9.9,0],93],
				["Land_House_1W01_F",[-8.3,-0.5,0],270],
				["Land_House_1W08_F",[5.7,-9.1,0],180],
				["Land_House_2W05_F",[9.2,8.8,0],0],
				["Land_Hutch_01_F",[-4.2,-12.8,0],359.3],
				["Land_TimberPile_05_F",[13.6,0.3,0],0],
				["Land_WoodenWall_03_s_5m_v2_F",[11.8,-16.1,0],0],
				["Land_WoodenWall_03_s_5m_v2_F",[14.3,-13.6,0],270],
				["Land_WoodenWall_05_m_4m_v1_F",[-8.3,-13.5,0],0],
				["Land_WoodenWall_05_m_4m_v1_F",[-0.5,10.4,0],2.3],
				["Land_WoodenWall_05_m_4m_v2_F",[-11.1,-9.6,0],84],
				["Land_WoodPile_02_F",[13.1,-8.3,0],0]
			];
		};
		case "layout4": {
			_objects = [ //Outpost
				[WMS_OPFOR_Flag,[0,0,0],0],
				["Land_Cargo_House_V3_F",[3.9,6.4,0],90,"flat"],
				["Land_Cargo_House_V3_F",[-6,-6,0],180.6,"flat"],
				["Land_Cargo_Patrol_V3_F",[-9.8,9.4,0],90,"flat"],
				["Land_Cargo_Patrol_V3_F",[9.4,-10,0],270,"flat"],
				["Land_HBarrier_3_F",[-10.8,1.7,0],0],
				["Land_HBarrier_3_F",[12.4,4.7,0],0],
				["Land_HBarrier_3_F",[-3.2,-19.7,0],32.4],
				["Land_HBarrier_3_F",[-19.7,-4,0],49.3],
				["Land_HBarrier_3_F",[17.4,0.4,0],108.2],
				["Land_HBarrier_3_F",[-18.5,2.4,0],108.2],
				["Land_HBarrier_5_F",[13.4,8.3,0],271.7],
				["Land_HBarrier_Big_F",[6.3,-13.7,0],0],
				["Land_HBarrier_Big_F",[-7,13.8,0],0],
				["Land_HBarrier_Big_F",[-13.6,5.1,0],90],
				["Land_HBarrierWall4_F",[-12,-8.2,0],273.3],
				["Land_HBarrierWall6_F",[5.1,12.6,0],0],
				["Land_HBarrierWall6_F",[11.5,-5,0],90],
				["Land_HBarrierWall6_F",[-5.8,-12.7,0],184.1],
				["Land_HBarrierWall_corner_F",[11.6,12.8,0],0],
				["Land_HBarrierWall_corner_F",[11.7,-11.9,0],90],
				["Land_HBarrierWall_corner_F",[-11.6,-12.6,0],180],
				["Land_HBarrierWall_corner_F",[-12.5,12,0],270],
				["Land_SandbagBarricade_01_half_F",[0.1,19.8,0],28.4],
				["Land_SandbagBarricade_01_half_F",[-3.3,11.8,0],88.1],
				["Land_SandbagBarricade_01_half_F",[2.3,-18.8,0],142.2],
				["Land_SandbagBarricade_01_half_F",[14.9,-1.4,0],179.3],
				["Land_SandbagBarricade_01_half_F",[-15.4,-11.5,0],182],
				["Land_SandbagBarricade_01_half_F",[-8.5,0.4,0],221.7],
				["Land_SandbagBarricade_01_half_F",[-17.2,-10.2,0],250.9],
				["Land_SandbagBarricade_01_half_F",[2.6,-11.8,0],269.3],
				["Land_SandbagBarricade_01_half_F",[-13.6,-4.5,0],271],
				["Land_SandbagBarricade_01_half_F",[-2.2,19.6,0],323.5]
			];
		};
		case "layout5": {
			_objects = [ //matchupicatchu
				[WMS_OPFOR_Flag,[0,0,0],0],
				["Land_AncientHead_01_F",[0,5.2,0],0,"flat"],
				["Land_AncientStatue_01_F",[6.7,-5.8,0],139.9,"flat"],
				["Land_AncientStatue_02_F",[-6.8,-5.9,0],216.8,"flat"],
				["Land_BasaltKerb_01_2m_d_F",[-17.4,13.3,0],168.8],
				["Land_BasaltKerb_01_4m_F",[-18.5,9.3,0],238.6],
				["Land_BasaltKerb_01_pile_F",[-13.1,10.2,0],41.4],
				["Land_BasaltKerb_01_pile_F",[-13.8,8.3,0],238.3],
				["Land_BasaltKerb_01_platform_F",[8,13,5.94],0,"flat"],
				["Land_BasaltKerb_01_platform_F",[2.8,12.7,7.47],1.9,"flat"],
				["Land_BasaltKerb_01_platform_F",[12.6,6.5,4.09],90,"flat"],
				["Land_BasaltKerb_01_platform_F",[-7.7,12,4.09],105.6,"flat"],
				["Land_BasaltKerb_01_platform_F",[-12.1,7.4,4.08],180.2,"flat"],
				["Land_BasaltKerb_01_platform_F",[-9.3,8.6,4.06],307.8,"flat"],
				["Land_BasaltWall_01_4m_F",[12.4,-12,-1.76],181.1,"flat"],
				["Land_BasaltWall_01_8m_F",[-0.5,10.5,5.98],0,"flat"],
				["Land_BasaltWall_01_8m_F",[6.8,10.5,5.98],0,"flat"],
				["Land_BasaltWall_01_8m_F",[-9.9,1.1,5.98],89.5,"flat"],
				["Land_BasaltWall_01_8m_F",[-12.7,-7.5,0],90,"flat"],
				["Land_BasaltWall_01_8m_F",[-7.4,-8.8,5.98],179.5,"flat"],
				["Land_BasaltWall_01_8m_F",[-0.2,-8.7,5.98],179.5,"flat"],
				["Land_BasaltWall_01_8m_F",[7.1,-8.6,5.98],179.5,"flat"],
				["Land_BasaltWall_01_8m_F",[12.4,6,-3.17],267.8,"flat"],
				["Land_BasaltWall_01_8m_F",[9.5,-6.5,5.98],269.6,"flat"],
				["Land_BasaltWall_01_8m_F",[9.4,0.7,5.98],269.6,"flat"],
				["Land_BasaltWall_01_8m_F",[12.3,-7.1,0],269.6,"flat"],
				["Land_BasaltWall_01_8m_F",[9.3,8,5.98],269.6,"flat"],
				["Land_BasaltWall_01_d_left_F",[4.1,12.5,0],0,"flat"],
				["Land_BasaltWall_01_d_left_F",[-12,-11.7,0],0.5,"flat"],
				["Land_BasaltWall_01_d_left_F",[12.2,9.4,0],90,"flat"],
				["Land_BasaltWall_01_d_left_F",[-9.7,-2.4,6.05],90,"flat"],
				["Land_BasaltWall_01_d_left_F",[-4.6,10.4,5.89],180,"flat"],
				["Land_BasaltWall_01_d_left_F",[10.4,-11.9,0],180,"flat"],
				["Land_BasaltWall_01_d_left_F",[-12.8,6.2,0],270,"flat"],
				["Land_BasaltWall_01_d_right_F",[11.5,12.3,0],0,"flat"],
				["Land_BasaltWall_01_d_right_F",[-6,12.7,0],0,"flat"],
				["Land_BasaltWall_01_d_right_F",[-9.6,-7,6.04],89,"flat"],
				["Land_BasaltWall_01_d_right_F",[-9.9,4.7,6.06],90,"flat"],
				["Land_BasaltWall_01_d_right_F",[12.3,3.9,0],90,"flat"],
				["Land_BasaltWall_01_d_right_F",[5.8,-11.8,0],180,"flat"],
				["Land_BasaltWall_01_d_right_F",[-5.2,-11.7,0],359.4,"flat"],
				["Land_BasaltWall_01_gate_F",[0.5,-12.3,0],0,"flat"],
				["Land_BasaltWall_01_gate_F",[-13.4,0,0],90,"flat"],
				["Land_BasaltWall_01_gate_F",[0.1,13.1,0],180,"flat"],
				["Land_BasaltWall_01_gate_F",[12.9,0.1,0],270,"flat"],
				["Land_PetroglyphWall_01_F",[11.2,18,0],0,"flat"],
				["Land_PetroglyphWall_01_F",[-7.8,17.8,0],145.1,"flat"],
				["Land_PetroglyphWall_01_F",[-6.5,-16.9,0],145.1,"flat"],
				["Land_PetroglyphWall_01_F",[19.5,-4.4,0],287.3,"flat"],
				["Land_PetroglyphWall_02_F",[13.6,6.4,-0.3],270,"flat"],
				["Land_RM_boulder1",[-18.9,11.3,0],0],
				["Land_RM_boulder3",[4.9,13,7.41],166.9],
				["Land_RM_boulder3",[2.3,8.3,3.89],267.6],
				["Land_RM_boulder4",[18.8,-1.1,0],36.6],
				["Land_RM_boulder4",[-1.7,9.7,8.54],76.5],
				["Land_RM_boulder4",[-17.4,-5.9,0],218],
				["Land_RM_boulder4",[10.1,11.6,5.65],259.4],
				["Land_RM_boulder5",[2.5,17.9,0],0],
				["Land_RM_boulder5",[-18.7,-3.6,0],314.2],
				["Land_StoneTanoa_01_F",[0.2,-5.3,0],0]
			];
		};
		case "layout6": {
			_objects = [ //old castle
				[WMS_OPFOR_Flag,[0,0,0],0],
				["Land_CastleRuins_01_bastion_F",[6.9,-0.9,0],0,"flat"],
				["Land_CastleRuins_01_wall_10m_F",[-7.1,-11.2,-1.5],54.5,"flat"],
				["Land_CastleRuins_01_wall_10m_F",[-10.2,9.1,-1.5],105.7,"flat"],
				["Land_CastleRuins_01_wall_10m_F",[-5,12.1,-1.5],194.7,"flat"],
				["Land_CastleRuins_01_wall_10m_F",[10.6,-13.4,0],309.2,"flat"],
				["Land_CastleRuins_01_wall_d_L_F",[10.5,7.1,0],91.7,"flat"],
				["Land_CastleRuins_01_wall_d_L_F",[-2.5,-16.6,-1.5],217.5,"flat"],
				["Land_CastleRuins_01_wall_d_L_F",[5.3,-18.3,0],333.8,"flat"],
				["Land_CastleRuins_01_wall_d_R_F",[-11.4,2.2,-1.5],90.5,"flat"],
				["Land_CastleRuins_01_wall_d_R_F",[0.1,4,0],182.3,"flat"],
				["Land_CastleRuins_01_wall_d_R_F",[15.7,-8.2,0],323.1,"flat"],
				["Land_DeerStand_01_F",[7.6,-10.9,0],309,"flat"],
				["Land_DeerStand_02_F",[-9,-5.1,0],83,"flat"],
				["Land_LampIndustrial_01_F",[1.9,-3.9,0],224.1,"flat"],
				["Land_SharpStone_01",[-1,-15.6,0],0],
				["Land_SharpStone_02",[17.4,-4.8,0],310.2],
				["Land_StoneWall_02_s_10m_F",[-13.4,-7.3,0.5],72.1,"flat"],
				["Land_StoneWall_02_s_10m_F",[10.3,11.7,0.5],179.9,"flat"],
				["Land_StoneWall_02_s_10m_F",[16.6,7,0],239.3],"flat",
				["Land_StoneWell_01_F",[-4,1.2,0],0]
			];
		};
		default { 
			_objects = [];
		};
	};
	{    
		_object = createVehicle [(_x select 0), [0,0,3500], [], 0, "CAN_COLLIDE"];
		_object setdir _dirFlag + (_x select 2); 
		_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
		_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
		_gradient = surfaceNormal position _object; 
		if ((count _x) > 3 && {(_x select 3) == "flat"}) then {
			_object setVectorUp [0,0,1];
		}else {
			_object setvectorup _gradient;
		};
		_object enableSimulationGlobal true; 
		_object allowDamage true;
		_objectsList pushback _object;
	} forEach _objects; 
	deleteVehicle _compoRefPoint;
	_objectsList
};
WMS_fnc_captureZoneWaves = {
	private ["_unitFunction","_unitsClass","_loadoutList","_launcherChance","_skill","_loadout","_timer","_grps","_INFgrp","_randomPos","_wpt"];
	params [
		"_pos", 
		"_typeR",
		"_unitsR", 
		"_grpsR", 
		"_distR",
		"_difficulty"
	];
	_unitFunction = 'assault';
	_unitsClass = selectRandom WMS_AMS_UnitClass;
	_loadoutList = ["bandit","heavybandit","army"];
	_launcherChance = 10;
	_skill = 0.5;
	_loadout = "bandit";
	_timer = 600;
	_grps = [];
	_INFgrp = nil;
	_wpts = [];
	_createTank = false;
	_createChoppa = false;

	_playerList = allPlayers select {alive _x && (_x distance2D _pos < 300)} apply {[_x, GetPosATL _x, getPlayerUID _x]};
	_playerCnt = count _playerList;
	if (true) then {diag_log format ["[CAPTUREZONE_WAVE]|WAK|TNA|WMS| _playerList = %1", _playerList]};
	if(_playerCnt != 0) then {_playerCnt = _playerCnt-1};
	
	switch (tolower _difficulty) do
	{
		case "easy": {
			_launcherChance = 10;
			_skill = (WMS_DynAI_Skills select 0) +random 0.15;
			_loadout = "bandit";
			_timer = 350;
		};
		case "moderate": {
			_unitFunction = selectRandom ["assault","assault","mg"];
			_launcherChance = 15;
			_skill = (WMS_DynAI_Skills select 1) +random 0.15;
			_loadout = selectRandom ["bandit","heavybandit"];
			_timer = 450;
		};
		case "difficult": {
			_unitFunction = selectRandom ["assault","mg","random","assault"];
			_launcherChance = 20;
			_skill = (WMS_DynAI_Skills select 2) +random 0.15;
			_loadout = selectRandom ["bandit","heavybandit","army"];
			_timer = 550;
		};
		case "hardcore": {
			_unitFunction = selectRandom ["livoniapatrol","mg","random"];
			_launcherChance = 25;
			_skill = (WMS_DynAI_Skills select 3) +random 0.15;
			_loadout = selectRandom ["heavybandit","army"];
			_timer = 666;
		};
		Default {
			_launcherChance = 15;
			_skill = 0.25 +random 0.15;
			_loadout = selectRandom ["bandit","heavybandit"];
			_timer = 400;
		};
	};
	//////////////////SPAWNING HEAVY AI VEHICLES IF PLAYERS FARM THE CAPTURE ZONE/////////////////
	if (WMS_CaptureZone_Farm > 6) then { //choppers //skill +0.25 max 0.95
		_skill = _skill +0.25;
		if (_skill > 0.95)then{_skill = 0.95};
		[_pos,_playerList select 0 select 0,_timer,_skill,OPFOR,_loadout,[selectRandom WMS_CaptureZone_Vhl select 0,[],
			[[],
			[]]],true,false,1500,5000,600,nil,"AWARE",nil,nil,nil,_difficulty,"reinforcementpunisher"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_CaptureZone_CT) then {
			[_pos,_playerList select 0 select 0,_timer,_skill,OPFOR,_loadout,[selectRandom WMS_CaptureZone_Vhl select 1,[],
			[[],
			[]]],true,false,250,750,150,nil,"AWARE",nil,nil,nil,_difficulty,"reinforcementpunisher"] spawn WMS_fnc_infantryProgram_VHLpatrol;
			WMS_CaptureZone_CT = false;
		};
		WMS_CaptureZone_Farm = WMS_CaptureZone_Farm -1;
	}else{
		if (WMS_CaptureZone_Farm > 3) then { //tank //skill +0.15 max 0.80
			_skill = _skill +0.15;
			if (_skill > 0.80)then{_skill = 0.80};
			[_pos,_playerList select 0 select 0,_timer,_skill,OPFOR,_loadout,[selectRandom WMS_CaptureZone_Vhl select 1,[],
			[[],
			[]]],true,false,250,750,150,nil,"AWARE",nil,nil,nil,_difficulty,"reinforcementpunisher"] spawn WMS_fnc_infantryProgram_VHLpatrol;
			
			if (WMS_CaptureZone_CC) then{
				[_pos,_playerList select 0 select 0,_timer,_skill,OPFOR,_loadout,[selectRandom WMS_CaptureZone_Vhl select 0,[],
			[[],
			[]]],true,false,1500,5000,600,nil,"AWARE",nil,nil,nil,_difficulty,"reinforcementpunisher"] spawn WMS_fnc_infantryProgram_VHLpatrol;
				WMS_CaptureZone_CC = false
			};
			WMS_CaptureZone_Farm = WMS_CaptureZone_Farm -1;
		};
	};
	////////////////////////////////////////////////////////////////////////////////////////////
	for "_i" from 1 to (_grpsR+_playerCnt) do {
		_INFgrp = createGroup [OPFOR, false];
		_grps pushBack _INFgrp;
		//[center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
		//_randomPos = [_pos, _dist1, _dist2, 15, 0, 0.15, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
		_randomPos = [_pos, (_distR select 0), (_distR select 1), 0.5, 0, 0, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
		for "_i" from 1 to _unitsR do {
			//_randomPos = [_pos, (_distR select 0), (_distR select 1), 1, 0, 0, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos; //different _pos for each unit, they regroup before moving to the point
			_unitsClass createUnit [_randomPos, _INFgrp];
		};
	};

	{
		//[(units _x),'assault',_launcherChance,_skill,nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
		[(units _x),_unitFunction,_launcherChance,_skill,nil,_loadout,nil,"CaptureZone"] call WMS_fnc_SetUnits;
		_wpt = _x addWaypoint [_pos, 0];
		_wpt setWaypointType "MOVE";
		_wpt setWaypointCombatMode "YELLOW";
		_wpt setWaypointBehaviour "AWARE";
		_wpt setWaypointCompletionRadius 15;
		_wpt setWaypointSpeed "FULL";
		_wpts pushback _wpt;
	}forEach _grps;
	/////PARAGROUP
	if (_playerCnt >= 2 && {selectRandom [true, false]}) then {
		
		_paraGrp = [[(_pos select 0),(_pos select 1),100], OPFOR, _grpsR] call BIS_fnc_spawnGroup;
		{ 
			_randomSpawnPos = [_pos , 0, 100, 0, 1, 0, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
			_x setpos [(_randomSpawnPos select 0),(_randomSpawnPos select 1),100]; 
			_x setVariable ["WMS_RealFuckingSide",OPFOR,true];
		} forEach units _paraGrp ;
		//[(units _paraGrp),'para',_launcherChance,_skill,nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
		[(units _paraGrp),'para',_launcherChance,_skill,nil,_loadout,nil,"CaptureZone"] call WMS_fnc_SetUnits;
		playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli2.wss", player, false, [(_pos select 0),(_pos select 1),150], 3, 1, 0];//yes,"player doesnt make any sens server side but it's override by _pos
		_grps pushBack _paraGrp;
	};
	/////PARAGROUP
	['EventCustom', ['Capture Zone', 'Incoming Reinforcement', '\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa']] remoteExec ['BIS_fnc_showNotification', -2];

	WMS_AI_OPFORpatrol_Running pushback [time,(time+_timer),_grps,[],
			[],
			[],_wpts,""];
};
WMS_fnc_ZoneStatusUpdate = {
	if (WMS_IP_LOGs) then {diag_log "||||||||||CAPTUREZONE_ZONESTATUSUPDATE||||||||||"};
	//systemChat 'ZoneStatusUpdate';
	WMS_zoneStatus_Neutral = (_this select 0);
	WMS_zoneStatus_Capture = (_this select 1);
	WMS_zoneStatus_Contest = (_this select 2);
};
WMS_fnc_captureZoneEvents = {
	private [];
	params [
		"_startR",
		"_iterations",
		"_cumulCoolD",
		"_cooldR"
	];

	WMS_captureZoneEvents = [[_startR,'ground']];
	for '_i' from 2 to _iterations do {
		_cumulCoolD = round (_cumulCoolD + _cooldR + (random 5));
		WMS_captureZoneEvents pushback [_cumulCoolD,'ground'];
	};
	if (WMS_IP_LOGs) then {diag_log format ['CAPTUREZONE_REINFORCEMENTS = %1',WMS_captureZoneEvents];};
};
_Mkrs = [_pos,"capturezone","Capture Zone",true] call WMS_fnc_AMS_CreateMarker;
//(thisTrigger getVariable 'markerObject') setMarkerColor 'colorGUER';
//(thisTrigger getVariable 'markerObject') setMarkerColor 'colorBLUFOR';
//(thisTrigger getVariable 'markerObject') setMarkerColor 'colorOPFOR';

for '_i' from 0 to 360 step (250 / (_radius select 0))*2 do 
	{ 
		_posObjects = [(_pos select 0) + ((cos _i) * (_radius select 0)), (_pos select 1) + ((sin _i) * (_radius select 0)),1];
		_object = createVehicle ['Sign_Sphere25cm_F', _posObjects, [], 0, 'CAN_COLLIDE'];
		_object setObjectTextureGlobal [0, _textureB];
		_object enableSimulation false;
		_CaptureZone_Bdr pushBack _object;
		_CaptureZone_Obj pushback _object;
	}; 

_triggCapture = createTrigger ["EmptyDetector", _pos, true];
_triggContest = createTrigger ["EmptyDetector", _pos, true];

_triggCapture setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_triggCapture setTriggerArea [(_radius select 0), (_radius select 0), 0, false, (_radius select 0)];
_triggCapture setVariable ["CaptureZone_Bdr", _CaptureZone_Bdr, false];   
_triggCapture setVariable ["triggContest", _triggContest, false];   
_triggCapture setVariable ["captureTimer", _timer, false];      
_triggCapture setVariable ["textureR", _textureR, false];   
_triggCapture setVariable ["textureG", _textureG, false];   
_triggCapture setVariable ["textureB", _textureB, false];        
_triggCapture setVariable ["iterations", _iterations, false];
_triggCapture setVariable ["startR", _startR, false];   
_triggCapture setVariable ["cumulCoolD", _cumulCoolD, false];   
_triggCapture setVariable ["cooldR", _cooldR, false];   
_triggCapture setVariable ["markerObject", (_Mkrs select 0), false];
_triggCapture setTriggerStatements  
	[ 
  		"this",  
  		"
		[(thisTrigger getVariable 'startR'),(thisTrigger getVariable 'iterations'),(thisTrigger getVariable 'cumulCoolD'),(thisTrigger getVariable 'cooldR')]call WMS_fnc_captureZoneEvents;
		['EventCustomGreen', ['Capture Zone', (format ['%1 Started to Capture the Bandits Camp, %2s timer',(name (thisList select 0)),(thisTrigger getVariable 'captureTimer')]), '\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa']] remoteExec ['BIS_fnc_showNotification', -2];
		WMS_CaptureZone_Farm 	= WMS_CaptureZone_Farm+1;
		if (triggerActivated (thisTrigger getVariable ['triggContest', objNul])) then {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureR')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorOPFOR';
			['EventCustomRed', ['Capture Zone', 'CaptureZone Contested', '\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa']] remoteExec ['BIS_fnc_showNotification', -2];
			[false,false,true] call WMS_fnc_ZoneStatusUpdate;
		} else {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureG')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorGUER';
			[false,true,false] call WMS_fnc_ZoneStatusUpdate;
		};
		",  
  		"
		WMS_captureZoneEvents = [[(thisTrigger getVariable 'startR'),'ground']];
		{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureB')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorBLUFOR';
			[true,false,false] call WMS_fnc_ZoneStatusUpdate;
			WMS_captureTimerCount = 0;
		" 
	];
_triggContest setTriggerActivation ["EAST", "PRESENT", true]; 
_triggContest setTriggerArea [(_radius select 0), (_radius select 0), 0, false, (_radius select 0)]; 
_triggContest setVariable ["CaptureZone_Bdr", _CaptureZone_Bdr, false];    
_triggContest setVariable ["triggCapture", _triggCapture, false];    
_triggContest setVariable ["textureR", _textureR, false];   
_triggContest setVariable ["textureG", _textureG, false];   
_triggContest setVariable ["textureB", _textureB, false];    
_triggCapture setVariable ["markerObject", (_Mkrs select 0), false]; 
_triggContest setTriggerStatements  
	[ 
  		"this",  
  		"
		if (triggerActivated (thisTrigger getVariable ['triggCapture', objNul])) then {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureR')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorOPFOR';
			['EventCustomRed', ['Capture Zone', 'CaptureZone Contested', '\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa']] remoteExec ['BIS_fnc_showNotification', -2];
			[false,false,true] call WMS_fnc_ZoneStatusUpdate;
		} else {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureB')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorBLUFOR';
			[true,false,false] call WMS_fnc_ZoneStatusUpdate;
			WMS_captureTimerCount = 0;
		};
		",  
  		"
		if (triggerActivated (thisTrigger getVariable ['triggCapture', objNul])) then {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureG')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorGUER';
			[false,true,false] call WMS_fnc_ZoneStatusUpdate;
		} else {
			{_x setObjectTextureGlobal [0, (thisTrigger getVariable 'textureB')];}foreach (thisTrigger getVariable ['CaptureZone_Bdr', []]);
			(thisTrigger getVariable 'markerObject') setMarkerColor 'colorBLUFOR';
			[true,false,false] call WMS_fnc_ZoneStatusUpdate;
			WMS_captureTimerCount = 0;
		};
		" 
	];
_layoutObjects = [_pos, _layout]call WMS_fnc_spawnCaptureZoneObjects;

_Mines = [
	_pos,
	50 //"_radius", //100
	//_howMany	//"_howMany", //20
	//"_mineType", [""]], //WMS_ATMines
	//"_fireExplode", //false
	//"_signs", //true
	//"_steps" //36
] call WMS_fnc_AMS_SpawnMineField;

//Spawn the "guardian" group, GARISSON
_guardians = [ //need to add _info == "CaptureZone"
	_pos,
	"CaptureZone",
	1, 						//"_grpCount",//1
	(selectRandom [4,6,8]), //"_unitsCount",//3 //6,"MG","garrison"
	[30,3],					//"_wpts, //[75,4]
	(0.2+random 0.3),		//"_skill",//(0.2+random 0.5)
	"MG",					//"_unitFunction",//"Random" //FIRST LETTER CAP
	selectRandom ["army","bandit","heavyBandit"],//"_loadout",//"bandit"
	"garrison",				//"_behavType",//"patrol"
	WMS_AMS_LauncherChance,	//"_launcherChance"//WMS_AMS_LauncherChance
	_type	
] call WMS_fnc_AMS_SpawnGroups; //return an Array of group(s)
["EventCustom", ["Capture Zone", (format ["Bandits have setup a camp @ %1, Take it!",([_pos select 0, _pos select 1])]), "\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];

//put the while in a function called by a new trigger to start the mission and delete the trigger at first activation
while {_zoneStatus_Running} do {

	//if (WMS_zoneStatus_Contest) then {};
	if (WMS_zoneStatus_Capture) then {
		if ((count WMS_captureZoneEvents != 0) && {(WMS_captureTimerCount >= ((WMS_captureZoneEvents select 0) select 0))}) then {
			[_pos, ((WMS_captureZoneEvents select 0) select 1),_unitsR, _grpsR, _distR, _type] call WMS_fnc_captureZoneWaves;
			WMS_captureZoneEvents deleteAt 0;
		};
		WMS_captureTimerCount = WMS_captureTimerCount+1;
		if (WMS_IP_LOGs) then {diag_log "||||||||||CAPTUREZONE_TICKING||||||||||"};
		if (WMS_captureTimerCount >= _timer) then {
			_talk = selectRandom ["uspointcaptured","britpointcaptured"];
			playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg",_talk], player, false, _pos, 4, 1, 0];
			deleteVehicle _triggCapture;
			deleteVehicle _triggContest;
			{{deleteVehicle _x} foreach units _x} forEach _guardians;
			{deleteGroup _x} forEach _guardians;
			{deleteVehicle _x}forEach _Mines;
			{deleteMarker _x} foreach _mkrs;
			{deleteVehicle _x}forEach _CaptureZone_Bdr;
			WMS_CaptureZone_Farm = 0;
			WMS_CaptureZone_CT = true;
			WMS_CaptureZone_CC = true;
			_zoneStatus_Running = false;
			_smoke = "SmokeShellBlue" createVehicle _pos;
			_phone = "Land_MobilePhone_old_F" createVehicle _pos;
			_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
			if (WMS_IP_LOGs) then {diag_log format ["||||||||||CAPTUREZONE_OWNER|||||||||| %1",_crateOwner]};
			_phone setVariable ["AMS_UnlockedBy",[_crateOwner],true]; //needed for AMS paradrop
			_phone setVariable ["AMS_MissionID","CaptureZone",true]; //needed for AMS paradrop
			[_phone,[],_rewards,"military","Mission Reward",nil,_type,150] spawn WMS_fnc_AMS_SpawnRewards; //[_weap,_bag,_items,_ammoList,_mag] //nil is the crate/vehicle
			//victory
			//plan another captureZone
			WMS_Events_list pushback [(time+WMS_CaptureZoneDelay),"CaptureZone"];
			WMS_Events_list sort true;
		};
	};
	if (WMS_zoneStatus_Capture) then {
		uisleep 1;
	} else {
		uisleep 3
	};
	
};