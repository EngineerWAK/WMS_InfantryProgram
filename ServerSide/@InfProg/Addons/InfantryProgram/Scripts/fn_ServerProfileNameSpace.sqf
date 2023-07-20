/**
* WMS_ServerProfileNameSpace - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2023 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*[_playerUID_ExileScore,_playerRepUpdated,"score","set"] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];
[_playerUID_ExileKills,_playerKills,"kills","set"] remoteExec ["WMS_fnc_ServerProfileNameSpace",2];

_playerUID_ExileKills = "ExileKills_"+_targetUID;
_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
_playerUID_ExileScore = "ExileScore_"+_targetUID;
_playerUID_ExileDeath = "ExileDeath_"+_targetUID;
*/


if (true) then {diag_log format ["[WMS_fnc_ServerProfileNameSpace]|WAK|TNA|WMS| _this = %1", _this]};
private [];
params[
	["_playerUID_Datas","ExileScore_12345678912345678"],
	["_playerUpdated",0],
	["_setGet", "get"],//"set"
	["_killer", objNull],
	["_option", "option"]
];
_result = 0;
if (_setGet isEqualTo "set")then{
	profileNamespace setVariable [_playerUID_Datas,_playerUpdated];
	if ("ExileKills" in _playerUID_Datas) then {
		(_killer setVariable ["ExileKills", _playerUpdated, true]);
	}else{
		if ("ExileScore" in _playerUID_Datas) then {
			(_killer setVariable ["ExileScore", _playerUpdated, true]);
		};
	};
};
if (_setGet isEqualTo "get")then{
	_result = profileNamespace getVariable [_playerUID_Datas,_playerUpdated]; //this one will be much harder since there is no feedback from remoteExec
};
_result
