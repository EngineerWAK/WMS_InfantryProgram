/**
* WMS_fnc_AMS_EHonKilled
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//[_killed,_killer,_unitFunction,_info] call WMS_fnc_DynAI_RwdMsgOnKill
if (WMS_IP_LOGs) then {diag_log format ["[AMS REWARDS]|WAK|TNA|WMS| _this = %1", _this]};
private ["_unit","_msgx","_sessionID","_unitName","_payload","_bonus","_distanceKill","_playerRep","_bonusDist","_malusDist","_diffCoeff","_adjustedSkills"];
params[
	"_killed",
	"_killer",
	"_instigator",
	["_unitFunction","Assault"], //not used yet
	["_difficulty", "Hardcore"]
];
if (isplayer _instigator) then {
	_killer = _instigator;
}; //might help with artillery shit
WMS_AllDeadsMgr pushBack [_killed,(serverTime+WMS_AMS_AllDeads)];
_distanceKill = (round(_killer distance _killed));
_bonus = WMS_DynAI_respectBonus;
_difficulty = _killed getVariable "WMS_Difficulty";
_playerRep = 0;
_playerKills = 0;
if (_distanceKill > WMS_AMS_distBonusMax) then {_bonus = 0};
_bonusDist = round (_distanceKill * WMS_AMS_distBonusCoef);
_malusDist = 0;
_payload = [[format ["KILLED %1",toUpper(name _killed)],_bonus]];//[_scoreName, _scoreString]
_diffCoeff = 1;
switch (toLower _difficulty) do {
	case  "easy" 		: {_diffCoeff = 0.5};
	case  "moderate" 	: {_diffCoeff = 0.67};
	case  "difficult" 	: {_diffCoeff = 0.83};
	case  "hardcore" 	: {_diffCoeff = 1};
	case  "static" 		: {_diffCoeff = 1};
};
if (isplayer _killer) then {
	//if (WMS_AI_forceInfKillCount) then {_killer addPlayerScores [1,0,0,0,0]}; //not used anymore
	if (isplayer _instigator) then {
		if !(isplayer _killer) then {
			_killer = _instigator;
		};
	}; //might help with artillery shit
	_killerName = name _killer;
	_killerUID = getPlayerUID _killer;
	_playerRepUpdated = 0;
	_playerUID_ExileKills = "ExileKills_"+_killerUID;
	_playerUID_ExileScore = "ExileScore_"+_killerUID;
	if (isDedicated)then{
  		_playerRep = profileNamespace getVariable [_playerUID_ExileScore,0];
  		_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
	}else{
		_playerRep = _killer getVariable ["ExileScore",0];
		_playerKills = _killer getVariable ["ExileKills",0];
	};
	_playerKills = _playerKills + 1;
	_killer setVariable ["ExileKills", _playerKills, true];
	/////this, I have no idea what is it xD
	if (vehicle _killer isKindOf "Man") then {
		_killer setVariable ["WMS_lastKill",servertime,true];
	} else {
		{_x setVariable ["WMS_lastKill",servertime,true];}forEach (crew (vehicle _killer));
	};
	/////
	//I think it would be easier to do a vehicle check and then apply "options" than check the vehicles for every options
	if (
		vehicle _killer isKindOf "tank"||
		vehicle _killer isKindOf "APC"||
		vehicle _killer isKindOf "Heli_Attack_01_base_F"||
		vehicle _killer isKindOf "Heli_Attack_02_base_F"||
		vehicle _killer isKindOf "Heli_Light_01_armed_base_F"||
		vehicle _killer isKindOf "RHS_MELB_base"||
		typeOf vehicle _killer in WMS_RCWS_Vhls ||
		_distanceKill >= WMS_AMS_AbuseMaxDist
	) then {
		//AMS_Abuse
		if (WMS_AMS_Abuse) then {//THAT WILL BE A "PROBLEM" WITH HC
			_MissionID = _killed getVariable ["AMS_MissionID", ""];
			_AMS_Abuse = missionNameSpace getVariable [format["%1_AMS_Abuse",_MissionID],0];
			missionNameSpace setVariable [format["%1_AMS_Abuse",_MissionID],_AMS_Abuse+1];
		};
		//add an "Auto Black List count"
		if (WMS_AMS_AutoBlackList)then {//THAT WILL BE A "PROBLEM" WITH HC
			_ABLcount = missionNameSpace getVariable [format ["%1_ABLcount",getPlayerUID _killer],0];
			if (_ABLcount >= WMS_AMS_ABLcount && {!(getPlayerUID _killer in WMS_BlackList)}) then {
				WMS_BlackList pushBack (getPlayerUID _killer);
			}else{
				missionNameSpace setVariable [format ["%1_ABLcount",getPlayerUID _killer],_ABLcount+1];
			};
		};
		//reinforce
		if (_killed == leader _killed && {WMS_AMS_Reinforce} && {time > (WMS_AMS_LastReinforce+WMS_AMS_ReinforceCoolD)}) then {
			WMS_AMS_LastReinforce = serverTime;
			[_killed,_killer,_playerRep,_distanceKill,_difficulty]call WMS_fnc_AMS_Reinforce;
		};
	};
	if (WMS_exileFireAndForget) then { //FireAndForget is ONLY for Exile DB means Exile mod is running
		format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerKills = _playerKills;
		(owner _killer) publicVariableClient "ExileClientPlayerKills";
		ExileClientPlayerKills = nil;
	} else {
		if (isDedicated)then{
			profileNamespace setVariable [_playerUID_ExileKills,_playerKills];
		}else{
			[_playerUID_ExileKills,_playerKills,"set",_Killer] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];
		};
	};

	if (WMS_AMS_DestroyStatics && {
		_killed getVariable ["WMS_Static", false];
		}) then {
			_static = _killed getVariable "WMS_StaticObj";
			if !(isNil "_static") then {_static setDamage 1};
		};
	if (_killed == leader _killed) then {
		if ((random 100) < WMS_AMS_DestroyVHL) then {vehicle _killed setDamage 1};
		if (WMS_AMS_Reinforce && {time > (WMS_AMS_LastReinforce+WMS_AMS_ReinforceCoolD)}) then {
			if (_distanceKill>(WMS_AMS_RangeList select 0) && {(OPFOR countSide allUnits) < WMS_AI_MaxUnits_B}) then {
				[_killed,_killer,_playerRep,_distanceKill,_difficulty]call WMS_fnc_AMS_Reinforce;
			};
		};
	};
	//if (WMS_AMS_remRPG) then {_killed removeWeapon (secondaryWeapon _killed)};
	if ((random 100) < WMS_AMS_remRPG) then {_killed removeWeapon (secondaryWeapon _killed)};

	if (WMS_AMS_RespectRwdOnKill && {(typeOf vehicle _killer) == WMS_PlayerEntity}) then {
		if (_distanceKill < WMS_AMS_distBonusMax) then {
			_malusDist = _bonusDist -(_bonusDist*2);
			_payload pushBack [format ["%1m RANGE MALUS",_distanceKill], _malusDist];//[_scoreName, _scoreString]
			_bonus = floor ((WMS_AMS_respectBonus + _malusDist)*_diffCoeff);
			_payload pushBack [format ["Coeff %1",_difficulty], (_bonus-(WMS_AMS_respectBonus + _malusDist))];//[_scoreName, _scoreString]
		};
		_killer setVariable ["ExileScore",(_playerRep+_bonus), true];
		_playerRepUpdated = _killer getVariable ["ExileScore", 0];
		if (WMS_exileFireAndForget) then {
			format["setAccountScore:%1:%2", _playerRepUpdated, _killerUID] call ExileServer_system_database_query_fireAndForget;
			ExileClientPlayerScore = _playerRepUpdated;
			(owner _killer) publicVariableClient "ExileClientPlayerScore";
			ExileClientPlayerScore = nil;
		} else {
			if (isDedicated)then{
				profileNamespace setVariable [_playerUID_ExileScore,_playerRepUpdated];
			}else{
				[_playerUID_ExileScore,_playerRepUpdated,"set",_Killer] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];
			};
		};
	} else {
		_bonus = 0;
		_payload = [[format ["KILLED %1",toUpper(name _killed)],_bonus]];//[_scoreName, _scoreString]
	};
	if (WMS_AMS_sysChatMsg == 1) then { // general
		_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
		[_msgx] remoteexec ['SystemChat',0];
	} else {
		if (WMS_AMS_sysChatMsg == 2) then { // group
			_msgx = format["%1 killed %2 from %3 meters away and received %4 respect.",_killerName,(name _killed),_distanceKill,_bonus];
			{_msgx remoteExecCall ["systemChat", _x]} forEach units (group _killer);
		} else {
			if (WMS_AMS_sysChatMsg == 3) then { // player
				_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
				[_msgx] remoteExecCall ['SystemChat',_killer];
			};
		};
	};

	if (WMS_exileToastMsg) then {
		_sessionID = _killer getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Mission AI', 'Target down']]] call ExileServer_system_network_send_to;
	};
	if (WMS_AMS_ShowFragMsg) then {
		if (WMS_exileFireAndForget) then {
			[_killer, "showFragRequest", [_payload]] call ExileServer_system_network_send_to;
		} else {
			if (WMS_IP_LOGs) then {diag_log format ["[AMS_AI_KILLED_MESSAGE]|WAK|TNA|WMS|Killer:%1, Payload: %2",_killer, _payload]};
				if (isDedicated) then {
					[_payload,"AMS"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)];//WMS_fnc_displayKillStats is clientSide (mission.sqm)
				}else{
					[_payload,"AMS",_killer] remoteExec ['WMS_fnc_transitKillStats',2]; //yep... I know...
				};
		};
	};
	if (WMS_AMS_ejectDeads) then {moveout _killed};
	if !((vehicle _killer) isKindOf "man")then{
		if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Killer: %1 is in a Vehicle!",(name _killer), (typeOf (vehicle _killer))]};
		if (
			vehicle _killer isKindOf "tank" || 
			vehicle _killer isKindOf "Wheeled_Apc_F" || 
			(typeOf (vehicle _killer)) in WMS_RCWS_Vhls
			) then {
			if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Killer: %1, vehicle is a tank/APC",(name _killer)]};
			if (WMS_AMS_StripOnArmoredK)then {
				if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Victime %1 is losing all is stuff",(name _killed)]};
				_killed removeWeapon (primaryWeapon _killed);
				_killed removeWeapon (secondaryWeapon _killed);
				removeAllItems _killed;
				removeAllWeapons _killed;
				removeBackpackGlobal _killed;
				removeVest _killed;
			};
			if (WMS_AMS_TrappOnArmoredK)then {
				//remove players "mineDetector", inventory and vehicle
				if ((items _killer) find "MineDetector" != -1) then {
					_killer removeItems "MineDetector";
				}else {
					if ((typeOf vehicle _killer) != "man" && {(itemcargo vehicle _killer) find "MineDetector" != -1}) then {
						_items = itemCargo vehicle _killer;
						clearItemCargoGlobal vehicle _killer;
						{
       						if !(_x == "MineDetector") then {vehicle _killer addItemCargoGlobal [_x, 1]};
						} forEach _items;
					};
				};
				_mineType = selectRandom [(WMS_ATMines select 0),"APERSBoundingMine"];
				_mine = createMine [_mineType, [((position _killed) select 0),((position _killed) select 1),0], [], 1 ];
				_mine allowDamage false;
				EAST revealMine _mine;
				if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Victime %1 is Boobytrapped, %2",(name _killed),_mineType]};
			};
		}else {
			if (
				vehicle _killer isKindOf "Heli_Attack_01_base_F"||
				vehicle _killer isKindOf "Heli_Attack_02_base_F"||
				vehicle _killer isKindOf "Heli_Light_01_armed_base_F"||
				vehicle _killer isKindOf "RHS_MELB_base"
				) then {
				if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Killer: %1, vehicle is an Attack Helicopter",(name _killer)]};
				if (WMS_AMS_StripOnArmoredK)then {
					if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Victime %1 is losing all is stuff",(name _killed)]};
					_killed removeWeapon (primaryWeapon _killed);
					_killed removeWeapon (secondaryWeapon _killed);
					removeAllItems _killed;
					removeAllWeapons _killed;
					removeBackpackGlobal _killed;
					removeVest _killed;
				};
			};
		};
	}else {
		if (WMS_IP_LOGs) then {diag_log format ["[AMS KILLER IN VEHICLE]|WAK|TNA|WMS| Killer: %1 seems to not be in a vehicle",(name _killer), (typeOf (vehicle _killer))]};
	};
	//saveProfileNamespace;
	if (WMS_IP_LOGs) then {diag_log format ["[AMS PROFILENAMESPACE]|WAK|TNA|WMS| _killer VARs: %1 | %2 %3 | %4 %5", _killer, ("ExileKills_"+_killerUID), _playerKills, ("ExileScore_"+_killerUID), _playerRepUpdated]};
	//Add hideBody addaction here
	[_killed,
		[
			"<t size='1' color='#abf500'>Hide Body</t>",	// title
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				hideBody _target;
				_caller removeAction _actionId;
				[_target]spawn{uisleep 5; deleteVehicle (_this select 0)};
			},
			nil,		// arguments
			1.5,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"!(alive _target)", 	// condition
			1.5			// radius
		]
	] remoteExec [
		"addAction",
		0, //0 for all players
		false //JIP
	];
} else {
	if ((_killed == leader _killed) && {(random 100) < WMS_AMS_DestroyVHL}) then {vehicle _killed setDamage 1};
	_killed removeWeapon (secondaryWeapon _killed);
	//AMS_Abuse, just in case everybody start to die by "accident"
	if (WMS_AMS_Abuse) then { //THAT WILL BE A "PROBLEM" WITH HC
		_MissionID = _killed getVariable ["AMS_MissionID", ""];
		_AMS_Abuse = missionNameSpace getVariable [format["%1_AMS_Abuse",_MissionID],0];
		missionNameSpace setVariable [format["%1_AMS_Abuse",_MissionID],_AMS_Abuse+1];
	};
};