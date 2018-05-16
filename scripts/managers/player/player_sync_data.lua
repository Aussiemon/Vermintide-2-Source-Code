PlayerSyncData = class(PlayerSyncData)

PlayerSyncData.init = function (self, player, network_manager)
	self._player = player
	self._network_manager = network_manager

	if player.local_player then
		local game_object_data_table = {
			power_level = 0,
			best_aquired_power_level = 0,
			go_type = NetworkLookup.go_types.player_sync_data,
			network_id = player:network_id(),
			local_player_id = player:local_player_id()
		}
		local callback = callback(self, "cb_game_session_disconnect")
		local game_object_id = network_manager:create_game_object("player_sync_data", game_object_data_table, callback)
		self._game_object_id = game_object_id
	end
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
		self._network_manager:destroy_game_object(self._game_object_id)
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
		return nil
	end

	local game = self._network_manager:game()

	if not game then
		return nil
	end

	return GameSession.game_object_field(game, self._game_object_id, key)
end

return
