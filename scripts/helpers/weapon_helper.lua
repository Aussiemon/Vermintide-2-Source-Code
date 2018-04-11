require("scripts/helpers/effect_helper")

WeaponHelper = WeaponHelper or {}
local POSITION_LOOKUP = POSITION_LOOKUP
WeaponHelper.wanted_projectile_angle = function (self, distance_vector, projectile_gravity, projectile_speed)
	local x = Vector3.length(Vector3.flat(distance_vector))

	if x <= 0 then
		return 
	end

	local y = distance_vector.z
	local g = projectile_gravity
	local v = projectile_speed
	local v2 = v * v
	local to_sqrt = v2 * v2 - g * (g * x * x + 2 * y * v2)

	fassert(g ~= 0, "Asking for projectile angle with gravity 0, this will cause division by 0.")

	if to_sqrt < 0 then
		return 
	end

	local s = math.sqrt(to_sqrt)
	local a1 = math.atan((v2 - s) / (g * x))
	local a2 = math.atan((v2 + s) / (g * x))

	return a1, a2, x
end
WeaponHelper.wanted_projectile_speed = function (self, distance_vector, projectile_gravity, wanted_angle)
	local x = Vector3.length(Vector3.flat(distance_vector))
	local y = distance_vector.z
	local g = math.abs(projectile_gravity)
	local denominator = 2 * (x * math.tan(wanted_angle) - y)

	fassert(denominator ~= 0, "Denominator is 0.")

	local aux = math.abs(g / denominator)

	if 0 <= aux then
		return x / math.cos(wanted_angle) * math.sqrt(aux), x
	end

	return 
end
WeaponHelper.speed_to_hit_moving_target = function (p1, p2, projectile_angle, target_velocity, gravity, acceptable_accuracy)
	local estimated_target_position = p2
	local old_estimated_target_position = p2
	local math_cos = math.cos(projectile_angle)

	for i = 1, 10, 1 do
		local distance_vector = estimated_target_position - p1
		local projectile_speed, flat_distance = WeaponHelper:wanted_projectile_speed(distance_vector, gravity, projectile_angle)
		local tof = flat_distance / (projectile_speed * math_cos)
		estimated_target_position = p2 + tof * target_velocity
		local distance_error = Vector3.length(estimated_target_position - old_estimated_target_position)

		if distance_error <= acceptable_accuracy then
			return projectile_speed, estimated_target_position
		end

		old_estimated_target_position = estimated_target_position
	end

	return 
end
WeaponHelper.angle_to_hit_moving_target = function (p1, p2, projectile_speed, target_velocity, gravity, acceptable_accuracy, use_greatest_angle)
	local t = 0
	local angle = nil
	local EPSILON = 0.01

	assert(0 < gravity, "Can't solve for <=0 gravity, use different projectile template")

	local estimated_target_position = p2
	local flat_distance = Vector3.length(Vector3.flat(estimated_target_position - p1))
	local old_flat_distance = flat_distance

	for i = 1, 10, 1 do
		local height = estimated_target_position.z - p1.z
		local speed_squared = projectile_speed^2

		if flat_distance < EPSILON then
			return 0, estimated_target_position
		end

		local sqrt_val = speed_squared^2 - gravity * (gravity * flat_distance^2 + 2 * height * speed_squared)

		if sqrt_val <= 0 then
			return nil, estimated_target_position
		end

		local second_degree_component = math.sqrt(sqrt_val)
		local angle1 = math.atan((speed_squared + second_degree_component) / (gravity * flat_distance))
		local angle2 = math.atan((speed_squared - second_degree_component) / (gravity * flat_distance))
		angle = (use_greatest_angle and math.max(angle1, angle2)) or math.min(angle1, angle2)
		t = flat_distance / (projectile_speed * math.cos(angle))
		estimated_target_position = p2 + t * target_velocity
		flat_distance = Vector3.length(Vector3.flat(estimated_target_position - p1))
		local distance_error = math.abs(old_flat_distance - flat_distance)

		if distance_error <= acceptable_accuracy then
			return angle, estimated_target_position
		end

		old_flat_distance = flat_distance
	end

	return angle, estimated_target_position
