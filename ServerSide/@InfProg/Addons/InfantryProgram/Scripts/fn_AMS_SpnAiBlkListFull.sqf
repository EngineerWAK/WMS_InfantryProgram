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

/////////////////////////////////////////////////////////////////////
///// THIS ONE SEEMS TO BE EXTREMLY LONG TO PROCESS, NEED A FIX /////

private ["_blackList","_missionlist","_playerList","_flaglist"];
params [
	["_pos",WMS_AMS_CenterMap],
	["_radScan",((worldsize/2)*1.2)],
	["_radPlayer",WMS_AMS_SpnDistPlayer],
	["_radBase",WMS_AMS_SpnDistTerrit],
	["_radMission",WMS_AMS_SpnDistMission]
	];
_blackList  = [];
_flaglist = [];
_missionlist = [];
_playerList = allPlayers select {alive _x} apply {[position _x, _radPlayer]};
if (count _playerList != 0) then {
	_blackList = _playerList;
};

if (WMS_exileFireAndForget) then { //Exile will use the long way for now
	_flaglist = nearestObjects [_pos, [WMS_DynAI_BaseFlag], _radScan] apply {[position _x, _radBase]}; //THIS TAKES A LOOOOT OF TIME DUE TO _radScan
}else{
	{
		_flaglist pushBack [(_x select 1),_radBase];
	}forEach (profileNameSpace GetVariable ["WMS_territoriesArray", []]);
};
if (count _flaglist != 0) then {
	_blackList = _blackList + _flaglist;
};

if (WMS_exileFireAndForget) then { //Exile will use the long way for now //nope
	//_missionlist = nearestObjects [_pos, [WMS_AMS_Flag], _radScan] apply {[position _x, _radMission]}; //THIS TAKES A LOOOOT OF TIME DUE TO _radScan
	{
		_missionlist pushback [(_x select 0), _radMission];
	}forEach WMS_AMS_Running_Array;
}else{
	{
		_missionlist pushback [(_x select 0), _radMission];
	}forEach WMS_AMS_Running_Array;
};
if (count _missionlist != 0) then {
	_blackList = _blackList + _missionlist;
};

if (count WMS_AMS_TradersArr != 0) then {
	_blackList = _blackList + WMS_AMS_TradersArr;
};
_blackList