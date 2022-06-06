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

//////////
//[_pos, _target, _timer,_skill,_grpSide,_loadout,_VHLfull,_lockPlayer,_useMarker,_dist1,_dist2,_WPDist] spawn WMS_fnc_infantryProgram_VHLpatrol;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL]|WAK|TNA|WMS| _this = %1", _this]};
private ["_cargoCount","_VHLcount","_VHLcount0","_VHLcount1","_VHLselected","_markerName","_markerType","_randomPosTarget","_vhl","_VHLgrp","_vehic","_markerPos","_VHLMarker1","_drvSits","_comSits","_gunSits"];
params[  
 "_pos",
 "_target", //USELESS
 ["_timer", 600, [0]],
 ["_skill", 0.65,[0]],  
 ["_grpSide", OPFOR,[]],
 ["_loadout", "army", [""]],    
 ["_VHLfull", ["O_G_Offroad_01_armed_F",[],[[],[]]], []],
 ["_lockPlayer", true,[]],
 ["_useMarker", true,[]],  
 ["_dist1", 1800,[0]],  
 ["_dist2", 3000,[0]],
 ["_WPDist", 3000, [0]],
 ["_WPType", "MOVE", [""]],  
 ["_WPBeha", "COMBAT", [""]],  
 ["_WPComb", "YELLOW", [""]],  
 ["_WPSpee", "NORMAL", [""]],  
 ["_infoType", "PATROL", [""]],  //"ROAMING"
 ["_difficulty", (selectRandom ["easy","moderate","difficult"])]

];
private _playerMoney = 0;
private _playerScore = 0;
private _unitClassName = WMS_AI_Units_Class;
private _hexaID = []call WMS_fnc_GenerateHexaID;
private _WPT_1 = ObjNull;
private _wpts	= [];
private _blackList = allPlayers select {alive _x} apply {[getPosATL _x, 300]};
if (_grpSide != OPFOR) then {
	_unitClassName = "B_Soldier_F";
	_blackList = [];
};
_VHLselected =  _VHLfull select 0;
_markerName = "";
_markerType = "b_unknown";
//_randomPosTarget = [_pos, _dist1, _dist2, 15, 0, 0.15] call BIS_fnc_findSafePos;
_randomPosTarget = [_pos, _dist1, _dist2, 15, 0, 0.15, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
_VHLgrp = createGroup [_grpSide, false];
_vehic = _VHLselected createVehicle _randomPosTarget;
_VHLgrp addVehicle _vehic;
_vehic setVariable ["roamingAIVehicle", true, true];
_cargoSits = _vehic emptyPositions "cargo"; //"Commander", "Driver", "Gunner"
_drvSits = _vehic emptyPositions "Driver";
if (_drvSits != 0) then {
	_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinDriver _vehic"];
};
/////
_comSits = _vehic emptyPositions "Commander";
_gunSits = _vehic emptyPositions "Gunner";
if (_comSits != 0) then {
	_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinCommander _vehic"];
};
if (_gunSits != 0) then {
	for "_i" from 1 to _gunSits do {
		_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinGunner _vehic"];
	};	
};
if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL]|WAK|TNA|WMS| Vehicle: %1, Cargo: %2, Driver: %3, Commander: %4, _Gunner: %5, AllTurret: %6", _VHLselected, _cargoSits,_drvSits,_comSits,_gunSits, (count allTurrets _vehic)]};

