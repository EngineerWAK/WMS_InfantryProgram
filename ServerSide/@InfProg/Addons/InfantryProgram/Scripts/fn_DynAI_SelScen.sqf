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

//[_target, _pos, _triggType] call WMS_fnc_DynAI_selScen;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS| _this = %1", _this]};
private ["_armedVhlList","_posList","_vhlFull","_Rcoef","_Vcoef","_countPlayersAround","_targetSpeed","_targetDirection","_playerRep","_bonus","_markerType","_threatScenario","_FrontSpawn","_grpSize","_grpSide","_timer","_distanceWPT","_WPType","_combatMod","_behavior","_speed","_launcherChance","_backpackChance","_altitude","_nearestRoad","_nearestRoadPos","_radius","_direction","_load","_iterations","_delay","_artyChanceHE","_BoxType","_crate","_spawnType","_dist1","_dist2","_loadout","_choppa1","_choppa2","_lockPlayer","_useMarker"];
params [
		"_target", //player
		"_Pos", //[0,0,0]
		"_triggType", //"trigger"//"dynamic"//"reinforcement"
		["_info","random",[""]]
	];
_threatScenario = "nothing";
//if ((_grp knowsAbout _target) == 4 && (_target distance2D (Leader _grp)) > 700 && time > (WMS_reinforcement_last+WMS_reinforcement_CoolD)) then {call reinforcement};
//FROM FUNCTIONS:
//change with respect: _grpSize,_timer,_altitude,_skill,_iterations,_artyChanceHE,_dist1,_dist2,_loadout,_choppa1
_FrontSpawn = true; 		//INFpatrol
_grpSize = 3;
_grpSide = OPFOR;
_timer = 120;
_distanceWPT = 250;
_WPType = "MOVE"; 			// "MOVE","DESTROY","SAD","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","LOITER"
_WPcombatMod = "YELLOW"; 	// "BLUE","GREEN","WHITE","YELLOW","RED"
_WPbehavior = "SAFE"; 		// "CARELESS","SAFE","AWARE","COMBAT","STEALTH
_WPspeed = "NORMAL"; 		// "LIMITED","NORMAL","FULL"
_launcherChance = 15;
_backpackChance = 75;
_altitude = 150;
_nearestRoad = [];
_nearestRoadPos = [];
_radius = 75; 				//Objects rain, bombing, building guard
_direction = (random 359);
_skill = 0.5; 				//(0.3+(random 0.55))
_load = "Chemlight_blue"; 	//Rain Objects //_load = selectRandom ["Chemlight_blue", "rhs_ammo_m397", "rhs_ammo_fakels","rhs_ammo_rbk500_ofab50", "Land_HumanSkull_F"];
_iterM = 5; 			//Messages
_iterA = 5; 			//arty shell
_iterO = 20; 			//dropping Objects
_delay = 0.15;
_artyChanceHE = 50;
_BoxType = "medic"; 		//spawn crate //"medic","food","misc","weaps","IP_ammo","IP_toolKit","IP_launcher"
_crate = "Box_Syndicate_Wps_F"; //spawn crate //"Box_Syndicate_Wps_F", "BWA3_Box_Gear_Fleck","Box_Syndicate_WpsLaunch_F", "Box_Syndicate_Ammo_F"
_spawnType = "ground"; 		//spawn crate //"ground", "paradrop", "infantryProgram"
_dist1INF = 50; 			//INFpatrol: Y random pos (from left to right);
_dist2INF = 400; 			//INFpatrol: distance in front (probably works with -400);
_dist1VHL = 750; 			//VHLpatrol: FindSafePos CLOSE dist 
_dist2VHL = 2000; 			//VHLpatrol: FindSafePos FAR dist 
_dist1AIR = 1800; 			//AIRpatrol: FindSafePos CLOSE dist 
_dist2AIR = 3000; 			//AIRpatrol: FindSafePos FAR dist 
_dist1PARA = 10; 			//Paradrop: CLOSE dist from _pos
_dist2PARA = 300; 			//Paradrop: max Radius DZ
_loadout = "army"; 			//OPFOR ["bandit", "army", "BlackOps"] //BLUFOR ["civilian","bandit","army","AOR2","M90","scorpion","tiger","fleck"]
_unitFunction = "Assault";  //"BunkerMG","Assault","SMG","Para","Random","SuicideBomber","HeavyBandit"
_choppa1 = ["B_Heli_Transport_01_F",[],[[],[]]]; //GUNSHIP AirAssault
_choppa2 = ["O_Heli_Transport_04_covered_black_F",[],[[],[]]]; //TRANSPORT AirAssault //WMS_OPFOR_CustomAIR_Transport
_vhlFull = selectRandom WMS_OPFOR_CustomVHL_Armed;
_armedVhlList = WMS_OPFOR_CustomVHL_Armed + WMS_OPFOR_CustomVHL_Spec;
_lockPlayer = true;
_useMarker = true;
_spawnType = "player";		//SuicideBomber //_spawnType = selectrandom ["player", "trigger", "para"];
_posList = [];
_infoType = "Patrol";
_difficulty = "easy";
//from functions\\
//if (_triggType == "trigger") then {_FrontSpawn = false};
//if (_triggType == "dynamic") then {};
//if (_triggType == "reinforcement") then {};

