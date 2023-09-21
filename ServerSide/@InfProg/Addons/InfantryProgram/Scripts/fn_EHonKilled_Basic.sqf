/**
* WMS_fnc_EHonKilled_Basic
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//[_killed,_killer,_instigator] call WMS_fnc_EHonKilled_Basic
if (true) then {diag_log format ["[EH KILLED BASIC]|WAK|TNA|WMS| _this = %1", _this]};
private ["_unit","_sessionID","_unitName","_payload","_bonus","_distanceKill","_playerRep","_bonusDist","_malusDist","_adjustedSkills"];
params[
	"_killed",
	"_killer",
	"_instigator",
	["_unitFunction","Assault"], //not used yet
	["_difficulty", "Hardcore"] //not used yet
];
WMS_AllDeadsMgr pushBack [_killed,(serverTime+500)];
_playerRep = 0;
_playerKills = 0;
if (isplayer _instigator) then {
	_killer = _instigator;
}; //might help with artillery shit
if (isplayer _killer) then {
	_distanceKill	= (round(_killer distance _killed));
	_bonus 			= WMS_DynAI_respectBonus;
	if (_distanceKill > WMS_DynAI_distBonusMax) then {_bonus = 0};
	_bonusDist 		= round (_distanceKill * WMS_DynAI_distBonusCoef);
	_malusDist 		= 0;
	_killerUID = getPlayerUID _killer;
	_playerRepUpdated = 0;
	_playerUID_ExileKills = "ExileKills_"+_killerUID;
	_playerUID_ExileScore = "ExileScore_"+_killerUID;
	if (_distanceKill < WMS_DynAI_distBonusMax) then {
		_malusDist = _bonusDist -(_bonusDist*2);
		_bonus = WMS_DynAI_respectBonus + _malusDist;
	};
	if (isDedicated)then{
  		_playerRep = profileNamespace getVariable [_playerUID_ExileScore,0];
  		_playerKills = profileNamespace getVariable [_playerUID_ExileKills,0];
	}else{
		_playerRep = _killer getVariable ["ExileScore",0];
		_playerKills = _killer getVariable ["ExileKills",0];
	};
	_playerKills = _playerKills + 1;
	_killer setVariable ["ExileScore",(_playerRep+_bonus), true];
	_playerRepUpdated = _killer getVariable ["ExileScore", 0];
	if (WMS_exileFireAndForget) then {
		format["setAccountScore:%1:%2", _playerRepUpdated, _killerUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _playerRepUpdated;
		(owner _killer) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
		
		format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerKills = _playerKills;
		(owner _killer) publicVariableClient "ExileClientPlayerKills";
		ExileClientPlayerKills = nil;
	} else {
		if (isDedicated)then{
			profileNamespace setVariable [_playerUID_ExileScore,_playerRepUpdated];
			profileNamespace setVariable [_playerUID_ExileKills,_playerKills];
			_killer setVariable ["ExileKills", _playerKills, true];
		}else{
			[_playerUID_ExileScore,_playerRepUpdated,"set",_Killer] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];
			[_playerUID_ExileKills,_playerKills,"set",_Killer] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];
		};
	};
	[_killed,
			[
				"<t size='1' color='#ff8000'>Hide Body</t>",	// title
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
};