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
//[_pos, _radius, _howMany, _mineType, _fireExplode, _signs, _steps]call WMS_fnc_AMS_SpawnMineField
//[_pos, 100, 30, "ATMine", true, true, nil]call WMS_fnc_AMS_SpawnMineField
private ["_mineList","_mine","_randDirOffset","_sign"];
params[
	"_pos",
	["_radius",100],
	["_howMany",20],
	["_mineType", WMS_ATMines],
	["_fireExplode", false],
	["_signs", true],
	["_steps",36]
];
_mineList = [];
for "_i" from 1 to _howMany do {
	_mine = createMine [_mineType, ([_pos, 5, _radius, 0.5, 0, 0.5, 0] call BIS_fnc_findSafePos), [], 0 ];
	_mineList pushback _mine;
	_mine allowDamage _fireExplode;
	if (_mineType in WMS_DirectionnalMines) then {
		_direction = (random 360) ;
		_mine setDir _direction;
		[_mine, _direction] remoteexec ['setDir',0];
	};
	//RESISTANCE revealMine _mine;
	//CIVILIAN revealMine _mine;
	//WEST revealMine _mine;
	EAST revealMine _mine;
	//sleep 0.1; 
};
_randDirOffset = random 45;
for "_i" from 0 to 359 step _steps do {
	_sign = createVehicle [WMS_AMS_MineSign, [0,0,0], [], 0, "CAN_COLLIDE"];
	_mineList pushback _sign;
	_sign setDir (180+_i);
	_sign setPosATL (_Pos getPos [_radius, _randDirOffset+_i]);
	_sign setVectorUp [0,0,1];
};
if (WMS_AMS_LOGs) then {diag_log format ["[AMS MINEFIELD]|WAK|TNA|WMS| return _minelist: %1,", _minelist]};
_minelist