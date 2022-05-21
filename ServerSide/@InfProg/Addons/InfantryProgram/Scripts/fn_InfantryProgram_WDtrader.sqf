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
//[_target,_pos,_patrolTimer,_vhl]call TNA_fnc_InfantryProgram_WDtrader
//////////////////////////////////////////////////////////////////

if (WMS_IP_LOGs) then {diag_log format ["[INFANTRY WD_TRADER]|TNA|TNA|TNA|TNA|TNA| _this = %1", _this]};
private _target = (_this select 0);
private _LZPos = (_this select 1);
private _patrolTimer = (_this select 2);
private _vhl = (_this select 3); //[vehicle name,[all crew],group]
private _chopperPos = position (_vhl select 0);

private _grp = creategroup INDEPENDENT;
"Exile_Trader_WasteDump" createUnit [_chopperPos, _grp, "WDtrader = this;"];
WDtrader setVariable ["ExileTraderType", "Exile_Trader_WasteDump",true];
WDtrader disableAI 'AUTOTARGET'; 
WDtrader disableAI 'TARGET'; 
WDtrader disableAI 'SUPPRESSION';
WDtrader disableAI "AUTOCOMBAT";
WDtrader moveInCargo (_vhl select 0);

WDtrader forceAddUniform "AOR2_Camo_Cyre";
WDtrader addVest "AOR2_Vest_1";
WDtrader addBackpack "AOR2_Backpack_KitBag";
WDtrader addHeadgear "AOR2_Boonie";
WDtrader addGoggles "G_Balaclava_oli";
WDtrader addMagazine ["hlc_30rnd_68x43_OTM", 5];
WDtrader addWeapon "hlc_rifle_ACR68_Carb_black";

WMS_WDtrader_LastTime = time;
publicVariable "WMS_WDtrader_LastTime";
   
private _WPT_WDtrader = _grp addWaypoint [_LZPos, 0];     
_WPT_WDtrader setWaypointType "GETOUT";

private _WPT_WDtrader1 = _grp addWaypoint [position _target, 3];     
_WPT_WDtrader1 setWaypointType "MOVE";
_WPT_WDtrader1 setWaypointCombatMode "GREEN";     
_WPT_WDtrader1 setWaypointbehaviour  "SAFE";

0 = [WDtrader, _patrolTimer] spawn {
	uisleep (_this select 1);
	[WDtrader,"KNEEL","FULL"] call BIS_fnc_ambientAnim;
	uisleep 5;
	WDtrader setdamage 1;  
	_Shaft = "CMflare_Chaff_Ammo" createVehicle (position (_this select 0));   
	_Shaft attachTo [(_this select 0), [0,0,0]];
};
	
1 = [WDtrader, _grp, _WPT_WDtrader, _WPT_WDtrader1] spawn {
	waituntil {!(alive (_this select 0))};
	//[_group,[_vehicles],[_markers],[_waypoint]] call TNA_fnc_Ivl2_cleanup;
	[(_this select 1),[(_this select 0)],[],[(_this select 2),(_this select 3)]] call WMS_fnc_lvl2_cleanup;
};