
/*
	After many years using the trusty CBA_fnc_taskPatrol, I had to make "my own" since CBA_fnc_taskPatrol prevent me to use it on HC with "non Local" groups (group setGroutpOwner HC).
	"if !(local _group) exitWith {}; // Don't create waypoints on each machine" CBA_fnc_taskPatrol line 45
*/
private ["_Grp","_step","_offset","_rad","_heading","_WPT","_WPT_Cycle"];
params [
	"_units", //the difference is there
	["_Pos",[worldsize/2,worldsize/2,0]],
	["_radius",150],
	["_wptscnt",4],
	["_wptype","MOVE"],
	["_wpbeha","AWARE"],
	["_wpcbtm","YELLOW"],
	["_wpspeed","NORMAL"],
	["_wpform","STAG COLUMN"],
	["_wpcode",""],
	["_wptimeout",[1,2,3]],
	["_wptcomprad",7.5]
];
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_waypoints_Patrol] _this = %1', _this]};

_grp = grpNull;
if (typeName _units == "ARRAY") then {
	_grp = group (_units select 0);
}else{
	if (typeName _units == "GROUP") then {
		_grp = _units;
	};
};
if (isNull _grp) exitWith {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_waypoints_Patrol]Exiting Function, no group. _units = %1', _units]};

for "_i" from 1 to count (waypoints _grp) do {
	deleteWaypoint [_grp,0];
};

_step = 360 / _wptscnt; //From CBATeam
_offset = random _step; //From CBATeam

_WPT = _Grp addWaypoint [_Pos, _radius];
_WPT setWaypointType _wptype;
_WPT setWaypointBehaviour _wpbeha;
_WPT setWaypointCombatMode _wpcbtm;
_WPT setWaypointSpeed _wpspeed;
_WPT setWaypointFormation _wpform;
_WPT setWaypointStatements ["TRUE", _wpcode];
_WPT setWaypointTimeout _wptimeout;
_WPT setWaypointCompletionRadius _wptcomprad;

for "_i" from 1 to _wptscnt-1 do {
	_rad = _radius * random [0.25, 0.75, 1]; //From CBATeam
	//_heading = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i; //From CBATeam, I guess it's a very scientific way to get a heading
    _heading = random 359; //From CBATeam, I guess it's a very scientific way to get a heading
	_PosN = _Pos getPos [_rad, _heading];
	_WPT = _Grp addWaypoint [_PosN, _radius];
	_WPT setWaypointType _wptype;
	_WPT setWaypointBehaviour _wpbeha;
	_WPT setWaypointCombatMode _wpcbtm;
	_WPT setWaypointSpeed _wpspeed;
	_WPT setWaypointFormation _wpform;
	_WPT setWaypointStatements ["TRUE", _wpcode];
	_WPT setWaypointTimeout _wptimeout;
	_WPT setWaypointCompletionRadius _wptcomprad;	
};

_rad = _radius * random [0.25, 0.75, 1]; //From CBATeam
//_heading = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i; //From CBATeam, I guess it's a very scientific way to get a heading
_heading = random 359; //From CBATeam, I guess it's a very scientific way to get a heading
_PosN = _Pos getPos [_rad, _heading];
_WPT_Cycle = _Grp addWaypoint [_PosN, 10];     
_WPT_Cycle setWaypointType "CYCLE";     
_WPT_Cycle setWaypointCombatMode "NO CHANGE";     
_WPT_Cycle setWaypointbehaviour  "UNCHANGED";
	
if (true) then {diag_log format ['|WAK|TNA|WMS|[WMS_fnc_waypoints_Patrol]Group = %1, owner = %2, waypoints = %3', _grp, (owner (leader _grp)), waypoints _grp]};