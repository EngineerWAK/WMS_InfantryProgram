
/*if (isDedicated)then{
	["EventWarning", ["You got Spoted Bro", "Incoming Special Forces"]] remoteExec ["BIS_fnc_showNotification", owner _target];
}else{
	//Here I need to send the reqest to the server and the server send the remoteexec to the _target
	[["EventWarning", ["You got Spoted Bro", "Incoming Special Forces"]],_target] remoteExec ["WMS_fnc_remoteNotification", 2];
};*/

if (true) then {diag_log format ["[WMS_fnc_remoteNotification]|WAK|TNA|WMS| _this = %1", _this]};
private [];
params[
	"_notification",
	"_playerObject",
	["_option", "option"]
];
_notification remoteExec ["BIS_fnc_showNotification", owner _playerObject];