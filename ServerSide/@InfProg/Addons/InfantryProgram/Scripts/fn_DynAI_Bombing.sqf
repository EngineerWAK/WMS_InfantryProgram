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
//[_pos,_radius,_hight,_direction,"rhs_ammo_rbk500_ofab50"] spawn WMS_fnc_DynAI_Bombing;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[HEAVY BOMBER]|WAK|TNA|WMS| _this = %1", _this]};
private ["_smoke","_posStart","_posStop","_smoke3","_possafe","_smoke4","_possafe2","_smoke5","_plane","_veh2","_pos","_veh"];
params[
	"_posCenter",
	["_radius", 75],
	["_hight", 600],
	["_direction", (random 359)],
	["_load", "rhs_ammo_rbk500_ofab50"],
	["_iteration", 20]
];

_smoke = createVehicle ["SmokeShellRed", _posCenter, [], 0, "CAN_COLLIDE"];
_smoke setDir _direction;
_posStart = _smoke modelToWorld [0,-500,0];
_smoke2 = "SmokeShellRed" createVehicle _posStart;
_posStop = _smoke modelToWorld [0,500,0];
_smoke3 = "SmokeShellRed" createVehicle _posStop;
_possafe = _smoke modelToWorld [_radius,0,0];
_smoke4 = "SmokeShellgreen" createVehicle _possafe;
_possafe2 = _smoke modelToWorld [-_radius,0,0];
_smoke5 = "SmokeShellgreen" createVehicle _possafe2;
uisleep 10;
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", player, false, [(_posCenter select 0),(_posCenter select 1),_hight], 8, 1, 0];

_plane = "Sign_Sphere100cm_F";
_veh2 = createVehicle [_plane, [(_posStart select 0),(_posStart select 1),_hight], [], 0, "CAN_COLLIDE"];
_veh2 setDir _direction;

for "_i" from 1 to _iteration do  {
	_pos = (position _veh2) getPos [random _radius,random 360];
	_veh = createVehicle [_load, [(_Pos select 0),(_Pos select 1),_hight], [], 0, "NONE"];
	_veh setDir random 359;
	_veh setVectorDirAndUp [[0,0,-1],[1,0,0]];
	_veh2 setposATL  (_veh2 modelToWorld [0,50,0]);
	uisleep 0.5;
};
deleteVehicle _veh2;