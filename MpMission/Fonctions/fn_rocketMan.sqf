/**
 * WMS_fnc_rocketMan
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 //[_playerObject] call WMS_fnc_rocketMan; //from clientSide
 //[_playerObject] remoteExec ["WMS_fnc_rocketMan", (owner _playerObject)]; //from serverSide
private [
	"_target","_dir","_Angle","_PowerUp","_Turn","_Shaft","_Light","_Smoke"
];
params [
	"_playerObject"
];
diag_log format ["*****ROCKET MAAAAAAAAANNNNNNNN***** %1", _playerObject];
systemchat "ROCKET MAAAAAAAAANNNNNNNN";
_target = _playerObject; 
_target allowDamage true;  
_dir = getdir _target; 
_angle = selectRandom [160,170,180,190,200];
_PowerUp = selectRandom [30,40,50,60,70,100,300];
_smokeColor = "smokeshell";
if (side _playerObject == EAST)then{
	_Angle = selectRandom [-20,-10,0,10,20];
	_PowerUp = selectRandom [100,150,200,250,300];
	_smokeColor = "smokeshellRed";
	_target say3D "RocketMan";
}else {
	PlaySound "RocketMan";
};
/*if (vehicle _playerObject != _playerObject) then {
	moveout _playerObject;
};*/
_Turn = _dir -_angle; 
_target setdir _turn; 
_target setVelocityModelSpace [0,30,_PowerUp];
_Shaft = "CMflare_Chaff_Ammo" createVehicle (position _target);   
_Shaft attachTo [_target, [0,0,0.9]];  
_Light = "F_Signal_Red" createVehicle (position _target);   
_Light attachTo [_target, [0,0.25,0.7]];   
_Smoke = _smokeColor createVehicle (position _target);   
_Smoke attachTo [_target, [0,0,0.9]];  
playSound3D ["A3\sounds_f\weapons\Rockets\Titan_5.wss", _target, false, getPosATL _target, 1, -1, 0];