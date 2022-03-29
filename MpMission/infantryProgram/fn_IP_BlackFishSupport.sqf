//////////////////////////////////////////////////////////////////
//	BlackFish support call script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
//[player, _amount, _lockerMoney, _artyTargetPos, _artyTargetDist, "HE"] spawn WMS_fnc_InfantryProgram_ArtySupport;
//////////////////////////////////////////////////////////////////
private ["_pos","_plane","_amount","_lockerMoney","_BlackFishTarget","_BlackFishTargetPos","_BlackFishTargetDist"];
params [
	"_playerObject"
];

_pos = position _playerObject;
_plane = "B_T_VTOL_01_armed_olive_F"; //"UK3CB_BAF_Apache_AH1_CAS";
_amount = 30000;
_lockerMoney = 0;
if (WMS_exileFireAndForget) then {
	_lockerMoney = _playerObject getVariable ['ExileLocker', 0];
}else{
	_lockerMoney = _playerObject getVariable ['ExileMoney', 0];
};
if(_lockerMoney > _amount) then {
	systemchat "5 seconds to AIM target";
	uisleep 2;
	systemchat "3";
	uisleep 1;
	systemchat "2";
	uisleep 1;
	systemchat "1";
	uisleep 1;
	waituntil {!(isnull cursorObject)}; //Definitely need to replace this with laserTarget
	_BlackFishTarget = cursorObject;
	_BlackFishTargetPos = getPosATL _BlackFishTarget;
	_BlackFishTargetDist = _pos distance2D _BlackFishTargetPos;

	[_playerObject, _BlackFishTargetPos, _amount, _plane, _lockerMoney] remoteExec ["WMS_fnc_InfantryProgram_BlackFish"];
	systemChat format ["Target %1m away, calling Air Support", _BlackFishTargetDist];
	uisleep 5;
	systemChat format ["Aiming at %1, position %2", (typeOf _BlackFishTarget), _BlackFishTargetPos];

} else {systemchat format ["You are too poor bro, only %1 in your locker :/",_lockerMoney]};
