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
if!(WMS_exileFireAndForget) then {
	private _pumpList = [(worldSize/2), (worldSize/2), 0] nearObjects [WMS_WaterSource, worldSize];
	{
		private _sphere = createVehicle ["Sign_Sphere10cm_F", getPos _x, [], 0, "CAN_COLLIDE"];
		[_sphere, 200] call acex_field_rations_fnc_setRemainingWater;
	}forEach _pumpList;
};

while {true} do {
	if (_unlockServer && {(time > 120)}) then {
		{WMS_serverCMDpwd serverCommand format ["#kick %1", (getPlayerUID _x)]}foreach allPlayers;
		WMS_serverCMDpwd serverCommand "#unlock";
		_unlockServer = false;
	};
	//if (WMS_AMS && {(time>WMS_AMS_WaitToStart)}) then {[]call WMS_fnc_Watch_AMS;};
	if (WMS_AMS) then {[]call WMS_fnc_Watch_AMS;};
	uisleep 14; //uisleep 14, uisleep 31, uisleep 59, uisleep 91, uisleep 120, uisleep 239
};