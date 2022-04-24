class CfgRemoteExec
{
	class Functions
	{
		mode = 1; //0: no remoteExec, 1: white liste, 2: all autorized
		jip = 0;

		class WMS_fnc_setVarOnPlayerRespawn	{ allowedTargets=2; };
		class WMS_fnc_spawnLootManager { allowedTargets=2; };
		class WMS_fnc_processCargoDump { allowedTargets=2; };
		class WMS_fnc_buyAction { allowedTargets=2; };
		class WMS_fnc_getCompatWeaponItems { allowedTargets=2; };
		class WMS_fnc_createPermanentVHL { allowedTargets=2; };
		class WMS_fnc_updatePermanentVHL { allowedTargets=2; };
		class WMS_fnc_initVehicleAddAction { allowedTargets=2; };
		class WMS_fnc_ConfLockUnlock { allowedTargets=2; };
		class WMS_fnc_initTraderActions_vehicles { allowedTargets=2; };
		class WMS_fnc_buyFromTrader { allowedTargets=2; };
		class WMS_fnc_buyAmmoOnBox { allowedTargets=2; };
		class WMS_fnc_sellVehicles { allowedTargets=2; };
		class WMS_fnc_CreateTerritory { allowedTargets=2; };
		class WMS_fnc_buyfromoffice { allowedTargets=2; };
		class WMS_fnc_rotateBaseObjects { allowedTargets=2; };
		class WMS_fnc_initBaseRotationEngine { allowedTargets=2; };
		class WMS_fnc_smallTransactions { allowedTargets=2; };
		class WMS_fnc_territoryUpgrade { allowedTargets=2; };
		class WMS_fnc_territoryLayoutActions { allowedTargets=2; };
		class WMS_fnc_territoryLayoutUpgrade { allowedTargets=2; };
		class WMS_fnc_territoryDelete { allowedTargets=2; };
		class WMS_fnc_territoryUpdate { allowedTargets=2; };
		class WMS_fnc_EmergencySupply { allowedTargets=2; };
		class WMS_fnc_claimReward { allowedTargets=2; };
		class WMS_fnc_getOwnedPermanentVhls	{ allowedTargets=2; };
		class WMS_fnc_client_markerOnPersonalVhls	{ allowedTargets=0; };
		class WMS_fnc_HatchetCover { allowedTargets=0; };
		class WMS_fnc_HatchetUnCover { allowedTargets=0; };
		class WMS_fnc_weaponStationInitiate { allowedTargets=2; };
		class WMS_fnc_BaseSafetyPerimeter { allowedTargets=2; };

		class WMS_fnc_Event_HVT		   				{ allowedTargets=2; };
		class WMS_fnc_Event_DFO		   				{ allowedTargets=2; };
		
		class WMS_fnc_HideObjectGlobal				{ allowedTargets=2; };//InfantryProgram crates //EXILE
		class WMS_fnc_Compo_BunkerCamp 				{ allowedTargets=2; }; //EXILE
		class WMS_fnc_Pull_BUY_Push					{ allowedTargets=2; }; //EXILE
		class WMS_fnc_getuid_remote					{ allowedTargets=2; }; //EXILE //DELETED!!!
		class WMS_fnc_InfantryProgram_loadouts 		{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_INFbyChopper 	{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_buy 			{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_Weapons 		{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_C130		    { allowedTargets=2; }; //EXILE
		class WMS_fnc_infantryProgram_extraction	{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_ArtySupport	{ allowedTargets=2; }; //EXILE
		class WMS_fnc_infantryProgram_GNDextraction	{ allowedTargets=2; }; //EXILE
		class WMS_fnc_infantryProgram_BlackFish		{ allowedTargets=2; }; //EXILE
		class WMS_fnc_InfantryProgram_buy			{ allowedTargets=2; }; //EXILE
		
		//class WMS_fnc_DynAI_RwdMsgOnKill			{ allowedTargets=2; }; //filter for HC1 remoteExec EHrewards
		//class WMS_fnc_AMS_EHonKilled				{ allowedTargets=2; }; //filter for HC1 remoteExec EHrewards
		//class WMS_fnc_AI_rewardOnVHLdestroy		{ allowedTargets=2; }; //Deactivated to prevent double EH, client AND server side
		//class WMS_fnc_playerKilled { allowedTargets=2; }; //deactivated to prevent double death (local PLUS server side)
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};