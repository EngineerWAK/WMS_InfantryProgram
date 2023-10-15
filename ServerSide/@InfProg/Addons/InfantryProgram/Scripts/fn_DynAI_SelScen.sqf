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
//[(thisList select 0), (position thisTrigger), 'trigger', 'MILITARY'] call WMS_fnc_DynAI_selScen;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS| _this = %1", _this]};
private ["_armedVhlList","_posList","_vhlFull","_Rcoef","_Vcoef","_countPlayersAround","_targetSpeed","_targetDirection","_playerRep","_bonus","_markerType","_threatScenario","_FrontSpawn","_grpSize","_grpSide","_timer","_distanceWPT","_WPType","_combatMod","_behavior","_speed","_launcherChance","_backpackChance","_altitude","_nearestRoad","_nearestRoadPos","_radius","_direction","_load","_iterations","_delay","_artyChanceHE","_BoxType","_crate","_spawnType","_dist1","_dist2","_loadout","_choppa1","_choppa2","_lockPlayer","_useMarker"];
params [
		"_target", //player
		"_Pos", //[0,0,0]
		"_triggType", //"trigger"//"dynamic"//"reinforcement"
		["_info","random",[""]]
	];
	
/////HC STUFF/////
_HC1 = missionNameSpace getVariable ["WMS_HC1",false];
_HC1_ID = 2;
if (isDedicated && _HC1)then{
  {if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
/////HC STUFF\\\\\
/*
_playerUID_ExileKills = "ExileKills_"+_targetUID;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerUID_ExileDeath = "ExileDeath_"+_targetUID;

_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
_playerDeath = profileNamespace getVariable [_playerUID_ExileDeath,0];
*/
_playerUID = getPlayerUID _target;

_playerRep = 0;
_playerKill = 0;
if ((vehicle _target) iskindOf "man") then { //it's overkill but I need datas for debug
	_playerRep = _target getVariable ['ExileScore', 99999]; //this do not work 100% of the time if in vehicle!
	_playerKill = _target getVariable ['ExileKills', 99999];
	if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|Player NOT in vehicle, ExileScore: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerRep, (TypeOf (vehicle _target))]};
	if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|Player NOT in vehicle, ExileKills: target = %1, position = %2, Kills = %3, vehicle = %4", _target, (position _target), _playerKill, (TypeOf (vehicle _target))]};
	if (_playerRep == 99999) then {
		if (WMS_exileFireAndForget)then{//Will do the Exile later
			_playerRep = 25999;
		}else{ //TheLastCartridges
			_playerRep = profileNamespace getVariable ["ExileScore_"+_playerUID,25999];
		};
		if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|SOMETING IS WRONG WITH ExileScore: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerRep, (TypeOf (vehicle _target))]};
	};
	if (_playerKill == 99999) then {
		if (WMS_exileFireAndForget)then{//Will do the Exile later
			_playerKill = 4999;
		}else{ //TheLastCartridges
			_playerKill = profileNamespace getVariable ["ExileKills_"+_playerUID,4999];
		};
		if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|SOMETING IS WRONG WITH ExileKills: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerKill, (TypeOf (vehicle _target))]};
	};
}else{
	_playerRep = _target getVariable ['ExileScore', 99999]; //this do not work 100% of the time if in vehicle!
	_playerKill = _target getVariable ['ExileKills', 99999];
	if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|Player IS in vehicle, ExileScore: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerRep, (TypeOf (vehicle _target))]};
	if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|Player IS in vehicle, ExileKills: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerKill, (TypeOf (vehicle _target))]};
	if (_playerRep == 99999) then {
		if (WMS_exileFireAndForget)then{//Will do the Exile later
			_playerRep = 25999;
		}else{ //TheLastCartridges
			_playerRep = profileNamespace getVariable ["ExileScore_"+_playerUID,25999];
		};
		if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|SOMETING IS WRONG WITH ExileScore: target = %1, position = %2, respect = %3, vehicle = %4", _target, (position _target), _playerRep, (TypeOf (vehicle _target))]};
	};
	if (_playerKill == 99999) then {
		if (WMS_exileFireAndForget)then{//Will do the Exile later
			_playerKill = 4999;
		}else{ //TheLastCartridges
			_playerKill = profileNamespace getVariable ["ExileKills_"+_playerUID,4999];
		};
		if (true) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS|SOMETING IS WRONG WITH ExileKills: target = %1, position = %2, Kills = %3, vehicle = %4", _target, (position _target), _playerKill, (TypeOf (vehicle _target))]};
	};
};

