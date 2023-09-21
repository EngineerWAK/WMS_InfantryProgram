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
private ["_pathern","_posEAST","_posNORD","_posWEST","_posSOUTH","_cargoCount","_VHLcount","_VHLcount0","_VHLcount1","_VHLselected","_markerName","_markerType","_randomPosTarget","_vhl","_VHLgrp","_vehic","_markerPos","_VHLMarker1",
		"_drvSits","_comSits","_gunSits","_unitClassName","_hexaID","_WPT_1","_WPT_2","_WPT_3","_WPT_4","_wpts"];
params[  
 "_pos",
 "_target",
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
 ["_difficulty", (selectRandom ["easy","moderate","difficult"])],
 ["_triggType", "nothing"] //"reinforcementpunisher" will force player target

];
_unitClassName = selectRandom WMS_AI_Units_Class;
_hexaID = []call WMS_fnc_GenerateHexaID;
_WPT_1 = ObjNull;
_wpts	= [];
_blackList = allPlayers select {alive _x} apply {[getPosATL _x, 300]};
if (_grpSide != OPFOR) then {
	_unitClassName = "B_Soldier_F";
	_blackList = [];
};
_VHLselected =  _VHLfull select 0;
_markerName = "";
_markerType = "b_unknown";
//_randomPosTarget = [_pos, _dist1, _dist2, 15, 0, 0.15] call BIS_fnc_findSafePos;

_randomPosTarget = [_pos, _dist1, _dist2, 15, 0, 0.15, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
if(surfaceIsWater _randomPosTarget)then{_VHLselected = ((selectRandom WMS_OPFOR_CustomSEA) select 0)};
_VHLgrp = createGroup [_grpSide, false];
//_vehic = _VHLselected createVehicle _randomPosTarget;
_vehic = createVehicle [_VHLselected, _randomPosTarget, [], 0, "NONE"];
_VHLgrp addVehicle _vehic;
_VHLgrp setVariable ["WMS_VehicleObject", _vehic, true]; //will be used to prevent NPC to keep walking for hours if thay abandon their vehicle
if (_vehic isKindOf "tank"||_vehic isKindOf "Wheeled_Apc_F") then {_vehic setVariable ["ace_cookoff_enable", true, true];};
_cargoSits = _vehic emptyPositions "cargo"; //"Commander", "Driver", "Gunner"
_drvSits = _vehic emptyPositions "Driver";
if (_drvSits != 0) then {
	_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinDriver _vehic"];
};
////////////////////////from "Lost enemy convoy"
	_turArray = allTurrets [_vehic, false];
	_turSits = count _turArray;
	if (_turSits > 4) then {_turSits = 4};
	_arrayRef = 0;
	if (_turSits != 0) then {
		for "_i" from 1 to _turSits do {
			_unit = _VHLgrp createUnit [(selectRandom WMS_AI_Units_Class), _randomPosTarget, [], 25, "NONE"];
			_unit assignAsTurret [_vehic, (_turArray select _arrayRef)];
			//_GunnersUnits pushBack _unit;
			diag_log format ["[VHL PATROL]|WAK|TNA|WMS|friendly message, this unit %1, group %2, is assigned to %3, turret %4",_unit, (group _unit), (assignedVehicle _unit),(_turArray select _arrayRef)];
			_arrayRef = (_arrayRef+1);
		};	
	};
	(units _VHLgrp) orderGetIn true;
///////////////////////////////
//init texture
_VHLcount = count (_VHLfull select 1);
if (_VHLcount != 0) then {
	_VHLcount0 = (_VHLfull select 1 select 0);
	_VHLcount1 = (_VHLfull select 1 select 1);
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "STRING"} && {typeName _VHLcount1 == "SCALAR"}) then { //initVehicle doesnt fucking work anymore
		[ _vehic, _VHLcount0] call BIS_fnc_initVehicle;
		if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL]|WAK|TNA|WMS|BIS_fnc_initVehicle  _vehic %1 , _VHLcount0 %2", _vehic,_VHLcount0]};
	};
	if ((_VHLcount == 2) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]};
	if ((_VHLcount == 4) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 2),(_VHLfull select 1 select 3)]};
	if ((_VHLcount == 6) && {typeName _VHLcount0 == "SCALAR"} && {typeName _VHLcount1 == "STRING"}) then {_vehic setObjectTextureGlobal [_VHLcount0, _VHLcount1]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 2),(_VHLfull select 1 select 3)]; _vehic setObjectTextureGlobal [(_VHLfull select 1 select 4),(_VHLfull select 1 select 5)]};
};
//init texture end
/////
//_comSits = _vehic emptyPositions "Commander";
_gunSits = _vehic emptyPositions "Gunner"; //that count ONLY 1 gunner, not all the turrets, see ""Lost enemy convoy"
/*if (_comSits != 0) then {
	_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinCommander _vehic"];
};*/
if (_gunSits != 0) then {
	//for "_i" from 1 to _gunSits do {
		_unitClassName createUnit [_randomPosTarget, _VHLgrp, "this moveinGunner _vehic"];
	//};	
};
if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL]|WAK|TNA|WMS| Vehicle: %1, Cargo: %2, Driver: %3, Commander: %4, _Gunner: %5, AllTurret: %6", _VHLselected, _cargoSits,_drvSits,_comSits,_gunSits, (count allTurrets _vehic)]};

