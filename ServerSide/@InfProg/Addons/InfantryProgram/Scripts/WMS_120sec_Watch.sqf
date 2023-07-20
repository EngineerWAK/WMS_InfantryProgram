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

//uisleep 120+120;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 120sec Watch started at %1", time];
while {true} do {
	uisleep 120; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, 240 is in WMS_TheLastCartridges
	//Trigger Watch 
	if (isDedicated && WMS_Trigg_Reinforce && {((count WMS_activatedTriggs) != 0)}) then {call WMS_fnc_Watch_Triggers};//Triggers campers activity check
	//Event Watch
	if (isDedicated && WMS_Events && {(count WMS_Events_list > 0)}) then {call WMS_fnc_Watch_Events};
	//RoamingVHL spawn
	if (isDedicated && {WMS_AI_RoamingVHL || WMS_AI_RoamingAIR}) then {call WMS_fnc_sys_RoamingVHLspawn}; //ONLY DEDICATED FOR NOW
	if (isDedicated && WMS_AmbientLife) then {
		if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop Side: %1, Units: %4, server FPS %2, players %3', WMS_AL_Faction, diag_fps, count allPlayers, (WMS_AL_Faction countSide allUnits)]};
		{
			//destroying stuck vehicles
			if (speed ((_x select 3) select 0) < 3) then {
				_lastPos = _x select 3 select 0 getVariable ["WMS_AL_LastPos", [0,0,0]];
				if ((position ((_x select 3) select 0)) distance2D _lastPos < 30) then {
					if (({isPlayer _x} count crew ((_x select 3)select 0)) == 0) then {
						if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop %1 Is stuck ! bye bye', _x]};
						{
							{moveOut _x; _x setDamage 1} forEach crew _x;
							_x setDamage 1;
						}forEach (_x select 3);
					};
				}else {((_x select 3) select 0) setVariable ["WMS_AL_LastPos", position ((_x select 3)select 0)]};
			};
			//refuel vehicles
			if(owner ((_x select 3) select 0) == 2)then{((_x select 3) select 0) setFuel 1};
		}forEach (WMS_AL_Running select 0);
		//respawn missing vehicles, ONE per loop
		if (count (WMS_AL_Running select 0) < WMS_AL_VHLmax) then {
			if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop spawning a new vehicle %1', time]};
			[] call WMS_fnc_AL_createVHL;
		};
		//respawn missing dudes, ONE (group) per loop
		if (count (WMS_AL_Running select 1) < WMS_AL_UnitMax) then {
			if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop spawning a new little dude %1', time]};
			[] call WMS_fnc_AL_createUnits;
		};
	};
};