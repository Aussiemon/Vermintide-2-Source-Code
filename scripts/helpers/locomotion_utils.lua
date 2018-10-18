LocomotionUtils = {}
local unit_local_position = Unit.local_position
local unit_set_local_rotation = Unit.set_local_rotation
local quaternion_look = Quaternion.look

LocomotionUtils.follow_target = function (unit, blackboard, t, dt)
	if not Unit.alive(blackboard.target_unit) then
		return
	end

	local breed = blackboard.breed
	local pos = unit_local_position(unit, 0)
	local threat_position = unit_local_position(blackboard.target_unit, 0)
	local goal_has_moved = nil

	if blackboard.remembered_threat_pos then
		goal_has_moved = Vector3.distance(Vector3Box.unbox(blackboard.remembered_threat_pos), threat_position) > 1
	else
		blackboard.remembered_threat_pos = Vector3Box()
		goal_has_moved = true
	end

	if goal_has_moved then
		Vector3Box.store(blackboard.remembered_threat_pos, threat_position)

		local goal_pos = Unit.local_position(blackboard.target_unit, 0) - Vector3.normalize(threat_position - pos) * breed.radius
		local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(blackboard.nav_world, goal_pos)

		if is_position_on_navmesh then
			goal_pos.z = altitude
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local navigation = ai_extension:navigation()

			navigation:move_to(goal_pos)

			blackboard.target_outside_navmesh = false
		else
			blackboard.target_outside_navmesh = true
		end
	end
end

LocomotionUtils.follow_target_ogre = function (unit, blackboard, t, dt)
	local target_unit = blackboard.target_unit

	if not Unit.alive(target_unit) then
		return
	end

	local pos = POSITION_LOOKUP[unit]
	local status_extension = ScriptUnit.extension(target_unit, "status_system")
	local is_on_ladder, ladder_unit = status_extension:get_is_on_ladder()
	local threat_position, goal_pos = nil

	if is_on_ladder then
		local foot, top = Managers.state.bot_nav_transition:get_ladder_coordinates(ladder_unit)
		threat_position = foot
		goal_pos = foot
	else
		threat_position = POSITION_LOOKUP[target_unit]
	end

	local goal_has_moved = nil

	if blackboard.remembered_threat_pos then
		goal_has_moved = Vector3.distance(Vector3Box.unbox(blackboard.remembered_threat_pos), threat_position) > 1

		if not goal_has_moved and blackboard.next_move_check < t then
			blackboard.next_move_check = t + 2
			local nav_world = blackboard.nav_world
			local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, threat_position, 2, 2)

			if not is_position_on_navmesh then
				goal_has_moved = true
			end
		end
	else
		blackboard.remembered_threat_pos = Vector3Box(threat_position)
		goal_has_moved = true
	end

	if goal_has_moved then
		Vector3Box.store(blackboard.remembered_threat_pos, threat_position)

		local to_target = threat_position - pos
		local breed = blackboard.breed
		local nav_world = blackboard.nav_world
		goal_pos = goal_pos or Unit.local_position(blackboard.target_unit, 0) - Vector3.normalize(to_target) * breed.radius
		local diff_height, is_position_on_navmesh, z_height = nil
		is_position_on_navmesh, z_height = GwNavQueries.triangle_from_position(nav_world, goal_pos, 30, 30)

		if is_position_on_navmesh then
			diff_height = math.abs(goal_pos[3] - z_height)

			if diff_height <= 2 then
				goal_pos.z = z_height

				blackboard.navigation_extension:move_to(goal_pos)

				blackboard.target_outside_navmesh = false

				return goal_pos
			end
		end

		local above = 2
		local below = 2
		local horizontal = 3
		local distance_from_obstacel = 3
		local snap_pos = GwNavQueries.inside_position_from_outside_position(nav_world, goal_pos, above, below, horizontal, distance_from_obstacel)

		if snap_pos then
			blackboard.navigation_extension:move_to(snap_pos)

			blackboard.target_outside_navmesh = false

			return snap_pos
		end

		if is_position_on_navmesh then
			goal_pos.z = z_height

			blackboard.navigation_extension:move_to(goal_pos)

			blackboard.target_outside_navmesh = false

			return goal_pos
		end

		local dist = Vector3.length(to_target)

		if dist > 5 then
			local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, threat_position, 2, 2)

			if is_position_on_navmesh then
				threat_position = Vector3(threat_position.x, threat_position.y, altitude)

				blackboard.navigation_extension:move_to(threat_position)

				blackboard.target_outside_navmesh = false

				return threat_position
			end
		end

		blackboard.target_outside_navmesh = true
	end
end

local SteeringTweakData = {
	ROTATION_LERP_LOOK_AT = 20
}

LocomotionUtils.update_combat_rotation = function (unit, blackboard, t, dt)
	local pos = unit_local_position(unit, 0)
	local current_rot = Unit.local_rotation(unit, 0)
	local look_at = Unit.local_position(blackboard.target_unit, 0)
	local wanted_rot = quaternion_look(look_at - pos, Vector3.up())
	local lerp_value = math.smoothstep(dt * SteeringTweakData.ROTATION_LERP_LOOK_AT, 0, 1)
	local new_rot = Quaternion.lerp(current_rot, wanted_rot, lerp_value)

	unit_set_local_rotation(unit, 0, new_rot)
end

LocomotionUtils.look_at_target_rotation = function (unit, blackboard, t, dt)
	local pos = unit_local_position(unit, 0)
	local current_rot = Unit.local_rotation(unit, 0)
	local look_at = Unit.local_position(blackboard.target_unit, 0)
	local wanted_rot = quaternion_look(look_at - pos, Vector3.up())
	local lerp_value = math.smoothstep(dt * SteeringTweakData.ROTATION_LERP_LOOK_AT, 0, 1)
	local new_rot = Quaternion.lerp(current_rot, wanted_rot, lerp_value)

	return new_rot
