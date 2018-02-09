require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSkulkIdleAction = class(BTSkulkIdleAction, BTNode)
BTSkulkIdleAction.name = "BTSkulkIdleAction"
BTSkulkIdleAction.init = function (self, ...)
	BTSkulkIdleAction.super.init(self, ...)

	return 
end
BTSkulkIdleAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	local skulk_data = blackboard.skulk_data
	skulk_data.skulk_idle_timer = t + math.random(5, 10)

	Managers.state.network:anim_event(unit, "to_crouch")
	Managers.state.network:anim_event(unit, "idle")
	blackboard.navigation_extension:set_enabled(false)

	local ai_simple_extension = ScriptUnit.extension(unit, "ai_system")

	ai_simple_extension.set_perception(ai_simple_extension, "perception_all_seeing_re_evaluate", "pick_ninja_skulking_target")

	if not skulk_data.attack_timer or skulk_data.attack_timer < t then
		skulk_data.attack_timer = t + math.random(25, 30)
	end

	return 
end
BTSkulkIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	Managers.state.network:anim_event(unit, "to_upright")

	if blackboard.approach_target then
		local skulk_data = blackboard.skulk_data
		skulk_data.attack_timer = nil
	end

	blackboard.navigation_extension:set_enabled(true)

	return 
end
local found_units = {}
local move_distance_squared = 400
BTSkulkIdleAction.run = function (self, unit, blackboard, t, dt)
	local skulk_data = blackboard.skulk_data

	if skulk_data.attack_timer < t then
		blackboard.approach_target = true

		return "failed"
	end

	local urgency_to_engage = PerceptionUtils.special_opportunity(unit, blackboard)

	if 0 < urgency_to_engage then
		blackboard.approach_target = true

		return "failed"
	end

	if skulk_data.skulk_idle_timer < t then
		return "done"
	end

	local pos = POSITION_LOOKUP[unit]

	for i = 1, #PLAYER_AND_BOT_POSITIONS, 1 do
		local enemy_pos = PLAYER_AND_BOT_POSITIONS[i]

		if Vector3.distance_squared(pos, enemy_pos) < move_distance_squared then
			return "done"
		end
	end

	return "running"
end
BTSkulkIdleAction.pick_new_hiding_place = function (self, unit, blackboard, t, dt)
	return 
end

return 
