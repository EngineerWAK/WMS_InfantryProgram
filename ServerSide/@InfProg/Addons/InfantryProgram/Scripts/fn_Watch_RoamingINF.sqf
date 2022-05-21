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

//WMS_AI_Paradrop_Watch pushback [time,timeToDelete,[groups],[vehicles],[objects],[markernames],[WPs],"reference"];
//WMS_AI_OPFORpatrol_Running pushback [time,(time+(_patrolTimer+(random _patrolTimer))),[_patrolGrp],[],[],[],[],""];
private ["_paradropAIrunning","_patrolAIrunningOP","_patrolAIrunningBL","_DynAIrunning","_grpArray","_vhl","_obj","_mkr","_wps","_ref", "_cnt"];
_paradropAIrunning 	= (count WMS_AI_Paradrop_Watch);
_patrolAIrunningOP 	= (count WMS_AI_OPFORpatrol_Running);
_patrolAIrunningBL 	= (count WMS_AI_bluforPatrol_Running);
_DynAIrunning 		= (count WMS_DynAI_Running);
_cnt = 0;

if (WMS_IP_LOGs) then {diag_log format ["[RoamingINF Watch]|WAK|TNA|WMS| paradrop: %1, infantry OPFOR: %2, infantry BLUFOR: %3, DynAI: %4", _paradropAIrunning,_patrolAIrunningOP,_patrolAIrunningBL,_DynAIrunning]};
//paradrop
if !(_paradropAIrunning == 0) then { 
	{ 
		if (time > (_x select 1) && count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnINF]) == 0) then { //test player presence
			if (WMS_IP_LOGs) then {diag_log format ["[RoamingINF Paradrop Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_vhl = (_x select 3);
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
			{deleteVehicle _x} forEach _vhl;
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_AI_Paradrop_Watch deleteAt (WMS_AI_Paradrop_Watch find _x);
		};
	} foreach WMS_AI_Paradrop_Watch;
};
//patrol OPFOR
if !(_patrolAIrunningOP == 0) then { 
	{ 
		if (time > (_x select 1) && count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnINF]) == 0) then { //test player presence
			if (WMS_IP_LOGs) then {diag_log format ["[RoamingINF patrol Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_vhl = (_x select 3);
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
			{deleteVehicle _x;} forEach _vhl; 
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_AI_OPFORpatrol_Running deleteAt (WMS_AI_OPFORpatrol_Running find _x);
		};
	} foreach WMS_AI_OPFORpatrol_Running;
};
//patrol BLUFOR
if !(_patrolAIrunningBL == 0) then { 
	{ 
		if (time > (_x select 1)) then {
			if (WMS_IP_LOGs) then {diag_log format ["[RoamingINF patrol Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_vhl = (_x select 3);
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
			{deleteVehicle _x;} forEach _vhl; 
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_AI_bluforPatrol_Running deleteAt (WMS_AI_bluforPatrol_Running find _x);
		};
	} foreach WMS_AI_bluforPatrol_Running;
};
//DynAI
if !(_DynAIrunning == 0) then { 
	{ 
		{
			_cnt = _cnt + ({alive _x} count units _x);
		} foreach (_x select 2);
		if (_cnt == 0) then {
			_x set [1, 0];
		};
		if (time > (_x select 1) && count ((position (leader (_x select 2 select 0))) nearEntities [WMS_PlayerEntity, WMS_AI_PlayerDistToDespawnINF]) == 0) then { //test player presence
			if (WMS_IP_LOGs) then {diag_log format ["[RoamingINF patrol Watch]|WAK|TNA|WMS| %1 to be deleted", _x]};
			_grpArray = (_x select 2);
			_vhl = (_x select 3);
			_obj = (_x select 4);
			_mkr = (_x select 5);
			_wps = (_x select 6);
			_ref = (_x select 7);
			if (_ref == "ALARM") then {
				PlaySound3D ["A3\Sounds_F\sfx\siren.wss", (_obj select 0), false, position (_obj select 0), 2, 1, 0];
			};
			if (_ref == "BaseAtk") then {
				WMS_DynAI_BaseAtkRunning = WMS_DynAI_BaseAtkRunning -1;
				(_x select 0) setvariable ["BaseATK", false, true];
				_talk = selectRandom ["usareasecure","britareasecure"];
				playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg",_talk], (_x select 0), false, position (_x select 0), 5, 1, 0];

			};
			{
				{ 
					if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x};
					deleteVehicle _x;
				} foreach units _x;
			} forEach _grpArray; 
			{deleteVehicle _x;} forEach _vhl; 
			{deleteVehicle _x;} foreach _obj; 
			{deleteMarker _x;} foreach _mkr; 
			{deleteWaypoint _x;} foreach _wps;
			{deleteGroup _x;} forEach _grpArray; 
			WMS_DynAI_Running deleteAt (WMS_DynAI_Running find _x);
		};
	} foreach WMS_DynAI_Running;
};