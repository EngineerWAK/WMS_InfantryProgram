/*[_payload,_info,_killer] remoteExec ['WMS_fnc_transitKillStats',(owner _killer)];
[_payload,"AMS",_killer] remoteExec ['WMS_fnc_transitKillStats',(owner _killer)];
*/
params[
	"_payload",
	"_info",
	"_killer"
];

[_payload,_info] remoteExec ['WMS_fnc_DisplayKillStats',(owner _killer)];