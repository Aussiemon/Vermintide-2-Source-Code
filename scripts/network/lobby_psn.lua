require("scripts/network/lobby_aux")
require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/network/lobby_members")
require("scripts/network_lookup/network_lookup")

LobbyInternal = LobbyInternal or {}
LobbyInternal.TYPE = "psn"
LobbyInternal.state_map = {
	[PsnRoom.WAITING_TO_CREATE] = LobbyState.WAITING_TO_CREATE,
	[PsnRoom.CREATING] = LobbyState.CREATING,
	[PsnRoom.JOINING] = LobbyState.JOINING,
	[PsnRoom.JOINED] = LobbyState.JOINED,
	[PsnRoom.FAILED] = LobbyState.FAILED
}
LobbyInternal.comparison_map = {
	[LobbyComparison.EQUAL] = PsnRoomBrowser.EQUAL,
	[LobbyComparison.NOT_EQUAL] = PsnRoomBrowser.NOT_EQUAL,
	[LobbyComparison.LESS] = PsnRoomBrowser.LESS,
	[LobbyComparison.LESS_OR_EQUAL] = PsnRoomBrowser.LESS_OR_EQUAL,
	[LobbyComparison.GREATER] = PsnRoomBrowser.GREATER,
	[LobbyComparison.GREATER_OR_EQUAL] = PsnRoomBrowser.GREATER_OR_EQUAL
}
LobbyInternal.matchmaking_lobby_data = {
	matchmaking = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_1
	},
	difficulty = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_2
	},
	selected_level_key = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_3
	},
	game_mode = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_4
	},
	primary_region = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_5
	},
	secondary_region = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_6
	},
	network_hash_as_int = {
		data_type = "integer",
		id = PsnRoom.SEARCHABLE_INTEGER_ID_7
	}
}
LobbyInternal.lobby_data_network_lookups = {
	matchmaking = "lobby_data_values",
	selected_level_key = "level_keys",
	level_key = "level_keys",
	primary_region = "matchmaking_regions",
	is_private = "lobby_data_values",
	game_mode = "game_modes",
	difficulty = "difficulties",
	secondary_region = "matchmaking_regions"
}

LobbyInternal.init_client = function (network_options)
	if not LobbyInternal.client then
		Network.set_explicit_connections()

		LobbyInternal.client = Network.init_psn_client(network_options.config_file_name)
		LobbyInternal.psn_room_browser = PSNRoomBrowser:new(LobbyInternal.client)
		LobbyInternal.psn_room_data_external = PsnClient.room_data_external(LobbyInternal.client)
	end

	GameSettingsDevelopment.set_ignored_rpc_logs()
end

LobbyInternal.network_initialized = function ()
	return not not LobbyInternal.client
end

LobbyInternal.client_ready = function ()
	return PsnClient.ready(LobbyInternal.client)
end

LobbyInternal.ping = function (peer_id)
	return Network.ping(peer_id)
end

LobbyInternal.add_ping_peer = function (peer_id)
	return
end

LobbyInternal.remove_ping_peer = function (peer_id)
	return
end

LobbyInternal.shutdown_client = function ()
	Network.shutdown_psn_client(LobbyInternal.client)

	LobbyInternal.client = nil
	LobbyInternal.psn_room_browser = nil
	LobbyInternal.psn_room_data_external = nil

	if script_data.debug_psn then
		print("[LobbyInternal] shutdown_client")
		print(Script.callstack())
	end
end

LobbyInternal.create_lobby = function (network_options)
	local name = Managers.account:online_id() or "UNKNOWN"
	local room_id = Network.create_psn_room(name, network_options.max_members)

	if script_data.debug_psn then
		print("[LobbyInternal] creating room:", room_id)
		print(Script.callstack())
	end

	return PSNRoom:new(room_id)
end

