/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2026 [WMS]WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_sys_ActionReaction is made for a quick and "unfiltered" reaction to a player "action". Traders, territory/base flag will not prevent what is comming.
//[_theVictim,_theGuilty,_option] call WMS_fnc_sys_ActionReaction;
/*
WMS_sys_ActReactRain	= [];
WMS_sys_ActReactRaininc	= [];//incremental rainObject
WMS_sys_ActReactJET		= [];
WMS_sys_ActReactAIR		= [];
WMS_sys_ActReactGND		= [];
*/
//is the victim dead?
	//yes	-is the guilty identified?
		//yes	-is the guilty in a vehicle?
			//yes	-is it a tank/APC/RCWS/AIR
				//yes	-boom, heavy stuff
				//no	-well, still need something "medium"
			//no	-ok, no need for something too heavy
		//no	-well, no one specific to punish, maybe just some random rocket drop very quick from "rainObject" to make noise
	//no	-is it a crate/container that is not supposed to move?
		//yes	-is it moving or is it attached to something?
			//yes	-is there a player in the vehicle attachedTo"?
				//yes	-identify the thief, send a message to the thief, immobilize the _vehicle setfuel 0; _vehicle setDamage 0.6; unload the crate, _crate setDamage 1;
				//no	_vehicle setfuel 0; -unload the crate, _crate setDamage 1; maybe get the owner of the vehicle and send him a message
			//no 	-_this setDamage 1;
		//no	-need a default action if something endup here for no real reason xD
//The "reactions"
	//basic rainObjects (explo) [_pos,_load,_radius,_alti,_iterO,_delay,_loadList(opt)] spawn WMS_fnc_DynAI_RainObjects;
	//"mortar" [_target, _randomPos, _artyChanceHE, _iterA] spawn WMS_fnc_DynAI_arty;
	//"paraBombs" [(position _target),100,150,359,(selectRandom WMS_DynAI_EODBombs),6] spawn WMS_fnc_DynAI_ParaBombs;
	//"bombing" [_pos,_radius,_altitude,_direction,(WMS_BombList select 0)] spawn WMS_fnc_DynAI_Bombing;
	//incremental rainObjects, do not exist yet, something like, start with orange smokes, then, fackels, small grenades, grenades, TH, RPG rockets, small bombs, medium bombs, big bombs, green smokes
	//heavy chopper like Mi24g or Mi28 [_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
	//heavy tank or hardcore APC/IFV [_pos,_target,_timer,_skill,_grpSide,_loadout,_vhlFull,_lockPlayer,_useMarker,_dist1VHL,_dist2VHL,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed, _infoType,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
	//fighter jet if TheGuilty in a plane or very fast speed (annihilator?) [_pos,_target,_timer,_skill,_grpSide,_loadout,_choppa1,_lockPlayer,_useMarker,_dist1AIR,_dist2AIR,_distanceWPT,_WPType,"AWARE",_WPcombatMod,_WPSpeed,nil,_difficulty,_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;

if (WMS_IP_LOGs) then {diag_log format ["[ACTION, REACTION!]|WAK|TNA|WMS| _this = %1", _this]};
private ["_possibleReactions","_reaction","_randomPos","_iterations","_delay","_altitude","_radius","_thePos","_load","_distanceWPT","_target","_timer","_skill","_grpSide","_loadout","_lockPlayer","_choppa","_vhl","_jet"];
params[  
 "_theVictim", //the victim of the "Abuse", for now an NPC vehicle/VIP? later on, specific crates will be managed if they are not supposed to me moved/transported/stollen
 ["_theGuilty", (_this select 0)],
 ["_option", "nothing"] 
];
if!(WMS_sys_ActionReaction) exitWith {diag_log format ["[ACTION, REACTION!]|WAK|TNA|WMS|Not this time unfortunatelly. _this = %1", _this]};//need to add this var in InitSystem to allow or not the "punishment"