if (_loadout == "livonia" && _WPBeha == "SAFE") then {_WPBeha == "AWARE"};
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
if (WMS_DynAI_addItemsVHL) then {
	_cargoResult = selectRandom ([WMS_DynAI_CargoItems] call CBA_fnc_shuffle);
	if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL ITEMS]|WAK|TNA|WMS| _cargoResult = %1", _cargoResult]};
	switch (_cargoResult) do {
		case 1 : { //this will add ITEMS only, very basic
			for "_i" from 1 to (round (random 4)) do {
				_itemcargo = selectRandom (WMS_ToolList+WMS_MeatList+WMS_medsList+WMS_AI_inventory);
				_vehic addItemCargoGlobal [_itemcargo,1];
				if (WMS_IP_LOGs) then {diag_log format ["[VHL PATROL ITEMS]|WAK|TNA|WMS| _vehic = %2 _itemcargo = %1", _itemcargo, _vehic]};
			};
		};
		case 2 : { //this will add Items, Mags, bags, weapons
			[
				_vehic,
				[//items ["ACE_WaterBottle",10,5],
					(selectRandom WMS_foodList), //can use a formated list ["item",count, +random]
					(selectRandom WMS_medicList),
					[(selectRandom WMS_AI_inventory),1,1] //or a regular Items list and add the count +random
				],
				[//mags ["ACE_HandFlare_Yellow",5,5],
					[(selectRandom WMS_AI_grenades),1,4]
				],
				[//bags ["B_Kitbag_mcamo",2,3],
					[selectRandom (WMS_Loadout_AOR2 select 3),1,2]
				],
				[//weaps ["rhsusf_weap_glock17g4",1,5],
					[selectRandom (WMS_Loadout_Assault select 0),1,1]
				]
			] call WMS_fnc_AMS_FillStuff;
		};
	};
};
if (_VHLselected iskindof "helicopter") then {_markerType = "b_air"; _vehic limitSpeed 120;} else {
	if (_VHLselected iskindof "tank") then {_markerType = "b_armor"; _vehic limitSpeed 50;} else {
		if (_VHLselected iskindof "car") then {_markerType = "b_motor_inf"; _vehic limitSpeed 60;} else {
			if (_VHLselected iskindof "plane") then {_markerType = "b_plane"; _vehic limitSpeed 300;} else { _markerType = "b_unknown"};
		};
	};
};
if (_infoType != "ROAMING") then {
	//use _WPDist to create other waypoints
	_posNORD = [(_pos select 0), ((_pos select 1)+(_WPDist/2)+(random _WPDist)), 0]; //NORD
	_posSOUTH = [(_pos select 0), ((_pos select 1)-(_WPDist/2)-(random _WPDist)), 0];//SOUTH
	_posEAST = [((_pos select 0)+(_WPDist/2)+(random _WPDist)), (_pos select 1), 0];//EAST
	_posWEST = [((_pos select 0)-(_WPDist/2)-(random _WPDist)), (_pos select 1), 0];//WEST
	_pathern = selectRandom [
				[_posNORD,_posSOUTH,_posEAST,_posWEST],
				[_posSOUTH,_posNORD,_posWEST,_posEAST],
				[_posSOUTH,_posWEST,_posNORD,_posEAST],
				[_posEAST,_posNORD,_posWEST,_posSOUTH]
				];

	_WPT_1 = _VHLgrp addWaypoint [([[[(_pathern select 0), 50]], []] call BIS_fnc_randomPos), 100, 0];//[[[position player, 50]], []] call BIS_fnc_randomPos;
	_WPT_1 setWaypointType _WPType;
	_WPT_1 setwaypointSpeed _WPSpee;
	_WPT_1 setWaypointCombatMode _WPComb;
	_WPT_1 setWaypointbehaviour  _WPBeha;
	_wpts pushBack _WPT_1;
		
	_WPT_2 = _VHLgrp addWaypoint [(_pathern select 1), 100, 1];
	_WPT_2 setWaypointType "MOVE";
	_WPT_2 setwaypointSpeed _WPSpee;
	_WPT_2 setWaypointCombatMode _WPComb;
	_WPT_2 setWaypointbehaviour  _WPBeha;
	_wpts pushBack _WPT_2;
	
	_WPT_3 = _VHLgrp addWaypoint [(_pathern select 2), 100, 2];
	_WPT_3 setWaypointType "MOVE";
	_WPT_3 setwaypointSpeed _WPSpee;
	_WPT_3 setWaypointCombatMode _WPComb;
	_WPT_3 setWaypointbehaviour  _WPBeha;
	_wpts pushBack _WPT_3;
	
	_WPT_4 = _VHLgrp addWaypoint [(_pathern select 3), 100, 3];
	_WPT_4 setWaypointType "CYCLE";
	_WPT_4 setwaypointSpeed _WPSpee;
	_WPT_4 setWaypointCombatMode _WPComb;
	_WPT_4 setWaypointbehaviour  _WPBeha;
	_wpts pushBack _WPT_4;
};
switch (_infoType) do {
	case "ROAMING" : {
		_vehic setVariable ["WMS_KickVehAss",0,true]; //for the unstick fonction
		_wpts = [_hexaID,_pos,_VHLgrp,_vehic,false,true] call WMS_fnc_SetPatrol;
	};
	case "Occupation" : {
		_vehic setVariable ["WMS_KickVehAss",999,true]; //No Kickass for occupation, not set yet in Wach&Destroy
		//[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
	case "BaseATK" : {
		_vehic setVariable ["WMS_KickVehAss",999,true];
		//[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
	case "PATROL" : {
		_vehic setVariable ["WMS_KickVehAss",0,true]; //for the unstick fonction
		//[_VHLgrp,_pos, _WPDist] call BIS_fnc_taskPatrol;
	};
};
if (_grpSide == OPFOR ) then {
	if ((_cargoSits > 0) && WMS_AI_AddCargoUnits && {_turSits <= 3} && {(OPFOR countSide allUnits) < WMS_AI_MaxUnits_A} && {!(_VHLselected iskindof "helicopter")} && {!(_VHLselected iskindof "plane")}) then {
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
	{_x setVariable ["WMS_RealFuckingSide",_grpSide,true]}forEach units _VHLgrp;
	[(units _VHLgrp),'SMG',WMS_DynAI_LauncherChance,_skill,_difficulty,_loadout,nil,"VHLCrew"] call WMS_fnc_SetUnits;
	//if !(WMS_HeadlessOwnerID == 2) then {_VHLgrp setGroupOwner WMS_HeadlessOwnerID};
	//if (HC1 in allPlayers) then {_VHLgrp setGroupOwner (owner HC1)};
	if (WMS_exileFireAndForget) then {
		
	}else{
		_vehic addMPEventHandler ["mpkilled", {
				//params ["_unit", "_killer", "_instigator", "_useEffects"];
				if (WMS_IP_LOGs) then {diag_log format ["[ROAMING AI VHL DESTROYED]|WAK|TNA|WMS| _this: %1", _this]};
				if (isPlayer (_this select 1)) then {
					if ((_this select 0) distance (_this select 1) >= WMS_AI_RoamingVHL_MaxDist||getPlayerUID (_this select 1) in WMS_BlackList) then {
						//["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", owner (_this select 1)];
						if (isDedicated)then{
							["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", owner (_this select 1)];
						}else{
							//Here I need to send the reqest to the server and the server send the remoteexec to the _target
							[["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]],(_this select 1)] remoteExec ["WMS_fnc_remoteNotification", 2];
						};
					} else {
						[(_this select 1), "ROAMING"] call WMS_fnc_AI_rewardOnVHLdestroy;
					};
				} else {
					if (isPlayer (_this select 2)) then {
						if ((_this select 0) distance (_this select 2) >= WMS_AI_RoamingVHL_MaxDist||getPlayerUID (_this select 1) in WMS_BlackList) then {
							//["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", owner (_this select 2)];
							if (isDedicated)then{
								["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]] remoteExec ["BIS_fnc_showNotification", owner (_this select 2)];
							}else{
								//Here I need to send the reqest to the server and the server send the remoteexec to the _target
								[["EventCustomGreen", ["Roaming Vehicle Elimination", (format ["Congratulation ! %1, %2","And THANK YOU", "For Making Our World Safer"]), "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa"]],(_this select 2)] remoteExec ["WMS_fnc_remoteNotification", 2];
							};
						} else {
							[(_this select 2), "ROAMING"] call WMS_fnc_AI_rewardOnVHLdestroy;
						};	
					}
				};
			}
		];
	};
};
if (_triggType == "reinforcementpunisher") then {
	(units _VHLgrp) doTarget _target;
	(units _VHLgrp) doMove _target;
};
if (_grpSide == BLUFOR ) then {
	if (_loadout == "army") then {_loadout = "army_b"};
	{_x setVariable ["WMS_RealFuckingSide",_grpSide,true]}forEach units _VHLgrp;
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
if (isDedicated)then{
	if (_VHLselected iskindof "helicopter" || _VHLselected iskindof "plane") then {
		WMS_AI_RoamingAIR_Running pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
		} else {
		WMS_AI_RoamingVHL_Running pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
	};
}else{
	if (_VHLselected iskindof "helicopter" || _VHLselected iskindof "plane") then {
		WMS_AI_RoamingAIR_Run_HC pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
		} else {
		WMS_AI_RoamingVHL_Run_HC pushback [time,(time+(_timer+(random _timer))),[_VHLgrp],[[_vehic,(position _vehic)]],[],[_markerName],_wpts,""];
	};
};
