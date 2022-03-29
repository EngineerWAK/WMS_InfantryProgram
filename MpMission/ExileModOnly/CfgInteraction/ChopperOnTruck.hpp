class UK3CB_BAF_MAN_HX58_Cargo_Green_A 
	{
		targetType = 2;
		target = "UK3CB_BAF_MAN_HX58_Cargo_Green_A";

		class Actions
		{
			class HX58_load_LYNX: ExileAbstractAction
			{
				title = "Load the Lynx";
				condition =  "if (isNil (_this select 0) getVariable 'WAK_MAN_Loaded';) then {(_this select 0) setVariable ['WAK_MAN_Loaded', false];} else {}; && (count ((_this select 0) nearObjects ['R3F_LYNX_CE', 15]) == 1) && ((_this select 0) getvariable ['WAK_MAN_Loaded',false];)";
				action = "(((_this select 0) nearObjects ['R3F_LYNX_CE', 15]) select 0) attachTo [_truck, [0,-0.3,0.6]]; (_this select 0) setvariable ['WAK_MAN_Loaded',true, true];";
			};
			class HX58_unload_LYNX: ExileAbstractAction
			{
				title = "UNload the Lynx";
				condition =  "((_this select 0) getvariable ['WAK_MAN_Loaded',true];)";
				action = "private _choppa = ((attachedObjects (_this select 0)) select 0); _choppa attachTo [attachedTo _choppa, [0,-7.5,0.6]]; _choppa attachTo [attachedTo _choppa, [0,-7.5,-0.9]]; detach _choppa; (_this select 0) setvariable ['WAK_MAN_Loaded',false, true];";
			};
			class HX58_load_HellCat: ExileAbstractAction
			{
				title = "Load the HellCat";
				//condition =  "(count ((_this select 0) nearObjects ['Exile_Chopper_Hellcat_Green', 15]) == 1) && ((_this select 0) getvariable ['WAK_MAN_Loaded',false];)";
				condition =  "(count ((_this select 0) nearObjects ['Exile_Chopper_Hellcat_Green', 15]) == 1);";
				action = "(((_this select 0) nearObjects ['Exile_Chopper_Hellcat_Green', 15]) select 0) attachTo [_truck, [0,-0.3,0.6]]; (_this select 0) setvariable ['WAK_MAN_Loaded',true, true];";
			};
			class HX58_unload_HellCat: ExileAbstractAction
			{
				title = "UNload the HellCat";
				//condition =  "((_this select 0) getvariable ['WAK_MAN_Loaded',true];)";
				condition =  "true";
				action = "private _choppa = ((attachedObjects (_this select 0)) select 0); _choppa attachTo [attachedTo _choppa, [0,-7.5,0.6]]; _choppa attachTo [attachedTo _choppa, [0,-7.5,-0.9]]; detach _choppa; (_this select 0) setvariable ['WAK_MAN_Loaded',false, true];";
			};
	
		};
	};
	