UnitSynchronizationExtension = class(UnitSynchronizationExtension)
local position_lookup = POSITION_LOOKUP

UnitSynchronizationExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
end

UnitSynchronizationExtension.update = function (self, unit, input, dt, context, t)
	if self.is_server then
		self:_server_sync_position_rotation(dt, t)
	else
		self:_client_validate_position_rotation(dt, t)
	end
end

UnitSynchronizationExtension._server_sync_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local GameSession_set_game_object_field = GameSession.set_game_object_field
		local unit_storage = Managers.state.unit_storage
		local Unit_local_rotation = Unit.local_rotation
		local position_network_info_min = NetworkConstants.position.min
		local position_network_info_max = NetworkConstants.position.max
		local unit = self.unit
		local game_object_id = unit_storage:go_id(unit)
		local pos = Vector3.clamp(position_lookup[unit], position_network_info_min, position_network_info_max)
		local rot = Unit_local_rotation(unit, 0)

		GameSession_set_game_object_field(game, game_object_id, "position", pos)
		GameSession_set_game_object_field(game, game_object_id, "rotation", rot)
	end
end

local CORRECTION_DISTANCE = 0.0001

UnitSynchronizationExtension._client_validate_position_rotation = function (self, dt, t)
	local game = Managers.state.network:game()

	if game then
		local GameSession_game_object_field = GameSession.game_object_field
		local Vector3_distance_squared = Vector3.distance_squared
		local Unit_local_position = Unit.local_position
		local unit_storage = Managers.state.unit_storage
		local unit = self.unit
		local game_object_id = unit_storage:go_id(unit)
		local server_pos = GameSession_game_object_field(game, game_object_id, "position")
		local client_pos = position_lookup[unit] or Unit_local_position(unit, 0)

		if CORRECTION_DISTANCE < Vector3_distance_squared(server_pos, client_pos) then
			local server_rot = GameSession_game_object_field(game, game_object_id, "rotation")

			Unit.set_local_position(unit, 0, server_pos)
			Unit.set_local_rotation(unit, 0, server_rot)
		end
	end
end

return