end
WeaponHelper.test_angled_trajectory = function (physics_world, p1, p2, gravity, projectile_speed, angle, segment_list, sections, collision_filter, always_complete)
	table.clear(segment_list)

	local distance_vector = p2 - p1
	local flat_dist, a1, a2 = nil

	if angle then
		projectile_speed, flat_dist = WeaponHelper:wanted_projectile_speed(distance_vector, -gravity, angle)
	elseif projectile_speed then
		a1, a2, flat_dist = WeaponHelper:wanted_projectile_angle(distance_vector, -gravity, projectile_speed)
		angle = a1 or a2
	end

	if angle and projectile_speed then
		local vec_flat = Vector3.normalize(Vector3.flat(distance_vector))
		local velocity = Quaternion.rotate(Quaternion.axis_angle(Vector3.cross(vec_flat, Vector3.up()), angle), vec_flat) * projectile_speed
		local x_vel_0 = math.cos(angle) * projectile_speed
		local y_vel_0 = math.sin(angle) * projectile_speed
		local flat_speed = Vector3.length(Vector3(velocity.x, velocity.y, 0))
		local t_total = flat_dist / flat_speed
		sections = sections or 4
		local t = 0
		local delta_time = t_total / sections
		local segment_pos1 = Vector3(p1.x, p1.y, p1.z)
		local segment_pos2 = nil
		segment_list[1] = p1

		for i = 1, sections, 1 do
			t = t_total * i / sections
			local x = x_vel_0 * t
			local z = y_vel_0 * t + 0.5 * gravity * t^2
			segment_pos2 = p1 + vec_flat * x
			segment_pos2.z = segment_pos2.z + z

			if not always_complete then
				local current_velocity = segment_pos2 - segment_pos1
				local result, hit_position, _, _, actor = PhysicsWorld.immediate_raycast(physics_world, segment_pos1, current_velocity, Vector3.length(current_velocity), "closest", "collision_filter", collision_filter or "filter_ai_mover")

				if result then
					if i == sections then
						local hit_unit = Actor.unit(actor)

						if POSITION_LOOKUP[hit_unit] then
							return true, velocity, t_total
						end
					end

					return false
				end
			end

			segment_pos1 = Vector3(segment_pos2.x, segment_pos2.y, segment_pos2.z)
			segment_list[i + 1] = segment_pos1
		end

		return true, velocity, t_total, angle
	end

	return 
end
WeaponHelper.ray_segmented_test = function (physics_world, segment_list, delta)
	local pos1 = segment_list[1] + delta
	local sections = #segment_list

	for i = 2, sections, 1 do
		local pos2 = segment_list[i] + delta
		local current_velocity = pos2 - pos1

		if Vector3.length(current_velocity) < 0.001 then
			slot11 = math.random()
		end

		local result, hit_position, _, _, actor = PhysicsWorld.immediate_raycast(physics_world, pos1, current_velocity, Vector3.length(current_velocity), "closest", "collision_filter", "filter_ai_mover")

		if script_data.debug_ai_movement then
			QuickDrawerStay:line(pos1, pos2, Colors.get_indexed(i))
		end

		if result then
			if i == sections then
				local hit_unit = Actor.unit(actor)

				if POSITION_LOOKUP[hit_unit] then
					return true
				end
			end

			return false
		end

		pos1 = pos2
	end

	return true
end
WeaponHelper.multi_ray_test = function (physics_world, p1, p2, relative_positions)
	local immediate_raycast = PhysicsWorld.immediate_raycast

	if script_data.debug_ai_movement then
		QuickDrawerStay:line(p1, p2, Color(100, 255, 0))
	end

	local current_velocity = p2 - p1
	local length = Vector3.length(current_velocity)
	local result, hit_position, _, _, actor = immediate_raycast(physics_world, p1, current_velocity, length, "closest", "collision_filter", "filter_ai_mover")

	if result then
		local hit_unit = Actor.unit(actor)

		if not POSITION_LOOKUP[hit_unit] then
			return false
		end
	end

	local right = Vector3.cross(Vector3.normalize(p2 - p1), Vector3.up()) * 1

	for i = 1, #relative_positions, 2 do
		local x = relative_positions[i]
		local y = relative_positions[i + 1]
		local delta = x * right + y * Vector3.up()
		local pos1 = p1 + delta
		local pos2 = p2 + delta
		local result, hit_position, _, _, actor = immediate_raycast(physics_world, pos1, current_velocity, length, "closest", "collision_filter", "filter_ai_mover")

		if script_data.debug_ai_movement then
			QuickDrawerStay:line(pos1, pos2, Colors.get_indexed(i))
		end

		if result then
			local hit_unit = Actor.unit(actor)

			if not POSITION_LOOKUP[hit_unit] then
				return false
			end
		end
	end

	return true
