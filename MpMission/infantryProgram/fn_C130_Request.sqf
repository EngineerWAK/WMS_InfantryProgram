//////////////////////////////////////////////////////////////////
//	C130 Paradrop script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
openMap true;
[] spawn {
	uisleep 2;
	onMapSingleClick { 
		onMapSingleClick {};
		private _targetUID = getplayerUID player;
		private _targetGroup = group player;
		if (isnull group player) then {_targetGroup == _targetUID};
		private _vehicVarName = format["C130_%1_%2", _targetGroup, time];
		[player,_pos,0,_vehicVarName] remoteExec ["WMS_fnc_InfantryProgram_C130"];
		WMS_Loc_InfProg_C130_Last = time;
		WMS_MoveInCargo_C130_LastTime = time; //server side
		publicVariable  "WMS_MoveInCargo_C130_LastTime";
		openMap false;
		true
	};
};
