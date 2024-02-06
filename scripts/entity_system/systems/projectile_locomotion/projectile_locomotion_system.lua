﻿-- chunkname: @scripts/entity_system/systems/projectile_locomotion/projectile_locomotion_system.lua

require("scripts/unit_extensions/weapons/projectiles/projectile_physics_husk_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_physics_unit_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_script_unit_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_sticky_locomotion")

ProjectileLocomotionSystem = class(ProjectileLocomotionSystem, ExtensionSystemBase)

local RPCS = {
	"rpc_set_projectile_state",
	"rpc_projectile_stick_unit",
	"rpc_projectile_stick_position",
	"rpc_hot_join_sync_projectile_sticky",
}
local extensions = {
	"ProjectilePhysicsHuskLocomotionExtension",
	"ProjectilePhysicsUnitLocomotionExtension",
	"ProjectileScriptUnitLocomotionExtension",
	"ProjectileTrueFlightLocomotionExtension",
	"ProjectileHomingSkullLocomotionExtension",
	"ProjectileExtrapolatedHuskLocomotionExtension",
	"ProjectileStickyLocomotion",
	"ProjectileEtherealSkullLocomotionExtension",
}

ProjectileLocomotionSystem.init = function (self, entity_system_creation_context, name)
	ProjectileLocomotionSystem.super.init(self, entity_system_creation_context, name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._server_position_corrected_pickups = {}
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
		self:_server_sync_position_rotation(dt, t)
	else
		self:_client_validate_position_rotation(dt, t)
	end
end

ProjectileLocomotionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

ProjectileLocomotionSystem._server_sync_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local POSITION_LOOKUP = POSITION_LOOKUP
		local GameSession_set_game_object_field = GameSession.set_game_object_field
		local unit_storage = Managers.state.unit_storage
		local Unit_local_rotation = Unit.local_rotation
		local position_network_info_min = NetworkConstants.position.min
		local position_network_info_max = NetworkConstants.position.max

		for unit, _ in pairs(self._server_position_corrected_pickups) do
			local game_object_id = unit_storage:go_id(unit)
			local pos = Vector3.clamp(POSITION_LOOKUP[unit], position_network_info_min, position_network_info_max)
			local rot = Unit_local_rotation(unit, 0)

			GameSession_set_game_object_field(game, game_object_id, "position", pos)
			GameSession_set_game_object_field(game, game_object_id, "rotation", rot)
		end
	end
end

local REST_CORRECTION_DISTANCE = 0.05
local ACTIVE_CORRECTION_DISTANCE = 5

ProjectileLocomotionSystem._client_validate_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local POSITION_LOOKUP = POSITION_LOOKUP
		local GameSession_game_object_field = GameSession.game_object_field
		local Vector3_distance_squared = Vector3.distance_squared
		local ScriptUnit_extension = ScriptUnit.extension
		local Unit_local_position = Unit.local_position
		local unit_storage = Managers.state.unit_storage

		for unit, _ in pairs(self._server_position_corrected_pickups) do
			local game_object_id = unit_storage:go_id(unit)
			local server_pos = GameSession_game_object_field(game, game_object_id, "position")
			local client_pos = POSITION_LOOKUP[unit] or Unit_local_position(unit, 0)
			local extension = ScriptUnit_extension(unit, "projectile_locomotion_system")
			local is_at_rest = extension:is_at_rest()
			local allowed_dist = is_at_rest and REST_CORRECTION_DISTANCE or ACTIVE_CORRECTION_DISTANCE

			if Vector3_distance_squared(server_pos, client_pos) > allowed_dist * allowed_dist then
				local server_rot = GameSession_game_object_field(game, game_object_id, "rotation")

				extension:teleport(server_pos, server_rot)
			end
		end
	end
end

ProjectileLocomotionSystem.rpc_set_projectile_state = function (self, channel_id, projectile_unit_id, state_id)
	local projectile_unit = self.unit_storage:unit(projectile_unit_id)
	local extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")

	extension:set_projectile_state(projectile_unit, state_id)
end

ProjectileLocomotionSystem.rpc_projectile_stick_unit = function (self, channel_id, projectile_unit_id, stick_unit_id)
	local projectile_unit = self.unit_storage:unit(projectile_unit_id)
	local extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")
	local stick_unit = self.unit_storage:unit(stick_unit_id)

	extension:stick_to_unit(stick_unit)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_projectile_stick_unit", peer_id, projectile_unit_id, stick_unit_id)
	end
end

ProjectileLocomotionSystem.rpc_projectile_stick_position = function (self, channel_id, projectile_unit_id, stick_position)
	local projectile_unit = self.unit_storage:unit(projectile_unit_id)
	local extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")

	extension:stick_to_position(stick_position)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_projectile_stick_position", peer_id, projectile_unit_id, stick_position)
	end
end

ProjectileLocomotionSystem.rpc_hot_join_sync_projectile_sticky = function (self, channel_id, projectile_unit_id, time_lived, time_stopped)
	local projectile_unit = self.unit_storage:unit(projectile_unit_id)

	if projectile_unit then
		local extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")

		extension:hot_join_sync_projectile_sticky(time_lived, time_stopped)
	end
end
