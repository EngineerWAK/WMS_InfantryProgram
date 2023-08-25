/**
* WMS_fnc_JudgementDay
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2023 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
/*
- Managed by 60s loop with WMS_JudgementDay_Run = true;
- Call from computer
- "JudgementDay" add action available if:
	-WMS_JudgementDay = true;
	-WMS_JudgementDay_Run = false;
	-respect level (5000)
	-enough buildings around //_houses = position _target nearObjects ["Building", _SpawnLootRad];
	-enough building positions available //_lootPos = selectRandom (_x buildingPos -1); /-1 will return all available building positions.
- up to 20 OPFOR (minimum 10, probably 2 different groups but 1 can also work) + at least 5 CIVILIAN, all CIVILIAN dead fail Judgement Day
- 10 Waves, maybe increase difficulty
- punisment if civilian killed + respawn a civilian and push him in the array
- 1 trigger zone server side for OPFOR presence, empty launch the next wave
- 1 trigger zone server side for CIVILIAN presence, empty fail the judgement Day
- 1 trigger zone server side for PLAYER presence, empty for x seconds fail the judgement Day
- 2 markers global "JudgementDay", probably red
- Crate paradrop if victory (remember that's about 200 NPCs to kill xD)
- Management array: [_playerObject,_pos(computer),_waveNumber(1 to 10),[_CIVgroup],[_OPFgroup],[not used yet],[_triggerOPF,_triggerCIV,_triggerPLAYER],[_markers],[_objectsOrMines]]; //_OPFORobjects will be destroyed if they leave the trigger
*/

if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS| _this = %1", _this]}; //if (WMS_IP_LOGs)
private ["_WHlist","_triggerOPF","_triggerCIV","_triggerPLAYER","_CIVgroup","_OPFgroup","_JMD_mkr1","_JMD_mkr2","_JMD_mkr3","_JMD_mkr4","_JMD_mkr5"];
params[  
	"_playerObject",
	"_pos",
	["_radius",WMS_JudgementDay_Rad]
];  
if(WMS_JudgementDay_Run)exitWith{diag_log "[JUDGEMENTDAY]|WAK|TNA|WMS| JudgementDay is fucked-up!!!"};
WMS_JudgementDay_Array set [0,_playerObject];
WMS_JudgementDay_Array set [1,_pos];
WMS_JudgementDay_Array set [2,1];
//create CIV group
_CIVgroup1 = createGroup [CIVILIAN,false];
_CIVgroup2 = createGroup [CIVILIAN,false];
_CIVgroup3 = createGroup [CIVILIAN,false];
_CIVgroup4 = createGroup [CIVILIAN,false];
_CIVgroup5 = createGroup [CIVILIAN,false];
WMS_JudgementDay_Array set [3, [_CIVgroup1,_CIVgroup2,_CIVgroup3,_CIVgroup4,_CIVgroup5]];

//create OPF group //DO NOT USE MULTI GROUP FOR NOW
_OPFgroup = createGroup [OPFOR,false];
WMS_JudgementDay_Array set [4, [_OPFgroup]];

//create markers
_JMD_mkr1 = createMarker ["JMD_mkr1", _pos];
_JMD_mkr1 setMarkerType WMS_JudgementDay_Mkr;
_JMD_mkr1 setMarkerText Format["%1's Judgement Day",(name _playerObject)];
_JMD_mkr1 setMarkerColor "colorBlack";
_JMD_mkr2 = createMarker ["JMD_mkr2", _pos];
_JMD_mkr2 setMarkerColor "colorOrange";
_JMD_mkr2 setMarkerShape "ELLIPSE";
_JMD_mkr2 setMarkerBrush "border";
_JMD_mkr2 setMarkerSize [300,300];
_JMD_mkr3 = createMarker ["JMD_mkr3", _pos];
_JMD_mkr3 setMarkerColor "colorCivilian";
_JMD_mkr3 setMarkerShape "ELLIPSE";
_JMD_mkr3 setMarkerBrush "border";
_JMD_mkr3 setMarkerSize [_radius,_radius];

