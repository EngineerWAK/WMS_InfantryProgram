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
//[_target,_pos, _timer, _spawnType, _iterations]spawn WMS_fnc_DynAI_Runner
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[SUICIDE BOMBER]|WAK|TNA|WMS| _this = %1", _this]};
private ["_run","_safePos","_grp","_runner","_sessionID","_expl1","_expl2","_expl3"];
params[
	"_target",
	"_pos",
	["_timer", 120],
	["_spawnType", "player"],
	["_iterations", 1]
	
];
_safePos = [];
_run = true;
if (_spawnType == 'player') then {
	if(surfaceIsWater (position _target))then{
		_safePos = [position _target, 150, 300, 1, 1, 0, 0, [], [[(position _target select 0),(position _target select 1)+150,1],[]]] call BIS_fnc_findSafePos;
	}else{
		_safePos = [position _target, 150, 300, 1, 0, 0, 0, [], [[(position _target select 0),(position _target select 1)+150,1],[]]] call BIS_fnc_findSafePos;
	};
};
if (_spawnType == 'trigger') then {_safePos = _pos};
if (_spawnType == 'para') then {
	if(surfaceIsWater (position _target))then{
		_safePos = [position _target, 50, 200, 0, 1, 0, 0, [], [[(position _target select 0),(position _target select 1)+100,300],[]]] call BIS_fnc_findSafePos;
	}else{
		_safePos = [position _target, 50, 200, 0, 0, 0, 0, [], [[(position _target select 0),(position _target select 1)+100,300],[]]] call BIS_fnc_findSafePos;
	};
};
_grp = createGroup [civilian, false];
_runner = _grp createUnit ["C_man_p_fugitive_F_afro",_safePos, [], 0, "FORM"];	
_runner disableAI "SUPPRESSION";
_runner disableAI "COVER";
_runner allowFleeing 0;

if (_spawnType == 'para') then {
	_runner setPos [(position _runner select 0),(position _runner select 1),100];
	};
[(units _grp),"SuicideBomber",0,1,nil,"bandit",nil,"DYNAI"] call WMS_fnc_SetUnits;

_expl1 = 'ClaymoreDirectionalMine_Remote_Ammo_Scripted' createVehicle (position _runner);   
_expl1 attachTo [_runner, [-0.15,0.08,0],'Pelvis'];   
_expl1 setVectorDirAndUp [[-0.20,0.20,0],[0,0,0.5]]; 
_expl2 = 'ClaymoreDirectionalMine_Remote_Ammo_Scripted' createVehicle (position _runner);   
_expl2 attachTo [_runner, [0,0.15,0],'pelvis'];   
_expl2 setVectorDirAndUp [[0,0,0],[0,0,0]]; 
_expl3 = 'ClaymoreDirectionalMine_Remote_Ammo_Scripted' createVehicle (position _runner);   
_expl3 attachTo [_runner, [0.15,0.08,0],'Pelvis'];   
_expl3 setVectorDirAndUp [[0.20,0.20,0],[0,0,0.5]];

playSound3D ["A3\Sounds_F\sfx\Alarm_BLUFOR.wss", player, false, position _runner, 1, 1, 0];
if (WMS_exileToastMsg) then {
	_sessionID = _target getVariable ['ExileSessionID',''];
	for "_i" from 1 to _iterations do {
		[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['Suicide Bomber', 'Incoming Runner!!!']]] call ExileServer_system_network_send_to;
		sleep 1;
	};
} else {
	//for "_i" from 1 to _iterations do {
		//[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['Suicide Bomber', 'Incoming Runner!!!']]] call ExileServer_system_network_send_to;
		//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
		["EventWarning", ["Suicide Bomber", "Incoming Runner!!!"]] remoteExec ["BIS_fnc_showNotification", owner _target];
		//sleep 1;
	//};
};
WMS_DynAI_Running pushback [time,(time+(_timer)),[_grp],[],[],[],[],""];

//while {alive leader _grp} do {
while {_run} do {
	uisleep 0.5;
	leader _grp domove (position (vehicle _target));
	if !(alive leader _grp) then {
		_expl1 setdammage 1;
		_expl2 setdammage 1;
		_expl3 setdammage 1;
		_run = false;
	}; 
	if (leader _grp distance2D _target < 20) then {
		_expl1 setdammage 1;
		_expl2 setdammage 1;
		_expl3 setdammage 1;
		_run = false;
	}; 
uisleep 1;
};