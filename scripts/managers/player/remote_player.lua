RemotePlayer = class(RemotePlayer)

RemotePlayer.init = function (self, network_manager, peer, player_controlled, is_server, local_player_id, unique_id, clan_tag)
	self.network_manager = network_manager
	self.remote = true
	self.peer_id = peer
	self.is_server = is_server
	self._player_controlled = player_controlled
	self.owned_units = {}
	self.game_object_id = nil
	self._unique_id = unique_id
	self._local_player_id = local_player_id
	self._clan_tag = clan_tag

	if is_server then
		self:create_game_object()
	end

	self.index = self.game_object_id
	self._cached_name = nil
end

RemotePlayer.profile_id = function (self)
	return self._unique_id
end

RemotePlayer.ui_id = function (self)
	return self._unique_id
end

RemotePlayer.platform_id = function (self)
	return self.peer_id
end

RemotePlayer.despawn = function (self)
	assert(self.is_server)
end

RemotePlayer.type = function (self)
	return "RemotePlayer"
end

RemotePlayer.set_player_unit = function (self, unit)
	self.player_unit = unit
	local career_extension = ScriptUnit.extension(unit, "career_system")
	self._career_index = career_extension:career_index()
end

RemotePlayer.profile_index = function (self)
	local profile_synchronizer = self.network_manager.profile_synchronizer
	local profile_index = profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)

	return profile_index
end

RemotePlayer.set_profile_index = function (self, index)
	assert(true, "Why are we trying to set profile index for a remote player?")
end

RemotePlayer.character_name = function (self)
	local profile_synchronizer = self.network_manager.profile_synchronizer
	local profile_index = profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)

	if profile_index then
		local profile = SPProfiles[profile_index]
		local display_name = profile and profile.character_name

		return display_name
	else
		return ""
	end
end

RemotePlayer.profile_display_name = function (self)
	local profile_synchronizer = self.network_manager.profile_synchronizer
	local profile_index = profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)

	if profile_index then
		local profile = SPProfiles[profile_index]
		local display_name = profile and profile.display_name

		return display_name
	else
		return ""
	end
end

RemotePlayer.career_index = function (self)
	return self._career_index or 1
end

RemotePlayer.stats_id = function (self)
	return self._unique_id
end

RemotePlayer.telemetry_id = function (self)
	return self._unique_id
end

RemotePlayer.local_player_id = function (self)
	return self._local_player_id
end

RemotePlayer.network_id = function (self)
	return self.peer_id
end

RemotePlayer.is_player_controlled = function (self)
	return self._player_controlled
end

RemotePlayer.create_boon_handler = function (self, world)
	return
end

RemotePlayer.get_data = function (self, key)
	return self._player_sync_data:get_data(key)
end

RemotePlayer.name = function (self)
	local name = nil

	if not self._player_controlled then
		name = Localize(self:character_name())
	elseif rawget(_G, "Steam") then
		if self._cached_name then
			return self._cached_name
		else
			local clan_tag = ""
			local game = Managers.state.network:game()
			local game_object_id = self.game_object_id

			if game and game_object_id then
				local clan_tag_id = GameSession.game_object_field(game, game_object_id, "clan_tag")

				if clan_tag_id and clan_tag_id ~= "0" then
					clan_tag = tostring(Clans.clan_tag(clan_tag_id)) .. "|"
				end
			end

			name = clan_tag .. Steam.user_name(self:network_id())
			self._cached_name = name
		end
	elseif PLATFORM == "xb1" or PLATFORM == "ps4" then
		if self._cached_name then
			return self._cached_name
		end

		name = Managers.state.network:lobby():user_name(self:network_id()) or "Remote #" .. tostring(self.peer_id:sub(-3, -1))
		self._cached_name = name
	elseif Managers.game_server then
		if self._cached_name then
			return self._cached_name
		end

		name = Managers.game_server:peer_name(self:network_id()) or "Remote #" .. tostring(self.peer_id:sub(-3, -1))
		self._cached_name = name
	else
		name = "Remote #" .. tostring(self.peer_id:sub(-3, -1))
	end

	return name
end

RemotePlayer.destroy = function (self)
	if self._player_sync_data then
		self._player_sync_data:destroy()
	end

	if self.is_server and self.game_object_id then
		self.network_manager:destroy_game_object(self.game_object_id)
	end
end

RemotePlayer.create_game_object = function (self)
	local empty_boon_id = NetworkLookup.boons["n/a"]
	local game_object_data_table = {
		boon_poll_time = 0,
		boon_8_remaining_duration = 0,
		boon_9_remaining_duration = 0,
		ping = 0,
		boon_1_remaining_duration = 0,
		boon_2_remaining_duration = 0,
		boon_3_remaining_duration = 0,
		boon_4_remaining_duration = 0,
		boon_5_remaining_duration = 0,
		boon_6_remaining_duration = 0,
		boon_7_remaining_duration = 0,
		boon_10_remaining_duration = 0,
		go_type = NetworkLookup.go_types.player,
		network_id = self:network_id(),
		local_player_id = self:local_player_id(),
		player_controlled = self._player_controlled,
		clan_tag = self._clan_tag,
		boon_1_id = empty_boon_id,
		boon_2_id = empty_boon_id,
		boon_3_id = empty_boon_id,
		boon_4_id = empty_boon_id,
		boon_5_id = empty_boon_id,
		boon_6_id = empty_boon_id,
		boon_7_id = empty_boon_id,
		boon_8_id = empty_boon_id,
		boon_9_id = empty_boon_id,
		boon_10_id = empty_boon_id
	}
	local callback = callback(self, "cb_game_session_disconnect")
	self.game_object_id = self.network_manager:create_player_game_object("player", game_object_data_table, callback)

	self:create_sync_data()

	if script_data.network_debug then
		print("RemotePlayer:create_game_object( )", self.game_object_id)
	end
end

RemotePlayer.cb_game_session_disconnect = function (self)
	self.game_object_id = nil

	if self.boon_handler then
		self.boon_handler = nil
	end
end

RemotePlayer.set_game_object_id = function (self, id)
	self.game_object_id = id
end

RemotePlayer.create_sync_data = function (self)
	assert(self._player_sync_data == nil)

	self._player_sync_data = PlayerSyncData:new(self, self.network_manager)
end

RemotePlayer.set_sync_data_game_object_id = function (self, id)
	self._player_sync_data:set_game_object_id(id)
end

RemotePlayer.sync_data_active = function (self)
	return self._player_sync_data and self._player_sync_data:active()
end

return
