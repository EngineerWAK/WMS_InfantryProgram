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

private ["_emptyPos","_rwd","_helipad","_random","_collide","_helipadArray"];
params[
	"_pos",
	["_className", WMS_AMS_Crate_S, [""]],
	["_missionID", "No_ID", [""]],
	["_canBlowUp", WMS_AMS_allowDamRwd, []],
	["_pinCode", 0, [0]]
];
if (WMS_IP_LOGs) then {diag_log format ["[AMS CREATE REWARD OBJECT]|WAK|TNA|WMS| _this = %1 *****", _this]};
_emptyPos = _pos;
_random = 3;
_collide = "NONE";
_helipadArray = (_pos nearObjects ["Helipad_base_F", 100]); //Land_HelipadCircle_F
if (
	(count _helipadArray != 0)
) then {
	_helipad = (nearestObject [_pos, "Helipad_base_F"]); //Land_HelipadCircle_F
	_emptyPos = getPosATL _helipad;
	_random = 0;
	_collide = "CAN_COLLIDE";
} else {
	_emptyPos = _pos findEmptyPosition [1,100,_className];
};

if ((count _emptyPos) == 0) then {_emptyPos == _pos};
_rwd = createVehicle [_className, _emptyPos, [], _random, _collide];
 
clearMagazineCargoGlobal _rwd;
clearWeaponCargoGlobal _rwd;
clearItemCargoGlobal _rwd;
clearBackpackCargoGlobal _rwd;

_rwd setVariable ["AMS_MissionID",_missionID,true];
_rwd setvehiclelock "LOCKED";
_rwd setvehiclelock "LOCKEDPLAYER";
_rwd enableSimulationGlobal false;
_rwd enableRopeAttach false;
if (_rwd isKindOf "tank"||_rwd isKindOf "Wheeled_Apc_F") then {_rwd setVariable ["ace_cookoff_enable", true, true];};
//_rwd setVariable ["ExileIsLocked",-1];

if (_pinCode != 0) then {
	//Thank you DMS/eraser1
	// Save vehicle on exit.
	_rwd addEventHandler ["GetOut", { _this call ExileServer_object_vehicle_event_onGetOut}];

	// Set up vars
	_rwd setVariable ["ExileIsPersistent", true];
	_rwd setVariable ["ExileAccessCode", _pinCode];
	_rwd setVariable ["ExileOwnerUID", "AMS_Vehicle"];

	// Deny access until specified to do so.
	_rwd setVariable ["ExileIsLocked",-1];
	_rwd setVariable ["ExileLastLockToggleAt", time];
	_rwd setVariable ["ExileAccessDenied", true];
	_rwd setVariable ["ExileAccessDeniedExpiresAt", 999999];
};
_rwd allowDamage _canBlowUp;
if (WMS_IP_LOGs) then {diag_log format ["[AMS REWARD OBJECT]|WAK|TNA|WMS| return _rwd: %1,", _rwd]};

_rwd