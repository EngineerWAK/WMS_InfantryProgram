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

//uisleep 120+30;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 30sec Watch started at %1", time];
WMS_FastCombatMkr = false;//NO TOUCH, for FastCombat server marker update
if !(WMS_FastCombat) then {WMS_FastCombatMkr = true;};
while {true} do {
	uisleep 31; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
	//WMS_AI_RoamingVHL_Watch
	if (WMS_AI_RoamingVHL || WMS_AI_RoamingAIR) then {call WMS_fnc_Watch_RoamingVhl};
	//Markers Update
	if (WMS_ServerMarkers) then {call WMS_fnc_sys_ServerMarkersUpdate};
};