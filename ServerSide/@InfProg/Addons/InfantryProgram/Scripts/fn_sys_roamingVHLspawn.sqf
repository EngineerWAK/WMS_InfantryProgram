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
/*for "_i" from 1 to WMS_AI_RoamingVHLcount do {
	private _vhlFull = selectRandom WMS_AI_RoamingVHLlist;
	private _vhl = (_vhlFull select 0);
	private _skill= 0.4+(random 0.5);
	private _centerPos = [worldsize/2,worldsize/2,0];
	private _pos = [_centerPos, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
	private _loadout = selectRandom ["bandit","bandit","army","BlackOps","livonia"];
	[_pos, "", WMS_AI_PatrolTimer_VHL+(random 300),_skill,OPFOR,_loadout,_vhlFull,false,false,0,150,WMS_AI_VHLwptDist,"MOVE","SAFE","YELLOW","LIMITED"] spawn WMS_fnc_infantryProgram_VHLpatrol;

	if (WMS_AI_roamingVHLspawn_LOGs) then { diag_log format ["[240 sec AI VHL SPAWN]|WAK|TNA|WMS| spawning %1 position %2", _vhl,_pos]};
	uisleep 30;
};*/

if (WMS_AI_RoamingVHL) then {
	_VHLAIrunning = (count WMS_AI_RoamingVHL_Running);
	_skillgnd= (WMS_AI_RoamingVHL_Skill select 0)+(random (WMS_AI_RoamingVHL_Skill select 1));
	if (WMS_AI_roamingVHLspawn_LOGs) then { diag_log format ["[AI VHL SPAWN]|WAK|TNA|WMS| %1 Vehicles Patroling", _VHLAIrunning]};
	if (_VHLAIrunning < WMS_AI_RoamingVHLcount && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B)) then {
		_vhlFull = selectRandom WMS_AI_RoamingVHLlist;
		_vhl2 = (_vhlFull select 0);
		_pos2 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		_loadout = selectRandom ["bandit","army","BlackOps"];
		[_pos2, "", WMS_AI_PatrolTimer_VHL+(random 300),_skillgnd,OPFOR,_loadout,_vhlFull,false,false,0,150,WMS_AI_VHLwptDist,"MOVE","SAFE","YELLOW","LIMITED"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_AI_roamingVHLspawn_LOGs) then { diag_log format ["[AI VHL SPAWN]|WAK|TNA|WMS| spawning %1 position %2, skill %3", _vhl2,_pos2,_skillgnd]};
	};
};
if (WMS_AI_RoamingAIR) then {
	_AIRAIrunning = (count WMS_AI_RoamingAIR_Running);
	_skillair= (WMS_AI_RoamingAIR_Skill select 0)+(random (WMS_AI_RoamingAIR_Skill select 1));
	if (WMS_AI_roamingVHLspawn_LOGs) then { diag_log format ["[AI AIR SPAWN]|WAK|TNA|WMS| %1 Choppers Flying", _AIRAIrunning]};
	if (_AIRAIrunning < WMS_AI_RoamingAIRcount && ((OPFOR countSide allUnits) < WMS_AI_MaxUnits_B)) then {
		_AIRFull = selectRandom WMS_AI_RoamingAIRlist;
		_AIR = (_AIRFull select 0);
		_pos3 = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		_loadout = selectRandom ["bandit","army","BlackOps"];
		[_pos3, "", WMS_AI_PatrolTimer_AIR+(random 300),_skillair,OPFOR,_loadout,_AIRFull,false,false,0,150,WMS_AI_AIRwptDist,"MOVE","AWARE","YELLOW","LIMITED"] spawn WMS_fnc_infantryProgram_VHLpatrol;
		if (WMS_AI_roamingVHLspawn_LOGs) then { diag_log format ["[AI AIR SPAWN]|WAK|TNA|WMS| spawning %1 position %2, skill %3", _AIR,_pos3,_skillair]};
	};
};