require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCombatShoutAction = class(BTCombatShoutAction, BTNode)

BTCombatShoutAction.init = function (self, ...)
	BTCombatShoutAction.super.init(self, ...)
end

BTCombatShoutAction.name = "BTCombatShoutAction"

BTCombatShoutAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.anim_cb_shout_finished = nil
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")
	network_manager:anim_event(unit, action.shout_anim)

	local unit_id = network_manager:unit_game_object_id(unit)
	local target_unit_id, is_level_unit = network_manager:game_object_or_level_id(blackboard.target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id, is_level_unit)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

	locomotion_extension:set_wanted_rotation(rotation)

	blackboard.spawn_to_running = nil
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("shouting", event_data)
end

BTCombatShoutAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.update_timer = 0
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
end

BTCombatShoutAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

	locomotion_extension:set_wanted_rotation(rot)

	if blackboard.anim_cb_shout_finished then
		return "done"
	end

	return "running"
end

return
