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

//WMS_ParadropAI_watch pushback [time,timeToDelete,[groups],[[_vhl,[0,0,0]],[_vhl,[0,0,0]],[_vhl,[0,0,0]]],[objects],[markernames],[WPs],"reference"];
private ["_RoamingAIvhl","_RoamingAIair","_timeAdded","_vehicles","_vhl","_lastPos","_newPos","_assKicked","_grpArray","_obj","_mkr","_wps","_ref","_ownedBy","_timeAddedAir","_vehiclesAir"];
_RoamingAIvhl = (count WMS_AI_RoamingVHL_Running);
_RoamingAIair = (count WMS_AI_RoamingAIR_Running);

if !(_RoamingAIvhl == 0) then { 
	if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL Watch]|WAK|TNA|WMS| %1 Vehicles Patroling", _RoamingAIvhl]};
	{ 
		_timeAdded = (_x select 0);
		_vehicles = (_x select 3); //[[_vhl,[0,0,0]],[_vhl,[0,0,0]],[_vhl,[0,0,0]]]
		/////Unstuck vehicle
		{
			if ((time > (_timeAdded+60)) && {alive (_x select 0)} && {side(group(_x select 0)) == EAST} && {alive (driver (_x select 0))} && {count ((position (_x select 0)) nearEntities [WMS_PlayerEntity, 300]) == 0}) then { //side EAST means there is still AI inside otherwise side UNKNOW
				_vhl = (_x select 0);
				_lastPos = (_x select 1);
				_newPos = position _vhl;
				if ((_newPos distance2d _lastPos) < 3) then {
					_assKicked = _vhl getVariable "KickVehAss";
					if (_assKicked < WMS_AI_RoamingVHL_MaxKick) then {
						_vhl setVariable ["KickVehAss",_assKicked+1,true];
						_emptyPos = _newPos findEmptyPosition [2,150,(typeOf _vhl)];
						_closeSafePos = [(_emptyPos select 0), (_emptyPos select 1), 1];
						_vhl setpos _closeSafePos;
						_vhl setdir ((getDir _vhl)+45);
						if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL Watch]|WAK|TNA|WMS| moving %1 from %2 to %3, assKicked %4 times", _vhl, _newPos, _closeSafePos,_assKicked]};
					} else {
						_vhl setDamage 1;
						if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL Watch]|WAK|TNA|WMS| %1 is a moron and is now destroyed", _vhl]};
					};
				};
			_x set [1, _newPos];
			} else {
				if (isplayer(driver(_x select 0)) || (owner (_x select 0) != 2)) then { //if player is driving, remove the vehicle from the cleanup list
					if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL OWNERS]|WAK|TNA|WMS| vehicle: %1 owned by a player and removing it from the list",(_x select 0)]};
					PlaySound3D ["A3\Sounds_F\sfx\hint-4.wss", (_x select 0), false, position (_x select 0), 2, 1, 0];
					_vehicles deleteAt (_vehicles find _x);
					//Add Process Cargo Dump here
					if (WMS_AMS_AddActionOnReward) then {
						//Cargo Dump
						[ //params ["_target", "_caller", "_actionId", "_arguments"];
							(_x select 0),
							[
								"<t size='1' color='#4b48f9'>Process Cargo Dump</t>",// #035c10"
								"
									if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
										[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_processCargoDump']; 
										(_this select 0) removeaction (_this select 2);
									} else { 
										'Cargo Dump Container is empty, you punk' remoteExec ['hint', (owner (_this select 1))]; 
									};
								",
								[], //argument accessible in the script (_this select 3)
								1,
								true,
								true,
								"",
								"(alive _target) && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])};",
								5
							]
						] remoteExec [
							"addAction",
							(owner (_x select 0)), //0 for all players //2 server only //-2 everyone but the server
							false //JIP
						];
							//Vehicle dump + cargo dump
						[ //params ["_target", "_caller", "_actionId", "_arguments"];
							(_x select 0),
							[
								"<t size='1' color='#4b48f9'>Vehicle + Cargo Dump</t>",//_display, //"<t color='#4b48f9'>Resell the Vehicle</t>""#035c10"
								"
									if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
										[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_processCargoDump']; 
									};
									[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_sellVehicles'];
									(_this select 0) removeaction (_this select 2);
								",
								[], //argument accessible in the script (_this select 3)
								1,
								true,
								true,
								"",
								"(alive _target) && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])};",
								5
							]
						] remoteExec [
							"addAction",
							(owner (_x select 0)), //0 for all players //2 server only //-2 everyone but the server
							false //JIP
						];
					};
				};
			};
		} forEach _vehicles;
		if ((count units ((_x select 2) select 0)) < 1) then {
			if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL Watch]|WAK|TNA|WMS| %1 is no more, rest in peace and get the fuck out of the Array", _x]};
			_x set [1,0];
		};
		/////Unstuck vehicle
		/////Delete Timed out vehicles
		if (time > (_x select 1) && {count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnVHL]) == 0}) then {//totaly not sure this filter is doing the job
			if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_obj = (_x select 4);
			_mkr = (_x select 5);
			_wps = (_x select 6);
			_ref = (_x select 7);
			if (_ref == "ALARM") then {
				PlaySound3D ["A3\Sounds_F\sfx\siren.wss", (_obj select 0), false, position (_obj select 0), 2, 1, 0];
			};
			{
				{ 
					if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x};
					deleteVehicle _x;
				} foreach units _x;
			} forEach _grpArray; 
			{
				_ownedBy = (owner (_x select 0));
				if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL OWNERS]|WAK|TNA|WMS| vehicle: %1 owned by: %2",(_x select 0), _ownedBy]};
				if (isplayer(driver(_x select 0)) || (_ownedBy != 2)) then {
					if (WMS_IP_LOGs) then {diag_log format ["[Roaming VHL OWNERS]|WAK|TNA|WMS| vehicle: %1 owned by a player",(_x select 0)]};
				} else {
					deleteVehicle (_x select 0);
				};
			} foreach _vehicles; 
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_AI_RoamingVHL_Running deleteAt (WMS_AI_RoamingVHL_Running find _x);
		};
		/////Delete Timed out vehicles
	} foreach WMS_AI_RoamingVHL_Running;
};
//AIR//
if !(_RoamingAIair == 0) then { 
	{ 
		_timeAddedAir = (_x select 0);
		_vehiclesAir = (_x select 3);
		if (time > (_x select 1) && {count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnAIR]) == 0}) then {
			if (WMS_IP_LOGs) then {diag_log format ["[Roaming AIR Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_obj = (_x select 4);
			_mkr = (_x select 5);
			_wps = (_x select 6);
			_ref = (_x select 7);
			//if (_ref == "") then {};
			{
				{ 
					if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x};
					deleteVehicle _x;
				} foreach units _x;
			} forEach _grpArray; 
			{
				_ownedBy = (owner (_x select 0));
				if (WMS_IP_LOGs) then {diag_log format ["[Roaming AIR OWNERS]|WAK|TNA|WMS| vehicle: %1 owned by: %2",(_x select 0), _ownedBy]};
				if (isplayer(driver(_x select 0)) || (_ownedBy != 2)) then {
					if (WMS_IP_LOGs) then {diag_log format ["[Roaming AIR OWNERS]|WAK|TNA|WMS| vehicle: %1 owned by a player",(_x select 0)]};
					PlaySound3D ["A3\Sounds_F\sfx\hint-4.wss", (_x select 0), false, position (_x select 0), 2, 1, 0];
					_vehiclesAir deleteAt (_vehiclesAir find _x);
				} else {
					deleteVehicle (_x select 0);
				};
			} foreach _vehiclesAir; 
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_AI_RoamingAIR_Running deleteAt (WMS_AI_RoamingAIR_Running find _x);
		};
	} foreach WMS_AI_RoamingAIR_Running;
};