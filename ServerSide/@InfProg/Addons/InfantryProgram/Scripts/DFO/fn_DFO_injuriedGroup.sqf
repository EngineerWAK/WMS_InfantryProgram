/**
* WMS_fnc_DFO_injuriedGroup - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_injuriedGroup = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_injuriedGroup _this %1', _this]};
	params [["_units", []]];
	private _readyToGo = [];
	/*{ //at spawn so they do not run around
		_x disableAI "ANIM";
		_x disableAI "TARGET";
		_x disableAI "AUTOTARGET";
		_x disableAI "MOVE";
		[_x, (selectRandom ["Acts_CivilInjuredArms_1", "Acts_CivilInjuredChest_1", "Acts_CivilInjuredGeneral_1", "Acts_CivilInjuredHead_1", "Acts_CivilInjuredLegs_1", "Acts_SittingWounded_loop"])] remoteExec ["switchMove"];
	} forEach _units;*/
	uisleep 15;
	while {({alive _x}count _units) > 0} do { //loop will stop at cleanup or all dead
   		{
			if (((damage _x) < 0.1) && {_x getVariable ["WMS_InjuredCanMove", true]} && {!(_x in _readyToGo)}) then { //incapacitatedState _x == "UNCONSCIOUS" || _x getVariable ["ace_isunconscious", true]
				[_x, "AinjPpneMstpSnonWnonDnon_kneel"] remoteExec ["switchMove"];
				//[_x, ""] remoteExec ["switchMove"];
				_x enableAI "ANIM";
				_x enableAI "TARGET";
				_x enableAI "AUTOTARGET";
				_x enableAI "MOVE";
				_x enableAI "PATH";
				_x setUnitPos "AUTO";
				uisleep 1;
				[_x] orderGetIn true;
				_readyToGo pushBack _x;
			}
    	} forEach _units;
    sleep 3;
	};
//};