_JMD_mkr4 = createMarker ["JMD_mkr4", _pos];
_JMD_mkr4 setMarkerColor "colorRed";
_JMD_mkr4 setMarkerShape "ELLIPSE";
_JMD_mkr4 setMarkerBrush "border";
_JMD_mkr4 setMarkerSize [_radius*1.5,_radius*1.5];
_JMD_mkr5 = createMarker ["JMD_mkr5", [(_pos select 0),(_pos select 1)+_radius*1.5]];
_JMD_mkr5 setMarkerType "mil_dot_noShadow";
_JMD_mkr5 setMarkerColor "colorRed";
_JMD_mkr5 setMarkerText "No Fly Zone";

//Prevent TheLastCartridges loot spawn in the zone
{_x setVariable ["_lootAllowed",false,true];}forEach (_pos nearObjects ["house", WMS_JudgementDay_Rad]); //that doesnt include later on "ruins"

//create Border objects
for '_i' from 0 to 360 step (250 / _radius)*2 do 
	{ 
		_posObjects = [(_pos select 0) + ((cos _i) * _radius), (_pos select 1) + ((sin _i) * _radius),1];
		_object = createVehicle ["VR_3DSelector_01_incomplete_F", _posObjects, [], 0, 'CAN_COLLIDE'];
		_object enableSimulation false;
		(WMS_JudgementDay_Array select 8) pushBack _object;
	};

//create triggers
_triggerNFZ = createTrigger ["EmptyDetector", _pos, true];
(WMS_JudgementDay_Array select 8) pushBack _triggerNFZ;
_triggerNFZ setTriggerArea [_radius*1.5, _radius*1.5, 0, false, _radius*1.5];   
_triggerNFZ setTriggerInterval 1;
_triggerNFZ setTriggerActivation ["EAST", "PRESENT", true];
_triggerNFZ setTriggerStatements [ //fucking 'helicopter' include 'Steerable_Parachute_F'
	"this && ({_x isKindOf 'helicopter' && !(_x isKindOf 'Steerable_Parachute_F')} count thisList) > 0",
	//"this && ({_x isKindOf 'helicopter'} count thisList) > 0",
	"
		{
			vehicle _x setFuel 0;
			vehicle _x setDamage 0.85;
		}forEach thisList;
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_NFZ_ACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, thisList = %2', thisTrigger, thisList]};
	", 
	"
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_NFZ_DEACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, thisList = %2', thisTrigge, thisList]};
	"
	];
if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_NFZ_CREATE]|WAK|TNA|WMS| _triggerNFZ = %1, _pos = %2, activated = %3', _triggerNFZ, _pos, (triggerActivated _triggerNFZ)]};

_triggerOPF = createTrigger ["EmptyDetector", _pos, true];
(WMS_JudgementDay_Array select 8) pushBack _triggerOPF;
_triggerOPF setTriggerArea [_radius, _radius, 0, false, _radius];
_triggerOPF setTriggerInterval 1;
_triggerOPF setTriggerActivation ["EAST", "PRESENT", true];
_triggerOPF setTriggerStatements [
	"this",
	"
		_pos = (WMS_JudgementDay_Array select 1);
		_OPFgroups =  (WMS_JudgementDay_Array select 4);
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_OPF_ACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _OPFgroups = %3', thisTrigger, _pos, _OPFgroups]};
	", 
	"
		_pos = (WMS_JudgementDay_Array select 1);
		_playerObject = (WMS_JudgementDay_Array select 0);
		_OPFgroups =  (WMS_JudgementDay_Array select 4);
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_OPF_DEACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _OPFgroups = %3', thisTrigger, _pos, _OPFgroups]};
		if (WMS_JudgementDay_Run) then {
			if ((WMS_JudgementDay_Array select 2) == 10) then {
				[_pos,_playerObject]call WMS_JMD_Heaven;
			}else{
				WMS_JudgementDay_Array set [2,((WMS_JudgementDay_Array select 2)+1)];
				{
					_grp = _x;
					if (count (units _grp) != 0) then {
						{
							_unit = _x;
							if (alive _unit) then {_unit setDamage 1; removeAllWeapons _unit;};
						}forEach (units _grp);
					};
					[_pos,_grp,_playerObject]spawn WMS_JMD_createOPF;
				}forEach _OPFgroups;
			};
		};
	"
	];