_possibleReactions = ["rain","rainfast","arty","parabombs","bombing","incrain","AIRpatrol","VHLpatrol","JETpatrol"];
_reaction = "nothing";
_triggType = "actionreaction";
_iterations = 15; //works only for "rain","arty","parabombs"
_delay = 1.5;
_altitude = 300;
_radius = 75;
_thePos = position _theVictim;
_target = _theVictim;
_timer = 300;
_load = "GrenadeHand"; //"GrenadeHand"//["Chemlight_blue","Land_HumanSkull_F"],["rhs_ammo_nspn_red","Chemlight_blue","rhs_ammo_fakels","Land_HumanSkull_F"],["rhs_ammo_nspn_red","rhs_ammo_fakels","rhs_ammo_m397"],["rhs_rpg7v2_type63_airburst","rhs_ammo_nspn_red","rhs_ammo_m397","rhs_ammo_fakels","rhs_ammo_an_m14_th3"],["rhs_rpg7v2_type63_airburst","Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]]
_skill = 0.6;
_grpSide = OPFOR;
_loadout = "localopfor";
if !(alive _theVictim) then { //DEAD/DESTROYED decide the reaction call
	if (isplayer _theGuilty) then {//It's a PLAYER!!!
		_thePos = position _theGuilty;
		_target = _theGuilty;
		///////////WARNING SMOKE//////////////
		[_thePos,"SmokeShellOrange",25,50,5,0.25] spawn WMS_fnc_DynAI_RainObjects;
		//\\\\\\\\\WARNING SMOKE\\\\\\\\\\\\\\
		if (vehicle _theGuilty iskindof "man") then { //Player NOT in a vehicle
			_reaction = selectRandom ["rain","arty","parabombs","bombing","incrain","AIRpatrol"];
			if (_reaction == "rain") then {
				_load = selectRandom  WMS_sys_ActReactRain;
			} else {
				if (_reaction == "parabombs") then {
					_iterations = 8;
					_load = (selectRandom WMS_DynAI_EODBombs);
				} else {
					if (_reaction == "bombing") then {
						_load = (WMS_BombList select 0);
					} else {
						//next one comes here
					};
				};
			};
		} else {
			if (vehicle _theGuilty isKindOf "AIR") then {//Player in a plane/helicopter, "AIR" response
				if (speed _theGuilty >= 110) then {//check for speed
					_reaction = "JETpatrol"; //plane, front, anything else will be useless
				} else {
					_reaction = "AIRpatrol"; //chopper, front, anything else will be useless
				};
			} else{
				if (vehicle _theGuilty isKindOf "TANK"||vehicle _theGuilty isKindOf "APC"||typeof vehicle _theGuilty in WMS_RCWS_Vhls)then {//player in an "armored" vehicle
					_reaction = selectRandom ["arty","parabombs","bombing","incrain","AIRpatrol","VHLpatrol"];
					if (_reaction == "rain") then {
						_load = selectRandom  WMS_sys_ActReactRain;
					} else {
						if (_reaction == "parabombs") then {
							_iterations = 12;
							_load = (selectRandom WMS_DynAI_EODBombs);
						} else {
							if (_reaction == "bombing") then {
								_load = (WMS_BombList select 0);
							} else {
								//next one comes here
							};
						};
					};
				} else {
					_reaction = selectRandom ["parabombs","bombing","incrain","VHLpatrol"];
					if (_reaction == "rain") then {
						_load = selectRandom  WMS_sys_ActReactRain;
					} else {
						if (_reaction == "parabombs") then {
							_iterations = 10;
							_load = (selectRandom WMS_DynAI_EODBombs);
						} else {
							if (_reaction == "bombing") then {
								_load = (WMS_BombList select 0);
							} else {
								//next one comes here
							};
						};
					};
				};
			};
		};
	} else { //it's NOT a player
		if (_option in _possibleReactions) then {
			_reaction = _option; //going back to basics
			if (_reaction == "rain") then {
				_load = selectRandom  WMS_sys_ActReactRain;
			} else {
				if (_reaction == "parabombs") then {
					_iterations = 4;
					_load = (selectRandom WMS_DynAI_EODBombs);
				} else {
					if (_reaction == "bombing") then {
						_load = (WMS_BombList select 0);
					} else {
						if (_reaction == "rainfast") then {
							_reaction = "rainfast";
							_delay = 0.3;
							_load = "rhs_rpg7v2_type63_airburst";
							_iterations = 10;
							_radius = 50;
						} else {
							//next one comes here
						};
					};
				};
			};
		} else {
			_reaction = "rainfast";
			_load = "rhs_rpg7v2_type63_airburst";
			_iterations = 10;
			_radius = 50;
		};
	};
} else { //ALIVE! CRATE/CONTAINER? //later
	diag_log format ["[ACTION, REACTION!]|WAK|TNA|WMS|ANTI_THIEF NOT READY YET. _this = %1", _this];
};
switch (_reaction) do {
	case "<null>" : {diag_log "[ACTION REACTION ERROR]|WAK|TNA|WMS| ERROR IN SCENARIO SELECTION"};
	case "nothing" : {diag_log "[ACTION REACTION ERROR]|WAK|TNA|WMS| N O T H I N G"};
	case "rain" : {
					[_thePos,_load,_radius,_altitude,_iterations,_delay] spawn WMS_fnc_DynAI_RainObjects;
	};
	case "rainfast" : {
					_delay = 0.3;
					[_thePos,_load,_radius,_altitude,_iterations,_delay] spawn WMS_fnc_DynAI_RainObjects;
	};
	case "arty" : {
					_randomPos = [_thePos, 500, 1500, 5, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos; //need a failsafe position
					[_theGuilty, _randomPos, 100, _iterations] spawn WMS_fnc_DynAI_arty;
	};
	case "parabombs" : {
					[_thePos,100,150,(random 359),_load,_iterations] spawn WMS_fnc_DynAI_ParaBombs; //_load MUST be chosen BEFORE
	};
	case "bombing" : {
					[_thePos,_radius,_altitude,(random 359),_load] spawn WMS_fnc_DynAI_Bombing;
	};
	case "incrain" : {
					[_thePos,"",_radius,_altitude,_iterations,_delay,WMS_sys_ActReactRainInc] spawn WMS_fnc_DynAI_RainObjects;
	};
	case "AIRpatrol" : {
					_skill = 0.4;
					_timer = 360;
					_distanceWPT = 450;
					_choppa = selectRandom WMS_sys_ActReactAIR;
					[_thePos,_target,_timer,_skill,_grpSide,_loadout,[_choppa,[],[[],[]]],true,false,1200,2500,_distanceWPT,"MOVE","AWARE","YELLOW","FULL",nil,"difficult",_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
					WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
					publicVariable "WMS_DynAI_RunningCount";
	};
	case "VHLpatrol" : {
					_timer = 900;
					_distanceWPT = 200;
					_vhl = selectRandom WMS_sys_ActReactGND;
					[_thePos,_target,_timer,_skill,_grpSide,_loadout,[_vhl,[],[[],[]]],true,false,500,1200,_distanceWPT,"MOVE","AWARE","YELLOW","FULL",nil,"difficult",_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
					WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
					publicVariable "WMS_DynAI_RunningCount";
	};
	case "JETpatrol" : {
					_skill = 0.3;
					_timer = 180; //this one will destroy mostlikely everything, it better be short
					_distanceWPT = 650;
					_jet = selectRandom WMS_sys_ActReactJET;
					[_thePos,_target,_timer,_skill,_grpSide,_loadout,[_jet,[],[[],[]]],true,false,1500,3000,_distanceWPT,"MOVE","AWARE","YELLOW","FULL",nil,"difficult",_triggType] spawn WMS_fnc_infantryProgram_VHLpatrol;
					WMS_DynAI_RunningCount = WMS_DynAI_RunningCount +1;
					publicVariable "WMS_DynAI_RunningCount";
	};
};