end

LocomotionUtils.look_at_target_rotation_flat = function (unit, blackboard, t, dt)
	local pos = unit_local_position(unit, 0)
	local current_rot = Unit.local_rotation(unit, 0)
	local look_at = Unit.local_position(blackboard.target_unit, 0)
	local to_dir = look_at - pos

	Vector3.set_z(to_dir, 0)

	local wanted_rot = quaternion_look(to_dir, Vector3.up())
	local lerp_value = math.smoothstep(dt * SteeringTweakData.ROTATION_LERP_LOOK_AT, 0, 1)
	local new_rot = Quaternion.lerp(current_rot, wanted_rot, lerp_value)

	return new_rot
end

LocomotionUtils.rotation_towards_unit = function (unit, target_unit)
	local pos_unit = unit_local_position(unit, 0)
	local pos_target_unit = unit_local_position(target_unit, 0)
	local direction = Vector3.normalize(pos_target_unit - pos_unit)
	local rotation = quaternion_look(direction)

	return rotation
end

LocomotionUtils.rotation_towards_unit_flat = function (unit, target_unit)
	local pos_unit = unit_local_position(unit, 0)
	local pos_target_unit = unit_local_position(target_unit, 0)
	local to_dir = pos_target_unit - pos_unit
	to_dir.z = 0
	local direction = Vector3.normalize(to_dir)
	local flat_rotation = quaternion_look(direction)

	return flat_rotation
end

LocomotionUtils.look_at_position = function (unit, position)
	local unit_position = unit_local_position(unit, 0)
	local look_at_direction = Vector3.normalize(position - unit_position)
	local wanted_rot = quaternion_look(look_at_direction, Vector3.up())

	return wanted_rot
end

LocomotionUtils.look_at_position_flat = function (unit, position)
	local unit_position = unit_local_position(unit, 0)
	local look_at_direction_flat = Vector3.flat(position - unit_position)
	local look_at_direction_flat_normalized = Vector3.normalize(look_at_direction_flat)
	local wanted_rot = quaternion_look(look_at_direction_flat_normalized, Vector3.up())

	return wanted_rot
end

LocomotionUtils.get_attack_anim = function (unit, blackboard, attack_anims)
	if attack_anims then
		local target_unit = blackboard.target_unit
		local target_pos = Unit.local_position(target_unit, 0)
		local pos = Unit.local_position(unit, 0)
		local to_enemy = Vector3.normalize(pos - target_pos)
		local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
		local dot = Vector3.dot(my_fwd, to_enemy)
		dot = math.clamp(dot, -1, 1)
		local angle = math.acos(dot)

		if angle > math.pi * 0.95 then
			return attack_anims.directly_fwd[1], attack_anims.directly_fwd[2]
		elseif angle > math.pi * 0.75 then
			return attack_anims.fwd[1], attack_anims.fwd[2]
		elseif angle < math.pi * 0.25 then
			return attack_anims.bwd[1], attack_anims.bwd[2]
		elseif Vector3.cross(my_fwd, to_enemy).z > 0 then
			return attack_anims.right[1], attack_anims.right[2]
		else
			return attack_anims.left[1], attack_anims.left[2]
		end
	end

	return nil, false
end

LocomotionUtils.get_start_anim = function (unit, blackboard, start_anims)
	if start_anims then
		local target_unit = blackboard.target_unit
		local target_pos = Unit.local_position(target_unit, 0)
		local pos = Unit.local_position(unit, 0)
		local to_enemy = Vector3.normalize(pos - target_pos)
		local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
		local dot = Vector3.dot(my_fwd, to_enemy)
		dot = math.clamp(dot, -1, 1)
		local angle = math.acos(dot)

		if angle > math.pi * 0.75 then
			return start_anims.fwd
		elseif angle < math.pi * 0.25 then
			return start_anims.bwd, true
		elseif Vector3.cross(my_fwd, to_enemy).z > 0 then
			return start_anims.right
		else
			return start_anims.left
		end
	end
end

LocomotionUtils.constrain_on_clients = function (unit, constrain, min, max)
	local network_manager = Managers.state.network

	if network_manager:game() then
		local realmin = Vector3(math.min(min.x, max.x), math.min(min.y, max.y), math.min(min.z, max.z))
		local realmax = Vector3(math.max(min.x, max.x), math.max(min.y, max.y), math.max(min.z, max.z))
		local go_id = Managers.state.unit_storage:go_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_constrain_ai", go_id, constrain, realmin, realmax)
	end
end

LocomotionUtils.set_animation_driven_movement = function (unit, animation_driven, is_affected_by_gravity, script_driven_rotation)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_driven(animation_driven, is_affected_by_gravity, script_driven_rotation)
end

LocomotionUtils.set_animation_translation_scale = function (unit, animation_translation_scale)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_translation_scale(animation_translation_scale)

	local network_manager = Managers.state.network

	if network_manager:game() then
		local go_id = Managers.state.unit_storage:go_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_set_animation_translation_scale", go_id, animation_translation_scale)
	end
end

LocomotionUtils.set_animation_rotation_scale = function (unit, animation_rotation_scale)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_rotation_scale(animation_rotation_scale)

	local network_manager = Managers.state.network

	if network_manager:game() then
		local go_id = Managers.state.unit_storage:go_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_set_animation_rotation_scale", go_id, animation_rotation_scale)
	end
end

LocomotionUtils.update_local_animation_driven_movement = function (unit, dt)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)

	Unit.set_local_position(unit, 0, wanted_position)

	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, wanted_rotation)
end

LocomotionUtils.update_local_animation_driven_movement_with_parent = function (unit, dt, parent)
	local master_pos = Unit.local_position(parent.master_unit, 0)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)

	Unit.set_local_position(unit, 0, master_pos)

	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, wanted_rotation)
