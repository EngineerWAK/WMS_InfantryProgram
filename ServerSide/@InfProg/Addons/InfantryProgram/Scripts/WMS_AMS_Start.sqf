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

if (WMS_IP_LOGs) then {diag_log format ["[Advanced Mission System STARTING]|WAK|TNA|WMS| WMS_AMS_MissionList: %1", WMS_AMS_MissionList]};
private ["_missionName","_missionWeight","_missionVarName"];
//Acces to the Database for Persistent vehicles, thank you DMS/eraser1
/*Useless for now since AMS doesnt spawn any permanent vehicle
if (WMS_exileFireAndForget) then {
	if !("isKnownAccount:AMS_Vehicle" call ExileServer_system_database_query_selectSingleField) then
	{
		"createAccount:AMS_Vehicle:AMS_Vehicle" call ExileServer_system_database_query_fireAndForget;
	};
};*/
//Init all Mission Objects
execVM "\InfantryProgram\Scripts\WMS_AMS_AllMissionObjects.sqf";
//Init the missions
{
	_missionName = (_x select 0);
	_missionWeight = (_x select 1);
	for "_i" from 1 to _missionWeight do {WMS_AMS_Missions pushBack _missionName};

	//_missionVarName = format ["AMS_Mission_%1",_missionName]; //This is useless for now
	//missionNamespace setVariable [_missionVarName, (format ['WMS_fnc_AMS_Mission_%1',_missionName])]; //This is useless for now
	//compileFinal preprocessFileLineNumbers (format ["\InfantryProgram\Scripts\Missions\%1.sqf",_missionName]);
	if (WMS_IP_LOGs) then {diag_log format ["[Advanced Mission System PROCESSING]|WAK|TNA|WMS| _missionName: %1 || _missionWeight %2 || _missionVarName deactivated", _missionName,_missionWeight]};//,(missionNamespace getVariable (format ["AMS_Mission_%1",_missionName]))
} forEach WMS_AMS_MissionList;

if (WMS_IP_LOGs) then {diag_log format ["[Advanced Mission System PROCESSING]|WAK|TNA|WMS| WMS_AMS_MissionList: %1", WMS_AMS_Missions]};