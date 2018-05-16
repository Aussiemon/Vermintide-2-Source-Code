ProjectilePhysicsHuskLocomotionExtension = class(ProjectilePhysicsHuskLocomotionExtension)
script_data.debug_projectiles = script_data.debug_projectiles or Development.parameter("debug_projectiles")

ProjectilePhysicsHuskLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	self.is_server = Managers.player.is_server
	self.is_husk = not self.is_server
	self.stopped = false
	local position = AiAnimUtils.position_network_scale(extension_init_data.network_position)
	local rotation = AiAnimUtils.rotation_network_scale(extension_init_data.network_rotation)
	local velocity = AiAnimUtils.velocity_network_scale(extension_init_data.network_velocity)
	local angular_velocity = AiAnimUtils.velocity_network_scale(extension_init_data.network_angular_velocity)
	local physics_actor = Unit.create_actor(unit, "throw")

	Actor.teleport_position(physics_actor, position)
	Actor.teleport_rotation(physics_actor, rotation)
	Actor.set_velocity(physics_actor, velocity)
	Actor.set_angular_velocity(physics_actor, angular_velocity)

	self.physics_actor = physics_actor

	for i = 1, Unit.num_actors(unit), 1 do
		local actor = Unit.actor(unit, i)

		if actor and Actor.is_physical(actor) and actor ~= physics_actor then
			Actor.set_velocity(actor, velocity)
			Actor.set_angular_velocity(actor, angular_velocity)
		end
	end
end

ProjectilePhysicsHuskLocomotionExtension.destroy = function (self)
	return
end

ProjectilePhysicsHuskLocomotionExtension.update = function (self, unit, input, dt, context, t)
	if script_data.debug_projectiles then
		local network_manager = Managers.state.network
		local go_id = network_manager:unit_game_object_id(unit)
		local game = network_manager:game()
		local debug_pos = GameSession.game_object_field(game, go_id, "debug_pos")
		local pos = Unit.local_position(unit, 0)

		QuickDrawer:line(debug_pos, pos, Color(255, 0, 255, 0))
	end

	if self.stopped then
		return
	end
end

ProjectilePhysicsHuskLocomotionExtension.is_at_rest = function (self)
	return Actor.is_sleeping(self.physics_actor)
end

ProjectilePhysicsHuskLocomotionExtension.teleport = function (self, position, rotation)
	local pose = Matrix4x4.from_quaternion_position(rotation, position)
	local unit = self.unit
	local actor = self.physics_actor

	Unit.set_local_pose(unit, 0, pose)
	Actor.teleport_pose(actor, pose)

	local null_vector = Vector3.zero()

	Actor.set_angular_velocity(actor, null_vector)
	Actor.set_velocity(actor, null_vector)
end

ProjectilePhysicsHuskLocomotionExtension.bounce = function (self)
	return
end

ProjectilePhysicsHuskLocomotionExtension.stop = function (self)
	self.stopped = true

	Actor.put_to_sleep(self.physics_actor)
end

ProjectilePhysicsHuskLocomotionExtension.drop = function (self)
	self.dropped = true

	Actor.set_velocity(self.physics_actor, Vector3(0, 0, 0))
end

ProjectilePhysicsHuskLocomotionExtension.has_stopped = function (self)
	return self.stopped
end

return
