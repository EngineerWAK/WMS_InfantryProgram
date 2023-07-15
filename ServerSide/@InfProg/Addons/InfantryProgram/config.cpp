class CfgPatches {
	class WMS_InfantryProgram {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class WMS {
		class main {
			file = "InfantryProgram\init";
			class init {
				postInit = 1;
			};
		};
		class myCategory_DFO
		{
			file = "InfantryProgram\scripts\DFO";
			class DFO_killStats {};
			class DFO_ConvertTypeToCoord {};
			class DFO_createBaseAction {};
			class DFO_BuildBase {};
			class DFO_addAction {};
			class DFO_CreateVhls {};
			class DFO_Event {};
			class DFO_RespawnMissionChopper {};
			class DFO_CreateMkr {};
			class DFO_CreateTrigger {};
			class DFO_NextStepMkrTrigg {};
			class DFO_Reinforce {};
			class DFO_MissionSucces {};
			class DFO_PunishPunks {};
			class DFO_JVMF {};
			class DFO_injuriedGroup {}; 
			class DFO_SetUnits {}; 
			class DFO_UnitEH {};
			class DFO_infLoad {}; 
			class DFO_infUnLoad {};
			class DFO_RinforceCleanup {};
			class DFO_Cleanup {};
		};
		class compiles
		{
			file = "InfantryProgram\scripts";
			
			
			class Halo_300					{};
			class Set_on_fire 				{};
			class lvl2_cleanUp	            {}; //Old InfantryProgram cleanup, should update this crap...
			class AirStrikeOnNPC			{};
			class Pull_BUY_Push				{};
			class HideObjectGlobal			{};
			class getuid_remote				{}; //EXILE //used for custom respawn I think
			class Paradrop_RLA_unified		{};
			class findClst_NamedLocation	{}; //should be used in Cities Occupation

			//Unifying stuff:
			class BIS_FindSafePosModified	{}; //no more position outside of the map
			class GenerateHexaID			{};
			class ScanForWater				{};
			class CollectPos				{};
			class SetUnits					{};
			class FindRoad					{};
			class SetPatrol					{};
			//not yet done:
			class CreateUnits			{};
			class CreateVehicle			{};
			////////////////

			class Event_SupplyDrop			{};
			class Event_HumaniDrop			{};
			class Event_CaptureZone			{};
			class Event_ReconMission		{};
			class Event_HVT					{};

			class sys_FastNights 			{};
			class sys_roamingVHLspawn 		{};
			class sys_ServerMarkersUpdate 	{};
			class sys_ServerRestart 		{};
			class sys_Init_Watchs 			{};

			class Watch_AMS 		{};
			class Watch_DynAI 		{};
			class Watch_Events 		{};
			class Watch_Players 	{};
			class Watch_RoamingINF 	{};
			class Watch_RoamingVhl 	{};
			class Watch_Triggers 	{};

			class InfantryProgram_C130			{};
			class InfantryProgram_Loadouts		{};
			class InfantryProgram_Weapons		{};
			class InfantryProgram_SupplyDrop	{};
			class infantryProgram_extraction	{};
			class InfantryProgram_INFbyChopper	{};
			class InfantryProgram_WDtrader		{};
			class InfantryProgram_ArtySupport	{};
			class InfantryProgram_GNDextraction	{};
			class InfantryProgram_BlackFish		{};
			class InfantryProgram_INFpatrol		{};
			class InfantryProgram_INFsquad		{}; //NEED TO CHANGE THIS ONE
			class InfantryProgram_ParadropAIgroup	{};
			class infantryProgram_VHLpatrol		{};
			class InfantryProgram_Buy			{};
			
			class Compo_BunkerCamp	{};
			class Compo_R2D2Camp	{};
			class Compo_TankCamp	{};
			class Compo_RepairCamp	{};
			class Compo_HeliCrash	{};
			class Compo_RoadBlock	{};
			
			class DynAI_SelScen			{};
				//class DynAI_SetUnitOPF		{};
				//class DynAI_SetUnitBLU		{};
			class DynAI_Escarmouche		{};
			class DynAI_BBQcamp			{};
			class DynAI_Runner			{};
			class DynAI_BuildingGuards	{};
			class DynAI_Bombing			{};
			class DynAI_Arty			{};
			class DynAI_RainObjects		{};
			class DynAI_SpawnCrate		{};
			class DynAI_AirAssault		{};
			class DynAI_Steal			{};
			class DynAI_RwdMsgOnKill	{};
			class DynAI_baseATK			{};
			class DynAI_ParaBombs		{};

			class AMS_CBAgarrissonModified	{};

			class AMS_CreateMarker		{};
			class AMS_FillStuff			{};
			class AMS_SpawnGroups		{};
			class AMS_SpawnMineField	{};
			class AMS_SpawnObjects		{};
			class AMS_SpnAiBlkListFull	{};
			class AMS_TimedOut			{};
			class AMS_Succes			{};
			class AMS_SpawnMission		{};
			class AMS_ClstPlayer		{};
			class AMS_SpawnRewards		{};
			class AMS_SpawnAiVHL		{};
			class AMS_CreateReward		{};
			class AMS_ConvertSkills		{};
				//class AMS_SetUnits			{};
			class AMS_EHonKilled		{};
			class AMS_Reinforce			{};
			class AMS_ChkSafeToSpawn	{};
			class AMS_ChkSpawnAngleShift	{};
			class AMS_AdjustOnLeaderKia {};
			class AMS_callBackAIgroups {};

			class AMS_Annihilator		{};

			class AMS_Mission_MissionTest1	{};
			class AMS_Mission_MissionTest2	{};
			class AMS_Mission_ForestCamp	{};
			class AMS_Mission_HomeDepot		{};
			class AMS_Mission_CombatPatrol	{};
			class AMS_Mission_EnyBunkers	{};
			class AMS_Mission_Arbeit		{};
			class AMS_Mission_Unified_A		{};
			class AMS_Mission_Unified_B		{};
			class AMS_Mission_Unified_C		{};
			class AMS_Mission_Unified_D		{};
			class AMS_Mission_Unified_E		{};
			class AI_rewardOnVHLdestroy		{};

			class AllDeadsMgr		{};
			class JudgementDay		{};
			class PunishPunks		{};

			class waypoints_Patrol 	{};
			class ServerProfileNameSpace  	{};
			class transitKillStats  	{};
		};
	};
};