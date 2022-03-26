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

{deleteVehicle _x} foreach units (_this select 0);
{deleteVehicle _x} foreach (_this select 1);
{deleteMarker _x} foreach (_this select 2);
{deleteWaypoint _x} foreach (_this select 3);
//deleteGroup (_this select 0);