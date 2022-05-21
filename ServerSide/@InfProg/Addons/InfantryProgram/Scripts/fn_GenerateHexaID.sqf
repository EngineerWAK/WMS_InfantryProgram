/**
* WMS_fnc_generateHexaID
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
private _hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
private _hexaArray = [];
for "_i" from 1 to 8 do {
	_hexaArray pushBack	(selectRandom _hexaBase);
};
private _MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];
if (WMS_fnc_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_generateHexaID _MissionHexaID %1', _MissionHexaID]};
_MissionHexaID