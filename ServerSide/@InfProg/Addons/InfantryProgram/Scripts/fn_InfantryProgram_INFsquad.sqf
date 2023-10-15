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

//////////
//[_target,_pos,_soldiersInTheGrp,_patrolLoadout,_patrolTimer,_distanceWPT,_missionType,_vhl]call WMS_fnc_InfantryProgram_INFsquad
//[_target,_startPatrolPos,(round(2+(random 3))),_patrolLoadout,600,250,_missionType,_vhl] call WMS_fnc_InfantryProgram_INFsquad;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[INFANTRY SQUAD]|WAK|TNA|WMS| _this = %1", _this]};
private ["_backpackChance","_launcherChance","_googleChance","_mkrType","_mkrColor","_PatrolVRmkr","_chopperPos","_GrpPatrol","_leaderGrp"];
params[  
	"_target",
	"_startPatrolPos",
	"_vhl",
	["_missionType", "INFbyChopper",[""]],
	["_soldiersInTheGrp", 5, [0]],
	["_patrolLoadout", WMS_Loadout_AOR2],
	["_patrolTimer", 600, [0]],  
	["_distanceWPT", 100, [0]]
      
];
_backpackChance = 75;
_launcherChance = 50;
_googleChance = 50;
_mkrType = "b_inf"; 
_mkrColor = "colorGreen";
_PatrolVRmkr = objNull;
_chopperPos = position (_vhl select 0);
_GrpPatrol = [_chopperPos, BLUFOR, _soldiersInTheGrp] call BIS_fnc_spawnGroup;
_leaderGrp = Leader _GrpPatrol;

WMS_INFsquad_LastTime = time;
publicVariable "WMS_INFsquad_LastTime";

if (_missionType == "INFbyChopper") then {
	{_x moveInCargo (_vhl select 0)} forEach units _GrpPatrol;
	
	diag_log format ["[INFANTRY SQUAD]|TNA|TNA|TNA|TNA|TNA| _missionType = %1", _missionType];
	} else {};

private _randomPos = [_target, (_distanceWPT/2), (_distanceWPT*1.2), 1, 0, 0, 0] call BIS_fnc_findSafePos; 
private _randomPos2 = [_randomPos, (_distanceWPT/2), (_distanceWPT*1.2), 1, 0, 0, 0] call BIS_fnc_findSafePos;


private _uniforms = _patrolLoadout select 0;
private _vests = _patrolLoadout select 1;
private _helmets = _patrolLoadout select 2;
private _backpacks = _patrolLoadout select 3;
private _googles = _patrolLoadout select 4;
private _weapsLoadouts =  [WMS_Loadout_Assault, WMS_Loadout_DMR, WMS_Loadout_MG, WMS_Loadout_Sniper, WMS_Loadout_SMG];
private _pistols = (WMS_Loadout_Assault select 3);
private _launchers = ["launch_RPG7_F"];
private _grenades = ["HandGrenade"];
private _scopes = ["hlc_optic_HensoldtZO_lo_Docter","BWA3_optic_ZO4x30i_MicroT2","optic_DMS","BWA3_optic_PMII_ShortdotCC"];

