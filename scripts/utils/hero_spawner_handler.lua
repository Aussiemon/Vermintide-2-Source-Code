HeroSpawnerHandler = class(HeroSpawnerHandler)

HeroSpawnerHandler.init = function (self, is_server, profile_synchronizer, network_event_delegate)
	self.profile_synchronizer = profile_synchronizer
	self.is_server = is_server
	self.request_id = 0
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_to_client_spawn_player")
end

HeroSpawnerHandler.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

HeroSpawnerHandler.spawn_hero_request = function (self, player, hero_name)
	if self.pending_profile_request then
		return false
	end

	self.peer_id = Network:peer_id()
	self.player = player
	self.hero_name = hero_name
	self.hero_index = FindProfileIndex(hero_name)
	self.result = nil
	self.request_id = self.request_id + 1

	Managers.transition:fade_in(2, callback(self, "start"))

	self.hero_spawner_faded_in = true

	return self.request_id
end

HeroSpawnerHandler.start = function (self)
	local player = self.player
	local player_unit = player.player_unit

	if player_unit then
		local position = Unit.world_position(player_unit, 0)
		local rotation = Unit.world_rotation(player_unit, 0)

		player:set_spawn_position_rotation(position, rotation)

		self.despawning_player_unit = player.player_unit

		Managers.state.spawn:delayed_despawn(player)
	else
		self.profile_synchronizer:request_select_profile(self.hero_index, player:local_player_id())
	end

	self.pending_profile_request = true
end

HeroSpawnerHandler.update = function (self, dt)
	if self.pending_profile_request then
		local profile_synchronizer = self.profile_synchronizer

		if self.despawning_player_unit then
			if not Unit.alive(self.despawning_player_unit) then
				profile_synchronizer:request_select_profile(self.hero_index, self.player:local_player_id())

				self.hero_index = nil
				self.despawning_player_unit = nil

				if self.is_server then
					Managers.state.network.network_server:peer_despawned_player(self.peer_id)
				end
			end
		else
			local result, result_local_player_id = profile_synchronizer:profile_request_result()
			local local_player_id = self.player:local_player_id()

			assert(not result or local_player_id == result_local_player_id, "Local player id mismatch between ui and request.")

			if result == "success" then
				local peer_id = self.peer_id
				local hero_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

				self.player:set_profile_index(hero_index)
				self:save_selected_profile(hero_index)

				self.result = "success"

				profile_synchronizer:clear_profile_request_result()

				self.pending_profile_request = nil
			elseif result then
				self.result = "failed"

				profile_synchronizer:clear_profile_request_result()

				self.pending_profile_request = nil
			end
		end
	end
end

HeroSpawnerHandler.save_selected_profile = function (self, index)
	local save_manager = Managers.save
	local save_data = SaveData
	SaveData.wanted_profile_index = index

	save_manager:auto_save(SaveFileName, SaveData, nil)
end

HeroSpawnerHandler.query_result = function (self, request_id)
	fassert(request_id == self.request_id, "HeroSpawnerHandler:query_result with invalid request_id")

	return self.result
end

HeroSpawnerHandler.rpc_to_client_spawn_player = function (self, sender, local_player_id, profile_index, position, rotation, is_initial_spawn)
	if self.hero_spawner_faded_in then
		Managers.transition:fade_out(1)

		self.hero_spawner_faded_in = false
	end
end

return