end

LocomotionUtils.update_local_animation_driven_movement_with_mover = function (unit, dt)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)
	local current_position = POSITION_LOOKUP[unit]
	local delta_anim = wanted_position - current_position
	local mover = Unit.mover(unit)

	Mover.move(mover, delta_anim, dt)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)

	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, wanted_rotation)
end

LocomotionUtils.update_local_animation_driven_movement_plus_mover = function (unit, dt)
	local mover = Unit.mover(unit)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)
	local current_position = Mover.position(mover)
	local delta_anim = wanted_position - current_position

	Mover.move(mover, delta_anim, dt)
	Unit.set_local_position(unit, 0, wanted_position)

	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, wanted_rotation)
end

LocomotionUtils.update_local_animation_driven_movement_with_min_z = function (unit, dt, min_z)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)

	if wanted_position.z < min_z then
		Vector3.set_z(wanted_position, min_z)
	end

	Unit.set_local_position(unit, 0, wanted_position)

	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, wanted_rotation)
end

LocomotionUtils.new_random_goal = function (nav_world, blackboard, start_pos, min_dist, max_dist, max_tries, test_points, above, below)
	local above = above or 30
	local below = below or 30
	local tries = 0

	while max_tries > tries do
		local dist = min_dist + math.random() * (max_dist - min_dist)
		local add_vec = Vector3(dist, 0, 1.5)
		local pos = start_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)

		if test_points then
			test_points[#test_points + 1] = Vector3Box(pos)
		end

		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

		if success then
			pos.z = altitude

			return pos
		end

		tries = tries + 1
	end
end

LocomotionUtils.new_random_goal_uniformly_distributed = function (nav_world, blackboard, start_pos, min_dist, max_dist, max_tries, test_points, above, below)
	local above = above or 30
	local below = below or 30
	local tries = 0

	while max_tries > tries do
		local min_dist_proportion = (min_dist / max_dist)^2
		local random_value = Math.random()
		local normalized_dist = min_dist_proportion + random_value * (1 - min_dist_proportion)
		local uniformly_scaled_dist = math.sqrt(normalized_dist)
		local dist = uniformly_scaled_dist * max_dist
		local add_vec = Vector3(dist, 0, 1.5)
		local pos = start_pos + Quaternion.rotate(Quaternion(Vector3.up(), Math.random() * math.pi * 2), add_vec)

		if test_points then
			test_points[#test_points + 1] = Vector3Box(pos)
		end

		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

		if success then
			pos.z = altitude

			return pos
		end

		tries = tries + 1
	end
end

LocomotionUtils.new_random_goal_uniformly_distributed_with_inside_from_outside_on_last = function (nav_world, blackboard, start_pos, min_dist, max_dist, max_tries, test_points, above, below, horizontal)
	local above = above or 30
	local below = below or 30
	local horizontal = horizontal or 3
	local distance_from_obstacle = 0.1
	local tries = 0

	while max_tries > tries do
		local min_dist_proportion = (min_dist / max_dist)^2
		local random_value = Math.random()
		local normalized_dist = min_dist_proportion + random_value * (1 - min_dist_proportion)
		local uniformly_scaled_dist = math.sqrt(normalized_dist)
		local dist = uniformly_scaled_dist * max_dist
		local add_vec = Vector3(dist, 0, 1.5)
		local pos = start_pos + Quaternion.rotate(Quaternion(Vector3.up(), Math.random() * math.pi * 2), add_vec)

		if test_points then
			test_points[#test_points + 1] = Vector3Box(pos)
		end

		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

		if success then
			pos.z = altitude

			return pos
		end

		if tries == max_tries - 1 then
			local clamped_position = GwNavQueries.inside_position_from_outside_position(nav_world, pos, above, below, horizontal, distance_from_obstacle)

			if clamped_position then
				return clamped_position
			end
		end

		tries = tries + 1
	end
end

LocomotionUtils.new_random_goal_in_front_of_unit = function (nav_world, unit, min_dist, max_dist, max_tries, test_points, min_width, max_width, above, below)
	local above = above or 30
	local below = below or 30
	local tries = 0
	local start_pos = Unit.local_position(unit, 0)

	while tries < max_tries do
		local locomotion_ext = ScriptUnit.has_extension(unit, "locomotion_system") and ScriptUnit.extension(unit, "locomotion_system")
		local direction, speed = nil

		if locomotion_ext then
			local average_velocity = Vector3.flat(locomotion_ext:average_velocity())
			speed = Vector3.length(average_velocity)

			if speed > 0.1 then
				direction = average_velocity
			else
				direction = Quaternion.forward(Unit.local_rotation(unit, 0))
			end
		else
			direction = Quaternion.forward(Unit.local_rotation(unit, 0))
			speed = 0
		end

		local min_speed = 0
		local max_speed = 4
		local distance = math.auto_lerp(min_speed, max_speed, min_dist, max_dist, speed)
		local random_width = math.lerp(min_width, max_width, Math.random())

		if Math.random() < 0.5 then
			random_width = -random_width
		end

		local direction_vector = Vector3.normalize(direction)
		local right_vector = Vector3.cross(direction_vector, Vector3.up())
		local pos = start_pos + direction_vector * distance + right_vector * random_width

		if test_points then
			test_points[#test_points + 1] = Vector3Box(pos)
		end

		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 30, 30)

		if success then
			pos.z = altitude

			return pos
		end

		tries = tries + 1
	end

	return nil
end

LocomotionUtils.new_goal_in_transport = function (nav_world, unit, ally_unit)
	local tries = 0
	local status_extension = ScriptUnit.extension(ally_unit, "status_system")
	local transport_unit = status_extension:get_inside_transport_unit()

	if Unit.alive(transport_unit) then
		local transport_extension = ScriptUnit.extension(transport_unit, "transportation_system")
		local pos = transport_extension:assign_position_to_bot()
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 30, 30)

		if success then
			pos.z = altitude

			return pos
		end
	end

	return nil
end

LocomotionUtils.outside_goal = function (nav_world, from_position, target_position, min_distance, max_distance, angle, max_tries, above, below)
	local tries = 0
	local to_vec = Vector3.flat(from_position - target_position)

	if Vector3.length_squared(to_vec) < 0.001 then
		return
	end

	local span = max_distance - min_distance
	local median = (min_distance + max_distance) * 0.5
	local increment = span / max_tries
	local to_dir = Vector3.normalize(to_vec)
	local angle_rad = math.degrees_to_radians(angle)

	while tries < max_tries do
		local dir = (tries % 2 - 0.5) * 2
		local wanted_dist = median + (math.floor(tries * 0.5) + Math.random()) * dir * increment
		local rotate_vec = to_dir * wanted_dist
		local new_pos = target_position + Quaternion.rotate(Quaternion(Vector3.up(), angle_rad), rotate_vec)
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, new_pos, above or 30, below or 30)

		if success then
			new_pos.z = altitude

			return new_pos, wanted_dist
		end

		tries = tries + 1
	end
end

local MAX_TRIES = 10
local MIN_ANGLE = 0
local MIN_ANGLE_STEP = 4
local MAX_ANGLE_STEP = 8
local OUTSIDE_GOAL_TRIES = 3

LocomotionUtils.pick_visible_outside_goal = function (params)
	local max_tries = params.max_tries or MAX_TRIES
	local min_angle = params.min_angle or MIN_ANGLE
	local min_angle_step = params.min_angle_step or MIN_ANGLE_STEP
	local max_angle_step = params.max_angle_step or MAX_ANGLE_STEP
	local outside_goal_tries = params.outside_goal_tries or OUTSIDE_GOAL_TRIES
	local nav_world = params.nav_world
	local physics_world = params.physics_world
	local from_unit = params.from_unit
	local to_unit = params.to_unit
	local from_node_name = params.from_node_name
	local to_node_name = params.to_node_name
	local min_distance = params.min_distance
	local max_distance = params.max_distance
	local above = params.above
	local below = params.below
	local from_node = Unit.node(from_unit, from_node_name)
	local from_node_position = Unit.world_position(from_unit, from_node)
	local to_node = Unit.node(to_unit, to_node_name)
	local to_node_position = Unit.world_position(to_unit, to_node)
	local min_found_radius_sq = nil
	local min_wanted_radius = params.min_wanted_radius
	local min_wanted_radius_sq = min_wanted_radius and min_wanted_radius^2
	local radius_check_directions = params.radius_check_directions
	local num_directions = radius_check_directions and #radius_check_directions
	local traverse_logic = params.traverse_logic
	local from_position = POSITION_LOOKUP[from_unit]
	local to_position = POSITION_LOOKUP[to_unit]
	local direction = params.direction or 1 - math.random(0, 1) * 2
	local delta_up = Vector3.up() * 0.05
	local result = nil

	for j = 1, 2, 1 do
		for i = 1, max_tries, 1 do
			local angle = min_angle + math.random(min_angle_step * i, max_angle_step * i) * direction
			local position, wanted_distance = LocomotionUtils.outside_goal(nav_world, from_position, to_position, min_distance, max_distance, angle, outside_goal_tries, above, below)

			if position then
				local from_unit_line_of_sight, hit_pos1 = PerceptionUtils.is_position_in_line_of_sight(from_unit, from_node_position, position + delta_up, physics_world)
				local to_unit_line_of_sight, hit_pos2 = nil

				if from_unit_line_of_sight then
					to_unit_line_of_sight, hit_pos2 = PerceptionUtils.is_position_in_line_of_sight(to_unit, to_node_position, position + delta_up, physics_world)
					result = to_unit_line_of_sight
				end

				if to_unit_line_of_sight and radius_check_directions then
					min_found_radius_sq = math.huge

					for i = 1, num_directions, 1 do
						local check_direction = radius_check_directions[i]:unbox()
						local check_end_position = position + check_direction
						local hit, hit_position = nil

						if traverse_logic then
							hit, hit_position = GwNavQueries.raycast(nav_world, position, check_end_position, traverse_logic)
						else
							hit, hit_position = GwNavQueries.raycast(nav_world, position, check_end_position)
						end

						local hit_distance_sq = Vector3.distance_squared(position, hit_position)

						if hit_distance_sq < min_wanted_radius_sq then
							result = false

							break
						elseif hit_distance_sq < min_found_radius_sq then
							min_found_radius_sq = hit_distance_sq
						end
					end
				end

				if script_data.debug_ai_movement then
					QuickDrawerStay:sphere(position, 0.15, Colors.get("orange"))
					QuickDrawerStay:line(from_node_position, position, (from_unit_line_of_sight and Colors.get("orange")) or Colors.get("red"))
					QuickDrawerStay:line(to_node_position, position, (to_unit_line_of_sight and Colors.get("orange")) or Colors.get("red"))

					if hit_pos1 then
						QuickDrawerStay:sphere(hit_pos1, 0.1, Colors.get("red"))
					end

					if hit_pos2 then
						QuickDrawerStay:sphere(hit_pos2, 0.1, Colors.get("red"))
					end

					if to_unit_line_of_sight then
						QuickDrawerStay:sphere(position, 0.05, Colors.get("green"))
					end
				end

				if result then
					local min_found_radius = min_found_radius_sq and math.sqrt(min_found_radius_sq)

					return position, min_found_radius, wanted_distance, direction
				end
			end
		end

		direction = -direction
	end
end

LocomotionUtils.test_pos = function (nav_world, pos)
	local fail = 0
	local success = 0

	for i = -10, 10, 1 do
		for j = -10, 10, 1 do
			local test_pos = pos + Vector3(i, j, 0)
			local mesh_pos = LocomotionUtils.pos_on_mesh(nav_world, test_pos)

			if mesh_pos then
				QuickDrawer:sphere(mesh_pos, 0.2, Color(255, 144, 43, 207))

				success = success + 1
			else
				fail = fail + 1
			end
		end
	end

	Debug.text("Points ok %.2f fail: %d", success / (success + fail), fail)
end

LocomotionUtils.get_close_pos_on_mesh = function (nav_world, pos, searches)
	local failed_points = {}
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, 30, 30)

	if success then
		local projected_pos = Vector3(pos.x, pos.y, altitude)

		print("BOSS POINT FOUND AT FIRST POINT OK!")

		return projected_pos
	end

	failed_points[#failed_points + 1] = Vector3Box(pos)
	searches = searches or 4

	for k = 1, 4, 1 do
		for x = -1, 1, 1 do
			for y = -1, 1, 1 do
				if x ~= 0 or y ~= 0 then
					local new_pos = pos + Vector3(x * k, y * k, 0)
					local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, new_pos, 30, 30)

					if success then
						local projected_pos = Vector3(new_pos.x, new_pos.y, altitude)

						print("BOSS POINT FOUND AFTER", #failed_points, "TRIES")

						return projected_pos, failed_points
					end

					failed_points[#failed_points + 1] = Vector3Box(new_pos)
				end
			end
		end
	end

	return nil, failed_points
end

LocomotionUtils.get_close_pos_below_on_mesh = function (nav_world, pos, searches)
	local failed_points = {}
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, 1, 8)

	if success then
		local projected_pos = Vector3(pos.x, pos.y, altitude)

		return projected_pos
	end

	failed_points[#failed_points + 1] = Vector3Box(pos)
	searches = searches or 4

	for k = 1, 4, 1 do
		for x = -1, 1, 1 do
			for y = -1, 1, 1 do
				if x ~= 0 or y ~= 0 then
					local new_pos = pos + Vector3(x * k, y * k, 0)
					local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, new_pos, 1, 8)

					if success then
						local projected_pos = Vector3(new_pos.x, new_pos.y, altitude)

						return projected_pos, failed_points
					end

					failed_points[#failed_points + 1] = Vector3Box(new_pos)
				end
			end
		end
	end

	return nil, failed_points
end

local circle_points = {
	1,
	0,
	0.707,
	0.707,
	0,
	1,
	-0.707,
	0.707,
	-1,
	0,
	-0.707,
	-0.707,
	0,
	-1,
	0.707,
	-0.707
}

LocomotionUtils.mesh_positions_closest_to_outside_pos = function (nav_world, outside_pos, radius, point_list)
	local num_points = #circle_points

	for i = 1, num_points, 2 do
		local test_pos = outside_pos + Vector3(circle_points[i] * radius, circle_points[i + 1] * radius, 0)
		local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, test_pos, 30, 30)

		if success then
			point_list[#point_list + 1] = Vector3Box(test_pos.x, test_pos.y, altitude)
		end
	end

	return #point_list > 0
end

LocomotionUtils.closest_mesh_positions_outward = function (nav_world, outside_pos, radius, point_list)
	local step_dist = 3
	local steps = math.ceil(radius / step_dist)
	local num_points = #circle_points

	for i = 1, num_points, 2 do
		local x = circle_points[i]
		local y = circle_points[i + 1]

		for r = 1, steps, 1 do
			local test_pos = outside_pos + Vector3(x * r * step_dist, y * r * step_dist, 0)
			local p = GwNavQueries.inside_position_from_outside_position(nav_world, test_pos, 30, 30)

			if p then
				point_list[#point_list + 1] = Vector3Box(p)

				break
			end
		end
	end
end

LocomotionUtils.pos_on_mesh = function (nav_world, pos, above, below)
	local above = above or 30
	local below = below or 30
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

	if success then
		local projected_pos = Vector3(pos.x, pos.y, altitude)

		return projected_pos
	end
end

LocomotionUtils.ray_can_go_on_mesh = function (nav_world, position_start, position_end, traverse_logic, above, below)
	local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, position_start, above, below)
	local projected_end_pos = projected_start_pos and LocomotionUtils.pos_on_mesh(nav_world, position_end, above, below)
	local raycango = nil

	if traverse_logic then
		raycango = projected_end_pos and GwNavQueries.raycango(nav_world, projected_start_pos, projected_end_pos, traverse_logic)
	else
		raycango = projected_end_pos and GwNavQueries.raycango(nav_world, projected_start_pos, projected_end_pos)
	end

	return raycango, projected_start_pos, projected_end_pos
end

LocomotionUtils.raycast_on_navmesh = function (nav_world, position_start, position_end, traverse_logic, above, below, end_pos_nav_projection)
	local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, position_start, above, below)
	local projected_end_pos = projected_start_pos and ((not end_pos_nav_projection and position_end) or LocomotionUtils.pos_on_mesh(nav_world, position_end, above, below))
	local success, hit_position = nil

	if projected_end_pos then
		if traverse_logic then
			success, hit_position = GwNavQueries.raycast(nav_world, projected_start_pos, projected_end_pos, traverse_logic)
		else
			success, hit_position = GwNavQueries.raycast(nav_world, projected_start_pos, projected_end_pos)
		end
	end

	return success, projected_start_pos, projected_end_pos, hit_position
end

local FLAT_GROUND_UP_DOT_THRESHOLD = 0.9

LocomotionUtils.is_on_flat_ground_raycast = function (physics_world, unit_position)
	local ray_source = unit_position + Vector3.up() * 0.1
	local hit_ground, _, _, ground_normal = PhysicsWorld.immediate_raycast(physics_world, ray_source, Vector3.down(), 0.15, "closest", "collision_filter", "filter_ai_mover")
	local is_standing_on_flat_ground = nil

	if hit_ground then
		local up_dot = Vector3.dot(ground_normal, Vector3.up())
		is_standing_on_flat_ground = FLAT_GROUND_UP_DOT_THRESHOLD < up_dot
	end

	return is_standing_on_flat_ground
end

local EPSILON_SQ = 0.0001
local NAV_CHECK_ABOVE = 0.25
local NAV_CHECK_BELOW = 0.25
local NAV_CHECK_DISTANCE = 0.3
local WALL_CHECK_RAYCAST_LENGTH = 1.3
local WALL_CHECK_RAYCAST_LOW_HEIGHT = 0.4

LocomotionUtils.navmesh_movement_check = function (unit_position, unit_velocity, nav_world, physics_world, traverse_logic)
	local is_moving = EPSILON_SQ < Vector3.length_squared(unit_velocity)
	local direction = (is_moving and Vector3.normalize(unit_velocity)) or Vector3.zero()
	local target_position = unit_position + direction * NAV_CHECK_DISTANCE
	local raycango, projected_unit_pos, projected_target_pos = LocomotionUtils.ray_can_go_on_mesh(nav_world, unit_position, target_position, traverse_logic, NAV_CHECK_ABOVE, NAV_CHECK_BELOW)
	local result = "navmesh_ok"

	if not raycango and is_moving then
		local allowed_to_do_wall_check = LocomotionUtils.is_on_flat_ground_raycast(physics_world, unit_position)
		local hit_wall, ray_source, hit_position = nil

		if allowed_to_do_wall_check then
			ray_source = unit_position + Vector3.up() * WALL_CHECK_RAYCAST_LOW_HEIGHT
			hit_wall, hit_position = PhysicsWorld.immediate_raycast(physics_world, ray_source, direction, WALL_CHECK_RAYCAST_LENGTH, "closest", "collision_filter", "filter_ai_mover")
		end

		if script_data.debug_ai_movement then
			QuickDrawerStay:sphere(projected_unit_pos or unit_position, 0.125, (projected_unit_pos and Colors.get("blue")) or Colors.get("pink"))
			QuickDrawerStay:line(projected_unit_pos or unit_position, projected_target_pos or target_position, Colors.get("purple"))
			QuickDrawerStay:sphere(projected_target_pos or target_position, 0.125, (projected_target_pos and Colors.get("light_blue")) or Colors.get("purple"))

			if allowed_to_do_wall_check then
				QuickDrawerStay:sphere(ray_source, 0.25, Colors.get("green"))
				QuickDrawerStay:line(ray_source, ray_source + direction * WALL_CHECK_RAYCAST_LENGTH, Colors.get("yellow"))
				QuickDrawerStay:sphere(hit_position or ray_source + direction * WALL_CHECK_RAYCAST_LENGTH, 0.25, (hit_wall and Colors.get("red")) or Colors.get("green"))
			end
		end

		if hit_wall then
			result = "navmesh_hit_wall"
		else
			result = "navmesh_use_mover"
		end
	end

	return result
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

LocomotionUtils.clear_los = function (physics_world, p1, p2, ignore_unit1, ignore_unit2)
	local to_vec = p2 - p1
	local dist = Vector3.length(to_vec)
	local result, num_hits = PhysicsWorld.immediate_raycast(physics_world, p1, to_vec, dist, "all", "collision_filter", "filter_ai_mover", "use_global_table")

	if result then
		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit[INDEX_ACTOR]
			local hit_unit = Actor.unit(hit_actor)
			local attack_hit_self = hit_unit == ignore_unit1

			if not attack_hit_self and hit_unit ~= ignore_unit2 then
				return false
			end
		end
	end

	return true
end

LocomotionUtils.target_in_los = function (unit, blackboard)
	if not Unit.alive(blackboard.target_unit) then
		return
	end

	local target_node = Unit.node(blackboard.target_unit, "j_neck")
	local target_pos = Unit.world_position(blackboard.target_unit, target_node)
	local start_node = Unit.node(unit, "j_neck")
	local start_pos = Unit.world_position(unit, start_node)
	local to_vec = target_pos - start_pos
	local dist = Vector3.length(to_vec)
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, start_pos, to_vec, dist, "all", "collision_filter", "filter_ray_projectile", "use_global_table")

	if result then
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit[INDEX_ACTOR]
			local hit_unit = Actor.unit(hit_actor)
			local attack_hit_self = hit_unit == unit

			if not attack_hit_self and hit_unit ~= blackboard.target_unit then
				return false
			end
		end
	end

	return true
