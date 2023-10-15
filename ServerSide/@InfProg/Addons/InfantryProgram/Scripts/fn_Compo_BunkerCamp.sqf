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
// [player, position player, getDir player, (1800 + random 1800), 1, 999] call WMS_fnc_Compo_BunkerCamp;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[BUNKER CAMP]|WAK|TNA|WMS| _this = %1", _this];};

params [
	"_target", //player 
	"_pos", //position player //[x,y,z]
	["_dirPlayer", random 359], //getDir player 
	["_timer",1800], //1800
	["_armed", 0], //0 - 1
	["_amount", 999], //price or '999 will be the magic number for non poptabs check'
	["_Loadout", selectRandom ["aor2","scorpion","m90"]]
];
private _objList = [];
private _campGrp1 = grpNull;
private _campGrp2 = grpNull;
private _campGrp3 = grpNull;
private _lockerMoney = 0;
private _MGlist = [];
if (_amount == 999) then { _lockerMoney = "Lets Punch It" } else { 
	if (WMS_exileFireAndForget)then {
		_lockerMoney = _target getVariable ['ExileLocker', 0];
	}else{
		_lockerMoney = _target getVariable ['ExileMoney', 0];
	};
	
	if(_lockerMoney > _amount) then //this is the second check, shouldnt be false.
    { 
		if (WMS_exileFireAndForget)then {
			_lockerMoney1 = _target getVariable ['ExileLocker', 0];
    		_playerMoney = _target getVariable ['ExileMoney', 0];
			_lockerMoney = _lockerMoney1 - _amount;
			_poptabsplayer = _playerMoney + _lockerMoney;
			_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
			_target setVariable ['ExileMoney', _playerMoney, true];
			_target setVariable ['ExileLocker', _lockerMoney, true];
    		format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
		}else {
			[_target, _amount] call WMS_fnc_smallTransactions; //TheLastCartridges
		};
	} else {
		_armed = 0;
		_timer = 5;
		if (WMS_exileToastMsg) then {["toastRequest", ["ErrorTitleOnly", ["Earth to earth, ashes to ashes, dust to dust"]]] call ExileServer_system_network_send_broadcast};
		_Target allowDamage true;
		private _fire = "test_EmptyObjectForFirebig" createVehicle [0,0,0]; 
		_fire attachto [_target,[0,0,0]]; 
		playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", _target, false, _pos, 3, 1, 0]; //todo: check if _target will work if its not a player.
		//uisleep 600; //todo: replace this by independent cleaning function like '[600,[_fire]] call WMS_fnc_cleanUp;'
		//deletevehicle _fire;
	};
};
private _objects = [ 
	//[WMS_CamoNet_Open,[0,0,0],46.8031,[true,false]], //this one looks cool but it's pain in the ass for visibility
	["Land_BagBunker_Small_F",[-1.8912,3.94984,-0.1],178.3,[true,false]],
	["Land_BagBunker_Small_F",[-0.62328,-3.95558,-0.1],57.9,[true,false]],
	["Land_BagBunker_Small_F",[4.60304,-2.61888,-0.1],287.4,[true,false]],
	["Land_HBarrier_3_F",[-4.11207,-1.66916,0],46.8,[true,false]],
	["Land_HBarrier_3_F",[4.0289,0.849624,0],239.3,[true,false]],
	["Land_SandbagBarricade_01_half_F",[1.84374,-5.72412,0],199.7,[true,false]],
	["Land_SandbagBarricade_01_half_F",[2.89194,3.23462,0],49.8,[true,false]],
	["Land_SandbagBarricade_01_half_F",[5.09918,-6.07061,0],126.7,[true,false]],
	["Land_SandbagBarricade_01_half_F",[-4.76231,2.51183,0],316.5,[true,false]],
	["Land_SandbagBarricade_01_half_F",[-4.00189,0.438833,0],317,[true,false]],
	["Land_SandbagBarricade_01_half_F",[1.09248,5.85942,0],6.4,[true,false]],
	["Land_CncBarrierMedium_F",[-2.46153,2.89614,-0.4],0,[true,false]],
	["Land_CncBarrierMedium_F",[0.651888,-3.76227,-0.4],238,[true,false]],
	["Land_CncBarrierMedium_F",[3.72917,-1.61683,-0.4],111.5,[true,false]],
	["FirePlace_burning_F",[-1.66703,-0.399602,0],46.8,[true,false]] 
];
if (WMS_exileFireAndForget)then {
	_objects = _objects + [
		["Exile_Plant_GreenBush8",[-4.71496,4.0092,0],46.8,[true,false]],
		["Exile_Plant_BrownBush",[-5.42459,3.02932,0],50.3,[true,false]],
		["Exile_Plant_GreenBush",[3.34835,2.50484,-1.12],202.7,[true,false]],
		["Exile_Plant_BrownBush",[5.28615,0.15877,0],185.3,[true,false]],
		["Exile_Plant_BrownBush",[1.54637,-6.25819,-0.41],331.8,[true,false]],
		["Exile_Plant_GreenBush8",[0.0612299,-6.84043,0],188.2,[true,false]],
		["Exile_Plant_GreenBush8",[7.40947,-1.36656,0],173.3,[true,false]],
		["Exile_Plant_GreenBush8",[0.751237,6.83554,0],265.8,[true,false]],
		["Exile_Plant_GreenBush8",[-1.49695,6.82255,0],241.6,[true,false]],
		["Exile_Plant_GreenBush",[5.33401,-5.43032,-1.47],262.7,[true,false]],
		["Exile_Plant_GreenBush",[-3.85773,-2.52316,-1.14],37.2,[true,false]]
	];
};
private _compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"]; //first spawn a reference object for the "modeltoworld"
_compoRefPoint setDir _dirPlayer;
{    
_object = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"];
_objList pushback _object; 
_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
_object setdir _dirPlayer + (_x select 2); 
_gradient = surfaceNormal position _object; 
_object setvectorup _gradient;
_object enableSimulationGlobal true; 
_object allowDamage false;
//uisleep 0.5; //delay between every objects creation //NOPE
} forEach _objects; 
WMS_Compo_BunkerCamp_LastTime = time;
publicVariable "WMS_Compo_BunkerCamp_LastTime";
 
