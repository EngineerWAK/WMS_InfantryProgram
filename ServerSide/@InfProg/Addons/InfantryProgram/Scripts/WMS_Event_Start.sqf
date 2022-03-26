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

private ["_selectedEventsList","_type","_timeToWait","_event"];
_selectedEventsList = [];
_type = "";
_timeToWait = 0;
diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Events Watch started, Playground date: %1 %2/%3 %4:%5", (date select 0),(date select 1),(date select 2),(date select 3),(date select 4)];

if (WMS_RepairCamp) then {
	for "i" from 1 to WMS_RepairCampCount do {
		_selectedEventsList pushback [WMS_RepairCampDelay,"RepairCamp"];
	};
};
if (WMS_HeliCrash) then {
	for "i" from 1 to WMS_HeliCrashCount do {
		_selectedEventsList pushback [WMS_HeliCrashDelay,"HeliCrash"];
	};
};
if (WMS_SupplyDrop) then {
	for "i" from 1 to WMS_SupplyDropCount do {
		_selectedEventsList pushback [WMS_SupplyDropDelay,"SupplyDrop"];
	};
};
if (WMS_HumaniDrop) then {
	for "i" from 1 to WMS_HumaniDropCount do {
		_selectedEventsList pushback [WMS_HumaniDropDelay,"HumaniDrop"];
	};
};
if (WMS_ReconMission) then {
	for "i" from 1 to WMS_ReconMissionCount do {
		_selectedEventsList pushback [WMS_ReconMissionDelay,"ReconMission"];
	};
};
if (WMS_CaptureZone) then {
	_selectedEventsList pushback [WMS_CaptureZoneDelay,"CaptureZone"];
};

if (WMS_Events_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Events Watch Selected: %1", _selectedEventsList];};

WMS_Events_list pushback (_selectedEventsList select 0);
_timeToWait = ((WMS_Events_list select 0) select 0);
_selectedEventsList deleteAt 0;
for "i" from 1 to (count _selectedEventsList) do {
	_event = selectRandom _selectedEventsList;
	_timeToWait = _timeToWait + (_event select 0);
	WMS_Events_list pushback [_timeToWait, (_event select 1)];
	_selectedEventsList deleteAt (_selectedEventsList find _event);
	uisleep 0.1;	
};

if (WMS_Events_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Events Watch Planed: %1", WMS_Events_list];};