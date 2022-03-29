class tank {
        targetType = 2;
        target = "Tank";

        class Actions {

            class Lock: ExileAbstractAction {
                title = "Lock";
                condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
                action = "true spawn ExileClient_object_lock_toggle";
            };

            class Unlock: ExileAbstractAction {
                title = "Unlock";
                condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
                action = "false spawn ExileClient_object_lock_toggle";
            };
			// Repairs a vehicle to 100%. Requires ToolKit
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

            class Flip: ExileAbstractAction {
                title = "Flip";
                condition = "call ExileClient_object_vehicle_interaction_show";
                action = "_this call Exileclient_object_vehicle_flip";
            };

            class Refuel: ExileAbstractAction {
                title = "Refuel";
                condition = "call ExileClient_object_vehicle_interaction_show";
                action = "_this call ExileClient_object_vehicle_refuel";
            };

            class DrainFuel: ExileAbstractAction {
                title = "Drain Fuel";
                condition = "call ExileClient_object_vehicle_interaction_show";
                action = "_this call ExileClient_object_vehicle_drain";
            };

			class MakeBoom : ExileAbstractAction
			{
				title = "Plant charge";
				condition = "call ExileClient_system_breaching_condition";
				action = "_this call ExileClient_system_breaching_action";
			};
        };
    };