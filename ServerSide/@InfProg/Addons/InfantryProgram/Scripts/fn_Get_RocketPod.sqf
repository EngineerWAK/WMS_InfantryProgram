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
 [] spawn {
_poscargo  = [getpos player select 0, getpos player select 1, 2]; 
 _direction = getdir player;
_cargo = createVehicle ["Land_Pod_Heli_Transport_04_bench_F", position player, [], 0];
_cargo setdir _direction;

["<t color='#ff0000' size = '.8'>RocketPod initialized<br />20 Sec BEFORE LAUNCH!</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
uisleep 20;

_cargo setVelocityModelSpace [0,130,120];

_Shaft = "CMflare_Chaff_Ammo" createVehicle (position _cargo);   
_Shaft attachTo [_cargo, [0,0,0]];
  
_Light1 = "F_Signal_Red" createVehicle (position _cargo);   
_Light2 = "F_Signal_Red" createVehicle (position _cargo);   
_Light3 = "F_Signal_Red" createVehicle (position _cargo);  
_Light4 = "F_Signal_Red" createVehicle (position _cargo);   
_Light1 attachTo [_cargo, [-1,-1,-2]];   
_Light2 attachTo [_cargo, [1,1,-2]];   
_Light3 attachTo [_cargo, [-1,1,-2]];   
_Light4 attachTo [_cargo, [1,-1,-2]];   
   
_Smoke = "smokeshellred" createVehicle (position _cargo);   
_Smoke attachTo [_cargo, [0,0,0]];   
_Smoke = "smokeshellblue" createVehicle (position _cargo);   
_Smoke attachTo [_cargo, [0,0,0]];     
_Smoke = "smokeshellyellow" createVehicle (position _cargo);   
_Smoke attachTo [_cargo, [0,0,0]];
  
playSound3D ["A3\sounds_f\weapons\Rockets\Titan_5.wss", _cargo, false, getPosATL _cargo, 4, -1, 0];
uisleep 20;
_parachute  = createVehicle ["O_Parachute_02_F",position _cargo, [], 0];
_directionPara = getdir _cargo;
_parachute setdir _directionPara;
_parachute setVelocityModelSpace [0,20,-30];
_cargo attachTo [_parachute, [0,0,1.6]];
uisleep 60;
_blackSmoke = createVehicle ["test_EmptyObjectForSmoke", position _cargo, [], 0]; 
_blackSmoke attachto [_cargo,[0,0,0]];  
uisleep 60;
_fire = createVehicle ["test_EmptyObjectForFireBig", position _cargo, [], 0]; 
_fire attachto [_cargo,[0,0,0]];   
 deleteVehicle _blackSmoke; 
uisleep 15;
_cargo setdammage 1;
 deleteVehicle _fire;
};  
 