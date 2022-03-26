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

WMS_AMS_Obj_ = [];
private _skipObjects = ["CamCurator","#lightpoint","babe_helper","Camera","Sign_Arrow_F","Sign_Arrow_Green_F","Sign_Arrow_Yellow_F","Logic"];
private _allObjects = nearestObjects [[0,0,0], [], 500]; 
{ 
	if ((TypeOf _x) in _skipObjects) then {

	} else {
		_pos 	= (GetPosATL _x);
		_Xpos	= [(_pos select 0), 1] call BIS_fnc_cutDecimals;
		_Ypos 	= [(_pos select 1), 1] call BIS_fnc_cutDecimals;
		_Zpos 	= [(_pos select 2), 2] call BIS_fnc_cutDecimals;
		_Dir 	= [(GetDir _x), 1] call BIS_fnc_cutDecimals;
		_object = [(TypeOf _x),[_Xpos,_Ypos,_Zpos], _Dir];
		WMS_AMS_Obj_ pushBack _object; 
	};
}forEach _allObjects; 
WMS_AMS_Obj_ sort true;
copyToClipBoard format ["%1", WMS_AMS_Obj_]; 
systemChat format ["%1 Objects Exported", (count WMS_AMS_Obj_)];