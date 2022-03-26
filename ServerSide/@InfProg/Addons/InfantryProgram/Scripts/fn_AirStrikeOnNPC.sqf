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
[] spawn
{ 
diag_log format ['*****AIRSTRIKE on NPC*****'];
//["toastRequest", ["InfoTitleAndText", ["AIRSTRIKE on NPC", "A bomber is on his way to a random AI vehicle"]]] call ExileServer_system_network_send_broadcast;

playSound3D ["A3\Sounds_F\sfx\Alarm_BLUFOR.wss", player, false, [14183.7,16256.4,25], 6, 1, 0];

uisleep 6;
playSound3D ["a3\dubbing_f\modules\supports\cas_bombing_acknowledged.ogg", player, false, [14183.7,16256.4,25], 3,1,0];

_NPCunits = [];     
{     
   _role = assignedVehicleRole _x;  
   if (!isPlayer _x) then { if ((_role select 0) == "Driver")  then { _NPCunits pushBack _x;  }};
       
} foreach allUnits;   
_NPCcount = count _NPCunits;  
systemchat format [str _NPCcount];

_NPCtarget = selectrandom _NPCunits;
systemchat format [str _NPCtarget];
moveout _NPCtarget;
_NPCtarget setVariable ["speedLimit", 1];
_NPCtarget disableAI "MOVE";

private _markerPos = position _NPCtarget; 
private _markerName = "Grid" + (str _markerPos);  
private _markerName2 = "AirStrike" + (str _markerPos);
private _NPCdriverMarker = createMarker [_markerName, _markerPos]; 
_NPCdriverMarker setMarkerShape "ELLIPSE";
_NPCdriverMarker setMarkerBrush "DIAGGRID"; 
_NPCdriverMarker setMarkerSize [150, 150];
_NPCdriverMarker setMarkerType "select"; 
_NPCdriverMarker setMarkercolor "ColorRed";

private _NPCdriverMarker2 = createMarker [_markerName2, _markerPos]; 
_NPCdriverMarker2 setMarkerShape "ICON";
_NPCdriverMarker2 setMarkerType "o_motor_inf"; 
_NPCdriverMarker2 setMarkercolor "ColorRed";
_NPCdriverMarker2 setMarkerText  "Airstrike on NPC";

("smokeshellred" createVehicle ((getposATL _NPCtarget) vectorAdd [0,5,5])) setVelocity [0,-5,5];

uisleep 5;
_Altitude  = 200;    
_FrontBack  = 0; 
_offsetZ  = 0; 
_posATL  = getPosATL _NPCtarget; 
_posBomb  = [getpos _NPCtarget select 0, getpos _NPCtarget select 1, _altitude]; 
_posVector  = _NPCtarget modelToWorld [0, _FrontBack, _altitude]; 
 playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", _NPCtarget, false, _posATL, 5, 1, 0];


_bombs = WMS_BombList;
_selectedBomb = selectrandom _bombs;
_Bomb  = createVehicle [_selectedBomb,_posBomb, [], 0]; 
_Bomb  setdir (getdir _NPCtarget); 
_Bomb  setPos (_posVector); 
_Bomb  setvelocity [0,0,-40]; 
_Bomb setVectorDirAndUp [[0,0,-1],[1,0,0]];

sleep 30;
_NPCtarget setdammage 1; 
deletemarker _markerName; 
deletemarker _markerName2;
};