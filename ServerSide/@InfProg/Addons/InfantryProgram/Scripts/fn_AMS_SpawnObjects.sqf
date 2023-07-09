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
if (WMS_IP_LOGs) then {diag_log format ["[AMS SPAWN OBJECTS]|WAK|TNA|WMS| _this: %1,", _this]};
private ["_staticsList","_objList","_compoRefPoint","_object","_objectVectoriel","_gradient"];
params[  
	"_pos",
	"_objects",  
	["_dirCompo", 359, [0]],
	["_missionID", "No_ID", [""]],
	["_radius", 10, [0]]
	];
_objList = [];
_staticsList = [];
if (typeName _objects != "STRING") then {
	if (true) then {diag_log format ["[AMS SPAWN OBJECTS ERROR]|WAK|TNA|WMS|1st log _this: %1,", _this]};
	_objects = "missiontest1";
};
if (WMS_AMS_CleanMapObj) then {
	if !(_objects in ["occupation","Factory","cbtpatrol","bastogne","forestcamp"]) then {
		_objectsToDespawn = ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE","BUNKER","FOUNTAIN", "FENCE", "WALL", "HIDE", "BUSSTOP", "FOREST", "STACK", "RUIN", "TOURISM", "ROCK", "ROCKS", "RAILWAY"];
		_terrainobjects = nearestTerrainObjects [_pos,_objectsToDespawn,(_radius*1.5)];
		{hideObjectGlobal _x} foreach _terrainobjects;
	};
};
switch (_objects) do {
	case "missiontest1"		: {_objects = [["CamoNet_OPFOR_open_F",[0,0,0],90]]};
	case "missiontest2"		: {_objects = WMS_AMS_Obj_GuardedTower};

	case "ArmedBandits"		: {_objects = WMS_AMS_Obj_ArmedBandits};
	case "C192Crash"		: {_objects = WMS_AMS_Obj_C192Crash};
	case "AmazonWH"			: {_objects = WMS_AMS_Obj_AmazonWH};
	case "TransmissionTower": {_objects = WMS_AMS_Obj_TransmissionTower};
	case "GunsX3"			: {_objects = WMS_AMS_Obj_GunsX3};
	case "Arena"			: {_objects = WMS_AMS_Obj_Arena};
	case "Factory"			: {_objects = WMS_AMS_Obj_FactoryCamp};
	case "CkpCharlie"		: {_objects = WMS_AMS_Obj_CkpCharlie}; //WTF? where is this one from??
	case "AdvancedCamp"		: {_objects = WMS_AMS_Obj_AdvancedCamp};
	case "HeliSteal"		: {_objects = WMS_AMS_Obj_HeliSteal};
	case "HeliStealV2"		: {_objects = WMS_AMS_Obj_HeliStealV2};
	case "Arbeit"			: {_objects = WMS_AMS_Obj_Arbeit};
	case "ArbeitV2"			: {_objects = WMS_AMS_Obj_ArbeitV2};
	case "ArbeitV3"			: {_objects = WMS_AMS_Obj_ArbeitV3};
	case "AABattery"		: {_objects = WMS_AMS_Obj_AABattery};
	case "Escobar"			: {_objects = WMS_AMS_Obj_Escobar};
	case "Forgotten"		: {_objects = WMS_AMS_Obj_Forgotten};
	case "Radar"			: {_objects = WMS_AMS_Obj_Radar};
	case "Construction"		: {_objects = WMS_AMS_Obj_Construction};
	case "ConstructionV2"	: {_objects = WMS_AMS_Obj_ConstructionV2};
	case "OldTemple"		: {_objects = WMS_AMS_Obj_OldTemple};
	case "LumberYard"		: {_objects = WMS_AMS_Obj_LumberYard};
	case "LumberYard_v2"	: {_objects = WMS_AMS_Obj_LumberYard_v2};
	case "LumberYard_v3"	: {_objects = WMS_AMS_Obj_LumberYard_v3};
	case "LumberYard_v4"	: {_objects = WMS_AMS_Obj_LumberYard_v4};
	case "GrandPaJoe"		: {_objects = WMS_AMS_Obj_GrandPaJoe};
	case "GrandPaJoe_v2"	: {_objects = WMS_AMS_Obj_GrandPaJoe_v2};
	case "FieldHospital"	: {_objects = WMS_AMS_Obj_FieldHospital};
	case "FieldHospital2"	: {_objects = WMS_AMS_Obj_FieldHospital2};
	case "FieldHospital3"	: {_objects = WMS_AMS_Obj_FieldHospital3};
	case "thecommunity"		: {_objects = WMS_AMS_Obj_TheCommunity};
	case "thecommunity2"	: {_objects = WMS_AMS_Obj_TheCommunity2};
	case "occupation"		: {_objects = []}; //occupation use named locations building as layout
	case "cbtpatrol"		: {_objects = []};
	case "strelnikovtrain"	: {_objects = WMS_AMS_Obj_Train}; //Moved to C for reward
	case "strelnikovtrain2"	: {_objects = WMS_AMS_Obj_Train2}; //Moved to C for reward
	case "bastogne"			: {_objects = WMS_AMS_Obj_Bastogne}; //Forest spawn
	case "blackhawk"		: {_objects = WMS_AMS_Obj_BHD};
	case "blackhawk_v2"		: {_objects = WMS_AMS_Obj_BHD2};
	case "homedepot"		: {_objects = WMS_AMS_Obj_HomeDepot};
	case "forestcamp" 		: {_objects = WMS_AMS_Obj_ForestCamp};
	case "OldPowerPlant"	: {_objects = WMS_AMS_Obj_OldPowerPlant};
	case "Object172M"		: {_objects = WMS_AMS_Obj_Object172M};
	case "uncleabrams"		: {_objects = WMS_AMS_Obj_UncleAbrams};
	case "arbeit"			: {_objects = WMS_AMS_Obj_Arbeit};
	case "arbeitv2"			: {_objects = WMS_AMS_Obj_ArbeitV2};
	case "arbeitv3"			: {_objects = WMS_AMS_Obj_ArbeitV3};
	case "EnemyBunker"		: {_objects = WMS_AMS_Obj_EnemyBunker};
	case "EnemyBunkerV2"	: {_objects = WMS_AMS_Obj_EnemyBunkerV2};
	case "JunkYard"			: {_objects = WMS_AMS_Obj_JunkYard};
	case "JunkYard_v2"		: {_objects = WMS_AMS_Obj_JunkYard_v2};
	case "Market"			: {_objects = WMS_AMS_Obj_Market};
	case "Market_v2"		: {_objects = WMS_AMS_Obj_Market_v2};
	case "shipyard"			: {_objects = WMS_AMS_Obj_Shipyard};
	case "shipyard2"		: {_objects = WMS_AMS_Obj_Shipyard2};
	case "commsrelay"		: {_objects = WMS_AMS_Obj_Comms};
	//OUTPOSTS
	case "OutpostAlpha"		: {_objects = WMS_AMS_Obj_OutpostAlpha};
	case "OutpostBravo"		: {_objects = WMS_AMS_Obj_OutpostBravo};
	case "OutpostCharlie"	: {_objects = WMS_AMS_Obj_OutpostCharlie};
	case "OutpostDelta"		: {_objects = WMS_AMS_Obj_OutpostDelta};
	case "OutpostDeltaV2"	: {_objects = WMS_AMS_Obj_OutpostDeltaV2};
	case "OutpostEcho"		: {_objects = WMS_AMS_Obj_OutpostEcho};
	case "OutpostFoxtrot"	: {_objects = WMS_AMS_Obj_OutpostFoxtrot};
	case "OutpostGolf"		: {_objects = WMS_AMS_Obj_OutpostGolf};
	case "OutpostGolfV2"	: {_objects = WMS_AMS_Obj_OutpostGolfV2};
};
if (typeName _objects == "STRING") then {
	if (true) then {diag_log format ["[AMS SPAWN OBJECTS ERROR]|WAK|TNA|WMS|2nd log _this: %1,", _this]};
	_objects = [["CamoNet_OPFOR_open_F",[0,0,0],90]];
};

