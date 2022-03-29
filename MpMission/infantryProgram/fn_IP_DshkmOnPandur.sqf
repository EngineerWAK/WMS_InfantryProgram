//////////////////////////////////////////////////////////////////
//	Roaming vehicles radar function {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
/*rhs_DSHKM_ins
class DSHKMLoadOnPandur: ExileAbstractAction
{
	title = "Look For a PANDUR";
	//condition = (_this getVariable ["UnLoaded", true]);
	condition = "true";
	action = "[(_this select 0)] execVM 'Custom\InfantryOnlyProgram\WMS_OldChestOnPandur.sqf'";
};*/
//_pandur setVariable ["serverSpawn", true, true];
systemChat format ["%1",_this];
private ["_pandurs","_actionNum"];
params[
	"_HMG"
];
_pandurs = (position _HMG nearObjects ["R3F_PANDUR_CE", 15]);
systemChat format ["%1",_pandurs];
if !(count _pandurs == 0 && {(_pandurs select 0) getVariable ["serverSpawn", false]}) then {
	systemChat "PANDUR found!";
	if (_HMG getVariable ["UnLoaded", true]) then {
//////////
_actionNum = _HMG addAction  [       
	"<t color='#0033ff'>Pandur found, Mount the HMG</t>",     
	{       
		(_this select 0) attachTo [(_this select 3), [0.7,-1.9,1.3]]; 
		(_this select 0) setVariable ['UnLoaded', false, true]; 
		(_this select 0) removeaction (_this select 2);
		_bags_front = createVehicle ["Land_BagFence_01_round_green_F", [5,5,0], [], 0, "NONE"];       
		_bags_front attachTo [(_this select 3), [0.45,0.2,0]];
		_bags_front setVectorDirAndUp [[-8.74228e-008,-1,0], [0,0,2]];
		_bags_back = createVehicle ["Land_BagFence_01_round_green_F", [5,5,0], [], 0, "NONE"];       
		_bags_back attachTo [(_this select 3), [0.5,-3.05,0]];
		_bags_left = createVehicle ["Land_BagFence_01_long_green_F", [5,5,0], [], 0, "NONE"];       
		_bags_left attachTo [(_this select 3), [-0.85,-1.55,0]];
		_bags_left setVectorDirAndUp [[1,0,0], [0,0,1]];
		_bags_right = createVehicle ["Land_BagFence_01_long_green_F", [5,5,0], [], 0, "NONE"];       
		_bags_right attachTo [(_this select 3), [1.8,-1.55,0]];
		_bags_right setVectorDirAndUp [[1,0,0], [0,0,1]];
 
	}, 
	(_pandurs select 0)
];
//////////
		systemChat "HMG Loaded!";
	} else {
		systemChat "HMG Already loaded, RocketMan";
		execVM 'Custom\Paradrop\RocketMan90.sqf';
		detach _HMG;
	};  
} else {
	systemChat "No Pandur close enough";
};