end
WeaponHelper.draw_ball_at_time = function (physics_world, p1, vec_flat, gravity, x_vel_0, y_vel_0, t, color)
	local length = t * x_vel_0
	local height = t * y_vel_0 + 0.5 * gravity * t^2
	local position = p1 + vec_flat * length
	position.z = position.z + height

	QuickDrawer:sphere(position, 0.3, color or Colors.get_indexed(66))

	return position
end
WeaponHelper.calculate_trajectory = function (self, world, initial_position, target_position, gravity, max_speed)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "trajectory_vectors"
	})

	drawer.reset(drawer)

	local target_vector = target_position - initial_position
	local normalized_target_vector = Vector3.normalize(Vector3.flat(target_vector))
	local angle = 30 + math.random(30)
	local radians = math.degrees_to_radians(angle)
	local trajectory_hits_target = nil
	local projectile_speed = math.round(WeaponHelper:wanted_projectile_speed(target_vector, gravity, radians) * 100, 0)

	if projectile_speed <= max_speed then
		trajectory_hits_target = WeaponHelper:_trajectory_hits_target(world, radians, projectile_speed / 100, gravity, initial_position, target_position, normalized_target_vector, drawer)
	end

	if not trajectory_hits_target then
		for i = 0, 4, 1 do
			angle = 30 + 10 * i
			radians = math.degrees_to_radians(angle)
			projectile_speed = math.round(WeaponHelper:wanted_projectile_speed(target_vector, gravity, radians) * 100, 0)

			if projectile_speed <= max_speed then
				trajectory_hits_target = WeaponHelper:_trajectory_hits_target(world, radians, projectile_speed / 100, gravity, initial_position, target_position, normalized_target_vector, drawer)
			end

			if trajectory_hits_target then
				break
			end
		end
	end

	return trajectory_hits_target, angle, projectile_speed
end
WeaponHelper._trajectory_hits_target = function (self, world, radians, speed, gravity, initial_position, target_position, normalized_target_vector, drawer)
	local points = {}
	local physics_world = World.get_data(world, "physics_world")

	for t = 0, 5, 0.5 do
		points[#points + 1] = WeaponHelper:position_on_trajectory(initial_position, normalized_target_vector, speed, radians, gravity, t)

		if Development.parameter("ai_debug_trajectory_raycast") then
			drawer.sphere(drawer, points[#points], 0.1, Color(255, 255, 255, 255))
		end

		if 0 < t then
			local direction = points[#points] - points[#points - 1]
			local normalized_direction = Vector3.normalize(direction)
			local length = Vector3.length(direction)
			local result, hit_position, _, _, actor = PhysicsWorld.immediate_raycast(physics_world, points[#points - 1], direction, length, "closest", "collision_filter", "filter_enemy_ray_projectile")

			if Development.parameter("ai_debug_trajectory_raycast") then
				drawer.vector(drawer, points[#points - 1], direction, Color(255, 255, 255, 255))
			end

			if result then
				local unit_hit_is_player = DamageUtils.is_player_unit(Actor.unit(actor))
				local hit_to_target_distance_squared = Vector3.distance_squared(target_position, hit_position)
				local hit_target = hit_to_target_distance_squared < 0.04 or (hit_to_target_distance_squared < 1 and unit_hit_is_player)

				if Development.parameter("ai_debug_trajectory_raycast") then
					WeaponHelper:debug_draw_trajectory_hit(hit_position, hit_target, drawer)
				end

				return hit_target
			end
		end
	end

	return false
end
WeaponHelper.position_on_trajectory = function (self, initial_position, normalized_target_vector, projectile_speed, radians, projectile_gravity, t)
	local length = projectile_speed * t * math.cos(radians)
	local height = projectile_speed * t * math.sin(radians) + 0.5 * projectile_gravity * t^2
	local position = initial_position + normalized_target_vector * length
	position.z = position.z + height

	return position
end
WeaponHelper.debug_draw_trajectory_hit = function (self, position, hit_target, drawer)
	local color = (hit_target and Color(255, 74, 247, 115)) or Color(255, 245, 108, 49)

	drawer.sphere(drawer, position, 0.1, color)

	return 
end

return 
