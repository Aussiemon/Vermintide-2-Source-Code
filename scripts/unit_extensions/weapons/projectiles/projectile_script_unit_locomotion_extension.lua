-- chunkname: @scripts/unit_extensions/weapons/projectiles/projectile_script_unit_locomotion_extension.lua

require("scripts/helpers/network_utils")

ProjectileScriptUnitLocomotionExtension = class(ProjectileScriptUnitLocomotionExtension)

ProjectileScriptUnitLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit

	local world = extension_init_context.world

	self.world = world
	self.spawn_time = Managers.time:time("game") - (extension_init_data.fast_forward_time or 0)
	self.t = self.spawn_time
	self.gravity_settings = extension_init_data.gravity_settings or "default"
	self.rotation_speed = extension_init_data.rotation_speed or 0
	self.rotate_around_forward = extension_init_data.rotate_around_forward or false
	self.rotation_offset = extension_init_data.rotation_offset
	self.gravity = ProjectileGravitySettings[self.gravity_settings]
	self.velocity = Vector3Box()
	self.angle = extension_init_data.angle
	self.radians = math.degrees_to_radians(self.angle)
	self.speed = extension_init_data.speed

	local initial_position = extension_init_data.initial_position

	self.initial_position_boxed = Vector3Box(initial_position)
	self.target_vector = extension_init_data.target_vector
	self.target_vector_boxed = Vector3Box(self.target_vector)
	self.trajectory_template_name = extension_init_data.trajectory_template_name

	fassert(self.trajectory_template_name, "No trajectory template defined when initializing ProjectileScriptUnitLocomotionExtension")

	self._linear_dampening = extension_init_data.linear_dampening or 1
	self.is_husk = not not extension_init_data.is_husk
	self.traversal_data = {}

	if self.trajectory_template_name == "random_spinning_target_traversal" then
		self.traversal_data.random_spin_dir = (math.random(0, 1) - 0.5) * 2
	end

	if extension_init_data.target_positions then
		self.target_positions = extension_init_data.target_positions
		self.target_units = extension_init_data.target_units
		self._has_multiple_targets = true
		self.current_target_index = 1
		self.has_reached_all_targets = false
		self.impact_with_last_target = extension_init_data.impact_with_last_target or false
		self.random_x_axis = math.random(-100, 100) / 100
		self.random_y_axis = math.random(-30, 100) / 100
		self.distance_to_traverse = Vector3.distance(self.target_positions[1]:unbox(), initial_position)
	end

	self._last_position = Vector3Box(POSITION_LOOKUP[unit])
	self._position = Vector3Box(POSITION_LOOKUP[unit])
	self._rotation = QuaternionBox(Unit.world_rotation(unit, 0))
	self.is_server = Managers.player.is_server
	self.stopped = false
	self.moved = false

	local new_position, new_rotation

	if self._has_multiple_targets then
		new_position = self:_get_new_position_multiple_targetpoints(0, 0)
		new_rotation = self:_get_new_rotation(self.target_vector, 0)
	else
		new_position = self:_get_new_position(0)
		new_rotation = self:_get_new_rotation(self.target_vector, 0)
	end

	Unit.set_local_position(unit, 0, new_position)
	Unit.set_local_rotation(unit, 0, new_rotation)

	self.start_paused_for_time = extension_init_data.start_paused_for_time
end

ProjectileScriptUnitLocomotionExtension.destroy = function (self)
	return
end

ProjectileScriptUnitLocomotionExtension.bounce = function (self, hit_position, hit_direction, hit_normal)
	local bounce_dir = Vector3.normalize(Vector3.reflect(hit_direction, hit_normal))
	local bounce_pos = hit_position - hit_direction * 0.25 + hit_normal * 0.1
	local rotation = Quaternion.look(bounce_dir)

	self.spawn_time = Managers.time:time("game")
	self.t = self.spawn_time

	self.target_vector_boxed:store(bounce_dir)
	self.initial_position_boxed:store(bounce_pos)

	self.radians = math.degrees_to_radians(ActionUtils.pitch_from_rotation(rotation))

	self._position:store(bounce_pos)
	self:_unit_set_position_rotation(self.unit, bounce_pos, rotation)
end

ProjectileScriptUnitLocomotionExtension.update = function (self, unit, input, _, context, t)
	self.time_lived = t - self.spawn_time

	if self.start_paused_for_time then
		self.time_lived = math.max(0, self.time_lived - self.start_paused_for_time)
	end

	self.dt = t - self.t
	self.moved = false

	if self.stopped then
		return
	end

	local position = self._position:unbox()

	self.speed = self.speed - self.dt * self.speed * (1 - self._linear_dampening)

	local time_lived = self.time_lived
	local new_position

	if self._has_multiple_targets and not self.has_reached_all_targets then
		new_position = self:_get_new_position_multiple_targetpoints(time_lived, self.dt)
	else
		new_position = self:_get_new_position(time_lived, self.dt)
	end

	local velocity = new_position - position
	local direction = Vector3.normalize(velocity)
	local length = Vector3.length(velocity)

	if not NetworkUtils.network_safe_position(new_position) or self.has_reached_all_targets and self.time_lived >= 10 then
		self:stop()

		if not self.is_husk then
			Managers.state.unit_spawner:mark_for_deletion(self.unit)
		end

		return
	end

	if length <= 0.001 then
		return
	end

	local new_rotation = self:_get_new_rotation(direction, time_lived)

	self:_unit_set_position_rotation(unit, new_position, new_rotation)
	self._last_position:store(position)
	self._position:store(new_position)
	self.velocity:store(velocity)
	self._rotation:store(new_rotation)

	self.moved = true
	self.t = t