{ //DEPRECATED
	removeAllItems _x;
	removeAllWeapons _x;
	removeVest _x;
	removeBackpackGlobal _x;
	_x forceaddUniform selectrandom _uniforms;
	_x addVest selectrandom _vests;
	_x addHeadGear selectrandom _helmets;

	if((random 100) <= _googleChance) then { _x addGoggles selectrandom _googles; };
	if((random 100) <= _backpackChance) then { _x addBackpack selectrandom _backpacks; };
	if((random 100) <= _launcherChance) then
		{
			removeBackpackGlobal _x;
			_x addBackpack selectrandom _backpacks;
			private _launcher = [_x, selectrandom _launchers, 2] call BIS_fnc_addWeapon;
		};

	private _mainWeapLoadouts =  [(WMS_Loadout_Assault select 0), (WMS_Loadout_DMR select 0), (WMS_Loadout_MG select 0), (WMS_Loadout_Sniper select 0), (WMS_Loadout_SMG select 0)];
	private _mainWeaps = (selectrandom _mainWeapLoadouts);
	private _mainWeap = [_x, selectrandom _mainWeaps, 5, 1] call BIS_fnc_addWeapon;
	_x addPrimaryWeaponItem selectrandom _scopes;
	private _pistol = [_x, selectrandom _pistols, 2] call BIS_fnc_addWeapon;

	_x additem "FirstAidKit";
	_x additem selectrandom _grenades;
	_x additem selectrandom _grenades;
	_x additem selectrandom _grenades;
	
	_PatrolVRmkr = createVehicle ["VR_Area_01_square_1x1_grey_F",[0,0,0], [], 10];
	_PatrolVRmkr setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,0.15)"];
	_PatrolVRmkr attachTo [_x,[0,0,0]];
	
	//holyFuck, need an addEventHandler "killed" here xD
	0 = [_x,_PatrolVRmkr] spawn {
		waituntil {!(alive (_this select 0))};
		deletevehicle (_this select 1);
		removeAllItems (_this select 0);
		removeAllWeapons (_this select 0);
		removeVest (_this select 0);
		removeBackpackGlobal (_this select 0);
		private _pos = getPosATL (_this select 0);
		private _grave = "Land_Grave_dirt_F" createVehicle [(_pos select 0),(_pos select 1),0];
		uisleep 5;
		deleteVehicle (_this select 0);
	};
} forEach units _GrpPatrol ;

private _WPT_inf = _GrpPatrol addWaypoint [_startPatrolPos, 0];     
_WPT_inf setWaypointType "GETOUT";

private _WPT_inf_T = _GrpPatrol addWaypoint [position _target, 5]; 
_WPT_inf_T setWaypointType "MOVE";
_WPT_inf_T setWaypointCombatMode "RED";     
_WPT_inf_T setWaypointbehaviour  "AWARE";

private _WPT_inf_1 = _GrpPatrol addWaypoint [_startPatrolPos, 0]; 
_WPT_inf_1 setWaypointType "MOVE";      //SENTRY TEST
_WPT_inf_1 setWaypointCombatMode "RED";     
_WPT_inf_1 setWaypointbehaviour  "SAFE";   

private _WPT_inf_2 = _GrpPatrol addWaypoint [_randomPos, 10];     
_WPT_inf_2 setWaypointType "MOVE";      
_WPT_inf_2 setWaypointCombatMode "RED";     
_WPT_inf_2 setWaypointbehaviour  "SAFE";

private _WPT_inf_3 = _GrpPatrol addWaypoint [_randomPos2, 10];     
_WPT_inf_3 setWaypointType "CYCLE";      
_WPT_inf_3 setWaypointCombatMode "RED";     
_WPT_inf_3 setWaypointbehaviour  "SAFE";

private _markerPos = _startPatrolPos;  
private _markerName = "INF_" + (str _markerPos); 
private _INFMarker1 = createMarker [_markerName, _markerPos];    
_INFMarker1 setMarkerShape "ICON";
_INFMarker1 setMarkerType _mkrType; 
_INFMarker1 setMarkercolor _mkrColor;

private _markerPos2 = _startPatrolPos;  
private _markerName2 = "INF_2_" + (str _markerPos); 
private _INFMarker2 = createMarker [_markerName2, _markerPos2];    
_INFMarker2 setMarkerShape "RECTANGLE";
_INFMarker2 setMarkerBrush "Border"; 
_INFMarker2 setMarkerSize [_distanceWPT, _distanceWPT];
_INFMarker2 setMarkerType "select"; 
_INFMarker2 setMarkercolor _mkrColor;
_INFMarker2 setMarkerAlpha 1;

[_GrpPatrol, _patrolTimer] spawn {    
uisleep (round((_this select 1)+(random(_this select 1))));
{_x setdamage 1;} forEach units (_this select 0);   
};

[_GrpPatrol, _markerName, _markerName2, _WPT_inf_1, _WPT_inf_2, _WPT_inf_3,_WPT_inf,_WPT_inf_T] spawn {
waituntil {isnull (_this select 0)};
//[_group,[_vehicles],[_markers],[_waypoint]] call WMS_fnc_Ivl2_cleanup;
[(_this select 0),[],[(_this select 1),(_this select 2)],[(_this select 3),(_this select 4),(_this select 5),(_this select 6),(_this select 7)]] call WMS_fnc_lvl2_cleanup;
};
