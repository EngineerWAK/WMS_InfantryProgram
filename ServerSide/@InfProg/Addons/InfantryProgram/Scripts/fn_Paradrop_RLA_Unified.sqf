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


private _Target 		= (_this select 0); //player
private _Msg 			= (_this select 1); //"chopper"
private _load 			= (_this select 2); //"C_Heli_light_01_digital_F"
private _Altitude 		= (_this select 3); //100
private _IncludeLoadout = (_this select 4); //true
private _SmokeColor 	= (_this select 5); //"SmokeShellBlue"
private _LightColor 	= (_this select 6); //"F_Signal_Red"

if (WMS_InfantryProgram_LOGs) then {
	diag_log format ["WAK|WAK|TNA|WMS|WAK ***** AIR ASSISTANCE ***** Paradropping %1 *****", _Msg];
	diag_log format [str _this]};

if (_msg == "Enemy SupplyDrop") then {
	["toastRequest", ["ErrorTitleAndText", ["AI Air Activities", format ["Incoming %1!",_Msg]]]] call ExileServer_system_network_send_broadcast;
} else {
	["toastRequest", ["InfoTitleAndText", ["Air Assistance", format ["%1 on the way!",_Msg]]]] call ExileServer_system_network_send_broadcast; 
};
playSound3D ["a3\dubbing_radio_f\Sfx\out2c.ogg", _target, false, position _target, 2,1,0];
uisleep 0.4;
if (_Msg == "bomb") then {
	playSound3D ["a3\dubbing_f\modules\supports\cas_bombing_request.ogg", _target, false, position _target, 5,1,0]; //cas_bombing_acknowledged
	} else {	
		if (_msg == "Mission Reward") then {
			//no heli/plane sound for mission reward yet
		} else {
			playSound3D ["a3\dubbing_f\modules\supports\drop_request.ogg", _target, false, position _target, 2,1,0];
	};
};
uisleep 1;

private _para = WMS_para_Big;
Private _smallParaList = ["Box_T_East_Wps_F","F_40mm_White"];
private _bombList = WMS_BombList;
if (_load in _smallParaList || _load in _bombList) then {_para = WMS_para_small};

if (worldName == "altis") then {};
if (worldName == "Tanoa") then {};
if (worldName == "WL_Rosche") then {};

private _FrontBack 	= 25;
private _posATL 	= getPosATL _target;
private _posPara 	= [getpos _target select 0, getpos _target select 1, _altitude];
private _posVector 	= _target modelToWorld [0, _FrontBack, _altitude];

private _parachute 	= createVehicle [_para,_posPara, [], 5];
_parachute 	setdir winddir;
_parachute 	setPos (_posVector);
_parachute 	setvelocity [0,0,-8];

private _cargo = createVehicle [_load ,_posPara, [],5]; 
_cargo allowdamage false;
_cargo attachTo [_parachute,[0,0,0]];
if (_load in _bombList) then {
	_cargo allowdamage true;
	_cargo setVectorDirAndUp [[0,0,-1],[1,0,0]];
	playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", _target, false, _posATL, 5, 1, 0];
	} else {
		if (_msg == "Mission Reward") then {
			//no heli/plane sound for mission reward yet
		} else {
			playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_heli1.wss", _target, false, _posATL, 3, 1, 0];
		};
	};
 


clearMagazineCargoGlobal _cargo; 
clearWeaponCargoGlobal _cargo; 
clearItemCargoGlobal _cargo; 
clearBackpackCargoGlobal _cargo;

