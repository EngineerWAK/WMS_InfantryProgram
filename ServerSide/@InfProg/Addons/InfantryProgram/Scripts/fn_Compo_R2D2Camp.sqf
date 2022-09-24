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
if (WMS_IP_LOGs) then {diag_log format ["[R2D2 CAMP]|WAK|TNA|WMS| _this = %1", _this];};

params [
	"_target", //player 
	"_pos", //position player //[x,y,z]
	["_dirPlayer", random 359], //getDir player 
	["_timer",1800], //1800
	["_armed", 0], //0 - 1
	["_amount", 999], //price or '999 will be the magic number for non poptabs check'
	["_Loadout", selectRandom ["AOR2","scorpion","tiger","fleck"]]
];
private _objList = [];
private _MGList = [];
private _campGrp1 = grpNull;
private _campGrp2 = grpNull;
private _lockerMoney = 0;
if (_amount == 999) then { _lockerMoney = "Lets Punch It" } else { 
	////////////////////////////////////////////////////////NEED TO CONVERT///////////////////////////////////////////////////////////////
	_lockerMoney = _target getVariable ['ExileLocker', 0];
	if(_lockerMoney > _amount) then //this is the second check, shouldnt be false.
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
		playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", _target, false, _pos, 3, 1, 0]; //todo: check if _target will work if its not a player.
	};
	////////////////////////////////////////////////////////NEED TO CONVERT///////////////////////////////////////////////////////////////
};
private _objects = [
	[WMS_CamoNet_Open,[0,0,0.15],0,[true,false],""],
	["FirePlace_burning_F",[-0.318713,-2.56857,0],0,[true,false],""],
	["Land_BagBunker_Small_F",[5.493,1.88,-0.1],243.565,[true,false],""],
	["Land_BagBunker_Small_F",[-5.402,-2.326,-0.1],72.184,[true,false],""],
	["Land_Cargo10_military_green_F",[-6.83578,3.39553,0],204.754,[true,false],""],
	["Land_Cargo10_military_green_F",[2.239,-4.687,0],29.419,[false,false],""],
	["Land_SandbagBarricade_01_half_F",[-0.630698,-4.71022,0],191.597,[true,false],""],
	["Land_SandbagBarricade_01_half_F",[-7.79594,0.178159,0],265.561,[true,false],""], 
	["Land_SandbagBarricade_01_half_F",[4.61476,6.74527,0],78.0364,[true,false],""],
	["Land_SandbagBarricade_01_half_F",[-4.96744,7.05126,0],285.291,[true,false],""],
	["Land_SandbagBarricade_01_half_F",[4.56607,-0.842351,0],124.703,[true,false],""],
	["Land_CncBarrierMedium_F",[-4.689,-1.484,-0.3],72.908,[true,false],""],
	["Land_CncBarrierMedium_F",[4.855,0.98,-0.3],241.946,[true,false],""],
	["Land_CncBarrierMedium_F",[3.70665,8.5644,0],227.677,[true,false],""],
	["Land_CncBarrierMedium_F",[1.94543,9.70447,0],197.507,[true,false],""],
	["Land_CncBarrierMedium_F",[-0.0321091,9.97747,0],0,[true,false],""],
	["Land_CncBarrierMedium_F",[-2.00513,9.71969,0],163.197,[true,false],""],
	["Land_CncBarrierMedium_F",[-3.79635,8.75779,0],139.977,[true,false],""],
	["Land_CncBarrierMedium_F",[-0.966874,3.38884,0],0,[true,false],""],
	["Land_CncBarrierMedium_F",[1.09108,3.41976,0],0,[true,false],""],
	["Land_SatelliteAntenna_01_F",[2.01019,-0.0339792,0],104.463,[true,false],""],
	["Land_SandbagBarricade_01_F",[-4.62424,0.325599,0],281.076,[true,false],""],
	["Land_SandbagBarricade_01_F",[3.3526,4.15919,0],58.8633,[true,false],""],
	["Land_SandbagBarricade_01_hole_F",[-2.91534,-4.14705,0],193.82,[true,false],""],
	["Land_SandbagBarricade_01_hole_F",[-3.89105,4.26703,0],308.704,[true,false],""],
	["Land_SandbagBarricade_01_hole_F",[4.8321,-3.65633,0],129.86,[true,false],""]
];
if (WMS_exileFireAndForget)then {
	_objects = _objects + [
		["Exile_Plant_GreenBush",[3.45965,-5.32192,-0.7],296.67,[true,false],""],
		["Exile_Plant_GreenBush8",[8.91142,1.12564,0],0,[true,false],""],
		["Exile_Plant_GreenBush2",[7.55099,-0.37341,0],125.893,[true,false],""],
		["Exile_Plant_BrownBush",[-1.7893,-5.10763,-0.3],0,[true,false],""],
		["Exile_Plant_BrownBush",[7.24822,4.0666,-0.38],138.196,[true,false],""],
		["Exile_Plant_GreenBush",[3.86082,8.30672,-0.97],218.782,[true,false],""],
		["Exile_Plant_BrownBush",[2.1598,11.5483,0],32.7848,[true,false],""],
		["Exile_Plant_GreenBush8",[-2.49951,10.3233,0],0,[true,false],""],
		["Exile_Plant_BrownBush",[-6.09815,-5.0725,-0.32],32.7848,[true,false],""],
		["Exile_Plant_GreenBush",[-9.39483,-2.70773,-1.88],216.778,[true,false],""],
		["Exile_Plant_BrownBush",[-5.69135,8.28114,0],301.263,[true,false],""],
		["Exile_Plant_GreenBush8",[-8.80779,1.24306,0],0,[true,false],""]
	];
};
private _compoRefPoint = createVehicle ["VR_Area_01_circle_4_yellow_F", _pos, [], 0, "CAN_COLLIDE"]; //first spawn a reference object for the "modeltoworld"
_compoRefPoint setDir _dirPlayer;

