/**
* WMS_fnc_DFO_Reinforce - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_Reinforce = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce _this %1', _this]};
	params [
		"_MissionHexaID",
		"_playerObject",
		//"_mkrs",
		"_mission",
		//"_MsnPathCoord",
		//"_missionName",
		"_MissionFinish",
		//"_reinforce", //should not be false
		//"_smokePickUp", //can be false
		"_grpSmoke", //can be nil
		"_pos" //trigger position
		//no _pilotUID here
		];
		if !(WMS_DFO_Reinforcement) exitWith {
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce Nope, no reinforcement rot you _MissionHexaID %1', _MissionHexaID]};
		};
		private _timer = 500+(random 120);
		private _grps = [];
		private _vhls = [];
		private _objects = [];
		private _units = [];
		private _grp = grpNull;
		private _OPFPRvhl = objNull;
		private _playerUID = getPlayerUID _playerObject;

		_typeOfReinforce = selectRandom WMS_DFO_Reinforcements;
		if (surfaceIsWater _pos) then {_typeOfReinforce = "AIRpatrol"};
		if(WMS_DFO_Standalone)then{
			//private _playerScore = _playerObject getVariable ["ExileScore", 5000]; //will be usefull later for reinforcement skill adjustment
			_blackList = allPlayers select {alive _x} apply {[getPosATL _x, 900]};
			if (_typeOfReinforce == "AIRpatrol") then {
				//_randomPos = [_pos, WMS_DFO_ReinfTriggDist+900, WMS_DFO_ReinfTriggDist+2500, 0, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
				_randomPos = [_pos, WMS_DFO_ReinfTriggDist+900, WMS_DFO_ReinfTriggDist+2500, 0, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
				_vhl = [[_randomPos select 0,_randomPos select 1, 250], (random 359), selectRandom (WMS_DFO_NPCvehicles select 0), EAST] call bis_fnc_spawnvehicle;      
				_vehic = (_vhl select 0);  
				_units = (_vhl select 1);   
				_grp = (_vhl select 2); 
				_vhls pushBack _vehic;
				_grps pushBack _grp;
				_vehic setVehicleLock "LOCKEDPLAYER";
				clearMagazineCargoGlobal _vehic;    
				clearWeaponCargoGlobal _vehic;    
				clearItemCargoGlobal _vehic;    
				clearBackpackCargoGlobal _vehic;
				{
					_x setVariable ["WMS_RealFuckingSide",EAST];
					_x setVariable ["WMS_HexaID",_MissionHexaID];
				}forEach _units;
				[_units,[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				[_grp, _pos, 300, 4, "MOVE", "AWARE", WMS_DFO_OPFORcbtMod, "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce "AIRpatrol" %1', _vhl]};
			};
			if (_typeOfReinforce == "VHLpatrol") then {
				_OPFPRvhl = selectRandom (WMS_DFO_NPCvehicles select 4); //APC
				if(_mission == "csar"||_mission == "sar"||_mission == "inftransport"||_mission == "cargotransport") then {
					_OPFPRvhl = selectRandom (WMS_DFO_NPCvehicles select 5); //light
				};
				//_randomPos = [_pos, 300, WMS_DFO_ReinfTriggDist, 8, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
				_randomPos = [_pos, 300, WMS_DFO_ReinfTriggDist, 8, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;
				_vhl = [[_randomPos select 0,_randomPos select 1, 2], (random 359), _OPFPRvhl, EAST] call bis_fnc_spawnvehicle;      
				_vehic = (_vhl select 0);  
				_units = (_vhl select 1);   
				_grp = (_vhl select 2); 
				_vhls pushBack _vehic;
				_grps pushBack _grp;
				_vehic setVehicleLock "LOCKEDPLAYER";
				clearMagazineCargoGlobal _vehic;    
				clearWeaponCargoGlobal _vehic;    
				clearItemCargoGlobal _vehic;    
				clearBackpackCargoGlobal _vehic;
				{
					_x setVariable ["WMS_RealFuckingSide",EAST];
					_x setVariable ["WMS_HexaID",_MissionHexaID];
				}forEach _units;
				[_units,[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				[_grp, _pos, 300, 4, "MOVE", "AWARE", WMS_DFO_OPFORcbtMod, "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce "VHLpatrol" %1', _vhl]};
			};
			if (_typeOfReinforce == "paradrop") then {
				_OPFORinfGrp = createGroup [EAST, false];
				for "_i" from 1 to (selectRandom [4,5,6,7,8]) do {
					_unit = _OPFORinfGrp createUnit [selectRandom (WMS_DFO_NPCs select 0), [_pos select 0,_pos select 1,3000], [], 0, ""];
					_unit setVariable ["WMS_RealFuckingSide",EAST];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
				};
				[_OPFORinfGrp, _pos, 75, 5, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
				{
					_posDrop = [[[_pos, 120]], []] call BIS_fnc_randomPos;
					removeBackpackGlobal _x;
					_x addBackpack "B_Parachute";
					_x setPosATL [_posDrop select 0,_posDrop select 1, 150];
				}forEach units _OPFORinfGrp;
				_grps pushback _OPFORinfGrp;
				[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce "paradrop" %1', _OPFORinfGrp]};
			};
			if (_typeOfReinforce == "AIRassault") then {
				//_randomPos = [_pos, WMS_DFO_ReinfTriggDist+900, WMS_DFO_ReinfTriggDist+2500, 0, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
				_randomPos = [_pos, WMS_DFO_ReinfTriggDist+900, WMS_DFO_ReinfTriggDist+2500, 0, 0, 0, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call BIS_fnc_FindSafePos;  
				_posLand = [_pos, 0, 250, 25, 0, 0, 0, [], [([[[_pos, 150]], []] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified; 
				_Helipad = "Land_HelipadEmpty_F" createVehicle _posLand;
				_objects pushBack _Helipad;
				//GUNSHIP
				_vhl1 = [[_randomPos select 0,_randomPos select 1, 250], (random 359), selectRandom (WMS_DFO_NPCvehicles select 0), EAST] call bis_fnc_spawnvehicle;
				_vehic1 = (_vhl1 select 0);
				_units1 = (_vhl1 select 1);
				_grp1 = (_vhl1 select 2);
				_vhls pushBack _vehic1;
				_grps pushBack _grp1;
				_vehic1 setVehicleLock "LOCKEDPLAYER";
				clearMagazineCargoGlobal _vehic1;
				clearWeaponCargoGlobal _vehic1;
				clearItemCargoGlobal _vehic1;
				clearBackpackCargoGlobal _vehic1;
				{
					_x setVariable ["WMS_RealFuckingSide",EAST];
					_x setVariable ["WMS_HexaID",_MissionHexaID];
				}forEach _units;
				[_units1,[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				_WPT_1 = _grp1 addWaypoint [_pos, 50];         
				_WPT_1 setWaypointType "MOVE";  
				_WPT_1 setwaypointSpeed "NORMAL";  
				_WPT_1 setWaypointCombatMode "GREEN";  
				_WPT_1 setWaypointbehaviour  "SAFE"; 
				uisleep 3;
				//TRANSPORT
				_vhl2 = [[_randomPos select 0,_randomPos select 1, 300], (random 359), selectRandom (WMS_DFO_NPCvehicles select 2), EAST] call bis_fnc_spawnvehicle;
				_vehic2 = (_vhl2 select 0);
				_units2 = (_vhl2 select 1);
				_grp2 = (_vhl2 select 2);
				_vhls pushBack _vehic2;
				_grps pushBack _grp2;
				_vehic2 setVehicleLock "LOCKEDPLAYER";
				clearMagazineCargoGlobal _vehic2;    
				clearWeaponCargoGlobal _vehic2;    
				clearItemCargoGlobal _vehic2;    
				clearBackpackCargoGlobal _vehic2;
				{
					_x setVariable ["WMS_RealFuckingSide",EAST];
					_x setVariable ["WMS_HexaID",_MissionHexaID];
				}forEach _units;
				[_units2,[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				_WPT_1b = _grp2 addWaypoint [_posLand, 25];  
				_WPT_1b setWaypointType "TR UNLOAD";  
				_WPT_1b setwaypointSpeed "NORMAL";  
				_WPT_1b setWaypointCombatMode "BLUE";  
				_WPT_1b setWaypointbehaviour  "CARELESS";  
				uisleep 1;
				//INFANTRY
				_OPFORinfGrp = createGroup [EAST, false];
				_grps pushBack _OPFORinfGrp;
				for "_i" from 1 to (selectRandom [4,5,6,7,8]) do {
					_unit = _OPFORinfGrp createUnit [selectRandom (WMS_DFO_NPCs select 0), _randomPos, [], 0, ""];
					_unit setVariable ["WMS_RealFuckingSide",EAST];
					_unit setVariable ["WMS_HexaID",_MissionHexaID];
				
				};
				[_OPFORinfGrp, _pos, 75, 4, "MOVE", "AWARE", "RED", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
				_units = units _OPFORinfGrp;
				{_x moveInCargo _vehic2}forEach _units;
				[_units,[_MissionHexaID,_playerObject,_mission,"OPFOR",_playerUID]] call WMS_fnc_DFO_SetUnits;
				//AIRASSAULT TRIGGER
				_triggAssault = createTrigger ["EmptyDetector", _pos, true];
				_triggAssault setVariable ["_vehic1", _vehic1, false];
				_triggAssault setVariable ["_vehic2", _vehic2, false];
				_triggAssault setTriggerActivation ["EAST", "PRESENT", true]; 
				_triggAssault setTriggerArea [300, 300, 0, false];
				_triggAssault setTriggerStatements  
				[ 
  					"(thistrigger getVariable '_vehic1') in thisList || (thistrigger getVariable '_vehic2') in thisList",
  					"	
						if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] trigger AIRASSAULT | thisList %1 | position %2 |', thisList, getPosATL thisTrigger]};
						[group (thistrigger getVariable '_vehic1'), getPosATL thisTrigger, 300, 4, 'MOVE', 'AWARE', WMS_DFO_OPFORcbtMod, 'LIMITED', 'COLUMN', '', [2,4,6]] call CBA_fnc_taskPatrol;
						deleteVehicle thisTrigger;
					",  
  					"" 
				];
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Reinforce "AIRassault" %1', _vhls]};
			};
			WMS_DFO_RunReinforce pushBack ["_MissionHexaID", (time+_timer), _grps, _vhls, _objects,"","","REINF"];
		}else{
			[_playerObject, _pos, "DFO",_typeOfReinforce] call WMS_fnc_DynAI_selScen;
		};
//};