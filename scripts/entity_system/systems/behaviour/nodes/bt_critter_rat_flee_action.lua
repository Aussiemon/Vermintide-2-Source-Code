require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCritterRatFleeAction = class(BTCritterRatFleeAction, BTNode)

BTCritterRatFleeAction.init = function (self, ...)
	BTCritterRatFleeAction.super.init(self, ...)
end

BTCritterRatFleeAction.name = "BTCritterRatFleeAction"
local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS

BTCritterRatFleeAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.move_pos = nil
	blackboard.using_cover_points = true
	blackboard.using_far_along_path_point = false
	blackboard.using_random_point_in_front_of_target = false
	blackboard.using_random_point = false

	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)
	end
end

BTCritterRatFleeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.move_pos = nil
	blackboard.move_check_index = nil
	blackboard.dig_timer = nil
	blackboard.current_check_list = nil
end

BTCritterRatFleeAction.run = function (self, unit, blackboard, t)
	Profiler.start("rat_flee")

	local ai_navigation = blackboard.navigation_extension

	if blackboard.dig_timer and blackboard.dig_timer < t then
		Profiler.stop("rat_flee")

		return "done"
	end

	if not blackboard.move_pos then
		local move_pos = self:select_move_pos(unit, blackboard)

		ai_navigation:move_to(move_pos)

		blackboard.move_pos = Vector3Box(move_pos)
		blackboard.is_fleeing = true

		Profiler.stop("rat_flee")

		return "running"
	end

	local failed_to_move = ai_navigation:number_failed_move_attempts() > 0

	if failed_to_move then
		blackboard.move_pos = nil

		if blackboard.move_state ~= "idle" then
			self:start_idle_animation(unit, blackboard)
		end

		Profiler.stop("rat_flee")

		return "running"
	end

	local path_found = ai_navigation:is_following_path()
	local has_reached_destination = ai_navigation:has_reached_destination()

	if path_found and not has_reached_destination and blackboard.move_state ~= "moving" then
		self:start_move_animation(unit, blackboard)
		Profiler.stop("rat_flee")

		return "running"
	end

	if has_reached_destination then
		self:at_destination(unit, blackboard, t)
		Profiler.stop("rat_flee")

		return "running"
	end

	Profiler.stop("rat_flee")

	return "running"
end

BTCritterRatFleeAction.select_move_pos = function (self, unit, blackboard)
	local move_pos = nil

	if blackboard.using_cover_points then
		move_pos = self:_get_cover_point_flee_pos(unit, blackboard)
	end

	if blackboard.using_far_along_path_point then
		move_pos = self:_get_far_along_path_pos(unit, blackboard)
	end

	if not move_pos and blackboard.using_random_point_in_front_of_target then
		move_pos = self:_get_random_flee_pos_in_front_of_target(unit, blackboard)
	end

	if not move_pos and blackboard.using_random_point then
		move_pos = self:_get_random_flee_pos(unit, blackboard)
	end

	return move_pos
end

BTCritterRatFleeAction._get_cover_point_flee_pos = function (self, unit, blackboard)
	local target_unit = blackboard.target_unit
	local move_pos = nil

	if Unit.alive(target_unit) then
		local current_position = POSITION_LOOKUP[unit]
		local target_position = POSITION_LOOKUP[target_unit]
		local action = blackboard.action
		local data = action.cover_point_check
		local max_height_diff = data.max_height_diff

		if not blackboard.current_check_list then
			local min_dist = data.min_cover_point_check_dist
			local max_dist = data.max_cover_point_check_dist
			local avoid_pos_list = player_and_bot_positions
			local num_cover_units, cover_units = ConflictUtils.hidden_cover_points(current_position, avoid_pos_list, min_dist, max_dist)
			blackboard.current_check_list = cover_units

			for i = num_cover_units + 1, #cover_units, 1 do
				cover_units[i] = nil
			end

			table.shuffle(blackboard.current_check_list)
		end

		slot10 = blackboard.move_check_index or 1

		for index = slot10, #blackboard.current_check_list, 1 do
			local cover_unit = blackboard.current_check_list[index]
			local cover_pos = Unit.local_position(cover_unit, 0)
			local distance_to_target = Vector3.distance_squared(cover_pos, target_position)
			local distance_to_critter = Vector3.distance_squared(cover_pos, current_position)
			local cover_on_same_side = distance_to_critter < distance_to_target
			local height_diff = math.abs(current_position.z - cover_pos.z)

			if cover_on_same_side and height_diff < max_height_diff then
				move_pos = cover_pos
				blackboard.move_check_index = index + 1

				break
			end
		end
	end

	if not move_pos then
		blackboard.using_cover_points = false
		blackboard.using_far_along_path_point = true
		blackboard.move_check_index = nil
		blackboard.current_check_list = nil
	end

	return move_pos