end

LocomotionUtils.enable_linked_movement = function (world, child_unit, parent_unit, parent_node_index, offset)
	local player_manager = Managers.player
	local player = player_manager:owner(child_unit)

	if player.remote then
		local unit_storage = Managers.state.unit_storage
		local go_id = unit_storage:go_id(child_unit)
		local owner_id = unit_storage:owner(go_id)
		local level = LevelHelper:current_level(world)
		local parent_level_unit_index = Level.unit_index(level, parent_unit)
		local network_manager = Managers.state.network

		if network_manager:game() then
			network_manager.network_transmit:send_rpc("rpc_enable_linked_movement", owner_id, go_id, parent_level_unit_index, parent_node_index, offset)
		end
	else
		local locomotion_extension = ScriptUnit.extension(child_unit, "locomotion_system")

		locomotion_extension:enable_linked_movement(parent_unit, parent_node_index, offset)
	end
end

LocomotionUtils.disable_linked_movement = function (unit)
	local player_manager = Managers.player
	local player = player_manager:owner(unit)

	if player and player.remote then
		local unit_storage = Managers.state.unit_storage
		local go_id = unit_storage:go_id(unit)
		local owner_id = unit_storage:owner(go_id)
		local network_manager = Managers.state.network

		if network_manager:game() then
			network_manager.network_transmit:send_rpc("rpc_disable_linked_movement", owner_id, go_id)
		end
	else
		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

		locomotion_extension:disable_linked_movement()
	end
