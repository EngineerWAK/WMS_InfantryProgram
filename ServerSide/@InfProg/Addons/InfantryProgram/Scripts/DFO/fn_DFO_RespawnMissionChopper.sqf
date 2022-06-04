/**
* WMS_fnc_DFO_RespawnMissionChopper - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_RespawnMissionChopper = {
	if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_RespawnMissionChopper _this %1', _this]};
	params ["_unit","_posBase"];
	uisleep 5;
	if !(surfaceIsWater _posBase) then {
		_posBase = [_posBase, 0, 100, 25, 0, 0, 0, [], [_posBase,[]]] call BIS_fnc_FindSafePos;
	};
	createVehicle ["smokeShellBlue", _posBase, [], 0, "NONE"];
	uisleep 25;
	_choppa = createVehicle [_unit, _posBase, [], 0, "NONE"];
	_choppa setDir (windDir-180);
	clearMagazineCargoGlobal _choppa; 
	clearWeaponCargoGlobal _choppa; 
	clearItemCargoGlobal _choppa; 
	clearBackpackCargoGlobal _choppa;
	_choppa setVariable ["WMS_StartPosition",_posBase];
	
	_choppa addMPEventHandler [
		"mpkilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO][Vehicle EH] WMS_fnc_DFO_RespawnMissionChopper _this %1', _this]};
			_posBase = _unit getVariable ["WMS_StartPosition",[]];
			if !(count _posBase == 0) then {
				[(typeOf _unit),_posBase]spawn WMS_fnc_DFO_RespawnMissionChopper;
			}else{
				if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO][Vehicle EH] WMS_fnc_DFO_RespawnMissionChopper _this %1', _this]};
			};
		}
	];
//};