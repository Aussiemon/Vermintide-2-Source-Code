require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTLootRatAlertedAction = class(BTLootRatAlertedAction, BTNode)

BTLootRatAlertedAction.init = function (self, ...)
	BTLootRatAlertedAction.super.init(self, ...)
end

BTLootRatAlertedAction.name = "BTLootRatAlertedAction"

BTLootRatAlertedAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.move_animation_name = nil
	blackboard.anim_cb_rotation_start = false
	blackboard.anim_cb_move = false

	if blackboard.confirmed_player_sighting == nil then
		self:init_alerted(unit, blackboard)
	end

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

BTLootRatAlertedAction.init_alerted = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	if script_data.enable_alert_icon then
		local category_name = "detect"
		local head_node = Unit.node(unit, "c_head")
		local viewport_name = "player_1"
		local color_vector = Vector3(255, 0, 0)
		local offset_vector = Vector3(0, 0, 1)
		local text_size = 0.5
		local debug_start_string = "!"

		Managers.state.debug_text:output_unit_text(debug_start_string, text_size, unit, head_node, offset_vector, nil, category_name, color_vector, viewport_name)
		network_manager.network_transmit:send_rpc_clients("rpc_enemy_is_alerted", unit_id, true)
	end

	local animation_name = "alerted"

	network_manager:anim_event(unit, animation_name)

	blackboard.move_animation_name = animation_name

	if ScriptUnit.has_extension(unit, "ai_inventory_system") then
		network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
	end
end

BTLootRatAlertedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if script_data.enable_alert_icon then
		local category_name = "detect"

		Managers.state.debug_text:clear_unit_text(unit, category_name)

		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_enemy_is_alerted", unit_id, false)
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:use_lerp_rotation(true)
	LocomotionUtils.set_animation_driven_movement(unit, false)
	LocomotionUtils.set_animation_rotation_scale(unit, 1)
	blackboard.navigation_extension:set_enabled(true)
	AiUtils.activate_unit(blackboard)

	blackboard.spawn_to_running = true
	blackboard.update_timer = 0
end

BTLootRatAlertedAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.confirmed_player_sighting then
		return "done"
	end

	if blackboard.anim_cb_move then
		blackboard.anim_cb_move = false
		blackboard.move_state = "moving"
		blackboard.anim_locked = 0

		return "done"
	else
		return "running"
	end
end

return