end

LocomotionUtils.calculate_wanted_lerp_velocity = function (position_current, position_start, position_end, start_time, end_time, dt, t)
	local lerp_t = math.min(1, (t - start_time) / (end_time - start_time))
	local position = Vector3.lerp(position_start, position_end, lerp_t)
	local distance = Vector3.distance(position_current, position)
	local wanted_velocity = distance / dt
end

LocomotionUtils.in_crosshairs_dodge = function (unit, blackboard, t, radius, in_crosshairs_time, min_distance, max_distance)
	min_distance = min_distance or 0
	max_distance = max_distance or math.huge
	local units = PLAYER_AND_BOT_UNITS
	blackboard.aim_times = blackboard.aim_times or {}
	local aim_times = blackboard.aim_times
	local debug_ai_movement = script_data.debug_ai_movement

	for i = 1, #units, 1 do
		local player_unit = units[i]
		local player_inventory = ScriptUnit.extension(player_unit, "inventory_system")
		local using_ranged_weapon = player_inventory:get_wielded_slot_name() == "slot_ranged"
		local weapon_template = player_inventory:get_wielded_slot_item_template()

		if weapon_template and weapon_template.no_dodge then
			using_ranged_weapon = false
		end

		if using_ranged_weapon then
			local pos = Unit.world_position(unit, Unit.node(unit, "j_neck"))
			local player_pos = Unit.world_position(player_unit, Unit.node(player_unit, "camera_attach"))
			local to_rat = pos - player_pos
			local player_locomotion = ScriptUnit.extension(player_unit, "locomotion_system")
			local rotation = player_locomotion:current_rotation()
			local aim_direction = Quaternion.forward(rotation)
			local dist = Vector3.length(to_rat)
			local miss_vec = to_rat - aim_direction * dist
			local aim_distance = Vector3.length(miss_vec)
			local bulls_eye = nil

			if aim_distance < radius and min_distance < dist and dist < max_distance then
				local rot = Unit.local_rotation(unit, 0)
				local rat_forward = Quaternion.forward(rot)
				local to_rat_normalized = Vector3.normalize(to_rat)
				local dot = Vector3.dot(to_rat_normalized, rat_forward)

				if dot < -0.3 then
					if in_crosshairs_time then
						local aim_time = aim_times[player_unit]

						if not aim_time then
							aim_time = t + in_crosshairs_time
							aim_times[player_unit] = aim_time
						elseif aim_time < t then
							return miss_vec, aim_direction
						end

						if debug_ai_movement then
							QuickDrawer:sphere(pos, radius, Color(0, 255, 0))
							QuickDrawer:cylinder(pos, pos + Vector3(0, 0, aim_time - t), 0.2, Color(0, 255, 0))
						end

						bulls_eye = true
					else
						return miss_vec, aim_direction
					end
				elseif debug_ai_movement then
					QuickDrawer:sphere(pos, radius)
				end
			end

			if not bulls_eye then
				aim_times[player_unit] = nil
			end
		end
	end
