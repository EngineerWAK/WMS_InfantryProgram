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
//NOT USED ANYMORE/////////////////////////////////////////////////////
private _target = _this;
moveout _target;
_target setVariable ['ExileIsHandcuffed', true, true];
_target setVariable ['ExileHostageTakernetId', netId _target];
_target setVariable ['ExileHostageTakerUID', getPlayerUID _target];
['switchMoveRequest', [netId _target, 'Acts_AidlPsitMstpSsurWnonDnon_loop']] call ExileServer_system_network_send_broadcast;

_box = "Exile_Container_Storagecrate" createVehicle position _target;//and move all equipement in the Box
_target setpos ([_target, 150, 300, 1, 0] call BIS_fnc_findSafePos);