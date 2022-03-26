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

//[(position player), player, 3500, 0, "mission"] remoteexec ["WMS_fnc_InfantryProgram_buy"];//"IP_ammo", "IP_toolKit", "IP_launcher"
diag_log format ["[INFANTRYPROGRAM BUY]|WAK|TNA|WMS| %1", _this];
private ["_lockerMoney1","_playerMoney","_poptabsplayer","_sessionID"];
params[
	"_pos",
	"_target",
	["_amount", 9999,[0]],
	["_lockerMoney", 0,[0]],
	["_mission", "none", [""]]
];
_lockerMoney = 0;
_sessionID = _target getVariable ['ExileSessionID',''];
 	if (WMS_exileFireAndForget) then {
		_lockerMoney = _target getVariable ['ExileLocker', 0];
	}else{
		_lockerMoney = _target getVariable ['ExileMoney', 0];
	};

if(_lockerMoney > _amount) then { 
 	if (WMS_exileFireAndForget) then {
    	//////////EXILE
		_lockerMoney1 = _target getVariable ['ExileLocker', 0];
    	_playerMoney = _target getVariable ['ExileMoney', 0];
		_lockerMoney = _lockerMoney1 - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_target setVariable ['ExileMoney', _playerMoney, true];
		_target setVariable ['ExileLocker', _lockerMoney, true];
    	format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		} else {
			_ownerUID = getPlayerUID _target;
			_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
			_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
			profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_amount)];
			_target setVariable ["ExileMoney", (_playerMoney-_amount), true];
		};
		if (WMS_exileToastMsg) then {
			[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['EXILE Payment', format['Transaction Accepted, %1 PopTabs',_amount]]]] call ExileServer_system_network_send_to;
		};
		/////
		switch (_mission) do {
			case "IP_ammo" 		: {[_pos,_target,_mission] spawn WMS_fnc_DynAI_SpawnCrate};
			case "IP_toolKit"	: {[_pos,_target,_mission] spawn WMS_fnc_DynAI_SpawnCrate};
			case "IP_launcher"	: {[_pos,_target,_mission] spawn WMS_fnc_DynAI_SpawnCrate};
		};
} else {
	if (WMS_exileToastMsg) then {
		 [_sessionID, 'toastRequest', ['ErrorTitleAndText', ['EXILE Payment', format['NOPE! only %1 PopTabs in your lockers',_lockerMoney]]]] call ExileServer_system_network_send_to;
	};
};