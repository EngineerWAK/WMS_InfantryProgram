
class Land_ArmChair_01_F
	{
		targetType = 2;
		target = "Land_ArmChair_01_F";

		class Actions
		{
			class myScript: ExileAbstractAction
			{
				title = "Halo Jump 300m";
				//condition = "true";
				condition = "(magazines player find 'Exile_Item_FireExtinguisher' >= 0)";
				//action = "[player] RemoteExec ['WMS_Fnc_Halo_300']";
				//action = "execVM 'Custom\HaloJump\Halo_300.sqf'";
				action = "execVM 'Custom\HaloJump\Halo_300.sqf'; player removeitem 'Exile_Item_FireExtinguisher'";
			};
			class ArmChairC130Request: ExileAbstractAction
			{
				title = "Request paradrop mission";
				//condition = "true";
				condition = ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "execVM 'Custom\InfantryOnlyProgram\WMS_C130_Request.sqf'";
			};
			class ArmChairParadropMissionGetIn: ExileAbstractAction
			{
				title = "Get In the C130 *experimental*";
				condition =  "((getplayerUID player) in WMS_InfantryProgram_list) && (time < (WMS_MoveInCargo_C130_LastTime + 30))";
				action = "player moveInCargo WMS_MoveInCargo_C130";
			};
	
		};
	};/*
class Land_Map_altis_F
	{
		targetType = 2;
		target = "Land_Map_altis_F";

		class Actions
		{
			class myScript: ExileAbstractAction
			{
				title = "Halo Jump";
				condition = "true";
				//condition = (magazines player find 'Exile_Item_FireExtinguisher' >= 0);
				action = "execVM 'addons\intro\intro2.sqf'";
			};
	
		};
	};*/
	/*
class MapBoard_Altis_F
	{
		targetType = 2;
		target = "MapBoard_Altis_F";

		class Actions
		{
			class myScript: ExileAbstractAction
			{
				title = "Halo Jump";
				condition = "true";
				//condition = (magazines player find 'Exile_Item_FireExtinguisher' >= 0);
				action = "execVM 'addons\intro\intro2.sqf'";
			};
	
		};
	};*/
	/*
class Land_phoneBooth_02_malden_F
	{
		targetType = 2;
		target = "Land_phoneBooth_02_malden_F";

		class Actions
		{
			class myScript: ExileAbstractAction
			{
				title = "Wanna Call Your Mama?";
				//condition = "true";
				condition = (magazines player find 'SmokeShellGreen' <= 1);
				action = "execVM 'Custom\HaloJump\Call_Your_Mama.sqf'";
			};
			class AirAssistPhone: ExileAbstractAction
			{
				title = "Air Assistance";
				//condition = "true";
				condition = (magazines player find 'SmokeShellGreen' >= 0);
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
	
		};
	};
class Land_phoneBooth_01_malden_F
	{
		targetType = 2;
		target = "Land_phoneBooth_01_malden_F";

		class Actions
		{
			class SuperHero: ExileAbstractAction
			{
				title = "Wanna be a Super Hero?";
				//condition = "true";
				condition = (magazines player find 'Exile_Item_ToiletPaper' <= 1);
				//action = "[player] RemoteExec ['WMS_Fnc_RocketMan90']";
				action = "execVM 'Custom\Paradrop\RocketMan90.sqf'";
			};
			class AirStrikePhone: ExileAbstractAction
			{
				title = "Call Airstrike";
				//condition = "true";
				//condition =  "(magazines player find 'Exile_Item_MobilePhone' >= 0) && (magazines player find 'SmokeShellGreen' >= 0)";
				condition = (magazines player find 'Exile_Item_RubberDuck' >= 0);
				action = "execVM 'Custom\Paradrop\Buy_AirStrikeOnNPC.sqf'";
			};
			
			class Lucky: ExileAbstractAction
			{
				title = "I'm Feeling Lucky";
				//condition = "true";
				condition = (magazines player find 'Exile_Item_ToiletPaper' >= 0);
				action = "execVM 'Custom\Paradrop\ImFeelingLucky.sqf'";
			};
	
		};
	};
	*/
	
