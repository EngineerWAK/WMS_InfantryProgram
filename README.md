# WMS_InfantryProgram

v2.548a_2022MAR26_PreRelease on GitHub to try to get back some ExileMod compatibility<br/>

InfantryProgram (from the original name 3 years ago...) is a Dynamic AI/Mission system for Arma 3 dedicated servers.<br/>
It used to run with Exile Mod but not anymore (It might be compatible again).<br/>
It runs now on custom mpmission with CBA and ACE3.<br/>
Note that the all system is not optimized for big servers with tons of players.<br/>
Yes there is some old weird way to do things and old funtions, but it works even if it's not perfect, which is enough for me.<br/>
I strongly suggest to use LambsDanger (server side only), it help a lot with the retarded Bohemia's NPCs: https://github.com/nk3nny/LambsDanger<br/>

SetUp is in WMS_InitSystem.sqf (mostly):

    WMS_serverCMDpwd    = "CHANGEME"; //Obviously important
    WMS_CustomizedMap	= []; //Maps custom setup I made, if your map is in it, check WMS_customMapsSettings.sqf, it mostly change loadouts, AI counts, missions counts. Check for ClassNames if you don't use the same Mod(s)
    WMS_exileToastMsg 	= false; //Exile compatibility is broken right now
    WMS_exileFireAndForget 	= false; //Exile compatibility is broken right now
    WMS_InfantryProgram_list = []; //this is the original array using the functions I made for Exile some time ago, it add some stuff you can do (like call a trader or artillery support) and a lot you can not (like using vehicles).

    By default, the system should run with the old Vanilla setUp, no mods required (beside CBA):
	execVM "\InfantryProgram\Scripts\WMS_List_VHL_Vanilla.sqf";
	execVM "\InfantryProgram\Scripts\WMS_List_Loadout_Vanilla.sqf";
    unless you use WMS_CustomizedMap.

Many things happen in WMS_fnc_DynAI_SelScen, every dynamic things happening on the server go through, depending the respect/vehicle/position/speed/whatever of the player, parameters are modified on the fly.<br/>

## License

&copy; 2022 {|||TNA|||}WAKeupneo

For any part of this work for which the license is applicable, this work is licensed under the [Attribution-NonCommercial-NoDerivatives 4.0 International](http://creativecommons.org/licenses/by-nc-nd/4.0/) license. See LICENSE.CC-BY-NC-ND-4.0.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>

Any part of this work for which the CC-BY-NC-ND-4.0 license is not applicable is licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/). See LICENSE.MPL-2.0.

Any part of this work that is known to be derived from an existing work is licensed under the license of that existing work.