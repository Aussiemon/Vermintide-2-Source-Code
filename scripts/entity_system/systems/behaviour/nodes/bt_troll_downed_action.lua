require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTrollDownedAction = class(BTTrollDownedAction, BTNode)
BTTrollDownedAction.name = "BTTrollDownedAction"
local script_data = script_data

BTTrollDownedAction.init = function (self, ...)
	BTTrollDownedAction.super.init(self, ...)
end

BTTrollDownedAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "downed_intro")
	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.troll_incapacitaded_broadcast_range, "attack_tag", "troll_incapacitaded")

	blackboard.downed_end_time = t + action.downed_duration
	blackboard.minimum_downed_end_time = t + action.min_downed_duration
	local health_extension = ScriptUnit.extension(unit, "health_system")
	blackboard.downed_end_finished = false
	blackboard.downed_state = "downed"

	self:trigger_dialogue_event(unit, "chaos_troll_incapacitaded")

	blackboard.num_regen = (blackboard.num_regen and blackboard.num_regen + 1) or 1
end

BTTrollDownedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	BTStaggerAction.clean_blackboard(nil, blackboard)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.downed_end_finished = false
	blackboard.downed_state = false
end

BTTrollDownedAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local health_extension = ScriptUnit.extension(unit, "health_system")

	if blackboard.downed_state == "downed" then
		if blackboard.downed_end_time < t then
			Managers.state.network:anim_event(unit, "downed_end")
			self:trigger_dialogue_event(unit, "chaos_troll_rising_regen")

			blackboard.downed_state = "standup"
		elseif blackboard.minimum_downed_end_time < t and health_extension:min_health_reached() then
			Managers.state.network:anim_event(unit, "downed_end_wounded")
			self:trigger_dialogue_event(unit, "chaos_troll_rising_interrupted")

			blackboard.downed_state = "standup"
		end
	elseif blackboard.downed_end_finished then
		health_extension:set_downed_finished()

		return "done"
	end

	return "running"
end

BTTrollDownedAction.trigger_dialogue_event = function (self, unit, dialogue_event)
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event(dialogue_event, event_data)
end

return
