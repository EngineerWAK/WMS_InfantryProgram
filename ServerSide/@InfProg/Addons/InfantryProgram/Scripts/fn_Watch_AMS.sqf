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

private ["_unitsToFire","_AMSRunningMissions","_fps","_missionToSpawn","_missionVarName","_pos","_clnT","_grps","_vhls","_objs","_Mines","_mkrs","_wps","_ref","_rwds","_name","_difficulty","_clnObj","_lootCount","_lootType","_mission","_flag","_cnt","_crateOwner","_msg"];
_AMSRunningMissions = (count WMS_AMS_Running_Array);
_fps = diag_fps;
if (WMS_IP_LOGs) then {
	diag_log format ["[AMS WATCH]|WAK|TNA|WMS| %1 Missions Running, Server fps: %2", _AMSRunningMissions, _fps];
	//diag_log format ["[AMS WATCH]|WAK|TNA|WMS| %1 Missions Running, Server fps: %2", WMS_AMS_MissionsCount, _fps];
};

//Missions spawn
if ((WMS_AMS_MissionsCount < WMS_AMS_ToRun) && {_fps > WMS_AMS_MinFPS} && {time > (WMS_AMS_LastSpawn + (WMS_AMS_TbtwMissions select 0) + (random (WMS_AMS_TbtwMissions select 1)))}) then {
	_missionToSpawn = selectRandom WMS_AMS_Missions;
	if (_missionToSpawn in WMS_AMS_Missions_Running) then {
		if (WMS_IP_LOGs) then {
			diag_log format ["[AMS WATCH]|WAK|TNA|WMS| Mission %1 Already Running", _missionToSpawn];
		};
	} else {
		//SPAWN LAG DEBUG
		if (true) then {diag_log format ["[AMS SPAWN LAG DEBUG]|WAK|TNA|WMS|Mission Selected, 3 secondes to launch spawn, server time %1, %2", serverTime, _missionToSpawn]};
		/////////////////
		["EventCustomGreen", ["Advanced Mission System", (format ["Spawning %1, get ready for some Lag",_missionToSpawn]), "\A3\ui_f\data\GUI\Cfg\GameTypes\seize_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
		
		/*if (isDedicated && {missionNameSpace getVariable ["WMS_HC1",false]}) then {
			_HC1_ID = 2;
			{if (name _x == "HC1" && {!hasInterface})then{_HC1_ID = owner _x};}forEach AllPlayers;
			if (_HC1_ID != 2)then{
				//here, need a solution to make the HC find a position, but not for ALL missions
					//[_missionToSpawn] remoteExec ["WMS_fnc_AMS_remoteFindPos",_HC1_ID];
				//HC Send back:
					//[_missionToSpawn,[0,0,0]] remoteExec ["WMS_fnc_AMS_SpawnMission",2];
			}else{
				[_missionToSpawn] call WMS_fnc_AMS_SpawnMission;
			};
		}else{
			[_missionToSpawn] call WMS_fnc_AMS_SpawnMission;
		};*/

		[_missionToSpawn]spawn {
			uisleep 3; //wait a bit so we might finally get the message BEFORE the mission spawn...
			_this call WMS_fnc_AMS_SpawnMission;
			//MAYBE THE LAG COME FROM THE HIDEOBJECTGLOBAL
		};
	};
	
};

//Missions Cleanup 
if (_AMSRunningMissions > 0) then {
	{
		_pos = (_x select 0);
		_clnT = (_x select 1);
		_grps = (_x select 2);
		_vhls = (_x select 3);
		_objs = (_x select 4);
		_Mines = (_x select 5);
		_mkrs = (_x select 6);
		_wps = (_x select 7);
		_ref = (_x select 8);
		_rwds = (_x select 9);
		_name = (_x select 10);
		_difficulty = (_x select 11);
		_clnObj = (_x select 12);
		_lootCount = (_x select 13);
		_lootType = (_x select 14);
		_mission = (_x select 15);
		_flag 	= (_objs select 0);
		_cnt = 0;
		{
			_cnt = _cnt + ({alive _x} count units _x);
		} foreach _grps;
		if (_cnt == 0) then {
			_crateOwner = ([_pos, WMS_AMS_PlayerDistSucces] call WMS_fnc_AMS_ClstPlayer);
			//if (_crateOwner != "none") then {
			if (isPlayer _crateOwner) then { //NEED A FIX //////////////////////////////////////////////
				if (WMS_IP_LOGs) then {diag_log format ["[Advanced Mission System]|WAK|TNA|WMS| %1, %2 Completed!", _name, _ref]};
				_msg = format ["%1 Captured %2", (name _crateOwner), _name];
				[_objs,_Mines,_mkrs,_wps,_grps,_msg,_pos,_rwds,_difficulty,_clnObj,_lootCount,_lootType] call WMS_fnc_AMS_Succes;
				WMS_AMS_Running_Array deleteAt (WMS_AMS_Running_Array find _x);
				WMS_AMS_Missions_Running deleteAt (WMS_AMS_Missions_Running find _mission)
			};
		} else {_cnt = 0};
		if (time > _clnT) then {
			_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
			//if (_crateOwner == "none") then {
			if (!isPlayer _crateOwner) then { //NEED A FIX //////////////////////////////////////////////
				if (WMS_IP_LOGs) then {diag_log format ["[Advanced Mission System]|WAK|TNA|WMS| %1, %2 timed out, to be deleted", _name, _ref]};
				_msg = format ["%1, moving away", _name];
				[_grps,_vhls,_objs,_Mines,_mkrs,_wps,_rwds,_msg] call WMS_fnc_AMS_TimedOut;
				WMS_AMS_Running_Array deleteAt (WMS_AMS_Running_Array find _x);
				WMS_AMS_Missions_Running deleteAt (WMS_AMS_Missions_Running find _mission)
			};
		};
		if (_flag getVariable ["WMS_AMS_DoFire",false])then{
			if (serverTime > (_flag getVariable ["WMS_AMS_DoFireNext",serverTime]))then {
				_unitsToFire = [];
				{
					{
						if (_x isKindOf "Man" && {typeOf (vehicle _x) in WMS_AMS_ArtyDoFire})then{_unitsToFire pushBack _x};
					}forEach units _x;
				}foreach _grps;
				if (count _unitsToFire != 0)then{
					[_unitsToFire] spawn WMS_fnc_AMS_Mission_Static_DoFire;
					//_flag setVariable ["WMS_AMS_DoFireNext",serverTime+300+(random 450)];
					_flag setVariable ["WMS_AMS_DoFireNext",serverTime+(WMS_AMS_DoFireTime select 0)+(random (WMS_AMS_DoFireTime select 1))];
				};
			};
		};
	} foreach WMS_AMS_Running_Array;
};