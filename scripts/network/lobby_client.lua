require("scripts/network/lobby_aux")

LobbyClient = class(LobbyClient)

LobbyClient.init = function (self, network_options, lobby_data, joined_lobby)
	self.lobby = joined_lobby or LobbyInternal.join_lobby(lobby_data)
	self.stored_lobby_data = lobby_data
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self.network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)
	self.peer_id = Network.peer_id()
end

LobbyClient.destroy = function (self)
	LobbyInternal.leave_lobby(self.lobby)

	self.lobby_members = nil
	self.lobby = nil
	self.has_sent_join = false

	GarbageLeakDetector.register_object(self, "Lobby Client")
end

LobbyClient.update = function (self, dt)
	local lobby = self.lobby
	local lobby_state = lobby:state()
	local host_peer_id = lobby:lobby_host()
	local new_state = LobbyInternal.state_map[lobby_state]
	local old_state = self.state

	if new_state ~= old_state then
		printf("[LobbyClient] Changed state from %s to %s", tostring(old_state), new_state)

		self.state = new_state

		if new_state == LobbyState.JOINED then
			self.lobby_members = self.lobby_members or LobbyMembers:new(lobby, self.client)

			Managers.party:set_leader(host_peer_id)

			self._lost_connection_to_lobby = false
		end

		if old_state == LobbyState.JOINED then
			Managers.party:set_leader(nil)

			if self.lobby_members then
				self.lobby_members:clear()

				self.has_sent_join = false
			end
		end
	end

	if self.lobby_members then
		self.lobby_members:update()

		local my_peer_id = self.peer_id
		local members_left = self.lobby_members:get_members_left()

		for i = 1, #members_left, 1 do
			local peer_id = members_left[i]

			if peer_id == my_peer_id or peer_id == host_peer_id then
				self._lost_connection_to_lobby = true

				print("[LobbyClient] Lost connection to the lobby")
			end
		end
	end
end

LobbyClient.get_stored_lobby_data = function (self)
	return self.stored_lobby_data
end

LobbyClient.update_user_names = function (self)
	if PLATFORM == "ps4" then
		self.lobby:update_user_names()
	end
end

LobbyClient.members = function (self)
	return self.lobby_members
end

LobbyClient.invite_target = function (self)
	return self.lobby
end

LobbyClient.is_dedicated_server = function (self)
	return false
end

LobbyClient.lobby_host = function (self)
	return self.lobby:lobby_host()
end

LobbyClient.lobby_data = function (self, key)
	return self.lobby:data(key)
end

LobbyClient.has_user_name = function (self, peer_id)
	return self.lobby:user_name(peer_id) ~= nil
end

LobbyClient.user_name = function (self, peer_id)
	return string.gsub(self.lobby:user_name(peer_id), "%c", "")
end

LobbyClient.is_joined = function (self)
	return self.state == LobbyState.JOINED
end

LobbyClient.failed = function (self)
	return self.state == LobbyState.FAILED
end

LobbyClient.id = function (self)
	return (LobbyInternal.lobby_id and LobbyInternal.lobby_id(self.lobby)) or "no_id"
end

LobbyClient.lost_connection_to_lobby = function (self)
	return self._lost_connection_to_lobby
end

return
