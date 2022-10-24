require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTFindRangedPositionAction = class(BTFindRangedPositionAction, BTNode)

BTFindRangedPositionAction.init = function (self, ...)
	BTFindRangedPositionAction.super.init(self, ...)
end

BTFindRangedPositionAction.name = "BTFindRangedPositionAction"

BTFindRangedPositionAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		blackboard.move_state = "idle"
	end

	blackboard.find_ranged_position_t = t + 0.5

	blackboard.navigation_extension:stop()
	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3(0, 0, 0))

	blackboard.num_failed_find_position_attempts = 0
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "idle")

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)
end

BTFindRangedPositionAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.find_ranged_position_t = nil
	blackboard.action = nil
	blackboard.num_failed_find_position_attempts = nil
end

BTFindRangedPositionAction.run = function (self, unit, blackboard, t, dt)
	local find_ranged_position_t = blackboard.find_ranged_position_t

	if not Unit.alive(blackboard.target_unit) then
		return "done"
	end

	if find_ranged_position_t < t then
		Profiler.start("find_ranged_position")

		local ranged_position = self:_find_ranged_position(unit, blackboard, t)

		Profiler.stop("find_ranged_position")

		if ranged_position then
			blackboard.navigation_extension:set_enabled(true)
			blackboard.navigation_extension:move_to(ranged_position)

			blackboard.ranged_position = Vector3Box(ranged_position)
		else
			blackboard.find_ranged_position_t = t + 0.25
		end
	end

	return "running", "evaluate"
end

BTFindRangedPositionAction._find_ranged_position = function (self, unit, blackboard, t)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 1)

	if not projected_start_pos then
		local p = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, 6, 6, 8, 0.5)

		if p then
			projected_start_pos = p
		end
	end

	local wanted_position = nil
	local max_tries = 3

	if projected_start_pos then
		local self_position = POSITION_LOOKUP[unit]
		local target_to_self_direction = Vector3.normalize(self_position - target_position)
		local target_to_self_rotation = Quaternion.look(target_to_self_direction)
		local num_find_position_attempts = blackboard.num_failed_find_position_attempts
		local random_deg_range_1 = math.max(-90 - num_find_position_attempts * 10, -180)
		local random_deg_range_2 = math.min(90 + num_find_position_attempts * 10, 180)

		for i = 1, max_tries, 1 do
			local pi = math.pi
			local max_dist = math.random(action.max_dist[1], action.max_dist[2])
			local min_dist = action.min_dist
			local rand_deg = math.random(random_deg_range_1, random_deg_range_2)
			local radians = (rand_deg * pi) / 180
			local randomized_direction = Vector3(math.sin(radians), math.cos(radians), 0)
			local randomized_rotation = Quaternion.look(randomized_direction)
			local wanted_rotation = Quaternion.multiply(target_to_self_rotation, randomized_rotation)
			local wanted_direction = Quaternion.forward(wanted_rotation)
			local projected_end_pos = target_position + wanted_direction * max_dist

			if projected_end_pos then
				local _, hit_position = GwNavQueries.raycast(nav_world, projected_start_pos, projected_end_pos)

				if hit_position then
					local distance = Vector3.distance(hit_position, target_position)
					local is_within_bounds = min_dist < distance

					if is_within_bounds then
						local wanted_pos = target_position + wanted_direction * math.random(min_dist, distance)
						wanted_position = LocomotionUtils.pos_on_mesh(nav_world, wanted_pos, 1, 1)

						if LocomotionUtils.pos_on_mesh(nav_world, wanted_pos, 1, 1) then
						end
					end
				end
			end
		end
	end

	if not wanted_position then
		blackboard.num_failed_find_position_attempts = blackboard.num_failed_find_position_attempts + 1

		if blackboard.num_failed_find_position_attempts >= 9 then
			wanted_position = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 1)

			if not wanted_position then
				local p = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, 6, 6, 8, 0.5)

				if p then
					wanted_position = p
				end
			end
		end
	end

	return wanted_position
end

return
