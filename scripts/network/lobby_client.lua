require("scripts/network/lobby_aux")

LobbyClient = class(LobbyClient)

LobbyClient.init = function (self, network_options, lobby_data, joined_lobby)
	self.lobby = joined_lobby or LobbyInternal.join_lobby(lobby_data)
	self.stored_lobby_data = lobby_data
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self.network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)
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
	local new_state = LobbyInternal.state_map[lobby_state]
	local old_state = self.state

	if new_state ~= old_state then
		printf("[LobbyClient] Changed state from %s to %s", tostring(old_state), new_state)

		self.state = new_state

		if new_state == LobbyState.JOINED then
			self.lobby_members = self.lobby_members or LobbyMembers:new(lobby, self.client)

			Managers.party:set_leader(lobby:lobby_host())
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
	end
end

LobbyClient.get_stored_lobby_data = function (self)
	return self.stored_lobby_data
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

LobbyClient.user_name = function (self, host)
	return self.lobby:user_name(host)
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

return