LobbyInternal.join_lobby = function (lobby_data)
	local id = lobby_data.id
	local room_id = Network.join_psn_room(id)

	if script_data.debug_psn then
		print("[LobbyInternal] joining room [room_id, id]", room_id, id)
		print(Script.callstack())
	end

	return PSNRoom:new(room_id)
end

LobbyInternal.leave_lobby = function (psn_room)
	if script_data.debug_psn then
		print("[LobbyInternal] Leaving room:", psn_room.room_id)
		print(Script.callstack())
	end

	Network.leave_psn_room(psn_room.room_id)
end

LobbyInternal.get_lobby = function (room_browser, index)
	local network_psn_room_info = room_browser:lobby(index)
	local data_string = network_psn_room_info.data
	local data_table = LobbyInternal.unserialize_psn_data(data_string)
	data_table.id = network_psn_room_info.id
	data_table.name = network_psn_room_info.name

	return data_table
end

LobbyInternal.lobby_browser = function ()
	return LobbyInternal.psn_room_browser
end

LobbyInternal.client_lost_context = function ()
	return PsnClient.lost_context(LobbyInternal.client)
end

LobbyInternal.client_failed = function ()
	return PsnClient.failed(LobbyInternal.client)
end

LobbyInternal.get_lobby_data_from_id = function (id)
	local entry = LobbyInternal.room_data_entry(id)

	if entry then
		return entry.data
	end
end

LobbyInternal.get_lobby_data_from_id_by_key = function (id, key)
	local entry = LobbyInternal.room_data_entry(id)

	if entry then
		return entry.data[key]
	end
end

