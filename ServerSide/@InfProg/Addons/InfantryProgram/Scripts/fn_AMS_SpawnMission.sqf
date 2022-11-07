/**
* WMS_fnc_AMS_SpawnMission
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//////////////////////////////////////////////////////////////////
//[_missionToSpawn] call WMS_fnc_AMS_SpawnMission;
private ["_debugTime1","_rwd","_unified","_rwds","_objects","_AIvhlList","_AIvhl","_diff"];
params [
	["_mission", (selectRandom WMS_AMS_Missions)]
	];

if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN]|WAK|TNA|WMS| _this: %1 || _mission: %2", _this, _mission]};
_debugTime1 = time;
if (_mission == "no") then { //obiously can not work anymore
	if (WMS_IP_LOGs) then {diag_log "WMS_AMS_* Mission name fucked-up"};
} else {
	switch (_mission) do {
		case "blackhawk" : {
			_objects 	= (selectRandom ["blackhawk","blackhawk_v2"]);//"classename"
			_behav 		= (selectRandom ["patrol","defend","hide"]);
			["random",(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["BlackHawk Down"],["Moderate","Difficult","Difficult","Hardcore"],["heavyBandit","bandit"],["Assault","HeavyBandit"],[_behav],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, count of each, + random]
					[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,_objects,28,nil,nil,[8,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "bastogne" : {
			_behav 		= (selectRandom ["patrol","defend","hide"]);
			[(selectRandom WMS_AMS_CustomPos),(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["Bastogne"],["Easy","Moderate","Difficult","Hardcore"],["army"],["Assault","HeavyBandit"],[_behav],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, count of each, + random]
					[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"bastogne",1,nil,nil,[5,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "strelnikovtrain" : {
			_rwd 		= WMS_AMS_Crate_XL;
			_diff 		= (selectRandom ["Moderate","Difficult","Difficult","Hardcore"]);
			_objects 	= (selectRandom ["strelnikovtrain","strelnikovtrain2"]);
			_behav 		= (selectRandom ["patrol","defend","hide"]);
			_loadouts 	= (selectRandom ["army","bandit","heavyBandit"]);
			_fonction 	= (selectRandom ["Assault","HeavyBandit"]);
			if(_diff == "Hardcore")then{_loadouts = "livonia";_fonction = "livoniapatrol";_rwds = selectRandom [WMS_AMS_LightRwds,WMS_AMS_CIVRwds];_rwd = ((selectRandom _rwds)select 0);};
			["random",(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["Strelnikov Train"],[_diff],[_loadouts],[_fonction],[_behav],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, count of each, + random]
					[[3,1,2],[1,1,2],[4,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[5,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[6,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,_objects,24,nil,[_rwd],[8,"MG","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "commsrelay" : {
			_rwd = ((selectRandom WMS_AMS_COMMSRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["COMMS Relay"],["Difficult","Difficult","Hardcore"],["army","livonia"],["Assault","livoniapatrol"],["defend"],
					[
						[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,2,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,2,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"commsrelay",22,[],[_rwd],[6,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "occupation" : { //this is a special one, custom dynamic mission which will spawn in a named location, without layout ("occupation" layout will stay empty)
			_unified = selectRandom ["a","b"];
			if (_unified == "a")then{
				["occupation",(random 359),2,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
					[
						["Occupation"],["Moderate","Difficult","Easy","Moderate","Difficult","Hardcore"],["heavyBandit","army"],["Assault","HeavyBandit"],["defend"],
						[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
						"military",50,true,"occupation",30,nil,nil,[6,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
					],_mission
				] call WMS_fnc_AMS_Mission_Unified_A;
			}else{
				["occupation",(random 359),2,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
					[
						["Occupation"],["Easy","Moderate","Difficult","Hardcore","Moderate","Difficult"],["heavyBandit","army"],["Assault","HeavyBandit"],["hide"],
						[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
						"military",50,true,"occupation",30,nil,nil,[6,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
					],_mission
				] call WMS_fnc_AMS_Mission_Unified_B;
			};
		};
		case "shipyard" : {
			_rwds = selectRandom [WMS_AMS_LightRwds,WMS_AMS_CIVRwds];
			_rwd = ((selectRandom _rwds)select 0);//"classename"
			_objects = (selectRandom ["shipyard","shipyard2"]);//"classename"
			["random",(random 359),2,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["Shipyard"],["Moderate","Difficult","Difficult","Hardcore"],["heavyBandit","army"],["Assault","HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,1],[5,1,2],[1,2,2],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
						[[2,1,1],[1,1,1],[6,1,3],[1,2,3],[0,0,0]],
						[[3,1,1],[1,1,1],[7,1,4],[1,3,2],[0,0,0]],
						[[4,1,1],[1,1,1],[8,1,5],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,25,[],[_rwd],[4,"MG","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "thecommunity" : {
			_unified = selectRandom ["a","b"];
			_objects = (selectRandom ["thecommunity","thecommunity2"]);//"classename"
			if (_unified == "a")then{
				["random",(random 359),2,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
					[
						["The Community"],["Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["Assault","HeavyBandit"],["defend"],
						[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
						"military",50,true,_objects,30,nil,nil,[6,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
					],_mission
				] call WMS_fnc_AMS_Mission_Unified_A;
			}else{
				["random",(random 359),2,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
					[
						["The Community"],["Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["Assault","HeavyBandit"],["hide"],
						[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
						"military",50,true,_objects,30,nil,nil,[6,"Assault","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
					],_mission
				] call WMS_fnc_AMS_Mission_Unified_B;
			};
		};
		case "Object172M" : {
			_AIvhlList = WMS_AMS_HeavyArmed;
			_AIvhl = (selectRandom _AIvhlList); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			_rwd = ((selectRandom WMS_AMS_ArmoredRedRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Object 172M"],["Hardcore","Difficult","Hardcore","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
					[
						[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,2,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,2,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",75,true,"Object172M",15,[_AIvhl],[_rwd],[6,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_E;
		};
		case "uncleabrams" : {
			_AIvhlList = WMS_AMS_HeavyArmed;
			_AIvhl = (selectRandom _AIvhlList); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			_rwd = ((selectRandom WMS_AMS_ArmoredBlueRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Uncle Abrams"],["Hardcore","Difficult","Hardcore","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
					[
						[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,2,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,2,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",75,true,"uncleabrams",15,[_AIvhl],[_rwd],[6,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_E;
		};
		case "FieldHospital" : {
			_objects = (selectRandom ["FieldHospital","FieldHospital2","FieldHospital3"]);
			["random",(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["Field Hospital"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["scientist","bandit","heavyBandit"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
					[[3,1,2],[1,1,2],[4,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[5,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[6,1,2],[1,3,3],[0,0,0]]],
					"meds",50,true,_objects,15,nil,nil,[6,"MG","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "GrandPaJoe" : {
			_objects = (selectRandom ["GrandPaJoe","GrandPaJoe_v2"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Grandpa Joe's Farm"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["Assault","HeavyBandit"],["defend"],//"CBTpatrol" "hide" "patrol" maybe hide
					[[[2,1,2],[1,1,2],[3,1,2],[1,2,3],[0,0,0]],
					[[3,1,2],[1,1,2],[3,1,2],[1,2,4],[0,0,0]],
					[[4,1,2],[1,1,2],[3,1,2],[1,3,4],[0,0,0]],
					[[5,1,2],[1,1,2],[3,1,2],[1,3,5],[0,0,0]]],
					"military",50,true,_objects,16,nil,nil,[6,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "Market" : {
			_rwds = selectRandom [WMS_AMS_LightRwds,WMS_AMS_CIVRwds,WMS_AMS_TruckRwds];
			_rwd = ((selectRandom _rwds)select 0);//"classename"
			_objects = (selectRandom ["Market","Market_v2"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Happy Market"],["Easy","Moderate","Difficult","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["hide"],
					[
						[[2,1,1],[2,1,1],[4,1,2],[1,2,2],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[2,1,1],[5,1,2],[1,2,3],[0,0,0]],
						[[4,1,1],[3,1,1],[6,1,2],[1,3,2],[0,0,0]],
						[[4,1,2],[4,1,1],[7,1,2],[1,3,3],[0,0,0]]
					],
					"military",30,true,_objects,15,[],[_rwd],[7,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "OldPowerPlant" : {
			_diff = selectRandom ["Moderate","Difficult","Hardcore"];
			_AIvhlList = WMS_AMS_LightArmed ;
			if (_diff == "Difficult") then {_AIvhlList = WMS_AMS_APC};
			if (_diff == "Hardcore") then {_AIvhlList = WMS_AMS_HeavyArmed};
			_AIvhl = (selectRandom _AIvhlList);
			_rwd = ((selectRandom WMS_AMS_LightRwds)select 0);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Old PowerPlant"],[_diff],["army"],["Assault","HeavyBandit"],["defend"],
					[
						[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,2,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,2,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"OldPowerPlant",16,[_AIvhl],[_rwd],[6,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_E;
		};
		case "LumberYard" : {
			_objects = (selectRandom ["LumberYard","LumberYard_v2","LumberYard_v3","LumberYard_v4"]);//"classename"
			[(selectRandom WMS_AMS_CustomPos),(random 359),1,3,0.5,[20,3],30,5,
				[
					["LumberYard"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,_objects,15,nil,nil,[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "JunkYard" : {
			_rwd = ((selectRandom WMS_AMS_TruckRwds)select 0);//"classename"
			_objects = (selectRandom ["JunkYard","JunkYard_v2"]);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["JunkYard"],["Easy","Moderate","Difficult","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[2,1,1],[2,1,2],[1,2,2],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[2,1,1],[3,1,2],[1,2,3],[0,0,0]],
						[[4,1,1],[3,1,1],[4,1,2],[1,3,2],[0,0,0]],
						[[5,1,1],[4,1,1],[5,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,15,[],[_rwd],[5,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "ArmedBandits" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Armed Bandits"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit","bandit"],["HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"ArmedBandits",9,nil,nil,[4,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "C192Crash" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["C192 Crash"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"C192Crash",19,nil,nil,[6,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "AmazonWH" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Amazon WareHouse"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","heavyBandit","bandit"],["HeavyBandit","Assault"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"AmazonWH",17,nil,nil,[5,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "TransmissionTower" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Transmission Towers"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","heavyBandit"],["HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"TransmissionTower",25,nil,nil,[6,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "GunsX3" : {
			_AIvhlList = WMS_AMS_HeavyArmed + WMS_AMS_APC;
			_AIvhl = (selectRandom _AIvhlList);
			_rwd = ((selectRandom WMS_AMS_SpclRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Gun, Guns, GUNS!"],["Moderate","Modarate","Difficult","Difficult","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
					[
						[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,2,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,2,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"GunsX3",16,[_AIvhl],[_rwd],[5,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_E;
		};
		case "Arena" : {
			["random",(random 359),1,5,0.5,[20,3],30,5,
				[
					["Thats a Fucking Arena, Bro"],["Moderate","Difficult","Hardcore"],["army","heavyBandit"],["Assault"],["CBTpatrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"Arena",70,nil,nil,[10,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "Factory" : {
			[(selectRandom WMS_AMS_CustomPosFact),(random 359),1,3,0.5,[20,3],30,5,
				[
					["Factory Sales"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","bandit","heavyBandit"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"Factory",6,nil,nil,[3,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "LightArmoredSteal" : { //new Layout
			_rwd = ((selectRandom WMS_AMS_ArmoredLightRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Light Armored Hijack"],["Moderate","Difficult","Hardcore"],["army"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"LightArmored",10,nil,[_rwd],[5,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "HeliSteal" : {
			_AIvhlList = WMS_AMS_LightArmed + WMS_AMS_APC;
			_AIvhl = (selectRandom _AIvhlList);
			_rwd = ((selectRandom WMS_AMS_ChopperRwds)select 0);//"classename"
			_objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Heli Steal"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,16,[_AIvhl],[_rwd],[5,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_E;
		};
		case "AABattery" : {
			_rwd = WMS_AMS_Crate_noMove;//"classename"
			_objects = (selectRandom ["AABattery","AABatteryV2"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["AA Battery"],["Moderate","Difficult","Difficult","Hardcore"],["BlackOps"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,15,[],[_rwd],[6,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "Escobar" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Escobars Mansion"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"Escobar",22,[],[],[6,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "Forgotten" : {
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["The Forgotten Expedition"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["hide"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"Forgotten",20,[],[],[6,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "Radar" : {
			_rwd = WMS_AMS_Crate_XL;//"classename"
			["random",(random 359),1,3,0.5,[20,3],50,5,
				[
					["Radar Station"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["BlackOps"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"Radar",14,[],[_rwd],[7,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "Construction" : {
			_rwd = ((selectRandom WMS_AMS_TruckRwds)select 0);//"classename"
			_objects = (selectRandom ["Construction","ConstructionV2"]);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Construction Site"],["Moderate","Difficult","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,1],[5,1,2],[1,2,2],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,1],[6,1,3],[1,2,3],[0,0,0]],
						[[3,1,1],[1,1,1],[7,1,4],[1,3,2],[0,0,0]],
						[[4,1,1],[1,1,1],[8,1,5],[1,3,3],[0,0,0]]
					],
					"supply",50,true,_objects,13,[],[_rwd],[5,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "OldTemple" : {
			_rwd = WMS_AMS_Crate_noMove;//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["MatchuPicachu Chu"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[0,0,0],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"OldTemple",12,[],[_rwd],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		/////////////
		/////OUTPOSTS
		/////////////
		case "OutpostAlpha" : {
			_objects = (selectRandom ["OutpostAlpha","OutpostAlpha","OutpostBravo"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Alpha"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["HeavyBandit"],["patrol"],
					[
						[[3,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[4,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,1],[2,1,2],[1,3,3],[0,0,0]],
						[[6,1,2],[2,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,12,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostBravo" : {
			_objects = (selectRandom ["OutpostBravo","OutpostBravo","OutpostAlpha","OutpostCharlie","OutpostBravo"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Bravo"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army"],["HeavyBandit"],["patrol"],
					[
						[[3,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[4,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,1],[2,1,2],[1,3,3],[0,0,0]],
						[[6,1,2],[2,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,12,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostCharlie" : {
			_objects = (selectRandom ["OutpostCharlie","OutpostCharlie","OutpostBravo","OutpostDeltaV2","OutpostCharlie"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Charlie"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","army","heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[3,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[4,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,1],[2,1,2],[1,3,3],[0,0,0]],
						[[6,1,2],[2,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,11,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostDelta" : {
			_objects = (selectRandom ["OutpostDelta","OutpostDelta","OutpostDeltaV2","OutpostBravo","OutpostEcho"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Delta"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[3,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[4,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,1],[2,1,2],[1,3,3],[0,0,0]],
						[[6,1,2],[2,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,10,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostEcho" : {
			_objects = (selectRandom ["OutpostEcho","OutpostEcho","OutpostDeltaV2","OutpostFoxtrot","OutpostEcho"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Echo"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","heavyBandit","heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,1],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,8,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostFoxtrot" : {
			_objects = (selectRandom ["OutpostFoxtrot","OutpostFoxtrot","OutpostEcho","OutpostGolfV2","OutpostFoxtrot"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Foxtrot"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,7,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "OutpostGolf" : {
			_objects = (selectRandom ["OutpostGolf","OutpostGolf","OutpostGolfV2","OutpostFoxtrot"]);
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["OutPost Golf"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["heavyBandit"],["HeavyBandit"],["patrol"],
					[
						[[2,1,1],[0,0,0],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[3,1,1],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[0,0,0],[2,1,2],[1,3,3],[0,0,0]],
						[[5,1,2],[0,0,0],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,_objects,6,[],[],[4,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "MissionTest1" : {[] call WMS_fnc_AMS_Mission_MissionTest1;};
		case "MissionTest2" : {[] call WMS_fnc_AMS_Mission_MissionTest2;};
		case "ForestCamp" : {["forest"] call WMS_fnc_AMS_Mission_ForestCamp;};
		case "HomeDepot" : {[] call WMS_fnc_AMS_Mission_HomeDepot;};
		case "CombatPatrol" : {[(selectRandom WMS_AMS_CustomPos)] call WMS_fnc_AMS_Mission_CombatPatrol;};
		case "EnyBunkers" : {[] call WMS_fnc_AMS_Mission_EnyBunkers;};
		case "Arbeit" : {[] call WMS_fnc_AMS_Mission_Arbeit;};
	};
	WMS_AMS_LastSpawn = time;
	
	if (WMS_IP_LOGs) then {diag_log format ["[AMS DEBUG FIRST SPAWN TIME]|WAK|TNA|WMS| fn_AMS_SpawnMission executed %1 secondes", (time - _debugTime1)]};
};