/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2026 [WMS]WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_sys_ActionReaction is made for a quick and "unfiltered" reaction to a player "action". Traders, territory/base flag will not prevent what is comming.
//[_object,_posASL(opt),_option(opt)] call WMS_fnc_sys_ActReactProtect;

if (true) then {diag_log format ["[ACTION, REACTION!]|WAK|TNA|WMS|pushback and protect _this = %1", _this]};

private ["_RandomPosPlane"]; 
params[ 
	"_obj",
	["_posASL",[0,0,-9999]],
	["_option", "nothing"]
];
if (_posASL select 2 == -9999) then {_posASL = getPosASL _obj};
WMS_sys_ActReactAntiTheft pushback [netID _obj ,_posASL];
[
	_obj,
	[
		"<t size='1' color='#ff0000'>Object Protected By WMS_Network AntiTheft</t>",
		"
		", 
		[],
		5,
		true,
		true,
		"",
		"(alive _target)",
		5
	]
	] remoteExec [
		"addAction",
		0,
		true
];