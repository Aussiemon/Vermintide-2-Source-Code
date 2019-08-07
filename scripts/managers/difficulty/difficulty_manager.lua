require("scripts/settings/difficulty_settings")

DifficultyManager = class(DifficultyManager)

DifficultyManager.init = function (self, world, is_server, network_event_delegate, lobby_host)
	self.world = world
	self.is_server = is_server
	self.network_event_delegate = network_event_delegate
	self.lobby_host = lobby_host

	network_event_delegate:register(self, "rpc_set_difficulty")

	self.difficulty = nil
end

DifficultyManager.set_difficulty = function (self, difficulty)
	self.difficulty = difficulty
	self.difficulty_rank = DifficultySettings[difficulty].rank

	Managers.mechanism:set_difficulty(difficulty)
	SET_BREED_DIFFICULTY()

	if self.is_server then
		local lobby_data = self.lobby_host:get_stored_lobby_data()
		lobby_data.difficulty = difficulty

		self.lobby_host:set_lobby_data(lobby_data)

		local network_manager = Managers.state.network

		if network_manager then
			local network_transmit = network_manager.network_transmit
			local difficulty_id = NetworkLookup.difficulties[self.difficulty]

			network_transmit:send_rpc_clients("rpc_set_difficulty", difficulty_id, false)
		end
	end
end

DifficultyManager.get_level_difficulties = function (self, level_key)
	local level_settings = level_key and LevelSettings[level_key]
	local difficulty_settings = level_settings and level_settings.difficulties
	local starting_difficulty = level_settings and level_settings.starting_difficulty

	return difficulty_settings or DefaultDifficulties, starting_difficulty or DefaultStartingDifficulty
end

DifficultyManager.get_difficulty = function (self)
	return self.difficulty
end

DifficultyManager.get_difficulty_rank = function (self)
	return self.difficulty_rank
end

DifficultyManager.get_difficulty_settings = function (self)
	return DifficultySettings[self.difficulty]
end

DifficultyManager.hot_join_sync = function (self, sender)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local difficulty_id = NetworkLookup.difficulties[self.difficulty]

	network_transmit:send_rpc("rpc_set_difficulty", sender, difficulty_id, true)
end

DifficultyManager.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

DifficultyManager.rpc_set_difficulty = function (self, sender, difficulty_id, hot_join)
	local difficulty = NetworkLookup.difficulties[difficulty_id]

	self:set_difficulty(difficulty)

	if hot_join then
		Managers.state.event:trigger("difficulty_synced")
	end
end

local players_below_power_level = {}

DifficultyManager.players_below_required_power_level = function (difficulty_key, players)
	table.clear(players_below_power_level)

	local required_power_level = DifficultySettings[difficulty_key].required_power_level

	for unique_id, player in pairs(players) do
		if player:sync_data_active() and player:get_data("best_aquired_power_level") < required_power_level then
			players_below_power_level[#players_below_power_level + 1] = player
		end
	end

	return players_below_power_level
end

local player_below_difficulty_rank = {}

DifficultyManager.players_below_difficulty_rank = function (difficulty_key, players)
	table.clear(player_below_difficulty_rank)

	local difficulty_settings = DifficultySettings[difficulty_key]

	for unique_id, player in pairs(players) do
		if player:sync_data_active() then
			local difficulty_id = player:get_data("highest_unlocked_difficulty")
			local highest_difficulty = NetworkLookup.difficulties[difficulty_id]
			local highest_difficulty_settings = DifficultySettings[highest_difficulty]

			if highest_difficulty_settings.rank < difficulty_settings.rank then
				player_below_difficulty_rank[#player_below_difficulty_rank + 1] = player
			end
		end
	end

	return player_below_difficulty_rank
end

return