if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_OPF_CREATE]|WAK|TNA|WMS| _triggerOPF = %1, _pos = %2, activated = %3', _triggerOPF, _pos, (triggerActivated _triggerOPF)]};

_triggerCIV = createTrigger ["EmptyDetector", _pos, true]; //CIVILIAN Trigget doesnt seems to trigger any fucking things
(WMS_JudgementDay_Array select 8) pushBack _triggerCIV;
_triggerCIV setTriggerArea [_radius, _radius, 0, false, _radius]; 
_triggerCIV setTriggerInterval 1;
_triggerCIV setTriggerActivation ["CIV", "PRESENT", true];
_triggerCIV setTriggerStatements [
	"this",
	"
		_pos = (WMS_JudgementDay_Array select 1);
		_CIVgroups =  (WMS_JudgementDay_Array select 3);
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_CIV_ACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _CIVgroups = %3', thisTrigger, _pos, _CIVgroups]};
	", 
	"
		_pos = (WMS_JudgementDay_Array select 1);
		_playerObject = (WMS_JudgementDay_Array select 0);
		_CIVgroups =  (WMS_JudgementDay_Array select 3);
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_CIV_DEACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _CIVgroups = %3', thisTrigger, _pos, _CIVgroups]};
		if (WMS_JudgementDay_Run) then {
			[_pos,_playerObject]call WMS_JMD_Hell;
		};
	"
	];
if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_CIV_CREATE]|WAK|TNA|WMS| _triggerCIV = %1, _pos = %2, activated = %3', _triggerCIV, _pos, (triggerActivated _triggerCIV)]};

_triggerPLAYER = createTrigger ["EmptyDetector", _pos, true];
(WMS_JudgementDay_Array select 8) pushBack _triggerPLAYER;
_triggerPLAYER setTriggerArea [_radius, _radius, 0, false, _radius]; 
_triggerPLAYER setVariable ['WMS_JMD_PlayerTrigList', [],true]; 
_triggerPLAYER setTriggerInterval 1;
_triggerPLAYER setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
//_triggerPLAYER setTriggerStatements ["this && ({alive _x} count thislist) == 0", //no need, dead doesnt count
_triggerPLAYER setTriggerStatements ["this",
	"
		thisTrigger setVariable ['WMS_JMD_PlayerTrigList', thisList,true];
		_pos = (WMS_JudgementDay_Array select 1);
		_playerObject = (WMS_JudgementDay_Array select 0);
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_PLAYER_ACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _playerObject = %3, thisListVar = %4', thisTrigger, _pos, _playerObject, (thisTrigger getVariable ['WMS_JMD_PlayerTrigList', ['fuckedup']])]};
	", 
	"
		_pos = (WMS_JudgementDay_Array select 1);
		_playerObject = (WMS_JudgementDay_Array select 0);
		thisTrigger setVariable ['WMS_JMD_PlayerTrigList', thisList,true];
		if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_PLAYER_DEACTIVATE]|WAK|TNA|WMS| thisTrigger = %1, _pos = %2, _playerObject = %3, thisListVar = %4', thisTrigger, _pos, _playerObject, (thisTrigger getVariable ['WMS_JMD_PlayerTrigList', []])]};
		if (WMS_JudgementDay_Run) then {
			['JudgementDay zone delete in 30 secondes'] remoteExecCall ['SystemChat',0];
			[_pos,_playerObject,thisTrigger]spawn{
				uisleep 30;
				if (count ((_this select 2) getVariable ['WMS_JMD_PlayerTrigList', []]) == 0) then {
					[_this select 0,_this select 1]call WMS_JMD_Hell;
				};
			};
		};
	"
	];
if (true) then {diag_log format ['[JUDGEMENTDAY_TRIGGER_PLAYER_CREATE]|WAK|TNA|WMS| _triggerCIV = %1, _pos = %2, activated = %3', _triggerPLAYER, _pos, (triggerActivated _triggerPLAYER)]};

