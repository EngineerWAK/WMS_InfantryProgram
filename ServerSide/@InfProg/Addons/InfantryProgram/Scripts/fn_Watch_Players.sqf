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

if (WMS_IP_LOGs) then {diag_log format ["[Players Watch]|WAK|TNA|WMS| %1 player(s) connected", count allPlayers];};
private ["_UID","_damage","_msgx","_rwdLevel","_lastPos","_riderUID","_riderRep"];
{
	_UID = (getplayerUID _x);
	//Auto BAN, using WMS_BanList
	if (_UID in WMS_BanList) then {
		WMS_serverCMDpwd serverCommand format ["#BAN %1", (getPlayerUID _x)];
		if (true) then {diag_log format ["[WMS_fnc_Watch_Players]|WAK|TNA|WMS| Player %1 SteamID %2 Auto Banned.", (name _x), _UID];};
	};
	//Healing camp for EXILE Mod
	if (WMS_exileFireAndForget) then {
		if ((_UID in WMS_InfantryProgram_list) && {(count (_x nearObjects ["Exile_Container_OldChest", 5])) == 1}) then {
			if (((count (_x nearObjects ["Exile_Construction_CampFire_Static", 5])) == 1) && {(count (_x nearObjects ["Land_TentDome_F", 5])) == 1}) then {
				_damage = getdammage _x;
				if (_damage > 0.02) then { 
					_x setdammage (_damage-(_damage/4));
				};
			};
		};
	};
	//Healing camp
	//Kick out vehicle
	if ((_UID in WMS_InfantryProgram_list) && {_UID in WMS_IP_Active_list} && {TypeOf (vehicle _x) != WMS_PlayerEntity} && {!(typeof (vehicle _x) in WMS_InfantryProgram_Vehicles)}) then {
		if ((damage _x) >= 0 && {(damage _x) < 0.5}) then {
			_x setdamage 0.6; 
			removeBackpackGlobal _x;
			} else {
				_x setdamage 1; 
				removeBackpackGlobal _x; 
				removeAllWeapons _x;
			};
		if ((damage vehicle _x) >= 0 && {(damage vehicle _x) < 0.6}) then {
			vehicle _x setdamage 0.8; 
			vehicle _x setfuel 0;
		} else {
			vehicle _x setdamage 1;
		};
		moveout _x;
		_msgx = format ['%1, NO VEHICLES WHEN YOU ARE IN THE INFANTRY PROGRAM', (name _x)];
		[_msgx] remoteExecCall ['SystemChat',_x];
		if (WMS_IP_LOGs) then { diag_log format ["[Player Watch WARNING]|WAK|TNA|WMS| %1 is in a %2", _x, vehicle _x];};
	};
	//Kick out vehicle
	//check if vehicle godmod
	if (alive _x && {(TypeOf (vehicle _x) != WMS_PlayerEntity)} && {!(isDamageAllowed vehicle _x)}) then {// && {isNil "ExilePlayerInSafezone"}
		vehicle _x allowDamage true;
	};
	//check if vehicle godmod
	//cumulative reward for riding bike
	if (WMS_Riding_Rwd && {(TypeOf (vehicle _x) == WMS_ThanksForRiding)}) then {
		_rwdLevel = _x getvariable ["cumulativeReward", 0];
		_lastPos = _x getvariable ["lastPosition", (position _x)];
		if ((_rwdLevel == WMS_RidingCount) && {(((position _x) distance _lastPos) > WMS_RidingDist)}) then {
			_x setVariable ["cumulativeReward",0, true];
			_x setVariable ["lastPosition", position _x, true];
			_riderUID = getPlayerUID _x;
			_riderRep = _x getVariable ["ExileScore", 0];
			_x setVariable ["ExileScore",(_riderRep+(10*WMS_RidingCount))];
			_riderRepUpdated = _x getVariable ["ExileScore", 0];
			format["setAccountScore:%1:%2", _riderRepUpdated, _riderUID] call ExileServer_system_database_query_fireAndForget;
			ExileClientPlayerScore = _riderRepUpdated;
			(owner _x) publicVariableClient "ExileClientPlayerScore";
			ExileClientPlayerScore = nil;
			["Congratulation Rider! There is some respect for your ride"] remoteExecCall ['SystemChat',_x];
			//_riderMoney = _x getVariable ["ExileMoney", 0];
		}else{
			_x setVariable ["cumulativeReward", (_rwdLevel +1), true];
			_x setVariable ["lastPosition", position _x, true];
		};
	};
} foreach (allPlayers select {alive _x && {count getplayerUID _x == 17 }} apply {_x});