//_countPlayersAround = (count (position _target nearEntities [WMS_PlayerEntity, 50])-1); //NOT USED
_targetSpeed = speed _target;
_targetDirection = getDir _target;
_playerRep = _target getVariable ['ExileScore', 25000];
_bonus = (damage _target)*100; //player = _target
if ((getPlayerUID _target) in WMS_BlackList) then {
	_playerRep = 100000;
	};
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS| target speed = %1, direction = %2, respect = %3, bonus = %4", _targetSpeed, _targetDirection, _playerRep, _bonus]};

//find if player is in traders or not
{
	_markerType = markertype _x;
	if ((_markerType in WMS_AMS_TradersIcons) && {((getMarkerPos _x) distance2D _target)<= WMS_DynAI_traderDistance}) then {_threatScenario = "traders"}; //{}
}forEach allMapMarkers;

_Rcoef = [10,5,5,20,20,5,5,0,2,5,1,0,0,0,0,0]; //bambi
_Vcoef = [10,5,5,30,30,30,10,20,20,10,10,20,0,0,0,0]; //on foot
if (_threatScenario != "traders") then {
if (_playerRep < (WMS_DynAI_RepLvlAdapt select 0) ) then { 
		_Rcoef = [10,5,5,20,20,5,5,0,2,5,1,0,0,0,20,25];
		_grpSize = 2+(round (random 1));
		_timer = 120;
		_altitude = 250;
		_skill = (WMS_DynAI_Skills select 0)+(random 0.1);
		_iterM = 6;
		_iterA = 2;
		_iterO = 8;
		_artyChanceHE = 20;
		_dist1INF = 50;
		_dist2INF = 550;
		_dist1VHL = 800;
		_dist2VHL = 2000;
		_dist1AIR = 2000;
		_dist2AIR = 4000;
		_dist1PARA = 100;
		_dist2PARA = 200;
		_load = selectRandom (WMS_DynAI_RainObjects select 0);
		_spawnType = selectrandom ["player", "para", "para"];
		_loadout = selectRandom ["bandit","bandit","heavyBandit"];
		_choppa1 = selectRandom [WMS_DynAI_GunshipLight,WMS_DynAI_GunshipMedium];
		_lockPlayer = false;
	} else {
if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 0) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 1)}) then {
		_Rcoef = [5,2,4,15,20,10,5,10,10,5,5,0,0,0,15,30];
		_grpSize = 3+(round (random 2));
		_timer = 240;
		_altitude = 175;
		_skill = (WMS_DynAI_Skills select 1)+(random 0.1);
		_iterM = 4;
		_iterA = 3;
		_iterO = 12;
		_launcherChance = 25;
		_artyChanceHE = 35;
		_dist1INF = 100;
		_dist2INF = 500;
		_dist1VHL = 700;
		_dist2VHL = 1800;
		_dist1AIR = 1900;
		_dist2AIR = 3500;
		_dist1PARA = 75;
		_dist2PARA = 250;
		_load = selectRandom (WMS_DynAI_RainObjects select 1);
		_spawnType = selectrandom ["player", "para"];
		_loadout = selectRandom ["bandit","heavyBandit","army","army", "BlackOps"];
		_choppa1 = selectRandom [WMS_DynAI_GunshipMedium,WMS_DynAI_GunshipHeavy];
		_lockPlayer = selectRandom [false, true];
		_WPcombatMod = "RED";
		_difficulty = "moderate";
	} else {
if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 1) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 2)}) then {
		_Rcoef = [3,1,3,10,20,20,10,15,20,20,20,25,5,0,10,20];
		_grpSize = 4+(round (random 2));
		_timer = 360;
		_altitude = 150;
		_skill =  (WMS_DynAI_Skills select 2)+(random 0.1);
		_iterM = 3;
		_iterA = 5;
		_iterO = 16;
		_launcherChance = 40;
		_artyChanceHE = 50;
		_dist1INF = 100;
		_dist2INF = 450;
		_dist1VHL = 600;
		_dist2VHL = 1650;
		_dist1AIR = 1800;
		_dist2AIR = 3000;
		_dist1PARA = 50;
		_dist2PARA = 300;
		_load = selectRandom (WMS_DynAI_RainObjects select 2);
		_spawnType = selectrandom ["player", "player", "para"];
		_loadout = selectRandom ["heavyBandit","army","livonia", "BlackOps"];
		_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Armed;
		_choppa2 = selectRandom WMS_OPFOR_CustomAIR_Transport;
		_lockPlayer = selectRandom [false, true, true];
		_WPcombatMod = "RED";
		_difficulty = "difficult";
	} else {
if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 2)) then {
		_Rcoef = [1,1,2,5,20,20,15,20,20,20,30,30,10,5,10,15];
		_grpSize = 4+(round (random 3));
		_timer = 600;
		_altitude = 125;
		_skill =  (WMS_DynAI_Skills select 3)+(random 0.1);
		_iterM = 1;
		_iterA = 8;
		_iterO = 22;
		_launcherChance = 55;
		_artyChanceHE = 65;
		_dist1INF = 150;
		_dist2INF = 400;
		_dist1VHL = 500;
		_dist2VHL = 1500;
		_dist1AIR = 1600;
		_dist2AIR = 2500;
		_dist1PARA = 25;
		_dist2PARA = 350;
		_load = selectRandom (WMS_DynAI_RainObjects select 3);
		_spawnType = "player";
		_loadout = selectRandom ["livonia", "BlackOps"];
		_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Spec;
		_choppa2 = selectRandom WMS_OPFOR_CustomAIR_Transport;
		_vhlFull = selectRandom _armedVhlList;
		_WPcombatMod = "RED";
		_difficulty = "hardcore";
}else{
	if(_playerRep == 100000)then {//thats basicaly from blacklist
		_Rcoef = [
			30,	//"rain"
			1,	//"paracrate"
			1,	//"spawncrate"
			5,	//"escarmouche
			15,	//"INFpatrol"
			20,	//"building"
			10,	//"roadblock"
			10,	//"runner"
			30,	//"paradrop"
			25,	//"VHLpatrol"
			20,	//"AIRpatrol"
			40,	//"AIRassault"
			20,	//"arty"
			15,	//"bombing"
			5,	//"EOD"
			20	//"BBQcamp"
			]; //
		_grpSize = 5+(round (random 3));
		_timer = 900;
		_altitude = 100;
		_skill =  (WMS_DynAI_Skills select 3)+(random 0.25);
		_iterM = 1;
		_iterA = 8;
		_iterO = 22;
		_launcherChance = 65;
		_artyChanceHE = 80;
		_dist1INF = 150;
		_dist2INF = 400;
		_dist1VHL = 400;
		_dist2VHL = 1100;
		_dist1AIR = 1200;
		_dist2AIR = 2200;
		_dist1PARA = 15;
		_dist2PARA = 350;
		_load = selectRandom (WMS_DynAI_RainObjects select 3);
		_spawnType = "player";
		_loadout = selectRandom ["livonia", "BlackOps"];
		_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Spec;
		_choppa2 = selectRandom WMS_OPFOR_CustomAIR_Transport;
		_vhlFull = selectRandom WMS_OPFOR_CustomVHL_Spec;
		_WPcombatMod = "RED";
		_difficulty = "hardcore";
	};
};};};};
if (vehicle _target iskindof "man") then {_Vcoef = [10,5,5,30,30,30,10,20,20,10,10,20,0,0,25,30];
	} else {
		if (vehicle _target iskindof "Plane") then {_Vcoef = [0,0,0,10,20,0,0,0,0,30,80,0,0,0,15,0]};
		if (vehicle _target iskindof "Tank") then { _Vcoef = [2,5,0,0,30,10,40,10,30,30,50,5,10,0,15,0]; _vhlFull = selectRandom WMS_OPFOR_CustomVHL_Spec;};
		if (vehicle _target isKindOf "Wheeled_Apc_F")then{_Vcoef = [2,5,0,0,30,10,40,10,30,30,50,5,10,0,15,0]};
		if (vehicle _target isKindOf "MRAP_01_base_F")then{_Vcoef = [2,10,0,0,30,10,40,10,30,30,50,5,10,0,15,5]};
		if (vehicle _target isKindOf "Truck_F")then{_Vcoef = [3,5,8,20,30,20,40,20,20,40,40,30,1,0,25,25]};
		if (vehicle _target isKindOf "LSV_01_armed_base_F"||vehicle _target isKindOf "LSV_02_armed_base_F")then{_Vcoef = [3,5,8,20,30,20,40,20,20,40,40,30,1,0,25,25]};
		if (vehicle _target iskindof "StaticWeapon") then { _Vcoef = [10,0,5,0,20,3,0,40,30,25,10,15,30,1,10,10]};
		if (vehicle _target iskindof "Ship") then { _Vcoef = [5,0,0,0,0,0,0,0,5,0,100,0,5,2,5,0]};
		if (vehicle _target iskindof "Bicycle") then { _Vcoef = [10,5,5,30,20,30,10,5,10,10,10,5,2,0,10,30]};
		if (vehicle _target iskindof "Helicopter") then {
			if (vehicle _target iskindof "Steerable_Parachute_F") then { _Vcoef = [0,0,10,30,30,30,0,0,0,15,5,0,10,0,25,30];//for whatever reason, the parachute is classed as helicopter.		
				} else {
					if (vehicle _target isKindOf "Heli_Attack_01_base_F"||vehicle _target isKindOf "Heli_Attack_02_base_F")then{_Vcoef = [0,0,5,30,30,2,0,0,0,40,50,10,5,0,5,0];
						}else{
							if (vehicle _target isKindOf "Heli_Light_01_armed_base_F")then{_Vcoef = [0,0,5,30,30,2,0,0,0,40,50,10,5,0,5,0];
								}else{_Vcoef = [0,0,5,30,30,2,0,0,0,40,50,10,5,0,5,25]};
						};
				};
		};
	};

