require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTransformAction = class(BTTransformAction, BTNode)

BTTransformAction.init = function (self, ...)
	BTTransformAction.super.init(self, ...)
end

BTTransformAction.name = "BTTransformAction"

BTTransformAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.active_node = BTTransformAction
	local action = blackboard.action
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")

	local transform_animation = action.transform_animation

	if transform_animation then
		network_manager:anim_event(unit, transform_animation)
	else
		blackboard.transform_anim_finished = true
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)
	navigation_extension:set_max_speed(0)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))

	local enemy_package_loader = Managers.state.game_mode.level_transition_handler.enemy_package_loader

	if not enemy_package_loader.breed_processed[action.wanted_breed_transform] then
		enemy_package_loader:request_breed(action.wanted_breed_transform, true)
	end
end

BTTransformAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTTransformAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.transform_anim_finished and not blackboard.has_transformed then
		self:transform(unit, blackboard)

		return "done"
	end

	return "running"
end

BTTransformAction.anim_cb_transform_finished = function (self, unit, blackboard)
	blackboard.transform_anim_finished = true
end

BTTransformAction.transform = function (self, unit, blackboard)
	local action = blackboard.action
	local transfer_health_percentage = action.transfer_health_percentage
	local optional_data = {
		original_hp_percentage = ScriptUnit.extension(unit, "health_system"):current_health_percent(),
		spawned_func = function (transformed_unit, breed, optional_data)
			if transfer_health_percentage then
				local original_hp_percentage = optional_data.original_hp_percentage
				local health_extension = ScriptUnit.extension(transformed_unit, "health_system")
				local max_health = health_extension:get_max_health()
				local damage = max_health * (1 - original_hp_percentage)

				health_extension:set_current_damage(damage)

				local network_manager = Managers.state.network
				local go_id, is_level_unit = network_manager:game_object_or_level_id(transformed_unit)
				local state = NetworkLookup.health_statuses[health_extension.state]

				Managers.state.network.network_transmit:send_rpc_clients("rpc_sync_damage_taken", go_id, is_level_unit, false, damage, state)
			end
		end
	}
	local breed = Breeds[action.wanted_breed_transform]
	local spawn_category = "misc"
	local conflict_director = Managers.state.conflict

	conflict_director:spawn_queued_unit(breed, Vector3Box(POSITION_LOOKUP[unit]), QuaternionBox(Unit.local_rotation(unit, 0)), spawn_category, nil, nil, optional_data)
	conflict_director:destroy_unit(unit, blackboard, "boss_transformation")

	blackboard.has_transformed = true
end

return
