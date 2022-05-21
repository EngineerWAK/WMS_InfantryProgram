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

//[_grp] call WMS_fnc_DynAI_Steal
//if (WMS_IP_LOGs) then {diag_log format ["[DynAI THIEF]|WAK|TNA|WMS| _this: %1", _this]};
private ["_leader","_vhlList", "_catType", "_category"];
params[
	"_grp",
	["_lookingFor","LandVehicle",[""]],
	["_distance", WMS_DynAI_stealDist,[0]]
];
if (time > (WMS_DynAI_Steal_last + WMS_DynAI_Steal_Cooldown)) then {
	WMS_DynAI_Steal_last = time;
	_catType = _grp call BIS_fnc_objectType;
	_category = (_catType select 0); 
	if (_category == "soldier" || _category == "vehicle") then {
		_grp = group _grp;
	};
	_leader = leader _grp;
	_vhlList = (position _leader) nearObjects [_lookingFor, _distance];
	if (WMS_IP_LOGs) then {diag_log format ["[DynAI THIEF]|WAK|TNA|WMS| _lookingFor: %1, _distance: %2, %3 vehicle(s) found", _lookingFor, _distance, (count _vhlList)]};
	if (count _vhlList != 0 && (IsNull (ObjectParent (vehicle (leader _grp))))) then {
		{
			//if ((crew _x isEqualTo []) && (locked _x != 2) && ((_x getVariable "ExileIsLocked") != -1) && ((owner _x) != 2)) then { //WORKS BUT ONLY FOR EXILE, or add the variable to the vehicle init
			if ((crew _x isEqualTo []) && (locked _x != 2) && ((owner _x) != 2)) then {
				_grp addvehicle _x;
				leader _grp assignAsDriver _x;
				(units _grp) orderGetIn true;
				playSound3D ["A3\Sounds_F\sfx\alarmcar.wss", _x, false, (position _x), 2, 1, 0];
				if (WMS_IP_LOGs) then {diag_log format ["[DynAI THIEF]|WAK|TNA|WMS|  %1 got stolen!", _x]};
			};
		}foreach _vhlList;
	};
} else {
	if (WMS_IP_LOGs) then {diag_log "[DynAI THIEF]|WAK|TNA|WMS| in Cooldown"};
};