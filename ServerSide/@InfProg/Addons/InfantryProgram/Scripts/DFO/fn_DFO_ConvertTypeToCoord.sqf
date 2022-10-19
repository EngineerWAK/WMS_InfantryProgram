/**
* WMS_fnc_DFO_ConvertTypeToCoord - Dynamic Flight Operations
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2022 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_ConvertTypeToCoord _this %1', _this]};
	params [
		["_pos",[worldSize/2,worldSize/2]],
		["_posType","random"],
		["_radiusObjects",10],
		["_MaxGrad",WMS_AMS_MaxGrad],
		["_options",[]]

	];
	private _blackList = [];
	private _return = [];
	if (WMS_DFO_Standalone) then {
		_blackList = allPlayers select {alive _x} apply {[getPosATL _x, 900]};
		_blacklist = _blacklist+WMS_DFO_ExclusionZone;
	}else {
		_blackList = [] call WMS_fnc_AMS_SpnAiBlkListFull;
		_blacklist = _blacklist+WMS_DFO_ExclusionZone;
	};
	if (_posType == "random") then {
		_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
	} else {
		if(_posType == "forest" && {count WMS_Pos_Forests != 0})then{
			_return = selectRandom WMS_Pos_Forests;
			_return = [_return, 0, 50, 1, 0, 0, 0, [], [_return,[]]] call WMS_fnc_BIS_FindSafePosModified;
		}else{
			if(_posType == "city" && {count (WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals) != 0})then{
				_return = selectRandom (WMS_Pos_Villages+WMS_Pos_Cities+WMS_Pos_Capitals);
				_return = [_return, 0, 50, 5, 0, 0, 0, [], [_return,[]]] call WMS_fnc_BIS_FindSafePosModified;
			}else{
				if(_posType == "local" && {count WMS_Pos_Locals != 0})then{
					_return = selectRandom WMS_Pos_Locals;
					_return = [_return, 0, 50, 5, 0, 0, 0, [], [_return,[]]] call WMS_fnc_BIS_FindSafePosModified;
				}else{
					if(_posType == "military" && {count WMS_Pos_Military != 0})then{
						_return = selectRandom WMS_Pos_Military;
						_return = [_return, 0, 50, 5, 0, 0, 0, [], [_return,[]]] call WMS_fnc_BIS_FindSafePosModified;
					}else{
						if(_posType == "sea")then{
							//use random but 2 "must be on water"
							_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), 5, 2, 0.5, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
						}else{
							if(_posType == "custom")then{ //NOT USED YET
								if (count WMS_Pos_Custom != 0) then {
									_return = selectRandom WMS_Pos_Custom;
								};
							}else{
								if(_posType == "bases")then{
									if (count WMS_DFO_BasePositions != 0) then {
										_return = selectRandom WMS_DFO_BasePositions;
									};
								}else{
									//back to "random"
									_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
								};
							};
						};
					};
				};
			};
		};
	};
	if (count _return == 0) then {
		_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
	};
	//player check here, if player, then fallback to "random":
	private _result = false;
	{
		if((_return distance (getPosATL _x)) < 500) then {_result = true};
	}forEach allPlayers;
	if (_result) then {
		//back to "random"
		_return = [_pos, (WMS_DFO_MinMaxDist select 0), (WMS_DFO_MinMaxDist select 1), _radiusObjects, 0, _MaxGrad, 0, _blackList, [([] call BIS_fnc_randomPos),[]]] call WMS_fnc_BIS_FindSafePosModified;
	};
	if (count _return != 3) then {_return pushBack 0}; //make sure position is 3D
	if (WMS_DFO_LOGs) then {diag_log format ['|WAK|TNA|WMS|[DFO] WMS_fnc_DFO_ConvertTypeToCoord _return %1', _return]};
	_return