//////////removing vehicle weapons
if (_load == "I_LT_01_AA_F") then {
	_cargo removeMagazinesTurret    ["4Rnd_70mm_SAAMI_missiles",[0]]; 
	_cargo removeMagazinesTurret    ["4Rnd_70mm_SAAMI_missiles",[0]]; 
	_cargo removeWeaponTurret       ["missiles_SAMMI",[0]];
	_cargo removeWeaponTurret       ["HMG_127",[0]]; 
	_cargo animate      			["HideTurret", 1]; 
	_cargo setObjectTextureGlobal 	[0, "A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa"];  
	_cargo setObjectTextureGlobal 	[1, "A3\armor_f_tank\lt_01\data\lt_01_at_olive_co.paa"];
};
if (_load == "O_T_APC_Wheeled_02_rcws_v2_ghex_F") then {
	_cargo lockTurret [[0], true];
	_cargo removeMagazinesTurret  	 	["500Rnd_127x99_mag_Tracer_Green",[0]];
	_cargo removeMagazinesTurret  	 	["96Rnd_40mm_G_belt",[0]]; 
	_cargo removeWeaponTurret       	["HMG_127_APC",[0]];
	_cargo removeWeaponTurret       	["GMG_40mm",[0]];
	_cargo animate 						["HideTurret", 1];
	_cargo animate 						["showBags",1];
	_cargo animate 						["showCanisters",1];
	_cargo animate 						["showTools",1];
	_cargo animate 						["showCamonetHull",1];	
};
if (_load == "I_APC_Wheeled_03_cannon_F") then {
	_cargo lockTurret [[0], true]; 
 	_cargo removeWeaponTurret       ["autocannon_30mm_CTWS",[0]];  
 	_cargo removeWeaponTurret       ["LMG_coax_ext",[0]];  
 	_cargo removeWeaponTurret       ["missiles_titan",[0]]; 
 	_cargo animate      ["HideTurret", 1]; 
 	_cargo animate       ["showBags",1]; 
 	_cargo animate       ["showBags2",1]; 
 	_cargo animate       ["showTools",1]; 
 	_cargo setObjectTextureGlobal [0, "\A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_03_CO.paa"]; 
 	_cargo setObjectTextureGlobal [1, "\A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_03_CO.paa"];  
 	_cargo setObjectTextureGlobal [2, "\A3\Data_F_Tacops\data\RCWS30_IG_03_CO.paa"]; 
 	_cargo setObjectTextureGlobal [3, "\A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_03_CO.paa"];
};
//////////Adding objects in Inventory
if (_Msg == "Advanced Base Kit") then {
	private _itemList = [
		["Exile_Item_Flag",1],
		["Exile_Item_Knife",1],
		["Exile_Item_Laptop",1],
		["Land_Atm_02_F_Kit",1],
		["Land_HelipadCivil_F_Kit",1],
		["PortableHelipadLight_01_green_F_Kit",4],
		["Exile_Item_BaseCameraKit",2],
		["Land_BagFence_Long_F_Kit",10],
		["Exile_Item_Codelock",2],
		["Exile_Item_ConcreteDoorKit",2],
		["Exile_Item_WoodDrawBridgeKit",2], 
		["Exile_Item_WoodFloorKit",15],
		["Exile_Item_WoodFloorPortKit",5],
		["Exile_Item_ConcreteGateKit",2],
		["Exile_Item_ConcreteWallKit",7],
		["Exile_Item_ConcreteWindowKit",4],
		["Exile_Item_WoodStairsKit",10],
		["Exile_Item_WoodSupportKit",15],
		["Exile_Item_WoodWallHalfKit",15],
		["Exile_Item_WoodWallKit",15],
		["Exile_Item_WoodWindowKit",10],
		["Exile_Item_WorkBenchKit",2],
		["Exile_Item_FloodLightKit",3],
		["Land_LampShabby_F_Kit",1],
		["Exile_Item_FortificationUpgrade",12],
		["Exile_Item_PortableGeneratorKit",2],
		["Land_Cargo20_sand_F_Kit",1]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
};
if (_Msg == "Wood Base Kit") then {
	private _itemList = [
		["Exile_Item_Flag",1],
		["Exile_Item_Knife",1],
		["Exile_Item_Codelock",2],
		["Exile_Item_WoodDoorKit",3],
		["Exile_Item_WoodDoorwayKit",5],
		["Exile_Item_WoodDrawBridgeKit",2],
		["Exile_Item_WoodFloorKit",15],
		["Exile_Item_WoodFloorPortKit",5],
		["Exile_Item_WoodGateKit",2],
		["Exile_Item_WoodLog",50],
		["Exile_Item_WoodPlank",20],
		["Exile_Item_WoodStairsKit",10],
		["Exile_Item_WoodSupportKit",15],
		["Exile_Item_WoodWallHalfKit",15],
		["Exile_Item_WoodWallKit",15],
		["Exile_Item_WoodWindowKit",10],
		["Exile_Item_WorkBenchKit",2],
		["Exile_Melee_Axe",2],
		["Exile_Item_Handsaw",2],
		["Exile_Item_WoodFloorPortSmallKit",4],
		["Exile_Item_WoodLadderHatchKit",4],
		["Exile_Item_WoodLadderKit",5]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
};
if (_Msg == "Wood Supply") then {
	private _itemList = [
		["Exile_Item_Codelock",2],
		["Exile_Item_WoodDoorKit",5],
		["Exile_Item_WoodDoorwayKit",5],
		["Exile_Item_WoodDrawBridgeKit",5],
		["Exile_Item_WoodFloorKit",25],
		["Exile_Item_WoodFloorPortKit",5],
		["Exile_Item_WoodGateKit",6],
		["Exile_Item_WoodLog",100],
		["Exile_Item_WoodPlank",50],
		["Exile_Item_WoodStairsKit",10],
		["Exile_Item_WoodSupportKit",20],
		["Exile_Item_WoodWallHalfKit",20],
		["Exile_Item_WoodWallKit",25],
		["Exile_Item_WoodWindowKit",10],
		["Exile_Item_WorkBenchKit",2],
		["Exile_Melee_Axe",2],
		["Exile_Item_Handsaw",2],
		["Exile_Item_WoodFloorPortSmallKit",5],
		["Exile_Item_WoodLadderHatchKit",5],
		["Exile_Item_WoodLadderKit",5],
		["Land_Cargo20_sand_F_Kit",1],
		["Land_LampShabby_F_Kit",4],
		["Exile_Item_FortificationUpgrade",10]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
};
if (_Msg == "Crafting Box") then {
	private _itemList = [
		["Exile_Item_Shovel",1],
		["Exile_ConcreteMixer_Kit",1],
		["Exile_Item_CampFireKit",4],
		["Exile_Item_CookingPot",5],
		["Exile_Item_Cement",25],
		["Exile_Item_Sand",25],
		["Exile_Item_MetalScrews",25],
		["Exile_Item_Foolbox",4],
		["Exile_Item_ExtensionCord",15],
		["Exile_Item_FuelCanisterFull",5],
		["Exile_Item_Grinder",2],
		["Exile_Item_LightBulb",10],
		["Exile_Item_Matches",5],
		["Exile_Item_MetalBoard",20],
		["Exile_Item_MetalPole",5],
		["Exile_Item_PlasticBottleFreshWater",10],
		["Exile_Item_Screwdriver",4],
		["Exile_Item_Rope",15],
		["Exile_Item_Handsaw",4],
		["Exile_Item_Knife",3],
		["Exile_Item_MetalWire",15],
		["Exile_Item_Pliers",4],
		["Exile_Item_WaterCanisterDirtyWater",10],
		["Exile_Item_Hammer",3]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
};
if (_Msg == "Survivor Crate") then {
	private _itemList = [
   		["acc_flashlight",1],  
		["Exile_Melee_Axe",1], 
		["Binocular",1],
		["V_HarnessOSpec_gry",1],
		["U_OG_Guerilla2_1",1],
		["H_Booniehat_oli",1],
		["Exile_Item_BeefParts",3],
		["Exile_Item_PlasticBottleCoffee",3],
		["Exile_Item_Vishpirin",1],
		["Exile_Item_Bandage",5],
		["ItemMap",1],
		["Exile_Item_Knife",1],
		["Exile_Item_CampFireKit",1],
		["Exile_Item_Matches",1],
		["Land_TentDome_F_Kit",1],
		["Exile_Item_CookingPot",1],
		["Exile_Item_Rope",1],
		["Exile_Item_FireExtinguisher",1],
		["Exile_Item_MobilePhone",1],
		["Exile_Item_RubberDuck",1]
 	];
	private _magList = [
		["SmokeShellGreen",1],
		["Chemlight_green",1],
		["SmokeShellred",3],
		["Chemlight_red",3],
		["16Rnd_9x21_green_Mag",6]
	];
	private _bagList = [   
		["B_Kitbag_cbr",1] 
	];
	private _weapList = [
		["hgun_Rook40_F",1]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
	{_cargo addMagazineCargoGlobal [(_x select 0),(_x select 1)]} forEach _magList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bagList;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weapList;
};
if (_Msg == "Mission Crate") then {
	private _itemList = [
		["acc_flashlight",15],  
		["Binocular",10],
		["Exile_Item_BeefParts",15], 
		["Exile_Item_PlasticBottleCoffee",15], 
		["Exile_Item_Vishpirin",20], 
		["Exile_Item_Bandage",20], 
		["Integrated_NVG_F",15], 
		["Exile_Item_Defibrillator",5], 
		["Exile_Item_InstaDoc",15], 
		["H_HelmetSpecB_paint1",15],

		["R3F_uniform_urr",8], 
		["UK3CB_BAF_U_JumperUniform_DPMW",8], 
		["BWA3_Uniform_Fleck",8],

		["R3F_veste_ce300",8], 
		["UK3CB_BAF_V_Osprey_DPMW3",8],
		["BWA3_Vest_JPC_Radioman_Fleck",8],

		["RKSL_optic_RMR_RM33",15] ,
		["hlc_optic_HensoldtZO_lo_Docter_2D",10], 
		["hlc_optic_ATACR_Offset",8] 
  ]; 
 private _magList = [ 
		["BWA3_DM32_Orange",15], 
		["Chemlight_green",10], 
		["HandGrenade",30], 
 		["hlc_200Rnd_762x51_T_M60E4",25], 
		["hlc_20Rnd_762x51_Barrier_M14",50], 
		["hlc_30Rnd_10mm_JHP_MP5",50], 
		["RPG7_F",20], 
		["SatchelCharge_Remote_Mag",8]
 ]; 
 private _bagList = [ 
		["B_Kitbag_rgr",10],  
		["R3F_sac_moyen_CE",5]  
 ]; 
 private _weapList = [ 
		["hlc_rifle_M14_Rail",8], 
		["hlc_mp510_tac",15], 
		["hlc_lmg_M60_200rnd",8], 
		["launch_RPG7_F",4], 
 		["BWA3_Bunkerfaust_Loaded",6] 
 ];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
	{_cargo addMagazineCargoGlobal [(_x select 0),(_x select 1)]} forEach _magList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bagList;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weapList;
};
if (_msg == "Enemy SupplyDrop") then {//Moving to it's own fonction
	private _bagList = (WMS_Loadout_MCB select 3)+(WMS_Loadout_M90d select 3)+(WMS_Loadout_ABU select 3)+(WMS_Loadout_bandit select 3);
	private _weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_DMR select 0)+(WMS_Loadout_Sniper select 0)+(WMS_Loadout_SMG select 0)+(WMS_Loadout_MG select 0)+(WMS_Loadout_Sniper select 3);
	private _weap = [
		[selectRandom _weapList,(3+floor(random 8))]
	];
	private _ammoList = [];
	{_ammoList pushBack ((getArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines")) select 0)}forEach _weap;
	private _item = WMS_AI_inventory+["Exile_Item_OldChestKit"];
	private _itemList = [
		(selectRandom _item),
		(selectRandom _item)
	];
	private _bag = [
		[selectRandom _bagList,(1+floor(random 4))] 
	];
	{_cargo addItemCargoGlobal [_x,(1+floor(random 5))]} forEach _itemList;
	//{_cargo addMagazineCargoGlobal [(_x select 0),(_x select 1)]} forEach _mag;
	{_cargo addMagazineCargoGlobal [_x,(5+floor(random 8))]} forEach _ammoList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bag;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weap;

};
if (_msg == "Mission Reward") then {
	private _bagList = (WMS_Loadout_AOR2 select 3)+(WMS_Loadout_M90 select 3)+(WMS_Loadout_Scorpion select 3)+(WMS_Loadout_Tiger select 3);
	private _weapList = (WMS_Loadout_Assault select 0)+(WMS_Loadout_DMR select 0)+(WMS_Loadout_Sniper select 0)+(WMS_Loadout_SMG select 0)+(WMS_Loadout_MG select 0)+(WMS_Loadout_Sniper select 3);
	private _weap = [
		[selectRandom _weapList,(2+round(random 3))],
		[selectRandom _weapList,(2+round(random 3))]
	];
	private _ammoList = [];
	{_ammoList pushBack ((getArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines")) select 0)}forEach _weap;
	private _item = WMS_AI_inventory+["Exile_Item_OldChestKit"];
	private _itemList = [
		(selectRandom _item),
		(selectRandom _item)
	];
	private _bag = [
		[selectRandom _bagList,(1+round(random 2))] 
	];
	{_cargo addItemCargoGlobal [_x,(1+floor(random 5))]} forEach _itemList;
	//{_cargo addMagazineCargoGlobal [(_x select 0),(_x select 1)]} forEach _mag;
	{_cargo addMagazineCargoGlobal [_x,(5+floor(random 8))]} forEach _ammoList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bag;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weap;

};
//////////Including Loadout
if (_IncludeLoadout) then {
	private _itemList = [
		["optic_Holosight_blk_F",1],
		["Rangefinder",1],
		["O_NVGoggles_urb_F",1],
		["V_Chestrig_blk",1],
		["H_HelmetB_light_black",1],
		["U_I_G_resistanceLeader_F",1],
		["Exile_Item_BeefParts",1],
		["Exile_Item_PlasticBottleCoffee",1],
		["Exile_Item_Vishpirin",1],
		["Exile_Item_Bandage",1],
		["Exile_Item_DuctTape",1],
		["ItemGPS",1]
	];
	private _magList = [
		["SmokeShellBlue",3],
		["HandGrenade",5],
		["30Rnd_65x39_caseless_green",5]
	];
	private _bagList = [
		["B_Kitbag_rgr",1]
	];
	private _weapList = [
		["arifle_ARX_blk_F",1]
	];
	{_cargo addItemCargoGlobal [(_x select 0),(_x select 1)]} forEach _ItemList;
	{_cargo addMagazineCargoGlobal [(_x select 0),(_x select 1)]} forEach _magList;
	{_cargo addBackpackCargoGlobal [(_x select 0),(_x select 1)]} forEach _bagList;
	{_cargo addWeaponCargoGlobal [(_x select 0),(_x select 1)]} forEach _weapList; 
};

waitUntil {((position _cargo) select 2) < 30};
if !(_SmokeColor == "none") then {
	private _smoke = _SmokeColor createVehicle position _cargo;
	_smoke attachTo [_cargo,[0,0,1]];
};

if (_msg == "Mission Reward") then {
	//no heli/plane sound for mission reward yet
} else {
	playSound3D ["a3\dubbing_f\modules\supports\drop_accomplished.ogg", _target, false, position _target, 2,0.94,0];
};  
  
sleep 4;
detach _cargo;
if !(_LightColor == "none") then {
	private _Light = _LightColor createVehicle position _cargo;
	_Light attachTo [_cargo, [0,0,2]];
};
sleep 5;
deleteVehicle _parachute;
_cargo allowdamage true;
["toastRequest", ["InfoTitleAndText", ["Air Assistance", format ["%1 on the Ground.", _Msg]]]] call ExileServer_system_network_send_broadcast;