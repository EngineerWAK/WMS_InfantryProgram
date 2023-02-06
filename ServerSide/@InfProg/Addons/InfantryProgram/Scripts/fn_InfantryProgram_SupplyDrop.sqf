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

//[player, position player, primaryWeapon player, handgunWeapon player, 3500, "mission"] remoteexec ["TNA_fnc_SupplyDrop"];


if (WMS_IP_LOGs) then {diag_log format ["[SUPPLYDROP]|TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA| Supplydrop request from %1 at %2, mission: %3 |TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA|", (_this select 0),(_this select 1),(_this select 5)]};
private _target 	= (_this select 0);
private _pos 		= (_this select 1);
private _weap1st	= (_this select 2); //change
private _weap2nd	= (_this select 3); //change
private _amount		= (_this select 4); //10000
private _mission	= (_this select 5); //NEW|NEW|NEW|NEW|NEW|NEW|NEW|NEW| //"Ammo", "ToolKit", "launcher"
private _lockerMoney = _target getVariable ['ExileLocker', 0];

if(_lockerMoney > _amount) then //THATS VERY OLD, NEED TO UPDATE
    { 
		_lockerMoney1 = _target getVariable ['ExileLocker', 0];
    	_playerMoney = _target getVariable ['ExileMoney', 0];
		_lockerMoney = _lockerMoney1 - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_target setVariable ['ExileMoney', _playerMoney, true];
		_target setVariable ['ExileLocker', _lockerMoney, true];
    	format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
 	if (WMS_IP_LOGs) then {
 		diag_log format ["[SUPPLYDROP]|TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA| Supplydrop Accepted for %1 at %2 |TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA|", _target, _pos];
 	};

playSound3D ["a3\dubbing_radio_f\Sfx\out2c.ogg", _target, false, getPosATL _target, 1,1,0]; 
uisleep 0.5; 
playSound3D ["a3\dubbing_f\modules\supports\drop_acknowledged.ogg", _target, false, getPosATL _target, 1,1,0]; 
uisleep 1; 
 
private _load   = selectrandom ["Box_Syndicate_Ammo_F","Box_Syndicate_Wps_F","Box_Syndicate_WpsLaunch_F"];
private _altitude  = 200; 
private _offsetZ  = 0;
private _randomDist = 250;
private _parachuteType = "NonSteerable_Parachute_F";
//Mission Variables
if (_mission == "Ammo" ) then {_altitude  = 150;};
if (_mission == "ToolKit" ) then {_load = WMS_AMS_Crate_noMove; _offsetZ  = 1; _randomDist = 50; _parachuteType = "B_Parachute_02_F";};//Exile_Container_OldChest
if (_mission == "Launcher" ) then {_load = "Box_Syndicate_WpsLaunch_F"; _altitude = 150; _randomDist = 100;};

////////////////////////////////////////
private _posDZ = [[[_pos, _randomDist]],[]] call BIS_fnc_randomPos; //from 250 to 100
 
private _parachute  = createVehicle [_parachuteType,[0,0,0], [], 10]; //change for cargo parachute
_parachute  setdir winddir; 
_parachute  setPos [(_posDZ select 0),(_posDZ select 1),_altitude] ; 
_parachute  setvelocity [0,0,-5]; 
 uisleep 1;
private _cargo = createVehicle [_load ,[0,0,0], [],10];  
_cargo allowdamage false; 
_cargo attachTo [_parachute,[0,0,_offsetZ]];
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _target, false, _posDZ, 2, 1, 0];   
   
clearMagazineCargoGlobal _cargo;    
clearWeaponCargoGlobal _cargo;    
clearItemCargoGlobal _cargo;    
clearBackpackCargoGlobal _cargo;    
//////////CARGO IN THE CRATE//////////
if (_mission == "Ammo") then {
	private _Ammo1st = (getArray (configfile >> "CfgWeapons" >> _weap1st >> "magazines")) select 0; //primaryWeapon player
	private _Ammo1st2 = (getArray (configfile >> "CfgWeapons" >> _weap1st >> "magazines")) select 1; //primaryWeapon player
	private _Ammo2nd = (getArray (configfile >> "CfgWeapons" >> _weap2nd >> "magazines")) select 0; //handgunWeapon player
	_cargo addMagazineCargoGlobal [_Ammo1st, 5];
	_cargo addMagazineCargoGlobal [_Ammo1st2, 5]; 
	_cargo addMagazineCargoGlobal [_Ammo2nd, 3];
};
if (_mission == "ToolKit") then { 
	/*_cargo addItemCargoGlobal ["Exile_Item_OldChestKit",1];
	_cargo addItemCargoGlobal ["Land_TentDome_F_Kit",1];
	_cargo addItemCargoGlobal ["Exile_Item_CampFireKit",1];
	_cargo addItemCargoGlobal ["Exile_Item_Matches",1];
	_cargo addItemCargoGlobal ["Exile_Item_CookingPot",1];
	_cargo addItemCargoGlobal ["Exile_Item_SafeSmallKit",1];
	_cargo addItemCargoGlobal ["Exile_Item_Knife",1];*/
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_IP_ToolKit
};
if (_mission == "Launcher") then {
	_cargo addMagazineCargoGlobal ["RPG7_F",4];
	_cargo addWeaponCargoGlobal ["launch_RPG7_F",1];
};
//_cargo addItemCargoGlobal ["Exile_Item_EMRE",1];   
//_cargo addItemCargoGlobal ["Exile_Item_PlasticBottleCoffee",1];   
//_cargo addItemCargoGlobal ["Exile_Item_Bandage",1];
////////////////////////////////////////
uisleep 15;      
private _smoke = "SmokeShellGreen" createVehicle getPosATL _cargo;     
_smoke attachTo [_cargo,[0,0,0]]; 
playSound3D ["a3\dubbing_f\modules\supports\drop_accomplished.ogg", _target, false, getPosATL _target, 1,1,0];     
     
uisleep 5;     
private _light = "Chemlight_green" createVehicle getPosATL _cargo;  
_light attachTo [_cargo,[0,0,0.25]]; 
_cargo setOwner (owner _target);  
  
uisleep 20;     
_cargo allowdamage true;
uisleep 30;
deletevehicle _light;


} else {
	if (WMS_IP_LOGs) then {
 		diag_log format ["[SUPPLYDROP]|TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA| %1 is too poor to get a supplydrop |TNA|TNA|TNA|TNA|TNA|TNA|TNA|TNA|", _target];
	};
    //["ErrorTitleOnly", ["Dude! get some money!"]] call ExileClient_gui_toaster_addTemplateToast;
};