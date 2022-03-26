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

diag_log format ['*****ROCKET MAAAAAAAAANNNNNNNN*****'];
diag_log format [str (_this select 0)];
//["toastRequest", ["InfoTitleAndText", ["ROCKET MAAAAAAAAANNNNNNNN", "Whoooohooooooooooooooo"]]] call ExileServer_system_network_send_broadcast; 
_target = (_this select 0); 
_target allowDamage true;  
_dir = getdir _target; 
_Angle = selectRandom [160,170,180,190,200];
_PowerUp = selectRandom [30,40,50,60,70,100,300];
_Turn = _dir -_angle; 
_target setdir _turn; 
_target setVelocityModelSpace [0,30,_PowerUp];   
PlaySound "RocketMan";  
_Shaft = "CMflare_Chaff_Ammo" createVehicle (position _target);   
_Shaft attachTo [_target, [0,0,0.9]];  
_Light = "F_Signal_Red" createVehicle (position _target);   
_Light attachTo [_target, [0,0.25,0.7]];   
_Smoke = "smokeshell" createVehicle (position _target);   
_Smoke attachTo [_target, [0,0,0.9]];  
playSound3D ["A3\sounds_f\weapons\Rockets\Titan_5.wss", _target, false, getPosATL _target, 1, -1, 0];
uisleep 20;
deleteVehicle _smoke;