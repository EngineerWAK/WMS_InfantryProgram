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
		//private _choppa = selectrandom ["UK3CB_BAF_Wildcat_AH1_TRN_8A","UK3CB_BAF_Merlin_HC3_32"]; //WTF ??? There is a randomSelect WMS_ExtractionChopper_Type directly in WMS_fnc_infantryProgram_extraction
		//[player,_pos,nil,0,_vehicVarName] remoteExec ["WMS_fnc_infantryProgram_extraction"];
		[player,_pos] remoteExec ["WMS_fnc_infantryProgram_extraction",2];
		WMS_Loc_InfProg_Extraction_Last = time;
		systemchat format ["%1 extraction requested, destination %2", player, _pos];
		openMap false;
		true 
	};
};