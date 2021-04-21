PlayerSyncData = class(PlayerSyncData)

PlayerSyncData.init = function (self, player, network_manager)
	self._player = player
	self._network_manager = network_manager

	if player.local_player or (player.bot_player and player.is_server) then
		local highest_unlocked_difficulty = self:_calc_highest_unlocked_difficulty()
		local game_object_data_table = {
			best_aquired_power_level = 0,
			power_level = 0,
			go_type = NetworkLookup.go_types.player_sync_data,
			network_id = player:network_id(),
			local_player_id = player:local_player_id(),
			highest_unlocked_difficulty = NetworkLookup.difficulties[highest_unlocked_difficulty],
			slot_frame = NetworkLookup.cosmetics.default,
			slot_skin = NetworkLookup.cosmetics.default,
			slot_hat = NetworkLookup.item_names["n/a"],
			slot_melee = NetworkLookup.item_names["n/a"],
			slot_melee_skin = NetworkLookup.weapon_skins["n/a"],
			slot_ranged = NetworkLookup.item_names["n/a"],
			slot_ranged_skin = NetworkLookup.weapon_skins["n/a"]
		}
		local callback = callback(self, "cb_game_session_disconnect")
		local game_object_id = network_manager:create_game_object("player_sync_data", game_object_data_table, callback)
		self._game_object_id = game_object_id
	end
end

PlayerSyncData._calc_highest_unlocked_difficulty = function (self)
	if Development.parameter("unlock_all_difficulties") then
		local highest_unlocked_difficulty = "normal"
		local highest_rank = 0

		for difficulty_key, difficulty_settings in pairs(DifficultySettings) do
			if highest_rank < difficulty_settings.rank then
				highest_rank = difficulty_settings.rank
				highest_unlocked_difficulty = difficulty_key
			end
		end

		return highest_unlocked_difficulty
	end

	local best_aquired_power_level = self._player:best_aquired_power_level()
	local highest_unlocked_difficulty = "normal"
	local highest_rank = 2

	for difficulty_key, difficulty_settings in pairs(DifficultySettings) do
		local difficulty_approved = true

		if best_aquired_power_level < difficulty_settings.required_power_level then
			difficulty_approved = false
		end

		if difficulty_settings.extra_requirement_name then
			local extra_requirement_name = difficulty_settings.extra_requirement_name
			local requirement_data = ExtraDifficultyRequirements[extra_requirement_name]

			if not requirement_data.requirement_function() then
				difficulty_approved = false
			end
		end

		if difficulty_approved and highest_rank < difficulty_settings.rank then
			highest_unlocked_difficulty = difficulty_key
			highest_rank = difficulty_settings.rank
		end
	end

	return highest_unlocked_difficulty
end

PlayerSyncData.reevaluate_highest_difficulty = function (self)
	if not self._game_object_id then
		return
	end

	local game = self._network_manager:game()

	if not game then
		return
	end

	local highest_unlocked_difficulty = self:_calc_highest_unlocked_difficulty()

	self:set_data("highest_unlocked_difficulty", NetworkLookup.difficulties[highest_unlocked_difficulty])
end

PlayerSyncData.cb_game_session_disconnect = function (self)
	self._game_object_id = nil
end

PlayerSyncData.set_game_object_id = function (self, go_id)
	self._game_object_id = go_id
end

PlayerSyncData.active = function (self)
	return self._game_object_id ~= nil
end

PlayerSyncData.destroy = function (self)
	if self._player.local_player and self._game_object_id then
		local game = self._network_manager:game()

		if GameSession.game_object_exists(game, self._game_object_id) then
			self._network_manager:destroy_game_object(self._game_object_id)
		end
	end

	self._game_object_id = nil
	self._network_manager = nil
	self._player = nil
end

PlayerSyncData.set_data = function (self, key, value)
	if not self._game_object_id then
		return
	end

	local game = self._network_manager:game()

	if not game then
		return
	end

	GameSession.set_game_object_field(game, self._game_object_id, key, value)
end

PlayerSyncData.get_data = function (self, key)
	if not self._game_object_id then
		print("[PlayerSyncData] Game object id is not initialized")

		return nil
	end

	local game = self._network_manager:game()

	if not game then
		print("[PlayerSyncData] Game session is not initialized")

		return nil
	end

	return GameSession.game_object_field(game, self._game_object_id, key)
end

return
