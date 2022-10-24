require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCritterNurglingFleeAction = class(BTCritterNurglingFleeAction, BTNode)

BTCritterNurglingFleeAction.init = function (self, ...)
	BTCritterNurglingFleeAction.super.init(self, ...)
end

BTCritterNurglingFleeAction.name = "BTCritterNurglingFleeAction"

BTCritterNurglingFleeAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data

	blackboard.navigation_extension:set_max_speed(blackboard.breed.run_speed)

	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)

		blackboard.move_state = "idle"
	end
end

BTCritterNurglingFleeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local conflict = Managers.state.conflict

	if reason == "done" then
		conflict:destroy_unit(unit, blackboard, reason)
	end
end

BTCritterNurglingFleeAction.run = function (self, unit, blackboard, t)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	if not blackboard.move_pos then
		local move_pos = self:get_random_move_pos(unit, blackboard, action)
		blackboard.move_pos = Vector3Box(move_pos)

		navigation_extension:move_to(move_pos)
	end

	if navigation_extension:number_failed_move_attempts() > 0 then
		blackboard.move_pos = nil

		if blackboard.move_state ~= "idle" then
			self:start_idle_animation(unit, blackboard)
		end

		return "running"
	end

	if navigation_extension:is_following_path() and blackboard.move_state ~= "moving" then
		self:start_move_animation(unit, blackboard)
	end

	if self:has_escaped_players(unit, blackboard, action) then
		return "done"
	end

	if navigation_extension:has_reached_destination() then
		blackboard.move_pos = nil
	end

	return "running"
end

BTCritterNurglingFleeAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

BTCritterNurglingFleeAction.has_escaped_players = function (self, unit, blackboard, action)
	local data = action.has_escaped_players
	local unit_pos = POSITION_LOOKUP[unit]
	local side = blackboard.side
	local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #ENEMY_PLAYER_AND_BOT_UNITS, 1 do
		local player_unit = ENEMY_PLAYER_AND_BOT_UNITS[i]
		local player_pos = POSITION_LOOKUP[player_unit]
		local distance_to_player_sq = Vector3.distance_squared(unit_pos, player_pos)

		if data.despawn_distance_sq < distance_to_player_sq then
			return true
		end
	end

	return false
end

BTCritterNurglingFleeAction.get_random_move_pos = function (self, unit, blackboard, action)
	local nav_world = blackboard.nav_world
	local start_pos = POSITION_LOOKUP[unit]
	local data = action.random_point_check
	local min_dist = data.min_random_point_check_dist
	local max_dist = data.max_random_point_check_dist
	local max_tries = data.max_tries
	local above = data.above
	local below = data.below
	local move_pos = LocomotionUtils.new_random_goal(nav_world, blackboard, start_pos, min_dist, max_dist, max_tries, nil, above, below)
	move_pos = move_pos or start_pos

	return move_pos
end

BTCritterNurglingFleeAction.start_move_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"
end

BTCritterNurglingFleeAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

return
