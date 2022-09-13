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

//Condition to get there:
//((_countFlag != 0) && (_targetSpeed < 100) && !((getplayerUID _DynamicThreatTarget) in WMS_DynAI_BaseAtkUIDList) && (WMS_DynAI_BaseAtkRunning < WMS_DynAI_BaseAtkMax))
//[_DynamicThreatTarget, (_flagList select 0), _threatScenario] call WMS_fnc_DynAI_baseATK;
if (WMS_IP_LOGs) then {diag_log format ["[DYNAI BASEATK]|WAK|TNA|WMS| _this = %1", _this]};
private ["_timer","_AIcount","_AIgrps","_RPGChance","_skill","_loadout","_unitFunction","_pos","_grps","_Towner","_Tname","_Trights","_Tlevel","_blacklist","_safePos","_startPatrol","_crows"];
params[
	"_target",
	"_flag",
	"_threatScenario"
];
_timer 		= 900;
_AIcount 	= 3;
_AIgrps 	= 2;
_RPGChance 	= 20;
_skill 		= (0.15+random 0.15);
_loadout 	= "bandit"; //"bandit","heavybandit","army","livonia"
_unitFunction = "Assault"; //"Assault","random","livoniapatrol","heavybandit"
_pos 		= position _flag;
_difficulty = "easy";
_grps 		= [];
_safePos 	= [0,0,0];
_startPatrol = [0,0,0];
_waterWorld = surfaceIsWater (position _flag);

_Towner 	= _flag getvariable ["exileowneruid",0];
_Tname 		= _flag getvariable ["exileterritoryname","hell"];
_Trights 	= _flag getvariable ["exileterritorybuildrights",[0]];
_Tlevel 	= _flag getvariable ["exileterritorylevel",1];
_Ttravelers = _flag getVariable ["WMS_BaseFriends", ["1"]]; //fasttravelers UID added to the territory
_Tlevel 	= (_Tlevel+(count _Ttravelers)-1);


switch (_Tlevel) do { //Base lvl1 = 0.15 to 0.3, lvl2 & lvl3 = 0.15 to 0.35, , lvl4 & lvl5 = 0.2 to 0.4, lvl6 & lvl7 = 0.25 to 0.5, lvl8 & lvl9 = 0.3 to 0.55, lvl10 0.35 to 0.6
	case 1 : {_timer = 900;_AIcount = 3;_AIgrps = 2;_RPGChance = 10;_skill = (0.15+random 0.2);_loadout = selectRandom ["bandit"];}; //6
	case 2 : {_timer = 900;_AIcount = 3;_AIgrps = 2;_RPGChance = 10;_skill = (0.15+random 0.2);_loadout = selectRandom ["bandit","bandit","heavybandit"];}; //6
	case 3 : {_timer = 900;_AIcount = 3;_AIgrps = 3;_RPGChance = 10;_skill = (0.15+random 0.2);_difficulty = "moderate";_unitFunction = "random";_loadout = selectRandom ["bandit","heavybandit"];}; //9
	case 4 : {_timer = 1200;_AIcount = 4;_AIgrps = 2;_RPGChance = 15;_skill = (0.2+random 0.2);_difficulty = "moderate";_loadout = selectRandom ["heavybandit"];}; //8
	case 5 : {_timer = 1500;_AIcount = 4;_AIgrps = 3;_RPGChance = 15;_skill = (0.2+random 0.2);_difficulty = "difficult";_unitFunction = "random";_loadout = selectRandom ["heavybandit","army"];}; //12
	case 6 : {_timer = 1800;_AIcount = 5;_AIgrps = 3;_RPGChance = 20;_skill = (0.25+random 0.25);_difficulty = "difficult";_loadout = selectRandom ["heavybandit","army","army"];}; //10
	case 7 : {_timer = 2100;_AIcount = 5;_AIgrps = 3;_RPGChance = 20;_skill = (0.25+random 0.25);_difficulty = "hardcore";_unitFunction = "random";_loadout = selectRandom ["army"];}; //15
	case 8 : {_timer = 2600;_AIcount = 6;_AIgrps = 3;_RPGChance = 25;_skill = (0.3+random 0.25);_difficulty = "hardcore";_loadout = selectRandom ["army","livonia"];}; //12
	case 9 : {_timer = 3100;_AIcount = 6;_AIgrps = 3;_RPGChance = 25;_skill = (0.3+random 0.25);_difficulty = "hardcore";_loadout = selectRandom ["army","livonia","livonia"];}; //18
	case 10 : {_timer = 3600;_AIcount = 5;_AIgrps = 4;_RPGChance = 30;_skill = (0.35+random 0.25);_difficulty = "hardcore";_unitFunction = "livoniapatrol";_loadout = selectRandom ["livonia"];}; //20
    default {_timer = 3600;_AIcount = 5;_AIgrps = 4;_RPGChance = 30;_skill = (0.35+random 0.25);_unitFunction = "livoniapatrol";_loadout = selectRandom ["livonia"];};
};

