/**
* WMS_fnc_CollectPos - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
private _worldCenter 	= [worldsize/2,worldsize/2,0]; 
private _worldDiameter 	= ((worldsize/2)*1.413);
if (WMS_Pos_AutoScan) then {
	Diag_log '|WAK|TNA|WMS| collecting LOCALS positions'; 
	{WMS_Pos_Locals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameLocal"],_worldDiameter]);
	Diag_log '|WAK|TNA|WMS| collecting VILLAGES positions';  
	{WMS_Pos_Villages pushback position _x}forEach (nearestLocations [_worldCenter, ["nameVillage"],_worldDiameter]);
	Diag_log '|WAK|TNA|WMS| collecting CITIES positions';
	{WMS_Pos_Cities pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCity"],_worldDiameter]);
	Diag_log '|WAK|TNA|WMS| collecting CAPITALS positions';  
	{WMS_Pos_Capitals pushback position _x}forEach (nearestLocations [_worldCenter, ["nameCityCapital"],_worldDiameter]);
	Diag_log '|WAK|TNA|WMS| collecting HILLS positions';
	{WMS_Pos_Hills pushback position _x}forEach (nearestLocations [_worldCenter, ["hill"],_worldDiameter]);
	if (WMS_CustomTrig_activate) then {
		Diag_log '|WAK|TNA|WMS| collecting CUSTOM positions';
		{WMS_Pos_CustomTrig pushback position _x}forEach (nearestObjects [_worldCenter, [WMS_CustomTrig_ClassName],_worldDiameter]);
	};
	[] call WMS_fnc_ScanForWater;
	[] call WMS_fnc_FindRoad;
};