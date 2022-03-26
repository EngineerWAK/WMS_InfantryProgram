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

//////////////////////////////////////////////////////////////////
private ["_blackList","_missionlist","_playerList","_flaglist"];
params [
	["_pos",WMS_AMS_CenterMap],
	["_radScan",((worldsize/2)*1.2)],
	["_radPlayer",WMS_AMS_SpnDistPlayer],
	["_radBase",WMS_AMS_SpnDistTerrit],
	["_radMission",WMS_AMS_SpnDistMission]
	];
_blackList  = [];
_playerList = allPlayers select {alive _x} apply {[position _x, _radPlayer]};
if (count _playerList != 0) then {
	_blackList = _playerList;
};
_flaglist = nearestObjects [_pos, [WMS_DynAI_BaseFlag], _radScan] apply {[position _x, _radBase]};
if (count _flaglist != 0) then {
	_blackList = _blackList + _flaglist;
};
_missionlist = nearestObjects [_pos, [WMS_AMS_Flag], _radScan] apply {[position _x, _radMission]};
if (count _missionlist != 0) then {
	_blackList = _blackList + _missionlist;
};
if (count WMS_AMS_TradersArr != 0) then {
	_blackList = _blackList + WMS_AMS_TradersArr;
};
_blackList