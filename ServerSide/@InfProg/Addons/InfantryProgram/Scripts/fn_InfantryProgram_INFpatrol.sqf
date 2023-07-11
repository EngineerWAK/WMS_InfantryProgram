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

//////////
//[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_FrontSpawn,_launcherChance,_dist1,_dist2,_WPDist,_WPType,_WPBeha,_WPComb,_WPSpee]callcall WMS_fnc_InfantryProgram_INFpatrol
//[_target,_RandomPosDest,(round(2+(random 3))),_patrolLoadout,600,250,_missionType,_vhl] call WMS_fnc_InfantryProgram_INFsquad; //Old
//////////////////////////////////////////////////////////////////

if (WMS_IP_LOGs) then {diag_log format ["[INFANTRY PATROL]|WAK|TNA|WMS| _this = %1", _this]};
private ["_PatrolVRmkrList","_smokeGrenade","_patrolGrp","_posDZ","_sessionID","_smokeGrenade","_spawnPos"];
params[  
	"_pos",
	"_target",
	["_timer", 600, [0]],
	["_skill", 0.65,[0]],
	["_grpSize", 5,[0]],  
	["_grpSide", OPFOR,[]],
	["_loadout", "army", [""]], // selectRandom ["bandit", "army", "BlackOps", "heavyBandit"]
	["_FrontSpawn", true,[]],
	["_launcherChance", 10,[0]],  
	["_dist1", 50,[0]],  
	["_dist2", 400,[0]],
 	["_WPDist", 250, [0]],
	["_WPType", "MOVE", [""]],  
	["_WPBeha", "COMBAT", [""]],  
	["_WPComb", "RED", [""]],  
	["_WPSpee", "NORMAL", [""]],
	["_steal", WMS_DynAI_Steal],
	["_difficulty", "moderate"]
      
];

_PatrolVRmkrList = [];
_smokeGrenade = "SmokeShellOrange";
_patrolGrp = grpNull;
_posFar = [_pos, 150, 400] call BIS_fnc_findSafePos;
_units = [];
for "_i" from 1 to _grpSize do {
	_units pushBack (selectRandom WMS_AI_Units_Class);
};
if (_FrontSpawn) then {
	//Spawn at distance in front of the target
	_posShift = [_target,WMS_DynAI_distToPlayers,_dist2,10,36,true] call WMS_fnc_AMS_ChkSpawnAngleShift;
	if (_posShift select 0) then {
		_posFar = selectRandom (_posShift select 1); 
		_patrolGrp = [_posFar, _grpSide, _units] call BIS_fnc_spawnGroup;
	};
	if (!(_posShift select 0)) exitWith {
		diag_log format ["[INFANTRY PATROL]|WAK|TNA|WMS| No position(s) available to spawn | %1", _posShift]
	};
} else {
	_patrolGrp = [_pos, _grpSide, _units] call BIS_fnc_spawnGroup;
};
{_x setVariable ["WMS_RealFuckingSide",_grpSide]}foreach units _patrolGrp;
//if !(WMS_HeadlessOwnerID == 2) then {_patrolGrp setGroupOwner WMS_HeadlessOwnerID};
//if (HC1 in allPlayers) then {_patrolGrp setGroupOwner (owner HC1)};

_posDZ = position (Leader _patrolGrp);

WMS_ParadropAI_LastTime = time;
publicVariable "WMS_ParadropAI_LastTime";

if (_grpSide == OPFOR ) then {
	if (WMS_DynAI_RdoChatter && !(WMS_FastCombat)) then {
		_number = selectRandom [12,11,2,1,6,8];
		_sound = format ["A3\sounds_f\sfx\radio\ambient_radio%1.wss",_number];
		playSound3D [_sound, player, false, _posDZ, 2, 1, 0];
	};
	if (WMS_IP_LOGs) then {diag_log format ["[INFANTRY PATROL GROUP]|TNA|TNA|TNA|TNA|TNA| Side = %1", _grpSide]};
	_smokeGrenade = "SmokeShellRed";
	[(units _patrolGrp),'Random',_launcherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	WMS_AI_OPFORpatrol_Running pushback [time,(time+(_timer+(random _timer))),[_patrolGrp],[],[],[],[],""];
	WMS_AI_OPFORpatrol_LastTarget set [0,_target];
	WMS_AI_OPFORPatrol_LastTime = time;
	publicVariable "WMS_AI_OPFORPatrol_LastTime";
	if (isPlayer _target) then {
		if (WMS_exileToastMsg) then {
			_sessionID = _target getVariable ['ExileSessionID','']; 
			[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['You got Spoted Bro', 'Incoming Special Forces']]] call ExileServer_system_network_send_to;
		} else {
			["EventWarning", ["You got Spoted Bro", "Incoming Special Forces"]] remoteExec ["BIS_fnc_showNotification", owner _target];
		};  
	};
};
if (_grpSide == BLUFOR ) then {
	if (WMS_IP_LOGs) then {diag_log format ["[INFANTRY PATROL GROUP]|TNA|TNA|TNA|TNA|TNA| Side = %1", _grpSide]};	
	_smokeGrenade = "SmokeShellGreen";
	if (_loadout == "army") then {_loadout = "army_b"};
	//[units _patrolGrp,'Random',_launcherChance,_skill,_loadout] call WMS_fnc_DynAI_SetUnitBLU;
	//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
	[units _patrolGrp,'Random',_launcherChance,_skill,nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	WMS_AI_bluforPatrol_Running pushback [time,(time+(_timer+(random _timer))),[_patrolGrp],[],_PatrolVRmkrList,[],[],""];
	WMS_AI_bluforPatrol_LastTime = time;
	publicVariable "WMS_AI_bluforPatrol_LastTime";
	{
		_PatrolVRmkr = createVehicle ["VR_Area_01_square_1x1_grey_F",[0,0,0], [], 10];
		_PatrolVRmkr setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,0.15)"];
		_PatrolVRmkr attachTo [_x,[0,0,0]];
		_PatrolVRmkrList pushback _PatrolVRmkr;
	} forEach units _patrolGrp ;
};

if (_steal) then {
	[_patrolGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
	} else {
	[_patrolGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol; //NEW //if (WMS_DynAI_Steal) then {[_grp] call WMS_DynAI_steal};
};