if (_triggType == "trigger") then { //FOREST
	_FrontSpawn = false;
	if (_info == "FOREST") then {
		_threatScenario = selectRandomWeighted[
		"rain",((_Vcoef select 0) +(_Rcoef select 0)+(_Bonus/2)),
		"escarmouche",((_Vcoef select 3) +(_Rcoef select 3)),
		"INFpatrol",((_Vcoef select 4) +(_Rcoef select 4)),
		"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
		"EOD",((_Vcoef select 14) +(_Rcoef select 14)),
		"BBQcamp",((_Vcoef select 15) +(_Rcoef select 15)),
		"arty",((_Vcoef select 12) +(_Rcoef select 12))
		];
	} else {
		_threatScenario = selectRandomWeighted[
		"rain",((_Vcoef select 0) +(_Rcoef select 0)+(_Bonus/2)),
		"paracrate",((_Vcoef select 1) +(_Rcoef select 1)+_Bonus),
		"spawncrate",((_Vcoef select 2) +(_Rcoef select 2)+(_Bonus/1.2)),
		"escarmouche",((_Vcoef select 3) +(_Rcoef select 3)),
		"INFpatrol",((_Vcoef select 4) +(_Rcoef select 4)),
		"building",((_Vcoef select 5) +(_Rcoef select 5)),
		"roadblock",((_Vcoef select 6) +(_Rcoef select 6)),
		"runner",((_Vcoef select 7) +(_Rcoef select 7)),
		"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
		"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
		"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
		"AIRassault",((_Vcoef select 11) +(_Rcoef select 11)),
		"arty",((_Vcoef select 12) +(_Rcoef select 12)),
		"BBQcamp",((_Vcoef select 15) +(_Rcoef select 15)),
		"bombing",((_Vcoef select 13) +(_Rcoef select 13))
		];
		};
};
if (_triggType == "dynamic") then { //full options//"dynamic"
	_threatScenario = selectRandomWeighted[
	"rain",((_Vcoef select 0) +(_Rcoef select 0)+(_Bonus/2)),
	"paracrate",((_Vcoef select 1) +(_Rcoef select 1)+_Bonus),
	"spawncrate",((_Vcoef select 2) +(_Rcoef select 2)+(_Bonus/1.2)),
	"escarmouche",((_Vcoef select 3) +(_Rcoef select 3)),
	"INFpatrol",((_Vcoef select 4) +(_Rcoef select 4)),
	"building",((_Vcoef select 5) +(_Rcoef select 5)),
	"roadblock",((_Vcoef select 6) +(_Rcoef select 6)),
	"runner",((_Vcoef select 7) +(_Rcoef select 7)),
	"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
	"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
	"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
	"AIRassault",((_Vcoef select 11) +(_Rcoef select 11)),
	"arty",((_Vcoef select 12) +(_Rcoef select 12)),
	//"BBQcamp",((_Vcoef select 15) +(_Rcoef select 15)),//BBQcamp in dynamic spawn 10m away from the player...
	"bombing",((_Vcoef select 13) +(_Rcoef select 13))
	];
};
if (_triggType == "reinforcement") then {
	_load = selectRandom  (WMS_DynAI_RainObjects select 3);
	if (_info == "random") then {
		_threatScenario = selectRandomWeighted[
			"rain",((_Vcoef select 0) +(_Rcoef select 0)+(_Bonus/2)),
			//"INFpatrol",((_Vcoef select 4) +(_Rcoef select 4)),
			"runner",((_Vcoef select 7) +(_Rcoef select 7)),
			"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
			"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
			"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
			"AIRassault",((_Vcoef select 11) +(_Rcoef select 11)),
			"arty",((_Vcoef select 12) +(_Rcoef select 12)),
			"bombing",((_Vcoef select 13) +(_Rcoef select 13))
		];
	} else {
		_threatScenario = _info;
	};
};
if (_triggType == "reinforcementpunisher") then {
	_load = selectRandom  (WMS_DynAI_RainObjects select 4);
	_playerRep = 100000;
	_difficulty = "hardcore";
	if (_info == "random") then {
		_threatScenario = selectRandomWeighted[
			"rain",((_Vcoef select 0) +(_Rcoef select 0)+(_Bonus/2)),
			//"INFpatrol",((_Vcoef select 4) +(_Rcoef select 4)),
			"runner",((_Vcoef select 7) +(_Rcoef select 7)),
			"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
			"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
			"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
			"AIRassault",((_Vcoef select 11) +(_Rcoef select 11)),
			"arty",((_Vcoef select 12) +(_Rcoef select 12)),
			"bombing",((_Vcoef select 13) +(_Rcoef select 13))
		];
	} else {
		_threatScenario = _info;
	};
};
if (_triggType == "BaseATKreinforcement") then {
	if (_info == "random") then {
		_infoType = "BaseATK";
		_threatScenario = selectRandomWeighted[
			"runner",((_Vcoef select 7) +(_Rcoef select 7)),
			"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
			"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
			"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
			"AIRassault",((_Vcoef select 11) +(_Rcoef select 11))
		];
	} else {
		_infoType = "BaseATK";
		_threatScenario = _info;
	};
};
if (_triggType == "DFO") then {
	_load = selectRandom  (WMS_DynAI_RainObjects select 3);
	if (_info == "random") then {
		_threatScenario = selectRandomWeighted[
			"paradrop",((_Vcoef select 8) +(_Rcoef select 8)),
			"VHLpatrol",((_Vcoef select 9) +(_Rcoef select 9)),
			"AIRpatrol",((_Vcoef select 10) +(_Rcoef select 10)),
			"AIRassault",((_Vcoef select 11) +(_Rcoef select 11))
		];
	} else {
		_threatScenario = _info;
	};
};
};
//calculate probabilities and select the scenario
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS| _threatScenario = %1", _threatScenario]};

