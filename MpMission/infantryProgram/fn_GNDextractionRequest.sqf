//////////////////////////////////////////////////////////////////
//	Extraction script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
//WMS_MoveInCargo_C130 setvehicleVarName _vehicVarName; //Doesnt work
//WMS_MoveInCargo_C130 = _vehicVarName;//Doesnt work
openMap true;
[]spawn {
	uisleep 2;
	onMapSingleClick {
		onMapSingleClick {};
		private _targetUID = getplayerUID player;
		private _targetGroup = group player;
		if (isnull group player) then {_targetGroup == _targetUID};
		private _vehicVarName = format["Extraction_%1_%2", _targetGroup, time];
		[player,_pos,"",_vehicVarName] remoteExec ["WMS_fnc_infantryProgram_GNDextraction"];
		WMS_Loc_InfProg_GNDextraction_Last = time;
		systemchat format ["%1 extraction requested %2", player, _vehicVarName];
		openMap false;
		true 
	};
};