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

//[_killed,_killer,_playerRep,_distanceKill,_difficulty]call WMS_fnc_AMS_Reinforce;
if (WMS_IP_LOGs) then {diag_log format ["[AMS REINFORCE]|WAK|TNA|WMS| _this = %1", _this]};
private ["_flare","_info","_annihilatorChance","_DynAIList","_type"];
params[  
	"_killed",
	"_killer",
	["_playerRep",25001, [0]] ,
	["_distance", 311, [0]],
	["_difficulty", "Difficult", [""]]
	];
_type = "reinforcement";
_flare = "F_Signal_Red" createvehicle getposATL _killed;
_info = "none";
_annihilatorChance = 25;
_DynAIList = ["rain","INFpatrol","runner","paradrop","VHLpatrol","AIRpatrol","AIRassault","arty","bombing","random"];

switch (toLower _difficulty) do {
	case  "easy" 		: {_annihilatorChance = 40};
	case  "moderate" 	: {_annihilatorChance = 30};
	case  "difficult" 	: {_annihilatorChance = 20};
	case  "hardcore" 	: {_annihilatorChance = 10};
	case  "static" 		: {_annihilatorChance = 5};
};
if (vehicle _killer isKindOf "tank"||vehicle _killer isKindOf "APC") then {
	if (_annihilatorChance > random 100) then {
		_info = "Annihilator";
		_timer = 240;
	} else {
		_type = "reinforcementpunisher";
		_info = selectRandom [
			"rain","rain","rain","rain",
			//"INFpatrol",
			//"runner",
			"paradrop",
			"VHLpatrol","VHLpatrol",
			"AIRpatrol",
			//"AIRassault",
			"arty",
			"bombing","bombing",
			"ParaBombs","ParaBombs",
			"Annihilator",
			"random"
		];
	};
}else {
	if (vehicle _killer isKindOf "Heli_Attack_01_base_F"||vehicle _killer isKindOf "Heli_Attack_02_base_F") then {
		if (_annihilatorChance*0.5 > random 100) then {
			_info = "Annihilator";
			_timer = 240;
		} else {
			_type = "reinforcementpunisher";
			_info = selectRandom [
				"rain",
				//"INFpatrol",
				//"runner",
				"paradrop",
				"VHLpatrol","VHLpatrol","VHLpatrol",
				"AIRpatrol","AIRpatrol","AIRpatrol","AIRpatrol",
				//"AIRassault",
				//"arty",
				"bombing",
				//"Annihilator",
				"random"
			];
		};
	} else {
		if ((typeOf (vehicle _killer)) in WMS_RCWS_Vhls) then {
			if (_annihilatorChance*0.15 > random 100) then {
				_info = "Annihilator";
				_timer = 180;
			} else {
				_type = "reinforcementpunisher";
				_info = selectRandom [
					"rain","rain","rain",
					//"INFpatrol",
					//"runner",
					"paradrop",
					"VHLpatrol","VHLpatrol",
					"AIRpatrol","AIRpatrol","AIRpatrol",
					//"AIRassault",
					//"arty",
					"bombing",
					"ParaBombs",
					//"Annihilator",
					"random"
				];
			};
		} else {
//"Regular" reinforcement, by distance:
if (_distance > ((WMS_AMS_RangeList select 0)+10) && _distance <= (WMS_AMS_RangeList select 1)  ) then {
	_info = selectRandom [
		"rain","rain","rain",
		//"INFpatrol",
		"runner","runner",
		"paradrop"
		//"VHLpatrol",
		//"AIRpatrol",
		//"AIRassault",
		//"arty",
		//"bombing",
		//"random"
		];
};
if (_distance > (WMS_AMS_RangeList select 1) && _distance <= (WMS_AMS_RangeList select 2)  ) then {
	_info = selectRandom [
		"rain","rain","rain",
		//"INFpatrol",
		"runner","runner","runner",
		"paradrop",
		//"VHLpatrol",
		//"AIRpatrol",
		//"AIRassault",
		//"arty",
		//"bombing",
		"random"
		];
};
if (_distance > (WMS_AMS_RangeList select 2) && _distance <= (WMS_AMS_RangeList select 3)  ) then {
	_info = selectRandom [
		"rain","rain",
		//"INFpatrol",
		"runner","runner",
		"paradrop","paradrop",
		//"VHLpatrol",
		"AIRpatrol",
		//"AIRassault",
		//"arty",
		//"bombing",
		"random"
		];
};
if (_distance > (WMS_AMS_RangeList select 3) && _distance <= (WMS_AMS_RangeList select 4)  ) then {
	if (_annihilatorChance > random 100) then {
		_info = "Annihilator";
		_timer = 240;
	} else {
	_info = selectRandom [
		"rain",
		//"INFpatrol",
		"runner","runner",
		"paradrop","paradrop",
		//"VHLpatrol",
		"AIRpatrol",
		"AIRassault",
		//"arty",
		//"bombing",
		"random"
		];
	};
};
if (_distance > (WMS_AMS_RangeList select 4)) then {
	if ((_annihilatorChance*1.5) > random 100) then {
		_info = "Annihilator";
		_timer = 300;
	} else {
	_info = selectRandom [
		"rain",
		//"INFpatrol",
		"runner",
		"paradrop","paradrop",
		"VHLpatrol",
		//"AIRpatrol",
		"AIRassault",
		"arty",
		//"bombing",
		"random","random"
		];
	};
};
};
};
};

if (_info in _DynAIList) then {
	[_killer, (getPosATL _killer), _type,_info]call WMS_fnc_DynAI_SelScen;
};
if (_info == "Annihilator") then {
	[_killer,_timer] spawn WMS_fnc_AMS_Annihilator;
};

if (WMS_IP_LOGs) then {diag_log format ["[AMS REINFORCE]|WAK|TNA|WMS| _info = %1", _info]};
WMS_AMS_LastReinforce = time;

/*
if (_triggType == "reinforcement") then {
_info = selectRandom ["rain","INFpatrol","runner","paradrop","VHLpatrol","AIRpatrol","AIRassault","arty","bombing"];

};
*/