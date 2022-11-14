/**
* WMS_AL_functions.sqf
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
	WMS Ambient Life (civilian by default) should provide some roaming NPC driving around the map and later on probably flying.
	Mostly build to fill empty map running with DFO standalone, would be useless with WMS_InfantryProgram since it use it's own roaming system.
	You can obviously use armed vehicles and change the faction to get hostile roaming units.
	Combat Ready (Optional);
	
	// Start Ambient Life from initServer.sqf
	if (true)then {execVM "WMS_AL_Functions.sqf"};
*/

//WMS_AL_Version		= "v0.26_2022JUN06";
//Variables
if (WMS_AL_Standalone) then {
	WMS_SeaPos = [];
	WMS_Roads = []; //array of roads //Dynamic //pushBack //You can put yours if you want but the system will pushback roads here
		//WMS_exileFireAndForget = false;
	WMS_AMS_MaxGrad 	= 0.15;
		//WMS_exileToastMsg 	= false; //Exile Mod Notifications
	WMS_Pos_Locals 		= []; //AutoScan
	WMS_Pos_Villages	= []; //AutoScan
	WMS_Pos_Cities 		= []; //AutoScan
	WMS_Pos_Capitals 	= []; //AutoScan
		//WMS_Pos_Forests 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Military 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Factory 	= []; //DIY, if no position, back to random _pos
		//WMS_Pos_Custom	 	= []; //DIY, if no position, back to random _pos
};
WMS_fnc_AL_ManagementLoop = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_ManagementLoop time %1', time]};
	uisleep 60;
	for "_i" from 1 to WMS_AL_VHLmax do {
		[] call WMS_fnc_AL_createVHL;
		uisleep 0.5;
	};
	for "_i" from 1 to WMS_AL_UnitMax do {
		[] call WMS_fnc_AL_createUnits;
		uisleep 0.5;
	};
};
///////////////////////////////////////
//Functions
///////////////////////////////////////
WMS_fnc_AL_createVHL = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createVHL _this %1', _this]};
	params [
		["_pos", []],
		["_vhl", selectRandom (WMS_AL_Vehicles select (selectRandom WMS_AL_VhlBalance))],
		["_combat",WMS_AL_CombatBehav]
	];
	private _dir = Random 359;
	private _waypoints = [];
	private _hexaID = []call WMS_fnc_generateHexaID;
	private _road = objNull;
	private _arrayOfPos = [];
	if(count _pos == 0) then {
		if (_vhl in (WMS_AL_Vehicles select 2) && {count WMS_SeaPos >= 9}) then {
			_pos = selectRandom WMS_SeaPos;
		} else {
			if (_vhl in (WMS_AL_Vehicles select 2)) then {_vhl = selectRandom (WMS_AL_Vehicles select 1)};
			if (count WMS_Roads != 0) then { 
				_road = selectRandom WMS_Roads;
				//_pos = position _road; //if they are too slow to move, they can spawn on eachothers
				_pos = [position _road, 0, 100, 15, 0, 0, 0, [], [(position _road),[]]] call BIS_fnc_FindSafePos;
				if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
					_pos = [_pos, 25, 250, 25, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
				};
				_dir = direction _road;
			} else { //WAYPOINTS also use WMS_Roads, at this point it's fuckedUp
				_arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals+WMS_Pos_Locals;
				_pos = (selectRandom _arrayOfPos);
				_pos = [_pos, 0, 100, 15, 0, 0, 0, [], [_pos,[]]] call BIS_fnc_FindSafePos;
				_dir = random 359;
			};
		};
		WMS_AL_LastUsedPos = _pos;
	};
	private _grp = createGroup WMS_AL_Faction;
	//2 possibilities, create the vehicle ready to go with crew or create a vehicel and then the crew
	//lets do the easy one first: //this way spawn the vehicle AND the crew, which pose problem with BIS command "side" ruturning the faction from a config and not the chosen one
	private _vehicleData = [_pos, _dir, _vhl, _grp] call BIS_fnc_spawnVehicle; //[createdVehicle, crew, group]
	private _vhlObject = (_vehicleData select 0);
	_waypoints = [_hexaID,_pos,_grp,_vhlObject,false,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group,_vhlObject, boulean infantry, boulean combat]
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createVHL _vehicleData %1', _vehicleData]};
	if (WMS_AL_LockVehicles) then {
		//_vhlObject lock 3;
		_vhlObject lockDriver true;
		};
	clearMagazineCargoGlobal _vhlObject; 
	clearWeaponCargoGlobal _vhlObject; 
	clearItemCargoGlobal _vhlObject; 
	clearBackpackCargoGlobal _vhlObject;
	_vhlObject setVariable ["WMS_AL_lastPos", position _vhlObject];
	_vhlObject setVariable ["WMS_HexaID", _hexaID];
	[(_vehicleData select 1)] call WMS_fnc_AL_setUnits;
	_vhlObject setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
	_vhlObject addEventHandler ["Killed", " 
		[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_VhlEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	(WMS_AL_Running select 0) pushBack [_hexaID,time,_grp,[_vhlObject],_waypoints]; //[HexaID,time,group,[vehicle],[waypoints]]
};
WMS_fnc_AL_createUnits = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_createUnits _this %1', _this]};
	params [
		["_pos", []],
		["_units", WMS_AL_Units],
		["_combat",WMS_AL_CombatBehav]
	];
	private _unitsCount = 1;
	private _unitObject = ObjNull;
	private _dir = Random 359;
	private _waypoints = [];
	private _hexaID = []call WMS_fnc_generateHexaID;
	if (_combat) then {_unitsCount = selectRandom [2,2,3]};
	if(count _pos == 0) then {
		_road = selectRandom WMS_Roads;
		_pos = position _road;
		if (_pos distance2D WMS_AL_LastUsedPos < 20) then {
			_pos = [_pos, 10, 250, 5, 0, 0, 0, [], [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
		};
		_dir = direction _road;
		WMS_AL_LastUsedPos = _pos;
	};
	private _grp = createGroup WMS_AL_Faction;
	_waypoints = [_hexaID,_pos,_grp,"nan",true,_combat] call WMS_fnc_AL_Patrol; //[_hexaID, pos, group, boulean infantry, boulean combat]
	for "_i" from 1 to _unitsCount do {
		_unitObject = _grp createUnit [selectRandom _units, _pos, [], 15, "FORM"];
		_unitObject setVariable ["WMS_HexaID", _hexaID];
	};
	
	[units _grp] call WMS_fnc_AL_setUnits;
	(WMS_AL_Running select 1) pushBack [_hexaID,time,_grp,units _grp,_waypoints]; //[HexaID,time,group,[units],[waypoints]]
};
WMS_fnc_AL_setUnits = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_setUnits _this %1', _this]};
	private [];
	params [
		"_units",
		["_options", []],
		["_skills",WMS_AL_Skills]
	];
	{
		//setSkill
		_x setSkill ["spotDistance", 	(_skills select 0)];
		_x setSkill ["spotTime", 		(_skills select 1)];
		_x setSkill ["aimingAccuracy", 	(_skills select 2)];
		_x setSkill ["aimingShake", 	(_skills select 3)];
		_x setSkill ["aimingSpeed", 	(_skills select 4)];
		_x setSkill ["reloadSpeed", 	(_skills select 5)];
		_x setSkill ["courage", 		(_skills select 6)];
		_x setSkill ["commanding", 		(_skills select 7)];
		_x setSkill ["general", 		(_skills select 8)];
		_x setVariable ["WMS_DFO_options",_options];
		_x allowFleeing 0;
		_x setVariable ["WMS_RealFuckingSide",WMS_AL_Faction];
		_x addEventHandler ["Killed", " 
		[(_this select 0),(_this select 1),(_this select 2)] call WMS_fnc_AL_UnitEH;
		"];//params ["_unit", "_killer", "_instigator", "_useEffects"];
	}forEach _units
};

WMS_fnc_AL_UnitEH = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_UnitEH _this %1', _this]};
	params [
		"_killed",
		"_killer", //the registered _playerObject for the mission is the pilot who launched the mission, if the pilot die and come back, he doesnt match the registered anymore
		"_instigator"
	];
	if (isPlayer _instigator) then {_killer = _instigator};
	if(isPlayer _killer && {((side _killer) getfriend (_killed getVariable ["WMS_RealFuckingSide",WMS_AL_Faction])) > 0.5}) then {
		[_killer] call WMS_fnc_AL_PunishPunks;
	};
	private _hexaID = _killed getVariable ["WMS_HexaID", "zzzzzzzz"];
	if (WMS_AL_StripOffUnit) then {
		_killed removeWeapon (primaryWeapon _killed);
		_killed removeWeapon (secondaryWeapon _killed); //launcher
		//removeAllItems _killed;
		removeAllWeapons _killed;
		removeBackpackGlobal _killed;
		removeVest _killed;
		//moveOut _killed;
	};
	if ({alive _x} count (units (group _killed)) == 0) then {
		deleteGroup (group _killed);
		//if the group is empty, remove it from the manager
		private _result = []; 
		{ 
			_found = (_x select 0) find _hexaID;
			_result pushback _found;
		}forEach (WMS_AL_Running select 1);
		private _RefIndex = _result find 0;
		//{deleteWaypoint _x}forEach (((WMS_AL_Running select 1) select _RefIndex) select 4); //units use CBA patrol which manage the waypoints itself
		(WMS_AL_Running select 1) deleteAt _RefIndex;
	};
};
WMS_fnc_AL_VhlEH = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_VhlEH _this %1', _this]};
	params [
		"_killed",
		"_killer", //the registered _playerObject for the mission is the pilot who launched the mission, if the pilot die and come back, he doesnt match the registered anymore
		"_instigator"
	];
	if (isPlayer _instigator) then {_killer = _instigator};
	private _hexaID = _killed getVariable ["WMS_HexaID", "zzzzzzzz"];
	if(isPlayer _killer && {((side _killer) getfriend (_killed getVariable ["WMS_RealFuckingSide",WMS_AL_Faction])) > 0.5}) then {
		[_killer] call WMS_fnc_AL_PunishPunks;
	};
	{
		moveOut _x; 
		_x setDamage 1;
		if (WMS_AL_StripOffUnit) then {
			_x removeWeapon (primaryWeapon _x);
			_x removeWeapon (secondaryWeapon _x); //launcher
			//removeAllItems _x;
			removeAllWeapons _x;
			removeBackpackGlobal _x;
			removeVest _x;
		};
	} forEach units (group _killed);
	deleteGroup (group _killed);
	//if the unit die, remove it from the manager
	private _result = []; 
	{ 
		_found = (_x select 0) find _hexaID;
		_result pushback _found;
	}forEach (WMS_AL_Running select 0);
	private _RefIndex = _result find 0;
	{deleteWaypoint _x}forEach (((WMS_AL_Running select 0) select _RefIndex) select 4);
	[_killed] spawn {uisleep 5; deleteVehicle (_this select 0)};
	(WMS_AL_Running select 0) deleteAt _RefIndex;
};

