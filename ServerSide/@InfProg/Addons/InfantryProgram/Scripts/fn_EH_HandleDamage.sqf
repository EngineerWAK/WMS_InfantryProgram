/**
* WMS_fnc_EH_HandleDamage
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

params [
	"_unit", "_selection", "_damage", "_source","_instigator"
	];
//if (WMS_IP_LOGs) then {Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits fucking useless eventHandler HandleDamage, _this = %1",_this]}; //this one spam A LOT of logs
if (
	isPlayer _source && 
	{alive _unit} && 
	{(_selection == "head") || (_selection == "face_hub")} && 
	{(vehicle _unit) isKindOf "man"} &&
	{_damage >= WMS_DYNAI_HSDamageKill}
) then {
	if (headgear _unit != "") then {playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2]};
	//[_unit, 1, "head", _projectile, _source] call ace_medical_fnc_addDamageToUnit; //ERROR: addDamageToUnit - badUnit
	[_unit,_source] call WMS_fnc_DynAI_RwdMsgOnKill;
	_unit removeEventHandler ["HandleDamage", 0];
	_unit removeMPEventHandler ["MPKilled", 0];
	if (WMS_HeadShotSound)then{["HeadShot"] remoteexec ["playsound",(owner _source)]};
	if (WMS_IP_LOGs) then {Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot Kill, _this = %1",_this]};
	if (alive _unit) then {//looks stupid but it seems that the NPC sometimes die before the setDamage 1
	_unit setDamage 1;
	_source addPlayerScores [1,0,0,0,0];
	}; 
}else {
	if (
		isPlayer _source && 
		{_damage >= WMS_DYNAI_HelmetDamage} && 
		{alive _unit} && 
		{(_selection == "head") || (_selection == "face_hub")} && 
		{headgear _unit != ""} && 
		//{(vehicle _source) isKindOf "man"} && 
		{(vehicle _unit) isKindOf "man"}
	) then {
		playSound3D [getMissionPath 'Custom\Ogg\HelmetShot.ogg', _unit, false, position _unit, 2];
		_h = headgear _unit;
		removeHeadgear _unit;
		_nv = ((assignedItems _unit) select {_x find "NV" > -1}) select 0;
		if (isNil "_nv") then {_unit unlinkItem _nv};
		_w = createVehicle ["WeaponHolderSimulated",ASLtoATL eyePos _unit,[],0,"CAN_COLLIDE"];
		_w addItemCargoGlobal [_h,1];
		_w setVelocity [5 * sin (_source getdir _unit), 5 * cos (_source getDir _unit), 0.3];
		_w addTorque [random 0.02, random .02, random .02];
		if (WMS_IP_LOGs) then {Diag_log format ["|WAK|TNA|WMS|WMS_fnc_SetUnits HandleDamage HeadShot remove Helmet, _this = %1",_this]};
		WMS_AllDeadsMgr pushBack [_w,(serverTime+WMS_Others_AllDeads)];
	};
};