/**
* WMS_fnc_DFO_MissionSucces - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_MissionSucces = { //reward the pilot for the great job depending the mission
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_MissionSucces _this %1', _this]};
	private [];
	params [
		"_playerObject",
		["_mission", "sar"]
	];
	private _coef = 0;
	switch (_mission) do {
		case "cargotransport" 	: {_coef = 0.25};
		case "inftransport" 	: {_coef = 0.3};
		case "medevac" 			: {_coef = 0.4};
		case "sar" 				: {_coef = 0.5};
		case "csar" 			: {_coef = 0.75};
		case "casinf" 			: {_coef = 0.8};
		case "casarmored" 		: {_coef = 1};
		case "airassault" 		: {_coef = 1.2};
		case "cascombined" 		: {_coef = 2};
	};
	private _score = WMS_DFO_Reward select 0;
	private _money = WMS_DFO_Reward select 1;
	private _scoreAdjusted = round (_score*_coef);
	private _moneyAdjusted = round (_money*_coef);
	private _playerScore = _playerObject getVariable ["ExileScore", 0];
	private _playerMoney = _playerObject getVariable ["ExileMoney", 0];
	private _playerScoUpdated = (_playerScore+_scoreAdjusted);
	private _playerMonUpdated = (_playerMoney+_moneyAdjusted);
	_playerObject setVariable ["ExileScore", _playerScoUpdated, true];
	_playerObject setVariable ["ExileMoney", _playerMonUpdated, true];
	//need Exile specific DB access update:
	private _killerUID 	= getPlayerUID _playerObject;
	if (WMS_exileFireAndForget) then { //DB Only for Rep, poptabs stay local
		format["setAccountScore:%1:%2", _playerScoUpdated, _killerUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _playerScoUpdated;
		(owner _playerObject) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
	}else {
		//need WMS_TheLastCartridges specific profileNamespace update:
		//_playerUID_ExileKills = "ExileKills_"+_killerUID;
		_playerUID_ExileMoney = "ExileMoney_"+_killerUID;
		_playerUID_ExileScore = "ExileScore_"+_killerUID;
		//_ExileScore = profileNamespace getVariable [_playerUID_ExileScore,0];
		//_ExileMoney = profileNamespace getVariable [_playerUID_ExileMoney,0];
		profileNamespace setVariable [_playerUID_ExileScore,_playerScoUpdated]; //_ExileScore + _scoreAdjusted if get data from server profil
		profileNamespace setVariable [_playerUID_ExileMoney,_playerMonUpdated]; //_ExileMoney + _moneyAdjusted if get data from server profil
	};
	//Notifications:
	if (WMS_DFO_UseJVMF) then {["SUCCESS","DFO HQ",name _playerObject,0,["DFO Mission Success",toUpper _mission,format["Score Reward: %1",_scoreAdjusted],format["Money Reward: %1",_moneyAdjusted],"","","","","","During dev, rewards are not permanent"],[],[[format ["%1:%2",(date select 3),(date select 4)],"DFO HQ","SENT"]]] call WMS_fnc_DFO_JVMF};
	if (WMS_exileToastMsg) then {
		_sessionID = _playerObject getVariable ['ExileSessionID',''];
		[_sessionID, 'toastRequest', ['SuccessTitleAndText', ['Dynamic Flight Ops', format["Mission SUCCES! +%1 rep, +%2 poptabs",_moneyAdjusted,_scoreAdjusted]]]] call ExileServer_system_network_send_to;
	} else {
			["TaskSucceeded", ["Dynamic Flight Ops", format["Mission SUCCES! +%1 rep, +%2 $",_scoreAdjusted,_moneyAdjusted]]] remoteExec ["BIS_fnc_showNotification", (owner _playerObject)];
	};

//};