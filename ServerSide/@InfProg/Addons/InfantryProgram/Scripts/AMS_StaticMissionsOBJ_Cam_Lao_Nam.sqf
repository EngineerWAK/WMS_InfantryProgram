// Export of 'AMS_StaticMissions.Cam_Lao_Nam' by {|||TNA|||} WAKeupneo on v0.9

if (true) then {diag_log format ["[AMS_StaticMissionsObj_Cam_lao_Nam]|WAK|TNA|WMS|SPAWNING serverTime = %1", serverTime]};
///////////////////////////////////////////////////////////////////////////////////////////
// Init
params [["_layerWhiteList",[],[[]]],["_layerBlacklist",[],[[]]],["_posCenter",[0,0,0],[[]]],["_dir",0,[0]],["_idBlacklist",[],[[]]]];
private _allWhitelisted = _layerWhiteList isEqualTo [];
private _layerRoot = (_allWhitelisted || {true in _layerWhiteList}) && {!(true in _layerBlackList)};


///////////////////////////////////////////////////////////////////////////////////////////
// Markers
private _markers = [];
private _markerIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Groups
private _groups = [];
private _groupIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Objects
private _objects = [];
private _objectIDs = [];

private _item0 = objNull;
if (_layerRoot) then {
	_item0 = createVehicle ["vn_flag_vc",[2416.69,15220.2,0.000961304],[],0,"CAN_COLLIDE"];
	_this = _item0;
	_objects pushback _this;
	_objectIDs pushback 0;
	_this setPosWorld [2416.69,15220.2,89.7178];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item1 = objNull;
if (_layerRoot) then {
	_item1 = createVehicle ["vn_flag_pavn",[2869.45,14896.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1;
	_objects pushback _this;
	_objectIDs pushback 1;
	_this setPosWorld [2869.45,14896.9,220.777];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item3 = objNull;
if (_layerRoot) then {
	_item3 = createVehicle ["vn_o_kr_static_zgu1_01",[2860.79,14897.1,0],[],0,"CAN_COLLIDE"];
	_this = _item3;
	_objects pushback _this;
	_objectIDs pushback 3;
	_this setPosWorld [2860.79,14897.1,218.285];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item6 = objNull;
if (_layerRoot) then {
	_item6 = createVehicle ["vn_o_kr_static_dshkm_high_02",[2871.24,14898.3,-0.00166321],[],0,"CAN_COLLIDE"];
	_this = _item6;
	_objects pushback _this;
	_objectIDs pushback 6;
	_this setPosWorld [2871.32,14898.3,218.483];
	_this setVectorDirAndUp [[0.257217,0.966287,-0.0113176],[0.0439577,0,0.999033]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item7 = objNull;
if (_layerRoot) then {
	_item7 = createVehicle ["vn_o_pl_static_zpu4",[2854.47,14888.6,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item7;
	_objects pushback _this;
	_objectIDs pushback 7;
	_this setPosWorld [2854.43,14888.6,218.407];
	_this setVectorDirAndUp [[-0.915064,-0.402807,-0.0201299],[-0.021993,0,0.999758]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item8 = objNull;
if (_layerRoot) then {
	_item8 = createVehicle ["vn_o_pl_static_d44_01",[2863.83,14889.4,0],[],0,"CAN_COLLIDE"];
	_this = _item8;
	_objects pushback _this;
	_objectIDs pushback 8;
	_this setPosWorld [2863.84,14889.4,216.791];
	_this setVectorDirAndUp [[-0.859345,-0.511331,-0.00818107],[0,-0.0159975,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item16 = objNull;
if (_layerRoot) then {
	_item16 = createVehicle ["vn_o_kr_static_m1910_low_01",[2914.73,14943,1.10535],[],0,"CAN_COLLIDE"];
	_this = _item16;
	_objects pushback _this;
	_objectIDs pushback 16;
	_this setPosWorld [2914.77,14942.9,220.726];
	_this setVectorDirAndUp [[0.76959,-0.631858,-0.0921257],[0.0648118,-0.0662344,0.995697]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item20 = objNull;
if (_layerRoot) then {
	_item20 = createVehicle ["vn_flag_pavn",[11179.6,14782.7,0],[],0,"CAN_COLLIDE"];
	_this = _item20;
	_objects pushback _this;
	_objectIDs pushback 20;
	_this setPosWorld [11179.6,14782.7,74.0272];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item21 = objNull;
if (_layerRoot) then {
	_item21 = createVehicle ["vn_o_kr_static_zgu1_01",[11158.5,14747.6,-3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item21;
	_objects pushback _this;
	_objectIDs pushback 21;
	_this setPosWorld [11158.5,14747.6,71.4359];
	_this setVectorDirAndUp [[-0.566374,-0.824142,-0.00339834],[-0.00600007,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item24 = objNull;
if (_layerRoot) then {
	_item24 = createVehicle ["vn_o_pl_static_zpu4",[11218.3,14870.6,-7.62939e-005],[],0,"CAN_COLLIDE"];
	_this = _item24;
	_objects pushback _this;
	_objectIDs pushback 24;
	_this setPosWorld [11218.3,14870.7,71.8985];
	_this setVectorDirAndUp [[0.999998,0.00215832,-3.45325e-005],[0,0.0159977,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item25 = objNull;
if (_layerRoot) then {
	_item25 = createVehicle ["vn_o_pl_static_d44_01",[11193.2,14815.5,-0.000289917],[],0,"CAN_COLLIDE"];
	_this = _item25;
	_objects pushback _this;
	_objectIDs pushback 25;
	_this setPosWorld [11193.2,14815.5,70.0626];
	_this setVectorDirAndUp [[0.999543,0.0295783,0.00617502],[-0.00600007,-0.00599972,0.999964]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item26 = objNull;
if (_layerRoot) then {
	_item26 = createVehicle ["vn_o_pl_static_mortar_type53",[11168.2,14771.7,0],[],0,"CAN_COLLIDE"];
	_this = _item26;
	_objects pushback _this;
	_objectIDs pushback 26;
	_this setPosWorld [11168.2,14771.7,71.0478];
	_this setVectorDirAndUp [[0.837291,0.546734,0.0050239],[-0.00600007,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item27 = objNull;
if (_layerRoot) then {
	_item27 = createVehicle ["vn_o_nva_navy_static_v11m",[11218.2,14812.8,-0.0001297],[],0,"CAN_COLLIDE"];
	_this = _item27;
	_objects pushback _this;
	_objectIDs pushback 27;
	_this setPosWorld [11218.2,14812.8,72.034];
	_this setVectorDirAndUp [[0.621469,0.783393,0.00842931],[-0.00600007,-0.00599972,0.999964]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item29 = objNull;
if (_layerRoot) then {
	_item29 = createVehicle ["vn_b_navy_static_l60mk3",[11231.5,14851.6,0],[],0,"CAN_COLLIDE"];
	_this = _item29;
	_objects pushback _this;
	_objectIDs pushback 29;
	_this setPosWorld [11231.5,14851.6,72.2061];
	_this setVectorDirAndUp [[0.515618,0.856819,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item30 = objNull;
if (_layerRoot) then {
	_item30 = createVehicle ["vn_b_sf_static_m45",[11173.9,14808.7,-0.000259399],[],0,"CAN_COLLIDE"];
	_this = _item30;
	_objects pushback _this;
	_objectIDs pushback 30;
	_this setPosWorld [11173.9,14808.7,71.8794];
	_this setVectorDirAndUp [[-0.0101998,0.999948,-0.000163194],[-0.0159977,0,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item35 = objNull;
if (_layerRoot) then {
	_item35 = createVehicle ["vn_o_kr_static_zgu1_01",[2861,14883.3,0],[],0,"CAN_COLLIDE"];
	_this = _item35;
	_objects pushback _this;
	_objectIDs pushback 35;
	_this setPosWorld [2861.16,14883.3,218.092];
	_this setVectorDirAndUp [[-0.0611731,-0.997436,-0.0371518],[0.109341,-0.0436941,0.993043]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item37 = objNull;
if (_layerRoot) then {
	_item37 = createVehicle ["vn_o_kr_static_zgu1_01",[3129.67,15797.5,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item37;
	_objects pushback _this;
	_objectIDs pushback 37;
	_this setPosWorld [3128.87,15797.8,386.936];
	_this setVectorDirAndUp [[0,0.999033,-0.0439577],[-0.136705,0.0435451,0.989654]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item41 = objNull;
if (_layerRoot) then {
	_item41 = createVehicle ["vn_o_kr_static_zgu1_01",[3131.84,15794.5,-0.00360107],[],0,"CAN_COLLIDE"];
	_this = _item41;
	_objects pushback _this;
	_objectIDs pushback 41;
	_this setPosWorld [3131.84,15794.5,387.351];
	_this setVectorDirAndUp [[-0.441046,-0.897485,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item42 = objNull;
if (_layerRoot) then {
	_item42 = createVehicle ["vn_b_aus_army_static_m101_02",[3137.03,15800.6,0],[],0,"CAN_COLLIDE"];
	_this = _item42;
	_objects pushback _this;
	_objectIDs pushback 42;
	_this setPosWorld [3136.95,15803.2,385.55];
	_this setVectorDirAndUp [[0.0209718,0.999372,-0.0285681],[0.027987,0.0279764,0.999217]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item43 = objNull;
if (_layerRoot) then {
	_item43 = createVehicle ["vn_o_kr_static_m1910_low_01",[3133.28,15790.7,-0.000183105],[],0,"CAN_COLLIDE"];
	_this = _item43;
	_objects pushback _this;
	_objectIDs pushback 43;
	_this setPosWorld [3133.26,15790.6,386.592];
	_this setVectorDirAndUp [[-0.605443,-0.795573,-0.0224117],[-0.015994,-0.0159916,0.999744]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item44 = objNull;
if (_layerRoot) then {
	_item44 = createVehicle ["vn_b_sf_static_m45",[3260.72,15319.1,-0.000518799],[],0,"CAN_COLLIDE"];
	_this = _item44;
	_objects pushback _this;
	_objectIDs pushback 44;
	_this setPosWorld [3260.8,15319.1,281.191];
	_this setVectorDirAndUp [[-0.959216,0.280863,0.0319605],[0.0379741,0.0159936,0.999151]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item45 = objNull;
if (_layerRoot) then {
	_item45 = createVehicle ["vn_o_pl_static_mortar_type53",[3270.36,15313.4,-0.000244141],[],0,"CAN_COLLIDE"];
	_this = _item45;
	_objects pushback _this;
	_objectIDs pushback 45;
	_this setPosWorld [3270.37,15313.4,280.182];
	_this setVectorDirAndUp [[-0.922058,0.387041,-0.00297957],[0.00599983,0.0219899,0.99974]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item46 = objNull;
if (_layerRoot) then {
	_item46 = createVehicle ["vn_o_pl_static_zpu4",[3263.83,15328.1,0],[],0,"CAN_COLLIDE"];
	_this = _item46;
	_objects pushback _this;
	_objectIDs pushback 46;
	_this setPosWorld [3263.83,15328.1,280.889];
	_this setVectorDirAndUp [[0.999705,-0.0242955,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item47 = objNull;
if (_layerRoot) then {
	_item47 = createVehicle ["vn_flag_pavn",[3255.68,15328.8,0],[],0,"CAN_COLLIDE"];
	_this = _item47;
	_objects pushback _this;
	_objectIDs pushback 47;
	_this setPosWorld [3255.68,15328.8,283.247];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item49 = objNull;
if (_layerRoot) then {
	_item49 = createVehicle ["Land_vn_o_snipertree_03",[1030.67,12481.4,0.00782013],[],0,"CAN_COLLIDE"];
	_this = _item49;
	_objects pushback _this;
	_objectIDs pushback 49;
	_this setPosWorld [1030.67,12481.4,92.5729];
	_this setVectorDirAndUp [[-0.362032,-0.932166,0],[0,0,1]];
};

private _item50 = objNull;
if (_layerRoot) then {
	_item50 = createVehicle ["Land_vn_o_snipertree_04",[1085.8,12395.8,0.0425873],[],0,"CAN_COLLIDE"];
	_this = _item50;
	_objects pushback _this;
	_objectIDs pushback 50;
	_this setPosWorld [1085.8,12395.8,93.7377];
	_this setVectorDirAndUp [[0.150898,-0.988549,0],[0,0,1]];
};

private _item51 = objNull;
if (_layerRoot) then {
	_item51 = createVehicle ["Land_vn_o_snipertree_02",[990.82,12426.4,0.358803],[],0,"CAN_COLLIDE"];
	_this = _item51;
	_objects pushback _this;
	_objectIDs pushback 51;
	_this setPosWorld [990.82,12426.4,91.5329];
	_this setVectorDirAndUp [[-0.920846,0.389926,0],[0,0,1]];
};

private _item52 = objNull;
if (_layerRoot) then {
	_item52 = createVehicle ["Land_vn_o_platform_06",[1083.81,12443.6,0],[],0,"CAN_COLLIDE"];
	_this = _item52;
	_objects pushback _this;
	_objectIDs pushback 52;
	_this setPosWorld [1083.81,12443.6,79.2561];
	_this setVectorDirAndUp [[-0.119034,0.99289,0],[0,0,1]];
};

private _item53 = objNull;
if (_layerRoot) then {
	_item53 = createVehicle ["Land_vn_o_bunker_03",[1053.13,12486.9,0],[],0,"CAN_COLLIDE"];
	_this = _item53;
	_objects pushback _this;
	_objectIDs pushback 53;
	_this setPosWorld [1053.13,12486.9,73.943];
	_this setVectorDirAndUp [[0.325259,0.945625,0],[0,0,1]];
};

private _item54 = objNull;
if (_layerRoot) then {
	_item54 = createVehicle ["Land_vn_o_bunker_03",[1082.74,12392.7,0],[],0,"CAN_COLLIDE"];
	_this = _item54;
	_objects pushback _this;
	_objectIDs pushback 54;
	_this setPosWorld [1082.74,12392.7,83.6068];
	_this setVectorDirAndUp [[0.445173,-0.895445,0],[0,0,1]];
};

private _item56 = objNull;
if (_layerRoot) then {
	_item56 = createVehicle ["Land_vn_o_platform_06",[1020.58,12414.7,0],[],0,"CAN_COLLIDE"];
	_this = _item56;
	_objects pushback _this;
	_objectIDs pushback 56;
	_this setPosWorld [1020.58,12414.7,78.9797];
	_this setVectorDirAndUp [[0.844374,-0.535755,0],[0,0,1]];
};

private _item57 = objNull;
if (_layerRoot) then {
	_item57 = createVehicle ["vn_flag_pl",[1029.2,12457.9,0],[],0,"CAN_COLLIDE"];
	_this = _item57;
	_objects pushback _this;
	_objectIDs pushback 57;
	_this setPosWorld [1029.2,12457.9,78.372];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item58 = objNull;
if (_layerRoot) then {
	_item58 = createVehicle ["Land_vn_o_shelter_02",[1025.36,12477.8,7.62939e-005],[],0,"CAN_COLLIDE"];
	_this = _item58;
	_objects pushback _this;
	_objectIDs pushback 58;
	_this setPosWorld [1025.36,12477.8,75.449];
	_this setVectorDirAndUp [[-0.174272,0.984698,0],[0,0,1]];
};

private _item59 = objNull;
if (_layerRoot) then {
	_item59 = createVehicle ["Land_vn_o_shelter_02",[1041.66,12440.5,7.62939e-005],[],0,"CAN_COLLIDE"];
	_this = _item59;
	_objects pushback _this;
	_objectIDs pushback 59;
	_this setPosWorld [1041.66,12440.5,76.0695];
	_this setVectorDirAndUp [[0.397227,-0.917721,0],[0,0,1]];
};

private _item60 = objNull;
if (_layerRoot) then {
	_item60 = createVehicle ["Land_vn_o_platform_06",[1005.62,12476.3,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item60;
	_objects pushback _this;
	_objectIDs pushback 60;
	_this setPosWorld [1005.62,12476.3,77.4886];
	_this setVectorDirAndUp [[-0.964915,-0.262563,0],[0,0,1]];
};

private _item61 = objNull;
if (_layerRoot) then {
	_item61 = createVehicle ["vn_flag_vc",[1753.15,12925,0],[],0,"CAN_COLLIDE"];
	_this = _item61;
	_objects pushback _this;
	_objectIDs pushback 61;
	_this setPosWorld [1753.15,12925,102.755];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item62 = objNull;
if (_layerRoot) then {
	_item62 = createVehicle ["vn_flag_vc",[2347.92,11959.4,0.0011673],[],0,"CAN_COLLIDE"];
	_this = _item62;
	_objects pushback _this;
	_objectIDs pushback 62;
	_this setPosWorld [2347.92,11959.4,72.303];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item63 = objNull;
if (_layerRoot) then {
	_item63 = createVehicle ["vn_flag_vc",[2404.94,10166.8,0.0114615],[],0,"CAN_COLLIDE"];
	_this = _item63;
	_objects pushback _this;
	_objectIDs pushback 63;
	_this setPosWorld [2404.94,10166.8,7.01136];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item64 = objNull;
if (_layerRoot) then {
	_item64 = createVehicle ["vn_flag_vc",[2167.34,7943.92,-0.0137291],[],0,"CAN_COLLIDE"];
	_this = _item64;
	_objects pushback _this;
	_objectIDs pushback 64;
	_this setPosWorld [2167.34,7943.92,28.6676];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item65 = objNull;
if (_layerRoot) then {
	_item65 = createVehicle ["vn_flag_vc",[3443.68,7741.19,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item65;
	_objects pushback _this;
	_objectIDs pushback 65;
	_this setPosWorld [3443.68,7741.19,10.9568];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item66 = objNull;
if (_layerRoot) then {
	_item66 = createVehicle ["vn_flag_pavn",[1882.06,4213.35,0],[],0,"CAN_COLLIDE"];
	_this = _item66;
	_objects pushback _this;
	_objectIDs pushback 66;
	_this setPosWorld [1882.06,4213.35,33.9668];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item67 = objNull;
if (_layerRoot) then {
	_item67 = createVehicle ["vn_o_pl_static_d44_01",[1895.9,4209.72,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item67;
	_objects pushback _this;
	_objectIDs pushback 67;
	_this setPosWorld [1895.92,4209.76,29.9851];
	_this setVectorDirAndUp [[0.434856,-0.900496,-0.00260911],[0.00599983,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item68 = objNull;
if (_layerRoot) then {
	_item68 = createVehicle ["vn_o_pl_static_d44_01",[1890.08,4182.66,0],[],0,"CAN_COLLIDE"];
	_this = _item68;
	_objects pushback _this;
	_objectIDs pushback 68;
	_this setPosWorld [1890.1,4182.69,29.9906];
	_this setVectorDirAndUp [[-0.31395,-0.949439,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item69 = objNull;
if (_layerRoot) then {
	_item69 = createVehicle ["vn_o_pl_static_d44_01",[1876.84,4221.32,0.000286102],[],0,"CAN_COLLIDE"];
	_this = _item69;
	_objects pushback _this;
	_objectIDs pushback 69;
	_this setPosWorld [1876.86,4221.35,29.9909];
	_this setVectorDirAndUp [[-0.567651,0.823269,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item70 = objNull;
if (_layerRoot) then {
	_item70 = createVehicle ["vn_o_pl_static_d44_01",[1836.92,4224.23,0],[],0,"CAN_COLLIDE"];
	_this = _item70;
	_objects pushback _this;
	_objectIDs pushback 70;
	_this setPosWorld [1836.93,4224.26,29.9978];
	_this setVectorDirAndUp [[-0.980613,-0.195826,-0.00705891],[-0.00600007,-0.00599972,0.999964]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item71 = objNull;
if (_layerRoot) then {
	_item71 = createVehicle ["vn_o_pl_static_mortar_type53",[1820.31,4209.16,0],[],0,"CAN_COLLIDE"];
	_this = _item71;
	_objects pushback _this;
	_objectIDs pushback 71;
	_this setPosWorld [1820.31,4209.17,31.0318];
	_this setVectorDirAndUp [[0,0.999982,-0.00600007],[0.00599983,0.00599997,0.999964]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item72 = objNull;
if (_layerRoot) then {
	_item72 = createVehicle ["vn_o_pl_static_mortar_type53",[1857.23,4226.04,0],[],0,"CAN_COLLIDE"];
	_this = _item72;
	_objects pushback _this;
	_objectIDs pushback 72;
	_this setPosWorld [1857.23,4226.05,31.0823];
	_this setVectorDirAndUp [[0.793347,-0.608759,0.00365266],[0,0.00600007,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item73 = objNull;
if (_layerRoot) then {
	_item73 = createVehicle ["vn_o_kr_static_zgu1_01",[1852.86,4237.86,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item73;
	_objects pushback _this;
	_objectIDs pushback 73;
	_this setPosWorld [1852.86,4237.85,31.572];
	_this setVectorDirAndUp [[0,0.999982,0.00599983],[0,-0.00599983,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item74 = objNull;
if (_layerRoot) then {
	_item74 = createVehicle ["vn_o_kr_static_zgu1_01",[1796.31,4219.75,0],[],0,"CAN_COLLIDE"];
	_this = _item74;
	_objects pushback _this;
	_objectIDs pushback 74;
	_this setPosWorld [1796.32,4219.8,31.6441];
	_this setVectorDirAndUp [[-0.72519,-0.688044,0.0263703],[0.00599983,0.0319824,0.99947]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item75 = objNull;
if (_layerRoot) then {
	_item75 = createVehicle ["vn_o_kr_static_zgu1_01",[1893.53,4222.19,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item75;
	_objects pushback _this;
	_objectIDs pushback 75;
	_this setPosWorld [1893.53,4222.18,31.4967];
	_this setVectorDirAndUp [[0.874809,0.484444,0.00484209],[0,-0.00999464,0.99995]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item76 = objNull;
if (_layerRoot) then {
	_item76 = createVehicle ["vn_o_pl_static_zpu4",[1854.01,4191.64,0],[],0,"CAN_COLLIDE"];
	_this = _item76;
	_objects pushback _this;
	_objectIDs pushback 76;
	_this setPosWorld [1854.08,4191.73,34.5131];
	_this setVectorDirAndUp [[0.440336,0.895661,-0.0624193],[0.0399682,0.0498986,0.997954]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item77 = objNull;
if (_layerRoot) then {
	_item77 = createVehicle ["vn_b_aus_army_static_m101_02",[4819.92,8550.22,-0.0387268],[],0,"CAN_COLLIDE"];
	_this = _item77;
	_objects pushback _this;
	_objectIDs pushback 77;
	_this setPosWorld [4819.84,8552.79,135.883];
	_this setVectorDirAndUp [[-0.997746,0.0575536,0.0344992],[0.0339789,-0.00999459,0.999373]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item78 = objNull;
if (_layerRoot) then {
	_item78 = createVehicle ["vn_b_aus_army_static_m101_02",[4837.68,8543.61,0],[],0,"CAN_COLLIDE"];
	_this = _item78;
	_objects pushback _this;
	_objectIDs pushback 78;
	_this setPosWorld [4837.6,8546.17,136.085];
	_this setVectorDirAndUp [[0.762036,-0.640478,0.0953369],[-0.0559124,0.0815985,0.995096]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item79 = objNull;
if (_layerRoot) then {
	_item79 = createVehicle ["vn_b_aus_army_static_m101_02",[4839.63,8559.09,0.168427],[],0,"CAN_COLLIDE"];
	_this = _item79;
	_objects pushback _this;
	_objectIDs pushback 79;
	_this setPosWorld [4839.54,8561.65,135.562];
	_this setVectorDirAndUp [[0.735879,0.674525,-0.059142],[0.0399667,0.0439226,0.998235]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item80 = objNull;
if (_layerRoot) then {
	_item80 = createVehicle ["vn_flag_camo02",[4831,8554.33,-1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item80;
	_objects pushback _this;
	_objectIDs pushback 80;
	_this setPosWorld [4831,8554.33,139.62];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item81 = objNull;
if (_layerRoot) then {
	_item81 = createVehicle ["vn_o_kr_static_zgu1_01",[4794.58,8542.5,-6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item81;
	_objects pushback _this;
	_objectIDs pushback 81;
	_this setPosWorld [4794.59,8542.49,138.345];
	_this setVectorDirAndUp [[-0.854446,0.519311,0.0154438],[0.0119949,-0.00999964,0.999878]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item82 = objNull;
if (_layerRoot) then {
	_item82 = createVehicle ["vn_o_kr_static_zgu1_01",[4832.44,8526.56,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item82;
	_objects pushback _this;
	_objectIDs pushback 82;
	_this setPosWorld [4832.35,8526.6,138.194];
	_this setVectorDirAndUp [[0.721214,-0.689878,0.0626076],[-0.0598936,0.0279392,0.997814]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item84 = objNull;
if (_layerRoot) then {
	_item84 = createVehicle ["vn_b_sf_static_m45",[4826.7,8560.34,0],[],0,"CAN_COLLIDE"];
	_this = _item84;
	_objects pushback _this;
	_objectIDs pushback 84;
	_this setPosWorld [4826.78,8560.25,137.8];
	_this setVectorDirAndUp [[0.189502,0.981235,0.0355874],[0.0399667,-0.0439226,0.998235]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item85 = objNull;
if (_layerRoot) then {
	_item85 = createVehicle ["vn_b_aus_army_static_m101_02",[5886.95,7874.68,-0.00479126],[],0,"CAN_COLLIDE"];
	_this = _item85;
	_objects pushback _this;
	_objectIDs pushback 85;
	_this setPosWorld [5886.87,7877.25,158.527];
	_this setVectorDirAndUp [[0.310064,-0.950618,0.0136429],[-0.0439577,0,0.999033]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item86 = objNull;
if (_layerRoot) then {
	_item86 = createVehicle ["vn_b_aus_army_static_m101_02",[5887.37,7901.6,0],[],0,"CAN_COLLIDE"];
	_this = _item86;
	_objects pushback _this;
	_objectIDs pushback 86;
	_this setPosWorld [5887.29,7904.16,158.73];
	_this setVectorDirAndUp [[0.476524,0.879158,0.00234928],[-0.0159977,0.00599931,0.999854]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item87 = objNull;
if (_layerRoot) then {
	_item87 = createVehicle ["vn_b_aus_army_static_m101_02",[5854.8,7894.83,0],[],0,"CAN_COLLIDE"];
	_this = _item87;
	_objects pushback _this;
	_objectIDs pushback 87;
	_this setPosWorld [5854.72,7897.39,159.276];
	_this setVectorDirAndUp [[-0.753745,-0.657161,0.00277378],[0.0419644,-0.043919,0.998153]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item88 = objNull;
if (_layerRoot) then {
	_item88 = createVehicle ["vn_o_pl_static_zpu4",[5910.07,7859.45,-0.0289459],[],0,"CAN_COLLIDE"];
	_this = _item88;
	_objects pushback _this;
	_objectIDs pushback 88;
	_this setPosWorld [5910.02,7859.48,159.672];
	_this setVectorDirAndUp [[0.633892,-0.772653,0.0344743],[-0.0299892,0.0199857,0.99935]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item89 = objNull;
if (_layerRoot) then {
	_item89 = createVehicle ["vn_o_kr_static_zgu1_01",[5945.37,7833.8,-0.0614929],[],0,"CAN_COLLIDE"];
	_this = _item89;
	_objects pushback _this;
	_objectIDs pushback 89;
	_this setPosWorld [5945.45,7833.64,164.39];
	_this setVectorDirAndUp [[0.824265,-0.556607,-0.10381],[0.0499373,-0.111164,0.992547]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item90 = objNull;
if (_layerRoot) then {
	_item90 = createVehicle ["vn_flag_camo02",[5872.05,7887.78,0],[],0,"CAN_COLLIDE"];
	_this = _item90;
	_objects pushback _this;
	_objectIDs pushback 90;
	_this setPosWorld [5872.05,7887.78,162.56];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item91 = objNull;
if (_layerRoot) then {
	_item91 = createVehicle ["vn_flag_pl",[5848.27,9913.54,0],[],0,"CAN_COLLIDE"];
	_this = _item91;
	_objects pushback _this;
	_objectIDs pushback 91;
	_this setPosWorld [5848.27,9913.54,185.285];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item92 = objNull;
if (_layerRoot) then {
	_item92 = createVehicle ["vn_o_pl_static_d44_01",[5589.99,10534,0.00183105],[],0,"CAN_COLLIDE"];
	_this = _item92;
	_objects pushback _this;
	_objectIDs pushback 92;
	_this setPosWorld [5590,10534,286.587];
	_this setVectorDirAndUp [[-0.237725,0.969554,-0.058752],[0.0219984,0.0658446,0.997587]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item93 = objNull;
if (_layerRoot) then {
	_item93 = createVehicle ["vn_o_pl_static_d44_01",[5577.16,10526.3,0],[],0,"CAN_COLLIDE"];
	_this = _item93;
	_objects pushback _this;
	_objectIDs pushback 93;
	_this setPosWorld [5577.18,10526.3,286.799];
	_this setVectorDirAndUp [[-0.72449,0.686461,-0.0623359],[-0.0499373,0.0379251,0.998032]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item94 = objNull;
if (_layerRoot) then {
	_item94 = createVehicle ["vn_flag_pavn",[5599.95,10498.8,0],[],0,"CAN_COLLIDE"];
	_this = _item94;
	_objects pushback _this;
	_objectIDs pushback 94;
	_this setPosWorld [5599.95,10498.8,294.627];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item95 = objNull;
if (_layerRoot) then {
	_item95 = createVehicle ["vn_b_navy_static_l60mk3",[5570.43,10490.2,-0.00115967],[],0,"CAN_COLLIDE"];
	_this = _item95;
	_objects pushback _this;
	_objectIDs pushback 95;
	_this setPosWorld [5570.39,10490.3,292.43];
	_this setVectorDirAndUp [[-0.989593,0.141085,-0.0282949],[-0.0199977,0.0598846,0.998005]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item96 = objNull;
if (_layerRoot) then {
	_item96 = createVehicle ["vn_b_navy_static_l60mk3",[5609.95,10486,-0.00515747],[],0,"CAN_COLLIDE"];
	_this = _item96;
	_objects pushback _this;
	_objectIDs pushback 96;
	_this setPosWorld [5610.02,10486,293.238];
	_this setVectorDirAndUp [[0.903904,0.427688,0.00641374],[-0.0259939,0.039958,0.998863]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item97 = objNull;
if (_layerRoot) then {
	_item97 = createVehicle ["vn_b_sf_static_m45",[5591.25,10516,0],[],0,"CAN_COLLIDE"];
	_this = _item97;
	_objects pushback _this;
	_objectIDs pushback 97;
	_this setPosWorld [5591.16,10516,289.28];
	_this setVectorDirAndUp [[0.914266,0.403113,0.0402279],[-0.0439577,0,0.999033]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item98 = objNull;
if (_layerRoot) then {
	_item98 = createVehicle ["vn_b_sf_static_m45",[5591.96,10491.4,0],[],0,"CAN_COLLIDE"];
	_this = _item98;
	_objects pushback _this;
	_objectIDs pushback 98;
	_this setPosWorld [5591.94,10491.5,293.014];
	_this setVectorDirAndUp [[-0.851394,-0.524229,0.0176907],[-0.00999474,0.0499348,0.998702]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item99 = objNull;
if (_layerRoot) then {
	_item99 = createVehicle ["vn_flag_vc",[4323.2,11722,0],[],0,"CAN_COLLIDE"];
	_this = _item99;
	_objects pushback _this;
	_objectIDs pushback 99;
	_this setPosWorld [4323.2,11722,157.405];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item103 = objNull;
if (_layerRoot) then {
	_item103 = createVehicle ["vn_o_pl_static_zpu4",[4015.59,13491.2,0],[],0,"CAN_COLLIDE"];
	_this = _item103;
	_objects pushback _this;
	_objectIDs pushback 103;
	_this setPosWorld [4015.59,13491.2,359.949];
	_this setVectorDirAndUp [[-0.359295,-0.933224,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item104 = objNull;
if (_layerRoot) then {
	_item104 = createVehicle ["vn_o_pl_static_zpu4",[4021.76,13590.1,0],[],0,"CAN_COLLIDE"];
	_this = _item104;
	_objects pushback _this;
	_objectIDs pushback 104;
	_this setPosWorld [4021.85,13590.2,375.228];
	_this setVectorDirAndUp [[-0.879442,0.475464,0.0226997],[0.0559122,0.055825,0.996874]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item105 = objNull;
if (_layerRoot) then {
	_item105 = createVehicle ["vn_o_pl_static_d44_01",[4009.3,13562.2,-0.00140381],[],0,"CAN_COLLIDE"];
	_this = _item105;
	_objects pushback _this;
	_objectIDs pushback 105;
	_this setPosWorld [4009.31,13562.3,374.993];
	_this setVectorDirAndUp [[-0.93333,0.358808,0.0123615],[0.0239934,0.0279835,0.99932]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item106 = objNull;
if (_layerRoot) then {
	_item106 = createVehicle ["vn_o_pl_static_d44_01",[4025.42,13467.9,0],[],0,"CAN_COLLIDE"];
	_this = _item106;
	_objects pushback _this;
	_objectIDs pushback 106;
	_this setPosWorld [4025.44,13467.9,358.271];
	_this setVectorDirAndUp [[0.59298,-0.805217,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item107 = objNull;
if (_layerRoot) then {
	_item107 = createVehicle ["vn_o_pl_static_d44_01",[3999.86,13479.9,0.00012207],[],0,"CAN_COLLIDE"];
	_this = _item107;
	_objects pushback _this;
	_objectIDs pushback 107;
	_this setPosWorld [3999.88,13479.9,358.271];
	_this setVectorDirAndUp [[-0.869789,-0.493424,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item108 = objNull;
if (_layerRoot) then {
	_item108 = createVehicle ["vn_flag_pavn",[4029.11,13559.3,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item108;
	_objects pushback _this;
	_objectIDs pushback 108;
	_this setPosWorld [4029.11,13559.3,377.616];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item109 = objNull;
if (_layerRoot) then {
	_item109 = createVehicle ["vn_b_sf_static_m45",[4059.43,13768,0],[],0,"CAN_COLLIDE"];
	_this = _item109;
	_objects pushback _this;
	_objectIDs pushback 109;
	_this setPosWorld [4059.68,13767.8,425.854];
	_this setVectorDirAndUp [[0.679472,0.72921,-0.0810567],[0.0718169,0.0438442,0.996454]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item110 = objNull;
if (_layerRoot) then {
	_item110 = createVehicle ["vn_b_sf_static_m45",[4124.03,13640.8,0],[],0,"CAN_COLLIDE"];
	_this = _item110;
	_objects pushback _this;
	_objectIDs pushback 110;
	_this setPosWorld [4124,13640.5,389.914];
	_this setVectorDirAndUp [[0.965707,0.254119,0.0532249],[-0.015994,-0.146385,0.989098]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item111 = objNull;
if (_layerRoot) then {
	_item111 = createVehicle ["vn_b_sf_static_m45",[4073.98,13522.5,-0.00335693],[],0,"CAN_COLLIDE"];
	_this = _item111;
	_objects pushback _this;
	_objectIDs pushback 111;
	_this setPosWorld [4074.09,13522.4,371.39];
	_this setVectorDirAndUp [[0.965779,-0.251908,-0.0617604],[0.0539192,-0.0379189,0.997825]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item112 = objNull;
if (_layerRoot) then {
	_item112 = createVehicle ["Land_vn_o_bunker_03",[3999.66,13461.1,0],[],0,"CAN_COLLIDE"];
	_this = _item112;
	_objects pushback _this;
	_objectIDs pushback 112;
	_this setPosWorld [3999.66,13461.1,357.955];
	_this setVectorDirAndUp [[-0.486923,-0.873445,0],[0,0,1]];
};

private _item113 = objNull;
if (_layerRoot) then {
	_item113 = createVehicle ["Land_vn_o_bunker_03",[4067.75,13531.8,0],[],0,"CAN_COLLIDE"];
	_this = _item113;
	_objects pushback _this;
	_objectIDs pushback 113;
	_this setPosWorld [4067.75,13531.8,369.464];
	_this setVectorDirAndUp [[0.983731,0.179648,0],[0,0,1]];
};

private _item114 = objNull;
if (_layerRoot) then {
	_item114 = createVehicle ["Land_vn_o_bunker_03",[4040.47,13480.8,0.144012],[],0,"CAN_COLLIDE"];
	_this = _item114;
	_objects pushback _this;
	_objectIDs pushback 114;
	_this setPosWorld [4040.47,13480.8,358.365];
	_this setVectorDirAndUp [[0.849653,-0.527342,0],[0,0,1]];
};

private _item115 = objNull;
if (_layerRoot) then {
	_item115 = createVehicle ["Land_vn_o_bunker_03",[4013.17,13574.1,0.144043],[],0,"CAN_COLLIDE"];
	_this = _item115;
	_objects pushback _this;
	_objectIDs pushback 115;
	_this setPosWorld [4013.17,13574.1,374.108];
	_this setVectorDirAndUp [[-0.828949,0.559325,0],[0,0,1]];
};

private _item116 = objNull;
if (_layerRoot) then {
	_item116 = createVehicle ["Land_vn_o_bunker_03",[4054.37,13774.4,0],[],0,"CAN_COLLIDE"];
	_this = _item116;
	_objects pushback _this;
	_objectIDs pushback 116;
	_this setPosWorld [4054.37,13774.4,423.281];
	_this setVectorDirAndUp [[-0.342319,0.939584,0],[0,0,1]];
};

private _item117 = objNull;
if (_layerRoot) then {
	_item117 = createVehicle ["Land_vn_o_bunker_03",[4124.03,13648.6,0],[],0,"CAN_COLLIDE"];
	_this = _item117;
	_objects pushback _this;
	_objectIDs pushback 117;
	_this setPosWorld [4124.03,13648.6,388.427];
	_this setVectorDirAndUp [[0.998584,-0.0531996,0],[0,0,1]];
};

private _item118 = objNull;
if (_layerRoot) then {
	_item118 = createVehicle ["Land_vn_o_snipertree_03",[4114.51,13655.9,0.0078125],[],0,"CAN_COLLIDE"];
	_this = _item118;
	_objects pushback _this;
	_objectIDs pushback 118;
	_this setPosWorld [4114.51,13655.9,407.955];
	_this setVectorDirAndUp [[-0.711555,0.702631,0],[0,0,1]];
};

private _item119 = objNull;
if (_layerRoot) then {
	_item119 = createVehicle ["Land_vn_o_snipertree_02",[4035.12,13603.6,0.358826],[],0,"CAN_COLLIDE"];
	_this = _item119;
	_objects pushback _this;
	_objectIDs pushback 119;
	_this setPosWorld [4035.12,13603.6,381.918];
	_this setVectorDirAndUp [[0.778537,-0.627598,0],[0,0,1]];
};

private _item120 = objNull;
if (_layerRoot) then {
	_item120 = createVehicle ["Land_vn_o_shelter_02",[4024.61,13490.3,9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item120;
	_objects pushback _this;
	_objectIDs pushback 120;
	_this setPosWorld [4024.61,13490.3,359.594];
	_this setVectorDirAndUp [[0.848235,0.52962,0],[0,0,1]];
};

private _item121 = objNull;
if (_layerRoot) then {
	_item121 = createVehicle ["Land_vn_o_shelter_02",[4007.31,13498.6,0],[],0,"CAN_COLLIDE"];
	_this = _item121;
	_objects pushback _this;
	_objectIDs pushback 121;
	_this setPosWorld [4007.31,13498.6,359.572];
	_this setVectorDirAndUp [[-0.299008,0.954251,0],[0,0,1]];
};

private _item122 = objNull;
if (_layerRoot) then {
	_item122 = createVehicle ["Land_vn_o_shelter_02",[4033.33,13589.6,9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item122;
	_objects pushback _this;
	_objectIDs pushback 122;
	_this setPosWorld [4033.33,13589.6,374.263];
	_this setVectorDirAndUp [[0.771874,0.635776,0],[0,0,1]];
};

private _item123 = objNull;
if (_layerRoot) then {
	_item123 = createVehicle ["Land_vn_o_platform_06",[4036.86,13579.6,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item123;
	_objects pushback _this;
	_objectIDs pushback 123;
	_this setPosWorld [4036.86,13579.6,375.33];
	_this setVectorDirAndUp [[0.0452071,0.998978,0],[0,0,1]];
};

private _item124 = objNull;
if (_layerRoot) then {
	_item124 = createVehicle ["Land_vn_o_platform_06",[4121.24,13656.9,0],[],0,"CAN_COLLIDE"];
	_this = _item124;
	_objects pushback _this;
	_objectIDs pushback 124;
	_this setPosWorld [4121.24,13656.9,391.66];
	_this setVectorDirAndUp [[-0.705545,0.708665,0],[0,0,1]];
};

private _item125 = objNull;
if (_layerRoot) then {
	_item125 = createVehicle ["Land_vn_o_platform_06",[4114.06,13633.1,0],[],0,"CAN_COLLIDE"];
	_this = _item125;
	_objects pushback _this;
	_objectIDs pushback 125;
	_this setPosWorld [4114.06,13633.1,388.539];
	_this setVectorDirAndUp [[0.999613,0.0278334,0],[0,0,1]];
};

private _item126 = objNull;
if (_layerRoot) then {
	_item126 = createVehicle ["Land_vn_o_platform_06",[4014.48,13612.4,0],[],0,"CAN_COLLIDE"];
	_this = _item126;
	_objects pushback _this;
	_objectIDs pushback 126;
	_this setPosWorld [4014.48,13612.4,375.658];
	_this setVectorDirAndUp [[-0.076086,-0.997101,0],[0,0,1]];
};

private _item127 = objNull;
if (_layerRoot) then {
	_item127 = createVehicle ["Campfire_burning_F",[4028.75,13583.8,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item127;
	_objects pushback _this;
	_objectIDs pushback 127;
	_this setPosWorld [4028.76,13583.8,373.603];
	_this setVectorDirAndUp [[0,0.999279,-0.0379725],[0.0718107,0.0378745,0.996699]];
};

private _item128 = objNull;
if (_layerRoot) then {
	_item128 = createVehicle ["Campfire_burning_F",[4008.7,13491.2,0],[],0,"CAN_COLLIDE"];
	_this = _item128;
	_objects pushback _this;
	_objectIDs pushback 128;
	_this setPosWorld [4008.7,13491.2,358.539];
	_this setVectorDirAndUp [[0,1,0],[-0.00799344,0,0.999968]];
};

private _item130 = objNull;
if (_layerRoot) then {
	_item130 = createVehicle ["Land_vn_o_tower_02",[4050.05,13764.8,0],[],0,"CAN_COLLIDE"];
	_this = _item130;
	_objects pushback _this;
	_objectIDs pushback 130;
	_this setPosWorld [4050.05,13764.8,427.707];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item131 = objNull;
if (_layerRoot) then {
	_item131 = createVehicle ["Land_vn_o_tower_02",[4024.32,13556.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item131;
	_objects pushback _this;
	_objectIDs pushback 131;
	_this setPosWorld [4024.32,13556.4,377.565];
	_this setVectorDirAndUp [[-0.894289,0.44749,0],[0,0,1]];
};

private _item132 = objNull;
if (_layerRoot) then {
	_item132 = createVehicle ["Land_Razorwire_F",[4043.02,13470.7,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item132;
	_objects pushback _this;
	_objectIDs pushback 132;
	_this setPosWorld [4043.02,13470.7,359.328];
	_this setVectorDirAndUp [[0.846122,-0.531687,0.0372296],[-0.0439577,0,0.999033]];
	_this allowdamage false;;
};

private _item133 = objNull;
if (_layerRoot) then {
	_item133 = createVehicle ["Land_Razorwire_F",[4013.08,13453.3,0.000732422],[],0,"CAN_COLLIDE"];
	_this = _item133;
	_objects pushback _this;
	_objectIDs pushback 133;
	_this setPosWorld [4013.08,13453.3,358.951];
	_this setVectorDirAndUp [[-0.329881,-0.943428,-0.033488],[-0.00999474,-0.0319814,0.999438]];
	_this allowdamage false;;
};

private _item134 = objNull;
if (_layerRoot) then {
	_item134 = createVehicle ["Land_Razorwire_F",[3969.69,13586.5,0.000671387],[],0,"CAN_COLLIDE"];
	_this = _item134;
	_objects pushback _this;
	_objectIDs pushback 134;
	_this setPosWorld [3969.69,13586.5,371.974];
	_this setVectorDirAndUp [[-0.98296,0.0662975,-0.171446],[-0.179059,-0.134496,0.974602]];
	_this allowdamage false;;
};

private _item135 = objNull;
if (_layerRoot) then {
	_item135 = createVehicle ["Land_Razorwire_F",[3971.56,13598.9,0],[],0,"CAN_COLLIDE"];
	_this = _item135;
	_objects pushback _this;
	_objectIDs pushback 135;
	_this setPosWorld [3971.56,13598.9,372.864];
	_this setVectorDirAndUp [[-0.991022,0.0337922,-0.12936],[-0.126967,0.0653203,0.989754]];
	_this allowdamage false;;
};

private _item136 = objNull;
if (_layerRoot) then {
	_item136 = createVehicle ["Land_Razorwire_F",[3971.7,13614.2,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item136;
	_objects pushback _this;
	_objectIDs pushback 136;
	_this setPosWorld [3971.7,13614.2,370.438];
	_this setVectorDirAndUp [[-0.983984,0.0181662,-0.177331],[-0.173337,0.134636,0.975616]];
	_this allowdamage false;;
};

private _item137 = objNull;
if (_layerRoot) then {
	_item137 = createVehicle ["Land_Razorwire_F",[3972.29,13632.4,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item137;
	_objects pushback _this;
	_objectIDs pushback 137;
	_this setPosWorld [3972.29,13632.4,370.043];
	_this setVectorDirAndUp [[-0.945351,0.0829433,-0.315329],[-0.323597,-0.12013,0.938538]];
	_this allowdamage false;;
};

private _item138 = objNull;
if (_layerRoot) then {
	_item138 = createVehicle ["Land_Razorwire_F",[3972.65,13644,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item138;
	_objects pushback _this;
	_objectIDs pushback 138;
	_this setPosWorld [3972.65,13644,372.487];
	_this setVectorDirAndUp [[-0.940645,0.11725,-0.318494],[-0.337053,-0.212774,0.917127]];
	_this allowdamage false;;
};

private _item139 = objNull;
if (_layerRoot) then {
	_item139 = createVehicle ["Land_Razorwire_F",[4127.09,13677.2,0.000640869],[],0,"CAN_COLLIDE"];
	_this = _item139;
	_objects pushback _this;
	_objectIDs pushback 139;
	_this setPosWorld [4127.09,13677.2,389.353];
	_this setVectorDirAndUp [[0.744096,0.636364,-0.203373],[0.225998,0.0467019,0.973008]];
	_this allowdamage false;;
};

private _item140 = objNull;
if (_layerRoot) then {
	_item140 = createVehicle ["Land_Razorwire_F",[4135.75,13669.9,0.000732422],[],0,"CAN_COLLIDE"];
	_this = _item140;
	_objects pushback _this;
	_objectIDs pushback 140;
	_this setPosWorld [4135.75,13669.9,387.306];
	_this setVectorDirAndUp [[0.702526,0.643457,-0.304009],[0.313376,0.10383,0.943936]];
	_this allowdamage false;;
};

private _item141 = objNull;
if (_layerRoot) then {
	_item141 = createVehicle ["Land_Razorwire_F",[4139.46,13660.9,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item141;
	_objects pushback _this;
	_objectIDs pushback 141;
	_this setPosWorld [4139.46,13660.9,386.785];
	_this setVectorDirAndUp [[0.893415,-0.376836,-0.244547],[0.280293,0.0421957,0.958987]];
	_this allowdamage false;;
};

private _item142 = objNull;
if (_layerRoot) then {
	_item142 = createVehicle ["Land_Razorwire_F",[4139.92,13651,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item142;
	_objects pushback _this;
	_objectIDs pushback 142;
	_this setPosWorld [4139.92,13651,386.023];
	_this setVectorDirAndUp [[0.919449,0.260439,-0.294593],[0.326982,-0.0903042,0.940706]];
	_this allowdamage false;;
};

private _item143 = objNull;
if (_layerRoot) then {
	_item143 = createVehicle ["Land_Razorwire_F",[4139.03,13641.3,0],[],0,"CAN_COLLIDE"];
	_this = _item143;
	_objects pushback _this;
	_objectIDs pushback 143;
	_this setPosWorld [4139.03,13641.3,385.604];
	_this setVectorDirAndUp [[0.769635,-0.53033,-0.355544],[0.366574,-0.0889109,0.926131]];
	_this allowdamage false;;
};

private _item144 = objNull;
if (_layerRoot) then {
	_item144 = createVehicle ["Land_Razorwire_F",[4135.66,13631.7,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item144;
	_objects pushback _this;
	_objectIDs pushback 144;
	_this setPosWorld [4135.66,13631.7,385.783];
	_this setVectorDirAndUp [[-0.958019,-0.0158461,0.286266],[0.283829,-0.193466,0.939155]];
	_this allowdamage false;;
};

private _item145 = objNull;
if (_layerRoot) then {
	_item145 = createVehicle ["vn_flag_pl",[6536.11,10267.8,0],[],0,"CAN_COLLIDE"];
	_this = _item145;
	_objects pushback _this;
	_objectIDs pushback 145;
	_this setPosWorld [6536.11,10267.8,127.095];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item146 = objNull;
if (_layerRoot) then {
	_item146 = createVehicle ["vn_flag_vc",[6892.44,10451.6,0.000946045],[],0,"CAN_COLLIDE"];
	_this = _item146;
	_objects pushback _this;
	_objectIDs pushback 146;
	_this setPosWorld [6892.44,10451.6,111.076];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item147 = objNull;
if (_layerRoot) then {
	_item147 = createVehicle ["vn_b_aus_army_static_m101_02",[5600.62,15926.1,-0.277878],[],0,"CAN_COLLIDE"];
	_this = _item147;
	_objects pushback _this;
	_objectIDs pushback 147;
	_this setPosWorld [5600.54,15928.6,221.271];
	_this setVectorDirAndUp [[-0.955261,0.294574,-0.0264919],[-0.0160014,0.0379661,0.999151]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item148 = objNull;
if (_layerRoot) then {
	_item148 = createVehicle ["vn_b_aus_army_static_m101_02",[5645.52,15903.7,0.0042572],[],0,"CAN_COLLIDE"];
	_this = _item148;
	_objects pushback _this;
	_objectIDs pushback 148;
	_this setPosWorld [5645.43,15906.3,221.02];
	_this setVectorDirAndUp [[0.694147,-0.714151,-0.0902646],[0.0618809,-0.0657305,0.995917]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item149 = objNull;
if (_layerRoot) then {
	_item149 = createVehicle ["vn_b_aus_army_static_m101_02",[5624.86,15920.4,0],[],0,"CAN_COLLIDE"];
	_this = _item149;
	_objects pushback _this;
	_objectIDs pushback 149;
	_this setPosWorld [5624.75,15923,221.963];
	_this setVectorDirAndUp [[0.438947,0.890489,-0.119813],[0.0896406,0.0892797,0.991965]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item150 = objNull;
if (_layerRoot) then {
	_item150 = createVehicle ["vn_o_kr_static_zgu1_01",[5636.1,15906.9,0],[],0,"CAN_COLLIDE"];
	_this = _item150;
	_objects pushback _this;
	_objectIDs pushback 150;
	_this setPosWorld [5636.16,15906.8,223.059];
	_this setVectorDirAndUp [[0.0533214,-0.996289,-0.0675719],[0.0339803,-0.0658187,0.997253]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item151 = objNull;
if (_layerRoot) then {
	_item151 = createVehicle ["vn_o_kr_static_zgu1_01",[5610.07,15923,0],[],0,"CAN_COLLIDE"];
	_this = _item151;
	_objects pushback _this;
	_objectIDs pushback 151;
	_this setPosWorld [5609.97,15923.1,223.682];
	_this setVectorDirAndUp [[-0.4559,-0.889783,0.0209951],[-0.0319811,0.039951,0.99869]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item152 = objNull;
if (_layerRoot) then {
	_item152 = createVehicle ["vn_o_kr_static_zgu1_01",[5634.59,15915.9,0],[],0,"CAN_COLLIDE"];
	_this = _item152;
	_objects pushback _this;
	_objectIDs pushback 152;
	_this setPosWorld [5634.66,15916,223.381];
	_this setVectorDirAndUp [[0.522298,0.84957,-0.0737321],[0.0499382,0.0558427,0.99719]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item153 = objNull;
if (_layerRoot) then {
	_item153 = createVehicle ["vn_b_sf_static_m45",[5639.18,15898.8,0.00221252],[],0,"CAN_COLLIDE"];
	_this = _item153;
	_objects pushback _this;
	_objectIDs pushback 153;
	_this setPosWorld [5639.22,15898.7,222.735];
	_this setVectorDirAndUp [[0.527904,-0.839925,-0.125871],[0.0439577,-0.120985,0.991681]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item154 = objNull;
if (_layerRoot) then {
	_item154 = createVehicle ["Land_Razorwire_F",[5588.45,15934.8,0],[],0,"CAN_COLLIDE"];
	_this = _item154;
	_objects pushback _this;
	_objectIDs pushback 154;
	_this setPosWorld [5588.45,15934.8,220.781];
	_this setVectorDirAndUp [[0.918324,-0.351118,0.182747],[-0.179059,0.0432486,0.982887]];
	_this allowdamage false;;
};

private _item155 = objNull;
if (_layerRoot) then {
	_item155 = createVehicle ["Land_Razorwire_F",[5586.81,15923.7,0],[],0,"CAN_COLLIDE"];
	_this = _item155;
	_objects pushback _this;
	_objectIDs pushback 155;
	_this setPosWorld [5586.81,15923.7,220.335];
	_this setVectorDirAndUp [[0.965434,0.105168,0.23849],[-0.235212,-0.0427244,0.971005]];
	_this allowdamage false;;
};

private _item156 = objNull;
if (_layerRoot) then {
	_item156 = createVehicle ["Land_Razorwire_F",[5591.26,15911.7,0],[],0,"CAN_COLLIDE"];
	_this = _item156;
	_objects pushback _this;
	_objectIDs pushback 156;
	_this setPosWorld [5591.26,15911.7,219.923];
	_this setVectorDirAndUp [[0.693658,0.611203,0.381142],[-0.274974,-0.264374,0.92439]];
	_this allowdamage false;;
};

private _item157 = objNull;
if (_layerRoot) then {
	_item157 = createVehicle ["Land_Razorwire_F",[5602.15,15904.6,0],[],0,"CAN_COLLIDE"];
	_this = _item157;
	_objects pushback _this;
	_objectIDs pushback 157;
	_this setPosWorld [5602.15,15904.6,219.435];
	_this setVectorDirAndUp [[0.24524,0.919765,0.306414],[-0.167597,-0.271084,0.947853]];
	_this allowdamage false;;
};

private _item158 = objNull;
if (_layerRoot) then {
	_item158 = createVehicle ["Land_Razorwire_F",[5631.26,15943.1,0],[],0,"CAN_COLLIDE"];
	_this = _item158;
	_objects pushback _this;
	_objectIDs pushback 158;
	_this setPosWorld [5631.26,15943.1,219.066];
	_this setVectorDirAndUp [[-0.211691,-0.945784,0.246333],[0.0539225,0.240359,0.969185]];
	_this allowdamage false;;
};

private _item159 = objNull;
if (_layerRoot) then {
	_item159 = createVehicle ["Land_Razorwire_F",[5641.41,15935.8,0],[],0,"CAN_COLLIDE"];
	_this = _item159;
	_objects pushback _this;
	_objectIDs pushback 159;
	_this setPosWorld [5641.41,15935.8,219.08];
	_this setVectorDirAndUp [[-0.560261,-0.674432,0.480884],[0.251634,0.414536,0.874551]];
	_this allowdamage false;;
};

private _item160 = objNull;
if (_layerRoot) then {
	_item160 = createVehicle ["Land_Razorwire_F",[5655.21,15926.6,0],[],0,"CAN_COLLIDE"];
	_this = _item160;
	_objects pushback _this;
	_objectIDs pushback 160;
	_this setPosWorld [5655.21,15926.6,218.185];
	_this setVectorDirAndUp [[-0.757906,-0.628595,0.174492],[0.077763,0.178517,0.980859]];
	_this allowdamage false;;
};

private _item161 = objNull;
if (_layerRoot) then {
	_item161 = createVehicle ["Land_Razorwire_F",[5681.01,15896.4,0],[],0,"CAN_COLLIDE"];
	_this = _item161;
	_objects pushback _this;
	_objectIDs pushback 161;
	_this setPosWorld [5681.01,15896.4,215.806];
	_this setVectorDirAndUp [[-0.919885,0.261384,0.292387],[0.276752,-0.0956169,0.956173]];
	_this allowdamage false;;
};

private _item162 = objNull;
if (_layerRoot) then {
	_item162 = createVehicle ["vn_o_pl_static_mortar_type53",[5614.01,15916.5,0],[],0,"CAN_COLLIDE"];
	_this = _item162;
	_objects pushback _this;
	_objectIDs pushback 162;
	_this setPosWorld [5613.98,15916.5,223.381];
	_this setVectorDirAndUp [[0.533581,0.845195,0.0305982],[-0.0319811,-0.0159893,0.999361]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item163 = objNull;
if (_layerRoot) then {
	_item163 = createVehicle ["Land_vn_o_platform_06",[5625.08,15908.5,0],[],0,"CAN_COLLIDE"];
	_this = _item163;
	_objects pushback _this;
	_objectIDs pushback 163;
	_this setPosWorld [5625.08,15908.5,224.113];
	_this setVectorDirAndUp [[0.815085,-0.579341,0],[0,0,1]];
};

private _item164 = objNull;
if (_layerRoot) then {
	_item164 = createVehicle ["Land_vn_o_platform_06",[5679.79,15920.5,0],[],0,"CAN_COLLIDE"];
	_this = _item164;
	_objects pushback _this;
	_objectIDs pushback 164;
	_this setPosWorld [5679.79,15920.5,215.992];
	_this setVectorDirAndUp [[-0.632202,0.774804,0],[0,0,1]];
};

private _item165 = objNull;
if (_layerRoot) then {
	_item165 = createVehicle ["Land_vn_o_shelter_02",[5609.08,15930,0],[],0,"CAN_COLLIDE"];
	_this = _item165;
	_objects pushback _this;
	_objectIDs pushback 165;
	_this setPosWorld [5609.08,15930,222.803];
	_this setVectorDirAndUp [[0.747543,0.664213,0],[0,0,1]];
};

private _item166 = objNull;
if (_layerRoot) then {
	_item166 = createVehicle ["Land_vn_o_shelter_02",[5618.83,15930.6,0],[],0,"CAN_COLLIDE"];
	_this = _item166;
	_objects pushback _this;
	_objectIDs pushback 166;
	_this setPosWorld [5618.83,15930.6,222.83];
	_this setVectorDirAndUp [[-0.179976,0.983671,0],[0,0,1]];
};

private _item167 = objNull;
if (_layerRoot) then {
	_item167 = createVehicle ["Land_vn_o_shelter_02",[5628.39,15914.1,9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item167;
	_objects pushback _this;
	_objectIDs pushback 167;
	_this setPosWorld [5628.39,15914.1,223.444];
	_this setVectorDirAndUp [[-0.689764,0.724035,0],[0,0,1]];
};

private _item168 = objNull;
if (_layerRoot) then {
	_item168 = createVehicle ["Land_vn_o_tower_02",[5667.1,15904.6,0],[],0,"CAN_COLLIDE"];
	_this = _item168;
	_objects pushback _this;
	_objectIDs pushback 168;
	_this setPosWorld [5667.1,15904.6,221.43];
	_this setVectorDirAndUp [[-0.28637,-0.958119,0],[0,0,1]];
};

private _item169 = objNull;
if (_layerRoot) then {
	_item169 = createVehicle ["vn_flag_camo02",[5615.32,15924.9,0],[],0,"CAN_COLLIDE"];
	_this = _item169;
	_objects pushback _this;
	_objectIDs pushback 169;
	_this setPosWorld [5615.32,15924.9,226.294];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item170 = objNull;
if (_layerRoot) then {
	_item170 = createVehicle ["vn_flag_vc",[5261.43,17547.6,0.000961304],[],0,"CAN_COLLIDE"];
	_this = _item170;
	_objects pushback _this;
	_objectIDs pushback 170;
	_this setPosWorld [5261.43,17547.6,149.282];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item171 = objNull;
if (_layerRoot) then {
	_item171 = createVehicle ["vn_flag_pl",[1458.26,19305,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item171;
	_objects pushback _this;
	_objectIDs pushback 171;
	_this setPosWorld [1458.26,19305,26.4748];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item172 = objNull;
if (_layerRoot) then {
	_item172 = createVehicle ["Land_vn_o_platform_06",[1464.73,19302.2,0],[],0,"CAN_COLLIDE"];
	_this = _item172;
	_objects pushback _this;
	_objectIDs pushback 172;
	_this setPosWorld [1464.73,19302.2,24.5959];
	_this setVectorDirAndUp [[0.635437,0.772153,0],[0,0,1]];
};

private _item173 = objNull;
if (_layerRoot) then {
	_item173 = createVehicle ["Land_vn_o_platform_06",[1452.81,19320.7,0],[],0,"CAN_COLLIDE"];
	_this = _item173;
	_objects pushback _this;
	_objectIDs pushback 173;
	_this setPosWorld [1452.81,19320.7,24.7115];
	_this setVectorDirAndUp [[-0.986581,0.163275,0],[0,0,1]];
};

private _item174 = objNull;
if (_layerRoot) then {
	_item174 = createVehicle ["Land_vn_o_platform_06",[1428.91,19312.4,0],[],0,"CAN_COLLIDE"];
	_this = _item174;
	_objects pushback _this;
	_objectIDs pushback 174;
	_this setPosWorld [1428.91,19312.4,26.8272];
	_this setVectorDirAndUp [[-0.189925,-0.981799,0],[0,0,1]];
};

private _item175 = objNull;
if (_layerRoot) then {
	_item175 = createVehicle ["Land_vn_o_shelter_02",[1453.9,19309.8,9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item175;
	_objects pushback _this;
	_objectIDs pushback 175;
	_this setPosWorld [1453.9,19309.8,23.8653];
	_this setVectorDirAndUp [[-0.805149,0.593073,0],[0,0,1]];
};

private _item176 = objNull;
if (_layerRoot) then {
	_item176 = createVehicle ["Campfire_burning_F",[1460.8,19307.1,0],[],0,"CAN_COLLIDE"];
	_this = _item176;
	_objects pushback _this;
	_objectIDs pushback 176;
	_this setPosWorld [1460.79,19307.1,22.5784];
	_this setVectorDirAndUp [[0,0.999758,-0.0219957],[-0.0179996,0.0219922,0.999596]];
};

private _item177 = objNull;
if (_layerRoot) then {
	_item177 = createVehicle ["Land_vn_o_snipertree_03",[1466.08,19289.1,0.00781822],[],0,"CAN_COLLIDE"];
	_this = _item177;
	_objects pushback _this;
	_objectIDs pushback 177;
	_this setPosWorld [1466.08,19289.1,39.931];
	_this setVectorDirAndUp [[-0.0726529,0.997357,0],[0,0,1]];
};

private _item178 = objNull;
if (_layerRoot) then {
	_item178 = createVehicle ["Land_vn_o_snipertree_04",[1440.72,19310.7,0.0425854],[],0,"CAN_COLLIDE"];
	_this = _item178;
	_objects pushback _this;
	_objectIDs pushback 178;
	_this setPosWorld [1440.72,19310.7,34.1055];
	_this setVectorDirAndUp [[0.963196,-0.268799,0],[0,0,1]];
};

private _item179 = objNull;
if (_layerRoot) then {
	_item179 = createVehicle ["Land_vn_o_snipertree_04",[1478.62,19310.7,0.0425873],[],0,"CAN_COLLIDE"];
	_this = _item179;
	_objects pushback _this;
	_objectIDs pushback 179;
	_this setPosWorld [1478.62,19310.7,33.5178];
	_this setVectorDirAndUp [[-0.9666,0.25629,0],[0,0,1]];
};

private _item180 = objNull;
if (_layerRoot) then {
	_item180 = createVehicle ["Land_vn_o_tower_02",[1457.8,19289.3,0],[],0,"CAN_COLLIDE"];
	_this = _item180;
	_objects pushback _this;
	_objectIDs pushback 180;
	_this setPosWorld [1457.8,19289.3,25.9537];
	_this setVectorDirAndUp [[-0.864565,0.502521,0],[0,0,1]];
};

private _item181 = objNull;
if (_layerRoot) then {
	_item181 = createVehicle ["Land_vn_o_tower_02",[1427.72,19304.2,0],[],0,"CAN_COLLIDE"];
	_this = _item181;
	_objects pushback _this;
	_objectIDs pushback 181;
	_this setPosWorld [1427.72,19304.2,28.3277];
	_this setVectorDirAndUp [[-0.664987,0.746855,0],[0,0,1]];
};

private _item182 = objNull;
if (_layerRoot) then {
	_item182 = createVehicle ["vn_b_aus_army_static_m101_02",[9212.46,16470.8,0],[],0,"CAN_COLLIDE"];
	_this = _item182;
	_objects pushback _this;
	_objectIDs pushback 182;
	_this setPosWorld [9212.37,16473.4,322.329];
	_this setVectorDirAndUp [[-0.888872,-0.458155,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item183 = objNull;
if (_layerRoot) then {
	_item183 = createVehicle ["vn_b_aus_army_static_m101_02",[9217.36,16482.4,0.0404968],[],0,"CAN_COLLIDE"];
	_this = _item183;
	_objects pushback _this;
	_objectIDs pushback 183;
	_this setPosWorld [9217.28,16485,322.424];
	_this setVectorDirAndUp [[-0.721423,0.692406,0.0110808],[0,-0.0160013,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item184 = objNull;
if (_layerRoot) then {
	_item184 = createVehicle ["vn_b_aus_army_static_m101_02",[9226.67,16473.8,0.0396423],[],0,"CAN_COLLIDE"];
	_this = _item184;
	_objects pushback _this;
	_objectIDs pushback 184;
	_this setPosWorld [9226.59,16476.4,322.458];
	_this setVectorDirAndUp [[0.990141,0.139951,0.00594102],[-0.00600007,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item185 = objNull;
if (_layerRoot) then {
	_item185 = createVehicle ["vn_flag_camo02",[9231.41,16545.9,0],[],0,"CAN_COLLIDE"];
	_this = _item185;
	_objects pushback _this;
	_objectIDs pushback 185;
	_this setPosWorld [9231.41,16545.9,329.355];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item186 = objNull;
if (_layerRoot) then {
	_item186 = createVehicle ["vn_o_pl_static_zpu4",[9202.2,16544.3,0],[],0,"CAN_COLLIDE"];
	_this = _item186;
	_objects pushback _this;
	_objectIDs pushback 186;
	_this setPosWorld [9202.2,16544.3,323.689];
	_this setVectorDirAndUp [[-0.555281,-0.831663,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item187 = objNull;
if (_layerRoot) then {
	_item187 = createVehicle ["vn_o_pl_static_mortar_type53",[9220.28,16549.2,0],[],0,"CAN_COLLIDE"];
	_this = _item187;
	_objects pushback _this;
	_objectIDs pushback 187;
	_this setPosWorld [9220.18,16549.1,325.742];
	_this setVectorDirAndUp [[0.879156,-0.472672,0.0605422],[-0.101475,-0.0615615,0.992931]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item188 = objNull;
if (_layerRoot) then {
	_item188 = createVehicle ["vn_o_kr_static_m1910_low_01",[9221.25,16540.4,-6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item188;
	_objects pushback _this;
	_objectIDs pushback 188;
	_this setPosWorld [9221.18,16540.3,325.243];
	_this setVectorDirAndUp [[-0.962875,-0.248632,-0.105136],[-0.103446,-0.0198902,0.994436]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item189 = objNull;
if (_layerRoot) then {
	_item189 = createVehicle ["vn_o_kr_static_m1910_low_01",[9262.49,16496.7,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item189;
	_objects pushback _this;
	_objectIDs pushback 189;
	_this setPosWorld [9262.48,16496.7,328.304];
	_this setVectorDirAndUp [[0.942118,-0.334641,0.0207225],[-0.0219903,0,0.999758]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item190 = objNull;
if (_layerRoot) then {
	_item190 = createVehicle ["vn_b_sf_static_m45",[9257.19,16496.2,0],[],0,"CAN_COLLIDE"];
	_this = _item190;
	_objects pushback _this;
	_objectIDs pushback 190;
	_this setPosWorld [9257.14,16496.2,329.379];
	_this setVectorDirAndUp [[0.419021,-0.907921,0.0100557],[-0.0239912,0,0.999712]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item191 = objNull;
if (_layerRoot) then {
	_item191 = createVehicle ["Land_vn_o_snipertree_03",[9256.11,16503.8,0],[],0,"CAN_COLLIDE"];
	_this = _item191;
	_objects pushback _this;
	_objectIDs pushback 191;
	_this setPosWorld [9256.11,16503.8,345.748];
	_this setVectorDirAndUp [[-0.818824,0.574044,0],[0,0,1]];
};

private _item192 = objNull;
if (_layerRoot) then {
	_item192 = createVehicle ["vn_o_kr_static_m1910_low_01",[9204.37,16464,0],[],0,"CAN_COLLIDE"];
	_this = _item192;
	_objects pushback _this;
	_objectIDs pushback 192;
	_this setPosWorld [9204.32,16464,322.751];
	_this setVectorDirAndUp [[-0.139053,0.990215,0.0117389],[-0.0579045,-0.019964,0.998123]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item193 = objNull;
if (_layerRoot) then {
	_item193 = createVehicle ["vn_flag_pavn",[8516.36,17940.5,0],[],0,"CAN_COLLIDE"];
	_this = _item193;
	_objects pushback _this;
	_objectIDs pushback 193;
	_this setPosWorld [8516.36,17940.5,290.927];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item194 = objNull;
if (_layerRoot) then {
	_item194 = createVehicle ["vn_b_navy_static_l60mk3",[8502.93,17901.6,0],[],0,"CAN_COLLIDE"];
	_this = _item194;
	_objects pushback _this;
	_objectIDs pushback 194;
	_this setPosWorld [8502.96,17901.6,288.771];
	_this setVectorDirAndUp [[0.602306,0.79812,-0.015237],[0.0199975,0.00399595,0.999792]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item195 = objNull;
if (_layerRoot) then {
	_item195 = createVehicle ["vn_b_navy_static_l60mk3",[8491.17,17875.9,0],[],0,"CAN_COLLIDE"];
	_this = _item195;
	_objects pushback _this;
	_objectIDs pushback 195;
	_this setPosWorld [8491.29,17876,289.497];
	_this setVectorDirAndUp [[0.379495,-0.925007,0.0185688],[0.0678421,0.047838,0.996548]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item196 = objNull;
if (_layerRoot) then {
	_item196 = createVehicle ["vn_b_navy_static_l60mk3",[8450.21,17935.6,0],[],0,"CAN_COLLIDE"];
	_this = _item196;
	_objects pushback _this;
	_objectIDs pushback 196;
	_this setPosWorld [8450.21,17935.6,288.846];
	_this setVectorDirAndUp [[-0.932502,0.361164,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item197 = objNull;
if (_layerRoot) then {
	_item197 = createVehicle ["vn_o_pl_static_d44_01",[8479.67,17902.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item197;
	_objects pushback _this;
	_objectIDs pushback 197;
	_this setPosWorld [8479.69,17902.5,287.111];
	_this setVectorDirAndUp [[0.987404,-0.15819,0.00316406],[0,0.0199977,0.9998]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item198 = objNull;
if (_layerRoot) then {
	_item198 = createVehicle ["vn_o_pl_static_d44_01",[8478.94,17919.5,0],[],0,"CAN_COLLIDE"];
	_this = _item198;
	_objects pushback _this;
	_objectIDs pushback 198;
	_this setPosWorld [8478.95,17919.5,287.052];
	_this setVectorDirAndUp [[0.591007,0.806665,-0.00159995],[0,0.00198341,0.999998]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item199 = objNull;
if (_layerRoot) then {
	_item199 = createVehicle ["vn_o_pl_static_d44_01",[8462.84,17915.2,0.000946045],[],0,"CAN_COLLIDE"];
	_this = _item199;
	_objects pushback _this;
	_objectIDs pushback 199;
	_this setPosWorld [8462.85,17915.2,287.1];
	_this setVectorDirAndUp [[-0.96705,0.254156,0.014771],[0.0199975,0.0179927,0.999638]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item200 = objNull;
if (_layerRoot) then {
	_item200 = createVehicle ["vn_b_sf_static_m45",[8466.38,17904.7,-0.000762939],[],0,"CAN_COLLIDE"];
	_this = _item200;
	_objects pushback _this;
	_objectIDs pushback 200;
	_this setPosWorld [8466.39,17904.7,289.104];
	_this setVectorDirAndUp [[-0.787489,-0.616322,0.00278438],[0.00198347,0.0019834,0.999996]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item201 = objNull;
if (_layerRoot) then {
	_item201 = createVehicle ["vn_b_sf_static_m45",[8499.31,17913.7,-6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item201;
	_objects pushback _this;
	_objectIDs pushback 201;
	_this setPosWorld [8499.31,17913.7,288.897];
	_this setVectorDirAndUp [[0.692831,0.7211,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item202 = objNull;
if (_layerRoot) then {
	_item202 = createVehicle ["Campfire_burning_F",[8472.89,17910.3,0],[],0,"CAN_COLLIDE"];
	_this = _item202;
	_objects pushback _this;
	_objectIDs pushback 202;
	_this setPosWorld [8472.89,17910.3,287.28];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item203 = objNull;
if (_layerRoot) then {
	_item203 = createVehicle ["Campfire_burning_F",[8518.66,17940.6,0],[],0,"CAN_COLLIDE"];
	_this = _item203;
	_objects pushback _this;
	_objectIDs pushback 203;
	_this setPosWorld [8518.66,17940.6,287.17];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item204 = objNull;
if (_layerRoot) then {
	_item204 = createVehicle ["Land_vn_o_shelter_02",[8503.35,17937.7,0],[],0,"CAN_COLLIDE"];
	_this = _item204;
	_objects pushback _this;
	_objectIDs pushback 204;
	_this setPosWorld [8503.35,17937.7,288.214];
	_this setVectorDirAndUp [[-0.808366,0.58868,0],[0,0,1]];
};

private _item205 = objNull;
if (_layerRoot) then {
	_item205 = createVehicle ["Land_vn_o_shelter_02",[8522.88,17917.3,0],[],0,"CAN_COLLIDE"];
	_this = _item205;
	_objects pushback _this;
	_objectIDs pushback 205;
	_this setPosWorld [8522.88,17917.3,288.069];
	_this setVectorDirAndUp [[0.671888,-0.740653,0],[0,0,1]];
};

private _item206 = objNull;
if (_layerRoot) then {
	_item206 = createVehicle ["Land_vn_o_tower_02",[8509.73,17946.3,0],[],0,"CAN_COLLIDE"];
	_this = _item206;
	_objects pushback _this;
	_objectIDs pushback 206;
	_this setPosWorld [8509.73,17946.3,290.581];
	_this setVectorDirAndUp [[0.965681,0.25973,0],[0,0,1]];
};

private _item207 = objNull;
if (_layerRoot) then {
	_item207 = createVehicle ["Land_vn_o_tower_02",[8490.46,17894.8,0],[],0,"CAN_COLLIDE"];
	_this = _item207;
	_objects pushback _this;
	_objectIDs pushback 207;
	_this setPosWorld [8490.46,17894.8,290.785];
	_this setVectorDirAndUp [[-0.987593,-0.157038,0],[0,0,1]];
};

private _item208 = objNull;
if (_layerRoot) then {
	_item208 = createVehicle ["Land_vn_o_tower_02",[8462.61,17936.6,0],[],0,"CAN_COLLIDE"];
	_this = _item208;
	_objects pushback _this;
	_objectIDs pushback 208;
	_this setPosWorld [8462.61,17936.6,290.629];
	_this setVectorDirAndUp [[-0.267202,0.963641,0],[0,0,1]];
};

private _item209 = objNull;
if (_layerRoot) then {
	_item209 = createVehicle ["Land_vn_o_shelter_02",[8471.02,17892.3,0],[],0,"CAN_COLLIDE"];
	_this = _item209;
	_objects pushback _this;
	_objectIDs pushback 209;
	_this setPosWorld [8471.02,17892.3,288.83];
	_this setVectorDirAndUp [[-0.543535,-0.839387,0],[0,0,1]];
};

private _item210 = objNull;
if (_layerRoot) then {
	_item210 = createVehicle ["Land_vn_o_shelter_02",[8475.14,17933.7,0],[],0,"CAN_COLLIDE"];
	_this = _item210;
	_objects pushback _this;
	_objectIDs pushback 210;
	_this setPosWorld [8475.14,17933.7,288.214];
	_this setVectorDirAndUp [[0.478297,0.878198,0],[0,0,1]];
};

private _item211 = objNull;
if (_layerRoot) then {
	_item211 = createVehicle ["vn_flag_pl",[7790.73,13517.9,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item211;
	_objects pushback _this;
	_objectIDs pushback 211;
	_this setPosWorld [7790.73,13517.9,155.368];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item212 = objNull;
if (_layerRoot) then {
	_item212 = createVehicle ["Campfire_burning_F",[7796.7,13512.4,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item212;
	_objects pushback _this;
	_objectIDs pushback 212;
	_this setPosWorld [7796.69,13512.5,152.459];
	_this setVectorDirAndUp [[0,0.987441,-0.157991],[-0.0319849,0.15791,0.986935]];
};

private _item213 = objNull;
if (_layerRoot) then {
	_item213 = createVehicle ["Campfire_burning_F",[7779.59,13518.5,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item213;
	_objects pushback _this;
	_objectIDs pushback 213;
	_this setPosWorld [7779.6,13518.6,151.943];
	_this setVectorDirAndUp [[0,0.996815,-0.0797439],[0.023991,0.079721,0.996528]];
};

private _item214 = objNull;
if (_layerRoot) then {
	_item214 = createVehicle ["Land_vn_o_tower_02",[7783.55,13537.8,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item214;
	_objects pushback _this;
	_objectIDs pushback 214;
	_this setPosWorld [7783.55,13537.8,153.829];
	_this setVectorDirAndUp [[0.937303,0.348516,0],[0,0,1]];
};

private _item215 = objNull;
if (_layerRoot) then {
	_item215 = createVehicle ["Land_vn_o_tower_02",[7787.81,13507.4,0],[],0,"CAN_COLLIDE"];
	_this = _item215;
	_objects pushback _this;
	_objectIDs pushback 215;
	_this setPosWorld [7787.81,13507.4,156.193];
	_this setVectorDirAndUp [[-0.944884,0.327404,0],[0,0,1]];
};

private _item216 = objNull;
if (_layerRoot) then {
	_item216 = createVehicle ["Land_vn_o_snipertree_04",[7802.5,13568.1,0.0425568],[],0,"CAN_COLLIDE"];
	_this = _item216;
	_objects pushback _this;
	_objectIDs pushback 216;
	_this setPosWorld [7802.5,13568.1,161.671];
	_this setVectorDirAndUp [[-0.0624972,-0.998045,0],[0,0,1]];
};

private _item217 = objNull;
if (_layerRoot) then {
	_item217 = createVehicle ["Land_vn_o_snipertree_04",[7810.09,13493.5,-1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item217;
	_objects pushback _this;
	_objectIDs pushback 217;
	_this setPosWorld [7810.09,13493.5,166.813];
	_this setVectorDirAndUp [[0.293947,0.955822,0],[0,0,1]];
};

private _item218 = objNull;
if (_layerRoot) then {
	_item218 = createVehicle ["vn_b_aus_army_static_m101_02",[8621.69,10385.1,0.000335693],[],0,"CAN_COLLIDE"];
	_this = _item218;
	_objects pushback _this;
	_objectIDs pushback 218;
	_this setPosWorld [8621.61,10387.6,32.3354];
	_this setVectorDirAndUp [[0.830175,0.557493,0.00331803],[-0.00399675,0,0.999992]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item219 = objNull;
if (_layerRoot) then {
	_item219 = createVehicle ["vn_b_aus_army_static_m101_02",[8601.97,10383.7,0],[],0,"CAN_COLLIDE"];
	_this = _item219;
	_objects pushback _this;
	_objectIDs pushback 219;
	_this setPosWorld [8601.88,10386.3,32.3286];
	_this setVectorDirAndUp [[-0.531077,0.847324,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item220 = objNull;
if (_layerRoot) then {
	_item220 = createVehicle ["vn_b_aus_army_static_m101_02",[8611.11,10366.2,0.0531845],[],0,"CAN_COLLIDE"];
	_this = _item220;
	_objects pushback _this;
	_objectIDs pushback 220;
	_this setPosWorld [8611.02,10368.8,32.3697];
	_this setVectorDirAndUp [[0.00114826,-0.999758,0.0219521],[0.0379722,0.0219799,0.999037]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item221 = objNull;
if (_layerRoot) then {
	_item221 = createVehicle ["vn_b_sf_static_m45",[8611.38,10381.4,0],[],0,"CAN_COLLIDE"];
	_this = _item221;
	_objects pushback _this;
	_objectIDs pushback 221;
	_this setPosWorld [8611.38,10381.4,34.2668];
	_this setVectorDirAndUp [[-0.202573,0.979267,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item222 = objNull;
if (_layerRoot) then {
	_item222 = createVehicle ["vn_o_kr_static_m1910_low_01",[8630.6,10379.3,-0.00109482],[],0,"CAN_COLLIDE"];
	_this = _item222;
	_objects pushback _this;
	_objectIDs pushback 222;
	_this setPosWorld [8630.65,10379.3,33.0468];
	_this setVectorDirAndUp [[0.459887,-0.88605,-0.0584785],[0,-0.0658558,0.997829]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item223 = objNull;
if (_layerRoot) then {
	_item223 = createVehicle ["vn_flag_camo02",[8626.24,10427.8,0],[],0,"CAN_COLLIDE"];
	_this = _item223;
	_objects pushback _this;
	_objectIDs pushback 223;
	_this setPosWorld [8626.24,10427.8,28.9647];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item224 = objNull;
if (_layerRoot) then {
	_item224 = createVehicle ["Campfire_burning_F",[8632,10423,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item224;
	_objects pushback _this;
	_objectIDs pushback 224;
	_this setPosWorld [8631.99,10422.9,24.6072];
	_this setVectorDirAndUp [[0,0.999422,0.0339803],[-0.0339807,-0.0339607,0.998845]];
};

private _item225 = objNull;
if (_layerRoot) then {
	_item225 = createVehicle ["Campfire_burning_F",[8615.83,10378.1,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item225;
	_objects pushback _this;
	_objectIDs pushback 225;
	_this setPosWorld [8615.83,10378.1,32.5494];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item226 = objNull;
if (_layerRoot) then {
	_item226 = createVehicle ["vn_o_pl_static_zpu4",[8700.06,10426,-0.00056076],[],0,"CAN_COLLIDE"];
	_this = _item226;
	_objects pushback _this;
	_objectIDs pushback 226;
	_this setPosWorld [8700.06,10426,39.122];
	_this setVectorDirAndUp [[0.981856,-0.189606,0.00303365],[0,0.0159977,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item228 = objNull;
if (_layerRoot) then {
	_item228 = createVehicle ["vn_o_kr_static_dshkm_high_02",[8630.25,10428.4,-0.0181904],[],0,"CAN_COLLIDE"];
	_this = _item228;
	_objects pushback _this;
	_objectIDs pushback 228;
	_this setPosWorld [8630.25,10428.3,26.2605];
	_this setVectorDirAndUp [[-0.497133,-0.866682,0.041484],[0.15799,-0.0434056,0.986486]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item229 = objNull;
if (_layerRoot) then {
	_item229 = createVehicle ["vn_o_pl_static_d44_01",[6768.64,4547.76,0],[],0,"CAN_COLLIDE"];
	_this = _item229;
	_objects pushback _this;
	_objectIDs pushback 229;
	_this setPosWorld [6768.65,4547.79,3.95061];
	_this setVectorDirAndUp [[0.662967,0.748648,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item230 = objNull;
if (_layerRoot) then {
	_item230 = createVehicle ["vn_o_pl_static_d44_01",[6769.75,4535.11,0],[],0,"CAN_COLLIDE"];
	_this = _item230;
	_objects pushback _this;
	_objectIDs pushback 230;
	_this setPosWorld [6769.77,4535.15,3.95061];
	_this setVectorDirAndUp [[0.760144,0.649755,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item231 = objNull;
if (_layerRoot) then {
	_item231 = createVehicle ["vn_o_pl_static_d44_01",[6778.51,4519.77,0],[],0,"CAN_COLLIDE"];
	_this = _item231;
	_objects pushback _this;
	_objectIDs pushback 231;
	_this setPosWorld [6778.53,4519.81,4.14061];
	_this setVectorDirAndUp [[0.810795,0.58533,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item233 = objNull;
if (_layerRoot) then {
	_item233 = createVehicle ["vn_b_navy_static_l60mk3",[6764.79,4582.44,-0.0274148],[],0,"CAN_COLLIDE"];
	_this = _item233;
	_objects pushback _this;
	_objectIDs pushback 233;
	_this setPosWorld [6764.82,4582.47,5.66265];
	_this setVectorDirAndUp [[-0.792391,0.610007,0.00291958],[0.0159975,0.0159956,0.999744]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item234 = objNull;
if (_layerRoot) then {
	_item234 = createVehicle ["vn_b_navy_static_l60mk3",[6795.66,4508.95,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item234;
	_objects pushback _this;
	_objectIDs pushback 234;
	_this setPosWorld [6795.66,4508.95,5.72614];
	_this setVectorDirAndUp [[0.99999,0.0043661,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item235 = objNull;
if (_layerRoot) then {
	_item235 = createVehicle ["vn_flag_pavn",[6780.57,4531.68,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item235;
	_objects pushback _this;
	_objectIDs pushback 235;
	_this setPosWorld [6780.57,4531.68,7.9268];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item236 = objNull;
if (_layerRoot) then {
	_item236 = createVehicle ["vn_o_pl_static_zpu4",[6762.58,4516.29,0],[],0,"CAN_COLLIDE"];
	_this = _item236;
	_objects pushback _this;
	_objectIDs pushback 236;
	_this setPosWorld [6762.51,4516.29,5.6658];
	_this setVectorDirAndUp [[-0.0225685,-0.999745,-0.000857564],[-0.0379709,0,0.999279]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item237 = objNull;
if (_layerRoot) then {
	_item237 = createVehicle ["vn_o_kr_static_dshkm_high_02",[6787.41,4531.53,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item237;
	_objects pushback _this;
	_objectIDs pushback 237;
	_this setPosWorld [6787.41,4531.53,5.6909];
	_this setVectorDirAndUp [[0.259183,0.965828,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item238 = objNull;
if (_layerRoot) then {
	_item238 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6759.47,4530.24,1.18876],[],0,"CAN_COLLIDE"];
	_this = _item238;
	_objects pushback _this;
	_objectIDs pushback 238;
	_this setPosWorld [6759.47,4530.24,4.80855];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item239 = objNull;
if (_layerRoot) then {
	_item239 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6759.54,4537.99,1.18876],[],0,"CAN_COLLIDE"];
	_this = _item239;
	_objects pushback _this;
	_objectIDs pushback 239;
	_this setPosWorld [6759.54,4537.99,4.80855];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item240 = objNull;
if (_layerRoot) then {
	_item240 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6759.54,4545.4,1.18876],[],0,"CAN_COLLIDE"];
	_this = _item240;
	_objects pushback _this;
	_objectIDs pushback 240;
	_this setPosWorld [6759.54,4545.4,4.80855];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item241 = objNull;
if (_layerRoot) then {
	_item241 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6759.6,4552.79,1.18876],[],0,"CAN_COLLIDE"];
	_this = _item241;
	_objects pushback _this;
	_objectIDs pushback 241;
	_this setPosWorld [6759.6,4552.79,4.80855];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item242 = objNull;
if (_layerRoot) then {
	_item242 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6774.48,4585.11,0],[],0,"CAN_COLLIDE"];
	_this = _item242;
	_objects pushback _this;
	_objectIDs pushback 242;
	_this setPosWorld [6774.48,4585.11,3.4869];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item243 = objNull;
if (_layerRoot) then {
	_item243 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6770.5,4580.23,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item243;
	_objects pushback _this;
	_objectIDs pushback 243;
	_this setPosWorld [6770.5,4580.23,3.58522];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item244 = objNull;
if (_layerRoot) then {
	_item244 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6807.21,4509.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item244;
	_objects pushback _this;
	_objectIDs pushback 244;
	_this setPosWorld [6807.21,4509.1,3.61978];
	_this setVectorDirAndUp [[-0.999997,0.00260688,0],[0,0,1]];
};

private _item245 = objNull;
if (_layerRoot) then {
	_item245 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6763.95,4506.79,1.62216],[],0,"CAN_COLLIDE"];
	_this = _item245;
	_objects pushback _this;
	_objectIDs pushback 245;
	_this setPosWorld [6763.95,4506.79,5.27003];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item246 = objNull;
if (_layerRoot) then {
	_item246 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6772.38,4506.96,1.62215],[],0,"CAN_COLLIDE"];
	_this = _item246;
	_objects pushback _this;
	_objectIDs pushback 246;
	_this setPosWorld [6772.38,4506.96,5.31652];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item247 = objNull;
if (_layerRoot) then {
	_item247 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6779.82,4507.01,1.62215],[],0,"CAN_COLLIDE"];
	_this = _item247;
	_objects pushback _this;
	_objectIDs pushback 247;
	_this setPosWorld [6779.82,4507.01,5.31822];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item248 = objNull;
if (_layerRoot) then {
	_item248 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6794.9,4505.69,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item248;
	_objects pushback _this;
	_objectIDs pushback 248;
	_this setPosWorld [6794.9,4505.69,3.61978];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item249 = objNull;
if (_layerRoot) then {
	_item249 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6768.99,4526.55,1.32448],[],0,"CAN_COLLIDE"];
	_this = _item249;
	_objects pushback _this;
	_objectIDs pushback 249;
	_this setPosWorld [6768.99,4526.55,4.94426];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item250 = objNull;
if (_layerRoot) then {
	_item250 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6767.71,4520.08,1.32448],[],0,"CAN_COLLIDE"];
	_this = _item250;
	_objects pushback _this;
	_objectIDs pushback 250;
	_this setPosWorld [6767.71,4520.08,5.13129];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item251 = objNull;
if (_layerRoot) then {
	_item251 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6766.35,4587.69,0],[],0,"CAN_COLLIDE"];
	_this = _item251;
	_objects pushback _this;
	_objectIDs pushback 251;
	_this setPosWorld [6766.35,4587.69,3.35887];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item252 = objNull;
if (_layerRoot) then {
	_item252 = createVehicle ["Land_vn_b_trench_revetment_05_01",[6763.73,4573.96,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item252;
	_objects pushback _this;
	_objectIDs pushback 252;
	_this setPosWorld [6763.73,4573.96,3.61978];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item253 = objNull;
if (_layerRoot) then {
	_item253 = createVehicle ["vn_b_aus_army_static_m101_02",[6921.51,5390.53,0],[],0,"CAN_COLLIDE"];
	_this = _item253;
	_objects pushback _this;
	_objectIDs pushback 253;
	_this setPosWorld [6921.43,5393.09,73.7386];
	_this setVectorDirAndUp [[0.999138,0.0415061,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item254 = objNull;
if (_layerRoot) then {
	_item254 = createVehicle ["vn_b_aus_army_static_m101_02",[6940.37,5412.54,0],[],0,"CAN_COLLIDE"];
	_this = _item254;
	_objects pushback _this;
	_objectIDs pushback 254;
	_this setPosWorld [6940.29,5415.1,73.7386];
	_this setVectorDirAndUp [[-0.368705,0.929546,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item255 = objNull;
if (_layerRoot) then {
	_item255 = createVehicle ["vn_b_aus_army_static_m101_02",[6947.49,5399.24,0],[],0,"CAN_COLLIDE"];
	_this = _item255;
	_objects pushback _this;
	_objectIDs pushback 255;
	_this setPosWorld [6947.41,5401.8,73.7386];
	_this setVectorDirAndUp [[-0.930312,-0.366769,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item256 = objNull;
if (_layerRoot) then {
	_item256 = createVehicle ["vn_flag_camo02",[6924.02,5405.98,0],[],0,"CAN_COLLIDE"];
	_this = _item256;
	_objects pushback _this;
	_objectIDs pushback 256;
	_this setPosWorld [6924.02,5405.98,77.7168];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item257 = objNull;
if (_layerRoot) then {
	_item257 = createVehicle ["vn_b_sf_static_m45",[6926.15,5402.39,0],[],0,"CAN_COLLIDE"];
	_this = _item257;
	_objects pushback _this;
	_objectIDs pushback 257;
	_this setPosWorld [6926.15,5402.39,75.6768];
	_this setVectorDirAndUp [[-0.17818,-0.983998,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item258 = objNull;
if (_layerRoot) then {
	_item258 = createVehicle ["vn_o_nva_navy_static_v11m",[6950.02,5411.37,0.0644226],[],0,"CAN_COLLIDE"];
	_this = _item258;
	_objects pushback _this;
	_objectIDs pushback 258;
	_this setPosWorld [6950.02,5411.37,75.6525];
	_this setVectorDirAndUp [[0.411931,0.911214,0.00115428],[0.00109178,-0.00176031,0.999998]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item259 = objNull;
if (_layerRoot) then {
	_item259 = createVehicle ["vn_o_kr_static_zgu1_01",[6929.07,5380.85,0],[],0,"CAN_COLLIDE"];
	_this = _item259;
	_objects pushback _this;
	_objectIDs pushback 259;
	_this setPosWorld [6929.05,5380.84,75.2239];
	_this setVectorDirAndUp [[-0.867717,0.497045,-0.00370543],[-0.00999474,-0.00999414,0.9999]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item260 = objNull;
if (_layerRoot) then {
	_item260 = createVehicle ["vn_o_kr_static_zgu1_01",[6898.76,5410.59,0],[],0,"CAN_COLLIDE"];
	_this = _item260;
	_objects pushback _this;
	_objectIDs pushback 260;
	_this setPosWorld [6898.78,5410.54,75.2577];
	_this setVectorDirAndUp [[0.944801,-0.326917,-0.02181],[0.0120049,-0.0319807,0.999416]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item261 = objNull;
if (_layerRoot) then {
	_item261 = createVehicle ["vn_o_kr_static_m1910_low_01",[6959.71,5413.63,-0.00223541],[],0,"CAN_COLLIDE"];
	_this = _item261;
	_objects pushback _this;
	_objectIDs pushback 261;
	_this setPosWorld [6959.72,5413.63,74.4215];
	_this setVectorDirAndUp [[-0.86551,0.500756,0.0116556],[0.00999464,-0.00599953,0.999932]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item262 = objNull;
if (_layerRoot) then {
	_item262 = createVehicle ["vn_o_kr_static_m1910_low_01",[6952.71,5424.17,0],[],0,"CAN_COLLIDE"];
	_this = _item262;
	_objects pushback _this;
	_objectIDs pushback 262;
	_this setPosWorld [6952.71,5424.17,74.4792];
	_this setVectorDirAndUp [[0.205526,-0.978652,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item263 = objNull;
if (_layerRoot) then {
	_item263 = createVehicle ["vn_o_kr_static_zgu1_01",[6921.62,5428.39,0],[],0,"CAN_COLLIDE"];
	_this = _item263;
	_objects pushback _this;
	_objectIDs pushback 263;
	_this setPosWorld [6921.62,5428.39,75.2248];
	_this setVectorDirAndUp [[0.275625,-0.961265,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item265 = objNull;
if (_layerRoot) then {
	_item265 = createVehicle ["Campfire_burning_F",[8149.44,5389.99,-0.000256062],[],0,"CAN_COLLIDE"];
	_this = _item265;
	_objects pushback _this;
	_objectIDs pushback 265;
	_this setPosWorld [8149.43,5389.99,6.18962];
	_this setVectorDirAndUp [[0,1,0],[-0.0339789,0,0.999423]];
};

private _item266 = objNull;
if (_layerRoot) then {
	_item266 = createVehicle ["vn_flag_vc",[8147.31,5391.84,0.000961304],[],0,"CAN_COLLIDE"];
	_this = _item266;
	_objects pushback _this;
	_objectIDs pushback 266;
	_this setPosWorld [8147.31,5391.84,9.84673];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item267 = objNull;
if (_layerRoot) then {
	_item267 = createVehicle ["Land_vn_o_snipertree_02",[7595.97,6110.46,0.358803],[],0,"CAN_COLLIDE"];
	_this = _item267;
	_objects pushback _this;
	_objectIDs pushback 267;
	_this setPosWorld [7595.97,6110.46,20.4402];
	_this setVectorDirAndUp [[0.0102465,-0.999947,0],[0,0,1]];
};

private _item268 = objNull;
if (_layerRoot) then {
	_item268 = createVehicle ["Land_vn_o_snipertree_03",[7667.23,6115.67,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item268;
	_objects pushback _this;
	_objectIDs pushback 268;
	_this setPosWorld [7667.23,6115.67,23.6624];
	_this setVectorDirAndUp [[-0.446568,0.89475,0],[0,0,1]];
};

private _item269 = objNull;
if (_layerRoot) then {
	_item269 = createVehicle ["vn_o_pl_static_zpu4",[7617.34,6075.23,0],[],0,"CAN_COLLIDE"];
	_this = _item269;
	_objects pushback _this;
	_objectIDs pushback 269;
	_this setPosWorld [7617.26,6075.15,5.20867];
	_this setVectorDirAndUp [[0.296614,0.953412,0.055014],[-0.0439577,-0.0439152,0.998068]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item272 = objNull;
if (_layerRoot) then {
	_item272 = createVehicle ["vn_b_sf_static_m45",[7667.2,6087.74,-0.000468254],[],0,"CAN_COLLIDE"];
	_this = _item272;
	_objects pushback _this;
	_objectIDs pushback 272;
	_this setPosWorld [7667.2,6087.74,5.41638];
	_this setVectorDirAndUp [[0.952557,0.304361,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item273 = objNull;
if (_layerRoot) then {
	_item273 = createVehicle ["Land_vn_o_tower_02",[7629.25,6129.24,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item273;
	_objects pushback _this;
	_objectIDs pushback 273;
	_this setPosWorld [7629.25,6129.24,7.5591];
	_this setVectorDirAndUp [[0.983605,-0.180334,0],[0,0,1]];
};

private _item274 = objNull;
if (_layerRoot) then {
	_item274 = createVehicle ["Land_vn_o_tower_02",[7677.62,6102.93,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item274;
	_objects pushback _this;
	_objectIDs pushback 274;
	_this setPosWorld [7677.62,6102.93,7.91399];
	_this setVectorDirAndUp [[0.979614,-0.200888,0],[0,0,1]];
};

private _item275 = objNull;
if (_layerRoot) then {
	_item275 = createVehicle ["Land_vn_o_tower_02",[7640.63,6066.34,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item275;
	_objects pushback _this;
	_objectIDs pushback 275;
	_this setPosWorld [7640.63,6066.34,7.1112];
	_this setVectorDirAndUp [[-0.999695,-0.0247129,0],[0,0,1]];
};

private _item276 = objNull;
if (_layerRoot) then {
	_item276 = createVehicle ["Land_vn_o_tower_02",[7594.76,6064.42,0],[],0,"CAN_COLLIDE"];
	_this = _item276;
	_objects pushback _this;
	_objectIDs pushback 276;
	_this setPosWorld [7594.76,6064.42,7.14918];
	_this setVectorDirAndUp [[-0.316353,0.948641,0],[0,0,1]];
};

private _item277 = objNull;
if (_layerRoot) then {
	_item277 = createVehicle ["Land_vn_o_platform_06",[7578.86,6120.33,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item277;
	_objects pushback _this;
	_objectIDs pushback 277;
	_this setPosWorld [7578.86,6120.33,16.684];
	_this setVectorDirAndUp [[-0.915894,0.401419,0],[0,0,1]];
};

private _item278 = objNull;
if (_layerRoot) then {
	_item278 = createVehicle ["Land_vn_o_platform_06",[7541.95,6087.17,0],[],0,"CAN_COLLIDE"];
	_this = _item278;
	_objects pushback _this;
	_objectIDs pushback 278;
	_this setPosWorld [7541.95,6087.17,19.5146];
	_this setVectorDirAndUp [[-0.152131,-0.98836,0],[0,0,1]];
};

private _item279 = objNull;
if (_layerRoot) then {
	_item279 = createVehicle ["Land_vn_o_platform_06",[7636.75,6034.58,0],[],0,"CAN_COLLIDE"];
	_this = _item279;
	_objects pushback _this;
	_objectIDs pushback 279;
	_this setPosWorld [7636.75,6034.58,9.25015];
	_this setVectorDirAndUp [[0.98073,0.195367,0],[0,0,1]];
};

private _item280 = objNull;
if (_layerRoot) then {
	_item280 = createVehicle ["vn_flag_camo02",[2217.92,4035.46,0],[],0,"CAN_COLLIDE"];
	_this = _item280;
	_objects pushback _this;
	_objectIDs pushback 280;
	_this setPosWorld [2217.92,4035.46,33.1372];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item281 = objNull;
if (_layerRoot) then {
	_item281 = createVehicle ["vn_b_sf_static_m45",[2236.39,4029.68,-1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item281;
	_objects pushback _this;
	_objectIDs pushback 281;
	_this setPosWorld [2236.37,4029.69,31.3647];
	_this setVectorDirAndUp [[-0.481446,-0.876473,-0.00227234],[-0.011995,0.00399646,0.99992]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item282 = objNull;
if (_layerRoot) then {
	_item282 = createVehicle ["vn_b_sf_static_m45",[2212.7,4034.74,-3.62396e-005],[],0,"CAN_COLLIDE"];
	_this = _item282;
	_objects pushback _this;
	_objectIDs pushback 282;
	_this setPosWorld [2212.69,4034.76,31.0606];
	_this setVectorDirAndUp [[0.388662,0.921332,-0.00950326],[-0.00399675,0.0119999,0.99992]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item284 = objNull;
if (_layerRoot) then {
	_item284 = createVehicle ["vn_b_aus_army_static_m101_02",[2193.79,4023.15,-0.00495529],[],0,"CAN_COLLIDE"];
	_this = _item284;
	_objects pushback _this;
	_objectIDs pushback 284;
	_this setPosWorld [2193.71,4025.71,29.0735];
	_this setVectorDirAndUp [[0.923916,0.382592,0.00171984],[-0.00600007,0.00999456,0.999932]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item285 = objNull;
if (_layerRoot) then {
	_item285 = createVehicle ["vn_b_aus_army_static_m101_02",[2226.74,4020.58,-0.0148773],[],0,"CAN_COLLIDE"];
	_this = _item285;
	_objects pushback _this;
	_objectIDs pushback 285;
	_this setPosWorld [2226.65,4023.14,29.3822];
	_this setVectorDirAndUp [[-0.964052,-0.265563,-0.00891087],[-0.011995,0.00999402,0.999878]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item286 = objNull;
if (_layerRoot) then {
	_item286 = createVehicle ["vn_b_aus_army_static_m101_02",[2219.98,4012.55,0],[],0,"CAN_COLLIDE"];
	_this = _item286;
	_objects pushback _this;
	_objectIDs pushback 286;
	_this setPosWorld [2219.9,4015.11,29.4316];
	_this setVectorDirAndUp [[-0.174675,0.984483,-0.0167997],[-0.00600007,0.0159974,0.999854]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item287 = objNull;
if (_layerRoot) then {
	_item287 = createVehicle ["vn_b_navy_static_l60mk3",[2195.99,4040.77,0],[],0,"CAN_COLLIDE"];
	_this = _item287;
	_objects pushback _this;
	_objectIDs pushback 287;
	_this setPosWorld [2195.98,4040.8,30.6618];
	_this setVectorDirAndUp [[0.969594,0.244662,0.00529496],[-0.0100007,0.0179954,0.999788]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item288 = objNull;
if (_layerRoot) then {
	_item288 = createVehicle ["vn_flag_camo02",[10198,7030.53,0],[],0,"CAN_COLLIDE"];
	_this = _item288;
	_objects pushback _this;
	_objectIDs pushback 288;
	_this setPosWorld [10198,7030.53,29.0163];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item289 = objNull;
if (_layerRoot) then {
	_item289 = createVehicle ["vn_o_kr_static_zgu1_01",[10222.8,7013.89,0],[],0,"CAN_COLLIDE"];
	_this = _item289;
	_objects pushback _this;
	_objectIDs pushback 289;
	_this setPosWorld [10222.8,7013.79,26.1321];
	_this setVectorDirAndUp [[0.632352,-0.771045,-0.0749704],[0.0379722,-0.0658092,0.997109]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item290 = objNull;
if (_layerRoot) then {
	_item290 = createVehicle ["vn_o_kr_static_zgu1_01",[10180.6,7043.55,0],[],0,"CAN_COLLIDE"];
	_this = _item290;
	_objects pushback _this;
	_objectIDs pushback 290;
	_this setPosWorld [10180.5,7043.75,25.1066];
	_this setVectorDirAndUp [[-0.572517,0.806787,-0.146013],[-0.0598926,0.136459,0.988834]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item291 = objNull;
if (_layerRoot) then {
	_item291 = createVehicle ["vn_o_pl_static_mortar_type53",[10173.6,7028.2,-0.000146866],[],0,"CAN_COLLIDE"];
	_this = _item291;
	_objects pushback _this;
	_objectIDs pushback 291;
	_this setPosWorld [10173.6,7028.2,25.9798];
	_this setVectorDirAndUp [[-0.773278,-0.63405,-0.00463981],[-0.00600007,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item292 = objNull;
if (_layerRoot) then {
	_item292 = createVehicle ["vn_o_pl_static_mortar_type53",[10203,7054.41,-0.000226974],[],0,"CAN_COLLIDE"];
	_this = _item292;
	_objects pushback _this;
	_objectIDs pushback 292;
	_this setPosWorld [10203,7054.41,26.2555];
	_this setVectorDirAndUp [[0.980752,0.191669,-0.0372668],[0.0379708,0,0.999279]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item293 = objNull;
if (_layerRoot) then {
	_item293 = createVehicle ["vn_b_sf_static_m45",[10190.5,7038.65,-0.00234413],[],0,"CAN_COLLIDE"];
	_this = _item293;
	_objects pushback _this;
	_objectIDs pushback 293;
	_this setPosWorld [10190.5,7038.66,26.8132];
	_this setVectorDirAndUp [[-0.751527,-0.659582,-0.012575],[-0.021993,0.00599862,0.99974]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item294 = objNull;
if (_layerRoot) then {
	_item294 = createVehicle ["vn_b_aus_army_static_m101_02",[10206,7018.77,0],[],0,"CAN_COLLIDE"];
	_this = _item294;
	_objects pushback _this;
	_objectIDs pushback 294;
	_this setPosWorld [10205.9,7021.34,25.0512];
	_this setVectorDirAndUp [[0.459986,-0.887519,-0.0268893],[0.0160013,-0.0219927,0.99963]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item295 = objNull;
if (_layerRoot) then {
	_item295 = createVehicle ["vn_b_aus_army_static_m101_02",[10170,7016.68,-0.0251236],[],0,"CAN_COLLIDE"];
	_this = _item295;
	_objects pushback _this;
	_objectIDs pushback 295;
	_this setPosWorld [10169.9,7019.25,25.028];
	_this setVectorDirAndUp [[0.190594,0.981651,-0.00589009],[0,0.00600007,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item296 = objNull;
if (_layerRoot) then {
	_item296 = createVehicle ["vn_b_aus_army_static_m101_02",[10211.2,7049.38,-0.0247917],[],0,"CAN_COLLIDE"];
	_this = _item296;
	_objects pushback _this;
	_objectIDs pushback 296;
	_this setPosWorld [10211.1,7051.94,25.1057];
	_this setVectorDirAndUp [[-0.965107,0.261853,0.0015711],[0,-0.00599983,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item297 = objNull;
if (_layerRoot) then {
	_item297 = createVehicle ["vn_b_sf_static_m45",[10207.3,7070.16,0],[],0,"CAN_COLLIDE"];
	_this = _item297;
	_objects pushback _this;
	_objectIDs pushback 297;
	_this setPosWorld [10207.3,7070.22,27.123];
	_this setVectorDirAndUp [[-0.480436,-0.876308,0.0355635],[0.0119996,0.0339782,0.999351]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item298 = objNull;
if (_layerRoot) then {
	_item298 = createVehicle ["Land_vn_o_tower_02",[10218,7034.47,0],[],0,"CAN_COLLIDE"];
	_this = _item298;
	_objects pushback _this;
	_objectIDs pushback 298;
	_this setPosWorld [10218,7034.47,28.688];
	_this setVectorDirAndUp [[0.374552,-0.927206,0],[0,0,1]];
};

private _item299 = objNull;
if (_layerRoot) then {
	_item299 = createVehicle ["Land_vn_o_tower_02",[10218.2,7073.04,0],[],0,"CAN_COLLIDE"];
	_this = _item299;
	_objects pushback _this;
	_objectIDs pushback 299;
	_this setPosWorld [10218.2,7073.04,28.5733];
	_this setVectorDirAndUp [[0.807429,-0.589965,0],[0,0,1]];
};

private _item300 = objNull;
if (_layerRoot) then {
	_item300 = createVehicle ["Land_vn_o_tower_02",[10151.2,7003.17,0],[],0,"CAN_COLLIDE"];
	_this = _item300;
	_objects pushback _this;
	_objectIDs pushback 300;
	_this setPosWorld [10151.2,7003.17,28.5499];
	_this setVectorDirAndUp [[-0.576172,0.817328,0],[0,0,1]];
};

private _item301 = objNull;
if (_layerRoot) then {
	_item301 = createVehicle ["Campfire_burning_F",[10199,7031.38,-0.000154495],[],0,"CAN_COLLIDE"];
	_this = _item301;
	_objects pushback _this;
	_objectIDs pushback 301;
	_this setPosWorld [10199,7031.38,25.2809];
	_this setVectorDirAndUp [[0,0.999982,-0.00600007],[-0.00999474,0.00599977,0.999932]];
};

private _item302 = objNull;
if (_layerRoot) then {
	_item302 = createVehicle ["Land_vn_o_bunker_03",[10205.4,7087.41,0.144068],[],0,"CAN_COLLIDE"];
	_this = _item302;
	_objects pushback _this;
	_objectIDs pushback 302;
	_this setPosWorld [10205.4,7087.41,24.598];
	_this setVectorDirAndUp [[0.2037,0.979033,0],[0,0,1]];
};

private _item303 = objNull;
if (_layerRoot) then {
	_item303 = createVehicle ["Land_vn_o_bunker_03",[10193.8,7083.73,0],[],0,"CAN_COLLIDE"];
	_this = _item303;
	_objects pushback _this;
	_objectIDs pushback 303;
	_this setPosWorld [10193.8,7083.73,24.389];
	_this setVectorDirAndUp [[-0.76681,0.641874,0],[0,0,1]];
};

private _item304 = objNull;
if (_layerRoot) then {
	_item304 = createVehicle ["Land_vn_o_bunker_03",[10196.3,7004.86,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item304;
	_objects pushback _this;
	_objectIDs pushback 304;
	_this setPosWorld [10196.3,7004.86,24.4401];
	_this setVectorDirAndUp [[0.235612,-0.971847,0],[0,0,1]];
};

private _item305 = objNull;
if (_layerRoot) then {
	_item305 = createVehicle ["Land_vn_o_bunker_03",[10150.4,7049.1,0],[],0,"CAN_COLLIDE"];
	_this = _item305;
	_objects pushback _this;
	_objectIDs pushback 305;
	_this setPosWorld [10150.4,7049.1,24.4177];
	_this setVectorDirAndUp [[-0.150545,0.988603,0],[0,0,1]];
};

private _item306 = objNull;
if (_layerRoot) then {
	_item306 = createVehicle ["Land_Razorwire_F",[10207,7000.1,0],[],0,"CAN_COLLIDE"];
	_this = _item306;
	_objects pushback _this;
	_objectIDs pushback 306;
	_this setPosWorld [10207,7000.1,24.8572];
	_this setVectorDirAndUp [[-0.0601282,-0.99036,-0.124784],[0,-0.12501,0.992155]];
	_this allowdamage false;;
};

private _item307 = objNull;
if (_layerRoot) then {
	_item307 = createVehicle ["Land_Razorwire_F",[10188.9,6996.83,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item307;
	_objects pushback _this;
	_objectIDs pushback 307;
	_this setPosWorld [10188.9,6996.83,25.0649];
	_this setVectorDirAndUp [[0.585178,-0.806009,-0.0889675],[0.00599983,-0.105407,0.994411]];
	_this allowdamage false;;
};

private _item308 = objNull;
if (_layerRoot) then {
	_item308 = createVehicle ["Land_Razorwire_F",[10229.5,7036.35,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item308;
	_objects pushback _this;
	_objectIDs pushback 308;
	_this setPosWorld [10229.5,7036.35,25.5447];
	_this setVectorDirAndUp [[-0.976794,-0.212094,0.0298204],[0.0339789,-0.0159883,0.999295]];
	_this allowdamage false;;
};

private _item309 = objNull;
if (_layerRoot) then {
	_item309 = createVehicle ["Land_Razorwire_F",[10237.2,7015.85,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item309;
	_objects pushback _this;
	_objectIDs pushback 309;
	_this setPosWorld [10237.2,7015.85,24.2304];
	_this setVectorDirAndUp [[-0.96419,0.17961,0.195136],[0.190449,-0.0431517,0.980748]];
	_this allowdamage false;;
};

private _item310 = objNull;
if (_layerRoot) then {
	_item310 = createVehicle ["Land_Razorwire_F",[10237.5,7058.96,0.000699997],[],0,"CAN_COLLIDE"];
	_this = _item310;
	_objects pushback _this;
	_objectIDs pushback 310;
	_this setPosWorld [10237.5,7058.96,25.579];
	_this setVectorDirAndUp [[-0.926263,-0.376544,0.0158587],[0.0219926,-0.0119967,0.999686]];
	_this allowdamage false;;
};

private _item311 = objNull;
if (_layerRoot) then {
	_item311 = createVehicle ["Land_Razorwire_F",[10233.8,7069.68,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item311;
	_objects pushback _this;
	_objectIDs pushback 311;
	_this setPosWorld [10233.8,7069.68,25.5388];
	_this setVectorDirAndUp [[-0.969529,-0.243519,0.0266933],[0.0219955,0.0219904,0.999516]];
	_this allowdamage false;;
};

private _item312 = objNull;
if (_layerRoot) then {
	_item312 = createVehicle ["Land_Razorwire_F",[10228.4,7080.11,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item312;
	_objects pushback _this;
	_objectIDs pushback 312;
	_this setPosWorld [10228.4,7080.11,25.1386];
	_this setVectorDirAndUp [[-0.666267,-0.731491,0.144944],[0.071814,0.130527,0.988841]];
	_this allowdamage false;;
};

private _item313 = objNull;
if (_layerRoot) then {
	_item313 = createVehicle ["Land_Razorwire_F",[10217.4,7088.23,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item313;
	_objects pushback _this;
	_objectIDs pushback 313;
	_this setPosWorld [10217.4,7088.23,25.0733];
	_this setVectorDirAndUp [[-0.300057,-0.938125,0.172881],[0.10541,0.147514,0.983427]];
	_this allowdamage false;;
};

private _item314 = objNull;
if (_layerRoot) then {
	_item314 = createVehicle ["Land_Razorwire_F",[10197.8,7094.75,0],[],0,"CAN_COLLIDE"];
	_this = _item314;
	_objects pushback _this;
	_objectIDs pushback 314;
	_this setPosWorld [10197.8,7094.75,24.8341];
	_this setVectorDirAndUp [[0.120888,-0.988113,0.0949631],[-0.0658569,0.0874706,0.993988]];
	_this allowdamage false;;
};

private _item315 = objNull;
if (_layerRoot) then {
	_item315 = createVehicle ["Land_Razorwire_F",[10182.5,7090.29,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item315;
	_objects pushback _this;
	_objectIDs pushback 315;
	_this setPosWorld [10182.5,7090.29,23.813];
	_this setVectorDirAndUp [[0.527472,-0.828112,0.189746],[-0.125011,0.145257,0.981465]];
	_this allowdamage false;;
};

private _item316 = objNull;
if (_layerRoot) then {
	_item316 = createVehicle ["Land_Razorwire_F",[10152.8,7062.79,0.000699997],[],0,"CAN_COLLIDE"];
	_this = _item316;
	_objects pushback _this;
	_objectIDs pushback 316;
	_this setPosWorld [10152.8,7062.79,23.052];
	_this setVectorDirAndUp [[0.102101,-0.940746,0.323377],[0.237045,0.33872,0.910537]];
	_this allowdamage false;;
};

private _item317 = objNull;
if (_layerRoot) then {
	_item317 = createVehicle ["Land_Razorwire_F",[10108,7043.55,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item317;
	_objects pushback _this;
	_objectIDs pushback 317;
	_this setPosWorld [10108,7043.55,24.6567];
	_this setVectorDirAndUp [[0.886615,-0.432281,0.164461],[-0.14834,0.0710194,0.986383]];
	_this allowdamage false;;
};

private _item318 = objNull;
if (_layerRoot) then {
	_item318 = createVehicle ["Land_Razorwire_F",[10099.7,7032.81,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item318;
	_objects pushback _this;
	_objectIDs pushback 318;
	_this setPosWorld [10099.7,7032.81,24.9959];
	_this setVectorDirAndUp [[0.95702,-0.229051,0.177902],[-0.152206,0.125485,0.98035]];
	_this allowdamage false;;
};

private _item319 = objNull;
if (_layerRoot) then {
	_item319 = createVehicle ["Land_Razorwire_F",[10091.1,7002.13,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item319;
	_objects pushback _this;
	_objectIDs pushback 319;
	_this setPosWorld [10091.1,7002.13,25.5389];
	_this setVectorDirAndUp [[0.840557,0.538311,0.0607082],[-0.0439591,-0.0439166,0.998068]];
	_this allowdamage false;;
};

private _item320 = objNull;
if (_layerRoot) then {
	_item320 = createVehicle ["Land_Razorwire_F",[10085.5,7015.06,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item320;
	_objects pushback _this;
	_objectIDs pushback 320;
	_this setPosWorld [10085.5,7015.06,25.0266];
	_this setVectorDirAndUp [[0.992638,0.0693825,0.0992811],[-0.10541,0.0911023,0.990247]];
	_this allowdamage false;;
};

private _item321 = objNull;
if (_layerRoot) then {
	_item321 = createVehicle ["Land_Razorwire_F",[10131.2,6986.98,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item321;
	_objects pushback _this;
	_objectIDs pushback 321;
	_this setPosWorld [10131.2,6986.98,23.3085];
	_this setVectorDirAndUp [[-0.0487809,0.95496,0.292698],[-0.0279894,-0.294239,0.955322]];
	_this allowdamage false;;
};

private _item322 = objNull;
if (_layerRoot) then {
	_item322 = createVehicle ["Land_Razorwire_F",[10146.8,6983.64,0.000701904],[],0,"CAN_COLLIDE"];
	_this = _item322;
	_objects pushback _this;
	_objectIDs pushback 322;
	_this setPosWorld [10146.8,6983.64,22.7173];
	_this setVectorDirAndUp [[0.404038,0.852951,0.330496],[0.0439577,-0.378986,0.924358]];
	_this allowdamage false;;
};

private _item323 = objNull;
if (_layerRoot) then {
	_item323 = createVehicle ["vn_b_aus_army_static_m101_02",[10542.7,18718.7,0],[],0,"CAN_COLLIDE"];
	_this = _item323;
	_objects pushback _this;
	_objectIDs pushback 323;
	_this setPosWorld [10542.6,18721.3,295.466];
	_this setVectorDirAndUp [[0.865348,-0.500388,0.0280212],[0,0.0559114,0.998436]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item324 = objNull;
if (_layerRoot) then {
	_item324 = createVehicle ["vn_b_aus_army_static_m101_02",[10520.5,18707.8,0],[],0,"CAN_COLLIDE"];
	_this = _item324;
	_objects pushback _this;
	_objectIDs pushback 324;
	_this setPosWorld [10520.4,18710.3,297.117];
	_this setVectorDirAndUp [[-0.83087,-0.543165,0.120941],[0.154135,-0.0158063,0.987923]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item325 = objNull;
if (_layerRoot) then {
	_item325 = createVehicle ["vn_b_aus_army_static_m101_02",[10533.2,18739.2,0.0098877],[],0,"CAN_COLLIDE"];
	_this = _item325;
	_objects pushback _this;
	_objectIDs pushback 325;
	_this setPosWorld [10533.1,18741.7,295.714];
	_this setVectorDirAndUp [[0.597051,-0.79993,-0.060345],[0.0259936,-0.0558933,0.998098]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item326 = objNull;
if (_layerRoot) then {
	_item326 = createVehicle ["vn_flag_camo02",[10565,18738.4,0],[],0,"CAN_COLLIDE"];
	_this = _item326;
	_objects pushback _this;
	_objectIDs pushback 326;
	_this setPosWorld [10565,18738.4,299.056];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item327 = objNull;
if (_layerRoot) then {
	_item327 = createVehicle ["Campfire_burning_F",[10550.3,18729,0],[],0,"CAN_COLLIDE"];
	_this = _item327;
	_objects pushback _this;
	_objectIDs pushback 327;
	_this setPosWorld [10550.3,18729,295.32];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item328 = objNull;
if (_layerRoot) then {
	_item328 = createVehicle ["vn_o_pl_static_zpu4",[10576,18719,-0.00997925],[],0,"CAN_COLLIDE"];
	_this = _item328;
	_objects pushback _this;
	_objectIDs pushback 328;
	_this setPosWorld [10576.1,18719,297.643];
	_this setVectorDirAndUp [[0.87832,-0.476694,-0.0362952],[0.0499382,0.0159777,0.998625]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item329 = objNull;
if (_layerRoot) then {
	_item329 = createVehicle ["Land_vn_o_tower_02",[10577.9,18728.8,0],[],0,"CAN_COLLIDE"];
	_this = _item329;
	_objects pushback _this;
	_objectIDs pushback 329;
	_this setPosWorld [10577.9,18728.8,298.986];
	_this setVectorDirAndUp [[-0.388924,-0.92127,0],[0,0,1]];
};

private _item330 = objNull;
if (_layerRoot) then {
	_item330 = createVehicle ["Land_vn_o_shelter_02",[10550.7,18724.6,0],[],0,"CAN_COLLIDE"];
	_this = _item330;
	_objects pushback _this;
	_objectIDs pushback 330;
	_this setPosWorld [10550.7,18724.6,296.364];
	_this setVectorDirAndUp [[-0.155837,-0.987783,0],[0,0,1]];
};

private _item331 = objNull;
if (_layerRoot) then {
	_item331 = createVehicle ["Land_vn_o_shelter_02",[10540.6,18703.9,0],[],0,"CAN_COLLIDE"];
	_this = _item331;
	_objects pushback _this;
	_objectIDs pushback 331;
	_this setPosWorld [10540.6,18703.9,296.854];
	_this setVectorDirAndUp [[0.54678,-0.837276,0],[0,0,1]];
};

private _item332 = objNull;
if (_layerRoot) then {
	_item332 = createVehicle ["Land_vn_o_shelter_02",[10531.8,18699,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item332;
	_objects pushback _this;
	_objectIDs pushback 332;
	_this setPosWorld [10531.8,18699,296.972];
	_this setVectorDirAndUp [[0.206526,-0.978441,0],[0,0,1]];
};

private _item333 = objNull;
if (_layerRoot) then {
	_item333 = createVehicle ["Land_vn_o_platform_06",[10514,18728.7,0],[],0,"CAN_COLLIDE"];
	_this = _item333;
	_objects pushback _this;
	_objectIDs pushback 333;
	_this setPosWorld [10514,18728.7,299.58];
	_this setVectorDirAndUp [[0.110728,-0.993851,0],[0,0,1]];
};

private _item334 = objNull;
if (_layerRoot) then {
	_item334 = createVehicle ["Land_Razorwire_F",[10485.9,18740.9,0],[],0,"CAN_COLLIDE"];
	_this = _item334;
	_objects pushback _this;
	_objectIDs pushback 334;
	_this setPosWorld [10485.9,18740.9,300.232];
	_this setVectorDirAndUp [[0.963607,-0.263765,-0.0434723],[0.0698301,0.0913878,0.993364]];
	_this allowdamage false;;
};

private _item335 = objNull;
if (_layerRoot) then {
	_item335 = createVehicle ["Land_Razorwire_F",[10481.1,18708.8,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item335;
	_objects pushback _this;
	_objectIDs pushback 335;
	_this setPosWorld [10481.1,18708.8,299.832];
	_this setVectorDirAndUp [[0.975286,-0.220868,0.00585189],[-0.00600007,0,0.999982]];
	_this allowdamage false;;
};

private _item336 = objNull;
if (_layerRoot) then {
	_item336 = createVehicle ["Land_Razorwire_F",[10486,18727.3,0],[],0,"CAN_COLLIDE"];
	_this = _item336;
	_objects pushback _this;
	_objectIDs pushback 336;
	_this setPosWorld [10486,18727.3,300.026];
	_this setVectorDirAndUp [[0.990294,0.114615,-0.0786264],[0.0777663,0.0119636,0.9969]];
	_this allowdamage false;;
};

private _item337 = objNull;
if (_layerRoot) then {
	_item337 = createVehicle ["vn_b_sf_static_m45",[10506.6,18710.1,-0.000335693],[],0,"CAN_COLLIDE"];
	_this = _item337;
	_objects pushback _this;
	_objectIDs pushback 337;
	_this setPosWorld [10506.7,18709.9,300.151];
	_this setVectorDirAndUp [[-0.906867,0.414571,0.0756474],[0.0658539,-0.0378898,0.99711]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item338 = objNull;
if (_layerRoot) then {
	_item338 = createVehicle ["Land_vn_o_bunker_03",[10502.1,18704.7,0],[],0,"CAN_COLLIDE"];
	_this = _item338;
	_objects pushback _this;
	_objectIDs pushback 338;
	_this setPosWorld [10502.1,18704.7,297.882];
	_this setVectorDirAndUp [[-0.891517,0.452987,0],[0,0,1]];
};

private _item340 = objNull;
if (_layerRoot) then {
	_item340 = createVehicle ["vn_b_sf_static_m45",[2744.15,17479.2,0.129742],[],0,"CAN_COLLIDE"];
	_this = _item340;
	_objects pushback _this;
	_objectIDs pushback 340;
	_this setPosWorld [2744.23,17479.3,52.0461];
	_this setVectorDirAndUp [[-0.218706,-0.974758,0.0448931],[0.042963,0.0363431,0.998415]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item341 = objNull;
if (_layerRoot) then {
	_item341 = createVehicle ["vn_flag_pl",[2744.78,17511.5,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item341;
	_objects pushback _this;
	_objectIDs pushback 341;
	_this setPosWorld [2744.78,17511.5,56.8345];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item342 = objNull;
if (_layerRoot) then {
	_item342 = createVehicle ["Land_Razorwire_F",[2782.84,17501.6,0],[],0,"CAN_COLLIDE"];
	_this = _item342;
	_objects pushback _this;
	_objectIDs pushback 342;
	_this setPosWorld [2782.84,17501.6,53.0799];
	_this setVectorDirAndUp [[-0.9919,0.111253,0.0613017],[0.0598924,-0.0159688,0.998077]];
	_this allowdamage false;;
};

private _item343 = objNull;
if (_layerRoot) then {
	_item343 = createVehicle ["Land_vn_o_tower_02",[2764.96,17484.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item343;
	_objects pushback _this;
	_objectIDs pushback 343;
	_this setPosWorld [2764.96,17484.1,54.4735];
	_this setVectorDirAndUp [[-0.994561,-0.104151,0],[0,0,1]];
};

private _item344 = objNull;
if (_layerRoot) then {
	_item344 = createVehicle ["Land_vn_o_shelter_02",[2752.98,17514,0],[],0,"CAN_COLLIDE"];
	_this = _item344;
	_objects pushback _this;
	_objectIDs pushback 344;
	_this setPosWorld [2752.98,17514,54.4022];
	_this setVectorDirAndUp [[0.92158,0.388189,0],[0,0,1]];
};

private _item345 = objNull;
if (_layerRoot) then {
	_item345 = createVehicle ["Land_vn_o_shelter_02",[2750.02,17504.3,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item345;
	_objects pushback _this;
	_objectIDs pushback 345;
	_this setPosWorld [2750.02,17504.3,53.8183];
	_this setVectorDirAndUp [[0.682151,-0.731211,0],[0,0,1]];
};

private _item346 = objNull;
if (_layerRoot) then {
	_item346 = createVehicle ["Campfire_burning_F",[2748.27,17510.8,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item346;
	_objects pushback _this;
	_objectIDs pushback 346;
	_this setPosWorld [2748.27,17510.8,53.1414];
	_this setVectorDirAndUp [[0,0.99955,0.029987],[-0.0239912,-0.0299783,0.999263]];
};

private _item347 = objNull;
if (_layerRoot) then {
	_item347 = createVehicle ["Land_vn_o_platform_06",[2751.96,17520.7,0],[],0,"CAN_COLLIDE"];
	_this = _item347;
	_objects pushback _this;
	_objectIDs pushback 347;
	_this setPosWorld [2751.96,17520.7,55.3446];
	_this setVectorDirAndUp [[-0.906682,0.421815,0],[0,0,1]];
};

private _item348 = objNull;
if (_layerRoot) then {
	_item348 = createVehicle ["Land_vn_o_bunker_03",[2728.05,17523.8,0],[],0,"CAN_COLLIDE"];
	_this = _item348;
	_objects pushback _this;
	_objectIDs pushback 348;
	_this setPosWorld [2728.05,17523.8,51.6443];
	_this setVectorDirAndUp [[-0.552834,0.833291,0],[0,0,1]];
};

private _item349 = objNull;
if (_layerRoot) then {
	_item349 = createVehicle ["Land_vn_o_bunker_03",[2738.36,17528.2,0],[],0,"CAN_COLLIDE"];
	_this = _item349;
	_objects pushback _this;
	_objectIDs pushback 349;
	_this setPosWorld [2738.36,17528.2,51.8296];
	_this setVectorDirAndUp [[0.555276,0.831666,0],[0,0,1]];
};

private _item350 = objNull;
if (_layerRoot) then {
	_item350 = createVehicle ["Land_vn_o_tower_02",[2718.08,17479.1,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item350;
	_objects pushback _this;
	_objectIDs pushback 350;
	_this setPosWorld [2718.08,17479.1,53.8958];
	_this setVectorDirAndUp [[-0.935543,0.353214,0],[0,0,1]];
};

private _item351 = objNull;
if (_layerRoot) then {
	_item351 = createVehicle ["Land_vn_o_bunker_03",[2777.95,17490.7,0],[],0,"CAN_COLLIDE"];
	_this = _item351;
	_objects pushback _this;
	_objectIDs pushback 351;
	_this setPosWorld [2777.95,17490.7,51.8237];
	_this setVectorDirAndUp [[0.987995,-0.154488,0],[0,0,1]];
};

private _item352 = objNull;
if (_layerRoot) then {
	_item352 = createVehicle ["Land_Razorwire_F",[2769.77,17532.1,0],[],0,"CAN_COLLIDE"];
	_this = _item352;
	_objects pushback _this;
	_objectIDs pushback 352;
	_this setPosWorld [2769.77,17532.1,53.0112];
	_this setVectorDirAndUp [[-0.457224,-0.887108,0.063131],[0.0100004,0.0658527,0.997779]];
	_this allowdamage false;;
};

private _item353 = objNull;
if (_layerRoot) then {
	_item353 = createVehicle ["Land_Razorwire_F",[2780.11,17522.7,0],[],0,"CAN_COLLIDE"];
	_this = _item353;
	_objects pushback _this;
	_objectIDs pushback 353;
	_this setPosWorld [2780.11,17522.7,53.1107];
	_this setVectorDirAndUp [[-0.912545,-0.402782,0.0709089],[0.0598933,0.0398967,0.997407]];
	_this allowdamage false;;
};

private _item354 = objNull;
if (_layerRoot) then {
	_item354 = createVehicle ["Land_Razorwire_F",[2750.38,17544.5,0],[],0,"CAN_COLLIDE"];
	_this = _item354;
	_objects pushback _this;
	_objectIDs pushback 354;
	_this setPosWorld [2750.38,17544.5,51.0102];
	_this setVectorDirAndUp [[0.283747,-0.926131,0.248534],[-0.0896379,0.232433,0.968473]];
	_this allowdamage false;;
};

private _item355 = objNull;
if (_layerRoot) then {
	_item355 = createVehicle ["Land_Razorwire_F",[2733.81,17539.6,0],[],0,"CAN_COLLIDE"];
	_this = _item355;
	_objects pushback _this;
	_objectIDs pushback 355;
	_this setPosWorld [2733.81,17539.6,51.5366];
	_this setVectorDirAndUp [[-0.0944143,-0.983925,0.151581],[-0.0199947,0.154105,0.987852]];
	_this allowdamage false;;
};

private _item356 = objNull;
if (_layerRoot) then {
	_item356 = createVehicle ["Land_Razorwire_F",[2705.19,17543.8,0],[],0,"CAN_COLLIDE"];
	_this = _item356;
	_objects pushback _this;
	_objectIDs pushback 356;
	_this setPosWorld [2705.19,17543.8,48.9667];
	_this setVectorDirAndUp [[0.892273,-0.420696,0.163901],[-0.103441,0.162881,0.981208]];
	_this allowdamage false;;
};

private _item357 = objNull;
if (_layerRoot) then {
	_item357 = createVehicle ["Land_Razorwire_F",[2721.23,17548,0],[],0,"CAN_COLLIDE"];
	_this = _item357;
	_objects pushback _this;
	_objectIDs pushback 357;
	_this setPosWorld [2721.23,17548,48.5179];
	_this setVectorDirAndUp [[-0.120685,-0.925446,0.359145],[-0.0279894,0.364818,0.930658]];
	_this allowdamage false;;
};

private _item358 = objNull;
if (_layerRoot) then {
	_item358 = createVehicle ["Land_vn_o_shelter_02",[2710.32,17492.5,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item358;
	_objects pushback _this;
	_objectIDs pushback 358;
	_this setPosWorld [2710.32,17492.5,53.2015];
	_this setVectorDirAndUp [[-0.925956,-0.377631,0],[0,0,1]];
};

private _item359 = objNull;
if (_layerRoot) then {
	_item359 = createVehicle ["Land_vn_o_tower_02",[2698.29,17499.4,0],[],0,"CAN_COLLIDE"];
	_this = _item359;
	_objects pushback _this;
	_objectIDs pushback 359;
	_this setPosWorld [2698.29,17499.4,55.7245];
	_this setVectorDirAndUp [[0.344101,0.938933,0],[0,0,1]];
};

private _item360 = objNull;
if (_layerRoot) then {
	_item360 = createVehicle ["vn_o_pl_static_d44_01",[3275.15,15321.9,0],[],0,"CAN_COLLIDE"];
	_this = _item360;
	_objects pushback _this;
	_objectIDs pushback 360;
	_this setPosWorld [3275.17,15321.9,279.161];
	_this setVectorDirAndUp [[0.994755,-0.102282,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item361 = objNull;
if (_layerRoot) then {
	_item361 = createVehicle ["vn_flag_camo02",[3136.47,15794.6,0],[],0,"CAN_COLLIDE"];
	_this = _item361;
	_objects pushback _this;
	_objectIDs pushback 361;
	_this setPosWorld [3136.47,15794.6,389.797];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item362 = objNull;
if (_layerRoot) then {
	_item362 = createVehicle ["vn_o_pl_static_d44_01",[3012.14,15230.9,0],[],0,"CAN_COLLIDE"];
	_this = _item362;
	_objects pushback _this;
	_objectIDs pushback 362;
	_this setPosWorld [3012.15,15231,297.321];
	_this setVectorDirAndUp [[0.0428799,-0.99908,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item363 = objNull;
if (_layerRoot) then {
	_item363 = createVehicle ["vn_flag_pavn",[3014.55,15244.1,0],[],0,"CAN_COLLIDE"];
	_this = _item363;
	_objects pushback _this;
	_objectIDs pushback 363;
	_this setPosWorld [3014.55,15244.1,301.595];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item364 = objNull;
if (_layerRoot) then {
	_item364 = createVehicle ["Campfire_burning_F",[3016.12,15245.7,0.000396729],[],0,"CAN_COLLIDE"];
	_this = _item364;
	_objects pushback _this;
	_objectIDs pushback 364;
	_this setPosWorld [3016.13,15245.7,297.886];
	_this setVectorDirAndUp [[0,0.993565,0.113262],[0.0698301,-0.112985,0.99114]];
};

private _item365 = objNull;
if (_layerRoot) then {
	_item365 = createVehicle ["vn_b_navy_static_l60mk3",[3013.89,15239.7,-0.00131226],[],0,"CAN_COLLIDE"];
	_this = _item365;
	_objects pushback _this;
	_objectIDs pushback 365;
	_this setPosWorld [3013.9,15239.7,299.102];
	_this setVectorDirAndUp [[0.648508,-0.761198,-0.00389101],[0.00599983,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item366 = objNull;
if (_layerRoot) then {
	_item366 = createVehicle ["vn_b_sf_static_m45",[3007.63,15243.1,0],[],0,"CAN_COLLIDE"];
	_this = _item366;
	_objects pushback _this;
	_objectIDs pushback 366;
	_this setPosWorld [3007.59,15242.9,299.522];
	_this setVectorDirAndUp [[-0.012084,0.995377,0.0952853],[-0.021993,-0.0955338,0.995183]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item367 = objNull;
if (_layerRoot) then {
	_item367 = createVehicle ["vn_flag_pl",[7771.2,10889.8,1.90735e-005],[],0,"CAN_COLLIDE"];
	_this = _item367;
	_objects pushback _this;
	_objectIDs pushback 367;
	_this setPosWorld [7771.2,10889.8,60.2452];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item368 = objNull;
if (_layerRoot) then {
	_item368 = createVehicle ["Campfire_burning_F",[7772.47,10888.5,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item368;
	_objects pushback _this;
	_objectIDs pushback 368;
	_this setPosWorld [7772.45,10888.5,56.5848];
	_this setVectorDirAndUp [[0,0.999758,-0.0219957],[-0.0539216,0.0219637,0.998304]];
};

private _item369 = objNull;
if (_layerRoot) then {
	_item369 = createVehicle ["vn_o_pl_static_d44_01",[7351.88,11455.2,-0.00139713],[],0,"CAN_COLLIDE"];
	_this = _item369;
	_objects pushback _this;
	_objectIDs pushback 369;
	_this setPosWorld [7351.9,11455.3,11.7284];
	_this setVectorDirAndUp [[0.569887,0.821253,0.0277855],[0.00599983,-0.0379715,0.999261]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item370 = objNull;
if (_layerRoot) then {
	_item370 = createVehicle ["vn_o_pl_static_d44_01",[7322.23,11486,0.000721931],[],0,"CAN_COLLIDE"];
	_this = _item370;
	_objects pushback _this;
	_objectIDs pushback 370;
	_this setPosWorld [7322.25,11486,12.0343];
	_this setVectorDirAndUp [[0.827193,0.561888,-0.00584132],[0.0219955,-0.0219902,0.999516]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item372 = objNull;
if (_layerRoot) then {
	_item372 = createVehicle ["Land_vn_o_bunker_03",[7353.29,11429.6,0],[],0,"CAN_COLLIDE"];
	_this = _item372;
	_objects pushback _this;
	_objectIDs pushback 372;
	_this setPosWorld [7353.29,11429.6,13.8653];
	_this setVectorDirAndUp [[0.436794,-0.899562,0],[0,0,1]];
};

private _item373 = objNull;
if (_layerRoot) then {
	_item373 = createVehicle ["Land_vn_o_bunker_03",[7365.89,11438.1,0],[],0,"CAN_COLLIDE"];
	_this = _item373;
	_objects pushback _this;
	_objectIDs pushback 373;
	_this setPosWorld [7365.89,11438.1,13.8653];
	_this setVectorDirAndUp [[0.807606,-0.589723,0],[0,0,1]];
};

private _item374 = objNull;
if (_layerRoot) then {
	_item374 = createVehicle ["Land_vn_o_bunker_03",[7330.97,11423.9,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item374;
	_objects pushback _this;
	_objectIDs pushback 374;
	_this setPosWorld [7330.97,11423.9,13.9127];
	_this setVectorDirAndUp [[0.184794,-0.982777,0],[0,0,1]];
};

private _item375 = objNull;
if (_layerRoot) then {
	_item375 = createVehicle ["Land_vn_o_bunker_03",[7307.6,11511.2,0],[],0,"CAN_COLLIDE"];
	_this = _item375;
	_objects pushback _this;
	_objectIDs pushback 375;
	_this setPosWorld [7307.6,11511.2,13.752];
	_this setVectorDirAndUp [[-0.742622,0.669711,0],[0,0,1]];
};

private _item376 = objNull;
if (_layerRoot) then {
	_item376 = createVehicle ["Land_vn_o_bunker_03",[7316.6,11507.6,0],[],0,"CAN_COLLIDE"];
	_this = _item376;
	_objects pushback _this;
	_objectIDs pushback 376;
	_this setPosWorld [7316.6,11507.6,14.0897];
	_this setVectorDirAndUp [[0.895597,0.444866,0],[0,0,1]];
};

private _item377 = objNull;
if (_layerRoot) then {
	_item377 = createVehicle ["vn_o_pl_static_zpu4",[7297.12,11449,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item377;
	_objects pushback _this;
	_objectIDs pushback 377;
	_this setPosWorld [7297.07,11449,13.246];
	_this setVectorDirAndUp [[-0.856055,-0.515677,-0.0353228],[-0.0279916,-0.0219869,0.999366]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item378 = objNull;
if (_layerRoot) then {
	_item378 = createVehicle ["vn_o_kr_static_zgu1_01",[7323.45,11431.6,-4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item378;
	_objects pushback _this;
	_objectIDs pushback 378;
	_this setPosWorld [7323.45,11431.6,15.7248];
	_this setVectorDirAndUp [[0.236229,0.971697,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item379 = objNull;
if (_layerRoot) then {
	_item379 = createVehicle ["vn_o_kr_static_zgu1_01",[7328.04,11461.7,0],[],0,"CAN_COLLIDE"];
	_this = _item379;
	_objects pushback _this;
	_objectIDs pushback 379;
	_this setPosWorld [7328.04,11461.7,15.6649];
	_this setVectorDirAndUp [[-0.598211,0.801339,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item380 = objNull;
if (_layerRoot) then {
	_item380 = createVehicle ["Land_vn_o_tower_02",[7288.83,11476.3,0],[],0,"CAN_COLLIDE"];
	_this = _item380;
	_objects pushback _this;
	_objectIDs pushback 380;
	_this setPosWorld [7288.83,11476.3,17.8702];
	_this setVectorDirAndUp [[-0.342842,0.939393,0],[0,0,1]];
};

private _item381 = objNull;
if (_layerRoot) then {
	_item381 = createVehicle ["Land_vn_o_tower_02",[7282.49,11492.8,0],[],0,"CAN_COLLIDE"];
	_this = _item381;
	_objects pushback _this;
	_objectIDs pushback 381;
	_this setPosWorld [7282.49,11492.8,16.3921];
	_this setVectorDirAndUp [[0.858559,0.512715,0],[0,0,1]];
};

private _item382 = objNull;
if (_layerRoot) then {
	_item382 = createVehicle ["Land_vn_o_tower_02",[7317.97,11440.3,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item382;
	_objects pushback _this;
	_objectIDs pushback 382;
	_this setPosWorld [7317.97,11440.3,17.8712];
	_this setVectorDirAndUp [[-0.342842,0.939393,0],[0,0,1]];
};

private _item383 = objNull;
if (_layerRoot) then {
	_item383 = createVehicle ["Land_vn_o_tower_02",[7372.31,11476.6,0],[],0,"CAN_COLLIDE"];
	_this = _item383;
	_objects pushback _this;
	_objectIDs pushback 383;
	_this setPosWorld [7372.31,11476.6,17.8867];
	_this setVectorDirAndUp [[0.501751,-0.865012,0],[0,0,1]];
};

private _item384 = objNull;
if (_layerRoot) then {
	_item384 = createVehicle ["vn_flag_pavn",[7312.29,11451.5,0],[],0,"CAN_COLLIDE"];
	_this = _item384;
	_objects pushback _this;
	_objectIDs pushback 384;
	_this setPosWorld [7312.29,11451.5,18.1719];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item385 = objNull;
if (_layerRoot) then {
	_item385 = createVehicle ["Campfire_burning_F",[7312.9,11453,0],[],0,"CAN_COLLIDE"];
	_this = _item385;
	_objects pushback _this;
	_objectIDs pushback 385;
	_this setPosWorld [7312.9,11453,14.3996];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item386 = objNull;
if (_layerRoot) then {
	_item386 = createVehicle ["Land_Razorwire_F",[7341.62,11424.6,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item386;
	_objects pushback _this;
	_objectIDs pushback 386;
	_this setPosWorld [7341.62,11424.6,14.9314];
	_this setVectorDirAndUp [[-0.265568,0.964044,0.00963576],[0,-0.00999464,0.99995]];
	_this allowdamage false;;
};

private _item387 = objNull;
if (_layerRoot) then {
	_item387 = createVehicle ["Land_Razorwire_F",[7367.63,11424.6,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item387;
	_objects pushback _this;
	_objectIDs pushback 387;
	_this setPosWorld [7367.63,11424.6,13.5886];
	_this setVectorDirAndUp [[-0.532986,0.73892,0.412216],[0.22969,-0.342534,0.910995]];
	_this allowdamage false;;
};

private _item388 = objNull;
if (_layerRoot) then {
	_item388 = createVehicle ["Land_Razorwire_F",[7377.14,11443.9,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item388;
	_objects pushback _this;
	_objectIDs pushback 388;
	_this setPosWorld [7377.14,11443.9,14.805];
	_this setVectorDirAndUp [[-0.9044,0.419415,0.0784378],[0.0559122,-0.0657537,0.996268]];
	_this allowdamage false;;
};

private _item389 = objNull;
if (_layerRoot) then {
	_item389 = createVehicle ["Land_Razorwire_F",[7384.74,11457.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item389;
	_objects pushback _this;
	_objectIDs pushback 389;
	_this setPosWorld [7384.74,11457.4,14.7001];
	_this setVectorDirAndUp [[-0.988879,0.13691,0.0580854],[0.0539216,-0.0339309,0.997968]];
	_this allowdamage false;;
};

private _item390 = objNull;
if (_layerRoot) then {
	_item390 = createVehicle ["Land_Razorwire_F",[7375.73,11490.3,0],[],0,"CAN_COLLIDE"];
	_this = _item390;
	_objects pushback _this;
	_objectIDs pushback 390;
	_this setPosWorld [7375.73,11490.3,14.8235];
	_this setVectorDirAndUp [[-0.447763,-0.892083,0.0607964],[0.0678431,0.0339024,0.99712]];
	_this allowdamage false;;
};

private _item391 = objNull;
if (_layerRoot) then {
	_item391 = createVehicle ["Land_Razorwire_F",[7382.69,11472.6,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item391;
	_objects pushback _this;
	_objectIDs pushback 391;
	_this setPosWorld [7382.69,11472.6,14.9233];
	_this setVectorDirAndUp [[-0.998044,0.032206,0.0535737],[0.0539202,0.00998616,0.998495]];
	_this allowdamage false;;
};

private _item392 = objNull;
if (_layerRoot) then {
	_item392 = createVehicle ["Land_Razorwire_F",[7354.75,11498,0],[],0,"CAN_COLLIDE"];
	_this = _item392;
	_objects pushback _this;
	_objectIDs pushback 392;
	_this setPosWorld [7354.75,11498,14.9585];
	_this setVectorDirAndUp [[-0.18347,-0.982874,0.017246],[0.0935864,0,0.995611]];
	_this allowdamage false;;
};

private _item393 = objNull;
if (_layerRoot) then {
	_item393 = createVehicle ["Land_Razorwire_F",[7341.22,11502.9,0],[],0,"CAN_COLLIDE"];
	_this = _item393;
	_objects pushback _this;
	_objectIDs pushback 393;
	_this setPosWorld [7341.22,11502.9,15.4655];
	_this setVectorDirAndUp [[-0.166613,-0.986019,0.0026651],[0.0159937,0,0.999872]];
	_this allowdamage false;;
};

private _item394 = objNull;
if (_layerRoot) then {
	_item394 = createVehicle ["Land_Razorwire_F",[7312.95,11516.4,0],[],0,"CAN_COLLIDE"];
	_this = _item394;
	_objects pushback _this;
	_objectIDs pushback 394;
	_this setPosWorld [7312.95,11516.4,14.5886];
	_this setVectorDirAndUp [[-0.0148713,-0.99987,-0.00617763],[-0.012,-0.0059994,0.99991]];
	_this allowdamage false;;
};

private _item395 = objNull;
if (_layerRoot) then {
	_item395 = createVehicle ["Land_Razorwire_F",[7278.49,11502.3,0],[],0,"CAN_COLLIDE"];
	_this = _item395;
	_objects pushback _this;
	_objectIDs pushback 395;
	_this setPosWorld [7278.49,11502.3,12.9043];
	_this setVectorDirAndUp [[0.435038,-0.891419,0.126941],[-0.065856,0.109103,0.991847]];
	_this allowdamage false;;
};

private _item396 = objNull;
if (_layerRoot) then {
	_item396 = createVehicle ["Land_Razorwire_F",[7266.12,11494.1,0],[],0,"CAN_COLLIDE"];
	_this = _item396;
	_objects pushback _this;
	_objectIDs pushback 396;
	_this setPosWorld [7266.12,11494.1,14.9953];
	_this setVectorDirAndUp [[0.923963,-0.378517,0.0549334],[-0.0658569,-0.0159628,0.997701]];
	_this allowdamage false;;
};

private _item397 = objNull;
if (_layerRoot) then {
	_item397 = createVehicle ["Land_Razorwire_F",[7283.29,11422.2,0],[],0,"CAN_COLLIDE"];
	_this = _item397;
	_objects pushback _this;
	_objectIDs pushback 397;
	_this setPosWorld [7283.29,11422.2,15.419];
	_this setVectorDirAndUp [[-0.206999,-0.977661,0.0364862],[0.0439562,0.0279624,0.998642]];
	_this allowdamage false;;
};

private _item398 = objNull;
if (_layerRoot) then {
	_item398 = createVehicle ["Land_Razorwire_F",[7274.67,11431.8,0],[],0,"CAN_COLLIDE"];
	_this = _item398;
	_objects pushback _this;
	_objectIDs pushback 398;
	_this setPosWorld [7274.67,11431.8,15.5946];
	_this setVectorDirAndUp [[0.892735,0.445445,-0.0678445],[0.0618819,0.0279358,0.997692]];
	_this allowdamage false;;
};

private _item399 = objNull;
if (_layerRoot) then {
	_item399 = createVehicle ["Land_Razorwire_F",[7268.32,11447.8,0],[],0,"CAN_COLLIDE"];
	_this = _item399;
	_objects pushback _this;
	_objectIDs pushback 399;
	_this setPosWorld [7268.32,11447.8,15.9862];
	_this setVectorDirAndUp [[0.850738,0.48583,-0.200535],[0.231532,-0.00388806,0.97282]];
	_this allowdamage false;;
};

private _item400 = objNull;
if (_layerRoot) then {
	_item400 = createVehicle ["vn_b_sf_static_m45",[7299.33,11501.1,0],[],0,"CAN_COLLIDE"];
	_this = _item400;
	_objects pushback _this;
	_objectIDs pushback 400;
	_this setPosWorld [7299.29,11501.1,16.311];
	_this setVectorDirAndUp [[-0.653736,0.756404,-0.0219468],[-0.021993,0.00999829,0.999708]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item401 = objNull;
if (_layerRoot) then {
	_item401 = createVehicle ["vn_b_sf_static_m45",[7360.48,11433.8,0],[],0,"CAN_COLLIDE"];
	_this = _item401;
	_objects pushback _this;
	_objectIDs pushback 401;
	_this setPosWorld [7360.5,11433.8,16.1119];
	_this setVectorDirAndUp [[0.478056,-0.878316,-0.00477824],[0.00999464,0,0.99995]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item402 = objNull;
if (_layerRoot) then {
	_item402 = createVehicle ["vn_o_pl_static_d44_01",[11216.3,14837.2,0.000411987],[],0,"CAN_COLLIDE"];
	_this = _item402;
	_objects pushback _this;
	_objectIDs pushback 402;
	_this setPosWorld [11216.3,14837.2,70.2989];
	_this setVectorDirAndUp [[0.999982,-2.8213e-007,0.00600007],[-0.00600007,0,0.999982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item403 = objNull;
if (_layerRoot) then {
	_item403 = createVehicle ["vn_o_nva_navy_static_v11m",[11191.9,14840,0],[],0,"CAN_COLLIDE"];
	_this = _item403;
	_objects pushback _this;
	_objectIDs pushback 403;
	_this setPosWorld [11191.9,14840,71.918];
	_this setVectorDirAndUp [[-0.786732,-0.617295,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item404 = objNull;
if (_layerRoot) then {
	_item404 = createVehicle ["vn_o_pl_static_d44_01",[11215.6,14895.6,0.000305176],[],0,"CAN_COLLIDE"];
	_this = _item404;
	_objects pushback _this;
	_objectIDs pushback 404;
	_this setPosWorld [11215.6,14895.6,70.1469];
	_this setVectorDirAndUp [[0.99988,-0.0141859,0.00617014],[-0.00600007,0.0119998,0.99991]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item405 = objNull;
if (_layerRoot) then {
	_item405 = createVehicle ["vn_o_nva_navy_static_v11m",[11218.1,14920.6,0],[],0,"CAN_COLLIDE"];
	_this = _item405;
	_objects pushback _this;
	_objectIDs pushback 405;
	_this setPosWorld [11218.1,14920.6,71.9009];
	_this setVectorDirAndUp [[-0.786032,0.618089,-0.0108982],[-0.00600007,0.0100005,0.999932]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item406 = objNull;
if (_layerRoot) then {
	_item406 = createVehicle ["vn_o_pl_static_d44_01",[11193.7,14918.6,-0.000305176],[],0,"CAN_COLLIDE"];
	_this = _item406;
	_objects pushback _this;
	_objectIDs pushback 406;
	_this setPosWorld [11193.7,14918.6,70.0703];
	_this setVectorDirAndUp [[0.999998,-0.00211887,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item407 = objNull;
if (_layerRoot) then {
	_item407 = createVehicle ["vn_o_nva_navy_static_v11m",[11191.1,14894.2,-0.000183105],[],0,"CAN_COLLIDE"];
	_this = _item407;
	_objects pushback _this;
	_objectIDs pushback 407;
	_this setPosWorld [11191,14894.2,71.8483];
	_this setVectorDirAndUp [[0.620542,-0.784148,0.00620247],[-0.00999474,0,0.99995]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item408 = objNull;
if (_layerRoot) then {
	_item408 = createVehicle ["Land_vn_bunker_big_01",[11203.1,14827,0],[],0,"CAN_COLLIDE"];
	_this = _item408;
	_objects pushback _this;
	_objectIDs pushback 408;
	_this setPosWorld [11203.1,14827,71.0485];
	_this setVectorDirAndUp [[-1,1.19249e-008,0],[0,0,1]];
};

private _item409 = objNull;
if (_layerRoot) then {
	_item409 = createVehicle ["Land_vn_bunker_big_01",[11203.6,14907.8,0],[],0,"CAN_COLLIDE"];
	_this = _item409;
	_objects pushback _this;
	_objectIDs pushback 409;
	_this setPosWorld [11203.6,14907.8,70.9598];
	_this setVectorDirAndUp [[-1,1.19249e-008,0],[0,0,1]];
};

private _item411 = objNull;
if (_layerRoot) then {
	_item411 = createVehicle ["vn_b_navy_static_l60mk3",[11239.9,14851.6,-9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item411;
	_objects pushback _this;
	_objectIDs pushback 411;
	_this setPosWorld [11239.9,14851.6,72.206];
	_this setVectorDirAndUp [[0.290909,-0.956751,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item412 = objNull;
if (_layerRoot) then {
	_item412 = createVehicle ["vn_b_navy_static_l60mk3",[11247.7,14851.3,-0.000442505],[],0,"CAN_COLLIDE"];
	_this = _item412;
	_objects pushback _this;
	_objectIDs pushback 412;
	_this setPosWorld [11247.7,14851.3,72.2284];
	_this setVectorDirAndUp [[-0.818278,0.574764,0.00817881],[0.00999464,0,0.99995]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item413 = objNull;
if (_layerRoot) then {
	_item413 = createVehicle ["vn_b_navy_static_l60mk3",[11256.4,14850.8,0],[],0,"CAN_COLLIDE"];
	_this = _item413;
	_objects pushback _this;
	_objectIDs pushback 413;
	_this setPosWorld [11256.4,14850.8,72.2061];
	_this setVectorDirAndUp [[-0.453878,-0.891064,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item414 = objNull;
if (_layerRoot) then {
	_item414 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11231.4,14863.1,0],[],0,"CAN_COLLIDE"];
	_this = _item414;
	_objects pushback _this;
	_objectIDs pushback 414;
	_this setPosWorld [11231.4,14863.1,70.0782];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item415 = objNull;
if (_layerRoot) then {
	_item415 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11240.2,14863,0],[],0,"CAN_COLLIDE"];
	_this = _item415;
	_objects pushback _this;
	_objectIDs pushback 415;
	_this setPosWorld [11240.2,14863,70.0998];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item416 = objNull;
if (_layerRoot) then {
	_item416 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11248.8,14863.1,0],[],0,"CAN_COLLIDE"];
	_this = _item416;
	_objects pushback _this;
	_objectIDs pushback 416;
	_this setPosWorld [11248.8,14863.1,70.138];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item417 = objNull;
if (_layerRoot) then {
	_item417 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11257.3,14863.1,0],[],0,"CAN_COLLIDE"];
	_this = _item417;
	_objects pushback _this;
	_objectIDs pushback 417;
	_this setPosWorld [11257.3,14863.1,70.1305];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item418 = objNull;
if (_layerRoot) then {
	_item418 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11231.1,14840.7,0],[],0,"CAN_COLLIDE"];
	_this = _item418;
	_objects pushback _this;
	_objectIDs pushback 418;
	_this setPosWorld [11231.1,14840.7,70.0805];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item419 = objNull;
if (_layerRoot) then {
	_item419 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11239.9,14840.5,0],[],0,"CAN_COLLIDE"];
	_this = _item419;
	_objects pushback _this;
	_objectIDs pushback 419;
	_this setPosWorld [11239.9,14840.5,70.1042];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item420 = objNull;
if (_layerRoot) then {
	_item420 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11248.5,14840.6,0],[],0,"CAN_COLLIDE"];
	_this = _item420;
	_objects pushback _this;
	_objectIDs pushback 420;
	_this setPosWorld [11248.5,14840.6,70.0998];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item421 = objNull;
if (_layerRoot) then {
	_item421 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11257.1,14840.6,0],[],0,"CAN_COLLIDE"];
	_this = _item421;
	_objects pushback _this;
	_objectIDs pushback 421;
	_this setPosWorld [11257.1,14840.6,70.0734];
	_this setVectorDirAndUp [[-0.0127501,-0.999919,0],[0,0,1]];
};

private _item423 = objNull;
if (_layerRoot) then {
	_item423 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11262.8,14847.5,0],[],0,"CAN_COLLIDE"];
	_this = _item423;
	_objects pushback _this;
	_objectIDs pushback 423;
	_this setPosWorld [11262.8,14847.5,70.083];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item424 = objNull;
if (_layerRoot) then {
	_item424 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11262.7,14856.1,0],[],0,"CAN_COLLIDE"];
	_this = _item424;
	_objects pushback _this;
	_objectIDs pushback 424;
	_this setPosWorld [11262.7,14856.1,70.0998];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item427 = objNull;
if (_layerRoot) then {
	_item427 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11252.3,14847.2,0],[],0,"CAN_COLLIDE"];
	_this = _item427;
	_objects pushback _this;
	_objectIDs pushback 427;
	_this setPosWorld [11252.3,14847.2,70.0998];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item428 = objNull;
if (_layerRoot) then {
	_item428 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11252.2,14855.8,0],[],0,"CAN_COLLIDE"];
	_this = _item428;
	_objects pushback _this;
	_objectIDs pushback 428;
	_this setPosWorld [11252.2,14855.8,70.1082];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item429 = objNull;
if (_layerRoot) then {
	_item429 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11243.8,14847.4,0],[],0,"CAN_COLLIDE"];
	_this = _item429;
	_objects pushback _this;
	_objectIDs pushback 429;
	_this setPosWorld [11243.8,14847.4,70.1115];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item430 = objNull;
if (_layerRoot) then {
	_item430 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11243.7,14856,0],[],0,"CAN_COLLIDE"];
	_this = _item430;
	_objects pushback _this;
	_objectIDs pushback 430;
	_this setPosWorld [11243.7,14856,70.1363];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item431 = objNull;
if (_layerRoot) then {
	_item431 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11235.3,14847.5,0],[],0,"CAN_COLLIDE"];
	_this = _item431;
	_objects pushback _this;
	_objectIDs pushback 431;
	_this setPosWorld [11235.3,14847.5,70.1023];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item432 = objNull;
if (_layerRoot) then {
	_item432 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11235.2,14856.1,0],[],0,"CAN_COLLIDE"];
	_this = _item432;
	_objects pushback _this;
	_objectIDs pushback 432;
	_this setPosWorld [11235.2,14856.1,70.0998];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item434 = objNull;
if (_layerRoot) then {
	_item434 = createVehicle ["Land_vn_b_trench_revetment_05_01",[11225.5,14855.4,0],[],0,"CAN_COLLIDE"];
	_this = _item434;
	_objects pushback _this;
	_objectIDs pushback 434;
	_this setPosWorld [11225.5,14855.4,70.0729];
	_this setVectorDirAndUp [[0.999915,-0.0130681,0],[0,0,1]];
};

private _item435 = objNull;
if (_layerRoot) then {
	_item435 = createVehicle ["vn_b_sf_static_m45",[11160.8,14775.2,0],[],0,"CAN_COLLIDE"];
	_this = _item435;
	_objects pushback _this;
	_objectIDs pushback 435;
	_this setPosWorld [11160.8,14775.3,71.9337];
	_this setVectorDirAndUp [[-0.176629,-0.984269,0.00413926],[-0.0100007,0.00599977,0.999932]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item436 = objNull;
if (_layerRoot) then {
	_item436 = createVehicle ["vn_b_sf_static_m45",[11189.5,14739.6,0],[],0,"CAN_COLLIDE"];
	_this = _item436;
	_objects pushback _this;
	_objectIDs pushback 436;
	_this setPosWorld [11189.5,14739.6,72.1528];
	_this setVectorDirAndUp [[0.0222666,-0.999624,0.0159937],[0,0.0159977,0.999872]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item437 = objNull;
if (_layerRoot) then {
	_item437 = createVehicle ["vn_flag_pl",[12125.6,4817.72,0.106374],[],0,"CAN_COLLIDE"];
	_this = _item437;
	_objects pushback _this;
	_objectIDs pushback 437;
	_this setPosWorld [12125.6,4817.72,12.5032];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item438 = objNull;
if (_layerRoot) then {
	_item438 = createVehicle ["Land_vn_o_shelter_02",[12108.3,4794.43,0],[],0,"CAN_COLLIDE"];
	_this = _item438;
	_objects pushback _this;
	_objectIDs pushback 438;
	_this setPosWorld [12108.3,4794.43,9.68384];
	_this setVectorDirAndUp [[-0.318244,-0.948009,0],[0,0,1]];
};

private _item439 = objNull;
if (_layerRoot) then {
	_item439 = createVehicle ["Land_vn_o_shelter_02",[12094.2,4785.57,0],[],0,"CAN_COLLIDE"];
	_this = _item439;
	_objects pushback _this;
	_objectIDs pushback 439;
	_this setPosWorld [12094.2,4785.57,9.68384];
	_this setVectorDirAndUp [[0.0374279,-0.999299,0],[0,0,1]];
};

private _item440 = objNull;
if (_layerRoot) then {
	_item440 = createVehicle ["Campfire_burning_F",[12124.8,4819.41,0.106374],[],0,"CAN_COLLIDE"];
	_this = _item440;
	_objects pushback _this;
	_objectIDs pushback 440;
	_this setPosWorld [12124.8,4819.41,8.74596];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item441 = objNull;
if (_layerRoot) then {
	_item441 = createVehicle ["Land_vn_o_platform_06",[12091.5,4798.66,0],[],0,"CAN_COLLIDE"];
	_this = _item441;
	_objects pushback _this;
	_objectIDs pushback 441;
	_this setPosWorld [12091.5,4798.66,10.6624];
	_this setVectorDirAndUp [[-0.847655,0.530548,0],[0,0,1]];
};

private _item442 = objNull;
if (_layerRoot) then {
	_item442 = createVehicle ["Land_vn_o_platform_06",[12103.2,4806.81,0],[],0,"CAN_COLLIDE"];
	_this = _item442;
	_objects pushback _this;
	_objectIDs pushback 442;
	_this setPosWorld [12103.2,4806.81,10.6624];
	_this setVectorDirAndUp [[-0.983114,0.182994,0],[0,0,1]];
};

private _item443 = objNull;
if (_layerRoot) then {
	_item443 = createVehicle ["vn_flag_vc",[12216.8,5254.95,-1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item443;
	_objects pushback _this;
	_objectIDs pushback 443;
	_this setPosWorld [12216.8,5254.95,27.0599];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item444 = objNull;
if (_layerRoot) then {
	_item444 = createVehicle ["vn_flag_vc",[11286.9,3624.64,0],[],0,"CAN_COLLIDE"];
	_this = _item444;
	_objects pushback _this;
	_objectIDs pushback 444;
	_this setPosWorld [11286.9,3624.64,25.723];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item445 = objNull;
if (_layerRoot) then {
	_item445 = createVehicle ["vn_flag_vc",[11820.4,3986.68,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item445;
	_objects pushback _this;
	_objectIDs pushback 445;
	_this setPosWorld [11820.4,3986.68,9.31503];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item447 = objNull;
if (_layerRoot) then {
	_item447 = createVehicle ["vn_flag_pl",[12688.9,3422.32,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item447;
	_objects pushback _this;
	_objectIDs pushback 447;
	_this setPosWorld [12688.9,3422.32,34.6823];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item448 = objNull;
if (_layerRoot) then {
	_item448 = createVehicle ["vn_flag_vc",[12433.2,3944.59,0.0114613],[],0,"CAN_COLLIDE"];
	_this = _item448;
	_objects pushback _this;
	_objectIDs pushback 448;
	_this setPosWorld [12433.2,3944.59,29.4253];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item449 = objNull;
if (_layerRoot) then {
	_item449 = createVehicle ["vn_flag_vc",[11944.6,3012.05,0],[],0,"CAN_COLLIDE"];
	_this = _item449;
	_objects pushback _this;
	_objectIDs pushback 449;
	_this setPosWorld [11944.6,3012.05,29.1507];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item450 = objNull;
if (_layerRoot) then {
	_item450 = createVehicle ["vn_flag_vc",[11831.5,3364.7,0],[],0,"CAN_COLLIDE"];
	_this = _item450;
	_objects pushback _this;
	_objectIDs pushback 450;
	_this setPosWorld [11831.5,3364.7,24.9699];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item451 = objNull;
if (_layerRoot) then {
	_item451 = createVehicle ["vn_flag_vc",[10624.8,5166.33,0.0114603],[],0,"CAN_COLLIDE"];
	_this = _item451;
	_objects pushback _this;
	_objectIDs pushback 451;
	_this setPosWorld [10624.8,5166.33,17.7911];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item452 = objNull;
if (_layerRoot) then {
	_item452 = createVehicle ["vn_o_pl_spiderhole_01",[6328.18,7168.49,0],[],0,"CAN_COLLIDE"];
	_this = _item452;
	_objects pushback _this;
	_objectIDs pushback 452;
	_this setPosWorld [6328.18,7168.49,54.0147];
	_this setVectorDirAndUp [[-0.711819,0.677724,0.184401],[0.136704,-0.123838,0.982841]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item453 = objNull;
if (_layerRoot) then {
	_item453 = createVehicle ["vn_o_pl_spiderhole_01",[6395.05,7168.54,0],[],0,"CAN_COLLIDE"];
	_this = _item453;
	_objects pushback _this;
	_objectIDs pushback 453;
	_this setPosWorld [6395.05,7168.54,52.4208];
	_this setVectorDirAndUp [[0.600332,0.759906,0.249288],[-0.125011,-0.218711,0.967749]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item454 = objNull;
if (_layerRoot) then {
	_item454 = createVehicle ["vn_o_pl_spiderhole_01",[6355.96,7120.6,0],[],0,"CAN_COLLIDE"];
	_this = _item454;
	_objects pushback _this;
	_objectIDs pushback 454;
	_this setPosWorld [6355.96,7120.6,47.0541];
	_this setVectorDirAndUp [[-0.787047,-0.611825,0.0789158],[0.0658567,0.0438623,0.996865]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item455 = objNull;
if (_layerRoot) then {
	_item455 = createVehicle ["vn_flag_pl",[6378.9,7125,0],[],0,"CAN_COLLIDE"];
	_this = _item455;
	_objects pushback _this;
	_objectIDs pushback 455;
	_this setPosWorld [6378.9,7125,49.9754];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item456 = objNull;
if (_layerRoot) then {
	_item456 = createVehicle ["Land_vn_o_shelter_02",[6375,7130.17,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item456;
	_objects pushback _this;
	_objectIDs pushback 456;
	_this setPosWorld [6375,7130.17,46.8112];
	_this setVectorDirAndUp [[-0.892343,0.451359,0],[0,0,1]];
};

private _item457 = objNull;
if (_layerRoot) then {
	_item457 = createVehicle ["Land_vn_o_shelter_02",[6385.6,7142.98,0],[],0,"CAN_COLLIDE"];
	_this = _item457;
	_objects pushback _this;
	_objectIDs pushback 457;
	_this setPosWorld [6385.6,7142.98,47.3507];
	_this setVectorDirAndUp [[0.328785,0.944405,0],[0,0,1]];
};

private _item458 = objNull;
if (_layerRoot) then {
	_item458 = createVehicle ["Land_vn_o_tower_02",[6364.21,7133.93,0],[],0,"CAN_COLLIDE"];
	_this = _item458;
	_objects pushback _this;
	_objectIDs pushback 458;
	_this setPosWorld [6364.21,7133.93,49.5079];
	_this setVectorDirAndUp [[0.650902,0.759162,0],[0,0,1]];
};

private _item459 = objNull;
if (_layerRoot) then {
	_item459 = createVehicle ["Land_vn_o_tower_02",[6378.14,7121.64,0],[],0,"CAN_COLLIDE"];
	_this = _item459;
	_objects pushback _this;
	_objectIDs pushback 459;
	_this setPosWorld [6378.14,7121.64,49.9745];
	_this setVectorDirAndUp [[-0.971572,0.236745,0],[0,0,1]];
};

private _item460 = objNull;
if (_layerRoot) then {
	_item460 = createVehicle ["Land_vn_o_tower_02",[6381.82,7173.53,3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item460;
	_objects pushback _this;
	_objectIDs pushback 460;
	_this setPosWorld [6381.82,7173.53,56.0725];
	_this setVectorDirAndUp [[0.861251,-0.50818,0],[0,0,1]];
};

private _item461 = objNull;
if (_layerRoot) then {
	_item461 = createVehicle ["Land_vn_o_platform_06",[6400.85,7137.68,0],[],0,"CAN_COLLIDE"];
	_this = _item461;
	_objects pushback _this;
	_objectIDs pushback 461;
	_this setPosWorld [6400.85,7137.68,49.8438];
	_this setVectorDirAndUp [[0.126383,0.991982,0],[0,0,1]];
};

private _item462 = objNull;
if (_layerRoot) then {
	_item462 = createVehicle ["Land_vn_o_snipertree_04",[6353.31,7137.48,0],[],0,"CAN_COLLIDE"];
	_this = _item462;
	_objects pushback _this;
	_objectIDs pushback 462;
	_this setPosWorld [6353.31,7137.48,57.1865];
	_this setVectorDirAndUp [[0.780978,-0.624559,0],[0,0,1]];
};

private _item463 = objNull;
if (_layerRoot) then {
	_item463 = createVehicle ["Land_vn_o_snipertree_03",[6372.79,7148.87,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item463;
	_objects pushback _this;
	_objectIDs pushback 463;
	_this setPosWorld [6372.79,7148.87,65.0396];
	_this setVectorDirAndUp [[-0.436182,-0.899859,0],[0,0,1]];
};

private _item464 = objNull;
if (_layerRoot) then {
	_item464 = createVehicle ["Land_vn_o_snipertree_03",[6352.22,7109.89,0],[],0,"CAN_COLLIDE"];
	_this = _item464;
	_objects pushback _this;
	_objectIDs pushback 464;
	_this setPosWorld [6352.22,7109.89,66.2953];
	_this setVectorDirAndUp [[0.856704,0.515808,0],[0,0,1]];
};

private _item466 = objNull;
if (_layerRoot) then {
	_item466 = createVehicle ["Land_vn_o_shelter_02",[6369.32,7145.88,0],[],0,"CAN_COLLIDE"];
	_this = _item466;
	_objects pushback _this;
	_objectIDs pushback 466;
	_this setPosWorld [6369.32,7145.88,47.5564];
	_this setVectorDirAndUp [[-0.535454,0.844564,0],[0,0,1]];
};

private _item467 = objNull;
if (_layerRoot) then {
	_item467 = createVehicle ["Campfire_burning_F",[3531.67,8699.58,0],[],0,"CAN_COLLIDE"];
	_this = _item467;
	_objects pushback _this;
	_objectIDs pushback 467;
	_this setPosWorld [3531.67,8699.58,89.2396];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item468 = objNull;
if (_layerRoot) then {
	_item468 = createVehicle ["vn_flag_pl",[3531.58,8698.15,0],[],0,"CAN_COLLIDE"];
	_this = _item468;
	_objects pushback _this;
	_objectIDs pushback 468;
	_this setPosWorld [3531.58,8698.15,92.9968];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item469 = objNull;
if (_layerRoot) then {
	_item469 = createVehicle ["vn_o_kr_static_h12",[3529.62,8715.02,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item469;
	_objects pushback _this;
	_objectIDs pushback 469;
	_this setPosWorld [3529.62,8715.02,90.5123];
	_this setVectorDirAndUp [[-0.932454,0.361289,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item470 = objNull;
if (_layerRoot) then {
	_item470 = createVehicle ["vn_o_pl_spiderhole_01",[3511.7,8714.12,0],[],0,"CAN_COLLIDE"];
	_this = _item470;
	_objects pushback _this;
	_objectIDs pushback 470;
	_this setPosWorld [3511.7,8714.12,89.2335];
	_this setVectorDirAndUp [[-0.833269,0.552868,0],[0,0,1]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item471 = objNull;
if (_layerRoot) then {
	_item471 = createVehicle ["vn_o_pl_spiderhole_01",[3507.32,8685.53,0],[],0,"CAN_COLLIDE"];
	_this = _item471;
	_objects pushback _this;
	_objectIDs pushback 471;
	_this setPosWorld [3507.32,8685.53,88.8674];
	_this setVectorDirAndUp [[-0.703472,-0.699114,-0.127934],[-0.136705,-0.043545,0.989654]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item472 = objNull;
if (_layerRoot) then {
	_item472 = createVehicle ["vn_o_pl_spiderhole_01",[3546.48,8682.19,0],[],0,"CAN_COLLIDE"];
	_this = _item472;
	_objects pushback _this;
	_objectIDs pushback 472;
	_this setPosWorld [3546.48,8682.19,88.5405];
	_this setVectorDirAndUp [[0.943351,-0.230098,-0.239048],[0.216724,-0.118224,0.969048]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item473 = objNull;
if (_layerRoot) then {
	_item473 = createVehicle ["vn_o_pl_spiderhole_01",[3534.24,8729.71,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item473;
	_objects pushback _this;
	_objectIDs pushback 473;
	_this setPosWorld [3534.24,8729.71,88.9269];
	_this setVectorDirAndUp [[0.00352612,0.997822,-0.0658758],[0.00599983,0.0658539,0.997811]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item474 = objNull;
if (_layerRoot) then {
	_item474 = createVehicle ["vn_flag_pl",[5168.17,10457.3,0],[],0,"CAN_COLLIDE"];
	_this = _item474;
	_objects pushback _this;
	_objectIDs pushback 474;
	_this setPosWorld [5168.17,10457.3,229.662];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item475 = objNull;
if (_layerRoot) then {
	_item475 = createVehicle ["vn_o_pl_spiderhole_01",[5166.12,10475.6,0.105362],[],0,"CAN_COLLIDE"];
	_this = _item475;
	_objects pushback _this;
	_objectIDs pushback 475;
	_this setPosWorld [5166.12,10475.6,227.07];
	_this setVectorDirAndUp [[0.378709,0.924309,-0.0472509],[0.031983,0.0379531,0.998768]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item476 = objNull;
if (_layerRoot) then {
	_item476 = createVehicle ["vn_o_pl_spiderhole_01",[5198.56,10457.2,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item476;
	_objects pushback _this;
	_objectIDs pushback 476;
	_this setPosWorld [5198.56,10457.2,223.84];
	_this setVectorDirAndUp [[0.994544,0.0836082,-0.0623789],[0.0598924,0.0319274,0.997694]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item477 = objNull;
if (_layerRoot) then {
	_item477 = createVehicle ["vn_o_pl_spiderhole_01",[5158.67,10455.4,0],[],0,"CAN_COLLIDE"];
	_this = _item477;
	_objects pushback _this;
	_objectIDs pushback 477;
	_this setPosWorld [5158.67,10455.4,226.01];
	_this setVectorDirAndUp [[0.98016,0.180963,0.0808664],[-0.0658578,-0.0874711,0.993988]];
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;;
};

private _item478 = objNull;
if (_layerRoot) then {
	_item478 = createVehicle ["Campfire_burning_F",[8580.78,8187.06,0.000289917],[],0,"CAN_COLLIDE"];
	_this = _item478;
	_objects pushback _this;
	_objectIDs pushback 478;
	_this setPosWorld [8580.77,8187.06,156.245];
	_this setVectorDirAndUp [[0,0.999982,0.00598982],[-0.0559114,-0.00598045,0.998418]];
};

private _item479 = objNull;
if (_layerRoot) then {
	_item479 = createVehicle ["vn_flag_pl",[8581.75,8186.43,0],[],0,"CAN_COLLIDE"];
	_this = _item479;
	_objects pushback _this;
	_objectIDs pushback 479;
	_this setPosWorld [8581.75,8186.43,160.053];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item480 = objNull;
if (_layerRoot) then {
	_item480 = createVehicle ["vn_flag_pl",[7370.67,8890.13,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item480;
	_objects pushback _this;
	_objectIDs pushback 480;
	_this setPosWorld [7370.67,8890.13,59.1481];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item481 = objNull;
if (_layerRoot) then {
	_item481 = createVehicle ["vn_flag_vc",[5228.88,16866.6,0],[],0,"CAN_COLLIDE"];
	_this = _item481;
	_objects pushback _this;
	_objectIDs pushback 481;
	_this setPosWorld [5228.88,16866.6,104.967];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item482 = objNull;
if (_layerRoot) then {
	_item482 = createVehicle ["vn_flag_pl",[13729.2,793.371,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item482;
	_objects pushback _this;
	_objectIDs pushback 482;
	_this setPosWorld [13729.2,793.371,47.1654];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item483 = objNull;
if (_layerRoot) then {
	_item483 = createVehicle ["Campfire_burning_F",[13731.1,793.373,4.57764e-005],[],0,"CAN_COLLIDE"];
	_this = _item483;
	_objects pushback _this;
	_objectIDs pushback 483;
	_this setPosWorld [13731.1,793.372,43.3416];
	_this setVectorDirAndUp [[0,0.999992,0.00399666],[0.0459512,-0.00399244,0.998936]];
};

private _item484 = objNull;
if (_layerRoot) then {
	_item484 = createVehicle ["vn_flag_pl",[13802.4,1228.96,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item484;
	_objects pushback _this;
	_objectIDs pushback 484;
	_this setPosWorld [13802.4,1228.96,19.3575];
	_this setVectorDirAndUp [[-0.120149,0.992756,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item485 = objNull;
if (_layerRoot) then {
	_item485 = createVehicle ["Campfire_burning_F",[13804.4,1229.2,-0.000172615],[],0,"CAN_COLLIDE"];
	_this = _item485;
	_objects pushback _this;
	_objectIDs pushback 485;
	_this setPosWorld [13804.4,1229.2,15.648];
	_this setVectorDirAndUp [[-0.119693,0.992625,0.0192046],[-0.0219957,-0.0219902,0.999516]];
};

private _item486 = objNull;
if (_layerRoot) then {
	_item486 = createVehicle ["vn_flag_vc",[14118.2,1753.29,0.0114613],[],0,"CAN_COLLIDE"];
	_this = _item486;
	_objects pushback _this;
	_objectIDs pushback 486;
	_this setPosWorld [14118.2,1753.29,23.7023];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item487 = objNull;
if (_layerRoot) then {
	_item487 = createVehicle ["vn_flag_pl",[14743,2629.85,0],[],0,"CAN_COLLIDE"];
	_this = _item487;
	_objects pushback _this;
	_objectIDs pushback 487;
	_this setPosWorld [14743,2629.85,12.1487];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item488 = objNull;
if (_layerRoot) then {
	_item488 = createVehicle ["Campfire_burning_F",[14743.5,2628.03,0],[],0,"CAN_COLLIDE"];
	_this = _item488;
	_objects pushback _this;
	_objectIDs pushback 488;
	_this setPosWorld [14743.5,2628.05,8.54417];
	_this setVectorDirAndUp [[0,0.997418,-0.0718139],[-0.0439577,0.0717445,0.996454]];
};

private _item489 = objNull;
if (_layerRoot) then {
	_item489 = createVehicle ["vn_flag_pl",[14247,2381.38,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item489;
	_objects pushback _this;
	_objectIDs pushback 489;
	_this setPosWorld [14247,2381.38,21.7213];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item490 = objNull;
if (_layerRoot) then {
	_item490 = createVehicle ["Campfire_burning_F",[14245.8,2382.26,-0.000152588],[],0,"CAN_COLLIDE"];
	_this = _item490;
	_objects pushback _this;
	_objectIDs pushback 490;
	_this setPosWorld [14245.8,2382.25,17.9588];
	_this setVectorDirAndUp [[0,0.999872,0.0159975],[-0.0159977,-0.0159955,0.999744]];
};

private _item491 = objNull;
if (_layerRoot) then {
	_item491 = createVehicle ["vn_flag_vc",[16406.6,15802.8,0.0114594],[],0,"CAN_COLLIDE"];
	_this = _item491;
	_objects pushback _this;
	_objectIDs pushback 491;
	_this setPosWorld [16406.6,15802.8,47.5526];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item492 = objNull;
if (_layerRoot) then {
	_item492 = createVehicle ["vn_air_uh1d_01_wreck",[19846,9712.44,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item492;
	_objects pushback _this;
	_objectIDs pushback 492;
	_this setPosWorld [19846.5,9712.66,17.3037];
	_this setVectorDirAndUp [[-0.675356,0.729676,0.107085],[0.271414,0.110902,0.956052]];
	_this enableSimulation false;
	_this allowdamage false;;
};

private _item493 = objNull;
if (_layerRoot) then {
	_item493 = createVehicle ["vn_flag_vc",[19837.2,9714.67,0.0114632],[],0,"CAN_COLLIDE"];
	_this = _item493;
	_objects pushback _this;
	_objectIDs pushback 493;
	_this setPosWorld [19837.2,9714.67,20.6847];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item494 = objNull;
if (_layerRoot) then {
	_item494 = createVehicle ["vn_air_ah1g_01_wreck",[6085.87,13288.8,-0.00446701],[],0,"CAN_COLLIDE"];
	_this = _item494;
	_objects pushback _this;
	_objectIDs pushback 494;
	_this setPosWorld [6086.1,13288.8,59.4637];
	_this setVectorDirAndUp [[-0.319973,-0.947252,0.0182057],[0.121102,-0.0218336,0.9924]];
	_this enableSimulation false;
	_this allowdamage false;;
};

private _item495 = objNull;
if (_layerRoot) then {
	_item495 = createVehicle ["vn_flag_vc",[6089.85,13287.8,-0.0137291],[],0,"CAN_COLLIDE"];
	_this = _item495;
	_objects pushback _this;
	_objectIDs pushback 495;
	_this setPosWorld [6089.85,13287.8,61.1273];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item499 = objNull;
if (_layerRoot) then {
	_item499 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11220.4,14815.5,0],[],0,"CAN_COLLIDE"];
	_this = _item499;
	_objects pushback _this;
	_objectIDs pushback 499;
	_this setPosWorld [11220.4,14815.5,70.8861];
	_this setVectorDirAndUp [[-0.624932,-0.780679,0],[0,0,1]];
	_this allowdamage false;;
};

private _item500 = objNull;
if (_layerRoot) then {
	_item500 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11217.2,14816.9,0],[],0,"CAN_COLLIDE"];
	_this = _item500;
	_objects pushback _this;
	_objectIDs pushback 500;
	_this setPosWorld [11217.2,14816.9,70.8623];
	_this setVectorDirAndUp [[-0.104998,-0.994472,0],[0,0,1]];
	_this allowdamage false;;
};

private _item501 = objNull;
if (_layerRoot) then {
	_item501 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11222.4,14812.5,0],[],0,"CAN_COLLIDE"];
	_this = _item501;
	_objects pushback _this;
	_objectIDs pushback 501;
	_this setPosWorld [11222.4,14812.5,70.8781];
	_this setVectorDirAndUp [[-0.957119,-0.289694,0],[0,0,1]];
	_this allowdamage false;;
};

private _item503 = objNull;
if (_layerRoot) then {
	_item503 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11213.6,14812.7,0.0195999],[],0,"CAN_COLLIDE"];
	_this = _item503;
	_objects pushback _this;
	_objectIDs pushback 503;
	_this setPosWorld [11213.6,14812.7,70.86];
	_this setVectorDirAndUp [[0.949714,0.313119,0],[0,0,1]];
	_this allowdamage false;;
};

private _item504 = objNull;
if (_layerRoot) then {
	_item504 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11215.6,14809.8,0],[],0,"CAN_COLLIDE"];
	_this = _item504;
	_objects pushback _this;
	_objectIDs pushback 504;
	_this setPosWorld [11215.6,14809.8,70.849];
	_this setVectorDirAndUp [[0.605565,0.795796,0],[0,0,1]];
	_this allowdamage false;;
};

private _item505 = objNull;
if (_layerRoot) then {
	_item505 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11218.8,14808.5,0],[],0,"CAN_COLLIDE"];
	_this = _item505;
	_objects pushback _this;
	_objectIDs pushback 505;
	_this setPosWorld [11218.8,14808.5,70.849];
	_this setVectorDirAndUp [[0.0805355,0.996752,0],[0,0,1]];
	_this allowdamage false;;
};

private _item506 = objNull;
if (_layerRoot) then {
	_item506 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11194.2,14841.9,0],[],0,"CAN_COLLIDE"];
	_this = _item506;
	_objects pushback _this;
	_objectIDs pushback 506;
	_this setPosWorld [11194.2,14841.9,70.7434];
	_this setVectorDirAndUp [[-0.76185,-0.647753,0],[0,0,1]];
	_this allowdamage false;;
};

private _item507 = objNull;
if (_layerRoot) then {
	_item507 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11191.3,14843.9,0],[],0,"CAN_COLLIDE"];
	_this = _item507;
	_objects pushback _this;
	_objectIDs pushback 507;
	_this setPosWorld [11191.3,14843.9,70.7398];
	_this setVectorDirAndUp [[-0.291995,-0.95642,0],[0,0,1]];
	_this allowdamage false;;
};

private _item508 = objNull;
if (_layerRoot) then {
	_item508 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11195.5,14838.6,0],[],0,"CAN_COLLIDE"];
	_this = _item508;
	_objects pushback _this;
	_objectIDs pushback 508;
	_this setPosWorld [11195.5,14838.6,70.7477];
	_this setVectorDirAndUp [[-0.994722,-0.102606,0],[0,0,1]];
	_this allowdamage false;;
};

private _item509 = objNull;
if (_layerRoot) then {
	_item509 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11187,14840.5,0.0195999],[],0,"CAN_COLLIDE"];
	_this = _item509;
	_objects pushback _this;
	_objectIDs pushback 509;
	_this setPosWorld [11187,14840.5,70.7404];
	_this setVectorDirAndUp [[0.991901,0.127012,0],[0,0,1]];
	_this allowdamage false;;
};

private _item510 = objNull;
if (_layerRoot) then {
	_item510 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11188.4,14837.2,0],[],0,"CAN_COLLIDE"];
	_this = _item510;
	_objects pushback _this;
	_objectIDs pushback 510;
	_this setPosWorld [11188.4,14837.2,70.7295];
	_this setVectorDirAndUp [[0.745707,0.666274,0],[0,0,1]];
	_this allowdamage false;;
};

private _item511 = objNull;
if (_layerRoot) then {
	_item511 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11191.3,14835.3,0],[],0,"CAN_COLLIDE"];
	_this = _item511;
	_objects pushback _this;
	_objectIDs pushback 511;
	_this setPosWorld [11191.3,14835.3,70.739];
	_this setVectorDirAndUp [[0.268411,0.963305,0],[0,0,1]];
	_this allowdamage false;;
};

private _item512 = objNull;
if (_layerRoot) then {
	_item512 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11222.3,14870.6,0],[],0,"CAN_COLLIDE"];
	_this = _item512;
	_objects pushback _this;
	_objectIDs pushback 512;
	_this setPosWorld [11222.3,14870.6,70.9725];
	_this setVectorDirAndUp [[-0.999056,-0.0434367,0],[0,0,1]];
	_this allowdamage false;;
};

private _item513 = objNull;
if (_layerRoot) then {
	_item513 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11221.2,14873.9,0],[],0,"CAN_COLLIDE"];
	_this = _item513;
	_objects pushback _this;
	_objectIDs pushback 513;
	_this setPosWorld [11221.2,14873.9,70.9657];
	_this setVectorDirAndUp [[-0.817751,-0.575572,0],[0,0,1]];
	_this allowdamage false;;
};

private _item514 = objNull;
if (_layerRoot) then {
	_item514 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11221.3,14867.1,0],[],0,"CAN_COLLIDE"];
	_this = _item514;
	_objects pushback _this;
	_objectIDs pushback 514;
	_this setPosWorld [11221.3,14867.1,70.9891];
	_this setVectorDirAndUp [[-0.848107,0.529825,0],[0,0,1]];
	_this allowdamage false;;
};

private _item515 = objNull;
if (_layerRoot) then {
	_item515 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11215.7,14873.9,0.0195999],[],0,"CAN_COLLIDE"];
	_this = _item515;
	_objects pushback _this;
	_objectIDs pushback 515;
	_this setPosWorld [11215.7,14873.9,70.9162];
	_this setVectorDirAndUp [[0.860867,-0.50883,0],[0,0,1]];
	_this allowdamage false;;
};

private _item516 = objNull;
if (_layerRoot) then {
	_item516 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11214.8,14870.4,0],[],0,"CAN_COLLIDE"];
	_this = _item516;
	_objects pushback _this;
	_objectIDs pushback 516;
	_this setPosWorld [11214.8,14870.4,70.9513];
	_this setVectorDirAndUp [[0.997688,0.0679674,0],[0,0,1]];
	_this allowdamage false;;
};

private _item517 = objNull;
if (_layerRoot) then {
	_item517 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11215.9,14867.1,0],[],0,"CAN_COLLIDE"];
	_this = _item517;
	_objects pushback _this;
	_objectIDs pushback 517;
	_this setPosWorld [11215.9,14867.1,70.9646];
	_this setVectorDirAndUp [[0.803365,0.595488,0],[0,0,1]];
	_this allowdamage false;;
};

private _item518 = objNull;
if (_layerRoot) then {
	_item518 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11192.9,14891.3,0],[],0,"CAN_COLLIDE"];
	_this = _item518;
	_objects pushback _this;
	_objectIDs pushback 518;
	_this setPosWorld [11192.9,14891.3,70.6877];
	_this setVectorDirAndUp [[-0.527976,0.849259,0],[0,0,1]];
	_this allowdamage false;;
};

private _item519 = objNull;
if (_layerRoot) then {
	_item519 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11195.2,14893.8,0],[],0,"CAN_COLLIDE"];
	_this = _item519;
	_objects pushback _this;
	_objectIDs pushback 519;
	_this setPosWorld [11195.2,14893.8,70.7103];
	_this setVectorDirAndUp [[-0.902728,0.430212,0],[0,0,1]];
	_this allowdamage false;;
};

private _item520 = objNull;
if (_layerRoot) then {
	_item520 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11189.4,14890.4,0],[],0,"CAN_COLLIDE"];
	_this = _item520;
	_objects pushback _this;
	_objectIDs pushback 520;
	_this setPosWorld [11189.4,14890.4,70.6552];
	_this setVectorDirAndUp [[0.0456133,0.998959,0],[0,0,1]];
	_this allowdamage false;;
};

private _item521 = objNull;
if (_layerRoot) then {
	_item521 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11192.5,14898.6,0.0195999],[],0,"CAN_COLLIDE"];
	_this = _item521;
	_objects pushback _this;
	_objectIDs pushback 521;
	_this setPosWorld [11192.5,14898.6,70.6924];
	_this setVectorDirAndUp [[-0.0210585,-0.999778,0],[0,0,1]];
	_this allowdamage false;;
};

private _item522 = objNull;
if (_layerRoot) then {
	_item522 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11189.1,14897.7,0],[],0,"CAN_COLLIDE"];
	_this = _item522;
	_objects pushback _this;
	_objectIDs pushback 522;
	_this setPosWorld [11189.1,14897.7,70.6533];
	_this setVectorDirAndUp [[0.548681,-0.836032,0],[0,0,1]];
	_this allowdamage false;;
};

private _item523 = objNull;
if (_layerRoot) then {
	_item523 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11186.8,14895.1,0],[],0,"CAN_COLLIDE"];
	_this = _item523;
	_objects pushback _this;
	_objectIDs pushback 523;
	_this setPosWorld [11186.8,14895.1,70.6396];
	_this setVectorDirAndUp [[0.913024,-0.407905,0],[0,0,1]];
	_this allowdamage false;;
};

private _item524 = objNull;
if (_layerRoot) then {
	_item524 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11220.2,14918.7,0],[],0,"CAN_COLLIDE"];
	_this = _item524;
	_objects pushback _this;
	_objectIDs pushback 524;
	_this setPosWorld [11220.2,14918.7,70.7398];
	_this setVectorDirAndUp [[-0.797111,0.603833,0],[0,0,1]];
	_this allowdamage false;;
};

private _item525 = objNull;
if (_layerRoot) then {
	_item525 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11221.5,14921.9,0],[],0,"CAN_COLLIDE"];
	_this = _item525;
	_objects pushback _this;
	_objectIDs pushback 525;
	_this setPosWorld [11221.5,14921.9,70.7276];
	_this setVectorDirAndUp [[-0.996925,0.0783679,0],[0,0,1]];
	_this allowdamage false;;
};

private _item526 = objNull;
if (_layerRoot) then {
	_item526 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11217.2,14916.6,0],[],0,"CAN_COLLIDE"];
	_this = _item526;
	_objects pushback _this;
	_objectIDs pushback 526;
	_this setPosWorld [11217.2,14916.6,70.7291];
	_this setVectorDirAndUp [[-0.315184,0.949031,0],[0,0,1]];
	_this allowdamage false;;
};

private _item527 = objNull;
if (_layerRoot) then {
	_item527 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11217.3,14925.4,0.0195999],[],0,"CAN_COLLIDE"];
	_this = _item527;
	_objects pushback _this;
	_objectIDs pushback 527;
	_this setPosWorld [11217.3,14925.4,70.6986];
	_this setVectorDirAndUp [[0.338404,-0.941001,0],[0,0,1]];
	_this allowdamage false;;
};

private _item528 = objNull;
if (_layerRoot) then {
	_item528 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11214.4,14923.3,0],[],0,"CAN_COLLIDE"];
	_this = _item528;
	_objects pushback _this;
	_objectIDs pushback 528;
	_this setPosWorld [11214.4,14923.3,70.6759];
	_this setVectorDirAndUp [[0.811705,-0.584068,0],[0,0,1]];
	_this allowdamage false;;
};

private _item529 = objNull;
if (_layerRoot) then {
	_item529 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11213.1,14920.1,0],[],0,"CAN_COLLIDE"];
	_this = _item529;
	_objects pushback _this;
	_objectIDs pushback 529;
	_this setPosWorld [11213.1,14920.1,70.6904];
	_this setVectorDirAndUp [[0.998549,-0.0538528,0],[0,0,1]];
	_this allowdamage false;;
};

private _item530 = objNull;
if (_layerRoot) then {
	_item530 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11170.3,14774.4,0],[],0,"CAN_COLLIDE"];
	_this = _item530;
	_objects pushback _this;
	_objectIDs pushback 530;
	_this setPosWorld [11170.3,14774.4,70.7128];
	_this setVectorDirAndUp [[-0.624932,-0.780679,0],[0,0,1]];
	_this allowdamage false;;
};

private _item531 = objNull;
if (_layerRoot) then {
	_item531 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11167.2,14775.7,0],[],0,"CAN_COLLIDE"];
	_this = _item531;
	_objects pushback _this;
	_objectIDs pushback 531;
	_this setPosWorld [11167.2,14775.7,70.7017];
	_this setVectorDirAndUp [[0.230353,-0.973107,0],[0,0,1]];
	_this allowdamage false;;
};

private _item532 = objNull;
if (_layerRoot) then {
	_item532 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11172.3,14771.3,0],[],0,"CAN_COLLIDE"];
	_this = _item532;
	_objects pushback _this;
	_objectIDs pushback 532;
	_this setPosWorld [11172.3,14771.3,70.7309];
	_this setVectorDirAndUp [[-0.996534,-0.0831857,0],[0,0,1]];
	_this allowdamage false;;
};

private _item533 = objNull;
if (_layerRoot) then {
	_item533 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11164.3,14772.3,0],[],0,"CAN_COLLIDE"];
	_this = _item533;
	_objects pushback _this;
	_objectIDs pushback 533;
	_this setPosWorld [11164.3,14772.3,70.7017];
	_this setVectorDirAndUp [[0.999663,-0.0259428,0],[0,0,1]];
	_this allowdamage false;;
};

private _item534 = objNull;
if (_layerRoot) then {
	_item534 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11166,14769,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item534;
	_objects pushback _this;
	_objectIDs pushback 534;
	_this setPosWorld [11166,14769,70.7152];
	_this setVectorDirAndUp [[0.605565,0.795796,0],[0,0,1]];
	_this allowdamage false;;
};

private _item535 = objNull;
if (_layerRoot) then {
	_item535 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[11169.2,14767.7,0],[],0,"CAN_COLLIDE"];
	_this = _item535;
	_objects pushback _this;
	_objectIDs pushback 535;
	_this setPosWorld [11169.2,14767.7,70.734];
	_this setVectorDirAndUp [[-0.137352,0.990522,0],[0,0,1]];
	_this allowdamage false;;
};

private _item536 = objNull;
if (_layerRoot) then {
	_item536 = createVehicle ["Land_BagFence_Round_F",[11173.7,14806.5,0],[],0,"CAN_COLLIDE"];
	_this = _item536;
	_objects pushback _this;
	_objectIDs pushback 536;
	_this setPosWorld [11173.7,14806.5,70.3591];
	_this setVectorDirAndUp [[0,1,0],[-0.0159977,0,0.999872]];
	_this allowdamage false;;
};

private _item537 = objNull;
if (_layerRoot) then {
	_item537 = createVehicle ["Land_BagFence_Round_F",[11173.8,14810.9,0],[],0,"CAN_COLLIDE"];
	_this = _item537;
	_objects pushback _this;
	_objectIDs pushback 537;
	_this setPosWorld [11173.8,14810.9,70.3594];
	_this setVectorDirAndUp [[0.0865624,-0.996245,0.00138498],[-0.0159977,0,0.999872]];
	_this allowdamage false;;
};

private _item538 = objNull;
if (_layerRoot) then {
	_item538 = createVehicle ["Land_BagFence_Round_F",[11171.5,14808.7,0],[],0,"CAN_COLLIDE"];
	_this = _item538;
	_objects pushback _this;
	_objectIDs pushback 538;
	_this setPosWorld [11171.5,14808.7,70.3233];
	_this setVectorDirAndUp [[0.999407,-0.0304857,0.0159903],[-0.0159977,0,0.999872]];
	_this allowdamage false;;
};

private _item539 = objNull;
if (_layerRoot) then {
	_item539 = createVehicle ["Land_BagFence_Round_F",[11175.9,14808.6,0],[],0,"CAN_COLLIDE"];
	_this = _item539;
	_objects pushback _this;
	_objectIDs pushback 539;
	_this setPosWorld [11175.9,14808.6,70.3793];
	_this setVectorDirAndUp [[-0.998425,-0.0561066,0],[0,0,1]];
	_this allowdamage false;;
};

private _item540 = objNull;
if (_layerRoot) then {
	_item540 = createVehicle ["Land_BagFence_Round_F",[11187.5,14738.9,0],[],0,"CAN_COLLIDE"];
	_this = _item540;
	_objects pushback _this;
	_objectIDs pushback 540;
	_this setPosWorld [11187.5,14738.9,70.6472];
	_this setVectorDirAndUp [[0.999535,-0.0304818,0.000487701],[0,0.0159977,0.999872]];
	_this allowdamage false;;
};

private _item541 = objNull;
if (_layerRoot) then {
	_item541 = createVehicle ["Land_BagFence_Round_F",[11189.8,14741.1,0],[],0,"CAN_COLLIDE"];
	_this = _item541;
	_objects pushback _this;
	_objectIDs pushback 541;
	_this setPosWorld [11189.8,14741.1,70.6229];
	_this setVectorDirAndUp [[0.0865735,-0.996228,0.00597755],[0,0.00600007,0.999982]];
	_this allowdamage false;;
};

private _item542 = objNull;
if (_layerRoot) then {
	_item542 = createVehicle ["Land_BagFence_Round_F",[11191.9,14738.7,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item542;
	_objects pushback _this;
	_objectIDs pushback 542;
	_this setPosWorld [11191.9,14738.7,70.6395];
	_this setVectorDirAndUp [[-0.998425,-0.0561049,0.000448485],[0,0.00799344,0.999968]];
	_this allowdamage false;;
};

private _item543 = objNull;
if (_layerRoot) then {
	_item543 = createVehicle ["Land_BagFence_Round_F",[11189.7,14736.6,0],[],0,"CAN_COLLIDE"];
	_this = _item543;
	_objects pushback _this;
	_objectIDs pushback 543;
	_this setPosWorld [11189.7,14736.6,70.683];
	_this setVectorDirAndUp [[0,0.999872,-0.0159977],[0,0.0159977,0.999872]];
	_this allowdamage false;;
};

private _item544 = objNull;
if (_layerRoot) then {
	_item544 = createVehicle ["Land_BagFence_Long_F",[11197.2,14810.2,0],[],0,"CAN_COLLIDE"];
	_this = _item544;
	_objects pushback _this;
	_objectIDs pushback 544;
	_this setPosWorld [11197.2,14810.2,70.4893];
	_this setVectorDirAndUp [[-0.79551,0.60594,0],[0,0,1]];
	_this allowdamage false;;
};

private _item545 = objNull;
if (_layerRoot) then {
	_item545 = createVehicle ["Land_BagFence_Long_F",[11199.5,14815.6,0],[],0,"CAN_COLLIDE"];
	_this = _item545;
	_objects pushback _this;
	_objectIDs pushback 545;
	_this setPosWorld [11199.5,14815.6,70.4893];
	_this setVectorDirAndUp [[-0.999589,-0.0286521,0],[0,0,1]];
	_this allowdamage false;;
};

private _item546 = objNull;
if (_layerRoot) then {
	_item546 = createVehicle ["Land_BagFence_Long_F",[11196.6,14821,0],[],0,"CAN_COLLIDE"];
	_this = _item546;
	_objects pushback _this;
	_objectIDs pushback 546;
	_this setPosWorld [11196.6,14821,70.4893];
	_this setVectorDirAndUp [[-0.668562,-0.743656,0],[0,0,1]];
	_this allowdamage false;;
};

private _item547 = objNull;
if (_layerRoot) then {
	_item547 = createVehicle ["Land_BagFence_Long_F",[11192.1,14808.6,0],[],0,"CAN_COLLIDE"];
	_this = _item547;
	_objects pushback _this;
	_objectIDs pushback 547;
	_this setPosWorld [11192.1,14808.6,70.4637];
	_this setVectorDirAndUp [[0.0038401,0.999974,0.00602283],[-0.00600007,-0.00599972,0.999964]];
	_this allowdamage false;;
};

private _item548 = objNull;
if (_layerRoot) then {
	_item548 = createVehicle ["Land_BagFence_Long_F",[11185.8,14815,0],[],0,"CAN_COLLIDE"];
	_this = _item548;
	_objects pushback _this;
	_objectIDs pushback 548;
	_this setPosWorld [11185.8,14815,70.4593];
	_this setVectorDirAndUp [[0.99841,0.0563723,0],[0,0,1]];
	_this allowdamage false;;
};

private _item549 = objNull;
if (_layerRoot) then {
	_item549 = createVehicle ["Land_BagFence_Long_F",[11187.8,14810.4,0],[],0,"CAN_COLLIDE"];
	_this = _item549;
	_objects pushback _this;
	_objectIDs pushback 549;
	_this setPosWorld [11187.8,14810.4,70.4408];
	_this setVectorDirAndUp [[0.668244,0.743808,0.0141223],[-0.0100007,-0.00999986,0.9999]];
	_this allowdamage false;;
};

private _item550 = objNull;
if (_layerRoot) then {
	_item550 = createVehicle ["Land_BagFence_Long_F",[11187.7,14820.5,0],[],0,"CAN_COLLIDE"];
	_this = _item550;
	_objects pushback _this;
	_objectIDs pushback 550;
	_this setPosWorld [11187.7,14820.5,70.4755];
	_this setVectorDirAndUp [[0.739295,-0.673368,0.0044359],[-0.00600007,0,0.999982]];
	_this allowdamage false;;
};

private _item551 = objNull;
if (_layerRoot) then {
	_item551 = createVehicle ["Land_BagFence_Long_F",[11192.1,14822.3,0],[],0,"CAN_COLLIDE"];
	_this = _item551;
	_objects pushback _this;
	_objectIDs pushback 551;
	_this setPosWorld [11192.1,14822.3,70.4893];
	_this setVectorDirAndUp [[0.124343,-0.992239,0],[0,0,1]];
	_this allowdamage false;;
};

private _item552 = objNull;
if (_layerRoot) then {
	_item552 = createVehicle ["Land_BagFence_Long_F",[11211.2,14832.2,0],[],0,"CAN_COLLIDE"];
	_this = _item552;
	_objects pushback _this;
	_objectIDs pushback 552;
	_this setPosWorld [11211.2,14832.2,70.6392];
	_this setVectorDirAndUp [[0.668256,0.743912,0.00534184],[-0.00799344,0,0.999968]];
	_this allowdamage false;;
};

private _item553 = objNull;
if (_layerRoot) then {
	_item553 = createVehicle ["Land_BagFence_Long_F",[11209.2,14836.8,0],[],0,"CAN_COLLIDE"];
	_this = _item553;
	_objects pushback _this;
	_objectIDs pushback 553;
	_this setPosWorld [11209.2,14836.8,70.6331];
	_this setVectorDirAndUp [[0.998312,0.0562587,0.014423],[-0.0139947,-0.00799981,0.99987]];
	_this allowdamage false;;
};

private _item554 = objNull;
if (_layerRoot) then {
	_item554 = createVehicle ["Land_BagFence_Long_F",[11211.2,14842.3,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item554;
	_objects pushback _this;
	_objectIDs pushback 554;
	_this setPosWorld [11211.2,14842.3,70.697];
	_this setVectorDirAndUp [[0.739284,-0.673393,0.000527599],[-0.0080009,-0.00800033,0.999936]];
	_this allowdamage false;;
};

private _item555 = objNull;
if (_layerRoot) then {
	_item555 = createVehicle ["Land_BagFence_Long_F",[11215.6,14844.1,0],[],0,"CAN_COLLIDE"];
	_this = _item555;
	_objects pushback _this;
	_objectIDs pushback 555;
	_this setPosWorld [11215.6,14844.1,70.7429];
	_this setVectorDirAndUp [[0.124327,-0.992233,-0.0039641],[-0.0159977,-0.00599906,0.999854]];
	_this allowdamage false;;
};

private _item556 = objNull;
if (_layerRoot) then {
	_item556 = createVehicle ["Land_BagFence_Long_F",[11220,14842.8,0],[],0,"CAN_COLLIDE"];
	_this = _item556;
	_objects pushback _this;
	_objectIDs pushback 556;
	_this setPosWorld [11220,14842.8,70.7896];
	_this setVectorDirAndUp [[-0.66855,-0.743656,-0.00401142],[-0.00600007,0,0.999982]];
	_this allowdamage false;;
};

private _item557 = objNull;
if (_layerRoot) then {
	_item557 = createVehicle ["Land_BagFence_Long_F",[11223,14837.4,0],[],0,"CAN_COLLIDE"];
	_this = _item557;
	_objects pushback _this;
	_objectIDs pushback 557;
	_this setPosWorld [11223,14837.4,70.7918];
	_this setVectorDirAndUp [[-0.999571,-0.0286156,-0.00616941],[-0.00600007,-0.00599972,0.999964]];
	_this allowdamage false;;
};

private _item558 = objNull;
if (_layerRoot) then {
	_item558 = createVehicle ["Land_BagFence_Long_F",[11220.7,14832,0],[],0,"CAN_COLLIDE"];
	_this = _item558;
	_objects pushback _this;
	_objectIDs pushback 558;
	_this setPosWorld [11220.7,14832,70.7252];
	_this setVectorDirAndUp [[-0.795496,0.605958,-0.00113749],[-0.00600007,-0.00599972,0.999964]];
	_this allowdamage false;;
};

private _item559 = objNull;
if (_layerRoot) then {
	_item559 = createVehicle ["Land_BagFence_Long_F",[11215.6,14830.4,0],[],0,"CAN_COLLIDE"];
	_this = _item559;
	_objects pushback _this;
	_objectIDs pushback 559;
	_this setPosWorld [11215.6,14830.4,70.6772];
	_this setVectorDirAndUp [[0.00384005,0.99996,0.00803126],[-0.0080009,-0.00800033,0.999936]];
	_this allowdamage false;;
};

private _item560 = objNull;
if (_layerRoot) then {
	_item560 = createVehicle ["Land_BagFence_Long_F",[11210.8,14890.6,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item560;
	_objects pushback _this;
	_objectIDs pushback 560;
	_this setPosWorld [11210.8,14890.6,70.5187];
	_this setVectorDirAndUp [[0.66823,0.743912,0.00801932],[-0.012,0,0.999928]];
	_this allowdamage false;;
};

private _item561 = objNull;
if (_layerRoot) then {
	_item561 = createVehicle ["Land_BagFence_Long_F",[11208.8,14895.3,0],[],0,"CAN_COLLIDE"];
	_this = _item561;
	_objects pushback _this;
	_objectIDs pushback 561;
	_this setPosWorld [11208.8,14895.3,70.5044];
	_this setVectorDirAndUp [[0.998402,0.0563723,0.00399039],[-0.00399675,0,0.999992]];
	_this allowdamage false;;
};

private _item562 = objNull;
if (_layerRoot) then {
	_item562 = createVehicle ["Land_BagFence_Long_F",[11210.7,14900.8,0],[],0,"CAN_COLLIDE"];
	_this = _item562;
	_objects pushback _this;
	_objectIDs pushback 562;
	_this setPosWorld [11210.7,14900.8,70.4921];
	_this setVectorDirAndUp [[0.739302,-0.673368,0.00295483],[-0.00399675,0,0.999992]];
	_this allowdamage false;;
};

private _item563 = objNull;
if (_layerRoot) then {
	_item563 = createVehicle ["Land_BagFence_Long_F",[11215.1,14902.5,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item563;
	_objects pushback _this;
	_objectIDs pushback 563;
	_this setPosWorld [11215.1,14902.5,70.5106];
	_this setVectorDirAndUp [[0.124334,-0.992239,0.00149212],[-0.012,0,0.999928]];
	_this allowdamage false;;
};

private _item564 = objNull;
if (_layerRoot) then {
	_item564 = createVehicle ["Land_BagFence_Long_F",[11219.6,14901.3,0],[],0,"CAN_COLLIDE"];
	_this = _item564;
	_objects pushback _this;
	_objectIDs pushback 564;
	_this setPosWorld [11219.6,14901.3,70.5643];
	_this setVectorDirAndUp [[-0.668514,-0.743656,-0.00802273],[-0.012,0,0.999928]];
	_this allowdamage false;;
};

private _item565 = objNull;
if (_layerRoot) then {
	_item565 = createVehicle ["Land_BagFence_Long_F",[11222.5,14895.9,0],[],0,"CAN_COLLIDE"];
	_this = _item565;
	_objects pushback _this;
	_objectIDs pushback 565;
	_this setPosWorld [11222.5,14895.9,70.5941];
	_this setVectorDirAndUp [[-0.999589,-0.0286516,0.000171915],[0,0.00600007,0.999982]];
	_this allowdamage false;;
};

private _item566 = objNull;
if (_layerRoot) then {
	_item566 = createVehicle ["Land_BagFence_Long_F",[11220.2,14890.4,0],[],0,"CAN_COLLIDE"];
	_this = _item566;
	_objects pushback _this;
	_objectIDs pushback 566;
	_this setPosWorld [11220.2,14890.4,70.5993];
	_this setVectorDirAndUp [[-0.79551,0.60594,0],[0,0,1]];
	_this allowdamage false;;
};

private _item567 = objNull;
if (_layerRoot) then {
	_item567 = createVehicle ["Land_BagFence_Long_F",[11215.1,14888.9,0],[],0,"CAN_COLLIDE"];
	_this = _item567;
	_objects pushback _this;
	_objectIDs pushback 567;
	_this setPosWorld [11215.1,14888.9,70.5762];
	_this setVectorDirAndUp [[0.00384017,0.999975,-0.00600003],[0,0.00600007,0.999982]];
	_this allowdamage false;;
};

private _item568 = objNull;
if (_layerRoot) then {
	_item568 = createVehicle ["Land_BagFence_Long_F",[11189.1,14913.3,0],[],0,"CAN_COLLIDE"];
	_this = _item568;
	_objects pushback _this;
	_objectIDs pushback 568;
	_this setPosWorld [11189.1,14913.3,70.4793];
	_this setVectorDirAndUp [[0.668278,0.743899,0.00446335],[0,-0.00599983,0.999982]];
	_this allowdamage false;;
};

private _item569 = objNull;
if (_layerRoot) then {
	_item569 = createVehicle ["Land_BagFence_Long_F",[11187.1,14918,0],[],0,"CAN_COLLIDE"];
	_this = _item569;
	_objects pushback _this;
	_objectIDs pushback 569;
	_this setPosWorld [11187.1,14918,70.4893];
	_this setVectorDirAndUp [[0.99841,0.0563723,0],[0,0,1]];
	_this allowdamage false;;
};

private _item570 = objNull;
if (_layerRoot) then {
	_item570 = createVehicle ["Land_BagFence_Long_F",[11189,14923.5,0],[],0,"CAN_COLLIDE"];
	_this = _item570;
	_objects pushback _this;
	_objectIDs pushback 570;
	_this setPosWorld [11189,14923.5,70.4893];
	_this setVectorDirAndUp [[0.739308,-0.673368,0],[0,0,1]];
	_this allowdamage false;;
};

private _item571 = objNull;
if (_layerRoot) then {
	_item571 = createVehicle ["Land_BagFence_Long_F",[11193.5,14925.2,0],[],0,"CAN_COLLIDE"];
	_this = _item571;
	_objects pushback _this;
	_objectIDs pushback 571;
	_this setPosWorld [11193.5,14925.2,70.4893];
	_this setVectorDirAndUp [[0.124343,-0.992239,0],[0,0,1]];
	_this allowdamage false;;
};

private _item572 = objNull;
if (_layerRoot) then {
	_item572 = createVehicle ["Land_BagFence_Long_F",[11197.9,14924,0],[],0,"CAN_COLLIDE"];
	_this = _item572;
	_objects pushback _this;
	_objectIDs pushback 572;
	_this setPosWorld [11197.9,14924,70.4717];
	_this setVectorDirAndUp [[-0.66855,-0.743656,0.00401126],[0.00599983,0,0.999982]];
	_this allowdamage false;;
};

private _item573 = objNull;
if (_layerRoot) then {
	_item573 = createVehicle ["Land_BagFence_Long_F",[11200.9,14918.6,0],[],0,"CAN_COLLIDE"];
	_this = _item573;
	_objects pushback _this;
	_objectIDs pushback 573;
	_this setPosWorld [11200.9,14918.6,70.445];
	_this setVectorDirAndUp [[-0.999589,-0.0286506,-0.000286367],[0,-0.00999464,0.99995]];
	_this allowdamage false;;
};

private _item574 = objNull;
if (_layerRoot) then {
	_item574 = createVehicle ["Land_BagFence_Long_F",[11198.6,14913.1,0],[],0,"CAN_COLLIDE"];
	_this = _item574;
	_objects pushback _this;
	_objectIDs pushback 574;
	_this setPosWorld [11198.6,14913.1,70.4324];
	_this setVectorDirAndUp [[-0.795408,0.60594,0.0127262],[0.0159975,0,0.999872]];
	_this allowdamage false;;
};

private _item575 = objNull;
if (_layerRoot) then {
	_item575 = createVehicle ["Land_BagFence_Long_F",[11193.5,14911.6,0.0899048],[],0,"CAN_COLLIDE"];
	_this = _item575;
	_objects pushback _this;
	_objectIDs pushback 575;
	_this setPosWorld [11193.5,14911.6,70.5241];
	_this setVectorDirAndUp [[0.00384017,0.999865,0.0159974],[0,-0.0159975,0.999872]];
	_this allowdamage false;;
};


///////////////////////////////////////////////////////////////////////////////////////////
// Triggers
private _triggers = [];
private _triggerIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Group attributes (applied only once group units exist)


///////////////////////////////////////////////////////////////////////////////////////////
// Waypoints
private _waypoints = [];
private _waypointIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Logics
private _logics = [];
private _logicIDs = [];


///////////////////////////////////////////////////////////////////////////////////////////
// Layers


///////////////////////////////////////////////////////////////////////////////////////////
// Crews


///////////////////////////////////////////////////////////////////////////////////////////
// Vehicle cargo


///////////////////////////////////////////////////////////////////////////////////////////
// Connections


///////////////////////////////////////////////////////////////////////////////////////////
// Inits (executed only once all entities exist; isNil used to ensure non-scheduled environment)
isNil {
	if !(isnull _item0) then {
		this = _item0;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item1) then {
		this = _item1;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item3) then {
		this = _item3;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item6) then {
		this = _item6;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item7) then {
		this = _item7;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item8) then {
		this = _item8;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item16) then {
		this = _item16;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item20) then {
		this = _item20;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item21) then {
		this = _item21;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item24) then {
		this = _item24;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item25) then {
		this = _item25;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item26) then {
		this = _item26;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item27) then {
		this = _item27;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item29) then {
		this = _item29;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item30) then {
		this = _item30;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item35) then {
		this = _item35;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item37) then {
		this = _item37;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item41) then {
		this = _item41;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item42) then {
		this = _item42;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item43) then {
		this = _item43;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item44) then {
		this = _item44;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item45) then {
		this = _item45;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item46) then {
		this = _item46;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item47) then {
		this = _item47;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item49) then {
		this = _item49;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item50) then {
		this = _item50;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item51) then {
		this = _item51;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item52) then {
		this = _item52;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item53) then {
		this = _item53;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item54) then {
		this = _item54;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item56) then {
		this = _item56;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item57) then {
		this = _item57;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item58) then {
		this = _item58;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item59) then {
		this = _item59;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item60) then {
		this = _item60;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item61) then {
		this = _item61;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item62) then {
		this = _item62;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item63) then {
		this = _item63;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item64) then {
		this = _item64;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item65) then {
		this = _item65;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item66) then {
		this = _item66;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item67) then {
		this = _item67;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item68) then {
		this = _item68;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item69) then {
		this = _item69;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item70) then {
		this = _item70;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item71) then {
		this = _item71;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item72) then {
		this = _item72;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item73) then {
		this = _item73;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item74) then {
		this = _item74;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item75) then {
		this = _item75;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item76) then {
		this = _item76;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item77) then {
		this = _item77;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item78) then {
		this = _item78;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item79) then {
		this = _item79;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item80) then {
		this = _item80;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item81) then {
		this = _item81;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item82) then {
		this = _item82;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item84) then {
		this = _item84;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item85) then {
		this = _item85;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item86) then {
		this = _item86;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item87) then {
		this = _item87;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item88) then {
		this = _item88;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item89) then {
		this = _item89;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item90) then {
		this = _item90;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item91) then {
		this = _item91;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item92) then {
		this = _item92;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item93) then {
		this = _item93;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item94) then {
		this = _item94;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item95) then {
		this = _item95;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item96) then {
		this = _item96;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item97) then {
		this = _item97;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item98) then {
		this = _item98;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item99) then {
		this = _item99;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item103) then {
		this = _item103;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item104) then {
		this = _item104;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item105) then {
		this = _item105;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item106) then {
		this = _item106;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item107) then {
		this = _item107;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item108) then {
		this = _item108;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item109) then {
		this = _item109;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item110) then {
		this = _item110;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item111) then {
		this = _item111;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item112) then {
		this = _item112;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item113) then {
		this = _item113;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item114) then {
		this = _item114;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item115) then {
		this = _item115;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item116) then {
		this = _item116;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item117) then {
		this = _item117;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item118) then {
		this = _item118;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item119) then {
		this = _item119;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item120) then {
		this = _item120;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item121) then {
		this = _item121;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item122) then {
		this = _item122;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item123) then {
		this = _item123;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item124) then {
		this = _item124;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item125) then {
		this = _item125;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item126) then {
		this = _item126;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item127) then {
		this = _item127;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item128) then {
		this = _item128;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item130) then {
		this = _item130;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item131) then {
		this = _item131;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item132) then {
		this = _item132;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item133) then {
		this = _item133;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item134) then {
		this = _item134;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item135) then {
		this = _item135;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item136) then {
		this = _item136;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item137) then {
		this = _item137;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item138) then {
		this = _item138;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item139) then {
		this = _item139;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item140) then {
		this = _item140;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item141) then {
		this = _item141;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item142) then {
		this = _item142;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item143) then {
		this = _item143;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item144) then {
		this = _item144;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item145) then {
		this = _item145;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item146) then {
		this = _item146;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item147) then {
		this = _item147;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item148) then {
		this = _item148;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item149) then {
		this = _item149;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item150) then {
		this = _item150;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item151) then {
		this = _item151;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item152) then {
		this = _item152;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item153) then {
		this = _item153;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item154) then {
		this = _item154;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item155) then {
		this = _item155;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item156) then {
		this = _item156;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item157) then {
		this = _item157;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item158) then {
		this = _item158;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item159) then {
		this = _item159;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item160) then {
		this = _item160;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item161) then {
		this = _item161;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item162) then {
		this = _item162;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item163) then {
		this = _item163;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item164) then {
		this = _item164;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item165) then {
		this = _item165;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item166) then {
		this = _item166;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item167) then {
		this = _item167;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item168) then {
		this = _item168;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item169) then {
		this = _item169;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item170) then {
		this = _item170;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item171) then {
		this = _item171;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item172) then {
		this = _item172;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item173) then {
		this = _item173;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item174) then {
		this = _item174;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item175) then {
		this = _item175;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item176) then {
		this = _item176;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item177) then {
		this = _item177;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item178) then {
		this = _item178;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item179) then {
		this = _item179;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item180) then {
		this = _item180;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item181) then {
		this = _item181;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item182) then {
		this = _item182;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item183) then {
		this = _item183;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item184) then {
		this = _item184;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item185) then {
		this = _item185;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item186) then {
		this = _item186;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item187) then {
		this = _item187;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item188) then {
		this = _item188;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item189) then {
		this = _item189;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item190) then {
		this = _item190;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item191) then {
		this = _item191;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item192) then {
		this = _item192;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item193) then {
		this = _item193;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item194) then {
		this = _item194;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item195) then {
		this = _item195;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item196) then {
		this = _item196;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item197) then {
		this = _item197;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item198) then {
		this = _item198;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item199) then {
		this = _item199;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item200) then {
		this = _item200;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item201) then {
		this = _item201;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item202) then {
		this = _item202;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item203) then {
		this = _item203;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item204) then {
		this = _item204;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item205) then {
		this = _item205;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item206) then {
		this = _item206;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item207) then {
		this = _item207;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item208) then {
		this = _item208;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item209) then {
		this = _item209;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item210) then {
		this = _item210;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item211) then {
		this = _item211;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item212) then {
		this = _item212;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item213) then {
		this = _item213;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item214) then {
		this = _item214;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item215) then {
		this = _item215;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item216) then {
		this = _item216;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item217) then {
		this = _item217;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item218) then {
		this = _item218;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item219) then {
		this = _item219;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item220) then {
		this = _item220;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item221) then {
		this = _item221;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item222) then {
		this = _item222;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item223) then {
		this = _item223;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item224) then {
		this = _item224;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item225) then {
		this = _item225;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item226) then {
		this = _item226;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item228) then {
		this = _item228;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item229) then {
		this = _item229;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item230) then {
		this = _item230;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item231) then {
		this = _item231;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item233) then {
		this = _item233;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item234) then {
		this = _item234;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item235) then {
		this = _item235;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item236) then {
		this = _item236;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item237) then {
		this = _item237;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item238) then {
		this = _item238;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item239) then {
		this = _item239;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item240) then {
		this = _item240;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item241) then {
		this = _item241;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item242) then {
		this = _item242;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item243) then {
		this = _item243;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item244) then {
		this = _item244;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item245) then {
		this = _item245;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item246) then {
		this = _item246;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item247) then {
		this = _item247;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item248) then {
		this = _item248;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item249) then {
		this = _item249;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item250) then {
		this = _item250;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item251) then {
		this = _item251;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item252) then {
		this = _item252;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item253) then {
		this = _item253;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item254) then {
		this = _item254;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item255) then {
		this = _item255;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item256) then {
		this = _item256;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item257) then {
		this = _item257;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item258) then {
		this = _item258;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item259) then {
		this = _item259;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item260) then {
		this = _item260;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item261) then {
		this = _item261;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item262) then {
		this = _item262;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item263) then {
		this = _item263;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item265) then {
		this = _item265;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item266) then {
		this = _item266;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item267) then {
		this = _item267;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item268) then {
		this = _item268;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item269) then {
		this = _item269;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item272) then {
		this = _item272;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item273) then {
		this = _item273;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item274) then {
		this = _item274;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item275) then {
		this = _item275;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item276) then {
		this = _item276;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item277) then {
		this = _item277;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item278) then {
		this = _item278;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item279) then {
		this = _item279;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item280) then {
		this = _item280;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item281) then {
		this = _item281;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item282) then {
		this = _item282;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item284) then {
		this = _item284;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item285) then {
		this = _item285;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item286) then {
		this = _item286;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item287) then {
		this = _item287;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item288) then {
		this = _item288;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item289) then {
		this = _item289;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item290) then {
		this = _item290;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item291) then {
		this = _item291;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item292) then {
		this = _item292;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item293) then {
		this = _item293;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item294) then {
		this = _item294;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item295) then {
		this = _item295;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item296) then {
		this = _item296;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item297) then {
		this = _item297;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item298) then {
		this = _item298;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item299) then {
		this = _item299;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item300) then {
		this = _item300;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item301) then {
		this = _item301;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item302) then {
		this = _item302;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item303) then {
		this = _item303;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item304) then {
		this = _item304;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item305) then {
		this = _item305;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item306) then {
		this = _item306;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item307) then {
		this = _item307;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item308) then {
		this = _item308;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item309) then {
		this = _item309;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item310) then {
		this = _item310;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item311) then {
		this = _item311;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item312) then {
		this = _item312;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item313) then {
		this = _item313;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item314) then {
		this = _item314;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item315) then {
		this = _item315;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item316) then {
		this = _item316;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item317) then {
		this = _item317;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item318) then {
		this = _item318;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item319) then {
		this = _item319;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item320) then {
		this = _item320;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item321) then {
		this = _item321;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item322) then {
		this = _item322;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item323) then {
		this = _item323;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item324) then {
		this = _item324;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item325) then {
		this = _item325;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item326) then {
		this = _item326;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item327) then {
		this = _item327;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item328) then {
		this = _item328;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item329) then {
		this = _item329;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item330) then {
		this = _item330;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item331) then {
		this = _item331;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item332) then {
		this = _item332;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item333) then {
		this = _item333;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item334) then {
		this = _item334;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item335) then {
		this = _item335;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item336) then {
		this = _item336;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item337) then {
		this = _item337;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item338) then {
		this = _item338;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item340) then {
		this = _item340;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item341) then {
		this = _item341;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item342) then {
		this = _item342;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item343) then {
		this = _item343;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item344) then {
		this = _item344;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item345) then {
		this = _item345;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item346) then {
		this = _item346;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item347) then {
		this = _item347;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item348) then {
		this = _item348;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item349) then {
		this = _item349;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item350) then {
		this = _item350;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item351) then {
		this = _item351;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item352) then {
		this = _item352;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item353) then {
		this = _item353;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item354) then {
		this = _item354;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item355) then {
		this = _item355;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item356) then {
		this = _item356;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item357) then {
		this = _item357;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item358) then {
		this = _item358;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item359) then {
		this = _item359;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item360) then {
		this = _item360;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item361) then {
		this = _item361;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item362) then {
		this = _item362;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item363) then {
		this = _item363;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item364) then {
		this = _item364;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item365) then {
		this = _item365;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item366) then {
		this = _item366;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item367) then {
		this = _item367;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item368) then {
		this = _item368;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item369) then {
		this = _item369;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item370) then {
		this = _item370;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item372) then {
		this = _item372;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item373) then {
		this = _item373;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item374) then {
		this = _item374;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item375) then {
		this = _item375;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item376) then {
		this = _item376;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item377) then {
		this = _item377;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item378) then {
		this = _item378;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item379) then {
		this = _item379;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item380) then {
		this = _item380;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item381) then {
		this = _item381;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item382) then {
		this = _item382;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item383) then {
		this = _item383;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item384) then {
		this = _item384;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item385) then {
		this = _item385;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item386) then {
		this = _item386;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item387) then {
		this = _item387;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item388) then {
		this = _item388;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item389) then {
		this = _item389;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item390) then {
		this = _item390;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item391) then {
		this = _item391;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item392) then {
		this = _item392;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item393) then {
		this = _item393;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item394) then {
		this = _item394;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item395) then {
		this = _item395;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item396) then {
		this = _item396;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item397) then {
		this = _item397;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item398) then {
		this = _item398;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item399) then {
		this = _item399;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item400) then {
		this = _item400;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item401) then {
		this = _item401;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item402) then {
		this = _item402;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item403) then {
		this = _item403;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item404) then {
		this = _item404;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item405) then {
		this = _item405;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item406) then {
		this = _item406;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item407) then {
		this = _item407;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item408) then {
		this = _item408;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item409) then {
		this = _item409;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item411) then {
		this = _item411;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item412) then {
		this = _item412;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item413) then {
		this = _item413;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item414) then {
		this = _item414;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item415) then {
		this = _item415;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item416) then {
		this = _item416;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item417) then {
		this = _item417;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item418) then {
		this = _item418;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item419) then {
		this = _item419;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item420) then {
		this = _item420;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item421) then {
		this = _item421;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item423) then {
		this = _item423;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item424) then {
		this = _item424;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item427) then {
		this = _item427;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item428) then {
		this = _item428;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item429) then {
		this = _item429;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item430) then {
		this = _item430;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item431) then {
		this = _item431;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item432) then {
		this = _item432;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item434) then {
		this = _item434;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item435) then {
		this = _item435;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item436) then {
		this = _item436;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item437) then {
		this = _item437;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item438) then {
		this = _item438;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item439) then {
		this = _item439;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item440) then {
		this = _item440;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item441) then {
		this = _item441;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item442) then {
		this = _item442;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item443) then {
		this = _item443;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item444) then {
		this = _item444;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item445) then {
		this = _item445;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item447) then {
		this = _item447;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item448) then {
		this = _item448;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item449) then {
		this = _item449;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item450) then {
		this = _item450;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item451) then {
		this = _item451;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item452) then {
		this = _item452;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item453) then {
		this = _item453;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item454) then {
		this = _item454;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item455) then {
		this = _item455;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item456) then {
		this = _item456;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item457) then {
		this = _item457;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item458) then {
		this = _item458;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item459) then {
		this = _item459;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item460) then {
		this = _item460;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item461) then {
		this = _item461;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item462) then {
		this = _item462;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item463) then {
		this = _item463;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item464) then {
		this = _item464;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item466) then {
		this = _item466;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item467) then {
		this = _item467;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item468) then {
		this = _item468;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item469) then {
		this = _item469;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item470) then {
		this = _item470;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item471) then {
		this = _item471;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item472) then {
		this = _item472;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item473) then {
		this = _item473;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item474) then {
		this = _item474;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item475) then {
		this = _item475;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item476) then {
		this = _item476;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item477) then {
		this = _item477;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 2;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item478) then {
		this = _item478;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item479) then {
		this = _item479;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item480) then {
		this = _item480;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item481) then {
		this = _item481;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item482) then {
		this = _item482;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item483) then {
		this = _item483;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item484) then {
		this = _item484;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item485) then {
		this = _item485;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item486) then {
		this = _item486;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item487) then {
		this = _item487;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item488) then {
		this = _item488;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item489) then {
		this = _item489;
		WMS_AMS_StaticPos_2 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item490) then {
		this = _item490;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item491) then {
		this = _item491;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item492) then {
		this = _item492;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item493) then {
		this = _item493;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item494) then {
		this = _item494;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item495) then {
		this = _item495;
		WMS_AMS_StaticPos_1 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item499) then {
		this = _item499;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item500) then {
		this = _item500;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item501) then {
		this = _item501;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item503) then {
		this = _item503;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item504) then {
		this = _item504;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item505) then {
		this = _item505;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item506) then {
		this = _item506;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item507) then {
		this = _item507;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item508) then {
		this = _item508;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item509) then {
		this = _item509;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item510) then {
		this = _item510;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item511) then {
		this = _item511;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item512) then {
		this = _item512;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item513) then {
		this = _item513;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item514) then {
		this = _item514;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item515) then {
		this = _item515;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item516) then {
		this = _item516;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item517) then {
		this = _item517;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item518) then {
		this = _item518;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item519) then {
		this = _item519;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item520) then {
		this = _item520;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item521) then {
		this = _item521;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item522) then {
		this = _item522;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item523) then {
		this = _item523;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item524) then {
		this = _item524;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item525) then {
		this = _item525;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item526) then {
		this = _item526;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item527) then {
		this = _item527;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item528) then {
		this = _item528;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item529) then {
		this = _item529;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item530) then {
		this = _item530;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item531) then {
		this = _item531;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item532) then {
		this = _item532;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item533) then {
		this = _item533;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item534) then {
		this = _item534;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item535) then {
		this = _item535;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item536) then {
		this = _item536;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item537) then {
		this = _item537;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item538) then {
		this = _item538;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item539) then {
		this = _item539;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item540) then {
		this = _item540;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item541) then {
		this = _item541;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item542) then {
		this = _item542;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item543) then {
		this = _item543;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item544) then {
		this = _item544;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item545) then {
		this = _item545;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item546) then {
		this = _item546;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item547) then {
		this = _item547;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item548) then {
		this = _item548;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item549) then {
		this = _item549;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item550) then {
		this = _item550;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item551) then {
		this = _item551;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item552) then {
		this = _item552;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item553) then {
		this = _item553;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item554) then {
		this = _item554;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item555) then {
		this = _item555;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item556) then {
		this = _item556;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item557) then {
		this = _item557;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item558) then {
		this = _item558;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item559) then {
		this = _item559;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item560) then {
		this = _item560;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item561) then {
		this = _item561;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item562) then {
		this = _item562;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item563) then {
		this = _item563;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item564) then {
		this = _item564;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item565) then {
		this = _item565;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item566) then {
		this = _item566;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item567) then {
		this = _item567;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item568) then {
		this = _item568;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item569) then {
		this = _item569;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item570) then {
		this = _item570;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item571) then {
		this = _item571;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item572) then {
		this = _item572;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item573) then {
		this = _item573;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item574) then {
		this = _item574;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item575) then {
		this = _item575;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
};
if (true) then {diag_log format ["[AMS_StaticMissionsObj_Cam_lao_Nam]|WAK|TNA|WMS|SPAWNED serverTime = %1", serverTime]};