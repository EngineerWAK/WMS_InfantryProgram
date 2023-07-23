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

WMS_markerFPS = createMarker ["markerFPS", [0,-200]];
WMS_markerFPS setMarkerType "mil_dot";
WMS_markerFPS setMarkerColor "ColorGreen";
WMS_markerFPS setMarkerText (format ["%1 fps", round diag_fps]);

WMS_markerUnits = createMarker ["markerUnits", [0,-400]];
WMS_markerUnits setMarkerType "mil_dot";
WMS_markerUnits setMarkerColor "ColorGreen";
WMS_markerUnits setMarkerText (format ["%1 OPFOR", (EAST countside allUnits)]); //countSide

WMS_markerUnitsCIV = createMarker ["markerUnitsCIV", [0,-600]];
WMS_markerUnitsCIV setMarkerType "mil_dot";
WMS_markerUnitsCIV setMarkerColor "ColorGreen";
WMS_markerUnitsCIV setMarkerText (format ["%1 Cvilians", (CIVILIAN countside allUnits)]); //countSide

WMS_markerDeads = createMarker ["markerDeads", [0,-800]];
WMS_markerDeads setMarkerType "mil_dot";
WMS_markerDeads setMarkerColor "ColorGreen";
WMS_markerDeads setMarkerText (format ["%1 Deads", count allDeadMen]);
 
WMS_markerSystem = createMarker ["markerSystem", [(worldsize /2),-200]];
WMS_markerSystem setMarkerType "mil_triangle";
WMS_markerSystem setMarkerColor "ColorKhaki";
WMS_markerSystem setMarkerText (format ["Infantry Program %1 ", WMS_System_Version]);//WMS_System_Version

//DFO
if (WMS_DynamicFlightOps) then {
	WMS_markerSystem = createMarker ["markerDFO", [(worldsize /2),-800]];
	WMS_markerSystem setMarkerType "loc_heli";
	WMS_markerSystem setMarkerColor "ColorKhaki";
	WMS_markerSystem setMarkerText (format [" Dynamic Flight Ops %1 ", WMS_DFO_Version]);
};
//FastCombat
WMS_markerFC = createMarker ["markerFC", [(worldsize *0.25),-200]];
WMS_markerFC setMarkerType "loc_Rifle";
WMS_markerFC setMarkerColor "ColorYellow";
WMS_markerFC setMarkerText "Fast Combat Status UNKNOWN";