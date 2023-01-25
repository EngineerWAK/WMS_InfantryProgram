# WMS_InfantryProgram


v2.794_2023JAN25_GitHub<br/>
    ADDED Judgement Day mission, can be called fron the Infantry Computer. 10 waves of NPC spawning in the building around + few civilians running<br/>
        WMS_fnc_JudgementDay<br/>
        WMS_JudgementDay	 	= true;<br/>
        WMS_JudgementDay_Run 	= false;<br/>
        WMS_JudgementDay_Rad 	= 100;<br/>
        WMS_JMD_PlayerTrigList 	= [];<br/>
        WMS_JudgementDay_Array 	= [nil,[0,0,0],0,[],[],[],[],["JMD_mkr1","JMD_mkr2","JMD_mkr3","_JMD_mkr4","_JMD_mkr5"],[]];<br/>

v2.756_2022NOV12_GitHub<br/>
    "headshot" eventHandler on NPCs for Missions And roamings. <br/>
        NPC's should first loose their Helmet (if low damage to the head/face). (thanks Pierremgi from bohemia forum for the exemple)<br/>
        And/or instant forced death if higer damage to the head/face.<br/>
        Without helmet, ACE deal(should) more Damage to the NPCs and no need 5 headshots with 7.62AP to kill a bandit.<br/>

v2.7_2022OCT20_GitHub<br/>
    Introducing "Fast Combat" options WMS_FastCombat = true; (dafault = false)<br/>
        Reduce all cooldowns<br/>
        Increase chances for triggers to spawn NPCs more often<br/>
        Reduce dynamic threat timers/coefs<br/>
        Add a Fast Combat Activation Marker on the map (bottom)<br/>
        Logged Admins can activate/deactivate Fast Combat anytime in the console<br/>

v2.569_2022APR02_GitHub Exile Mod is fully compatible again<br/>
v2.548a_2022MAR26_PreRelease on GitHub to try to get back some Exile Mod compatibility<br/>

InfantryProgram (from the original name in February 2019) is a Dynamic AI/Mission system for Arma 3 dedicated servers.<br/>
It used to run with Exile Mod but not anymore (It might be compatible again).<br/>
It runs now on custom mpmission with CBA and ACE3.<br/>
Note that the all system is not optimized for big servers with tons of players.<br/>
Yes there is some old\weird way to do things and old functions, but it works even if it's not perfect, which is enough for me.<br/>
I strongly suggest to use LambsDanger (server side only), it help a lot with the retarded Bohemia's NPCs: https://github.com/nk3nny/LambsDanger<br/>

SetUp is in WMS_InitSystem.sqf (mostly):

    WMS_serverCMDpwd    = "CHANGEME"; //Obviously important
    WMS_CustomizedMap	= []; //Maps custom setup I made, if your map is in it, check WMS_customMapsSettings.sqf, it mostly change loadouts, AI counts, missions counts. Check for ClassNames if you don't use the same Mod(s)
    WMS_exileToastMsg 	= false; //Exile Mod only
    WMS_exileFireAndForget 	= false; //Exile Mod only
    WMS_InfantryProgram_list = []; //this is the original array using the functions I made for Exile some time ago, it add some stuff you can do (like call a trader or artillery support) and a lot you can not (like using vehicles).

    By default, the system should run with the old Vanilla setUp, no mods required (beside CBA and ACE3/Exile Mod):
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