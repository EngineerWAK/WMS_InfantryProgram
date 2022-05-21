/**
* WMS_CreateUnits - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//From AmbientLife
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_createUnits _this %1', _this]};
params [
	["_pos", []],
	["_units", WMS_AL_Units], //array of classNames
	["_combat",WMS_AL_CombatBehav] //boulean
];
private _unitsCount = 1;
private _unitObject = ObjNull;
private _dir = Random 359;
private _waypoints = [];
private _hexaID = []call WMS_fnc_AL_generateHexaID;
if (_combat) then {_unitsCount = selectRandom [2,2,3]}; //AmbientLife spawn only 1 unit by default
if(count _pos == 0) then {
	_road = selectRandom WMS_AL_Roads;
	_pos = position _road;
	if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
		_pos = [_pos, 10, 250, 5, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
	};
	_dir = direction _road;
	WMS_AL_LastUsedPos = _pos;
};
private _grp = createGroup WMS_AL_Faction;
_waypoints = [_hexaID,_pos,_grp,"nan",true,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group, boulean infantry, boulean combat]
for "_i" from 1 to _unitsCount do {
	_unitObject = _grp createUnit [selectRandom _units, _pos, [], 15, "FORM"];
	_unitObject setVariable ["WMS_HexaID", _hexaID];
	_unitObject setVariable ["WMS_RealFuckingSide", WMS_AL_Faction]; //from AL_setUnits
};

[units _grp] call WMS_fnc_AL_setUnits;
(WMS_AL_Running select 1) pushBack [_hexaID,time,_grp,units _grp,_waypoints]; //[HexaID,time,group,[units],[waypoints]]
////////////////////