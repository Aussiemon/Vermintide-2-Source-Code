require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosSorcererTeleportAction = class(BTChaosSorcererTeleportAction, BTNode)
BTChaosSorcererTeleportAction.name = "BTChaosSorcererTeleportAction"

BTChaosSorcererTeleportAction.init = function (self, ...)
	BTChaosSorcererTeleportAction.super.init(self, ...)
end

BTChaosSorcererTeleportAction.enter = function (self, unit, blackboard, t)
	local next_smart_object_data = blackboard.next_smart_object_data
	local entrance_pos = next_smart_object_data.entrance_pos:unbox()
	local exit_pos = next_smart_object_data.exit_pos:unbox()
	blackboard.active_node = BTChaosSorcererTeleportAction
	local smart_object_data = next_smart_object_data.smart_object_data
	blackboard.smart_object_data = smart_object_data
	blackboard.teleport_position = Vector3Box(exit_pos)
	blackboard.entrance_position = Vector3Box(entrance_pos)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)
	Managers.state.network:anim_event(unit, "teleport_start")
end

BTChaosSorcererTeleportAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.teleport_position = nil
	blackboard.entrance_position = nil
	blackboard.teleport_timeout = nil
	blackboard.anim_cb_teleport_finished = nil
	blackboard.active_node = nil
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	local success = navigation_extension:is_using_smart_object() and navigation_extension:use_smart_object(false)
end

BTChaosSorcererTeleportAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.smart_object_data ~= blackboard.next_smart_object_data.smart_object_data then
		return "failed"
	end

	local navigation_extension = blackboard.navigation_extension
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_position = blackboard.entrance_position:unbox()
	local target_offset = entrance_position - unit_position
	local target_dir = Vector3.normalize(navigation_extension:desired_velocity())
	local flat_target_dir = Vector3.flat(target_dir)

	if Vector3.length(flat_target_dir) < 0.05 and Vector3.dot(target_dir, Vector3.normalize(target_offset)) > 0.99 then
		blackboard.teleport_timeout = blackboard.teleport_timeout or t + 0.3
	else
		blackboard.teleport_timeout = nil
	end

	if (blackboard.teleport_timeout == nil or blackboard.teleport_timeout < t) and blackboard.anim_cb_teleport_finished then
		local locomotion_extension = blackboard.locomotion_extension
		local teleport_position = blackboard.teleport_position:unbox()

		navigation_extension:set_navbot_position(teleport_position)
		locomotion_extension:teleport_to(teleport_position)
		self:play_teleport_effect(unit, entrance_position, teleport_position)

		return "done"
	else
		return "running"
	end
end

BTChaosSorcererTeleportAction.play_teleport_effect = function (self, unit, start_position, end_position)
	local action_data = self._tree_node.action_data
	local effect_name = action_data and action_data.teleport_effect or "fx/chr_chaos_sorcerer_teleport"
	local effect_name_id = NetworkLookup.effects[effect_name]
	local network_manager = Managers.state.network
	local owner_unit_id = network_manager:unit_game_object_id(unit)
	local node_id = 0
	local rotation_offset = Quaternion.identity()

	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, start_position, rotation_offset, false)
	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, end_position, rotation_offset, false)
end

BTChaosSorcererTeleportAction.anim_cb_teleport_start_finished = function (self, unit, blackboard)
	blackboard.anim_cb_teleport_finished = true
end