end

local target_hit_radius_sq = 9

ProjectileScriptUnitLocomotionExtension._get_new_position_multiple_targetpoints = function (self, time_lived, dt)
	local speed = self.speed
	local radians = self.radians
	local gravity = self.gravity
	local is_husk = self.is_husk
	local trajectory = ProjectileTemplates.get_trajectory_template(self.trajectory_template_name, is_husk)
	local target_vector = self.target_vector_boxed:unbox()
	local initial_position = Vector3Box.unbox(self.initial_position_boxed)
	local current_target = self.target_positions[self.current_target_index]:unbox()
	local position = self._position:unbox()

	self.traversal_data.current_target = current_target
	self.traversal_data.position = position
	self.traversal_data.random_x_axis = self.random_x_axis
	self.traversal_data.random_y_axis = self.random_y_axis
	self.traversal_data.distance_to_traverse = self.distance_to_traverse

	local new_position = trajectory.update(speed, radians, gravity, initial_position, target_vector, time_lived, dt, self.traversal_data)
	local distance_sq = Vector3.distance_squared(new_position, current_target)
	local in_hit_range = distance_sq < target_hit_radius_sq

	if not in_hit_range then
		return new_position
	end

	local has_next_target = #self.target_positions > self.current_target_index

	if has_next_target then
		self.current_target_index = self.current_target_index + 1
		self.trajectory_template_name = "straight_target_traversal"
	elseif self.impact_with_last_target then
		local new_target_hit_dist_sq = 0.010000000000000002

		if new_target_hit_dist_sq > Vector3.distance_squared(new_position, current_target) then
			local projectile_extension = ScriptUnit.extension(self.unit, "projectile_system")

			projectile_extension:force_impact(self.unit, new_position)
		end
	else
		self:rotate_projectile_away_from_target(new_position, position)
		Unit.flow_event(self.target_units[self.current_target_index], "deflect_projectile")

		self.trajectory_template_name = "straight_direction_traversal"
	end

	return new_position
end

ProjectileScriptUnitLocomotionExtension._get_new_position = function (self, time_lived, dt)
	local speed = self.speed
	local trajectory_template_name = self.trajectory_template_name

	if trajectory_template_name == "throw_trajectory" then
		speed = speed / 100
	end

	local radians = self.radians
	local gravity = self.gravity
	local is_husk = self.is_husk
	local trajectory = ProjectileTemplates.get_trajectory_template(trajectory_template_name, is_husk)
	local target_vector = self.target_vector_boxed:unbox()
	local initial_position = Vector3Box.unbox(self.initial_position_boxed)
	local position = self._position:unbox()
	local optional_data = {}

	optional_data.position = position

	local new_position = trajectory.update(speed, radians, gravity, initial_position, target_vector, time_lived, dt, optional_data)

	return new_position
end

ProjectileScriptUnitLocomotionExtension._get_new_rotation = function (self, direction, time_lived)
	local direction_norm = Vector3.normalize(direction)
	local rotation = Quaternion.look(direction_norm)

	if self.rotation_offset then
		rotation = Quaternion.multiply(rotation, Quaternion.from_euler_angles_xyz(self.rotation_offset.x, self.rotation_offset.y, self.rotation_offset.z))
	end

	if self.rotation_speed ~= 0 then
		local look_rotation = Quaternion.look(direction_norm, Vector3.up())
		local base_vector

		if self.rotate_around_forward then
			base_vector = Quaternion.forward(look_rotation)
		else
			base_vector = -Quaternion.right(look_rotation)
		end

		rotation = Quaternion.multiply(Quaternion.axis_angle(base_vector, time_lived * self.rotation_speed), rotation)
	end

	return rotation
end

ProjectileScriptUnitLocomotionExtension.rotate_projectile_away_from_target = function (self, new_position, position)
	self.has_reached_all_targets = true
	self._has_multiple_targets = false

	local direction = Vector3.normalize(new_position - position)
	local x, z = math.get_uniformly_random_point_inside_sector(0.75, 1.5, 0, 2 * math.pi)
	local new_direction = Quaternion.rotate(Quaternion.look(direction, Vector3.up()), Vector3.normalize(Vector3(x, 2, z)))

	self.target_vector_boxed = Vector3Box(new_direction)
end

ProjectileScriptUnitLocomotionExtension._unit_set_position_rotation = function (self, unit, position, rotation)
	Unit.set_local_rotation(unit, 0, rotation)
	Unit.set_local_position(unit, 0, position)
end

ProjectileScriptUnitLocomotionExtension.moved_this_frame = function (self)
	return self.moved
end

ProjectileScriptUnitLocomotionExtension.current_velocity = function (self)
	return self.velocity:unbox()
end

ProjectileScriptUnitLocomotionExtension.current_position = function (self)
	return self._position:unbox()
end

ProjectileScriptUnitLocomotionExtension.current_rotation = function (self)
	return self._rotation:unbox()
end

ProjectileScriptUnitLocomotionExtension.last_position = function (self)
	return self._last_position:unbox()
end

ProjectileScriptUnitLocomotionExtension.stop = function (self)
	self.stopped = true
end

ProjectileScriptUnitLocomotionExtension.has_stopped = function (self)
	return self.stopped
end
