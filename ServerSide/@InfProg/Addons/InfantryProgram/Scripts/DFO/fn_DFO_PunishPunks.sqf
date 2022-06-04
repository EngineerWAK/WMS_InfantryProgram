/**
* WMS_fnc_DFO_PunishPunks - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//WMS_fnc_DFO_PunishPunks = { //will be use to remind to those getting in the mission zone that it's not their mission, ACE broken legs and things like that
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_PunishPunks _this %1', _this]};
	params [
		"_playerObject",
		["_maxDamage",0.4],
		["_part", selectRandom ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]], //["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] ACE
		["_projectiles", selectRandom ["stab","bullet","grenade","explosive","shell","vehiclecrash","backblast","falling"]] //["stab","bullet","grenade","explosive","shell","vehiclecrash","collision","backblast","punch","falling","ropeburn","fire"]
		];

	if (WMS_DFO_AceIsRunning) then {
		if (isPlayer _playerObject) then {
			[_playerObject, _maxDamage, _part, _projectiles, _playerObject] remoteExecCall ["ace_medical_fnc_addDamageToUnit",owner _playerObject];
		} else {
			[_playerObject, 0.3, _part, _projectiles, _playerObject] call ace_medical_fnc_addDamageToUnit;
		};
	} else {
		//Bohemia:
		/*_parts = [
			"face_hub", //Unit dies at damage equal to or above 1
			"neck", //Unit dies at damage equal to or above 1
			"head", //Unit dies at damage equal to or above 1
			"pelvis", //Unit dies at damage equal to or above 1
			"spine1", //Unit dies at damage equal to or above 1
			"spine2", //Unit dies at damage equal to or above 1
			"spine3", //Unit dies at damage equal to or above 1
			"body", //Unit dies at damage equal to or above 1
			"arms", //Unit doesn't die with damage to this part
			"hands", //Unit doesn't die with damage to this part
			"legs" //Unit doesn't die with damage to this part 
		];*/
		//_playerObject setHit [selectRandom _parts,random 0.25,true,_playerObject];
		private _dmg = damage _playerObject;
		_playerObject setDamage _dmg+(random _maxDamage); //it's not sexy but it should do the job for now
	};
//};