/**
* WMS_fnc_DFO_infUnLoad - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_infUnLoad = { //easy way: moveOut _unit;
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infUnLoad _this %1', _this]};
	params [
		"_vehiceObject",
		"_pilotObject",
		["_unloadType", WMS_DFO_InfUnloadType] //0,1,2,3
	];
	private _dudes = [];
	private _RealFuckingSide = CIVILIAN;
	{
		if (!(isPlayer _x) && {group _x != group _pilotObject}) then {
			_dudes pushBack _x;
		};
	}forEach crew _vehiceObject;
	if (WMS_DFO_InfUnlOverride) then {_unloadType = WMS_DFO_InfUnloadType};
	if (_unloadType == 2) then { //2: rappel
		[_vehiceObject] call AR_Rappel_All_Cargo; //need to test on dedi// need Advanced Rappeling
	} else {
		if (_unloadType == 3) then { //3: FastRope
			[_vehiceObject] call ace_fastroping_fnc_equipFRIES; //work only on "selected" choppers, ACE decide for you...
			uisleep 1;
			[_vehiceObject] call ace_fastroping_fnc_prepareFRIES;
			uisleep 1;
			[_vehiceObject,false,false] call ace_fastroping_fnc_deployAI;
		} else {
			{
				_x allowDamage false; //protect those little guys against broken legs...
				if (_unloadType == 0) then { //0: dump
					moveOut _x;
				}else {
					if (_unloadType == 1) then { //1: land
						doGetOut _x; //AI waits for execution until vehicle has stopped/is no longer flying (unclear if any timeout exists for order to be discarded) - unlike action "Eject" and moveOut
					}else{
						//What else?
						moveOut _x;
					};
				};
				unassignVehicle _x;
				uisleep 0.2;
			}forEach _dudes;
		};
	};
	{
		_RealFuckingSide = _x getVariable ["WMS_RealFuckingSide",CIVILIAN];
		if (_RealFuckingSide == WEST && {_x == Leader _x})then {
			[group _x, getPosATL _x, 100, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infUnLoad %1 leader group %2 is now patroling', _x,group _x]};
		};
		if (_RealFuckingSide == CIVILIAN && {_x == Leader _x}) then {
			//[group _x] call CBA_fnc_taskDefend;
			_x disableAI "PATH"; //STOP RUNNING EVERYWHERE!
			_x disableAI "MOVE";
			_x setUnitPos "MIDDLE";
			[_x,
				[
					"Give a Little Push",
					{
						params ["_target", "_caller", "_actionId", "_arguments"];
						_target setVelocity [(sin (getDir _target))*6, (cos (getDir _target))*6, 2];
						_caller removeAction _actionId;
					},
					nil,5,true,true,"",
					"
						(alive _target) &&
						{_target == vehicle _target}
					",
					1.5
				]
			] remoteExec ["addAction",owner _pilotObject,false];
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infUnLoad %1 leader group %2 is now FUCKING GLUED TO THE FUCKING GROUND', _x,group _x]};
		};
	}forEach _dudes;
	uisleep 3;
	{_x allowDamage true}forEach _dudes;
//};