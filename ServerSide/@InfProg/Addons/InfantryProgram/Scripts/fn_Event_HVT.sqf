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
/*
- Spawn a "HVT Datas" marker + "computer" object in a random city on a buildingPos
	_dataPos = selectRandom (_building buildingPos -1);
- spawn a small group patroling around the building
- small trigger on the data "computer"
- "DOWNLOAD DATAs" action on the "computer" showing "Downloading Data" message and activate the HVT at the end of the download, delete "HVT Datas" marker
- randomSelect elimination type ["lazerBombing", "laserArti", etc...]
- spawn a small group chilling around another city + camp/vehicle/objects, group leader is the HVT, no marker yet
- create a 1km radius "HVT zone" createMarkerLocal (local to who downloaded the Datas first) center in 500m radius around HVT with a 1km radius trigger "HVT zone"
- display a "knowsAbout" gage, if (HVT knowsAbout _caller >= _knowsAboutLimit) then {"missionFail"};
WMS_fnc_event_HVT
*/
[player] spawn {
	params [ 
		"_caller",
		["_plane", "B_Plane_CAS_01_F"],
		["_pylon", "Bomb_04_Plane_CAS_01_F"],
		["_iterations", 4],
		["_altitude", 4500]

	];
	_delay = 4;
	_pos1 = _caller modelToWorld [0,-2500,0];
	_pos2 = _caller modelToWorld [0,2500,0];
	_pos = [_pos1 select 0, _pos1 select 1, _altitude];
	_plane = [_pos, direction _caller, _plane, WEST] call BIS_fnc_spawnVehicle;
	_planeObject = _plane select 0; 
	_unit = leader (_plane select 2);
	_wp = (_plane select 2) addWaypoint [_pos2, 0];
	_unit disableAI "AUTOTARGET"; 
	_unit allowFleeing 0;
	_unit setSkill 1; 
	_unit selectWeapon _pylon;
	_displayName = getText(configfile >> "CfgWeapons" >> _pylon >> "displayName");
	uisleep _delay;
	systemChat format ["Dropping %1, Altitude %2m", _displayName, _altitude];
	for "_i" from 1 to _iterations do {
		_unit doWatch (laserTarget _caller); 
		_unit doTarget (laserTarget _caller);
		uisleep _delay;
		_unit fireAtTarget [laserTarget _caller];
		systemchat format ["Target Visibility: %1", (_planeObject aimedAtTarget [laserTarget _caller,_pylon])];
		_planeObject setVehicleAmmo 1;
		uisleep 1;
	};
	systemChat format["Bombs away, %1", _displayName];
	_unit forgetTarget (laserTarget _caller);
	_unit disableAI "AUTOTARGET"; 
	_unit doWatch [100,100,2500];
	for "_i" from count waypoints (group _unit) - 1 to 0 step -1 do
	{
		deleteWaypoint [(group _unit), _i];
	};
	(_plane select 2) addWaypoint [[100,100,_altitude], 0];
	[(_plane select 2), 0] setWaypointBehaviour "SAFE";
	[(_plane select 2), 0] setWaypointCombatMode "BLUE";
	[(_plane select 2), 0] setWaypointSpeed "FULL";
	_unit doMove [100,100,_altitude];
	_planeObject setVehicleAmmo 0;
	uisleep 60;
	deleteVehicle _unit;
	_planeObject setDamage 1;
};


/*
"B_UAV_05_F"
	_planeObject addMagazineTurret ["2Rnd_GBU12_LGB_MI10",[-1]];  
	_planeObject addWeaponTurret ["GBU12BombLauncher_Plane_Fighter_03_F",[-1]];


"B_Plane_CAS_01_F","Bomb_04_Plane_CAS_01_F","4Rnd_Bomb_04_F"
"I_Plane_Fighter_03_CAS_F","GBU12BombLauncher_Plane_Fighter_03_F", "2Rnd_GBU12_LGB_MI10"
"B_UAV_02_CAS_F","GBU12BombLauncher", "Bo_GBU12_LGB_MI10"
"O_Plane_CAS_02_F", "Bomb_03_Plane_CAS_02_F", "2Rnd_Bomb_03_F"
		_pos = _pos getPos [random _radius,random 360];
		_veh = createVehicle [_load, [(_Pos select 0),(_Pos select 1),_altitude], [], 0, "NONE"];
		_veh setDir random 359;
		_veh setVectorDirAndUp [[0,0,-1],[1,0,0]];

	_planeObject setAutonomous true;
		_planeObject setVehicleAmmo 1;
		_unit commandSuppressiveFire laserTarget _caller;
		_unit commandFire laserTarget _caller;
		_unit doFire laserTarget _caller;
		_unit fireAtTarget [laserTarget _caller];
		_unit forceWeaponFire [currentMuzzle _unit,currentMuzzle _unit];*/