/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2020 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/


diag_log format ['*************************BUY ACTION*************************'];
diag_log format [str _this];
private _TargetAction = _this select 0;
private _amount = _this select 1; 
private _mission = _this select 2;

if(alive _targetAction)then   
  { 
    _lockerMoney1 = _TargetAction getVariable ['ExileLocker', 0];
    _playerMoney = _TargetAction getVariable ['ExileMoney', 0];
		_lockerMoney = _lockerMoney1 - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_TargetAction setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_TargetAction setVariable ['ExileMoney', _playerMoney, true];
		_TargetAction setVariable ['ExileLocker', _lockerMoney, true];
    format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _TargetAction)] call ExileServer_system_database_query_fireAndForget; 
    if (_mission == 001) then {[_TargetAction] call WMS_fnc_AirStrikeOnNPC;} else {
			if (_mission == 002) then {[_TargetAction,"Advanced Base Kit","I_Truck_02_covered_F",100,false,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 003) then {[_TargetAction,"Crafting Box","I_CargoNet_01_ammo_F",75,false,"SmokeShellyellow","chemlight_green"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 004) then {[_TargetAction,"Chopper","C_Heli_light_01_digital_F",100,true,"SmokeShellBlue","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 005) then {[_TargetAction,"M113","rhsgref_hidf_m113a3_unarmed",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 006) then {[_TargetAction,"M998","rhsusf_m998_w_s_2dr",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 007) then {[_TargetAction,"Unarmed Marid","O_T_APC_Wheeled_02_rcws_v2_ghex_F",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 008) then {[_TargetAction,"Survivor Crate","Box_T_East_Wps_F",75,false,"SmokeShellyellow","chemlight_green"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 009) then {[_TargetAction,"Unarmed Gorgon","I_APC_Wheeled_03_cannon_F",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 010) then {[_TargetAction,"Wood Base Kit","I_CargoNet_01_ammo_F",75,false,"SmokeShellyellow","chemlight_green"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 011) then {[_TargetAction,"Jeep","C_Offroad_02_unarmed_black_F",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 012) then {[_TargetAction,"Wood Supply","I_CargoNet_01_ammo_F",75,false,"SmokeShellyellow","chemlight_green"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 013) then {[_TargetAction,"Unarmed AWC","I_LT_01_AA_F",100,true,"SmokeShellOrange","F_Signal_Red"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			if (_mission == 014) then {[_TargetAction,"Bomb","Bo_Mk82",100,false,"SmokeShellRed","none"] spawn WMS_fnc_paradrop_RLA_Unified;} else {
			//next here
		}
		}
		}
		}
		}
		}
		}
		}
		}
		}
		}
		}
		}
		}
} else {systemchat "you dead Bro :/"};

/*private _Target 		= (_this select 0); //player
private _Msg 			= (_this select 1); //"chopper"
private _load 			= (_this select 2); //"C_Heli_light_01_digital_F"
private _Altitude 		= (_this select 3); //100
private _IncludeLoadout = (_this select 4); //true
private _SmokeColor 	= (_this select 5); //"SmokeShellBlue"
private _LightColor 	= (_this select 6); //"F_Signal_Red"*/