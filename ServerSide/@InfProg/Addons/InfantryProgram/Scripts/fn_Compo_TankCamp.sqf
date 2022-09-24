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
// [player, position player, getDir player, (1800 + random 1800), 1, 999] call WMS_fnc_Compo_R2D2Camp;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[TANK CAMP]|WAK|TNA|WMS| _this = %1", _this];};
[(_this select 0),(_this select 1),(_this select 2),(_this select 3),(_this select 4),(_this select 5)] spawn {
private _target = (_this select 0); //player 
private _pos = (_this select 1); //position player //[x,y,z]
private _dirPlayer = (_this select 2); //getDir player 
private _timer = (_this select 3); //1800
private _armed = (_this select 4); //0 - 1 - 2 
private _amount = (_this select 5); //price or '999 will be the magic number for non poptabs check'
private _Loadout = selectRandom ["AOR2","scorpion","tiger","fleck"];
private _objList = [];
private _MGList = [];
private _lockerMoney = 0;

if (_Loadout == "M90") then {_Loadout = WMS_Loadout_M90};
if (_Loadout == "scorpion") then {_Loadout = WMS_Loadout_Scorpion};
if (_Loadout == "tiger") then {_Loadout = WMS_Loadout_Tiger};
if (_Loadout == "fleck") then {_Loadout = WMS_Loadout_DEfleck};
if (_amount == 999) then { _lockerMoney = "Lets Punch It" } else { 
	////////////////////////////////////////////////////////NEED TO CONVERT///////////////////////////////////////////////////////////////
	_lockerMoney = _target getVariable ['ExileLocker', 0];
	if(_lockerMoney > _amount) then
    { 
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
		if (WMS_exileToastMsg) then {["toastRequest", ["ErrorTitleOnly", ["Earth to earth, ashes to ashes, dust to dust"]]] call ExileServer_system_network_send_broadcast};
		_Target allowDamage true;
		private _fire = "test_EmptyObjectForFirebig" createVehicle [0,0,0]; 
		_fire attachto [_target,[0,0,0]]; 
		playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", _target, false, _pos, 3, 1, 0];
	};
	////////////////////////////////////////////////////////NEED TO CONVERT///////////////////////////////////////////////////////////////
};
private _objects = [
	[WMS_CamoNet_Big,[0.0238766,1.06157,0],186.275,[true,false],""],
	//["Land_Cargo10_military_green_F",[3.97193,5.09205,0],271.594,[true,false],""], //keep bumping around
	/*["Exile_Plant_GreenBush",[1.45739,13.0206,-0.7],312.894,[true,false],""],
	["Exile_Plant_GreenBush8",[5.31549,-6.15171,0],171.201,[true,false],""],
	["Exile_Plant_GreenBush2",[4.93303,-6.43806,0],125.189,[true,false],""],
	["Exile_Plant_GreenBush",[-9.89134,0.0535841,0],216.237,[true,false],""],
	["Exile_Plant_GreenBush",[5.69931,5.43953,-0.9],210.229,[true,false],""],
	["Exile_Plant_GreenBush8",[6.53791,9.58297,0],84.7744,[true,false],""],
	["Exile_Plant_GreenBush6",[-5.86035,11.5124,-0.6],51.1198,[true,false],""],
	["Exile_Plant_GreenBush8",[-6.69421,-5.18543,0],239.33,[true,false],""],
	["Exile_Plant_BrownBush",[-8.55484,9.36158,0],226.151,[true,false],""],
	["Exile_Plant_BrownBush",[5.22773,10.7218,0],226.151,[true,false],""],*/
	["Land_HBarrier_1_F",[3.97193,5.09205,0],271.594,[true,false],""],
	["Land_CncBarrierMedium_F",[3.91938,10.7562,0],194.403,[true,false],""],
	["Land_CncBarrierMedium_F",[1.96524,11.1013,0],184.798,[true,false],""],
	["Land_CncBarrierMedium_F",[0.0654437,11.1434,0],0,[true,false],""],
	["Land_CncBarrierMedium_F",[-1.88805,11.0048,0],170.651,[true,false],""],
	["Land_CncBarrierMedium_F",[-3.78914,10.4821,0],159.794,[true,false],""],
	["Land_CncBarrierMedium_F",[-5.58273,9.62096,0],148.933,[true,false],""],
	["Land_CncBarrierMedium_F",[-7.18,8.374,0],134.848,[true,false],""],
	["Land_CncBarrierMedium_F",[-8.43552,6.79446,0],122.86,[true,false],""],
	["Land_CncBarrierMedium_F",[6.06258,3.671,0],258.39,[true,false],""],
	["Land_CncBarrierMedium_F",[6.36497,1.77413,0],264.252,[true,false],""],
	["Land_CncBarrierMedium_F",[6.33179,-0.180692,0],276.024,[true,false],""],
	["Land_CncBarrierMedium_F",[5.84244,-2.10281,0],291.481,[true,false],""],
	["Land_HBarrier_Big_F",[-0.228176,-2.85691,0],0,[true,false],""],
	["Land_HBarrier_3_F",[1.50991,-3.02782,1.75875],0,[true,false],""],
	["Land_HBarrier_3_F",[-1.82742,-3.02377,1.78115],0,[true,false],""],
	["Land_HBarrier_3_F",[-5.93708,4.58045,0],90,[true,false],""],
	["Land_HBarrier_3_F",[-5.92062,1.119,0],90,[true,false],""],
	["Land_HBarrier_3_F",[-5.51784,-1.88333,0],75.2711,[true,false],""],
	["Land_HBarrier_1_F",[5.6227,9.73506,0],0,[true,false],""],
	["Land_HBarrier_1_F",[3.39805,7.61666,0],0,[true,false],""],
	["Land_BagFence_Long_F",[-1.26953,-6.11933,0],1.35599,[true,false],""],
	["Land_BagFence_Long_F",[-4.25237,-5.85782,0],8.91847,[true,false],""],
	["Land_BagFence_Long_F",[1.69756,-6.128,0],0,[true,false],""],
	["Land_BagFence_Round_F",[-6.17464,-4.62506,0],69.8086,[true,false],""],
	["Land_BagFence_Round_F",[4.47528,-5.66262,0],320.881,[true,false],""]
];
private _compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
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
uisleep 0.5;
} forEach _objects;

