// Export of 'AMS_StaticMission_SOG_Special.Altis' by {|||TNA|||} WAKeupneo on v0.9

if (true) then {diag_log format ["[AMS_StaticMissionsObj_Altis_SOG.sqf]|WAK|TNA|WMS|SPAWNING serverTime = %1", serverTime]};
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
	_item0 = createVehicle ["vn_flag_pavn",[23939,17509.2,0],[],0,"CAN_COLLIDE"];
	_this = _item0;
	_objects pushback _this;
	_objectIDs pushback 0;
	_this setPosWorld [23939,17509.2,7.1668];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item1 = objNull;
if (_layerRoot) then {
	_item1 = createVehicle ["vn_o_kr_static_zgu1_01",[23896.2,17493.6,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item1;
	_objects pushback _this;
	_objectIDs pushback 1;
	_this setPosWorld [23896.2,17493.6,4.67485];
	_this setVectorDirAndUp [[0.528014,-0.849236,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item2 = objNull;
if (_layerRoot) then {
	_item2 = createVehicle ["vn_o_pl_static_zpu4",[24019.8,17561.3,-2.55108e-005],[],0,"CAN_COLLIDE"];
	_this = _item2;
	_objects pushback _this;
	_objectIDs pushback 2;
	_this setPosWorld [24019.8,17561.3,4.73869];
	_this setVectorDirAndUp [[0.835504,-0.549445,-0.00664641],[0.00532655,-0.00399661,0.999978]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item3 = objNull;
if (_layerRoot) then {
	_item3 = createVehicle ["vn_o_pl_static_d44_01",[23968.4,17529.1,0],[],0,"CAN_COLLIDE"];
	_this = _item3;
	_objects pushback _this;
	_objectIDs pushback 3;
	_this setPosWorld [23968.4,17529.1,3.19061];
	_this setVectorDirAndUp [[0.850287,-0.52632,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item4 = objNull;
if (_layerRoot) then {
	_item4 = createVehicle ["vn_o_pl_static_mortar_type53",[23927.1,17506.7,0],[],0,"CAN_COLLIDE"];
	_this = _item4;
	_objects pushback _this;
	_objectIDs pushback 4;
	_this setPosWorld [23927.1,17506.7,4.17861];
	_this setVectorDirAndUp [[0.999985,-0.0054269,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item5 = objNull;
if (_layerRoot) then {
	_item5 = createVehicle ["vn_o_nva_navy_static_v11m",[23987.8,17513.1,-7.24792e-005],[],0,"CAN_COLLIDE"];
	_this = _item5;
	_objects pushback _this;
	_objectIDs pushback 5;
	_this setPosWorld [23987.8,17513.1,4.93545];
	_this setVectorDirAndUp [[0.950358,0.311076,-0.00720897],[0.00932853,-0.00532632,0.999942]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item6 = objNull;
if (_layerRoot) then {
	_item6 = createVehicle ["vn_b_navy_static_l60mk3",[23960.9,17596.8,-1.43051e-006],[],0,"CAN_COLLIDE"];
	_this = _item6;
	_objects pushback _this;
	_objectIDs pushback 6;
	_this setPosWorld [23960.9,17596.8,4.96614];
	_this setVectorDirAndUp [[0.902533,0.430621,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item7 = objNull;
if (_layerRoot) then {
	_item7 = createVehicle ["vn_b_sf_static_m45",[23948.6,17534.1,0],[],0,"CAN_COLLIDE"];
	_this = _item7;
	_objects pushback _this;
	_objectIDs pushback 7;
	_this setPosWorld [23948.6,17534.1,5.12685];
	_this setVectorDirAndUp [[0.542731,0.839907,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item8 = objNull;
if (_layerRoot) then {
	_item8 = createVehicle ["vn_o_pl_static_d44_01",[23999.7,17534.5,-0.000180006],[],0,"CAN_COLLIDE"];
	_this = _item8;
	_objects pushback _this;
	_objectIDs pushback 8;
	_this setPosWorld [23999.7,17534.5,3.13811];
	_this setVectorDirAndUp [[0.834324,-0.551243,-0.00588837],[0.00265199,-0.00666784,0.999974]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item9 = objNull;
if (_layerRoot) then {
	_item9 = createVehicle ["vn_o_nva_navy_static_v11m",[23980.9,17550.2,0],[],0,"CAN_COLLIDE"];
	_this = _item9;
	_objects pushback _this;
	_objectIDs pushback 9;
	_this setPosWorld [23980.9,17550.2,5.03803];
	_this setVectorDirAndUp [[-0.996689,-0.0813096,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item10 = objNull;
if (_layerRoot) then {
	_item10 = createVehicle ["vn_o_pl_static_d44_01",[24031.2,17583.6,0.000196218],[],0,"CAN_COLLIDE"];
	_this = _item10;
	_objects pushback _this;
	_objectIDs pushback 10;
	_this setPosWorld [24031.2,17583.6,3.07254];
	_this setVectorDirAndUp [[0.826293,-0.563111,-0.012118],[0.0146639,0,0.999892]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item11 = objNull;
if (_layerRoot) then {
	_item11 = createVehicle ["vn_o_nva_navy_static_v11m",[24047,17603,-0.00109649],[],0,"CAN_COLLIDE"];
	_this = _item11;
	_objects pushback _this;
	_objectIDs pushback 11;
	_this setPosWorld [24047.1,17603.1,4.51659];
	_this setVectorDirAndUp [[-0.314825,0.949149,0.00121193],[0.0359766,0.0106572,0.999296]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item12 = objNull;
if (_layerRoot) then {
	_item12 = createVehicle ["vn_o_pl_static_d44_01",[24025.7,17614.8,0.000435114],[],0,"CAN_COLLIDE"];
	_this = _item12;
	_objects pushback _this;
	_objectIDs pushback 12;
	_this setPosWorld [24025.7,17614.9,3.05192];
	_this setVectorDirAndUp [[0.833067,-0.553106,-0.0085343],[0.0146639,0.00665851,0.99987]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item13 = objNull;
if (_layerRoot) then {
	_item13 = createVehicle ["vn_o_nva_navy_static_v11m",[24010,17596,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item13;
	_objects pushback _this;
	_objectIDs pushback 13;
	_this setPosWorld [24010,17596,5.02472];
	_this setVectorDirAndUp [[0.0854779,-0.99634,-0.000110401],[0.00129158,0,0.999999]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item14 = objNull;
if (_layerRoot) then {
	_item14 = createVehicle ["Land_vn_bunker_big_01",[23983,17533.2,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item14;
	_objects pushback _this;
	_objectIDs pushback 14;
	_this setPosWorld [23983,17533.2,4.0977];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item15 = objNull;
if (_layerRoot) then {
	_item15 = createVehicle ["Land_vn_bunker_big_01",[24028,17600.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item15;
	_objects pushback _this;
	_objectIDs pushback 15;
	_this setPosWorld [24028,17600.3,4.00497];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item16 = objNull;
if (_layerRoot) then {
	_item16 = createVehicle ["vn_b_navy_static_l60mk3",[23967.9,17592.2,-6.19888e-006],[],0,"CAN_COLLIDE"];
	_this = _item16;
	_objects pushback _this;
	_objectIDs pushback 16;
	_this setPosWorld [23967.9,17592.2,4.96613];
	_this setVectorDirAndUp [[-0.28477,-0.958596,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item17 = objNull;
if (_layerRoot) then {
	_item17 = createVehicle ["vn_b_navy_static_l60mk3",[23974.3,17587.6,-5.8651e-005],[],0,"CAN_COLLIDE"];
	_this = _item17;
	_objects pushback _this;
	_objectIDs pushback 17;
	_this setPosWorld [23974.3,17587.6,4.96608];
	_this setVectorDirAndUp [[-0.365866,0.930668,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item18 = objNull;
if (_layerRoot) then {
	_item18 = createVehicle ["vn_b_navy_static_l60mk3",[23981.3,17582.5,-0.00015974],[],0,"CAN_COLLIDE"];
	_this = _item18;
	_objects pushback _this;
	_objectIDs pushback 18;
	_this setPosWorld [23981.3,17582.5,4.96598];
	_this setVectorDirAndUp [[-0.869927,-0.49318,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item19 = objNull;
if (_layerRoot) then {
	_item19 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23967.2,17606.5,0],[],0,"CAN_COLLIDE"];
	_this = _item19;
	_objects pushback _this;
	_objectIDs pushback 19;
	_this setPosWorld [23967.2,17606.5,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item20 = objNull;
if (_layerRoot) then {
	_item20 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23974.4,17601.5,0],[],0,"CAN_COLLIDE"];
	_this = _item20;
	_objects pushback _this;
	_objectIDs pushback 20;
	_this setPosWorld [23974.4,17601.5,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item21 = objNull;
if (_layerRoot) then {
	_item21 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23981.7,17596.9,0],[],0,"CAN_COLLIDE"];
	_this = _item21;
	_objects pushback _this;
	_objectIDs pushback 21;
	_this setPosWorld [23981.7,17596.9,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item22 = objNull;
if (_layerRoot) then {
	_item22 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23988.8,17592.2,0],[],0,"CAN_COLLIDE"];
	_this = _item22;
	_objects pushback _this;
	_objectIDs pushback 22;
	_this setPosWorld [23988.8,17592.2,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item23 = objNull;
if (_layerRoot) then {
	_item23 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23954.6,17587.9,0],[],0,"CAN_COLLIDE"];
	_this = _item23;
	_objects pushback _this;
	_objectIDs pushback 23;
	_this setPosWorld [23954.6,17587.9,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item24 = objNull;
if (_layerRoot) then {
	_item24 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23961.8,17582.9,0],[],0,"CAN_COLLIDE"];
	_this = _item24;
	_objects pushback _this;
	_objectIDs pushback 24;
	_this setPosWorld [23961.8,17582.9,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item25 = objNull;
if (_layerRoot) then {
	_item25 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23969.1,17578.2,0],[],0,"CAN_COLLIDE"];
	_this = _item25;
	_objects pushback _this;
	_objectIDs pushback 25;
	_this setPosWorld [23969.1,17578.2,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item26 = objNull;
if (_layerRoot) then {
	_item26 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23976.2,17573.6,0],[],0,"CAN_COLLIDE"];
	_this = _item26;
	_objects pushback _this;
	_objectIDs pushback 26;
	_this setPosWorld [23976.2,17573.6,2.85978];
	_this setVectorDirAndUp [[-0.561911,-0.827198,0],[0,0,1]];
};

private _item27 = objNull;
if (_layerRoot) then {
	_item27 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23984.8,17576.2,0],[],0,"CAN_COLLIDE"];
	_this = _item27;
	_objects pushback _this;
	_objectIDs pushback 27;
	_this setPosWorld [23984.8,17576.2,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item28 = objNull;
if (_layerRoot) then {
	_item28 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23989.4,17583.4,0],[],0,"CAN_COLLIDE"];
	_this = _item28;
	_objects pushback _this;
	_objectIDs pushback 28;
	_this setPosWorld [23989.4,17583.4,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item29 = objNull;
if (_layerRoot) then {
	_item29 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23975.8,17581.7,0],[],0,"CAN_COLLIDE"];
	_this = _item29;
	_objects pushback _this;
	_objectIDs pushback 29;
	_this setPosWorld [23975.8,17581.7,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item30 = objNull;
if (_layerRoot) then {
	_item30 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23980.5,17589,0],[],0,"CAN_COLLIDE"];
	_this = _item30;
	_objects pushback _this;
	_objectIDs pushback 30;
	_this setPosWorld [23980.5,17589,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item31 = objNull;
if (_layerRoot) then {
	_item31 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23968.8,17586.6,0],[],0,"CAN_COLLIDE"];
	_this = _item31;
	_objects pushback _this;
	_objectIDs pushback 31;
	_this setPosWorld [23968.8,17586.6,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item32 = objNull;
if (_layerRoot) then {
	_item32 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23973.5,17593.8,0],[],0,"CAN_COLLIDE"];
	_this = _item32;
	_objects pushback _this;
	_objectIDs pushback 32;
	_this setPosWorld [23973.5,17593.8,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item33 = objNull;
if (_layerRoot) then {
	_item33 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23961.7,17591.3,0],[],0,"CAN_COLLIDE"];
	_this = _item33;
	_objects pushback _this;
	_objectIDs pushback 33;
	_this setPosWorld [23961.7,17591.3,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item34 = objNull;
if (_layerRoot) then {
	_item34 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23966.4,17598.5,0],[],0,"CAN_COLLIDE"];
	_this = _item34;
	_objects pushback _this;
	_objectIDs pushback 34;
	_this setPosWorld [23966.4,17598.5,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item35 = objNull;
if (_layerRoot) then {
	_item35 = createVehicle ["Land_vn_b_trench_revetment_05_01",[24017.4,17544.6,0],[],0,"CAN_COLLIDE"];
	_this = _item35;
	_objects pushback _this;
	_objectIDs pushback 35;
	_this setPosWorld [24017.4,17544.6,2.72545];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item37 = objNull;
if (_layerRoot) then {
	_item37 = createVehicle ["vn_b_sf_static_m45",[23904.4,17467.8,-0.000187397],[],0,"CAN_COLLIDE"];
	_this = _item37;
	_objects pushback _this;
	_objectIDs pushback 37;
	_this setPosWorld [23904.4,17467.8,5.12666];
	_this setVectorDirAndUp [[-0.968544,-0.248842,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item38 = objNull;
if (_layerRoot) then {
	_item38 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23991.1,17514.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item38;
	_objects pushback _this;
	_objectIDs pushback 38;
	_this setPosWorld [23991.1,17514.1,3.73123];
	_this setVectorDirAndUp [[-0.951768,-0.30682,0],[0,0,1]];
	_this allowdamage false;;
};

private _item39 = objNull;
if (_layerRoot) then {
	_item39 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23989.2,17517,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item39;
	_objects pushback _this;
	_objectIDs pushback 39;
	_this setPosWorld [23989.2,17517,3.7671];
	_this setVectorDirAndUp [[-0.63587,-0.771796,0],[0,0,1]];
	_this allowdamage false;;
};

private _item40 = objNull;
if (_layerRoot) then {
	_item40 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23991.1,17510.5,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item40;
	_objects pushback _this;
	_objectIDs pushback 40;
	_this setPosWorld [23991.1,17510.5,3.70099];
	_this setVectorDirAndUp [[-0.958246,0.285946,0],[0,0,1]];
	_this allowdamage false;;
};

private _item41 = objNull;
if (_layerRoot) then {
	_item41 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23983.9,17515.6,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item41;
	_objects pushback _this;
	_objectIDs pushback 41;
	_this setPosWorld [23983.9,17515.6,3.79834];
	_this setVectorDirAndUp [[0.964985,-0.262305,0],[0,0,1]];
	_this allowdamage false;;
};

private _item42 = objNull;
if (_layerRoot) then {
	_item42 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23984,17512,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item42;
	_objects pushback _this;
	_objectIDs pushback 42;
	_this setPosWorld [23984,17512,3.78097];
	_this setVectorDirAndUp [[0.943937,0.330125,0],[0,0,1]];
	_this allowdamage false;;
};

private _item43 = objNull;
if (_layerRoot) then {
	_item43 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23985.9,17509.1,0],[],0,"CAN_COLLIDE"];
	_this = _item43;
	_objects pushback _this;
	_objectIDs pushback 43;
	_this setPosWorld [23985.9,17509.1,3.7444];
	_this setVectorDirAndUp [[0.616672,0.78722,0],[0,0,1]];
	_this allowdamage false;;
};

private _item44 = objNull;
if (_layerRoot) then {
	_item44 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23983.8,17550.6,0],[],0,"CAN_COLLIDE"];
	_this = _item44;
	_objects pushback _this;
	_objectIDs pushback 44;
	_this setPosWorld [23983.8,17550.6,3.85899];
	_this setVectorDirAndUp [[-0.992721,-0.120437,0],[0,0,1]];
	_this allowdamage false;;
};

private _item45 = objNull;
if (_layerRoot) then {
	_item45 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23982.5,17553.8,0],[],0,"CAN_COLLIDE"];
	_this = _item45;
	_objects pushback _this;
	_objectIDs pushback 45;
	_this setPosWorld [23982.5,17553.8,3.85899];
	_this setVectorDirAndUp [[-0.770893,-0.636964,0],[0,0,1]];
	_this allowdamage false;;
};

private _item46 = objNull;
if (_layerRoot) then {
	_item46 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23983.1,17547.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item46;
	_objects pushback _this;
	_objectIDs pushback 46;
	_this setPosWorld [23983.1,17547.1,3.85508];
	_this setVectorDirAndUp [[-0.886481,0.462766,0],[0,0,1]];
	_this allowdamage false;;
};

private _item47 = objNull;
if (_layerRoot) then {
	_item47 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23977,17553.4,0],[],0,"CAN_COLLIDE"];
	_this = _item47;
	_objects pushback _this;
	_objectIDs pushback 47;
	_this setPosWorld [23977,17553.4,3.85899];
	_this setVectorDirAndUp [[0.897588,-0.440836,0],[0,0,1]];
	_this allowdamage false;;
};

private _item48 = objNull;
if (_layerRoot) then {
	_item48 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23976.4,17549.8,0],[],0,"CAN_COLLIDE"];
	_this = _item48;
	_objects pushback _this;
	_objectIDs pushback 48;
	_this setPosWorld [23976.4,17549.8,3.85899];
	_this setVectorDirAndUp [[0.98946,0.144804,0],[0,0,1]];
	_this allowdamage false;;
};

private _item49 = objNull;
if (_layerRoot) then {
	_item49 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23977.8,17546.7,0],[],0,"CAN_COLLIDE"];
	_this = _item49;
	_objects pushback _this;
	_objectIDs pushback 49;
	_this setPosWorld [23977.8,17546.7,3.85864];
	_this setVectorDirAndUp [[0.754983,0.655744,0],[0,0,1]];
	_this allowdamage false;;
};

private _item50 = objNull;
if (_layerRoot) then {
	_item50 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24023,17559.1,0],[],0,"CAN_COLLIDE"];
	_this = _item50;
	_objects pushback _this;
	_objectIDs pushback 50;
	_this setPosWorld [24023,17559.1,3.76658];
	_this setVectorDirAndUp [[-0.857476,0.514523,0],[0,0,1]];
	_this allowdamage false;;
};

private _item51 = objNull;
if (_layerRoot) then {
	_item51 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24024,17562.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item51;
	_objects pushback _this;
	_objectIDs pushback 51;
	_this setPosWorld [24024,17562.4,3.78236];
	_this setVectorDirAndUp [[-0.999568,-0.0293999,0],[0,0,1]];
	_this allowdamage false;;
};

private _item52 = objNull;
if (_layerRoot) then {
	_item52 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24020.3,17556.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item52;
	_objects pushback _this;
	_objectIDs pushback 52;
	_this setPosWorld [24020.3,17556.7,3.76827];
	_this setVectorDirAndUp [[-0.415511,0.909588,0],[0,0,1]];
	_this allowdamage false;;
};

private _item53 = objNull;
if (_layerRoot) then {
	_item53 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24019.4,17565.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item53;
	_objects pushback _this;
	_objectIDs pushback 53;
	_this setPosWorld [24019.4,17565.4,3.80623];
	_this setVectorDirAndUp [[0.437741,-0.899101,0],[0,0,1]];
	_this allowdamage false;;
};

private _item54 = objNull;
if (_layerRoot) then {
	_item54 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24016.7,17563,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item54;
	_objects pushback _this;
	_objectIDs pushback 54;
	_this setPosWorld [24016.7,17563,3.81229];
	_this setVectorDirAndUp [[0.869866,-0.493288,0],[0,0,1]];
	_this allowdamage false;;
};

private _item55 = objNull;
if (_layerRoot) then {
	_item55 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24015.9,17559.7,0],[],0,"CAN_COLLIDE"];
	_this = _item55;
	_objects pushback _this;
	_objectIDs pushback 55;
	_this setPosWorld [24015.9,17559.7,3.8091];
	_this setVectorDirAndUp [[0.998543,0.053961,0],[0,0,1]];
	_this allowdamage false;;
};

private _item56 = objNull;
if (_layerRoot) then {
	_item56 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24009.9,17592.5,0],[],0,"CAN_COLLIDE"];
	_this = _item56;
	_objects pushback _this;
	_objectIDs pushback 56;
	_this setPosWorld [24009.9,17592.5,3.84578];
	_this setVectorDirAndUp [[0.0276712,0.999617,0],[0,0,1]];
	_this allowdamage false;;
};

private _item57 = objNull;
if (_layerRoot) then {
	_item57 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24013.3,17593.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item57;
	_objects pushback _this;
	_objectIDs pushback 57;
	_this setPosWorld [24013.3,17593.3,3.84131];
	_this setVectorDirAndUp [[-0.515995,0.856592,0],[0,0,1]];
	_this allowdamage false;;
};

private _item58 = objNull;
if (_layerRoot) then {
	_item58 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24006.5,17593.7,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item58;
	_objects pushback _this;
	_objectIDs pushback 58;
	_this setPosWorld [24006.5,17593.7,3.85031];
	_this setVectorDirAndUp [[0.588752,0.808314,0],[0,0,1]];
	_this allowdamage false;;
};

private _item59 = objNull;
if (_layerRoot) then {
	_item59 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24013.7,17598.8,0],[],0,"CAN_COLLIDE"];
	_this = _item59;
	_objects pushback _this;
	_objectIDs pushback 59;
	_this setPosWorld [24013.7,17598.8,3.83743];
	_this setVectorDirAndUp [[-0.568765,-0.8225,0],[0,0,1]];
	_this allowdamage false;;
};

private _item60 = objNull;
if (_layerRoot) then {
	_item60 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24010.3,17600,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item60;
	_objects pushback _this;
	_objectIDs pushback 60;
	_this setPosWorld [24010.3,17600,3.84504];
	_this setVectorDirAndUp [[-0.00312432,-0.999995,0],[0,0,1]];
	_this allowdamage false;;
};

private _item61 = objNull;
if (_layerRoot) then {
	_item61 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24006.9,17599.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item61;
	_objects pushback _this;
	_objectIDs pushback 61;
	_this setPosWorld [24006.9,17599.1,3.84975];
	_this setVectorDirAndUp [[0.536895,-0.843649,0],[0,0,1]];
	_this allowdamage false;;
};

private _item62 = objNull;
if (_layerRoot) then {
	_item62 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24047.8,17600.3,0],[],0,"CAN_COLLIDE"];
	_this = _item62;
	_objects pushback _this;
	_objectIDs pushback 62;
	_this setPosWorld [24047.8,17600.3,3.33431];
	_this setVectorDirAndUp [[-0.332165,0.943221,0],[0,0,1]];
	_this allowdamage false;;
};

private _item63 = objNull;
if (_layerRoot) then {
	_item63 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24050.7,17602.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item63;
	_objects pushback _this;
	_objectIDs pushback 63;
	_this setPosWorld [24050.7,17602.3,3.21677];
	_this setVectorDirAndUp [[-0.788552,0.614968,0],[0,0,1]];
	_this allowdamage false;;
};

private _item64 = objNull;
if (_layerRoot) then {
	_item64 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24044.2,17600.2,0],[],0,"CAN_COLLIDE"];
	_this = _item64;
	_objects pushback _this;
	_objectIDs pushback 64;
	_this setPosWorld [24044.2,17600.2,3.45035];
	_this setVectorDirAndUp [[0.260206,0.965553,0],[0,0,1]];
	_this allowdamage false;;
};

private _item65 = objNull;
if (_layerRoot) then {
	_item65 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24049.1,17607.6,0],[],0,"CAN_COLLIDE"];
	_this = _item65;
	_objects pushback _this;
	_objectIDs pushback 65;
	_this setPosWorld [24049.1,17607.6,3.21775];
	_this setVectorDirAndUp [[-0.236461,-0.971641,0],[0,0,1]];
	_this allowdamage false;;
};

private _item66 = objNull;
if (_layerRoot) then {
	_item66 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24045.5,17607.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item66;
	_objects pushback _this;
	_objectIDs pushback 66;
	_this setPosWorld [24045.5,17607.4,3.34919];
	_this setVectorDirAndUp [[0.355248,-0.934772,0],[0,0,1]];
	_this allowdamage false;;
};

private _item67 = objNull;
if (_layerRoot) then {
	_item67 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24042.7,17605.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item67;
	_objects pushback _this;
	_objectIDs pushback 67;
	_this setPosWorld [24042.7,17605.4,3.45305];
	_this setVectorDirAndUp [[0.803429,-0.595401,0],[0,0,1]];
	_this allowdamage false;;
};

private _item68 = objNull;
if (_layerRoot) then {
	_item68 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23930.3,17507.7,0],[],0,"CAN_COLLIDE"];
	_this = _item68;
	_objects pushback _this;
	_objectIDs pushback 68;
	_this setPosWorld [23930.3,17507.7,3.85899];
	_this setVectorDirAndUp [[-0.951768,-0.30682,0],[0,0,1]];
	_this allowdamage false;;
};

private _item69 = objNull;
if (_layerRoot) then {
	_item69 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23928.4,17510.6,0],[],0,"CAN_COLLIDE"];
	_this = _item69;
	_objects pushback _this;
	_objectIDs pushback 69;
	_this setPosWorld [23928.4,17510.6,3.85899];
	_this setVectorDirAndUp [[-0.344309,-0.938857,0],[0,0,1]];
	_this allowdamage false;;
};

private _item70 = objNull;
if (_layerRoot) then {
	_item70 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23930.3,17504.1,0],[],0,"CAN_COLLIDE"];
	_this = _item70;
	_objects pushback _this;
	_objectIDs pushback 70;
	_this setPosWorld [23930.3,17504.1,3.85899];
	_this setVectorDirAndUp [[-0.877286,0.479969,0],[0,0,1]];
	_this allowdamage false;;
};

private _item71 = objNull;
if (_layerRoot) then {
	_item71 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23924.1,17509.3,0],[],0,"CAN_COLLIDE"];
	_this = _item71;
	_objects pushback _this;
	_objectIDs pushback 71;
	_this setPosWorld [23924.1,17509.3,3.85899];
	_this setVectorDirAndUp [[0.819745,-0.572729,0],[0,0,1]];
	_this allowdamage false;;
};

private _item72 = objNull;
if (_layerRoot) then {
	_item72 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23923.7,17505.6,0],[],0,"CAN_COLLIDE"];
	_this = _item72;
	_objects pushback _this;
	_objectIDs pushback 72;
	_this setPosWorld [23923.7,17505.6,3.85899];
	_this setVectorDirAndUp [[0.943937,0.330125,0],[0,0,1]];
	_this allowdamage false;;
};

private _item73 = objNull;
if (_layerRoot) then {
	_item73 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[23925.7,17502.8,0],[],0,"CAN_COLLIDE"];
	_this = _item73;
	_objects pushback _this;
	_objectIDs pushback 73;
	_this setPosWorld [23925.7,17502.8,3.85899];
	_this setVectorDirAndUp [[0.431449,0.902137,0],[0,0,1]];
	_this allowdamage false;;
};

private _item74 = objNull;
if (_layerRoot) then {
	_item74 = createVehicle ["Land_BagFence_Round_F",[23947.2,17532.3,0],[],0,"CAN_COLLIDE"];
	_this = _item74;
	_objects pushback _this;
	_objectIDs pushback 74;
	_this setPosWorld [23947.2,17532.3,3.60931];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item75 = objNull;
if (_layerRoot) then {
	_item75 = createVehicle ["Land_BagFence_Round_F",[23949.7,17536,0],[],0,"CAN_COLLIDE"];
	_this = _item75;
	_objects pushback _this;
	_objectIDs pushback 75;
	_this setPosWorld [23949.7,17536,3.60931];
	_this setVectorDirAndUp [[-0.47702,-0.878892,0],[0,0,1]];
	_this allowdamage false;;
};

private _item76 = objNull;
if (_layerRoot) then {
	_item76 = createVehicle ["Land_BagFence_Round_F",[23946.6,17535.4,0],[],0,"CAN_COLLIDE"];
	_this = _item76;
	_objects pushback _this;
	_objectIDs pushback 76;
	_this setPosWorld [23946.6,17535.4,3.60931];
	_this setVectorDirAndUp [[0.817133,-0.576449,0],[0,0,1]];
	_this allowdamage false;;
};

private _item77 = objNull;
if (_layerRoot) then {
	_item77 = createVehicle ["Land_BagFence_Round_F",[23950.2,17532.9,0],[],0,"CAN_COLLIDE"];
	_this = _item77;
	_objects pushback _this;
	_objectIDs pushback 77;
	_this setPosWorld [23950.2,17532.9,3.60931];
	_this setVectorDirAndUp [[-0.863936,0.503601,0],[0,0,1]];
	_this allowdamage false;;
};

private _item78 = objNull;
if (_layerRoot) then {
	_item78 = createVehicle ["Land_BagFence_Round_F",[23903.2,17469.6,0],[],0,"CAN_COLLIDE"];
	_this = _item78;
	_objects pushback _this;
	_objectIDs pushback 78;
	_this setPosWorld [23903.2,17469.6,3.60931];
	_this setVectorDirAndUp [[0.197501,-0.980303,0],[0,0,1]];
	_this allowdamage false;;
};

private _item79 = objNull;
if (_layerRoot) then {
	_item79 = createVehicle ["Land_BagFence_Round_F",[23905.8,17468,0],[],0,"CAN_COLLIDE"];
	_this = _item79;
	_objects pushback _this;
	_objectIDs pushback 79;
	_this setPosWorld [23905.8,17468,3.60931];
	_this setVectorDirAndUp [[-0.950537,-0.310611,0],[0,0,1]];
	_this allowdamage false;;
};

private _item80 = objNull;
if (_layerRoot) then {
	_item80 = createVehicle ["Land_BagFence_Round_F",[23904.3,17465.2,0],[],0,"CAN_COLLIDE"];
	_this = _item80;
	_objects pushback _this;
	_objectIDs pushback 80;
	_this setPosWorld [23904.3,17465.2,3.60931];
	_this setVectorDirAndUp [[-0.281534,0.959551,0],[0,0,1]];
	_this allowdamage false;;
};

private _item81 = objNull;
if (_layerRoot) then {
	_item81 = createVehicle ["Land_BagFence_Round_F",[23901.5,17467,0],[],0,"CAN_COLLIDE"];
	_this = _item81;
	_objects pushback _this;
	_objectIDs pushback 81;
	_this setPosWorld [23901.5,17467,3.60931];
	_this setVectorDirAndUp [[0.973828,0.227285,0],[0,0,1]];
	_this allowdamage false;;
};

private _item82 = objNull;
if (_layerRoot) then {
	_item82 = createVehicle ["Land_BagFence_Long_F",[23968.8,17522.5,0],[],0,"CAN_COLLIDE"];
	_this = _item82;
	_objects pushback _this;
	_objectIDs pushback 82;
	_this setPosWorld [23968.8,17522.5,3.60258];
	_this setVectorDirAndUp [[-0.329668,0.944096,0.00121937],[0,-0.00129158,0.999999]];
	_this allowdamage false;;
};

private _item83 = objNull;
if (_layerRoot) then {
	_item83 = createVehicle ["Land_BagFence_Long_F",[23973.8,17525.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item83;
	_objects pushback _this;
	_objectIDs pushback 83;
	_this setPosWorld [23973.8,17525.7,3.6019];
	_this setVectorDirAndUp [[-0.84977,0.527151,0.00184078],[0.00133688,-0.00133688,0.999998]];
	_this allowdamage false;;
};

private _item84 = objNull;
if (_layerRoot) then {
	_item84 = createVehicle ["Land_BagFence_Long_F",[23974.3,17531.8,0],[],0,"CAN_COLLIDE"];
	_this = _item84;
	_objects pushback _this;
	_objectIDs pushback 84;
	_this setPosWorld [23974.3,17531.8,3.60362];
	_this setVectorDirAndUp [[-0.967758,-0.251879,0.00124993],[0.00129158,0,0.999999]];
	_this allowdamage false;;
};

private _item85 = objNull;
if (_layerRoot) then {
	_item85 = createVehicle ["Land_BagFence_Long_F",[23963.7,17523.9,0],[],0,"CAN_COLLIDE"];
	_this = _item85;
	_objects pushback _this;
	_objectIDs pushback 85;
	_this setPosWorld [23963.7,17523.9,3.60769];
	_this setVectorDirAndUp [[0.55447,0.832204,-0.000716141],[0.00129158,0,0.999999]];
	_this allowdamage false;;
};

private _item86 = objNull;
if (_layerRoot) then {
	_item86 = createVehicle ["Land_BagFence_Long_F",[23962,17532.8,0],[],0,"CAN_COLLIDE"];
	_this = _item86;
	_objects pushback _this;
	_objectIDs pushback 86;
	_this setPosWorld [23962,17532.8,3.60931];
	_this setVectorDirAndUp [[0.864077,-0.50336,0],[0,0,1]];
	_this allowdamage false;;
};

private _item87 = objNull;
if (_layerRoot) then {
	_item87 = createVehicle ["Land_BagFence_Long_F",[23961.1,17527.8,0],[],0,"CAN_COLLIDE"];
	_this = _item87;
	_objects pushback _this;
	_objectIDs pushback 87;
	_this setPosWorld [23961.1,17527.8,3.60931];
	_this setVectorDirAndUp [[0.967658,0.252265,0],[0,0,1]];
	_this allowdamage false;;
};

private _item88 = objNull;
if (_layerRoot) then {
	_item88 = createVehicle ["Land_BagFence_Long_F",[23966.6,17536.3,0],[],0,"CAN_COLLIDE"];
	_this = _item88;
	_objects pushback _this;
	_objectIDs pushback 88;
	_this setPosWorld [23966.6,17536.3,3.60931];
	_this setVectorDirAndUp [[0.245617,-0.969367,0],[0,0,1]];
	_this allowdamage false;;
};

private _item89 = objNull;
if (_layerRoot) then {
	_item89 = createVehicle ["Land_BagFence_Long_F",[23971.2,17535.4,0],[],0,"CAN_COLLIDE"];
	_this = _item89;
	_objects pushback _this;
	_objectIDs pushback 89;
	_this setPosWorld [23971.2,17535.4,3.60766];
	_this setVectorDirAndUp [[-0.4433,-0.896373,0.000572556],[0.00129158,0,0.999999]];
	_this allowdamage false;;
};

private _item90 = objNull;
if (_layerRoot) then {
	_item90 = createVehicle ["Land_BagFence_Long_F",[23992.6,17533.1,0],[],0,"CAN_COLLIDE"];
	_this = _item90;
	_objects pushback _this;
	_objectIDs pushback 90;
	_this setPosWorld [23992.6,17533.1,3.5732];
	_this setVectorDirAndUp [[0.967637,0.252281,-0.00578319],[0.00666787,-0.00265193,0.999974]];
	_this allowdamage false;;
};

private _item91 = objNull;
if (_layerRoot) then {
	_item91 = createVehicle ["Land_BagFence_Long_F",[23993.5,17538.1,0],[],0,"CAN_COLLIDE"];
	_this = _item91;
	_objects pushback _this;
	_objectIDs pushback 91;
	_this setPosWorld [23993.5,17538.1,3.58472];
	_this setVectorDirAndUp [[0.864074,-0.503352,-0.00362642],[0.00265199,-0.00265198,0.999993]];
	_this allowdamage false;;
};

private _item92 = objNull;
if (_layerRoot) then {
	_item92 = createVehicle ["Land_BagFence_Long_F",[23998.2,17541.6,0],[],0,"CAN_COLLIDE"];
	_this = _item92;
	_objects pushback _this;
	_objectIDs pushback 92;
	_this setPosWorld [23998.2,17541.6,3.58174];
	_this setVectorDirAndUp [[0.245616,-0.969362,-0.00322212],[0.00265199,-0.00265198,0.999993]];
	_this allowdamage false;;
};

private _item93 = objNull;
if (_layerRoot) then {
	_item93 = createVehicle ["Land_BagFence_Long_F",[24002.8,17540.6,0],[],0,"CAN_COLLIDE"];
	_this = _item93;
	_objects pushback _this;
	_objectIDs pushback 93;
	_this setPosWorld [24002.8,17540.6,3.55547];
	_this setVectorDirAndUp [[-0.443297,-0.896365,-0.00420521],[0.00399666,-0.00666781,0.99997]];
	_this allowdamage false;;
};

private _item94 = objNull;
if (_layerRoot) then {
	_item94 = createVehicle ["Land_BagFence_Long_F",[24005.9,17537.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item94;
	_objects pushback _this;
	_objectIDs pushback 94;
	_this setPosWorld [24005.9,17537.1,3.51978];
	_this setVectorDirAndUp [[-0.967751,-0.251899,0.00218822],[0.00399666,-0.00666781,0.99997]];
	_this allowdamage false;;
};

private _item95 = objNull;
if (_layerRoot) then {
	_item95 = createVehicle ["Land_BagFence_Long_F",[24005.4,17531,0],[],0,"CAN_COLLIDE"];
	_this = _item95;
	_objects pushback _this;
	_objectIDs pushback 95;
	_this setPosWorld [24005.4,17531,3.48424];
	_this setVectorDirAndUp [[-0.849743,0.527082,0.011016],[0.00800059,-0.00800033,0.999936]];
	_this allowdamage false;;
};

private _item96 = objNull;
if (_layerRoot) then {
	_item96 = createVehicle ["Land_BagFence_Long_F",[24000.4,17527.7,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item96;
	_objects pushback _this;
	_objectIDs pushback 96;
	_this setPosWorld [24000.4,17527.7,3.50696];
	_this setVectorDirAndUp [[-0.329654,0.944055,0.00937036],[0.00932853,-0.00666758,0.999934]];
	_this allowdamage false;;
};

private _item97 = objNull;
if (_layerRoot) then {
	_item97 = createVehicle ["Land_BagFence_Long_F",[23995.3,17529.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item97;
	_objects pushback _this;
	_objectIDs pushback 97;
	_this setPosWorld [23995.3,17529.2,3.54511];
	_this setVectorDirAndUp [[0.554458,0.83221,-0.00149012],[0.00666787,-0.00265193,0.999974]];
	_this allowdamage false;;
};

private _item98 = objNull;
if (_layerRoot) then {
	_item98 = createVehicle ["Land_BagFence_Long_F",[24024.5,17582.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item98;
	_objects pushback _this;
	_objectIDs pushback 98;
	_this setPosWorld [24024.5,17582.1,3.55339];
	_this setVectorDirAndUp [[0.967627,0.252265,-0.00773492],[0.00799344,0,0.999968]];
	_this allowdamage false;;
};

private _item99 = objNull;
if (_layerRoot) then {
	_item99 = createVehicle ["Land_BagFence_Long_F",[24025.4,17587.1,0],[],0,"CAN_COLLIDE"];
	_this = _item99;
	_objects pushback _this;
	_objectIDs pushback 99;
	_this setPosWorld [24025.4,17587.1,3.54636];
	_this setVectorDirAndUp [[0.864049,-0.50336,-0.00690694],[0.00799344,0,0.999968]];
	_this allowdamage false;;
};

private _item100 = objNull;
if (_layerRoot) then {
	_item100 = createVehicle ["Land_BagFence_Long_F",[24030,17590.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item100;
	_objects pushback _this;
	_objectIDs pushback 100;
	_this setPosWorld [24030,17590.6,3.505];
	_this setVectorDirAndUp [[0.245595,-0.96937,-0.00197814],[0.0133313,0.00133709,0.99991]];
	_this allowdamage false;;
};

private _item101 = objNull;
if (_layerRoot) then {
	_item101 = createVehicle ["Land_BagFence_Long_F",[24034.7,17589.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item101;
	_objects pushback _this;
	_objectIDs pushback 101;
	_this setPosWorld [24034.7,17589.6,3.44418];
	_this setVectorDirAndUp [[-0.443261,-0.896364,0.00710842],[0.0133313,0.00133709,0.99991]];
	_this allowdamage false;;
};

private _item102 = objNull;
if (_layerRoot) then {
	_item102 = createVehicle ["Land_BagFence_Long_F",[24037.7,17586.1,0],[],0,"CAN_COLLIDE"];
	_this = _item102;
	_objects pushback _this;
	_objectIDs pushback 102;
	_this setPosWorld [24037.7,17586.1,3.40363];
	_this setVectorDirAndUp [[-0.96759,-0.251902,0.0177242],[0.0186626,-0.00133664,0.999825]];
	_this allowdamage false;;
};

private _item103 = objNull;
if (_layerRoot) then {
	_item103 = createVehicle ["Land_BagFence_Long_F",[24037.2,17580,0],[],0,"CAN_COLLIDE"];
	_this = _item103;
	_objects pushback _this;
	_objectIDs pushback 103;
	_this setPosWorld [24037.2,17580,3.40373];
	_this setVectorDirAndUp [[-0.849678,0.5271,0.0145677],[0.0146639,-0.00399623,0.999884]];
	_this allowdamage false;;
};

private _item104 = objNull;
if (_layerRoot) then {
	_item104 = createVehicle ["Land_BagFence_Long_F",[24032.2,17576.7,0],[],0,"CAN_COLLIDE"];
	_this = _item104;
	_objects pushback _this;
	_objectIDs pushback 104;
	_this setPosWorld [24032.2,17576.7,3.46464];
	_this setVectorDirAndUp [[-0.329626,0.94408,0.00777758],[0.0159975,-0.00265165,0.999869]];
	_this allowdamage false;;
};

private _item105 = objNull;
if (_layerRoot) then {
	_item105 = createVehicle ["Land_BagFence_Long_F",[24027.1,17578.2,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item105;
	_objects pushback _this;
	_objectIDs pushback 105;
	_this setPosWorld [24027.1,17578.2,3.52743];
	_this setVectorDirAndUp [[0.554453,0.832212,-0.00222908],[0.00800059,-0.00265191,0.999964]];
	_this allowdamage false;;
};

private _item106 = objNull;
if (_layerRoot) then {
	_item106 = createVehicle ["Land_BagFence_Long_F",[24018.9,17613,0],[],0,"CAN_COLLIDE"];
	_this = _item106;
	_objects pushback _this;
	_objectIDs pushback 106;
	_this setPosWorld [24018.9,17613,3.54037];
	_this setVectorDirAndUp [[0.967645,0.25225,-0.00582328],[0.00532655,0.00265201,0.999982]];
	_this allowdamage false;;
};

private _item107 = objNull;
if (_layerRoot) then {
	_item107 = createVehicle ["Land_BagFence_Long_F",[24019.8,17618,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item107;
	_objects pushback _this;
	_objectIDs pushback 107;
	_this setPosWorld [24019.8,17618,3.51593];
	_this setVectorDirAndUp [[0.864057,-0.503374,-0.00442659],[0.00666787,0.00265198,0.999974]];
	_this allowdamage false;;
};

private _item108 = objNull;
if (_layerRoot) then {
	_item108 = createVehicle ["Land_BagFence_Long_F",[24024.5,17621.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item108;
	_objects pushback _this;
	_objectIDs pushback 108;
	_this setPosWorld [24024.5,17621.5,3.44935];
	_this setVectorDirAndUp [[0.245591,-0.969372,0.00156167],[0.0146639,0.00532593,0.999878]];
	_this allowdamage false;;
};

private _item109 = objNull;
if (_layerRoot) then {
	_item109 = createVehicle ["Land_BagFence_Long_F",[24029.1,17620.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item109;
	_objects pushback _this;
	_objectIDs pushback 109;
	_this setPosWorld [24029.1,17620.5,3.38037];
	_this setVectorDirAndUp [[-0.443234,-0.896283,0.0148546],[0.0173315,0.0079997,0.999818]];
	_this allowdamage false;;
};

private _item110 = objNull;
if (_layerRoot) then {
	_item110 = createVehicle ["Land_BagFence_Long_F",[24032.2,17617,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item110;
	_objects pushback _this;
	_objectIDs pushback 110;
	_this setPosWorld [24032.2,17617,3.34811];
	_this setVectorDirAndUp [[-0.967539,-0.251675,0.0229899],[0.0213271,0.00933276,0.999729]];
	_this allowdamage false;;
};

private _item111 = objNull;
if (_layerRoot) then {
	_item111 = createVehicle ["Land_BagFence_Long_F",[24031.6,17610.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item111;
	_objects pushback _this;
	_objectIDs pushback 111;
	_this setPosWorld [24031.6,17610.9,3.40281];
	_this setVectorDirAndUp [[-0.849622,0.527247,0.0123434],[0.0186626,0.00666701,0.999804]];
	_this allowdamage false;;
};

private _item112 = objNull;
if (_layerRoot) then {
	_item112 = createVehicle ["Land_BagFence_Long_F",[24026.7,17607.6,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item112;
	_objects pushback _this;
	_objectIDs pushback 112;
	_this setPosWorld [24026.7,17607.6,3.49159];
	_this setVectorDirAndUp [[-0.329644,0.944105,-0.00107447],[0.0119949,0.00532612,0.999914]];
	_this allowdamage false;;
};

private _item113 = objNull;
if (_layerRoot) then {
	_item113 = createVehicle ["Land_BagFence_Long_F",[24021.6,17609.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item113;
	_objects pushback _this;
	_objectIDs pushback 113;
	_this setPosWorld [24021.6,17609.1,3.53656];
	_this setVectorDirAndUp [[0.554462,0.832193,-0.00516044],[0.00532655,0.00265201,0.999982]];
	_this allowdamage false;;
};

private _item114 = objNull;
if (_layerRoot) then {
	_item114 = createVehicle ["Land_vn_cmp_shed_f",[23939.4,17470.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item114;
	_objects pushback _this;
	_objectIDs pushback 114;
	_this setPosWorld [23939.4,17470.1,6.77201];
	_this setVectorDirAndUp [[-0.551317,-0.834296,0],[0,0,1]];
};

private _item115 = objNull;
if (_layerRoot) then {
	_item115 = createVehicle ["Land_vn_garagerow_01_large_f",[23948.7,17486.7,0],[],0,"CAN_COLLIDE"];
	_this = _item115;
	_objects pushback _this;
	_objectIDs pushback 115;
	_this setPosWorld [23948.7,17486.7,6.81407];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item116 = objNull;
if (_layerRoot) then {
	_item116 = createVehicle ["Land_vn_garagerow_01_small_f",[23964.6,17504.4,0],[],0,"CAN_COLLIDE"];
	_this = _item116;
	_objects pushback _this;
	_objectIDs pushback 116;
	_this setPosWorld [23964.6,17504.4,4.75288];
	_this setVectorDirAndUp [[0.834327,-0.55127,0],[0,0,1]];
};

private _item119 = objNull;
if (_layerRoot) then {
	_item119 = createVehicle ["Land_vn_workshop_04_grey_f",[23948.5,17550.1,0],[],0,"CAN_COLLIDE"];
	_this = _item119;
	_objects pushback _this;
	_objectIDs pushback 119;
	_this setPosWorld [23948.5,17550.1,4.53953];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
};

private _item120 = objNull;
if (_layerRoot) then {
	_item120 = createVehicle ["Land_vn_sm_01_shelter_narrow_f",[23996.9,17556.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item120;
	_objects pushback _this;
	_objectIDs pushback 120;
	_this setPosWorld [23996.9,17556.7,5.31439];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item121 = objNull;
if (_layerRoot) then {
	_item121 = createVehicle ["Land_vn_hut_old02",[24005.5,17569.7,0],[],0,"CAN_COLLIDE"];
	_this = _item121;
	_objects pushback _this;
	_objectIDs pushback 121;
	_this setPosWorld [24005.5,17569.7,6.48165];
	_this setVectorDirAndUp [[0.834327,-0.55127,0],[0,0,1]];
};

private _item122 = objNull;
if (_layerRoot) then {
	_item122 = createVehicle ["Land_vn_barracks_02_f",[23916.7,17484.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item122;
	_objects pushback _this;
	_objectIDs pushback 122;
	_this setPosWorld [23916.7,17484.1,5.13713];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item123 = objNull;
if (_layerRoot) then {
	_item123 = createVehicle ["Land_vn_barracks_04_f",[23941.1,17515.7,0],[],0,"CAN_COLLIDE"];
	_this = _item123;
	_objects pushback _this;
	_objectIDs pushback 123;
	_this setPosWorld [23941.1,17515.7,5.39043];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
};

private _item126 = objNull;
if (_layerRoot) then {
	_item126 = createVehicle ["Land_vn_barracks_05_f",[23909.4,17519.9,0],[],0,"CAN_COLLIDE"];
	_this = _item126;
	_objects pushback _this;
	_objectIDs pushback 126;
	_this setPosWorld [23909.4,17519.9,5.2132];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
};

private _item128 = objNull;
if (_layerRoot) then {
	_item128 = createVehicle ["Land_Shed_06_F",[23952.7,17565.3,0],[],0,"CAN_COLLIDE"];
	_this = _item128;
	_objects pushback _this;
	_objectIDs pushback 128;
	_this setPosWorld [23952.7,17565.3,4.6057];
	_this setVectorDirAndUp [[-0.83432,0.551281,0],[0,0,1]];
};

private _item133 = objNull;
if (_layerRoot) then {
	_item133 = createVehicle ["Land_vn_quonset_02",[23975.5,17620.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item133;
	_objects pushback _this;
	_objectIDs pushback 133;
	_this setPosWorld [23975.5,17620.6,4.41804];
	_this setVectorDirAndUp [[0.551267,0.834329,0],[0,0,1]];
};

private _item134 = objNull;
if (_layerRoot) then {
	_item134 = createVehicle ["Land_vn_usaf_hangar_02",[23996.9,17632.2,0.00869346],[],0,"CAN_COLLIDE"];
	_this = _item134;
	_objects pushback _this;
	_objectIDs pushback 134;
	_this setPosWorld [23996.9,17632.2,4.68289];
	_this setVectorDirAndUp [[0.833982,-0.551791,0],[0,0,1]];
};

private _item137 = objNull;
if (_layerRoot) then {
	_item137 = createVehicle ["Land_vn_barracks_04_02",[23926.1,17548.5,0],[],0,"CAN_COLLIDE"];
	_this = _item137;
	_objects pushback _this;
	_objectIDs pushback 137;
	_this setPosWorld [23926.1,17548.5,5.41952];
	_this setVectorDirAndUp [[0.839077,-0.544013,0],[0,0,1]];
};

private _item138 = objNull;
if (_layerRoot) then {
	_item138 = createVehicle ["Land_vn_barracks_05_f",[23915.3,17528.9,0],[],0,"CAN_COLLIDE"];
	_this = _item138;
	_objects pushback _this;
	_objectIDs pushback 138;
	_this setPosWorld [23915.3,17528.9,5.2132];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
};

private _item139 = objNull;
if (_layerRoot) then {
	_item139 = createVehicle ["Land_vn_barracks_05_f",[23921.1,17537.7,0],[],0,"CAN_COLLIDE"];
	_this = _item139;
	_objects pushback _this;
	_objectIDs pushback 139;
	_this setPosWorld [23921.1,17537.7,5.2132];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
};

private _item140 = objNull;
if (_layerRoot) then {
	_item140 = createVehicle ["Land_vn_zed_civil",[24012.1,17585.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item140;
	_objects pushback _this;
	_objectIDs pushback 140;
	_this setPosWorld [24012.1,17585.3,4.6581];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item141 = objNull;
if (_layerRoot) then {
	_item141 = createVehicle ["Land_vn_zed_dira_civil",[24007,17588.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item141;
	_objects pushback _this;
	_objectIDs pushback 141;
	_this setPosWorld [24007,17588.6,4.3817];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item142 = objNull;
if (_layerRoot) then {
	_item142 = createVehicle ["Land_vn_zed_podplaz_civil",[24017.2,17582,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item142;
	_objects pushback _this;
	_objectIDs pushback 142;
	_this setPosWorld [24017.2,17582,4.64832];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item143 = objNull;
if (_layerRoot) then {
	_item143 = createVehicle ["Land_vn_zed_civil",[24001.9,17592,0],[],0,"CAN_COLLIDE"];
	_this = _item143;
	_objects pushback _this;
	_objectIDs pushback 143;
	_this setPosWorld [24001.9,17592,4.67169];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item144 = objNull;
if (_layerRoot) then {
	_item144 = createVehicle ["Land_vn_zed_civil",[24022.3,17578.6,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item144;
	_objects pushback _this;
	_objectIDs pushback 144;
	_this setPosWorld [24022.3,17578.6,4.63299];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item145 = objNull;
if (_layerRoot) then {
	_item145 = createVehicle ["Land_vn_zed_civil",[24027.4,17575.3,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item145;
	_objects pushback _this;
	_objectIDs pushback 145;
	_this setPosWorld [24027.4,17575.3,4.58242];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item146 = objNull;
if (_layerRoot) then {
	_item146 = createVehicle ["Land_vn_zed_civil",[24032.5,17571.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item146;
	_objects pushback _this;
	_objectIDs pushback 146;
	_this setPosWorld [24032.5,17571.9,4.52104];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this allowdamage false;;
};

private _item147 = objNull;
if (_layerRoot) then {
	_item147 = createVehicle ["Land_vn_zed_civil",[24014.3,17616.6,0],[],0,"CAN_COLLIDE"];
	_this = _item147;
	_objects pushback _this;
	_objectIDs pushback 147;
	_this setPosWorld [24014.3,17616.6,4.62037];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item148 = objNull;
if (_layerRoot) then {
	_item148 = createVehicle ["Land_vn_zed_dira_civil",[24017.5,17621.8,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item148;
	_objects pushback _this;
	_objectIDs pushback 148;
	_this setPosWorld [24017.5,17621.8,4.30272];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item149 = objNull;
if (_layerRoot) then {
	_item149 = createVehicle ["Land_vn_zed_podplaz_civil",[24010.9,17611.5,0],[],0,"CAN_COLLIDE"];
	_this = _item149;
	_objects pushback _this;
	_objectIDs pushback 149;
	_this setPosWorld [24010.9,17611.5,4.64508];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item150 = objNull;
if (_layerRoot) then {
	_item150 = createVehicle ["Land_vn_zed_civil",[24021,17626.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item150;
	_objects pushback _this;
	_objectIDs pushback 150;
	_this setPosWorld [24021,17626.8,4.53204];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item151 = objNull;
if (_layerRoot) then {
	_item151 = createVehicle ["Land_vn_zed_civil",[24007.6,17606.5,0],[],0,"CAN_COLLIDE"];
	_this = _item151;
	_objects pushback _this;
	_objectIDs pushback 151;
	_this setPosWorld [24007.6,17606.5,4.65871];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item152 = objNull;
if (_layerRoot) then {
	_item152 = createVehicle ["Land_vn_zed_civil",[24004.2,17601.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item152;
	_objects pushback _this;
	_objectIDs pushback 152;
	_this setPosWorld [24004.2,17601.3,4.66864];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item153 = objNull;
if (_layerRoot) then {
	_item153 = createVehicle ["Land_vn_zed_civil",[24000.9,17596.3,0],[],0,"CAN_COLLIDE"];
	_this = _item153;
	_objects pushback _this;
	_objectIDs pushback 153;
	_this setPosWorld [24000.9,17596.3,4.67307];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item154 = objNull;
if (_layerRoot) then {
	_item154 = createVehicle ["Land_vn_zed_civil",[24045.6,17614.5,0],[],0,"CAN_COLLIDE"];
	_this = _item154;
	_objects pushback _this;
	_objectIDs pushback 154;
	_this setPosWorld [24045.6,17614.5,4.07794];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item155 = objNull;
if (_layerRoot) then {
	_item155 = createVehicle ["Land_vn_zed_dira_civil",[24050.7,17611.2,0],[],0,"CAN_COLLIDE"];
	_this = _item155;
	_objects pushback _this;
	_objectIDs pushback 155;
	_this setPosWorld [24050.7,17611.2,3.64905];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item156 = objNull;
if (_layerRoot) then {
	_item156 = createVehicle ["Land_vn_zed_podplaz_civil",[24040.5,17617.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item156;
	_objects pushback _this;
	_objectIDs pushback 156;
	_this setPosWorld [24040.5,17617.8,4.19766];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item157 = objNull;
if (_layerRoot) then {
	_item157 = createVehicle ["Land_vn_zed_civil",[24055.8,17607.8,0],[],0,"CAN_COLLIDE"];
	_this = _item157;
	_objects pushback _this;
	_objectIDs pushback 157;
	_this setPosWorld [24055.8,17607.8,3.7933];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item158 = objNull;
if (_layerRoot) then {
	_item158 = createVehicle ["Land_vn_zed_civil",[24035.4,17621.2,0],[],0,"CAN_COLLIDE"];
	_this = _item158;
	_objects pushback _this;
	_objectIDs pushback 158;
	_this setPosWorld [24035.4,17621.2,4.30263];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item159 = objNull;
if (_layerRoot) then {
	_item159 = createVehicle ["Land_vn_zed_civil",[24030.3,17624.5,0],[],0,"CAN_COLLIDE"];
	_this = _item159;
	_objects pushback _this;
	_objectIDs pushback 159;
	_this setPosWorld [24030.3,17624.5,4.39133];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item160 = objNull;
if (_layerRoot) then {
	_item160 = createVehicle ["Land_vn_zed_civil",[24025.2,17627.9,0],[],0,"CAN_COLLIDE"];
	_this = _item160;
	_objects pushback _this;
	_objectIDs pushback 160;
	_this setPosWorld [24025.2,17627.9,4.45768];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item161 = objNull;
if (_layerRoot) then {
	_item161 = createVehicle ["Land_vn_zed_civil",[24036.8,17573,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item161;
	_objects pushback _this;
	_objectIDs pushback 161;
	_this setPosWorld [24036.8,17573,4.44729];
	_this setVectorDirAndUp [[-0.834658,0.550768,0],[0,0,1]];
	_this allowdamage false;;
};

private _item162 = objNull;
if (_layerRoot) then {
	_item162 = createVehicle ["Land_vn_zed_civil",[24056.8,17603.5,0],[],0,"CAN_COLLIDE"];
	_this = _item162;
	_objects pushback _this;
	_objectIDs pushback 162;
	_this setPosWorld [24056.8,17603.5,3.79734];
	_this setVectorDirAndUp [[-0.833883,0.551942,0],[0,0,1]];
	_this allowdamage false;;
};

private _item163 = objNull;
if (_layerRoot) then {
	_item163 = createVehicle ["Land_vn_zed_civil",[23976.1,17559.6,0],[],0,"CAN_COLLIDE"];
	_this = _item163;
	_objects pushback _this;
	_objectIDs pushback 163;
	_this setPosWorld [23976.1,17559.6,4.67425];
	_this setVectorDirAndUp [[0.834455,-0.551076,0],[0,0,1]];
	_this allowdamage false;;
};

private _item164 = objNull;
if (_layerRoot) then {
	_item164 = createVehicle ["Land_vn_zed_civil",[23980.3,17560.6,0],[],0,"CAN_COLLIDE"];
	_this = _item164;
	_objects pushback _this;
	_objectIDs pushback 164;
	_this setPosWorld [23980.3,17560.6,4.67425];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item165 = objNull;
if (_layerRoot) then {
	_item165 = createVehicle ["Land_vn_zed_civil",[23985.4,17557.3,0],[],0,"CAN_COLLIDE"];
	_this = _item165;
	_objects pushback _this;
	_objectIDs pushback 165;
	_this setPosWorld [23985.4,17557.3,4.67392];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item166 = objNull;
if (_layerRoot) then {
	_item166 = createVehicle ["Land_vn_zed_civil",[23990.5,17553.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item166;
	_objects pushback _this;
	_objectIDs pushback 166;
	_this setPosWorld [23990.5,17553.9,4.66943];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item167 = objNull;
if (_layerRoot) then {
	_item167 = createVehicle ["Land_vn_zed_podplaz_civil",[23995.6,17550.5,0],[],0,"CAN_COLLIDE"];
	_this = _item167;
	_objects pushback _this;
	_objectIDs pushback 167;
	_this setPosWorld [23995.6,17550.5,4.66083];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item168 = objNull;
if (_layerRoot) then {
	_item168 = createVehicle ["Land_vn_zed_civil",[24000.7,17547.2,0],[],0,"CAN_COLLIDE"];
	_this = _item168;
	_objects pushback _this;
	_objectIDs pushback 168;
	_this setPosWorld [24000.7,17547.2,4.64772];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item169 = objNull;
if (_layerRoot) then {
	_item169 = createVehicle ["Land_vn_zed_dira_civil",[24005.9,17544,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item169;
	_objects pushback _this;
	_objectIDs pushback 169;
	_this setPosWorld [24005.9,17544,4.33945];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item170 = objNull;
if (_layerRoot) then {
	_item170 = createVehicle ["Land_vn_zed_civil",[24010.9,17540.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item170;
	_objects pushback _this;
	_objectIDs pushback 170;
	_this setPosWorld [24010.9,17540.5,4.56811];
	_this setVectorDirAndUp [[-0.551785,-0.833986,0],[0,0,1]];
	_this allowdamage false;;
};

private _item171 = objNull;
if (_layerRoot) then {
	_item171 = createVehicle ["Land_vn_zed_civil",[24011.9,17536.3,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item171;
	_objects pushback _this;
	_objectIDs pushback 171;
	_this setPosWorld [24011.9,17536.3,4.5253];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item172 = objNull;
if (_layerRoot) then {
	_item172 = createVehicle ["Land_vn_zed_civil",[24008.6,17531.2,0],[],0,"CAN_COLLIDE"];
	_this = _item172;
	_objects pushback _this;
	_objectIDs pushback 172;
	_this setPosWorld [24008.6,17531.2,4.51888];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item173 = objNull;
if (_layerRoot) then {
	_item173 = createVehicle ["Land_vn_zed_civil",[24005.2,17526.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item173;
	_objects pushback _this;
	_objectIDs pushback 173;
	_this setPosWorld [24005.2,17526.1,4.51596];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item174 = objNull;
if (_layerRoot) then {
	_item174 = createVehicle ["Land_vn_zed_podplaz_civil",[24001.9,17521,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item174;
	_objects pushback _this;
	_objectIDs pushback 174;
	_this setPosWorld [24001.9,17521,4.50697];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item175 = objNull;
if (_layerRoot) then {
	_item175 = createVehicle ["Land_vn_zed_civil",[23998.5,17515.9,-4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item175;
	_objects pushback _this;
	_objectIDs pushback 175;
	_this setPosWorld [23998.5,17515.9,4.48383];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item176 = objNull;
if (_layerRoot) then {
	_item176 = createVehicle ["Land_vn_zed_dira_civil",[23995.3,17510.7,0],[],0,"CAN_COLLIDE"];
	_this = _item176;
	_objects pushback _this;
	_objectIDs pushback 176;
	_this setPosWorld [23995.3,17510.7,4.20521];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item177 = objNull;
if (_layerRoot) then {
	_item177 = createVehicle ["Land_vn_zed_civil",[23991.8,17505.7,0],[],0,"CAN_COLLIDE"];
	_this = _item177;
	_objects pushback _this;
	_objectIDs pushback 177;
	_this setPosWorld [23991.8,17505.7,4.45833];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item178 = objNull;
if (_layerRoot) then {
	_item178 = createVehicle ["Land_vn_zed_civil",[23987.6,17504.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item178;
	_objects pushback _this;
	_objectIDs pushback 178;
	_this setPosWorld [23987.6,17504.7,4.50687];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item179 = objNull;
if (_layerRoot) then {
	_item179 = createVehicle ["Land_vn_zed_civil",[23982.5,17508,0],[],0,"CAN_COLLIDE"];
	_this = _item179;
	_objects pushback _this;
	_objectIDs pushback 179;
	_this setPosWorld [23982.5,17508,4.57735];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item180 = objNull;
if (_layerRoot) then {
	_item180 = createVehicle ["Land_vn_zed_civil",[23977.4,17511.4,0],[],0,"CAN_COLLIDE"];
	_this = _item180;
	_objects pushback _this;
	_objectIDs pushback 180;
	_this setPosWorld [23977.4,17511.4,4.63];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item181 = objNull;
if (_layerRoot) then {
	_item181 = createVehicle ["Land_vn_zed_podplaz_civil",[23972.3,17514.7,0],[],0,"CAN_COLLIDE"];
	_this = _item181;
	_objects pushback _this;
	_objectIDs pushback 181;
	_this setPosWorld [23972.3,17514.7,4.65107];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item182 = objNull;
if (_layerRoot) then {
	_item182 = createVehicle ["Land_vn_zed_civil",[23967.2,17518.1,0],[],0,"CAN_COLLIDE"];
	_this = _item182;
	_objects pushback _this;
	_objectIDs pushback 182;
	_this setPosWorld [23967.2,17518.1,4.66541];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item183 = objNull;
if (_layerRoot) then {
	_item183 = createVehicle ["Land_vn_zed_dira_civil",[23962.1,17521.3,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item183;
	_objects pushback _this;
	_objectIDs pushback 183;
	_this setPosWorld [23962.1,17521.3,4.39097];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item184 = objNull;
if (_layerRoot) then {
	_item184 = createVehicle ["Land_vn_zed_civil",[23957,17524.8,0],[],0,"CAN_COLLIDE"];
	_this = _item184;
	_objects pushback _this;
	_objectIDs pushback 184;
	_this setPosWorld [23957,17524.8,4.67425];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item185 = objNull;
if (_layerRoot) then {
	_item185 = createVehicle ["Land_vn_zed_civil",[23956,17529,0],[],0,"CAN_COLLIDE"];
	_this = _item185;
	_objects pushback _this;
	_objectIDs pushback 185;
	_this setPosWorld [23956,17529,4.67425];
	_this setVectorDirAndUp [[0.833678,-0.55225,0],[0,0,1]];
	_this allowdamage false;;
};

private _item186 = objNull;
if (_layerRoot) then {
	_item186 = createVehicle ["Land_vn_zed_civil",[23874.6,17478.9,0],[],0,"CAN_COLLIDE"];
	_this = _item186;
	_objects pushback _this;
	_objectIDs pushback 186;
	_this setPosWorld [23874.6,17478.9,4.67425];
	_this setVectorDirAndUp [[0.550921,0.834558,0],[0,0,1]];
	_this allowdamage false;;
};

private _item187 = objNull;
if (_layerRoot) then {
	_item187 = createVehicle ["Land_vn_zed_civil",[23873.5,17483.1,0],[],0,"CAN_COLLIDE"];
	_this = _item187;
	_objects pushback _this;
	_objectIDs pushback 187;
	_this setPosWorld [23873.5,17483.1,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item188 = objNull;
if (_layerRoot) then {
	_item188 = createVehicle ["Land_vn_zed_civil",[23876.9,17488.2,0],[],0,"CAN_COLLIDE"];
	_this = _item188;
	_objects pushback _this;
	_objectIDs pushback 188;
	_this setPosWorld [23876.9,17488.2,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item189 = objNull;
if (_layerRoot) then {
	_item189 = createVehicle ["Land_vn_zed_civil",[23880.2,17493.3,0],[],0,"CAN_COLLIDE"];
	_this = _item189;
	_objects pushback _this;
	_objectIDs pushback 189;
	_this setPosWorld [23880.2,17493.3,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item190 = objNull;
if (_layerRoot) then {
	_item190 = createVehicle ["Land_vn_zed_podplaz_civil",[23883.6,17498.4,0],[],0,"CAN_COLLIDE"];
	_this = _item190;
	_objects pushback _this;
	_objectIDs pushback 190;
	_this setPosWorld [23883.6,17498.4,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item191 = objNull;
if (_layerRoot) then {
	_item191 = createVehicle ["Land_vn_zed_civil",[23886.9,17503.5,0],[],0,"CAN_COLLIDE"];
	_this = _item191;
	_objects pushback _this;
	_objectIDs pushback 191;
	_this setPosWorld [23886.9,17503.5,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item192 = objNull;
if (_layerRoot) then {
	_item192 = createVehicle ["Land_vn_zed_dira_civil",[23890.2,17508.7,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item192;
	_objects pushback _this;
	_objectIDs pushback 192;
	_this setPosWorld [23890.2,17508.7,4.39097];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item193 = objNull;
if (_layerRoot) then {
	_item193 = createVehicle ["Land_vn_zed_civil",[23893.6,17513.7,0],[],0,"CAN_COLLIDE"];
	_this = _item193;
	_objects pushback _this;
	_objectIDs pushback 193;
	_this setPosWorld [23893.6,17513.7,4.67425];
	_this setVectorDirAndUp [[0.834233,-0.551412,0],[0,0,1]];
	_this allowdamage false;;
};

private _item194 = objNull;
if (_layerRoot) then {
	_item194 = createVehicle ["Land_vn_zed_civil",[23897.9,17514.7,0],[],0,"CAN_COLLIDE"];
	_this = _item194;
	_objects pushback _this;
	_objectIDs pushback 194;
	_this setPosWorld [23897.9,17514.7,4.67425];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item195 = objNull;
if (_layerRoot) then {
	_item195 = createVehicle ["Land_vn_zed_civil",[23903,17511.4,0],[],0,"CAN_COLLIDE"];
	_this = _item195;
	_objects pushback _this;
	_objectIDs pushback 195;
	_this setPosWorld [23903,17511.4,4.67425];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item196 = objNull;
if (_layerRoot) then {
	_item196 = createVehicle ["Land_vn_zed_civil",[23908.1,17508,0],[],0,"CAN_COLLIDE"];
	_this = _item196;
	_objects pushback _this;
	_objectIDs pushback 196;
	_this setPosWorld [23908.1,17508,4.67425];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item199 = objNull;
if (_layerRoot) then {
	_item199 = createVehicle ["Land_vn_zed_dira_civil",[23923.4,17498.1,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item199;
	_objects pushback _this;
	_objectIDs pushback 199;
	_this setPosWorld [23923.4,17498.1,4.39097];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item200 = objNull;
if (_layerRoot) then {
	_item200 = createVehicle ["Land_vn_zed_civil",[23928.4,17494.6,0],[],0,"CAN_COLLIDE"];
	_this = _item200;
	_objects pushback _this;
	_objectIDs pushback 200;
	_this setPosWorld [23928.4,17494.6,4.67425];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item201 = objNull;
if (_layerRoot) then {
	_item201 = createVehicle ["Land_vn_zed_civil",[23929.5,17490.4,0],[],0,"CAN_COLLIDE"];
	_this = _item201;
	_objects pushback _this;
	_objectIDs pushback 201;
	_this setPosWorld [23929.5,17490.4,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item202 = objNull;
if (_layerRoot) then {
	_item202 = createVehicle ["Land_vn_zed_civil",[23926.1,17485.3,0],[],0,"CAN_COLLIDE"];
	_this = _item202;
	_objects pushback _this;
	_objectIDs pushback 202;
	_this setPosWorld [23926.1,17485.3,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item203 = objNull;
if (_layerRoot) then {
	_item203 = createVehicle ["Land_vn_zed_civil",[23922.8,17480.2,0],[],0,"CAN_COLLIDE"];
	_this = _item203;
	_objects pushback _this;
	_objectIDs pushback 203;
	_this setPosWorld [23922.8,17480.2,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item204 = objNull;
if (_layerRoot) then {
	_item204 = createVehicle ["Land_vn_zed_podplaz_civil",[23919.4,17475.1,0],[],0,"CAN_COLLIDE"];
	_this = _item204;
	_objects pushback _this;
	_objectIDs pushback 204;
	_this setPosWorld [23919.4,17475.1,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item205 = objNull;
if (_layerRoot) then {
	_item205 = createVehicle ["Land_vn_zed_civil",[23916.1,17470,0],[],0,"CAN_COLLIDE"];
	_this = _item205;
	_objects pushback _this;
	_objectIDs pushback 205;
	_this setPosWorld [23916.1,17470,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item206 = objNull;
if (_layerRoot) then {
	_item206 = createVehicle ["Land_vn_zed_dira_civil",[23912.8,17464.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item206;
	_objects pushback _this;
	_objectIDs pushback 206;
	_this setPosWorld [23912.8,17464.9,4.39097];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item207 = objNull;
if (_layerRoot) then {
	_item207 = createVehicle ["Land_vn_zed_civil",[23909.4,17459.8,0],[],0,"CAN_COLLIDE"];
	_this = _item207;
	_objects pushback _this;
	_objectIDs pushback 207;
	_this setPosWorld [23909.4,17459.8,4.67425];
	_this setVectorDirAndUp [[-0.833845,0.551998,0],[0,0,1]];
	_this allowdamage false;;
};

private _item208 = objNull;
if (_layerRoot) then {
	_item208 = createVehicle ["Land_vn_zed_civil",[23905.1,17458.8,0],[],0,"CAN_COLLIDE"];
	_this = _item208;
	_objects pushback _this;
	_objectIDs pushback 208;
	_this setPosWorld [23905.1,17458.8,4.67425];
	_this setVectorDirAndUp [[0.552093,0.833783,0],[0,0,1]];
	_this allowdamage false;;
};

private _item209 = objNull;
if (_layerRoot) then {
	_item209 = createVehicle ["Land_vn_zed_civil",[23900,17462.2,0],[],0,"CAN_COLLIDE"];
	_this = _item209;
	_objects pushback _this;
	_objectIDs pushback 209;
	_this setPosWorld [23900,17462.2,4.67425];
	_this setVectorDirAndUp [[0.552093,0.833783,0],[0,0,1]];
	_this allowdamage false;;
};

private _item211 = objNull;
if (_layerRoot) then {
	_item211 = createVehicle ["Land_vn_garagerow_01_small_f",[23898.9,17503.3,0],[],0,"CAN_COLLIDE"];
	_this = _item211;
	_objects pushback _this;
	_objectIDs pushback 211;
	_this setPosWorld [23898.9,17503.3,4.7782];
	_this setVectorDirAndUp [[-0.552024,-0.833828,0],[0,0,1]];
};

private _item212 = objNull;
if (_layerRoot) then {
	_item212 = createVehicle ["Land_vn_garagerow_01_small_f",[23885.7,17484.8,0],[],0,"CAN_COLLIDE"];
	_this = _item212;
	_objects pushback _this;
	_objectIDs pushback 212;
	_this setPosWorld [23885.7,17484.8,4.7782];
	_this setVectorDirAndUp [[0.833957,-0.551829,0],[0,0,1]];
};

private _item213 = objNull;
if (_layerRoot) then {
	_item213 = createVehicle ["Land_BagFence_Round_F",[23898.3,17492.8,0],[],0,"CAN_COLLIDE"];
	_this = _item213;
	_objects pushback _this;
	_objectIDs pushback 213;
	_this setPosWorld [23898.3,17492.8,3.60931];
	_this setVectorDirAndUp [[-0.916136,0.400867,0],[0,0,1]];
	_this allowdamage false;;
};

private _item214 = objNull;
if (_layerRoot) then {
	_item214 = createVehicle ["Land_BagFence_Round_F",[23895.3,17491.7,0],[],0,"CAN_COLLIDE"];
	_this = _item214;
	_objects pushback _this;
	_objectIDs pushback 214;
	_this setPosWorld [23895.3,17491.7,3.60931];
	_this setVectorDirAndUp [[0.428581,0.903503,0],[0,0,1]];
	_this allowdamage false;;
};

private _item215 = objNull;
if (_layerRoot) then {
	_item215 = createVehicle ["Land_BagFence_Round_F",[23894.2,17494.6,0],[],0,"CAN_COLLIDE"];
	_this = _item215;
	_objects pushback _this;
	_objectIDs pushback 215;
	_this setPosWorld [23894.2,17494.6,3.60931];
	_this setVectorDirAndUp [[0.947416,-0.320005,0],[0,0,1]];
	_this allowdamage false;;
};

private _item216 = objNull;
if (_layerRoot) then {
	_item216 = createVehicle ["Land_BagFence_Round_F",[23897,17495.9,0],[],0,"CAN_COLLIDE"];
	_this = _item216;
	_objects pushback _this;
	_objectIDs pushback 216;
	_this setPosWorld [23897,17495.9,3.60931];
	_this setVectorDirAndUp [[-0.348861,-0.937175,0],[0,0,1]];
	_this allowdamage false;;
};

private _item217 = objNull;
if (_layerRoot) then {
	_item217 = createVehicle ["Land_vn_zed_civil",[23898.7,17532.4,0],[],0,"CAN_COLLIDE"];
	_this = _item217;
	_objects pushback _this;
	_objectIDs pushback 217;
	_this setPosWorld [23898.7,17532.4,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item218 = objNull;
if (_layerRoot) then {
	_item218 = createVehicle ["Land_vn_zed_civil",[23902,17537.5,0],[],0,"CAN_COLLIDE"];
	_this = _item218;
	_objects pushback _this;
	_objectIDs pushback 218;
	_this setPosWorld [23902,17537.5,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item219 = objNull;
if (_layerRoot) then {
	_item219 = createVehicle ["Land_vn_zed_civil",[23905.4,17542.6,0],[],0,"CAN_COLLIDE"];
	_this = _item219;
	_objects pushback _this;
	_objectIDs pushback 219;
	_this setPosWorld [23905.4,17542.6,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item220 = objNull;
if (_layerRoot) then {
	_item220 = createVehicle ["Land_vn_zed_podplaz_civil",[23908.7,17547.7,0],[],0,"CAN_COLLIDE"];
	_this = _item220;
	_objects pushback _this;
	_objectIDs pushback 220;
	_this setPosWorld [23908.7,17547.7,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item221 = objNull;
if (_layerRoot) then {
	_item221 = createVehicle ["Land_vn_zed_civil",[23912.1,17552.8,0],[],0,"CAN_COLLIDE"];
	_this = _item221;
	_objects pushback _this;
	_objectIDs pushback 221;
	_this setPosWorld [23912.1,17552.8,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item222 = objNull;
if (_layerRoot) then {
	_item222 = createVehicle ["Land_vn_zed_dira_civil",[23915.3,17557.9,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item222;
	_objects pushback _this;
	_objectIDs pushback 222;
	_this setPosWorld [23915.3,17557.9,4.39097];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item223 = objNull;
if (_layerRoot) then {
	_item223 = createVehicle ["Land_vn_zed_civil",[23918.8,17562.9,0],[],0,"CAN_COLLIDE"];
	_this = _item223;
	_objects pushback _this;
	_objectIDs pushback 223;
	_this setPosWorld [23918.8,17562.9,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item224 = objNull;
if (_layerRoot) then {
	_item224 = createVehicle ["Land_vn_zed_civil",[23923,17564,0],[],0,"CAN_COLLIDE"];
	_this = _item224;
	_objects pushback _this;
	_objectIDs pushback 224;
	_this setPosWorld [23923,17564,4.67425];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item225 = objNull;
if (_layerRoot) then {
	_item225 = createVehicle ["Land_vn_zed_civil",[23928.1,17560.7,0],[],0,"CAN_COLLIDE"];
	_this = _item225;
	_objects pushback _this;
	_objectIDs pushback 225;
	_this setPosWorld [23928.1,17560.7,4.67425];
	_this setVectorDirAndUp [[-0.551849,-0.833944,0],[0,0,1]];
	_this allowdamage false;;
};

private _item226 = objNull;
if (_layerRoot) then {
	_item226 = createVehicle ["Land_vn_zed_podplaz_civil",[23895.3,17527.3,0],[],0,"CAN_COLLIDE"];
	_this = _item226;
	_objects pushback _this;
	_objectIDs pushback 226;
	_this setPosWorld [23895.3,17527.3,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item227 = objNull;
if (_layerRoot) then {
	_item227 = createVehicle ["Land_vn_zed_civil",[23892,17522.2,0],[],0,"CAN_COLLIDE"];
	_this = _item227;
	_objects pushback _this;
	_objectIDs pushback 227;
	_this setPosWorld [23892,17522.2,4.67425];
	_this setVectorDirAndUp [[0.83398,-0.551794,0],[0,0,1]];
	_this allowdamage false;;
};

private _item228 = objNull;
if (_layerRoot) then {
	_item228 = createVehicle ["Land_vn_zed_civil",[23892.8,17518.1,0],[],0,"CAN_COLLIDE"];
	_this = _item228;
	_objects pushback _this;
	_objectIDs pushback 228;
	_this setPosWorld [23892.8,17518.1,4.67425];
	_this setVectorDirAndUp [[-0.552348,-0.833614,0],[0,0,1]];
	_this allowdamage false;;
};

private _item230 = objNull;
if (_layerRoot) then {
	_item230 = createVehicle ["Land_vn_zed_civil",[23933.2,17557.3,0],[],0,"CAN_COLLIDE"];
	_this = _item230;
	_objects pushback _this;
	_objectIDs pushback 230;
	_this setPosWorld [23933.2,17557.3,4.67425];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item231 = objNull;
if (_layerRoot) then {
	_item231 = createVehicle ["Land_vn_zed_civil",[23937.4,17558.3,0],[],0,"CAN_COLLIDE"];
	_this = _item231;
	_objects pushback _this;
	_objectIDs pushback 231;
	_this setPosWorld [23937.4,17558.3,4.67425];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item232 = objNull;
if (_layerRoot) then {
	_item232 = createVehicle ["Land_vn_zed_dira_civil",[23940.9,17563.4,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item232;
	_objects pushback _this;
	_objectIDs pushback 232;
	_this setPosWorld [23940.9,17563.4,4.39097];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item233 = objNull;
if (_layerRoot) then {
	_item233 = createVehicle ["Land_vn_zed_civil",[23944.1,17568.5,0],[],0,"CAN_COLLIDE"];
	_this = _item233;
	_objects pushback _this;
	_objectIDs pushback 233;
	_this setPosWorld [23944.1,17568.5,4.67425];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item234 = objNull;
if (_layerRoot) then {
	_item234 = createVehicle ["Land_vn_zed_podplaz_civil",[23947.5,17573.6,0],[],0,"CAN_COLLIDE"];
	_this = _item234;
	_objects pushback _this;
	_objectIDs pushback 234;
	_this setPosWorld [23947.5,17573.6,4.67425];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item235 = objNull;
if (_layerRoot) then {
	_item235 = createVehicle ["Land_vn_zed_civil",[23951.8,17574.3,0],[],0,"CAN_COLLIDE"];
	_this = _item235;
	_objects pushback _this;
	_objectIDs pushback 235;
	_this setPosWorld [23951.8,17574.3,4.67425];
	_this setVectorDirAndUp [[0.551987,0.833853,0],[0,0,1]];
	_this allowdamage false;;
};

private _item236 = objNull;
if (_layerRoot) then {
	_item236 = createVehicle ["Land_vn_zed_civil",[23956.9,17570.9,0],[],0,"CAN_COLLIDE"];
	_this = _item236;
	_objects pushback _this;
	_objectIDs pushback 236;
	_this setPosWorld [23956.9,17570.9,4.67425];
	_this setVectorDirAndUp [[0.551987,0.833853,0],[0,0,1]];
	_this allowdamage false;;
};

private _item237 = objNull;
if (_layerRoot) then {
	_item237 = createVehicle ["Land_vn_zed_civil",[23962,17567.6,0],[],0,"CAN_COLLIDE"];
	_this = _item237;
	_objects pushback _this;
	_objectIDs pushback 237;
	_this setPosWorld [23962,17567.6,4.67425];
	_this setVectorDirAndUp [[0.551987,0.833853,0],[0,0,1]];
	_this allowdamage false;;
};

private _item238 = objNull;
if (_layerRoot) then {
	_item238 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23958,17603.7,0],[],0,"CAN_COLLIDE"];
	_this = _item238;
	_objects pushback _this;
	_objectIDs pushback 238;
	_this setPosWorld [23958,17603.7,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item239 = objNull;
if (_layerRoot) then {
	_item239 = createVehicle ["Land_vn_b_trench_revetment_05_01",[23953.4,17596.4,0],[],0,"CAN_COLLIDE"];
	_this = _item239;
	_objects pushback _this;
	_objectIDs pushback 239;
	_this setPosWorld [23953.4,17596.4,2.85978];
	_this setVectorDirAndUp [[0.827052,-0.562126,0],[0,0,1]];
};

private _item240 = objNull;
if (_layerRoot) then {
	_item240 = createVehicle ["Land_vn_b_trench_bunker_04_01",[24088.8,17623.4,0.0572681],[],0,"CAN_COLLIDE"];
	_this = _item240;
	_objects pushback _this;
	_objectIDs pushback 240;
	_this setPosWorld [24088.8,17623.4,7.74442];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item241 = objNull;
if (_layerRoot) then {
	_item241 = createVehicle ["Land_vn_b_tower_01",[24080.3,17578.3,4.86374e-005],[],0,"CAN_COLLIDE"];
	_this = _item241;
	_objects pushback _this;
	_objectIDs pushback 241;
	_this setPosWorld [24080.3,17578.3,7.498];
	_this setVectorDirAndUp [[0.841734,-0.539892,0],[0,0,1]];
};

private _item242 = objNull;
if (_layerRoot) then {
	_item242 = createVehicle ["Land_vn_b_trench_20_02",[24058.3,17667.5,-0.322529],[],0,"CAN_COLLIDE"];
	_this = _item242;
	_objects pushback _this;
	_objectIDs pushback 242;
	_this setPosWorld [24058.3,17667.5,5.14672];
	_this setVectorDirAndUp [[0.587606,0.809147,-4.24683e-007],[-0.043969,0.031931,0.998522]];
};

private _item243 = objNull;
if (_layerRoot) then {
	_item243 = createVehicle ["Land_vn_b_trench_20_01",[24063.8,17555,6.81877e-005],[],0,"CAN_COLLIDE"];
	_this = _item243;
	_objects pushback _this;
	_objectIDs pushback 243;
	_this setPosWorld [24063.8,17555,5.17548];
	_this setVectorDirAndUp [[-0.832733,0.553674,0],[0,0,1]];
};

private _item244 = objNull;
if (_layerRoot) then {
	_item244 = createVehicle ["Land_vn_b_trench_45_02",[24079.4,17627.4,0],[],0,"CAN_COLLIDE"];
	_this = _item244;
	_objects pushback _this;
	_objectIDs pushback 244;
	_this setPosWorld [24079.4,17627.4,5.67153];
	_this setVectorDirAndUp [[-0.397719,-0.917507,-3.02494e-006],[-0.0640689,0.0277691,0.997559]];
};

private _item245 = objNull;
if (_layerRoot) then {
	_item245 = createVehicle ["Land_vn_b_trench_45_01",[24065.2,17634.9,0],[],0,"CAN_COLLIDE"];
	_this = _item245;
	_objects pushback _this;
	_objectIDs pushback 245;
	_this setPosWorld [24065.2,17634.9,4.39583];
	_this setVectorDirAndUp [[0.873712,-0.482926,0.058396],[-0.0842013,-0.0319074,0.995938]];
};

private _item246 = objNull;
if (_layerRoot) then {
	_item246 = createVehicle ["Land_vn_b_trench_90_02",[24066.9,17644.3,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item246;
	_objects pushback _this;
	_objectIDs pushback 246;
	_this setPosWorld [24066.9,17644.3,5.28803];
	_this setVectorDirAndUp [[-0.845033,0.534714,-1.82539e-006],[-0.0272977,-0.0431365,0.998696]];
};

private _item247 = objNull;
if (_layerRoot) then {
	_item247 = createVehicle ["Land_vn_b_trench_90_01",[24069.3,17626.6,0],[],0,"CAN_COLLIDE"];
	_this = _item247;
	_objects pushback _this;
	_objectIDs pushback 247;
	_this setPosWorld [24069.3,17626.6,4.58879];
	_this setVectorDirAndUp [[0.93767,0.330599,0.107141],[-0.101046,-0.0356213,0.994244]];
};

private _item249 = objNull;
if (_layerRoot) then {
	_item249 = createVehicle ["Land_vn_b_trench_firing_05",[24096.3,17612.3,4.95911e-005],[],0,"CAN_COLLIDE"];
	_this = _item249;
	_objects pushback _this;
	_objectIDs pushback 249;
	_this setPosWorld [24096.3,17612.3,6.70389];
	_this setVectorDirAndUp [[0.427797,0.903875,0],[0,0,1]];
};

private _item250 = objNull;
if (_layerRoot) then {
	_item250 = createVehicle ["Land_vn_b_trench_firing_01",[24062.8,17656.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item250;
	_objects pushback _this;
	_objectIDs pushback 250;
	_this setPosWorld [24062.8,17656.9,7.63398];
	_this setVectorDirAndUp [[0.639594,0.768713,0],[0,0,1]];
};

private _item251 = objNull;
if (_layerRoot) then {
	_item251 = createVehicle ["Land_vn_b_trench_corner_01",[24085.9,17625.1,-0.497639],[],0,"CAN_COLLIDE"];
	_this = _item251;
	_objects pushback _this;
	_objectIDs pushback 251;
	_this setPosWorld [24085.9,17625.1,6.87019];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item252 = objNull;
if (_layerRoot) then {
	_item252 = createVehicle ["Land_vn_b_trench_90_01",[24043.1,17671.1,0],[],0,"CAN_COLLIDE"];
	_this = _item252;
	_objects pushback _this;
	_objectIDs pushback 252;
	_this setPosWorld [24043.1,17671.1,3.41858];
	_this setVectorDirAndUp [[-0.570138,-0.816907,-0.0872143],[-0.151172,-2.81086e-005,0.988507]];
};

private _item253 = objNull;
if (_layerRoot) then {
	_item253 = createVehicle ["Land_vn_bunker_big_02",[24031.4,17673,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item253;
	_objects pushback _this;
	_objectIDs pushback 253;
	_this setPosWorld [24031.4,17673,4.71064];
	_this setVectorDirAndUp [[0.284064,-0.958805,0],[0,0,1]];
};

private _item254 = objNull;
if (_layerRoot) then {
	_item254 = createVehicle ["Land_vn_bagfence_01_round_green_f",[24025,17666.5,2.3365e-005],[],0,"CAN_COLLIDE"];
	_this = _item254;
	_objects pushback _this;
	_objectIDs pushback 254;
	_this setPosWorld [24025,17666.5,3.29762];
	_this setVectorDirAndUp [[0.884729,-0.466106,0],[0,0,1]];
};

private _item255 = objNull;
if (_layerRoot) then {
	_item255 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24027,17667.9,4.14848e-005],[],0,"CAN_COLLIDE"];
	_this = _item255;
	_objects pushback _this;
	_objectIDs pushback 255;
	_this setPosWorld [24027,17667.9,3.51438];
	_this setVectorDirAndUp [[-0.250264,0.968177,0],[0,0,1]];
	_this allowdamage false;;
};

private _item256 = objNull;
if (_layerRoot) then {
	_item256 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[24024.7,17664.1,5.03063e-005],[],0,"CAN_COLLIDE"];
	_this = _item256;
	_objects pushback _this;
	_objectIDs pushback 256;
	_this setPosWorld [24024.7,17664.1,3.54947];
	_this setVectorDirAndUp [[-0.968372,-0.249512,0],[0,0,1]];
	_this allowdamage false;;
};

private _item257 = objNull;
if (_layerRoot) then {
	_item257 = createVehicle ["Land_vn_b_trench_20_02",[24092,17601.7,0.522606],[],0,"CAN_COLLIDE"];
	_this = _item257;
	_objects pushback _this;
	_objectIDs pushback 257;
	_this setPosWorld [24092,17601.7,5.69979];
	_this setVectorDirAndUp [[0.966237,-0.252631,0.0506274],[-0.0578053,-0.0210668,0.998106]];
};

private _item258 = objNull;
if (_layerRoot) then {
	_item258 = createVehicle ["Land_vn_b_trench_45_01",[24085.5,17588.9,0.444514],[],0,"CAN_COLLIDE"];
	_this = _item258;
	_objects pushback _this;
	_objectIDs pushback 258;
	_this setPosWorld [24085.5,17588.9,5.30319];
	_this setVectorDirAndUp [[0.938471,-0.338496,0.0684986],[-0.069349,0.00959703,0.997546]];
};

private _item259 = objNull;
if (_layerRoot) then {
	_item259 = createVehicle ["Land_vn_b_trench_45_01",[24081.8,17571.3,0],[],0,"CAN_COLLIDE"];
	_this = _item259;
	_objects pushback _this;
	_objectIDs pushback 259;
	_this setPosWorld [24081.8,17571.3,5.16011];
	_this setVectorDirAndUp [[-0.178388,0.983823,0.0164343],[0.0150954,-0.0139639,0.999789]];
};

private _item260 = objNull;
if (_layerRoot) then {
	_item260 = createVehicle ["Land_vn_b_trench_45_01",[24087,17579.3,0.000226021],[],0,"CAN_COLLIDE"];
	_this = _item260;
	_objects pushback _this;
	_objectIDs pushback 260;
	_this setPosWorld [24087,17579.3,5.23073];
	_this setVectorDirAndUp [[-0.865898,0.496929,-0.0572868],[-0.0842013,-0.0319074,0.995938]];
};

private _item261 = objNull;
if (_layerRoot) then {
	_item261 = createVehicle ["Land_vn_b_trench_45_01",[24072.9,17567.5,0],[],0,"CAN_COLLIDE"];
	_this = _item261;
	_objects pushback _this;
	_objectIDs pushback 261;
	_this setPosWorld [24072.9,17567.5,5.07582];
	_this setVectorDirAndUp [[0.239232,-0.970938,0.00695215],[0.0346399,0.0156901,0.999277]];
};

private _item262 = objNull;
if (_layerRoot) then {
	_item262 = createVehicle ["Land_vn_b_trench_firing_05",[24061.1,17542.6,0.301069],[],0,"CAN_COLLIDE"];
	_this = _item262;
	_objects pushback _this;
	_objectIDs pushback 262;
	_this setPosWorld [24061.1,17542.6,5.93039];
	_this setVectorDirAndUp [[0.636203,0.771522,0],[0,0,1]];
};

private _item263 = objNull;
if (_layerRoot) then {
	_item263 = createVehicle ["Land_vn_b_trench_45_02",[24056,17535.2,0.20246],[],0,"CAN_COLLIDE"];
	_this = _item263;
	_objects pushback _this;
	_objectIDs pushback 263;
	_this setPosWorld [24056,17535.2,5.14848];
	_this setVectorDirAndUp [[-0.320662,0.94603,-0.0469298],[-0.023166,0.0416984,0.998862]];
};

private _item264 = objNull;
if (_layerRoot) then {
	_item264 = createVehicle ["Land_vn_b_trench_45_01",[24047.1,17532,0.188509],[],0,"CAN_COLLIDE"];
	_this = _item264;
	_objects pushback _this;
	_objectIDs pushback 264;
	_this setPosWorld [24047.1,17532,5.27198];
	_this setVectorDirAndUp [[0.287526,-0.957328,0.0292001],[0.0285103,0.0390288,0.998831]];
};

private _item265 = objNull;
if (_layerRoot) then {
	_item265 = createVehicle ["Land_vn_b_trench_20_01",[24038.3,17519.3,0],[],0,"CAN_COLLIDE"];
	_this = _item265;
	_objects pushback _this;
	_objectIDs pushback 265;
	_this setPosWorld [24038.3,17519.3,5.17088];
	_this setVectorDirAndUp [[-0.832733,0.553674,0],[0,0,1]];
};

private _item266 = objNull;
if (_layerRoot) then {
	_item266 = createVehicle ["Land_vn_b_trench_45_01",[24031.2,17506.7,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item266;
	_objects pushback _this;
	_objectIDs pushback 266;
	_this setPosWorld [24031.2,17506.7,5.5081];
	_this setVectorDirAndUp [[0.8443,-0.535862,-0.0031612],[0.0285103,0.0390283,0.998831]];
};

private _item267 = objNull;
if (_layerRoot) then {
	_item267 = createVehicle ["Land_vn_b_trench_45_01",[24031.1,17496.5,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item267;
	_objects pushback _this;
	_objectIDs pushback 267;
	_this setPosWorld [24031.1,17496.5,5.59725];
	_this setVectorDirAndUp [[-0.811004,0.585038,-0.00202606],[-0.0159324,-0.018624,0.9997]];
};

private _item268 = objNull;
if (_layerRoot) then {
	_item268 = createVehicle ["Land_vn_b_trench_45_01",[24025,17489.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item268;
	_objects pushback _this;
	_objectIDs pushback 268;
	_this setPosWorld [24025,17489.4,5.98519];
	_this setVectorDirAndUp [[0.0208369,0.999718,-0.0113603],[0.0061343,0.0112347,0.999918]];
};

private _item269 = objNull;
if (_layerRoot) then {
	_item269 = createVehicle ["Land_vn_b_trench_45_01",[24015.6,17487.4,0],[],0,"CAN_COLLIDE"];
	_this = _item269;
	_objects pushback _this;
	_objectIDs pushback 269;
	_this setPosWorld [24015.6,17487.4,5.74184];
	_this setVectorDirAndUp [[0.0572578,-0.997604,0.0388329],[-0.0318929,0.0370491,0.998804]];
};

private _item270 = objNull;
if (_layerRoot) then {
	_item270 = createVehicle ["Land_vn_b_tower_01",[24024.3,17495,0],[],0,"CAN_COLLIDE"];
	_this = _item270;
	_objects pushback _this;
	_objectIDs pushback 270;
	_this setPosWorld [24024.3,17495,8.76176];
	_this setVectorDirAndUp [[0.749753,-0.661717,0.000778616],[-0.000599914,0.000496931,1]];
};

private _item272 = objNull;
if (_layerRoot) then {
	_item272 = createVehicle ["Land_vn_b_trench_firing_05",[24010,17456.1,0.345243],[],0,"CAN_COLLIDE"];
	_this = _item272;
	_objects pushback _this;
	_objectIDs pushback 272;
	_this setPosWorld [24010,17456.1,6.05459];
	_this setVectorDirAndUp [[-0.0729497,0.997335,-0.000539371],[-0.000599915,0.000496931,1]];
};

private _item274 = objNull;
if (_layerRoot) then {
	_item274 = createVehicle ["Land_vn_b_trench_45_01",[23989.9,17451.6,0.000322819],[],0,"CAN_COLLIDE"];
	_this = _item274;
	_objects pushback _this;
	_objectIDs pushback 274;
	_this setPosWorld [23989.9,17451.6,5.23303];
	_this setVectorDirAndUp [[0.317777,-0.947695,0.0298637],[0.0266504,0.0404113,0.998828]];
};

private _item275 = objNull;
if (_layerRoot) then {
	_item275 = createVehicle ["Land_vn_b_trench_20_01",[23982.1,17439.6,0],[],0,"CAN_COLLIDE"];
	_this = _item275;
	_objects pushback _this;
	_objectIDs pushback 275;
	_this setPosWorld [23982.1,17439.6,5.06822];
	_this setVectorDirAndUp [[-0.8499,0.526944,-0.000771722],[-0.000599914,0.000496931,1]];
};

private _item276 = objNull;
if (_layerRoot) then {
	_item276 = createVehicle ["Land_vn_b_trench_45_01",[23975.4,17426.8,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item276;
	_objects pushback _this;
	_objectIDs pushback 276;
	_this setPosWorld [23975.4,17426.8,5.5703];
	_this setVectorDirAndUp [[0.8609,-0.508769,-0.00238636],[0.0266504,0.0404109,0.998828]];
};

private _item277 = objNull;
if (_layerRoot) then {
	_item277 = createVehicle ["Land_vn_b_trench_45_01",[23975.6,17416.6,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item277;
	_objects pushback _this;
	_objectIDs pushback 277;
	_this setPosWorld [23975.6,17416.6,5.72081];
	_this setVectorDirAndUp [[-0.811004,0.585038,-0.00202606],[-0.0159324,-0.018624,0.9997]];
};

private _item278 = objNull;
if (_layerRoot) then {
	_item278 = createVehicle ["Land_vn_b_trench_45_01",[23969.5,17409.5,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item278;
	_objects pushback _this;
	_objectIDs pushback 278;
	_this setPosWorld [23969.5,17409.5,5.14505];
	_this setVectorDirAndUp [[0.0208369,0.999718,-0.0113603],[0.0061343,0.0112347,0.999918]];
};

private _item279 = objNull;
if (_layerRoot) then {
	_item279 = createVehicle ["Land_vn_b_trench_45_01",[23960.1,17407.5,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item279;
	_objects pushback _this;
	_objectIDs pushback 279;
	_this setPosWorld [23960.1,17407.5,5.25474];
	_this setVectorDirAndUp [[0.0572578,-0.997604,0.0388329],[-0.0318929,0.0370491,0.998804]];
};

private _item280 = objNull;
if (_layerRoot) then {
	_item280 = createVehicle ["Land_vn_b_tower_01",[23968.7,17415.1,0],[],0,"CAN_COLLIDE"];
	_this = _item280;
	_objects pushback _this;
	_objectIDs pushback 280;
	_this setPosWorld [23968.7,17415.1,8.15579];
	_this setVectorDirAndUp [[0.749753,-0.661717,0.000778616],[-0.000599914,0.000496931,1]];
};

private _item281 = objNull;
if (_layerRoot) then {
	_item281 = createVehicle ["Land_vn_b_trench_bunker_04_01",[23947.3,17393.1,0],[],0,"CAN_COLLIDE"];
	_this = _item281;
	_objects pushback _this;
	_objectIDs pushback 281;
	_this setPosWorld [23947.3,17393.1,6.73455];
	_this setVectorDirAndUp [[0.983212,0.182469,0],[0,0,1]];
};

private _item282 = objNull;
if (_layerRoot) then {
	_item282 = createVehicle ["Land_vn_b_trench_45_02",[23952.9,17399.2,0],[],0,"CAN_COLLIDE"];
	_this = _item282;
	_objects pushback _this;
	_objectIDs pushback 282;
	_this setPosWorld [23952.9,17399.2,5.1455];
	_this setVectorDirAndUp [[-0.244561,0.968527,-0.04632],[-0.0250783,0.0414366,0.998826]];
};

private _item283 = objNull;
if (_layerRoot) then {
	_item283 = createVehicle ["Land_vn_b_trench_45_01",[23999.4,17463.6,0],[],0,"CAN_COLLIDE"];
	_this = _item283;
	_objects pushback _this;
	_objectIDs pushback 283;
	_this setPosWorld [23999.4,17463.6,5.34708];
	_this setVectorDirAndUp [[0.814247,-0.580516,0.00176142],[0.0266504,0.0404113,0.998828]];
};

private _item284 = objNull;
if (_layerRoot) then {
	_item284 = createVehicle ["Land_vn_b_trench_cross_01",[23999.1,17454.9,0],[],0,"CAN_COLLIDE"];
	_this = _item284;
	_objects pushback _this;
	_objectIDs pushback 284;
	_this setPosWorld [23999.1,17454.9,5.71727];
	_this setVectorDirAndUp [[-0.164806,0.986326,0],[0,0,1]];
};

private _item285 = objNull;
if (_layerRoot) then {
	_item285 = createVehicle ["Land_vn_b_trench_firing_02",[24005.3,17442.9,0.319593],[],0,"CAN_COLLIDE"];
	_this = _item285;
	_objects pushback _this;
	_objectIDs pushback 285;
	_this setPosWorld [24005.3,17442.9,5.46879];
	_this setVectorDirAndUp [[0.984666,0.17445,0],[0,0,1]];
};

private _item286 = objNull;
if (_layerRoot) then {
	_item286 = createVehicle ["Land_vn_b_trench_20_02",[24009.1,17473.4,0.262583],[],0,"CAN_COLLIDE"];
	_this = _item286;
	_objects pushback _this;
	_objectIDs pushback 286;
	_this setPosWorld [24009.1,17473.4,5.59744];
	_this setVectorDirAndUp [[0.83917,-0.543375,0.0232064],[-0.0321143,-0.0069113,0.99946]];
};

private _item288 = objNull;
if (_layerRoot) then {
	_item288 = createVehicle ["Land_vn_b_trench_wall_10_03",[24006.2,17439.3,-1.91117],[],0,"CAN_COLLIDE"];
	_this = _item288;
	_objects pushback _this;
	_objectIDs pushback 288;
	_this setPosWorld [24006.2,17439.3,3.89703];
	_this setVectorDirAndUp [[-0.213296,0.976988,0],[0,0,1]];
};

private _item289 = objNull;
if (_layerRoot) then {
	_item289 = createVehicle ["Land_vn_b_trench_45_02",[23935.2,17392.9,0.704651],[],0,"CAN_COLLIDE"];
	_this = _item289;
	_objects pushback _this;
	_objectIDs pushback 289;
	_this setPosWorld [23935.2,17392.9,4.90708];
	_this setVectorDirAndUp [[0.654555,0.755867,-0.0149228],[-0.0250783,0.0414364,0.998826]];
};

private _item290 = objNull;
if (_layerRoot) then {
	_item290 = createVehicle ["Land_vn_quonset_02",[23983.2,17615.6,2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item290;
	_objects pushback _this;
	_objectIDs pushback 290;
	_this setPosWorld [23983.2,17615.6,4.41804];
	_this setVectorDirAndUp [[0.551267,0.834329,0],[0,0,1]];
};

private _item292 = objNull;
if (_layerRoot) then {
	_item292 = createVehicle ["Land_vn_usaf_revetment_low_8",[23953.7,17608.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item292;
	_objects pushback _this;
	_objectIDs pushback 292;
	_this setPosWorld [23953.7,17608.9,3.19];
	_this setVectorDirAndUp [[0.827051,-0.562127,0],[0,0,1]];
};

private _item293 = objNull;
if (_layerRoot) then {
	_item293 = createVehicle ["Land_vn_usaf_revetment_low_8",[23936.2,17583.1,0],[],0,"CAN_COLLIDE"];
	_this = _item293;
	_objects pushback _this;
	_objectIDs pushback 293;
	_this setPosWorld [23936.2,17583.1,3.19];
	_this setVectorDirAndUp [[0.827051,-0.562127,0],[0,0,1]];
};

private _item295 = objNull;
if (_layerRoot) then {
	_item295 = createVehicle ["Land_vn_zed_civil",[23925.1,17468.5,0],[],0,"CAN_COLLIDE"];
	_this = _item295;
	_objects pushback _this;
	_objectIDs pushback 295;
	_this setPosWorld [23925.1,17468.5,4.67407];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item297 = objNull;
if (_layerRoot) then {
	_item297 = createVehicle ["Land_vn_zed_civil",[23935.3,17461.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item297;
	_objects pushback _this;
	_objectIDs pushback 297;
	_this setPosWorld [23935.3,17461.8,4.65666];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item298 = objNull;
if (_layerRoot) then {
	_item298 = createVehicle ["Land_vn_zed_podplaz_civil",[23940.4,17458.4,0],[],0,"CAN_COLLIDE"];
	_this = _item298;
	_objects pushback _this;
	_objectIDs pushback 298;
	_this setPosWorld [23940.4,17458.4,4.63914];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item299 = objNull;
if (_layerRoot) then {
	_item299 = createVehicle ["Land_vn_zed_civil",[23945.5,17455.1,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item299;
	_objects pushback _this;
	_objectIDs pushback 299;
	_this setPosWorld [23945.5,17455.1,4.60229];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item301 = objNull;
if (_layerRoot) then {
	_item301 = createVehicle ["Land_vn_zed_civil",[23955.7,17448.4,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item301;
	_objects pushback _this;
	_objectIDs pushback 301;
	_this setPosWorld [23955.7,17448.4,4.45723];
	_this setVectorDirAndUp [[0.552143,0.833749,0],[0,0,1]];
	_this allowdamage false;;
};

private _item302 = objNull;
if (_layerRoot) then {
	_item302 = createVehicle ["Land_vn_zed_civil",[23960,17449.4,0],[],0,"CAN_COLLIDE"];
	_this = _item302;
	_objects pushback _this;
	_objectIDs pushback 302;
	_this setPosWorld [23960,17449.4,4.43058];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item303 = objNull;
if (_layerRoot) then {
	_item303 = createVehicle ["Land_vn_zed_dira_civil",[23963.4,17454.4,0],[],0,"CAN_COLLIDE"];
	_this = _item303;
	_objects pushback _this;
	_objectIDs pushback 303;
	_this setPosWorld [23963.4,17454.4,4.1375];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item304 = objNull;
if (_layerRoot) then {
	_item304 = createVehicle ["Land_vn_zed_civil",[23966.7,17459.5,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item304;
	_objects pushback _this;
	_objectIDs pushback 304;
	_this setPosWorld [23966.7,17459.5,4.40009];
	_this setVectorDirAndUp [[-0.833749,0.552143,0],[0,0,1]];
	_this allowdamage false;;
};

private _item305 = objNull;
if (_layerRoot) then {
	_item305 = createVehicle ["Land_vn_zed_dira_civil",[23950.7,17451.7,0],[],0,"CAN_COLLIDE"];
	_this = _item305;
	_objects pushback _this;
	_objectIDs pushback 305;
	_this setPosWorld [23950.7,17451.7,4.25637];
	_this setVectorDirAndUp [[0.552141,0.833751,0],[0,0,1]];
	_this allowdamage false;;
};

private _item306 = objNull;
if (_layerRoot) then {
	_item306 = createVehicle ["Land_vn_zed_podplaz_civil",[23930.2,17464.9,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item306;
	_objects pushback _this;
	_objectIDs pushback 306;
	_this setPosWorld [23930.2,17464.9,4.66731];
	_this setVectorDirAndUp [[0.552141,0.833751,0],[0,0,1]];
	_this allowdamage false;;
};

private _item307 = objNull;
if (_layerRoot) then {
	_item307 = createVehicle ["vn_b_aus_army_static_m101_02",[17703.7,17305.4,0.0047226],[],0,"CAN_COLLIDE"];
	_this = _item307;
	_objects pushback _this;
	_objectIDs pushback 307;
	_this setPosWorld [17703.6,17308,81.1265];
	_this setVectorDirAndUp [[-0.955166,0.296068,0.00107596],[0.0213271,0.0651794,0.997646]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item308 = objNull;
if (_layerRoot) then {
	_item308 = createVehicle ["vn_b_aus_army_static_m101_02",[17752,17289.8,0.0121384],[],0,"CAN_COLLIDE"];
	_this = _item308;
	_objects pushback _this;
	_objectIDs pushback 308;
	_this setPosWorld [17751.9,17292.4,80.5105];
	_this setVectorDirAndUp [[0.695181,-0.718572,-0.0194307],[0.0293202,0.00133664,0.999569]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item309 = objNull;
if (_layerRoot) then {
	_item309 = createVehicle ["vn_b_aus_army_static_m101_02",[17727.9,17299.7,-0.0178223],[],0,"CAN_COLLIDE"];
	_this = _item309;
	_objects pushback _this;
	_objectIDs pushback 309;
	_this setPosWorld [17727.8,17302.3,81.2771];
	_this setVectorDirAndUp [[0.440682,0.896901,-0.0369713],[0.0133313,0.0346425,0.999311]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item310 = objNull;
if (_layerRoot) then {
	_item310 = createVehicle ["vn_o_kr_static_zgu1_01",[17738.4,17280.8,-0.000289917],[],0,"CAN_COLLIDE"];
	_this = _item310;
	_objects pushback _this;
	_objectIDs pushback 310;
	_this setPosWorld [17738.5,17280.8,82.463];
	_this setVectorDirAndUp [[0.0532908,-0.998537,-0.00920762],[0.0479432,-0.00665163,0.998828]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item311 = objNull;
if (_layerRoot) then {
	_item311 = createVehicle ["vn_o_kr_static_zgu1_01",[17706.7,17294,0.00314331],[],0,"CAN_COLLIDE"];
	_this = _item311;
	_objects pushback _this;
	_objectIDs pushback 311;
	_this setPosWorld [17706.7,17294,83.2911];
	_this setVectorDirAndUp [[-0.456065,-0.889297,0.0339944],[0.0173315,0.0293158,0.99942]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item312 = objNull;
if (_layerRoot) then {
	_item312 = createVehicle ["vn_o_kr_static_zgu1_01",[17738.9,17292.2,-0.00012207],[],0,"CAN_COLLIDE"];
	_this = _item312;
	_objects pushback _this;
	_objectIDs pushback 312;
	_this setPosWorld [17738.9,17292.2,82.5071];
	_this setVectorDirAndUp [[0.522245,0.852496,-0.0226157],[0.0519288,-0.00531936,0.998637]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item313 = objNull;
if (_layerRoot) then {
	_item313 = createVehicle ["vn_b_sf_static_m45",[17748.8,17279.7,-0.00228882],[],0,"CAN_COLLIDE"];
	_this = _item313;
	_objects pushback _this;
	_objectIDs pushback 313;
	_this setPosWorld [17748.9,17279.7,82.5128];
	_this setVectorDirAndUp [[0.950252,-0.310823,-0.0202708],[0.0213271,0,0.999773]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item314 = objNull;
if (_layerRoot) then {
	_item314 = createVehicle ["Land_Razorwire_F",[17691.5,17314.1,0],[],0,"CAN_COLLIDE"];
	_this = _item314;
	_objects pushback _this;
	_objectIDs pushback 314;
	_this setPosWorld [17691.5,17314.1,81.874];
	_this setVectorDirAndUp [[0.931879,-0.361648,-0.028482],[0.0572395,0.0690537,0.995969]];
	_this allowdamage false;;
};

private _item315 = objNull;
if (_layerRoot) then {
	_item315 = createVehicle ["Land_Razorwire_F",[17689.9,17303,0],[],0,"CAN_COLLIDE"];
	_this = _item315;
	_objects pushback _this;
	_objectIDs pushback 315;
	_this setPosWorld [17689.9,17303,82.6197];
	_this setVectorDirAndUp [[0.99261,0.113697,-0.0424043],[0.037308,0.0465838,0.998217]];
	_this allowdamage false;;
};

private _item316 = objNull;
if (_layerRoot) then {
	_item316 = createVehicle ["Land_Razorwire_F",[17694.3,17291,0],[],0,"CAN_COLLIDE"];
	_this = _item316;
	_objects pushback _this;
	_objectIDs pushback 316;
	_this setPosWorld [17694.3,17291,82.9215];
	_this setVectorDirAndUp [[0.721131,0.691325,-0.0451706],[0.0306514,0.0332993,0.998975]];
	_this allowdamage false;;
};

private _item317 = objNull;
if (_layerRoot) then {
	_item317 = createVehicle ["Land_Razorwire_F",[17705.2,17283.9,0],[],0,"CAN_COLLIDE"];
	_this = _item317;
	_objects pushback _this;
	_objectIDs pushback 317;
	_this setPosWorld [17705.2,17283.9,82.8223];
	_this setVectorDirAndUp [[0.248721,0.968422,-0.0172227],[0.0173282,0.0133297,0.999761]];
	_this allowdamage false;;
};

private _item318 = objNull;
if (_layerRoot) then {
	_item318 = createVehicle ["Land_Razorwire_F",[17734.3,17322.4,0],[],0,"CAN_COLLIDE"];
	_this = _item318;
	_objects pushback _this;
	_objectIDs pushback 318;
	_this setPosWorld [17734.3,17322.4,80.8381];
	_this setVectorDirAndUp [[-0.211988,-0.976069,0.0484907],[-0.0106641,0.0519259,0.998594]];
	_this allowdamage false;;
};

private _item319 = objNull;
if (_layerRoot) then {
	_item319 = createVehicle ["Land_Razorwire_F",[17744.5,17315.1,-7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item319;
	_objects pushback _this;
	_objectIDs pushback 319;
	_this setPosWorld [17744.5,17315.1,81.2284];
	_this setVectorDirAndUp [[-0.578883,-0.815064,0.0237667],[-0.00399675,0.0319827,0.99948]];
	_this allowdamage false;;
};

private _item320 = objNull;
if (_layerRoot) then {
	_item320 = createVehicle ["Land_Razorwire_F",[17758.3,17305.9,0],[],0,"CAN_COLLIDE"];
	_this = _item320;
	_objects pushback _this;
	_objectIDs pushback 320;
	_this setPosWorld [17758.3,17305.9,81.1577];
	_this setVectorDirAndUp [[-0.760111,-0.649663,0.0130302],[0.0159975,0.00133704,0.999871]];
	_this allowdamage false;;
};

private _item321 = objNull;
if (_layerRoot) then {
	_item321 = createVehicle ["Land_Razorwire_F",[17766.9,17261.7,0],[],0,"CAN_COLLIDE"];
	_this = _item321;
	_objects pushback _this;
	_objectIDs pushback 321;
	_this setPosWorld [17766.9,17261.7,80.7889];
	_this setVectorDirAndUp [[-0.735975,0.675542,0.044538],[0.0213271,-0.0426193,0.998864]];
	_this allowdamage false;;
};

private _item322 = objNull;
if (_layerRoot) then {
	_item322 = createVehicle ["vn_o_pl_static_mortar_type53",[17717.1,17295.8,-0.000221252],[],0,"CAN_COLLIDE"];
	_this = _item322;
	_objects pushback _this;
	_objectIDs pushback 322;
	_this setPosWorld [17717.1,17295.8,82.6654];
	_this setVectorDirAndUp [[0.533837,0.844516,-0.0425654],[0.00800822,0.0452867,0.998942]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item323 = objNull;
if (_layerRoot) then {
	_item323 = createVehicle ["Land_vn_o_platform_06",[17728.2,17287.8,0],[],0,"CAN_COLLIDE"];
	_this = _item323;
	_objects pushback _this;
	_objectIDs pushback 323;
	_this setPosWorld [17728.2,17287.8,83.8803];
	_this setVectorDirAndUp [[0.815085,-0.579341,0],[0,0,1]];
};

private _item324 = objNull;
if (_layerRoot) then {
	_item324 = createVehicle ["Land_vn_o_platform_06",[17765.7,17285.9,0],[],0,"CAN_COLLIDE"];
	_this = _item324;
	_objects pushback _this;
	_objectIDs pushback 324;
	_this setPosWorld [17765.7,17285.9,82.4535];
	_this setVectorDirAndUp [[-0.632202,0.774804,0],[0,0,1]];
};

private _item325 = objNull;
if (_layerRoot) then {
	_item325 = createVehicle ["Land_vn_o_shelter_02",[17712.2,17309.3,-7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item325;
	_objects pushback _this;
	_objectIDs pushback 325;
	_this setPosWorld [17712.2,17309.3,82.2089];
	_this setVectorDirAndUp [[0.747543,0.664213,0],[0,0,1]];
};

private _item326 = objNull;
if (_layerRoot) then {
	_item326 = createVehicle ["Land_vn_o_shelter_02",[17721.9,17309.9,-7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item326;
	_objects pushback _this;
	_objectIDs pushback 326;
	_this setPosWorld [17721.9,17309.9,82.1427];
	_this setVectorDirAndUp [[-0.179976,0.983671,0],[0,0,1]];
};

private _item327 = objNull;
if (_layerRoot) then {
	_item327 = createVehicle ["Land_vn_o_shelter_02",[17731.5,17293.4,0],[],0,"CAN_COLLIDE"];
	_this = _item327;
	_objects pushback _this;
	_objectIDs pushback 327;
	_this setPosWorld [17731.5,17293.4,82.696];
	_this setVectorDirAndUp [[-0.689764,0.724035,0],[0,0,1]];
};

private _item328 = objNull;
if (_layerRoot) then {
	_item328 = createVehicle ["Land_vn_o_tower_02",[17753,17269.9,0],[],0,"CAN_COLLIDE"];
	_this = _item328;
	_objects pushback _this;
	_objectIDs pushback 328;
	_this setPosWorld [17753,17269.9,84.0827];
	_this setVectorDirAndUp [[-0.28637,-0.958119,0],[0,0,1]];
};

private _item329 = objNull;
if (_layerRoot) then {
	_item329 = createVehicle ["vn_flag_camo02",[17718.4,17304.2,0],[],0,"CAN_COLLIDE"];
	_this = _item329;
	_objects pushback _this;
	_objectIDs pushback 329;
	_this setPosWorld [17718.4,17304.2,85.2424];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item330 = objNull;
if (_layerRoot) then {
	_item330 = createVehicle ["Land_vn_t_phoenixc1s_f",[17716.4,17381.3,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item330;
	_objects pushback _this;
	_objectIDs pushback 330;
	_this setPosWorld [17716.4,17381.3,80.2509];
	_this setVectorDirAndUp [[0,0.999353,-0.0359766],[-0.0199947,0.0359694,0.999153]];
	_this allowdamage false;;
};

private _item331 = objNull;
if (_layerRoot) then {
	_item331 = createVehicle ["Land_vn_t_phoenixc3s_f",[17655.1,17288.2,0],[],0,"CAN_COLLIDE"];
	_this = _item331;
	_objects pushback _this;
	_objectIDs pushback 331;
	_this setPosWorld [17655.1,17288.2,91.198];
	_this setVectorDirAndUp [[0,0.997512,-0.0704904],[0.00399666,0.0704898,0.997504]];
	_this allowdamage false;;
};

private _item332 = objNull;
if (_layerRoot) then {
	_item332 = createVehicle ["Land_vn_t_pritchardia_f",[17700.1,17365.4,0],[],0,"CAN_COLLIDE"];
	_this = _item332;
	_objects pushback _this;
	_objectIDs pushback 332;
	_this setPosWorld [17700.1,17365.4,77.607];
	_this setVectorDirAndUp [[0,0.998509,-0.0545864],[-0.0146643,0.0545806,0.998402]];
	_this allowdamage false;;
};

private _item334 = objNull;
if (_layerRoot) then {
	_item334 = createVehicle ["Land_vn_t_juglansregia_3s",[17760.4,17343.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item334;
	_objects pushback _this;
	_objectIDs pushback 334;
	_this setPosWorld [17760.4,17343.4,87.652];
	_this setVectorDirAndUp [[0.834784,0.550111,-0.0226504],[-0.0080009,0.0532558,0.998549]];
	_this allowdamage false;;
};

private _item335 = objNull;
if (_layerRoot) then {
	_item335 = createVehicle ["Land_vn_t_juglansregia_2s",[17781.2,17344,0.000556946],[],0,"CAN_COLLIDE"];
	_this = _item335;
	_objects pushback _this;
	_objectIDs pushback 335;
	_this setPosWorld [17781.2,17344,85.924];
	_this setVectorDirAndUp [[-0.499333,0.864551,-0.0567225],[0.0863428,0.114797,0.989629]];
	_this allowdamage false;;
};

private _item337 = objNull;
if (_layerRoot) then {
	_item337 = createVehicle ["Land_vn_t_ficus_big_f",[17675.7,17332.3,0],[],0,"CAN_COLLIDE"];
	_this = _item337;
	_objects pushback _this;
	_objectIDs pushback 337;
	_this setPosWorld [17675.7,17332.3,98.8079];
	_this setVectorDirAndUp [[0.998238,-0.0282945,-0.0521654],[0.0545839,0.0927902,0.994188]];
	_this allowdamage false;;
};

private _item338 = objNull;
if (_layerRoot) then {
	_item338 = createVehicle ["Land_vn_t_ficus_medium_f",[17756,17366.6,0.000244141],[],0,"CAN_COLLIDE"];
	_this = _item338;
	_objects pushback _this;
	_objectIDs pushback 338;
	_this setPosWorld [17756,17366.6,88.4821];
	_this setVectorDirAndUp [[-0.607913,0.792607,-0.0470729],[0.0146639,0.0704828,0.997405]];
	_this allowdamage false;;
};

private _item339 = objNull;
if (_layerRoot) then {
	_item339 = createVehicle ["Land_vn_t_ficusb1s_f",[17697.5,17376.3,0],[],0,"CAN_COLLIDE"];
	_this = _item339;
	_objects pushback _this;
	_objectIDs pushback 339;
	_this setPosWorld [17697.5,17376.3,79.0353];
	_this setVectorDirAndUp [[0,0.998974,-0.0452855],[-0.0293202,0.045266,0.998545]];
	_this allowdamage false;;
};

private _item341 = objNull;
if (_layerRoot) then {
	_item341 = createVehicle ["Land_vn_t_cocos_tall_f",[17641.3,17322.9,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item341;
	_objects pushback _this;
	_objectIDs pushback 341;
	_this setPosWorld [17641.3,17322.9,91.5856];
	_this setVectorDirAndUp [[0,0.9998,-0.0199947],[-0.00666818,0.0199943,0.999778]];
	_this allowdamage false;;
};

private _item342 = objNull;
if (_layerRoot) then {
	_item342 = createVehicle ["Land_vn_t_cyathea_f",[17658,17353.6,0.000137329],[],0,"CAN_COLLIDE"];
	_this = _item342;
	_objects pushback _this;
	_objectIDs pushback 342;
	_this setPosWorld [17658,17353.6,80.9467];
	_this setVectorDirAndUp [[0,0.989976,-0.141236],[0.0106693,0.141228,0.98992]];
	_this allowdamage false;;
};

private _item343 = objNull;
if (_layerRoot) then {
	_item343 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[17695.9,17329.6,0.000144958],[],0,"CAN_COLLIDE"];
	_this = _item343;
	_objects pushback _this;
	_objectIDs pushback 343;
	_this setPosWorld [17695.9,17329.6,89.7908];
	_this setVectorDirAndUp [[0,0.997605,-0.0691671],[0.0159975,0.0691583,0.997477]];
	_this allowdamage false;;
};

private _item344 = objNull;
if (_layerRoot) then {
	_item344 = createVehicle ["Land_vn_t_cocosnucifera3s_bend_f",[17660.7,17327.9,3.8147e-005],[],0,"CAN_COLLIDE"];
	_this = _item344;
	_objects pushback _this;
	_objectIDs pushback 344;
	_this setPosWorld [17660.7,17327.9,88.4856];
	_this setVectorDirAndUp [[0,0.999772,-0.02133],[0.0173315,0.0213268,0.999622]];
	_this allowdamage false;;
};

private _item345 = objNull;
if (_layerRoot) then {
	_item345 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[17680.5,17362.9,0.000511169],[],0,"CAN_COLLIDE"];
	_this = _item345;
	_objects pushback _this;
	_objectIDs pushback 345;
	_this setPosWorld [17680.5,17362.9,84.0677];
	_this setVectorDirAndUp [[0,0.997785,-0.0665191],[0.00533751,0.0665182,0.997771]];
	_this allowdamage false;;
};

private _item346 = objNull;
if (_layerRoot) then {
	_item346 = createVehicle ["Land_vn_t_banana_f",[17684.4,17375,0],[],0,"CAN_COLLIDE"];
	_this = _item346;
	_objects pushback _this;
	_objectIDs pushback 346;
	_this setPosWorld [17684.4,17375,78.3825];
	_this setVectorDirAndUp [[0,0.998581,-0.0532575],[0,0.0532575,0.998581]];
	_this allowdamage false;;
};

private _item347 = objNull;
if (_layerRoot) then {
	_item347 = createVehicle ["Land_vn_t_juglansregia_3s",[17728.9,17334.2,0.000144958],[],0,"CAN_COLLIDE"];
	_this = _item347;
	_objects pushback _this;
	_objectIDs pushback 347;
	_this setPosWorld [17728.9,17334.2,87.6217];
	_this setVectorDirAndUp [[-0.889814,-0.455635,0.0250607],[-0.0080009,0.0704881,0.997481]];
	_this allowdamage false;;
};

private _item348 = objNull;
if (_layerRoot) then {
	_item348 = createVehicle ["Land_vn_t_juglansregia_2s",[17711.4,17360.9,2.28882e-005],[],0,"CAN_COLLIDE"];
	_this = _item348;
	_objects pushback _this;
	_objectIDs pushback 348;
	_this setPosWorld [17711.4,17360.9,84.6215];
	_this setVectorDirAndUp [[-0.0110024,0.998582,-0.0520868],[-0.0146643,0.0519232,0.998543]];
	_this allowdamage false;;
};

private _item349 = objNull;
if (_layerRoot) then {
	_item349 = createVehicle ["Land_vn_t_ficus_big_f",[17729.8,17378,0],[],0,"CAN_COLLIDE"];
	_this = _item349;
	_objects pushback _this;
	_objectIDs pushback 349;
	_this setPosWorld [17729.8,17378,95.4552];
	_this setVectorDirAndUp [[-0.0617096,-0.997283,0.0402341],[-0.0159977,0.041294,0.999019]];
	_this allowdamage false;;
};

private _item350 = objNull;
if (_layerRoot) then {
	_item350 = createVehicle ["Land_vn_t_ficus_medium_f",[17690.3,17349.6,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item350;
	_objects pushback _this;
	_objectIDs pushback 350;
	_this setPosWorld [17690.3,17349.6,88.4601];
	_this setVectorDirAndUp [[-0.938575,0.343967,-0.0276339],[0.00133688,0.0837047,0.99649]];
	_this allowdamage false;;
};

private _item351 = objNull;
if (_layerRoot) then {
	_item351 = createVehicle ["Land_vn_t_phoenixc1s_f",[17712.5,17333.1,0],[],0,"CAN_COLLIDE"];
	_this = _item351;
	_objects pushback _this;
	_objectIDs pushback 351;
	_this setPosWorld [17712.5,17333.1,82.8348];
	_this setVectorDirAndUp [[0.756247,0.652828,-0.0436651],[0.00133688,0.0651951,0.997872]];
	_this allowdamage false;;
};

private _item352 = objNull;
if (_layerRoot) then {
	_item352 = createVehicle ["Land_vn_t_pritchardia_f",[17719.6,17324.1,0],[],0,"CAN_COLLIDE"];
	_this = _item352;
	_objects pushback _this;
	_objectIDs pushback 352;
	_this setPosWorld [17719.6,17324.1,80.4333];
	_this setVectorDirAndUp [[0.75607,0.653107,-0.0425267],[-0.00133721,0.0665182,0.997784]];
	_this allowdamage false;;
};

private _item353 = objNull;
if (_layerRoot) then {
	_item353 = createVehicle ["Land_vn_t_ficusb1s_f",[17699.3,17336,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item353;
	_objects pushback _this;
	_objectIDs pushback 353;
	_this setPosWorld [17699.3,17336,81.6874];
	_this setVectorDirAndUp [[0.756416,0.653042,-0.0370241],[-0.00399675,0.0612175,0.998116]];
	_this allowdamage false;;
};

private _item354 = objNull;
if (_layerRoot) then {
	_item354 = createVehicle ["Land_vn_t_cyathea_f",[17712.4,17346.6,0.000106812],[],0,"CAN_COLLIDE"];
	_this = _item354;
	_objects pushback _this;
	_objectIDs pushback 354;
	_this setPosWorld [17712.4,17346.6,81.0625];
	_this setVectorDirAndUp [[0.755928,0.653214,-0.0434054],[-0.00133721,0.0678433,0.997695]];
	_this allowdamage false;;
};

private _item355 = objNull;
if (_layerRoot) then {
	_item355 = createVehicle ["Land_vn_t_banana_f",[17727.4,17353.2,0],[],0,"CAN_COLLIDE"];
	_this = _item355;
	_objects pushback _this;
	_objectIDs pushback 355;
	_this setPosWorld [17727.4,17353.2,80.2708];
	_this setVectorDirAndUp [[0.756113,0.654413,-0.00613501],[-0.0253251,0.0386256,0.998933]];
	_this allowdamage false;;
};

private _item356 = objNull;
if (_layerRoot) then {
	_item356 = createVehicle ["Land_vn_t_phoenixc1s_f",[17796.6,17370.2,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item356;
	_objects pushback _this;
	_objectIDs pushback 356;
	_this setPosWorld [17796.6,17370.2,78.7314];
	_this setVectorDirAndUp [[0,0.99615,-0.0876616],[0.0559122,0.0875244,0.994592]];
	_this allowdamage false;;
};

private _item357 = objNull;
if (_layerRoot) then {
	_item357 = createVehicle ["Land_vn_t_pritchardia_f",[17799.7,17356.6,9.15527e-005],[],0,"CAN_COLLIDE"];
	_this = _item357;
	_objects pushback _this;
	_objectIDs pushback 357;
	_this setPosWorld [17799.7,17356.6,76.6444];
	_this setVectorDirAndUp [[0,0.997322,-0.073137],[0.0704908,0.0729551,0.994841]];
	_this allowdamage false;;
};

private _item358 = objNull;
if (_layerRoot) then {
	_item358 = createVehicle ["Land_vn_t_ficusb1s_f",[17782.4,17357.5,0.0001297],[],0,"CAN_COLLIDE"];
	_this = _item358;
	_objects pushback _this;
	_objectIDs pushback 358;
	_this setPosWorld [17782.4,17357.5,79.7575];
	_this setVectorDirAndUp [[0,0.995549,-0.0942451],[0.0863437,0.0938932,0.991831]];
	_this allowdamage false;;
};

private _item359 = objNull;
if (_layerRoot) then {
	_item359 = createVehicle ["Land_vn_t_cyathea_f",[17750.4,17382.5,0],[],0,"CAN_COLLIDE"];
	_this = _item359;
	_objects pushback _this;
	_objectIDs pushback 359;
	_this setPosWorld [17750.4,17382.5,79.7875];
	_this setVectorDirAndUp [[0,0.997124,-0.0757809],[0.0133313,0.0757742,0.997036]];
	_this allowdamage false;;
};

private _item360 = objNull;
if (_layerRoot) then {
	_item360 = createVehicle ["Land_vn_t_banana_f",[17777.7,17377.3,7.62939e-005],[],0,"CAN_COLLIDE"];
	_this = _item360;
	_objects pushback _this;
	_objectIDs pushback 360;
	_this setPosWorld [17777.7,17377.3,77.9464];
	_this setVectorDirAndUp [[0,0.996815,-0.0797447],[0.0823849,0.0794736,0.993427]];
	_this allowdamage false;;
};

private _item361 = objNull;
if (_layerRoot) then {
	_item361 = createVehicle ["Land_vn_t_phoenixc1s_f",[17710,17263,0],[],0,"CAN_COLLIDE"];
	_this = _item361;
	_objects pushback _this;
	_objectIDs pushback 361;
	_this setPosWorld [17710,17263,85.43];
	_this setVectorDirAndUp [[0,0.999445,0.033315],[0.0133313,-0.0333121,0.999356]];
	_this allowdamage false;;
};

private _item362 = objNull;
if (_layerRoot) then {
	_item362 = createVehicle ["Land_vn_t_pritchardia_f",[17693.7,17247.1,0],[],0,"CAN_COLLIDE"];
	_this = _item362;
	_objects pushback _this;
	_objectIDs pushback 362;
	_this setPosWorld [17693.7,17247.1,82.166];
	_this setVectorDirAndUp [[0,0.998651,0.0519288],[0.0239934,-0.0519139,0.998363]];
	_this allowdamage false;;
};

private _item363 = objNull;
if (_layerRoot) then {
	_item363 = createVehicle ["Land_vn_t_ficusb1s_f",[17691.1,17258,0],[],0,"CAN_COLLIDE"];
	_this = _item363;
	_objects pushback _this;
	_objectIDs pushback 363;
	_this setPosWorld [17691.1,17258,84.8671];
	_this setVectorDirAndUp [[0,0.998124,0.0612179],[0,-0.0612179,0.998124]];
	_this allowdamage false;;
};

private _item364 = objNull;
if (_layerRoot) then {
	_item364 = createVehicle ["Land_vn_t_cyathea_f",[17651.6,17235.3,0.0001297],[],0,"CAN_COLLIDE"];
	_this = _item364;
	_objects pushback _this;
	_objectIDs pushback 364;
	_this setPosWorld [17651.6,17235.3,86.027];
	_this setVectorDirAndUp [[0,0.999772,0.02133],[0.283827,-0.0204528,0.958657]];
	_this allowdamage false;;
};

private _item365 = objNull;
if (_layerRoot) then {
	_item365 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[17664.9,17222.2,0],[],0,"CAN_COLLIDE"];
	_this = _item365;
	_objects pushback _this;
	_objectIDs pushback 365;
	_this setPosWorld [17664.9,17222.2,89.3093];
	_this setVectorDirAndUp [[0,0.996379,0.0850239],[0.0638697,-0.0848503,0.994345]];
	_this allowdamage false;;
};

private _item366 = objNull;
if (_layerRoot) then {
	_item366 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[17655,17249.6,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item366;
	_objects pushback _this;
	_objectIDs pushback 366;
	_this setPosWorld [17655,17249.6,89.3939];
	_this setVectorDirAndUp [[0,0.999773,0.0213271],[0.145114,-0.0211014,0.98919]];
	_this allowdamage false;;
};

private _item367 = objNull;
if (_layerRoot) then {
	_item367 = createVehicle ["Land_vn_t_banana_f",[17678.1,17256.7,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item367;
	_objects pushback _this;
	_objectIDs pushback 367;
	_this setPosWorld [17678.1,17256.7,83.8467];
	_this setVectorDirAndUp [[0,0.998042,0.0625434],[-0.0691671,-0.0623936,0.995652]];
	_this allowdamage false;;
};

private _item368 = objNull;
if (_layerRoot) then {
	_item368 = createVehicle ["Land_vn_t_juglansregia_2s",[17722,17246.3,0.000137329],[],0,"CAN_COLLIDE"];
	_this = _item368;
	_objects pushback _this;
	_objectIDs pushback 368;
	_this setPosWorld [17722,17246.3,88.0651];
	_this setVectorDirAndUp [[-0.0110014,0.997884,0.0640854],[0.0199975,-0.0638569,0.997759]];
	_this allowdamage false;;
};

private _item369 = objNull;
if (_layerRoot) then {
	_item369 = createVehicle ["Land_vn_t_ficus_medium_f",[17692.1,17236.2,0],[],0,"CAN_COLLIDE"];
	_this = _item369;
	_objects pushback _this;
	_objectIDs pushback 369;
	_this setPosWorld [17692.1,17236.2,91.4589];
	_this setVectorDirAndUp [[-0.937875,0.346538,-0.0173747],[-0.038638,-0.0545446,0.997764]];
	_this allowdamage false;;
};

private _item370 = objNull;
if (_layerRoot) then {
	_item370 = createVehicle ["Land_vn_t_ficusb1s_f",[17698.9,17226.8,0.000160217],[],0,"CAN_COLLIDE"];
	_this = _item370;
	_objects pushback _this;
	_objectIDs pushback 370;
	_this setPosWorld [17698.9,17226.8,82.8209];
	_this setVectorDirAndUp [[0.756002,0.653499,0.0374195],[0.033315,-0.0955072,0.994871]];
	_this allowdamage false;;
};

private _item371 = objNull;
if (_layerRoot) then {
	_item371 = createVehicle ["Land_vn_o_snipertree_02",[17688.5,17274.7,0.0615005],[],0,"CAN_COLLIDE"];
	_this = _item371;
	_objects pushback _this;
	_objectIDs pushback 371;
	_this setPosWorld [17688.5,17274.7,91.5948];
	_this setVectorDirAndUp [[0.781088,-0.624421,0],[0,0,1]];
};

private _item372 = objNull;
if (_layerRoot) then {
	_item372 = createVehicle ["Land_vn_o_snipertree_03",[17783.5,17301.6,-0.057312],[],0,"CAN_COLLIDE"];
	_this = _item372;
	_objects pushback _this;
	_objectIDs pushback 372;
	_this setPosWorld [17783.5,17301.6,97.5116];
	_this setVectorDirAndUp [[-0.996748,0.0805867,0],[0,0,1]];
};

private _item373 = objNull;
if (_layerRoot) then {
	_item373 = createVehicle ["Land_vn_o_snipertree_01",[17678.4,17299,-0.00675964],[],0,"CAN_COLLIDE"];
	_this = _item373;
	_objects pushback _this;
	_objectIDs pushback 373;
	_this setPosWorld [17678.4,17299,84.7569];
	_this setVectorDirAndUp [[0.997823,0.0659516,0],[0,0,1]];
};

private _item374 = objNull;
if (_layerRoot) then {
	_item374 = createVehicle ["Land_vn_o_snipertree_04",[17738.7,17263.1,0.0563889],[],0,"CAN_COLLIDE"];
	_this = _item374;
	_objects pushback _this;
	_objectIDs pushback 374;
	_this setPosWorld [17738.7,17263.1,91.017];
	_this setVectorDirAndUp [[0.166056,0.986116,0],[0,0,1]];
};

private _item375 = objNull;
if (_layerRoot) then {
	_item375 = createVehicle ["vn_b_aus_army_static_m101_02",[15129.8,18282.1,-0.0198441],[],0,"CAN_COLLIDE"];
	_this = _item375;
	_objects pushback _this;
	_objectIDs pushback 375;
	_this setPosWorld [15129.8,18284.6,57.7863];
	_this setVectorDirAndUp [[-0.557317,0.830256,0.0085175],[0.00932853,-0.00399649,0.999949]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item376 = objNull;
if (_layerRoot) then {
	_item376 = createVehicle ["vn_b_aus_army_static_m101_02",[15157.7,18239.6,0.300789],[],0,"CAN_COLLIDE"];
	_this = _item376;
	_objects pushback _this;
	_objectIDs pushback 376;
	_this setPosWorld [15157.6,18242.2,57.9992];
	_this setVectorDirAndUp [[0.0934561,-0.99544,-0.0191288],[0.0625434,-0.0133052,0.997954]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item377 = objNull;
if (_layerRoot) then {
	_item377 = createVehicle ["vn_b_aus_army_static_m101_02",[15145.1,18262.4,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item377;
	_objects pushback _this;
	_objectIDs pushback 377;
	_this setPosWorld [15145,18265,57.6589];
	_this setVectorDirAndUp [[0.907019,0.42109,0],[0,0,1]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item378 = objNull;
if (_layerRoot) then {
	_item378 = createVehicle ["vn_o_kr_static_zgu1_01",[15141.4,18241,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item378;
	_objects pushback _this;
	_objectIDs pushback 378;
	_this setPosWorld [15141.4,18241,59.2463];
	_this setVectorDirAndUp [[-0.586165,-0.810192,0.000757077],[0.00129158,0,0.999999]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item379 = objNull;
if (_layerRoot) then {
	_item379 = createVehicle ["vn_o_kr_static_zgu1_01",[15125,18271.4,0.000148773],[],0,"CAN_COLLIDE"];
	_this = _item379;
	_objects pushback _this;
	_objectIDs pushback 379;
	_this setPosWorld [15125,18271.4,59.2753];
	_this setVectorDirAndUp [[-0.914149,-0.405376,0.00134927],[0.00265199,-0.00265198,0.999993]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item380 = objNull;
if (_layerRoot) then {
	_item380 = createVehicle ["vn_o_kr_static_zgu1_01",[15148.9,18249.7,-0.000171661],[],0,"CAN_COLLIDE"];
	_this = _item380;
	_objects pushback _this;
	_objectIDs pushback 380;
	_this setPosWorld [15148.9,18249.7,59.1688];
	_this setVectorDirAndUp [[0.942565,0.334001,-0.00383463],[0.00265199,0.00399673,0.999988]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item381 = objNull;
if (_layerRoot) then {
	_item381 = createVehicle ["vn_b_sf_static_m45",[15148.9,18233.9,-0.0264397],[],0,"CAN_COLLIDE"];
	_this = _item381;
	_objects pushback _this;
	_objectIDs pushback 381;
	_this setPosWorld [15148.9,18233.9,59.6533];
	_this setVectorDirAndUp [[0.539822,-0.841778,-0.00143161],[0.00265199,0,0.999996]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item382 = objNull;
if (_layerRoot) then {
	_item382 = createVehicle ["Land_Razorwire_F",[15125.9,18296.5,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item382;
	_objects pushback _this;
	_objectIDs pushback 382;
	_this setPosWorld [15125.9,18296.5,58.8383];
	_this setVectorDirAndUp [[0.500356,-0.865208,-0.0325413],[0.0119996,-0.0306511,0.999458]];
	_this allowdamage false;;
};

private _item383 = objNull;
if (_layerRoot) then {
	_item383 = createVehicle ["Land_Razorwire_F",[15117.6,18288.9,0.000213623],[],0,"CAN_COLLIDE"];
	_this = _item383;
	_objects pushback _this;
	_objectIDs pushback 383;
	_this setPosWorld [15117.6,18288.9,58.7224];
	_this setVectorDirAndUp [[0.845129,-0.534277,-0.0174479],[0.00800059,-0.019994,0.999768]];
	_this allowdamage false;;
};

private _item384 = objNull;
if (_layerRoot) then {
	_item384 = createVehicle ["Land_Razorwire_F",[15113.5,18276.8,0.000213623],[],0,"CAN_COLLIDE"];
	_this = _item384;
	_objects pushback _this;
	_objectIDs pushback 384;
	_this setPosWorld [15113.5,18276.8,58.6166];
	_this setVectorDirAndUp [[0.996357,0.0850407,-0.00641822],[0.00666787,-0.00265193,0.999974]];
	_this allowdamage false;;
};

private _item385 = objNull;
if (_layerRoot) then {
	_item385 = createVehicle ["Land_Razorwire_F",[15117.5,18264.4,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item385;
	_objects pushback _this;
	_objectIDs pushback 385;
	_this setPosWorld [15117.5,18264.4,58.5644];
	_this setVectorDirAndUp [[0.802302,0.596917,-0.0013297],[0.00265199,-0.00133687,0.999996]];
	_this allowdamage false;;
};

private _item386 = objNull;
if (_layerRoot) then {
	_item386 = createVehicle ["Land_Razorwire_F",[15164.3,18276,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item386;
	_objects pushback _this;
	_objectIDs pushback 386;
	_this setPosWorld [15164.3,18276,58.3804];
	_this setVectorDirAndUp [[-0.779199,-0.626691,0.0104134],[0.00800059,0.00666796,0.999946]];
	_this allowdamage false;;
};

private _item387 = objNull;
if (_layerRoot) then {
	_item387 = createVehicle ["Land_Razorwire_F",[15167.7,18264,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item387;
	_objects pushback _this;
	_objectIDs pushback 387;
	_this setPosWorld [15167.7,18264,58.4153];
	_this setVectorDirAndUp [[-0.962818,-0.270151,0],[0,0,1]];
	_this allowdamage false;;
};

private _item388 = objNull;
if (_layerRoot) then {
	_item388 = createVehicle ["Land_Razorwire_F",[15172.6,18248.2,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item388;
	_objects pushback _this;
	_objectIDs pushback 388;
	_this setPosWorld [15172.6,18248.2,58.2397];
	_this setVectorDirAndUp [[-0.985651,-0.0177982,0.167858],[0.168234,-0.0223371,0.985494]];
	_this allowdamage false;;
};

private _item389 = objNull;
if (_layerRoot) then {
	_item389 = createVehicle ["Land_Razorwire_F",[15151.5,18208.4,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item389;
	_objects pushback _this;
	_objectIDs pushback 389;
	_this setPosWorld [15151.5,18208.4,56.6497];
	_this setVectorDirAndUp [[-0.147092,0.988004,0.0470337],[0.121753,-0.0291039,0.992134]];
	_this allowdamage false;;
};

private _item390 = objNull;
if (_layerRoot) then {
	_item390 = createVehicle ["vn_o_pl_static_mortar_type53",[15134.2,18266.2,0.000171661],[],0,"CAN_COLLIDE"];
	_this = _item390;
	_objects pushback _this;
	_objectIDs pushback 390;
	_this setPosWorld [15134.2,18266.2,58.6973];
	_this setVectorDirAndUp [[0.946669,0.32205,-0.0100959],[0.0106641,0,0.999943]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item391 = objNull;
if (_layerRoot) then {
	_item391 = createVehicle ["Land_vn_o_platform_06",[15137.8,18253,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item391;
	_objects pushback _this;
	_objectIDs pushback 391;
	_this setPosWorld [15137.8,18253,59.9649];
	_this setVectorDirAndUp [[0.269746,-0.962932,0],[0,0,1]];
};

private _item392 = objNull;
if (_layerRoot) then {
	_item392 = createVehicle ["Land_vn_o_platform_06",[15165.8,18227.9,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item392;
	_objects pushback _this;
	_objectIDs pushback 392;
	_this setPosWorld [15165.8,18227.9,59.0122];
	_this setVectorDirAndUp [[-0.00464373,0.999989,0],[0,0,1]];
};

private _item393 = objNull;
if (_layerRoot) then {
	_item393 = createVehicle ["Land_vn_o_shelter_02",[15138.9,18279.8,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item393;
	_objects pushback _this;
	_objectIDs pushback 393;
	_this setPosWorld [15138.9,18279.8,58.9766];
	_this setVectorDirAndUp [[0.99891,0.0466764,0],[0,0,1]];
};

private _item394 = objNull;
if (_layerRoot) then {
	_item394 = createVehicle ["Land_vn_o_shelter_02",[15146.8,18274.1,0.000202179],[],0,"CAN_COLLIDE"];
	_this = _item394;
	_objects pushback _this;
	_objectIDs pushback 394;
	_this setPosWorld [15146.8,18274.1,58.9296];
	_this setVectorDirAndUp [[0.478359,0.878164,0],[0,0,1]];
};

private _item395 = objNull;
if (_layerRoot) then {
	_item395 = createVehicle ["Land_vn_o_shelter_02",[15143.9,18255.3,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item395;
	_objects pushback _this;
	_objectIDs pushback 395;
	_this setPosWorld [15143.9,18255.3,58.9396];
	_this setVectorDirAndUp [[-0.0813251,0.996688,0],[0,0,1]];
};

private _item396 = objNull;
if (_layerRoot) then {
	_item396 = createVehicle ["Land_vn_o_tower_02",[15145.8,18223.5,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item396;
	_objects pushback _this;
	_objectIDs pushback 396;
	_this setPosWorld [15145.8,18223.5,61.0619];
	_this setVectorDirAndUp [[-0.82499,-0.565148,0],[0,0,1]];
};

private _item397 = objNull;
if (_layerRoot) then {
	_item397 = createVehicle ["vn_flag_camo02",[15140.5,18271.9,0.000202179],[],0,"CAN_COLLIDE"];
	_this = _item397;
	_objects pushback _this;
	_objectIDs pushback 397;
	_this setPosWorld [15140.5,18271.9,61.6527];
	_this setVectorDirAndUp [[0.628597,0.777731,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item398 = objNull;
if (_layerRoot) then {
	_item398 = createVehicle ["Land_vn_t_phoenixc3s_f",[15091.9,18287.7,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item398;
	_objects pushback _this;
	_objectIDs pushback 398;
	_this setPosWorld [15091.9,18287.7,66.456];
	_this setVectorDirAndUp [[0.627436,0.774563,0.0798471],[-0.061218,-0.0531575,0.996708]];
	_this allowdamage false;;
};

private _item399 = objNull;
if (_layerRoot) then {
	_item399 = createVehicle ["Land_vn_t_pritchardia_f",[15164.7,18331,0.000213623],[],0,"CAN_COLLIDE"];
	_this = _item399;
	_objects pushback _this;
	_objectIDs pushback 399;
	_this setPosWorld [15164.7,18331,52.0722];
	_this setVectorDirAndUp [[0.628986,0.770649,-0.10235],[0.0399682,0.0994241,0.994242]];
	_this allowdamage false;;
};

private _item400 = objNull;
if (_layerRoot) then {
	_item400 = createVehicle ["Land_vn_t_juglansregia_3s",[15183,18262.4,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item400;
	_objects pushback _this;
	_objectIDs pushback 400;
	_this setPosWorld [15183,18262.4,65.1077];
	_this setVectorDirAndUp [[0.972048,-0.0926054,-0.215746],[0.214862,-0.0195277,0.976449]];
	_this allowdamage false;;
};

private _item401 = objNull;
if (_layerRoot) then {
	_item401 = createVehicle ["Land_vn_t_juglansregia_2s",[15214.3,18263.4,0.000213623],[],0,"CAN_COLLIDE"];
	_this = _item401;
	_objects pushback _this;
	_objectIDs pushback 401;
	_this setPosWorld [15214.3,18263.4,59.4855];
	_this setVectorDirAndUp [[0.154702,0.98795,0.00464917],[0.11392,-0.0225125,0.993235]];
	_this allowdamage false;;
};

private _item402 = objNull;
if (_layerRoot) then {
	_item402 = createVehicle ["Land_vn_t_ficus_big_f",[15141.5,18203.7,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item402;
	_objects pushback _this;
	_objectIDs pushback 402;
	_this setPosWorld [15141.5,18203.7,74.1831];
	_this setVectorDirAndUp [[0.761574,-0.645107,-0.06199],[0.0519298,-0.0346003,0.998051]];
	_this allowdamage false;;
};

private _item403 = objNull;
if (_layerRoot) then {
	_item403 = createVehicle ["Land_vn_t_cocos_tall_f",[15164.5,18205.1,-3.8147e-006],[],0,"CAN_COLLIDE"];
	_this = _item403;
	_objects pushback _this;
	_objectIDs pushback 403;
	_this setPosWorld [15164.5,18205.1,64.859];
	_this setVectorDirAndUp [[0.629403,0.772924,0.0802544],[0.02133,-0.120422,0.992494]];
	_this allowdamage false;;
};

private _item404 = objNull;
if (_layerRoot) then {
	_item404 = createVehicle ["Land_vn_t_cyathea_f",[15126.9,18320.6,0.000312805],[],0,"CAN_COLLIDE"];
	_this = _item404;
	_objects pushback _this;
	_objectIDs pushback 404;
	_this setPosWorld [15126.9,18320.6,58.1885];
	_this setVectorDirAndUp [[0.626702,0.767132,-0.136945],[0.0612189,0.126726,0.990047]];
	_this allowdamage false;;
};

private _item405 = objNull;
if (_layerRoot) then {
	_item405 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[15139,18305.8,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item405;
	_objects pushback _this;
	_objectIDs pushback 405;
	_this setPosWorld [15139,18305.8,67.1002];
	_this setVectorDirAndUp [[0.626681,0.75895,-0.176821],[0.0757809,0.166477,0.983129]];
	_this allowdamage false;;
};

private _item406 = objNull;
if (_layerRoot) then {
	_item406 = createVehicle ["Land_vn_t_cocosnucifera3s_bend_f",[15110.5,18326.6,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item406;
	_objects pushback _this;
	_objectIDs pushback 406;
	_this setPosWorld [15110.5,18326.6,62.7792];
	_this setVectorDirAndUp [[0.631657,0.773702,-0.0489329],[-0.0253251,0.0836786,0.996171]];
	_this allowdamage false;;
};

private _item407 = objNull;
if (_layerRoot) then {
	_item407 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[15178,18243.8,0],[],0,"CAN_COLLIDE"];
	_this = _item407;
	_objects pushback _this;
	_objectIDs pushback 407;
	_this setPosWorld [15178,18243.8,63.2887];
	_this setVectorDirAndUp [[0.617368,0.785204,-0.0480658],[0.168234,-0.0720942,0.983107]];
	_this allowdamage false;;
};

private _item408 = objNull;
if (_layerRoot) then {
	_item408 = createVehicle ["Land_vn_t_juglansregia_3s",[15167.5,18288.7,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item408;
	_objects pushback _this;
	_objectIDs pushback 408;
	_this setPosWorld [15167.5,18288.7,65.3124];
	_this setVectorDirAndUp [[-0.974512,0.210046,0.0787886],[0.0929299,0.0583121,0.993964]];
	_this allowdamage false;;
};

private _item409 = objNull;
if (_layerRoot) then {
	_item409 = createVehicle ["Land_vn_t_juglansregia_2s",[15170.7,18320.4,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item409;
	_objects pushback _this;
	_objectIDs pushback 409;
	_this setPosWorld [15170.7,18320.4,59.3642];
	_this setVectorDirAndUp [[0.618094,0.780463,-0.0940049],[0.0876605,0.0504068,0.994874]];
	_this allowdamage false;;
};

private _item410 = objNull;
if (_layerRoot) then {
	_item410 = createVehicle ["Land_vn_t_ficus_medium_f",[15147.2,18324.9,0.000213623],[],0,"CAN_COLLIDE"];
	_this = _item410;
	_objects pushback _this;
	_objectIDs pushback 410;
	_this setPosWorld [15147.2,18324.9,64.2078];
	_this setVectorDirAndUp [[-0.514916,0.854251,-0.0715276],[0.0704903,0.12535,0.989605]];
	_this allowdamage false;;
};

private _item411 = objNull;
if (_layerRoot) then {
	_item411 = createVehicle ["Land_vn_t_phoenixc1s_f",[15154.1,18298.1,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item411;
	_objects pushback _this;
	_objectIDs pushback 411;
	_this setPosWorld [15154.1,18298.1,60.4782];
	_this setVectorDirAndUp [[0.989791,0.0136263,-0.141873],[0.138648,0.13859,0.980597]];
	_this allowdamage false;;
};

private _item412 = objNull;
if (_layerRoot) then {
	_item412 = createVehicle ["Land_vn_t_pritchardia_f",[15153.9,18286.6,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item412;
	_objects pushback _this;
	_objectIDs pushback 412;
	_this setPosWorld [15153.9,18286.6,58.0825];
	_this setVectorDirAndUp [[0.99923,0.0334571,-0.0204761],[0.0199947,0.0146614,0.999693]];
	_this allowdamage false;;
};

private _item413 = objNull;
if (_layerRoot) then {
	_item413 = createVehicle ["Land_vn_t_ficusb1s_f",[15145.6,18308.6,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item413;
	_objects pushback _this;
	_objectIDs pushback 413;
	_this setPosWorld [15145.6,18308.6,58.5992];
	_this setVectorDirAndUp [[0.998584,0.0261348,-0.0463332],[0.0412993,0.168091,0.984906]];
	_this allowdamage false;;
};

private _item414 = objNull;
if (_layerRoot) then {
	_item414 = createVehicle ["Land_vn_t_cyathea_f",[15162.5,18308.7,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item414;
	_objects pushback _this;
	_objectIDs pushback 414;
	_this setPosWorld [15162.5,18308.7,56.9726];
	_this setVectorDirAndUp [[0.988828,0.0126359,-0.148523],[0.145114,0.146132,0.978564]];
	_this allowdamage false;;
};

private _item415 = objNull;
if (_layerRoot) then {
	_item415 = createVehicle ["Land_vn_t_banana_f",[15178.4,18304.4,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item415;
	_objects pushback _this;
	_objectIDs pushback 415;
	_this setPosWorld [15178.4,18304.4,56.0869];
	_this setVectorDirAndUp [[0.999177,0.0237495,-0.0328938],[0.0279894,0.183425,0.982635]];
	_this allowdamage false;;
};

private _item416 = objNull;
if (_layerRoot) then {
	_item416 = createVehicle ["Land_vn_t_ficusb1s_f",[15196.3,18300.3,0],[],0,"CAN_COLLIDE"];
	_this = _item416;
	_objects pushback _this;
	_objectIDs pushback 416;
	_this setPosWorld [15196.3,18300.3,55.1844];
	_this setVectorDirAndUp [[0.628486,0.774167,-0.0753033],[0.0572386,0.0505187,0.997082]];
	_this allowdamage false;;
};

private _item417 = objNull;
if (_layerRoot) then {
	_item417 = createVehicle ["Land_vn_t_phoenixc1s_f",[15108.1,18245.2,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item417;
	_objects pushback _this;
	_objectIDs pushback 417;
	_this setPosWorld [15108.1,18245.2,60.7573];
	_this setVectorDirAndUp [[0.624331,0.776795,0.0824668],[-0.0572388,-0.0597942,0.996568]];
	_this allowdamage false;;
};

private _item418 = objNull;
if (_layerRoot) then {
	_item418 = createVehicle ["Land_vn_t_pritchardia_f",[15085.5,18243,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item418;
	_objects pushback _this;
	_objectIDs pushback 418;
	_this setPosWorld [15085.5,18243,56.363];
	_this setVectorDirAndUp [[0.6283,0.777552,0.025518],[-0.0373063,-0.00265014,0.9993]];
	_this allowdamage false;;
};

private _item419 = objNull;
if (_layerRoot) then {
	_item419 = createVehicle ["Land_vn_t_ficusb1s_f",[15090.3,18253.1,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item419;
	_objects pushback _this;
	_objectIDs pushback 419;
	_this setPosWorld [15090.3,18253.1,58.706];
	_this setVectorDirAndUp [[0.628563,0.774911,0.0664878],[-0.0889785,-0.0132784,0.995945]];
	_this allowdamage false;;
};

private _item420 = objNull;
if (_layerRoot) then {
	_item420 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[15071.4,18276.3,0.000183105],[],0,"CAN_COLLIDE"];
	_this = _item420;
	_objects pushback _this;
	_objectIDs pushback 420;
	_this setPosWorld [15071.4,18276.3,62.8866];
	_this setVectorDirAndUp [[0.626647,0.778998,0.0218258],[-0.061219,0.0212872,0.997897]];
	_this allowdamage false;;
};

private _item421 = objNull;
if (_layerRoot) then {
	_item421 = createVehicle ["Land_vn_t_banana_f",[15079.3,18260.3,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item421;
	_objects pushback _this;
	_objectIDs pushback 421;
	_this setPosWorld [15079.3,18260.3,58.0232];
	_this setVectorDirAndUp [[0.628253,0.778006,-0.00227556],[0.033315,-0.0239801,0.999157]];
	_this allowdamage false;;
};

private _item422 = objNull;
if (_layerRoot) then {
	_item422 = createVehicle ["Land_vn_t_juglansregia_2s",[15106.9,18224.6,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item422;
	_objects pushback _this;
	_objectIDs pushback 422;
	_this setPosWorld [15106.9,18224.6,62.9714];
	_this setVectorDirAndUp [[0.619216,0.784852,0.0240481],[-0.0506016,0.00932293,0.998675]];
	_this allowdamage false;;
};

private _item423 = objNull;
if (_layerRoot) then {
	_item423 = createVehicle ["Land_vn_o_snipertree_02",[15103.8,18261.8,0],[],0,"CAN_COLLIDE"];
	_this = _item423;
	_objects pushback _this;
	_objectIDs pushback 423;
	_this setPosWorld [15103.8,18261.8,66.4979];
	_this setVectorDirAndUp [[0.214967,-0.976621,0],[0,0,1]];
};

private _item424 = objNull;
if (_layerRoot) then {
	_item424 = createVehicle ["Land_vn_o_snipertree_03",[15189.5,18228.9,0.000209808],[],0,"CAN_COLLIDE"];
	_this = _item424;
	_objects pushback _this;
	_objectIDs pushback 424;
	_this setPosWorld [15189.5,18228.9,72.3236];
	_this setVectorDirAndUp [[-0.724545,0.689227,0],[0,0,1]];
};

private _item425 = objNull;
if (_layerRoot) then {
	_item425 = createVehicle ["Land_vn_o_snipertree_01",[15111.4,18296.8,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item425;
	_objects pushback _this;
	_objectIDs pushback 425;
	_this setPosWorld [15111.4,18296.8,60.6318];
	_this setVectorDirAndUp [[0.817495,-0.575935,0],[0,0,1]];
};

private _item426 = objNull;
if (_layerRoot) then {
	_item426 = createVehicle ["Land_vn_o_snipertree_04",[15130.5,18227.2,0.000205994],[],0,"CAN_COLLIDE"];
	_this = _item426;
	_objects pushback _this;
	_objectIDs pushback 426;
	_this setPosWorld [15130.5,18227.2,67.7349];
	_this setVectorDirAndUp [[0.749016,0.662552,0],[0,0,1]];
};

private _item427 = objNull;
if (_layerRoot) then {
	_item427 = createVehicle ["vn_b_aus_army_static_m101_02",[16191,10504,-0.0810471],[],0,"CAN_COLLIDE"];
	_this = _item427;
	_objects pushback _this;
	_objectIDs pushback 427;
	_this setPosWorld [16190.9,10506.5,79.8637];
	_this setVectorDirAndUp [[-0.430439,-0.899951,-0.069354],[-0.104753,-0.0265104,0.994145]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item428 = objNull;
if (_layerRoot) then {
	_item428 = createVehicle ["vn_b_aus_army_static_m101_02",[16216.6,10547.8,0.297997],[],0,"CAN_COLLIDE"];
	_this = _item428;
	_objects pushback _this;
	_objectIDs pushback 428;
	_this setPosWorld [16216.5,10550.3,81.5089];
	_this setVectorDirAndUp [[0.810519,0.579409,0.0857033],[-0.0929294,-0.0172565,0.995523]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item429 = objNull;
if (_layerRoot) then {
	_item429 = createVehicle ["vn_b_aus_army_static_m101_02",[16203.2,10525.5,-0.0367661],[],0,"CAN_COLLIDE"];
	_this = _item429;
	_objects pushback _this;
	_objectIDs pushback 429;
	_this setPosWorld [16203.1,10528.1,80.6598];
	_this setVectorDirAndUp [[-0.822514,0.565272,-0.0627532],[-0.038638,0.0545446,0.997764]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item430 = objNull;
if (_layerRoot) then {
	_item430 = createVehicle ["vn_o_kr_static_zgu1_01",[16223.4,10527.7,-0.0223389],[],0,"CAN_COLLIDE"];
	_this = _item430;
	_objects pushback _this;
	_objectIDs pushback 430;
	_this setPosWorld [16223.5,10527.8,81.9503];
	_this setVectorDirAndUp [[0.990571,-0.108496,-0.0836565],[0.0942449,0.096444,0.990866]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item431 = objNull;
if (_layerRoot) then {
	_item431 = createVehicle ["vn_o_kr_static_zgu1_01",[16205.8,10503.8,-0.0148239],[],0,"CAN_COLLIDE"];
	_this = _item431;
	_objects pushback _this;
	_objectIDs pushback 431;
	_this setPosWorld [16205.8,10503.6,81.8664];
	_this setVectorDirAndUp [[0.812975,-0.581023,-0.0385075],[-0.03997,-0.121656,0.991767]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item432 = objNull;
if (_layerRoot) then {
	_item432 = createVehicle ["vn_o_kr_static_zgu1_01",[16212.3,10535,-0.016716],[],0,"CAN_COLLIDE"];
	_this = _item432;
	_objects pushback _this;
	_objectIDs pushback 432;
	_this setPosWorld [16212.3,10535.1,81.9692];
	_this setVectorDirAndUp [[-0.762937,0.645465,-0.0360681],[-0.00665923,0.0479425,0.998828]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item433 = objNull;
if (_layerRoot) then {
	_item433 = createVehicle ["vn_b_sf_static_m45",[16226.2,10543.2,-0.0157776],[],0,"CAN_COLLIDE"];
	_this = _item433;
	_objects pushback _this;
	_objectIDs pushback 433;
	_this setPosWorld [16226.3,10543,83.3282];
	_this setVectorDirAndUp [[0.449929,0.890281,0.0704585],[0.0253248,-0.0915824,0.995475]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item434 = objNull;
if (_layerRoot) then {
	_item434 = createVehicle ["Land_Razorwire_F",[16183.6,10491.6,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item434;
	_objects pushback _this;
	_objectIDs pushback 434;
	_this setPosWorld [16183.6,10491.6,80.3806];
	_this setVectorDirAndUp [[0.489701,0.871268,-0.0329327],[0.0929294,-0.0146005,0.995566]];
	_this allowdamage false;;
};

private _item435 = objNull;
if (_layerRoot) then {
	_item435 = createVehicle ["Land_Razorwire_F",[16194.4,10488.3,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item435;
	_objects pushback _this;
	_objectIDs pushback 435;
	_this setPosWorld [16194.4,10488.3,80.1732];
	_this setVectorDirAndUp [[0.0308195,0.997282,0.066927],[-0.0572388,-0.065088,0.996237]];
	_this allowdamage false;;
};

private _item436 = objNull;
if (_layerRoot) then {
	_item436 = createVehicle ["Land_Razorwire_F",[16206.9,10491,6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item436;
	_objects pushback _this;
	_objectIDs pushback 436;
	_this setPosWorld [16206.9,10491,80.3674];
	_this setVectorDirAndUp [[-0.578262,0.815114,0.034671],[0.0279894,-0.0226512,0.999352]];
	_this allowdamage false;;
};

private _item437 = objNull;
if (_layerRoot) then {
	_item437 = createVehicle ["Land_Razorwire_F",[16215.5,10500.7,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item437;
	_objects pushback _this;
	_objectIDs pushback 437;
	_this setPosWorld [16215.5,10500.7,81.0112];
	_this setVectorDirAndUp [[-0.917087,0.397257,-0.0337359],[-0.0850241,-0.112206,0.990041]];
	_this allowdamage false;;
};

private _item438 = objNull;
if (_layerRoot) then {
	_item438 = createVehicle ["Land_Razorwire_F",[16181.8,10535.2,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item438;
	_objects pushback _this;
	_objectIDs pushback 438;
	_this setPosWorld [16181.8,10535.2,80.7582];
	_this setVectorDirAndUp [[0.933339,-0.356557,0.0417694],[-0.0492736,-0.011985,0.998713]];
	_this allowdamage false;;
};

private _item439 = objNull;
if (_layerRoot) then {
	_item439 = createVehicle ["Land_Razorwire_F",[16190.4,10544.1,6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item439;
	_objects pushback _this;
	_objectIDs pushback 439;
	_this setPosWorld [16190.4,10544.1,81.0838];
	_this setVectorDirAndUp [[0.725272,-0.688339,0.0130169],[-0.0293222,-0.0119945,0.999498]];
	_this allowdamage false;;
};

private _item440 = objNull;
if (_layerRoot) then {
	_item440 = createVehicle ["Land_Razorwire_F",[16201.6,10556.4,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item440;
	_objects pushback _this;
	_objectIDs pushback 440;
	_this setPosWorld [16201.6,10556.4,81.1236];
	_this setVectorDirAndUp [[0.528056,-0.842374,0.107531],[-0.100818,0.0635434,0.992874]];
	_this allowdamage false;;
};

private _item441 = objNull;
if (_layerRoot) then {
	_item441 = createVehicle ["Land_Razorwire_F",[16246.5,10558.4,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item441;
	_objects pushback _this;
	_objectIDs pushback 441;
	_this setPosWorld [16246.5,10558.4,81.5708];
	_this setVectorDirAndUp [[-0.774094,-0.630836,0.0531494],[0.0479446,0.025296,0.99853]];
	_this allowdamage false;;
};

private _item442 = objNull;
if (_layerRoot) then {
	_item442 = createVehicle ["vn_o_pl_static_mortar_type53",[16202.9,10511.4,-0.00144958],[],0,"CAN_COLLIDE"];
	_this = _item442;
	_objects pushback _this;
	_objectIDs pushback 442;
	_this setPosWorld [16202.9,10511.4,81.8687];
	_this setVectorDirAndUp [[-0.758361,0.651789,-0.0077578],[-0.0399685,-0.0346179,0.998601]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item443 = objNull;
if (_layerRoot) then {
	_item443 = createVehicle ["Land_vn_o_platform_06",[16219.2,10518.2,0],[],0,"CAN_COLLIDE"];
	_this = _item443;
	_objects pushback _this;
	_objectIDs pushback 443;
	_this setPosWorld [16219.2,10518.2,83.5927];
	_this setVectorDirAndUp [[0.693112,0.72083,0],[0,0,1]];
};

private _item444 = objNull;
if (_layerRoot) then {
	_item444 = createVehicle ["Land_vn_o_platform_06",[16206.7,10551.3,0],[],0,"CAN_COLLIDE"];
	_this = _item444;
	_objects pushback _this;
	_objectIDs pushback 444;
	_this setPosWorld [16206.7,10551.3,83.3137];
	_this setVectorDirAndUp [[-0.933184,0.3594,0],[0,0,1]];
};

private _item445 = objNull;
if (_layerRoot) then {
	_item445 = createVehicle ["Land_vn_o_shelter_02",[16200.1,10500,0],[],0,"CAN_COLLIDE"];
	_this = _item445;
	_objects pushback _this;
	_objectIDs pushback 445;
	_this setPosWorld [16200.1,10500,81.4728];
	_this setVectorDirAndUp [[-0.1553,-0.987867,0],[0,0,1]];
};

private _item446 = objNull;
if (_layerRoot) then {
	_item446 = createVehicle ["Land_vn_o_shelter_02",[16192.3,10521,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item446;
	_objects pushback _this;
	_objectIDs pushback 446;
	_this setPosWorld [16192.3,10521,81.7018];
	_this setVectorDirAndUp [[-0.999453,-0.0330783,0],[0,0,1]];
};

private _item447 = objNull;
if (_layerRoot) then {
	_item447 = createVehicle ["Land_vn_o_shelter_02",[16215.1,10526.2,0.0001297],[],0,"CAN_COLLIDE"];
	_this = _item447;
	_objects pushback _this;
	_objectIDs pushback 447;
	_this setPosWorld [16215.1,10526.2,82.2967];
	_this setVectorDirAndUp [[-0.817762,-0.575557,0],[0,0,1]];
};

private _item448 = objNull;
if (_layerRoot) then {
	_item448 = createVehicle ["Land_vn_o_tower_02",[16236.4,10545.9,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item448;
	_objects pushback _this;
	_objectIDs pushback 448;
	_this setPosWorld [16236.4,10545.9,84.4061];
	_this setVectorDirAndUp [[0.905469,-0.424413,0],[0,0,1]];
};

private _item449 = objNull;
if (_layerRoot) then {
	_item449 = createVehicle ["vn_flag_camo02",[16197.4,10516.7,0],[],0,"CAN_COLLIDE"];
	_this = _item449;
	_objects pushback _this;
	_objectIDs pushback 449;
	_this setPosWorld [16197.4,10516.7,84.7147];
	_this setVectorDirAndUp [[-0.989086,0.147339,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item450 = objNull;
if (_layerRoot) then {
	_item450 = createVehicle ["Land_vn_t_phoenixc3s_f",[16205.9,10475.6,0],[],0,"CAN_COLLIDE"];
	_this = _item450;
	_objects pushback _this;
	_objectIDs pushback 450;
	_this setPosWorld [16205.9,10475.6,87.5716];
	_this setVectorDirAndUp [[-0.988816,0.143503,0.0406089],[0.0213271,-0.133431,0.990829]];
	_this allowdamage false;;
};

private _item451 = objNull;
if (_layerRoot) then {
	_item451 = createVehicle ["Land_vn_t_pritchardia_f",[16134.2,10507.6,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item451;
	_objects pushback _this;
	_objectIDs pushback 451;
	_this setPosWorld [16134.2,10507.6,78.1983];
	_this setVectorDirAndUp [[-0.988121,0.14757,-0.0428868],[-0.0439564,-0.0039928,0.999025]];
	_this allowdamage false;;
};

private _item452 = objNull;
if (_layerRoot) then {
	_item452 = createVehicle ["Land_vn_t_juglansregia_3s",[16180.9,10565.1,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item452;
	_objects pushback _this;
	_objectIDs pushback 452;
	_this setPosWorld [16180.9,10565.1,87.6241];
	_this setVectorDirAndUp [[-0.41857,0.90704,-0.0455925],[-0.0279916,0.0372933,0.998912]];
	_this allowdamage false;;
};

private _item453 = objNull;
if (_layerRoot) then {
	_item453 = createVehicle ["Land_vn_t_juglansregia_2s",[16167.3,10584.7,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item453;
	_objects pushback _this;
	_objectIDs pushback 453;
	_this setPosWorld [16167.3,10584.7,85.62];
	_this setVectorDirAndUp [[-0.928516,-0.369068,0.0405715],[0.0373061,0.0159828,0.999176]];
	_this allowdamage false;;
};

private _item454 = objNull;
if (_layerRoot) then {
	_item454 = createVehicle ["Land_vn_t_ficus_big_f",[16163.3,10478.6,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item454;
	_objects pushback _this;
	_objectIDs pushback 454;
	_this setPosWorld [16163.3,10478.6,97.3674];
	_this setVectorDirAndUp [[0.169785,0.956115,0.238783],[-0.0968746,-0.224934,0.969546]];
	_this allowdamage false;;
};

private _item455 = objNull;
if (_layerRoot) then {
	_item455 = createVehicle ["Land_vn_t_ficus_medium_f",[16134.5,10553.7,2.28882e-005],[],0,"CAN_COLLIDE"];
	_this = _item455;
	_objects pushback _this;
	_objectIDs pushback 455;
	_this setPosWorld [16134.5,10553.7,88.3141];
	_this setVectorDirAndUp [[-0.873814,-0.484737,-0.0384566],[-0.0506016,0.0119896,0.998647]];
	_this allowdamage false;;
};

private _item456 = objNull;
if (_layerRoot) then {
	_item456 = createVehicle ["Land_vn_t_cocos_tall_f",[16192.1,10453.2,0],[],0,"CAN_COLLIDE"];
	_this = _item456;
	_objects pushback _this;
	_objectIDs pushback 456;
	_this setPosWorld [16192.1,10453.2,85.6929];
	_this setVectorDirAndUp [[-0.989372,0.144981,0.0111527],[-0.0080009,-0.130861,0.991369]];
	_this allowdamage false;;
};

private _item457 = objNull;
if (_layerRoot) then {
	_item457 = createVehicle ["Land_vn_t_cyathea_f",[16139.6,10464.2,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item457;
	_objects pushback _this;
	_objectIDs pushback 457;
	_this setPosWorld [16139.6,10464.2,77.7439];
	_this setVectorDirAndUp [[-0.985153,0.139139,0.100568],[0.0981895,-0.0238751,0.994881]];
	_this allowdamage false;;
};

private _item458 = objNull;
if (_layerRoot) then {
	_item458 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[16169,10498.3,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item458;
	_objects pushback _this;
	_objectIDs pushback 458;
	_this setPosWorld [16169,10498.3,91.1741];
	_this setVectorDirAndUp [[-0.988266,0.147541,0.0395174],[0.0452853,0.0359397,0.998327]];
	_this allowdamage false;;
};

private _item459 = objNull;
if (_layerRoot) then {
	_item459 = createVehicle ["Land_vn_t_cocosnucifera3s_bend_f",[16165.4,10463.1,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item459;
	_objects pushback _this;
	_objectIDs pushback 459;
	_this setPosWorld [16165.4,10463.1,83.1383];
	_this setVectorDirAndUp [[-0.981741,0.167315,-0.0905023],[-0.121754,-0.187153,0.974756]];
	_this allowdamage false;;
};

private _item460 = objNull;
if (_layerRoot) then {
	_item460 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[16133.7,10487.9,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item460;
	_objects pushback _this;
	_objectIDs pushback 460;
	_this setPosWorld [16133.7,10487.9,83.4782];
	_this setVectorDirAndUp [[-0.986953,0.14111,0.077539],[0.0651939,-0.0901043,0.993796]];
	_this allowdamage false;;
};

private _item461 = objNull;
if (_layerRoot) then {
	_item461 = createVehicle ["Land_vn_t_juglansregia_3s",[16169.3,10531.5,6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item461;
	_objects pushback _this;
	_objectIDs pushback 461;
	_this setPosWorld [16169.3,10531.5,87.4939];
	_this setVectorDirAndUp [[0.309046,-0.949346,0.0568547],[-0.0731378,0.0358802,0.996676]];
	_this allowdamage false;;
};

private _item462 = objNull;
if (_layerRoot) then {
	_item462 = createVehicle ["Land_vn_t_juglansregia_2s",[16140.3,10518.1,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item462;
	_objects pushback _this;
	_objectIDs pushback 462;
	_this setPosWorld [16140.3,10518.1,85.3463];
	_this setVectorDirAndUp [[-0.989907,0.136853,-0.0368186],[-0.038638,-0.0106614,0.999196]];
	_this allowdamage false;;
};

private _item463 = objNull;
if (_layerRoot) then {
	_item463 = createVehicle ["Land_vn_t_ficus_medium_f",[16148.3,10495.6,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item463;
	_objects pushback _this;
	_objectIDs pushback 463;
	_this setPosWorld [16148.3,10495.6,88.8061];
	_this setVectorDirAndUp [[-0.469041,-0.866785,-0.169362],[-0.214862,-0.0740115,0.973836]];
	_this allowdamage false;;
};

private _item464 = objNull;
if (_layerRoot) then {
	_item464 = createVehicle ["Land_vn_t_phoenixc1s_f",[16178.6,10512.9,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item464;
	_objects pushback _this;
	_objectIDs pushback 464;
	_this setPosWorld [16178.6,10512.9,83.191];
	_this setVectorDirAndUp [[-0.535657,0.843709,0.0350355],[0.0359766,-0.0186505,0.999179]];
	_this allowdamage false;;
};

private _item465 = objNull;
if (_layerRoot) then {
	_item465 = createVehicle ["Land_vn_t_pritchardia_f",[16177.9,10520.8,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item465;
	_objects pushback _this;
	_objectIDs pushback 465;
	_this setPosWorld [16177.9,10520.8,80.3389];
	_this setVectorDirAndUp [[-0.541413,0.840728,-0.00691595],[-0.0293202,-0.0106595,0.999513]];
	_this allowdamage false;;
};

private _item466 = objNull;
if (_layerRoot) then {
	_item466 = createVehicle ["Land_vn_t_ficusb1s_f",[16163.1,10502.5,0.000137329],[],0,"CAN_COLLIDE"];
	_this = _item466;
	_objects pushback _this;
	_objectIDs pushback 466;
	_this setPosWorld [16163.1,10502.5,83.6275];
	_this setVectorDirAndUp [[-0.535152,0.844553,-0.0184993],[0.0452867,0.0505497,0.997694]];
	_this allowdamage false;;
};

private _item467 = objNull;
if (_layerRoot) then {
	_item467 = createVehicle ["Land_vn_t_cyathea_f",[16154.5,10517,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item467;
	_objects pushback _this;
	_objectIDs pushback 467;
	_this setPosWorld [16154.5,10517,81.9212];
	_this setVectorDirAndUp [[-0.536284,0.839949,-0.0829781],[-0.0293222,0.0797111,0.996387]];
	_this allowdamage false;;
};

private _item468 = objNull;
if (_layerRoot) then {
	_item468 = createVehicle ["Land_vn_t_banana_f",[16150.2,10532.9,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item468;
	_objects pushback _this;
	_objectIDs pushback 468;
	_this setPosWorld [16150.2,10532.9,80.7091];
	_this setVectorDirAndUp [[-0.537174,0.843143,-0.0235286],[-0.033315,0.00666447,0.999423]];
	_this allowdamage false;;
};

private _item469 = objNull;
if (_layerRoot) then {
	_item469 = createVehicle ["Land_vn_t_ficusb1s_f",[16149,10578.7,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item469;
	_objects pushback _this;
	_objectIDs pushback 469;
	_this setPosWorld [16149,10578.7,81.3823];
	_this setVectorDirAndUp [[-0.989225,0.14564,0.0148938],[0.0146639,-0.00265171,0.999889]];
	_this allowdamage false;;
};

private _item470 = objNull;
if (_layerRoot) then {
	_item470 = createVehicle ["Land_vn_t_phoenixc1s_f",[16236.9,10502.4,6.86646e-005],[],0,"CAN_COLLIDE"];
	_this = _item470;
	_objects pushback _this;
	_objectIDs pushback 470;
	_this setPosWorld [16236.9,10502.4,84.3243];
	_this setVectorDirAndUp [[-0.987758,0.147879,0.0496566],[0.0466147,-0.0239673,0.998625]];
	_this allowdamage false;;
};

private _item471 = objNull;
if (_layerRoot) then {
	_item471 = createVehicle ["Land_vn_t_pritchardia_f",[16223.9,10504.3,0],[],0,"CAN_COLLIDE"];
	_this = _item471;
	_objects pushback _this;
	_objectIDs pushback 471;
	_this setPosWorld [16223.9,10504.3,81.3781];
	_this setVectorDirAndUp [[-0.986706,0.143383,-0.0764973],[-0.0771034,0.00133323,0.997022]];
	_this allowdamage false;;
};

private _item472 = objNull;
if (_layerRoot) then {
	_item472 = createVehicle ["Land_vn_t_ficusb1s_f",[16232.8,10519.8,0.000282288],[],0,"CAN_COLLIDE"];
	_this = _item472;
	_objects pushback _this;
	_objectIDs pushback 472;
	_this setPosWorld [16232.8,10519.8,82.8695];
	_this setVectorDirAndUp [[-0.987713,0.146515,0.054383],[0.0612179,0.0425491,0.997217]];
	_this allowdamage false;;
};

private _item473 = objNull;
if (_layerRoot) then {
	_item473 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[16212,10515.6,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item473;
	_objects pushback _this;
	_objectIDs pushback 473;
	_this setPosWorld [16212,10515.6,88.3057];
	_this setVectorDirAndUp [[-0.989506,0.14277,-0.0222374],[-0.0226603,-0.00133653,0.999742]];
	_this allowdamage false;;
};

private _item474 = objNull;
if (_layerRoot) then {
	_item474 = createVehicle ["Land_vn_t_banana_f",[16243.8,10512.4,3.8147e-005],[],0,"CAN_COLLIDE"];
	_this = _item474;
	_objects pushback _this;
	_objectIDs pushback 474;
	_this setPosWorld [16243.8,10512.4,82.2014];
	_this setVectorDirAndUp [[-0.987995,0.152003,0.0275954],[0.0346456,0.04393,0.998434]];
	_this allowdamage false;;
};

private _item475 = objNull;
if (_layerRoot) then {
	_item475 = createVehicle ["Land_vn_t_juglansregia_2s",[16238.6,10565.3,0],[],0,"CAN_COLLIDE"];
	_this = _item475;
	_objects pushback _this;
	_objectIDs pushback 475;
	_this setPosWorld [16238.6,10565.3,87.2156];
	_this setVectorDirAndUp [[-0.989126,0.133833,-0.0609823],[-0.0506016,0.0796425,0.995538]];
	_this allowdamage false;;
};

private _item476 = objNull;
if (_layerRoot) then {
	_item476 = createVehicle ["Land_vn_o_snipertree_02",[16222.2,10482.8,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item476;
	_objects pushback _this;
	_objectIDs pushback 476;
	_this setPosWorld [16222.2,10482.8,87.7968];
	_this setVectorDirAndUp [[0.732691,0.680561,0],[0,0,1]];
};

private _item477 = objNull;
if (_layerRoot) then {
	_item477 = createVehicle ["Land_vn_o_snipertree_03",[16208.2,10573.5,8.39233e-005],[],0,"CAN_COLLIDE"];
	_this = _item477;
	_objects pushback _this;
	_objectIDs pushback 477;
	_this setPosWorld [16208.2,10573.5,98.0143];
	_this setVectorDirAndUp [[-0.226568,-0.973995,0],[0,0,1]];
};

private _item478 = objNull;
if (_layerRoot) then {
	_item478 = createVehicle ["Land_vn_o_snipertree_01",[16196.7,10476.4,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item478;
	_objects pushback _this;
	_objectIDs pushback 478;
	_this setPosWorld [16196.7,10476.4,81.3193];
	_this setVectorDirAndUp [[0.0817868,0.99665,0],[0,0,1]];
};

private _item479 = objNull;
if (_layerRoot) then {
	_item479 = createVehicle ["Land_vn_o_snipertree_04",[16241,10530.8,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item479;
	_objects pushback _this;
	_objectIDs pushback 479;
	_this setPosWorld [16241,10530.8,90.1346];
	_this setVectorDirAndUp [[-0.950887,0.309538,0],[0,0,1]];
};

private _item480 = objNull;
if (_layerRoot) then {
	_item480 = createVehicle ["Land_vn_o_platform_06",[16167.3,10507.7,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item480;
	_objects pushback _this;
	_objectIDs pushback 480;
	_this setPosWorld [16167.3,10507.7,82.7894];
	_this setVectorDirAndUp [[-0.187916,-0.982185,0],[0,0,1]];
};

private _item481 = objNull;
if (_layerRoot) then {
	_item481 = createVehicle ["Land_vn_o_platform_06",[16175.9,10487,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item481;
	_objects pushback _this;
	_objectIDs pushback 481;
	_this setPosWorld [16175.9,10487,82.5615];
	_this setVectorDirAndUp [[0.995984,0.0895313,0],[0,0,1]];
};

private _item482 = objNull;
if (_layerRoot) then {
	_item482 = createVehicle ["Land_vn_o_platform_06",[16173.8,10540.2,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item482;
	_objects pushback _this;
	_objectIDs pushback 482;
	_this setPosWorld [16173.8,10540.2,81.6904];
	_this setVectorDirAndUp [[-0.859496,-0.511142,0],[0,0,1]];
};

private _item581 = objNull;
if (_layerRoot) then {
	_item581 = createVehicle ["vn_o_pl_static_d44_01",[16711,13514.6,0.0105953],[],0,"CAN_COLLIDE"];
	_this = _item581;
	_objects pushback _this;
	_objectIDs pushback 581;
	_this setPosWorld [16711,13514.7,10.1654];
	_this setVectorDirAndUp [[0.778887,0.622362,0.0774681],[-0.0173316,-0.102114,0.994622]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item582 = objNull;
if (_layerRoot) then {
	_item582 = createVehicle ["vn_o_nva_navy_static_v11m",[16678.1,13520.9,-0.0212202],[],0,"CAN_COLLIDE"];
	_this = _item582;
	_objects pushback _this;
	_objectIDs pushback 582;
	_this setPosWorld [16677.9,13520.7,13.328];
	_this setVectorDirAndUp [[-0.996997,-0.0154402,-0.0758861],[-0.073137,-0.134398,0.988225]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item583 = objNull;
if (_layerRoot) then {
	_item583 = createVehicle ["vn_o_pl_static_d44_01",[16696.1,13534.1,0.00522804],[],0,"CAN_COLLIDE"];
	_this = _item583;
	_objects pushback _this;
	_objectIDs pushback 583;
	_this setPosWorld [16696.1,13534.1,10.7738];
	_this setVectorDirAndUp [[-0.636145,0.770932,0.0313569],[0.0266571,-0.018656,0.999471]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item584 = objNull;
if (_layerRoot) then {
	_item584 = createVehicle ["vn_o_nva_navy_static_v11m",[16692.8,13498.3,-0.0206165],[],0,"CAN_COLLIDE"];
	_this = _item584;
	_objects pushback _this;
	_objectIDs pushback 584;
	_this setPosWorld [16692.8,13498.2,12.0942];
	_this setVectorDirAndUp [[0.978137,-0.207961,6.07823e-005],[-0.00799344,-0.0373049,0.999272]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item585 = objNull;
if (_layerRoot) then {
	_item585 = createVehicle ["Land_vn_bunker_big_01",[16694,13516.4,0.0108242],[],0,"CAN_COLLIDE"];
	_this = _item585;
	_objects pushback _this;
	_objectIDs pushback 585;
	_this setPosWorld [16694,13516.4,11.2693];
	_this setVectorDirAndUp [[-0.770078,-0.63795,-0.000325769],[0.000212018,-0.000766579,1]];
};

private _item586 = objNull;
if (_layerRoot) then {
	_item586 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16696.2,13496.8,0],[],0,"CAN_COLLIDE"];
	_this = _item586;
	_objects pushback _this;
	_objectIDs pushback 586;
	_this setPosWorld [16696.2,13496.8,10.8425];
	_this setVectorDirAndUp [[-0.948397,0.317084,0.000444147],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item587 = objNull;
if (_layerRoot) then {
	_item587 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16696.4,13500.3,0.00720787],[],0,"CAN_COLLIDE"];
	_this = _item587;
	_objects pushback _this;
	_objectIDs pushback 587;
	_this setPosWorld [16696.4,13500.3,10.9617];
	_this setVectorDirAndUp [[-0.969597,-0.244707,1.79843e-005],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item588 = objNull;
if (_layerRoot) then {
	_item588 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16694.1,13493.9,0],[],0,"CAN_COLLIDE"];
	_this = _item588;
	_objects pushback _this;
	_objectIDs pushback 588;
	_this setPosWorld [16694.1,13493.9,10.7849];
	_this setVectorDirAndUp [[-0.602251,0.798307,0.000739653],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item589 = objNull;
if (_layerRoot) then {
	_item589 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16691.3,13502.3,0.0160503],[],0,"CAN_COLLIDE"];
	_this = _item589;
	_objects pushback _this;
	_objectIDs pushback 589;
	_this setPosWorld [16691.3,13502.3,10.9961];
	_this setVectorDirAndUp [[0.62165,-0.783295,-0.000732258],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item590 = objNull;
if (_layerRoot) then {
	_item590 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16689.2,13499.3,0],[],0,"CAN_COLLIDE"];
	_this = _item590;
	_objects pushback _this;
	_objectIDs pushback 590;
	_this setPosWorld [16689.2,13499.3,10.9475];
	_this setVectorDirAndUp [[0.955905,-0.293675,-0.000427794],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item591 = objNull;
if (_layerRoot) then {
	_item591 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16689.1,13495.9,0],[],0,"CAN_COLLIDE"];
	_this = _item591;
	_objects pushback _this;
	_objectIDs pushback 591;
	_this setPosWorld [16689.1,13495.9,10.8215];
	_this setVectorDirAndUp [[0.96328,0.268498,1.59274e-006],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item592 = objNull;
if (_layerRoot) then {
	_item592 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16680.7,13520.5,0],[],0,"CAN_COLLIDE"];
	_this = _item592;
	_objects pushback _this;
	_objectIDs pushback 592;
	_this setPosWorld [16680.7,13520.5,12.2369];
	_this setVectorDirAndUp [[-0.999047,-0.0436374,0.000178364],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item593 = objNull;
if (_layerRoot) then {
	_item593 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16679.6,13523.8,0],[],0,"CAN_COLLIDE"];
	_this = _item593;
	_objects pushback _this;
	_objectIDs pushback 593;
	_this setPosWorld [16679.6,13523.8,12.3516];
	_this setVectorDirAndUp [[-0.817638,-0.575733,-0.000267992],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item594 = objNull;
if (_layerRoot) then {
	_item594 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16679.7,13517.1,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item594;
	_objects pushback _this;
	_objectIDs pushback 594;
	_this setPosWorld [16679.7,13517.1,11.792];
	_this setVectorDirAndUp [[-0.848199,0.529677,0.000585873],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item595 = objNull;
if (_layerRoot) then {
	_item595 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16674.1,13523.8,0],[],0,"CAN_COLLIDE"];
	_this = _item595;
	_objects pushback _this;
	_objectIDs pushback 595;
	_this setPosWorld [16674.1,13523.8,11.9231];
	_this setVectorDirAndUp [[0.860949,-0.508692,-0.000572489],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item596 = objNull;
if (_layerRoot) then {
	_item596 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16673.3,13520.3,0],[],0,"CAN_COLLIDE"];
	_this = _item596;
	_objects pushback _this;
	_objectIDs pushback 596;
	_this setPosWorld [16673.3,13520.3,11.9331];
	_this setVectorDirAndUp [[0.997671,0.0682072,-0.000159238],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item597 = objNull;
if (_layerRoot) then {
	_item597 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16674.4,13517.1,0],[],0,"CAN_COLLIDE"];
	_this = _item597;
	_objects pushback _this;
	_objectIDs pushback 597;
	_this setPosWorld [16674.4,13517.1,11.8343];
	_this setVectorDirAndUp [[0.803223,0.595678,0.000286337],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item598 = objNull;
if (_layerRoot) then {
	_item598 = createVehicle ["Land_BagFence_Long_F",[16710.4,13507.7,0],[],0,"CAN_COLLIDE"];
	_this = _item598;
	_objects pushback _this;
	_objectIDs pushback 598;
	_this setPosWorld [16710.4,13507.7,10.2704];
	_this setVectorDirAndUp [[0.039879,0.998423,0.0395118],[0.0439577,-0.041258,0.998181]];
	_this allowdamage false;;
};

private _item599 = objNull;
if (_layerRoot) then {
	_item599 = createVehicle ["Land_BagFence_Long_F",[16705.9,13510.1,0.00654984],[],0,"CAN_COLLIDE"];
	_this = _item599;
	_objects pushback _this;
	_objectIDs pushback 599;
	_this setPosWorld [16705.9,13510.1,10.3763];
	_this setVectorDirAndUp [[0.732559,0.680341,-0.0221896],[0.0253248,0.00533597,0.999665]];
	_this allowdamage false;;
};

private _item600 = objNull;
if (_layerRoot) then {
	_item600 = createVehicle ["Land_BagFence_Long_F",[16703.9,13515.5,0.00164032],[],0,"CAN_COLLIDE"];
	_this = _item600;
	_objects pushback _this;
	_objectIDs pushback 600;
	_this setPosWorld [16703.9,13515.5,10.4823];
	_this setVectorDirAndUp [[0.99868,-0.0475742,0.0193557],[-0.0213272,-0.0412885,0.99892]];
	_this allowdamage false;;
};

private _item601 = objNull;
if (_layerRoot) then {
	_item601 = createVehicle ["Land_BagFence_Long_F",[16706.2,13519.7,0.0203905],[],0,"CAN_COLLIDE"];
	_this = _item601;
	_objects pushback _this;
	_objectIDs pushback 601;
	_this setPosWorld [16706.2,13519.7,10.6908];
	_this setVectorDirAndUp [[0.728723,-0.684658,-0.0143342],[0.0146639,-0.00532597,0.999878]];
	_this allowdamage false;;
};

private _item602 = objNull;
if (_layerRoot) then {
	_item602 = createVehicle ["Land_BagFence_Long_F",[16710.4,13521.6,0.0144529],[],0,"CAN_COLLIDE"];
	_this = _item602;
	_objects pushback _this;
	_objectIDs pushback 602;
	_this setPosWorld [16710.4,13521.6,10.6464];
	_this setVectorDirAndUp [[-0.0403664,-0.999167,-0.00602178],[-0.0173282,-0.00532575,0.999836]];
	_this allowdamage false;;
};

private _item603 = objNull;
if (_layerRoot) then {
	_item603 = createVehicle ["Land_BagFence_Long_F",[16716.1,13519.3,0.0132456],[],0,"CAN_COLLIDE"];
	_this = _item603;
	_objects pushback _this;
	_objectIDs pushback 603;
	_this setPosWorld [16716.1,13519.3,10.7398];
	_this setVectorDirAndUp [[-0.751355,-0.659586,-0.0203038],[-0.0199947,-0.00799899,0.999768]];
	_this allowdamage false;;
};

private _item604 = objNull;
if (_layerRoot) then {
	_item604 = createVehicle ["Land_BagFence_Long_F",[16717.4,13514.3,0],[],0,"CAN_COLLIDE"];
	_this = _item604;
	_objects pushback _this;
	_objectIDs pushback 604;
	_this setPosWorld [16717.4,13514.3,10.6412];
	_this setVectorDirAndUp [[-0.993068,0.117423,-0.00524917],[-0.0173316,-0.102114,0.994622]];
	_this allowdamage false;;
};

private _item605 = objNull;
if (_layerRoot) then {
	_item605 = createVehicle ["Land_BagFence_Long_F",[16714.9,13509.2,0.0312252],[],0,"CAN_COLLIDE"];
	_this = _item605;
	_objects pushback _this;
	_objectIDs pushback 605;
	_this setPosWorld [16714.9,13509.2,10.1635];
	_this setVectorDirAndUp [[-0.634601,0.770523,0.0597946],[0.0439577,-0.041258,0.998181]];
	_this allowdamage false;;
};

private _item606 = objNull;
if (_layerRoot) then {
	_item606 = createVehicle ["Land_BagFence_Long_F",[16695.9,13527.1,0],[],0,"CAN_COLLIDE"];
	_this = _item606;
	_objects pushback _this;
	_objectIDs pushback 606;
	_this setPosWorld [16695.9,13527.1,10.9917];
	_this setVectorDirAndUp [[0.0398056,0.997933,0.0504552],[0.0026744,-0.0506014,0.998715]];
	_this allowdamage false;;
};

private _item607 = objNull;
if (_layerRoot) then {
	_item607 = createVehicle ["Land_BagFence_Long_F",[16691.4,13529.4,0],[],0,"CAN_COLLIDE"];
	_this = _item607;
	_objects pushback _this;
	_objectIDs pushback 607;
	_this setPosWorld [16691.4,13529.4,11.4128];
	_this setVectorDirAndUp [[0.730145,0.682766,-0.0268176],[0.0837054,-0.050424,0.995214]];
	_this allowdamage false;;
};

private _item608 = objNull;
if (_layerRoot) then {
	_item608 = createVehicle ["Land_BagFence_Long_F",[16689.4,13534.9,0],[],0,"CAN_COLLIDE"];
	_this = _item608;
	_objects pushback _this;
	_objectIDs pushback 608;
	_this setPosWorld [16689.4,13534.9,11.3636];
	_this setVectorDirAndUp [[0.995395,-0.0510509,-0.0811341],[0.0837054,0.050424,0.995214]];
	_this allowdamage false;;
};

private _item609 = objNull;
if (_layerRoot) then {
	_item609 = createVehicle ["Land_BagFence_Long_F",[16691.7,13539.1,0],[],0,"CAN_COLLIDE"];
	_this = _item609;
	_objects pushback _this;
	_objectIDs pushback 609;
	_this setPosWorld [16691.7,13539.1,11.3009];
	_this setVectorDirAndUp [[0.729017,-0.684495,0.0011698],[0.0146639,0.0173263,0.999742]];
	_this allowdamage false;;
};

private _item610 = objNull;
if (_layerRoot) then {
	_item610 = createVehicle ["Land_BagFence_Long_F",[16695.9,13540.9,0],[],0,"CAN_COLLIDE"];
	_this = _item610;
	_objects pushback _this;
	_objectIDs pushback 610;
	_this setPosWorld [16695.9,13540.9,11.2288];
	_this setVectorDirAndUp [[-0.0401371,-0.999154,0.0090112],[0.0253248,0.00799833,0.999647]];
	_this allowdamage false;;
};

private _item611 = objNull;
if (_layerRoot) then {
	_item611 = createVehicle ["Land_BagFence_Long_F",[16701.6,13538.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item611;
	_objects pushback _this;
	_objectIDs pushback 611;
	_this setPosWorld [16701.6,13538.7,11.0985];
	_this setVectorDirAndUp [[-0.750915,-0.659226,0.0393427],[0.0359766,0.0186507,0.999179]];
	_this allowdamage false;;
};

private _item612 = objNull;
if (_layerRoot) then {
	_item612 = createVehicle ["Land_BagFence_Long_F",[16703.3,13533,0],[],0,"CAN_COLLIDE"];
	_this = _item612;
	_objects pushback _this;
	_objectIDs pushback 612;
	_this setPosWorld [16703.3,13533,10.9634];
	_this setVectorDirAndUp [[-0.998133,-0.0419321,0.044419],[0.0452867,-0.0199741,0.998774]];
	_this allowdamage false;;
};

private _item613 = objNull;
if (_layerRoot) then {
	_item613 = createVehicle ["Land_BagFence_Long_F",[16700.4,13528.5,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item613;
	_objects pushback _this;
	_objectIDs pushback 613;
	_this setPosWorld [16700.4,13528.5,10.957];
	_this setVectorDirAndUp [[-0.634775,0.771786,0.0375142],[0.0266571,-0.0266476,0.999289]];
	_this allowdamage false;;
};

private _item614 = objNull;
if (_layerRoot) then {
	_item614 = createVehicle ["Land_vn_zed_civil",[16703.7,13496.9,-0.275806],[],0,"CAN_COLLIDE"];
	_this = _item614;
	_objects pushback _this;
	_objectIDs pushback 614;
	_this setPosWorld [16703.7,13496.9,11.0363];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item615 = objNull;
if (_layerRoot) then {
	_item615 = createVehicle ["Land_vn_zed_podplaz_civil",[16708.4,13500.8,0],[],0,"CAN_COLLIDE"];
	_this = _item615;
	_objects pushback _this;
	_objectIDs pushback 615;
	_this setPosWorld [16708.4,13500.8,11.0529];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item616 = objNull;
if (_layerRoot) then {
	_item616 = createVehicle ["Land_vn_zed_civil",[16713.1,13504.6,-7.9155e-005],[],0,"CAN_COLLIDE"];
	_this = _item616;
	_objects pushback _this;
	_objectIDs pushback 616;
	_this setPosWorld [16713.1,13504.6,10.9608];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item617 = objNull;
if (_layerRoot) then {
	_item617 = createVehicle ["Land_vn_zed_civil",[16717.8,13508.6,0.0126495],[],0,"CAN_COLLIDE"];
	_this = _item617;
	_objects pushback _this;
	_objectIDs pushback 617;
	_this setPosWorld [16717.8,13508.6,11.1078];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item618 = objNull;
if (_layerRoot) then {
	_item618 = createVehicle ["Land_vn_zed_civil",[16722.5,13512.5,0.0569744],[],0,"CAN_COLLIDE"];
	_this = _item618;
	_objects pushback _this;
	_objectIDs pushback 618;
	_this setPosWorld [16722.5,13512.5,11.0986];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item619 = objNull;
if (_layerRoot) then {
	_item619 = createVehicle ["Land_vn_zed_civil",[16674.4,13508,0],[],0,"CAN_COLLIDE"];
	_this = _item619;
	_objects pushback _this;
	_objectIDs pushback 619;
	_this setPosWorld [16674.4,13508,11.6874];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item620 = objNull;
if (_layerRoot) then {
	_item620 = createVehicle ["Land_vn_zed_dira_civil",[16670.5,13512.6,-0.491563],[],0,"CAN_COLLIDE"];
	_this = _item620;
	_objects pushback _this;
	_objectIDs pushback 620;
	_this setPosWorld [16670.5,13512.6,11.623];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item621 = objNull;
if (_layerRoot) then {
	_item621 = createVehicle ["Land_vn_zed_podplaz_civil",[16678.3,13503.4,0],[],0,"CAN_COLLIDE"];
	_this = _item621;
	_objects pushback _this;
	_objectIDs pushback 621;
	_this setPosWorld [16678.3,13503.4,11.5956];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item622 = objNull;
if (_layerRoot) then {
	_item622 = createVehicle ["Land_vn_zed_civil",[16666.6,13517.4,-0.780309],[],0,"CAN_COLLIDE"];
	_this = _item622;
	_objects pushback _this;
	_objectIDs pushback 622;
	_this setPosWorld [16666.6,13517.4,11.8549];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item623 = objNull;
if (_layerRoot) then {
	_item623 = createVehicle ["Land_vn_zed_civil",[16682.2,13498.7,-0.121751],[],0,"CAN_COLLIDE"];
	_this = _item623;
	_objects pushback _this;
	_objectIDs pushback 623;
	_this setPosWorld [16682.2,13498.7,11.4564];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item624 = objNull;
if (_layerRoot) then {
	_item624 = createVehicle ["Land_vn_zed_civil",[16686.1,13493.9,-0.285197],[],0,"CAN_COLLIDE"];
	_this = _item624;
	_objects pushback _this;
	_objectIDs pushback 624;
	_this setPosWorld [16686.1,13493.9,11.233];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item625 = objNull;
if (_layerRoot) then {
	_item625 = createVehicle ["Land_vn_zed_civil",[16690,13489.3,-0.245793],[],0,"CAN_COLLIDE"];
	_this = _item625;
	_objects pushback _this;
	_objectIDs pushback 625;
	_this setPosWorld [16690,13489.3,10.956];
	_this setVectorDirAndUp [[0.77038,0.637585,0.000325425],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item626 = objNull;
if (_layerRoot) then {
	_item626 = createVehicle ["Land_vn_zed_civil",[16685.6,13537.4,0],[],0,"CAN_COLLIDE"];
	_this = _item626;
	_objects pushback _this;
	_objectIDs pushback 626;
	_this setPosWorld [16685.6,13537.4,12.3427];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item627 = objNull;
if (_layerRoot) then {
	_item627 = createVehicle ["Land_vn_zed_dira_civil",[16690.2,13541.4,0.0710649],[],0,"CAN_COLLIDE"];
	_this = _item627;
	_objects pushback _this;
	_objectIDs pushback 627;
	_this setPosWorld [16690.2,13541.4,12.1358];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item628 = objNull;
if (_layerRoot) then {
	_item628 = createVehicle ["Land_vn_zed_podplaz_civil",[16680.9,13533.5,0.0742874],[],0,"CAN_COLLIDE"];
	_this = _item628;
	_objects pushback _this;
	_objectIDs pushback 628;
	_this setPosWorld [16680.9,13533.5,12.3535];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item629 = objNull;
if (_layerRoot) then {
	_item629 = createVehicle ["Land_vn_zed_civil",[16695,13545.2,0.117958],[],0,"CAN_COLLIDE"];
	_this = _item629;
	_objects pushback _this;
	_objectIDs pushback 629;
	_this setPosWorld [16695,13545.2,12.401];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item630 = objNull;
if (_layerRoot) then {
	_item630 = createVehicle ["Land_vn_zed_civil",[16676.2,13529.6,0.0122538],[],0,"CAN_COLLIDE"];
	_this = _item630;
	_objects pushback _this;
	_objectIDs pushback 630;
	_this setPosWorld [16676.2,13529.6,12.1277];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item631 = objNull;
if (_layerRoot) then {
	_item631 = createVehicle ["Land_vn_zed_civil",[16671.5,13525.7,0.328089],[],0,"CAN_COLLIDE"];
	_this = _item631;
	_objects pushback _this;
	_objectIDs pushback 631;
	_this setPosWorld [16671.5,13525.7,12.7391];
	_this setVectorDirAndUp [[0.637517,-0.770436,-0.000725765],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item633 = objNull;
if (_layerRoot) then {
	_item633 = createVehicle ["Land_vn_zed_civil",[16722.7,13516.8,0.0629778],[],0,"CAN_COLLIDE"];
	_this = _item633;
	_objects pushback _this;
	_objectIDs pushback 633;
	_this setPosWorld [16722.7,13516.8,11.3736];
	_this setVectorDirAndUp [[-0.769686,-0.638423,-0.000326215],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item634 = objNull;
if (_layerRoot) then {
	_item634 = createVehicle ["Land_vn_zed_civil",[16699.3,13544.9,0.0985298],[],0,"CAN_COLLIDE"];
	_this = _item634;
	_objects pushback _this;
	_objectIDs pushback 634;
	_this setPosWorld [16699.3,13544.9,12.2282];
	_this setVectorDirAndUp [[-0.770584,-0.637339,-0.000325193],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item635 = objNull;
if (_layerRoot) then {
	_item635 = createVehicle ["vn_b_navy_static_l60mk3",[16683.4,13590.4,-0.0289049],[],0,"CAN_COLLIDE"];
	_this = _item635;
	_objects pushback _this;
	_objectIDs pushback 635;
	_this setPosWorld [16683.4,13590.4,16.1718];
	_this setVectorDirAndUp [[-0.998265,-0.0588562,-0.00194132],[-0.00265204,0.0119999,0.999924]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item636 = objNull;
if (_layerRoot) then {
	_item636 = createVehicle ["vn_b_navy_static_l60mk3",[16690.5,13595.3,-0.0266628],[],0,"CAN_COLLIDE"];
	_this = _item636;
	_objects pushback _this;
	_objectIDs pushback 636;
	_this setPosWorld [16690.5,13595.3,16.0443];
	_this setVectorDirAndUp [[0.197768,-0.979973,-0.0232656],[0.00532655,-0.0226597,0.999729]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item637 = objNull;
if (_layerRoot) then {
	_item637 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16677.1,13600.5,0],[],0,"CAN_COLLIDE"];
	_this = _item637;
	_objects pushback _this;
	_objectIDs pushback 637;
	_this setPosWorld [16677.1,13600.5,13.6038];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item638 = objNull;
if (_layerRoot) then {
	_item638 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16683.8,13605.8,0],[],0,"CAN_COLLIDE"];
	_this = _item638;
	_objects pushback _this;
	_objectIDs pushback 638;
	_this setPosWorld [16683.8,13605.8,13.6988];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item639 = objNull;
if (_layerRoot) then {
	_item639 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16690.9,13582.8,0],[],0,"CAN_COLLIDE"];
	_this = _item639;
	_objects pushback _this;
	_objectIDs pushback 639;
	_this setPosWorld [16690.9,13582.8,13.5905];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item640 = objNull;
if (_layerRoot) then {
	_item640 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16697.5,13588.1,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item640;
	_objects pushback _this;
	_objectIDs pushback 640;
	_this setPosWorld [16697.5,13588.1,13.5712];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item641 = objNull;
if (_layerRoot) then {
	_item641 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16697.7,13597,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item641;
	_objects pushback _this;
	_objectIDs pushback 641;
	_this setPosWorld [16697.7,13597,13.8586];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item642 = objNull;
if (_layerRoot) then {
	_item642 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16692.3,13603.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item642;
	_objects pushback _this;
	_objectIDs pushback 642;
	_this setPosWorld [16692.3,13603.7,13.9305];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item643 = objNull;
if (_layerRoot) then {
	_item643 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16689.7,13590.3,0],[],0,"CAN_COLLIDE"];
	_this = _item643;
	_objects pushback _this;
	_objectIDs pushback 643;
	_this setPosWorld [16689.7,13590.3,14.023];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item644 = objNull;
if (_layerRoot) then {
	_item644 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16684.2,13597,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item644;
	_objects pushback _this;
	_objectIDs pushback 644;
	_this setPosWorld [16684.2,13597,14.0225];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item645 = objNull;
if (_layerRoot) then {
	_item645 = createVehicle ["vn_o_pl_static_zpu4",[16748.5,13591.5,-0.0096159],[],0,"CAN_COLLIDE"];
	_this = _item645;
	_objects pushback _this;
	_objectIDs pushback 645;
	_this setPosWorld [16748.5,13591.5,12.619];
	_this setVectorDirAndUp [[0.835455,-0.549261,0.0180826],[-0.012,0.0146633,0.99982]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item647 = objNull;
if (_layerRoot) then {
	_item647 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16752.6,13592.6,0.00158119],[],0,"CAN_COLLIDE"];
	_this = _item647;
	_objects pushback _this;
	_objectIDs pushback 647;
	_this setPosWorld [16752.6,13592.6,11.7042];
	_this setVectorDirAndUp [[-0.999568,-0.0293999,0],[0,0,1]];
	_this allowdamage false;;
};

private _item648 = objNull;
if (_layerRoot) then {
	_item648 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16749,13586.9,0.00158119],[],0,"CAN_COLLIDE"];
	_this = _item648;
	_objects pushback _this;
	_objectIDs pushback 648;
	_this setPosWorld [16749,13586.9,11.5358];
	_this setVectorDirAndUp [[-0.415511,0.909588,0],[0,0,1]];
	_this allowdamage false;;
};

private _item649 = objNull;
if (_layerRoot) then {
	_item649 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16748.1,13595.7,0.00158119],[],0,"CAN_COLLIDE"];
	_this = _item649;
	_objects pushback _this;
	_objectIDs pushback 649;
	_this setPosWorld [16748.1,13595.7,11.6141];
	_this setVectorDirAndUp [[0.437741,-0.899101,0],[0,0,1]];
	_this allowdamage false;;
};

private _item650 = objNull;
if (_layerRoot) then {
	_item650 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16745.4,13593.3,0.00158119],[],0,"CAN_COLLIDE"];
	_this = _item650;
	_objects pushback _this;
	_objectIDs pushback 650;
	_this setPosWorld [16745.4,13593.3,11.668];
	_this setVectorDirAndUp [[0.869866,-0.493288,0],[0,0,1]];
	_this allowdamage false;;
};

private _item651 = objNull;
if (_layerRoot) then {
	_item651 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[16744.5,13589.9,0.00158119],[],0,"CAN_COLLIDE"];
	_this = _item651;
	_objects pushback _this;
	_objectIDs pushback 651;
	_this setPosWorld [16744.5,13589.9,11.4924];
	_this setVectorDirAndUp [[0.998543,0.053961,0],[0,0,1]];
	_this allowdamage false;;
};

private _item652 = objNull;
if (_layerRoot) then {
	_item652 = createVehicle ["vn_flag_pavn",[16724.5,13554.5,0],[],0,"CAN_COLLIDE"];
	_this = _item652;
	_objects pushback _this;
	_objectIDs pushback 652;
	_this setPosWorld [16724.5,13554.5,14.7531];
	_this setVectorDirAndUp [[0.55127,0.834327,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item653 = objNull;
if (_layerRoot) then {
	_item653 = createVehicle ["vn_o_kr_static_zgu1_01",[16699.6,13615.7,-0.00798702],[],0,"CAN_COLLIDE"];
	_this = _item653;
	_objects pushback _this;
	_objectIDs pushback 653;
	_this setPosWorld [16699.6,13615.7,15.4309];
	_this setVectorDirAndUp [[-0.352906,0.935624,-0.00799901],[-0.0226603,0,0.999743]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item654 = objNull;
if (_layerRoot) then {
	_item654 = createVehicle ["Land_BagFence_Round_F",[16702.7,13614.3,0.0102739],[],0,"CAN_COLLIDE"];
	_this = _item654;
	_objects pushback _this;
	_objectIDs pushback 654;
	_this setPosWorld [16702.7,13614.3,14.4421];
	_this setVectorDirAndUp [[-0.915251,0.400867,0.0402699],[0.0439562,0,0.999033]];
	_this allowdamage false;;
};

private _item655 = objNull;
if (_layerRoot) then {
	_item655 = createVehicle ["Land_BagFence_Round_F",[16698.2,13612.7,0.0102043],[],0,"CAN_COLLIDE"];
	_this = _item655;
	_objects pushback _this;
	_objectIDs pushback 655;
	_this setPosWorld [16698.2,13612.7,14.5066];
	_this setVectorDirAndUp [[0.428535,0.90264,-0.0399867],[0.0146639,0.0373023,0.999196]];
	_this allowdamage false;;
};

private _item656 = objNull;
if (_layerRoot) then {
	_item656 = createVehicle ["Land_BagFence_Round_F",[16696.3,13617.3,0.0100918],[],0,"CAN_COLLIDE"];
	_this = _item656;
	_objects pushback _this;
	_objectIDs pushback 656;
	_this setPosWorld [16696.3,13617.3,14.3611];
	_this setVectorDirAndUp [[0.947314,-0.320301,-0.00194496],[0.0146639,0.0373023,0.999196]];
	_this allowdamage false;;
};

private _item657 = objNull;
if (_layerRoot) then {
	_item657 = createVehicle ["Land_BagFence_Round_F",[16700.8,13619.3,0.0101194],[],0,"CAN_COLLIDE"];
	_this = _item657;
	_objects pushback _this;
	_objectIDs pushback 657;
	_this setPosWorld [16700.8,13619.3,14.4115];
	_this setVectorDirAndUp [[-0.348771,-0.937175,-0.00790528],[-0.0226603,0,0.999743]];
	_this allowdamage false;;
};

private _item658 = objNull;
if (_layerRoot) then {
	_item658 = createVehicle ["vn_b_sf_static_m45",[16643.2,13569.5,-0.0112762],[],0,"CAN_COLLIDE"];
	_this = _item658;
	_objects pushback _this;
	_objectIDs pushback 658;
	_this setPosWorld [16643.1,13569.4,15.494];
	_this setVectorDirAndUp [[-0.968089,-0.248198,-0.0346594],[-0.0306533,-0.0199881,0.99933]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item659 = objNull;
if (_layerRoot) then {
	_item659 = createVehicle ["Land_BagFence_Round_F",[16641.8,13572.3,0],[],0,"CAN_COLLIDE"];
	_this = _item659;
	_objects pushback _this;
	_objectIDs pushback 659;
	_this setPosWorld [16641.8,13572.3,13.9989];
	_this setVectorDirAndUp [[0.197363,-0.980254,-0.0122343],[-0.0373063,-0.0199807,0.999104]];
	_this allowdamage false;;
};

private _item660 = objNull;
if (_layerRoot) then {
	_item660 = createVehicle ["Land_BagFence_Round_F",[16645.3,13569.9,0],[],0,"CAN_COLLIDE"];
	_this = _item660;
	_objects pushback _this;
	_objectIDs pushback 660;
	_this setPosWorld [16645.3,13569.9,14.0616];
	_this setVectorDirAndUp [[-0.95009,-0.309966,-0.0353427],[-0.0306533,-0.0199881,0.99933]];
	_this allowdamage false;;
};

private _item661 = objNull;
if (_layerRoot) then {
	_item661 = createVehicle ["Land_BagFence_Round_F",[16643.2,13565.9,0.000583649],[],0,"CAN_COLLIDE"];
	_this = _item661;
	_objects pushback _this;
	_objectIDs pushback 661;
	_this setPosWorld [16643.2,13565.9,13.8956];
	_this setVectorDirAndUp [[-0.28139,0.959254,0.0255229],[-0.031983,-0.0359582,0.998841]];
	_this allowdamage false;;
};

private _item662 = objNull;
if (_layerRoot) then {
	_item662 = createVehicle ["Land_BagFence_Round_F",[16638.9,13568.2,0.000579834],[],0,"CAN_COLLIDE"];
	_this = _item662;
	_objects pushback _this;
	_objectIDs pushback 662;
	_this setPosWorld [16638.9,13568.2,13.7998];
	_this setVectorDirAndUp [[0.97305,0.226344,0.0440613],[-0.039967,-0.0226419,0.998944]];
	_this allowdamage false;;
};

private _item663 = objNull;
if (_layerRoot) then {
	_item663 = createVehicle ["Land_vn_b_trench_bunker_04_01",[16773,13535.9,0],[],0,"CAN_COLLIDE"];
	_this = _item663;
	_objects pushback _this;
	_objectIDs pushback 663;
	_this setPosWorld [16773,13535.9,7.95207];
	_this setVectorDirAndUp [[0.662416,0.749136,0],[0,0,1]];
};

private _item664 = objNull;
if (_layerRoot) then {
	_item664 = createVehicle ["Land_vn_b_tower_01",[16736.8,13507.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item664;
	_objects pushback _this;
	_objectIDs pushback 664;
	_this setPosWorld [16736.8,13507.9,10.0758];
	_this setVectorDirAndUp [[0.272942,-0.962031,0],[0,0,1]];
};

private _item666 = objNull;
if (_layerRoot) then {
	_item666 = createVehicle ["Land_vn_b_trench_45_02",[16768.6,13545.3,0],[],0,"CAN_COLLIDE"];
	_this = _item666;
	_objects pushback _this;
	_objectIDs pushback 666;
	_this setPosWorld [16768.6,13545.3,7.63006];
	_this setVectorDirAndUp [[-0.905729,-0.423858,-5.91576e-006],[0.07729,-0.165172,0.983232]];
};

private _item667 = objNull;
if (_layerRoot) then {
	_item667 = createVehicle ["Land_vn_b_trench_45_01",[16763,13560.2,0],[],0,"CAN_COLLIDE"];
	_this = _item667;
	_objects pushback _this;
	_objectIDs pushback 667;
	_this setPosWorld [16763,13560.2,8.32743];
	_this setVectorDirAndUp [[0.334632,-0.940538,0.0583993],[-0.00502528,0.0601901,0.998174]];
};

private _item668 = objNull;
if (_layerRoot) then {
	_item668 = createVehicle ["Land_vn_b_trench_90_02",[16770.5,13566.1,-0.0193367],[],0,"CAN_COLLIDE"];
	_this = _item668;
	_objects pushback _this;
	_objectIDs pushback 668;
	_this setPosWorld [16770.5,13566.1,7.96856];
	_this setVectorDirAndUp [[-0.278821,0.960343,-1.51657e-005],[0.0829223,0.024091,0.996265]];
};

private _item669 = objNull;
if (_layerRoot) then {
	_item669 = createVehicle ["Land_vn_b_trench_90_01",[16760.5,13551.3,-0.299047],[],0,"CAN_COLLIDE"];
	_this = _item669;
	_objects pushback _this;
	_objectIDs pushback 669;
	_this setPosWorld [16760.5,13551.3,8.60051];
	_this setVectorDirAndUp [[0.926735,-0.375612,0.00888087],[-0.00822724,0.00334402,0.999961]];
};

private _item670 = objNull;
if (_layerRoot) then {
	_item670 = createVehicle ["Land_vn_b_trench_firing_05",[16771.2,13522.7,0],[],0,"CAN_COLLIDE"];
	_this = _item670;
	_objects pushback _this;
	_objectIDs pushback 670;
	_this setPosWorld [16771.2,13522.7,5.92621];
	_this setVectorDirAndUp [[0.919219,0.393746,0],[0,0,1]];
};

private _item671 = objNull;
if (_layerRoot) then {
	_item671 = createVehicle ["Land_vn_b_trench_firing_01",[16775.7,13578.3,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item671;
	_objects pushback _this;
	_objectIDs pushback 671;
	_this setPosWorld [16775.7,13578.3,9.57806];
	_this setVectorDirAndUp [[0.988351,0.152193,0],[0,0,1]];
};

private _item672 = objNull;
if (_layerRoot) then {
	_item672 = createVehicle ["Land_vn_b_trench_corner_01",[16771.9,13539.1,0],[],0,"CAN_COLLIDE"];
	_this = _item672;
	_objects pushback _this;
	_objectIDs pushback 672;
	_this setPosWorld [16771.9,13539.1,8.23058];
	_this setVectorDirAndUp [[0.662416,0.749136,0],[0,0,1]];
};

private _item673 = objNull;
if (_layerRoot) then {
	_item673 = createVehicle ["Land_vn_b_trench_90_01",[16770.2,13602,-0.0126038],[],0,"CAN_COLLIDE"];
	_this = _item673;
	_objects pushback _this;
	_objectIDs pushback 673;
	_this setPosWorld [16770.2,13602,8.52946];
	_this setVectorDirAndUp [[-0.971029,-0.237842,-0.0231006],[-0.0120701,-0.0477301,0.998787]];
};

private _item674 = objNull;
if (_layerRoot) then {
	_item674 = createVehicle ["Land_vn_b_trench_20_02",[16761.1,13517.6,0.474187],[],0,"CAN_COLLIDE"];
	_this = _item674;
	_objects pushback _this;
	_objectIDs pushback 674;
	_this setPosWorld [16761.1,13517.6,6.50928];
	_this setVectorDirAndUp [[0.556495,-0.829306,0.0506321],[0.0248519,0.0775274,0.99668]];
};

private _item675 = objNull;
if (_layerRoot) then {
	_item675 = createVehicle ["Land_vn_b_trench_45_01",[16747.7,13512.3,0],[],0,"CAN_COLLIDE"];
	_this = _item675;
	_objects pushback _this;
	_objectIDs pushback 675;
	_this setPosWorld [16747.7,13512.3,6.784];
	_this setVectorDirAndUp [[0.478816,-0.875239,0.0684986],[-0.0772449,0.0357206,0.996372]];
};

private _item676 = objNull;
if (_layerRoot) then {
	_item676 = createVehicle ["Land_vn_b_trench_45_01",[16733.3,13501.6,0],[],0,"CAN_COLLIDE"];
	_this = _item676;
	_objects pushback _this;
	_objectIDs pushback 676;
	_this setPosWorld [16733.3,13501.6,7.28764];
	_this setVectorDirAndUp [[0.513453,0.857211,-0.0394334],[0.0966695,-0.01212,0.995243]];
};

private _item677 = objNull;
if (_layerRoot) then {
	_item677 = createVehicle ["Land_vn_b_trench_45_01",[16742.5,13504.1,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item677;
	_objects pushback _this;
	_objectIDs pushback 677;
	_this setPosWorld [16742.5,13504.1,6.7446];
	_this setVectorDirAndUp [[-0.319486,0.945857,-0.0572893],[-0.0111494,0.0567014,0.998329]];
};

private _item678 = objNull;
if (_layerRoot) then {
	_item678 = createVehicle ["Land_vn_b_trench_45_01",[16724.1,13504.6,-0.128074],[],0,"CAN_COLLIDE"];
	_this = _item678;
	_objects pushback _this;
	_objectIDs pushback 678;
	_this setPosWorld [16724.1,13504.6,8.17942];
	_this setVectorDirAndUp [[-0.464016,-0.885799,0.00696331],[0.0809292,-0.0345633,0.99612]];
};

private _item679 = objNull;
if (_layerRoot) then {
	_item679 = createVehicle ["Land_vn_hootch_02_03",[16721.3,13538.4,0.0200005],[],0,"CAN_COLLIDE"];
	_this = _item679;
	_objects pushback _this;
	_objectIDs pushback 679;
	_this setPosWorld [16721.3,13538.4,12.2114];
	_this setVectorDirAndUp [[0.766044,0.642788,0],[0,0,1]];
};

private _item680 = objNull;
if (_layerRoot) then {
	_item680 = createVehicle ["Land_vn_hootch_01_12",[16731,13549.7,0],[],0,"CAN_COLLIDE"];
	_this = _item680;
	_objects pushback _this;
	_objectIDs pushback 680;
	_this setPosWorld [16731,13549.7,12.0949];
	_this setVectorDirAndUp [[0.642788,-0.766044,0],[0,0,1]];
};

private _item681 = objNull;
if (_layerRoot) then {
	_item681 = createVehicle ["Land_vn_hootch_02_02",[16714.2,13547,4.76837e-006],[],0,"CAN_COLLIDE"];
	_this = _item681;
	_objects pushback _this;
	_objectIDs pushback 681;
	_this setPosWorld [16714.2,13547,12.2599];
	_this setVectorDirAndUp [[0.766044,0.642788,0],[0,0,1]];
};

private _item682 = objNull;
if (_layerRoot) then {
	_item682 = createVehicle ["Land_vn_hootch_02_11",[16719.7,13563.5,-0.0699987],[],0,"CAN_COLLIDE"];
	_this = _item682;
	_objects pushback _this;
	_objectIDs pushback 682;
	_this setPosWorld [16719.7,13563.5,12.5447];
	_this setVectorDirAndUp [[-0.642788,0.766044,0],[0,0,1]];
};

private _item683 = objNull;
if (_layerRoot) then {
	_item683 = createVehicle ["Land_vn_army_hut2_int",[16817.9,13558.1,-0.244235],[],0,"CAN_COLLIDE"];
	_this = _item683;
	_objects pushback _this;
	_objectIDs pushback 683;
	_this setPosWorld [16817.9,13558.1,5.2669];
	_this setVectorDirAndUp [[0.604645,-0.796495,0],[0,0,1]];
};

private _item684 = objNull;
if (_layerRoot) then {
	_item684 = createVehicle ["Land_vn_zed_civil",[16694.4,13489,-0.268245],[],0,"CAN_COLLIDE"];
	_this = _item684;
	_objects pushback _this;
	_objectIDs pushback 684;
	_this setPosWorld [16694.4,13489,10.9412];
	_this setVectorDirAndUp [[-0.638022,0.770018,0.000725552],[0.000212018,-0.000766579,1]];
	_this allowdamage false;;
};

private _item685 = objNull;
if (_layerRoot) then {
	_item685 = createVehicle ["vn_b_navy_static_l60mk3",[16667.9,13577.8,-0.00362396],[],0,"CAN_COLLIDE"];
	_this = _item685;
	_objects pushback _this;
	_objectIDs pushback 685;
	_this setPosWorld [16667.9,13577.8,15.8833];
	_this setVectorDirAndUp [[0.998173,0.059904,-0.00790615],[0.00800059,-0.00133683,0.999967]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item686 = objNull;
if (_layerRoot) then {
	_item686 = createVehicle ["vn_b_navy_static_l60mk3",[16675,13582.7,-0.00142479],[],0,"CAN_COLLIDE"];
	_this = _item686;
	_objects pushback _this;
	_objectIDs pushback 686;
	_this setPosWorld [16675,13582.7,15.9964];
	_this setVectorDirAndUp [[-0.194746,0.980851,0.00210869],[-0.0159977,-0.00532587,0.999858]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item687 = objNull;
if (_layerRoot) then {
	_item687 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16661.6,13587.9,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item687;
	_objects pushback _this;
	_objectIDs pushback 687;
	_this setPosWorld [16661.6,13587.9,13.4372];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item688 = objNull;
if (_layerRoot) then {
	_item688 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16668.3,13593.2,0],[],0,"CAN_COLLIDE"];
	_this = _item688;
	_objects pushback _this;
	_objectIDs pushback 688;
	_this setPosWorld [16668.3,13593.2,13.4911];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item689 = objNull;
if (_layerRoot) then {
	_item689 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16675.4,13570.2,0],[],0,"CAN_COLLIDE"];
	_this = _item689;
	_objects pushback _this;
	_objectIDs pushback 689;
	_this setPosWorld [16675.4,13570.2,13.3601];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item690 = objNull;
if (_layerRoot) then {
	_item690 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16682,13575.5,0],[],0,"CAN_COLLIDE"];
	_this = _item690;
	_objects pushback _this;
	_objectIDs pushback 690;
	_this setPosWorld [16682,13575.5,13.5027];
	_this setVectorDirAndUp [[0.611039,-0.790426,0.0431121],[-0.00798142,0.0483074,0.998801]];
};

private _item691 = objNull;
if (_layerRoot) then {
	_item691 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16682.2,13584.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item691;
	_objects pushback _this;
	_objectIDs pushback 691;
	_this setPosWorld [16682.2,13584.4,13.9441];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item692 = objNull;
if (_layerRoot) then {
	_item692 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16676.8,13591.1,0],[],0,"CAN_COLLIDE"];
	_this = _item692;
	_objects pushback _this;
	_objectIDs pushback 692;
	_this setPosWorld [16676.8,13591.1,13.9634];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item693 = objNull;
if (_layerRoot) then {
	_item693 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16674.2,13577.7,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item693;
	_objects pushback _this;
	_objectIDs pushback 693;
	_this setPosWorld [16674.2,13577.7,13.7548];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item694 = objNull;
if (_layerRoot) then {
	_item694 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16668.8,13584.4,0],[],0,"CAN_COLLIDE"];
	_this = _item694;
	_objects pushback _this;
	_objectIDs pushback 694;
	_this setPosWorld [16668.8,13584.4,13.79];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item695 = objNull;
if (_layerRoot) then {
	_item695 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16665.5,13571.2,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item695;
	_objects pushback _this;
	_objectIDs pushback 695;
	_this setPosWorld [16665.5,13571.2,13.6359];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item696 = objNull;
if (_layerRoot) then {
	_item696 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16660.1,13577.9,0],[],0,"CAN_COLLIDE"];
	_this = _item696;
	_objects pushback _this;
	_objectIDs pushback 696;
	_this setPosWorld [16660.1,13577.9,13.733];
	_this setVectorDirAndUp [[0.791716,0.610449,-0.023198],[-0.00798142,0.0483074,0.998801]];
};

private _item697 = objNull;
if (_layerRoot) then {
	_item697 = createVehicle ["vn_o_pl_static_d44_01",[16739.8,13611.2,0.000263214],[],0,"CAN_COLLIDE"];
	_this = _item697;
	_objects pushback _this;
	_objectIDs pushback 697;
	_this setPosWorld [16739.8,13611.2,10.7693];
	_this setVectorDirAndUp [[0.586631,-0.809247,-0.0313454],[0.0239934,-0.021321,0.999485]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item698 = objNull;
if (_layerRoot) then {
	_item698 = createVehicle ["Land_BagFence_Long_F",[16732.9,13612.1,0],[],0,"CAN_COLLIDE"];
	_this = _item698;
	_objects pushback _this;
	_objectIDs pushback 698;
	_this setPosWorld [16732.9,13612.1,11.3732];
	_this setVectorDirAndUp [[0.991934,-0.0976561,-0.0808067],[0.0850244,0.0398223,0.995583]];
	_this allowdamage false;;
};

private _item699 = objNull;
if (_layerRoot) then {
	_item699 = createVehicle ["Land_BagFence_Long_F",[16735.4,13616.5,0],[],0,"CAN_COLLIDE"];
	_this = _item699;
	_objects pushback _this;
	_objectIDs pushback 699;
	_this setPosWorld [16735.4,13616.5,11.4358];
	_this setVectorDirAndUp [[0.637096,-0.769853,-0.037879],[0.0239934,-0.0293117,0.999282]];
	_this allowdamage false;;
};

private _item700 = objNull;
if (_layerRoot) then {
	_item700 = createVehicle ["Land_BagFence_Long_F",[16741,13618.2,0],[],0,"CAN_COLLIDE"];
	_this = _item700;
	_objects pushback _this;
	_objectIDs pushback 700;
	_this setPosWorld [16741,13618.2,11.1814];
	_this setVectorDirAndUp [[-0.0928185,-0.995681,0.00201035],[0.0359766,-0.00133601,0.999352]];
	_this allowdamage false;;
};

private _item701 = objNull;
if (_layerRoot) then {
	_item701 = createVehicle ["Land_BagFence_Long_F",[16745,13615.7,0],[],0,"CAN_COLLIDE"];
	_this = _item701;
	_objects pushback _this;
	_objectIDs pushback 701;
	_this setPosWorld [16745,13615.7,11.0392];
	_this setVectorDirAndUp [[-0.720467,-0.693388,0.0118187],[0.0266571,-0.0106603,0.999588]];
	_this allowdamage false;;
};

private _item702 = objNull;
if (_layerRoot) then {
	_item702 = createVehicle ["Land_BagFence_Long_F",[16746.7,13611.4,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item702;
	_objects pushback _this;
	_objectIDs pushback 702;
	_this setPosWorld [16746.7,13611.4,10.9497];
	_this setVectorDirAndUp [[-0.995332,0.0890254,0.0372605],[0.0359766,-0.0159833,0.999225]];
	_this allowdamage false;;
};

private _item703 = objNull;
if (_layerRoot) then {
	_item703 = createVehicle ["Land_BagFence_Long_F",[16744.1,13605.8,0],[],0,"CAN_COLLIDE"];
	_this = _item703;
	_objects pushback _this;
	_objectIDs pushback 703;
	_this setPosWorld [16744.1,13605.8,10.9391];
	_this setVectorDirAndUp [[-0.620256,0.783585,0.0357438],[0.0306533,-0.02132,0.999303]];
	_this allowdamage false;;
};

private _item704 = objNull;
if (_layerRoot) then {
	_item704 = createVehicle ["Land_BagFence_Long_F",[16738.4,13604.4,0],[],0,"CAN_COLLIDE"];
	_this = _item704;
	_objects pushback _this;
	_objectIDs pushback 704;
	_this setPosWorld [16738.4,13604.4,11.2174];
	_this setVectorDirAndUp [[0.0103836,0.998687,-0.0501559],[0.0850239,0.0490952,0.995169]];
	_this allowdamage false;;
};

private _item705 = objNull;
if (_layerRoot) then {
	_item705 = createVehicle ["Land_BagFence_Long_F",[16734.1,13607.5,0],[],0,"CAN_COLLIDE"];
	_this = _item705;
	_objects pushback _this;
	_objectIDs pushback 705;
	_this setPosWorld [16734.1,13607.5,11.4533];
	_this setVectorDirAndUp [[0.800595,0.592093,-0.0920552],[0.0850244,0.0398223,0.995583]];
	_this allowdamage false;;
};

private _item706 = objNull;
if (_layerRoot) then {
	_item706 = createVehicle ["vn_o_pl_static_d44_01",[16741.1,13577.1,0.0106335],[],0,"CAN_COLLIDE"];
	_this = _item706;
	_objects pushback _this;
	_objectIDs pushback 706;
	_this setPosWorld [16741.1,13577.2,10.1529];
	_this setVectorDirAndUp [[-0.767457,0.64095,0.0138443],[0.00133688,-0.0199946,0.999799]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item707 = objNull;
if (_layerRoot) then {
	_item707 = createVehicle ["Land_BagFence_Long_F",[16747.9,13578,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item707;
	_objects pushback _this;
	_objectIDs pushback 707;
	_this setPosWorld [16747.9,13578,10.6752];
	_this setVectorDirAndUp [[-0.986486,-0.160541,0.0327438],[0.0426276,-0.0585121,0.997376]];
	_this allowdamage false;;
};

private _item708 = objNull;
if (_layerRoot) then {
	_item708 = createVehicle ["Land_BagFence_Long_F",[16746.6,13573.1,0.00957966],[],0,"CAN_COLLIDE"];
	_this = _item708;
	_objects pushback _this;
	_objectIDs pushback 708;
	_this setPosWorld [16746.6,13573.1,10.4221];
	_this setVectorDirAndUp [[-0.811857,0.583052,0.030628],[0.00133688,-0.0506016,0.998718]];
	_this allowdamage false;;
};

private _item709 = objNull;
if (_layerRoot) then {
	_item709 = createVehicle ["Land_BagFence_Long_F",[16741.6,13570,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item709;
	_objects pushback _this;
	_objectIDs pushback 709;
	_this setPosWorld [16741.6,13570,10.4271];
	_this setVectorDirAndUp [[-0.150496,0.988534,0.0122886],[0.0466147,-0.00532076,0.998899]];
	_this allowdamage false;;
};

private _item710 = objNull;
if (_layerRoot) then {
	_item710 = createVehicle ["Land_BagFence_Long_F",[16737.1,13571.4,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item710;
	_objects pushback _this;
	_objectIDs pushback 710;
	_this setPosWorld [16737.1,13571.4,10.6306];
	_this setVectorDirAndUp [[0.528643,0.848668,-0.0173303],[0.0412979,-0.005322,0.999133]];
	_this allowdamage false;;
};

private _item711 = objNull;
if (_layerRoot) then {
	_item711 = createVehicle ["Land_BagFence_Long_F",[16734.4,13575.2,0.00962639],[],0,"CAN_COLLIDE"];
	_this = _item711;
	_objects pushback _this;
	_objectIDs pushback 711;
	_this setPosWorld [16734.4,13575.2,10.7669];
	_this setVectorDirAndUp [[0.98744,0.153858,-0.0359116],[0.0412979,-0.0319557,0.998636]];
	_this allowdamage false;;
};

private _item712 = objNull;
if (_layerRoot) then {
	_item712 = createVehicle ["Land_BagFence_Long_F",[16735.5,13581.3,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item712;
	_objects pushback _this;
	_objectIDs pushback 712;
	_this setPosWorld [16735.5,13581.3,10.8931];
	_this setVectorDirAndUp [[0.795307,-0.603752,-0.0545006],[0.0532574,-0.0199691,0.998381]];
	_this allowdamage false;;
};

private _item713 = objNull;
if (_layerRoot) then {
	_item713 = createVehicle ["Land_BagFence_Long_F",[16740.7,13584.1,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item713;
	_objects pushback _this;
	_objectIDs pushback 713;
	_this setPosWorld [16740.7,13584.1,10.765];
	_this setVectorDirAndUp [[0.243476,-0.969528,-0.0270986],[-0.0373063,-0.0372801,0.998608]];
	_this allowdamage false;;
};

private _item714 = objNull;
if (_layerRoot) then {
	_item714 = createVehicle ["Land_BagFence_Long_F",[16745.7,13582.1,0.00962734],[],0,"CAN_COLLIDE"];
	_this = _item714;
	_objects pushback _this;
	_objectIDs pushback 714;
	_this setPosWorld [16745.7,13582.1,10.8677];
	_this setVectorDirAndUp [[-0.634688,-0.769692,-0.0688898],[-0.0373063,-0.0585245,0.997589]];
	_this allowdamage false;;
};

private _item715 = objNull;
if (_layerRoot) then {
	_item715 = createVehicle ["Land_vn_b_trench_wall_10_03",[16779.9,13526.7,-0.302998],[],0,"CAN_COLLIDE"];
	_this = _item715;
	_objects pushback _this;
	_objectIDs pushback 715;
	_this setPosWorld [16779.9,13526.7,4.94715];
	_this setVectorDirAndUp [[-0.86819,0.496232,0],[0,0,1]];
};

private _item716 = objNull;
if (_layerRoot) then {
	_item716 = createVehicle ["Land_vn_b_trench_wall_10_03",[16783,13533.3,-0.64299],[],0,"CAN_COLLIDE"];
	_this = _item716;
	_objects pushback _this;
	_objectIDs pushback 716;
	_this setPosWorld [16783,13533.3,4.94626];
	_this setVectorDirAndUp [[-0.944646,0.328091,0],[0,0,1]];
};

private _item717 = objNull;
if (_layerRoot) then {
	_item717 = createVehicle ["Land_vn_b_trench_wall_10_03",[16775.8,13519.1,-1.20892],[],0,"CAN_COLLIDE"];
	_this = _item717;
	_objects pushback _this;
	_objectIDs pushback 717;
	_this setPosWorld [16775.8,13519.1,4.02143];
	_this setVectorDirAndUp [[-0.919748,0.392509,0],[0,0,1]];
};

private _item718 = objNull;
if (_layerRoot) then {
	_item718 = createVehicle ["Land_vn_b_trench_wall_10_03",[16772.1,13516.6,-1.79517],[],0,"CAN_COLLIDE"];
	_this = _item718;
	_objects pushback _this;
	_objectIDs pushback 718;
	_this setPosWorld [16772.1,13516.6,3.99017];
	_this setVectorDirAndUp [[0.0122574,0.999925,0],[0,0,1]];
};

private _item719 = objNull;
if (_layerRoot) then {
	_item719 = createVehicle ["Land_vn_b_trench_wall_10_03",[16782.6,13539,-1.57133],[],0,"CAN_COLLIDE"];
	_this = _item719;
	_objects pushback _this;
	_objectIDs pushback 719;
	_this setPosWorld [16782.6,13539,4.89997];
	_this setVectorDirAndUp [[-0.854986,-0.518651,0],[0,0,1]];
};

private _item720 = objNull;
if (_layerRoot) then {
	_item720 = createVehicle ["Land_vn_b_trench_45_01",[16706.9,13492.1,-0.261098],[],0,"CAN_COLLIDE"];
	_this = _item720;
	_objects pushback _this;
	_objectIDs pushback 720;
	_this setPosWorld [16706.9,13492.1,8.76002];
	_this setVectorDirAndUp [[0.724488,-0.68928,-0.00315862],[-0.0169292,-0.0223746,0.999606]];
};

private _item721 = objNull;
if (_layerRoot) then {
	_item721 = createVehicle ["Land_vn_b_trench_45_01",[16704.8,13482.1,0.074132],[],0,"CAN_COLLIDE"];
	_this = _item721;
	_objects pushback _this;
	_objectIDs pushback 721;
	_this setPosWorld [16704.8,13482.1,8.31454];
	_this setVectorDirAndUp [[-0.682294,0.731075,-0.0020279],[-0.0495998,-0.0435225,0.99782]];
};

private _item722 = objNull;
if (_layerRoot) then {
	_item722 = createVehicle ["Land_vn_b_trench_45_01",[16697.4,13476.4,0.0741863],[],0,"CAN_COLLIDE"];
	_this = _item722;
	_objects pushback _this;
	_objectIDs pushback 722;
	_this setPosWorld [16697.4,13476.4,7.95058];
	_this setVectorDirAndUp [[0.214123,0.976741,-0.0113599],[-0.0208914,0.0162062,0.99965]];
};

private _item723 = objNull;
if (_layerRoot) then {
	_item723 = createVehicle ["Land_vn_b_trench_45_01",[16687.9,13476.2,-0.178122],[],0,"CAN_COLLIDE"];
	_this = _item723;
	_objects pushback _this;
	_objectIDs pushback 723;
	_this setPosWorld [16687.9,13476.2,7.94145];
	_this setVectorDirAndUp [[-0.137098,-0.989796,0.0388325],[-0.0241109,0.0425256,0.998804]];
};

private _item724 = objNull;
if (_layerRoot) then {
	_item724 = createVehicle ["Land_vn_b_tower_01",[16697.8,13482,0.074131],[],0,"CAN_COLLIDE"];
	_this = _item724;
	_objects pushback _this;
	_objectIDs pushback 724;
	_this setPosWorld [16697.8,13482,11.3908];
	_this setVectorDirAndUp [[0.607351,-0.794434,0.000778291],[-0.000492264,0.000603341,1]];
};

private _item725 = objNull;
if (_layerRoot) then {
	_item725 = createVehicle ["Land_vn_b_trench_firing_05",[16647.8,13484.8,0.754024],[],0,"CAN_COLLIDE"];
	_this = _item725;
	_objects pushback _this;
	_objectIDs pushback 725;
	_this setPosWorld [16647.8,13484.8,8.79226];
	_this setVectorDirAndUp [[0.978379,-0.206818,-0.000538975],[0.000643555,0.000438384,1]];
};

private _item726 = objNull;
if (_layerRoot) then {
	_item726 = createVehicle ["Land_vn_b_trench_45_01",[16649,13505.3,0],[],0,"CAN_COLLIDE"];
	_this = _item726;
	_objects pushback _this;
	_objectIDs pushback 726;
	_this setPosWorld [16649,13505.3,8.62199];
	_this setVectorDirAndUp [[-0.998664,-0.0421619,0.0298602],[0.0348581,-0.123273,0.99176]];
};

private _item727 = objNull;
if (_layerRoot) then {
	_item727 = createVehicle ["Land_vn_b_trench_20_01",[16641.6,13600.8,1.90735e-006],[],0,"CAN_COLLIDE"];
	_this = _item727;
	_objects pushback _this;
	_objectIDs pushback 727;
	_this setPosWorld [16641.6,13600.8,10.4023];
	_this setVectorDirAndUp [[-0.593769,0.804635,-0.000773548],[-0.0256754,-0.0179859,0.999509]];
};

private _item728 = objNull;
if (_layerRoot) then {
	_item728 = createVehicle ["Land_vn_b_trench_45_01",[16641.2,13539.7,0],[],0,"CAN_COLLIDE"];
	_this = _item728;
	_objects pushback _this;
	_objectIDs pushback 728;
	_this setPosWorld [16641.2,13539.7,10.3976];
	_this setVectorDirAndUp [[-0.727787,-0.685799,-0.00238626],[0.031423,-0.0368223,0.998828]];
};

private _item729 = objNull;
if (_layerRoot) then {
	_item729 = createVehicle ["Land_vn_b_trench_45_01",[16631.3,13542.3,0.239957],[],0,"CAN_COLLIDE"];
	_this = _item729;
	_objects pushback _this;
	_objectIDs pushback 729;
	_this setPosWorld [16631.3,13542.3,10.9284];
	_this setVectorDirAndUp [[0.787204,0.616689,-0.00202539],[0.0461322,-0.0556121,0.997386]];
};

private _item730 = objNull;
if (_layerRoot) then {
	_item730 = createVehicle ["Land_vn_b_trench_45_01",[16626.2,13550.2,0],[],0,"CAN_COLLIDE"];
	_this = _item730;
	_objects pushback _this;
	_objectIDs pushback 730;
	_this setPosWorld [16626.2,13550.2,11.6934];
	_this setVectorDirAndUp [[0.95463,-0.297579,-0.0113588],[-0.0126631,-0.0786723,0.99682]];
};

private _item731 = objNull;
if (_layerRoot) then {
	_item731 = createVehicle ["Land_vn_b_trench_45_01",[16626.9,13559.8,-0.177381],[],0,"CAN_COLLIDE"];
	_this = _item731;
	_objects pushback _this;
	_objectIDs pushback 731;
	_this setPosWorld [16626.9,13559.8,12.2976];
	_this setVectorDirAndUp [[-0.97428,0.221971,0.0388295],[0.0293526,-0.0458362,0.998518]];
};

private _item732 = objNull;
if (_layerRoot) then {
	_item732 = createVehicle ["Land_vn_b_tower_01",[16632.7,13547,0],[],0,"CAN_COLLIDE"];
	_this = _item732;
	_objects pushback _this;
	_objectIDs pushback 732;
	_this setPosWorld [16632.7,13547,14.4838];
	_this setVectorDirAndUp [[-0.843863,-0.536558,0.000778291],[0.000643555,0.000438384,1]];
};

private _item733 = objNull;
if (_layerRoot) then {
	_item733 = createVehicle ["Land_vn_b_trench_bunker_04_01",[16621.7,13574.9,1.02094],[],0,"CAN_COLLIDE"];
	_this = _item733;
	_objects pushback _this;
	_objectIDs pushback 733;
	_this setPosWorld [16621.7,13574.9,14.1601];
	_this setVectorDirAndUp [[-0.655193,-0.755461,0],[0,0,1]];
};

private _item734 = objNull;
if (_layerRoot) then {
	_item734 = createVehicle ["Land_vn_b_trench_45_02",[16618.2,13565.2,0.388453],[],0,"CAN_COLLIDE"];
	_this = _item734;
	_objects pushback _this;
	_objectIDs pushback 734;
	_this setPosWorld [16618.2,13565.2,12.3682];
	_this setVectorDirAndUp [[0.745095,0.665348,-0.0463197],[-0.00863072,0.0790619,0.996832]];
};

private _item735 = objNull;
if (_layerRoot) then {
	_item735 = createVehicle ["Land_vn_b_trench_45_01",[16657.9,13492.9,-0.184553],[],0,"CAN_COLLIDE"];
	_this = _item735;
	_objects pushback _this;
	_objectIDs pushback 735;
	_this setPosWorld [16657.9,13492.9,7.97266];
	_this setVectorDirAndUp [[-0.783763,-0.621058,0.00176127],[-0.0201717,0.0282905,0.999396]];
};

private _item736 = objNull;
if (_layerRoot) then {
	_item736 = createVehicle ["Land_vn_b_trench_cross_01",[16649.7,13495.5,0],[],0,"CAN_COLLIDE"];
	_this = _item736;
	_objects pushback _this;
	_objectIDs pushback 736;
	_this setPosWorld [16649.7,13495.5,7.86127];
	_this setVectorDirAndUp [[0.993306,-0.115516,0],[0,0,1]];
};

private _item737 = objNull;
if (_layerRoot) then {
	_item737 = createVehicle ["Land_vn_b_trench_firing_02",[16673.5,13622.7,0.253385],[],0,"CAN_COLLIDE"];
	_this = _item737;
	_objects pushback _this;
	_objectIDs pushback 737;
	_this setPosWorld [16673.5,13622.7,12.81];
	_this setVectorDirAndUp [[-0.861238,-0.508202,0],[0,0,1]];
};

private _item738 = objNull;
if (_layerRoot) then {
	_item738 = createVehicle ["Land_vn_b_trench_20_02",[16664.6,13480.8,-0.148113],[],0,"CAN_COLLIDE"];
	_this = _item738;
	_objects pushback _this;
	_objectIDs pushback 738;
	_this setPosWorld [16664.6,13480.8,7.8356];
	_this setVectorDirAndUp [[-0.754397,-0.651322,-0.0816392],[-0.0568566,-0.0590675,0.996634]];
};

private _item740 = objNull;
if (_layerRoot) then {
	_item740 = createVehicle ["Land_vn_b_trench_45_02",[16630,13592.8,0.249047],[],0,"CAN_COLLIDE"];
	_this = _item740;
	_objects pushback _this;
	_objectIDs pushback 740;
	_this setPosWorld [16630,13592.8,10.6468];
	_this setVectorDirAndUp [[0.568064,-0.822849,-0.0149224],[0.0463923,0.0139137,0.998826]];
};

private _item741 = objNull;
if (_layerRoot) then {
	_item741 = createVehicle ["Land_vn_b_trench_90_01",[16678.3,13473.9,0],[],0,"CAN_COLLIDE"];
	_this = _item741;
	_objects pushback _this;
	_objectIDs pushback 741;
	_this setPosWorld [16678.3,13473.9,7.8568];
	_this setVectorDirAndUp [[0.780369,0.625319,0],[0,0,1]];
};

private _item742 = objNull;
if (_layerRoot) then {
	_item742 = createVehicle ["Land_vn_b_trench_firing_05",[16719.7,13492.7,0.838376],[],0,"CAN_COLLIDE"];
	_this = _item742;
	_objects pushback _this;
	_objectIDs pushback 742;
	_this setPosWorld [16719.7,13492.7,9.39361];
	_this setVectorDirAndUp [[0.780578,0.625059,0],[0,0,1]];
};

private _item743 = objNull;
if (_layerRoot) then {
	_item743 = createVehicle ["Land_vn_b_trench_cross_02",[16718.1,13495.5,0.394835],[],0,"CAN_COLLIDE"];
	_this = _item743;
	_objects pushback _this;
	_objectIDs pushback 743;
	_this setPosWorld [16718.1,13495.5,8.55612];
	_this setVectorDirAndUp [[0.619831,-0.784735,1.20327e-006],[0.0304626,0.0240627,0.999246]];
};

private _item744 = objNull;
if (_layerRoot) then {
	_item744 = createVehicle ["Land_vn_b_trench_45_01",[16643,13513.4,0],[],0,"CAN_COLLIDE"];
	_this = _item744;
	_objects pushback _this;
	_objectIDs pushback 744;
	_this setPosWorld [16643,13513.4,9.33502];
	_this setVectorDirAndUp [[0.999731,0.020226,-0.0113584],[0.0125627,-0.0604478,0.998092]];
};

private _item745 = objNull;
if (_layerRoot) then {
	_item745 = createVehicle ["Land_vn_b_trench_45_01",[16642.2,13523,-0.649055],[],0,"CAN_COLLIDE"];
	_this = _item745;
	_objects pushback _this;
	_objectIDs pushback 745;
	_this setPosWorld [16642.2,13523,10.3166];
	_this setVectorDirAndUp [[0.778085,-0.628056,-0.0113562],[-0.034186,-0.0603901,0.997589]];
};

private _item746 = objNull;
if (_layerRoot) then {
	_item746 = createVehicle ["Land_vn_b_trench_90_01",[16645.7,13532.1,0],[],0,"CAN_COLLIDE"];
	_this = _item746;
	_objects pushback _this;
	_objectIDs pushback 746;
	_this setPosWorld [16645.7,13532.1,10.3104];
	_this setVectorDirAndUp [[-0.732382,0.680893,-1.73785e-006],[0.0357802,0.0384885,0.998618]];
};

private _item747 = objNull;
if (_layerRoot) then {
	_item747 = createVehicle ["Land_vn_b_trench_wall_10_03",[16611.9,13578.8,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item747;
	_objects pushback _this;
	_objectIDs pushback 747;
	_this setPosWorld [16611.9,13578.8,10.979];
	_this setVectorDirAndUp [[0.922306,-0.386461,0],[0,0,1]];
};

private _item748 = objNull;
if (_layerRoot) then {
	_item748 = createVehicle ["Land_vn_b_trench_wall_10_03",[16616.4,13583.4,-0.31874],[],0,"CAN_COLLIDE"];
	_this = _item748;
	_objects pushback _this;
	_objectIDs pushback 748;
	_this setPosWorld [16616.4,13583.4,11.1098];
	_this setVectorDirAndUp [[0.476987,-0.87891,0],[0,0,1]];
};

private _item749 = objNull;
if (_layerRoot) then {
	_item749 = createVehicle ["Land_vn_b_trench_wall_10_03",[16610.8,13571.7,-0.292582],[],0,"CAN_COLLIDE"];
	_this = _item749;
	_objects pushback _this;
	_objectIDs pushback 749;
	_this setPosWorld [16610.8,13571.7,10.9608];
	_this setVectorDirAndUp [[0.989052,0.147567,0],[0,0,1]];
};

private _item750 = objNull;
if (_layerRoot) then {
	_item750 = createVehicle ["Land_vn_b_trench_wall_10_03",[16623,13584.6,-0.861645],[],0,"CAN_COLLIDE"];
	_this = _item750;
	_objects pushback _this;
	_objectIDs pushback 750;
	_this setPosWorld [16623,13584.6,11.1356];
	_this setVectorDirAndUp [[-0.105004,-0.994472,0],[0,0,1]];
};

private _item751 = objNull;
if (_layerRoot) then {
	_item751 = createVehicle ["Land_vn_b_trench_wall_10_03",[16613.7,13565.2,-1.52204],[],0,"CAN_COLLIDE"];
	_this = _item751;
	_objects pushback _this;
	_objectIDs pushback 751;
	_this setPosWorld [16613.7,13565.2,10.901];
	_this setVectorDirAndUp [[0.744781,0.667309,0],[0,0,1]];
};

private _item752 = objNull;
if (_layerRoot) then {
	_item752 = createVehicle ["Land_vn_b_trench_corner_01",[16614.9,13569.9,0.000323296],[],0,"CAN_COLLIDE"];
	_this = _item752;
	_objects pushback _this;
	_objectIDs pushback 752;
	_this setPosWorld [16614.9,13569.9,12.4506];
	_this setVectorDirAndUp [[-0.739565,-0.673085,0],[0,0,1]];
};

private _item753 = objNull;
if (_layerRoot) then {
	_item753 = createVehicle ["Land_vn_b_trench_firing_05",[16640.9,13495.8,0.418906],[],0,"CAN_COLLIDE"];
	_this = _item753;
	_objects pushback _this;
	_objectIDs pushback 753;
	_this setPosWorld [16640.9,13495.8,8.68524];
	_this setVectorDirAndUp [[-0.106899,-0.99427,-0.000538903],[0.000500981,-0.000595872,1]];
};

private _item754 = objNull;
if (_layerRoot) then {
	_item754 = createVehicle ["Land_vn_b_trench_45_01",[16654.3,13609.2,0.0096302],[],0,"CAN_COLLIDE"];
	_this = _item754;
	_objects pushback _this;
	_objectIDs pushback 754;
	_this setPosWorld [16654.3,13609.2,10.825];
	_this setVectorDirAndUp [[-0.106021,-0.993605,0.0388317],[-0.0705467,0.0464695,0.996425]];
};

private _item755 = objNull;
if (_layerRoot) then {
	_item755 = createVehicle ["Land_vn_b_trench_45_01",[16663.7,13610.2,0.00948334],[],0,"CAN_COLLIDE"];
	_this = _item755;
	_objects pushback _this;
	_objectIDs pushback 755;
	_this setPosWorld [16663.7,13610.2,11.7408];
	_this setVectorDirAndUp [[0.117588,0.992444,0.0350463],[-0.0750942,-0.0263038,0.996829]];
};

private _item756 = objNull;
if (_layerRoot) then {
	_item756 = createVehicle ["Land_vn_b_trench_45_01",[16672.5,13614.9,0.0325918],[],0,"CAN_COLLIDE"];
	_this = _item756;
	_objects pushback _this;
	_objectIDs pushback 756;
	_this setPosWorld [16672.5,13614.9,12.6586];
	_this setVectorDirAndUp [[-0.106025,-0.993605,0.038831],[-0.0945513,0.0489481,0.994316]];
};

private _item757 = objNull;
if (_layerRoot) then {
	_item757 = createVehicle ["Land_vn_b_trench_90_01",[16761.1,13605.9,0],[],0,"CAN_COLLIDE"];
	_this = _item757;
	_objects pushback _this;
	_objectIDs pushback 757;
	_this setPosWorld [16761.1,13605.9,9.30551];
	_this setVectorDirAndUp [[0.976006,0.214703,-0.0362583],[0.0509045,-0.063083,0.996709]];
};

private _item758 = objNull;
if (_layerRoot) then {
	_item758 = createVehicle ["Land_vn_b_trench_45_01",[16755.9,13614.3,0.000452995],[],0,"CAN_COLLIDE"];
	_this = _item758;
	_objects pushback _this;
	_objectIDs pushback 758;
	_this setPosWorld [16755.9,13614.3,9.68194];
	_this setVectorDirAndUp [[-0.964953,-0.25191,-0.0735284],[-0.0618832,-0.0538534,0.996629]];
};

private _item760 = objNull;
if (_layerRoot) then {
	_item760 = createVehicle ["Land_vn_b_trench_20_02",[16745.6,13625.5,0],[],0,"CAN_COLLIDE"];
	_this = _item760;
	_objects pushback _this;
	_objectIDs pushback 760;
	_this setPosWorld [16745.6,13625.5,9.8209];
	_this setVectorDirAndUp [[0.493942,0.842717,-0.214122],[0.143925,0.163621,0.975968]];
};

private _item761 = objNull;
if (_layerRoot) then {
	_item761 = createVehicle ["Land_vn_b_trench_45_01",[16727.9,13633.7,3.91006e-005],[],0,"CAN_COLLIDE"];
	_this = _item761;
	_objects pushback _this;
	_objectIDs pushback 761;
	_this setPosWorld [16727.9,13633.7,11.3361];
	_this setVectorDirAndUp [[0.989911,0.12255,-0.0711204],[0.0665733,0.0408127,0.996946]];
};

private _item762 = objNull;
if (_layerRoot) then {
	_item762 = createVehicle ["Land_vn_b_trench_firing_05",[16734.9,13632.8,0.000307083],[],0,"CAN_COLLIDE"];
	_this = _item762;
	_objects pushback _this;
	_objectIDs pushback 762;
	_this setPosWorld [16734.9,13632.8,11.4406];
	_this setVectorDirAndUp [[-0.876122,0.48209,0],[0,0,1]];
};

private _item763 = objNull;
if (_layerRoot) then {
	_item763 = createVehicle ["Land_vn_b_trench_90_01",[16723.1,13642.4,0.000150681],[],0,"CAN_COLLIDE"];
	_this = _item763;
	_objects pushback _this;
	_objectIDs pushback 763;
	_this setPosWorld [16723.1,13642.4,11.0529];
	_this setVectorDirAndUp [[-0.974567,-0.222972,-0.022433],[-0.0231592,0.000642318,0.999732]];
};

private _item764 = objNull;
if (_layerRoot) then {
	_item764 = createVehicle ["Land_vn_b_trench_45_01",[16714,13642.6,7.62939e-006],[],0,"CAN_COLLIDE"];
	_this = _item764;
	_objects pushback _this;
	_objectIDs pushback 764;
	_this setPosWorld [16714,13642.6,11.7111];
	_this setVectorDirAndUp [[0.200411,-0.978331,-0.0519987],[0.180489,-0.0152982,0.983458]];
};

private _item765 = objNull;
if (_layerRoot) then {
	_item765 = createVehicle ["Land_vn_b_trench_45_01",[16707.6,13635.8,-0.437762],[],0,"CAN_COLLIDE"];
	_this = _item765;
	_objects pushback _this;
	_objectIDs pushback 765;
	_this setPosWorld [16707.6,13635.8,12.6313];
	_this setVectorDirAndUp [[-0.244788,0.967999,0.0552967],[0.0905158,-0.0339676,0.995316]];
};

private _item766 = objNull;
if (_layerRoot) then {
	_item766 = createVehicle ["Land_vn_b_trench_firing_05",[16699.2,13637.3,0.44944],[],0,"CAN_COLLIDE"];
	_this = _item766;
	_objects pushback _this;
	_objectIDs pushback 766;
	_this setPosWorld [16699.2,13637.3,13.9106];
	_this setVectorDirAndUp [[-0.902431,-0.430834,0],[0,0,1]];
};

private _item767 = objNull;
if (_layerRoot) then {
	_item767 = createVehicle ["Land_vn_b_trench_corner_01",[16774,13586.6,0],[],0,"CAN_COLLIDE"];
	_this = _item767;
	_objects pushback _this;
	_objectIDs pushback 767;
	_this setPosWorld [16774,13586.6,9.3702];
	_this setVectorDirAndUp [[-0.990221,-0.139509,0],[0,0,1]];
};

private _item768 = objNull;
if (_layerRoot) then {
	_item768 = createVehicle ["Land_vn_b_trench_corner_01",[16776.2,13597,0],[],0,"CAN_COLLIDE"];
	_this = _item768;
	_objects pushback _this;
	_objectIDs pushback 768;
	_this setPosWorld [16776.2,13597,9.85144];
	_this setVectorDirAndUp [[-0.990221,-0.139509,0],[0,0,1]];
};

private _item769 = objNull;
if (_layerRoot) then {
	_item769 = createVehicle ["Land_vn_b_trench_revetment_tall_03",[16770.6,13588.1,0],[],0,"CAN_COLLIDE"];
	_this = _item769;
	_objects pushback _this;
	_objectIDs pushback 769;
	_this setPosWorld [16770.6,13588.1,9.35938];
	_this setVectorDirAndUp [[0.147372,-0.989081,0],[0,0,1]];
};

private _item770 = objNull;
if (_layerRoot) then {
	_item770 = createVehicle ["Land_vn_b_trench_revetment_tall_03",[16773.8,13594.6,5.62668e-005],[],0,"CAN_COLLIDE"];
	_this = _item770;
	_objects pushback _this;
	_objectIDs pushback 770;
	_this setPosWorld [16773.8,13594.6,9.42052];
	_this setVectorDirAndUp [[-0.185572,0.982631,0],[0,0,1]];
};

private _item771 = objNull;
if (_layerRoot) then {
	_item771 = createVehicle ["Land_vn_b_trench_45_02",[16695,13630.7,0],[],0,"CAN_COLLIDE"];
	_this = _item771;
	_objects pushback _this;
	_objectIDs pushback 771;
	_this setPosWorld [16695,13630.7,12.9412];
	_this setVectorDirAndUp [[0.330927,-0.943654,-0.00222345],[-0.0183481,-0.00879016,0.999793]];
};

private _item772 = objNull;
if (_layerRoot) then {
	_item772 = createVehicle ["Land_vn_b_trench_45_01",[16688.8,13621,-0.324058],[],0,"CAN_COLLIDE"];
	_this = _item772;
	_objects pushback _this;
	_objectIDs pushback 772;
	_this setPosWorld [16688.8,13621,12.6782];
	_this setVectorDirAndUp [[-0.269244,0.961378,0.0570911],[0.0292758,-0.0510826,0.998265]];
};

private _item773 = objNull;
if (_layerRoot) then {
	_item773 = createVehicle ["Land_vn_b_tower_01",[16633.6,13588.4,-0.000106812],[],0,"CAN_COLLIDE"];
	_this = _item773;
	_objects pushback _this;
	_objectIDs pushback 773;
	_this setPosWorld [16633.6,13588.4,13.7039];
	_this setVectorDirAndUp [[-0.654505,0.756057,0.000777859],[0.000527684,-0.00057203,1]];
};

private _item774 = objNull;
if (_layerRoot) then {
	_item774 = createVehicle ["Land_vn_b_tower_01",[16719.6,13636.4,0],[],0,"CAN_COLLIDE"];
	_this = _item774;
	_objects pushback _this;
	_objectIDs pushback 774;
	_this setPosWorld [16719.6,13636.4,14.7546];
	_this setVectorDirAndUp [[0.127989,0.991775,0.000777937],[-7.51838e-005,-0.000774685,1]];
};

private _item775 = objNull;
if (_layerRoot) then {
	_item775 = createVehicle ["Land_vn_b_trench_revetment_05_01",[16683.1,13619.6,8.2016e-005],[],0,"CAN_COLLIDE"];
	_this = _item775;
	_objects pushback _this;
	_objectIDs pushback 775;
	_this setPosWorld [16683.1,13619.6,12.8639];
	_this setVectorDirAndUp [[0.254655,-0.967032,0],[0,0,1]];
};

private _item778 = objNull;
if (_layerRoot) then {
	_item778 = createVehicle ["Land_vn_b_trench_wall_10_03",[16775.8,13533.6,-1.7286],[],0,"CAN_COLLIDE"];
	_this = _item778;
	_objects pushback _this;
	_objectIDs pushback 778;
	_this setPosWorld [16775.8,13533.6,5.18043];
	_this setVectorDirAndUp [[-0.736271,0.676687,0],[0,0,1]];
};

private _item779 = objNull;
if (_layerRoot) then {
	_item779 = createVehicle ["Land_vn_t_phoenixc1s_f",[16653.3,13619.8,0],[],0,"CAN_COLLIDE"];
	_this = _item779;
	_objects pushback _this;
	_objectIDs pushback 779;
	_this setPosWorld [16653.3,13619.8,14.3542];
	_this setVectorDirAndUp [[0,0.9994,0.0346456],[-0.0902964,-0.0345041,0.995317]];
	_this allowdamage false;;
};

private _item780 = objNull;
if (_layerRoot) then {
	_item780 = createVehicle ["Land_vn_t_pritchardia_f",[16650.5,13563.2,7.62939e-005],[],0,"CAN_COLLIDE"];
	_this = _item780;
	_objects pushback _this;
	_objectIDs pushback 780;
	_this setPosWorld [16650.5,13563.2,14.0974];
	_this setVectorDirAndUp [[0,0.9994,0.0346456],[-0.00265204,-0.0346455,0.999396]];
	_this allowdamage false;;
};

private _item781 = objNull;
if (_layerRoot) then {
	_item781 = createVehicle ["Land_vn_t_juglansregia_3s",[16659.9,13504.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item781;
	_objects pushback _this;
	_objectIDs pushback 781;
	_this setPosWorld [16659.9,13504.7,18.094];
	_this setVectorDirAndUp [[0.832812,0.535058,0.141909],[-0.0691671,-0.153767,0.985683]];
	_this allowdamage false;;
};

private _item782 = objNull;
if (_layerRoot) then {
	_item782 = createVehicle ["Land_vn_t_juglansregia_2s",[16751.8,13546.9,0.000244141],[],0,"CAN_COLLIDE"];
	_this = _item782;
	_objects pushback _this;
	_objectIDs pushback 782;
	_this setPosWorld [16751.8,13546.9,16.703];
	_this setVectorDirAndUp [[-0.500095,0.865923,0.00910655],[0.066519,0.0279275,0.997394]];
	_this allowdamage false;;
};

private _item783 = objNull;
if (_layerRoot) then {
	_item783 = createVehicle ["Land_vn_t_ficus_big_f",[16626.2,13530.1,6.58035e-005],[],0,"CAN_COLLIDE"];
	_this = _item783;
	_objects pushback _this;
	_objectIDs pushback 783;
	_this setPosWorld [16626.2,13530.1,27.6132];
	_this setVectorDirAndUp [[0.996544,-0.0136598,-0.0819337],[0.0797443,-0.118765,0.989715]];
	_this allowdamage false;;
};

private _item784 = objNull;
if (_layerRoot) then {
	_item784 = createVehicle ["Land_vn_t_ficus_medium_f",[16722.6,13591.8,0.000353813],[],0,"CAN_COLLIDE"];
	_this = _item784;
	_objects pushback _this;
	_objectIDs pushback 784;
	_this setPosWorld [16722.6,13591.8,22.421];
	_this setVectorDirAndUp [[-0.604717,0.791768,0.0861436],[0.103442,-0.0291648,0.994208]];
	_this allowdamage false;;
};

private _item785 = objNull;
if (_layerRoot) then {
	_item785 = createVehicle ["Land_vn_t_ficusb1s_f",[16647.9,13574.1,7.53403e-005],[],0,"CAN_COLLIDE"];
	_this = _item785;
	_objects pushback _this;
	_objectIDs pushback 785;
	_this setPosWorld [16647.9,13574.1,16.3165];
	_this setVectorDirAndUp [[0,0.999928,0.0119949],[-0.0226603,-0.0119918,0.999671]];
	_this allowdamage false;;
};

private _item786 = objNull;
if (_layerRoot) then {
	_item786 = createVehicle ["Land_vn_t_cyathea_f",[16642.7,13548.1,0],[],0,"CAN_COLLIDE"];
	_this = _item786;
	_objects pushback _this;
	_objectIDs pushback 786;
	_this setPosWorld [16642.7,13548.1,15.1884];
	_this setVectorDirAndUp [[0,0.995549,0.0942449],[-0.0346473,-0.0941883,0.994951]];
	_this allowdamage false;;
};

private _item787 = objNull;
if (_layerRoot) then {
	_item787 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[16646.4,13527.4,0.000218391],[],0,"CAN_COLLIDE"];
	_this = _item787;
	_objects pushback _this;
	_objectIDs pushback 787;
	_this setPosWorld [16646.4,13527.4,21.1607];
	_this setVectorDirAndUp [[0,0.997785,-0.0665191],[-0.0704904,0.0663536,0.995303]];
	_this allowdamage false;;
};

private _item788 = objNull;
if (_layerRoot) then {
	_item788 = createVehicle ["Land_vn_t_cocosnucifera3s_bend_f",[16616.5,13544.7,0],[],0,"CAN_COLLIDE"];
	_this = _item788;
	_objects pushback _this;
	_objectIDs pushback 788;
	_this setPosWorld [16616.5,13544.7,18.3086];
	_this setVectorDirAndUp [[0,0.997322,0.0731376],[-0.0279894,-0.0731089,0.996931]];
	_this allowdamage false;;
};

private _item789 = objNull;
if (_layerRoot) then {
	_item789 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[16631,13560.8,0.0426064],[],0,"CAN_COLLIDE"];
	_this = _item789;
	_objects pushback _this;
	_objectIDs pushback 789;
	_this setPosWorld [16631,13560.8,19.9333];
	_this setVectorDirAndUp [[0,0.998974,0.0452853],[-0.00665923,-0.0452843,0.998952]];
	_this allowdamage false;;
};

private _item790 = objNull;
if (_layerRoot) then {
	_item790 = createVehicle ["Land_vn_t_banana_f",[16634.8,13572.8,8.2016e-005],[],0,"CAN_COLLIDE"];
	_this = _item790;
	_objects pushback _this;
	_objectIDs pushback 790;
	_this setPosWorld [16634.8,13572.8,15.3788];
	_this setVectorDirAndUp [[0,0.999743,0.0226629],[-0.108685,-0.0225287,0.993821]];
	_this allowdamage false;;
};

private _item791 = objNull;
if (_layerRoot) then {
	_item791 = createVehicle ["Land_vn_t_juglansregia_3s",[16754.9,13523.1,0.000380039],[],0,"CAN_COLLIDE"];
	_this = _item791;
	_objects pushback _this;
	_objectIDs pushback 791;
	_this setPosWorld [16754.9,13523.1,15.8528];
	_this setVectorDirAndUp [[-0.880591,-0.466299,0.0844083],[0.143822,-0.0932656,0.985199]];
	_this allowdamage false;;
};

private _item792 = objNull;
if (_layerRoot) then {
	_item792 = createVehicle ["Land_vn_t_juglansregia_2s",[16661.8,13558.8,9.82285e-005],[],0,"CAN_COLLIDE"];
	_this = _item792;
	_objects pushback _this;
	_objectIDs pushback 792;
	_this setPosWorld [16661.8,13558.8,20.4379];
	_this setVectorDirAndUp [[-0.0110007,0.998049,0.0614631],[0.02266,-0.0612022,0.997868]];
	_this allowdamage false;;
};

private _item793 = objNull;
if (_layerRoot) then {
	_item793 = createVehicle ["Land_vn_t_ficus_big_f",[16687.9,13561.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item793;
	_objects pushback _this;
	_objectIDs pushback 793;
	_this setPosWorld [16687.9,13561.7,30.5665];
	_this setVectorDirAndUp [[-0.061435,-0.99322,-0.0986889],[0.0955612,-0.104275,0.989947]];
	_this allowdamage false;;
};

private _item794 = objNull;
if (_layerRoot) then {
	_item794 = createVehicle ["Land_vn_t_ficus_medium_f",[16762.9,13642.7,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item794;
	_objects pushback _this;
	_objectIDs pushback 794;
	_this setPosWorld [16762.9,13642.7,20.2006];
	_this setVectorDirAndUp [[-0.938412,0.344948,-0.019817],[-0.0186628,0.00666701,0.999804]];
	_this allowdamage false;;
};

private _item795 = objNull;
if (_layerRoot) then {
	_item795 = createVehicle ["Land_vn_t_phoenixc1s_f",[16663,13530.9,7.43866e-005],[],0,"CAN_COLLIDE"];
	_this = _item795;
	_objects pushback _this;
	_objectIDs pushback 795;
	_this setPosWorld [16663,13530.9,14.4789];
	_this setVectorDirAndUp [[0.753158,0.655941,-0.0499466],[0.0902964,-0.027875,0.995525]];
	_this allowdamage false;;
};

private _item796 = objNull;
if (_layerRoot) then {
	_item796 = createVehicle ["Land_vn_t_ficusb1s_f",[16649.7,13533.8,8.96454e-005],[],0,"CAN_COLLIDE"];
	_this = _item796;
	_objects pushback _this;
	_objectIDs pushback 796;
	_this setPosWorld [16649.7,13533.8,13.5979];
	_this setVectorDirAndUp [[0.750915,0.653962,0.0919853],[-0.12045,-0.00132714,0.992719]];
	_this allowdamage false;;
};

private _item797 = objNull;
if (_layerRoot) then {
	_item797 = createVehicle ["Land_vn_t_cyathea_f",[16662.8,13544.5,0.000173569],[],0,"CAN_COLLIDE"];
	_this = _item797;
	_objects pushback _this;
	_objectIDs pushback 797;
	_this setPosWorld [16662.8,13544.5,14.8321];
	_this setVectorDirAndUp [[0.755633,0.653268,0.0475375],[0.027987,-0.104712,0.994109]];
	_this allowdamage false;;
};

private _item798 = objNull;
if (_layerRoot) then {
	_item798 = createVehicle ["Land_vn_t_banana_f",[16677.9,13551.1,7.24792e-005],[],0,"CAN_COLLIDE"];
	_this = _item798;
	_objects pushback _this;
	_objectIDs pushback 798;
	_this setPosWorld [16677.9,13551.1,13.9982];
	_this setVectorDirAndUp [[0.754474,0.656282,-0.00794166],[0.0704903,-0.0689949,0.995124]];
	_this allowdamage false;;
};

private _item799 = objNull;
if (_layerRoot) then {
	_item799 = createVehicle ["Land_vn_t_phoenixc1s_f",[16750.6,13563.9,1.23978e-005],[],0,"CAN_COLLIDE"];
	_this = _item799;
	_objects pushback _this;
	_objectIDs pushback 799;
	_this setPosWorld [16750.6,13563.9,12.979];
	_this setVectorDirAndUp [[0,0.9998,0.0199947],[0.0545853,-0.0199648,0.998309]];
	_this allowdamage false;;
};

private _item800 = objNull;
if (_layerRoot) then {
	_item800 = createVehicle ["Land_vn_t_pritchardia_f",[16757.8,13569.1,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item800;
	_objects pushback _this;
	_objectIDs pushback 800;
	_this setPosWorld [16757.8,13569.1,9.2237];
	_this setVectorDirAndUp [[0,0.992237,0.12436],[0.109995,-0.123606,0.986216]];
	_this allowdamage false;;
};

private _item801 = objNull;
if (_layerRoot) then {
	_item801 = createVehicle ["Land_vn_t_ficusb1s_f",[16729.5,13521.7,0],[],0,"CAN_COLLIDE"];
	_this = _item801;
	_objects pushback _this;
	_objectIDs pushback 801;
	_this setPosWorld [16729.5,13521.7,12.4573];
	_this setVectorDirAndUp [[0,0.979563,0.201137],[0.0545853,-0.200837,0.978103]];
	_this allowdamage false;;
};

private _item802 = objNull;
if (_layerRoot) then {
	_item802 = createVehicle ["Land_vn_t_cyathea_f",[16707.1,13602.4,5.34058e-005],[],0,"CAN_COLLIDE"];
	_this = _item802;
	_objects pushback _this;
	_objectIDs pushback 802;
	_this setPosWorld [16707.1,13602.4,16.485];
	_this setVectorDirAndUp [[0,0.9998,0.0199975],[0.0412993,-0.0199805,0.998947]];
	_this allowdamage false;;
};

private _item803 = objNull;
if (_layerRoot) then {
	_item803 = createVehicle ["Land_vn_t_banana_f",[16730.8,13578.4,0],[],0,"CAN_COLLIDE"];
	_this = _item803;
	_objects pushback _this;
	_objectIDs pushback 803;
	_this setPosWorld [16730.8,13578.4,12.6633];
	_this setVectorDirAndUp [[0,0.999488,0.031983],[0.0466162,-0.0319482,0.998402]];
	_this allowdamage false;;
};

private _item804 = objNull;
if (_layerRoot) then {
	_item804 = createVehicle ["Land_vn_t_phoenixc1s_f",[16686.5,13632.6,0],[],0,"CAN_COLLIDE"];
	_this = _item804;
	_objects pushback _this;
	_objectIDs pushback 804;
	_this setPosWorld [16686.5,13632.6,16.1021];
	_this setVectorDirAndUp [[0.647656,0.760951,0.0386657],[-0.0704904,0.00931166,0.997469]];
	_this allowdamage false;;
};

private _item805 = objNull;
if (_layerRoot) then {
	_item805 = createVehicle ["Land_vn_t_phoenixc1s_f",[16669.5,13645.6,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item805;
	_objects pushback _this;
	_objectIDs pushback 805;
	_this setPosWorld [16669.5,13645.6,14.6026];
	_this setVectorDirAndUp [[0.999302,-0.0144169,0.0344569],[-0.033315,0.0730964,0.996768]];
	_this allowdamage false;;
};

private _item806 = objNull;
if (_layerRoot) then {
	_item806 = createVehicle ["Land_vn_t_phoenixc1s_f",[16652.8,13596.3,0.000145912],[],0,"CAN_COLLIDE"];
	_this = _item806;
	_objects pushback _this;
	_objectIDs pushback 806;
	_this setPosWorld [16652.8,13596.3,15.2518];
	_this setVectorDirAndUp [[0,0.987441,-0.15799],[-0.139943,0.156436,0.977724]];
	_this allowdamage false;;
};

private _item807 = objNull;
if (_layerRoot) then {
	_item807 = createVehicle ["Land_vn_t_phoenixc1s_f",[16611.5,13593.9,0],[],0,"CAN_COLLIDE"];
	_this = _item807;
	_objects pushback _this;
	_objectIDs pushback 807;
	_this setPosWorld [16611.5,13593.9,13.2297];
	_this setVectorDirAndUp [[0.642127,-0.746919,0.172583],[-0.203642,0.0508418,0.977724]];
	_this allowdamage false;;
};

private _item808 = objNull;
if (_layerRoot) then {
	_item808 = createVehicle ["Land_vn_t_phoenixc1s_f",[16591.5,13574.5,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item808;
	_objects pushback _this;
	_objectIDs pushback 808;
	_this setPosWorld [16591.5,13574.5,12.0678];
	_this setVectorDirAndUp [[0.993637,-0.10253,0.0466083],[-0.0439577,0.0279624,0.998642]];
	_this allowdamage false;;
};

private _item809 = objNull;
if (_layerRoot) then {
	_item809 = createVehicle ["Land_vn_t_phoenixc1s_f",[16624.2,13503.8,9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item809;
	_objects pushback _this;
	_objectIDs pushback 809;
	_this setPosWorld [16624.2,13503.8,12.0697];
	_this setVectorDirAndUp [[-0.424905,0.902014,0.0763385],[0.00133688,-0.0837044,0.99649]];
	_this allowdamage false;;
};

private _item810 = objNull;
if (_layerRoot) then {
	_item810 = createVehicle ["Land_vn_t_cyathea_f",[16607.4,13548.3,0.000173569],[],0,"CAN_COLLIDE"];
	_this = _item810;
	_objects pushback _this;
	_objectIDs pushback 810;
	_this setPosWorld [16607.4,13548.3,13.4342];
	_this setVectorDirAndUp [[-0.533317,-0.844442,-0.0499002],[-0.0638688,-0.0186245,0.997784]];
	_this allowdamage false;;
};

private _item811 = objNull;
if (_layerRoot) then {
	_item811 = createVehicle ["Land_vn_t_cyathea_f",[16601.1,13588.6,0.000172615],[],0,"CAN_COLLIDE"];
	_this = _item811;
	_objects pushback _this;
	_objectIDs pushback 811;
	_this setPosWorld [16601.1,13588.6,11.3827];
	_this setVectorDirAndUp [[0.0710812,0.997248,0.0210612],[-0.145114,-0.0105512,0.989359]];
	_this allowdamage false;;
};

private _item812 = objNull;
if (_layerRoot) then {
	_item812 = createVehicle ["Land_vn_t_cyathea_f",[16588.2,13607.9,4.76837e-007],[],0,"CAN_COLLIDE"];
	_this = _item812;
	_objects pushback _this;
	_objectIDs pushback 812;
	_this setPosWorld [16588.2,13607.9,9.45992];
	_this setVectorDirAndUp [[-0.661286,0.749097,-0.0394376],[-0.0173316,0.0373023,0.999154]];
	_this allowdamage false;;
};

private _item813 = objNull;
if (_layerRoot) then {
	_item813 = createVehicle ["Land_vn_t_cyathea_f",[16745.2,13673.3,0.000173569],[],0,"CAN_COLLIDE"];
	_this = _item813;
	_objects pushback _this;
	_objectIDs pushback 813;
	_this setPosWorld [16745.2,13673.3,11.7563];
	_this setVectorDirAndUp [[0.994116,-0.104993,-0.0266487],[0.0293202,0.0239834,0.999282]];
	_this allowdamage false;;
};

private _item814 = objNull;
if (_layerRoot) then {
	_item814 = createVehicle ["Land_vn_t_cyathea_f",[16714.5,13662,0.000173569],[],0,"CAN_COLLIDE"];
	_this = _item814;
	_objects pushback _this;
	_objectIDs pushback 814;
	_this setPosWorld [16714.5,13662,12.4623];
	_this setVectorDirAndUp [[0.120762,0.989652,-0.0774928],[0.0731366,0.0689819,0.994933]];
	_this allowdamage false;;
};

private _item815 = objNull;
if (_layerRoot) then {
	_item815 = createVehicle ["Land_vn_t_cyathea_f",[16681.1,13484,0.000173569],[],0,"CAN_COLLIDE"];
	_this = _item815;
	_objects pushback _this;
	_objectIDs pushback 815;
	_this setPosWorld [16681.1,13484,11.8499];
	_this setVectorDirAndUp [[0.755928,0.651967,0.0592567],[-0.00133721,-0.088978,0.996033]];
	_this allowdamage false;;
};

private _item816 = objNull;
if (_layerRoot) then {
	_item816 = createVehicle ["Land_vn_t_ficus_medium_f",[16658.1,13460.2,0.000354767],[],0,"CAN_COLLIDE"];
	_this = _item816;
	_objects pushback _this;
	_objectIDs pushback 816;
	_this setPosWorld [16658.1,13460.2,17.5988];
	_this setVectorDirAndUp [[-0.392355,-0.913322,-0.109088],[0.00129158,-0.119145,0.992876]];
	_this allowdamage false;;
};

private _item817 = objNull;
if (_layerRoot) then {
	_item817 = createVehicle ["Land_vn_t_ficus_medium_f",[16599.5,13618.8,0.000355721],[],0,"CAN_COLLIDE"];
	_this = _item817;
	_objects pushback _this;
	_objectIDs pushback 817;
	_this setPosWorld [16599.5,13618.8,16.4368];
	_this setVectorDirAndUp [[-0.95869,0.283638,0.0215391],[0.0346456,0.0412731,0.998547]];
	_this allowdamage false;;
};

private _item818 = objNull;
if (_layerRoot) then {
	_item818 = createVehicle ["Land_vn_t_ficus_medium_f",[16629.5,13626.7,-9.53674e-007],[],0,"CAN_COLLIDE"];
	_this = _item818;
	_objects pushback _this;
	_objectIDs pushback 818;
	_this setPosWorld [16629.5,13626.7,18.8908];
	_this setVectorDirAndUp [[-0.863344,-0.484882,-0.139737],[-0.186028,0.0484136,0.981351]];
	_this allowdamage false;;
};

private _item819 = objNull;
if (_layerRoot) then {
	_item819 = createVehicle ["Land_vn_t_ficus_medium_f",[16720.8,13674.3,0.000354767],[],0,"CAN_COLLIDE"];
	_this = _item819;
	_objects pushback _this;
	_objectIDs pushback 819;
	_this setPosWorld [16720.8,13674.3,19.4742];
	_this setVectorDirAndUp [[-0.917509,-0.39642,0.0320601],[0.0026744,0.0744593,0.99722]];
	_this allowdamage false;;
};

private _item820 = objNull;
if (_layerRoot) then {
	_item820 = createVehicle ["Land_vn_t_ficus_medium_f",[16827,13570.8,-2.38419e-007],[],0,"CAN_COLLIDE"];
	_this = _item820;
	_objects pushback _this;
	_objectIDs pushback 820;
	_this setPosWorld [16827,13570.8,13.2418];
	_this setVectorDirAndUp [[-0.607391,0.782758,0.135524],[0.0439577,-0.13722,0.989565]];
	_this allowdamage false;;
};

private _item821 = objNull;
if (_layerRoot) then {
	_item821 = createVehicle ["vn_o_pl_static_d44_01",[7349.97,17831.1,0],[],0,"CAN_COLLIDE"];
	_this = _item821;
	_objects pushback _this;
	_objectIDs pushback 821;
	_this setPosWorld [7349.98,17831.1,166.976];
	_this setVectorDirAndUp [[0.998904,0.023371,0.0405626],[-0.0412993,0.0319538,0.998636]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item822 = objNull;
if (_layerRoot) then {
	_item822 = createVehicle ["vn_o_nva_navy_static_v11m",[7324.48,17903,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item822;
	_objects pushback _this;
	_objectIDs pushback 822;
	_this setPosWorld [7324.46,17903,168.137];
	_this setVectorDirAndUp [[-0.306048,-0.951185,-0.0397857],[-0.0346473,-0.0306349,0.99893]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item823 = objNull;
if (_layerRoot) then {
	_item823 = createVehicle ["vn_o_pl_static_d44_01",[7317.04,17820.3,0],[],0,"CAN_COLLIDE"];
	_this = _item823;
	_objects pushback _this;
	_objectIDs pushback 823;
	_this setPosWorld [7317.06,17820.3,166.531];
	_this setVectorDirAndUp [[-0.0337953,0.999383,-0.00958079],[-0.046615,0.00799964,0.998881]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item824 = objNull;
if (_layerRoot) then {
	_item824 = createVehicle ["vn_o_nva_navy_static_v11m",[7364.6,17865.4,0],[],0,"CAN_COLLIDE"];
	_this = _item824;
	_objects pushback _this;
	_objectIDs pushback 824;
	_this setPosWorld [7364.59,17865.4,169.693];
	_this setVectorDirAndUp [[0.778701,0.625787,0.0448862],[-0.0479435,-0.0119812,0.998778]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item826 = objNull;
if (_layerRoot) then {
	_item826 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7367.41,17863.1,0],[],0,"CAN_COLLIDE"];
	_this = _item826;
	_objects pushback _this;
	_objectIDs pushback 826;
	_this setPosWorld [7367.41,17863.1,168.667];
	_this setVectorDirAndUp [[-0.799422,0.600769,0.000443535],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item827 = objNull;
if (_layerRoot) then {
	_item827 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7368.68,17866.3,0],[],0,"CAN_COLLIDE"];
	_this = _item827;
	_objects pushback _this;
	_objectIDs pushback 827;
	_this setPosWorld [7368.68,17866.3,168.755];
	_this setVectorDirAndUp [[-0.997219,0.0745226,1.7665e-005],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item828 = objNull;
if (_layerRoot) then {
	_item828 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7364.44,17861,0],[],0,"CAN_COLLIDE"];
	_this = _item828;
	_objects pushback _this;
	_objectIDs pushback 828;
	_this setPosWorld [7364.44,17861,168.504];
	_this setVectorDirAndUp [[-0.318843,0.947807,0.000738943],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item829 = objNull;
if (_layerRoot) then {
	_item829 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7364.43,17869.8,0],[],0,"CAN_COLLIDE"];
	_this = _item829;
	_objects pushback _this;
	_objectIDs pushback 829;
	_this setPosWorld [7364.43,17869.8,168.559];
	_this setVectorDirAndUp [[0.341994,-0.939702,-0.000731547],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item830 = objNull;
if (_layerRoot) then {
	_item830 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7361.54,17867.6,0],[],0,"CAN_COLLIDE"];
	_this = _item830;
	_objects pushback _this;
	_objectIDs pushback 830;
	_this setPosWorld [7361.54,17867.6,168.398];
	_this setVectorDirAndUp [[0.813949,-0.580936,-0.000427191],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item831 = objNull;
if (_layerRoot) then {
	_item831 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7360.34,17864.4,0],[],0,"CAN_COLLIDE"];
	_this = _item831;
	_objects pushback _this;
	_objectIDs pushback 831;
	_this setPosWorld [7360.34,17864.4,168.324];
	_this setVectorDirAndUp [[0.998751,-0.049955,1.89621e-006],[-4.15937e-005,-0.000793626,1]];
	_this allowdamage false;;
};

private _item832 = objNull;
if (_layerRoot) then {
	_item832 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7325.52,17905.5,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item832;
	_objects pushback _this;
	_objectIDs pushback 832;
	_this setPosWorld [7325.52,17905.5,167.076];
	_this setVectorDirAndUp [[-0.288005,-0.957629,0.00017827],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item833 = objNull;
if (_layerRoot) then {
	_item833 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7322.07,17905.6,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item833;
	_objects pushback _this;
	_objectIDs pushback 833;
	_this setPosWorld [7322.07,17905.6,166.956];
	_this setVectorDirAndUp [[0.27415,-0.961687,-0.000267622],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item834 = objNull;
if (_layerRoot) then {
	_item834 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7328.46,17903.5,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item834;
	_objects pushback _this;
	_objectIDs pushback 834;
	_this setPosWorld [7328.46,17903.5,167.12];
	_this setVectorDirAndUp [[-0.779592,-0.626287,0.000585324],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item835 = objNull;
if (_layerRoot) then {
	_item835 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7320.25,17900.4,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item835;
	_objects pushback _this;
	_objectIDs pushback 835;
	_this setPosWorld [7320.25,17900.4,166.753];
	_this setVectorDirAndUp [[0.76398,0.64524,-0.000571956],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item836 = objNull;
if (_layerRoot) then {
	_item836 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7323.24,17898.4,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item836;
	_objects pushback _this;
	_objectIDs pushback 836;
	_this setPosWorld [7323.24,17898.4,166.814];
	_this setVectorDirAndUp [[0.264354,0.964426,-0.000159164],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item837 = objNull;
if (_layerRoot) then {
	_item837 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7326.7,17898.4,6.10352e-005],[],0,"CAN_COLLIDE"];
	_this = _item837;
	_objects pushback _this;
	_objectIDs pushback 837;
	_this setPosWorld [7326.7,17898.4,166.934];
	_this setVectorDirAndUp [[-0.297731,0.95465,0.000285949],[0.000792805,-5.22772e-005,1]];
	_this allowdamage false;;
};

private _item838 = objNull;
if (_layerRoot) then {
	_item838 = createVehicle ["Land_BagFence_Long_F",[7345.35,17825.9,0],[],0,"CAN_COLLIDE"];
	_this = _item838;
	_objects pushback _this;
	_objectIDs pushback 838;
	_this setPosWorld [7345.35,17825.9,167.365];
	_this setVectorDirAndUp [[0.640395,0.767986,0.00957736],[-0.0373079,0.0186498,0.99913]];
	_this allowdamage false;;
};

private _item839 = objNull;
if (_layerRoot) then {
	_item839 = createVehicle ["Land_BagFence_Long_F",[7343.16,17830.5,0],[],0,"CAN_COLLIDE"];
	_this = _item839;
	_objects pushback _this;
	_objectIDs pushback 839;
	_this setPosWorld [7343.16,17830.5,167.145];
	_this setVectorDirAndUp [[0.995024,0.0937309,0.0337977],[-0.0373079,0.0359532,0.998657]];
	_this allowdamage false;;
};

private _item840 = objNull;
if (_layerRoot) then {
	_item840 = createVehicle ["Land_BagFence_Long_F",[7344.91,17836,0],[],0,"CAN_COLLIDE"];
	_this = _item840;
	_objects pushback _this;
	_objectIDs pushback 840;
	_this setPosWorld [7344.91,17836,167.058];
	_this setVectorDirAndUp [[0.762601,-0.646058,0.0323857],[-0.0412993,0.00133607,0.999146]];
	_this allowdamage false;;
};

private _item841 = objNull;
if (_layerRoot) then {
	_item841 = createVehicle ["Land_BagFence_Long_F",[7349.26,17838,0],[],0,"CAN_COLLIDE"];
	_this = _item841;
	_objects pushback _this;
	_objectIDs pushback 841;
	_this setPosWorld [7349.26,17838,167.238];
	_this setVectorDirAndUp [[0.160109,-0.987076,0.00683152],[-0.042629,0,0.999091]];
	_this allowdamage false;;
};

private _item842 = objNull;
if (_layerRoot) then {
	_item842 = createVehicle ["Land_BagFence_Long_F",[7353.78,17836.9,0],[],0,"CAN_COLLIDE"];
	_this = _item842;
	_objects pushback _this;
	_objectIDs pushback 842;
	_this setPosWorld [7353.78,17836.9,167.592];
	_this setVectorDirAndUp [[-0.638807,-0.767433,-0.0545114],[-0.0850241,0,0.996379]];
	_this allowdamage false;;
};

private _item843 = objNull;
if (_layerRoot) then {
	_item843 = createVehicle ["Land_BagFence_Long_F",[7356.92,17831.6,0],[],0,"CAN_COLLIDE"];
	_this = _item843;
	_objects pushback _this;
	_objectIDs pushback 843;
	_this setPosWorld [7356.92,17831.6,167.919];
	_this setVectorDirAndUp [[-0.994577,0.0586323,-0.0858992],[-0.0850241,0.0172654,0.996229]];
	_this allowdamage false;;
};

private _item844 = objNull;
if (_layerRoot) then {
	_item844 = createVehicle ["Land_BagFence_Long_F",[7354.84,17826.8,0],[],0,"CAN_COLLIDE"];
	_this = _item844;
	_objects pushback _this;
	_objectIDs pushback 844;
	_this setPosWorld [7354.84,17826.8,167.856];
	_this setVectorDirAndUp [[-0.71544,0.69649,-0.055203],[-0.0704904,0.00665159,0.99749]];
	_this allowdamage false;;
};

private _item845 = objNull;
if (_layerRoot) then {
	_item845 = createVehicle ["Land_BagFence_Long_F",[7349.77,17824.3,0],[],0,"CAN_COLLIDE"];
	_this = _item845;
	_objects pushback _this;
	_objectIDs pushback 845;
	_this setPosWorld [7349.77,17824.3,167.56];
	_this setVectorDirAndUp [[-0.0327137,0.999267,-0.0198739],[-0.0373079,0.0186498,0.99913]];
	_this allowdamage false;;
};

private _item846 = objNull;
if (_layerRoot) then {
	_item846 = createVehicle ["Land_BagFence_Long_F",[7312.64,17814.8,0],[],0,"CAN_COLLIDE"];
	_this = _item846;
	_objects pushback _this;
	_objectIDs pushback 846;
	_this setPosWorld [7312.64,17814.8,166.759];
	_this setVectorDirAndUp [[0.640433,0.76754,0.0269795],[-0.0452855,0.00267168,0.998971]];
	_this allowdamage false;;
};

private _item847 = objNull;
if (_layerRoot) then {
	_item847 = createVehicle ["Land_BagFence_Long_F",[7310.46,17819.4,0],[],0,"CAN_COLLIDE"];
	_this = _item847;
	_objects pushback _this;
	_objectIDs pushback 847;
	_this setPosWorld [7310.46,17819.4,166.667];
	_this setVectorDirAndUp [[0.995068,0.0925908,0.0355769],[-0.0359766,0.00265033,0.999349]];
	_this allowdamage false;;
};

private _item848 = objNull;
if (_layerRoot) then {
	_item848 = createVehicle ["Land_BagFence_Long_F",[7312.2,17825,0],[],0,"CAN_COLLIDE"];
	_this = _item848;
	_objects pushback _this;
	_objectIDs pushback 848;
	_this setPosWorld [7312.2,17825,166.69];
	_this setVectorDirAndUp [[0.762687,-0.646092,0.0295743],[-0.0319811,0.00799681,0.999456]];
	_this allowdamage false;;
};

private _item849 = objNull;
if (_layerRoot) then {
	_item849 = createVehicle ["Land_BagFence_Long_F",[7316.56,17826.9,0],[],0,"CAN_COLLIDE"];
	_this = _item849;
	_objects pushback _this;
	_objectIDs pushback 849;
	_this setPosWorld [7316.56,17826.9,166.851];
	_this setVectorDirAndUp [[0.160359,-0.986838,0.0208877],[-0.039967,0.0146526,0.999094]];
	_this allowdamage false;;
};

private _item850 = objNull;
if (_layerRoot) then {
	_item850 = createVehicle ["Land_BagFence_Long_F",[7321.06,17825.8,0],[],0,"CAN_COLLIDE"];
	_this = _item850;
	_objects pushback _this;
	_objectIDs pushback 850;
	_this setPosWorld [7321.06,17825.8,167.016];
	_this setVectorDirAndUp [[-0.640909,-0.767604,0.00442178],[-0.0106641,0.0146635,0.999836]];
	_this allowdamage false;;
};

private _item851 = objNull;
if (_layerRoot) then {
	_item851 = createVehicle ["Land_BagFence_Long_F",[7324.21,17820.5,0],[],0,"CAN_COLLIDE"];
	_this = _item851;
	_objects pushback _this;
	_objectIDs pushback 851;
	_this setPosWorld [7324.21,17820.5,167.127];
	_this setVectorDirAndUp [[-0.997855,-0.064736,-0.00969354],[-0.0106641,0.0146635,0.999836]];
	_this allowdamage false;;
};

private _item852 = objNull;
if (_layerRoot) then {
	_item852 = createVehicle ["Land_BagFence_Long_F",[7322.08,17815,0],[],0,"CAN_COLLIDE"];
	_this = _item852;
	_objects pushback _this;
	_objectIDs pushback 852;
	_this setPosWorld [7322.08,17815,167.118];
	_this setVectorDirAndUp [[-0.816521,0.577238,-0.00947983],[-0.0106641,0.00133714,0.999942]];
	_this allowdamage false;;
};

private _item853 = objNull;
if (_layerRoot) then {
	_item853 = createVehicle ["Land_BagFence_Long_F",[7317.05,17813.2,0],[],0,"CAN_COLLIDE"];
	_this = _item853;
	_objects pushback _this;
	_objectIDs pushback 853;
	_this setPosWorld [7317.05,17813.2,166.964];
	_this setVectorDirAndUp [[-0.0316517,0.999491,-0.00410791],[-0.0452855,0.00267168,0.998971]];
	_this allowdamage false;;
};

private _item874 = objNull;
if (_layerRoot) then {
	_item874 = createVehicle ["vn_b_navy_static_l60mk3",[7327.32,17856.5,0],[],0,"CAN_COLLIDE"];
	_this = _item874;
	_objects pushback _this;
	_objectIDs pushback 874;
	_this setPosWorld [7327.25,17856.5,167.908];
	_this setVectorDirAndUp [[-0.551899,-0.833754,-0.0162113],[-0.0253251,-0.00267357,0.999676]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item875 = objNull;
if (_layerRoot) then {
	_item875 = createVehicle ["vn_b_navy_static_l60mk3",[7327.71,17865.1,0],[],0,"CAN_COLLIDE"];
	_this = _item875;
	_objects pushback _this;
	_objectIDs pushback 875;
	_this setPosWorld [7327.64,17865.2,167.983];
	_this setVectorDirAndUp [[0.902091,-0.429882,0.0378611],[-0.0412979,0.00133607,0.999146]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item876 = objNull;
if (_layerRoot) then {
	_item876 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7315.43,17857.5,0],[],0,"CAN_COLLIDE"];
	_this = _item876;
	_objects pushback _this;
	_objectIDs pushback 876;
	_this setPosWorld [7315.43,17857.5,165.62];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item877 = objNull;
if (_layerRoot) then {
	_item877 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7315.23,17866,0],[],0,"CAN_COLLIDE"];
	_this = _item877;
	_objects pushback _this;
	_objectIDs pushback 877;
	_this setPosWorld [7315.23,17866,165.617];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item878 = objNull;
if (_layerRoot) then {
	_item878 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7337.87,17857.8,0],[],0,"CAN_COLLIDE"];
	_this = _item878;
	_objects pushback _this;
	_objectIDs pushback 878;
	_this setPosWorld [7337.87,17857.8,166.199];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item879 = objNull;
if (_layerRoot) then {
	_item879 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7337.65,17866.3,0],[],0,"CAN_COLLIDE"];
	_this = _item879;
	_objects pushback _this;
	_objectIDs pushback 879;
	_this setPosWorld [7337.65,17866.3,166.294];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item880 = objNull;
if (_layerRoot) then {
	_item880 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7330.6,17871.9,0],[],0,"CAN_COLLIDE"];
	_this = _item880;
	_objects pushback _this;
	_objectIDs pushback 880;
	_this setPosWorld [7330.6,17871.9,165.989];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item881 = objNull;
if (_layerRoot) then {
	_item881 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7322.01,17871.6,0],[],0,"CAN_COLLIDE"];
	_this = _item881;
	_objects pushback _this;
	_objectIDs pushback 881;
	_this setPosWorld [7322.01,17871.6,165.671];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item882 = objNull;
if (_layerRoot) then {
	_item882 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7331.15,17861.4,0],[],0,"CAN_COLLIDE"];
	_this = _item882;
	_objects pushback _this;
	_objectIDs pushback 882;
	_this setPosWorld [7331.15,17861.4,165.963];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item883 = objNull;
if (_layerRoot) then {
	_item883 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7322.56,17861.1,0],[],0,"CAN_COLLIDE"];
	_this = _item883;
	_objects pushback _this;
	_objectIDs pushback 883;
	_this setPosWorld [7322.56,17861.1,165.685];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item884 = objNull;
if (_layerRoot) then {
	_item884 = createVehicle ["vn_o_pl_static_zpu4",[7343.31,17882.5,0],[],0,"CAN_COLLIDE"];
	_this = _item884;
	_objects pushback _this;
	_objectIDs pushback 884;
	_this setPosWorld [7343.24,17882.5,168.591];
	_this setVectorDirAndUp [[0.592306,0.804752,0.0393257],[-0.0572388,-0.00665724,0.998338]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item885 = objNull;
if (_layerRoot) then {
	_item885 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7342.43,17886.7,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item885;
	_objects pushback _this;
	_objectIDs pushback 885;
	_this setPosWorld [7342.43,17886.7,167.619];
	_this setVectorDirAndUp [[-0.0251303,-0.999684,0],[0,0,1]];
	_this allowdamage false;;
};

private _item886 = objNull;
if (_layerRoot) then {
	_item886 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7347.9,17882.7,0],[],0,"CAN_COLLIDE"];
	_this = _item886;
	_objects pushback _this;
	_objectIDs pushback 886;
	_this setPosWorld [7347.9,17882.7,167.912];
	_this setVectorDirAndUp [[-0.930885,-0.365312,0],[0,0,1]];
	_this allowdamage false;;
};

private _item887 = objNull;
if (_layerRoot) then {
	_item887 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7339.13,17882.3,0],[],0,"CAN_COLLIDE"];
	_this = _item887;
	_objects pushback _this;
	_objectIDs pushback 887;
	_this setPosWorld [7339.13,17882.3,167.399];
	_this setVectorDirAndUp [[0.921626,0.38808,0],[0,0,1]];
	_this allowdamage false;;
};

private _item888 = objNull;
if (_layerRoot) then {
	_item888 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7341.4,17879.5,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item888;
	_objects pushback _this;
	_objectIDs pushback 888;
	_this setPosWorld [7341.4,17879.5,167.517];
	_this setVectorDirAndUp [[0.539971,0.841684,0],[0,0,1]];
	_this allowdamage false;;
};

private _item889 = objNull;
if (_layerRoot) then {
	_item889 = createVehicle ["Land_vn_sandbagbarricade_01_half_f",[7344.68,17878.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item889;
	_objects pushback _this;
	_objectIDs pushback 889;
	_this setPosWorld [7344.68,17878.4,167.681];
	_this setVectorDirAndUp [[0.000549942,1,0],[0,0,1]];
	_this allowdamage false;;
};

private _item890 = objNull;
if (_layerRoot) then {
	_item890 = createVehicle ["vn_flag_pavn",[7345.62,17853.7,0],[],0,"CAN_COLLIDE"];
	_this = _item890;
	_objects pushback _this;
	_objectIDs pushback 890;
	_this setPosWorld [7345.62,17853.7,170.733];
	_this setVectorDirAndUp [[-0.0399263,-0.999203,0],[0,0,1]];
	_this enableSimulation false;
	if !(is3DEN) then {_this hideobjectglobal true;};;
	_this allowdamage false;;
};

private _item891 = objNull;
if (_layerRoot) then {
	_item891 = createVehicle ["vn_o_kr_static_zgu1_01",[7376.75,17927.1,0],[],0,"CAN_COLLIDE"];
	_this = _item891;
	_objects pushback _this;
	_objectIDs pushback 891;
	_this setPosWorld [7376.68,17927.1,170.251];
	_this setVectorDirAndUp [[0.0611919,-0.997656,0.0306283],[-0.0439577,0.0279624,0.998642]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item892 = objNull;
if (_layerRoot) then {
	_item892 = createVehicle ["Land_BagFence_Round_F",[7374.26,17929.3,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item892;
	_objects pushback _this;
	_objectIDs pushback 892;
	_this setPosWorld [7374.26,17929.3,169.015];
	_this setVectorDirAndUp [[0.756543,-0.651908,0.0515549],[-0.0439577,0.0279624,0.998642]];
	_this allowdamage false;;
};

private _item893 = objNull;
if (_layerRoot) then {
	_item893 = createVehicle ["Land_BagFence_Round_F",[7379.02,17929.6,0],[],0,"CAN_COLLIDE"];
	_this = _item893;
	_objects pushback _this;
	_objectIDs pushback 893;
	_this setPosWorld [7379.02,17929.6,169.222];
	_this setVectorDirAndUp [[-0.675355,-0.737411,-0.0109637],[-0.0452881,0.0266297,0.998619]];
	_this allowdamage false;;
};

private _item894 = objNull;
if (_layerRoot) then {
	_item894 = createVehicle ["Land_BagFence_Round_F",[7379.51,17924.6,0],[],0,"CAN_COLLIDE"];
	_this = _item894;
	_objects pushback _this;
	_objectIDs pushback 894;
	_this setPosWorld [7379.51,17924.6,169.381];
	_this setVectorDirAndUp [[-0.809818,0.58423,-0.0535671],[-0.0439591,0.0306237,0.998564]];
	_this allowdamage false;;
};

private _item895 = objNull;
if (_layerRoot) then {
	_item895 = createVehicle ["Land_BagFence_Round_F",[7374.56,17924.1,0],[],0,"CAN_COLLIDE"];
	_this = _item895;
	_objects pushback _this;
	_objectIDs pushback 895;
	_this setPosWorld [7374.56,17924.1,169.179];
	_this setVectorDirAndUp [[0.547703,0.836671,-0.00154764],[-0.0439591,0.0306237,0.998564]];
	_this allowdamage false;;
};

private _item896 = objNull;
if (_layerRoot) then {
	_item896 = createVehicle ["vn_b_sf_static_m45",[7340.37,17917.8,0],[],0,"CAN_COLLIDE"];
	_this = _item896;
	_objects pushback _this;
	_objectIDs pushback 896;
	_this setPosWorld [7340.36,17917.8,169.245];
	_this setVectorDirAndUp [[0.944959,0.324277,0.0435585],[-0.0506016,0.0133146,0.99863]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item897 = objNull;
if (_layerRoot) then {
	_item897 = createVehicle ["Land_BagFence_Round_F",[7341.9,17915.1,0],[],0,"CAN_COLLIDE"];
	_this = _item897;
	_objects pushback _this;
	_objectIDs pushback 897;
	_this setPosWorld [7341.9,17915.1,167.79];
	_this setVectorDirAndUp [[-0.273223,0.961931,-0.00614748],[-0.0506028,-0.00799065,0.998687]];
	_this allowdamage false;;
};

private _item898 = objNull;
if (_layerRoot) then {
	_item898 = createVehicle ["Land_BagFence_Round_F",[7338.27,17917.2,0],[],0,"CAN_COLLIDE"];
	_this = _item898;
	_objects pushback _this;
	_objectIDs pushback 898;
	_this setPosWorld [7338.27,17917.2,167.622];
	_this setVectorDirAndUp [[0.922127,0.383669,0.0497934],[-0.0506028,-0.00799065,0.998687]];
	_this allowdamage false;;
};

private _item899 = objNull;
if (_layerRoot) then {
	_item899 = createVehicle ["Land_BagFence_Round_F",[7340.02,17921.3,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item899;
	_objects pushback _this;
	_objectIDs pushback 899;
	_this setPosWorld [7340.02,17921.3,167.656];
	_this setVectorDirAndUp [[0.355123,-0.934218,0.0335398],[-0.0452868,0.0186436,0.9988]];
	_this allowdamage false;;
};

private _item901 = objNull;
if (_layerRoot) then {
	_item901 = createVehicle ["Land_vn_b_trench_bunker_04_01",[7295.43,17925,0],[],0,"CAN_COLLIDE"];
	_this = _item901;
	_objects pushback _this;
	_objectIDs pushback 901;
	_this setPosWorld [7295.43,17925,166.794];
	_this setVectorDirAndUp [[-0.721952,-0.691943,0],[0,0,1]];
};

private _item903 = objNull;
if (_layerRoot) then {
	_item903 = createVehicle ["Land_vn_b_trench_45_02",[7298.27,17916.4,0],[],0,"CAN_COLLIDE"];
	_this = _item903;
	_objects pushback _this;
	_objectIDs pushback 903;
	_this setPosWorld [7298.27,17916.4,165.24];
	_this setVectorDirAndUp [[0.937604,0.347704,-5.91017e-006],[-0.0194803,0.0525469,0.998428]];
};

private _item904 = objNull;
if (_layerRoot) then {
	_item904 = createVehicle ["Land_vn_b_trench_45_01",[7302.68,17901,0],[],0,"CAN_COLLIDE"];
	_this = _item904;
	_objects pushback _this;
	_objectIDs pushback 904;
	_this setPosWorld [7302.68,17901,165.442];
	_this setVectorDirAndUp [[-0.25591,0.964935,0.0583991],[4.32173e-005,-0.0603993,0.998174]];
};

private _item905 = objNull;
if (_layerRoot) then {
	_item905 = createVehicle ["Land_vn_b_trench_90_02",[7294.72,17895.8,0],[],0,"CAN_COLLIDE"];
	_this = _item905;
	_objects pushback _this;
	_objectIDs pushback 905;
	_this setPosWorld [7294.72,17895.8,165.149];
	_this setVectorDirAndUp [[0.198656,-0.980069,-1.2853e-005],[-0.00468873,-0.000963502,0.999989]];
};

private _item906 = objNull;
if (_layerRoot) then {
	_item906 = createVehicle ["Land_vn_b_trench_90_01",[7305.85,17909.7,0],[],0,"CAN_COLLIDE"];
	_this = _item906;
	_objects pushback _this;
	_objectIDs pushback 906;
	_this setPosWorld [7305.85,17909.7,165.549];
	_this setVectorDirAndUp [[-0.892594,0.450774,0.00888024],[0.00792287,-0.00401084,0.999961]];
};

private _item907 = objNull;
if (_layerRoot) then {
	_item907 = createVehicle ["Land_vn_b_trench_firing_05",[7308.83,17944.5,0.474747],[],0,"CAN_COLLIDE"];
	_this = _item907;
	_objects pushback _this;
	_objectIDs pushback 907;
	_this setPosWorld [7308.83,17944.5,166.16];
	_this setVectorDirAndUp [[-0.988429,-0.151684,0],[0,0,1]];
};

private _item908 = objNull;
if (_layerRoot) then {
	_item908 = createVehicle ["Land_vn_b_trench_firing_01",[7288.47,17884,0],[],0,"CAN_COLLIDE"];
	_this = _item908;
	_objects pushback _this;
	_objectIDs pushback 908;
	_this setPosWorld [7288.47,17884,167.064];
	_this setVectorDirAndUp [[-0.997536,-0.0701494,0],[0,0,1]];
};

private _item909 = objNull;
if (_layerRoot) then {
	_item909 = createVehicle ["Land_vn_b_trench_corner_01",[7296.23,17921.7,0],[],0,"CAN_COLLIDE"];
	_this = _item909;
	_objects pushback _this;
	_objectIDs pushback 909;
	_this setPosWorld [7296.23,17921.7,166.642];
	_this setVectorDirAndUp [[-0.721952,-0.691943,0],[0,0,1]];
};

private _item910 = objNull;
if (_layerRoot) then {
	_item910 = createVehicle ["Land_vn_b_trench_90_01",[7295.72,17858,0],[],0,"CAN_COLLIDE"];
	_this = _item910;
	_objects pushback _this;
	_objectIDs pushback 910;
	_this setPosWorld [7295.72,17858,165.159];
	_this setVectorDirAndUp [[0.995416,0.0934703,-0.0202706],[0.015966,0.0465725,0.998787]];
};

private _item911 = objNull;
if (_layerRoot) then {
	_item911 = createVehicle ["Land_vn_b_trench_20_02",[7328,17952.4,0.122421],[],0,"CAN_COLLIDE"];
	_this = _item911;
	_objects pushback _this;
	_objectIDs pushback 911;
	_this setPosWorld [7328,17952.4,165.929];
	_this setVectorDirAndUp [[-0.566736,0.822705,0.0443613],[0.0178745,-0.0415528,0.998976]];
};

private _item916 = objNull;
if (_layerRoot) then {
	_item916 = createVehicle ["Land_vn_hootch_02_03",[7323.05,17916.2,0],[],0,"CAN_COLLIDE"];
	_this = _item916;
	_objects pushback _this;
	_objectIDs pushback 916;
	_this setPosWorld [7323.05,17916.2,168.102];
	_this setVectorDirAndUp [[-0.94649,0.322734,0],[0,0,1]];
};

private _item917 = objNull;
if (_layerRoot) then {
	_item917 = createVehicle ["Land_vn_hootch_01_12",[7334.64,17902.1,0],[],0,"CAN_COLLIDE"];
	_this = _item917;
	_objects pushback _this;
	_objectIDs pushback 917;
	_this setPosWorld [7334.64,17902.1,168.241];
	_this setVectorDirAndUp [[0.296516,0.955028,0],[0,0,1]];
};

private _item918 = objNull;
if (_layerRoot) then {
	_item918 = createVehicle ["Land_vn_hootch_02_02",[7347.22,17863.8,0.592728],[],0,"CAN_COLLIDE"];
	_this = _item918;
	_objects pushback _this;
	_objectIDs pushback 918;
	_this setPosWorld [7347.22,17863.8,169.212];
	_this setVectorDirAndUp [[-0.0318114,-0.999494,0],[0,0,1]];
};

private _item919 = objNull;
if (_layerRoot) then {
	_item919 = createVehicle ["Land_vn_hootch_02_11",[7357.9,17848.3,0],[],0,"CAN_COLLIDE"];
	_this = _item919;
	_objects pushback _this;
	_objectIDs pushback 919;
	_this setPosWorld [7357.9,17848.3,169.028];
	_this setVectorDirAndUp [[-0.999421,-0.0340253,0],[0,0,1]];
};

private _item921 = objNull;
if (_layerRoot) then {
	_item921 = createVehicle ["vn_b_navy_static_l60mk3",[7328.11,17836.5,0],[],0,"CAN_COLLIDE"];
	_this = _item921;
	_objects pushback _this;
	_objectIDs pushback 921;
	_this setPosWorld [7328.03,17836.5,168.086];
	_this setVectorDirAndUp [[0.550889,0.834405,-0.0170211],[0.00666818,0.0159936,0.99985]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item922 = objNull;
if (_layerRoot) then {
	_item922 = createVehicle ["vn_b_navy_static_l60mk3",[7328.42,17845.2,0],[],0,"CAN_COLLIDE"];
	_this = _item922;
	_objects pushback _this;
	_objectIDs pushback 922;
	_this setPosWorld [7328.36,17845.2,167.96];
	_this setVectorDirAndUp [[-0.901372,0.43299,-0.00697842],[-0.00133721,0.0133316,0.99991]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item923 = objNull;
if (_layerRoot) then {
	_item923 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7316.2,17837.6,0],[],0,"CAN_COLLIDE"];
	_this = _item923;
	_objects pushback _this;
	_objectIDs pushback 923;
	_this setPosWorld [7316.2,17837.6,165.87];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item924 = objNull;
if (_layerRoot) then {
	_item924 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7316,17846.1,0],[],0,"CAN_COLLIDE"];
	_this = _item924;
	_objects pushback _this;
	_objectIDs pushback 924;
	_this setPosWorld [7316,17846.1,165.738];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item925 = objNull;
if (_layerRoot) then {
	_item925 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7338.65,17837.9,0],[],0,"CAN_COLLIDE"];
	_this = _item925;
	_objects pushback _this;
	_objectIDs pushback 925;
	_this setPosWorld [7338.65,17837.9,166.058];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item926 = objNull;
if (_layerRoot) then {
	_item926 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7338.42,17846.4,0],[],0,"CAN_COLLIDE"];
	_this = _item926;
	_objects pushback _this;
	_objectIDs pushback 926;
	_this setPosWorld [7338.42,17846.4,166.016];
	_this setVectorDirAndUp [[0.99897,0.0141499,0.0431122],[-0.0434252,0.0226178,0.998801]];
};

private _item927 = objNull;
if (_layerRoot) then {
	_item927 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7331.37,17851.9,0],[],0,"CAN_COLLIDE"];
	_this = _item927;
	_objects pushback _this;
	_objectIDs pushback 927;
	_this setPosWorld [7331.37,17851.9,165.831];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item928 = objNull;
if (_layerRoot) then {
	_item928 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7322.78,17851.6,0],[],0,"CAN_COLLIDE"];
	_this = _item928;
	_objects pushback _this;
	_objectIDs pushback 928;
	_this setPosWorld [7322.78,17851.6,165.716];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item929 = objNull;
if (_layerRoot) then {
	_item929 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7331.92,17841.5,0],[],0,"CAN_COLLIDE"];
	_this = _item929;
	_objects pushback _this;
	_objectIDs pushback 929;
	_this setPosWorld [7331.92,17841.5,165.904];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item930 = objNull;
if (_layerRoot) then {
	_item930 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7323.33,17841.1,0],[],0,"CAN_COLLIDE"];
	_this = _item930;
	_objects pushback _this;
	_objectIDs pushback 930;
	_this setPosWorld [7323.33,17841.1,165.879];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item931 = objNull;
if (_layerRoot) then {
	_item931 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7331.9,17830.6,0],[],0,"CAN_COLLIDE"];
	_this = _item931;
	_objects pushback _this;
	_objectIDs pushback 931;
	_this setPosWorld [7331.9,17830.6,166.156];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item932 = objNull;
if (_layerRoot) then {
	_item932 = createVehicle ["Land_vn_b_trench_revetment_05_01",[7323.32,17830.3,0],[],0,"CAN_COLLIDE"];
	_this = _item932;
	_objects pushback _this;
	_objectIDs pushback 932;
	_this setPosWorld [7323.32,17830.3,166.171];
	_this setVectorDirAndUp [[-0.0129038,0.999648,-0.023198],[-0.0434252,0.0226178,0.998801]];
};

private _item933 = objNull;
if (_layerRoot) then {
	_item933 = createVehicle ["vn_o_pl_static_d44_01",[7349.6,17900.3,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item933;
	_objects pushback _this;
	_objectIDs pushback 933;
	_this setPosWorld [7349.61,17900.4,167.621];
	_this setVectorDirAndUp [[-0.919278,0.389487,-0.0568047],[-0.0678425,-0.0146305,0.997589]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item934 = objNull;
if (_layerRoot) then {
	_item934 = createVehicle ["Land_BagFence_Long_F",[7355.92,17903.2,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item934;
	_objects pushback _this;
	_objectIDs pushback 934;
	_this setPosWorld [7355.92,17903.2,168.481];
	_this setVectorDirAndUp [[-0.898665,-0.434048,-0.063268],[-0.0625437,-0.0159664,0.997914]];
	_this allowdamage false;;
};

private _item935 = objNull;
if (_layerRoot) then {
	_item935 = createVehicle ["Land_BagFence_Long_F",[7356.03,17898,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item935;
	_objects pushback _this;
	_objectIDs pushback 935;
	_this setPosWorld [7356.03,17898,168.412];
	_this setVectorDirAndUp [[-0.942474,0.329852,-0.0542298],[-0.0625447,-0.0146397,0.997935]];
	_this allowdamage false;;
};

private _item936 = objNull;
if (_layerRoot) then {
	_item936 = createVehicle ["Land_BagFence_Long_F",[7352.17,17893.7,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item936;
	_objects pushback _this;
	_objectIDs pushback 936;
	_this setPosWorld [7352.17,17893.7,168.101];
	_this setVectorDirAndUp [[-0.435487,0.900134,-0.0104928],[-0.0625428,-0.0186262,0.997868]];
	_this allowdamage false;;
};

private _item937 = objNull;
if (_layerRoot) then {
	_item937 = createVehicle ["Land_BagFence_Long_F",[7347.41,17893.7,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item937;
	_objects pushback _this;
	_objectIDs pushback 937;
	_this setPosWorld [7347.41,17893.7,167.786];
	_this setVectorDirAndUp [[0.256734,0.965898,0.0335995],[-0.0704929,-0.0159579,0.997385]];
	_this allowdamage false;;
};

private _item938 = objNull;
if (_layerRoot) then {
	_item938 = createVehicle ["Land_BagFence_Long_F",[7343.74,17896.6,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item938;
	_objects pushback _this;
	_objectIDs pushback 938;
	_this setPosWorld [7343.74,17896.6,167.574];
	_this setVectorDirAndUp [[0.896097,0.438155,0.0709306],[-0.0704929,-0.0172885,0.997362]];
	_this allowdamage false;;
};

private _item939 = objNull;
if (_layerRoot) then {
	_item939 = createVehicle ["Land_BagFence_Long_F",[7343.05,17902.7,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item939;
	_objects pushback _this;
	_objectIDs pushback 939;
	_this setPosWorld [7343.05,17902.7,167.632];
	_this setVectorDirAndUp [[0.934865,-0.350762,0.0547045],[-0.0678425,-0.0252668,0.997376]];
	_this allowdamage false;;
};

private _item940 = objNull;
if (_layerRoot) then {
	_item940 = createVehicle ["Land_BagFence_Long_F",[7347.23,17906.9,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item940;
	_objects pushback _this;
	_objectIDs pushback 940;
	_this setPosWorld [7347.23,17906.9,168.007];
	_this setVectorDirAndUp [[0.508203,-0.861088,0.0160383],[-0.0585666,-0.0159739,0.998156]];
	_this allowdamage false;;
};

private _item941 = objNull;
if (_layerRoot) then {
	_item941 = createVehicle ["Land_BagFence_Long_F",[7352.55,17906.4,3.05176e-005],[],0,"CAN_COLLIDE"];
	_this = _item941;
	_objects pushback _this;
	_objectIDs pushback 941;
	_this setPosWorld [7352.55,17906.4,168.322];
	_this setVectorDirAndUp [[-0.378175,-0.924933,-0.0385006],[-0.0625437,-0.0159664,0.997914]];
	_this allowdamage false;;
};

private _item942 = objNull;
if (_layerRoot) then {
	_item942 = createVehicle ["vn_o_pl_static_d44_01",[7318.62,17885,0],[],0,"CAN_COLLIDE"];
	_this = _item942;
	_objects pushback _this;
	_objectIDs pushback 942;
	_this setPosWorld [7318.63,17885.1,165.913];
	_this setVectorDirAndUp [[0.988521,-0.151078,-0.00127704],[0.00129187,0,0.999999]];
	_this enableSimulation false;
	_this allowdamage false;;
	[_this, 2] call ace_cargo_fnc_setSize;
};

private _item943 = objNull;
if (_layerRoot) then {
	_item943 = createVehicle ["Land_BagFence_Long_F",[7313.2,17880.7,0],[],0,"CAN_COLLIDE"];
	_this = _item943;
	_objects pushback _this;
	_objectIDs pushback 943;
	_this setPosWorld [7313.2,17880.7,166.33];
	_this setVectorDirAndUp [[0.762684,0.646771,0.000835545],[0,-0.00129187,0.999999]];
	_this allowdamage false;;
};

private _item944 = objNull;
if (_layerRoot) then {
	_item944 = createVehicle ["Land_BagFence_Long_F",[7311.83,17885.7,0],[],0,"CAN_COLLIDE"];
	_this = _item944;
	_objects pushback _this;
	_objectIDs pushback 944;
	_this setPosWorld [7311.83,17885.7,166.331];
	_this setVectorDirAndUp [[0.996828,-0.0790547,0.00919361],[-0.0093285,-0.00133715,0.999956]];
	_this allowdamage false;;
};

private _item945 = objNull;
if (_layerRoot) then {
	_item945 = createVehicle ["Land_BagFence_Long_F",[7314.51,17890.8,0],[],0,"CAN_COLLIDE"];
	_this = _item945;
	_objects pushback _this;
	_objectIDs pushback 945;
	_this setPosWorld [7314.51,17890.8,166.345];
	_this setVectorDirAndUp [[0.640699,-0.767787,-0.00289297],[0.00133721,-0.00265204,0.999996]];
	_this allowdamage false;;
};

private _item946 = objNull;
if (_layerRoot) then {
	_item946 = createVehicle ["Land_BagFence_Long_F",[7319.11,17892,0],[],0,"CAN_COLLIDE"];
	_this = _item946;
	_objects pushback _this;
	_objectIDs pushback 946;
	_this setPosWorld [7319.11,17892,166.357];
	_this setVectorDirAndUp [[-0.0132362,-0.99989,-0.00670269],[-0.00265204,-0.00666815,0.999974]];
	_this allowdamage false;;
};

private _item947 = objNull;
if (_layerRoot) then {
	_item947 = createVehicle ["Land_BagFence_Long_F",[7323.35,17890.1,0],[],0,"CAN_COLLIDE"];
	_this = _item947;
	_objects pushback _this;
	_objectIDs pushback 947;
	_this setPosWorld [7323.35,17890.1,166.467];
	_this setVectorDirAndUp [[-0.765938,-0.642125,-0.0318549],[-0.0359749,-0.00666386,0.99933]];
	_this allowdamage false;;
};

private _item948 = objNull;
if (_layerRoot) then {
	_item948 = createVehicle ["Land_BagFence_Long_F",[7325.53,17884.4,0],[],0,"CAN_COLLIDE"];
	_this = _item948;
	_objects pushback _this;
	_objectIDs pushback 948;
	_this setPosWorld [7325.53,17884.4,166.524];
	_this setVectorDirAndUp [[-0.993851,0.10483,-0.0356367],[-0.0359749,-0.00133635,0.999352]];
	_this allowdamage false;;
};

private _item949 = objNull;
if (_layerRoot) then {
	_item949 = createVehicle ["Land_BagFence_Long_F",[7322.54,17879.3,0],[],0,"CAN_COLLIDE"];
	_this = _item949;
	_objects pushback _this;
	_objectIDs pushback 949;
	_this setPosWorld [7322.54,17879.3,166.419];
	_this setVectorDirAndUp [[-0.710289,0.703412,-0.0264875],[-0.0346439,0.00265045,0.999396]];
	_this allowdamage false;;
};

private _item950 = objNull;
if (_layerRoot) then {
	_item950 = createVehicle ["Land_BagFence_Long_F",[7317.28,17878.4,0],[],0,"CAN_COLLIDE"];
	_this = _item950;
	_objects pushback _this;
	_objectIDs pushback 950;
	_this setPosWorld [7317.28,17878.4,166.334];
	_this setVectorDirAndUp [[0.143289,0.989677,-0.00262468],[0,0.00265204,0.999996]];
	_this allowdamage false;;
};

private _item961 = objNull;
if (_layerRoot) then {
	_item961 = createVehicle ["Land_vn_b_trench_firing_05",[7367.75,17989.9,0],[],0,"CAN_COLLIDE"];
	_this = _item961;
	_objects pushback _this;
	_objectIDs pushback 961;
	_this setPosWorld [7367.75,17989.9,168.154];
	_this setVectorDirAndUp [[-0.944204,-0.329361,-0.000538897],[-0.0003238,-0.000707928,1]];
};

private _item962 = objNull;
if (_layerRoot) then {
	_item962 = createVehicle ["Land_vn_b_trench_45_01",[7377.35,17971.8,0],[],0,"CAN_COLLIDE"];
	_this = _item962;
	_objects pushback _this;
	_objectIDs pushback 962;
	_this setPosWorld [7377.35,17971.8,167.954];
	_this setVectorDirAndUp [[0.832709,0.552904,0.0298602],[-0.0571402,0.0321671,0.997848]];
};

private _item964 = objNull;
if (_layerRoot) then {
	_item964 = createVehicle ["Land_vn_b_trench_45_01",[7401.83,17946.3,-1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item964;
	_objects pushback _this;
	_objectIDs pushback 964;
	_this setPosWorld [7401.83,17946.3,169.134];
	_this setVectorDirAndUp [[0.267833,0.963462,-0.00238616],[-0.0964602,0.029279,0.994906]];
};

private _item965 = objNull;
if (_layerRoot) then {
	_item965 = createVehicle ["Land_vn_b_trench_45_01",[7411.62,17949.2,0],[],0,"CAN_COLLIDE"];
	_this = _item965;
	_objects pushback _this;
	_objectIDs pushback 965;
	_this setPosWorld [7411.62,17949.2,169.544];
	_this setVectorDirAndUp [[-0.35446,-0.935069,-0.00202609],[-0.0308493,0.00952851,0.999479]];
};

private _item966 = objNull;
if (_layerRoot) then {
	_item966 = createVehicle ["Land_vn_b_trench_45_01",[7420.07,17945.1,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item966;
	_objects pushback _this;
	_objectIDs pushback 966;
	_this setPosWorld [7420.07,17945.1,169.949];
	_this setVectorDirAndUp [[-0.969243,-0.240065,-0.0541883],[-0.0583732,0.0103507,0.998241]];
};

private _item967 = objNull;
if (_layerRoot) then {
	_item967 = createVehicle ["Land_vn_b_trench_45_01",[7424.45,17936.6,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item967;
	_objects pushback _this;
	_objectIDs pushback 967;
	_this setPosWorld [7424.45,17936.6,170.296];
	_this setVectorDirAndUp [[0.948538,0.314274,0.0388295],[-0.0488373,0.0240302,0.998518]];
};

private _item968 = objNull;
if (_layerRoot) then {
	_item968 = createVehicle ["Land_vn_b_tower_01",[7412.89,17944.5,0],[],0,"CAN_COLLIDE"];
	_this = _item968;
	_objects pushback _this;
	_objectIDs pushback 968;
	_this setPosWorld [7412.89,17944.5,172.465];
	_this setVectorDirAndUp [[0.444391,0.895832,0.000778079],[-0.0003238,-0.000707928,1]];
};

private _item969 = objNull;
if (_layerRoot) then {
	_item969 = createVehicle ["Land_vn_b_trench_bunker_04_01",[7436.71,17926.3,0],[],0,"CAN_COLLIDE"];
	_this = _item969;
	_objects pushback _this;
	_objectIDs pushback 969;
	_this setPosWorld [7436.71,17926.3,172.859];
	_this setVectorDirAndUp [[0.169665,0.985502,0],[0,0,1]];
};

private _item970 = objNull;
if (_layerRoot) then {
	_item970 = createVehicle ["Land_vn_b_trench_45_02",[7435.46,17934.8,0.694656],[],0,"CAN_COLLIDE"];
	_this = _item970;
	_objects pushback _this;
	_objectIDs pushback 970;
	_this setPosWorld [7435.46,17934.8,171.513];
	_this setVectorDirAndUp [[-0.99775,0.0434019,0.0510913],[0.0534878,0.0559792,0.996998]];
};

private _item971 = objNull;
if (_layerRoot) then {
	_item971 = createVehicle ["Land_vn_b_trench_45_01",[7362.86,17977.6,0],[],0,"CAN_COLLIDE"];
	_this = _item971;
	_objects pushback _this;
	_objectIDs pushback 971;
	_this setPosWorld [7362.86,17977.6,167.341];
	_this setVectorDirAndUp [[0.349235,0.937034,0.00176095],[-0.0610969,0.0208956,0.997913]];
};

private _item972 = objNull;
if (_layerRoot) then {
	_item972 = createVehicle ["Land_vn_b_trench_cross_01",[7371.72,17979.7,0],[],0,"CAN_COLLIDE"];
	_this = _item972;
	_objects pushback _this;
	_objectIDs pushback 972;
	_this setPosWorld [7371.72,17979.7,167.659];
	_this setVectorDirAndUp [[-0.909726,-0.41521,0],[0,0,1]];
};

private _item973 = objNull;
if (_layerRoot) then {
	_item973 = createVehicle ["Land_vn_b_trench_firing_02",[7362.46,17797.9,0],[],0,"CAN_COLLIDE"];
	_this = _item973;
	_objects pushback _this;
	_objectIDs pushback 973;
	_this setPosWorld [7362.46,17797.9,167.571];
	_this setVectorDirAndUp [[0.999225,-0.0290161,0.0265896],[-0.0259487,0.0222448,0.999416]];
};

private _item974 = objNull;
if (_layerRoot) then {
	_item974 = createVehicle ["Land_vn_b_trench_20_02",[7341.17,17968.6,0.0886841],[],0,"CAN_COLLIDE"];
	_this = _item974;
	_objects pushback _this;
	_objectIDs pushback 974;
	_this setPosWorld [7341.17,17968.6,166.466];
	_this setVectorDirAndUp [[-0.852165,0.521877,-0.0381934],[-0.0439577,0.00133592,0.999032]];
};

private _item979 = objNull;
if (_layerRoot) then {
	_item979 = createVehicle ["Land_vn_b_trench_45_01",[7386.58,17967.9,0.276306],[],0,"CAN_COLLIDE"];
	_this = _item979;
	_objects pushback _this;
	_objectIDs pushback 979;
	_this setPosWorld [7386.58,17967.9,168.591];
	_this setVectorDirAndUp [[-0.843527,-0.534474,-0.0529154],[-0.0524078,-0.0161436,0.998495]];
};

private _item980 = objNull;
if (_layerRoot) then {
	_item980 = createVehicle ["Land_vn_b_trench_45_01",[7392.32,17960.1,0.290863],[],0,"CAN_COLLIDE"];
	_this = _item980;
	_objects pushback _this;
	_objectIDs pushback 980;
	_this setPosWorld [7392.32,17960.1,168.927];
	_this setVectorDirAndUp [[-0.989466,0.131087,-0.0614265],[-0.06098,0.00742174,0.998111]];
};

private _item981 = objNull;
if (_layerRoot) then {
	_item981 = createVehicle ["Land_vn_b_trench_90_01",[7393.99,17950.5,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item981;
	_objects pushback _this;
	_objectIDs pushback 981;
	_this setPosWorld [7393.99,17950.5,168.717];
	_this setVectorDirAndUp [[0.979054,-0.2036,-1.67638e-006],[-0.0106976,-0.0514502,0.998618]];
};

private _item987 = objNull;
if (_layerRoot) then {
	_item987 = createVehicle ["Land_vn_b_trench_corner_01",[7431.36,17943.3,0],[],0,"CAN_COLLIDE"];
	_this = _item987;
	_objects pushback _this;
	_objectIDs pushback 987;
	_this setPosWorld [7431.36,17943.3,171.957];
	_this setVectorDirAndUp [[0.769068,0.639167,0],[0,0,1]];
};

private _item988 = objNull;
if (_layerRoot) then {
	_item988 = createVehicle ["Land_vn_b_trench_firing_05",[7379.38,17984.1,-1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item988;
	_objects pushback _this;
	_objectIDs pushback 988;
	_this setPosWorld [7379.38,17984.1,168.63];
	_this setVectorDirAndUp [[-0.423083,0.906091,-0.000538903],[-0.00073705,0.000250603,1]];
};

private _item989 = objNull;
if (_layerRoot) then {
	_item989 = createVehicle ["Land_vn_b_trench_45_01",[7385.34,17825.4,0],[],0,"CAN_COLLIDE"];
	_this = _item989;
	_objects pushback _this;
	_objectIDs pushback 989;
	_this setPosWorld [7385.34,17825.4,169.217];
	_this setVectorDirAndUp [[-0.54322,0.839073,0.02946],[0.0143965,-0.0257745,0.999564]];
};

private _item990 = objNull;
if (_layerRoot) then {
	_item990 = createVehicle ["Land_vn_b_trench_45_01",[7400.9,17860.5,0],[],0,"CAN_COLLIDE"];
	_this = _item990;
	_objects pushback _this;
	_objectIDs pushback 990;
	_this setPosWorld [7400.9,17860.5,169.941];
	_this setVectorDirAndUp [[-0.517782,0.854381,0.0439812],[-0.0101473,-0.0575389,0.998292]];
};

private _item991 = objNull;
if (_layerRoot) then {
	_item991 = createVehicle ["Land_vn_b_trench_45_01",[7379.13,17817.6,0],[],0,"CAN_COLLIDE"];
	_this = _item991;
	_objects pushback _this;
	_objectIDs pushback 991;
	_this setPosWorld [7379.13,17817.6,168.799];
	_this setVectorDirAndUp [[0.752418,-0.658027,0.0294628],[-0.0658519,-0.0306419,0.997359]];
};

private _item992 = objNull;
if (_layerRoot) then {
	_item992 = createVehicle ["Land_vn_b_trench_90_01",[7304.18,17852.7,0.0422668],[],0,"CAN_COLLIDE"];
	_this = _item992;
	_objects pushback _this;
	_objectIDs pushback 992;
	_this setPosWorld [7304.18,17852.7,165.538];
	_this setVectorDirAndUp [[-0.996786,-0.0699111,-0.0391195],[-0.040461,0.0178765,0.999021]];
};

private _item993 = objNull;
if (_layerRoot) then {
	_item993 = createVehicle ["Land_vn_b_trench_45_01",[7306.47,17843.5,0.0636902],[],0,"CAN_COLLIDE"];
	_this = _item993;
	_objects pushback _this;
	_objectIDs pushback 993;
	_this setPosWorld [7306.47,17843.5,165.677];
	_this setVectorDirAndUp [[-0.797806,0.601411,-0.042553],[-0.0617517,-0.0113014,0.998028]];
};

private _item994 = objNull;
if (_layerRoot) then {
	_item994 = createVehicle ["Land_vn_b_trench_20_02",[7298.79,17820.3,0.0810699],[],0,"CAN_COLLIDE"];
	_this = _item994;
	_objects pushback _this;
	_objectIDs pushback 994;
	_this setPosWorld [7298.79,17820.3,165.73];
	_this setVectorDirAndUp [[-0.996532,-0.0818727,-0.0148749],[-0.0157412,0.00994591,0.999827]];
};

private _item995 = objNull;
if (_layerRoot) then {
	_item995 = createVehicle ["Land_vn_b_trench_45_01",[7310.57,17805.7,0],[],0,"CAN_COLLIDE"];
	_this = _item995;
	_objects pushback _this;
	_objectIDs pushback 995;
	_this setPosWorld [7310.57,17805.7,165.965];
	_this setVectorDirAndUp [[-0.974909,0.198427,-0.10089],[-0.101974,0.0047737,0.994776]];
};

private _item996 = objNull;
if (_layerRoot) then {
	_item996 = createVehicle ["Land_vn_b_trench_firing_05",[7304.14,17809,0],[],0,"CAN_COLLIDE"];
	_this = _item996;
	_objects pushback _this;
	_objectIDs pushback 996;
	_this setPosWorld [7304.14,17809,166.395];
	_this setVectorDirAndUp [[0.675596,-0.736491,0.0339335],[-0.0259488,0.0222444,0.999416]];
};

private _item997 = objNull;
if (_layerRoot) then {
	_item997 = createVehicle ["Land_vn_b_trench_90_01",[7312.25,17796.1,0],[],0,"CAN_COLLIDE"];
	_this = _item997;
	_objects pushback _this;
	_objectIDs pushback 997;
	_this setPosWorld [7312.25,17796.1,165.997];
	_this setVectorDirAndUp [[0.994925,-0.100459,0.00563041],[-0.00422113,0.0142355,0.99989]];
};

private _item998 = objNull;
if (_layerRoot) then {
	_item998 = createVehicle ["Land_vn_b_trench_45_01",[7320.8,17793,0],[],0,"CAN_COLLIDE"];
	_this = _item998;
	_objects pushback _this;
	_objectIDs pushback 998;
	_this setPosWorld [7320.8,17793,166.406];
	_this setVectorDirAndUp [[0.124452,0.989695,-0.0708257],[-0.0746064,0.0805124,0.993958]];
};

private _item999 = objNull;
if (_layerRoot) then {
	_item999 = createVehicle ["Land_vn_b_trench_45_01",[7328.99,17797.4,0],[],0,"CAN_COLLIDE"];
	_this = _item999;
	_objects pushback _this;
	_objectIDs pushback 999;
	_this setPosWorld [7328.99,17797.4,166.549];
	_this setVectorDirAndUp [[-0.079212,-0.994003,0.0753954],[-0.100692,0.0832244,0.991431]];
};

private _item1000 = objNull;
if (_layerRoot) then {
	_item1000 = createVehicle ["Land_vn_b_trench_firing_05",[7336.52,17793.3,0.498901],[],0,"CAN_COLLIDE"];
	_this = _item1000;
	_objects pushback _this;
	_objectIDs pushback 1000;
	_this setPosWorld [7336.52,17793.3,167.894];
	_this setVectorDirAndUp [[0.992505,0.119998,0.0230985],[-0.0259488,0.0222444,0.999416]];
};

private _item1001 = objNull;
if (_layerRoot) then {
	_item1001 = createVehicle ["Land_vn_b_trench_corner_01",[7289.56,17875.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1001;
	_objects pushback _this;
	_objectIDs pushback 1001;
	_this setPosWorld [7289.56,17875.7,166.533];
	_this setVectorDirAndUp [[0.998354,0.057355,0],[0,0,1]];
};

private _item1002 = objNull;
if (_layerRoot) then {
	_item1002 = createVehicle ["Land_vn_b_trench_corner_01",[7290.49,17863.7,-0.0338135],[],0,"CAN_COLLIDE"];
	_this = _item1002;
	_objects pushback _this;
	_objectIDs pushback 1002;
	_this setPosWorld [7290.49,17863.7,166.529];
	_this setVectorDirAndUp [[0.999974,-0.00658456,0.0029555],[-0.00294821,0.00111729,0.999995]];
};

private _item1003 = objNull;
if (_layerRoot) then {
	_item1003 = createVehicle ["Land_vn_b_trench_revetment_tall_03",[7292.8,17873.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1003;
	_objects pushback _this;
	_objectIDs pushback 1003;
	_this setPosWorld [7292.8,17873.9,166.209];
	_this setVectorDirAndUp [[-0.0652848,0.997867,0],[0,0,1]];
};

private _item1004 = objNull;
if (_layerRoot) then {
	_item1004 = createVehicle ["Land_vn_b_trench_revetment_tall_03",[7293.28,17865.7,-0.0314331],[],0,"CAN_COLLIDE"];
	_this = _item1004;
	_objects pushback _this;
	_objectIDs pushback 1004;
	_this setPosWorld [7293.28,17865.7,166.198];
	_this setVectorDirAndUp [[0.0400898,-0.999195,0.00123459],[-0.00294821,0.00111729,0.999995]];
};

private _item1005 = objNull;
if (_layerRoot) then {
	_item1005 = createVehicle ["Land_vn_b_trench_45_02",[7342.58,17798.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1005;
	_objects pushback _this;
	_objectIDs pushback 1005;
	_this setPosWorld [7342.58,17798.2,166.804];
	_this setVectorDirAndUp [[-0.0115422,0.999626,-0.024775],[-0.00576423,0.0247097,0.999678]];
};

private _item1006 = objNull;
if (_layerRoot) then {
	_item1006 = createVehicle ["Land_vn_b_trench_45_01",[7351.34,17805.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1006;
	_objects pushback _this;
	_objectIDs pushback 1006;
	_this setPosWorld [7351.34,17805.1,167.027];
	_this setVectorDirAndUp [[-0.0540041,-0.995499,0.077878],[-0.0712945,0.0816369,0.994109]];
};

private _item1007 = objNull;
if (_layerRoot) then {
	_item1007 = createVehicle ["Land_vn_b_tower_01",[7387.3,17842,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1007;
	_objects pushback _this;
	_objectIDs pushback 1007;
	_this setPosWorld [7387.3,17842,171.927];
	_this setVectorDirAndUp [[0.963942,-0.264277,0.0311879],[-0.0342075,-0.00683028,0.999391]];
};

private _item1008 = objNull;
if (_layerRoot) then {
	_item1008 = createVehicle ["Land_vn_b_tower_01",[7317.45,17800.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1008;
	_objects pushback _this;
	_objectIDs pushback 1008;
	_this setPosWorld [7317.45,17800.7,169.078];
	_this setVectorDirAndUp [[-0.438468,-0.898698,0.00939671],[-0.0256297,0.0229543,0.999408]];
};

private _item1010 = objNull;
if (_layerRoot) then {
	_item1010 = createVehicle ["Land_vn_b_trench_wall_10_03",[7292.79,17927.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1010;
	_objects pushback _this;
	_objectIDs pushback 1010;
	_this setPosWorld [7292.79,17927.5,166.357];
	_this setVectorDirAndUp [[0.677945,-0.735113,0],[0,0,1]];
};

private _item1011 = objNull;
if (_layerRoot) then {
	_item1011 = createVehicle ["Land_vn_t_phoenixc1s_f",[7332.89,17889.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1011;
	_objects pushback _this;
	_objectIDs pushback 1011;
	_this setPosWorld [7332.89,17889.5,169.937];
	_this setVectorDirAndUp [[-0.319852,-0.947275,-0.0191191],[-0.0439564,-0.00532135,0.999019]];
	_this allowdamage false;;
};

private _item1013 = objNull;
if (_layerRoot) then {
	_item1013 = createVehicle ["Land_vn_t_juglansregia_3s",[7340.33,17806,0],[],0,"CAN_COLLIDE"];
	_this = _item1013;
	_objects pushback _this;
	_objectIDs pushback 1013;
	_this setPosWorld [7340.33,17806,175.314];
	_this setVectorDirAndUp [[-0.429184,-0.903207,-0.00421851],[-0.0266571,0.00799805,0.999613]];
	_this allowdamage false;;
};

private _item1014 = objNull;
if (_layerRoot) then {
	_item1014 = createVehicle ["Land_vn_t_juglansregia_2s",[7416.66,17809.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1014;
	_objects pushback _this;
	_objectIDs pushback 1014;
	_this setPosWorld [7416.66,17809.8,178.207];
	_this setVectorDirAndUp [[0.875697,-0.480763,0.0449676],[-0.0585645,-0.0133088,0.998195]];
	_this allowdamage false;;
};

private _item1015 = objNull;
if (_layerRoot) then {
	_item1015 = createVehicle ["Land_vn_t_ficus_big_f",[7399.46,17848.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1015;
	_objects pushback _this;
	_objectIDs pushback 1015;
	_this setPosWorld [7399.46,17848.5,188.527];
	_this setVectorDirAndUp [[-0.86634,-0.497538,-0.0437193],[-0.05193,0.00267082,0.998647]];
	_this allowdamage false;;
};

private _item1016 = objNull;
if (_layerRoot) then {
	_item1016 = createVehicle ["Land_vn_t_ficus_medium_f",[7429.98,17900.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1016;
	_objects pushback _this;
	_objectIDs pushback 1016;
	_this setPosWorld [7429.98,17900.2,181.913];
	_this setVectorDirAndUp [[0.930478,-0.363746,0.043585],[-0.042629,0.01066,0.999034]];
	_this allowdamage false;;
};

private _item1018 = objNull;
if (_layerRoot) then {
	_item1018 = createVehicle ["Land_vn_t_cyathea_f",[7297.04,17845.4,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1018;
	_objects pushback _this;
	_objectIDs pushback 1018;
	_this setPosWorld [7297.04,17845.4,168.356];
	_this setVectorDirAndUp [[0.517297,-0.855474,0.0238446],[-0.0306514,0.00932412,0.999487]];
	_this allowdamage false;;
};

private _item1019 = objNull;
if (_layerRoot) then {
	_item1019 = createVehicle ["Land_vn_t_cocosnucifera3s_tall_f",[7297.75,17895.3,1.40112],[],0,"CAN_COLLIDE"];
	_this = _item1019;
	_objects pushback _this;
	_objectIDs pushback 1019;
	_this setPosWorld [7297.75,17895.3,177.135];
	_this setVectorDirAndUp [[0.518307,-0.855195,0],[0,0,1]];
	_this allowdamage false;;
};

private _item1020 = objNull;
if (_layerRoot) then {
	_item1020 = createVehicle ["Land_vn_t_cocosnucifera3s_bend_f",[7366.42,17817.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1020;
	_objects pushback _this;
	_objectIDs pushback 1020;
	_this setPosWorld [7366.42,17817.2,175.444];
	_this setVectorDirAndUp [[0.516329,-0.85615,0.0202775],[-0.0678425,-0.0172883,0.997546]];
	_this allowdamage false;;
};

private _item1021 = objNull;
if (_layerRoot) then {
	_item1021 = createVehicle ["Land_vn_t_cocosnucifera2s_small_f",[7324.19,17804.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1021;
	_objects pushback _this;
	_objectIDs pushback 1021;
	_this setPosWorld [7324.19,17804.5,173.758];
	_this setVectorDirAndUp [[0.517691,-0.855465,0.0132971],[-0.0146643,0.00666746,0.99987]];
	_this allowdamage false;;
};

private _item1022 = objNull;
if (_layerRoot) then {
	_item1022 = createVehicle ["Land_vn_t_banana_f",[7345.01,17913.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1022;
	_objects pushback _this;
	_objectIDs pushback 1022;
	_this setPosWorld [7345.01,17913.3,169.601];
	_this setVectorDirAndUp [[0.626268,-0.779011,0.030509],[-0.0585655,-0.00798716,0.998252]];
	_this allowdamage false;;
};

private _item1023 = objNull;
if (_layerRoot) then {
	_item1023 = createVehicle ["Land_vn_t_juglansregia_3s",[7457.85,17865.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1023;
	_objects pushback _this;
	_objectIDs pushback 1023;
	_this setPosWorld [7457.85,17865.1,182.015];
	_this setVectorDirAndUp [[0.523274,0.851891,0.0216109],[-0.0585666,0.0106513,0.998227]];
	_this allowdamage false;;
};

private _item1025 = objNull;
if (_layerRoot) then {
	_item1025 = createVehicle ["Land_vn_t_ficus_big_f",[7419.08,17881.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1025;
	_objects pushback _this;
	_objectIDs pushback 1025;
	_this setPosWorld [7419.08,17881.6,189.566];
	_this setVectorDirAndUp [[-0.462854,0.885516,-0.0403595],[-0.069168,0.00931253,0.997562]];
	_this allowdamage false;;
};

private _item1026 = objNull;
if (_layerRoot) then {
	_item1026 = createVehicle ["Land_vn_t_ficus_medium_f",[7367.9,17961.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1026;
	_objects pushback _this;
	_objectIDs pushback 1026;
	_this setPosWorld [7367.9,17961.3,178.264];
	_this setVectorDirAndUp [[0.980635,0.191092,0.0428927],[-0.0439577,0.00133592,0.999032]];
	_this allowdamage false;;
};

private _item1028 = objNull;
if (_layerRoot) then {
	_item1028 = createVehicle ["Land_vn_t_ficusb1s_f",[7385.58,17866.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1028;
	_objects pushback _this;
	_objectIDs pushback 1028;
	_this setPosWorld [7385.58,17866.5,171.74];
	_this setVectorDirAndUp [[-0.307799,-0.95089,-0.0326811],[-0.0771034,-0.0093071,0.99698]];
	_this allowdamage false;;
};

private _item1031 = objNull;
if (_layerRoot) then {
	_item1031 = createVehicle ["Land_vn_t_phoenixc1s_f",[7370.54,17826.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1031;
	_objects pushback _this;
	_objectIDs pushback 1031;
	_this setPosWorld [7370.54,17826.8,172.08];
	_this setVectorDirAndUp [[0.51657,-0.855514,0.0353614],[-0.0704929,-0.00133389,0.997511]];
	_this allowdamage false;;
};

private _item1032 = objNull;
if (_layerRoot) then {
	_item1032 = createVehicle ["Land_vn_t_pritchardia_f",[7298.17,17877.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1032;
	_objects pushback _this;
	_objectIDs pushback 1032;
	_this setPosWorld [7298.17,17877.3,166.105];
	_this setVectorDirAndUp [[-0.0819424,-0.996637,-0.00030679],[-0.0359766,0.00265033,0.999349]];
	_this allowdamage false;;
};

private _item1035 = objNull;
if (_layerRoot) then {
	_item1035 = createVehicle ["Land_vn_t_banana_f",[7367.47,17806.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1035;
	_objects pushback _this;
	_objectIDs pushback 1035;
	_this setPosWorld [7367.47,17806.5,170.211];
	_this setVectorDirAndUp [[0.517042,-0.855625,0.0239625],[-0.0638688,-0.0106479,0.997901]];
	_this allowdamage false;;
};

private _item1036 = objNull;
if (_layerRoot) then {
	_item1036 = createVehicle ["Land_vn_t_phoenixc1s_f",[7350.02,17793.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1036;
	_objects pushback _this;
	_objectIDs pushback 1036;
	_this setPosWorld [7350.02,17793.7,170.9];
	_this setVectorDirAndUp [[-0.858362,-0.51262,-0.0208586],[-0.0306533,0.0106591,0.999473]];
	_this allowdamage false;;
};

private _item1037 = objNull;
if (_layerRoot) then {
	_item1037 = createVehicle ["Land_vn_t_phoenixc1s_f",[7284.68,17860.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1037;
	_objects pushback _this;
	_objectIDs pushback 1037;
	_this setPosWorld [7284.68,17860.6,168.786];
	_this setVectorDirAndUp [[-0.864287,-0.502892,-0.0103679],[-0.011995,0,0.999928]];
	_this allowdamage false;;
};

private _item1038 = objNull;
if (_layerRoot) then {
	_item1038 = createVehicle ["Land_vn_t_phoenixc1s_f",[7375.76,17845.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1038;
	_objects pushback _this;
	_objectIDs pushback 1038;
	_this setPosWorld [7375.76,17845.6,172.12];
	_this setVectorDirAndUp [[0.628173,-0.776374,0.0513944],[-0.0651924,0.0133033,0.997784]];
	_this allowdamage false;;
};

private _item1039 = objNull;
if (_layerRoot) then {
	_item1039 = createVehicle ["Land_vn_t_phoenixc1s_f",[7349.62,17819.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1039;
	_objects pushback _this;
	_objectIDs pushback 1039;
	_this setPosWorld [7349.62,17819.9,170.726];
	_this setVectorDirAndUp [[-0.950916,0.307459,-0.0350468],[-0.0359749,0.00265033,0.999349]];
	_this allowdamage false;;
};

private _item1040 = objNull;
if (_layerRoot) then {
	_item1040 = createVehicle ["Land_vn_t_phoenixc1s_f",[7283.37,17877.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1040;
	_objects pushback _this;
	_objectIDs pushback 1040;
	_this setPosWorld [7283.37,17877.6,168.763];
	_this setVectorDirAndUp [[-0.904678,-0.425972,-0.0102828],[-0.011995,0.00133712,0.999927]];
	_this allowdamage false;;
};

private _item1041 = objNull;
if (_layerRoot) then {
	_item1041 = createVehicle ["Land_vn_t_phoenixc1s_f",[7422.35,17921.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1041;
	_objects pushback _this;
	_objectIDs pushback 1041;
	_this setPosWorld [7422.35,17921.4,174.479];
	_this setVectorDirAndUp [[0.831231,-0.553269,0.0542984],[-0.0439577,0.0319539,0.998522]];
	_this allowdamage false;;
};

private _item1042 = objNull;
if (_layerRoot) then {
	_item1042 = createVehicle ["Land_vn_t_cyathea_f",[7404.19,17905.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1042;
	_objects pushback _this;
	_objectIDs pushback 1042;
	_this setPosWorld [7404.19,17905.4,173.074];
	_this setVectorDirAndUp [[0.019849,0.999803,0.000899795],[-0.0452855,0,0.998974]];
	_this allowdamage false;;
};

private _item1043 = objNull;
if (_layerRoot) then {
	_item1043 = createVehicle ["Land_vn_t_cyathea_f",[7407.07,17833.6,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1043;
	_objects pushback _this;
	_objectIDs pushback 1043;
	_this setPosWorld [7407.07,17833.6,173.288];
	_this setVectorDirAndUp [[0.454186,-0.89061,0.0229919],[-0.0479448,0.00133568,0.998849]];
	_this allowdamage false;;
};

private _item1044 = objNull;
if (_layerRoot) then {
	_item1044 = createVehicle ["Land_vn_t_cyathea_f",[7300.39,17863.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1044;
	_objects pushback _this;
	_objectIDs pushback 1044;
	_this setPosWorld [7300.39,17863.2,168.398];
	_this setVectorDirAndUp [[0.953428,-0.299466,0.0359941],[-0.0373063,0.00133628,0.999303]];
	_this allowdamage false;;
};

private _item1046 = objNull;
if (_layerRoot) then {
	_item1046 = createVehicle ["Land_vn_t_ficus_medium_f",[7424.12,17845.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1046;
	_objects pushback _this;
	_objectIDs pushback 1046;
	_this setPosWorld [7424.12,17845.8,182.261];
	_this setVectorDirAndUp [[0.963083,0.254765,0.0869797],[-0.0902971,0.00133175,0.995914]];
	_this allowdamage false;;
};

private _item1047 = objNull;
if (_layerRoot) then {
	_item1047 = createVehicle ["Land_vn_t_ficus_medium_f",[7407.47,17961.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1047;
	_objects pushback _this;
	_objectIDs pushback 1047;
	_this setPosWorld [7407.47,17961.8,179.956];
	_this setVectorDirAndUp [[0.504337,0.863435,0.0111585],[-0.042629,0.0119891,0.999019]];
	_this allowdamage false;;
};

private _item1048 = objNull;
if (_layerRoot) then {
	_item1048 = createVehicle ["Land_vn_barracks_04",[7374.3,17885.2,0.572296],[],0,"CAN_COLLIDE"];
	_this = _item1048;
	_objects pushback _this;
	_objectIDs pushback 1048;
	_this setPosWorld [7374.3,17885.2,171.595];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item1049 = objNull;
if (_layerRoot) then {
	_item1049 = createVehicle ["Land_vn_barracks_04_01",[7362.07,17885.2,0.560837],[],0,"CAN_COLLIDE"];
	_this = _item1049;
	_objects pushback _this;
	_objectIDs pushback 1049;
	_this setPosWorld [7362.07,17885.2,170.899];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item1050 = objNull;
if (_layerRoot) then {
	_item1050 = createVehicle ["Land_vn_barracks_04_02",[7386.49,17885.3,0.471512],[],0,"CAN_COLLIDE"];
	_this = _item1050;
	_objects pushback _this;
	_objectIDs pushback 1050;
	_this setPosWorld [7386.49,17885.3,172.15];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item1051 = objNull;
if (_layerRoot) then {
	_item1051 = createVehicle ["Land_vn_usaf_revetment_helipad_02",[7394.32,17925.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1051;
	_objects pushback _this;
	_objectIDs pushback 1051;
	_this setPosWorld [7394.32,17925.1,170.95];
	_this setVectorDirAndUp [[-0.430028,-0.902793,0.006351],[-0.043955,0.0279624,0.998642]];
};

private _item1055 = objNull;
if (_layerRoot) then {
	_item1055 = createVehicle ["Land_vn_quonset_02_01",[7385.1,17912.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1055;
	_objects pushback _this;
	_objectIDs pushback 1055;
	_this setPosWorld [7385.1,17912.7,170.716];
	_this setVectorDirAndUp [[0.902631,-0.430415,0],[0,0,1]];
};

private _item1056 = objNull;
if (_layerRoot) then {
	_item1056 = createVehicle ["Land_vn_usaf_revetment_helipad_02",[7358.7,17928.9,0],[],0,"CAN_COLLIDE"];
	_this = _item1056;
	_objects pushback _this;
	_objectIDs pushback 1056;
	_this setPosWorld [7358.7,17928.9,169.243];
	_this setVectorDirAndUp [[0.431798,0.901959,-0.0044729],[-0.0452855,0.026632,0.998619]];
};

private _item1057 = objNull;
if (_layerRoot) then {
	_item1057 = createVehicle ["Land_vn_quonset_02_01",[7367.95,17941.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1057;
	_objects pushback _this;
	_objectIDs pushback 1057;
	_this setPosWorld [7367.95,17941.3,169.226];
	_this setVectorDirAndUp [[-0.901772,0.432213,0],[0,0,1]];
};

private _item1058 = objNull;
if (_layerRoot) then {
	_item1058 = createVehicle ["Land_vn_b_trench_bunker_01_02",[7377.42,17856.9,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1058;
	_objects pushback _this;
	_objectIDs pushback 1058;
	_this setPosWorld [7377.42,17856.9,169.551];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
};

private _item1059 = objNull;
if (_layerRoot) then {
	_item1059 = createVehicle ["Land_vn_b_trench_bunker_02_04",[7368.13,17837.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1059;
	_objects pushback _this;
	_objectIDs pushback 1059;
	_this setPosWorld [7368.13,17837.2,169.244];
	_this setVectorDirAndUp [[0.997954,0.0639422,0],[0,0,1]];
};

private _item1060 = objNull;
if (_layerRoot) then {
	_item1060 = createVehicle ["Land_vn_b_trench_bunker_01_01",[7340.23,17933.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1060;
	_objects pushback _this;
	_objectIDs pushback 1060;
	_this setPosWorld [7340.23,17933.7,167.926];
	_this setVectorDirAndUp [[-0.902615,0.430448,0],[0,0,1]];
};

private _item1061 = objNull;
if (_layerRoot) then {
	_item1061 = createVehicle ["Land_vn_b_trench_45_01",[7301.93,17835.1,0.0746155],[],0,"CAN_COLLIDE"];
	_this = _item1061;
	_objects pushback _this;
	_objectIDs pushback 1061;
	_this setPosWorld [7301.93,17835.1,165.628];
	_this setVectorDirAndUp [[0.775088,-0.627904,-0.0705335],[0.0771098,-0.0167965,0.996881]];
};

private _item1062 = objNull;
if (_layerRoot) then {
	_item1062 = createVehicle ["Land_vn_b_trench_45_02",[7301,17937.9,0.512909],[],0,"CAN_COLLIDE"];
	_this = _item1062;
	_objects pushback _this;
	_objectIDs pushback 1062;
	_this setPosWorld [7301,17937.9,165.508];
	_this setVectorDirAndUp [[0.370485,-0.928835,-0.00259829],[0.0200218,0.00518936,0.999786]];
};

private _item1063 = objNull;
if (_layerRoot) then {
	_item1063 = createVehicle ["Land_vn_b_trench_45_01",[7317.08,17940.9,0.136826],[],0,"CAN_COLLIDE"];
	_this = _item1063;
	_objects pushback _this;
	_objectIDs pushback 1063;
	_this setPosWorld [7317.08,17940.9,165.56];
	_this setVectorDirAndUp [[0.0837745,0.994666,0.0601834],[4.32173e-005,-0.0603993,0.998174]];
};

private _item1064 = objNull;
if (_layerRoot) then {
	_item1064 = createVehicle ["Land_vn_b_trench_45_02",[7372.83,17798.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1064;
	_objects pushback _this;
	_objectIDs pushback 1064;
	_this setPosWorld [7372.83,17798.3,168.081];
	_this setVectorDirAndUp [[-0.163745,0.986192,-0.0247747],[-0.0907867,0.00994257,0.995821]];
};

private _item1065 = objNull;
if (_layerRoot) then {
	_item1065 = createVehicle ["Land_vn_b_trench_45_02",[7379.49,17806.8,0],[],0,"CAN_COLLIDE"];
	_this = _item1065;
	_objects pushback _this;
	_objectIDs pushback 1065;
	_this setPosWorld [7379.49,17806.8,168.635];
	_this setVectorDirAndUp [[-0.818996,0.573264,-0.024775],[-0.0234382,0.00971844,0.999678]];
};

private _item1066 = objNull;
if (_layerRoot) then {
	_item1066 = createVehicle ["Land_vn_b_trench_20_02",[7393.33,17838.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1066;
	_objects pushback _this;
	_objectIDs pushback 1066;
	_this setPosWorld [7393.33,17838.4,169.554];
	_this setVectorDirAndUp [[0.968188,-0.240132,0.070351],[-0.0718131,0.00266752,0.997415]];
};

private _item1067 = objNull;
if (_layerRoot) then {
	_item1067 = createVehicle ["Land_vn_b_trench_45_01",[7394,17853.7,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1067;
	_objects pushback _this;
	_objectIDs pushback 1067;
	_this setPosWorld [7394,17853.7,169.548];
	_this setVectorDirAndUp [[0.561368,-0.826224,0.0471198],[-0.0610532,0.0154353,0.998015]];
};

private _item1068 = objNull;
if (_layerRoot) then {
	_item1068 = createVehicle ["Land_vn_b_trench_90_01",[7353.57,17977.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1068;
	_objects pushback _this;
	_objectIDs pushback 1068;
	_this setPosWorld [7353.57,17977.4,166.882];
	_this setVectorDirAndUp [[-0.316864,-0.948471,-1.69128e-006],[-0.0498432,0.0166497,0.998618]];
};

private _item1069 = objNull;
if (_layerRoot) then {
	_item1069 = createVehicle ["Land_vn_b_trench_20_02",[7424.19,17913.1,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1069;
	_objects pushback _this;
	_objectIDs pushback 1069;
	_this setPosWorld [7424.19,17913.1,170.91];
	_this setVectorDirAndUp [[0.753346,-0.65628,0.0420278],[-0.0452881,0.0119827,0.998902]];
};

private _item1070 = objNull;
if (_layerRoot) then {
	_item1070 = createVehicle ["Land_vn_b_trench_20_01",[7408.43,17900.7,0],[],0,"CAN_COLLIDE"];
	_this = _item1070;
	_objects pushback _this;
	_objectIDs pushback 1070;
	_this setPosWorld [7408.43,17900.7,170.28];
	_this setVectorDirAndUp [[-0.75403,0.65684,-2.79676e-006],[-0.0116504,-0.01337,0.999843]];
};

private _item1071 = objNull;
if (_layerRoot) then {
	_item1071 = createVehicle ["Land_vn_b_trench_45_01",[7399.56,17889.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1071;
	_objects pushback _this;
	_objectIDs pushback 1071;
	_this setPosWorld [7399.56,17889.2,169.859];
	_this setVectorDirAndUp [[0.726366,-0.687095,0.0171018],[-0.0457783,-0.0235378,0.998674]];
};

private _item1072 = objNull;
if (_layerRoot) then {
	_item1072 = createVehicle ["Land_vn_b_trench_45_02",[7404.12,17878.4,0],[],0,"CAN_COLLIDE"];
	_this = _item1072;
	_objects pushback _this;
	_objectIDs pushback 1072;
	_this setPosWorld [7404.12,17878.4,170.085];
	_this setVectorDirAndUp [[-0.998181,-0.0574763,-0.0181728],[-0.019158,0.0166369,0.999678]];
};

private _item1073 = objNull;
if (_layerRoot) then {
	_item1073 = createVehicle ["Land_vn_b_trench_revetment_tall_09",[7392.7,17901.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1073;
	_objects pushback _this;
	_objectIDs pushback 1073;
	_this setPosWorld [7392.7,17901.5,170.723];
	_this setVectorDirAndUp [[0.378651,0.925539,5.02914e-008],[-0.0324592,0.0132795,0.999385]];
};

private _item1074 = objNull;
if (_layerRoot) then {
	_item1074 = createVehicle ["Land_vn_b_trench_revetment_tall_09",[7380.87,17906.5,0],[],0,"CAN_COLLIDE"];
	_this = _item1074;
	_objects pushback _this;
	_objectIDs pushback 1074;
	_this setPosWorld [7380.87,17906.5,170.19];
	_this setVectorDirAndUp [[0.378651,0.92554,5.58794e-009],[-0.025514,0.0104381,0.99962]];
};

private _item1075 = objNull;
if (_layerRoot) then {
	_item1075 = createVehicle ["Land_vn_b_trench_revetment_tall_09",[7368.75,17911.6,0],[],0,"CAN_COLLIDE"];
	_this = _item1075;
	_objects pushback _this;
	_objectIDs pushback 1075;
	_this setPosWorld [7368.75,17911.6,169.623];
	_this setVectorDirAndUp [[0.378651,0.92554,-7.45058e-009],[-0.0381953,0.0156262,0.999148]];
};

private _item1076 = objNull;
if (_layerRoot) then {
	_item1076 = createVehicle ["Land_vn_b_trench_revetment_tall_09",[7355.54,17917.1,0],[],0,"CAN_COLLIDE"];
	_this = _item1076;
	_objects pushback _this;
	_objectIDs pushback 1076;
	_this setPosWorld [7355.54,17917.1,168.926];
	_this setVectorDirAndUp [[0.378651,0.92554,9.31323e-010],[-0.0408879,0.0167278,0.999024]];
};

private _item1077 = objNull;
if (_layerRoot) then {
	_item1077 = createVehicle ["Land_vn_b_tower_01",[7401.11,17875.9,1.52588e-005],[],0,"CAN_COLLIDE"];
	_this = _item1077;
	_objects pushback _this;
	_objectIDs pushback 1077;
	_this setPosWorld [7401.11,17875.9,172.761];
	_this setVectorDirAndUp [[0.998122,0.0612558,0.000366557],[-0.0003238,-0.000707928,1]];
};

private _item1078 = objNull;
if (_layerRoot) then {
	_item1078 = createVehicle ["Land_vn_b_trench_bunker_06_02",[7305.29,17930.6,0.282501],[],0,"CAN_COLLIDE"];
	_this = _item1078;
	_objects pushback _this;
	_objectIDs pushback 1078;
	_this setPosWorld [7305.29,17930.6,165.904];
	_this setVectorDirAndUp [[-0.714423,-0.699714,0],[0,0,1]];
};

private _item1079 = objNull;
if (_layerRoot) then {
	_item1079 = createVehicle ["Land_vn_b_trench_bunker_06_01",[7315.36,17934.3,0],[],0,"CAN_COLLIDE"];
	_this = _item1079;
	_objects pushback _this;
	_objectIDs pushback 1079;
	_this setPosWorld [7315.36,17934.3,165.922];
	_this setVectorDirAndUp [[0.11947,-0.992838,0],[0,0,1]];
};

private _item1080 = objNull;
if (_layerRoot) then {
	_item1080 = createVehicle ["Land_vn_b_trench_bunker_06_01",[7367.29,17970.2,0],[],0,"CAN_COLLIDE"];
	_this = _item1080;
	_objects pushback _this;
	_objectIDs pushback 1080;
	_this setPosWorld [7367.29,17970.2,167.932];
	_this setVectorDirAndUp [[-0.397669,0.917529,0],[0,0,1]];
};

private _item1081 = objNull;
if (_layerRoot) then {
	_item1081 = createVehicle ["Land_vn_b_trench_bunker_06_02",[7356.28,17967.3,0.282471],[],0,"CAN_COLLIDE"];
	_this = _item1081;
	_objects pushback _this;
	_objectIDs pushback 1081;
	_this setPosWorld [7356.28,17967.3,167.726];
	_this setVectorDirAndUp [[0.479602,0.877486,0],[0,0,1]];
};

private _item1082 = objNull;
if (_layerRoot) then {
	_item1082 = createVehicle ["Land_vn_b_tower_01",[7382.51,17964,0],[],0,"CAN_COLLIDE"];
	_this = _item1082;
	_objects pushback _this;
	_objectIDs pushback 1082;
	_this setPosWorld [7382.51,17964,171.02];
	_this setVectorDirAndUp [[0.444391,0.895832,0.000778079],[-0.0003238,-0.000707928,1]];
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
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item1) then {
		this = _item1;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item2) then {
		this = _item2;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item3) then {
		this = _item3;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item4) then {
		this = _item4;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item5) then {
		this = _item5;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item6) then {
		this = _item6;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item7) then {
		this = _item7;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item8) then {
		this = _item8;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item9) then {
		this = _item9;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item10) then {
		this = _item10;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item11) then {
		this = _item11;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item12) then {
		this = _item12;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item13) then {
		this = _item13;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item14) then {
		this = _item14;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item15) then {
		this = _item15;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item16) then {
		this = _item16;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item17) then {
		this = _item17;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item18) then {
		this = _item18;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item19) then {
		this = _item19;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item20) then {
		this = _item20;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item21) then {
		this = _item21;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item22) then {
		this = _item22;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item23) then {
		this = _item23;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item24) then {
		this = _item24;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item25) then {
		this = _item25;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item26) then {
		this = _item26;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item27) then {
		this = _item27;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item28) then {
		this = _item28;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item29) then {
		this = _item29;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item30) then {
		this = _item30;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item31) then {
		this = _item31;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item32) then {
		this = _item32;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item33) then {
		this = _item33;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item34) then {
		this = _item34;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item35) then {
		this = _item35;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item37) then {
		this = _item37;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item38) then {
		this = _item38;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item39) then {
		this = _item39;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item40) then {
		this = _item40;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item41) then {
		this = _item41;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item42) then {
		this = _item42;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item43) then {
		this = _item43;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item44) then {
		this = _item44;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item45) then {
		this = _item45;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item46) then {
		this = _item46;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item47) then {
		this = _item47;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item48) then {
		this = _item48;
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
	if !(isnull _item55) then {
		this = _item55;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item56) then {
		this = _item56;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item57) then {
		this = _item57;
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
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item62) then {
		this = _item62;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item63) then {
		this = _item63;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item64) then {
		this = _item64;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item65) then {
		this = _item65;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item66) then {
		this = _item66;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item67) then {
		this = _item67;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item68) then {
		this = _item68;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item69) then {
		this = _item69;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item70) then {
		this = _item70;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item71) then {
		this = _item71;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item72) then {
		this = _item72;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item73) then {
		this = _item73;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item74) then {
		this = _item74;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item75) then {
		this = _item75;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item76) then {
		this = _item76;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item77) then {
		this = _item77;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item78) then {
		this = _item78;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item79) then {
		this = _item79;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item80) then {
		this = _item80;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item81) then {
		this = _item81;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item82) then {
		this = _item82;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item83) then {
		this = _item83;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item84) then {
		this = _item84;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item85) then {
		this = _item85;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item86) then {
		this = _item86;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item87) then {
		this = _item87;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item88) then {
		this = _item88;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item89) then {
		this = _item89;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item90) then {
		this = _item90;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item91) then {
		this = _item91;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item92) then {
		this = _item92;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item93) then {
		this = _item93;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item94) then {
		this = _item94;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item95) then {
		this = _item95;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item96) then {
		this = _item96;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item97) then {
		this = _item97;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item98) then {
		this = _item98;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item99) then {
		this = _item99;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item100) then {
		this = _item100;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item101) then {
		this = _item101;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item102) then {
		this = _item102;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item103) then {
		this = _item103;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item104) then {
		this = _item104;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item105) then {
		this = _item105;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item106) then {
		this = _item106;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item107) then {
		this = _item107;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item108) then {
		this = _item108;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item109) then {
		this = _item109;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item110) then {
		this = _item110;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item111) then {
		this = _item111;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item112) then {
		this = _item112;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item113) then {
		this = _item113;
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
	if !(isnull _item238) then {
		this = _item238;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item239) then {
		this = _item239;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item255) then {
		this = _item255;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item256) then {
		this = _item256;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item307) then {
		this = _item307;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item308) then {
		this = _item308;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item309) then {
		this = _item309;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item310) then {
		this = _item310;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item311) then {
		this = _item311;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item312) then {
		this = _item312;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item313) then {
		this = _item313;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
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
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item323) then {
		this = _item323;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item324) then {
		this = _item324;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item325) then {
		this = _item325;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item326) then {
		this = _item326;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item327) then {
		this = _item327;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item328) then {
		this = _item328;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item329) then {
		this = _item329;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item375) then {
		this = _item375;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item376) then {
		this = _item376;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item377) then {
		this = _item377;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item378) then {
		this = _item378;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item379) then {
		this = _item379;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item380) then {
		this = _item380;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item381) then {
		this = _item381;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
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
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
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
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item427) then {
		this = _item427;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item428) then {
		this = _item428;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item429) then {
		this = _item429;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item430) then {
		this = _item430;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item431) then {
		this = _item431;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item432) then {
		this = _item432;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item433) then {
		this = _item433;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item434) then {
		this = _item434;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item435) then {
		this = _item435;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item436) then {
		this = _item436;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item437) then {
		this = _item437;
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
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];
this enableWeaponDisassembly false;;
	};
	if !(isnull _item443) then {
		this = _item443;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item444) then {
		this = _item444;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item445) then {
		this = _item445;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item446) then {
		this = _item446;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item447) then {
		this = _item447;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item448) then {
		this = _item448;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item449) then {
		this = _item449;
		WMS_AMS_StaticPos_4 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item480) then {
		this = _item480;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item481) then {
		this = _item481;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item482) then {
		this = _item482;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item581) then {
		this = _item581;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item582) then {
		this = _item582;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item583) then {
		this = _item583;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item584) then {
		this = _item584;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item585) then {
		this = _item585;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item586) then {
		this = _item586;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item587) then {
		this = _item587;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item588) then {
		this = _item588;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item589) then {
		this = _item589;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item590) then {
		this = _item590;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item591) then {
		this = _item591;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item592) then {
		this = _item592;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item593) then {
		this = _item593;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item594) then {
		this = _item594;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item595) then {
		this = _item595;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item596) then {
		this = _item596;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item597) then {
		this = _item597;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item598) then {
		this = _item598;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item599) then {
		this = _item599;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item600) then {
		this = _item600;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item601) then {
		this = _item601;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item602) then {
		this = _item602;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item603) then {
		this = _item603;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item604) then {
		this = _item604;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item605) then {
		this = _item605;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item606) then {
		this = _item606;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item607) then {
		this = _item607;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item608) then {
		this = _item608;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item609) then {
		this = _item609;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item610) then {
		this = _item610;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item611) then {
		this = _item611;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item612) then {
		this = _item612;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item613) then {
		this = _item613;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item635) then {
		this = _item635;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item636) then {
		this = _item636;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item637) then {
		this = _item637;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item638) then {
		this = _item638;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item639) then {
		this = _item639;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item640) then {
		this = _item640;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item641) then {
		this = _item641;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item642) then {
		this = _item642;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item643) then {
		this = _item643;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item644) then {
		this = _item644;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item645) then {
		this = _item645;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item647) then {
		this = _item647;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item648) then {
		this = _item648;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item649) then {
		this = _item649;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item650) then {
		this = _item650;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item651) then {
		this = _item651;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item652) then {
		this = _item652;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item653) then {
		this = _item653;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item654) then {
		this = _item654;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item655) then {
		this = _item655;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item656) then {
		this = _item656;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item657) then {
		this = _item657;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item658) then {
		this = _item658;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item659) then {
		this = _item659;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item660) then {
		this = _item660;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item661) then {
		this = _item661;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item662) then {
		this = _item662;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item685) then {
		this = _item685;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item686) then {
		this = _item686;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item687) then {
		this = _item687;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item688) then {
		this = _item688;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item689) then {
		this = _item689;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item690) then {
		this = _item690;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item691) then {
		this = _item691;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item692) then {
		this = _item692;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item693) then {
		this = _item693;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item694) then {
		this = _item694;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item695) then {
		this = _item695;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item696) then {
		this = _item696;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item697) then {
		this = _item697;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item698) then {
		this = _item698;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item699) then {
		this = _item699;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item700) then {
		this = _item700;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item701) then {
		this = _item701;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item702) then {
		this = _item702;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item703) then {
		this = _item703;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item704) then {
		this = _item704;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item705) then {
		this = _item705;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item706) then {
		this = _item706;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item707) then {
		this = _item707;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item708) then {
		this = _item708;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item709) then {
		this = _item709;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item710) then {
		this = _item710;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item711) then {
		this = _item711;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item712) then {
		this = _item712;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item713) then {
		this = _item713;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item714) then {
		this = _item714;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item821) then {
		this = _item821;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item822) then {
		this = _item822;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item823) then {
		this = _item823;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item824) then {
		this = _item824;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item826) then {
		this = _item826;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item827) then {
		this = _item827;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item828) then {
		this = _item828;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item829) then {
		this = _item829;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item830) then {
		this = _item830;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item831) then {
		this = _item831;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item832) then {
		this = _item832;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item833) then {
		this = _item833;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item834) then {
		this = _item834;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item835) then {
		this = _item835;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item836) then {
		this = _item836;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item837) then {
		this = _item837;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item838) then {
		this = _item838;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item839) then {
		this = _item839;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item840) then {
		this = _item840;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item841) then {
		this = _item841;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item842) then {
		this = _item842;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item843) then {
		this = _item843;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item844) then {
		this = _item844;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item845) then {
		this = _item845;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item846) then {
		this = _item846;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item847) then {
		this = _item847;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item848) then {
		this = _item848;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item849) then {
		this = _item849;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item850) then {
		this = _item850;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item851) then {
		this = _item851;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item852) then {
		this = _item852;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item853) then {
		this = _item853;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item874) then {
		this = _item874;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item875) then {
		this = _item875;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item876) then {
		this = _item876;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item877) then {
		this = _item877;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item878) then {
		this = _item878;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item879) then {
		this = _item879;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item880) then {
		this = _item880;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item881) then {
		this = _item881;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item882) then {
		this = _item882;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item883) then {
		this = _item883;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item884) then {
		this = _item884;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item885) then {
		this = _item885;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item886) then {
		this = _item886;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item887) then {
		this = _item887;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item888) then {
		this = _item888;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item889) then {
		this = _item889;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item890) then {
		this = _item890;
		WMS_AMS_StaticPos_3 pushBack position this;
this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item891) then {
		this = _item891;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item892) then {
		this = _item892;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item893) then {
		this = _item893;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item894) then {
		this = _item894;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item895) then {
		this = _item895;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item896) then {
		this = _item896;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item897) then {
		this = _item897;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item898) then {
		this = _item898;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item899) then {
		this = _item899;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item921) then {
		this = _item921;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item922) then {
		this = _item922;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item923) then {
		this = _item923;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item924) then {
		this = _item924;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item925) then {
		this = _item925;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item926) then {
		this = _item926;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item927) then {
		this = _item927;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item928) then {
		this = _item928;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item929) then {
		this = _item929;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item930) then {
		this = _item930;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item931) then {
		this = _item931;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item932) then {
		this = _item932;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item933) then {
		this = _item933;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item934) then {
		this = _item934;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item935) then {
		this = _item935;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item936) then {
		this = _item936;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item937) then {
		this = _item937;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item938) then {
		this = _item938;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item939) then {
		this = _item939;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item940) then {
		this = _item940;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item941) then {
		this = _item941;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item942) then {
		this = _item942;
		this setVariable ["WMS_AMS_StaticOBJ", true];
this lock 3;
this enableRopeAttach false;
[this, this] call ace_common_fnc_claim; 
this setVariable ['vn_log_enablePickup', false];;
	};
	if !(isnull _item943) then {
		this = _item943;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item944) then {
		this = _item944;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item945) then {
		this = _item945;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item946) then {
		this = _item946;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item947) then {
		this = _item947;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item948) then {
		this = _item948;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item949) then {
		this = _item949;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
	if !(isnull _item950) then {
		this = _item950;
		this setVariable ["WMS_AMS_StaticOBJ", true];;
	};
};


///////////////////////////////////////////////////////////////////////////////////////////
// Module activations (only once everything is spawned and connected)


///////////////////////////////////////////////////////////////////////////////////////////
[[_objects,_groups,_triggers,_waypoints,_logics,_markers],[_objectIDs,_groupIDs,_triggerIDs,_waypointIDs,_logicIDs,_markerIDs]]