class Land_phoneBooth_0_2F
	{
		targetType = 2;
		target = "Land_phoneBooth_02_F";

		class Actions
		{/*
			class myScript: ExileAbstractAction
			{
				title = "Wanna Call Your Mama?";
				//condition = "true";
				condition = (magazines player find 'SmokeShellGreen' <= 1);
				action = "execVM 'Custom\HaloJump\Call_Your_Mama.sqf'";
			};*/
			class AirAssistPhone: ExileAbstractAction
			{
				title = "Air Assistance";
				//condition = "true";
				condition = (magazines player find 'SmokeShellGreen' >= 0);
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
	
		};
	};
class Land_PhoneBooth_01_F
	{
		targetType = 2;
		target = "Land_PhoneBooth_01_F";

		class Actions
		{/*
			class SuperHero: ExileAbstractAction
			{
				title = "Wanna be a Super Hero?";
				//condition = "true";
				condition = (magazines player find 'Exile_Item_ToiletPaper' <= 1);
				//action = "[player] RemoteExec ['WMS_Fnc_RocketMan90']";
				action = "execVM 'Custom\Paradrop\RocketMan90.sqf'";
			};*/
			class AirStrikePhone: ExileAbstractAction
			{
				title = "Call Airstrike";
				//condition = "true";
				//condition =  "(magazines player find 'Exile_Item_MobilePhone' >= 0) && (magazines player find 'SmokeShellGreen' >= 0)";
				condition = (magazines player find 'Exile_Item_RubberDuck' >= 0);
				action = "execVM 'Custom\Paradrop\Buy_AirStrikeOnNPC.sqf'";
			};
			/*
			class Lucky: ExileAbstractAction
			{
				title = "I'm Feeling Lucky";
				//condition = "true";
				condition = (magazines player find 'Exile_Item_ToiletPaper' >= 0);
				action = "execVM 'Custom\Paradrop\ImFeelingLucky.sqf'";
			};
			*/
		};
	};
class Windsock_01_F
	{
		targetType = 2;
		target = "Windsock_01_F";

		class Actions
		{
			class JumpTargetWind: ExileAbstractAction
			{
				title = "Wind direction";
				condition = "true";
				//condition = (magazines player find 'SmokeShellGreen' <= 1);
				action = "SystemChat format [str (winddir)]";
			};
			class AirAssistJumpTarget: ExileAbstractAction
			{
				title = "Air Assistance";
				//condition = "true";
				condition = (magazines player find 'SmokeShellGreen' >= 0);
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
	
		};
	};
class Exile_Construction_Flag_static 
	{
		targetType = 2;
		target = "Exile_Construction_Flag_static";

		class Actions
		{/*
			class FlagPoleTime: ExileAbstractAction
			{
				title = "Time before restart";
				condition = "true";
				//condition = (magazines player find 'Exile_Item_MobilePhone' <= 1);
				action = "execVM 'Custom\Time\Timer.sqf'";
			};*/
			class FlagPoleWind: ExileAbstractAction
			{
				title = "Wind direction";
				condition = "true";
				//condition = (magazines player find 'Exile_Item_MobilePhone' <= 1);
				action = "SystemChat format [str (winddir)]";
			};
			class BaseAssistFlagPole: ExileAbstractAction
			{
				title = "Crafting Crate";
				//condition = "true";
				condition =  "(magazines player find 'Exile_Item_MobilePhone' >= 0) && (magazines player find 'SmokeShellGreen' >= 0)";
				action = "[player, 29999, 003, 'Crafting Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class BaseAssistFlagPoleWoodCrate: ExileAbstractAction
			{
				title = "Wood Supply Crate";
				//condition = "true";
				condition =  "(magazines player find 'Exile_Item_MobilePhone' >= 0) && (magazines player find 'SmokeShellGreen' >= 0)";
				action = "[player, 30999, 012, 'Wood Supply Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
				
		};
	};
	//UK3CB_BAF_Merlin_HM2_18
	//R3F_KAMAZ_CE_VPC

class rhs_gaz66_r142_vmf
	{
		targetType = 2;
		target = "rhs_gaz66_r142_vmf";

		class Actions
		{
			/*
			class R142Time: ExileAbstractAction
			{
				title = "Time before restart";
				condition = "true";
				action = "execVM 'Custom\Time\Timer.sqf'";
			};*/
			class R142Wind: ExileAbstractAction
			{
				title = "Wind direction";
				condition = "true";
				action = "SystemChat format [str (winddir)]";
			};
			class AirAssistR142: ExileAbstractAction
			{
				title = "Air Assistance";
				condition = "true";
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
			/*
			class TraderR142: ExileAbstractAction
			{
				title = "Acces to the Secret Trader";
				condition =  "(magazines player find 'Exile_Item_Magazine01' >= 0) && (magazines player find 'Exile_Item_Magazine02' >= 0) && (magazines player find 'Exile_Item_Magazine03' >= 0) && (magazines player find 'Exile_Item_Magazine04' >= 0)";
				//action = "player setpos [12702,10507.5,1178.54];";
				action = "player setpos [4197.4,3723.37,1219.28];";//Altis
			};*/
			class BaseAssistR142: ExileAbstractAction
			{
				title = "Crafting Box";
				condition = "true";
				action = "[player, 29999, 003, 'Crafting Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class AirStrikeR142: ExileAbstractAction
			{
				title = "Call Airstrike";
				condition = "true";
				action = "execVM 'Custom\Paradrop\Buy_AirStrikeOnNPC.sqf'";
			};
			class AdvancedBaseKitR142: ExileAbstractAction
			{
				title = "Advanced Territory Kit";
				condition = "true";
				action = "[player, 15999, 002, 'Advanced Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBaseKitR142: ExileAbstractAction
			{
				title = "Wood Territory Kit";
				condition = "true";
				action = "[player, 8999, 010, 'Wood Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBoxKitR142: ExileAbstractAction
			{
				title = "Wood Supply Box";
				condition = "true";
				action = "[player, 30999, 012, 'Wood Supply Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			/*
			class R142LeaveInfantryProgram: ExileAbstractAction
			{
				title = "Leave Prog until restart";
				condition =  ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "WMS_InfantryProgram_list deleteAt (WMS_InfantryProgram_list find (getplayerUID player)); publicVariable 'WMS_InfantryProgram_list'; systemchat 'Removed From Infantry Program'";
			};
			*/
			class MerlinJOINInfantryProgram: ExileAbstractAction
			{
				title = "Join The Program";
				condition =  ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "WMS_IP_Active_list pushBack (getplayerUID player); publicVariable 'WMS_IP_Active_list'; systemchat 'Welcome Back Soldier, remember to not get in vehicles'";
			};
	
		};
	};

	//UK3CB_BAF_Merlin_HM2_18
	//R3F_KAMAZ_CE_VPC
class UK3CB_BAF_Merlin_HM2_18
	{
		targetType = 2;
		target = "UK3CB_BAF_Merlin_HM2_18";

		class Actions
		{
			class MerlinHack: ExileAbstractAction
			{
				title = "Steal this chopper";
				condition = "true";
				action = "removeAllItems player; removeAllWeapons player; removeHeadgear player; removeBackpack player; removeVest player; removeUniform player; removeGoggles player; player addUniform 'U_C_Soldier_VR';";
			};/*
			class MerlinTime: ExileAbstractAction
			{
				title = "Time before restart";
				condition = "true";
				action = "execVM 'Custom\Time\Timer.sqf'";
			};*/
			class MerlinWind: ExileAbstractAction
			{
				title = "Wind direction";
				condition = "true";
				action = "SystemChat format [str (winddir)]";
			};
			class AirAssistMerlin: ExileAbstractAction
			{
				title = "Air Assistance";
				condition = "true";
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
			class BaseAssistMerlin: ExileAbstractAction
			{
				title = "Crafting Box";
				condition = "true";
				action = "[player, 29999, 003, 'Crafting Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class AirStrikeMerlin: ExileAbstractAction
			{
				title = "Call Airstrike";
				condition = "true";
				action = "execVM 'Custom\Paradrop\Buy_AirStrikeOnNPC.sqf'";
			};
			class AdvancedBaseKitMerlin: ExileAbstractAction
			{
				title = "Advanced Territory Kit";
				condition = "true";
				action = "[player, 15999, 002, 'Advanced Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBaseKitMerlin: ExileAbstractAction
			{
				title = "Wood Territory Kit";
				condition = "true";
				action = "[player, 8999, 010, 'Wood Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBoxKitMerlin: ExileAbstractAction
			{
				title = "Wood Supply Box";
				condition = "true";
				action = "[player, 30999, 012, 'Wood Supply Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class MerlinJOINInfantryProgram: ExileAbstractAction
			{
				title = "Join The Program";
				condition =  ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "WMS_IP_Active_list pushBack (getplayerUID player); publicVariable 'WMS_IP_Active_list'; systemchat 'Welcome Back Soldier, remember to not get in vehicles'";
			};
	
		};
	};
class R3F_KAMAZ_CE_VPC
	{
		targetType = 2;
		target = "R3F_KAMAZ_CE_VPC";

		class Actions
		{/*
			class KAMAZTime: ExileAbstractAction
			{
				title = "Time before restart";
				condition = "true";
				action = "execVM 'Custom\Time\Timer.sqf'";
			};*/
			class KAMAZWind: ExileAbstractAction
			{
				title = "Wind direction";
				condition = "true";
				action = "SystemChat format [str (winddir)]";
			};
			class AirAssistKAMAZ: ExileAbstractAction
			{
				title = "Air Assistance";
				condition = "true";
				action = "execVM 'Custom\Paradrop\SelectRandomAirAssist.sqf'";
			};
			class BaseAssistKAMAZ: ExileAbstractAction
			{
				title = "Crafting Box";
				condition = "true";
				action = "[player, 29999, 003, 'Crafting Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class AirStrikeKAMAZ: ExileAbstractAction
			{
				title = "Call Airstrike";
				condition = "true";
				action = "execVM 'Custom\Paradrop\Buy_AirStrikeOnNPC.sqf'";
			};
			class AdvancedBaseKitKAMAZ: ExileAbstractAction
			{
				title = "Advanced Territory Kit";
				condition = "true";
				action = "[player, 15999, 002, 'Advanced Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBaseKitKAMAZ: ExileAbstractAction
			{
				title = "Wood Territory Kit";
				condition = "true";
				action = "[player, 8999, 010, 'Wood Territory Kit'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class WoodBoxKitKAMAZ: ExileAbstractAction
			{
				title = "Wood Supply Box";
				condition = "true";
				action = "[player, 30999, 012, 'Wood Supply Box'] execVM 'Custom\Paradrop\Buy_Paradrop_Unified.sqf'"; //Paradrop unified need a rework
			};
			class KamazJOINInfantryProgram: ExileAbstractAction
			{
				title = "Join The Program";
				condition =  ((getplayerUID player) in WMS_InfantryProgram_list);
				action = "WMS_IP_Active_list pushBack (getplayerUID player); publicVariable 'WMS_IP_Active_list'; systemchat 'Welcome Back Soldier, remember to not get in vehicles'";
			};
	
		};
	};