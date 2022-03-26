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
private [];
params [
	"_caller",
	"_type"
];

if (true) then {diag_log format ["[AMS|ROAMING AI VHL DESTROYED]|WAK|TNA|WMS| _this: %1", _this]};

if (_type == "AMS") then {
	_targetUID = getPlayerUID _caller;
	_targetOwner = (owner _caller);
	_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
	_playerUID_ExileScore = "ExileScore_"+_targetUID;
	_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
	_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
	profileNamespace setVariable [_playerUID_Exilemoney,_playerMoney+WMS_AMS_VHL_KillMoney];
	profileNamespace setVariable [_playerUID_ExileScore,_playerScore+WMS_AMS_VHL_KillRep];
	_caller setVariable ["ExileMoney", (_playerMoney+WMS_AMS_VHL_KillMoney), true];
	_caller setVariable ["ExileScore", (_playerScore+WMS_AMS_VHL_KillRep), true];
	["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 Pt, + %2 Score",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 Pt, + %2 Score",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] call BIS_fnc_showNotification;
};


if (_type == "ROAMING") then {
	_targetUID = getPlayerUID _caller;
	_targetOwner = (owner _caller);
	_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
	_playerUID_ExileScore = "ExileScore_"+_targetUID;
	_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
	_playerScore = profileNamespace getVariable [_playerUID_ExileScore,0];
	profileNamespace setVariable [_playerUID_Exilemoney,_playerMoney+WMS_AI_RoamingVHL_KillMoney];
	profileNamespace setVariable [_playerUID_ExileScore,_playerScore+WMS_AI_RoamingVHL_KillRep];
	_caller setVariable ["ExileMoney", (_playerMoney+WMS_AI_RoamingVHL_KillMoney), true];
	_caller setVariable ["ExileScore", (_playerScore+WMS_AI_RoamingVHL_KillRep), true];
	["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 Pt, + %2 Score",WMS_AI_RoamingVHL_KillMoney, WMS_AI_RoamingVHL_KillRep]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _caller)];
	["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! + %1 Pt, + %2 Score",WMS_AMS_VHL_KillMoney, WMS_AMS_VHL_KillRep]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] call BIS_fnc_showNotification;				
};