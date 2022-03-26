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
//[player, _object, _pos, _loadout, _amount] remoteExec ['WMS_fnc_InfantryProgram_loadouts'];
//////////////////////////////////////////////////////////////////

private _target = (_this select 0);
private _object = (_this select 1);
private _pos = (_this select 2);
private _loadout = (_this select 3);
private _amount = (_this select 4);
private _lockerMoney = _target getVariable ['ExileLocker', 0];

    if(_lockerMoney > _amount) then
    { 
		_lockerMoney1 = _target getVariable ['ExileLocker', 0];
    	_playerMoney = _target getVariable ['ExileMoney', 0];
		_lockerMoney = _lockerMoney1 - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_target setVariable ['ExileMoney', _playerMoney, true];
		_target setVariable ['ExileLocker', _lockerMoney, true];
    	format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
 if (WMS_InfantryProgram_LOGs) then {
 		diag_log format ["[LOADOUTS]|WAK|TNA|WMS| _this = %1 |WAK|TNA|WMS|", _this];
 };

//LOADOUT on the player
removeAllItems _target;
removeHeadgear _target;
removeGoggles _target;
removeBackpackGlobal _target;
removeAllAssignedItems _target;
_target linkItem "Exile_Item_XM8";
_target linkItem "ItemCompass";
_target linkItem "ItemGPS";
_target linkItem "ItemMap";
_target linkItem "ItemRadio";
_target linkItem "NVGoggles_INDEP";
_target forceaddUniform selectrandom (_loadout select 0);
_target addVest selectrandom (_loadout select 1);
_target addHeadGear selectrandom (_loadout select 2);
_target addBackpackGlobal selectrandom (_loadout select 3);
_target addGoggles selectrandom (_loadout select 4);
_target additem  "Exile_Item_Bandage";
_target additem  "Exile_Item_InstaDoc";
_target additem  "Exile_Item_EMRE";
_target additem  "Exile_Item_PlasticBottleCoffee";
_target additem  "Exile_Item_CanOpener";

    } else {
     systemChat "Nope! you are too poor!";
 if (WMS_InfantryProgram_LOGs) then {
 	 diag_log format ["[LOADOUTS]|WAK|TNA|WMS|  %1 too poor to get a loadout |WAK|TNA|WMS|", _target];
 };
     //["ErrorTitleOnly", ["Dude! get some money!"]] call ExileClient_gui_toaster_addTemplateToast;
    };