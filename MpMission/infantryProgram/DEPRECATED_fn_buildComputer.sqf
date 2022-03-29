
/**
 * IP_fnc_buildComputer
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
params [
	"_IPplayer"
];
private _IPantenna = "SatelliteAntenna_01_Small_Black_F" createvehicle [0,0,0];
private _IPcomputer = "Land_MultiScreenComputer_01_black_F" createvehicle [0,0,0];
_IPcomputer setPos (_IPplayer modeltoworld [0,1,0.3]);
_IPcomputer setdir (direction _IPplayer);
_IPantenna attachTo [_IPcomputer, [0,0.4,0.27]];
_IPcomputer setVariable ['IPcomputerAllActionsID',[]];
private _allActionsID = [];

private _IDnumber = _IPcomputer addAction
[
	"<t size='0.85' color='#80c606'>Pack the Computer</t>",
	"
		_target = _this select 0; _caller = _this select 1;
		_allActionsID = _target getVariable ['IPcomputerAllActionsID',[]];
		deleteVehicle _target;
		deleteVehicle (_this select 3 select 0);
		{_target removeaction _x} foreach _allActionsID;
		[_caller] call IP_addActionRadio;
	", 
	[_IPantenna],
	1,
	true,
	true,
	"",
	"
		(alive _target) &&
		{('rhs_radio_R187P1' in (assigneditems _this))} &&
		{((getPlayerUID _this) in WMS_InfantryProgram_list)} &&
		{(vehicle _this == _this)};
	",
	5
];
_allActionsID pushBack _IDnumber;

_IDnumber = _IPcomputer addAction
[
	"<t size='0.85' color='#80c606'>sound</t>",
	"
		_target = _this select 0; _caller = _this select 1;
		playSound3D ['A3\Sounds_F\sfx\blip1.wav', _caller]
	", 
	[_IPantenna],
	1,
	true,
	true,
	"",
	"
		(alive _target) &&
		{('rhs_radio_R187P1' in (assigneditems _this))} &&
		{((getPlayerUID _this) in WMS_InfantryProgram_list)} &&
		{(vehicle _this == _this)};
	",
	5
];
_allActionsID pushBack _IDnumber;
	
_IPcomputer setVariable ['IPcomputerAllActionsID',_allActionsID]; //after the last "AddAction"