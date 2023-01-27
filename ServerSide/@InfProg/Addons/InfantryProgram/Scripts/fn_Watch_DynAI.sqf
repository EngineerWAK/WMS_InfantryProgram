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

private ["_playerCount","_waitingTime","_DynamicThreatTarget","_threatScenario","_threatCoefs","_flagList","_countFlag","_targetSpeed"];
_playerCount = count allPlayers;
if (WMS_IP_LOGs) then {diag_log format ["[DynAI DYNAMIC THREAT]|WAK|TNA|WMS| Player(s) connected: %1", _playerCount]};
_waitingTime = WMS_DynAI_threatFrequency;
_threatCoefs = WMS_DynAI_threatCoefs;
_DynamicThreatTarget = objNull;
_threatScenario = "Nothing";
if (WMS_FastCombat) then {
	_waitingTime = WMS_DynAI_threatFrequencyFC;
	_threatCoefs = WMS_DynAI_threatCoefsFC;
};

//Ajusting timer depending N players
if (_playerCount == 3) then {
	_waitingTime = _waitingTime*(_threatCoefs select 2);
} else {
	if (_playerCount == 2) then {
		_waitingTime = _waitingTime*(_threatCoefs select 1);
	} else {
		if (_playerCount == 1) then {
			_waitingTime = _waitingTime*(_threatCoefs select 0);
		} else {
			_waitingTime = _waitingTime;
		};
	};
};
//Looking for a target
if (_playerCount > 0 && {(time > (WMS_DynAI_LastTime+_waitingTime))} && {((OPFOR countSide allUnits) < WMS_AI_MaxUnits_C)}) then {
	WMS_DynAI_TargetList = allplayers;
	_DynamicThreatTarget = selectrandom WMS_DynAI_TargetList;
	_threatScenario = "GoForIt";
	//here look for the JudgementDay Marker, if true _threatScenario = "judgementDay";
	{
		if ((_x isKindOf WMS_JudgementDay_Mkr) && {((getMarkerPos _x) distance2D _DynamicThreatTarget)<= 150}) then {_threatScenario = "judgementDay"}; //{}
	}forEach allMapMarkers;

	if (_DynamicThreatTarget in WMS_DynAI_LastTarget || _threatScenario == "judgementDay") then {
		WMS_DynAI_TargetList deleteAt (WMS_DynAI_TargetList find _DynamicThreatTarget);
		WMS_DynAI_LastTarget = [];
		_threatScenario = "Nothing";
		if (count WMS_DynAI_TargetList == 0) then {
			//If nobody left nothing happen next
			if (WMS_IP_LOGs) then {diag_log format ["[DynAI DYNAMIC THREAT]|WAK|TNA|WMS| %1", _threatScenario]};
		} else {
			//if still someone in the list, try a last time
			_threatScenario = "GoForIt";
			_DynamicThreatTarget = selectRandom WMS_DynAI_TargetList;
			{
				if ((_x isKindOf WMS_JudgementDay_Mkr) && {((getMarkerPos _x) distance2D _DynamicThreatTarget)<= 150}) then {_threatScenario = "judgementDay"}; //{}
			}forEach allMapMarkers;
			if (_threatScenario == "judgementDay") then {
				_threatScenario = "Nothing";
			};
		};
	};
	//define if base attack or normal Threat
	if (_threatScenario == "GoForIt") then {
		WMS_DynAI_LastTarget set [0,_DynamicThreatTarget];
		_flagList = (position _DynamicThreatTarget) nearObjects [WMS_DynAI_BaseFlag, WMS_DynAI_distToFlag];
		_countFlag = count _flaglist;
		_targetSpeed = speed _DynamicThreatTarget;

		if ((_countFlag != 0) && {sunOrMoon > 0.9} && {time > (WMS_DynAI_BaseAtkLast+WMS_DynAI_BaseAtkCoolDown)} && {_targetSpeed < 40} && {!((getplayerUID _DynamicThreatTarget) in WMS_DynAI_BaseAtkUIDList)} && {WMS_DynAI_BaseAtkRunning < WMS_DynAI_BaseAtkMax}) then { //Base attack filter //need a filter for non-base owner
			_threatScenario = "BaseAtk";
			WMS_DynAI_LastTime = time;
			[_DynamicThreatTarget, (_flagList select 0), _threatScenario]spawn WMS_fnc_DynAI_baseATK; //WMS_fnc_DynAI_baseATK need to check if territory already under attack
			if (WMS_IP_LOGs) then {diag_log format ["[DynAI DYNAMIC THREAT]|WAK|TNA|WMS| %1", _threatScenario]};
			} else {
				_threatScenario = "dynamic";
				WMS_DynAI_LastTime = time;
				[_DynamicThreatTarget, (position _DynamicThreatTarget), _threatScenario]call WMS_fnc_DynAI_SelScen;
				if (WMS_IP_LOGs) then {diag_log format ["[DynAI DYNAMIC THREAT]|WAK|TNA|WMS| scenario= %1, Target= %2", _threatScenario, _DynamicThreatTarget]};
			};
	} else {_threatScenario = "Nothing"};
};

if (WMS_IP_LOGs) then {diag_log format ["[DynAI DYNAMIC THREAT]|WAK|TNA|WMS| %1 player(s) connected, waiting %2 secondes", _playerCount, _waitingTime]};