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

//[_pos, true, true, true, false]call WMS_fnc_findClst_NamedLocation
diag_log format ["[CLOSEST NAMED LOCATION]|WAK|TNA|WMS| _this = %1", _this];

private ["_playerBlackList","_locationPos"]; 
params[
	"_pos",
	["_capital", true],
	["_city", true],
	["_village", true],
	["_local", true]
];
_locationList = [];
if(_capital) then {
	_capitalTarget = nearestLocation [_pos,"NameCityCapital"];
	_locationList pushback [_pos distance position _capitalTarget,position _capitalTarget, text _capitalTarget];
};
if(_city) then {
	_cityTarget = nearestLocation [_pos,"NameCity"];
	_locationList pushback [_pos distance position _cityTarget,position _cityTarget, text _cityTarget];
};
if(_village) then {
	_villageTarget = nearestLocation [_pos,"NameVillage"];
	_locationList pushback [_pos distance position _villageTarget,position _villageTarget, text _villageTarget];
};
if(_local) then {
	_localTarget = nearestLocation [_pos,"NameLocal"];
	_locationList pushback [_pos distance position _localTarget,position _localTarget, text _localTarget];
};
_locationList sort true;
_locationPos = [[_locationList select 0 select 1 select 0, _locationList select 0 select 1 select 1],_locationList select 0 select 2];

_locationPos //return [position,name]