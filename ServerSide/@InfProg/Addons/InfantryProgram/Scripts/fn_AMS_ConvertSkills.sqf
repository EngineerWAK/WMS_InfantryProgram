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

//WMS_AMS_skillsMin 	= [0.1, 0.2, 0.1, 0.2, 0.1, 0.3, 0.1, 0.2];
//WMS_AMS_skillsMax 	= [0.95, 0.9, 0.9, 1, 0.9, 1, 1, 0.95];
//_skill * _Coeff * (_skillmax - _skillmin) + _skillmin
if (WMS_IP_LOGs) then {diag_log format ["[AMS CONVERT SKILL]|WAK|TNA|WMS| _this = %1", _this]};
private ["_skills","_Coeff","_skillsCut","_result"];
params[
	"_skill",
	["_difficulty","Hardcore"],
	["_units", []]
];
_skills = WMS_AMS_skillsMin; //[0.3, 0.25, 0.1, 0.2, 0.1, 0.2, 0.1, 0.2];
_Coeff 	= [1, 1, 1, 1, 1, 1, 0, 1, 1];

switch (toLower _difficulty) do {
	case "easy"			: {_Coeff = WMS_AMS_skilleasy};
	case "moderate"		: {_Coeff = WMS_AMS_skillmoderate};
	case "difficult"	: {_Coeff = WMS_AMS_skilldifficult};
	case "hardcore"		: {_Coeff = WMS_AMS_skillhardcore};
	case "static"		: {_Coeff = WMS_AMS_skillstatic};

};
_skills = [
	(_skill*(_Coeff select 0)*((WMS_AMS_skillsMax select 0)-(WMS_AMS_skillsMin select 0))+(WMS_AMS_skillsMin select 0)), 	//spotDistance
	(_skill*(_Coeff select 1)*((WMS_AMS_skillsMax select 1)-(WMS_AMS_skillsMin select 1))+(WMS_AMS_skillsMin select 1)), 	//spotTime
	(_skill*(_Coeff select 2)*((WMS_AMS_skillsMax select 2)-(WMS_AMS_skillsMin select 2))+(WMS_AMS_skillsMin select 2)), 	//aimingAccuracy
	(_skill*(_Coeff select 3)*((WMS_AMS_skillsMax select 3)-(WMS_AMS_skillsMin select 3))+(WMS_AMS_skillsMin select 3)), 	//aimingShake
	(_skill*(_Coeff select 4)*((WMS_AMS_skillsMax select 4)-(WMS_AMS_skillsMin select 4))+(WMS_AMS_skillsMin select 4)), 	//aimingSpeed
	(_skill*(_Coeff select 5)*((WMS_AMS_skillsMax select 5)-(WMS_AMS_skillsMin select 5))+(WMS_AMS_skillsMin select 5)), 	//reloadSpeed
	(_skill*(_Coeff select 6)*((WMS_AMS_skillsMax select 6)-(WMS_AMS_skillsMin select 6))+(WMS_AMS_skillsMin select 6)), 	//courage
	(_skill*(_Coeff select 7)*((WMS_AMS_skillsMax select 7)-(WMS_AMS_skillsMin select 7))+(WMS_AMS_skillsMin select 7)), 	//commanding
	(_skill*(_Coeff select 8)*((WMS_AMS_skillsMax select 8)-(WMS_AMS_skillsMin select 8))+(WMS_AMS_skillsMin select 8)) 	//general
];
_skillsCut = [];
{
	_result = [_x,2] call BIS_fnc_cutDecimals;
	_skillsCut pushBack _result;
}forEach _skills;
if ((count _units) > 0) then {
	{
		_x setSkill ["spotDistance", 	(_skills select 0)];
		_x setSkill ["spotTime", 		(_skills select 1)];
		_x setSkill ["aimingAccuracy", 	(_skills select 2)];
		_x setSkill ["aimingShake", 	(_skills select 3)];
		_x setSkill ["aimingSpeed", 	(_skills select 4)];
		_x setSkill ["reloadSpeed", 	(_skills select 5)];
		_x setSkill ["courage", 		(_skills select 6)];
		_x setSkill ["commanding", 		(_skills select 7)];
		_x setSkill ["general", 		(_skills select 8)];
		_x setVariable ["WMS_skills",_skillsCut,true]; //will be used for AI killfeed on player EH killed
		_x setVariable ["WMS_Difficulty",_difficulty, true]; //will be used for AI killfeed on player EH killed
	}forEach _units;
};
if (WMS_IP_LOGs) then {diag_log format ["[AMS CONVERT SKILL]|WAK|TNA|WMS| _difficulty = %1 | _skills = %2", _difficulty, _skillsCut]};
_skillsCut