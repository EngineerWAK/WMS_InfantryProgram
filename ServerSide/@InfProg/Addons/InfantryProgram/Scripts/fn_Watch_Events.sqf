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

private ["_type","_pos","_grpArray","_vhl","_obj","_mkr","_wps","_ref","_cnt","_openedTime"];
_type = ((WMS_Events_list select 0) select 1);
_timeToWait = ((WMS_Events_list select 0) select 0);
if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Next Event: %1 @%2",_type,_timeToWait];};
if (time > _timeToWait) then {
	if (_type == "RepairCamp") then {//Repair Camp has nothing to watch, no WMS_Events_Running pushback
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1 @%2", _type, _pos];};
		["", (Random 359), WMS_AMS_CenterMap, ((worldsize/2)*1.413), _pos, 14400, 0, 999, 0] spawn WMS_fnc_Compo_RepairCamp;
	};

	if (_type == "HeliCrash") then {
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.20] call BIS_fnc_findSafePos;
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1 @%2", _type, _pos];};
		if (surfaceIsWater _pos) then {
			_pos = [] call BIS_fnc_randomPos;
		};
		[_pos,(random 359),(2+round(random 2)), false] spawn WMS_fnc_Compo_HeliCrash;
	};

	if (_type == "SupplyDrop") then {
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1", _type];};
		[1,0] spawn WMS_fnc_Event_SupplyDrop;
	};

	if (_type == "HumaniDrop") then {//Humanitarian drop watch itself, no WMS_Events_Running pushback for now, see later if AI added
		_pos = [WMS_AMS_CenterMap, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1 @%2", _type, _pos];};
		[_pos, "Humani",false,(WMS_AI_Planes select 1), (selectRandom [1,2])] spawn WMS_fnc_Event_HumaniDrop;
	};

	if (_type == "ReconMission") then {//Recon Mission watch itself, no WMS_Events_Running pushback
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1", _type];};
		//execVM "\InfantryProgram\Scripts\WMS_Event_ReconMission.sqf";
		[]spawn WMS_fnc_Event_ReconMission;
	};

	if (_type == "CaptureZone") then {
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1", _type];};
		["random", (selectRandom ["layout1","layout2","layout3","layout4","layout5"])] spawn WMS_fnc_Event_CaptureZone;
	};
	//TargetConvoy
	if (_type == "TargetConvoy" && {count WMS_TargetConvoyUnits == 0}) then {
		if (WMS_IP_LOGs) then {diag_log format ["[EVENTS WATCH]|WAK|TNA|WMS| Processing Event: %1", _type];};
		[]call WMS_fnc_Event_Convoy;
	};
	WMS_Events_list deleteAt 0;
};


if (count WMS_Events_Running != 0) then { 
	{ 
		if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP Watch]|WAK|TNA|WMS| %1 Events Monitored", count WMS_Events_Running]};
		//Events are not really subject to a timer for now but more Crate acces (trigger) and/or all AI killed
		//WMS_Events_Running pushBack [time,time+WMS_SupplyDropDelay,_grps,_vhls,_objs,_mkrs,[],"supplydrop"];
		//if (time > (_x select 1) && count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnINF]) == 0) then { //test player presence
		if (((_x select 7) == "supplydrop") && {(count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnINF]) == 0)}) then {
			_cnt = 0;
			{
				_cnt = _cnt + ({alive _x} count units _x);
			} foreach (_x select 2);
			_opened = (_x select 3 select 0) getVariable ['opened', false];
			_openedTime = (_x select 3 select 0) getVariable ['openedTime', WMS_ServRestartSeconds];
			if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP Watch]|WAK|TNA|WMS| Crate Opened: %1, Opened time: %2, %3 still alive", _opened,_openedTime,_cnt]};
			if (_cnt == 0 && {(_opened)} && {(_openedTime > time+300)}) then {
				if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
				_grpArray = (_x select 2);
				_vhl = (_x select 3); //crate
				_obj = (_x select 4); //mines, signs, trigger, Jump Target
				_mkr = (_x select 5);
				_wps = (_x select 6);
				_ref = (_x select 7);
				if (_ref == "ALARM") then {//that can not work obviously XD
					PlaySound3D ["A3\Sounds_F\sfx\siren.wss", (_obj select 0), false, position (_obj select 0), 2, 1, 0];
				};
				//{
				//	{deleteVehicle _x;} foreach units _x;
				//} forEach _grpArray; 
				//{deleteVehicle _x;} forEach _vhl; 
				{deleteVehicle _x;} foreach _obj; 
				{deleteMarker _x;} foreach _mkr; 
				//{deleteWaypoint _x;} foreach _wps;
				{deleteGroup _x;} forEach _grpArray; 
				WMS_Events_Running deleteAt (WMS_Events_Running find _x);
			};
		};
		
	} foreach WMS_Events_Running;
};