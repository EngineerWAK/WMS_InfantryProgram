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

//uisleep 120+90;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 90sec Watch started at %1", time];
while {true} do {
	uisleep 91; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
	//WMS_AI_watchNdestroy
	call WMS_fnc_Watch_RoamingINF; //each HC/Server could watch his own stuff I guess ?
	//DynAI Target selection
	call WMS_fnc_Watch_DynAI; //each HC/Server could watch his own stuff I guess ?

	//Lost Convoy Event management
	if (WMS_TargetConvoy && {count WMS_TargetConvoyUnits != 0}) then {
		_TargetConvoyUnits = WMS_TargetConvoyUnits select {(alive _x)};
		if (count _TargetConvoyUnits == 0)then {
			//succes
			{_x setMarkerColor "colorGreen";}forEach WMS_TargetConvoyMkrs;
			["EventCustomGreen", ["Lost Enemy Convoy", "Enemy Convoy Destroyed!", "\A3\ui_f\data\GUI\Cfg\GameTypes\defend_ca.paa"]] remoteExec ["BIS_fnc_showNotification", -2];
			//reward at convoy position, not marker position 
			_triggSucces = createTrigger ["EmptyDetector", WMS_TargetConvoyPosRew, true];
			_triggSucces setTriggerActivation ["ANYPLAYER", "PRESENT", true]; 
			_triggSucces setTriggerArea [50, 50, 0, false,50];
			_triggSucces setTriggerStatements  
			[ 
				"this",  
				"
					_smoke = 'smokeShellGreen' createVehicle WMS_TargetConvoyPosRew;
					{deleteMarker _x}forEach WMS_TargetConvoyMkrs;
					WMS_TargetConvoyMkrs = [];
					_phone = 'Land_MobilePhone_old_F' createVehicle WMS_TargetConvoyPosRew;
					_crateOwner = ([WMS_TargetConvoyPosRew, WMS_AMS_PlayerDistDelete] call WMS_fnc_AMS_ClstPlayer);
					_phone setVariable ['AMS_UnlockedBy',[_crateOwner],true];
					_phone setVariable ['AMS_MissionID','CaptureZone',true];
					[_phone,[],WMS_TargetConvoyLoot,'military','Mission Reward',nil,'moderate',150] spawn WMS_fnc_AMS_SpawnRewards;
					WMS_TargetConvoyPosRew = [];
					WMS_TargetConvoyUnits = [];
					WMS_Events_list pushback [(servertime+WMS_TargetConvoyDelay),'TargetConvoy'];
					WMS_Events_list sort true;
					deleteVehicle thisTrigger;
				",  
  				"" 
			];
		};
	};
};