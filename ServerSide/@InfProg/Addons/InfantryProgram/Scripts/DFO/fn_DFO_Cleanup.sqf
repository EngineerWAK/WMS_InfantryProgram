/**
* WMS_fnc_DFO_Cleanup - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_Cleanup = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_Cleanup _this %1', _this]};
	private [
		"_timeToDelete","_grpArrays","_grpOPFOR","_grpCIV","_vhl","_vhlOPFOR","_vhlCIV","_obj","_mkr","_cargo",
		"_mission","_passenger","_options","_MissionFinish","_success","_failed","_cntOPFOR","_cntVhlOPFOR","_cntCIV","_playerObject"
		];
	_timeToDelete 	= (_this select 1);
	_grpArrays 		= (_this select 2); //[[],[]]
	_grpOPFOR 		= _grpArrays select 0; //[]
	_grpCIV 		= _grpArrays select 1; //[]
	_vhl 			= (_this select 3); //[[],[]]
	_vhlOPFOR 		= _vhl select 0; //[]
	_vhlCIV 		= _vhl select 1; //[]
	_obj 			= (_this select 4); //[mines, signs, triggers, Jump Target, whatever]
	_mkr 			= (_this select 5); //[]
	_cargo 			= (_this select 6); //object //no waypoints, can be used for the cargoObject
	_options 		= (_this select 8); //[_MissionHexaID,_playerObject,_mission,_MsnPathCoord] //_MissionFinish should be (_MsnPathCoord select 2)
	_playerObject 	=  _options select 1;
	_mission 		= _options select 2;
	_MissionFinish 	= _options select 5;
	_success 		= false;
	_failed 		= false;
	_cntOPFOR 		= 0;
	_cntVhlOPFOR 	= 0;
	_cntCIV 		= 0;
	_passenger 		= 0;
	{
		_cntOPFOR = _cntOPFOR + ({alive _x} count units _x);
	} foreach _grpOPFOR;
	{
		_cntCIV = _cntCIV + ({alive _x} count units _x);
		_passenger = _cntCIV + ({vehicle _x != _x} count units _x);
	} foreach _grpCIV;
	switch (_mission) do {
		case "inftransport": { //CIV Alive at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {vehicle (leader (_grpCIV select 0)) == (leader (_grpCIV select 0))} && {(getPosATL (leader (_grpCIV select 0))) distance _MissionFinish < 12.5}) then {_success = true};
			if(_cntCIV == 0) then {_failed = true};
		};
		case "cargotransport": { //_cargo at _MissionFinish, alive _cargo
			if(alive _cargo && {(getPosATL _cargo) distance _MissionFinish < 12.5}) then {_success = true};
		};
		case "casinf": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_success = true};
		};
		case "casarmored": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_success = true};
		};
		case "cascombined": { //mission (LZ1) succes wen target destroyed, No RTB/LZ2, _cntOPFOR = 0
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};
			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0}) then {_success = true};
		};
		case "sar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, _cntCIV != 0
			if(_cntCIV != 0 && {(getPosATL (leader (_grpCIV select 0))) distance _MissionFinish < 25}) then {_success = true};
			if(_cntCIV == 0) then {_failed = true};
		};
		case "csar": { //"LZ1"->"BASE" succes wen passenger at _MissionFinish, no need to kill OPFOR, _cntCIV != 0
			if(_cntCIV != 0 && {(getPosATL (leader (_grpCIV select 0))) distance _MissionFinish < 25}) then {_success = true};
			if(_cntCIV == 0) then {_failed = true};
		};
		case "airassault": { //destroy target or capture zone at _MissionFinish, _cntOPFOR = 0, _vhlOPFOR != alive //the capture will do a "call for Cleanup/victory"
			if (count _vhlOPFOR != 0) then {
				{if(alive _x)then{_cntVhlOPFOR = _cntVhlOPFOR+1}}forEach _vhlOPFOR;
			};

			if(_cntOPFOR == 0 && {_cntVhlOPFOR == 0} && {_cntCIV != 0}) then {_success = true};
			if(_cntCIV == 0) then {_failed = true};
		};
		case "medevac": { //CANCELED
			if(_cntCIV != 0 && {vehicle (leader (_grpCIV select 0)) == (leader (_grpCIV select 0))} && {(getPosATL (leader (_grpCIV select 0))) distance _MissionFinish < 25}) then {_success = true};
			if(_cntCIV == 0) then {_failed = true};
		};
	};
	if (_failed) then {_timeToDelete = 0};
	if (_success == true || time >= _timeToDelete) then {
		WMS_DFO_Running deleteAt (WMS_DFO_Running find _this);
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpCIV;
		{deleteVehicle _x;} forEach _vhlOPFOR; 
		{deleteVehicle _x;} forEach _vhlCIV;
		{deleteVehicle _x;} forEach _obj; 
		{deleteMarker _x;} forEach _mkr; 
		{deleteGroup _x;} forEach _grpOPFOR; 
		{deleteGroup _x;} forEach _grpCIV;
		//deleteVehicle _cargo; //I guess cargo can stay, its not a big deal
	};
	if (_success == true) then {
		//VICTORY!!!
		{
			{_x setDamage 1} forEach units _x;
		} forEach _grpOPFOR; 
		//send victory message and rewards
		[_playerObject,_mission]call WMS_fnc_DFO_MissionSucces;
	};
	if (time >= _timeToDelete) then {
		//FAIL!!!
		{
			{moveOut _x; deleteVehicle _x;} forEach units _x;
		} forEach _grpOPFOR;
		detach _cargo;
		deleteVehicle _cargo;
		//send fail message
		if (WMS_DFO_UseJVMF) then {["FAIL","DFO HQ",name _playerObject,0,["Dynamic Flight Ops","Mission Faild","","","","","","","",""],[],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF};
		if (WMS_exileToastMsg) then {
			_sessionID = _playerObject getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['Dynamic Flight Ops', 'Mission FAILED!!!']]] call ExileServer_system_network_send_to;
		} else {
			["TaskFailed", ["Dynamic Flight Ops", "Mission FAILED!!!"]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
		};
	};
//};