if (_loadout == "livonia" && _WPBeha == "SAFE") then {_WPBeha == "AWARE"};
//init texture
_VHLcount = count (_VHLfull select 1);
if (_VHLcount != 0) then {
	_VHLcount0 = (_VHLfull select 1 select 0);
	_VHLcount1 = (_VHLfull select 1 select 1);
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "STRING"} && {typeName _VHLcount1 == "SCALAR"}) then {[ _vehic, [_VHLcount0,_VHLcount1], true, false ] call BIS_fnc_initVehicle}; //initVehicle doesnt fucking work anymore
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]};
	if ((_VHLcount == 4) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 2),(_VHLfull select 1 select 3)]};
	if ((_VHLcount == 6) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 2),(_VHLfull select 1 select 3)]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 4),(_VHLfull select 1 select 5)]};
};
//init texture end
if (_lockPlayer) then {
	_vehic setvehiclelock "LOCKEDPLAYER";
	_vehic setvehiclelock "LOCKED";
};
_vehic setUnloadInCombat [true, false];
_vehic allowCrewInImmobile true;
if (WMS_DynAI_addPoptabsVHL) then {
	_poptabs = (WMS_DynAI_poptabsVHL select 0) + round (random(WMS_DynAI_poptabsVHL select 1));
	_vehic setVariable ["ExileMoney",_poptabs,true];
};
clearMagazineCargoGlobal _vehic;
clearWeaponCargoGlobal _vehic;
clearItemCargoGlobal _vehic;
clearBackpackCargoGlobal _vehic;
if (_VHLselected iskindof "helicopter") then {_markerType = "b_air"; _vehic limitSpeed 120;} else {
	if (_VHLselected iskindof "tank") then {_markerType = "b_armor"; _vehic limitSpeed 50;} else {
		if (_VHLselected iskindof "car") then {_markerType = "b_motor_inf"; _vehic limitSpeed 60;} else {
			if (_VHLselected iskindof "plane") then {_markerType = "b_plane"; _vehic limitSpeed 300;} else { _markerType = "b_unknown"};
		};
	};
};
if (_infoType != "ROAMING") then {
	_WPT_1 = _VHLgrp addWaypoint [_pos, 100, 0];
	_WPT_1 setWaypointType _WPType;
	_WPT_1 setwaypointSpeed _WPSpee;
	_WPT_1 setWaypointCombatMode _WPComb;
	_WPT_1 setWaypointbehaviour  _WPBeha;
	_wpts pushBack _WPT_1;
};
switch (_infoType) do {
	case "ROAMING" : {
		_vehic setVariable ["WMS_KickVehAss",0,true]; //for the unstick fonction
		_wpts = [_hexaID,_pos,_VHLgrp,_vehic,false,true] call WMS_fnc_SetPatrol;
	};
	case "Occupation" : {
		_vehic setVariable ["WMS_KickVehAss",999,true]; //No Kickass for occupation, not set yet in Wach&Destroy
		[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
	case "BaseATK" : {
		_vehic setVariable ["WMS_KickVehAss",999,true];
		[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
	case "PATROL" : {
		_vehic setVariable ["WMS_KickVehAss",0,true]; //for the unstick fonction
		[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
};
if (_grpSide == OPFOR ) then {
	if ((_cargoSits > 0) && WMS_AI_AddCargoUnits && {(OPFOR countSide allUnits) < WMS_AI_MaxUnits_A} && {!(_VHLselected iskindof "helicopter")} && {!(_VHLselected iskindof "plane")}) then {
		if (_cargoSits >= WMS_AI_CargoUnits) then {
			for "_i" from 1 to WMS_AI_CargoUnits do {
				_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveincargo _vehic"];
			};
		} else {
			for "_i" from 1 to _cargoSits do {
				_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveincargo _vehic"];
			};
		};
	}; 
	{_x setVariable ["WMS_RealFuckingSide",_grpSide]}forEach units _VHLgrp;
	[(units _VHLgrp),'SMG',WMS_DynAI_LauncherChance,_skill,_difficulty,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	//if !(WMS_HeadlessOwnerID == 2) then {_VHLgrp setGroupOwner WMS_HeadlessOwnerID};
	//if (HC1 in allPlayers) then {_VHLgrp setGroupOwner (owner HC1)};
	if (WMS_exileFireAndForget) then {
		
	}else{
		_vehic addMPEventHandler ["mpkilled", {
				//params ["_unit", "_killer", "_instigator", "_useEffects"];
				if (true) then {diag_log format ["[ROAMING AI VHL DESTROYED]|WAK|TNA|WMS| _this: %1", _this]};
				if (isPlayer (_this select 1)) then {
					[(_this select 1), "ROAMING"] call WMS_fnc_AI_rewardOnVHLdestroy;
				};
			}
		];
	};
};
if (_grpSide == BLUFOR ) then {
	if (_loadout == "army") then {_loadout = "army_b"};
	{_x setVariable ["WMS_RealFuckingSide",_grpSide]}forEach units _VHLgrp;
	//[units _VHLgrp,'SMG',10,_skill,_loadout] call WMS_fnc_DynAI_SetUnitBLU;
	//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
	[units _VHLgrp,'SMG',10,_skill,nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	if (_useMarker) then {
		_markerPos = position _vehic;
		_markerName = "VHL" + (str _markerPos);
		_VHLMarker1 = createMarker [_markerName, _markerPos];
		_VHLMarker1 setMarkerShape "ICON";
		_VHLMarker1 setMarkerType _markerType;
		_VHLMarker1 setMarkercolor "ColorBlue";
		WMS_AI_RoamingVHL_LastTime = time;
		publicVariable "WMS_AI_RoamingVHL_LastTime";
		[_vehic,_markerName] spawn {
			while {alive (_this select 0)} do {(_this select 1) setmarkerpos (position (_this select 0)); sleep 5;};     
		};  
	};
};
if (_VHLselected iskindof "helicopter" || _VHLselected iskindof "plane") then {
	WMS_AI_RoamingAIR_Running pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
	} else {
	WMS_AI_RoamingVHL_Running pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
};
