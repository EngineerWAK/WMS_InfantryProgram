/**
* WMS_fnc_Mission_Static_DoFire
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*
* Will fire NPC artillery on a random position (city, military, whatever) and reload for the next random shelling
*/
private ["_target","_fireCrackersPos","_ammoList"];
params[
	"_canons", //array of the units in arty (should be gunners only)
	["_rounds", selectRandom [3,4,5,6,6,7,7,8],[0]]
];
if (true) then {diag_log format ["[WMS_fnc_Mission_Static_DoFire]|WAK|TNA|WMS|_this = %1", _this]};
_fireCrackersPos = selectRandom (WMS_Pos_Cities+WMS_Pos_Locals);
if (true) then {diag_log format ["[WMS_fnc_Mission_Static_DoFire]|WAK|TNA|WMS|_fireCrackersPos = %1", _fireCrackersPos]};
_target = nearestBuilding _fireCrackersPos;
if (true) then {diag_log format ["[WMS_fnc_Mission_Static_DoFire]|WAK|TNA|WMS|_target nearest building = %1, %2", _target, getpos _target]};
//enableEngineArtillery true; //do not really need anymore
{
	_x setVariable ["WMS_pos",(getposASL _x)];
	_relDir = _x getRelDir _target;
	if (_relDir > 45 && {_relDir < 315}) then {_x setDir (getDir _x)+_relDir}; //this to prevent those stupid SOG canon fo fall thru the ground...
	//_x doTarget _target; //do not really need anymore
	//_x reveal [_target, 4]; //do not really need anymore
	uisleep 1;
	_ammoList = getArtilleryAmmo [vehicle _x];
	(vehicle _x) doArtilleryFire [getPosATL _target, (_ammoList select 0), _rounds]; //the weapon do fire, not the unit (even if usualy arma consider it is the same)
	if (true) then {
		diag_log format [
			"[WMS_fnc_Mission_Static_DoFire]|WAK|TNA|WMS|Unit firing = %1, vehicle = %2, mag = %3, can fire = %4, ammo available = %5",
			_x, (typeOf vehicle _x), currentMagazine (vehicle _x),((getPosATL _target) inRangeOfArtillery [[(vehicle _x)], (_ammoList select 0)]),_x ammo (currentMuzzle (gunner vehicle _x))
		]
	};
}forEach _canons;
uisleep 60;
{
	if ((getposASL vehicle _x) distance ((vehicle _x) getVariable "WMS_pos") > 0)then{
		(vehicle _x) setPosASL ((vehicle _x) getVariable "WMS_pos");
	};
	(vehicle _x) setVehicleAmmo 1;
	//_x forgetTarget _target; //do not really need anymore
}forEach _canons;
//_canons doWatch objNull; //do not really need anymore
//enableEngineArtillery false; //do not really need anymore