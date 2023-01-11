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
//[_posCenter,_radius,_hight,_direction,_load,_iteration] spawn WMS_fnc_DynAI_ParaBombs;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[PARA_BOMBS]|WAK|TNA|WMS| _this = %1", _this]};
private ["_AdjustCoef","_windD","_windS","_ref","_posAdjusted","_smoketest","_bomb","_posDrop","_para","_smoke"];
params[
	"_posCenter",
	["_radius", 100],
	["_hight", 150],
	["_direction", (random 359)],
	["_load", (selectRandom WMS_BombList)],
	["_iteration", 3],
	["_adjustCoef",30] //30 for 150m _hight
];
//Trying to re-adjust drop coordinates depending the wind direction/speed, Ace will probably do shit with this sometimes
//_Mkr setMarkerText  format ["Humanitarian Drop, Wind %1 %2m/s",(round windDir),(round vectorMagnitude wind)]; //exemple
//_AdjustCoef = 30; //will have to adjust this //25 too long
_windD = (round windDir);
_windS = (round vectorMagnitude wind);
_ref = createVehicle ["Sign_Sphere25cm_F", [_posCenter select 0,_posCenter select 1, _hight], [], 0, "NONE"];
_ref setDir (_windD+180); //ref point facing the wind
_posAdjusted = _ref modelToWorld [0,(_adjustCoef*_windS),0];
_smoketest = createVehicle ["SmokeShellBlue", [_posAdjusted select 0,_posAdjusted select 1, _hight], [], 0, "CAN_COLLIDE"]; //visual test for now
/////
_smoke = createVehicle ["SmokeShellRed", [_posCenter select 0,_posCenter select 1, 50], [], 0, "CAN_COLLIDE"];
uisleep 3;
deleteVehicle _ref;
playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", player, false, [(_posCenter select 0),(_posCenter select 1),_hight], 8, 1, 0];
uisleep 7;

for "_i" from 1 to _iteration do  {
	_posDrop = [[[_posAdjusted, _radius]], []] call BIS_fnc_randomPos;
	_para = createVehicle [WMS_para_small, [(_posDrop select 0), (_posDrop select 1), _hight], [], 0, "FLY"];
	_para setDir random 359;
	_bomb = createVehicle [_load, [(_posDrop select 0), (_posDrop select 1), _hight], [], 0, "NONE"];
	_bomb attachTo [_para,[0,0,0]];
	_bomb setVectorDirAndUp [[0,0,-1],[1,0,0]];
	_smoke2 = createVehicle ["SmokeShellRed", [(_posDrop select 0), (_posDrop select 1), _hight], [], 0, "CAN_COLLIDE"];
	_smoke2 attachTo [_bomb,[0,0,0]];
	[_bomb]spawn {
		waitUntil {((position (_this select 0)) select 2) < 20};
		detach (_this select 0);
	};
	uisleep 0.75;
};