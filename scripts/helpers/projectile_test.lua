ProjectileTest = ProjectileTest or {}
local POSITION_LOOKUP = POSITION_LOOKUP
local projectiles = {}
ProjectileTest.add_simulated_projectile = function (p1, p2, projectile_speed, projectile_angle, target_velocity, gravity)
	local angle, speed, new_p2 = nil

	if projectile_speed then
		angle, new_p2 = WeaponHelper.angle_to_hit_moving_target(p1, p2, projectile_speed, target_velocity, gravity, 0.1)

		if angle then
			local to_target = new_p2 - p1
			local vec_flat = Vector3.normalize(Vector3.flat(to_target))
			local x_vel_0 = math.cos(angle) * projectile_speed
			local y_vel_0 = math.sin(angle) * projectile_speed
			projectiles[#projectiles + 1] = {
				type = "known_speed",
				last_dot = 0,
				t = 0,
				last_pos = Vector3Box(p1),
				p1 = Vector3Box(p1),
				p2 = Vector3Box(new_p2),
				x_vel_0 = x_vel_0,
				y_vel_0 = y_vel_0,
				vec_flat = Vector3Box(vec_flat),
				gravity = gravity
			}
		end
	elseif projectile_angle then
		speed, new_p2 = WeaponHelper.speed_to_hit_moving_target(p1, p2, projectile_angle, target_velocity, gravity, 0.1)

		if speed then
			local to_target = new_p2 - p1
			local vec_flat = Vector3.normalize(Vector3.flat(to_target))
			local x_vel_0 = math.cos(projectile_angle) * speed
			local y_vel_0 = math.sin(projectile_angle) * speed
			projectiles[#projectiles + 1] = {
				type = "known_angle",
				last_dot = 0,
				t = 0,
				last_pos = Vector3Box(p1),
				p1 = Vector3Box(p1),
				p2 = Vector3Box(new_p2),
				x_vel_0 = x_vel_0,
				y_vel_0 = y_vel_0,
				vec_flat = Vector3Box(vec_flat),
				gravity = gravity
			}
		end
	end

	return 
