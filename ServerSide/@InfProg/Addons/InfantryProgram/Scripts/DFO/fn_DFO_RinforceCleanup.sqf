/**
* WMS_fnc_DFO_RinforceCleanup - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_RinforceCleanup = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_RinforceCleanup _this %1', _this]};
	private ["_HexaID","_timer","_grps","_vhls","_objects"];
	_HexaID = (_this select 0); //""
	_timer 	= (_this select 1); //number
	_grps 	= (_this select 2); //[]
	_vhls 	= (_this select 3); //[]
	_objects = (_this select 4); //[]

	if (time > _timer) then {
		{
			{deleteVehicle _x;} forEach (units _x);
			deleteGroup _x;
		} forEach _grps;
		{deleteVehicle _x;} forEach _vhls;
		{deleteVehicle _x;} forEach _objects;
		WMS_DFO_Running deleteAt (WMS_DFO_Running find _this);
	};	
//};