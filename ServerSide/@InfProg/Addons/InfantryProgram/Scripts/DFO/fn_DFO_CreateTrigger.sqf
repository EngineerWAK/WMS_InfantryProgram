/**
* WMS_fnc_DFO_CreateTrigger - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_CreateTrigger = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger _this %1', _this]};
	private ["_triggerSpeed","_triggerHeight","_triggSize","_triggList","_triggMission","_triggReinf","_mission","_MissionHexaID"];
	params [
		"_pos",
		["_triggType", "whatever"],
		["_options",[]], //[_MissionHexaID,_playerObject,_mkrs,_mission,_MsnPathCoord,_missionName,_MissionFinish,BOOLEAN reinforce or not,BOOLEAN smoke or not,_grp to smoke, _pilotUID]
		["_airassaultDatas",[]] //[0,1,EAST,_pos,_OPFORvhlCnt,_OPFORvhlType,3,6] //"airassault" options to create the vehicles, numbers are regular option index
	];
	_triggList = [];
	_mission = _options select 3;
	_MissionHexaID = _options select 0;
	_triggSize = 12.5;
	_triggerHeight = 15;
	_triggerSpeed = WMS_DFO_TriggMaxSpeed;
	if (_mission == "medevac") then {_triggSize = 75; _triggerHeight = _triggSize;_triggerSpeed = WMS_DFO_TriggMaxSpeed*1.5;};
	if (_triggType isEqualTo "LZ1" || _triggType isEqualTo "BASE") then {
		if (_mission == 'airassault') then {_options pushBack _airassaultDatas};
		if !(_mission == "casinf" || _mission == "casarmored" || _mission == "cascombined") then { //CAS do not need trigger, the cleanup is every minute check and no RTB
			_triggMission = createTrigger ["EmptyDetector", _pos, true];
			private _helper = createVehicle ["VR_Area_01_circle_4_yellow_F", [_pos select 0,_pos select 1,(_pos select 2)+0.15], [], 0, "CAN_COLLIDE"];
			if (surfaceIsWater _pos) then {
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger position trigger is over Water! %1', _pos]};
				if ((getPosASL _helper)select 2 < 0) then {
					if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger Moving trigger to the surface ! %1', _pos]};
					_helper setPosASL [((getpos _helper) select 0), ((getpos _helper) select 1), (_pos select 2)+0.5];
				};
			};
			if (WMS_DFO_HideLZTarget || _mission == "medevac") then {
				_helper setvectorup [0,0,-1]; //[0,0,-1] will turn the helper upsidedown and hide it (from the top)
			} else {
				_helper setvectorup [0,0,1];
			};
			_triggMission attachTo [_helper,[0,0,0]];
			[_MissionHexaID, _helper] spawn { //at this point, the mission is not yet in the array to check
				uisleep 6;
				private _result = []; 
				{ 
					_found = (_x select 9) find (_this select 0);
					_result pushback _found;
				}forEach WMS_DFO_Running;
				private _RefIndex = _result find 0;
				(WMS_DFO_Running select _RefIndex select 4) pushBack (_this select 1);
			};		
			_triggMission setVariable ["WMS_DFO_triggData", _options, false];  
			_triggMission setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
			_triggMission setVariable ["WMS_DFO_triggerHeight", _triggerHeight, false]; 
			_triggMission setVariable ["WMS_DFO_triggerSpeed", _triggerSpeed, false];
			_triggMission setTriggerArea [_triggSize, _triggSize, 0, false];
			_triggMission setTriggerStatements  
			[ 
  			"
			  this && ({ thisTrigger distance _x <= (thisTrigger getVariable 'WMS_DFO_triggerHeight') } count thislist) > 0
			",
  			"	
		  		private _datas = (thisTrigger getVariable 'WMS_DFO_triggData');
				private _pilot = (_datas select 1);
				private _mission = (_datas select 3);
				private _pilotUID = (_datas select 10);
				private _UIDlist = [];
				{_UIDlist pushBack (getPlayerUID _x)}forEach thislist;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger _UIDlist %1', _UIDlist]};
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger LZ1 | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_datas select 0), name (thislist select 0) , (_datas select 2), _mission, (_datas select 4)]};
				if ((_pilotUID in _UIDlist) && {(vehicle (thislist select 0)) isKindOf 'Helicopter'} && {speed (vehicle (thislist select 0)) < (thisTrigger getVariable 'WMS_DFO_triggerSpeed')}) then {
					if(_mission == 'sar' || _mission == 'csar' || _mission == 'airassault' || _mission == 'inftransport' || _mission == 'medevac') then {
						[(vehicle (thislist select 0)) , _pilot, (_datas select 0), _mission] call WMS_fnc_DFO_infLoad;
					};
					_datas call WMS_fnc_DFO_nextStepMkrTrigg;
					{deleteMarker _x}forEach (_datas select 2);
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
  			"" //if (((vehicle _pilot) in thisList) && {(vehicle _pilot) isKindOf 'Helicopter'} && {speed (vehicle _pilot) < 15}) then {
			];	
			_triggList pushBack _triggMission;
		};
	};
	if (_triggType == "reinforce") then {
		if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger Creating Reinforcement Zone Trigger, %1 radius', WMS_DFO_ReinfTriggDist]};
		//trigger reinforcement
		_triggReinf = createTrigger ["EmptyDetector", _pos, true];
		_triggReinf setVariable ["WMS_DFO_triggData", _options, false];
		_triggReinf setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
		_triggReinf setTriggerArea [WMS_DFO_ReinfTriggDist, WMS_DFO_ReinfTriggDist, 0, false];
		_triggReinf setTriggerStatements  
		[ 
  			"this",
  			"	
			  	private _options = (thisTrigger getVariable 'WMS_DFO_triggData');
				private _reinforce = _options select 7;
				private _createSmoke = _options select 8;
				private _smokeGroup = _options select 9;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger REINFORCE | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_options select 0), name (_options select 1), (_options select 2), (_options select 3), (_options select 4)]};
				if (_reinforce) then {[_options select 0,_options select 1,_options select 3,_options select 6,_smokeGroup,(getPosATL thisTrigger)] spawn WMS_fnc_DFO_Reinforce};
				deleteVehicle thisTrigger;
			",  
  			"" 
		];
		_triggList pushBack _triggReinf;
	};
	if (_triggType == "signal") then {
		if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_CreateTrigger Creating Signal Zone Trigger, %1 radius', WMS_DFO_ReinfTriggDist]};
		//trigger Smoke/Flare
		_triggSign = createTrigger ["EmptyDetector", _pos, true];
		_triggSign setVariable ["WMS_DFO_triggData", _options, false];
		_triggSign setVariable ["WMS_DFO_pilot", _options select 1, false]; //you will loose the signal if you comeback after dying but it's not a big deal
		_triggSign setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
		_triggSign setTriggerArea [WMS_DFO_ReinfTriggDist, WMS_DFO_ReinfTriggDist, 0, false];
		_triggSign setTriggerStatements  
		[ 
  			"(vehicle (thisTrigger getVariable 'WMS_DFO_pilot')) in thisList",  
  			"	
			  	private _options = (thisTrigger getVariable 'WMS_DFO_triggData');
				private _reinforce = _options select 7;
				private _createSmoke = _options select 8;
				private _smokeGroup = _options select 9;
				if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] DFO trigger SIGNAL | MissionID %1 | Pilot %2 | Marker %3 | Mission %4 | Mission path %5 |', (_options select 0), name (_options select 1), (_options select 2), (_options select 3), (_options select 4)]};
				if (_createSmoke) then {
					if !(vehicle (leader _smokeGroup) == vehicle (_options select 1)) then {
						_pos = (getPosATL leader _smokeGroup);
						_smoke = 'SmokeShellPurple' createVehicle _pos;
						_smoke attachTo [(leader _smokeGroup), [0,0,0]];
						_flare = 'F_40mm_Red' createVehicle [_pos select 0, _pos select 1, 150];
						_flare setVelocity [1,-0.01,0];
					};
				};
				deleteVehicle thisTrigger;
			",  
  			"" 
		];
		_triggList pushBack _triggSign;
	};
	_triggList
//};