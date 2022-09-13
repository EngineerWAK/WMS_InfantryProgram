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

private [];
params [
	"_grps",
	"_pos"
];
//if (WMS_IP_LOGs) then {diag_log format ["[AMS CALLBACK GROUPS]|WAK|TNA|WMS| _this = %1", _this]};
if (true) then {diag_log format ["[AMS CALLBACK GROUPS]|WAK|TNA|WMS| _this = %1", _this]};

{
	while {(count (waypoints _x)) > 0} do
	{
		deleteWaypoint ((waypoints _x) select 0);
	};
	/*Works with plane
	(_plane select 2) addWaypoint [[100,100,_altitude], 0];
	[(_plane select 2), 0] setWaypointBehaviour "SAFE";
	[(_plane select 2), 0] setWaypointCombatMode "BLUE";
	[(_plane select 2), 0] setWaypointSpeed "FULL";
	_unit doMove [100,100,_altitude];
	*/
	_grp = _x;
	_units = units _grp;
	_newWaypoint = _grp addwaypoint [_pos,30,0];
	_newWaypoint setWaypointType "HOLD";
	_newWaypoint setWaypointBehaviour "SAFE"; // the group will change behaviour to Aware upon detecting an enemy unit.
	_newWaypoint setWaypointCombatMode "WHITE"; //Hold Fire, Engage At Will
	_newWaypoint setWaypointSpeed "FULL";
	{
		{
			_grp forgetTarget _x
		}forEach  (_x targets [true]);
		_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
		_x doMove _pos;
	}forEach _units;
	//(leader _grp) doMove _pos;
	_grp setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
	//if (WMS_IP_LOGs) then {diag_log format ["[AMS CALLBACK GROUPS]|WAK|TNA|WMS| Group = %1 @ %4 | newWaypoint = %2 @ %3", _x, _newWaypoint, _pos, (position(leader _x))]};
	if (true) then {diag_log format ["[AMS CALLBACK GROUPS]|WAK|TNA|WMS| Group = %1 @ %4 | newWaypoint = %2 @ %3", _x, _newWaypoint, _pos, (position(leader _x))]};
}forEach _grps;

