require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTRatlingGunnerWindUpAction = class(BTRatlingGunnerWindUpAction, BTNode)
BTRatlingGunnerWindUpAction.name = "BTRatlingGunnerWindUpAction"
BTRatlingGunnerWindUpAction.init = function (self, ...)
	BTRatlingGunnerWindUpAction.super.init(self, ...)

	return 
end
BTRatlingGunnerWindUpAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local data = blackboard.attack_pattern_data or {}
	local target_unit, node_name, old_target_visible = PerceptionUtils.pick_ratling_gun_target(unit, blackboard)

	if target_unit then
		data.target_unit = target_unit
		data.target_node_name = node_name
		data.last_known_target_position = data.last_known_target_position or Vector3Box()
		data.last_known_unit_position = data.last_known_unit_position or Vector3Box()
		local unit_position = Unit.world_position(unit, Unit.node(unit, "c_spine"))
		local target_position = Unit.world_position(target_unit, Unit.node(target_unit, node_name))

		data.last_known_target_position:store(target_position)
		data.last_known_unit_position:store(unit_position)

		data.target_obscured = false
		data.target_check = t + 0.05 + Math.random()*0.025
	else
		data.abort_windup = true
		blackboard.attack_pattern_data = data
		blackboard.action = action

		return 
	end

	data.wind_up_timer = AiUtils.random(action.wind_up_time[1], action.wind_up_time[2])
	data.wind_up_time = data.wind_up_timer
	data.constraint_target = data.constraint_target or Unit.animation_find_constraint_target(unit, "aim_target")
	blackboard.attack_pattern_data = data
	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	blackboard.move_state = "attacking"

	AiUtils.anim_event(unit, data, "wind_up_start")

	if script_data.ai_ratling_gunner_debug then
		AiUtils.temp_anim_event(unit, "wind_up_start")
	end

	local inventory_template = blackboard.breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")
	local ratling_gun_unit = inventory_extension.get_unit(inventory_extension, inventory_template)
	data.ratling_gun_unit = ratling_gun_unit
	local ai_navigation = blackboard.navigation_extension

	ai_navigation.set_max_speed(ai_navigation, blackboard.breed.walk_speed)

	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id)

	return 
end
BTRatlingGunnerWindUpAction._update_target = function (self, unit, blackboard, data, t)
	local target_unit, node_name, old_target_visible = PerceptionUtils.pick_ratling_gun_target(unit, blackboard)

	if target_unit then
		data.target_unit = target_unit
		data.target_node_name = node_name
		local unit_position = Unit.world_position(unit, Unit.node(unit, "c_spine"))
		local target_position = Unit.world_position(target_unit, Unit.node(target_unit, node_name))

		data.last_known_target_position:store(target_position)
		data.last_known_unit_position:store(unit_position)

		data.target_obscured = false
	elseif old_target_visible then
		target_unit = data.target_unit
		local unit_position = Unit.world_position(unit, Unit.node(unit, "c_spine"))
		local target_position = Unit.world_position(target_unit, Unit.node(target_unit, node_name))

		data.last_known_target_position:store(target_position)
		data.last_known_unit_position:store(unit_position)

		data.target_obscured = false
	else
		data.target_obscured = true
	end

	if data.target_obscured then
		data.target_check = t + 0.5 + Math.random()*0.25
	else
		data.target_check = t + 0.1 + Math.random()*0.05
	end

	return 
end
BTRatlingGunnerWindUpAction.leave = function (self, unit, blackboard, t, reason, destroy)
	AiUtils.clear_temp_anim_event(unit)

	blackboard.anim_cb_attack_windup_start_finished = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_enabled(navigation_extension, true)
	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	local data = blackboard.attack_pattern_data or {}

	AiUtils.clear_anim_event(data)

	return 
end
BTRatlingGunnerWindUpAction.run = function (self, unit, blackboard, t, dt)
	local data = blackboard.attack_pattern_data

	if data.abort_windup then
		data.abort_windup = nil

		return "failed"
	end

	if not blackboard.first_shots_fired then
		self._update_target(self, unit, blackboard, data, t)

		return "done"
	end

	data.wind_up_timer = data.wind_up_timer - dt

	if data.target_check < t then
		self._update_target(self, unit, blackboard, data, t)
	end

	local windup_start_finished = blackboard.anim_cb_attack_windup_start_finished

	if not windup_start_finished then
		return "running"
	end

	AiUtils.anim_event(unit, data, "wind_up_loop")

	if script_data.ai_ratling_gunner_debug then
		AiUtils.temp_anim_event(unit, "wind_up_loop", data.wind_up_timer)
	end

	if data.wind_up_timer < 0 then
		return "done"
	end

	return "running"
end

return 
