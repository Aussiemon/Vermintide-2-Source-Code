-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_skulk_idle_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSkulkIdleAction = class(BTSkulkIdleAction, BTNode)
BTSkulkIdleAction.name = "BTSkulkIdleAction"

BTSkulkIdleAction.init = function (self, ...)
	BTSkulkIdleAction.super.init(self, ...)
end

BTSkulkIdleAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action

	local skulk_data = blackboard.skulk_data

	skulk_data.skulk_idle_timer = t + math.random(5, 10)

	Managers.state.network:anim_event(unit, "to_crouch")
	Managers.state.network:anim_event(unit, "idle")
	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local ai_simple_extension = ScriptUnit.extension(unit, "ai_system")

	ai_simple_extension:set_perception("perception_all_seeing_re_evaluate", "pick_ninja_skulking_target")

	if not skulk_data.attack_timer or t > skulk_data.attack_timer then
		skulk_data.attack_timer = t + math.random(25, 30)
	end
end

BTSkulkIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	Managers.state.network:anim_event(unit, "to_upright")

	if blackboard.approach_target then
		local skulk_data = blackboard.skulk_data

		skulk_data.attack_timer = nil
	end

	blackboard.navigation_extension:set_enabled(true)
end

local found_units = {}
local move_distance_squared = 400

BTSkulkIdleAction.run = function (self, unit, blackboard, t, dt)
	local skulk_data = blackboard.skulk_data

	if t > skulk_data.attack_timer then
		blackboard.approach_target = true

		return "failed"
	end

	local urgency_to_engage = PerceptionUtils.special_opportunity(unit, blackboard)

	if urgency_to_engage > 0 then
		blackboard.approach_target = true

		return "failed"
	end

	if t > skulk_data.skulk_idle_timer then
		return "done"
	end

	local pos = POSITION_LOOKUP[unit]
	local side = blackboard.side
	local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #enemy_player_and_bot_positions do
		local enemy_pos = enemy_player_and_bot_positions[i]

		if Vector3.distance_squared(pos, enemy_pos) < move_distance_squared then
			return "done"
		end
	end

	return "running"
end

BTSkulkIdleAction.pick_new_hiding_place = function (self, unit, blackboard, t, dt)
	return
end
