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

//[[_pos1,_pos2,_pos3],_distPlayer,_distTrader,_distMission,_distTerritory] call WMS_fnc_AMS_ChkSafeToSpawn;

private ["_SafePosList","_pos","_playerList","_traderList","_missionlist","_Baselist"];
params [
	"_positions", //Array of positions to check
	["_radPlayer",WMS_AMS_SpnDistPlayer, [0]],
	["_radTrader",WMS_AMS_SpnDistTrader, [0]],
	["_radMission",WMS_AMS_SpnDistMission, [0]],
	["_radBase",WMS_AMS_SpnDistTerrit, [0]]
	];
_safe = false;
_SafePosList = [];
{
	_pos = _x;
	//chk _players
	_playerList = allPlayers select {alive _x && (_x distance2D _pos < _radPlayer)} apply {[GetPosATL _x, name _x]};
	//chk _traders
	_traderList = [];
		{
			if (
				(_x distance2D _pos) < _radTrader
			) then {_traderList pushBack _x};
		}foreach WMS_AMS_TradersArr;
	//chk _MissionFlag
	_missionlist = nearestObjects [_pos, [WMS_AMS_Flag], _radMission] apply {[position _x]};
	//chk _BaseFlag
	_Baselist = nearestObjects [_pos, [WMS_DynAI_BaseFlag], _radBase] apply {[position _x]};

	if (count _playerList == 0 && {count _traderList == 0} && {count _missionlist == 0} && {count _Baselist == 0}) then {
		_safe = true;
		_SafePosList pushBack _pos;
	};
}forEach _positions;

_SafePosList
