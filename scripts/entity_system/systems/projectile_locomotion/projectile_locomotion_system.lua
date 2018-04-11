ProjectileLocomotionSystem = class(ProjectileLocomotionSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_set_projectile_state"
}
ProjectileLocomotionSystem.init = function (self, entity_system_creation_context, ...)
	ProjectileLocomotionSystem.super.init(self, entity_system_creation_context, ...)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._server_position_corrected_pickups = {}

	return 
end
ProjectileLocomotionSystem.rpc_set_projectile_state = function (self, sender, projectile_unit_id, state_id)
	local projectile_unit = self.unit_storage:unit(projectile_unit_id)
	local extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")

	extension.set_projectile_state(extension, projectile_unit, state_id)

	return 
end
ProjectileLocomotionSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	if extension_name == "ProjectilePhysicsHuskLocomotionExtension" or extension_name == "ProjectilePhysicsUnitLocomotionExtension" then
		self._server_position_corrected_pickups[unit] = unit
	end

	return ProjectileLocomotionSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)
end
ProjectileLocomotionSystem.on_remove_extension = function (self, unit, extension_name, ...)
	self._server_position_corrected_pickups[unit] = nil

	return ProjectileLocomotionSystem.super.on_remove_extension(self, unit, extension_name, ...)
end
ProjectileLocomotionSystem.update = function (self, dt, t)
	ProjectileLocomotionSystem.super.update(self, dt, t)

	if self.is_server then
		self._server_sync_position_rotation(self, dt, t)
	else
		self._client_validate_position_rotation(self, dt, t)
	end

	return 
end
ProjectileLocomotionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
ProjectileLocomotionSystem._server_sync_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local GameSession_set_game_object_field = GameSession.set_game_object_field
		local unit_storage = Managers.state.unit_storage
		local Unit_local_rotation = Unit.local_rotation

		for unit, _ in pairs(self._server_position_corrected_pickups) do
			local game_object_id = unit_storage.go_id(unit_storage, unit)
			local position_network_info = NetworkConstants.position
			local pos = Vector3.clamp(POSITION_LOOKUP[unit], position_network_info.min, position_network_info.max)
			local rot = Unit_local_rotation(unit, 0)

			GameSession_set_game_object_field(game, game_object_id, "position", pos)
			GameSession_set_game_object_field(game, game_object_id, "rotation", rot)
		end
	end

	return 
end
local REST_CORRECTION_DISTANCE = 0.01
local ACTIVE_CORRECTION_DISTANCE = 5
ProjectileLocomotionSystem._client_validate_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local GameSession_game_object_field = GameSession.game_object_field
		local Vector3_distance_squared = Vector3.distance_squared
		local ScriptUnit_extension = ScriptUnit.extension
		local Unit_local_position = Unit.local_position
		local unit_storage = Managers.state.unit_storage

		for unit, _ in pairs(self._server_position_corrected_pickups) do
			local game_object_id = unit_storage.go_id(unit_storage, unit)
			local server_pos = GameSession_game_object_field(game, game_object_id, "position")
			local client_pos = POSITION_LOOKUP[unit] or Unit_local_position(unit, 0)
			local extension = ScriptUnit_extension(unit, "projectile_locomotion_system")
			local is_at_rest = extension.is_at_rest(extension)
			local allowed_dist = (is_at_rest and REST_CORRECTION_DISTANCE) or ACTIVE_CORRECTION_DISTANCE

			if allowed_dist * allowed_dist < Vector3_distance_squared(server_pos, client_pos) then
				local server_rot = GameSession_game_object_field(game, game_object_id, "rotation")

				extension.teleport(extension, server_pos, server_rot)
			end
		end
	end

	return 
end

return 
