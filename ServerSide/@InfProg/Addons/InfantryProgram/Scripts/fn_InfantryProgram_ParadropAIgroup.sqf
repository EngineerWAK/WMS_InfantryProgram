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

//[_pos,_target,_timer,_skill,_grpSize,_grpSide,_loadout,_altitude,_launcherChance,_dist1,_dist2,_WPDist,_WPType,_WPBeha,_WPComb,_WPSpee]call TNA_fnc_InfantryProgram_ParadropAIgroup
//////////////////////////////////////////////////////////////////
//WMS_ParadropAI = [[time,timeToDelete,[groups],[vehicles],[objects],[markernames],[WPs],"reference"]]; //cleanup test

if (WMS_IP_LOGs) then {diag_log format ["[PARADROP GROUP]|TNA|TNA|TNA|TNA|TNA| _this = %1", _this]};
private ["_info","_PatrolVRmkrList","_smokeGrenade","_paraGrp","_leaderGrp","_posDZ","_sessionID","_smokePos"];
params[  
	"_pos",
	"_target",
	["_timer", 600, [0]],
	["_skill", 0.65,[0]],
	["_grpSize", 5,[0]],  
	["_grpSide", OPFOR,[]],
	["_loadout", "army", [""]], // selectRandom ["bandit", "army", "BlackOps", "heavyBandit"]
	["_altitude", 100,[0]],
	["_launcherChance", 10,[0]],  
	["_dist1", 10,[0]],  
	["_dist2", 100,[0]],
 	["_WPDist", 250, [0]],
	["_WPType", "MOVE", [""]],  
	["_WPBeha", "COMBAT", [""]],  
	["_WPComb", "RED", [""]],  
	["_WPSpee", "NORMAL", [""]],
 	["_difficulty", "difficult"]   
];

_PatrolVRmkrList = [];
_smokeGrenade = "SmokeShellOrange";
_info = "Paradrop";//"DYNAI"
/////HC STUFF/////
_HC1 = missionNameSpace getVariable ["WMS_HC1",false];
_HC1_ID = 2;
if (isDedicated && _HC1)then{
  {if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
};
/////HC STUFF\\\\\
_units = [];
for "_i" from 1 to _grpSize do {
	_units pushBack (selectRandom WMS_AI_Units_Class);
};
_paraGrp = [[(_pos select 0),(_pos select 1),_altitude], _grpSide, _units] call BIS_fnc_spawnGroup;
_leaderGrp = Leader _paraGrp;
{ 
	_randomSpawnPos = [[(_pos select 0),(_pos select 1),_altitude] , _dist1, _dist2, 0, 1, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
	_x setpos [(_randomSpawnPos select 0),(_randomSpawnPos select 1),_altitude]; 
	_x setVariable ["WMS_RealFuckingSide",_grpSide,true];
} forEach units _paraGrp ;

_posDZ = [(_pos select 0), (_pos select 1), _altitude];
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli2.wss", _target, false, _posDZ, 4, 1, 0];

WMS_ParadropAI_LastTime = time;
publicVariable "WMS_ParadropAI_LastTime";

if (_grpSide == OPFOR ) then {
	_info = "Paradrop";
	if (WMS_IP_LOGs) then {diag_log format ["[PARADROP GROUP]|TNA|TNA|TNA|TNA|TNA| Side = %1", _grpSide]};
	_smokeGrenade = "SmokeShellRed";
	if (isPlayer _target) then {
		_sessionID = _target getVariable ['ExileSessionID','']; 
		if (WMS_exileToastMsg) then {
				[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['You got Spoted Bro', 'Incoming Special Forces']]] call ExileServer_system_network_send_to;
			} else {
				["EventWarning", ["You got Spoted Bro", "Incoming Special Forces"]] remoteExec ["BIS_fnc_showNotification", owner _target];
			}; 
	};
};
if (_grpSide == BLUFOR ) then {
	_info = "DYNAI";
	if (WMS_IP_LOGs) then {diag_log format ["[PARADROP GROUP]|TNA|TNA|TNA|TNA|TNA| Side = %1", _grpSide]};	
	_smokeGrenade = "SmokeShellGreen";
	if (_loadout == "army") then {_loadout = "army_b"};
	{
		_PatrolVRmkr = createVehicle ["VR_Area_01_square_1x1_grey_F",[0,0,0], [], 10];
		_PatrolVRmkr setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,0.15)"];
		_PatrolVRmkr attachTo [_x,[0,0,0]];
		_PatrolVRmkrList pushback _PatrolVRmkr;
	} forEach units _paraGrp ;
	/*if (isPlayer _target) then {
		_sessionID = _target getVariable ['ExileSessionID','']; 
		if (WMS_exileToastMsg) then {[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Reinforcement', 'Incoming Special Forces']]] call ExileServer_system_network_send_to}; 
	};*/
};

_smokePos = [
	[((_pos select 0)-50),(_pos select 1),150],
	[((_pos select 0)+50),(_pos select 1),150],
	[(_pos select 0),((_pos select 1)-50),150],
	[(_pos select 0),((_pos select 1)+50),150]
];
_smokeGrenade createVehicle (selectRandom _smokePos);
////////////////NEW, HC OFFLOAD TEST////////////////
if (isDedicated && {_HC1} && {_HC1_ID != 2} && {WMS_OffloadToHC1}) then {
	if (true) then {diag_log format ["[WMS_fnc_InfantryProgram_ParadropAIgroup]|WMS|TNA|WAK| Offloading group to HC1, ID = %1, group = %2, pos = %3", _HC1_ID, _paraGrp, _pos]};
	_paraGrp setGroupOwner _HC1_ID;
	[(units _paraGrp),'para',_launcherChance,_skill,_difficulty,_loadout,nil,_info] remoteExec ["WMS_fnc_SetUnits",_HC1_ID];
	if (WMS_DynAI_Steal) then {
		[format["[RECEIVING OFFLOAD FROM SERVER]WMS_fnc_InfantryProgram_ParadropAIgroup %1",([_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]])]] RemoteExec ["diag_log",_HC1_ID];
		[_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] RemoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID];
	} else {
		[format["[RECEIVING OFFLOAD FROM SERVER]WMS_fnc_InfantryProgram_ParadropAIgroup %1",([_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]])]] RemoteExec ["diag_log",_HC1_ID];
		[_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]] RemoteExec ["WMS_fnc_Waypoints_Patrol",_HC1_ID];
	};
}else {
	[(units _paraGrp),'para',_launcherChance,_skill,_difficulty,_loadout,nil,_info] call WMS_fnc_SetUnits;
	if (WMS_DynAI_Steal) then {
		[_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "this call WMS_fnc_DynAI_Steal", [1,2,3]] call CBA_fnc_taskPatrol;
	} else {
		[_paraGrp, _pos, _WPDist, 3, _WPType, _WPBeha, _WPComb, _WPSpee, "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	};
};
WMS_AI_Paradrop_Watch pushback [time,(time+(_timer+(random _timer))),[_paraGrp],[],_PatrolVRmkrList,[],[],""];