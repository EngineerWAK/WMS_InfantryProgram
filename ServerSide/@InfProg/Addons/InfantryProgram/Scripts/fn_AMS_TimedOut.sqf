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

//////////////////////////////////////////////////////////////////
//[_grps,_vhls,_objs,_mkrs,_wps,_rwds] call WMS_fnc_AMS_TimedOut;
params ["_grps","_vhls","_objs","_Mines","_mkrs","_wps","_rwds","_msg"];
private _pos = GetPosATL (_objs select 0);
if (WMS_AMS_AlarmCln) then {
	PlaySound3D ["A3\Sounds_F\sfx\siren.wss", _pos, false, _pos, 2, 1, 0];
};
[_msg] remoteexec ['SystemChat',0];
if (WMS_exileToastMsg) then {["toastRequest", ["ErrorTitleAndText", ["Mission Timed Out",_msg]]] call ExileServer_system_network_send_broadcast;};
//["toastRequest", ["InfoTitleAndText", ["blablabla title", "blablabla message"]]] call ExileServer_system_network_send_broadcast;
private _music = selectRandom ["germanwin"];
playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg",_music], (_objs select 0), false, _pos, 2, 1, 0];
{{deleteVehicle _x} foreach units _x} forEach _grps; 
{deleteVehicle _x} forEach _vhls;  
{deleteVehicle _x} forEach _objs;  
{deleteVehicle _x} forEach _Mines;
{deleteMarker _x} foreach _mkrs; 
{deleteWaypoint _x} foreach _wps;
if (count _rwds != 0 && {typeName (_rwds select 0) == "OBJECT"}) then {{deleteVehicle _x} forEach _rwds;};
{deleteGroup _x} forEach _grps;

WMS_AMS_MissionsCount = WMS_AMS_MissionsCount -1;