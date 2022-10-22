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

//////////////////////////////////////////////////////////////////
// private _centerPos = [worldsize/2,worldsize/2,0];  
// private _diameter = ((worldsize/2)*1.413);
// private _pos = [_centerPos, 0, (worldsize/2), 15, 0, 0.15] call BIS_fnc_findSafePos;
// [player, getDir player, _centerPos, _diameter, _pos, (1800 + random 1800), 0, 999, 1] spawn WMS_fnc_Compo_RepairCamp;
//////////////////////////////////////////////////////////////////

if (WMS_IP_LOGs) then {diag_log format ["[REPAIR CAMP]|WAK|TNA|WMS| _this = %1", _this];};
private ["_objList","_MGList","_VHLList","_lockerMoney","_fire","_objects","_compoRefPoint","_markerPos","_markerName","_mkr"]; 
params[ 
   "_target",
   ["_dirPlayer",(random 359)],
   ["_centerPos", [worldsize/2,worldsize/2,0]],
   ["_diameter", ((worldsize/2)*1.413)],
   "_pos",
   ["_timer", 900],
   ["_armed",0],
   ["_amount", 999],
   ["_monitoring", 0]
]; 
_objList = [];
_MGList = [];
_VHLList = [];
_lockerMoney = 0;
if (_amount == 999) then { _lockerMoney = "Lets Punch It" } else {
   _lockerMoney = _target getVariable ['ExileLocker', 0];
   if(_lockerMoney > _amount) then {    
      _lockerMoney1 = _target getVariable ['ExileLocker', 0];   
      _playerMoney = _target getVariable ['ExileMoney', 0];   
      _lockerMoney = _lockerMoney1 - _amount;   
      _poptabsplayer = _playerMoney + _lockerMoney;   
      _target setVariable ['ExilePopTabsCheck', _poptabsplayer];   
      _target setVariable ['ExileMoney', _playerMoney, true];   
      _target setVariable ['ExileLocker', _lockerMoney, true];   
      format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;   
   } else {   
      _armed = 0;   
      _timer = 5;   
if (WMS_exileToastMsg) then {
      ["toastRequest", ["ErrorTitleOnly", ["Earth to earth, ashes to ashes, dust to dust"]]] call ExileServer_system_network_send_broadcast; 

	} else {
		//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
		["EventWarning", ["BaseAttack", "MAYBE something is happening"]] remoteExec ["BIS_fnc_showNotification", -2];
	};  
      _Target allowDamage true;   
      _fire = "test_EmptyObjectForFirebig" createVehicle [0,0,0];    
      _fire attachto [_target,[0,0,0]];    
      playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", _target, false, _pos, 3, 1, 0];    
   };   
};

