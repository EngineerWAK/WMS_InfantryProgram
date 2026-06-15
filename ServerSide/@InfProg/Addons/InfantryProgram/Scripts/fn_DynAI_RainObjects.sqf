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

//////////
//[_pos,_load,_radius,_altitude,_iterations,_delay,_loadList(opt)] spawn WMS_fnc_DynAI_RainObjects;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[RAIN OBJECTS]|WAK|TNA|WMS| _this = %1", _this]};
private ["_veh","_alti","_posTemp"];
params[
	"_pos",
	["_load", "Chemlight_blue",[""]],
	["_radius", 50,[0]],
	["_altitude", 300,[0]],
	["_iterations", 20, [0]],
	["_delay", 0.15, [0]],
	["_loadList", []] //that will be easier for incremental rainObjects
];
if (count _loadList == 0) then {
	for "_i" from 1 to _iterations do {
		_loadList pushback _load;
	};
};
if (count _loadList == 0) exitWith {diag_log format ["[RAIN OBJECTS]|WAK|TNA|WMS| NOTHING TO DROP!!!  %1", _this]};

{
	_alti = _altitude;
	uisleep _delay;
	_posTemp = _pos getPos [(random _radius),(random 359)];//((random 14) + selectrandom [0,15,30,45,60,75,90,105,120,135,150,165,180,-15,-30,-45,-60,-75,-90,-105,-120,-135,-150,-165])
	if (_x == "rhs_ammo_nspn_red" || _x == "rhs_ammo_an_m14_th3" || _x == "SmokeShellGreen" || _x == "SmokeShellOrange") then {_alti = 150};
	if (_x == "rhs_ammo_fakels" || _x == "mini_Grenade" || _x == "GrenadeHand") then {_alti = 65};
	_veh = createVehicle [_x, [(_posTemp select 0),(_posTemp select 1),_alti], [], 0, "NONE"];
	_veh setDir random 359;
	_veh setVectorDirAndUp [[0,0,-1],[1,0,0]];
	_veh setVelocity [0,0,-10];
}forEach _loadList;

//["Sh_155mm_AMOS","AT_Mine_155mm_AMOS_range","rhs_ammo_m397","rhs_ammo_an_m14_th3"]
//"Chemlight_blue", "FlexibleTank_01_forest_F", "rhs_ammo_rbk500_ofab50", "rhs_ammo_fakels";

/*
 //old one, works
if (_load isKindOf "ShellBase") then {
	_iterations = round (2+(Random 4));
	_altitude = 800;
	_delay = 1+(random 2);
	_radius = 75;
};
for "_i" from 1 to _iterations do {
	uisleep _delay;
	_pos = _pos getPos [random _radius,random 360];
	_veh = createVehicle [_load, [(_Pos select 0),(_Pos select 1),_altitude], [], 0, "NONE"];
	_veh setDir random 359;
	_veh setVectorDirAndUp [[0,0,-1],[1,0,0]];
	_veh setVelocity [0,0,-10];
};*/