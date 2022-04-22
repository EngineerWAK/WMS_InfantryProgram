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
/*
WMS_DynamicFlightOps	= false; //NOT READY YET
WMS_DFO_Standalone		= false;
WMS_DFO_CancelOnKIA		= false;
WMS_DFO_Reinforcement	= false;
WMS_DFO_createChopper	= false;
WMS_DFO_MaxRunning		= 3;
WMS_DFO_Timer			= 900; 
WMS_DFO_MinDist			= 5000;
WMS_DFO_reinfTriggDist	= 1000;
WMS_DFO_cargoType		= ["CrateClassName"];
WMS_DFO_MissionTypes	= ["inftransport","cargotransport","airassault","casinf","casarmored","cascombined","sar","csar","maritime"];// Troop transport, Cargo transport, Air Assault, CAS (Infantry, Armoured, combined), SAR, CSAR, Maritime
WMS_DFO_Choppers		= [[],[],[],[]]; //[["pylons","pylons"],["doorGunners","doorGunners"],["transport","transport"],["medevac","medevac"]];
WMS_DFO_Markers			= []; //["mission","RTB"];
WMS_DFO_Reward			= [500,2000]; //["rep","money"]
WMS_DFO_Running			= []; //KEEP EMPTY //[["TimeToDelete","DFO","MissionHexaID",_playerObject]]
*/

private ["_grps","_vhls","_objs","_mkrs","_launch","_pos","_posType","_createCIVinf","_createOPFORinf","_createCIVvhl","_createOPFORvhl","_hexaBase","_hexaArray","_MissionHexaID"];
params [
	"_playerObject", //event manager won't spawn a mission but acrivate the menu for player to call a mission
	["_mission", (selectRandom WMS_DFO_MissionTypes)]
];
_grps = [];
_vhls = [];
_objs = [];
_mkrs = [];
_pos = [];
_posType = "random"; //"random","forest","sea","buildings","military"
_reinforce = WMS_DFO_Reinforcement;
_createCIVinf = false; //soldiers will be civilian as well for now, they are neutral
_createOPFORinf = false;
_createCIVvhl = false;
_createOPFORvhl = false;
_launch = false;
_MissionHexaID = "";

if (WMS_DFO_Standalone) then { 
	WMS_DFO_Standalone = false; //Standalone not ready yet
	//WMS_Events_Running = [];
}else {

};
//generate Mission Hexa ID
_hexaBase = [0,1,2,3,4,5,6,7,8,9,"a","b","c","e","e","f"];
_hexaArray = [];
for "_i" from 1 to 8 do {
	_hexaArray pushBack	(selectRandom _hexaBase);
};
_MissionHexaID = format ["%1%2%3%4%5%6%7%8",(_hexaArray select 0),(_hexaArray select 1),(_hexaArray select 2),(_hexaArray select 3),(_hexaArray select 4),(_hexaArray select 5),(_hexaArray select 6),(_hexaArray select 7)];

//setParameters depending the mission:
switch (_mission) do {
	case "inftransport" : {};
	case "cargotransport" : {};
	case "airassault" : {};
	case "casinf" : {};
	case "casarmored" : {};
	case "cascombined" : {};
	case "sar" : {};
	case "csar" : {};
	case "maritime" : {}; //this one will definitly need way more work
};
//select mission position(s)
	//no player around
	//can be random
	//can be from one of the already registered zone like WMS_Pos_Villages or WMS_Pos_Forests or all mixed

//create mission/LZ marker
	//WMS_DFO_Markers select 0;

//create mission vehicles

//create mission NPCs
	//CIV
	//OPFOR

//create mission zone trigger

//create reinforcement trigger
if (WMS_DFO_Reinforcement && _reinforce) then {};


WMS_Events_Running pushBack [time,time+WMS_DFO_Timer,_grps,_vhls,_objs,_mkrs,[],"DFO",_MissionHexaID];
/*
//WMS_DFO_functions.sqf: //ExecVM at server start if WMS_DynamicFlightOps
WMS_fnc_DFO_nextStepMkrTrigg = {
	//need to auto-delete at succes/fail
	//WMS_DFO_Markers select 1;
};
WMS_fnc_DFO_infLoad = {};
WMS_fnc_DFO_infUnLoad = {};
*/