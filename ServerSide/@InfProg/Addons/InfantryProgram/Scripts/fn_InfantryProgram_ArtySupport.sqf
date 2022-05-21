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
//UPDATED NEW INFANTRYPROGRAM, ExileMod/TheLastCartridge compatible
//////////////////////////////////////////////////////////////////
//	[player, _amount, _lockerMoney, _artyTargetPos, _artyTargetDist, "HE"] spawn WMS_fnc_InfantryProgram_ArtySupport;
//////////////////////////////////////////////////////////////////
if (WMS_IP_LOGs) then {diag_log format ["[ARTY SUPPORT]|WAK|TNA|WMS| _this = %1", _this]};

private ["_dist1","_dist2","_RandomPosSpawn","_RandomPosSpawnCounter","_Arty82mm"];
params[
	"_target",
	["_amount",8000,[0]],
	["_lockerMoney", 0,[0]],
	"_artyTargetPos",
	["_artyTargetDist",501,[0]],
	["_ammoType","SMOKE",[""]],
	["_ArtyCounterBatChance",50,[0]],
	["_ArtyCounterBatChanceHE",30,[0]]
];
_dist1 = 500;
_dist2 = 1000;
if (WMS_IP_LOGs) then {diag_log format ["[ARTY SUPPORT]|WAK|TNA|WMS|  _target= %1 _amount= %2 _lockerMoney= %3 _artyTargetPos= %4 _artyTargetDist= %5 _ammoType= %6 _ArtyCounterBatChance= %7 _ArtyCounterBatChanceHE= %8 _dist1= %9 _dist2= %10", _target, _amount, _lockerMoney, _artyTargetPos, _artyTargetDist, _ammoType, _ArtyCounterBatChance, _ArtyCounterBatChanceHE, _dist1, _dist2]};
if (_artyTargetDist < 500 ) then {_dist1 = 900; _dist2 = 1500} else {
	if (_artyTargetDist >= 500 && _artyTargetDist <= 1000 ) then {_dist1 = 1300; _dist2 = 1600};
};
_RandomPosSpawn = [_target, _dist1, _dist2, 15, 0, 0.15] call BIS_fnc_findSafePos;
_RandomPosSpawnCounter = [_target, _dist1, _dist2, 15, 0, 0.15] call BIS_fnc_findSafePos;

switch _ammoType do {
	case "HE" : {_ammoType = "8Rnd_82mm_Mo_shells"};
	case "SMOKE" : {_ammoType = "8Rnd_82mm_Mo_Smoke_white"};
	case "FLARE" : {_ammoType = "8Rnd_82mm_Mo_Flare_white"};
};

if(_lockerMoney > _amount) then{ 
	if (WMS_exileFireAndForget) then {
		//ExileMod
    	_playerMoney = _target getVariable ['ExileMoney', 0];
		_lockerMoney = _target getVariable ['ExileLocker', 0]; //thats weird but I guess I did like this as doublecheck...
		_lockerMoney = _lockerMoney - _amount;
		_poptabsplayer = _playerMoney + _lockerMoney;
		_target setVariable ['ExilePopTabsCheck', _poptabsplayer];
		_target setVariable ['ExileMoney', _playerMoney, true];
		_target setVariable ['ExileLocker', _lockerMoney, true];
    	format['updateLocker:%1:%2', _lockerMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
	} else {
		//TheLastCartridges
		_ownerUID = getPlayerUID _target;
		_playerUID_ExileMoney = "ExileMoney_"+_ownerUID;
		_playerMoney = profileNamespace getVariable [_playerUID_Exilemoney,0];
		profileNamespace setVariable [_playerUID_Exilemoney,(_playerMoney-_amount)];
		_target setVariable ["ExileMoney", (_playerMoney-_amount), true];
	};
 	if (WMS_IP_LOGs) then {
 		diag_log format ["[ARTY SUPPORT]|WAK|TNA|WMS| Artillery support Accepted for %1 at %2", _target, _artyTargetPos];
 	};

	playSound3D ["a3\dubbing_f\modules\supports\artillery_request.ogg", _target, false, position _target, 1,1,0];
	_Arty82mm = [_RandomPosSpawn, (0+random 359), "B_Mortar_01_F", BLUFOR] call bis_fnc_spawnvehicle;
	uisleep 3;
	_Arty82mm doArtilleryFire [_artyTargetPos, _ammoType, 3];
	playSound3D ["a3\dubbing_radio_f\Sfx\out2c.ogg", _target, false, position _target, 1,1,0]; 
	uisleep 1; 
	playSound3D ["a3\dubbing_f\modules\supports\artillery_acknowledged.ogg", _target, false, position _target, 1,1,0];
	WMS_IP_ArtySup_LastT = time;
	publicVariable "WMS_IP_ArtySup_LastT";
	uisleep 15;
	deletevehicle (_arty82mm select 0);
	{deletevehicle _x} forEach units (_arty82mm select 2);
	uisleep 10;
	//Counter battery fire
	if((random 100) < _ArtyCounterBatChance) then {
		[_target, _RandomPosSpawnCounter, _ArtyCounterBatChanceHE] spawn WMS_fnc_DynAI_arty;
	};
} else {
	if (WMS_IP_LOGs) then {
		diag_log format ["[ARTY SUPPORT]|WAK|TNA|WMS|  %1 too poor to get artillery support", name _target];
	};
};