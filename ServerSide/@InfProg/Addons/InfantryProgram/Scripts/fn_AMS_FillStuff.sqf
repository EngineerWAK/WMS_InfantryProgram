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

params[ 
	"_cargo",
	["_itemList", [selectRandom WMS_miscList]],  
	["_magList",[["SmokeShellGreen",1,5],["HandGrenade",1,5]]],  
	["_bagList",[[selectRandom (WMS_Loadout_Livonia select 3),1,2]]],  
	["_weapList",[[selectRandom (WMS_Loadout_Assault select 0),1,5]]] 
];
private _ammoList = [];
{_cargo addItemCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _ItemList; 
{_cargo addBackpackCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _bagList; 
{
	_cargo addWeaponCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))];
	_ammoList pushBack [((getArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines")) select 0), 1, 4];
} forEach _weapList;  
{_cargo addMagazineCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _magList;
{_cargo addMagazineCargoGlobal [(_x select 0),((_x select 1)+(round (random (_x select 2))))]} forEach _ammoList;
true