WMS_fnc_AL_Patrol = {
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_Patrol _this %1', _this]};
	params [
		"_hexaID",
		"_pos", 
		"_grp", 
		"_vhl", //_vhlObject
		["_infantry", true],
		["_combat", WMS_AL_CombatBehav]
	];
	private _waypoints = [];
	private _wpt0 = [];
	private _wpt1 = [];
	private _wpt2 = [];
	private _wpt3 = [];
	//create Waypoints, lets say 4 of them, in random cities for Vehicles, around for dudes
	if (_infantry) then {
		if (_combat) then {
			[_grp, _pos, 150, 4, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
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
				if (count WMS_SeaPos != 0) then {
					_wpt1 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 1, format["WPT1_%1",round time]];
					_wpt2 = _grp addWaypoint [selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)], 150, 2, format["WPT2_%1",round time]];
				} else {
					_wpt1 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 1, format["WPT1_%1",round time]];
					_wpt2 = _grp addWaypoint [getPos (selectRandom WMS_Roads), 150, 2, format["WPT2_%1",round time]];
				};
				
				private _lastPos = getPos (selectRandom WMS_Roads);
				if (_lastPos distance2D (getWPPos _wpt2) < 150 || _lastPos distance2D (getWPPos _wpt0) < 50) then {
					private _findPos = true;
					private _cycles = 100;
					while {_findPos} do {
						if (count WMS_SeaPos != 0) then {
							_lastPos = selectRandom [getPos (selectRandom WMS_Roads),(selectRandom WMS_SeaPos)];
						}else{
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
};
WMS_fnc_AL_PunishPunks = { //will be use to remind to those getting in the mission zone that it's not their mission, ACE broken legs and things like that
	if (WMS_AL_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_AL_PunishPunks _this %1', _this]};
	params [
		"_playerObject",
		["_maxDamage",0.5],
		["_part", selectRandom ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]], //["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] ACE
		["_projectiles", selectRandom ["stab","bullet","grenade","explosive","shell","vehiclecrash","backblast","falling"]] //["stab","bullet","grenade","explosive","shell","vehiclecrash","collision","backblast","punch","falling","ropeburn","fire"]
		];

	if (WMS_AL_AceIsRunning) then {
		if (isPlayer _playerObject) then {
			[_playerObject, _maxDamage, _part, _projectiles, _playerObject] remoteExecCall ["ace_medical_fnc_addDamageToUnit",owner _playerObject];
		} else {
			[_playerObject, 0.3, _part, _projectiles, _playerObject] call ace_medical_fnc_addDamageToUnit;
		};
	} else {
		//Bohemia:
		/*_parts = [
			"face_hub", //Unit dies at damage equal to or above 1
			"neck", //Unit dies at damage equal to or above 1
			"head", //Unit dies at damage equal to or above 1
			"pelvis", //Unit dies at damage equal to or above 1
			"spine1", //Unit dies at damage equal to or above 1
			"spine2", //Unit dies at damage equal to or above 1
			"spine3", //Unit dies at damage equal to or above 1
			"body", //Unit dies at damage equal to or above 1
			"arms", //Unit doesn't die with damage to this part
			"hands", //Unit doesn't die with damage to this part
			"legs" //Unit doesn't die with damage to this part 
		];*/
		//_playerObject setHit [selectRandom _parts,random 0.25,true,_playerObject];
		private _dmg = damage _playerObject;
		_playerObject setDamage _dmg+(random _maxDamage); //it's not sexy but it should do the job for now
	};
};

///////////////////////////
{if ("Advanced Combat Environment" in (_x select 0))then {WMS_AL_AceIsRunning = true;}}forEach getLoadedModsInfo;

if (WMS_AL_Standalone) then {
	[]call WMS_fnc_CollectPos;
	[]call WMS_fnc_ScanForWater;
	[]call WMS_fnc_FindRoad;
};
uisleep 15;
if (WMS_AmbientLife) then {
	[] spawn WMS_fnc_AL_ManagementLoop;
	if (true) then {diag_log format ['|WAK|TNA|WMS|WMS_AmbientLife Started, version %1', WMS_AL_Version]};
};