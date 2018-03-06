require("scripts/network/game_server/game_server_aux")
require("scripts/network/lobby_members")

GameServer = class(GameServer)

local function dprintf(string, ...)
	local s = string.format(string, ...)

	printf("[GameServer]: %s", s)

	return 
end

GameServer.init = function (self, network_options, server_name)
	dprintf("Initializing game server...")

	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash
	self._network_hash = GameServerAux.create_network_hash(config_file_name, project_hash)

	assert(network_options.max_members, "Has to pass max_members to GameServer")

	self._max_members = network_options.max_members
	self._game_server = GameServerInternal.init_server(network_options, server_name)
	self._data_table = {}
	self._server_name = server_name

	return 
end
GameServer.destroy = function (self)
	dprintf("Shutting down game server")

	self._members = nil
	self._data_table = nil

	GameServerInternal.shutdown_server(self._game_server)

	self._game_server = nil

	GarbageLeakDetector.register_object(self, "Game Server")

	return 
end
GameServer.update = function (self, dt, t)
	local game_server = self._game_server
	local game_server_state = game_server.state(game_server)
	local new_state = GameServerInternal.state_map[game_server_state]
	local old_state = self._state

	if new_state ~= old_state then
		dprintf("Changing state from %s to %s", old_state, new_state)

		self._state = new_state

		if new_state == GameServerState.CONNECTED then
			local data_table = self._data_table
			data_table.network_hash = self._network_hash

			for key, value in pairs(data_table) do
				game_server.set_data(game_server, key, value)
			end

			self._members = self._members or LobbyMembers:new(game_server)
		end

		if old_state == GameServerState.CONNECTED and self._members then
			self._members:clear()
		end
	end

	local members = self._members

	if members then
		members.update(members)
	end

	return self._state
end
GameServer.remove_peer = function (self, peer_id)
	self._game_server:remove_member(peer_id)

	return 
end
GameServer.set_lobby_data = function (self, data)
	print("Set lobby begin:")

	local internal_data_table = self._data_table
	local game_server = self._game_server

	for key, value in pairs(data) do
		print(string.format("  Lobby data %s = %s", key, tostring(value)))

		internal_data_table[key] = value

		game_server.set_data(game_server, key, value)
	end

	print("Set lobby end.")

	return 
end
GameServer.get_stored_lobby_data = function (self)
	return self._data_table
end
GameServer.is_dedicated_server = function (self)
	return true
end
GameServer.lobby_data = function (self, key)
	return self._game_server:data(key)
end
GameServer.lobby_host = function (self)
	return Network.peer_id()
end
GameServer.state = function (self)
	return self._state
end
GameServer.members = function (self)
	return self._members
end
GameServer.get_max_members = function (self)
	return self._max_members
end
GameServer.is_joined = function (self)
	return self._state == GameServerState.CONNECTED
end
GameServer.id = function (self)
	return (GameServerInternal.server_id and GameServerInternal.server_id(self._game_server)) or "no_id"
end
GameServer.server_name = function (self)
	return self._server_name
end
GameServer.eac_state = function (self, peer)
	return self._game_server:eac_state(peer)
end

return 
