class Box_Syndicate_WpsLaunch_F //this need to be added directly at the box spawn for compatibility
	{
		targetType = 2;
		target = "Box_Syndicate_WpsLaunch_F";

		class Actions
		{
			class SyndicateLaunchCarry: ExileAbstractAction
			{
				title = "Hide the crate in the 4th Dimension";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "private _object = (_this select 0); _object attachTo [player, [0,1.5,-0.2],'pelvis']; _object allowDamage false; [(_this select 0), true] remoteExec ['WMS_fnc_HideObjectGlobal']; player addAction ['Mortar crate', {player removeaction (_this select 2); detach (_this select 3 select 0);(_this select 3 select 0) setDamage 0;[(_this select 3 select 0), false] remoteExec ['WMS_fnc_HideObjectGlobal']; (_this select 3 select 0) hideObject false;},[_object]];";
				
			};
	
		};
	};
	
class Box_Syndicate_Wps_F  //this need to be added directly at the box spawn for compatibility
	{
		targetType = 2;
		target = "Box_Syndicate_Wps_F";

		class Actions
		{
			class SyndicateLaunchCarry: ExileAbstractAction
			{
				title = "Hide the crate in the 4th Dimension";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "private _object = (_this select 0); _object attachTo [player, [0,1.5,-0.2],'pelvis']; _object allowDamage false; [(_this select 0), true] remoteExec ['WMS_fnc_HideObjectGlobal']; player addAction ['Explosives crate', {player removeaction (_this select 2); detach (_this select 3 select 0);(_this select 3 select 0) setDamage 0;[(_this select 3 select 0), false] remoteExec ['WMS_fnc_HideObjectGlobal'];  (_this select 3 select 0) hideObject false;},[_object]];";
			};
	
		};
	};
	
class Box_Syndicate_Ammo_F  //this need to be added directly at the box spawn for compatibility
	{
		targetType = 2;
		target = "Box_Syndicate_Ammo_F";

		class Actions
		{
			class SyndicateLaunchCarry: ExileAbstractAction
			{
				title = "Hide the crate in the 4th Dimension";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "private _object = (_this select 0); _object attachTo [player, [0,1.5,-0.2],'pelvis']; _object allowDamage false; [(_this select 0), true] remoteExec ['WMS_fnc_HideObjectGlobal']; player addAction ['Ammo crate', {player removeaction (_this select 2); detach (_this select 3 select 0);(_this select 3 select 0) setDamage 0;[(_this select 3 select 0), false] remoteExec ['WMS_fnc_HideObjectGlobal'];  (_this select 3 select 0) hideObject false;},[_object]];";
			};
	
		};
	};