end

BTCritterRatFleeAction._get_far_along_path_pos = function (self, unit, blackboard)
	local move_pos = nil
	local target_unit = blackboard.target_unit

	if Unit.alive(target_unit) then
		local conflict = Managers.state.conflict
		local level_analysis = conflict.level_analysis
		local current_path_index = conflict.main_path_info.current_path_index
		local segment_index, break_node_index, last_node_position = EngineOptimized.main_path_next_break(current_path_index)
		local current_position = POSITION_LOOKUP[unit]
		local distance_sq = Vector3.distance_squared(current_position, last_node_position)
		local action = blackboard.action
		local min_dist_sq = action.min_far_along_path_pos_distance_sq

		if min_dist_sq < distance_sq then
			move_pos = last_node_position
		end
	end

	blackboard.using_far_along_path_point = false
	blackboard.using_random_point_in_front_of_target = true

	return move_pos
end

BTCritterRatFleeAction._get_random_flee_pos_in_front_of_target = function (self, unit, blackboard)
	local move_pos = nil
	local nav_world = blackboard.nav_world
	local start_pos = POSITION_LOOKUP[unit]
	local action = blackboard.action
	local data = action.random_point_in_front_check
	local min_dist = data.min_random_point_in_front_check_dist
	local max_dist = data.max_random_point_in_front_check_dist
	local max_tries = data.max_tries
	local above = data.above
	local below = data.below
	local min_width = data.min_width
	local max_width = data.max_width
	local target_unit = blackboard.target_unit

	if Unit.alive(target_unit) then
		move_pos = LocomotionUtils.new_random_goal_in_front_of_unit(nav_world, target_unit, min_dist, max_dist, max_tries, nil, min_width, max_width, above, below)
	end

	if not move_pos then
	end

	blackboard.using_random_point_in_front_of_target = false
	blackboard.using_random_point = true

	return move_pos
end

BTCritterRatFleeAction._get_random_flee_pos = function (self, unit, blackboard)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local start_pos = POSITION_LOOKUP[unit]
	local data = action.random_point_check
	local min_dist = data.min_random_point_check_dist
	local max_dist = data.max_random_point_check_dist
	local max_tries = data.max_tries
	local above = data.above
	local below = data.below
	local move_pos = LocomotionUtils.new_random_goal(nav_world, blackboard, start_pos, min_dist, max_dist, max_tries, nil, above, below)
	move_pos = move_pos or POSITION_LOOKUP[unit]

	return move_pos
end

BTCritterRatFleeAction.start_idle_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

BTCritterRatFleeAction.start_move_animation = function (self, unit, blackboard)
	Managers.state.network:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"
end

BTCritterRatFleeAction.at_destination = function (self, unit, blackboard, t)
	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)
	end

	if not blackboard.dig_timer then
		local action = blackboard.action
		local data = action.dig_timer
		local min_time_before_dig = data.min_time_before_dig
		local max_time_before_dig = data.max_time_before_dig
		local time_before_dig = math.random(min_time_before_dig, max_time_before_dig)
		blackboard.dig_timer = t + time_before_dig
	end

	if BTConditions.can_see_player(blackboard) then
		blackboard.move_pos = nil
		blackboard.using_random_point = false
		blackboard.using_cover_points = true
	end
end

return