WMS_JMD_createOPF = {
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createOPF _this = %1", _this]}; //if (WMS_IP_LOGs)
	private ["_wave","_unitsClass","_houseCount","_houseCountMax","_launcherChance","_playerKills","_timeStart","_playerRep","_playersPosList","_spawnPosList","_houses","_posToPush","_spawnPos"];
	params[  
		"_pos",
		"_OPFgroup",
		["_playerObject",selectRandom allPlayers], //CAN NOT BE null
		["_count",10],
		["_skill",0.4],
		["_loadout", selectRandom ["BlackOps","livonia","tiger","scientist"]],
		["_difficulty", "difficult"]
	];
	uisleep 3;
	_wave = (WMS_JudgementDay_Array select 2);
	if (_wave == 10) then {_count = round(_count+(_count/2))};
	playSound3D ["A3\sounds_f\ambient\objects\bell_big.wss", player, false, [_pos select 0, _pos select 1, 100], 3, 1, 0];
	
	//a little rain Object before AI spawn
	_dropList = [];
	if(_wave == 1||_wave == 2)then{_dropList = (WMS_JudgementDay_Drop select 0)};
	if(_wave == 3||_wave == 4)then{_dropList = (WMS_JudgementDay_Drop select 1)};
	if(_wave == 5||_wave == 6)then{_dropList = (WMS_JudgementDay_Drop select 2)};
	if(_wave == 7||_wave == 8)then{_dropList = (WMS_JudgementDay_Drop select 3)};
	if(_wave == 9||_wave == 10)then{_dropList = (WMS_JudgementDay_Drop select 4)};
	_load = selectRandom _dropList;
	_alti = 80;
	_radius = 100;
	_iterO = 12;
	_delay = 0.25;
	if (_load == "rhs_ammo_nspn_red") then {_alti = 150;_delay = 1;};
	if (_load == "rhs_ammo_fakels") then {_alti = 65;_delay = 0.8;};
	if (_load == "rhs_ammo_m397" || _load == "rhs_rpg7v2_type63_airburst") then {_iterO = 8;_delay = 0.6; _alti = 350};
	if (_load == "vn_bomb_100_m47_wp_ammo"||_load == "vn_bomb_mk36_destructor_mine_ammo"||_load == "vn_bomb_750_m117_he_ammo") then {_delay = 1.6;_alti = 250;_iterO = 4;_radius = 150;};
	[_pos,_load,_radius,_alti,_iterO,_delay] spawn WMS_fnc_DynAI_RainObjects; //optional: _load,_radius,_altitude,_iterations,_delay
	uisleep 6;

	_unitsClass = selectRandom WMS_AMS_UnitClass;
	_timeStart = serverTime;
	_playerRep = 0;
	_playerKills = 100;
	_launcherChance = 15;
	_playersPosList = allPlayers select {alive _x && (_x distance2D _pos < WMS_JudgementDay_Rad)} apply {GetPosATL _x};
	_spawnPosList = [];
	_houseCountMax = 250;//about 6 secondes at sleep 0.025 //maximum house to look for positions, otherwise it can take "quite some time"...
	_houses = _pos nearObjects ["house", WMS_JudgementDay_Rad]; //building = 660 = 1752 positions...
	_houses = _houses select {!(typeOf _x in WMS_JudgementDay_Ban)};
	_houseCount = (count _houses);

	if (_houseCount < _houseCountMax) then {_houseCountMax = _houseCount};
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createOPF %1 buildings found in %2 secondes",_houseCount,(serverTime - _timeStart)]}; //if (WMS_IP_LOGs)
	/////Will be used later to modify NPCs skill/number
	if !(isnull _playerObject)then{
		//_playerRep = _playerObject getVariable ["exileScore",0];
		_playerKills = _playerObject getVariable ["exileKills",100];
	};
	if (_playerKills <= 99) then {_difficulty = "moderate"; _skill = 0.35};
	if (_playerKills >= 1000) then {_difficulty = "hardcore"; _skill = 0.5};
	if !(vehicle _playerObject iskindOf "man") then {_launcherChance = 100; _difficulty = "hardcore"; _skill = 0.85};
	/////
	uisleep 0.2;
	for "_i" from 1 to _houseCountMax do {
		_targetHouse = selectRandom _houses;
		_houses deleteAt (_houses find _targetHouse);
		{
			_posToPush = _x;
			{
				if (_posToPush distance2d _x > 25) then {
						_spawnPosList pushBack _posToPush;
					}else{
						if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createOPF Position %1 to close to player %2",_posToPush,_x]}; //if (WMS_IP_LOGs)
					};
			}forEach _playersPosList;
		}forEach (_targetHouse buildingPos -1);
		uisleep 0.02;
	};

	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createOPF %1 Building Positions found in %2 secondes",( count _spawnPosList),(serverTime - _timeStart)]}; //if (WMS_IP_LOGs)
	if (count _spawnPosList < _count) then {_count = (count _spawnPosList)};
	//display wave message to all players
	[[[format ['Judgement Day, Wave %1',_wave]]],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',-2];
	for "_i" from 1 to _count do {
		_spawnPos = selectRandom _spawnPosList;
		_spawnPosList deleteAt (_spawnPosList find _spawnPos);
		_unitsClass createUnit [_spawnPos, _OPFgroup];
		uisleep 0.1;
	};
	[(units _OPFgroup), "judgementday", _launcherChance, _skill,_difficulty,_loadout,nil,"JMD"] call WMS_fnc_SetUnits;
	uisleep 1;
	[_OPFgroup, _pos, (WMS_JudgementDay_Rad*0.5), 4, "MOVE", "AWARE", "YELLOW", "NORMAL", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
	
	//remove all weaponHolders in the zone
	[_pos]spawn WMS_JMD_RemoveWeapHold;

};
WMS_JMD_createCIV = {
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createCIV _this = %1", _this]}; //if (WMS_IP_LOGs)
	private ["_classNames","_unit","_posSafe"];
	params[  
		"_pos",
		"_CIVgroup",
		["_count",1]
	];
	_classNames = [
		"C_man_p_beggar_F","C_Man_casual_3_F","C_Man_casual_5_F","C_man_polo_1_F","C_Man_ConstructionWorker_01_Blue_F",
		"C_Driver_1_F","C_Man_Fisherman_01_F","C_Man_UtilityWorker_01_F","C_IDAP_Man_AidWorker_04_F","C_Man_Messenger_01_F"
		];
	_posSafe = [_pos, 25, 50, 3, 0, 0, 0,[],[[_pos],[_pos]]] call BIS_fnc_findSafePos;
	for "_i" from 1 to _count do {
		_unit = _CIVgroup createUnit [(selectRandom _classNames), _posSafe, [], 5, "NONE"];
	};
	
	_unit addEventHandler ["Hit", {
		params ["_unit", "_source", "_damage", "_instigator"];
		if (_damage >= 2) then {[_instigator,0.5]call WMS_fnc_PunishPunks;};
	}];

	_unit addEventHandler ["Killed", { 
		params ['_killed', '_killer', '_instigator', '_useEffects'];
		if (isPlayer _instigator)then{_killer = _instigator};
		if !((vehicle _killer) isKindOf 'man') then {
			{moveOut _x}forEach (crew (vehicle _killer));
		};
		if(isPlayer _killer) then {[_killer,0.8]call WMS_fnc_PunishPunks;};
		[_killed]spawn {
			uisleep 15;
			if (WMS_JudgementDay_Run) then {[(getPosATL (_this select 0)),(group (_this select 0))] call WMS_JMD_createCIV;};
			if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position (_this select 0)};
			deleteVehicle (_this select 0);
		};	
	}];

	_unit allowFleeing 0;
	_unit disableAI "SUPPRESSION";
	_unit disableAI "AUTOCOMBAT";
	_unit disableAI "COVER";
    _unit disableAI "AUTOTARGET";
    _unit disableAI "TARGET";
	_unit setVariable ["lambs_danger_disableAI", true];//deactivate LambsDanger
	_unit setVariable ["lambs_danger_disableGroupAI", true];//deactivate LambsDanger
	[_CIVgroup, _pos, (WMS_JudgementDay_Rad*0.7), 2, "MOVE", "CARELESS", "BLUE", "LIMITED", "COLUMN", "", [1,2,3]] call CBA_fnc_taskPatrol;
};
WMS_JMD_Hell = { //FAIL
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_Hell _this = %1", _this]}; //if (WMS_IP_LOGs)
	private ["_OPFgroups","_CIVgroups","_CIVunits","_OPFunits","_triggers","_markers","_objects"];
	params[  
		"_pos",
		"_playerObject"
	]; 
	WMS_JudgementDay_Run = false;
	publicVariable "WMS_JudgementDay_Run";
	_OPFgroups = WMS_JudgementDay_Array select 4;
	_CIVgroups = WMS_JudgementDay_Array select 3;
	_triggers = WMS_JudgementDay_Array select 6;
	_markers = WMS_JudgementDay_Array select 7;
	_objects = WMS_JudgementDay_Array select 8;

	{
		{ 
			if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x};
			deleteVehicle _x;
		} foreach units _x;
	} forEach _OPFgroups+_CIVgroups;
	{deleteVehicle _x;} foreach _objects; 
	{deleteMarker _x;} foreach _markers; 
	{deleteVehicle _x;} foreach _triggers;
	{deleteGroup _x;} forEach _OPFgroups+_CIVgroups;
	
	//FAIL message/sound
	playSound3D [getMissionPath	'Custom\Ogg\germanwin.ogg', player, false, _pos, 2, 1, 0];
	//WMS_triggCheck_T = WMS_triggCheck_T*0.5;
	WMS_JudgementDay_Array 	= [nil,[0,0,0],0,[],[],[],[],["JMD_mkr1","JMD_mkr2","JMD_mkr3","JMD_mkr4","JMD_mkr5"],[]];
	//display wave message to all players
	[[['Judgement Day Failed! HA HA!']],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',-2];
};
WMS_JMD_Heaven = {
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_Heaven _this = %1", _this]};
	private ["_rewards","_type","_OPFgroups","_CIVgroups","_CIVunits","_OPFunits","_triggers","_markers","_objects","_smoke","_phone","_crateOwner"];
	params[  
		"_pos",
		"_playerObject"
	];
	WMS_JudgementDay_Run = false;
	publicVariable "WMS_JudgementDay_Run";
	_rewards = [[11,1,3],[3,1,2],[5,1,2],[1,3,3],[0,0,0]];
	_difficulty = "easy";
	_playerKills = 0;
	if !(isnull _playerObject)then{
		//_playerRep = _playerObject getVariable ["exileScore",0];
		_playerKills = _playerObject getVariable ["exileKills",100];
	};
	if (_playerKills >= 1 || _playerKills <= 99) then {_difficulty = "moderate";};
	if (_playerKills >= 100 || _playerKills <= 999) then {_difficulty = "difficult";};
	if (_playerKills >= 1000) then {_difficulty = "hardcore";};
	_OPFgroups = WMS_JudgementDay_Array select 4;
	_CIVgroups = WMS_JudgementDay_Array select 3;
	_triggers = WMS_JudgementDay_Array select 6;
	_markers = WMS_JudgementDay_Array select 7;
	_objects = WMS_JudgementDay_Array select 8;

	{
		{ 
			if (alive _x) then {_x setDamage 1};
		} foreach units _x;
	} forEach _OPFgroups;
	{
		{ 
			if (WMS_magicSmoke) then {_Shaft = "CMflare_Chaff_Ammo" createVehicle position _x};
			deleteVehicle _x;
		} foreach units _x;
	} forEach _CIVgroups;
	{deleteVehicle _x;} foreach _objects; 
	{deleteMarker _x;} foreach _markers; 
	{deleteVehicle _x;} foreach _triggers;
	{deleteGroup _x;} forEach _OPFgroups+_CIVgroups;

	
	_talk = selectRandom ["usareasecure","usobjectivesecure","uspointcaptured","britareasecure","britobjectivesecure","britpointcaptured"];
	_music = selectRandom ["uswin","britwin"];
	_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
	[_crateOwner, _talk] remoteExec ['say3D',0,false];
	playSound3D [getMissionPath	format["Custom\Ogg\%1.ogg",_music], player, false, _pos, 2, 1, 0];

	
	_smoke = "SmokeShellBlue" createVehicle _pos;
	_phone = "Land_MobilePhone_old_F" createVehicle _pos;
	//_crateOwner = ([_pos, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
	if (WMS_IP_LOGs) then {diag_log format ["||||||||||CAPTUREZONE_OWNER|||||||||| %1",_crateOwner]};
	_phone setVariable ["AMS_UnlockedBy",[_crateOwner],true];
	_phone setVariable ["AMS_MissionID","CaptureZone",true];
	[_phone,[],_rewards,"military","Mission Reward",WMS_AMS_Crate_XL,_difficulty,150] spawn WMS_fnc_AMS_SpawnRewards;
	//WMS_triggCheck_T = WMS_triggCheck_T*0.5;
	WMS_JudgementDay_Array 	= [nil,[0,0,0],0,[],[],[],[],["JMD_mkr1","JMD_mkr2","JMD_mkr3","JMD_mkr4","JMD_mkr5"],[]];
	[[[format ['Judgement Day Victory... Paradroping Reward around %1',([(_pos select 0),(_pos select 1)])]]],'NOTI'] remoteExec ['WMS_fnc_displaykillStats',-2];
};
WMS_JMD_watch_OPF = {
	private ["_unitPos","_unitKicked","_smoke","_IR"];
	params[  
		["_unitsToWatch",[]]
	];
	{
		_unitPos = _x getVariable ["WMS_lastPos",(position _x)];
		_unitKicked = _x getVariable ["WMS_kickass",0];
		if ((position _x) distance2d _unitPos <= 5) then {
			if (_unitKicked == 6) then {
				_smoke = "SmokeShellYellow" createVehicle (position _x);
				_smoke attachTo [_x, [0, 0, 0]];
				_IR = "I_IRStrobe" createVehicle (position _x);
				_IR attachTo [_x, [0, 0, 0]];
				_x setVariable ["lambs_danger_disableAI", true];
			}else{
				if (_unitKicked == 9) then {
					//could paradrop the dude 100m above his position to unstuck him
					/*selectRandom ["SmokeShellPurple","mini_Grenade","GrenadeHand"] createVehicle position _x;
					_x setDamage 1;*/
					_x addBackpack "B_Parachute";
					_x setpos [_unitPos select 0, _unitPos select 1, 100];
					_smoke = "SmokeShellPurple" createVehicle (position _x);
					_smoke attachTo [_x, [0, 0, 0]];
				}else {
					if (_unitKicked == 12) then {
						selectRandom ["mini_Grenade","GrenadeHand"] createVehicle position _x;
						_x setDamage 1;
					};
				};
			};
			_x setVariable ["WMS_kickass",(_unitKicked+1)];
		}else{
			if (_unitKicked != 0) then {
				_x setVariable ["WMS_kickass",0];
			};
			_x setVariable ["WMS_lastPos",position _x];
		};
	}forEach _unitsToWatch;
};
WMS_JMD_RemoveWeapHold = {
	private ["_WHlist"];
	params[  
		"_pos"
	];
	_WHlist = (_this select 0) nearEntities [["weaponHolder","GroundWeaponHolder","WeaponHolderSimulated"], WMS_JudgementDay_Rad];
	{clearItemCargoGlobal _x; deleteVehicle _x;uisleep 0.1}forEach _WHlist;
	if (true) then {diag_log format ["[JUDGEMENTDAY]|WAK|TNA|WMS|WMS_JMD_createOPF Removing %1 weaponHolder",( count _WHlist)]}; //if (WMS_IP_LOGs)
};
WMS_JMD_hideFallenTrees = {
	private ["_list"];
	params[  
		"_pos"
	];
	_list = nearestTerrainObjects [_pos, ['Tree','small tree', 'Bush'], WMS_JudgementDay_Rad] select {damage _x == 1};
	{_x hideObjectGlobal true} forEach _list;
};

[[['JUDGEMENT DAY']],'NOTIRED'] remoteExec ['WMS_fnc_displaykillStats',-2];

//create OPF
{[_pos,_x,_playerObject]spawn WMS_JMD_createOPF}forEach [_OPFgroup];
uisleep 13;
//create CIV
{[_pos,_x]call WMS_JMD_createCIV}forEach [_CIVgroup1,_CIVgroup2,_CIVgroup3,_CIVgroup4,_CIVgroup5];
uisleep 2;
//WMS_triggCheck_T = WMS_triggCheck_T*2; //slowDown the triggers, will have to work on that to not slow down ALL the triggers
WMS_JudgementDay_Run = true;
publicVariable "WMS_JudgementDay_Run";