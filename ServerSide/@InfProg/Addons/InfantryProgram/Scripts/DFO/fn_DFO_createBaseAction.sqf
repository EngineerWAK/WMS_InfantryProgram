/**
* WMS_fnc_DFO_createBaseAction - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_createBaseAction = {
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_createBaseAction _this %1', _this]};
	
	WMS_DFO_BasePositions = missionNameSpace getVariable ["WMS_DFO_BasePositions", []];
	WMS_DFO_ObjToAddAction = missionNameSpace getVariable ["WMS_DFO_ObjToAddAction", []];
	
	//private _ObjToAddAction = missionNameSpace getVariable ["WMS_DFO_ObjToAddAction", []]; //objects from mission.sqm will push themself there
	//Standalone will need to create an object to add the action where to call a mission
	if (count WMS_DFO_ObjToAddAction == 0) then { 
		//bad Idea but why not. The object should be placed in the mission editor or anytime before calling this function
		//no object to call the mission from, create the Object/Unit at a random position
		private _defaultPos = [[worldSize,worldSize,0], 0, worldSize, 22, 0, 0.10, 0, [], [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
		[_defaultPos,"FULL"] call WMS_fnc_DFO_BuildBase;
		_mkrName = format ["DFO_mkrBase_%1",time];
		_MkrLZ = createMarker [_mkrName, _defaultPos];
		_MkrLZ setMarkerType "b_hq";
		_MkrLZ setMarkerText "DFO";
	};
	{
		[_x]call WMS_fnc_DFO_addAction;
	}forEach WMS_DFO_ObjToAddAction;
	
	{if ("Advanced Combat Environment" in (_x select 0))then {WMS_DFO_AceIsRunning = true;}}forEach getLoadedModsInfo;

	if(WMS_DFO_UseJVMF) then {
		private _payload = "";
		private _payload2 = "";
		private _BasePositions = [];
		private _MissionTypes = "";
		if("inftransport" in (WMS_DFO_MissionTypes select 2) || "cargotransport" in (WMS_DFO_MissionTypes select 2)) then {_MissionTypes = _MissionTypes +"Transport, "};
		if("airassault" in (WMS_DFO_MissionTypes select 2)) then {_MissionTypes = _MissionTypes +"Air Assault, "};
		if("casinf" in (WMS_DFO_MissionTypes select 2) || "casarmored" in (WMS_DFO_MissionTypes select 2) || "cascombined" in (WMS_DFO_MissionTypes select 2)) then {_MissionTypes = _MissionTypes +"CAS, "};
		if("sar" in (WMS_DFO_MissionTypes select 2) || "csar" in (WMS_DFO_MissionTypes select 2)) then {_MissionTypes = _MissionTypes +"Search & Rescue"};
		if ((count WMS_DFO_BasePositions) == 0)then{
			_payload = "No DFO Bases positions registered yet";
			_payload2 = "DFO Bases are usualy around AirField (Traders)";
		}else{
			if (count WMS_DFO_BasePositions > 2) then { //JVMF 50 characteres limit per ligne
				_BasePositions = [WMS_DFO_BasePositions select 0, WMS_DFO_BasePositions select 1];
			}else {
				_BasePositions = WMS_DFO_BasePositions;
			};
			_payload = "DFO Bases Known positions (first two):";
			_payload2 = format ["%1",_BasePositions];
		};
		[
      		"WELCOME", // TITLE
       		"DFO HQ", // SENDER
       		"ALL", // RECIPIENTS
      		0, //MSG TYPE
      		[
          		"Dynamic Flight Ops is now Activated",
           		"Go to DFO base(s) to request a mission",
				_payload,
           		_payload2,
           		"Available Missions:",
           		_MissionTypes,
				"",
				"",
				"",
				""
       		], //MSG TEXT //MUST BE AT LEAST 10 LINES
       		[_BasePositions select 0], // MSG DATA //[]
       		[
            	[
                	format ["%1:%2",(date select 3),(date select 4)],
                	"DFO HQ",
                	"SENT"
            	]
        	] // REPLIES
   		] call WMS_fnc_DFO_JVMF;
	};
	publicVariable "WMS_DFO_ObjToAddAction";
	publicVariable "WMS_DFO_BasePositions";
	publicVariable "WMS_DFO_AceIsRunning";

	if (WMS_DFO_Standalone) then {
		//Cleanup loop
		while {true} do {
			{
				if (((_x select 7) == "DFO")) then { //if it's not "DFO", it's really fuckedUp
					_x call WMS_fnc_DFO_Cleanup;
				};
			}forEach WMS_DFO_Running;
			{
				if ((_x select 7) == "REINF" && {time > (_x select 1)}) then { //do not call the reinforcement cleanup if time has not come
					_x call WMS_fnc_DFO_RinforceCleanup; //["HexaID", time to delete, [_grps], [_vhls], [_objects],"","","REINF"]
				};
			}forEach WMS_DFO_RunReinforce;
			/*{
				if (time >( _x select 0)) then {
					{deleteVehicle _x}forEach _x select 1;
				};
			}forEach WMS_DFO_ToDelete;*/
			uisleep 60;
		};
	};
//};