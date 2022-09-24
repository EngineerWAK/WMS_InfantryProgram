/**
* WMS_fnc_AllDeadsMgr - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, AllDeads Cleanup, %1 deads', count WMS_AllDeadsMgr]};
{
	if (count WMS_AllDeadsMgr != 0 && {serverTime >= (_x select 1)}) then {
		if !(alive (_x select 0)) then {
			if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|[AllDeadsMgr] WMS_fnc_AllDeadsMgr, your fignt is over %1',(_x select 0)]};
			deleteVehicle (_x select 0);
		};
		WMS_AllDeadsMgr deleteAt (WMS_AllDeadsMgr find _x);
	};
}forEach WMS_AllDeadsMgr;