_compoRefPoint = createVehicle [WMS_AMS_Flag, _pos, [], 0, "CAN_COLLIDE"];
_objList pushback _compoRefPoint;
_compoRefPoint setDir _dirCompo;
_compoRefPoint setVariable ["AMS_MissionID",_missionID,true];
{    
	//_object = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"];
	_object = createVehicle [(_x select 0), [0,0,4000], [], 0, "CAN_COLLIDE"];
	_object setdir _dirCompo + (_x select 2);
	_objList pushback _object; 
	_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
	_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
	_gradient = surfaceNormal position _object;
	_object setvectorup _gradient;
	_object allowDamage false;
	_object enableSimulationGlobal true;
	if ((count _x) > 3 && {(_x select 3) == "flat"}) then {
		//do not align this object
		_object setVectorUp [0,0,1];
	};
	if ((count _x) > 3 && {(_x select 3) == "damageFlat"}) then { 
		_object allowDamage true;
		_object setVectorUp [0,0,1];
	};
	if ((count _x) > 3 && {(_x select 3) == "damage"}) then { 
		_object allowDamage true;
	};
	if ((count _x) > 3 && {(_x select 3) == "static"}) then { 
		_staticsList pushBack _object;
		_object allowDamage true;
		//here create the dynamic skill set "static" with a "getin" and "getOut" EH
		_object addEventHandler ["GetIn", {
			params ["_vehicle", "_role", "_unit", "_turret"];
			if (WMS_IP_LOGs) then {diag_log format ["[AMS STATICS]|WAK|TNA|WMS| %1 Get IN %2", _unit, (typeOf _vehicle)]};
			if !(isPlayer _unit) then {
				_skills = WMS_AMS_skillstatic;
				_unit setSkill ["spotDistance", 	(_skills select 0)];
				_unit setSkill ["spotTime", 		(_skills select 1)];
				_unit setSkill ["aimingAccuracy", 	(_skills select 2)];
				_unit setSkill ["aimingShake", 		(_skills select 3)];
				_unit setSkill ["aimingSpeed", 		(_skills select 4)];
				_unit setSkill ["reloadSpeed", 		(_skills select 5)];
				_unit setSkill ["courage", 			(_skills select 6)];
				_unit setSkill ["commanding", 		(_skills select 7)];
				_unit setSkill ["general", 			(_skills select 8)];
				_unit setVariable ["WMS_Static", true, false];
				_unit setVariable ["WMS_StaticObj", _vehicle, false];
				if (WMS_IP_LOGs) then {diag_log format ["[AMS STATICS]|WAK|TNA|WMS| %1 new Skills %2", _unit, _skills]};
			};
		}];
		_object addEventHandler ["GetOut", {
			params ["_vehicle", "_role", "_unit", "_turret"];
			if (WMS_IP_LOGs) then {diag_log format ["[AMS STATICS]|WAK|TNA|WMS| %1 Get OUTt %2", _unit, (typeOf _vehicle)]};
			if !(isPlayer _unit) then {
				_skills = _unit getVariable ["WMS_skills",[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]];	
				_unit setSkill ["spotDistance", 	(_skills select 0)];
				_unit setSkill ["spotTime", 		(_skills select 1)];
				_unit setSkill ["aimingAccuracy", 	(_skills select 2)];
				_unit setSkill ["aimingShake", 		(_skills select 3)];
				_unit setSkill ["aimingSpeed", 		(_skills select 4)];
				_unit setSkill ["reloadSpeed", 		(_skills select 5)];
				_unit setSkill ["courage", 			(_skills select 6)];
				_unit setSkill ["commanding", 		(_skills select 7)];
				_unit setSkill ["general", 			(_skills select 8)];
				if (WMS_IP_LOGs) then {diag_log format ["[AMS STATICS]|WAK|TNA|WMS| %1 new Skills %2", _unit, _skills]};
			};	
		}];
	};
} forEach _objects;
_compoRefPoint setVariable ["AMS_MissionStatus","RUNNING",true];
_compoRefPoint setVariable ["AMS_MissionID",_missionID,true];
_compoRefPoint setVariable ["WMS_StaticsList", _staticsList];
if (WMS_IP_LOGs) then {diag_log format ["[AMS OBJECTS]|WAK|TNA|WMS| setVariable _staticsList: %1", _staticsList]};
if (WMS_IP_LOGs) then {diag_log format ["[AMS OBJECTS]|WAK|TNA|WMS| return _objList: %1", _objList]};
_objList