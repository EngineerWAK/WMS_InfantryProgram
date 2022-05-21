/**
* WMS_fnc_ScanForWater - InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
//From AmbientLife
	if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_ScanForWater start scanning %1', time]};
	params [
		["_resolution", 1000], //1km resolution
		["_closeLand", true] //thats pretty hardcore on server for few seconds if a lot of water but it's worth it
	];
	private _size = worldSize;
	private _divide = (round (_size/_resolution))-1;
	private _steps = []; //[1000,2000,3000,4000,5000,6000,7000,8000] for a 8km map 1000m resolution
	private _step = _resolution;
	private _scanPos = [_resolution,_resolution];
	for "_i" from 1 to _divide do {
		_steps pushback _step;
		_step = _step+_resolution;
	};
	{
		private _Xaxis = _x;
		{
			_scanPos = [_Xaxis,_x,0];
			if (surfaceIsWater _scanPos && {((ATLtoASL _scanPos) select 2) <= -3}) then {
				if (_closeLand) then {
					private _land = nearestTerrainObjects [_scanPos,["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE","ROAD"],1500];
					if (count _land != 0) then {WMS_SeaPos pushback _scanPos};
				}else{
					WMS_SeaPos pushback _scanPos;
				};
			};
		}forEach _steps; //this steps become Y axis
	}forEach _steps; //this steps become X axis
	if (WMS_IP_LOGs) then {Diag_log format ['|WAK|TNA|WMS|WMS_fnc_ScanForWater Scan finished  %1, %2 positions found', time, count WMS_SeaPos]};
	(count WMS_SeaPos)