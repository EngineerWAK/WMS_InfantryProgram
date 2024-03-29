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

private ["_msgr"];
if (serverTime > (WMS_ServRestartSeconds)) then {
		WMS_serverCMDpwd serverCommand "#Lock";
		_msgr = format ['PLAYERS KICK IN %1 SECONDES', (20)];
		[_msgr] remoteExecCall ['SystemChat', -2];
		if (WMS_UseBattleMetrics) then {
			["EventWarning", ["SERVER RESTART", "The server restart is now managed by BattleMetrics"]] remoteExec ["BIS_fnc_showNotification", -2];
		}else {
			["EventWarning", ["SERVER RESTART", "The server will restart in 30 secondes"]] remoteExec ["BIS_fnc_showNotification", -2];
		};
		uisleep 20;
		{
			if (count(getPlayerUID _x)==17) then {WMS_serverCMDpwd serverCommand format ["#kick %1", (getPlayerUID _x)]};//do not kick the HC
		}foreach allPlayers;
		if !(WMS_exileFireAndForget) then {
			[] call WMS_fnc_permanentVehiclesLastUpdate; //TheLastCartridges permanent vehicles
		};
		uisleep 10;
		if (WMS_UseBattleMetrics) then {
			//["EventWarning", ["SERVER RESTART", "The server restart is now managed by BattleMetrics, Wait For It"]] remoteExec ["BIS_fnc_showNotification", -2]; //Nobody left on the server
		} else {
			WMS_serverCMDpwd serverCommand "#shutdown";
		};
	} else {
		if (WMS_ServRestart15minWarning) then {
			["EventWarning", ["SERVER RESTART", "The server will restart in 15 Minutes"]] remoteExec ["BIS_fnc_showNotification", -2];
			WMS_ServRestart15minWarning = false;
		};
		_msgr = format ['SERVER RESTART in %1 minutes', (round ((WMS_ServRestartSeconds-serverTime)/60))];
		[_msgr] remoteExecCall ['SystemChat', -2];
	};