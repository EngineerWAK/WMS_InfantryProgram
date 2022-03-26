# WMS_InfantryProgram

v2.548a_2022MAR26_PreRelease on GitHub to try to get back some ExileMod compatibility

InfantryProgram (from the original name 3 years ago...) is a Dynamic AI/Mission system for Arma 3 dedicated servers.
It used to run with Exile Mod but not anymore (It might be compatible again).
It runs now on custom mpmission with CBA and ACE3.
SetUp is in WMS_InitSystem.sqf (mostly)
    WMS_serverCMDpwd    = "CHANGEME"; //IObviously important
    WMS_CustomizedMap	= []; //Maps custom setup I made, if your map is in it, check WMS_customMapsSettings.sqf, it mostly change loadouts, AI counts, missions counts. check for ClassNames if you don't use the same Mod(s)
    WMS_exileToastMsg 	= false; //Exile compatibility is broken right now
    WMS_exileFireAndForget 	= false; //Exile compatibility is broken right now
    WMS_InfantryProgram_list = []; //this is the original array using the functions I made for Exile, it add some stuff you can do (like call a trader or artillery support) and a lot you can not (like using vehicles).

    By default, the system should run with the old Vanilla setUp:
	execVM "\InfantryProgram\Scripts\WMS_List_VHL_Vanilla.sqf";
	execVM "\InfantryProgram\Scripts\WMS_List_Loadout_Vanilla.sqf";
    unless you use WMS_CustomizedMap.

Many things happen in WMS_fnc_DynAI_SelScen, every dynamic things happening on the server go through, depending the respect/vehicle/position/speed/whatever of the player, parameters a modified on the fly.