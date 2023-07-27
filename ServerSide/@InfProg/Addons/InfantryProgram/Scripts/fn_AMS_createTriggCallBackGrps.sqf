/**
* WMS_fnc_AMS_createTriggCallBackGrps
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
private ["_trigg"];
params[  
	"_pos",
	"_grpInf"
	];
_trigg =  createTrigger ["EmptyDetector", _pos, true];
_trigg setVariable ["WMS_CallAIgroup",[_grpInf, _pos],true];
_trigg setTriggerArea [5, 5, 0, false];
_trigg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trigg setTriggerStatements ["this && ({ thisTrigger distance _x <= 5 } count thislist) > 0", 
	"
	if (true) then {Diag_log format ['|WAK|TNA|WMS| AMS MISSION TRIGGER,  thisList = %1, thisTrigger = %2', (thisList select 0), thisTrigger];};
	_CallBackAIgroup = thisTrigger getVariable ['WMS_CallAIgroup',[[],[0,0,0]]];
	_CallBackAIgroup call WMS_fnc_AMS_callBackAIgroups;
	deleteVehicle thisTrigger;
	", 
	"
	"];
	
_trigg