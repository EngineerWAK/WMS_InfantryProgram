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
private _territories = [
	[[6242.22,10858.4,0],[76561197965501020]], //Winter house, WAKeupneo
	[[8809.39,5892.16,0],[76561198006783116, 76561197965501020]] //blabla, Tank, WAKeupneo
	];
{
	private _pos = (_x select 0);
	private _whiteList = (_x select 1);
	private _listFlags = _pos nearObjects ["Exile_Construction_Flag_Static", 100]; 
	private _flagOwner = (_listFlags select 0) getVariable ["ExileOwnerUID", ""]; 
	private _flagBuildRights = (_listFlags select 0) getVariable["ExileTerritoryBuildRights",""];
 
private _trigTerritory = createTrigger ["EmptyDetector", _pos];
_trigTerritory setTriggerArea [90, 90, 0, false, 90]; 
_trigTerritory setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
_trigTerritory setVariable ["whiteList", _whiteList, false];   
_trigTerritory setTriggerStatements [ 
	"this", 
	"
	{
		private _intruder = getPlayerUID _x;
		private _whiteList = (thisTrigger getVariable 'whiteList');
 		if !(_intruder in _whiteList || _intruder in _flagOwner || _intruder in _flagBuildRights) then { 
			Diag_log format ['[WINTER HOUSE BREACH 90m] |WAK|TNA|WMS|,  thisList = %1', thisList];
			private _msgx = format ['GET THE FUCK OUT Of My Territory %1', (name _x)]; 
			[_msgx] remoteExecCall ['SystemChat',_x];
		}; 
	}forEach thisList;
	", 
	"
	" 
];

private _trigTerritory2 = createTrigger ["EmptyDetector", _pos];
_trigTerritory2 setTriggerArea [60, 60, 0, false, 60]; 
_trigTerritory2 setTriggerActivation ["ANYPLAYER", "PRESENT", true];  
_trigTerritory2 setVariable ["whiteList", _whiteList, false];   
_trigTerritory2 setTriggerStatements [ 
	"this", 
	"
	private _intruder = getPlayerUID (thisList select 0);
 	if !(_intruder == '76561197965501020') then {  
	Diag_log format ['[WINTER HOUSE BREACH 60m] |WAK|TNA|WMS|,  thisList = %1', thisList];
	['Really bro?'] remoteExecCall ['SystemChat',(thisList select 0)]; 
	}; 
	", 
	"
	" 
];

private _trigTerritory3 = createTrigger ["EmptyDetector", _pos];
_trigTerritory3 setTriggerArea [45, 45, 0, false, 45]; 
_trigTerritory3 setTriggerActivation ["ANYPLAYER", "PRESENT", true];  
_trigTerritory3 setVariable ["whiteList", _whiteList, false];   
_trigTerritory3 setTriggerStatements [ 
	"this", 
	"
	private _intruder = getPlayerUID (thisList select 0);
 	if !(_intruder == '76561197965501020') then {  
	Diag_log format ['[WINTER HOUSE BREACH 45m] |WAK|TNA|WMS|,  thisList = %1', thisList];
	(thisList select 0) call WMS_fnc_Restrain;
	['Intrusion Logged, message sent to Admin'] remoteExecCall ['SystemChat',(thisList select 0)]; 
	}; 
	", 
	"
	" 
];
}foreach _territories
/*
//WORKS BUT NEED TO BE BETTER
private _pos = [6242.22,10858.4,0]; //winter house
private _safeList = [
	76561197965501020,
	76561198006783116 //Tank //[8809.39,5892.16,0]
];
private _listFlags = _pos nearObjects ["Exile_Construction_Flag_Static", 100]; 
private _flagOwner = (_listFlags select 0) getVariable ["ExileOwnerUID", ""]; 
private _flagBuildRights = (_listFlags select 0) getVariable["ExileTerritoryBuildRights",""];
 
private _trigTerritory = createTrigger ["EmptyDetector", _pos];
_trigTerritory setTriggerArea [90, 90, 0, false, 90]; 
_trigTerritory setTriggerActivation ["GUER", "PRESENT", true]; 
_trigTerritory setTriggerStatements [ 
	"this", 
	"
	private _intruder = getPlayerUID (thisList select 0);
 	if !(_intruder == '76561197965501020') then { 
	Diag_log format ['[WINTER HOUSE BREACH 90m] |WAK|TNA|WMS|,  thisList = %1', thisList];
	private _msgx = format ['GET THE FUCK OUT Of My Territory %1', (name (thisList select 0))]; 
	[_msgx] remoteExecCall ['SystemChat',(thisList select 0)]; 
	}; 
	", 
	"
	" 
];

private _trigTerritory2 = createTrigger ["EmptyDetector", _pos];
_trigTerritory2 setTriggerArea [60, 60, 0, false, 60]; 
_trigTerritory2 setTriggerActivation ["GUER", "PRESENT", true]; 
_trigTerritory2 setTriggerStatements [ 
	"this", 
	"
	private _intruder = getPlayerUID (thisList select 0);
 	if !(_intruder == '76561197965501020') then {  
	Diag_log format ['[WINTER HOUSE BREACH 60m] |WAK|TNA|WMS|,  thisList = %1', thisList];
	['Really bro?'] remoteExecCall ['SystemChat',(thisList select 0)]; 
	}; 
	", 
	"
	" 
];

private _trigTerritory3 = createTrigger ["EmptyDetector", _pos];
_trigTerritory3 setTriggerArea [45, 45, 0, false, 45]; 
_trigTerritory3 setTriggerActivation ["GUER", "PRESENT", true]; 
_trigTerritory3 setTriggerStatements [ 
	"this", 
	"
	private _intruder = getPlayerUID (thisList select 0);
 	if !(_intruder == '76561197965501020') then {  
	Diag_log format ['[WINTER HOUSE BREACH 45m] |WAK|TNA|WMS|,  thisList = %1', thisList];
	(thisList select 0) call WMS_fnc_Restrain;
	['Intrusion Logged, message sent to Admin'] remoteExecCall ['SystemChat',(thisList select 0)]; 
	}; 
	", 
	"
	" 
];*/