_threatLVL = "EASY";

if (_playerUID in WMS_BlackList) then {
	_threatLVL = "BLACKLIST";
	_playerRep = 100000;
	};

/////THREAT LEVEL/////
//WMS_DynAI_RepLvlAdapt	= [1000, 24000, 50000]; //0/easy/1000/moderate/24000/difficult/50000/hardcore
//WMS_DynAI_KillLvlAdapt = [100, 250, 750]; //0/easy/100/moderate/250/difficult/750/hardcore //will be used for military triggers
if((_triggType == "trigger" && {_info == 'MILITARY'}) || (_triggType == "reinforcement" && {_info == 'MILITARY'}))then{
	if (_playerKill >= 5000||_playerRep >= 100000)then {_threatLVL = "BLACKLIST"}else{
		if (_playerKill >= (WMS_DynAI_KillLvlAdapt select 2) && {_playerKill < 5000}) then {_threatLVL = "HARDCORE"}else{
			if (_playerKill >= (WMS_DynAI_KillLvlAdapt select 1) && {_playerKill < (WMS_DynAI_KillLvlAdapt select 2)}) then {_threatLVL = "DIFFICULT"}else{
				if (_playerKill >= (WMS_DynAI_KillLvlAdapt select 0) && {_playerKill < (WMS_DynAI_KillLvlAdapt select 1)}) then {_threatLVL = "MODERATE"}else{
					if (_playerKill < (WMS_DynAI_KillLvlAdapt select 0)) then {_threatLVL = "EASY"};
				};
			};
		};
	};
}else{
	if (_playerRep >= 100000)then {_threatLVL = "BLACKLIST"}else{
		if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 2) && {_playerRep < 100000}) then {_threatLVL = "HARDCORE"}else{
			if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 1) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 2)}) then {_threatLVL = "DIFFICULT"}else{
				if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 0) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 1)}) then {_threatLVL = "MODERATE"}else{
					if (_playerRep < (WMS_DynAI_RepLvlAdapt select 0)) then {_threatLVL = "EASY"};
				};
			};
		};
	};
};
//_threatLVL = "ARMORED";

_threatScenario = "nothing";
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
_targetSpeed = speed _target;
_targetDirection = getDir _target;
_bonus = (damage _target)*100; //player = _target
//wanna use a Tank/APC/RCWS turret? enjoy! Welcome to the HVT world :D
if ((typeOf (vehicle _target)) in WMS_RCWS_Vhls || vehicle _target iskindof "Tank" || vehicle _target isKindOf "Wheeled_Apc_F") then {
	if !(vehicle _target iskindof "O_APC_Wheeled_02_rcws_v2_F" || vehicle _target iskindof "B_APC_Tracked_01_CRV_F") then { //Marid and CRV are forced UNARMED and used as logistic
		_threatLVL = "ARMORED";
		_playerRep = 50000;
		};
	};
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC THREAT]|WAK|TNA|WMS| target speed = %1, direction = %2, respect = %3, bonus = %4", _targetSpeed, _targetDirection, _playerRep, _bonus]};

//find if player is in traders or not
{
	_markerType = markertype _x;
	if ((_markerType in WMS_AMS_TradersIcons) && {((getMarkerPos _x) distance2D _target)<= WMS_DynAI_traderDistance}) then {_threatScenario = "traders"}; //{}
}forEach allMapMarkers;

