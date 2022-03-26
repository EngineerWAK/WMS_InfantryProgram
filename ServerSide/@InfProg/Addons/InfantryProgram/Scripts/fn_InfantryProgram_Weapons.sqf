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
//[player, _object, _pos, _loadout, _amount] remoteExec "TNA_fnc_InfantryProgram_Weapons";
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
 		diag_log format ["[WEAPONS]|TNA|TNA|TNA|TNA|TNA| _this = %1 |TNA|TNA|TNA|TNA|TNA|", _this];
 };

//WEAPONS in the Old Chest
  
	_primaryWeap = selectrandom (_loadout select 0);
	_primarAmmo = (getArray (configfile >> "CfgWeapons" >> _primaryWeap >> "magazines")) select 0;
	_object addMagazineCargoGlobal [_primarAmmo,10]; //ammo
	_object addWeaponCargoGlobal [_primaryWeap,1]; //primaryWeap, need ammo
	_object addItemCargoGlobal [selectrandom (_loadout select 2),1]; //scop
	
	_secondaryWeap = selectrandom (_loadout select 3);
	_secondaryAmmo = (getArray (configfile >> "CfgWeapons" >> _secondaryWeap >> "magazines")) select 0;
	_object addMagazineCargoGlobal [_secondaryAmmo,3]; //ammo
	_object addWeaponCargoGlobal [_secondaryWeap,1]; //secondary, need ammo 
	

	_object addItemCargoGlobal ["HandGrenade",3];
	_object addItemCargoGlobal ["SmokeShellGreen",1];
	_object addItemCargoGlobal ["SmokeShellRed",1];
	_object addItemCargoGlobal ["BWA3_Vector",1];

    } else {
     systemChat "Nope! you are too poor!";
 if (WMS_InfantryProgram_LOGs) then {
 	 diag_log format ["[WEAPONS]|TNA|TNA|TNA|TNA|TNA|  %1 too poor to get a Weapon |TNA|TNA|TNA|TNA|TNA|", _target];
 };
     //["ErrorTitleOnly", ["Dude! get some money!"]] call ExileClient_gui_toaster_addTemplateToast;
    };