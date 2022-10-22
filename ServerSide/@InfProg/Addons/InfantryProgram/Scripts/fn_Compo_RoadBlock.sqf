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
// [[0,0,0],_directionRoad,120, 2+random 2, true,50,(0.3+(random 0.55))] call WMS_fnc_Compo_RoadBlock;
//////////////////////////////////////////////////////////////////
/*
private _pos = selectRandom WMS_Pos_Villages; //Or position Trigger
private _nearestRoad = selectRandom (_pos nearRoads 150);
if (count (_pos nearRoads 150) == 0) then {_nearestRoad = [_pos,600,[]] call BIS_fnc_nearestRoad}; 
private _nearestRoadPos = position _nearestRoad; 
_roadConnectedTo = roadsConnectedTo _nearestRoad;  
_connectedRoad = _roadConnectedTo select 0;  
_directionRoad = [_nearestRoad, _connectedRoad] call BIS_fnc_DirTo;
[_nearestRoadPos, _directionRoad, 120, 4, true, 50, 0.7, "army"] call WMS_fnc_Compo_RoadBlock;
*/
if (WMS_IP_LOGs) then {diag_log format ["[ROADBLOCK]|WAK|TNA|WMS| _this = %1", _this];};
private ["_safePos","_objList","_objectCompos","_grps","_objects","_compoRefPoint","_MGgrp1","_MGgrp2","_INFgrp","_number","_sound"];
params[  
		"_pos",  
		["_dirCompo", 359, [0]],  
		["_timer", 600, [0]],  
		["_AIcount", 4,[0]],  
		["_armed", 1,[0]],  //1 MG, 2 AT
		["_launcherChance", 25, [0]],
		["_skill", 0.65,[0]], //(0.4+(random 0.5)
		["_loadout", "bandit", [""]],
 		["_difficulty", "difficult"]
];