LobbyInternal.room_data_refresh = function (ids)
	if script_data.debug_psn then
		printf("[LobbyInternal] Refreshing PsnRoomDataExternal for %s number of rooms:", #ids)

		for i, id in ipairs(ids) do
			printf("\tRoomId #%d: %s", i, id)
		end
	end

	PsnRoomDataExternal.refresh(LobbyInternal.psn_room_data_external, ids)
end

LobbyInternal.room_data_is_refreshing = function ()
	return PsnRoomDataExternal.is_refreshing(LobbyInternal.psn_room_data_external)
end

LobbyInternal.room_data_all_entries = function ()
	local entries = PsnRoomDataExternal.all_entries(LobbyInternal.psn_room_data_external)

	for _, entry in ipairs(entries) do
		entry.data = LobbyInternal.unserialize_psn_data(entry.data)
	end

	return entries
end

LobbyInternal.room_data_entry = function (id)
	local entry = PsnRoomDataExternal.entry(LobbyInternal.psn_room_data_external, id)

	if entry then
		entry.data = LobbyInternal.unserialize_psn_data(entry.data)
	end

	return entry
end

LobbyInternal.room_data_num_entries = function ()
	return PsnRoomDataExternal.num_entries(LobbyInternal.psn_room_data_external)
end

local conv_table = {}

LobbyInternal.serialize_psn_data = function (data_table)
	table.clear(conv_table)

	local lobby_data_network_lookups = LobbyInternal.lobby_data_network_lookups

	for key, value in pairs(data_table) do
		if lobby_data_network_lookups[key] then
			conv_table[key] = NetworkLookup[lobby_data_network_lookups[key]][value]
		else
			conv_table[key] = value
		end
	end

	local packed_data = PsnRoom.pack_room_data(conv_table)
	local packed_data_size = string.len(packed_data)

	fassert(packed_data_size <= PSNRoom.room_data_max_size, "[PSNRoom] Tried to store %d characters in the PSN Room Data, maximum is 255 bytes", packed_data_size)

	return packed_data
end

LobbyInternal.unserialize_psn_data = function (data_string)
	local t = PsnRoom.unpack_room_data(data_string)
	local lobby_data_network_lookups = LobbyInternal.lobby_data_network_lookups

	for key, value in pairs(t) do
		if lobby_data_network_lookups[key] then
			t[key] = NetworkLookup[lobby_data_network_lookups[key]][value]
		end
	end

	return t
end

LobbyInternal.clear_filter_requirements = function ()
	local room_browser = LobbyInternal.psn_room_browser

	room_browser:clear_filters()
end

LobbyInternal.add_filter_requirements = function (requirements)
	local room_browser = LobbyInternal.psn_room_browser

	room_browser:clear_filters(room_browser)

	local lobby_data_network_lookups = LobbyInternal.lobby_data_network_lookups

	for key, filter in pairs(requirements.filters) do
		local mm_lobby_data = LobbyInternal.matchmaking_lobby_data[key]

		if mm_lobby_data then
			local id = mm_lobby_data.id
			local value = filter.value
			local comparison = filter.comparison
			local psn_comparison = LobbyInternal.comparison_map[comparison]

			if lobby_data_network_lookups[key] then
				value = NetworkLookup[lobby_data_network_lookups[key]][value]
			end

			room_browser:add_filter(id, value, psn_comparison)
			mm_printf("Filter: %s, comparison(%s), id=%s, value(untouched)=%s, value=%s", tostring(key), tostring(comparison), tostring(id), tostring(filter.value), tostring(value))
		else
			mm_printf("Skipping filter %q matchmaking_lobby_data not setup. Probably redundant on ps4", key)
		end
	end
end

LobbyInternal._set_matchmaking_data = function (room_id, key, value)
	local mm_lobby_data = LobbyInternal.matchmaking_lobby_data[key]

	fassert(mm_lobby_data, "Lobby data key %q is not set up for matchmaking", key)

	local lobby_data_network_lookups = LobbyInternal.lobby_data_network_lookups
	local data_type = mm_lobby_data.data_type

	if data_type == "integer" then
		if lobby_data_network_lookups[key] then
			value = NetworkLookup[lobby_data_network_lookups[key]][value]
		end

		fassert(type(value) == "number", "Value needs to be an integer.")
		PsnRoom.set_searchable_attribute(room_id, mm_lobby_data.id, value)
	else
		ferror("unsupported data type %q", data_type)
	end
end

LobbyInternal.user_name = function (user)
	return nil
end

LobbyInternal.lobby_id = function (psn_room)
	return PsnRoom.sce_np_room_id(psn_room.room_id)
end

LobbyInternal.is_friend = function (peer_id)
	print("LobbyInternal.is_friend() is not implemented on the ps4")

	return false
end

PSNRoom = class(PSNRoom)
PSNRoom.room_data_max_size = 256

PSNRoom.init = function (self, room_id)
	self.room_id = room_id
	self._room_data = {}
	self._serialized_room_data = ""
	self._user_names = {}
	self._refresh_room_data = false
	self._refresh_cooldown = 0
end

PSNRoom.state = function (self)
	return PsnRoom.state(self.room_id)
end

PSNRoom.update = function (self, dt)
	self._refresh_cooldown = math.max(self._refresh_cooldown - dt, 0)

	if self._refresh_room_data and self._refresh_cooldown == 0 then
		local packed_data_size = string.len(self._serialized_room_data)

		fassert(packed_data_size <= PSNRoom.room_data_max_size, "[PSNRoom] Tried to store %d characters in the PSN Room Data, maximum is 255 bytes", packed_data_size)
		PsnRoom.set_data(self.room_id, self._serialized_room_data)
		PsnRoom.set_data_internal(self.room_id, self._serialized_room_data)

		if script_data.debug_psn then
			printf("[PSNRoom] Setting Packed Room Data: %q, Packed Size: %d/%d", self._serialized_room_data, packed_data_size, PSNRoom.room_data_max_size)
		end

		self._refresh_room_data = false
		self._refresh_cooldown = 1
	end
end

PSNRoom.set_data = function (self, key, value)
	local room_data = self._room_data
	room_data[key] = tostring(value)

	if LobbyInternal.matchmaking_lobby_data[key] then
		LobbyInternal._set_matchmaking_data(self.room_id, key, value)
	end

	local data_string = LobbyInternal.serialize_psn_data(room_data)

	if data_string ~= self._serialized_room_data then
		self._serialized_room_data = data_string
		self._refresh_room_data = true
	end
end

PSNRoom.set_data_table = function (self, data_table)
	local room_data = self._room_data

	for key, value in pairs(data_table) do
		room_data[key] = tostring(value)

		if LobbyInternal.matchmaking_lobby_data[key] then
			LobbyInternal._set_matchmaking_data(self.room_id, key, value)
		end
	end

	local data_string = LobbyInternal.serialize_psn_data(room_data)

	if data_string ~= self._serialized_room_data then
		self._serialized_room_data = data_string
		self._refresh_room_data = true
	end
end

PSNRoom.data = function (self, key)
	local data_string = PsnRoom.data_internal(self.room_id)
	local room_data = LobbyInternal.unserialize_psn_data(data_string)

	return room_data[key]
end

PSNRoom.members = function (self)
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)
	local t = {}

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)
		t[i + 1] = member.peer_id
	end

	return t
