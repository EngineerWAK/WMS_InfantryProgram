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

//uisleep 120+15;
diag_log format ["[Infantry Program Watch Thread]|WAK|TNA|WMS| 15sec Watch started at %1", time];
private _unlockServer = true;

//Make Blue Water pumps water Objects for Ace:
if(!(WMS_exileFireAndForget) && isDedicated) then {
	private _pumpList = [(worldSize/2), (worldSize/2), 0] nearObjects [WMS_WaterSource, worldSize];
	{
		private _sphere = createVehicle ["Sign_Sphere10cm_F", getPos _x, [], 0, "CAN_COLLIDE"];
		[_sphere, 200] call acex_field_rations_fnc_setRemainingWater;
	}forEach _pumpList;
};

while {true} do {
	uisleep 14; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
	if (isDedicated && {_unlockServer} && {(time > WMS_SVRstartLock)}) then {
		{
			if (count(getPlayerUID _x)==17) then {WMS_serverCMDpwd serverCommand format ["#kick %1", (getPlayerUID _x)]};//do not kick the HC
		}foreach allPlayers;
		WMS_serverCMDpwd serverCommand "#unlock";
		_unlockServer = false;
	};
	if (WMS_AMS && isDedicated) then {[]call WMS_fnc_Watch_AMS;};
};