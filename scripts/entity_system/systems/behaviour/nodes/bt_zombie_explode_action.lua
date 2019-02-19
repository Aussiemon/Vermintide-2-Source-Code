require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTZombieExplodeAction = class(BTZombieExplodeAction, BTNode)

BTZombieExplodeAction.init = function (self, ...)
	BTZombieExplodeAction.super.init(self, ...)
end

BTZombieExplodeAction.name = "BTZombieExplodeAction"

BTZombieExplodeAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	if action.explode_animation then
		local explode_animation = action.explode_animation
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, explode_animation)

		blackboard.explosion_timer = t + action.explosion_at_time
		blackboard.bot_threat_timer = t + action.explosion_at_time * 0.75
	else
		blackboard.explosion_timer = t
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)
end

BTZombieExplodeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)
end

BTZombieExplodeAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.bot_threat_timer and blackboard.bot_threat_timer < t then
		local action = blackboard.action
		local position = POSITION_LOOKUP[unit]
		local size = Vector3(action.radius, action.radius, 1)
		local bot_threat_duration = action.bot_threat_duration or 1.5

		Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(position, "cylinder", size, nil, bot_threat_duration)

		blackboard.bot_threat_timer = nil
	end

	if blackboard.explosion_timer < t then
		self:explode(unit, blackboard, t)

		return "done"
	end

	return "running"
end

BTZombieExplodeAction.explode = function (self, unit, blackboard, t)
	local damage_type = "kinetic"
	local damage_direction = Vector3(0, 0, -1)
	blackboard.explosion_finished = true

	AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)
end

return
