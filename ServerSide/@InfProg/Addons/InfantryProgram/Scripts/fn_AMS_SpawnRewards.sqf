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
//[_target,"Mission Reward",WMS_AMS_Crate_L,200,false,"SmokeShellGreen","chemlight_Green"] spawn WMS_fnc_paradrop_RLA_Unified;
//[_target,_rwds,_lootCount,_lootType,_Msg,_load,_difficulty,_Altitude,_SmokeColor,_LightColor] spawn WMS_fnc_AMS_SpawnRewards;
//["object",[]] spawn WMS_fnc_AMS_SpawnRewards;

private [];
params[
	"_target", //flag for missions, _smoke for Capture Zone //smoke doesnt work properly
	"_rwds", //array of objects to fill/unlock
	["_lootCount",[[1,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]]], //[_weap,_bag,_items,_ammoList,_mag]
	["_lootType", "military", [""]],
	["_Msg", "Mission Reward", [""]],  
	["_load", WMS_AMS_Crate_L, [""]],
	["_difficulty", "Moderate"],  
	["_Altitude", 200, []],
	["_SmokeColor","SmokeShellGreen", [""]], //"none"
	["_LightColor","F_Signal_green", [""]] //"none"
];
//[_smoke,[],[[3,1,2],[1,1,2],[3,1,2],[1,3,3],[0,0,0]],"military","Recon Mission Crate",nil,"hardcore",150] spawn WMS_fnc_AMS_SpawnRewards;
if (WMS_IP_LOGs) then {diag_log format ["[AMS REWARDS]|WAK|TNA|WMS| _this = %1 *****", _this]};

if (WMS_exileToastMsg) then {["toastRequest", ["InfoTitleAndText", ["AIR ASSISTANCE", format ["%1 on the way!",_Msg]]]] call ExileServer_system_network_send_broadcast;};

playSound3D ["a3\dubbing_radio_f\Sfx\out2c.ogg", _target, false, position _target, 1,1,0];

private _para = WMS_para_Big;
private _parachute = ObjNull;
private _cargo = ObjNull;
private _speaker = [];
Private _smallParaList = ["Box_T_East_Wps_F",WMS_AMS_Crate_S];
if (_load in _smallParaList) then {_para = WMS_para_small};
private _FrontBack 	= (-50 +( random 100));
private _posATL 	= getPosATL _target;
private _posPara 	= [getpos _target select 0, getpos _target select 1, _altitude];
private _posVector 	= _target modelToWorld [0, _FrontBack, _altitude];
if ((count _rwds) == 0) then {
	_parachute 	= createVehicle [_para,_posPara, [], 5];
	_parachute 	setdir winddir;
	_parachute 	setPos (_posVector);
	_parachute 	setvelocity [0,0,-8];

	_cargo = createVehicle [_load ,_posPara, [],5];
	clearMagazineCargoGlobal _cargo; 
	clearWeaponCargoGlobal _cargo; 
	clearItemCargoGlobal _cargo; 
	clearBackpackCargoGlobal _cargo; 
	_cargo allowdamage false;
	_cargo attachTo [_parachute,[0,0,0]];

	if (_msg == "Mission Reward") then {
			//no heli/plane sound for mission reward yet
		} else {
			playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _target, false, _posATL, 3, 1, 0];
		};
} else {
	if (typeName (_rwds select 0) == "OBJECT") then {
		_cargo = (_rwds select 0);//if reward(s) already created just fill it and no paradrop
	}else {
		if (typeName (_rwds select 0) == "STRING") then {		
			_parachute 	= createVehicle [_para,_posPara, [], 5];
			_parachute 	setdir winddir;
			_parachute 	setPos (_posVector);
			_parachute 	setvelocity [0,0,-8];

			_cargo = createVehicle [(_rwds select 0) ,_posPara, [],5];
			clearMagazineCargoGlobal _cargo; 
			clearWeaponCargoGlobal _cargo; 
			clearItemCargoGlobal _cargo; 
			clearBackpackCargoGlobal _cargo; 
			_cargo allowdamage false;
			_cargo attachTo [_parachute,[0,0,0]];
			playSound3D ["a3\dubbing_f\modules\supports\drop_accomplished.ogg", _target, false, position _target, 2,0.94,0];
		};
	};	
};