end

PSNRoom.members_np_id = function (self, t)
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)
		t[i + 1] = member.np_id
	end
end

PSNRoom.online_id_from_peer_id = function (self, peer_id)
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)

		if member.peer_id == peer_id then
			return member.online_id
		end
	end

	local user_name = self._user_names[peer_id]

	if user_name then
		return user_name
	end

	fassert(false, "[PSNRoom]:np_id_froom_peer_id() No member with peer id(%s) in room(%d)", peer_id, room_id)
end

PSNRoom.lobby_host = function (self)
	return PsnRoom.owner(self.room_id)
end

PSNRoom.sce_np_room_id = function (self)
	return PsnRoom.sce_np_room_id(self.room_id)
end

PSNRoom.update_user_names = function (self)
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)
		self._user_names[member.peer_id] = member.online_id
	end
end

PSNRoom.user_name = function (self, peer_id)
	local user_name = nil
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)

		if member.peer_id == peer_id then
			user_name = member.online_id

			break
		end
	end

	user_name = user_name or self._user_names[peer_id]

	fassert(user_name ~= nil, "[PSNRoom]:user_name() No member with peer id(%s) in room(%d)", peer_id, room_id)

	return user_name
end

PSNRoom.user_id = function (self, peer_id)
	local user_id = nil
	local room_id = self.room_id
	local num_members = PsnRoom.num_members(room_id)

	for i = 0, num_members - 1, 1 do
		local member = PsnRoom.member(room_id, i)

		if member.peer_id == peer_id then
			user_id = PsnRoom.user_id(room_id, i)
		end
	end

	fassert(user_id ~= nil, "[PSNRoom]:user_id() No member with peer id(%s) in room(%d)", peer_id, room_id)

	return user_id
end

PSNRoomBrowser = class(PSNRoomBrowser)

PSNRoomBrowser.init = function (self, psn_client)
	self.browser = PsnClient.room_browser(psn_client)
end

PSNRoomBrowser.is_refreshing = function (self)
	return PsnRoomBrowser.is_refreshing(self.browser)
end

PSNRoomBrowser.num_lobbies = function (self)
	return PsnRoomBrowser.num_rooms(self.browser)
end

PSNRoomBrowser.refresh = function (self)
	PsnRoomBrowser.refresh(self.browser)
end

PSNRoomBrowser.lobby = function (self, index)
	return PsnRoomBrowser.room(self.browser, index)
end

PSNRoomBrowser.add_filter = function (self, id, value, psn_comparison)
	PsnRoomBrowser.add_filter(self.browser, id, value, psn_comparison)
end

PSNRoomBrowser.clear_filters = function (self)
	PsnRoomBrowser.clear_filters(self.browser)
end

return
