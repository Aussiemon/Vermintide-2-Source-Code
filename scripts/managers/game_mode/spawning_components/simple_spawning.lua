-- chunkname: @scripts/managers/game_mode/spawning_components/simple_spawning.lua

require("scripts/managers/game_mode/spawning_components/spawning_helper")

SimpleSpawning = class(SimpleSpawning)

SimpleSpawning.init = function (self, profile_synchronizer, use_spawn_point_groups)
	self._profile_synchronizer = profile_synchronizer
	self._spawn_point_groups = {}
	self._use_spawn_point_groups = use_spawn_point_groups
end

SimpleSpawning.setup_data = function (self, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	status.game_mode_data = {
		health_percentage = 1,
		health_state = "alive",
		spawn_state = "not_spawned",
		temporary_health_percentage = 0,
		ammo = {
			slot_melee = 1,
			slot_ranged = 1,
		},
	}
end

SimpleSpawning._get_random_spawn_point = function (self)
	local spawn_points = self._spawn_point_groups[1]
	local spawn_point = spawn_points[Math.random(1, #spawn_points)]
	local position = spawn_point.pos:unbox()
	local rotation = spawn_point.rot:unbox()

	return position, rotation
end

SimpleSpawning._get_free_spawn_point = function (self, party_id, index)
	local spawn_points = self._spawn_point_groups[party_id]
	local spawn_point = spawn_points[index]
	local position = spawn_point.pos:unbox()
	local rotation = spawn_point.rot:unbox()

	return position, rotation
end

SimpleSpawning.update = function (self, t, dt, party)
	if Managers.state.network:game() then
		local player_manager = Managers.player
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]
			local data = status.game_mode_data
			local spawn_state = data.spawn_state

			if spawn_state == "not_spawned" then
				local profile_synchronizer = self._profile_synchronizer
				local peer_id = status.peer_id
				local local_player_id = status.local_player_id
				local profile_index, career_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)
				local player = player_manager:player(peer_id, local_player_id)

				if player and profile_index and career_index and profile_synchronizer:all_synced() then
					local position, rotation

					if self._use_spawn_point_groups then
						position, rotation = self:_get_free_spawn_point(party.party_id, i)
					else
						position, rotation = self:_get_random_spawn_point()
					end

					local is_initial_spawn = false
					local ammo_melee_percent_int = 100
					local ammo_ranged_percent_int = 100
					local ability_cooldown_percentage_int = 100
					local non_item_id = NetworkLookup.item_names["n/a"]

					Managers.state.network.network_transmit:send_rpc("rpc_to_client_spawn_player", peer_id, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, ability_cooldown_percentage_int, non_item_id, non_item_id, non_item_id, {}, {})

					data.spawn_state = "spawning"
				end
			elseif spawn_state == "spawning" then
				local peer_id = status.peer_id
				local local_player_id = status.local_player_id
				local player = player_manager:player(peer_id, local_player_id)

				if player.player_unit then
					data.spawn_state = "spawned"
				end
			elseif spawn_state == "spawned" then
				local peer_id = status.peer_id
				local local_player_id = status.local_player_id
				local player = player_manager:player(peer_id, local_player_id)

				if not player.player_unit then
					data.spawn_state = "not_spawned"
				end
			end
		end
	end
end

SimpleSpawning.flow_callback_add_spawn_point = function (self, unit)
	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot),
	}
	local group_id = self._use_spawn_point_groups and tonumber(Unit.get_data(unit, "group")) or 1
	local spawn_points = self._spawn_point_groups[group_id]

	if not spawn_points then
		spawn_points = {}
		self._spawn_point_groups[group_id] = spawn_points
	end

	spawn_points[#spawn_points + 1] = spawn_point
end
