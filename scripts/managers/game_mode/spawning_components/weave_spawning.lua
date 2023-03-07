require("scripts/managers/game_mode/spawning_components/adventure_spawning")

WeaveSpawning = class(WeaveSpawning, AdventureSpawning)

WeaveSpawning._get_spawn_position_close_to_server = function (self)
	local party = self._side.party
	local occupied_slots = party.occupied_slots
	local player_manager = Managers.player

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = peer_id and local_player_id and player_manager:player(peer_id, local_player_id)

		if player and player.is_server and player.player_unit then
			local whereabouts_extension = ScriptUnit.extension(player.player_unit, "whereabouts_system")
			local last_on_ground_pos = whereabouts_extension:last_position_onground_on_navmesh()

			return last_on_ground_pos
		end
	end
end

WeaveSpawning._find_spawn_point = function (self, status)
	local data = status.game_mode_data
	local position = self:_get_spawn_position_close_to_server()
	position = position or data.position:unbox()
	local rotation = data.rotation:unbox()

	return position, rotation
end
