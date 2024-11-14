-- chunkname: @scripts/managers/difficulty/difficulty_manager.lua

require("scripts/settings/difficulty_settings")

DifficultyManager = class(DifficultyManager)

DifficultyManager.init = function (self, world, is_server, network_event_delegate, lobby_host)
	self.world = world
	self.is_server = is_server
	self.network_event_delegate = network_event_delegate
	self.lobby_host = lobby_host

	network_event_delegate:register(self, "rpc_set_difficulty")

	self.difficulty = nil
	self.fallback_difficulty = nil
	self.difficulty_setting = nil
	self.difficulty_tweak = 0
end

DifficultyManager.set_difficulty = function (self, difficulty, tweak)
	fassert(tweak and tweak >= -10 and tweak <= 10, "tweak must be a number from -10 to 10")

	if difficulty == "versus_base" then
		tweak = 0
	end

	self.difficulty = difficulty
	self.difficulty_setting = DifficultySettings[difficulty]
	self.difficulty_rank = self.difficulty_setting.rank
	self.fallback_difficulty = self.difficulty_setting.fallback_difficulty
	self.difficulty_tweak = tweak

	SET_BREED_DIFFICULTY(difficulty)

	if self.is_server then
		local lobby_data = self.lobby_host:get_stored_lobby_data()

		lobby_data.difficulty = difficulty
		lobby_data.difficulty_tweak = tweak

		self.lobby_host:set_lobby_data(lobby_data)

		local network_manager = Managers.state.network

		if network_manager then
			local network_transmit = network_manager.network_transmit
			local difficulty_id = NetworkLookup.difficulties[self.difficulty]

			network_transmit:send_rpc_clients("rpc_set_difficulty", difficulty_id, tweak, false)
		end
	end
end

DifficultyManager.get_default_difficulties = function (self)
	return DefaultDifficulties, DefaultStartingDifficulty
end

DifficultyManager.get_difficulty = function (self)
	return self.difficulty, self.difficulty_tweak
end

DifficultyManager.get_difficulty_rank = function (self)
	return self.difficulty_rank, self.difficulty_tweak
end

DifficultyManager.get_difficulty_settings = function (self)
	return self.difficulty_setting
end

DifficultyManager.get_difficulty_value_from_table = function (self, lookup_table)
	local difficulty_key = self.difficulty
	local val = lookup_table[difficulty_key]

	if val then
		return val
	end

	local fallback_difficulty = DifficultySettings[difficulty_key].fallback_difficulty

	return lookup_table[fallback_difficulty]
end

DifficultyManager.get_difficulty_index = function (self)
	return table.index_of(DefaultDifficulties, self.difficulty)
end

DifficultyManager.hot_join_sync = function (self, peer_id)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local difficulty_id = NetworkLookup.difficulties[self.difficulty]

	network_transmit:send_rpc("rpc_set_difficulty", peer_id, difficulty_id, self.difficulty_tweak, true)
end

DifficultyManager.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

DifficultyManager.rpc_set_difficulty = function (self, channel_id, difficulty_id, difficulty_tweak, hot_join)
	local difficulty = NetworkLookup.difficulties[difficulty_id]

	self:set_difficulty(difficulty, difficulty_tweak)

	if hot_join then
		Managers.state.event:trigger("difficulty_synced")
	end
end

local players_below_power_level = {}

DifficultyManager.players_below_required_power_level = function (difficulty_key, players)
	table.clear(players_below_power_level)

	local required_power_level = DifficultySettings[difficulty_key].required_power_level

	for unique_id, player in pairs(players) do
		if player:sync_data_active() and required_power_level > player:get_data("best_aquired_power_level") then
			players_below_power_level[#players_below_power_level + 1] = player
		end
	end

	return players_below_power_level
end

local player_below_difficulty_rank = {}

DifficultyManager.players_locked_difficulty_rank = function (difficulty_key, players)
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
