/**
* WMS_fnc_DFO_NextStepMkrTrigg - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_NextStepMkrTrigg = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg _this %1', _this]};
	params [//[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,BOOLEAN reinforce or not,BOOLEAN smoke or not,_grp to smoke, _pilotUID]
		["_MissionHexaID","zzzzzzzz"],
		["_playerObject", objNull],
		["_mkrs",[]], //useless in this case, the new marker could go here if needed
		["_mission","sar"],
		["_MsnPathCoord", [[0,0,0],[0,0,0],[0,0,0]]],
		["_missionName","DFO Mission"],
		["_MissionFinish", [0,0,0]],
		["_reinforce",false],
		["_smoke",false],
		["_smokeGrp",nil],
		["_pilotUID","zzzzzzzz"],
		["_airassaultDatas",[]]//[0,1,EAST,_pos,_OPFORvhlCnt,_OPFORvhlType,3,6]
		];
	private _triggerHeight = 50; //test for rappel //triggerHeight should be dynamic
	private _unloadType = 0; //dump  //overWritten by the trigger itself, 50m to 20m: fast rope, 20m to 10m: jump, 10m to 0: land
	if (_MissionHexaID ==  "zzzzzzzz") exitWith {
		if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg params fuckedUp _MissionHexaID %1', _MissionHexaID]};
		};
	private _result = []; 
	{ 
		_found = (_x select 9) find _MissionHexaID;
		_result pushback _found;
	}forEach WMS_DFO_Running;
	private _RefIndex = _result find 0;
	if (_RefIndex == -1 ) exitWith {if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg params fuckedUp _MissionHexaID %1', _MissionHexaID]};};
	//create last step to finish the mission RTB Or LZ2
	private _pos = _MissionFinish;
	//CREATE THE MARKER
	private _mkrName = format ["DFO_markerEnd_%1",time];
	private _MkrLZ = createMarker [_mkrName, _pos];
	_MkrLZ setMarkerType (WMS_DFO_Markers select 1);
	_MkrLZ setMarkerColor (WMS_DFO_MkrColors select 1);
	_MkrLZ setMarkerText format ["%1 %2",_missionName,(name _playerObject)];

	if (_mission == 'airassault') then {
		_unloadType = 3; //fastRope
		_MkrLZ setMarkerColor (WMS_DFO_MkrColors select 2);
		_vhlReturns = [_MissionHexaID,_playerObject,EAST,(_airassaultDatas select 3),(_airassaultDatas select 4),(_airassaultDatas select 5),_mission,_MissionFinish] call WMS_fnc_DFO_CreateVhls;
		{(WMS_DFO_Running select _RefIndex select 3 select 0) pushBack _x;} forEach (_vhlReturns select 0);
		{(WMS_DFO_Running select _RefIndex select 2 select 0) pushBack _x;} forEach (_vhlReturns select 1);
	};
	[_RefIndex,_mkrName] spawn { //it looks weird but if pushed too fast, the marker is deleted by the previous trigger !
		_RefIndex = _this select 0;
		_mkrName = _this select 1;
		uisleep 3;
		(WMS_DFO_Running select _RefIndex select 5) pushBack _mkrName;
	};
	//CREATE OBJECTS TO MARK THE ZONE
	if !(_pos isEqualTo (_MsnPathCoord select 0)) then {
		private _objects = [];
		_objects = [_pos,"DANGER"]call WMS_fnc_DFO_BuildBase;
		{(WMS_DFO_Running select _RefIndex select 4) pushBack _x;} forEach _objects;
	};
	//CREATE THE TRIGGER
	private _triggMission = createTrigger ["EmptyDetector", _pos, true];
	private _helper = createVehicle ["VR_Area_01_circle_4_yellow_F", [_pos select 0,_pos select 1,(_pos select 2)+0.2], [], 0, "CAN_COLLIDE"];
	if (WMS_DFO_HideLZTarget) then {
		_helper setvectorup [0,0,-1]; //[0,0,-1] will turn the helper upsidedown and hide it (from the top)
	} else {
		_helper setvectorup [0,0,1];
	};
	_triggMission attachTo [_helper,[0,0,0]];
	(WMS_DFO_Running select _RefIndex select 4) pushBack _helper;
	(WMS_DFO_Running select _RefIndex select 4) pushBack _triggMission;
	_triggMission setVariable ["WMS_DFO_triggData", [_MissionHexaID,_playerObject,_mkrName,_mission,_MsnPathCoord,_missionName,_MissionFinish,_pilotUID], false]; 
	_triggMission setVariable ["WMS_DFO_triggerHeight", _triggerHeight, false];
	_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_triggMission setTriggerArea [12.5, 12.5, 0, false];
	_triggMission setTriggerStatements  
	[ 
  		"
			this && ({ thisTrigger distance _x <= (thisTrigger getVariable 'WMS_DFO_triggerHeight') } count thislist) > 0
		",   
  		"	
			private _datas = (thisTrigger getVariable 'WMS_DFO_triggData');
			private _pilot = (_datas select 1);
			private _mission = (_datas select 3);
			private _pilotUID = (_datas select 7);
			private _UIDlist = [];
			{_UIDlist pushBack (getPlayerUID _x)}forEach thislist;
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_NextStepMkrTrigg _UIDlist %1', _UIDlist]};
			if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger END | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 | ThisList %6', (_datas select 0), name (thislist select 0), (_datas select 2), (_datas select 3), (_datas select 4), thisList]};
			if ((_pilotUID in _UIDlist) && {(vehicle (thislist select 0)) isKindOf 'Helicopter'} && {speed (vehicle (thislist select 0)) < WMS_DFO_TriggMaxSpeed}) then {
				if(_mission == 'sar' || _mission == 'csar' || _mission == 'airassault' || _mission == 'inftransport' || _mission == 'medevac') then {
					if ((vehicle (thislist select 0)) distance thisTrigger > 25) then {
						if (WMS_DFO_Standalone) then {
							[[['Hold position for Fast Roping']],'NOTI'] remoteExec ['WMS_fnc_DFO_killStats',(owner _pilot)];
						} else {
							[[['Hold position for Fast Roping']],'NOTI'] remoteExec ['WMS_fnc_displaykillStats',(owner _pilot)];
						};
						'Dynamic Flight Ops, Hold position for Fast Roping' remoteExec ['systemChat', (owner _pilot)];
						[(vehicle (thislist select 0)), _pilot,3] spawn WMS_fnc_DFO_infUnLoad;
					}else{
						if ((vehicle (thislist select 0)) distance thisTrigger > 15)then{
							if (WMS_DFO_Standalone) then {
								[[['Units Jumping Out']],'NOTI'] remoteExec ['WMS_fnc_DFO_killStats',(owner _pilot)];
							} else {
								[[['Units Jumping Out']],'NOTI'] remoteExec ['WMS_fnc_displaykillStats',(owner _pilot)];
							};
							'Dynamic Flight Ops,  Units Jumping Out' remoteExec ['systemChat', (owner _pilot)];
							[(vehicle (thislist select 0)), _pilot,0] spawn WMS_fnc_DFO_infUnLoad;
						}else{
							if (WMS_DFO_Standalone) then {
								[[['Units Waiting for Landing']],'NOTI'] remoteExec ['WMS_fnc_DFO_killStats',(owner _pilot)];
							} else {
								[[['Units Waiting for Landing']],'NOTI'] remoteExec ['WMS_fnc_displaykillStats',(owner _pilot)];
							};
							'Dynamic Flight Ops,  Units Waiting for Landing' remoteExec ['systemChat', (owner _pilot)];
							[(vehicle (thislist select 0)), _pilot,1] spawn WMS_fnc_DFO_infUnLoad;
						};
					};	
				};
				deleteVehicle thisTrigger;
			}else{
				if !(_pilotUID in _UIDlist) then {	
					[(thisList select 0)] call WMS_fnc_DFO_PunishPunks;
					vehicle (thisList select 0) setVelocity [-(sin (getDir (thisList select 0)))*6, -(cos (getDir (thisList select 0)))*6, 2];
					if (WMS_DFO_Standalone) then {
						[[['Dynamic Flight Ops, Stay outside of this zone']],'NOTIRED'] remoteExec ['WMS_fnc_DFO_killStats',(thisList select 0)];
					} else {
						[[['Dynamic Flight Ops, Stay outside of this zone']],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',(thisList select 0)];
					};
					'Dynamic Flight Ops, Stay outside of this zone' remoteExec ['systemChat', (owner (thisList select 0))];
				}else {
					if (speed (thisList select 0) > WMS_DFO_TriggMaxSpeed) then{
						if (WMS_DFO_Standalone) then {
							[[[format ['Redo your Approach, maxSpeed %1 km/h',WMS_DFO_TriggMaxSpeed]]],'NOTIRED'] remoteExec ['WMS_fnc_DFO_killStats',(owner _pilot)];
						} else {
							[[[format ['Redo your Approach, maxSpeed %1 km/h',WMS_DFO_TriggMaxSpeed]]],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',(owner _pilot)];
						};
						format ['Dynamic Flight Ops, Redo your Approach, maxSpeed %1 km/h',WMS_DFO_TriggMaxSpeed] remoteExec ['systemChat', (owner _pilot)];
					}else{
						'Dynamic Flight Ops, Get Back To Your Chopper, Pilot!' remoteExecCall ['hint', (owner _pilot)];
						'Dynamic Flight Ops, Get Back To Your Chopper, Pilot!' remoteExec ['systemChat', (owner _pilot)];
					};
				};
			};
		",
  		"" 
	];
	//Notifications
	if (_mission == "medevac") then {
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', "Find and Stabilize Patient(s) then bring them Back to DFO Base"]]] call ExileServer_system_network_send_to;
		} else {
			["EventCustom", ["Dynamic Flight Ops", "Find and Stabilize Patient(s) then bring them Back to DFO Base", "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
		[[["Find and Stabilize Patient(s) then bring them Back to DFO Base"]],'NOTI'] remoteExec ['WMS_fnc_displaykillStats',(owner _playerObject)];
	} else {
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Dynamic Flight Ops', (format ["%1 @ %2, phase 2",_missionName, ([round(_pos select 0), round(_pos select 1)])])]]] call ExileServer_system_network_send_to;
		} else {
			["EventCustom", ["Dynamic Flight Ops", (format ["%1 @ %2, phase 2",_missionName, ([round(_pos select 0), round(_pos select 1)])]), "\A3\ui_f\data\map\MapControl\taskiconcreated_ca.paa"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
	};
//};