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
//[_pos,_target,_BoxType,_spawnType,_crate,_dist1,_dist2,_iterations] spawn WMS_fnc_DynAI_SpawnCrate;
//[position player, player, "IP_ammo",] spawn WMS_fnc_DynAI_SpawnCrate; //"IP_toolKit","IP_launcher","IP_ammo"
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[DYNAMIC SPAWN CRATE]|WAK|TNA|WMS| _this = %1", _this]};
private ["_RandomPos","_Box","_smoke","_msgPayload","_msgx","_sessionID","_medicList","_foodList","_weapsList","_miscList","_para","_parachute"];
params[
	"_pos",
	"_target",
	["_BoxType", "medic", [""]],
	["_spawnType", "ground", [""]],
	["_crate", "Box_Syndicate_Wps_F",[""]],
	["_dist1", 150,[0]],
	["_dist2", 350,[0]],
	["_iterations", 3, [0]]
];
if (_BoxType == "IP_toolKit" ) then {_parachute = WMS_para_big; _crate = WMS_SupplyCrate; _spawnType = "infantryProgram"};
if (_BoxType == "IP_launcher" ) then {_crate = "Box_Syndicate_WpsLaunch_F"; _spawnType = "infantryProgram"};
if (_BoxType == "IP_ammo" ) then {_crate = "Box_Syndicate_Ammo_F"; _spawnType = "infantryProgram"};
_name = "Wooden Crate";
if (_crate == "Box_Syndicate_WpsLaunch_F") then {_name = 'Launcher Crate'};
if (_crate == "Box_Syndicate_Wps_F") then {_name = 'Weapon Crate'};
if (_crate == "Box_Syndicate_Ammo_F") then {_name = 'Ammo Crate'};
_RandomPos = [_pos, _dist1, _dist2,1,0] call BIS_fnc_findSafePos;
_Box = createVehicle [_crate, _RandomPos, [], 0, "NONE"];
_smoke = "SmokeShellGreen" createVehicle position _Box;
_smoke attachTo [_Box,[0,0,1]];
[_Box, _Box] call ace_common_fnc_claim;
_Box setVariable ["WMS_Name",_name, true];
clearMagazineCargoGlobal _Box;     
clearWeaponCargoGlobal _Box;      
clearItemCargoGlobal _Box;      
clearBackpackCargoGlobal _Box;