clearMagazineCargoGlobal _cargo; 
clearWeaponCargoGlobal _cargo; 
clearItemCargoGlobal _cargo; 
clearBackpackCargoGlobal _cargo;
private _poptabs = (WMS_AMS_PoptabsRwd select 0) + round (random(WMS_AMS_PoptabsRwd select 1));
private _weapList = (WMS_Loadout_SMG select 0)+(WMS_Loadout_Sniper select 3);
private _bagList = (WMS_Loadout_AOR2 select 3)+(WMS_Loadout_M90 select 3)+(WMS_Loadout_Scorpion select 3)+(WMS_Loadout_Tiger select 3);
private _itemList = WMS_AI_inventory;

switch (toLower _lootType) do {
	case "military" : {_itemList = WMS_AI_inventory;};
	case "supply" 	: {_itemList = WMS_SupplyList+WMS_ToolList;};
	case "food" 	: {_itemList = WMS_MeatList;};
	case "meds" 	: {_itemList = WMS_medsList;};
	case "random"	: {_itemList = WMS_AI_inventory+WMS_SupplyList+WMS_ToolList+WMS_MeatList;};
};
switch (toLower _difficulty) do {
	case "easy"			: {};
	case "moderate" 	: {
		_weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_SMG select 0)+(WMS_Loadout_Sniper select 3);
		_poptabs = round _poptabs*1.5;
	};
	case "difficult" 	: {
		_weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_DMR select 0)+(WMS_Loadout_SMG select 0)+(WMS_Loadout_Sniper select 3);
		_itemList = _itemList+[WMS_Utility_Item_1];
		_poptabs = _poptabs*2;
	};
	case "hardcore" 	: {
		_weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_DMR select 0)+(WMS_Loadout_Sniper select 0)+(WMS_Loadout_MG select 0)+(WMS_Loadout_Sniper select 3);
		_itemList = _itemList+[WMS_Utility_Item_1,WMS_Utility_Item_2];
		_poptabs = round _poptabs*2.5;
	};
};
private _weaps = [];
private _bags = [];
private _items = [];
private _ammoList = [];

