/**
* WMS_fnc_DFO_BuildBase - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_BuildBase = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_BuildBase _this %1', _this]};
	params [
		"_pos",
		["_option", "HELIPAD"] //"FULL","HELIPAD"
	];
	private _DFO_BaseObjects = [];
	_BaseObjects = []; //PUSHBACK
	if (_option == "DANGER") then {
		_DFO_BaseObjects = [
			["VR_3DSelector_01_incomplete_F",[-12.5,0,0],0],
			["VR_3DSelector_01_incomplete_F",[0,-12.5,0],0],
			["VR_3DSelector_01_incomplete_F",[12.5,0,0],0],
			["VR_3DSelector_01_incomplete_F",[0,12.5,0],0],
			["VR_3DSelector_01_incomplete_F",[8.8,8.8,0],45],
			["VR_3DSelector_01_incomplete_F",[-8.9,8.8,0],45],
			["VR_3DSelector_01_incomplete_F",[-8.8,-8.9,0],45],
			["VR_3DSelector_01_incomplete_F",[8.8,-8.8,0],45]
		];
	}else {
		if(_option == "MEDEVAC") then {
			_DFO_BaseObjects = [
				["VR_3DSelector_01_default_F",[0,-75,0],0],
				["VR_3DSelector_01_default_F",[75,0,0],0],
				["VR_3DSelector_01_default_F",[0,75,0],0],
				["VR_3DSelector_01_default_F",[-75,0,0],0],
				["VR_3DSelector_01_default_F",[64.9,-37.5,0],30],
				["VR_3DSelector_01_default_F",[37.5,64.9,0],30],
				["VR_3DSelector_01_default_F",[-37.5,-65,0],30],
				["VR_3DSelector_01_default_F",[-65,37.5,0],30],
				["VR_3DSelector_01_default_F",[37.7,-64.9,0],329.9],
				["VR_3DSelector_01_default_F",[-64.9,-37.7,0],329.9],
				["VR_3DSelector_01_default_F",[-37.7,64.8,0],329.9],
				["VR_3DSelector_01_default_F",[64.9,37.7,0],329.9]
			];
		} else {
			_DFO_BaseObjects = [
				["Sign_Arrow_Large_Green_F",[-12.5,0,0],0],
				["Sign_Arrow_Large_Green_F",[0,-12.5,0],0],
				["Sign_Arrow_Large_Green_F",[12.5,0,0],0],
				["Sign_Arrow_Large_Green_F",[0,12.5,0],0],
				["Sign_Arrow_Large_Green_F",[8.8,8.8,0],45],
				["Sign_Arrow_Large_Green_F",[-8.9,8.8,0],45],
				["Sign_Arrow_Large_Green_F",[-8.8,-8.9,0],45],
				["Sign_Arrow_Large_Green_F",[8.8,-8.8,0],45]
			];
		};
	};
	if (_option == "FULL" || _option == "HELIPAD" ) then {
		_DFO_BaseObjects = _DFO_BaseObjects + [["Land_HelipadCircle_F",[0,0,0],0]];
	};
	if (_option == "FULL") then {
		//add The screen to call the action
		_DFO_BaseObjects = _DFO_BaseObjects + [
			["Land_TripodScreen_01_large_F",[-14.1,5.1,0],110],
			["CamoNet_INDP_open_F",[16.1,-15.3,0],128.4],
			["Campfire_burning_F",[-16.3,19,0],0],
			["Land_Cargo_House_V1_F",[-11.1,18.8,0],332.3],
			["Land_Cargo_Patrol_V1_F",[-18.9,7.5,0],108.6],
			["Land_Cargo_Patrol_V1_F",[19.5,-6.7,0],286.6],
			["Land_HBarrier_3_F",[22.5,-13.8,0],268.1],
			["Land_HBarrier_3_F",[21.1,-16.5,0],320.4],
			["Land_HBarrier_5_F",[6.7,-24.9,0],61.2],
			["Land_HBarrier_5_F",[4.2,-20.3,0],61.2],
			["Land_HBarrier_5_F",[10.8,-24.9,0],331.6],
			["Land_HBarrier_Big_F",[0,-17,0],0],
			["Land_HBarrier_Big_F",[-21,3.2,0],19.3],
			["Land_HBarrier_Big_F",[-7.9,-15.1,0],27.8],
			["Land_HBarrier_Big_F",[-14,-9.7,0],55.4],
			["Land_HBarrier_Big_F",[-16.9,-2.1,0],82.8],
			["Land_HBarrier_Big_F",[-22.6,8.8,0],110.6],
			["Land_HBarrier_Big_F",[-15.9,6,0],110.6],
			["Land_HBarrier_Big_F",[-19.1,19.8,0],138.8],
			["Land_HBarrier_Big_F",[-12.4,24.6,0],152.5],
			["Land_HBarrier_Big_F",[-7.8,15.1,0],152.5],
			["Land_HBarrier_Big_F",[0,17,0],180],
			["Land_HBarrier_Big_F",[21.3,-3.1,0],201.9],
			["Land_HBarrier_Big_F",[7.9,15,0],207.8],
			["Land_HBarrier_Big_F",[13.7,10,0],233.8],
			["Land_HBarrier_Big_F",[-7.2,21.6,0],245.1],
			["Land_HBarrier_Big_F",[16.8,2.6,0],261.2],
			["Land_HBarrier_Big_F",[23.3,-8.1,0],289],
			["Land_HBarrier_Big_F",[16.1,-5.5,0],289],
			["Land_HBarrier_Big_F",[7.8,-15.1,0],332.5],
			["Land_LampShabby_F",[11.1,-13.1,2.17],47.7],
			["Land_Medevac_house_V1_F",[10.3,-19.4,0],240.9],
			["Land_SignM_WarningMilitaryArea_english_F",[-23.3,11.1,0],107]
		];
	};
	private _compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
	private _dirCompo = (Random 359);
	_compoRefPoint setDir _dirCompo;
	{
		_object = createVehicle [(_x select 0), [0,0,4000], [], 0, "CAN_COLLIDE"];
		_object setdir _dirCompo + (_x select 2);
		_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]);
		if (surfaceIsWater _pos) then {
			//_object setposASL [(_objectVectoriel select 0),(_objectVectoriel select 1),(_objectVectoriel select 2)];
			_object setposASL _objectVectoriel;
		} else {
			//_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),(_objectVectoriel select 2)];
			_object setposATL _objectVectoriel;
			_gradient = surfaceNormal getPosATL _object;
			_object setvectorup _gradient;
			if(_option == "MEDEVAC") then {
				_object setPos [_objectVectoriel select 0,_objectVectoriel select 1,0];
			};
		};
		_object allowDamage false;
		_object enableSimulationGlobal true;
		if ((_x select 0) == "Land_HelipadCircle_F") then {
			_object setVariable ["WMS_DFO_BaseHelipad",true];
			WMS_DFO_BasePositions pushBack (getPosATL _object);
		};
		_BaseObjects pushBack _object;
		if ((_x select 0) == "Land_TripodScreen_01_large_F")then{
			[_object]call WMS_fnc_DFO_addAction;
			WMS_DFO_ObjToAddAction pushBack _object;
		};
		if (surfaceIsWater getPos _object && {((getPosASL _object) select 2) < 0}) then{
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_BuildBase this is really fuckedUp, Object %1 underWater %2', _object, (getPosASL _object)]};
		};
	}forEach _DFO_BaseObjects;
	if (_option == "DANGER" || _option == "MEDEVAC") then {_option = "NOTRIGGER"};
	if (_option != "NOTRIGGER") then {
		private _triggMission = createTrigger ["EmptyDetector", _pos, true];
		private _helper = createVehicle ["VR_Area_01_circle_4_grey_F", [_pos select 0,_pos select 1,(_pos select 2)+0.1], [], 0, "CAN_COLLIDE"];
		if (WMS_DFO_HideLZTarget) then {
			_helper setvectorup [0,0,-1]; //[0,0,-1] will turn the helper upsidedown and hide it (from the top)
		} else {
			_helper setvectorup [0,0,1];
		};
		_triggMission attachTo [_helper,[0,0,0]];
		_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true];
		_triggMission setTriggerArea [13, 13, 0, false];
		_triggMission setTriggerStatements  
		[ 
  			"
			  this && ({ thisTrigger distance _x <= 12.5 } count thislist) > 0
			",  
  			"	 
	  			'Dynamic Flight Ops, Do not Park here' remoteExec ['systemChat', (owner (thisList select 0))];
				if (true) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_BuildBase trigger thisList %1', thisList]};
				if (WMS_DFO_Standalone) then {
					[[['Dynamic Flight Ops, Do not Park here']],'NOTIRED'] remoteExec ['WMS_fnc_DFO_killStats',(owner (thisList select 0))];
				} else {
					[[['Dynamic Flight Ops, Do not Park here']],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',(owner (thisList select 0))];
				};
			",  
  			"
	  			'Dynamic Flight Ops, Thank you for your visit' remoteExec ['systemChat', (owner (thisList select 0))];
			" 
		];
	};
	publicVariable "WMS_DFO_ObjToAddAction";
	publicVariable "WMS_DFO_BasePositions";
	deleteVehicle _compoRefPoint;
	_BaseObjects
//};