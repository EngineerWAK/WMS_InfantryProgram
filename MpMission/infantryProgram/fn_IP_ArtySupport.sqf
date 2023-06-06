//////////////////////////////////////////////////////////////////
//	Artillery support call script from {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
//[] call IP_fnc_ArtySupport;
//////////////////////////////////////////////////////////////////
private ["_lockerMoney","_artyTarget","_artyTargetPos","_artyTargetDist"];
params [
	"_target",
	"_ammoType",
	"_amount"
];

if (_ammoType == "HE" ) then {_amount = 10000} else {
	if (_ammoType == "SMOKE" ) then {_amount = 500} else {
		if (_ammoType == "FLARE" ) then {_amount = 1000} else {
			_amount = 10000;
		};
	};
};
_lockerMoney = 0;
if (WMS_exileFireAndForget) then {
	_lockerMoney = _target getVariable ['ExileLocker', 0];
}else{
	_lockerMoney = _target getVariable ['ExileMoney', 0];
};
if(_lockerMoney > _amount) then {
	systemchat "5 secondes to AIM target";
	uisleep 2;
	systemchat "3";
	uisleep 1;
	systemchat "2";
	uisleep 1;
	systemchat "1";
	uisleep 1;
	waituntil {!(isnull cursorObject)}; //Definitely need to replace this with laserTarget
	_artyTarget = cursorObject;
	_artyTargetPos = position _artyTarget;
	_artyTargetDist = _target distance2d _artyTarget;
	if (_artyTargetDist < 50) then {systemchat "Target too close, cancelling Artillery support"} else {
		[player, _amount, _lockerMoney, _artyTargetPos, _artyTargetDist, _ammoType] remoteExec ["WMS_fnc_InfantryProgram_ArtySupport",2];
		systemChat format ["Target aquiered %1m away, setting up Artillery battery", _artyTargetDist];
		uisleep 3;
		systemChat format ["Firing at %1, position %2", (typeOf _artyTarget), _artyTargetPos];
	};
} else {systemchat format ["You are too poor bro, only %1 in your locker :/",_lockerMoney]};
