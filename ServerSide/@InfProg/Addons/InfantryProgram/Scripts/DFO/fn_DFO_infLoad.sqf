/**
* WMS_fnc_DFO_infLoad - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_infLoad = { //easy way: _unit moveInCargo _chopper;
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infLoad _this %1', _this]};
	params [
		"_vehiceObject",
		"_pilotObject",
		"_MissionHexaID",
		["_mission","sar"]
	];
	private _unitsDatas = missionNameSpace getVariable ["WMS_DFO_UnitsToManage", []];
	private _result = []; 
	private _loadType = WMS_DFO_InfLoadType;
	{ 
		_found = (_x select 0) find _MissionHexaID;
		_result pushback _found;
	}forEach _UnitsDatas;
	private _RefIndex = _result find 0;
	if (_RefIndex == -1 ) exitWith {if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_infLoad params fuckedUp _MissionHexaID %1', _MissionHexaID]};};

	private _Units = _UnitsDatas select _RefIndex select 1;
	{
		if (alive _x) then {
			_x assignAsCargo _vehiceObject;
			_x allowDamage true;
			if (_mission == "medevac") then {
				_x setVariable ["ace_medical_ai_lastFired", 9999999]; //prevent AI self healing
				_x call WMS_fnc_DFO_PunishPunks;
			}else {
				_x enableAI "PATH";
				_x setUnitPos "AUTO";
			};
		};
	}forEach _Units;
	if (_mission == "medevac") then {[_Units] spawn WMS_fnc_DFO_injuriedGroup};
	if (surfaceIsWater (getPosATL _vehiceObject) && {(getPosATL (_units select 0)) select 2 > 0.1}) then {
		{_x moveInCargo _vehiceObject}forEach _units; //teleport in the chopper
	}else {
		//if (side (_units select 0) == WEST ) then { //That would be "airassault"
		if !(_mission == "medevac") then {
			if (_loadType == 0) then {
				_Units orderGetIn true;
			} else {
				if (_loadType == 1) then {
					{_x moveInAny _vehiceObject}forEach _units;
				}else{
					//Next type here
				};
			};
		};
	};
	_unitsDatas deleteAt _RefIndex;
	missionNameSpace setVariable ["WMS_DFO_UnitsToManage", _unitsDatas];	
//};