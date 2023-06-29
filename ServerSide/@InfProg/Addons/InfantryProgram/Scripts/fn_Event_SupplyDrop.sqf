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

//[] spawn WMS_fnc_SupplyDrop;
if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  Supply Drop Called, %1",_this]};
private ["_grps","_vhls","_objs","_mkrs","_posForest","_pos","_rad","_target", "_Mkr", "_Mkr2","_minePos","_mine","_randDirOffset","_sign","_posPara","_parachute","_cargo","_bagList","_weapList","_weap","_ammoList","_item","_itemList","_bag","_MkrName","_Mkr2Name","_Mkr","_Mkr2","_triggCapture","_paraGrp","_randomSpawnPos","_smoke","_Light"]; 
params[
 ["_howMany", WMS_SupplyDropCount], //always be 1 from event manager
 ["_delay", WMS_SupplyDropDelay],//always be 0 from event manager
 ["_mines", 40],
 ["_positions", WMS_Pos_Forests],
 ["_INFpatrol", true],
 ["_AIcount", (2 + round random 2)],
 ["_altitude", 200]
]; 
if (count _positions > 0) then {//Need to add a Player check
	_rad = 250;
	_objs = [];
	_grps = [];
	_mkrs = [];
	_vhls = [];
	_posForest = selectRandom _positions; 
	_pos = [[[_posForest, 150]],[]] call BIS_fnc_randomPos; 
	_target = "Land_JumpTarget_F" createVehicle _pos;
	_target setDir (random 259);
 	_objs pushBack _target;
//Paradrop the crate and fil it 
	_posPara = [_pos select 0, _pos select 1, _altitude];
	_parachute = createVehicle [WMS_para_Big,_posPara, [], 5];
	_parachute 	setdir winddir;
	_parachute 	setPos _posPara;
	_parachute 	setvelocity [0,0,-8];
	_cargo = createVehicle [WMS_SupplyCrate,_posPara, [],5];
	_smoke = createVehicle ["SmokeShellOrange",position _cargo, [],5];
 	_vhls pushBack _cargo; //carry variables for conditions
	_cargo allowdamage false;
	_cargo attachTo [_parachute,[0,0,0]];
	_cargo setVariable ['opened', false, true];
	_cargo setVariable ['openedTime', WMS_ServRestartSeconds, true];
	clearMagazineCargoGlobal _cargo; 
	clearWeaponCargoGlobal _cargo; 
	clearItemCargoGlobal _cargo; 
	clearBackpackCargoGlobal _cargo;
	[_cargo, _cargo] call ace_common_fnc_claim;
	_bagList = (WMS_Loadout_MCB select 3)+(WMS_Loadout_M90d select 3)+(WMS_Loadout_ABU select 3)+(WMS_Loadout_bandit select 3);
	_weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_DMR select 0)+(WMS_Loadout_Sniper select 0)+(WMS_Loadout_SMG select 0)+(WMS_Loadout_MG select 0)+(WMS_Loadout_Sniper select 3);
	_weap = [
		[selectRandom _weapList,(5+floor(random 8))]
	];
	_ammoList = [];
	{_ammoList pushBack ((getArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines")) select 0)}forEach _weap;
	_item = WMS_AI_inventory+[WMS_Utility_Item_2]+[WMS_Utility_Item_2];
	_itemList = [
		(selectRandom _item),
		(selectRandom _item),
		(selectRandom _item)
	];
	_bag = [
		[selectRandom _bagList,(1+floor(random 5))] 
	];
	{_cargo addItemCargoGlobal [_x,(1+floor(random 5))]} forEach _itemList;
	{_cargo addMagazineCargoGlobal [_x,(5+floor(random 8))]} forEach _ammoList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bag;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weap;
	if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  Crate created and Filled, %1",_cargo]};
//Paradrop the crate and fil it
//Create the Markers
	_MkrName = format ["WMS_MkrDrop_%1",round time];
	_Mkr2Name = format ["WMS_MkrDrop2_%1",round time];
	_Mkr = createMarker [_MkrName, _pos]; 
	_Mkr setMarkerType WMS_SupplyDropMkr; //MinefieldAP
	_Mkr setMarkerColor WMS_SupplyColor;  
	_Mkr setMarkerText  format ["ENEMY Supply, Wind %1 %2m/s",(round windDir),(round vectorMagnitude wind)];
	_Mkr2 = createMarker [_Mkr2Name, _pos]; 
	_Mkr2 setMarkerColor "colorOrange";  
	_Mkr2 setMarkerShape "ELLIPSE";  
	_Mkr2 setMarkerBrush "Border";  
	_Mkr2 setMarkerSize [_rad,_rad];
 	_Mkrs pushBack _MkrName;
 	_Mkrs pushBack _Mkr2Name;
	if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  Markers created, %1, %2",_MkrName,_Mkr2Name]};
//Create the Markers
//Create the triger on the crate (maybe at the end)
	_triggCapture = createTrigger ["EmptyDetector", _pos, true]; 
	_triggCapture attachTo [_cargo, [0,0,0]];
	_triggCapture setVariable ["crate", _cargo, false];  
	_triggCapture setVariable ["SupplyDropMarker", _Mkr, false];
	_triggCapture setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_triggCapture setTriggerArea [20, 20, 0, false];
	_triggCapture setTriggerStatements  
	[ 
  		"this && ({ thisTrigger distance _x <= 20 } count thislist) > 0",  
  		"
			_crate = thisTrigger getVariable 'crate';
			_marker = thisTrigger getVariable 'SupplyDropMarker';
			_crate setVariable ['opened', true, true];
			_crate setVariable ['openedTime', time, true];
			'smokeShellOrange' createVehicle position _crate;
			deleteVehicle thisTrigger;
			_marker setMarkerType 'MinefieldAP';
			_marker setMarkerColor 'colorEAST';
			_marker setMarkerText 'AT MineField';
		",  
  		"" 
	];
	_Objs pushBack _triggCapture;
	if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  Capture Trigger created, %1",_triggCapture]};
//Create the triger on the crate
//Create the Infantry group
	if (_INFpatrol) then {//change this for paradrop created in this fonction then pushback all elements for management
		_paraGrp = createGroup [OPFOR, false];
		_grps pushBack _paraGrp;
		for "_i" from 1 to _AIcount do {
			"O_Soldier_F" createUnit [
			_pos, 
			_paraGrp
			];
		};
		{ 
			_randomSpawnPos = [[(_pos select 0),(_pos select 1),_altitude] , 5, 50, 0, 0, 0, 0, [], [[],[]]] call BIS_fnc_findSafePos;
			_x setpos [(_randomSpawnPos select 0),(_randomSpawnPos select 1),_altitude]; 
		} forEach units _paraGrp ;
		[(units _paraGrp),'Para',30,(0.2 + random 0.4),nil,"livonia",nil,"Supplydrop"] call WMS_fnc_SetUnits; //paradrop
		[_paraGrp, _Pos, 50, 4, "MOVE", "SAFE", "YELLOW", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
		if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  Infantry Patrol created, %1, %2 NPC",_paraGrp, _AIcount]};
	};
//Create the Infantry group
//Create the Mines field
		if (_mines >= 1) then {
			for "_i" from 1 to _mines do {
				_mine = createMine [(selectRandom WMS_ATMines), ([_pos, 5, (_rad/1.5), 0.5, 0, 0.5, 0] call BIS_fnc_findSafePos), [], 0 ];
				_mine allowDamage true; 
				_mine setDir (random 360);
				EAST revealMine _mine;
				_Objs pushBack _mine;
			};
			if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  MineField spawned, %1 mines created", _mines]};
			_randDirOffset = random 45;
			for "_i" from 0 to 359 step 17 do {
				_sign = createVehicle ["Land_Sign_MinesTall_English_F", [0,0,0], [], 0, "CAN_COLLIDE"];
				_sign setDir (180+_i);
				_sign setPosATL (_Pos getPos [_rad, _randDirOffset+_i]);
				_sign setVectorUp [0,0,1];
				_Objs pushBack _sign;
			};
			if (WMS_IP_LOGs) then {diag_log format ["[ENEMY SUPPLYDROP]|WAK|TNA|WMS|  MineField signs created, %1m around", _rad/1.5]};
		};
//Create the Mines field
//PushBack for Management
WMS_Events_Running pushBack [time,time+WMS_SupplyDropDelay,_grps,_vhls,_objs,_mkrs,[],"supplydrop"];
//PushBack for Management

	waitUntil {((position _cargo) select 2) < 30};
	_smoke = "SmokeShellOrange" createVehicle position _cargo;
	_smoke attachTo [_cargo,[0,0,1]];
	uisleep 4;
	detach _cargo;
	_Light = "chemlight_Red" createVehicle position _cargo;
	_Light attachTo [_cargo, [0,0,2]];
	uisleep 5;
	deleteVehicle _parachute;
	_cargo allowdamage true;
} else {diag_log format ["WAK|WAK|TNA|WMS|WAK ***** ENEMY SUPPLYDROP ERROR ***** _this =  %1 *****", _this]};