end
ProjectileTest.simulate_projectiles = function (physics_world, dt)
	Debug.text("PROJECTILES:%d", #projectiles)

	local destroy = false

	for i = 1, #projectiles, 1 do
		local p = projectiles[i]
		local color = (p.type == "known_angle" and Color(180, 180, 0)) or Color(80, 180, 70)
		local target_pos = p.p2:unbox()
		local last_pos = p.last_pos:unbox()
		local pos = WeaponHelper.draw_ball_at_time(physics_world, p.p1:unbox(), p.vec_flat:unbox(), -p.gravity, p.x_vel_0, p.y_vel_0, p.t, color)
		local vel_dir = Vector3.normalize(pos - last_pos)
		local to_target = Vector3.normalize(target_pos - pos)
		local dot = Vector3.dot(vel_dir, to_target)

		QuickDrawer:line(pos, target_pos, color)

		local hit = dot * p.last_dot < 0

		if hit or 10 < p.t then
			if 1 < Vector3.distance(pos, target_pos) then
				QuickDrawer:sphere(p.p2:unbox(), 0.24, color)
			else
				QuickDrawer:sphere(p.p2:unbox(), 0.2, Color(240, 40, 40))
			end

			p.destroy = true
			destroy = true
		else
			QuickDrawer:sphere(p.p2:unbox(), 0.14, color)
		end

		p.last_pos:store(pos)

		p.last_dot = dot
		p.t = p.t + dt
	end

	if destroy then
		for i = #projectiles, 1, -1 do
			local p = projectiles[i]

			if p.destroy then
				projectiles[i] = projectiles[#projectiles]
				projectiles[#projectiles] = nil
			end
		end
	end

	return 
end
local next_proj_test = 0
ProjectileTest.run_projectile_test = function (world, t, dt)
	Profiler.start("hit moving")

	local gravity = 9.82
	local physics_world = World.get_data(world, "physics_world")
	local p2 = PLAYER_POSITIONS[1]
	local player_locomotion = ScriptUnit.extension(PLAYER_UNITS[1], "locomotion_system")
	local target_velocity = player_locomotion.velocity_current:unbox()
	local p1 = Vector3(0, 0, 0)
	local projectile_speed = 30
	local projectile_angle = math.pi / 4
	local acceptable_accuracy = 0.01

	QuickDrawer:sphere(p1, 0.5, Color(200, 30, 30))
	ProjectileTest.simulate_projectiles(physics_world, dt)

	if next_proj_test < t then
		local odd = math.floor(next_proj_test) % 2 == 0

		if odd then
			ProjectileTest.add_simulated_projectile(p1, p2, nil, projectile_angle, target_velocity, gravity)
		else
			ProjectileTest.add_simulated_projectile(p1, p2, projectile_speed, nil, target_velocity, gravity)
		end

		next_proj_test = t + 0.25
	end

	local angle, new_pos = WeaponHelper.angle_to_hit_moving_target(p1, p2, projectile_speed, target_velocity, gravity, acceptable_accuracy)

	if angle then
		QuickDrawer:sphere(new_pos, 0.5, Color(80, 180, 70))
	end

	local speed, new_pos = WeaponHelper.speed_to_hit_moving_target(p1, p2, projectile_angle, target_velocity, gravity, acceptable_accuracy)

	if speed then
		QuickDrawer:sphere(new_pos, 0.5, Color(180, 180, 0))
	end

	return 
end
ProjectileTest.trajectory_test = function (set_speed, set_angle)
	for i = 20, 35, 1 do
		local p1 = Vector3(0, 0, 0)
		local p2 = Vector3(i, 0, 0)
		local distance_vector = p2 - p1
		local gravity = 9.82
		local rad = WeaponHelper.wanted_projectile_angle(nil, distance_vector, gravity, set_speed)
		local angle = math.radians_to_degrees(rad)
		local speed = WeaponHelper.wanted_projectile_speed(nil, distance_vector, gravity, math.degrees_to_radians(set_angle))

		print(sprintf("Distance: %.1f  1) speed: %.1f and angle: %.1f OR speed: %.1f and angle: %.1f", i, set_speed, angle, speed, set_angle))
	end

	return 
end
ProjectileTest.draw_projectile_trajectory = function (p1, p2, gravity, projectile_speed)
	local time_step = 0.016666666666666666
	local distance_vector = p2 - p1
	local above = p2.z < p1.z
	local a1, a2 = WeaponHelper:wanted_projectile_angle(distance_vector, gravity, projectile_speed)
	local angle = a1 or a2

	QuickDrawer:sphere(p1, 0.05, Color(255, 0, 128, 0))
	QuickDrawer:sphere(p2, 0.05, Color(255, 0, 0, 128))

	if angle then
		local vec_flat = Vector3.normalize(Vector3.flat(distance_vector))
		local velocity = Quaternion.rotate(Quaternion.axis_angle(Vector3.cross(vec_flat, Vector3.up()), angle), vec_flat) * projectile_speed
		local old_pos = p1 + Vector3(0, 0, 0.5)
		local pos = p1 + Vector3(0, 0, 0.15)
		local color_table = GameSettingsDevelopment.debug_unit_colors
		local i = 1
		velocity = velocity * time_step

		while i < 1000 do
			velocity = velocity - Vector3(0, 0, gravity * time_step * time_step)
			pos = pos + velocity
			local color_index = (i - 1) % #color_table + 1
			local col = color_table[color_index]

			QuickDrawer:line(old_pos, pos, Color(255, col[1], col[2], col[3]))

			local current_velocity = pos - old_pos
			local to_target = p2 - pos

			if Vector3.dot(current_velocity, to_target) < -0.9 then
				break
			end

			old_pos = pos
			i = i + 1
		end
	end

	return 
end

return 
