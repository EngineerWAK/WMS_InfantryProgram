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
private ["_target","_talk","_music","_crateOwner"];
params ["_objs","_Mines","_mkrs","_wps","_grps","_msg","_pos","_rwds","_difficulty","_clnObj","_lootCount","_lootType"];
_target = (_objs select 0);
"F_Signal_green" createVehicle _pos;
{deleteMarker _x} foreach _mkrs; 
{deleteWaypoint _x} foreach _wps;
{deleteGroup _x} forEach _grps; 
{
	_x setvehiclelock "UNLOCKED";
	_x setVariable ["ExileAccessDenied", false];
	_x enableSimulationGlobal true;
	_x enableRopeAttach true; 
	_x allowDamage true;
	//_x setVariable ["ExileIsLocked",0];
} forEach _rwds;
//MISSION_ROOT = format ["mpmissions\%1.%2\", "__cur_mp", worldName];
/*
// would return e.g "C:\Users\Username\Documents\Arma 3\missions\MissionName.Altis\icons\myIcon.paa"
private _path = getMissionPath "icons\myIcon.paa";
private _path = getMissionPath "\icons\myIcon.paa"; // leading \ is also fine
*/
_talk = selectRandom ["usareasecure","usobjectivesecure","uspointcaptured","britareasecure","britobjectivesecure","britpointcaptured"];
_music = selectRandom ["uswin","britwin"];
//_speaker = _target nearEntities [WMS_PlayerEntity, WMS_AMS_PlayerDistSucces];
_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
//[(_speaker select 0), _talk] remoteExec ['say3D',0,false];
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
//[_target,_rwds,_Msg,_load,_difficulty,_Altitude,_SmokeColor,_LightColor] spawn WMS_fnc_AMS_SpawnRewards; //_load would be the "container" under the parachute
[_target,_rwds,_lootCount,_lootType,nil,nil,_difficulty] spawn WMS_fnc_AMS_SpawnRewards;

WMS_AMS_MissionsCount = WMS_AMS_MissionsCount -1;
  
{deleteVehicle _x} forEach _Mines;
if (_clnObj && WMS_AMS_ClnObj) then {
	uisleep WMS_AMS_clnObjT;
	if (WMS_AMS_AlarmCln) then {
		PlaySound3D ["A3\Sounds_F\sfx\siren.wss", _pos, false, _pos, 2, 1, 0];
	};
	uisleep 10;
	{
		 deleteVehicle _x
	}foreach _objs;
} else {
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