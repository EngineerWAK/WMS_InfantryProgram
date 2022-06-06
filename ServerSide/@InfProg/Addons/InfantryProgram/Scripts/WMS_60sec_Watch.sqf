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

//uisleep 120+60;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 60sec Watch started at %1", time];
WMS_ServRestart15minWarning = true; //allow the 15min "hint" warning message (1 time)
while {true} do {
	uisleep 59; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
	if (WMS_forceNoRain && {Rain != 0}) then{10 setRain 0};
	if (WMS_forceNoFog && {fog != 0}) then{10 setFog 0};
	//Player Watch, the Original one
	if (count allPlayers != 0) then {call WMS_fnc_Watch_Players};
	//fast Night
	if (WMS_FastNight) then {call WMS_fnc_sys_FastNights};
	//Server restart 
	if (WMS_ServRestart && {serverTime > (WMS_ServRestartSeconds-900)}) then {
		[] spawn WMS_fnc_sys_ServerRestart; //I don't like this "spawn"
	};
	//DFO
	if (WMS_DynamicFlightOps) then {
		if (count WMS_DFO_Running != 0) then {
			{
				if (((_x select 7) == "DFO")) then { //if it's not "DFO", it's really fuckedUp
					_x call WMS_fnc_DFO_Cleanup;
				};
			}forEach WMS_DFO_Running;
		};
		if (count WMS_DFO_RunReinforce != 0) then {
			{
				if ((_x select 7) == "REINF" && {time > (_x select 1)}) then { //do not call the reinforcement cleanup if time has not come
					_x call WMS_fnc_DFO_RinforceCleanup; //["HexaID", time to delete, [_grps], [_vhls], [_objects],"","","REINF"]
				};
			}forEach WMS_DFO_RunReinforce;
		};
	};
};