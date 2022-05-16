/**
 * initPlayerLocal.sqf
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 ///////////////////////////
 //Call mission From chopper
 ///////////////////////////
 WMS_DFO_AceIsRunning = false;
{if ("Advanced Combat Environment" in (_x select 0))then {WMS_DFO_AceIsRunning = true;}}forEach getLoadedModsInfo;
if (WMS_DFO_AceIsRunning)then{
	//ACE SELF ACTION
	///Random mission:
	private _actionDFO = ["RequestDFOmission","Request Random DFO Mission","",{
		if (WMS_DFO_UsePilotsList)then{
			if((getPlayerUID player) in WMS_DFO_PilotsList)then{
				[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			}else{
				hint 'DFO only for selected pilots, contact admins';
			};
		}else{
			[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
			hint 'Contacting Air Operations HQ';
		};
	},{
		(alive player) &&
		//{(getPlayerUID player) in WMS_DFO_PilotsList} && //remove this if you don't use pilot list
		{vehicle player isKindOf "helicopter"} &&
		{count WMS_DFO_BasePositions != 0} &&
		{count WMS_DFO_ObjToAddAction != 0} &&
		{(count WMS_DFO_Running) < WMS_DFO_MaxRunning} &&
		{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)}
		}
	] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _actionDFO] call ace_interact_menu_fnc_addActionToObject;
	///Chill mission:
	private _actionDFO1 = ["RequestDFOmissionL","Request Logistic/Rescue Mission","",{
		if (WMS_DFO_UsePilotsList)then{
			if((getPlayerUID player) in WMS_DFO_PilotsList)then{
				[player,selectRandom WMS_DFO_ObjToAddAction,selectRandom (WMS_DFO_MissionTypes select 0)] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			}else{
				hint 'DFO only for selected pilots, contact admins';
			};
		}else{
			[player,selectRandom WMS_DFO_ObjToAddAction,selectRandom (WMS_DFO_MissionTypes select 0)] remoteExec ['WMS_fnc_Event_DFO', 2];
			hint 'Contacting Air Operations HQ';
		};
	},{
		(alive player) &&
		//{(getPlayerUID player) in WMS_DFO_PilotsList} && //remove this if you don't use pilot list
		{vehicle player isKindOf "helicopter"} &&
		{count WMS_DFO_BasePositions != 0} &&
		{count WMS_DFO_ObjToAddAction != 0} &&
		{(count WMS_DFO_Running) < WMS_DFO_MaxRunning} &&
		{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)}
		}
	] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _actionDFO1] call ace_interact_menu_fnc_addActionToObject;
	///Combat mission:
	private _actionDFO2 = ["RequestDFOmissionC","Request Combat Mission","",{
		if (WMS_DFO_UsePilotsList)then{
			if((getPlayerUID player) in WMS_DFO_PilotsList)then{
				[player,selectRandom WMS_DFO_ObjToAddAction,selectRandom (WMS_DFO_MissionTypes select 1)] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			}else{
				hint 'DFO only for selected pilots, contact admins';
			};
		}else{
			[player,selectRandom WMS_DFO_ObjToAddAction,selectRandom (WMS_DFO_MissionTypes select 1)] remoteExec ['WMS_fnc_Event_DFO', 2];
			hint 'Contacting Air Operations HQ';
		};
	},{
		(alive player) &&
		//{(getPlayerUID player) in WMS_DFO_PilotsList} && //remove this if you don't use pilot list
		{vehicle player isKindOf "helicopter"} &&
		{count WMS_DFO_BasePositions != 0} &&
		{count WMS_DFO_ObjToAddAction != 0} &&
		{(count WMS_DFO_Running) < WMS_DFO_MaxRunning} &&
		{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)}
		}
	] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _actionDFO2] call ace_interact_menu_fnc_addActionToObject;
}else {
	//REGULAR ADDACTION
	player addAction [
		"<t size='1' color='#4bff1a'>Request DFO Mission</t>", {
			if (WMS_DFO_UsePilotsList)then{
				if((getPlayerUID player) in WMS_DFO_PilotsList)then{
					[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
					hint 'Contacting Air Operations HQ';
				}else{
					hint 'DFO only for selected pilots, contact admins';
				};
			}else{
				[player,selectRandom WMS_DFO_ObjToAddAction] remoteExec ['WMS_fnc_Event_DFO', 2];
				hint 'Contacting Air Operations HQ';
			};
		}, 
		nil, 
		1, 
		true, 
		true, 
		"", 
		"
			(alive player) &&
			{vehicle player isKindOf 'helicopter'} &&
			{count WMS_DFO_BasePositions != 0} &&
			{count WMS_DFO_ObjToAddAction != 0} &&
			{(count WMS_DFO_Running) <= WMS_DFO_MaxRunning} &&
			{time > (WMS_DFO_LastCall+WMS_DFO_CoolDown)}
		",  
		5, 
		false 
	];
};