private _vhl = [_compoRefPoint modeltoworld [0.0260779,7.3876,0], _dirPlayer, "B_AAA_System_01_F", BLUFOR] call bis_fnc_spawnvehicle;
private _grpVhl =  (_vhl select 2);
private _vehic = (_vhl select 0);
_vehic setObjectTextureGlobal [0, "a3\static_f_jets\aaa_system_01\data\aaa_system_01_olive_co.paa"];
_vehic setObjectTextureGlobal [1, "a3\static_f_jets\aaa_system_01\data\aaa_system_02_olive_co.paa"];

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
} forEach _objects; 
WMS_Compo_R2D2Camp_LastTime = time;
publicVariable "WMS_Compo_R2D2Camp_LastTime";

if (_armed == 1) then { 
	 _campGrp1 = createGroup [BLUFOR, false];
	 _campGrp2 = createGroup [BLUFOR, false];
	_unit1 = _campGrp1 createUnit ["B_G_Soldier_AR_F", _compoRefPoint modeltoworld [6.32544,2.29013,0], [], 3, "NONE"];
	_unit1 disableAI "PATH";
	_MGlist pushBack _unit1;  
	_campGrp1 setFormDir (63.2 + _dirPlayer);
	_unit2 = _campGrp1 createUnit ["B_G_Soldier_AR_F", _compoRefPoint modeltoworld [-6.39924,-2.65703,0], [], 3, "NONE"];
	_unit2 disableAI "PATH";
	_MGlist pushBack _unit2;  
	_campGrp2 setFormDir (245.2 + _dirPlayer);
	
	{_x setVariable ["WMS_RealFuckingSide",BLUFOR]}foreach _MGlist;
	//[_MGlist,'BunkerMG',0,(0.5 + random 0.4),_loadout] call WMS_fnc_DynAI_SetUnitBLU;
	//[_units,_unitFunction,_launcherChance,_skill,_difficulty,_loadout,_weaps,_info]; //NEW
	[_MGlist,'BunkerMG',0,(0.5 + random 0.4),nil,_loadout,nil,"DYNAI"] call WMS_fnc_SetUnits;
	deleteVehicle _compoRefPoint;  
} else {
	deleteVehicle _compoRefPoint;
};

WMS_AI_bluforPatrol_Running pushback [time,(time+(_timer+(random _timer))),[_grpVhl,_campGrp1,_campGrp2],[_vehic],_objList,[],[],"ALARM"];
