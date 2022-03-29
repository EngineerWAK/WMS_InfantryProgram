//////////////////////////////////////////////////////////////////
//	Roaming vehicles radar function {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////

private ["_mkrType","_mkrList","_runRadar","_radarScan","_refTime","_timer","_pos","_markerName","_markerOPFOR"];
params[
	["_timer", 300],
	["_type", "chest"],
	["_user", player]
];

systemChat format ["Timer: %1, Type: %2, User: %3", _timer,_type,_user];
_mkrType = "o_unknown";
_mkrList = [];
_runRadar = true;
_radarScan = true;
_refTime = time;
_msg = "Bye Bye";
_filter = false;
systemChat format ["Filter: %1", _filter];
systemChat format ["Powering up the Quantum Radar for %1 secondes", _timer];
 
_user removeMagazine "FilesSecret"; 
_user removeMagazine "FileNetworkStructure"; 
_user removeMagazine "FileTopSecret";


while {_runRadar} do {
	switch (toLower _type) do {
		case  "chest" 		: {_filter = (backpack _user == "B_RadioBag_01_wdl_F")};
		case  "bambi" 		: {_filter = true; _msg = "Good Luck Bambi"};
		case  "admin" 		: {_filter = true; _msg = "Admin Logging Out"};
		case  "computer" 	: {_filter = (backpack _user == "B_RadioBag_01_wdl_F"); _msg = "Quantum System Down"};
	};
	[missionNamespace, "WMS_AI_RoamingVHL_Running", [nil,nil,nil,[]]] call BIS_fnc_getServerVariable;
	//_radio = backpack _user;
	if (_radarScan && (time <= (_refTime + _timer)) && _filter) then {
		//systemChat format ["%1 enemy vehicles found",(count WMS_AI_RoamingVHL_Running)];
		playSound "Radionoise1";
		//playSound3D ["a3\dubbing_radio_f\Sfx\radionoise1.ogg", _user];
		{deleteMarker _x} foreach _mkrList;
		_mkrList = [];
		{ 
		_vehicle = (_x select 3 select 0 select 0);
		//systemChat format ["%1", _vehicle];
			if (_vehicle iskindof "Tank") then { _mkrType = "o_armor"} else {
				if (_vehicle isKindOf "Wheeled_Apc_F")then{ _mkrType = "o_mech_inf"} else {
					if (_vehicle isKindOf "MRAP_01_base_F")then{_mkrType = "o_motor_inf"} else {
						if (_vehicle isKindOf "Truck_F")then{_mkrType = "o_support"} else {
							if (_vehicle isKindOf "LSV_01_base_F"||_vehicle isKindOf "LSV_02_base_F")then{_mkrType = "o_recon"} else {
								_mkrType = "o_unknown";
							};
						};
					};
				};
			};
 			_pos = position _vehicle;
			_markerName = "VHL" + (str _pos);
			_markerOPFOR = createMarkerLocal [_markerName, _pos];
			_markerOPFOR setMarkerTypeLocal _mkrType;
			_markerOPFOR setMarkerColorLocal "ColorRed";
			_mkrList pushBack _markerName;
		} forEach WMS_AI_RoamingVHL_Running;
	} else {
		_runRadar = false;
		_radarScan = false;
		{deleteMarkerLocal _x} foreach _mkrList;
		_mkrList = [];
		systemChat "Shutting down Quantum Radar";
		//systemChat "Bye Bye";
		systemChat format ["%1", _msg];
	};
sleep 20;
};
