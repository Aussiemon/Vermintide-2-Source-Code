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
end

BTTransformAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not blackboard.has_transformed then
		self:transform(unit, blackboard)
	end
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
				local damage = max_health * (1 - math.max(original_hp_percentage, 0.1))

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
	local position = (unit and POSITION_LOOKUP[unit]) or Unit.world_position(unit, 0)
	local rotation = (unit and Unit.local_rotation(unit, 0)) or Quaternion.identity()

	if position and rotation then
		conflict_director:spawn_queued_unit(breed, Vector3Box(position), QuaternionBox(rotation), spawn_category, nil, nil, optional_data)
	end

	conflict_director:destroy_unit(unit, blackboard, "boss_transformation")

	blackboard.has_transformed = true
end

return
