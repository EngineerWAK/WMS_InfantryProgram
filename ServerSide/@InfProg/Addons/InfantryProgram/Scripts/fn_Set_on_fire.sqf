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

diag_log format ['*****Admin Abuse, Set On Fire*****'];
diag_log format [str (_this select 0)];
["Earth, wind and... FIRE!"] remoteexec ['SystemChat',0];
//["toastRequest", ["ErrorTitleOnly", ["Earth to earth, ashes to ashes, dust to dust"]]] call ExileServer_system_network_send_broadcast;
private _target = (_this select 0);
_Target allowDamage true;
private _fire = "test_EmptyObjectForFirebig" createVehicle position _target; 
_fire attachto [_target,[0,0,0]]; 
playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", _target, false, getPosATL _target, 3, 1, 0];
uisleep 30;
deletevehicle _fire;