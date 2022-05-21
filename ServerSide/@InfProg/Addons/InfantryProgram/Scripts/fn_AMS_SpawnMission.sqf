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

//////////////////////////////////////////////////////////////////
//diag_log format ["[AMS MISSION SPAWN]|WAK|TNA|WMS| _this:%1",_this];
//private _mission = [missionNamespace getVariable (format ["AMS_Mission_%1",_this])] param [0, "no"];
//private _mission = missionNamespace getVariable format ["AMS_Mission_%1",_this select 0];
//private _mission = format ["AMS_Mission_%1",_this select 0];
//private _mission = [missionNamespace getVariable format ["WMS_AMS_Mission_%1",_this param [0,selectRandom WMS_AMS_Missions, [""]]]] param [0, "no",[{}]];
private _mission = (_this select 0);
//[_missionToSpawn] call WMS_fnc_AMS_SpawnMission;
if (WMS_IP_LOGs) then {diag_log format ["[AMS MISSION SPAWN]|WAK|TNA|WMS| _this: %1 || _mission: %2", _this, _mission]};
private _debugTime1 = time;
if (_mission == "no") then { //obiously dan not work anymore
	if (WMS_IP_LOGs) then {diag_log "Mission name fucked-up"};
} else {
	//private _parameters = if ((count _this)>1) then {_this select 1} else {[]}; //Useless right now
	//_parameters call compile _mission;
	switch (_mission) do {
		case "Object172M" : {
			private _AIvhlList = WMS_AMS_HeavyArmed;
			private _AIvhl = (selectRandom _AIvhlList); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = ((selectRandom WMS_AMS_ArmoredRedRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Object 172M"],["Difficult","Hardcore","Hardcore"],["army"],["Assault","HeavyBandit"],["patrol"],
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
		case "FieldHospital" : {
			private _objects = (selectRandom ["FieldHospital","FieldHospital2","FieldHospital3"]);
			["random",(random 359),1,3,0.5,[20,3],30,5, //position type, direction, grp count, units count, skill, [wpts], minefield radius, mine count
				[
					["Field Hospital"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","bandit","heavyBandit"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag] //[how many different items, counf of each, + random]
					[[3,1,2],[1,1,2],[4,1,2],[1,3,3],[0,0,0]],
					[[4,1,2],[1,1,2],[5,1,2],[1,3,3],[0,0,0]],
					[[5,1,2],[1,1,2],[6,1,2],[1,3,3],[0,0,0]]],
					"meds",50,true,_objects,15,nil,nil,[6,"MG","garrison"] //loot type, launcher chance, WMS_AMS_ClnObj, layout, layout radius
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "GrandPaJoe" : {
			private _objects = (selectRandom ["GrandPaJoe","GrandPaJoe_v2"]);
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
			private _rwd = (selectRandom ["C_Van_01_transport_F","I_G_Van_01_transport_F","I_C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F"]);
			private _objects = (selectRandom ["Market","Market_v2"]);
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
			private _diff = selectRandom ["Moderate","Difficult","Hardcore"];
			private _AIvhlList = WMS_AMS_LightArmed ;
			if (_diff == "Difficult") then {_AIvhlList = WMS_AMS_APC};
			if (_diff == "Hardcore") then {_AIvhlList = WMS_AMS_HeavyArmed};
			private _AIvhl = (selectRandom _AIvhlList);
			private _rwd = ((selectRandom WMS_AMS_LightRwds)select 0);
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
			private _objects = (selectRandom ["LumberYard","LumberYard_v2","LumberYard_v3","LumberYard_v4"]);//"classename"
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
			//private _AIvhl = (selectRandom WMS_AMS_APC); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = ((selectRandom WMS_AMS_TruckRwds)select 0);//"classename"
			private _objects = (selectRandom ["JunkYard","JunkYard_v2"]);//"classename"
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
			private _AIvhlList = WMS_AMS_HeavyArmed + WMS_AMS_APC;
			private _AIvhl = (selectRandom _AIvhlList); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = ((selectRandom WMS_AMS_SpclRwds)select 0);//"classename"
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
			//WMS_AMS_CustomPosFact	= ["factory","factory","factory","random"]; //used to spawn "Factory Sales"
			[(selectRandom WMS_AMS_CustomPosFact),(random 359),1,3,0.5,[20,3],30,5,
				[
					["Factory Sales"],["Easy","Moderate","Moderate","Difficult","Hardcore"],["army","bandit","heavyBandit"],["Assault","HeavyBandit"],["patrol"],
					[[[2,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],[[5,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]],
					"military",50,true,"Factory",6,nil,nil,[3,"MG","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_B;
		};
		case "LightArmoredSteal" : {
			private _rwd = ((selectRandom WMS_AMS_ArmoredLightRwds)select 0);//"classename"
			["random",(random 359),1,3,0.5,[20,3],30,5,
				[
					["Light Armored Hijack"],["Moderate","Difficult","Hardcore"],["army"],["HeavyBandit"],["patrol"],
					[
						[[1,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],//[_weap,_bag,_items,_ammoList,_mag]
						[[2,1,1],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],
						[[4,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]
					],
					"military",50,true,"AdvancedCamp",10,nil,[_rwd],[5,"Assault","garrison"]
				],_mission
			] call WMS_fnc_AMS_Mission_Unified_C;
		};
		case "HeliSteal" : {
			private _AIvhlList = WMS_AMS_LightArmed + WMS_AMS_APC;
			private _AIvhl = (selectRandom _AIvhlList); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = ((selectRandom WMS_AMS_ChopperRwds)select 0);//"classename"
			private _objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
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
			//private _AIvhl = (selectRandom WMS_AMS_LightArmed); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = WMS_AMS_Crate_noMove;//"classename"
			private _objects = (selectRandom ["AABattery","AABatteryV2"]);
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
			//private _AIvhl = (selectRandom WMS_AMS_LightArmed); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			//private _rwd = WMS_AMS_Crate_noMove;//"classename"
			//private _objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
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
		};//case "Escobar"			: {_objects = WMS_AMS_Obj_Escobar};
		case "Forgotten" : {
			//private _AIvhl = (selectRandom WMS_AMS_LightArmed); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			//private _rwd = WMS_AMS_Crate_noMove;//"classename"
			//private _objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
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
			//private _AIvhl = (selectRandom WMS_AMS_LightArmed); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = WMS_AMS_Crate_XL;//"classename"
			//private _objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
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
			//private _AIvhl = (selectRandom WMS_AMS_APC); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = ((selectRandom WMS_AMS_TruckRwds)select 0);//"classename"
			private _objects = (selectRandom ["Construction","ConstructionV2"]);//"classename"
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
			//private _AIvhl = (selectRandom WMS_AMS_LightArmed); //["rhs_btr80a_vv",["rhs_sand",1],[[],[]]]
			private _rwd = WMS_AMS_Crate_noMove;//"classename"
			//private _objects = (selectRandom ["HeliSteal","HeliStealV2"]);//"classename"
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
			private _objects = (selectRandom ["OutpostAlpha","OutpostAlpha","OutpostBravo"]);
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
			private _objects = (selectRandom ["OutpostBravo","OutpostBravo","OutpostAlpha","OutpostCharlie","OutpostBravo"]);
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
			private _objects = (selectRandom ["OutpostCharlie","OutpostCharlie","OutpostBravo","OutpostDeltaV2","OutpostCharlie"]);
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
			private _objects = (selectRandom ["OutpostDelta","OutpostDelta","OutpostDeltaV2","OutpostBravo","OutpostEcho"]);
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
			private _objects = (selectRandom ["OutpostEcho","OutpostEcho","OutpostDeltaV2","OutpostFoxtrot","OutpostEcho"]);
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
			private _objects = (selectRandom ["OutpostFoxtrot","OutpostFoxtrot","OutpostEcho","OutpostGolfV2","OutpostFoxtrot"]);
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
			private _objects = (selectRandom ["OutpostGolf","OutpostGolf","OutpostGolfV2","OutpostFoxtrot"]);
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