_Rcoef = [10,5,5,20,20,5,5,0,2,5,1,0,0,0,0,0,0]; //Respect coef bambi
_Vcoef = [10,5,5,30,30,30,10,20,20,10,10,20,0,0,0,0,0]; //Vehicle coef on foot
if (_threatScenario != "traders") then {
//if (_playerRep < (WMS_DynAI_RepLvlAdapt select 0) ) then { 
if(_threatLVL == "EASY")then{
		_Rcoef = [10,5,5,20,20,5,5,0,2,5,1,0,0,0,35,25];
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
//if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 0) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 1)}) then {
if(_threatLVL == "MODERATE")then{
		_Rcoef = [5,2,4,15,20,10,5,10,10,5,5,0,0,0,15,35,0];
		_grpSize = 3+(round (random 2));
		_timer = 240;
		_altitude = 175;
		_skill = (WMS_DynAI_Skills select 1)+(random 0.1);
		_iterM = 4;
		_iterA = 3;
		_iterO = 12;
		_launcherChance = 25;
		_artyChanceHE = 40;
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
//if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 1) && {_playerRep < (WMS_DynAI_RepLvlAdapt select 2)}) then {
if(_threatLVL == "DIFFICULT")then{
		_Rcoef = [3,1,3,10,20,20,10,15,20,20,20,25,5,0,10,35,3];
		_grpSize = 4+(round (random 2));
		_timer = 360;
		_altitude = 150;
		_skill =  (WMS_DynAI_Skills select 2)+(random 0.1);
		_iterM = 3;
		_iterA = 5;
		_iterO = 16;
		_launcherChance = 40;
		_artyChanceHE = 70;
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
//if (_playerRep >= (WMS_DynAI_RepLvlAdapt select 2) && {_playerRep < 100000}) then {
if(_threatLVL == "HARDCORE" || _threatLVL == "ARMORED")then{
		_Rcoef = [1,1,2,5,20,20,15,20,20,20,30,30,10,5,10,35,6];
		_grpSize = 4+(round (random 3));
		_timer = 600;
		_altitude = 125;
		_skill =  (WMS_DynAI_Skills select 3)+(random 0.1);
		_iterM = 1;
		_iterA = 8;
		_iterO = 22;
		_launcherChance = 55;
		_artyChanceHE = 85;
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
	//if(_playerRep >= 100000)then {//thats basicaly from blacklist
	if(_threatLVL == "BLACKLIST")then{
		_Rcoef = [
			35,	//"rain"		//0
			1,	//"paracrate"
			1,	//"spawncrate"
			5,	//"escarmouche
			15,	//"INFpatrol"
			20,	//"building"
			10,	//"roadblock"	//6
			10,	//"runner"
			30,	//"paradrop"
			25,	//"VHLpatrol" 	//9
			20,	//"AIRpatrol"	//10
			40,	//"AIRassault"
			20,	//"arty"
			25,	//"bombing"		//13
			5,	//"EOD"
			20,	//"BBQcamp"
			10	//"ParaBombs"	//16
			]; //
		_grpSize = 5+(round (random 3));
		_timer = 900;
		_altitude = 100;
		_skill =  (WMS_DynAI_Skills select 3)+(random 0.25);
		_iterM = 1;
		_iterA = 8;
		_iterO = 22;
		_launcherChance = 65;
		_artyChanceHE = 95;
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
if (vehicle _target iskindof "man") then {
	_Vcoef = [10,5,5,30,30,30,10,20,20,10,10,20,0,0,25,30,1];
} else { //x3 for all numbers to try to find a balance
	if (vehicle _target iskindof "Plane") then {_Vcoef = [0,0,0,30,60,0,0,0,0,90,240,0,0,0,45,0,0]}else{
		if (vehicle _target iskindof "Tank") then { 
			_Vcoef = [0,0,0,0,90,30,120,0,0,150,250,0,30,60,15,0,6]; 
			_vhlFull = selectRandom WMS_OPFOR_CustomVHL_Spec;
			_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Spec;
		}else{
			if (vehicle _target isKindOf "Wheeled_Apc_F")then{_Vcoef = [0,0,0,0,90,30,120,30,90,90,175,15,30,0,65,0,15]}else{
				if (vehicle _target isKindOf "MRAP_01_base_F")then{_Vcoef = [6,30,0,0,90,30,120,30,90,90,150,15,30,0,45,15,15]}else{
					if (vehicle _target isKindOf "Truck_F")then{_Vcoef = [9,15,24,60,90,60,120,60,60,120,120,90,3,0,75,75,3]}else{
						if (vehicle _target isKindOf "LSV_01_armed_base_F"||vehicle _target isKindOf "LSV_02_armed_base_F")then{_Vcoef = [9,15,24,60,90,60,120,60,60,120,120,90,3,0,45,45,6]}else{
							if (vehicle _target iskindof "StaticWeapon") then { _Vcoef = [30,0,15,0,60,9,0,120,90,45,30,45,90,3,30,30,15]}else{
								if (vehicle _target iskindof "Ship") then { _Vcoef = [15,0,0,0,0,0,0,0,15,0,300,0,15,6,15,0,0]}else{
									if (vehicle _target iskindof "Bicycle") then { _Vcoef = [30,15,15,90,60,90,30,15,30,30,30,15,6,0,30,90,0]}else{
										if ((typeOf (vehicle _target)) in WMS_RCWS_Vhls) then { _Vcoef = [0,0,0,0,90,30,120,30,90,90,175,15,30,0,65,0,15];_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Spec;}else{//APC copy
											if (vehicle _target iskindof "Helicopter") then {
												if (vehicle _target iskindof "Steerable_Parachute_F") then { //for whatever reason, the parachute is classed as helicopter.	
													_Vcoef = [0,0,30,90,90,90,0,0,0,45,15,0,30,0,45,90,0];	
												} else {
													if (vehicle _target isKindOf "Heli_Attack_01_base_F"||vehicle _target isKindOf "Heli_Attack_02_base_F")then{
														_Vcoef = [0,0,0,0,0,0,0,0,0,150,300,30,15,0,15,0,0];
														_choppa1 = selectRandom WMS_OPFOR_CustomAIR_Spec;
													}else{
														if (vehicle _target isKindOf "Heli_Light_01_armed_base_F")then{
															_Vcoef = [0,0,15,90,90,6,0,0,0,120,250,30,15,0,15,0,0];
														}else{_Vcoef = [0,0,5,10,10,6,0,0,0,120,200,30,15,0,15,45,0]};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
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
		"bombing",((_Vcoef select 13) +(_Rcoef select 13)),
		"ParaBombs",((_Vcoef select 16) +(_Rcoef select 16))
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
		"bombing",((_Vcoef select 13) +(_Rcoef select 13)),
		"ParaBombs",((_Vcoef select 16) +(_Rcoef select 16))
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
			"bombing",((_Vcoef select 13) +(_Rcoef select 13)),
			"ParaBombs",((_Vcoef select 16) +(_Rcoef select 16))
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
			"bombing",((_Vcoef select 13) +(_Rcoef select 13)),
			"ParaBombs",((_Vcoef select 16) +(_Rcoef select 16))
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

private _flagList = (position _target) nearObjects [WMS_DynAI_BaseFlag, (WMS_DynAI_distToFlag*1.5)];
private _dangerList = ["bombing","arty","ParaBombs","rain"];
if (count _flaglist != 0) then {
	if (_threatScenario in _dangerList) then {
		_threatScenario = selectRandom ["AIRpatrol","paradrop"];
	};
};

switch (_threatScenario) do {
	case "<null>" : {diag_log "[DYNAMIC THREAT ERROR]|WAK|TNA|WMS| ERROR IN SCENARIO SELECTION"};
	case "nothing" : {};
	case "traders" : {};
	case "INFpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_FrontSpawn,_launcherChance,_dist1INF,_dist2INF,_distanceWPT,_WPType,_WPbehavior,_WPcombatMod,_WPSpeed,nil,_difficulty]remoteExec ["WMS_fnc_InfantryProgram_INFpatrol",_HC1_ID];
		}else{
			[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_FrontSpawn,_launcherChance,_dist1INF,_dist2INF,_distanceWPT,_WPType,_WPbehavior,_WPcombatMod,_WPSpeed,nil,_difficulty]call WMS_fnc_InfantryProgram_INFpatrol;
		};
		
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "AIRpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_distanceWPT = 450;
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] remoteExec ["WMS_fnc_infantryProgram_VHLpatrol",_HC1_ID];
		}else{
			[_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
		};
		
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		//};
	};
	case "VHLpatrol" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_distanceWPT = 250;
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_target,_timer,_skill,_grpSide,_loadout,_vhlFull,_lockPlayer,_useMarker,_dist1VHL,_dist2VHL,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed, _infoType,_difficulty,_triggType] remoteExec ["WMS_fnc_infantryProgram_VHLpatrol",_HC1_ID];
		}else{
			[_pos,_target,_timer,_skill,_grpSide,_loadout,_vhlFull,_lockPlayer,_useMarker,_dist1VHL,_dist2VHL,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed, _infoType,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
		};
		
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "paradrop" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_altitude,_launcherChance,_dist1PARA,_dist2PARA,_distanceWPT,_WPType,"COMBAT",_WPcombatMod,_WPspeed,_difficulty]remoteExec ["WMS_fnc_InfantryProgram_ParadropAIgroup",_HC1_ID];
		}else{
			[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_altitude,_launcherChance,_dist1PARA,_dist2PARA,_distanceWPT,_WPType,"COMBAT",_WPcombatMod,_WPspeed,_difficulty]call WMS_fnc_InfantryProgram_ParadropAIgroup;
		};
		
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "building" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (_triggType == "dynamic") then {
			private _buildingsList = (_pos nearObjects ["Building", 250]) select {(count ([_x] call BIS_fnc_buildingPositions) >= WMS_DynAI_MinPosInBuildgs) && (_x distance2D (nearestObject [_x, WMS_PlayerEntity]) >= WMS_DynAI_MinPosInBuildgs)} apply {[(_pos distance2D _x), _x]};
			_buildingsList sort true;
			if (count (_buildingsList) > 0) then {
				_posList = [(selectRandom _buildingsList) select 1] call BIS_fnc_buildingPositions;
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
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_radius,_timer,_grpSize,_launcherChance,_skill,_loadout,_difficulty] remoteExec ["WMS_fnc_DynAI_BuildingGuards",_HC1_ID];
		}else{
			[_pos,_radius,_timer,_grpSize,_launcherChance,_skill,_loadout,_difficulty] spawn WMS_fnc_DynAI_BuildingGuards;
		};
		
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
	};
	case "runner" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_target,_pos, _timer, _spawnType, _iterM]remoteExec ["WMS_fnc_DynAI_Runner",_HC1_ID];
		}else{
			[_target,_pos, _timer, _spawnType, _iterM]spawn WMS_fnc_DynAI_Runner;
		};
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "escarmouche" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_pos = [_pos, 250, 400, 0, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; //if spawn on player
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,120, 2+(round random 3),10,_skill,"bandit",_difficulty] remoteExec ["WMS_fnc_DynAI_Escarmouche",_HC1_ID];
		}else{
			[_pos,120, 2+(round random 3),10,_skill,"bandit",_difficulty] spawn WMS_fnc_DynAI_Escarmouche;
		};	
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "BBQcamp" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		_pos = [_pos, 0, 50, 1, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; //trigger spawn only, Forest/cities
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,300+(random 200), _grpSize,15,_skill,_loadout,_difficulty] remoteExec ["WMS_fnc_DynAI_BBQcamp",_HC1_ID];
		}else{
			[_pos,300+(random 200), _grpSize,15,_skill,_loadout,_difficulty] spawn WMS_fnc_DynAI_BBQcamp;
		};
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "AIRassault" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
			[_pos,_target,_skill,_loadout,_grpSize,_timer,_choppa1,_choppa2,nil,nil,nil,nil,nil,nil,nil,_difficulty] remoteExec ["WMS_fnc_DynAI_AirAssault",_HC1_ID]; //Optional: _skill,_loadout,_grpSize,_timer,_choppa1,_choppa2
		}else{
			[_pos,_target,_skill,_loadout,_grpSize,_timer,_choppa1,_choppa2,nil,nil,nil,nil,nil,nil,nil,_difficulty] spawn WMS_fnc_DynAI_AirAssault; //Optional: _skill,_loadout,_grpSize,_timer,_choppa1,_choppa2
		};
		WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
		publicVariable "WMS_DynAI_RunningCount";
		//};
	};
	case "roadblock" : {
		//if (WMS_DynAI_RunningCount <= WMS_DynAI_MaxRunning) then {
		if (_triggType == "dynamic") then {
			if (_targetSpeed < 160) then {
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
		if (count _roadConnectedTo != 0) then {
			_connectedRoad = _roadConnectedTo select 0;  //create an error if no road Connected
			_directionRoad = [_nearestRoad, _connectedRoad] call BIS_fnc_DirTo;
			if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
				[_nearestRoadPos, _directionRoad, _timer, _grpSize, selectrandom [1,2], _launcherChance, _skill, "army",_difficulty] remoteExec ["WMS_fnc_Compo_RoadBlock",_HC1_ID]; //(this select 4)  1=MG - 2=AT
			}else{
				[_nearestRoadPos, _directionRoad, _timer, _grpSize, selectrandom [1,2], _launcherChance, _skill, "army",_difficulty] spawn WMS_fnc_Compo_RoadBlock; //(this select 4)  1=MG - 2=AT
			};
			WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
			publicVariable "WMS_DynAI_RunningCount";
		}else {
			//fallback to something else 
			_distanceWPT = 600;
			if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
				[_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] remoteExec ["WMS_fnc_infantryProgram_VHLpatrol",_HC1_ID];
			}else{
				[_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
			};
			
			WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
			publicVariable "WMS_DynAI_RunningCount";
		};
		//};
	};
	case "bombing" : {
		_altitude = 600;
		[_pos,_radius,_altitude,_direction,(WMS_BombList select 0)] spawn WMS_fnc_DynAI_Bombing;
	};
	case "arty" : {
		_randomPos = [_pos, (300+_dist1VHL), (300+_dist2VHL), 5, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
		[_target, _randomPos, _artyChanceHE, _iterA] spawn WMS_fnc_DynAI_arty; //Optional: _artyChanceHE, _iterA
	};
	case "ParaBombs" : {//[_posCenter,_radius,_hight,_direction,_load,_iteration] //[[0,0,0],100,150,random,bomb,3]
		if (_triggType == "reinforcementpunisher"||_playerRep >= 100000) then {
			[(position _target),100,150,359,(selectRandom WMS_DynAI_EODBombs),6] spawn WMS_fnc_DynAI_ParaBombs;
		}else{
			[(position _target)] spawn WMS_fnc_DynAI_ParaBombs;
		};
		
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
		if (_load == "vn_bomb_100_m47_wp_ammo"||_load == "vn_bomb_mk36_destructor_mine_ammo"||_load == "vn_bomb_750_m117_he_ammo") then {_delay = 1.2;_alti = 300};
		if (_load == "rhs_ammo_m397" || _load == "rhs_rpg7v2_type63_airburst") then {_delay = 1.6; _alti = 500};
		[_pos,_load,_radius,_alti,_iterO,_delay] spawn WMS_fnc_DynAI_RainObjects; //optional: _load,_radius,_altitude,_iterations,_delay
	};
	case "EOD" : {//FOREST ONLY
		_load = selectRandom WMS_DynAI_EODBombs;
		[_pos,_load,30,5,1,2] spawn WMS_fnc_DynAI_RainObjects;
	};
	
	//case "action" : {};//Replaced by BBQcamp
};