switch (_threatScenario) do {
	case "<null>" : {diag_log "[DYNAMIC THREAT ERROR]|WAK|TNA|WMS| ERROR IN SCENARIO SELECTION"};
	case "nothing" : {};
	case "traders" : {};
	case "INFpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
			[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_FrontSpawn,_launcherChance,_dist1INF,_dist2INF,_distanceWPT,_WPType,_WPbehavior,_WPcombatMod,_WPSpeed,nil,_difficulty]call WMS_fnc_InfantryProgram_INFpatrol;
			WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "AIRpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_distanceWPT = 600;
		[_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty] spawn WMS_fnc_infantryProgram_VHLpatrol;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "VHLpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_distanceWPT = 300;
		[_pos,_target,_timer,_skill,_grpSide,_loadout,_vhlFull,_lockPlayer,_useMarker,_dist1VHL,_dist2VHL,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed, _infoType,_difficulty] spawn WMS_fnc_infantryProgram_VHLpatrol;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "paradrop" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_altitude,_launcherChance,_dist1PARA,_dist2PARA,_distanceWPT,_WPType,"COMBAT",_WPcombatMod,_WPspeed,_difficulty]call WMS_fnc_InfantryProgram_ParadropAIgroup;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "building" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (_triggType == "dynamic") then {
			private _buildingsList = (_pos nearObjects ["Building", 250]) select {(count ([_x] call BIS_fnc_buildingPositions) >= WMS_DynAI_MinPosInBuildgs) && (_x distance2D (nearestObject [_x, WMS_PlayerEntity]) >= WMS_DynAI_MinPosInBuildgs)} apply {[(_pos distance2D _x), _x]};
			_buildingsList sort true;
			if (count (_buildingsList) > 0) then {
				_posList = [(selectRandom _buildingsList) select 1] call BIS_fnc_buildingPositions;
				//if ((count _posList) >= WMS_DynAI_MinPosInBuildgs && {((nearestBuilding _pos) distance2D _target) > WMS_DynAI_MinDistBuildgs}) then {
				if (((nearestBuilding _pos) distance2D _target) > WMS_DynAI_MinDistBuildgs) then {
					_pos = selectRandom _posList;
				} else {
					private _playerBlkList = allPlayers select {alive _x && (_x distance2D _pos < 400)} apply {[GetPosATL _x, 150]};
					_pos = [_pos, 250, 350, 0, 0, 0, 0, _playerBlkList, [[]]] call BIS_fnc_findSafePos;
				};
			} else {
				private _playerBlkList = allPlayers select {alive _x && (_x distance2D _pos < 400)} apply {[GetPosATL _x, 150]};
				_pos = [_pos, 250, 350, 0, 0, 0, 0, _playerBlkList, [[]]] call BIS_fnc_findSafePos;
			};
		};
		[_pos,_radius,_timer,_grpSize,_launcherChance,_skill,_loadout,_difficulty] spawn WMS_fnc_DynAI_BuildingGuards;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "runner" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		[_target,_pos, _timer, _spawnType, _iterM]spawn WMS_fnc_DynAI_Runner;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "escarmouche" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_pos = [_pos, 250, 400, 0, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; //if spawn on player
		[_pos,120, 2+(round random 3),10,_skill,"bandit",_difficulty] spawn WMS_fnc_DynAI_Escarmouche;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "BBQcamp" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_pos = [_pos, 0, 50, 1, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; //trigger spawn only, Forest/cities
		[_pos,300+(random 200), _grpSize,15,_skill,_loadout,_difficulty] spawn WMS_fnc_DynAI_BBQcamp;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "AIRassault" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		[_pos,_target,_skill,_loadout,_grpSize,_timer,_choppa1,_choppa2,nil,nil,nil,nil,nil,nil,nil,_difficulty] spawn WMS_fnc_DynAI_AirAssault; //Optional: _skill,_loadout,_grpSize,_timer,_choppa1,_choppa2
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "roadblock" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (_triggType == "dynamic") then {
			if (_targetSpeed < 200) then {
				if (_targetSpeed < 110) then {_dist2INF == 400};
				if (_targetSpeed > 110) then {_dist2INF == 500};
				_pos = _target modelToWorld [0,_dist2INF,0];
			};
		};
		_nearestRoad = selectRandom (_pos nearRoads 200);
		if (count (_pos nearRoads 100) == 0 ) then {_nearestRoad = [_pos, 1000, []] call BIS_fnc_nearestRoad;}; 
		if (isnull _nearestRoad || _targetSpeed > 200) exitWith {};
		_nearestRoadPos = position _nearestRoad; 
		_roadConnectedTo = roadsConnectedTo _nearestRoad;  
		_connectedRoad = _roadConnectedTo select 0;  
		_directionRoad = [_nearestRoad, _connectedRoad] call BIS_fnc_DirTo;
		[_nearestRoadPos, _directionRoad, _timer, _grpSize, selectrandom [1,2], _launcherChance, _skill, "army",_difficulty] spawn WMS_fnc_Compo_RoadBlock; //(this select 4)  1=MG - 2=AT
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "bombing" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_altitude = 600;
		[_pos,_radius,_altitude,_direction,(WMS_BombList select 0)] spawn WMS_fnc_DynAI_Bombing;
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "arty" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_randomPos = [_pos, (300+_dist1VHL), (300+_dist2VHL), 5, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
		[_target, _randomPos, _artyChanceHE, _iterA] spawn WMS_fnc_DynAI_arty; //Optional: _artyChanceHE, _iterA
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	/////NEUTRAL
	case "paracrate" : {
		if (damage _target > 0.1) then {_BoxType = "medic"} else {_BoxType = selectRandom ["medic","food","misc","weaps"]};
		if (((getplayerUID _target) in WMS_InfantryProgram_list)) then {_spawnType = "infantryProgram"; _BoxType = selectRandom ["medic","food","misc","weaps","IP_ammo","IP_toolKit","IP_launcher"]} else {_spawnType = "paradrop"};
		[_pos,_target,_BoxType,_spawnType,_crate,_dist1INF,_dist1PARA,_iterM] spawn WMS_fnc_DynAI_SpawnCrate; //Optionnal: _BoxType,_spawnType,_crate,_dist1,_dist2,_iterM
	};
	case "spawncrate" : {
		if (damage _target > 0.1) then {_BoxType = "medic"} else {_BoxType = selectRandom ["medic","food","misc","weaps"]};
		[_pos,_target,_BoxType,"ground",_crate,_dist1INF,_dist1PARA,_iterM] spawn WMS_fnc_DynAI_SpawnCrate; //Optionnal: _BoxType,_spawnType,_crate,_dist1,_dist2,_iterM
	};
	case "rain" : { //Rain is not "neutral" anymore xD
		private _alti = 80;
		if (_load == "rhs_ammo_nspn_red") then {_alti = 150};
		if (_load == "rhs_ammo_fakels") then {_alti = 65};
		if (_load == "rhs_ammo_m397" || _load == "rhs_rpg7v2_type63_airburst") then {_delay = 0.9; _alti = 500};
		[_pos,_load,_radius,_alti,_iterO,_delay] spawn WMS_fnc_DynAI_RainObjects; //optional: _load,_radius,_altitude,_iterations,_delay
	};
	case "EOD" : {//FOREST ONLY
		_load = selectRandom WMS_DynAI_EODBombs;
		[_pos,_load,30,5,1,2] spawn WMS_fnc_DynAI_RainObjects;
	};
	//case "action" : {};//Replaced by BBQcamp
};