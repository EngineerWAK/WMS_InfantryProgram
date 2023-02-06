/*
'#abf500' light green
'#00dcf5' light blue
'#e57234' orange 
'#d60000' red
'#26e600' green
*/
private["_totalBonus", "_payload", "_scoreName", "_scoreNumber"]; 
params[
	["_messages", [["ERROR",00]]],
	["_Type", "AMS"] //"AMS" //"DFO" not set yet //"JMD"
]; 
_totalBonus = 0;
_payload = "<t align='left' size='1.2'>"; 
if (false) then {diag_log format ["[DISPLAYKILLSTAT]|WAK|TNA|WMS|UPDATE: _messages= %1", _messages]};
if (_Type == "NOTI") then {
	{ 
		_payload = _payload + format ["<t color='#26e600' font='EtelkaMonospacePro'>%1</t><br/>", (_x select 0)]; //green
	}forEach _messages;
} else {
	if (_Type == "NOTIRED") then {
		{ 
			_payload = _payload + format ["<t color='#d60000' font='EtelkaMonospacePro'>%1</t><br/>", (_x select 0)]; //red
		}forEach _messages;
	} else {
		{ 
			_scoreName = _x select 0;
			if (count _x == 2) then {
				_scoreNumber = str (_x select 1);
				_scoreNumber = " " + _scoreNumber;
				_totalBonus = _totalBonus + (_x select 1); 
				_payload = _payload + format ["<t font='EtelkaMonospacePro'>%1</t>%2<br/>", toUpper _scoreName, _scoreNumber]; 
			}else{
				_payload = _payload + format ["<t color='#e57234' font='EtelkaMonospacePro'>%1</t><br/>", toUpper _scoreName]; //orange //DFO should fit here
			};
		}forEach _messages;
	};
}; 
_payload = _payload + "</t>"; 
if (_totalBonus >= 0) then { 
	if (_Type == "AMS" || _type == "CaptureZone")then {
		_payload = _payload + (format ["<t align='left' color='#abf500' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //light green
	}else{
		if (_Type == "DFO")then{
			if("CIV" in _payload)then{
				_payload = _payload + "<t align='left' color='#d60000' font='EtelkaMonospacePro' size='1.4'>FRIENDLY FIRE</t>"; //red
			};
		}else{
			if !(_Type == "NOTI" || _Type == "NOTIRED") then { //missing: Dynamic = "Paradrop" || side missions= "HeliCrash" "Supplydrop" "Recon" //#ff8000
				if (_Type == "JMD") then {
					_payload = _payload + (format ["<t align='left' color='#9000ff' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //Kind of purple
				}else{
					if (_type == "VHLCrew") then { //ground and air
						_payload = _payload + (format ["<t align='left' color='#003df5' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //darker blue
					}else{
						if (_type == "HeliCrash"||_type == "Supplydrop"||_type == "Recon") then { //side 'missions'
							_payload = _payload + (format ["<t align='left' color='#ff8000' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //orange
						} else {
							if (_type == "BaseATK") then {
								_payload = _payload + (format ["<t align='left' color='#f5d400' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //dark yellow
							}else{
								_payload = _payload + (format ["<t align='left' color='#00dcf5' font='EtelkaMonospacePro' size='1.2'>%2 Total Bonus +%1</t>", _totalBonus,_Type]); //light blue, DEFAULT
							};
						};	
					};
				};	
			};	
		};
	};
	 
}else { 
	_payload = _payload + (format ["<t align='left' color='#d60000' font='EtelkaMonospacePro' size='1.2'>TOTAL MALUS %1</t>", _totalBonus]); //red
}; 
if (false) then {diag_log format ["[DISPLAYKILLSTAT]|WAK|TNA|WMS|UPDATE: _this= %1", _payload]}; 

if(_Type == "NOTI" || _Type == "NOTIRED") then {
	[
		parseText _payload,
		[
			(0.3 - pixelW * pixelGrid),
			(0.05 - pixelH * pixelGrid),
			(pixelW * pixelGrid * 60),
			(pixelH * pixelGrid * 15)
		],
		nil, 
		7, 
		0.7, 
		0
	] spawn BIS_fnc_textTiles;
} else {
	[ 
		parseText _payload,  
		true,  //the display can be moved anywhere on the screen options/game/layout/mission/Scenario specific texts
		nil,  
		5,
		[0.2,1.5],
		0  
	]spawn BIS_fnc_textTiles;
};