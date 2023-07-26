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

//////////////////////////////////////////////////////////////////
private ["_unitsClass","_grps","_INFgrp","_typ","_beh","_cbt","_spd","_fmn","_WPT_1"];
params[ 
	"_pos",
	["_missionID", "No_ID",[""]], //hexaID
	["_grpCount",1, [0]],  
	["_unitsCount", 3, [0]],
	["_wpts", [75,4]],
	["_skill", (0.2+random 0.5), [0]],
	["_unitFunction","Random",[""]],
	["_loadout","bandit",[""]],
	["_behavType","patrol",[""]],
	["_launcherChance", WMS_AMS_LauncherChance,[0]],
	["_difficulty", "Hardcore", [""]]
	];
_grps = [];
_unitsClass = selectRandom WMS_AMS_UnitClass;
_typ = "MOVE"; _beh = "SAFE"; _cbt = "YELLOW"; _spd = "NORMAL"; _fmn = "COLUMN";
switch (toLower _behavType) do {
	case "patrol"		: {_typ = "MOVE"; 	_beh = "AWARE"; 	_cbt = "YELLOW";_spd = "NORMAL"; 	_fmn = "COLUMN"};
	case "cbtpatrol" 	: {_typ = "MOVE"; 	_beh = "COMBAT"; 	_cbt = "RED";	_spd = "LIMITED"; 	_fmn = "STAG COLUMN"};
	case "hide" 		: {_typ = "MOVE"; 	_beh = "STEALTH"; 	_cbt = "YELLOW";_spd = "LIMITED"; 	_fmn = "STAG COLUMN"};
	case "run" 			: {_typ = "MOVE"; 	_beh = "AWARE"; 	_cbt = "RED";	_spd = "FULL"; 		_fmn = "WEDGE"};
	case "chill" 		: {_typ = "SENTRY"; _beh = "SAFE"; 		_cbt = "WHITE"; _spd = "LIMITED"; 	_fmn = "STAG COLUMN"};
	case "rambo" 		: {_typ = "SAD"; 	_beh = "COMBAT"; 	_cbt = "RED"; 	_spd = "FULL"; 		_fmn = "VEE"};
	case "garrison"		: {_typ = "HOLD"; 	_beh = "COMBAT"; 	_cbt = "YELLOW";	_spd = "NORMAL"; 	_fmn = "STAG COLUMN"};
	case "defend"		: {_typ = "SENTRY"; _beh = "COMBAT"; 	_cbt = "YELLOW";	_spd = "NORMAL"; 	_fmn = "STAG COLUMN"};
};
for "_i" from 1 to _grpCount do {
	_INFgrp = createGroup [OPFOR, false];
	_grps pushback _INFgrp;
	for "_i" from 1 to _unitsCount do {
		_randomPos = [_pos, 0, (_wpts select 0), 1, 0, 0, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
		//[center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
		_unitsClass createUnit [_randomPos, _INFgrp];
		//uisleep 0.2;
	};
	//if !(WMS_HeadlessOwnerID == 2) then {_INFgrp setGroupOwner WMS_HeadlessOwnerID};
	//if (HC1 in allPlayers) then {_INFgrp setGroupOwner (owner HC1)};
};
{
	if (_behavType == "random") then {_behavType = (selectRandom ["patrol","defend","hide"])};
	//[(units _x),_unitFunction,_LauncherChance,_skill,_difficulty,_loadout] call WMS_fnc_AMS_SetUnits;
	//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
	[(units _x),_unitFunction,_LauncherChance,_skill,_difficulty,_loadout,nil,"AMS"] call WMS_fnc_SetUnits;
	if (_behavType == ("defend")) then {	
		_WPT_1 = _x addWaypoint [_pos, 50];
		_WPT_1 setWaypointType _typ;
		_WPT_1 setwaypointSpeed _spd;
		_WPT_1 setWaypointCombatMode _cbt;
		_WPT_1 setWaypointbehaviour  _beh;
		[_x] call CBA_fnc_taskDefend;
	} else {
		if (_behavType == ("garrison")) then {
			_WPT_1 = _x addWaypoint [_pos, 50];
			_WPT_1 setWaypointType _typ;
			_WPT_1 setwaypointSpeed _spd;
			_WPT_1 setWaypointCombatMode _cbt;
			_WPT_1 setWaypointbehaviour  _beh;
			[_x, _Pos] call WMS_fnc_AMS_CBAgarrissonModified;
		} else {
			if (WMS_AMS_Steal && {_difficulty == "Hardcore"} && {50 < random 100}) then {
				[_x, _Pos, (_wpts select 0), (_wpts select 1), _typ, _beh, _cbt, _spd, _fmn, "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
			} else {
				[_x, _Pos, (_wpts select 0), (_wpts select 1), _typ, _beh, _cbt, _spd, _fmn, "", [1,2,3]] call CBA_fnc_taskPatrol;
			};
		};
	};	
	{_x setVariable ["AMS_MissionID",_missionID,true]}forEach (units _x);
}forEach _grps;
if (WMS_IP_LOGs) then {diag_log format ["[AMS GROUP]|WAK|TNA|WMS| return _grps: %1,", _grps]};
_grps