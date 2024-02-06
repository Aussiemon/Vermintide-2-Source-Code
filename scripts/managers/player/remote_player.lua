-- chunkname: @scripts/managers/player/remote_player.lua

RemotePlayer = class(RemotePlayer)

RemotePlayer.init = function (self, network_manager, peer, player_controlled, is_server, local_player_id, unique_id, clan_tag, ui_id, account_id)
	self.network_manager = network_manager
	self.remote = true
	self.peer_id = peer
	self.is_server = is_server
	self._player_controlled = player_controlled
	self._ui_id = ui_id
	self._observed_player_id = nil
	self._account_id = account_id
	self._debug_name = Localize("tutorial_no_text")
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
	return self._ui_id
end

RemotePlayer.unique_id = function (self)
	return self._unique_id
end

RemotePlayer.platform_id = function (self)
	if IS_WINDOWS or IS_LINUX then
		return self.peer_id
	else
		return self._account_id
	end
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

RemotePlayer.set_career_index = function (self, index)
	error("Why are we trying to set career index for a remote player?")
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
	local profile_synchronizer = self.network_manager.profile_synchronizer
	local profile_index, career_index = profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)

	return career_index or 1
end

RemotePlayer.career_name = function (self)
	local profile_index = self:profile_index()
	local profile = SPProfiles[profile_index]
	local display_name = profile and profile.display_name

	if display_name then
		local career_index = self:career_index()

		return profile.careers[career_index].name
	end
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

RemotePlayer.get_data = function (self, key)
	return self._player_sync_data:get_data(key)
end

RemotePlayer.name = function (self)
	local name

	if not self._player_controlled then
		name = Localize(self:character_name())
		self._cached_name = name
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
					local clan_tag_string = tostring(Clans.clan_tag(clan_tag_id))

					if clan_tag_string ~= "" then
						clan_tag = clan_tag_string .. "|"
					end
				end
			end

			name = clan_tag .. Steam.user_name(self:network_id())
			self._cached_name = name
		end
	elseif IS_CONSOLE then
		if self._cached_name then
			return self._cached_name
		end

		local lobby = Managers.state.network:lobby()
		local network_id = self:network_id()

		if lobby and lobby.user_name and network_id then
			name = lobby:user_name(network_id)
			self._cached_name = name or "Remote #" .. tostring(network_id:sub(-3, -1))
		end
	elseif Managers.game_server then
		if self._cached_name then
			return self._cached_name
		end

		name = Managers.game_server:peer_name(self:network_id())
		self._cached_name = name
	else
		name = "Remote #" .. tostring(self.peer_id:sub(-3, -1))
	end

	return name
end

RemotePlayer.cached_name = function (self)
	return self._cached_name or self._debug_name
end

RemotePlayer.destroy = function (self)
	if self._player_sync_data then
		self._player_sync_data:destroy()
	end

	if self.is_server then
		if self.game_object_id then
			self.network_manager:destroy_game_object(self.game_object_id)
		end

		Managers.state.event:trigger("delete_limited_owned_pickups", self.peer_id)
	end
end

RemotePlayer.create_game_object = function (self)
	local game_object_data_table = {
		ping = 0,
		go_type = NetworkLookup.go_types.player,
		network_id = self:network_id(),
		local_player_id = self:local_player_id(),
		player_controlled = self._player_controlled,
		clan_tag = self._clan_tag,
		account_id = self._account_id,
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

RemotePlayer.get_party = function (self)
	local status = Managers.party:get_status_from_unique_id(self._unique_id)

	return Managers.party:get_party(status.party_id)
end

RemotePlayer.observed_player_id = function (self)
	return self._observed_player_id
end

RemotePlayer.set_observed_player_id = function (self, player_id)
	self._observed_player_id = player_id
end
