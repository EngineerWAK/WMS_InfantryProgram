/**
* WMS_fnc_DFO_CreateVhls - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_CreateVhls = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateVhls _this %1', _this]};
	params ["_MissionHexaID","_playerObject","_faction","_pos","_OPFORvhlCnt","_OPFORvhlType","_mission","_MissionFinish","_playerUID"];
		private _vhls = []; //pushback, return
		private _grps = []; //pushback, return
		private _OPFvehicles = []; //pushback
		private _infType = "OPFOR";
		private _crewCount = 3;
		private _loadoutIndex = 0;
		//define what type of vehicle, depending what type of mission
		private _veh = objNull;
		for "_i" from 1 to _OPFORvhlCnt do {
			private _vhlType = selectRandom _OPFORvhlType; //number from an array
			private _vhlCN = selectRandom (WMS_DFO_NPCvehicles select _vhlType); ///classname from array in an array
			if (_mission == "airassault") then {
				if (surfaceIsWater _MissionFinish) then { _vhlCN = selectRandom (WMS_DFO_NPCvehicles select 9);};
				_veh = createVehicle [_vhlCN, _MissionFinish, [], 75, "NONE"];
			}else{
				if (surfaceIsWater _pos) then { _vhlCN = selectRandom (WMS_DFO_NPCvehicles select 9);};
				_veh = createVehicle [_vhlCN, _pos, [], 75, "NONE"];
			};
			_veh setDir (random 359);
			_OPFvehicles pushback _veh;
			_vhls pushback _veh;
			_veh setVehiclelock "LOCKEDPLAYER";
			clearMagazineCargoGlobal _veh; 
			clearWeaponCargoGlobal _veh; 
			clearItemCargoGlobal _veh; 
			clearBackpackCargoGlobal _veh;
			_veh setVariable ["WMS_HexaID",_MissionHexaID];
		};
		//vehicle crew
		if (_faction != EAST) then {_infType = "CIV_ARMED"; _loadoutIndex = 1};
		{	
			private _OPFORinfGrp = createGroup [_faction, false];
			if (_x iskindof "helicopter") then {_crewCount = 2};
			if (_x iskindof "StaticWeapon") then {_crewCount = 1};
			for "_i" from 1 to _crewCount do { //GROUND = 3 AIR = 2 STATICS = 1
				if (surfaceIsWater (getPosATL _x)) then {
					_fuckingPOS = ATLtoASL (getPosATL _x);
					private _unit = _OPFORinfGrp createUnit [(WMS_DFO_NPCs select _loadoutIndex select 0), _fuckingPOS, [], 3, "NONE"];
					_unit disableAI "PATH";
				}else{	
					_unit = _OPFORinfGrp createUnit [(WMS_DFO_NPCs select _loadoutIndex select 0), (getPosATL _x), [], 3, "NONE"];
				};	
				_unit setVariable ["WMS_RealFuckingSide",_faction];
				_unit setVariable ["WMS_HexaID",_MissionHexaID];
			};
			_OPFORinfGrp addvehicle _x;
			(units _OPFORinfGrp) orderGetIn true;
			_grps pushback _OPFORinfGrp;
			if (_mission == "airassault") then {
				[_OPFORinfGrp] call CBA_fnc_taskDefend;
				{
					_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
				}forEach units _OPFORinfGrp;
				_OPFORinfGrp setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
			}else{
				[_OPFORinfGrp, _pos, 300, 4, "MOVE", "AWARE", WMS_DFO_OPFORcbtMod, "LIMITED", "COLUMN", "", [2,4,6]] call CBA_fnc_taskPatrol;
			};
			[(units _OPFORinfGrp),[_MissionHexaID,_playerObject,_mission,_infType,_playerUID]] call WMS_fnc_DFO_SetUnits;
		}forEach _OPFvehicles;
	[_vhls,_grps,_faction] //[[],[],side(of the group, not the fucking classname)]
//};