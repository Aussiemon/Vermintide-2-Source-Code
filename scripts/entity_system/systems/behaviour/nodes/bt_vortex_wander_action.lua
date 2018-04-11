require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVortexWanderAction = class(BTVortexWanderAction, BTNode)
local position_lookup = POSITION_LOOKUP
BTVortexWanderAction.init = function (self, ...)
	BTVortexWanderAction.super.init(self, ...)

	return 
end
BTVortexWanderAction.name = "BTVortexWanderAction"
BTVortexWanderAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	return 
end
BTVortexWanderAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return 
end
BTVortexWanderAction.run = function (self, unit, blackboard, t, dt)
	local vortex_data = blackboard.vortex_data

	self._wander_around(self, unit, t, dt, blackboard, vortex_data)

	return "running"
end
BTVortexWanderAction._wander_around = function (self, unit, t, dt, blackboard, vortex_data)
	local action = blackboard.action
	local wander_state = vortex_data.wander_state
	local vortex_template = vortex_data.vortex_template
	local num_players_inside = vortex_data.num_players_inside
	local navigation_extension = blackboard.navigation_extension
	local is_following_path = navigation_extension.is_following_path(navigation_extension)
	blackboard.move_state = (is_following_path and "moving") or "idle"

	if vortex_template.stop_and_process_player and 0 < num_players_inside and wander_state ~= "standing_still" and wander_state ~= "forced_standing_still" then
		vortex_data.wander_state = "standing_still"

		navigation_extension.stop(navigation_extension)
	elseif num_players_inside == 0 and vortex_data.wander_state == "standing_still" then
		vortex_data.wander_state = "recalc_path"
	end

	if wander_state == "wandering" then
		if navigation_extension.has_reached_destination(navigation_extension, 0.5) or vortex_data.wander_time < t then
			vortex_data.wander_state = "recalc_path"
		end
	elseif wander_state == "calculating_path" then
		local is_computing_path = navigation_extension.is_computing_path(navigation_extension)
		local path_found = not blackboard.no_path_found

		if not is_computing_path and (is_following_path or not path_found) then
			if path_found then
				vortex_data.wander_state = "wandering"
				vortex_data.wander_time = t + 1
			else
				vortex_data.wander_state = "no_path_found"
				vortex_data.idle_time = t + 2 + math.random()
			end
		end
	elseif wander_state == "recalc_path" then
		local nav_world = blackboard.nav_world
		local target_unit = blackboard.target_unit
		local position = position_lookup[unit]
		local random_wander = vortex_template.random_wander or not target_unit

		if random_wander then
			local random_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, position, 5, 10, 7)

			if random_pos then
				navigation_extension.move_to(navigation_extension, random_pos)

				vortex_data.wander_state = "calculating_path"
			else
				vortex_data.idle_time = t + math.random() * 0.5
				vortex_data.wander_state = "no_path_found"
			end
		elseif Unit.alive(target_unit) then
			local target_position = position_lookup[target_unit]
			local projected_target_position = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 2)

			if projected_target_position then
				local target_distance_sq = Vector3.length_squared(projected_target_position - position)

				if 0.25 < target_distance_sq then
					navigation_extension.move_to(navigation_extension, projected_target_position)

					vortex_data.wander_state = "calculating_path"
				end
			else
				vortex_data.idle_time = t + math.random() * 0.5
				vortex_data.wander_state = "no_path_found"
			end
		else
			vortex_data.idle_time = t + 2 + math.random()
			vortex_data.wander_state = "no_path_found"
		end
	elseif wander_state == "no_path_found" then
		if vortex_data.idle_time < t then
			vortex_data.wander_state = "recalc_path"
		end
	elseif wander_state ~= "standing_still" and wander_state == "forced_standing_still" then
	end

	return 
end

return 
