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

//[_pos,_skill,_unitFunction,_loadout,_behavType,_wpts,_missionID,_className] call WMS_fnc_AMS_SpawnAiVHL //return [_rwd,_VHLgrp]
private ["_emptyPos","_rwd","_VHLgrp"];
params[
	"_pos",
	["_skill", (0.3+random 0.5), [0]],
	["_unitFunction","Assault",[""]],
	["_loadout","bandit",[""]],
	["_behavType","patrol",[""]],
	["_wpts", [75,4]],
	["_missionID", "No_ID", [""]],
	["_className", (selectRandom WMS_AMS_LightArmed), []],
	["_strictPos", false],
	["_difficulty", "Hardcore", [""]]
];
private _playerMoney = 0;
private _playerScore = 0;
if (WMS_IP_LOGs) then {diag_log format ["[AMS SPAWN AI VHL]|WAK|TNA|WMS| _this = %1 *****", _this]};
_vehicle = (_className select 0);
_emptyPos = _pos findEmptyPosition [25,100,_vehicle];

if ((count _emptyPos) == 0) then {_emptyPos = _pos};
_VHLgrp = createGroup [OPFOR, false];
//if !(WMS_HeadlessOwnerID == 2) then {_VHLgrp setGroupOwner WMS_HeadlessOwnerID};
//if (HC1 in allPlayers) then {_VHLgrp setGroupOwner (owner HC1)};
_rwd = ObjNull;
if (_strictPos) then {
	_rwd = createVehicle [_vehicle, _pos, [], 0, "CAN_COLLIDE"];
} else {
	_rwd = createVehicle [_vehicle, _emptyPos, [], 5, "NONE"];
};
_rwd allowDamage false;
_VHLgrp addVehicle _rwd;

_typ = "MOVE"; _beh = "SAFE"; _cbt = "YELLOW"; _spd = "NORMAL"; _fmn = "COLUMN";
switch (toLower _behavType) do {
	case "patrol"	: {_typ = "MOVE"; 	_beh = "AWARE"; 	_cbt = "YELLOW";	_spd = "LIMITED"; 	_fmn = "COLUMN"};
	case "hide" 	: {_typ = "MOVE"; 	_beh = "STEALTH"; 	_cbt = "YELLOW";	_spd = "LIMITED"; 	_fmn = "STAGGERED COLUMN"};
	case "chill" 	: {_typ = "SENTRY"; _beh = "SAFE"; 		_cbt = "YELLOW"; 	_spd = "NORMAL"; 	_fmn = "STAGGERED COLUMN"};
	case "rambo" 	: {_typ = "SAD"; 	_beh = "COMBAT"; 	_cbt = "RED"; 		_spd = "FULL"; 		_fmn = "VEE"};
};
 
clearMagazineCargoGlobal _rwd;
clearWeaponCargoGlobal _rwd;
clearItemCargoGlobal _rwd;
clearBackpackCargoGlobal _rwd;
//Custom Textures:
_VHLcount = count (_className select 1);
if (_VHLcount != 0) then {/*
	_VHLcount0 = (_className select 1 select 0);
	_VHLcount1 = (_className select 1 select 1);
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "STRING"} && {typeName _VHLcount1 == "SCALAR"}) then {[ _rwd, _VHLcount0] call BIS_fnc_initVehicle}; //initVehicle doesnt fucking work anymore
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]};
	if ((_VHLcount == 4) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _rwd setObjectTextureGlobal [(_className select 1 select 2),(_className select 1 select 3)]};
	if ((_VHLcount == 6) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _rwd setObjectTextureGlobal [(_className select 1 select 2),(_className select 1 select 3)]; _rwd setObjectTextureGlobal [(_className select 1 select 4),(_className select 1 select 5)]};
*/
	_VHLcount0 = (_className select 1 select 0);
	_VHLcount1 = (_className select 1 select 1);
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "STRING"} && {typeName _VHLcount1 == "SCALAR"}) then { //initVehicle doesnt fucking work anymore
		[_rwd, _VHLcount0] call BIS_fnc_initVehicle;
		if (true) then {diag_log format ["[VHL PATROL]|WAK|TNA|WMS|BIS_fnc_initVehicle  _vehic %1 , _VHLcount0 %2", _rwd,_VHLcount0]};
	};
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]};
	if ((_VHLcount == 4) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _rwd setObjectTextureGlobal [(_className select 1 select 2),(_className select 1 select 3)]};
	if ((_VHLcount == 6) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_rwd setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _rwd setObjectTextureGlobal [(_className select 1 select 2),(_className select 1 select 3)]; _rwd setObjectTextureGlobal [(_className select 1 select 4),(_className select 1 select 5)]};
};

{
	WMS_AI_Units_Class createUnit [_emptyPos, _VHLgrp, "this moveinTurret [_rwd, _x]"];
}forEach (allTurrets _rwd);
_drvSits = _rwd emptyPositions "Driver";
if (_drvSits != 0) then {
	WMS_AI_Units_Class createUnit [_emptyPos, _VHLgrp, "this moveinDriver _rwd"];
};
//[(units _VHLgrp),_unitFunction,20,_skill,_difficulty,_loadout] call WMS_fnc_AMS_SetUnits;
//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
[(units _VHLgrp),_unitFunction,20,_skill,_difficulty,_loadout,nil,"AMS"] call WMS_fnc_SetUnits;

_rwd setVariable ["AMS_MissionID",_missionID,true];
_rwd setvehiclelock "LOCKEDPLAYER";
_rwd setVariable ["ExileIsLocked",-1];
_rwd setUnloadInCombat [true, false];
_rwd allowCrewInImmobile true;
_rwd allowDamage true;
if (_rwd isKindOf "tank"||_rwd isKindOf "Wheeled_Apc_F") then {_rwd setVariable ["ace_cookoff_enable", true, true];};
if (WMS_exileFireAndForget) then {
	
}else{
	_rwd addMPEventHandler ["mpkilled", {
			//params ["_unit", "_killer", "_instigator", "_useEffects"];
			if (true) then {diag_log format ["[AMS AI VHL DESTROYED]|WAK|TNA|WMS| _this: %1", _this]};
			if (isPlayer (_this select 1)) then {
				//[(_this select 1), "AMS"] remoteExec ['WMS_fnc_AI_rewardOnVHLdestroy', 2];
				[(_this select 1), "AMS"] call WMS_fnc_AI_rewardOnVHLdestroy;
			};
		}
	];
};

if (WMS_IP_LOGs) then {diag_log format ["[AMS AI VHL]|WAK|TNA|WMS| return _rwd: %1,", [_rwd,_VHLgrp]]};

[_VHLgrp, _Pos, (_wpts select 0), (_wpts select 1), _typ, _beh, _cbt, _spd, _fmn, "", [1,2,3]] call CBA_fnc_taskPatrol;
[_rwd,[_VHLgrp]]