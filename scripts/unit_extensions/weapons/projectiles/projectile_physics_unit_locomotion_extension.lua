ProjectilePhysicsUnitLocomotionExtension = class(ProjectilePhysicsUnitLocomotionExtension)
script_data.debug_projectiles = script_data.debug_projectiles or Development.parameter("debug_projectiles")
ProjectilePhysicsUnitLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.physics_world = World.get_data(extension_init_context.world, "physics_world")
	self.owner_unit = extension_init_data.owner_unit
	self.network_position = extension_init_data.network_position
	self.network_rotation = extension_init_data.network_rotation
	self.network_velocity = extension_init_data.network_velocity
	self.network_angular_velocity = extension_init_data.network_angular_velocity
	self.is_server = Managers.player.is_server
	self.is_husk = not self.is_server
	self.stopped = false
	self.dropped = false
	local network_manager = Managers.state.network
	self.game = network_manager.game(network_manager)
	self.network_manager = network_manager
	local position = AiAnimUtils.position_network_scale(self.network_position)
	local rotation = AiAnimUtils.rotation_network_scale(self.network_rotation)
	local velocity = AiAnimUtils.velocity_network_scale(self.network_velocity)
	local angular_velocity = AiAnimUtils.velocity_network_scale(self.network_angular_velocity)
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

	return 
end
ProjectilePhysicsUnitLocomotionExtension.destroy = function (self)
	return 
end
local STOP_VELOCITY_THRESHOLD = 0.1
local STOP_TIME_THRESHOLD = 0.5
ProjectilePhysicsUnitLocomotionExtension.update = function (self, unit, input, dt, context, t)
	if self.stopped then
		return 
	end

	if script_data.debug_projectiles then
		local network_manager = self.network_manager
		local go_id = network_manager.unit_game_object_id(network_manager, unit)
		local game = network_manager.game(network_manager)

		GameSession.set_game_object_field(game, go_id, "debug_pos", Unit.local_position(unit, 0))
	end

	local physics_actor = self.physics_actor
	local current_velocity = Actor.velocity(physics_actor)
	local current_velocity_length = Vector3.length(current_velocity)

	if current_velocity_length > STOP_VELOCITY_THRESHOLD then
		self.stop_time = nil

		return 
	end

	local stop_time = self.stop_time or 0
	stop_time = stop_time + dt
	self.stop_time = stop_time

	if STOP_TIME_THRESHOLD <= stop_time then
		self.stop(self)
	end

	return 
end
local BOUNCE_FORCE_THRESHOLD = 1
ProjectilePhysicsUnitLocomotionExtension.bounce = function (self, touching_unit, position, normal, separation_distance, impulse_force)
	local length = Vector3.length(impulse_force)

	if BOUNCE_FORCE_THRESHOLD < length then
	end

	return 
end
ProjectilePhysicsUnitLocomotionExtension.stop = function (self)
	self.stopped = true

	Actor.put_to_sleep(self.physics_actor)

	local network_manager = self.network_manager
	local go_id = network_manager.unit_game_object_id(network_manager, self.unit)

	network_manager.network_transmit:send_rpc_clients("rpc_projectile_stopped", go_id)

	return 
end
ProjectilePhysicsUnitLocomotionExtension.drop = function (self)
	self.dropped = true

	Actor.set_velocity(self.physics_actor, Vector3(0, 0, 0))

	local network_manager = self.network_manager
	local go_id = network_manager.unit_game_object_id(network_manager, self.unit)

	network_manager.network_transmit:send_rpc_clients("rpc_drop_projectile", go_id)

	return 
end
ProjectilePhysicsUnitLocomotionExtension.has_stopped = function (self)
	return self.stopped
end

return 
