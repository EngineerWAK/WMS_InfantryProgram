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

//[_killed,_killer,_playerRep,_distanceKill,_difficulty]call WMS_fnc_AMS_AdjustOnLeaderKia;
private ["_grp","_suppressTime"];
params[
	"_killed",
	"_killer",
	["_playerRep",25001, [0]],
	["_difficulty", "Hardcore", []]
];
if (isplayer _killer) then {
	_grp = (group _killed);
	_suppressTime = 3;
	{
		//if (getSuppression _x > 0) then {};
		_x setSkill ["spotDistance", 1];
		_x setSkill ["spotTime", 1];
		_x setFatigue 0;
		_x setSuppression 0;
		_x setCustomAimCoef 0;
		_x suppressFor _suppressTime; //Will force soldier1 to do suppressive fire to known enemies during 3 seconds
	
		_x setVariable ["AMS_AdjustedSkills",true];
	}forEach units _grp;
	
	//[_grp, 50,_suppressTime]spawn WMS_fnc_AMS_VCOMfindCover;
};