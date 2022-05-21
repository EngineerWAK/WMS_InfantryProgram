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
//UPDATED NEW INFANTRYPROGRAM, ExileMod/TheLastCartridge compatible
//////////
//[player, _object, _pos, _loadout, _amount] remoteExec ['WMS_fnc_InfantryProgram_loadouts'];
//////////////////////////////////////////////////////////////////
private ["_lockerMoney"];
params [
	"_target",
	"_object", //WTF ?? not even used ???
	"_pos", //WTF ?? not even used ???
	"_loadout",
	["_amount", 5000]
];
/*private _target = (_this select 0);
private _object = (_this select 1);
private _pos = (_this select 2);
private _loadout = (_this select 3);
private _amount = (_this select 4);*/
_lockerMoney = 0;
if (WMS_exileFireAndForget) then { //Exile
	_lockerMoney = _target getVariable ['ExileLocker', 0];
}else{ //TheLastCartridge/ACE
	_lockerMoney = _target getVariable ['ExileMoney', 0];
};

if(_lockerMoney > _amount) then { 
	_lockerMoney = _lockerMoney - _amount;
	removeAllItems _target;
	removeHeadgear _target;
	removeGoggles _target;
	removeBackpackGlobal _target;
	removeAllAssignedItems _target; //that also remove the infantryProgram radio...
	_target linkItem "ItemCompass";
	_target linkItem "ItemGPS";
	_target linkItem "ItemMap";
	//_target linkItem "ItemRadio"; //NOOOOOOOOO!
	_target linkItem "NVGoggles_INDEP";
	_target forceaddUniform selectrandom (_loadout select 0);
	_target addVest selectrandom (_loadout select 1);
	_target addHeadGear selectrandom (_loadout select 2);
	_target addBackpackGlobal selectrandom (_loadout select 3);
	_target addGoggles selectrandom (_loadout select 4);

	if (WMS_exileFireAndForget) then {
		//Exile
		_target linkItem "Exile_Item_XM8";
		_target linkItem "ItemRadio";
		_target additem  "Exile_Item_Bandage";
		_target additem  "Exile_Item_InstaDoc";
		_target additem  "Exile_Item_EMRE";
		_target additem  "Exile_Item_PlasticBottleCoffee";
		_target additem  "Exile_Item_CanOpener";

    	_playerMoney = _target getVariable ['ExileMoney', 0];
		_poptabsplayer = _playerMoney + _lockerMoney;
		_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_target setVariable ['ExileMoney', _playerMoney, true];
		_target setVariable ['ExileLocker', _lockerMoney, true];
    	format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		if (WMS_IP_LOGs) then {
 			diag_log format ["[LOADOUTS_Exile]|WAK|TNA|WMS| _this = %1 |WAK|TNA|WMS|", _this];
 		};
	}else{ 
		//TheLastCartridge/ACE
		_target linkItem WMS_Utility_Item_2;
		_target additem  "ACE_bloodIV_250";
		_target additem  "ACE_EarPlugs";
		_target additem  "ACE_morphine";
		_target additem  "ACE_splint";
		_target additem  "ACE_splint";
		_target additem  "ACE_quikclot";
		_target additem  "ACE_quikclot";
		_target additem  "ACE_quikclot";
		_target additem  "ACE_morphine";
		_target additem  "ACE_tourniquet";
		_target additem  "ACE_tourniquet";
		_target additem  "ACE_Can_Spirit";
		_target additem  "ACE_MRE_ChickenHerbDumplings";

		_targetUID = getPlayerUID _target;
		_targetOwner = (owner _target);
		_playerUID_ExileMoney = "ExileMoney_"+_targetUID;
		_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
		_target setVariable ["ExileMoney", (_playerMoney-_amount), true];
		profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_amount)];
		if (WMS_IP_LOGs) then {
 			diag_log format ["[LOADOUTS_TheLastCartridges]|WAK|TNA|WMS| _this = %1 |WAK|TNA|WMS|", _this];
 		};
	};
} else {
    systemChat "Nope! you are too poor!";
 	if (WMS_IP_LOGs) then {
 		diag_log format ["[LOADOUTS]|WAK|TNA|WMS|  %1 too poor to get a loadout |WAK|TNA|WMS|", _target];
 	};
    //["ErrorTitleOnly", ["Dude! get some money!"]] call ExileClient_gui_toaster_addTemplateToast;
};