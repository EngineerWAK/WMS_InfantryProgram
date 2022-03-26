/*
'#abf500' light green
'#00dcf5' light blue
'#e57234' orange 
'#d60000' red
*/
private["_totalBonus", "_payload", "_scoreName", "_scoreNumber", "_spaceToAdd", "_i"]; 
params[
	["_messages", [["ERROR",00]]],
	["_Type", "AMS"] //"AMS"
]; 
_totalBonus = 0;
_payload = "<t align='left' size='1.2'>"; 
if (false) then {diag_log format ["[DISPLAYKILLSTAT]|WAK|TNA|WMS|UPDATE: _messages= %1", _messages]}; 
{ 
	_scoreName = _x select 0;
	if (count _x == 2) then {
		_scoreNumber = str (_x select 1);
		_scoreNumber = " " + _scoreNumber;
		_totalBonus = _totalBonus + (_x select 1); 
		_payload = _payload + format ["<t font='EtelkaMonospacePro'>%1</t>%2<br/>", toUpper _scoreName, _scoreNumber]; 
	}else{
		_payload = _payload + format ["<t color='#e57234' font='EtelkaMonospacePro'>%1</t><br/>", toUpper _scoreName]; //orange
	};
}forEach _messages; 
_payload = _payload + "</t>"; 
if (_totalBonus >= 0) then { 
	if (_Type == "AMS")then {
		_payload = _payload + (format ["<t align='left' color='#abf500' font='EtelkaMonospacePro' size='1.2'>Total Bonus +%1</t>", _totalBonus]); //light green
	}else{
		_payload = _payload + (format ["<t align='left' color='#00dcf5' font='EtelkaMonospacePro' size='1.2'>Total Bonus +%1</t>", _totalBonus]); //light blue
	};
	 
}else  { 
	_payload = _payload + (format ["<t align='left' color='#d60000' font='EtelkaMonospacePro' size='1.2'>TOTAL MALUS %1</t>", _totalBonus]); //red
}; 
if (false) then {diag_log format ["[DISPLAYKILLSTAT]|WAK|TNA|WMS|UPDATE: _this= %1", _payload]}; 
[ 
	parseText _payload,  
	true,  //the display can be moved anywhere on the screen options/game/layout/mission/Scenario specific texts
	nil,  
	5,
	[0.2,1.5],
	0  
]spawn BIS_fnc_textTiles;