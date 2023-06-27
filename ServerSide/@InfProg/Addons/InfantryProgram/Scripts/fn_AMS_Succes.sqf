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

//[_objs,_mkrs,_wps,_grps] call WMS_fnc_AMS_Succes;
private ["_shitDrop","_AMS_Abuse","_AMS_Start","_missionID","_staticsList","_target","_talk","_music","_crateOwner"];
params ["_objs","_Mines","_mkrs","_wps","_grps","_msg","_pos","_rwds","_difficulty","_clnObj","_lootCount","_lootType"];
_target = (_objs select 0);
_staticsList 	= _target getVariable ["WMS_StaticsList", []];
_missionID 		= _target getVariable ["AMS_MissionID", ""];
//////////here we need an "ABUSE" check, before spawning the reward, so players who bomb the mission from 10km away won't get anything
//_x setVariable ["AMS_MissionID",_missionID,true] //from unit creation, get the mission ID
//mission start will count all mission units and create "hexaID_AMS_Start" as reference
//unit abuse will add 1 point from "hexaID_AMS_Abuse" 
//each NPC kill will check parameters like: non player killer (arty or accident), player vehicle (tank/APC/AttackChopper), player distance and add 1 abuse point to "hexaID_AMS_Abuse"
//if mission succes "hexaID_AMS_Abuse" >= "hexaID_AMS_Start" then {vehicle reward destroyed} and _lootType == "abuse" == empty crate
//if mission succes "hexaID_AMS_Abuse" == x% of "hexaID_AMS_Start" then {reduce _lootCount to something ridiculous}
//new variables: WMS_AMS_Abuse = true; WMS_AMS_AbuseLvl1 = 60; WMS_AMS_AbuseLvl2 = 80; //% of units abused
_AMS_Start = missionNameSpace getVariable [format["%1_AMS_Start",_MissionID],25]; //in case I fucked up somewhere, 25 as default AIs count
_AMS_Abuse = missionNameSpace getVariable [format["%1_AMS_Abuse",_MissionID],0]; //in case I fucked up somewhere, 0 as default Abused AIs
_AMS_coef1 = (WMS_AMS_AbuseLvl1*_AMS_Start)/100;
_AMS_coef2 = (WMS_AMS_AbuseLvl2*_AMS_Start)/100;
_spawnReward = true;
_signal = "F_Signal_green";

if (WMS_AMS_Abuse) then {
	if (_AMS_Abuse >= _AMS_coef2) then { //destroy the vehicle reward do not spawn the crate
		_spawnReward = false;
		_signal = "F_Signal_red";
		_lootCount = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag] //[how many different items, count of each, + random]
	}else{
		if (_AMS_Abuse >= _AMS_coef1) then {
			_signal = "F_Signal_red";
			_lootCount = [[1,1,0],[1,1,0],[1,1,0],[1,1,0],[0,0,0]]; //[_weap,_bag,_items,_ammoList,_mag] //[how many different items, count of each, + random]
		}else{
			//empty for now
		};
	};
};

_signal createVehicle _pos;
{deleteMarker _x} foreach _mkrs; 
{deleteWaypoint _x} foreach _wps;
{deleteGroup _x} forEach _grps; 

if (((count _rwds) != 0) && {typeName (_rwds select 0) == "OBJECT"}) then {
	{
		_x enableSimulationGlobal true;
		_x allowDamage true;
		if (_spawnReward) then {
			_x setvehiclelock "UNLOCKED";
			_x setVariable ["ExileAccessDenied", false];
			_x enableRopeAttach true; 
		}else{
			_x setDamage 1;
		};
	} forEach _rwds;
};
//MISSION_ROOT = format ["mpmissions\%1.%2\", "__cur_mp", worldName];
/*
// would return e.g "C:\Users\Username\Documents\Arma 3\missions\MissionName.Altis\icons\myIcon.paa"
private _path = getMissionPath "icons\myIcon.paa";
private _path = getMissionPath "\icons\myIcon.paa"; // leading \ is also fine
*/
_talk = selectRandom ["usareasecure","usobjectivesecure","uspointcaptured","britareasecure","britobjectivesecure","britpointcaptured"];
_music = selectRandom ["uswin","britwin"];
_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
[_crateOwner, _talk] remoteExec ['say3D',0,false];
playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg",_music], _target, false, position _target, 2, 1, 0];
[_msg] remoteexec ['SystemChat',0];
if (WMS_exileToastMsg) then {
	["toastRequest", ["SuccessTitleAndText", [_msg]]] call ExileServer_system_network_send_broadcast;
	} Else {
		["TaskSucceeded", ["Advanced Mission System", _msg]] remoteExec ["BIS_fnc_showNotification", -2];
	}; 
_target setVariable ["AMS_MissionStatus","SUCCES",true];
_target setVariable ["AMS_UnlockedBy",[_crateOwner],true];

if (_spawnReward) then {
	[_target,_rwds,_lootCount,_lootType,nil,nil,_difficulty] spawn WMS_fnc_AMS_SpawnRewards;
}else{
	//win the mission but loose the reward, how about a random shit drop? :D
	_shitDrop = selectRandom [3,2,1,0,1,2,3];
	if (_shitDrop == 1) then {[_pos,75,600,random 359,(WMS_BombList select 0)] spawn WMS_fnc_DynAI_Bombing;};
	if (_shitDrop == 2) then {[_pos,100,150,359,(selectRandom WMS_DynAI_EODBombs),6] spawn WMS_fnc_DynAI_ParaBombs;};
	if (_shitDrop == 3) then {[_pos,((WMS_DynAI_RainObjects select 3) select 0),200,500,10,0.9] spawn WMS_fnc_DynAI_RainObjects;};
};

WMS_AMS_MissionsCount = WMS_AMS_MissionsCount -1;
  
{deleteVehicle _x} forEach _Mines;
if (_clnObj && WMS_AMS_ClnObj) then {
	if (WMS_AMS_DestroyStatics) then {
		{//(gunner _x) action ["moveout",_x];
		_x setDamage 1;}forEach _staticsList;
	};
	uisleep WMS_AMS_clnObjT;
	if (WMS_AMS_AlarmCln) then {
		PlaySound3D ["A3\Sounds_F\sfx\siren.wss", _pos, false, _pos, 2, 1, 0];
	};
	uisleep 10;
	{
		 deleteVehicle _x
	}foreach _objs;
} else {
	if (WMS_AMS_DestroyStatics) then {
		{//(gunner _x) action ["moveout",_x];
		_x setDamage 1;}forEach _staticsList;
	};
	uisleep WMS_AMS_clnObjT;
	/*if (WMS_AMS_AlarmCln) then {
		PlaySound3D ["A3\Sounds_F\sfx\siren.wss", _pos, false, _pos, 2, 1, 0];
	};
	uisleep 10;*/
	{
		_x allowDamage true;
	}foreach _objs;
	if(WMS_AMS_DelMissionFlag) then {
		deleteVehicle _target;
		_objs deleteAt 0; //remove the Mission Flag from the Object list
	};
};