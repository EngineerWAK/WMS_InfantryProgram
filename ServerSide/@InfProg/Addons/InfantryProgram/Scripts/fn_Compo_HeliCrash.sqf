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
// [[0,0,0],random 359,2+random 2, false] call WMS_fnc_Compo_HeliCrash;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[HELICRASH]|WAK|TNA|WMS| _this = %1", _this];};
private ["_objList","_objects","_compoRefPoint","_Grp","_staticList","_triggCapture","_sound"];
params[  
		"_pos",  
		["_dir", (random 359)],  
		["_guard", (2 + (round (random 2)))],  
		["_armed", false], 
		["_skill", (0.2+(random 0.6))],
		["_loadout", "army"],
		["_statics", ["O_HMG_01_high_F","O_GMG_01_high_F"]],
		["_wrecks", ["Land_Wreck_Heli_Attack_01_F","Land_Wreck_Heli_Attack_02_F","Land_UWreck_Heli_Attack_02_F","Land_UWreck_MV22_F","Land_Wreck_Plane_Transport_01_F"]],
		["_crates", ["CargoNet_01_box_F"]]
];

_sound = selectRandom ["helicrash","helicrash"];
playSound3D [MISSION_ROOT+format["Custom\Ogg\%1.ogg",_sound], _pos, false, _pos, 3, 1, 0];

_objects = [
	[(selectRandom _wrecks),[3.4,-2.2,0],0],
	["test_EmptyObjectForSmoke",[3.4,-2.2,0],0],
	[WMS_OPFOR_Flag,[-0.2,2.3,0],0], //should be _compoRefPoint, not the crate
	[WMS_CamoNet_Open,[-6.5,1.5,0],284],
	["Land_BagBunker_Small_F",[10.8,1.9,0],245.7],
	["Land_SandbagBarricade_01_half_F",[11.8,-1.4,0],97.2],
	["Land_SandbagBarricade_01_half_F",[10.7,-4.4,0],127.9],
	["Land_WoodenCrate_01_stack_x3_F",[2.5,8.24577,0],0],
	["Land_CratesWooden_F",[-5.3,6.1,0],0],
	["Land_WoodenCrate_01_F",[-1.8,9.4,0],27.5],
	["Land_WoodenCrate_01_stack_x5_F",[-7,3.2,0],134.3],
	["Land_WoodenBox_F",[-7.7,0.5,0],70.7],
	["Land_PaperBox_01_small_stacked_F",[-8.1,-2.5,0],62.1],
	["Land_SandbagBarricade_01_half_F",[9.1,5.4,0],35.3],
	["Campfire_burning_F",[6.6,7.1,0],0],
	["Land_SandbagBarricade_01_half_F",[-9.9,5.1,0],280.7],
	["Land_SandbagBarricade_01_half_F",[-10.8,0.1,0],266.7],
	["Land_SandbagBarricade_01_half_F",[-10.2,-4.4,0],217.3]
];
_objList = [];
_compoRefPoint = createVehicle [(selectRandom _crates), _pos, [], 0, "NONE"];
_compoRefPoint setVariable ['opened', false, true];
_compoRefPoint setVariable ['openedTime', WMS_ServRestartSeconds, true];
_compoRefPoint setDir _dir;
[_compoRefPoint, _compoRefPoint] call ace_common_fnc_claim;

{     
	_object = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"];
	_objList pushback _object; 
	_objectVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
	_object setposATL [(_objectVectoriel select 0),(_objectVectoriel select 1),((_x select 1) select 2)];
	_object setdir _dir + (_x select 2); 
	_gradient = surfaceNormal position _object; 
	_object setvectorup _gradient;
	_object enableSimulationGlobal true; 
	_object allowDamage false;
	uisleep 0.25;
} forEach _objects;
[_compoRefPoint] call WMS_fnc_AMS_FillStuff;
if (WMS_exileToastMsg) then {
	["toastRequest", ["InfoTitleAndText", ["Infantry Program", "An helicopter has crashed, find it!"]]] call ExileServer_system_network_send_broadcast;
	} else {
		//["EventWarning", ["Disable the nuke",""]] call BIS_fnc_showNotification;
		["TaskAssigned", ["Infantry Program", "An helicopter has crashed, find it!"]] remoteExec ["BIS_fnc_showNotification", -2];
	};

	_triggCapture = createTrigger ["EmptyDetector", _pos, true]; 
	_triggCapture setVariable ["smoke", (_objList select 1), false];  
	_triggCapture setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
	_triggCapture setTriggerArea [15, 15, 0, false];
	_triggCapture setTriggerStatements  
	[ 
  		"this",  
  		"
			_crate = thisTrigger getVariable 'crate';
			_crate setVariable ['opened', true, true];
			_crate setVariable ['openedTime', time, true];
			deleteVehicle (thisTrigger getVariable 'smoke');
			deleteVehicle thisTrigger;
		",  
  		"" 
	];

if (_guard > 0) then {
	_Grp = creategroup [OPFOR, true];
	for "_i" from 1 to _guard do {
		WMS_AMS_UnitClass createUnit [_pos, _Grp];
		uisleep 0.2;
	};
	//[(units _Grp),'Assault',15,_skill,_loadout] call;
	[(units _Grp),'Assault',15,_skill,nil,_loadout,nil,"HeliCrash"] call WMS_fnc_SetUnits;
	if (_armed) then {
		_staticList = [
			[(selectRandom _statics),[-3.84341,0.221521,0],281.969,[true,true]],
			[(selectRandom _statics),[10.6797,1.70858,0],66.9201,[true,true]]
		];
		{     
			_gun = createVehicle [(_x select 0), (_compoRefPoint modeltoworld [(_x select 1 select 0),(_x select 1 select 1),(_x select 1 select 2)]), [], 0, "CAN_COLLIDE"];
			_objList pushback _gun; 
			_gunVectoriel = (_compoRefPoint modeltoworld  [(_x select 1 select 0),(_x select 1 select 1),0]);
			_gun setposATL [(_gunVectoriel select 0),(_gunVectoriel select 1),((_x select 1) select 2)];
			_gun setdir _dir + (_x select 2); 
			_gradient = surfaceNormal position _gun; 
			_gun setvectorup _gradient;
			_gun enableSimulationGlobal true; 
			_gun allowDamage true;
			_Grp addVehicle _gun;
			uisleep 0.1;
		} forEach _staticList;
	};
	[_Grp, _Pos, 50, 4, "MOVE", "STEALTH", "YELLOW", "NORMAL", "STAG COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	{	
		_x setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
		_x setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
	}forEach units _grp;
};
//WMS_DynAI_Running pushback [time,(time+(_timer)),_grps,[],_objList,[],[],"ALARM"];
