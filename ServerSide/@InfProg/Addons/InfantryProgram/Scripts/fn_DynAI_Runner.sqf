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
//[_target,_pos, _serverTimer, _spawnType, _iterations]spawn WMS_fnc_DynAI_Runner
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[SUICIDE BOMBER]|WAK|TNA|WMS| _this = %1", _this]};
private ["_exploList","_run","_safePos","_grp","_runner","_sessionID","_expl1","_expl2","_expl3"];
params[
	"_target",
	"_pos",
	["_Timer", 120],
	["_spawnType", "player"],
	["_iterations", 1],
	["_exploType",(selectRandom ["mine","satchel","shell","bomb"])] //"mine","satchel","shell","bomb"
	
];
_safePos = [];
_run = true;
_exploList = []; //pushback
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
_runner setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
_runner setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger

if (_spawnType == 'para') then {
	_runner setPos [(position _runner select 0),(position _runner select 1),100];
	};
[(units _grp),"SuicideBomber",0,1,nil,"bandit",nil,"DYNAI"] call WMS_fnc_SetUnits;

switch (toLower _exploType) do {
	case  "mine" 	: {
		_expl1 = (WMS_RunnerTypes select 0) createVehicle (position _runner);   
		_expl1 attachTo [_runner, [-0.15,0.08,0],'Pelvis',true];   
		_expl1 setVectorDirAndUp [[-0.20,0.20,0],[0,0,0.5]]; 
		_exploList pushBack _expl1;
		_expl2 = (WMS_RunnerTypes select 0) createVehicle (position _runner);   
		_expl2 attachTo [_runner, [0,0.15,0],'pelvis',true];   
		_expl2 setVectorDirAndUp [[0,0,0],[0,0,0]];  
		_exploList pushBack _expl2;
		_expl3 = (WMS_RunnerTypes select 0) createVehicle (position _runner);   
		_expl3 attachTo [_runner, [0.15,0.08,0],'Pelvis',true];   
		_expl3 setVectorDirAndUp [[0.20,0.20,0],[0,0,0.5]];	 
		_exploList pushBack _expl3;
	};
	case  "satchel" : {
		_expl1 = (WMS_RunnerTypes select 1) createVehicle (position _runner);   
		_expl1 attachTo [_runner, [0,0.15,0],'pelvis',true];   
		_expl1 setVectorDirAndUp [[0,0,0],[0,0,0]];  
		_exploList pushBack _expl1;
	};
	case  "shell" 	: {
		_expl1 = (WMS_RunnerTypes select 2) createVehicle [0,0,450];
		_expl1 allowDamage false;
		_expl1 attachTo [_runner, [-0.15,0.08,0.2],'Pelvis',true];   
		_expl1 setVectorDirAndUp [[0,0,1],[1,0,0]]; 
		_exploList pushBack _expl1;
		_expl2 = (WMS_RunnerTypes select 2) createVehicle [0,0,460];  
		_expl2 allowDamage false; 
		_expl2 attachTo [_runner, [0.15,0.08,0.2],'Pelvis',true];   
		_expl2 setVectorDirAndUp [[0,0,1],[1,0,0]];	 
		_exploList pushBack _expl2;
	};
	case  "bomb" 	: {
		_expl1 = (WMS_RunnerTypes select 3) createVehicle [0,0,400];
		_expl1 allowDamage false;
		_expl1 attachTo [_runner, [0,-0.40,0.5],'pelvis',true];   
		_expl1 setVectorDirAndUp [[0,0,1],[1,0,0]];  
		_exploList pushBack _expl1;
	};
};

playSound3D ["A3\Sounds_F\sfx\Alarm_BLUFOR.wss", _target, false, position _runner, 1, 1, 0];
if (WMS_exileToastMsg) then {
	_sessionID = _target getVariable ['ExileSessionID',''];
	for "_i" from 1 to _iterations do {
		[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['Suicide Bomber', 'Incoming Runner!!!']]] call ExileServer_system_network_send_to;
		sleep 1;
	};
} else {
	if (isDedicated)then{
		["EventWarning", ["Suicide Bomber", "Incoming Runner!!!"]] remoteExec ["BIS_fnc_showNotification", owner _target];
	}else{
		//Here I need to send the reqest to the server and the server send the remoteexec to the _target
		[["EventWarning", ["Suicide Bomber", "Incoming Runner!!!"]],_target] remoteExec ["WMS_fnc_remoteNotification", 2];
	};
};
WMS_DynAI_Running pushback [serverTime,(serverTime+_Timer),[_grp],[],[],[],[],""];

//while {alive leader _grp} do {
while {_run} do {
	uisleep 1.5;
	leader _grp domove (position (vehicle _target));
	if !(alive leader _grp) then {
		{
			if (_exploType == "bomb"||_exploType == "shell") then {_x allowDamage true;detach _x};
			_x SetDamage 1; 
			uisleep 0.3;
		}forEach _exploList;
		_exploList = [];
		_run = false;
	}; 
	if (leader _grp distance2D _target <= 25 || leader _grp distance2D _target >= 600) then {
		{
			if (_exploType == "bomb"||_exploType == "shell") then {_x allowDamage true;detach _x};
			_x SetDamage 1; 
			uisleep 0.3;
		}forEach _exploList;
		_exploList = [];
		_run = false;
	}; 
uisleep 1.5;
};