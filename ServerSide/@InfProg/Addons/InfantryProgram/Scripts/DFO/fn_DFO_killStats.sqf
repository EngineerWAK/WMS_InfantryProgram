/**
* WMS_fnc_DFO_killStats - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_killStats _this %1', _this]};
	params[
		["_messages", [["ERROR",00]]],
		["_option", "KILL"]
		]; 
	private _payload = "<t align='left' size='1.2'>";
	if (_option == "NOTI") then { //#26e600
		{ 
			_payload = _payload + format ["<t color='#26e600' font='EtelkaMonospacePro'>%1</t><br/>", (_x select 0)]; //green
		}forEach _messages;
	} else {
		if (_option == "NOTIRED") then {
			{ 
				_payload = _payload + format ["<t color='#d60000' font='EtelkaMonospacePro'>%1</t><br/>", (_x select 0)]; //red
			}forEach _messages;
		} else {
			{ 
				_payload = _payload + format ["<t color='#e57234' font='EtelkaMonospacePro'>%1</t><br/>", (_x select 0)]; //orange
			}forEach _messages;
		};
	}; 
	_payload = _payload + "</t>";
	if("CIV" in _payload)then{
		_payload = _payload + "<t align='left' color='#d60000' font='EtelkaMonospacePro' size='1.4'>FRIENDLY FIRE</t>"; //red
	};
	if(_option == "NOTI" || _option == "NOTIRED") then {
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