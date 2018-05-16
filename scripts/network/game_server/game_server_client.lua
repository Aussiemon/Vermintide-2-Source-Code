require("scripts/network/game_server/game_server_aux")

GameServerLobbyClient = class(GameServerLobbyClient)

local function dprintf(string, ...)
	local s = string:format(...)

	printf("[GameServerLobbyClient]: %s", s)
end

GameServerLobbyClient.init = function (self, network_options, game_server_data, password)
	dprintf("Joining lobby on address %s", game_server_data.server_info.ip_port)

	self._game_server_info = game_server_data.server_info
	self._game_server_lobby = GameServerInternal.join_server(self._game_server_info, password)

	Presence.advertise_playing(self._game_server_info.ip_port)

	self._game_server_lobby_data = game_server_data
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self._network_hash = GameServerAux.create_network_hash(config_file_name, project_hash)
	self.lobby = self._game_server_lobby
	self.network_hash = self._network_hash
end

GameServerLobbyClient.destroy = function (self)
	dprintf("Destroying Game Server Client, leaving server...")
	Presence.stop_advertise_playing()
	GameServerInternal.leave_server(self._game_server_lobby)

	self._members = nil
	self._game_server_lobby = nil
	self._game_server_lobby_data = nil

	GarbageLeakDetector.register_object(self, "Game Server Client")
end

GameServerLobbyClient.update = function (self, dt)
	local lobby = self._game_server_lobby
	local lobby_state = lobby:state()
	local new_state = GameServerInternal.lobby_state_map[lobby_state]
	local old_state = self._state

	if new_state ~= old_state then
		dprintf("Changing state from %s to %s", old_state, new_state)

		self._state = new_state

		if new_state == GameServerLobbyState.JOINED then
			self._members = self._members or LobbyMembers:new(lobby)
		end

		if old_state == GameServerLobbyState.JOINED and self._members then
			self._members:clear()
		end
	end

	if self._members then
		self._members:update()
	end
end

GameServerLobbyClient.state = function (self)
	return self._state
end

GameServerLobbyClient.members = function (self)
	return self._members
end

GameServerLobbyClient.invite_target = function (self)
	return self._game_server_info.ip_port
end

GameServerLobbyClient.is_dedicated_server = function (self)
	return true
end

GameServerLobbyClient.lobby_host = function (self)
	return GameServerInternal.lobby_host(self._game_server_lobby)
end

GameServerLobbyClient.lobby_data = function (self, key)
	return self._game_server_lobby:data(key)
end

GameServerLobbyClient.get_stored_lobby_data = function (self)
	return self._game_server_lobby_data
end

GameServerLobbyClient.ip_address = function (self)
	return self._game_server_info.ip_port
end

GameServerLobbyClient.is_joined = function (self)
	return self._state == GameServerLobbyState.JOINED
end

GameServerLobbyClient.failed = function (self)
	return self._state == GameServerLobbyState.FAILED
end

GameServerLobbyClient.id = function (self)
	return (GameServerInternal.lobby_id and GameServerInternal.lobby_id(self._game_server_lobby)) or "no_id"
end

return
