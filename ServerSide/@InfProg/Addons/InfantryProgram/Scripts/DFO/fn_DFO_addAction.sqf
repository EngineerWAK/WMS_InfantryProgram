/**
* WMS_fnc_DFO_addAction - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_addAction = { //can be called afterwards to add DFO action(s) to a new object
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_addAction _this %1', _this]};
	private ["_pos"];
	params ["_objectToActivate"];
	[ //params ["_target", "_caller", "_actionId", "_arguments"]; //condition: _target = object, _this = caller
		_objectToActivate,
		[
			"<t size='0.9' color='#80c606'>Request Random Air Operation</t>",//_display,
			"	
				_target = _this select 0; _caller = _this select 1;
				if (WMS_DFO_UsePilotsList)then{
					if((getPlayerUID _caller) in WMS_DFO_PilotsList)then{
						[_caller,_target] remoteExec ['WMS_fnc_DFO_Event', 2];
						hint 'Contacting Air Operations HQ';
					}else{
						hint 'DFO only for selected pilots, contact admins';
					};
				}else{
					[_caller,_target] remoteExec ['WMS_fnc_DFO_Event', 2];
					hint 'Contacting Air Operations HQ';
				};
			",
			[], //argument accessible in the script (_this select 3)
			1,
			true,
			true,
			"",
			"
			(alive _target) &&
			{(vehicle _this == _this)} &&
			{(count WMS_DFO_Running) <= WMS_DFO_MaxRunning} &&
			{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)};
			",
			5
		]
	] remoteExec [
		"addAction",
		0,
		true //jip
	];
//};