class Exile_Container_OldChest
	{
		targetType = 2;
		target = "Exile_Container_OldChest";

		class Actions
		{
			class OldChestSeparateur1: ExileAbstractAction
			{
				title = "----------AirBorn----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "";
			};
			class OldChestC130Request: ExileAbstractAction
			{
				title = "Request C130";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_MoveInCargo_C130_LastTime + WMS_InfantryProgram_C130CoolDown)) && (time > (WMS_Loc_InfProg_C130_Last + WMS_Loc_InfProg_C130_CoolDown))";
				//action = "execVM 'Custom\InfantryOnlyProgram\WMS_C130_Request.sqf'";
				//action = "[] call WMS_fnc_IP_C130_Request";
				action = "[] execvm 'infantryProgram\fn_IP_C130_Request.sqf'";
			};
			/* //I think ths never worked
			class OldChestParadropMissionGetIn: ExileAbstractAction
			{
				title = "Get In the C130 *experimental*";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time < (WMS_MoveInCargo_C130_LastTime + 30))";
				action = "player moveInCargo WMS_MoveInCargo_C130";
			};*/
			class OldChestRequestExtraction: ExileAbstractAction
			{
				title = "Request Extraction Chopper";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_IP_ExtractChop_LastT + WMS_IP_ExtractChop_CoolD)) && (time > (WMS_Loc_InfProg_Extraction_Last + WMS_Loc_InfProg_Extraction_CoolDown))";
				//action = "execVM 'Custom\InfantryOnlyProgram\WMS_ExtractionRequest.sqf'";
				//action = "[] call WMS_fnc_IP_ExtractionRequest";
				action = "[] execvm 'infantryProgram\fn_IP_ExtractionRequest.sqf'";
			};
			/* //function not converted yet
			class OldChestRequestINFchopper: ExileAbstractAction
			{
				title = "Infantry backup, 5000 PopTabs";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_INFbyChopper_LastTime + WMS_INFbyChopper_CoolDown)) && (time > (WMS_Loc_InfProg_InfSquad_Last + WMS_Loc_InfProg_InfSquad_CoolDown))";
				action = "[player, position player,'',0,'INFbyChopper'] remoteExec ['WMS_fnc_InfantryProgram_INFbyChopper']; WMS_Loc_InfProg_INFsquad_Last = time;";
			};*/
			class OldChestRequestWDtrader: ExileAbstractAction
			{
				title = "Call Trader 1500 Poptabs";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_WDtrader_LastTime + WMS_WDtrader_CoolDown)) && (time > (WMS_Loc_InfProg_WDtrader_Last + WMS_Loc_InfProg_WDtrader_CoolDown))";
				action = "[player, position player,'',0,'WDtrader'] remoteExec ['WMS_fnc_InfantryProgram_INFbyChopper']; WMS_Loc_InfProg_WDtrader_Last = time;";
			};
			class OldChestInfantryProgramSupplyDrop: ExileAbstractAction
			{
				title = "Ammo SupplyDrop 3500 PopTabs";
				condition = "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_Loc_InfProg_Supply_Last + WMS_Loc_InfProg_Supply_CoolDown))";
				action = "[(position player), player, 3500, 0, 'IP_ammo'] remoteexec ['WMS_fnc_InfantryProgram_buy']; WMS_Loc_InfProg_Supply_Last = time;";//"IP_ammo", "IP_toolKit", "IP_launcher"
			};
			class OldChestInfantryProgramToolKitDrop: ExileAbstractAction //works
			{
				title = "Tool Kit 12000 PopTabs";
				condition = "((getplayerUID player) in WMS_InfantryProgram_list) && (time > (WMS_Loc_InfProg_Supply_Last + WMS_Loc_InfProg_Supply_CoolDown))";
				action = "[(position player), player, 12000, 0, 'IP_toolKit'] remoteexec ['WMS_fnc_InfantryProgram_buy']; WMS_Loc_InfProg_Supply_Last = time;";//"IP_ammo", "IP_toolKit", "IP_launcher"
			};
			class OldChestInfantryProgramLauncherDrop: ExileAbstractAction
			{
				title = "RPG7 crate 10000 PopTabs";
				condition = "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_Loc_InfProg_Supply_Last + WMS_Loc_InfProg_Supply_CoolDown))";
				action = "[(position player), player, 10000, 0, 'IP_launcher'] remoteexec ['WMS_fnc_InfantryProgram_buy']; WMS_Loc_InfProg_Supply_Last = time;";//"IP_ammo", "IP_toolKit", "IP_launcher"
			};
			class OldChestSeparateur2: ExileAbstractAction
			{
				title = "----------Ground----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "";
			};
			class OldChestRequestBunkerCamp: ExileAbstractAction
			{
				title = "Build the Camp 2000 poptabs";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_Compo_BunkerCamp_LastTime + WMS_Compo_BunkerCamp_CoolDown))";
				action = "[player, position player, getDir player, 1200, 0, 2000] remoteExec ['WMS_fnc_Compo_BunkerCamp']; WMS_Compo_BunkerCamp_LastTime = time;";
			};
			class OldChestRequestGNDextraction: ExileAbstractAction
			{
				title = "Request Extraction Ground";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_Extraction_GND_LastTime + WMS_Extraction_GND_CoolDown)) && (time > (WMS_Loc_InfProg_GNDextraction_Last + WMS_Loc_InfProg_GNDextraction_CoolDown))";
				//action = "execVM 'Custom\InfantryOnlyProgram\WMS_GNDextractionRequest.sqf'";
				//action = "[] call WMS_fnc_IP_ExtractionRequest";
				action = "[] execvm 'infantryProgram\fn_IP_GNDextractionRequest.sqf'";
			};
			class OldChestSeparateur3: ExileAbstractAction
			{
				title = "----------On player:----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "";
			};
			//VSM:
			class OldChestInfantryProgramLoadoutsScorpionA: ExileAbstractAction
			{
				title = "Loadout Scorpion 3000 PopTabs"; //this one ONLY if you are NOT in WMS_IP_Active_list
				condition = "((getplayerUID player) in WMS_InfantryProgram_list && !((getplayerUID player) in WMS_IP_Active_list))";
				action = "[player, [], position player, WMS_Loadout_Scorpion, 3000] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsAOR2: ExileAbstractAction
			{
				title = "Equipement AOR2 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_AOR2, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsM90: ExileAbstractAction
			{
				title = "Equipement M90 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_M90, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsScorpion: ExileAbstractAction
			{
				title = "Equipement Scorpion 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_Scorpion, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsTiger: ExileAbstractAction
			{
				title = "Equipement Tiger 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_Tiger, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			/////////////////////////GB/FR/////////////////////////
/*
			class OldChestInfantryProgramLoadoutsGBtmp: ExileAbstractAction
			{
				title = "Equipement GB Tmp 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_UKtmp, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsGBwdl: ExileAbstractAction
			{
				title = "Equipement GB Wdl 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_UKwdl, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsFRce: ExileAbstractAction
			{
				title = "Equipement FR CE 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_FRce, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
			class OldChestInfantryProgramLoadoutsDEfleck: ExileAbstractAction
			{
				title = "Equipement DE Fleck 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, [], position player, WMS_Loadout_DEfleck, 2500] remoteExec ['WMS_fnc_InfantryProgram_loadouts']";
			};
*/
			/////////////////////////GB/FR/////////////////////////
			class OldChestSeparateur4: ExileAbstractAction
			{
				title = "----------In the Chest:----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "";
			};
			class OldChestInfantryProgramWeapsASSB: ExileAbstractAction
			{
				title = "Weap Assault 3000 PopTabs"; //this one ONLY if you are NOT in WMS_IP_Active_list
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && !((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_Assault, 3000] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestInfantryProgramWeapsSMG: ExileAbstractAction
			{
				title = "Weap SMG 1500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_SMG, 1500] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestInfantryProgramWeapsASS: ExileAbstractAction
			{
				title = "Weap Assault 2500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_Assault, 2500] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestInfantryProgramWeapsMG: ExileAbstractAction
			{
				title = "Weap MG 3000 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_MG, 3000] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestInfantryProgramWeapsDMR: ExileAbstractAction
			{
				title = "Weap DMR 3500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_DMR, 3500] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestInfantryProgramWeapsSNIP: ExileAbstractAction
			{
				title = "Weap Sniper 4500 PopTabs";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "[player, (_this select 0), position player, WMS_Loadout_Sniper, 4500] remoteExec ['WMS_fnc_InfantryProgram_Weapons']";
			};
			class OldChestSeparateur5: ExileAbstractAction
			{
				title = "----------Arty----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list));
				action = "";
			};
			class OldChestRequestArtySupportHE: ExileAbstractAction
			{
				title = "Artillery HE, 10000";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_IP_ArtySup_LastT + WMS_IP_ArtySup_CoolD))";
				//action = "[player,'HE',10000] execVM 'Custom\InfantryOnlyProgram\WMS_ArtySupport.sqf'";
				//action = "[player,'HE',10000] call WMS_fnc_IP_ArtySupport";
				action = "[player,'HE',10000] execvm 'infantryProgram\fn_IP_ArtySupport.sqf'";
			};
			class OldChestRequestArtySupportSMOKE: ExileAbstractAction
			{
				title = "Artillery Smoke, 500";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_IP_ArtySup_LastT + WMS_IP_ArtySup_CoolD))";
				//action = "[player,'SMOKE',500] execVM 'Custom\InfantryOnlyProgram\WMS_ArtySupport.sqf'";
				//action = "[player,'SMOKE',500] call WMS_fnc_IP_ArtySupport";
				action = "[player,'SMOKE',500] execvm 'infantryProgram\fn_IP_ArtySupport.sqf'";
			};
			class OldChestRequestArtySupportFLARE: ExileAbstractAction
			{
				title = "Artillery Flare, 300";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_IP_ArtySup_LastT + WMS_IP_ArtySup_CoolD))";
				//action = "[player,'FLARE',300] execVM 'Custom\InfantryOnlyProgram\WMS_ArtySupport.sqf'";
				//action = "[player,'FLARE',300] call WMS_fnc_IP_ArtySupport";
				action = "[player,'FLARE',300] execvm 'infantryProgram\fn_IP_ArtySupport.sqf'";
			};
			class OldChestRequestBlackFishSupport: ExileAbstractAction
			{
				title = "BlackFish Support 30k";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list && ((getplayerUID player) in WMS_IP_Active_list)) && (time > (WMS_IP_BlackFishSup_LastT + WMS_IP_BlackFishSup_CoolD))";
				//action = "execVM 'Custom\InfantryOnlyProgram\WMS_BlackFishSupport.sqf'";
				//action = "[player] call WMS_fnc_IP_BlackFishSupport";
				action = "[player] execvm 'infantryProgram\fn_IP_BlackFishSupport.sqf'";
			};
			class OldChestSeparateur6: ExileAbstractAction
			{
				title = "----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "";
			};
			class OldChestJOINInfantryProgram: ExileAbstractAction
			{
				title = "Join The Program";
				condition =  ((getplayerUID player) in WMS_InfantryProgram_list && !((getplayerUID player) in WMS_IP_Active_list));
				action = "WMS_IP_Active_list pushBack (getplayerUID player); publicVariable 'WMS_IP_Active_list'; systemchat 'Welcome Back Soldier, remember to not get in vehicles'";
			};
			class OldChestSeparateur7: ExileAbstractAction
			{
				title = "----------";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "";
			};/*
			class OldChestLoadOnPandur: ExileAbstractAction
			{
				title = "Look for a PANDUR";
				//condition = (_this getVariable ["UnLoaded", true]);
				condition = "true";
				//action = "[(_this select 0)] execVM 'Custom\InfantryOnlyProgram\WMS_OldChestOnPandur.sqf'";
				//action = "[(_this select 0)] call WMS_fnc_IP_OldChestOnPandur";
				action = "[(_this select 0)] execvm 'infantryProgram\fn_IP_OldChestOnPandur.sqf";
			};*/
			
			class OldChestQuantumRadar: ExileAbstractAction
			{
				title = "Quantum Radar";
				//condition = (((getplayerUID player) in WMS_InfantryProgram_list) && ('Exile_Item_MobilePhone' in (magazines player)));
				//condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				condition =  "(magazines player find 'Exile_Item_Magazine01' >= 0) && (magazines player find 'Exile_Item_Magazine02' >= 0) && (magazines player find 'Exile_Item_Magazine03' >= 0) && (magazines player find 'Exile_Item_Magazine04' >= 0) && (backpack player == 'B_RadioBag_01_wdl_F')";
				action = "systemChat 'calling';[300, 'chest', player] execvm 'infantryProgram\fn_IP_OpforVHL_Radar.sqf'; player removeitem 'Exile_Item_Magazine01'; player removeitem 'Exile_Item_Magazine02'; player removeitem 'Exile_Item_Magazine03'; player removeitem 'Exile_Item_Magazine04';systemChat 'called';";//player removeitem 'Exile_Item_MobilePhone'
			};
			class OldChestQuantumComputer: ExileAbstractAction //TEST, NEED A NEW FUNCTION AT THE RIGHT PLACE
			{
				title = "Build Quantum Computer";
				//condition = (((getplayerUID player) in WMS_InfantryProgram_list) && ('Exile_Item_MobilePhone' in (magazines player)));
				//condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				condition =  ((getplayerUID player) == '76561197965501020');
				action = "systemChat 'Admin calling';[player, (_this select 0)]execVM 'Custom\InfantryOnlyProgram\WMS_QuantumComputer.sqf'; systemChat 'Admin called';";//player removeitem 'Exile_Item_MobilePhone'
			};
	
		};
	};
	
class Land_MultiScreenComputer_01_olive_F  //TEST, put your own UID if you want to try
	{
		targetType = 2;
		target = "Land_MultiScreenComputer_01_olive_F";

		class Actions
		{
			class MultiScreenComputerAdmin_Delete: ExileAbstractAction
			{
				title = "Pack Quantum Computer";
				condition = ((getplayerUID player) == '76561197965501020'); 
				action = "detach (_this select 0); deleteVehicle (_this select 0);";
			};
			
			class MultiScreenComputerAdmin_FoolBox: ExileAbstractAction
			{
				title = "Get a FoolBox";
				condition = ((getplayerUID player) == '76561197965501020');
				action = "player addItemToBackpack 'Exile_Item_Foolbox';";
			};
			class MultiScreenComputerAdmin_OldChest: ExileAbstractAction
			{
				title = "Get OldChest";
				condition = ((getplayerUID player) == '76561197965501020');
				action = "player addItemToBackpack 'Exile_Item_OldChestKit';";
			};
			class MultiScreenComputerAdmin_OldChest2: ExileAbstractAction
			{
				title = "Spawn OldChest";
				condition = ((getplayerUID player) == '76561197965501020');
				action = "'Exile_Container_OldChest' createVehicle Position Player;";
			};
			class MultiScreenComputerAdmin_RadioPack: ExileAbstractAction
			{
				title = "Get RadioPack";
				condition = ((getplayerUID player) == '76561197965501020');
				action = "player addBackpack 'B_RadioBag_01_wdl_F';";
			};
			class MultiScreenComputerAdmin_Radar: ExileAbstractAction
			{
				title = "Quantum Computer Radar";
				condition =  ((getplayerUID player) == '76561197965501020');
				action = "systemChat 'Admin calling'; [600, 'computer', player] execVM 'Custom\InfantryOnlyProgram\WMS_OpforVHL_Radar.sqf'; systemChat 'Admin called';";
			};
			class MultiScreenComputerAdmin_Magazines: ExileAbstractAction
			{
				title = "Magazine Bundle";
				condition = ((getplayerUID player) == '76561197965501020');
				action = "player addItemToBackpack 'Exile_Item_Magazine01';player addItemToBackpack 'Exile_Item_Magazine02';player addItemToBackpack 'Exile_Item_Magazine03';player addItemToBackpack 'Exile_Item_Magazine04';";
			};
		};	
	};
class rhs_DSHKM_ins 
	{
		targetType = 2;
		target = "rhs_DSHKM_ins";

		class Actions
		{
			class DSHKMLoadOnPandur: ExileAbstractAction
			{
				title = "Look For a PANDUR";
				//condition = (_this getVariable ["UnLoaded", true]);
				condition = "true";
				action = "[(_this select 0)] execVM 'Custom\InfantryOnlyProgram\WMS_DshkmOnPandur.sqf'";
			};
			
		};
	};