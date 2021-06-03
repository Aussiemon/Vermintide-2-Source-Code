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
	self._last_position = Vector3Box(POSITION_LOOKUP[unit])
	self._position = Vector3Box(POSITION_LOOKUP[unit])
	self._rotation = QuaternionBox(Unit.world_rotation(unit, 0))
	self.is_server = Managers.player.is_server
	self.stopped = false
	self.moved = false

	Unit.set_local_position(unit, 0, initial_position)
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
	self.life_time = t - self.spawn_time
	self.dt = t - self.t
	self.moved = false

	if self.stopped then
		return
	end

	local position = self._position:unbox()
	self.speed = self.speed - self.dt * self.speed * (1 - self._linear_dampening)
	local life_time = self.life_time
	local speed = self.speed / 100
	local radians = self.radians
	local gravity = self.gravity
	local target_vector = Vector3Box.unbox(self.target_vector_boxed)
	local initial_position = Vector3Box.unbox(self.initial_position_boxed)
	local trajectory_template_name = self.trajectory_template_name
	local is_husk = self.is_husk
	local trajectory = ProjectileTemplates.get_trajectory_template(trajectory_template_name, is_husk)
	local new_position = trajectory.update(speed, radians, gravity, initial_position, target_vector, life_time)
	local velocity = new_position - position
	local direction = Vector3.normalize(velocity)
	local length = Vector3.length(velocity)

	if not NetworkUtils.network_safe_position(new_position) then
		self:stop()

		if not self.is_husk then
			Managers.state.unit_spawner:mark_for_deletion(self.unit)
		end

		return
	end

	if length <= 0.001 then
		return
	end

	local direction_norm = Vector3.normalize(direction)
	local rotation = Quaternion.look(direction_norm)

	if self.rotation_offset then
		rotation = Quaternion.multiply(rotation, Quaternion.from_euler_angles_xyz(self.rotation_offset.x, self.rotation_offset.y, self.rotation_offset.z))
	end

	if self.rotation_speed ~= 0 then
		local left = -Quaternion.right(Quaternion.look(direction_norm, Vector3.up()))
		rotation = Quaternion.multiply(Quaternion.axis_angle(left, self.life_time * self.rotation_speed), rotation)
	end

	self:_unit_set_position_rotation(unit, new_position, rotation)
	self._last_position:store(position)
	self._position:store(new_position)
	self.velocity:store(velocity)
	self._rotation:store(rotation)

	self.moved = true
	self.t = t
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

return
