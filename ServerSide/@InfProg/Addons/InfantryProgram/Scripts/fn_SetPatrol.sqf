/**
* WMS_fnc_SetPatrol - InfantryProgram
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
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_SetPatrol _this %1', _this]};
params [
	"_hexaID",
	"_pos", 
	"_grp", 
	"_vhl", //_vhlObject
	["_infantry", true],
	["_combat", false]
];
private _waypoints = [];
private _wpt0 = [];
private _wpt1 = [];
private _wpt2 = [];
private _wpt3 = [];
private _lastPos = [0,0,0];
private _findPos = true;
private _cycles = 1000;
//create Waypoints, lets say 4 of them, in random cities for Vehicles, around for dudes
if (_infantry) then {
	if (_combat) then {
		[_grp, _pos, 150, 3, "MOVE", "AWARE", "YELLOW", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	} else {
		[_grp, _pos, 150, 3, "MOVE", "CARELESS", "BLUE", "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
	};
	if (true) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_SetPatrol, group %1, Vehicle %2, waypoints %3', _grp, "INF", [(getWPPos [_grp, 0]),(getWPPos [_grp, 1]),(getWPPos [_grp, 2]),(getWPPos [_grp, 3])]]};
} else {
	if (surfaceIsWater _pos) then {
		_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
		_wpt1 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 1, format["WPT1_%1",round time]];
		_wpt2 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 2, format["WPT2_%1",round time]];
		_lastPos = (selectRandom WMS_SeaPos);
		if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
			while {_findPos} do {
				_lastPos = (selectRandom WMS_SeaPos);
				if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
					_findPos = false;
					_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
				};
				_cycles = _cycles-1;
				if (_cycles < 1) then {
					_findPos = false;
					_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
				};
			};
		}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
	} else {
		if (_vhl isKindOf "helicopter") then { //choppers can also fly over water
			_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
			if !(count WMS_SeaPos == 0) then {
				_wpt1 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 1, format["WPT1_%1",round time]];
				_wpt2 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 2, format["WPT2_%1",round time]];
			}else {
				_wpt1 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 1, format["WPT1_%1",round time]];
				_wpt2 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 2, format["WPT2_%1",round time]];
			};
			_lastPos = getPos (selectRandom WMS_Roads);
			if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
				while {_findPos} do {
					if !(count WMS_SeaPos == 0) then {
						_lastPos = selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)];
					}else {
						_lastPos = getPos (selectRandom WMS_Roads);
					};		
					if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
					_cycles = _cycles-1;
					if (_cycles < 1) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
				};
			}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
			//if (count (allAirports select 0) != 0) then {_vhl landAt selectRandom (allAirports select 0)}; //NOPE
		}else {
			_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
			_wpt1 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 1, format["WPT1_%1",round time]];
			_wpt2 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 2, format["WPT2_%1",round time]];
			_lastPos = getPos (selectRandom WMS_Roads);
			if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
				while {_findPos} do {
					_lastPos = getPos (selectRandom WMS_Roads);
					if (_lastPos distance2D (getWPPos _wpt2) > 50 && _lastPos distance2D (getWPPos _wpt0) > 50) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
					_cycles = _cycles-1;
					if (_cycles < 1) then {
						_findPos = false;
						_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];
					};
				};
			}else {_wpt3 = _grp addWaypoint [_lastPos, 150, 3, format["WPT3_%1",round time]];};
		};
	};
	_waypoints pushBack _wpt0;
	_wpt0 setWaypointType "MOVE";
	_waypoints pushBack _wpt1;
	_wpt1 setWaypointType "MOVE";
	_waypoints pushBack _wpt2;
	_wpt2 setWaypointType "MOVE";
	_waypoints pushBack _wpt3;
	_wpt3 setWaypointType "CYCLE";
	{
		if (_combat) then {
			_x setWaypointCombatMode "YELLOW";
			_x setWaypointBehaviour "AWARE";
			_x setWaypointSpeed "NORMAL";
			_x setWaypointCompletionRadius 75;
		} else {
			if (surfaceIsWater _pos) then {
				_x setWaypointSpeed "FULL";
				_x setWaypointCompletionRadius 150;
			}else{
				_x setWaypointSpeed "LIMITED";
				_x setWaypointCompletionRadius 50;
			};
			_x setWaypointCombatMode "BLUE";
			_x setWaypointBehaviour "CARELESS";
		};
	}forEach _waypoints;
	if (true) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_SetPatrol, group %1, Vehicle %2, waypoints %3', _grp, (typeOf _vhl), [(getWPPos [_grp, 0]),(getWPPos [_grp, 1]),(getWPPos [_grp, 2]),(getWPPos [_grp, 3])]]};
};
_waypoints