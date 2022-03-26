
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

//////////////////////////////////////////////////////////////////

diag_log format ['*************************BUY ACTION*************************'];
diag_log format [str _this]; 
private _TargetAction = (_this select 0);
diag_log format [str (_this select 0)];
private _amount = (_this select 1); 
diag_log format [str (_this select 1)];
private _mission = (_this select 2);
diag_log format [str (_this select 2)];
if(alive _targetAction)then   
  { 
    _lockerMoney1 = _TargetAction getVariable ['ExileLocker', 0];
    _playerMoney = _TargetAction getVariable ['ExileMoney', 0];
		_lockerMoney = _lockerMoney1 - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_TargetAction setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_TargetAction setVariable ['ExileMoney', _playerMoney, true];
		_TargetAction setVariable ['ExileLocker', _lockerMoney, true];
    format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _TargetAction)] call ExileServer_system_database_query_fireAndForget; 
    [_TargetAction] call WMS_fnc_AirStrikeOnNPC;
} else {systemchat "you dead Bro :/"};