end

LocomotionUtils.separate_mover_fallbacks = function (mover, seprarate_dist)
	local is_colliding, colliding_actor, move_vector, new_position = Mover.separate(mover, seprarate_dist)

	if is_colliding and new_position then
		Mover.set_position(mover, new_position)
	end

	local success = (is_colliding and new_position) or not is_colliding

	return success
end

LocomotionUtils.on_alerted_dodge = function (unit, blackboard, alerting_unit, enemy_unit)
	local pos = Unit.world_position(unit, Unit.node(unit, "j_neck"))
	local enemy_pos, rotation = nil
	local real_attacker_unit = AiUtils.get_actual_attacker_unit(enemy_unit)

	if DamageUtils.is_player_unit(real_attacker_unit) then
		local locomotion_extension = ScriptUnit.has_extension(real_attacker_unit, "locomotion_system")
		local node = Unit.has_node(real_attacker_unit, "camera_attach") and Unit.node(real_attacker_unit, "camera_attach")
		rotation = locomotion_extension:current_rotation()
		enemy_pos = Unit.world_position(real_attacker_unit, node)
	else
		rotation = Unit.world_rotation(real_attacker_unit, 0)
		enemy_pos = Unit.world_position(real_attacker_unit, 0)
	end

	local to_rat = pos - enemy_pos
	local aim_direction = Quaternion.forward(rotation)
	local dist = Vector3.length(to_rat)
	local miss_vec = to_rat - aim_direction * dist

	return miss_vec, aim_direction
