/**
* WMS_fnc_DFO_UnitEH - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_UnitEH = { //For Standalone but not only
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_UnitEH _this %1', _this]};
	private ["_playerUID_ExileKills","_killerUID","_playerKills","_dist","_options","_payload"];
	params [
		"_killed",
		"_killer", //the registered _playerObject for the mission is the pilot who launched the mission, if the pilot die and come back, he doesnt match the registered anymore
		"_instigator"
	];
	WMS_AllDeadsMgr pushBack [_killed,(serverTime+WMS_DFO_AllDeads)];
	_options = _killed getVariable ["WMS_DFO_options",[]]; //[_MissionHexaID,_playerObject,_mission,_infType,_pilotUID] //_infType= "OPFOR","CIV_ARMED","CIV"
	private _pilotUID = (_options select 4);
	if (isPlayer _instigator) then {_killer = _instigator}; //TEST
	if (isplayer _killer) then {
		_dist = (_killer distance _killed);
		//_payload = [[format ["KIA %1, %2M AWAY, %3 ", toUpper(name _killed),round _dist, (_options select 3)]]]; //WORKS, 1 line
		_payload = [[format ["KIA %1, %2M AWAY", toUpper(name _killed),round _dist ]],[(_options select 3)]]; //Multi lines test
		if (getPlayerUID _killer == _pilotUID || vehicle _killer == vehicle (_options select 1)) then { //multi chopper missions will become a problem so no punishment on the player, just cleanup the bodies
			if (WMS_DFO_RemoveDup) then {
				_killed removeWeapon (primaryWeapon _killed);
				_killed removeWeapon (secondaryWeapon _killed); //launcher
				//removeAllWeapons _killed;
				removeBackpackGlobal _killed;
			};
			moveOut _killed;
			if !(WMS_DFO_Standalone) then { //displayKillStats needs to be client side in MPmission
				[_payload,"DFO"] remoteExec ['WMS_fnc_displayKillStats',(owner _killer)];
			}else {
				[_payload] remoteExec ['WMS_fnc_DFO_killStats',(owner _killer)];
			};
			[format ["Killed %1, %2m away, %3 ", (name _killed),round _dist, (_options select 3)]] remoteExec ['SystemChat',(owner _killer)];
			//KILL COUNT
			_playerKills = _killer getVariable ["ExileKills", 0];
			_playerKills = _playerKills+1;
			_killer setVariable ["ExileKills", _playerKills, true];
			_killerUID 	= getPlayerUID _killer;
			//add kill count WMS_InfantryProgram/ExileMod
			if (WMS_exileFireAndForget) then {
				format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
				ExileClientPlayerKills = _playerKills;
				(owner _killer) publicVariableClient "ExileClientPlayerKills";
				ExileClientPlayerKills = nil;
			} else {
				_playerUID_ExileKills = "ExileKills_"+_killerUID;
  				profileNamespace setVariable [_playerUID_ExileKills,_playerKills];
			};
		} else {
			_killed removeWeapon (primaryWeapon _killed);
			_killed removeWeapon (secondaryWeapon _killed); //launcher
			//removeAllItems _killed;
			removeAllWeapons _killed;
			removeBackpackGlobal _killed;
			removeVest _killed;
			moveOut _killed;
		};
		if !((_options select 3) == "OPFOR")then {
			[_killer] call WMS_fnc_DFO_PunishPunks;
			_killed removeWeapon (primaryWeapon _killed);
			_killed removeWeapon (secondaryWeapon _killed); //launcher
			removeAllWeapons _killed;
			//removeAllItems _killed;
			removeBackpackGlobal _killed;
			removeVest _killed;
			"SmokeShellYellow" createVehicle (getPosATL _killed);
		};
	} else {
		_killed removeWeapon (primaryWeapon _killed);
		_killed removeWeapon (secondaryWeapon _killed); //launcher
		//removeAllItems _killed;
		removeAllWeapons _killed;
		removeBackpackGlobal _killed;
	};
	[_killed,
		[
			"Hide Body", // title
			{
				params ["_target", "_caller", "_actionId", "_arguments"]; // script
				hideBody _target;
				_caller removeAction _actionId;
				[_target]spawn{uisleep 5; deleteVehicle (_this select 0)};
			},
			nil,		// arguments
			1.5,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"!(alive _target)", // condition
			1.5	// radius
		]
	] remoteExec [
		"addAction",
		0, //0 for all players
		false //JIP
	];
//};