[
	_Box, [
		"<t size='0.9' color='#26e600'>Hide the crate in the 4th Dimension</t>",
		" 
			private _Box = (_this select 0); 
			_Box attachTo [player, [0,1.5,-0.2],'pelvis']; 
			_Box allowDamage false; 
			[_Box, true] remoteExec ['WMS_fnc_HideObjectGlobal'];
			_Name = _Box getVariable ['WMS_Name','wooden Box']; 
			player addAction [
				_Name, 
				{
					player removeaction (_this select 2); 
					detach (_this select 3 select 0);
					(_this select 3 select 0) setDamage 0;
					[(_this select 3 select 0), false] remoteExec ['WMS_fnc_HideObjectGlobal'];  
					(_this select 3 select 0) hideObject false;
				},
				[_Box] 
				2, 
				true, 
				true, 
				'', 
				'(vehicle player isKindOf 'man')',
			];
		", 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"((getplayerUID player) in WMS_InfantryProgram_list)",  //WMS_IP_Active_list
 		5, 
		false 
	]
]remoteExec [
	"addAction",
	0, //0 for all players //2 server only //-2 everyone but the server
	false //JIP
];
switch (toLower _BoxType) do { //"medic","food","misc","weaps","IP_ammo","IP_toolKit","IP_launcher"
	case "medic" 	: {{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_medicList};
	case "food" 	: {{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_foodList};
	case "misc" 	: {{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_miscList};
	case "weaps" 	: { 
  					{_Box addWeaponCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]} forEach WMS_weapsList;
					uisleep 0.2; 
   					{_Box addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> _x >> "magazines")) select 0),3]} forEach weaponCargo _Box;
					//{_Box addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _weapsList;
	};
	case "ip_ammo" : {
					_Box addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> (primaryWeapon _target) >> "magazines")) select 0),5];
					_Box addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> (primaryWeapon _target) >> "magazines")) select 1),5];
					_Box addMagazineCargoGlobal [((getArray (configfile >> "CfgWeapons" >> (handgunWeapon _target) >> "magazines")) select 0),3];
					{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_medicList;
					{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_foodList;
	};
	case "ip_toolkit"	: {{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_IP_ToolKit};
	case "ip_launcher"	:{
					_Box addMagazineCargoGlobal ["RPG7_F",4];
					_Box addWeaponCargoGlobal ["launch_RPG7_F",1];
					{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_medicList;
					{_Box addItemCargoGlobal [(_x select 0),(_x select 1)+(round(random (_x select 2)))]}foreach WMS_foodList;
	};
};
_msgPayload = (name _target);
["|*|*|*|*|*| Random Player Event  |*|*|*|*|*|"] remoteexec ['SystemChat',0];
playSound3D ["a3\dubbing_radio_f\Sfx\out2c.ogg", player, false, position _target, 2,1,0];
_sessionID = _target getVariable ['ExileSessionID',''];
switch (toLower _spawnType) do { 
		case "ground" : {
			_msgx = format ["Crate spawned around %1", _msgPayload];
			[_msgx] remoteexec ['SystemChat',0];
			["|*|*|*|*|*| Random Player Event  |*|*|*|*|*|"] remoteexec ['SystemChat',0];
			if (WMS_exileToastMsg) then {
				[_sessionID, 'toastRequest', ['InfoTitleAndText', ['Crate Coordinates', format['%1',[(_RandomPos select 0),(_RandomPos select 1),0]]]]] call ExileServer_system_network_send_to;
			} else {
				//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
				["TaskAssigned", ["Crate Coordinates", format['%1',[(_RandomPos select 0),(_RandomPos select 1),0]]]] remoteExec ["BIS_fnc_showNotification", owner _target];
			}; 
			for "_i" from 1 to _iterations do {
			sleep 2;
			playSound3D ["a3\dubbing_radio_f\Sfx\out2b.ogg", player, false, position _Box, 2,1,0];
			sleep 8;
			};
		};
		case "paradrop" : {
			_msgx = format ["Paradroping Crate Around %1", _msgPayload];
			[_msgx] remoteexec ['SystemChat',0];
			["|*|*|*|*|*| Random Player Event  |*|*|*|*|*|"] remoteexec ['SystemChat',0];
			if (WMS_exileToastMsg) then {
				[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Crate paradrop', format['%1',[(_RandomPos select 0),(_RandomPos select 1),150]]]]] call ExileServer_system_network_send_to;
			} else {
				//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
				["TaskAssigned", ['Crate paradrop', format['%1',[(_RandomPos select 0),(_RandomPos select 1),150]]]] remoteExec ["BIS_fnc_showNotification", owner _target];
			};
			_para = createVehicle [WMS_para_small,[(_RandomPos select 0),(_RandomPos select 1), 150], [], 5];
			_para setdir winddir;
			_para setvelocity [0,0,-5];
			_box attachTo [_para,[0,0,0]];
			uisleep 1;
			waitUntil {((position _Box) select 2) < 22};
			uisleep 4;
			detach _box;
		};
		case "infantryprogram" : {
			_parachute = WMS_para_small;
			if (_BoxType == "IP_toolKit" ) then {_parachute = WMS_para_big};//_crate = "BWA3_Box_Gear_Fleck";
			//if (_BoxType == "IP_launcher" ) then {_crate = "Box_Syndicate_WpsLaunch_F"};
			//if (_BoxType == "IP_ammo" ) then {_altitude  = 150};
			playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _target, false, _RandomPos, 3, 1, 0];
			uisleep 3;
			playSound3D ["a3\dubbing_f\modules\supports\drop_accomplished.ogg", _target, false, position _target, 2,1,0];
			_msgx = "Infantry Program Secret Activities";
			[_msgx] remoteexec ['SystemChat',0];
			if (WMS_exileToastMsg) then {
				[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Crate paradrop', format['%1, one minute beacon',_BoxType]]]] call ExileServer_system_network_send_to;
			} else {
				//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
				["TaskAssigned", ['Crate paradrop', format['%1, one minute beacon',_BoxType]]] remoteExec ["BIS_fnc_showNotification", owner _target];
			};
			_para = createVehicle [_parachute,[(_RandomPos select 0),(_RandomPos select 1), 150], [], 5];
			_para setdir winddir;
			_para setvelocity [0,0,-5];
			_box attachTo [_para,[0,0,0]];
			uisleep 1;
			waitUntil {((position _Box) select 2) < 22};
			uisleep 4;
			detach _box;
			for "_i" from 1 to 10 do {
				playSound3D ["a3\dubbing_radio_f\Sfx\out2b.ogg", player, false, position _Box, 2,1,0];
				sleep 6;
			};
		};
};