end

LocomotionUtils.get_vortex_spin_velocity = function (unit_position, center_pos, wanted_radius, up_direction, rotation_speed, radius_change_speed, ascension_speed, dt)
	local epsilon = 0.0001
	local to_unit = unit_position - center_pos
	local flat_to_unit = Vector3.flat(to_unit)
	local flat_to_unit_dir = Vector3.normalize(flat_to_unit)
	local current_radius = Vector3.length(flat_to_unit)
	local angular_speed = rotation_speed / math.max(current_radius, epsilon)
	local delta_rotation = angular_speed * dt
	local new_rotation = Quaternion.axis_angle(up_direction, delta_rotation)
	local new_radius = nil

	if wanted_radius < current_radius then
		new_radius = math.max(current_radius - radius_change_speed * dt, wanted_radius)
	else
		new_radius = math.min(current_radius + radius_change_speed * dt, wanted_radius)
	end

	local current_height = to_unit.z
	local new_height = current_height + ascension_speed * dt
	local new_direction = Quaternion.rotate(new_rotation, flat_to_unit_dir)
	local wanted_position = center_pos + new_direction * new_radius + new_height * up_direction
	local velocity = (wanted_position - unit_position) / math.max(dt, epsilon)
	local perpenticular_dir = Vector3.cross(flat_to_unit_dir, Vector3.up())

	return velocity, new_radius, new_height, perpenticular_dir
