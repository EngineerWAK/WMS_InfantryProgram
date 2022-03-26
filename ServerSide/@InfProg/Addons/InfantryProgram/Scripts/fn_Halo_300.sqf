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

[_this] spawn
{
	_target = (_this select 0 select 0);
	openMap true;
	onMapSingleClick {
		onMapSingleClick {};
		_target setpos _pos;
		_height = 300;
		[_target,_height] spawn BIS_fnc_halo;
		diag_log format ['*****Halo Jump 300m*****'];
		diag_log format [str (_this select 0 select 0)];
		systemchat "HaloJump 300m";
		["toastRequest", ["InfoTitleAndText", [str (_this select 0 select 0), "Is Halo Jumping!"]]] call ExileServer_system_network_send_broadcast;
		openMap false;
		true
	};
};