if (_armed == 1) then {
	_campGrp1 = createGroup [BLUFOR, false];
	_campGrp2 = createGroup [BLUFOR, false];
	_campGrp3 = createGroup [BLUFOR, false];

	_unit1 = _campGrp1 createUnit ["B_G_Soldier_AR_F", _compoRefPoint modeltoworld [5.26382,-2.70993,0.00144], [], 3, "NONE"];
	_unit1 disableAI "PATH";
	_MGlist pushBack _unit1;
	_campGrp1 setFormDir (107.3 + _dirPlayer);
	_unit2 = _campGrp2 createUnit ["B_G_Soldier_AR_F", _compoRefPoint modeltoworld [-2.17281,4.64935,0.00144], [], 3, "NONE"];
	_unit2 disableAI "PATH";
	_MGlist pushBack _unit2;
	_campGrp2 setFormDir (356 + _dirPlayer);
	_unit3 = _campGrp3 createUnit ["B_G_Soldier_AR_F", _compoRefPoint modeltoworld [-1.28824,-4.45689,0.00144], [], 3, "NONE"];
	_unit3 disableAI "PATH";
	_MGlist pushBack _unit3;
	_campGrp3 setFormDir (234.4 + _dirPlayer);
	//"B_G_Soldier_AR_F" createUnit [_compoRefPoint modeltoworld [5.26382,-2.70993,0.00144], _campGrp1,"[this,'BunkerMG',0,(0.5 + random 0.4),_loadout] call WMS_fnc_DynAI_SetUnitBLU;"];
	//"B_G_Soldier_AR_F" createUnit [_compoRefPoint modeltoworld [-2.17281,4.64935,0.00144], _campGrp2,"[this,'BunkerMG',0,(0.5 + random 0.4),_loadout] call WMS_fnc_DynAI_SetUnitBLU;"];
	//"B_G_Soldier_AR_F" createUnit [_compoRefPoint modeltoworld [-1.28824,-4.45689,0.00144], _campGrp3,"[this,'BunkerMG',0,(0.5 + random 0.4),_loadout] call WMS_fnc_DynAI_SetUnitBLU;"];

	{_x setVariable ["WMS_RealFuckingSide",BLUFOR]}foreach _MGlist;
	//[_MGlist,'BunkerMG',0,(0.5 + random 0.4),_loadout] call WMS_fnc_DynAI_SetUnitBLU;
	//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
	[_MGlist,'BunkerMG',0,(0.6 + random 0.35),nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	deleteVehicle _compoRefPoint;
} else {
	deleteVehicle _compoRefPoint;
	};

WMS_AI_bluforPatrol_Running pushback [time,(time+(_timer+(random _timer))),[_campGrp1,_campGrp2,_campGrp3],[],_objList,[],[],"ALARM"];
