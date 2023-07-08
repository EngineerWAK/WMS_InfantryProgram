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

//[_target, _pos, _patrolTimer, [_VHLselected], _faction, _spawnDist1, _spawnDist2 _distanceWPT, _combatMod, _behavior, _speed, _launcherChance, _useMarker, _lockPlayer] call WMS_fnc_infantryProgram_VHLpatrol
private ["_VHLAIrunning","_skillgnd","_skillair","_vhlFull","_vhl2","_pos2","_loadout","_AIRAIrunning","_AIRFull","_AIR","_pos3"];
//uisleep 400;
WMS_AI_RoamingVHLlist = WMS_OPFOR_CustomVHL_Unarmed + WMS_OPFOR_CustomVHL_Armed;
WMS_AI_RoamingAIRlist = WMS_OPFOR_CustomAIR_Unarmed + WMS_OPFOR_CustomAIR_Armed;

if (WMS_AI_RoamingVHL) then {
	_pos2 = [0,0,0];
	_VHLAIrunning = (count WMS_AI_RoamingVHL_Running);
	_skillgnd= (WMS_AI_RoamingVHL_Skill select 0)+(random (WMS_AI_RoamingVHL_Skill select 1));
	if (WMS_IP_LOGs) then { diag_log format ["[AI VHL SPAWN]|WAK|TNA|WMS| %1 Vehicles Patroling", _VHLAIrunning]};
	if (_VHLAIrunning < WMS_AI_RoamingVHLcount && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B)) then {
		_vhlFull = selectRandom WMS_AI_RoamingVHLlist;
		_vhl2 = (_vhlFull select 0);
		//_pos2 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		private _blackList = allPlayers select {alive _x} apply {[getPosATL _x, WMS_AI_PlayerDistToSpawnVHL]};

	//////////////////////////////NEW SPAWN FROM AL
	if(WMS_AI_RoamingVHL_citySpawn) then {
			if (count WMS_Roads != 0) then { 
				_road = selectRandom WMS_Roads;
				//_pos = position _road; //if they are too slow to move, they WILL spawn on eachothers
				_pos2 = [position _road, 0, 50, 10, 0, 0, 0, _blackList, [((position _road) findEmptyPosition [5,150,_vhl2]),[]]] call BIS_fnc_FindSafePos;
				if (_pos2 distance2D WMS_AI_LastUsedPos < 15) then {
					_pos2 = [_pos2, 25, 250, 25, 0, 0, 0, _blackList, [((position _road) findEmptyPosition [5,150,_vhl2]),[]]] call BIS_fnc_FindSafePos;
				};
				_dir = direction _road;
			} else { //WAYPOINTS also use WMS_Roads, at this point it's fuckedUp
				//_arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals+WMS_Pos_Locals;
				_posUrban = (selectRandom WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals+WMS_Pos_Locals);
				_pos2 = [_posUrban, 0, 100, 15, 0, 0, 0, _blackList, [(_posUrban findEmptyPosition [5,200,(typeOf _vhl2)]),[]]] call BIS_fnc_FindSafePos;	
			};
		}else{
			_pos2 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
		};
		WMS_AI_LastUsedPos = _pos2;
	//////////////////////////////

		_loadout = selectRandom ["bandit","army","BlackOps"];
		[_pos2, "", WMS_AI_PatrolTimer_VHL+(random 300),_skillgnd,OPFOR,_loadout,_vhlFull,false,false,0,150,WMS_AI_VHLwptDist,"MOVE","SAFE","YELLOW","LIMITED","ROAMING"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_IP_LOGs) then { diag_log format ["[AI VHL SPAWN]|WAK|TNA|WMS| spawning %1 position %2, skill %3", _vhl2,_pos2,_skillgnd]};
	};
};
if (WMS_AI_RoamingAIR) then {
	_AIRAIrunning = (count WMS_AI_RoamingAIR_Running);
	_skillair= (WMS_AI_RoamingAIR_Skill select 0)+(random (WMS_AI_RoamingAIR_Skill select 1));
	if (WMS_IP_LOGs) then { diag_log format ["[AI AIR SPAWN]|WAK|TNA|WMS| %1 Choppers Flying", _AIRAIrunning]};
	if (_AIRAIrunning < WMS_AI_RoamingAIRcount && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B)) then {
		_AIRFull = selectRandom WMS_AI_RoamingAIRlist;
		_AIR = (_AIRFull select 0);
		_pos3 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		_loadout = selectRandom ["bandit","army","BlackOps"];
		[_pos3, "", WMS_AI_PatrolTimer_AIR+(random 300),_skillair,OPFOR,_loadout,_AIRFull,false,false,0,150,WMS_AI_AIRwptDist,"MOVE","AWARE","YELLOW","LIMITED","ROAMING"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_IP_LOGs) then { diag_log format ["[AI AIR SPAWN]|WAK|TNA|WMS| spawning %1 position %2, skill %3", _AIR,_pos3,_skillair]};
	};
};
/*
if (WMS_AI_RoamingSEA) then {
	_AIRAIrunning = (count WMS_AI_RoamingAIR_Running);
	_skillair= (WMS_AI_RoamingAIR_Skill select 0)+(random (WMS_AI_RoamingAIR_Skill select 1));
	if (WMS_IP_LOGs) then { diag_log format ["[AI SEA SPAWN]|WAK|TNA|WMS| %1 Choppers Flying", _AIRAIrunning]};
	if (_AIRAIrunning < WMS_AI_RoamingAIRcount && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B)) then {
		_AIRFull = selectRandom WMS_AI_RoamingAIRlist;
		_AIR = (_AIRFull select 0);
		_pos3 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		_loadout = selectRandom ["bandit","army","BlackOps"];
		[_pos3, "", WMS_AI_PatrolTimer_AIR+(random 300),_skillair,OPFOR,_loadout,_AIRFull,false,false,0,150,WMS_AI_AIRwptDist,"MOVE","AWARE","YELLOW","LIMITED","ROAMING"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_IP_LOGs) then { diag_log format ["[AI SEA SPAWN]|WAK|TNA|WMS| spawning %1 position %2, skill %3", _AIR,_pos3,_skillair]};
	};
};*/