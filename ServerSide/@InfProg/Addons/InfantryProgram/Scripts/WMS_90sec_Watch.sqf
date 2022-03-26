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

//uisleep 120+90;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 90sec Watch started at %1", time];
while {true} do {
	//WMS_AI_watchNdestroy
	call WMS_fnc_Watch_RoamingINF;
	//DynAI Target selection
	call WMS_fnc_Watch_DynAI;
uisleep 91; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
};