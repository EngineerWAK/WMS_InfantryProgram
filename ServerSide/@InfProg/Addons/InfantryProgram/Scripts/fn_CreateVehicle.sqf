/**
* WMS_CreateVehicle - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//FROM AmbientLife:
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_createVHL _this %1', _this]};
params [
	["_pos", []],
	["_vhl", selectRandom (WMS_AL_Vehicles select (selectRandom WMS_AL_VhlBalance))],
	["_combat",WMS_AL_CombatBehav]
];
private _dir = Random 359;
private _waypoints = [];
private _hexaID = []call WMS_fnc_AL_generateHexaID;
if(count _pos == 0) then {
	if (_vhl in (WMS_AL_Vehicles select 2) && {count WMS_AL_SeaPos >= 9}) then {
		_pos = selectRandom WMS_AL_SeaPos;
	} else {
		if (_vhl in (WMS_AL_Vehicles select 2)) then {_vhl = selectRandom (WMS_AL_Vehicles select 1)};
		_road = selectRandom WMS_AL_Roads;
		//_pos = position _road;
		_pos = [position _road, 0, 100, 15, 0, 0, 0, [], [(position _road),[]]] call BIS_fnc_FindSafePos;
		if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
			_pos = [_pos, 25, 250, 25, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
		};
		_dir = direction _road;
	};
	WMS_AL_LastUsedPos = _pos;
};
private _grp = createGroup WMS_AL_Faction;
//2 possibilities, create the vehicle ready to go with crew or create a vehicel and then the crew
//lets do the easy one first: //this way spawn the vehicle AND the crew, which pose problem with BIS command "side" ruturning the faction from a config and not the chosen one
private _vehicleData = [_pos, _dir, _vhl, _grp] call BIS_fnc_spawnVehicle; //[createdVehicle, crew, group]
private _vhlObject = (_vehicleData select 0);
_waypoints = [_hexaID,_pos,_grp,_vhlObject,false,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group,_vhlObject, boulean infantry, boulean combat]
if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createVHL _vehicleData %1', _vehicleData]};
if (WMS_AL_LockVehicles) then {_vhlObject lock 3};
clearMagazineCargoGlobal _vhlObject; 
clearWeaponCargoGlobal _vhlObject; 
clearItemCargoGlobal _vhlObject; 
clearBackpackCargoGlobal _vhlObject;
_vhlObject setVariable ["WMS_AL_lastPos", position _vhlObject];
_vhlObject setVariable ["WMS_HexaID", _hexaID];
[(_vehicleData select 1)] call WMS_fnc_AL_setUnits;
_vhlObject setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
_vhlObject addEventHandler ["Killed", " 
	[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_VhlEH;
	"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
(WMS_AL_Running select 0) pushBack [_hexaID,time,_grp,[_vhlObject],_waypoints]; //[HexaID,time,group,[vehicle],[waypoints]]
/////////////////