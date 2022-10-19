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
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_Patrol _this %1', _this]};
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
//create Waypoints, lets say 4 of them, in random cities for Vehicles, around for dudes
if (_infantry) then {
	if (_combat) then {
		[_grp, _pos, 150, 4, "MOVE", "YELLOW", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	} else {
		[_grp, _pos, 150, 4, "MOVE", "CARELESS", "BLUE", "LIMITED", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	};
} else {
	if (surfaceIsWater _pos) then {
		_wpt0 = _grp addWaypoint [_pos, 50, 0, format["WPT0_%1",round time]];
		_wpt1 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 1, format["WPT1_%1",round time]];
		_wpt2 = _grp addWaypoint [(selectRandom WMS_SeaPos), 150, 2, format["WPT2_%1",round time]];
		private _lastPos = (selectRandom WMS_SeaPos);
		if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
			private _findPos = true;
			private _cycles = 100;
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
			private _lastPos = getPos (selectRandom WMS_Roads);
			if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
				private _findPos = true;
				private _cycles = 100;
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
			private _lastPos = getPos (selectRandom WMS_Roads);
			if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
				private _findPos = true;
				private _cycles = 100;
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
			_x setWaypointCompletionRadius 300;
		} else {
			if (surfaceIsWater _pos) then {
				_x setWaypointSpeed "FULL";
			}else{
				_x setWaypointSpeed "LIMITED";
			};
			_x setWaypointCombatMode "BLUE";
			_x setWaypointBehaviour "CARELESS";
		};
	}forEach _waypoints;
};
_waypoints