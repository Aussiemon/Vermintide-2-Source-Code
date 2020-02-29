require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSwarmAction = class(BTSwarmAction, BTNode)
BTSwarmAction.name = "BTSwarmAction"

BTSwarmAction.init = function (self, ...)
	BTSwarmAction.super.init(self, ...)
end

BTSwarmAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTSwarmAction
	local valid_action = self:_calculate_swarm_targets(unit, blackboard)
	blackboard.abort_action = not valid_action

	blackboard.navigation_extension:stop()

	blackboard.swarm_start = true
	blackboard.summoning = true
	blackboard.attack_finished = false
end

BTSwarmAction._calculate_swarm_targets = function (self, unit, blackboard)
	blackboard.valid_swarm_targets = {}
	local side = blackboard.side
	local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local valid_player_units = {}
	local valid_bot_units = {}

	for _, player_unit in pairs(player_and_bot_units) do
		local status_extension = ScriptUnit.extension(player_unit, "status_system")
		local valid_target = status_extension and not status_extension:is_invisible() and not status_extension:is_disabled()

		if valid_target then
			if not Managers.player:owner(player_unit).bot_player then
				valid_player_units[#valid_player_units + 1] = player_unit
			else
				valid_bot_units[#valid_bot_units + 1] = player_unit
			end
		end
	end

	if #valid_player_units > 1 then
		blackboard.valid_swarm_targets = valid_player_units
	else
		blackboard.valid_swarm_targets = valid_bot_units
	end

	if #blackboard.valid_swarm_targets < 2 then
		return false
	end

	return true
end

BTSwarmAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.active_node = nil
	blackboard.summoning = nil
	blackboard.ready_to_summon = false
	blackboard.abort_action = nil
	blackboard.attack_finished = nil
end

BTSwarmAction.anim_cb_damage = function (self, unit, blackboard)
	local action = blackboard.action
	local blob_unit = AiUtils.spawn_overpowering_blob(Managers.state.network, blackboard.target_unit, action.health, action.duration)
	local overpowered_template_name = "slow_bomb"

	StatusUtils.set_overpowered_network(blackboard.target_unit, true, overpowered_template_name, blob_unit)
end

BTSwarmAction.anim_cb_attack_finished = function (self, unit, blackboard)
	blackboard.attack_finished = true
end

BTSwarmAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.abort_action or blackboard.attack_finished then
		return "done"
	end

	local action = blackboard.action

	if blackboard.swarm_start then
		Managers.state.network:anim_event(unit, action.cast_anim)

		blackboard.swarm_start = nil
	end

	local status_extension = ScriptUnit.extension(blackboard.target_unit, "status_system")
	local valid_target = status_extension and not status_extension:is_invisible() and not status_extension:is_disabled()

	if not valid_target then
		local valid_action = self:_calculate_swarm_targets(unit, blackboard)

		if not valid_action then
			return "done"
		end

		local new_target = nil

		while not new_target or new_target == blackboard.target_unit do
			new_target = blackboard.valid_swarm_targets[math.random(#blackboard.valid_swarm_targets)]
		end

		blackboard.target_unit = new_target
	end

	return "running"
end

return
