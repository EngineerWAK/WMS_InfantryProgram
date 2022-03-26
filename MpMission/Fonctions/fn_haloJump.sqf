/**
 * WMS_fnc_HaloJump
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
//THIS CAN NOT WORK IN EXILE MOD
private ["_hight","_markersToCheck","_markerTraders","_markerTerritory","_territoryOfficeData","_zoneTerritory","_haloData","_spawnAllowed"];
params[
	"_pos",
	["_type","HaloJump"] //"HaloJumpComputer"
	];
//_pos = position _target;
_hight = 1000;
		//////////CUSTOM SPAWN POSITION FILTER//////////
		_markersToCheck = getArray(missionConfigFile >> "CfgOfficeTrader" >> "MarkersToCheck");
		_markerTraders = [(_markersToCheck select 0)];
		_markerTerritory = [(_markersToCheck select 2)];
		_territoryOfficeData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "territory");
		//_zoneTrader = (_territoryOfficeData select 2);
		_zoneTerritory = (_territoryOfficeData select 6);
		_haloData = getArray(missionConfigFile >> "CfgOfficeTrader" >> "HaloJump"); //price trader = select 0; price computer = select 1;
		_spawnAllowed = true;
		/////Is it too close to a marker:
		{
			/*if (markertype _x in _markerTraders) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneTrader)ExitWith{
					_spawnAllowed = false;
					//hint parseText "<t color='#ff0000'>CustomSpawn Too Close To Traders</t>";
					["EventWarning", ["Halo Jump", "Too Close To Traders"]] call BIS_fnc_showNotification;
				};
			};*/ //already filtered at chooseHaloPos
			if (markertype _x in _markerTerritory) then {
				if((_pos distance2D (getMarkerPos _x)) <= _zoneTerritory)ExitWith{
					_spawnAllowed = false;
					hint parseText "<t color='#ff0000'>CustomSpawn Too Close To Territory</t>";
					["EventWarning", ["Halo Jump", "Too Close To Territory"]] call BIS_fnc_showNotification;
				};
			};
		}forEach allMapMarkers;
		//////////////////////////////
		if (_spawnAllowed) then {
			_pos = [[[_pos, 300]],[]] call BIS_fnc_randomPos;
			_hight = 750;
		}else {
			_pos = [_pos, 1500, 2500, 0, 1] call BIS_fnc_findSafePos;
			_hight = 300;
		};

//removeBackpackGlobal _target; //FIX THIS
//_target addBackpackGlobal "B_Parachute"; //FIX THIS
//player setposATL [(_pos select 0), (_pos select 1), _hight];
if (_type == "HaloJump") then {
	[player, (_haloData select 0)] remoteExec ['WMS_fnc_smallTransactions'];
}else {
	if (_type == "HaloJumpComputer") then {
		[player, (_haloData select 1)] remoteExec ['WMS_fnc_smallTransactions'];
	};
};
//_target setVariable ["_spawnedPlayerReadyToFight", true, true];
//setCurrentChannel 3; //Force Group Channel test

[_pos,_hight]spawn { 
	_pos = (_this select 0); 
	_hight = (_this select 1); 
	player allowDamage false;    
	private _crate = createVehicle ["Box_EAF_Ammo_F", position player, [], 0];    
	clearMagazineCargoGlobal _crate;       
	clearWeaponCargoGlobal _crate;       
	clearItemCargoGlobal _crate;       
	clearBackpackCargoGlobal _crate;     
	player action ["DropBag", _crate, backpack player];    
	_crate hideObject true;     
	uisleep 2;      
	player addBackPack "B_Parachute";    
	uisleep 1;     
	_crate attachTo [player, [0,0.35,-0.25],"pelvis",true];     
	_crate setVectorDirandUp [[1,0,0],[0,0,1]];    
	uisleep 2;    
	player allowDamage false;    
	player setPos [(_pos select 0), (_pos select 1),_hight];  
	waitUntil {((position player) select 2) <= 135 || (vehicle player) != player}; 
	if (vehicle player == player) then { 
 		player action ["OpenParachute", player]; 
	}; 
	private _Rope = ropeCreate [vehicle player, [0,0,0], _crate, [0,0,0], 5];    
	uisleep 5;    
	detach _crate; 
	_crate setpos (player modeltoworld [0,2,-2]);  
	_crate hideObject false; 
	[_crate, [0,0,0], [0,0,0]] ropeAttachTo _Rope;   
	player allowDamage true;   
	[_crate, false, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable; 
};