/*_objects = [    //OLD
   [WMS_CamoNet_Big,[0,0,0],0,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-4.44227,-6.63455,0],237.299,[true,false],""],   
   ["Land_BagFence_Round_F",[-4.26413,-9.49662,0],62.2911,[true,false],""],   
   ["Land_BagFence_Long_F",[-1.74429,-10.4554,0],0,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-5.42815,-4.91675,0],243.072,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-6.13495,-3.08617,0],257.241,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-6.40452,-1.14161,0],268.095,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-6.26962,0.837143,0],280.697,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-5.66745,2.7332,0],295.211,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-4.59533,4.44159,0],309.299,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-2.98354,5.70031,0],334.568,[true,false],""],   
   ["Land_CncBarrierMedium_F",[-1.026,6.23149,0],355.574,[true,false],""],   
   ["Land_CncBarrierMedium_F",[0.885753,6.29276,0],0.527796,[true,false],""],   
   ["Land_CncBarrierMedium_F",[2.83166,6.06762,0],10.1972,[true,false],""],   
   ["Land_CncBarrierMedium_F",[4.71844,5.23868,0],37.4848,[true,false],""],   
   ["Land_CncBarrierMedium_F",[5.86751,3.49726,0],74.6146,[true,false],""],   
   ["Land_CncBarrierMedium_F",[6.23774,1.47337,0],83.6937,[true,false],""],   
   ["Land_CncBarrierMedium_F",[6.58604,-0.433831,0],76.5616,[true,false],""],   
   ["Land_CncBarrierMedium_F",[7.01473,-2.31527,0],77.162,[true,false],""],   
   ["Land_BagFence_Round_F",[8.001,-4.36718,0],281.345,[true,false],""],   
   ["Land_CampingTable_F",[5.485,-1.0866,0],255.482,[true,true],""],  
   ["Land_Pod_Heli_Transport_04_fuel_F",[-2.17843,-0.323677,0],90,[true,true],"lock"],   
   ["Box_IND_AmmoVeh_F",[-0.0231779,3.21674,0],90,[true,true],"lock"],
   ["Land_RepairDepot_01_green_F",[-0.220944,-5.79184,0],180,[true,false],"lock"]
];*/
_objects = [
   [WMS_CamoNet_Big,[0,0,0],0,[true,false],""],
   [WMS_BLUE_Flag,[3.8,-8.5,0],0,[true,false],""],
   ["Box_IND_AmmoVeh_F",[-2.3,-0.5,0],0,[true,true],"lock"],
   ["Land_fs_feed_F",[6,-1.3,0],59.5,[true,true],"lock"],
   ["Land_RepairDepot_01_green_F",[0.2,-5.8,0],198.4,[true,true],"lock"],
   ["FirePlace_burning_F",[2.8,3.1,0],0,[true,false],""],
   ["Land_CncBarrierMedium_F",[-5.8,-3.8,0],68.2,[true,false],""],
   ["Land_CncBarrierMedium_F",[-6.4,-2,0],77.3,[true,false],""],
   ["Land_CncBarrierMedium_F",[-6.6,-0.1,0],90.8,[true,false],""],
   ["Land_CncBarrierMedium_F",[-6.5,1.9,0],96.4,[true,false],""],
   ["Land_CncBarrierMedium_F",[-5.8,3.7,0],123.5,[true,false],""],
   ["Land_CncBarrierMedium_F",[-4.5,5.2,0],140.2,[true,false],""],
   ["Land_CncBarrierMedium_F",[-2.8,6.2,0],159.7,[true,false],""],
   ["Land_CncBarrierMedium_F",[-0.8,6.6,0],176.8,[true,false],""],
   ["Land_CncBarrierMedium_F",[1.1,6.5,0],191.3,[true,false],""],
   ["Land_CncBarrierMedium_F",[2.9,6,0],196.5,[true,false],""],
   ["Land_CncBarrierMedium_F",[4.5,4.9,0],232.4,[true,false],""],
   ["Land_CncBarrierMedium_F",[6.1,1.3,0],237,[true,false],""],
   ["Land_CncBarrierMedium_F",[-4.9,-5.5,0],237.3,[true,false],""],
   ["Land_CncBarrierMedium_F",[7,-0.5,0],247.1,[true,false],""],
   ["Land_CncBarrierMedium_F",[5.3,3.1,0],259.1,[true,false],""],
   ["Land_SandbagBarricade_01_half_F",[9.9,-3.2,0],87.6,[true,false],""],
   ["Land_SandbagBarricade_01_half_F",[9.5,-5.5,0],116.6,[true,false],""],
   ["Land_SandbagBarricade_01_half_F",[-1,-11.8,0],190.7,[true,false],""],
   ["Land_SandbagBarricade_01_half_F",[-3.3,-11.2,0],197.4,[true,false],""],
   ["Land_SandbagBarricade_01_half_F",[-5.2,-10,0],223.8,[true,false],""],
   ["Land_TentSolar_01_folded_olive_F",[0.2,5.5,0],301.3,[true,false],""],
   ["Land_TentSolar_01_olive_F",[-1.9,3.6,0],246.3,[true,false],""],
   ["Land_WoodenLog_F",[3.1,4.3,0],6.7,[true,false],""],
   ["Land_WoodenLog_F",[4.2,3,0],81.7,[true,false],""],
   ["Land_Workbench_01_F",[5,0.5,0],64.1,[true,false],""]
   ];  

_compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"];   
_compoRefPoint setDir _dirPlayer;   
{    
   _object = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"]; 
   _objList pushback _object;    
   _dirObject = _dirPlayer + (_x select 2);    
   _objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);    
   _object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];     
   _object setdir _dirObject;    
   _gradient = surfaceNormal position _object;    
   _object setvectorup _gradient;   
   _object enableSimulationGlobal (_x select 3 select 0);    
   _object allowDamage (_x select 3 select 1);  
   if ((_x select 0) == "Land_RepairDepot_01_green_F") then {
      _object setVariable ["ace_rearm_isSupplyVehicle", true, true];
   };
   if (_x select 4 == "lock") then {  
      _object setVehicleLock "LOCKEDPLAYER";  
      _object setVariable ["ExileIsLocked", -1, true];   
      _VHLList pushback _object;};
	   //_object setRepairCargo 1;
      //_object setAmmoCargo 1; //NOPE
      //_object setFuelCargo 1;  //NOPE
      uisleep 0.3;   
} forEach _objects;    
   
if (_armed == 1) then {  
   deleteVehicle _compoRefPoint;    
} else {deleteVehicle _compoRefPoint};   
  
_markerPos = _pos;      
_markerName = "Repair" + (str _markerPos);    
    
_mkr = createMarker [_markerName, _markerPos];      
_mkr setMarkerShape "ICON";     
_mkr setMarkerType "n_maint";      
_mkr setMarkercolor "colorIndependent";     
_mkr setMarkerText  "Maintenance Camp";

if (WMS_exileToastMsg) then {
   ["toastRequest", ["InfoTitleAndText", ["Infantry Program", "Spawning a Repair Camp. Marker on the map"]]] call ExileServer_system_network_send_broadcast;  

	} else {
		//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
		["TaskAssigned", ["Infantry Program", "Spawning a Repair Camp. Marker on the map"]] remoteExec ["BIS_fnc_showNotification", -2];
	};
uisleep 5;  
{
   _x setdamage 0;
   _x allowDamage true; 
} forEach _VHLList; 
if (_monitoring == 1) then {
   WMS_AI_bluforPatrol_Running pushback [time,(time+(_timer+(random _timer))),[],
   [],_objList,[],
   [],"ALARM"];
};