//////////////////////////////////////////////////////////////////
//	Roaming vehicles radar function {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
/*
class OldChestLoadOnPandur: ExileAbstractAction
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
	"_chest"
];
_pandurs = (position _chest nearObjects ["R3F_PANDUR_CE", 15]);
systemChat format ["%1",_pandurs];
if !(count _pandurs == 0 && {(_pandurs select 0) getVariable ["serverSpawn", false]}) then {
	systemChat "PANDUR found!";
	if (_chest getVariable ["UnLoaded", true]) then {
		_actionNum = _chest addAction  [      
    		"<t color='#0033ff'>Pandur found, Load the OldChest</t>",    
    		{      
       			(_this select 0) attachTo [(_this select 3), [0.64,-4.54,-0.32]];
       			(_this select 0) setVariable ['UnLoaded', false, true];
       			(_this select 0) removeaction (_this select 2);
   			},
    	(_pandurs select 0)  
		];
		systemChat "OldChest Loaded!";
	} else {
		systemChat "OldChest Already loaded, RocketMan";
		execVM 'Custom\Paradrop\RocketMan90.sqf';
		detach _chest;
	};  
} else {
	systemChat "No Pandur close enough";
};