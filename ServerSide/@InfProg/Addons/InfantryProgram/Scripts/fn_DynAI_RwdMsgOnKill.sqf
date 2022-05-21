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

//[_killed,_killer,_unitFunction,_info] call WMS_fnc_DynAI_RwdMsgOnKill
if (WMS_IP_LOGs) then {diag_log format ["[DYNAI REWARDS]|WAK|TNA|WMS| _this = %1", _this]};
private ["_unitFunction","_info","_unit","_msgx","_sessionID","_unitName","_payload","_bonus","_distanceKill","_playerRep","_bonusDist","_malusDist","_type"];
params[
	"_killed",
	"_killer"
	//["_unitFunction","Assault"], //doesn't work, must get it from getvariable
	//["_info", "nothingYet"] //doesn't work, must get it from getvariable
];
	_unitFunction 	= _killed getVariable ["unitFunction", "Assault"];
	_info 			= _killed getVariable ["info", "nothingYet"]; //BaseATK //
	_killerName 	= name _killer;
	//_distanceKill	= (round(_killer distance2D _killed));
	_distanceKill	= (round(_killer distance _killed));
	_bonus 			= WMS_DynAI_respectBonus;
	if (_distanceKill > WMS_DynAI_distBonusMax) then {_bonus = 0};
	_bonusDist 		= round (_distanceKill * WMS_DynAI_distBonusCoef);
	_malusDist 		= 0;
	_payload 		= [[format ["KILLED %1",toUpper(name _killed)],_bonus]];
	_msgx 			= "";

	if (((random 100) < WMS_DynAI_DestroyVHL) && (_killed == leader _killed)) then {vehicle _killed setDamage 1};

	if (WMS_DynAI_remRPG) then {_killed removeWeapon (secondaryWeapon _killed)};

	if (isplayer _killer) then {
		if (WMS_AI_forceInfKillCount) then {_killer addPlayerScores [1,0,0,0,0]};
		_killerUID 	= getPlayerUID _killer;
		_playerRepUpdated = 0;
		_playerUID_ExileKills = "ExileKills_"+_killerUID;
		_playerUID_ExileScore = "ExileScore_"+_killerUID;
  		_playerRep = profileNamespace getVariable [_playerUID_ExileScore,0];
  		_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
		_playerKills = _playerKills + 1;
		_killer setVariable ["ExileKills", _playerKills, true];
		if (WMS_exileFireAndForget) then {
			format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
			ExileClientPlayerKills = _playerKills;
			(owner _killer) publicVariableClient "ExileClientPlayerKills";
			ExileClientPlayerKills = nil;
			} else {
  				profileNamespace setVariable [_playerUID_ExileKills,_playerKills];
			};

		if (_info == 'BaseATK' && (WMS_DynAI_BaseATKReinforce) && (time > (WMS_DynAI_BaseATKReinforce_Last+WMS_DynAI_BaseATKReinforce_CD)) && (_killed == leader _killed)) then {
			//[_killer] call WMS_fnc_DynAI_BaseATK_Reinforce;
			WMS_DynAI_BaseATKReinforce_Last = time;
			_flag = _killed getVariable ["BaseATKflag", nil];
			_types = _flag getVariable ["BaseATKReinforce", ["paradrop"]];//_types = ["runner","paradrop","VHLpatrol","AIRpatrol","AIRassault"];
			if !(count _types == 0) then {
				_type = selectRandom _types;
				[_killer, position _killer, "BaseATKreinforcement",_type] call WMS_fnc_DynAI_selScen; //need to add 'BaseATK' to those dudes
				_types deleteAt (_types find _type);
				_flag setVariable ["BaseATKReinforce", _types, true];
			};
		};//reinforcement on group leader kill

		//if (WMS_DynAI_RespectRwdOnKill) then {
		if (WMS_DynAI_RespectRwdOnKill && ((typeOf vehicle _killer) == WMS_PlayerEntity)) then {
			if (_distanceKill < WMS_DynAI_distBonusMax) then {
				_malusDist = _bonusDist -(_bonusDist*2);
				_payload pushBack [format ["%1m RANGE MALUS",_distanceKill], _malusDist];
				_bonus = WMS_DynAI_respectBonus + _malusDist;
			};
			_killer setVariable ["ExileScore",(_playerRep+_bonus), true];
			_playerRepUpdated = _killer getVariable ["ExileScore", 0];
			if (WMS_exileFireAndForget) then {
				format["setAccountScore:%1:%2", _playerRepUpdated, _killerUID] call ExileServer_system_database_query_fireAndForget;
				ExileClientPlayerScore = _playerRepUpdated;
				(owner _killer) publicVariableClient "ExileClientPlayerScore";
				ExileClientPlayerScore = nil;
			} else {
  				profileNamespace setVariable [_playerUID_ExileScore,_playerRepUpdated];
			};
		} else {
			_bonus = 0;
			_payload = [[format ["KILLED %1",toUpper(name _killed)],_bonus]];
		};
		if (WMS_DynAI_sysChatMsg == 1) then { // general
			if (_bonus == 0) then {
				_msgx = format ['%2 killed %1, %3m away.', (name _killed), _killerName,_distanceKill];
			} else {
				_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
			};
			[_msgx] remoteexec ['SystemChat',0];
		} else {
			if (WMS_DynAI_sysChatMsg == 2) then { // group
				if (_bonus == 0) then {
					_msgx = format["%1 killed %2 from %3 meters away.",_killerName,(name _killed),_distanceKill];
				} else {
					_msgx = format["%1 killed %2 from %3 meters away and received %4 respect.",_killerName,(name _killed),_distanceKill,_bonus];
				};
				{_msgx remoteExecCall ["systemChat", _x]} forEach units (group _killer);
			} else {
				if (WMS_DynAI_sysChatMsg == 3) then { // player
					if (_bonus == 0) then {
						_msgx = format ['%2 killed %1, %3m away.', (name _killed), _killerName,_distanceKill];
					} else {
						_msgx = format ['%2 killed %1, %3m away and received %4 respect.', (name _killed), _killerName,_distanceKill,_bonus];
					};
						[_msgx] remoteExecCall ['SystemChat',_killer];
				};
			};
		};

		if (WMS_exileToastMsg) then {
			_sessionID = _killer getVariable ['ExileSessionID',''];
			if (_info == "BaseATK")then{
				[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Base Attack', 'Target down']]] call ExileServer_system_network_send_to;
			}else{
				[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Dynamic AI', 'Target down']]] call ExileServer_system_network_send_to;
			};
		};
		if (WMS_DynAI_ShowFragMsg) then {
			//[_killer, "showFragRequest", [_payload]] call ExileServer_system_network_send_to;
			if (WMS_exileFireAndForget) then {
				[_killer, "showFragRequest", [_payload]] call ExileServer_system_network_send_to;
			} else {
				if (WMS_IP_LOGs) then {diag_log format ["[DynAI_KILLED_MESSAGE]|WAK|TNA|WMS|Killer:%1, Payload: %2",_killer, _payload]};
				[_payload,"NotAMS"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)];
			};
		};
		if (WMS_DynAI_ejectDeads) then {moveout _killed};
		//saveProfileNamespace;
		//Add hideBody addaction here
	[_killed,
		[
			"Hide Body",	// title
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
		if (WMS_IP_LOGs) then {diag_log format ["[DYNAI PROFILENAMESPACE]|WAK|TNA|WMS| _killer VARs: %1 | %2 %3 | %4 %5", _killer, ("ExileKills_"+_killerUID), _playerKills, ("ExileScore_"+_killerUID), _playerRepUpdated]};
		//if (WMS_IP_LOGs) then {diag_log format ["[DYNAI PROFILENAMESPACE]|WAK|TNA|WMS| _killer ProfileNameSpace: %1 | %2 %3 | %4 %5", _killer, ("ExileKills_"+_killerUID), (profileNamespace getVariable _playerUID_ExileKills), ("ExileScore_"+_killerUID), (profileNamespace getVariable _playerUID_ExileScore)]};
		//if (WMS_IP_LOGs) then {diag_log format ["[DYNAI PLAYERVAR]|WAK|TNA|WMS| %1 VARs: ExileScore %2 | ExileMoney %3 | ExileKills %4", _killer, (_killer getVariable ["ExileScore", -1]), (_killer getVariable ["ExileMoney", -1]), (_killer getVariable ["ExileKills", -1])]};
	};