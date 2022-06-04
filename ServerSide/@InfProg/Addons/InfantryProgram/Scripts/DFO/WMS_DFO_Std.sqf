/**
* WMS_DFO_Standalone.sqf - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
WMS_fnc_BIS_FindSafePosModified = { //I "modified" this BIS function to get position INSIDE the map and not kilometers away outside, it's one line, was it sooooo difficult bohemia ??
	/*
	Author: 
		Joris-Jan van 't Land, optimised by Killzone_Kid

	Description:
		Function to generate position in the world according to several parameters.

	Parameters:
		0: (Optional) ARRAY - center position
				Note: passing [] (empty Array), the world's "safePositionAnchor" entry will be used.
				
		1: (Optional) NUMBER - minimum distance from the center position
		2: (Optional) NUMBER - maximum distance from the center position
				Note: passing -1, the world's "safePositionRadius" entry will be used.
				
		3: (Optional) NUMBER - minimum distance from the nearest object
		4: (Optional) NUMBER - water mode
				0 - cannot be in water
				1 - can either be in water or not
				2 - must be in water
						
		5: (Optional) NUMBER - maximum terrain gradient (hill steepness)
		6: (Optional) NUMBER - shore mode:
				0 - does not have to be at a shore
				1 - must be at a shore
						
		7: (Optional) ARRAY - black listed areas in format [area1, area2, area3, ...areaN], where area is: 
				ARRAY - array in format [topLeftCorner, bottomRightCorner]
				or
				OBJECT - trigger area
				STRING - marker area
				LOCATION - location area
				ARRAY - array in format [center, distance] or [center, a, b, angle, rect] or [center, a, b, angle, rect, height]
						
		8: (Optional) ARRAY - array in format [landPosition, seaPosition], where:
				landPosition: ARRAY - in format [x,y] or [x,y,z] - default position on land
				seaPosition: ARRAY - in format [x,y] or [x,y,z] - default position on water
	
	Returns:
		ARRAY - position solution
		
	*/

	#define MAX_TRIES 3000

	scopeName "main";

	params [
		["_checkPos",[]], 
		["_minDistance",0], 
		["_maxDistance",-1], 
		["_objectProximity",0],
		["_waterMode",0], 
		["_maxGradient",0], 
		["_shoreMode",0], 
		["_posBlacklist",[]],
		["_defaultPos",[]]
	];
	// support object for center pos as well
	if (_checkPos isEqualType objNull) then {_checkPos = getPos _checkPos};
	/// --- validate input
	//#include "..\paramsCheck.inc"
	/*#include "\a3\functions_f\paramsCheck.inc"
	#define arr1 [_checkPos,_minDistance,_maxDistance,_objectProximity,_waterMode,_maxGradient,_shoreMode,_posBlacklist,_defaultPos]
	#define arr2 [[],0,0,0,0,0,0,[],[]]
	paramsCheck(arr1,isEqualTypeParams,arr2)*/

	private _defaultMaxDistance = worldSize / 2;
	private _defaultCenterPos = [_defaultMaxDistance, _defaultMaxDistance, 0];
	private _fnc_defaultPos = 
	{
		_defaultPos = _defaultPos param [parseNumber _this, []];
		if !(_defaultPos isEqualTo []) exitWith {_defaultPos};
		_defaultPos = getArray (configFile >> "CfgWorlds" >> worldName >> "Armory" >> ["positionStart", "positionStartWater"] select _this);
		if !(_defaultPos isEqualTo []) exitWith {_defaultPos};
		_defaultPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
		if !(_defaultPos isEqualTo []) exitWith {_defaultPos};
		_defaultCenterPos
	};
	if (_checkPos isEqualTo []) then
	{
		_checkPos = getArray (configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
		if (_checkPos isEqualTo []) then {_checkPos = _defaultCenterPos};
	};
	if (_maxDistance < 0) then 
	{
		_maxDistance = getNumber (configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
		if (_maxDistance <= 0) then {_maxDistance = _defaultMaxDistance};
	};
	private _checkProximity = _objectProximity > 0;
	private _checkBlacklist = !(_posBlacklist isEqualTo []);
	_shoreMode = _shoreMode != 0;
	if (_checkBlacklist) then
	{
		_posBlacklist = _posBlacklist apply 
		{
			// top-left, bottom-right coordinates 
			if (_x isEqualTypeParams [[],[]]) then 
			{
				_x select 0 params [["_x0", 0], ["_y0", 0]];
				_x select 1 params [["_x1", 0], ["_y1", 0]];
				private _a = (_x1 - _x0) / 2;
				private _b = (_y0 - _y1) / 2;
				[[_x0 + _a, _y0 - _b], abs _a, abs _b, 0, true]
			}
			else
			{
				// other area compatible formats
				_x call BIS_fnc_getArea
			};
		};
	};
	private _off = (_minDistance / _maxDistance) ^ 2;
	private _rem = 1 - _off;
	private _gradientRadius = 1 max _objectProximity * 0.1;
	for "_i" from 1 to MAX_TRIES do
	{
		_checkPos getPos [_maxDistance * sqrt (_off + random _rem), random 360] call
		{
			//Added this crap shit filter to prevent position to be selected OUTSIDE of the map
			if (_this select 0 < 0 || _this select 1 < 0 || _this select 0 > worldSize || _this select 1 > worldSize)exitWith {
				//Just for fun xD
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_FindSafePos  %1', _this]};
			};
			// position is roughly suitable
			if (_this isFlatEmpty [-1, -1, _maxGradient, _gradientRadius, _waterMode, _shoreMode] isEqualTo []) exitWith {};
			// away from other objects
			if (_checkProximity && {!(nearestTerrainObjects [_this, [], _objectProximity, false, true] isEqualTo [])}) exitWith {};	
			// not inside something
			if !(lineIntersectsSurfaces [AGLtoASL _this, AGLtoASL _this vectorAdd [0, 0, 50], objNull, objNull, false, 1, "GEOM", "NONE"] isEqualTo []) exitWith {};
			// not in blacklist
			if (_checkBlacklist && {{if (_this inArea _x) exitWith {true}; false} forEach _posBlacklist}) exitWith {};
		
			_this select [0, 2] breakOut "main";
		};
	};
	// search failed, try default position
	(_waterMode != 0) call _fnc_defaultPos 
};
WMS_fnc_CollectPos = { //at server launch
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_CollectPos time %1', time]};
	private _worldCenter 	= [worldsize/2,worldsize/2,0]; 
	private _worldDiameter 	= ((worldsize/2)*1.413);
	if (WMS_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting LOCALS positions'};
	{WMS_Pos_Locals pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameLocal"],_worldDiameter]);
	if (WMS_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting VILLAGES positions'};
	{WMS_Pos_Villages pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameVillage"],_worldDiameter]);
	if (WMS_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting CITIES positions'};
	{WMS_Pos_Cities pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameCity"],_worldDiameter]);
	if (WMS_DFO_LOGs) then {Diag_log '|WAK|TNA|WMS|[AL] collecting CAPITALS positions'};
	{WMS_Pos_Capitals pushback getPos _x}forEach (nearestLocations [_worldCenter, ["nameCityCapital"],_worldDiameter]);
};
WMS_fnc_ScanForWater = { //this one will be a tricky one
	if (WMS_DFO_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_ScanForWater start scanning %1', time]};
	params [
		["_resolution", 1000], //1km resolution
		["_closeLand", true] //thats pretty hardcore on server for few seconds if a lot of water but it's worth it
	];
	private _size = worldSize;
	private _divide = (round (_size/_resolution))-1;
	private _steps = []; //[1000,2000,3000,4000,5000,6000,7000,8000] for a 8km map 1000m resolution
	private _step = _resolution;
	private _scanPos = [_resolution,_resolution];
	for "_i" from 1 to _divide do {
		_steps pushback _step;
		_step = _step+_resolution;
	};
	{
		private _Xaxis = _x;
		{
			_scanPos = [_Xaxis,_x,0];
			if (surfaceIsWater _scanPos && {((ATLtoASL _scanPos) select 2) <= -3}) then {
				if (_closeLand) then {
					private _land = nearestTerrainObjects [_scanPos,["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE","ROAD"],1500];
					if (count _land != 0) then {WMS_SeaPos pushback _scanPos};
				}else{
					WMS_SeaPos pushback _scanPos;
				};
			};
		}forEach _steps; //this steps become Y axis
	}forEach _steps; //this steps become X axis
	if (WMS_DFO_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_ScanForWater Scan finished  %1, %2 positions found', time, count WMS_SeaPos]};
	(count WMS_SeaPos)
};
WMS_fnc_FindRoad = { //at server launch
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_FindRoad time %1', time]};
	private _arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
	if (count _arrayOfPos == 0) exitWith {if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_FindRoad _arrayOfPos IS EMPTY %1', time]};};
	if (true) then {_arrayOfPos+WMS_Pos_Locals}; 
	{
		_roads = _x nearRoads 150;
		if (count _roads != 0) then {
			_road = selectRandom _roads;
			WMS_Roads pushBack _road;
		}else{
			if (WMS_DFO_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_FindRoad no road around %1', _x]};
		};
	}forEach _arrayOfPos;
	if (WMS_DFO_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_FindRoad %1 roads found', (count WMS_Roads)]};
};
WMS_fnc_GenerateHexaID = {	//will be used to find the mission data in arrays
	private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
	private _hexaArray = [];
	for "_i" from 1 to 8 do {
		_hexaArray pushBack	(selectRandom _hexaBase);
	};
	private _MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_DFO_generateHexaID _MissionHexaID %1', _MissionHexaID]};
	_MissionHexaID
};