_safePos = [_pos, 15, 60, 3, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_findSafePos;
_objList = [];
_grps = [];
_objectCompos = [
	[ //RoadBlock A
		//[WMS_OPFOR_Flag,[0,0,0],0], //WMS_OPFOR_Flag
		["CamoNet_OPFOR_open_F",[0,0,0],90],
		["Land_BagBunker_Small_F",[0,-3.5,-0.1],0],
		["Land_BagBunker_Small_F",[0,3.5,-0.1],180],
		["Land_Razorwire_F",[-5.5,0,0],90],
		["Land_Razorwire_F",[5.5,0,0],270],
		["Land_CzechHedgehog_01_new_F",[-4,8,0],162.011],
		["Land_CzechHedgehog_01_new_F",[4,8,0],258.183],
		["Land_CzechHedgehog_01_new_F",[4,-8,0],17.8069],
		["Land_CzechHedgehog_01_new_F",[-4,-8,0],303.101],
		["Land_CzechHedgehog_01_new_F",[-7,0,0],97.6775],
		["Land_CzechHedgehog_01_new_F",[7,0,0],18.8753]
	],
	[ //RoadBlock B
		//[WMS_OPFOR_Flag,[0,0,0],0], //WMS_OPFOR_Flag
		["Land_CzechHedgehog_01_new_F",[1.6,-7.7,0],17.8],
		["Land_CzechHedgehog_01_new_F",[-5.2,-6.4,0],303.1],
		["Land_CzechHedgehog_01_new_F",[4.1,-5.3,0],18.8],
		["Land_CncBarrier_stripes_F",[0.8,-4.7,0],0],
		["Land_BarGate_01_open_F",[-1.7,-4.8,0],180],
		["Land_CncBarrierMedium4_F",[5.1,0.1,0],90],
		["Land_CncBarrierMedium4_F",[-5.3,0.2,0],90],
		["Land_TentLamp_01_suspended_red_F",[1.1,-6.0,0],322.2],
		["Land_TentLamp_01_standing_F",[-4.9,-4.7,0],233.7],
		["Land_CzechHedgehog_01_new_F",[-1.7,7.7,0],199.1],
		["Land_CzechHedgehog_01_new_F",[5.1,6.3,0],124.4],
		["Land_CzechHedgehog_01_new_F",[-4.2,5.3,0],200.1],
		["Land_CncBarrier_stripes_F",[-1.1,4.6,0],181.3],
		["Land_BarGate_01_open_F",[1.6,4.7,0],1.3],
		["Land_TentLamp_01_suspended_red_F",[-1.2,6.1,0],143.5],
		["Land_TentLamp_01_standing_F",[4.7,4.6,0],55.0],
		["Land_CncBarrier_stripes_F",[3.2,-3.7,0],148.7],
		["Land_CncBarrier_stripes_F",[-3.4,3.6,0],332.4]
	]
];

_objectCompos_AT = [
	[ //RoadBlock AT
		//[WMS_OPFOR_Flag,[0,0,0],0], //WMS_OPFOR_Flag
		[WMS_AI_ATstation,[1,-4.5,0],180],
		[WMS_AI_ATstation,[-1,5.5,0],0],
		["Land_CncBarrier_stripes_F",[0.6,6.3,0],26.3],
		["Land_CncBarrier_stripes_F",[2.5,-5.1,0],148.7],
		["Land_CncBarrier_stripes_F",[-0.6,-5.2,0],207.8],
		["Land_CncBarrier_stripes_F",[-2.5,6,0],327.2],
		["Land_CzechHedgehog_01_new_F",[4.7,-5.7,0],18.9],
		["Land_CzechHedgehog_01_new_F",[4.2,6.9,0],124.4],
		["Land_CzechHedgehog_01_new_F",[-4.7,6.6,0],197.3],
		["Land_CzechHedgehog_01_new_F",[-3.8,-6,0],302.9],
		["Land_HBarrier_3_F",[4.9,-2.3,0],117.2],
		["Land_HBarrier_3_F",[-4.8,3.2,0],295.7],
		["Land_HBarrier_5_F",[5,2.6,0],77.3],
		["Land_HBarrier_5_F",[-4.8,-1.7,0],255.8],
		["Land_PortableLight_double_F",[2.9,-3.1,0],0],
		["Land_PortableLight_double_F",[-2.8,4,0],178.5],
		["Land_TentLamp_01_standing_F",[4.6,6.3,0],55],
		["Land_TentLamp_01_standing_F",[-4.3,-5.4,0],233.5],
		["Land_TentLamp_01_suspended_red_F",[-0.8,6.1,0],144.5],
		["Land_TentLamp_01_suspended_red_F",[1.1,-6,0],322.3]
	]
];
_objects = objNull;
if (_armed==2) then {
	_objects = selectRandom _objectCompos_AT;
		} else {
			_objects = selectRandom _objectCompos;
};
_compoRefPoint = createVehicle [WMS_OPFOR_Flag, _pos, [], 0, "CAN_COLLIDE"];
_compoRefPoint setDir _dirCompo;
_objList pushback _compoRefPoint;
{     
_object = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"];
_objList pushback _object; 
_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
_object setdir _dirCompo + (_x select 2); 
_gradient = surfaceNormal position _object; 
_object setvectorup _gradient;
_object enableSimulationGlobal true; 
_object allowDamage false;
uisleep 0.1;
} forEach _objects;

if (_armed==1) then {
	_MGgrp1 = createGroup [OPFOR, false];
	_grps pushBack _MGgrp1;
	_MGgrp2 = createGroup [OPFOR, false];
	_grps pushBack _MGgrp2;
	WMS_AI_Units_Class createUnit [
		_compoRefPoint modeltoworld [0,3.55,0],
		_MGgrp1
	];
	[units _MGgrp1,'BunkerMG',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	uisleep 0.2;
	_MGgrp1 setFormDir (_dirCompo);
	WMS_AI_Units_Class createUnit [
		_compoRefPoint modeltoworld [0,-1,0], 
		_MGgrp2
	];
	[units _MGgrp2,'BunkerMG',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	_MGgrp2 setFormDir (180 + _dirCompo);
};
if (_armed==2) then {
	_MGgrp1 = createGroup [OPFOR, false];
	_grps pushBack _MGgrp1;
	_MGgrp2 = createGroup [OPFOR, false];
	_grps pushBack _MGgrp2;
	WMS_AI_Units_Class createUnit [
		_compoRefPoint modeltoworld [0,1,0],
		_MGgrp1
	];
	_MGgrp1 addVehicle (_objList select 1);
	((units _MGgrp1) select 0) moveInGunner (_objList select 1);
	[units _MGgrp1,'assault',0,0.9,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	uisleep 0.2;
	_MGgrp1 setFormDir (_dirCompo);
	WMS_AI_Units_Class createUnit [
		_compoRefPoint modeltoworld [0,-3.45,0], 
		_MGgrp2
	];
	_MGgrp2 addVehicle (_objList select 2);
	((units _MGgrp2) select 0) moveInGunner (_objList select 2);
	[units _MGgrp2,'assault',0,0.9,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	_MGgrp2 setFormDir (180 + _dirCompo);
};

if (_AIcount > 0) then {
	_INFgrp = createGroup [OPFOR, false];
	_grps pushBack _INFgrp;
	for "_i" from 1 to _AIcount do {
		WMS_AI_Units_Class createUnit [
			_safePos, 
			_INFgrp
	];
	uisleep 0.2;
	};
	[units _INFgrp,'Assault',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	//[_INFgrp, _Pos, 75, 4, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	if (WMS_DynAI_Steal) then {
		[_INFgrp, _Pos, 75, 4, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
		} else {
		[_INFgrp, _Pos, 75, 4, "MOVE", "COMBAT", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol; //NEW //if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal};
	};
};
if (WMS_DynAI_RdoChatter && !(WMS_FastCombat)) then {
	_number = selectRandom [12,11,2,1,6,8];
	_sound = format ["A3\sounds_f\sfx\radio\ambient_radio%1.wss",_number];
	playSound3D [_sound, player, false, _pos, 2, 1, 0];
};
WMS_DynAI_Running pushback [time,(time+(_timer)),_grps,[],_objList,[],[],"ALARM"];
