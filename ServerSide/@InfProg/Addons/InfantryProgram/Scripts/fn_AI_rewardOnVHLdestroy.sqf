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
private ["_targetUID","_playerMonUpdated","_playerScoUpdated","_playerMoney","_playerScore"];
params [
	"_caller",
	"_type"
];

if (true) then {diag_log format ["[AMS|ROAMING AI VHL DESTROYED]|WAK|TNA|WMS| _this: %1", _this]};
_targetUID = getPlayerUID _caller;
_playerMonUpdated = 0;
_playerScoUpdated = 0;
_playerMoney = _caller getVariable ["ExileMoney", 0];
_playerScore = _caller getVariable ["ExileScore", 0];
if (_type == "AMS") then {
	if (WMS_exileFireAndForget) then { //DB Only for Rep, poptabs stay local
		_playerMonUpdated = (_playerMoney+WMS_AMS_VHL_KillMoney);
		_playerScoUpdated = (_playerScore+WMS_AMS_VHL_KillRep);
		format["setAccountScore:%1:%2", _playerScoUpdated, _targetUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _playerScoUpdated;
		(owner _caller) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
	}else {
		_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
		_playerUID_ExileScore = "ExileScore_"+_targetUID;
		_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
		_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
		_playerMonUpdated = (_playerMoney+WMS_AMS_VHL_KillMoney);
		_playerScoUpdated = (_playerScore+WMS_AMS_VHL_KillRep);
		profileNamespace setVariable [_playerUID_Exilemoney,_playerMonUpdated];
		profileNamespace setVariable [_playerUID_ExileScore,_playerScoUpdated];
	};
	_caller setVariable ["ExileMoney", (_playerMonUpdated), true];
	_caller setVariable ["ExileScore", (_playerScoUpdated), true];
	//["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 %3 , + %2 Respect",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	if (isDedicated)then{
		["EventCustomGreen", ["Mission Vehicle Elimination", (format ["Congratulation ! + %1 %3 , + %2 Respect",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	}else{
		//Here I need to send the reqest to the server and the server send the remoteexec to the _target
		[["EventCustomGreen", ["Mission Vehicle Elimination", (format ["Congratulation ! + %1 %3 , + %2 Respect",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]],(owner _caller)] remoteExec ["WMS_fnc_remoteNotification", 2];
	};
};


if (_type == "ROAMING") then {
	//if () then {} else {}; //WMS_AI_RoamingVHL_MaxDist
	if (WMS_exileFireAndForget) then { //DB Only for Rep, poptabs stay local
		_playerMonUpdated = (_playerMoney+WMS_AI_RoamingVHL_KillMoney);
		_playerScoUpdated = (_playerScore+WMS_AI_RoamingVHL_KillRep);
		format["setAccountScore:%1:%2", _playerScoUpdated, _targetUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _playerScoUpdated;
		(owner _caller) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
	}else {
		_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
		_playerUID_ExileScore = "ExileScore_"+_targetUID;
		_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
		_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
		_playerMonUpdated = (_playerMoney+WMS_AI_RoamingVHL_KillMoney);
		_playerScoUpdated = (_playerScore+WMS_AI_RoamingVHL_KillRep);
		profileNamespace setVariable [_playerUID_Exilemoney,_playerMonUpdated];
		profileNamespace setVariable [_playerUID_ExileScore,_playerScoUpdated];
	};
	_caller setVariable ["ExileMoney", (_playerMonUpdated), true];
	_caller setVariable ["ExileScore", (_playerScoUpdated), true];
	//["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 %3, + %2 Respect",WMS_AI_RoamingVHL_KillMoney, WMS_AI_RoamingVHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	if (isDedicated)then{
		["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 %3 , + %2 Respect",WMS_AI_RoamingVHL_KillMoney, WMS_AI_RoamingVHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	}else{
		//Here I need to send the reqest to the server and the server send the remoteexec to the _target
		[["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 %3 , + %2 Respect",WMS_AI_RoamingVHL_KillMoney, WMS_AI_RoamingVHL_KillRep, WMS_Currency]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]],(owner _caller)] remoteExec ["WMS_fnc_remoteNotification", 2];
	};
};