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
//WMS_markerUnits setMarkerText (format ["%1 NPC", (count allUnits - count allPlayers)]); //countSide
WMS_markerUnits setMarkerText (format ["%1 NPC", (EAST countside allUnits)]); //countSide
WMS_markerDeads = createMarker ["markerDeads", [0,-600]];
WMS_markerDeads setMarkerType "mil_dot";
WMS_markerDeads setMarkerColor "ColorGreen";
WMS_markerDeads setMarkerText (format ["%1 Deads", count allDeadMen]);
 
WMS_markerSystem = createMarker ["markerSystem", [(worldsize /2),-200]];
WMS_markerSystem setMarkerType "mil_triangle";
WMS_markerSystem setMarkerColor "ColorKhaki";
WMS_markerSystem setMarkerText (format ["Infantry Program %1 ", WMS_System_Version]);//WMS_System_Version