private _vhl = [_compoRefPoint modeltoworld [-0.639104,6.87322,0], _dirPlayer, "B_T_AFV_Wheeled_01_up_cannon_F", BLUFOR] call bis_fnc_spawnvehicle;
private _vehic = (_vhl select 0);
private _grpVhl =  (_vhl select 2);

_vehic setVehicleLock "LOCKEDPLAYER";
{
  removeAllItems _x;
  removeAllWeapons _x;
  removeBackpackGlobal _x; 
	_x forceaddUniform selectrandom (_loadout select 0); 
	_x addVest selectrandom (_loadout select 1); 
	_x addHeadGear selectrandom (_loadout select 2);
	_x additem "FirstAidKit";
	_x disableAI "PATH";
	_x allowfleeing 0;   
	_x setSkill (0.6 + random 0.35);
	_x addEventHandler ["killed", "
			removeAllWeapons (_this select 0);
			if (isplayer (_this select 1) && (damage (_this select 1) < 0.9)) then {
			deleteVehicle (_this select 0);
			(_this select 1) setdamage (damage(_this select 1)+0.25);
			private _msgx = format ['%2 is a Dick, he killed %1', (_this select 0), (_this select 1)];
			diag_log _msgx;
			private _sessionID = (_this select 1) getVariable ['ExileSessionID',''];
			[_sessionID, 'toastRequest', ['ErrorTitleAndText', ['STOP doing that, Dick!', '-25 heath']]] call ExileServer_system_network_send_to;
			};
		"];
} forEach units _grpVhl;
WMS_Compo_TankCamp_LastTime = time;
publicVariable "WMS_Compo_TankCamp_LastTime";

if (_armed == 1) then {  
	deleteVehicle _compoRefPoint;
} else {
	deleteVehicle _compoRefPoint};

WMS_AI_bluforPatrol_Running pushback [time,(time+(_timer+(random _timer))),[_grpVhl],[_vehic],_objList,[],[],"ALARM"];
};
/*
uisleep _timer; 
playSound3D ["A3\Sounds_F\sfx\siren.wss", _target, false, _pos, 2, 1, 0]; 
uisleep 5; 
{deletevehicle _x} foreach _objList;
if (_armed == 1) then { 
	{deletevehicle _x} foreach _MGList;
};
*/