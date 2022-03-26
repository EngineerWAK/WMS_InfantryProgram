////////// Infantry Program local variables //////////
//[] execVM "InfantryProgram\InfantryProgram_LocVar.sqf";

WMS_Loc_InfProg_Arty_Last = time;
WMS_Loc_InfProg_Arty_CoolDown = (1200+(round 300));

WMS_Loc_InfProg_C130_Last = time;
WMS_Loc_InfProg_C130_CoolDown = (300+(round 300));

WMS_Loc_InfProg_WDtrader_Last = time;
WMS_Loc_InfProg_WDtrader_CoolDown = (700+(round 300));

WMS_Loc_InfProg_InfSquad_Last = time;
WMS_Loc_InfProg_InfSquad_CoolDown = (900+(round 400));

WMS_Loc_InfProg_Extraction_Last = time;
WMS_Loc_InfProg_Extraction_CoolDown = (750+(round 300));

WMS_Loc_InfProg_Supply_Last = time;
WMS_Loc_InfProg_Supply_CoolDown = (60+(round 60));

WMS_Loc_InfProg_GNDextraction_Last = time;
WMS_Loc_InfProg_GNDextraction_CoolDown = (600+(round 300));