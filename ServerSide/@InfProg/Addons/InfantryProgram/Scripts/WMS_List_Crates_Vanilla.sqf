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
/////////////////////////////////
//			CRATES ITEMS
/////////////////////////////////
WMS_SupplyList = [
	"ACE_Track", // 	Spare Track 	thingX
	"ACE_Wheel", // 	Spare Wheel 	thingX
	"ACE_Sandbag_empty" // 	Sandbag (empty) 	ACE_ItemCore
];
WMS_ToolList = [
	"ACE_EntrenchingTool",
	"ACE_wirecutter",
	"ACE_CableTie",
	"ACE_Banana",
	"ACE_MapTools",
	"ACE_RangeCard"
];
WMS_MeatList = [ //waiting for food classename
	"ACE_Can_Franta",
	"ACE_Can_RedGull",
	"ACE_Can_Spirit",
	"ACE_Canteen",
	"ACE_Canteen_Empty",
	"ACE_Canteen_Half",
	"ACE_WaterBottle",
	"ACE_WaterBottle_Empty",
	"ACE_WaterBottle_Half",

	"ACE_Humanitarian_Ration",
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables"
];
WMS_medsList = [
	"ACE_splint",
	"ACE_adenosine",
	"ACE_atropine", // 	Atropin auto injector 	ACE_ItemCore
	"ACE_fieldDressing", // 	Bandage (Basic) 	ACE_ItemCore
	"ACE_elasticBandage", // 	Bandage (Elastic) 	ACE_ItemCore
	"ACE_quikclot", // 	Basic Field Dressing (QuikClot) 	ACE_ItemCore
	"ACE_bloodIV", // 	Blood IV (1000ml) 	ACE_ItemCore
	"ACE_bloodIV_500", // 	Blood IV (500ml) 	ACE_ItemCore
	"ACE_bloodIV_250", // 	Blood IV (250ml) 	ACE_ItemCore
	"ACE_bodyBag", // 	Bodybag 	ACE_ItemCore	 
	"ACE_epinephrine",//	Epinephrine auto injector 	ACE_ItemCore
	"ACE_morphine",// 	Morphine auto injector 	ACE_ItemCore
	"ACE_packingBandage",// 	Packing Bandage 	ACE_ItemCore
	"ACE_personalAidKit",// 	Personal Aid Kit 	ACE_ItemCore
	"ACE_plasmaIV",// 	Plasma IV (1000ml) 	ACE_ItemCore
	"ACE_plasmaIV_500",// 	Plasma IV (500ml) 	ACE_ItemCore
	"ACE_plasmaIV_250",// 	Plasma IV (250ml) 	ACE_ItemCore
	"ACE_salineIV",// 	Saline IV (1000ml) 	ACE_ItemCore
	"ACE_salineIV_500",// 	Saline IV (500ml) 	ACE_ItemCore
	"ACE_salineIV_250",// 	Saline IV (250ml) 	ACE_ItemCore
	"ACE_surgicalKit", // 	Surgical Kit 	ACE_ItemCore
	"ACE_tourniquet" // 	Tourniquet (CAT) 	ACE_ItemCore
];
/////
WMS_IP_ToolKit = [ //"rhs_radio_R187P1"
	["rhs_radio_R187P1",1,1],
	["ACE_fieldDressing",5,5],
	["ACE_bloodIV_250",4,2],
	["ACE_morphine",2,5],
	["ACE_MapTools",1,0],
	["ACE_RangeCard",1,0],
	["ACE_DAGR",1,0],
	["ACE_EarPlugs",1,0],
	["ACE_SpottingScope",1,0],
	["ACE_NVG_Wide",1,0],
	["ACE_Cellphone",1,1], 
	["ACE_EntrenchingTool",1,0],  
	["ACE_M14",1,5],   
	["ACE_HuntIR_monitor",1,0],   
	["ACE_HuntIR_M203",1,10]
];
WMS_medicList = [
	["ACE_splint",2,5],
	["ACE_adenosine",2,2],
	["ACE_atropine",2,2], // 	Atropin auto injector 	ACE_ItemCore
	["ACE_fieldDressing",5,5], // 	Bandage (Basic) 	ACE_ItemCore
	["ACE_elasticBandage",5,5], // 	Bandage (Elastic) 	ACE_ItemCore
	["ACE_quikclot",5,5], // 	Basic Field Dressing (QuikClot) 	ACE_ItemCore
	["ACE_bloodIV",1,2], // 	Blood IV (1000ml) 	ACE_ItemCore
	["ACE_bloodIV_500",1,5], // 	Blood IV (500ml) 	ACE_ItemCore
	["ACE_bloodIV_250",4,2], // 	Blood IV (250ml) 	ACE_ItemCore
	["ACE_bodyBag",1,2], // 	Bodybag 	ACE_ItemCore
	//["ACE_bodyBagObject",5,5], // 	Bodybag (packed) 	 
	["ACE_epinephrine",1,2], // 	Epinephrine auto injector 	ACE_ItemCore
	["ACE_morphine",2,5], // 	Morphine auto injector 	ACE_ItemCore
	["ACE_packingBandage",5,5], // 	Packing Bandage 	ACE_ItemCore
	["ACE_personalAidKit",1,1], // 	Personal Aid Kit 	ACE_ItemCore
	["ACE_plasmaIV",1,2], // 	Plasma IV (1000ml) 	ACE_ItemCore
	["ACE_plasmaIV_500",2,5], // 	Plasma IV (500ml) 	ACE_ItemCore
	["ACE_plasmaIV_250",4,2], // 	Plasma IV (250ml) 	ACE_ItemCore
	["ACE_salineIV",1,2], // 	Saline IV (1000ml) 	ACE_ItemCore
	["ACE_salineIV_500",2,5], // 	Saline IV (500ml) 	ACE_ItemCore
	["ACE_salineIV_250",5,5], // 	Saline IV (250ml) 	ACE_ItemCore
	["ACE_surgicalKit",4,2], // 	Surgical Kit 	ACE_ItemCore
	["ACE_tourniquet",2,3] // 	Tourniquet (CAT) 	ACE_ItemCore
];
WMS_foodList = [//waiting for food classename
	["ACE_Can_Franta",1,4],
	["ACE_Can_RedGull",1,4],
	["ACE_Can_Spirit",1,4],
	["ACE_Canteen",1,4],
	["ACE_Canteen_Empty",1,4],
	["ACE_Canteen_Half",1,4],
	["ACE_WaterBottle",1,4],
	["ACE_WaterBottle_Empty",1,4],
	["ACE_WaterBottle_Half",1,4],

	["ACE_Humanitarian_Ration",1,4],
	["ACE_MRE_BeefStew",1,4],
	["ACE_MRE_ChickenTikkaMasala",1,4],
	["ACE_MRE_ChickenHerbDumplings",1,4],
	["ACE_MRE_CreamChickenSoup",1,4],
	["ACE_MRE_CreamTomatoSoup",1,4],
	["ACE_MRE_LambCurry",1,4],
	["ACE_MRE_MeatballsPasta",1,4],
	["ACE_MRE_SteakVegetables",1,4],
	["ACE_Banana",1,4],
	["ACE_Banana",1,2]
];
WMS_miscList = [
	["Laserbatteries",2,3],
	["ACE_Track",0,1],
	["ACE_Wheel",1,3],
	["ACE_Sandbag_empty",5,5],
	["ACE_CableTie",0,2],
	["ACE_MapTools",1,0],
	["ACE_RangeCard",1,5],
	["ACE_Banana",0,1],
	["ACE_EarPlugs",5,5],
	["SmokeShellGreen",1,5]
];
WMS_weapsList = [
	["hgun_P07_F",1,0],
	["hgun_Pistol_Signal_F",0,1],
	["arifle_MXC_Black_F",0,1]
];
WMS_humaniDropList = [
	["ACE_Sandbag_empty",5,5],
	["ACE_Humanitarian_Ration",5,5],
	["ACE_WaterBottle",10,5],
	["ACE_fieldDressing",5,5],
	["ACE_elasticBandage",5,10],
	["ACE_quikclot",10,10],
	["ACE_bloodIV",2,5], // 	Blood IV (1000ml) 	ACE_ItemCore
	["ACE_bloodIV_500",3,5], // 	Blood IV (500ml) 	ACE_ItemCore
	["ACE_bloodIV_250",5,5], // 	Blood IV (250ml) 	ACE_ItemCore
	["ACE_salineIV",2,5], // 	Saline IV (1000ml) 	ACE_ItemCore
	["ACE_salineIV_500",3,5], // 	Saline IV (500ml) 	ACE_ItemCore
	["ACE_salineIV_250",5,5], // 	Saline IV (250ml) 	ACE_ItemCore
	["ACE_bodyBag",3,5]
];