_blacklist = [_pos,750,200,150,100]call WMS_fnc_AMS_SpnAiBlkListFull;
if(_waterWorld)then{
		_unitFunction = "diver";_loadout = "diver";
		_safePos = [_pos, 250, 500, 2, 1, 0, 0, _blacklist, [[],[]]] call BIS_fnc_findSafePos;//[x,y] ok, [x,y,0] not ok
		_startPatrol = [_pos, 80, 120, 1, 1, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
		_flag setVariable ["BaseATKReinforce", ["paradrop","paradrop","AIRpatrol","AIRpatrol","AIRassault"],true];
	}else{
		_safePos = [_pos, 250, 500, 2, 0, 0, 0, _blacklist, [[],[]]] call BIS_fnc_findSafePos;//[x,y] ok, [x,y,0] not ok
		_startPatrol = [_pos, 80, 120, 1, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
		_flag setVariable ["BaseATKReinforce", ["runner","paradrop","VHLpatrol","AIRpatrol","AIRassault"],true];
	};
if (count _safePos == 3) exitWith {diag_log format ["[DynAI BASEATK]|WAK|TNA|WMS| %1 Attack FAILD! No position found", _Tname]};
playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss", _flag, false, position _flag, 6, 1, 0];
_fire = createVehicle ["test_EmptyObjectForFireBig", [(_pos select 0), (_pos select 1), 35], [], 0, "CAN_COLLIDE"];
/////Bandits
for "_i" from 1 to _AIgrps do {
	_grp1 = createGroup [OPFOR, false];
	_grps pushBack _grp1;
	for "_i" from 1 to _AIcount do {
		WMS_AI_Units_Class createUnit [
			_safePos, 
			_grp1
		];
	};
	{
		_x setVariable ["BaseATKflag", _flag, true];
		_x setVariable ["unitFunction", _unitFunction, true];
		_x setVariable ["info", 'BaseATK', true];
	}foreach (units _grp1);
	[(units _grp1),_unitFunction,_RPGChance,_skill,_difficulty,_loadout,nil,'DYNAI'] call WMS_fnc_SetUnits;
	if (WMS_DynAI_Steal) then {
		[_grp1, _startPatrol, 200, 3, "MOVE", "SAFE", "RED", "NORMAL", "COLUMN", "this call WMS_fnc_DynAI_Steal", [5,10,15]] call CBA_fnc_taskPatrol;// AI should patrol around the base, not random waypoints
		} else {
			[_grp1, _startPatrol, 200, 3, "MOVE", "SAFE", "RED", "NORMAL", "COLUMN", "", [5,10,15]] call CBA_fnc_taskPatrol;// AI should patrol around the base, not random waypoints
	};
	_safePos = [_pos, 250, 500, 2, 0, 0, 0, _blacklist, [[],[]]] call BIS_fnc_findSafePos;//[x,y] ok, [x,y,0] not ok
	_startPatrol = [_pos, 80, 120, 1, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
};
WMS_DynAI_Running pushback [_flag,(time+(_timer)),_grps,[],[_fire],[],[],_threatScenario];
//////////
_flag setvariable ["BaseATK", true, true];
//_flag setVariable ["BaseATKReinforce", ["runner","paradrop","VHLpatrol","AIRpatrol","AIRassault"],true];
WMS_DynAI_BaseAtkUIDList pushBack (getplayerUID _target);
if (WMS_exileToastMsg) then {
	private _sessionID = _target getVariable ['ExileSessionID','']; 
	[_sessionID, 'toastRequest', ['InfoTitleAndText', ['BaseAttack', 'Yes, they are comming for you']]] call ExileServer_system_network_send_to;
	} else {
		["EventWarning", ["BaseAttack", "Yes, they are comming for you"]] remoteExec ["BIS_fnc_showNotification", owner _target];
	};
if (WMS_IP_LOGs) then {diag_log format ["[DynAI BASEATK]|WAK|TNA|WMS| %1 is under Attack!", _Tname]};
WMS_DynAI_BaseAtkRunning = (WMS_DynAI_BaseAtkRunning +1);
WMS_DynAI_BaseAtkLast = time;