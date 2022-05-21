/**
* WMS_fnc_FindRoad - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//From AmbientLife
if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_FindRoad time %1', time]};
private _arrayOfPos = WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals;
if (count _arrayOfPos == 0) exitWith {if (WMS_IP_LOGs) then {diag_log format ['|WAK|TNA|WMS|WMS_fnc_FindRoad _arrayOfPos IS EMPTY %1', time]};};
if (true) then {_arrayOfPos+WMS_Pos_Locals}; 
{
	_roads = _x nearRoads 150;
	if (count _roads != 0) then {
		_road = selectRandom _roads;
		WMS_Roads pushBack _road;
	}else{
		if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_FindRoad no road around %1', _x]};
	};
}forEach _arrayOfPos;
if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_FindRoad %1 roads found', (count WMS_Roads)]};