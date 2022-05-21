/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

//[_target,_radPlayer,_radius,_sideShift,_shiftAngle,_mdlToWorld] call WMS_fnc_AMS_ChkSpawnAngleShift;
private ["_safe","_angleShift","_iterations","_iteration","_SafePosList","_pos","_dir","_playerBlkList","_shiftedAngle","_spawnPos"]; 
params [ 
	"_target", 
	["_radPlayer",300, [0]], 
	["_radius",400, [0]], 
	["_sideShift",5, [0]], 
	["_shiftAngle",36, [0]], 
	["_mdlToWorld",true] 
]; 
if (WMS_IP_LOGs) then {diag_log format ["[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _this: %1,", _this]};
_safe = false; 
_angleShift = true; 
_iterations = 360/_shiftAngle; 
_iteration = 1; 
_SafePosList = [];
_playerBlkList = [];
_pos = getPosATL _target; 
_dir = getDir _target; 
_shiftedAngle = _shiftAngle + _dir; 
if (_mdlToWorld) then {
	_spawnPos = _pos getpos [_radius, (_dir+(-_sideShift+(random (_sideShift+_sideShift))))];
	_playerBlkList = allPlayers select {alive _x && (_x distance2D _spawnPos < _radPlayer)} apply {[GetPosATL _x, _radPlayer]};
	if (count _playerBlkList == 0) then {
		if (WMS_IP_LOGs) then {diag_log format ["[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _playerBlkList: %1,", _playerBlkList]};  
		_safe = true; 
		_angleShift = false; 
		_SafePosList pushBack [(_spawnPos select 0),(_spawnPos select 1),0]; 
	}; 
} else {  
	_playerBlkList = allPlayers select {alive _x && (_x distance2D _pos < (_radius+_radPlayer))} apply {[GetPosATL _x, _radPlayer]};
};
while {_angleShift && (_iteration <= _iterations)} do { 
	_shiftedAngle = _shiftedAngle + _shiftAngle;
	if (_shiftedAngle > 359) then {_shiftedAngle = _shiftedAngle - 359};
	_spawnPos = _pos getpos [_radius, _shiftedAngle];
	_posFar = [_spawnPos, 0, _sideShift, 1, 0, 0, 0, _playerBlkList, [_spawnPos,[]]] call BIS_fnc_findSafePos; 
	if (count _posFar == 2) then {  
		_SafePosList pushBack _posFar; 
		_safe = true; 
	}; 
	if (WMS_IP_LOGs) then {diag_log format ["[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: %1, _pos: %2, _shiftedAngle: %3, shiftedPos: %4, position found: %5, safe: %6", _iteration, _pos, _shiftedAngle, _spawnPos, _posFar, _safe]}; 
	_iteration = _iteration+1; 
}; 
[_safe,_SafePosList]
/*
_mdlToWorld = true;
	5:47:29 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _playerBlkList: [],"
	5:47:29 "[true,[[2276.05,5881.58,0]]]"
	
_mdlToWorld = false;
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 1, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 100.044, shiftedPos: [2508.69,5445.75,0], position found: [2510.7,5441.66], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 2, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 136.044, shiftedPos: [2392.46,5227.56,1.52588e-005], position found: [2390.68,5228.51], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 3, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 172.044, shiftedPos: [2170.18,5119.36,0], position found: [2174.42,5117.22], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 4, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 208.044, shiftedPos: [1926.76,5162.48,-1.52588e-005], position found: [1923.48,5164.85], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 5, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 244.044, shiftedPos: [1755.16,5340.44,-1.52588e-005], position found: [1751.48,5341.37], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 6, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 280.044, shiftedPos: [1720.95,5585.27,0], position found: [1723.85,5587.3], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 7, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 316.044, shiftedPos: [1837.18,5803.46,1.52588e-005], position found: [1840.59,5805.14], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 8, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 352.044, shiftedPos: [2059.45,5911.66,1.52588e-005], position found: [2058.76,5913.24], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 9, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 29.0443, shiftedPos: [2309.01,5865.21,0], position found: [2305.01,5864.9], safe: true"
	5:48:40 "[AMS SPAWN ANGLESHIFT]|WAK|TNA|WMS| _iteration: 10, _pos: [2114.82,5515.51,0.00131226], _shiftedAngle: 65.0443, shiftedPos: [2477.47,5684.28,0], position found: [2474.73,5686.24], safe: true"
	5:48:40 "[true,[[2510.7,5441.66],[2390.68,5228.51],[2174.42,5117.22],[1923.48,5164.85],[1751.48,5341.37],[1723.85,5587.3],[1840.59,5805.14],[2058.76,5913.24],[2305.01,5864.9],[2474.73,5686.24]]]"
*/