if (_msg == "Mission Reward") then {//[_weap,_bag,_items,_ammoList,_mag]
	for "i" from 1 to ((_lootCount select 0) select 0) do {
		_weaps pushBack (selectRandom _weapList);
	};
	for "i" from 1 to ((_lootCount select 1) select 0) do {
		_bags pushBack (selectRandom _bagList);
	};
	for "i" from 1 to ((_lootCount select 2) select 0) do {
		_items pushBack (selectRandom _itemList);
	};
	{_ammoList pushBack ((getArray (configfile >> "CfgWeapons" >> _x >> "magazines")) select 0)}forEach _weaps;

	clearMagazineCargoGlobal _cargo; 
	clearWeaponCargoGlobal _cargo; 
	clearItemCargoGlobal _cargo; 
	clearBackpackCargoGlobal _cargo;
	
	{_cargo addWeaponCargoGlobal	[_x,(((_lootCount select 0) select 1)+round(random ((_lootCount select 0) select 2)))]} forEach _weaps;
	{_cargo addBackpackCargoGlobal 	[_x,(((_lootCount select 1) select 1)+round(random ((_lootCount select 1) select 2)))]} forEach _bags;
	{_cargo addItemCargoGlobal 		[_x,(((_lootCount select 2) select 1)+round(random ((_lootCount select 2) select 2)))]} forEach _items;
	{_cargo addMagazineCargoGlobal 	[_x,(((_lootCount select 3) select 1)+round(random ((_lootCount select 3) select 2)))]} forEach _ammoList;
	//{_cargo addMagazineCargoGlobal [_x,(((_lootCount select 4) select 1)+round(random ((_lootCount select 4) select 2)))]} forEach _mag;
	_speaker = _target getVariable ["AMS_UnlockedBy", []]; //this return an array
	private _missionID = _target getVariable ["AMS_MissionID", "unknown"];
	if !(count _speaker == 0) then {
		_cargo setVariable ["AMS_UnlockedBy",_speaker,true];
	} else {
		_speaker = [(selectRandom allplayers)];
		_cargo setVariable ["AMS_UnlockedBy",_speaker,true];
	};
	//Add Process Cargo Dump here
	if (WMS_AMS_AddActionOnReward) then {
		//Cargo Dump
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_cargo,
			[
				"<t color='#4b48f9'>Sell Inventory</t>",// #035c10"
				"
					if !(count ((ItemCargo (_this select 0))+(WeaponCargo (_this select 0))+(MagazineCargo (_this select 0))+(backpackCargo (_this select 0))) == 0) then { 
						[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_processCargoDump']; 
					} else { 
						'Cargo Dump Container is empty, you punk' remoteExec ['hint', (owner (_this select 1))]; 
					};
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				"(alive _target) && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])};",
				5
			]
		] remoteExec [
			"addAction",
			//(owner (_speaker select 0)), //0 for all players //2 server only //-2 everyone but the server
			//false //JIP
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];
		//Vehicle dump + cargo dump
		[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_cargo,
			[
				"<t color='#4b48f9'>Sell Vehicle/Crate</t>",//_display, //"<t color='#4b48f9'>Resell the Vehicle</t>""#035c10"
				"
					[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_sellVehicles'];
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				"(alive _target) && {(vehicle _this == _this)} && {(_this getVariable ['playerInTraderZone', false])};",
				5
			]
		] remoteExec [
			"addAction",
			//(owner (_speaker select 0)), //0 for all players //2 server only //-2 everyone but the server
			//false //JIP
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];
		//paradrop the crate
		/*[ //params ["_target", "_caller", "_actionId", "_arguments"];
			_cargo,
			[
				"<t color='#4b48f9'>Paradrop the Crate</t>",//_display, //"<t color='#4b48f9'>Resell the Vehicle</t>""#035c10"
				"
					[(_this select 1), (_this select 0)] remoteExec ['WMS_fnc_something'];
				",
				[], //argument accessible in the script (_this select 3)
				1,
				true,
				true,
				"",
				"(alive _target) && {(vehicle _this == _this)};",
				5
			]
		] remoteExec [
			"addAction",
			//(owner (_speaker select 0)), //0 for all players //2 server only //-2 everyone but the server
			//false //JIP
			0, //0 for all players //2 server only //-2 everyone but the server
			true //JIP
		];*/
	};
	//
	_cargo setVariable ["AMS_MissionID",_missionID,true];
	_cargo setVariable ["AMS_MissionReward", true, true];
	if (WMS_AMS_addPoptabsRwd) then {
		_cargo setVariable ["ExileMoney",(floor _poptabs),true];
	};
};
waitUntil {((position _cargo) select 2) < 25};
if !(_SmokeColor == "none") then {
	private _smoke = _SmokeColor createVehicle position _cargo;
	_smoke attachTo [_cargo,[0,0,1]];
};
  
sleep 4;
detach _cargo;
if !(_LightColor == "none") then {
	private _Light = _LightColor createVehicle position _cargo;
	_Light attachTo [_cargo, [0,0,1]];
};
sleep 5;
deleteVehicle _parachute;
_cargo allowdamage true;
if (WMS_exileToastMsg) then {["toastRequest", ["SuccessTitleAndText", ["AIR ASSISTANCE", format ["%1 on the Ground.", _Msg]]]] call ExileServer_system_network_send_broadcast;};