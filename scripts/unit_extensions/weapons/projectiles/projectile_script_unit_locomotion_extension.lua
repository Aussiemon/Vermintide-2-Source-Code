require("scripts/helpers/network_utils")

ProjectileScriptUnitLocomotionExtension = class(ProjectileScriptUnitLocomotionExtension)

ProjectileScriptUnitLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	local world = extension_init_context.world
	self.world = world
	self.t = Managers.time:time("game") - (extension_init_data.fast_forward_time or 0)
	self.gravity_settings = extension_init_data.gravity_settings or "default"
	self.rotate_around = extension_init_data.rotate_around
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

	assert(self.trajectory_template_name)

	self.is_husk = not not extension_init_data.is_husk
	self.is_server = Managers.player.is_server
	self.stopped = false
	self.moved = false

	Unit.set_local_position(unit, 0, initial_position)
end

ProjectileScriptUnitLocomotionExtension.destroy = function (self)
	return
end

ProjectileScriptUnitLocomotionExtension.update = function (self, unit, input, _, context, t)
	self.dt = t - self.t
	self.moved = false

	if self.stopped then
		return
	end

	local position = POSITION_LOOKUP[unit]
	local dt = self.dt
	local speed = self.speed / 100
	local angle = self.radians
	local gravity = self.gravity
	local target_vector = Vector3Box.unbox(self.target_vector_boxed)
	local initial_position = Vector3Box.unbox(self.initial_position_boxed)
	local trajectory_template_name = self.trajectory_template_name
	local is_husk = self.is_husk
	local trajectory = ProjectileTemplates.get_trajectory_template(trajectory_template_name, is_husk)
	local new_position = trajectory.update(speed, angle, gravity, initial_position, target_vector, dt)
	local direction = new_position - position
	local length = Vector3.length(direction)

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

	if script_data.debug_projectiles then
		QuickDrawerStay:line(position, new_position, Color(255, 255, 255, 0))
	end

	local direction_norm = Vector3.normalize(direction)
	local rotation = Quaternion.look(direction_norm)

	if self.rotate_around then
		local axis = Vector3.make_axes(direction_norm)
		rotation = Quaternion.multiply(Quaternion.axis_angle(axis, self.dt * 10), rotation)
	end

	Unit.set_local_rotation(unit, 0, rotation)
	Unit.set_local_position(unit, 0, new_position)
	self.velocity:store(direction)

	self.moved = true
end

ProjectileScriptUnitLocomotionExtension.moved_this_frame = function (self)
	return self.moved
end

ProjectileScriptUnitLocomotionExtension.current_velocity = function (self)
	return self.velocity:unbox()
end

ProjectileScriptUnitLocomotionExtension.stop = function (self)
	self.stopped = true
end

ProjectileScriptUnitLocomotionExtension.has_stopped = function (self)
	return self.stopped
end

return
