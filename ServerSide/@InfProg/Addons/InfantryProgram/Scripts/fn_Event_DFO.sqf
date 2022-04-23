/**
* WMS_fn_Event_DFO - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
MISSIONS:
"inftransport",
	Base to LZ or LZ to base or LZ1 to LZ2, class civilian so won't messup with other NPCs
	Short distance trigger at LZ trigger the load/unload/RTB/Next LZ
"cargotransport",
	Base to LZ or LZ to base or LZ1 to LZ2
	Short distance trigger at LZ trigger the load/unload/RTB/Next LZ
"airassault",
	Base to "LZ", LZ probably city or airport
	Maybe capture zone with timer or find target (OPFOR) in building
"casinf",
"casarmored",
"cascombined",
"sar",
	crashed infantry/armed infantry class civilian
	can use WMS_Pos_Forests
"csar",
	crashed infantry/armed infantry class civilian
	OPFOR Units
	Reinfocement
"maritime":
	"airassault",
		Base to ship or oil rig
		Maybe capture zone with timer or find target (OPFOR) in building
	"sar",
		crashed infantry/armed infantry class civilian
	"csar",
		crashed infantry/armed infantry class civilian
		OPFOR divers/boat
*/
//NOT USED ANYMORE, SEE WMS_DFO_FUNCTIONS.SQF