end

local function debug_sticky_text(...)
	if script_data.debug_big_boy_turning then
		Debug.sticky_text(...)
	end
end

LocomotionUtils.check_start_turning = function (unit, t, dt, blackboard)
	local action = blackboard.action
	local start_anims = action.start_anims_name
	local breed = blackboard.breed

	fassert(start_anims, "Breed %s is using big boy turning without having start_anims defined in follow action", breed.name)

	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension
	local position = POSITION_LOOKUP[unit]
	local wanted_destination = blackboard.wanted_destination and blackboard.wanted_destination:unbox()

	if not wanted_destination then
		return
	end

	local is_computing = navigation_extension:is_computing_path()
	local is_following_path = navigation_extension:is_following_path()

	if is_computing or not is_following_path then
		if script_data.debug_big_boy_turning then
			QuickDrawer:circle(position + Vector3.up() * 0.1, 1, Vector3.up(), Colors.get("red"))
		end

		return
	end

	local current_node_position, next_node_1_position, next_node_2_position = navigation_extension:get_current_and_next_node_positions_in_nav_path()

	if current_node_position == nil or next_node_1_position == nil then
		return
	end

	local nav_path_node_position = (next_node_2_position and next_node_2_position) or next_node_1_position
	local nav_path_direction = Vector3.normalize(nav_path_node_position - current_node_position)
	local rotation = Unit.world_rotation(unit, 0)
	local forward = Quaternion.forward(rotation)
	local right = Quaternion.right(rotation)
	local navigation_velocity = Vector3.normalize(navigation_extension:desired_velocity())

	if script_data.debug_big_boy_turning then
		QuickDrawer:line(position + Vector3.up() * 0.5, position + Vector3.up() * 0.5 + nav_path_direction * 2, Colors.get("yellow"))
		QuickDrawer:vector(position + Vector3.up() * 0.5, forward, Colors.get("aqua_marine"))
		QuickDrawer:vector(position + Vector3.up() * 0.5, right, Colors.get("sienna"))
		QuickDrawer:vector(position + Vector3.up() * 0.55, navigation_velocity, Colors.get("green"))
	end

	local right_dot = Vector3.dot(right, nav_path_direction)
	local fwd_dot = Vector3.dot(forward, nav_path_direction)
	local abs_right_dot = math.abs(right_dot)
	local abs_fwd_dot = math.abs(fwd_dot)

	LocomotionUtils.update_leaning(unit, blackboard, dt, abs_fwd_dot, right_dot)

	local big_boy_turning_dot = breed.big_boy_turning_dot
	local dont_need_to_turn = big_boy_turning_dot < fwd_dot

	if dont_need_to_turn then
		return
	end

	local start_anim = nil

	if abs_fwd_dot < abs_right_dot then
		if right_dot > 0 then
			start_anim = start_anims.right

			debug_sticky_text("turn_right:" .. start_anim)
		else
			start_anim = start_anims.left

			debug_sticky_text("turn_left, " .. start_anim)
		end
	else
		start_anim = start_anims.bwd

		debug_sticky_text("turn_backwards, " .. start_anim)
	end

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, start_anim)

	blackboard.move_animation_name = start_anim
	blackboard.rotate_towards_position = Vector3Box(next_node_1_position)
	blackboard.is_turning = true
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
end

LocomotionUtils.update_leaning = function (unit, blackboard, dt, abs_fwd_dot, right_dot)
	local leaning_left = right_dot < 0
	local target_lean = (1 - abs_fwd_dot) * 25

	if leaning_left then
		target_lean = -target_lean or target_lean
	end

	target_lean = math.clamp(target_lean, -1, 1)
	local current_lean = blackboard.animation_lean or 0
	local lerp_speed = 5
	local lean = math.lerp(current_lean, target_lean, lerp_speed * dt)
	local animation_variable_lean = Unit.animation_find_variable(unit, "lean")

	Unit.animation_set_variable(unit, animation_variable_lean, lean)

	blackboard.animation_lean = lean
end

LocomotionUtils.update_turning = function (unit, t, dt, blackboard)
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension
	local position = POSITION_LOOKUP[unit]

	if blackboard.anim_cb_rotation_start then
		debug_sticky_text("anim_cb_rotation_start")

		blackboard.anim_cb_rotation_start = nil

		if blackboard.is_turning then
			local rotate_towards_position = blackboard.rotate_towards_position:unbox()
			local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, rotate_towards_position, blackboard.move_animation_name, blackboard.action.start_anims_data)

			locomotion_extension:use_lerp_rotation(false)
			LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
			LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)

			blackboard.animation_rotation_lock = true

			if script_data.debug_big_boy_turning then
				QuickDrawerStay:sphere(rotate_towards_position, 0.22, Colors.get("red"))
			end
		end
	end

	if blackboard.anim_cb_move then
		debug_sticky_text("anim_cb_move")

		blackboard.anim_cb_move = nil

		LocomotionUtils.reset_turning(unit, blackboard)
	end
end

LocomotionUtils.reset_turning = function (unit, blackboard)
	debug_sticky_text("reset_turning")

	blackboard.is_turning = false

	LocomotionUtils.set_animation_driven_movement(unit, false)
	LocomotionUtils.set_animation_rotation_scale(unit, 1)
end

return
