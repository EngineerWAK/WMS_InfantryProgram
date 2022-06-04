/**
* WMS_DFO_init.sqf - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
	The DFO idea from Iceman/Project Hatchet Discord (https://discord.gg/YsRWVPvNeF) 
	was pretty close to mine when I built the module WMS_Event_ReconMission last year, which is running very basic and will probably stay this way.
	So there is the the "Chopper only" version, player (pilots?) activated and "repeatable".
	Standalone version will come after, when everything will be running fine.
*/
/*
	// from initServer
	// Start DynamicFlightOps
	if (true)then {execVM "\DFO\WMS_DFO_init.sqf"};
*/
/*
WMS_DFO_Version			= "v1.10_2022JUN04_GitHub";
*/
//////////////////////////////////////////
uisleep 10;
[] call WMS_fnc_DFO_createBaseAction;
if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_DFO_Init, System Started, %1',WMS_DFO_Version]};