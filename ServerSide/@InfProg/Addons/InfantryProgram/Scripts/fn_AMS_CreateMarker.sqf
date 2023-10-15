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

private ["_Mkr","_markerType","_MkrBorder"];
params [
	"_pos",
	["_difficulty","Moderate"],
	["_name",""],
	["_border", true]
	];

_markerType = WMS_AMS_MkrModerate;
switch (tolower _difficulty) do {
	case "easy":
	{
		_markerType = WMS_AMS_MkrEasy;
	};
	case "moderate":
	{
		_markerType = WMS_AMS_MkrModerate;
	};
	case "difficult":
	{
		_markerType = WMS_AMS_MkrDifficult;
	};
	case "hardcore":
	{
		_markerType = WMS_AMS_MkrHardcore;
	};
	case "capturezone":
	{
		_markerType = WMS_CaptureZone_mkr;
	};
};
_Mkr = createMarker [format ["WMS_AMS_Mkr_%1_%2",round ((_pos select 0)+(_pos select 1)),round(time)], _pos];
_Mkr setMarkerType _markerType;
_Mkr setMarkerText _name;
if (_difficulty == "capturezone") then {
	_Mkr setMarkerColor "colorBLUFOR";
}else {
	_Mkr setMarkerColor WMS_AMS_MkrColor;
};

_MkrBorder = createMarker [format ["WMS_AMS_MkrBorder_%1_%2",round ((_pos select 0)+(_pos select 1)),round(time)], _pos];
if (_border) then {
	_MkrBorder setMarkerColor "colorOrange"; //maybe change later
	_MkrBorder setMarkerShape "ELLIPSE";
	_MkrBorder setMarkerBrush "border";
	_MkrBorder setMarkerSize [300,300];
};
if (WMS_IP_LOGs) then {diag_log format ["[AMS MARKERS]|WAK|TNA|WMS| return [_Mkr,_MkrBorder]: %1,", [_Mkr,_MkrBorder]]};
[_Mkr,_MkrBorder]