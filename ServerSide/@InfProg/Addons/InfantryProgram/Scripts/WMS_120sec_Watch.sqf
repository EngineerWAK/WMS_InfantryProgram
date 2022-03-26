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
	//Trigger Watch 
	if (WMS_Trigg_Reinforce && {((count WMS_activatedTriggs) != 0)}) then {call WMS_fnc_Watch_Triggers};//Triggers campers activity check
	//Event Watch
	if (WMS_Events && {(count WMS_Events_list > 0)}) then {call WMS_fnc_Watch_Events};
	//RoamingVHL spawn
	if (WMS_AI_RoamingVHL || WMS_AI_RoamingAIR) then {call WMS_fnc_sys_RoamingVHLspawn};
	uisleep 120; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
};