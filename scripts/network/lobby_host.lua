-- chunkname: @scripts/network/lobby_host.lua

require("scripts/network/lobby_aux")

local DEBUG_LOBBY_HOST = true

local function dprintf(text, ...)
	if DEBUG_LOBBY_HOST then
		printf(text, ...)
	end
end

LobbyHost = class(LobbyHost)

LobbyHost.init = function (self, network_options, lobby)
	local config_file_name = network_options.config_file_name
	local project_hash = network_options.project_hash

	self.network_hash = LobbyAux.create_network_hash(config_file_name, project_hash)

	if IS_WINDOWS or IS_LINUX then
		fassert(network_options.max_members, "Must provide max members to LobbyHost")
	end

	self.max_members = (IS_WINDOWS or IS_LINUX) and network_options.max_members
	self.lobby = lobby or LobbyInternal.create_lobby(network_options)
	self.peer_id = Network.peer_id()
	self._network_initialized = false
	self.platform = PLATFORM
end

LobbyHost.kick_all_except = function (self, ignored_peers)
	if self.lobby ~= nil and self.lobby.kick then
		ignored_peers = ignored_peers or {}

		local my_peer_id = self.peer_id

		for _, peer_id in ipairs(self.lobby:members()) do
			if peer_id ~= my_peer_id and not ignored_peers[peer_id] then
				self.lobby:kick(peer_id)
			end
		end
	end
end

LobbyHost.destroy = function (self)
	print("[LobbyHost] Destroying")
	self:kick_all_except()

	self.lobby_members = nil

	self:_free_lobby()
	GarbageLeakDetector.register_object(self, "Lobby Host")
end

LobbyHost.update = function (self, dt)
	local lobby = self.lobby
	local new_state = lobby:state()
	local old_state = self.state or 0

	if new_state ~= old_state then
		printf("[LobbyHost] Changed state from %s to %s", old_state, new_state)

		self.state = new_state

		if new_state == LobbyState.JOINED then
			if IS_PS4 then
				local lobby_data_table = self.lobby_data_table or {}

				lobby_data_table.network_hash = self.network_hash

				lobby:set_data_table(lobby_data_table)
			else
				local lobby_data_table = self.lobby_data_table

				lobby_data_table.network_hash = self.network_hash

				if lobby_data_table then
					for key, value in pairs(lobby_data_table) do
						lobby:set_data(key, value)
					end
				end
			end

			self.lobby_members = self.lobby_members or LobbyMembers:new(lobby)

			Managers.party:set_leader(lobby:lobby_host())
			Managers.account:update_presence()
		elseif old_state == LobbyState.JOINED then
			Managers.party:set_leader(nil)

			if self.lobby_members then
				self.lobby_members:clear()
			end
		end
	end

	if self.lobby_members then
		self.lobby_members:update()
	end
end

LobbyHost.ping_by_peer = function (self, peer_id)
	return LobbyInternal.ping(peer_id)
end

LobbyHost._update_debug = function (self)
	local my_peer_id = self.peer_id
	local lobby = self.lobby
	local members = lobby:members()
	local num_members = #members

	if num_members > 0 then
		Debug.text("Reliable Send Buffer Left (peer : bytes):")

		for i = 1, num_members do
			local peer_id = members[i]

			if peer_id ~= my_peer_id then
				self._min_remaining_buffer = self._min_remaining_buffer or {}

				local remaining_buffer_size = Network.reliable_send_buffer_left(peer_id)
				local min_buffer = self._min_remaining_buffer[peer_id]

				if min_buffer and remaining_buffer_size < min_buffer or min_buffer == nil and remaining_buffer_size > 0 then
					min_buffer = remaining_buffer_size
					self._min_remaining_buffer[peer_id] = min_buffer
				end

				Debug.text("    %s : %d %s", peer_id, remaining_buffer_size, min_buffer and string.format("(min: %d)", min_buffer) or "")
			end
		end
	end
end

LobbyHost.set_lobby_data = function (self, lobby_data_table)
	fassert(lobby_data_table.Host == nil, "Tell Staffan about this!!")
	dprintf("Set lobby begin:")

	self.lobby_data_table = lobby_data_table

	if self.state == LobbyState.JOINED then
		local lobby = self.lobby

		if IS_PS4 then
			lobby:set_data_table(lobby_data_table)
		else
			for key, value in pairs(lobby_data_table) do
				dprintf("\tLobby data %s = %s", key, tostring(value))
				lobby:set_data(key, value)
			end
		end
	end

	dprintf("Set lobby end.")
end

LobbyHost.set_network_initialized = function (self, initialized)
	self._network_initialized = initialized
end

LobbyHost.network_initialized = function (self)
	return self._network_initialized
end

LobbyHost.get_stored_lobby_data = function (self)
	return self.lobby_data_table
end

LobbyHost.attempting_reconnect = function (self)
	return false
end

LobbyHost.members = function (self)
	return self.lobby_members
end

LobbyHost.lobby_data = function (self, key)
	return self.lobby:data(key)
end

LobbyHost.invite_target = function (self)
	return self.lobby
end

LobbyHost.is_dedicated_server = function (self)
	return false
end

LobbyHost.lobby_host = function (self)
	return self.lobby:lobby_host()
end

LobbyHost.user_name = function (self, peer_id)
	if HAS_STEAM then
		return string.gsub(Steam.user_name(), "%c", "")
	elseif IS_PS4 then
		return string.gsub(self.lobby:user_name(peer_id), "%c", "")
	else
		return peer_id
	end
end

LobbyHost.id = function (self)
	return LobbyInternal.lobby_id and LobbyInternal.lobby_id(self.lobby) or "no_id"
end

LobbyHost.is_joined = function (self)
	return self.state == LobbyState.JOINED
end

LobbyHost.get_network_hash = function (self)
	return self.network_hash
end

LobbyHost.get_max_members = function (self)
	return self.max_members
end

LobbyHost.set_max_members = function (self, max_members)
	self.max_members = max_members

	LobbyInternal.set_max_members(self.lobby, max_members)
end

LobbyHost.set_lobby = function (self, lobby)
	print("leaving old lobby")
	self:_free_lobby()

	self.lobby = lobby

	local lobby_data_table = self.lobby_data_table or {}

	self:set_lobby_data(lobby_data_table)

	self.lobby_members = LobbyMembers:new(lobby)
end

LobbyHost.steal_lobby = function (self)
	local lobby = self.lobby

	self.lobby = nil

	return lobby
end

LobbyHost.failed = function (self)
	return self.state == LobbyState.FAILED
end

LobbyHost._free_lobby = function (self)
	if self.lobby ~= nil then
		LobbyInternal.leave_lobby(self.lobby)

		self.lobby = nil
	end
end

LobbyHost.lost_connection_to_lobby = function (self)
	return LobbyInternal.is_orphaned(self.lobby)
end

LobbyHost.close_channel = function (self, channel_id)
	LobbyInternal.close_channel(self.lobby, channel_id)
end
