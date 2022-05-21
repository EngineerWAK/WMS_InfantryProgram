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

private ["_playerList","_target"];
params [
	"_pos",
	"_dist"
	];
//_playerList = allPlayers select {(alive _x) && (_x distance _pos) < _dist} apply {[(_x distance _pos),( name _x)]}; //return player Name
_playerList = allPlayers select {(alive _x) && (_x distance _pos) < _dist} apply {[(_x distance _pos),_x]};  //return playerObject
_playerList sort true;
_target = objNull;
if (count _playerList != 0) then {
	_target = (_playerList select 0 select 1);  
};
if (WMS_IP_LOGs) then {diag_log format ["[AMS CLOSEST PLAYER]|WAK|TNA|WMS| return _target: %1,", _target]};
_target