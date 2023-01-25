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
	["_missionID", "No_ID", [""]]
	];
_objList = [];
_staticsList = [];
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