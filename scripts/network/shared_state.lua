require("scripts/utils/hash_utils")

SharedState = class(SharedState)
script_data.shared_state_debug = true
local RPCS = {
	"rpc_shared_state_set_server_int",
	"rpc_shared_state_set_server_string",
	"rpc_shared_state_set_server_bool",
	"rpc_shared_state_set_int",
	"rpc_shared_state_set_string",
	"rpc_shared_state_set_bool",
	"rpc_shared_state_client_left",
	"rpc_shared_state_request_sync",
	"rpc_shared_state_full_sync_complete",
	"rpc_shared_state_start_atomic_set_server",
	"rpc_shared_state_end_atomic_set_server"
}
local STRING_CHUNK_SIZE = 500

local function get_or_create_table(table, key)
	local val = table[key]

	if not val then
		val = {}
		table[key] = val
	end

	return val
end

local function set(state, owner, key_type, peer_id, local_player_id, profile_index, career_index, value)
	state = get_or_create_table(state, owner)
	state = get_or_create_table(state, key_type)
	state = get_or_create_table(state, peer_id)
	state = get_or_create_table(state, local_player_id)
	state = get_or_create_table(state, profile_index)
	state[career_index] = value
end

local function get(state, owner, key_type, peer_id, local_player_id, profile_index, career_index)
	state = state[owner]

	if not state then
		return
	end

	state = state[key_type]

	if not state then
		return
	end

	state = state[peer_id]

	if not state then
		return
	end

	state = state[local_player_id]

	if not state then
		return
	end

	state = state[profile_index]

	if not state then
		return
	end

	state = state[career_index]

	return state
end

local function set_server(state, key_type, peer_id, local_player_id, profile_index, career_index, value)
	state = get_or_create_table(state, key_type)
	state = get_or_create_table(state, peer_id)
	state = get_or_create_table(state, local_player_id)
	state = get_or_create_table(state, profile_index)
	state[career_index] = value
end

local function get_server(state, key_type, peer_id, local_player_id, profile_index, career_index)
	state = state[key_type]

	if not state then
		return
	end

	state = state[peer_id]

	if not state then
		return
	end

	state = state[local_player_id]

	if not state then
		return
	end

	state = state[profile_index]

	if not state then
		return
	end

	state = state[career_index]

	return state
end

local function get_rpc_for_type(type)
	if type == "number" then
		return "rpc_shared_state_set_int"
	end

	if type == "string" then
		return "rpc_shared_state_set_string"
	end

	if type == "boolean" then
		return "rpc_shared_state_set_bool"
	end
end

local function get_server_rpc_for_type(type)
	if type == "number" then
		return "rpc_shared_state_set_server_int"
	end

	if type == "string" then
		return "rpc_shared_state_set_server_string"
	end

	if type == "boolean" then
		return "rpc_shared_state_set_server_bool"
	end
end

local function get_full_cached_key(cache_tree, key_type, peer_id, local_player_id, profile_index, career_index)
	local cache = cache_tree
	cache = get_or_create_table(cache, key_type)

	if peer_id then
		cache = get_or_create_table(cache, peer_id)
	end

	if local_player_id then
		cache = get_or_create_table(cache, local_player_id)
	end

	if profile_index then
		cache = get_or_create_table(cache, profile_index)
	end

	if career_index then
		cache = get_or_create_table(cache, career_index)
	end

	if not cache.__val then
		local key = {
			key_type = key_type,
			peer_id = peer_id or "0",
			local_player_id = local_player_id or 0,
			profile_index = profile_index or 0,
			career_index = career_index or 0
		}
		cache.__val = key
	end

	return cache.__val
end

local function check_if_key_belongs_to_spec(spec, key)
	fassert(type(key) == "table", "[SharedState] key is not in the right format, did you call :get_key() to create it?")

	local key_type = key.key_type

	fassert(spec, "[SharedState] no spec provided for the calling type of state (server or peer state)")
	fassert(spec[key_type], "[SharedState] key type '%s' does not belong to spec", tostring(key_type))

	local composite_keys = spec[key_type].composite_keys
	local peer_id = key.peer_id

	fassert(peer_id == "0" or composite_keys and composite_keys.peer_id, "[SharedState] key type '%s' does not have peer_id as key parameter", tostring(key_type))
	fassert(peer_id ~= "0" or not composite_keys or not composite_keys.peer_id, "[SharedState] key type '%s' needs peer_id as key parameter", tostring(key_type))

	local local_player_id = key.local_player_id

	fassert(local_player_id == 0 or composite_keys and composite_keys.local_player_id, "[SharedState] key type '%s' does not have local_player_id as key parameter", tostring(key_type))
	fassert(local_player_id ~= 0 or not composite_keys or not composite_keys.local_player_id, "[SharedState] key type '%s' needs local_player_id as key parameter", tostring(key_type))

	local profile_index = key.profile_index

	fassert(profile_index == 0 or composite_keys and composite_keys.profile_index, "[SharedState] key type '%s' does not have profile_index as key parameter", tostring(key_type))
	fassert(profile_index ~= 0 or not composite_keys or not composite_keys.profile_index, "[SharedState] key type '%s' needs profile_index as key parameter", tostring(key_type))

	local career_index = key.career_index

	fassert(career_index == 0 or composite_keys and composite_keys.career_index, "[SharedState] key type '%s' does not have career_index as key parameter", tostring(key_type))
	fassert(career_index ~= 0 or not composite_keys or not composite_keys.career_index, "[SharedState] key type '%s' needs career_index as key parameter", tostring(key_type))
end

local function create_key_type_lookup_from_spec(spec)
	local spec_types = {}

	if spec.server then
		for key_type, _ in pairs(spec.server) do
			spec_types[#spec_types + 1] = key_type
		end
	end

	if spec.peer then
		for key_type, _ in pairs(spec.peer) do
			spec_types[#spec_types + 1] = key_type
		end
	end

	table.sort(spec_types)

	local lookup = {}

	for index, key_type in ipairs(spec_types) do
		lookup[key_type] = index
		lookup[index] = key_type
	end

	return lookup
end

local function printable_value(value)
	local type = type(value)

	if type == "string" or type == "number" or type == "boolean" then
		return tostring(value)
	else
		return cjson.encode(value)
	end
end

local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[SharedState] %s", message)
end

local function dprintf(...)
	if script_data.shared_state_debug then
		local message = sprintf(...)

		global_printf("[SharedState] %s", message)
	end
end

local function send_set_peer_rpc(channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	local encoded_value_type = type(encoded_value)
	local rpc = get_rpc_for_type(encoded_value_type)

	if encoded_value_type == "string" then
		local encoded_len = #encoded_value

		if encoded_len == 0 then
			RPC[rpc](channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value, true)
		else
			for i = 1, encoded_len, STRING_CHUNK_SIZE do
				local string_chunk = encoded_value:sub(i, i + STRING_CHUNK_SIZE - 1)
				local complete = encoded_len < i + STRING_CHUNK_SIZE

				RPC[rpc](channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, string_chunk, complete)
			end
		end
	else
		RPC[rpc](channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	end
end

local function send_set_server_rpc(channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	local encoded_value_type = type(encoded_value)
	local rpc = get_server_rpc_for_type(encoded_value_type)

	if encoded_value_type == "string" then
		local encoded_len = #encoded_value

		if encoded_len == 0 then
			RPC[rpc](channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value, true)
		else
			for i = 1, encoded_len, STRING_CHUNK_SIZE do
				local string_chunk = encoded_value:sub(i, i + STRING_CHUNK_SIZE - 1)
				local complete = encoded_len < i + STRING_CHUNK_SIZE

				RPC[rpc](channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, string_chunk, complete)
			end
		end
	else
		RPC[rpc](channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	end
end

SharedState.init = function (self, context, spec, is_server, network_server, server_peer_id, own_peer_id)
	self._original_context = context
	self._context = tostring(HashUtils.fnv32_hash(context))
	self._spec = spec
	self._revision = 0
	self._key_type_lookup = create_key_type_lookup_from_spec(spec)
	self._is_server = is_server
	self._peer_state = {}
	self._server_state = {}
	self._peer_id = own_peer_id
	self._server_peer_id = server_peer_id

	if is_server then
		self._server_full_sync_complete_mapping = {}
		self._network_server = network_server
	else
		self._client_full_sync_complete = false
	end

	self._key_cache = {}

	if self._is_server then
		self._network_server:register_shared_state(self)
	end
end

SharedState.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_server)
	self._peer_id = own_peer_id
	self._server_peer_id = server_peer_id
	self._is_server = is_server

	if is_server then
		self._server_full_sync_complete_mapping = {}
		self._network_server = network_server
	else
		self._client_full_sync_complete = false
		self._network_server = nil
	end
end

SharedState.register_rpcs = function (self, network_event_delegate)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)
	end

	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

SharedState.get_revision = function (self)
	return self._revision
end

SharedState.clear_peer_data = function (self, peer_id)
	if self:_is_destroyed() then
		return
	end

	dprintf("%s: <clear_peer_data> %s", self._original_context, peer_id)
	self:_clear_peer_id_data(peer_id)

	if self._network_server then
		local connected_peers = self._network_server:get_peers()

		for _, other_peer_id in ipairs(connected_peers) do
			local channel_id = PEER_ID_TO_CHANNEL[other_peer_id]

			RPC.rpc_shared_state_client_left(channel_id, self._context, peer_id)
		end
	end

	self._server_full_sync_complete_mapping[peer_id] = nil
end

SharedState.full_sync = function (self)
	if self:_is_destroyed() then
		return
	end

	if self._is_server then
		if self._network_server then
			local connected_peers = self._network_server:get_peers()

			for _, peer_id in ipairs(connected_peers) do
				if peer_id ~= self._peer_id then
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					RPC.rpc_shared_state_request_sync(channel_id, self._context)
				end
			end
		end
	else
		self._client_full_sync_complete = false
		local channel_id = PEER_ID_TO_CHANNEL[self._server_peer_id]

		if channel_id then
			RPC.rpc_shared_state_request_sync(channel_id, self._context)
		end
	end
end

SharedState.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)
	end

	self._network_event_delegate = nil
end

SharedState.destroy = function (self)
	self:unregister_rpcs()

	self._peer_state = nil
	self._server_state = nil
	self._context = nil
	self._is_server = nil

	if self._is_server then
		self._network_server:deregister_shared_state(self)
	end
end

SharedState.is_peer_fully_synced = function (self, peer_id)
	if self._is_server then
		if not self._network_server then
			return false
		end

		if peer_id ~= self._server_peer_id then
			return self._server_full_sync_complete_mapping[peer_id]
		else
			return true
		end
	else
		return self._client_full_sync_complete
	end
end

SharedState.get_key = function (self, key_type, peer_id, local_player_id, profile_index, career_index)
	return get_full_cached_key(self._key_cache, key_type, peer_id, local_player_id, profile_index, career_index)
end

SharedState.set_peer = function (self, owner, key, value)
	if self:_is_destroyed() then
		return
	end

	fassert(value ~= nil, "value can't be nil")
	fassert(type(value) == self._spec.peer[key.key_type].type, "value type is not the same as the spec defines.")
	set(self._peer_state, owner, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, value)

	if owner == self._peer_id then
		dprintf("%s: <set %s> %s:%s:%d:%d:%d = %s", self._original_context, owner, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, printable_value(value))

		local encoder = self._spec.peer[key.key_type].encode
		local encoded_value = encoder and encoder(value) or value

		if self._is_server then
			if self._network_server then
				local connected_peers = self._network_server:get_peers()

				for _, peer_id in ipairs(connected_peers) do
					if peer_id ~= self._peer_id then
						local channel_id = PEER_ID_TO_CHANNEL[peer_id]

						send_set_peer_rpc(channel_id, self._context, self._peer_id, self._key_type_lookup[key.key_type], key.peer_id, key.local_player_id, key.profile_index, key.career_index, encoded_value)
					end
				end
			end
		else
			local channel_id = PEER_ID_TO_CHANNEL[self._server_peer_id]

			send_set_peer_rpc(channel_id, self._context, self._peer_id, self._key_type_lookup[key.key_type], key.peer_id, key.local_player_id, key.profile_index, key.career_index, encoded_value)
		end
	else
		dprintf("%s: <set prediction %s> %s:%s:%d:%d:%d = %s", self._original_context, owner, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, printable_value(value))
	end

	self:_increment_revision()
end

SharedState.start_atomic_set_server = function (self, name)
	fassert(not self._current_start_atomic_set_server, "start_atomic_set_server(%s) called before calling end_atomic_set_server(%s)", name, self._current_start_atomic_set_server)

	self._current_start_atomic_set_server = name

	if self._is_server then
		dprintf("%s: <atomic_set_server start> name:%s", self._original_context, name)

		if self._network_server then
			local connected_peers = self._network_server:get_peers()

			for _, peer_id in ipairs(connected_peers) do
				if peer_id ~= self._peer_id then
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					RPC.rpc_shared_state_start_atomic_set_server(channel_id, self._context)
				end
			end
		end
	else
		dprintf("%s: <atomic_set_server start prediction> name:%s", self._original_context, name)
	end
end

SharedState.end_atomic_set_server = function (self, name)
	fassert(self._current_start_atomic_set_server == name, "mismatched end_atomic_set_server(%s) and start_atomic_set_server(%s)", name, self._current_start_atomic_set_server)

	if self._is_server then
		dprintf("%s: <atomic_set_server end> name:%s", self._original_context, name)

		if self._network_server then
			local connected_peers = self._network_server:get_peers()

			for _, peer_id in ipairs(connected_peers) do
				if peer_id ~= self._peer_id then
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					RPC.rpc_shared_state_end_atomic_set_server(channel_id, self._context)
				end
			end
		end
	else
		dprintf("%s: <atomic_set_server end prediction> name:%s", self._original_context, name)
	end

	self._current_start_atomic_set_server = nil
end

SharedState.set_server = function (self, key, value)
	if self:_is_destroyed() then
		return
	end

	fassert(value ~= nil, "value can't be nil")
	fassert(type(value) == self._spec.server[key.key_type].type, "value type is not the same as the spec defines.")
	set_server(self._server_state, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, value)

	if self._is_server then
		dprintf("%s: <set server> %s:%s:%d:%d:%d = %s", self._original_context, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, printable_value(value))

		local encoder = self._spec.server[key.key_type].encode
		local encoded_value = encoder and encoder(value) or value

		if self._network_server then
			local connected_peers = self._network_server:get_peers()

			for _, peer_id in ipairs(connected_peers) do
				if peer_id ~= self._peer_id then
					local channel_id = PEER_ID_TO_CHANNEL[peer_id]

					send_set_server_rpc(channel_id, self._context, self._key_type_lookup[key.key_type], key.peer_id, key.local_player_id, key.profile_index, key.career_index, encoded_value)
				end
			end
		end
	else
		dprintf("%s: <set server prediction> %s:%s:%d:%d:%d = %s", self._original_context, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index, printable_value(value))
	end

	self:_increment_revision()
end

SharedState.set_own = function (self, key, value)
	self:set_peer(self._peer_id, key, value)
end

SharedState.get_peer = function (self, owner, key)
	if self:_is_destroyed() then
		return self._spec.peer[key.key_type].default_value
	end

	local value = get(self._peer_state, owner, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index)

	return value or self._spec.peer[key.key_type].default_value
end

SharedState.get_own = function (self, key)
	return self:get_peer(self._peer_id, key)
end

SharedState.get_server = function (self, key)
	if self:_is_destroyed() then
		return self._spec.server[key.key_type].default_value
	end

	local value = get_server(self._server_state, key.key_type, key.peer_id, key.local_player_id, key.profile_index, key.career_index)

	return value or self._spec.server[key.key_type].default_value
end

SharedState.rpc_shared_state_request_sync = function (self, channel_id, context)
	if self:_is_destroyed() then
		return nil
	end

	if context ~= self._context then
		return
	end

	if self._is_server then
		for key_type, key_type_state in pairs(self._server_state) do
			for peer_id, peer_id_state in pairs(key_type_state) do
				for local_player_id, local_player_id_state in pairs(peer_id_state) do
					for profile_index, profile_index_state in pairs(local_player_id_state) do
						for career_index, value in pairs(profile_index_state) do
							local encoder = self._spec.server[key_type].encode
							local encoded_value = encoder and encoder(value) or value

							send_set_server_rpc(channel_id, self._context, self._key_type_lookup[key_type], peer_id, local_player_id, profile_index, career_index, encoded_value)
						end
					end
				end
			end
		end

		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		for player_id, player_state in pairs(self._peer_state) do
			if player_id ~= peer_id then
				self:_send_all(channel_id, player_id, player_state)
			end
		end

		RPC.rpc_shared_state_full_sync_complete(channel_id, self._context)

		self._server_full_sync_complete_mapping[peer_id] = true
	else
		local local_id = Network.peer_id()
		local player_state = self._peer_state[local_id]

		if player_state then
			self:_send_all(channel_id, local_id, player_state)
		end
	end
end

SharedState.rpc_shared_state_full_sync_complete = function (self, channel_id, context)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self._client_full_sync_complete = true
end

SharedState.rpc_shared_state_set_int = function (self, channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self:_set_rpc(channel_id, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
end

SharedState.rpc_shared_state_set_string = function (self, channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value, complete)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	if self._batched_string_buffer then
		self._batched_string_buffer[#self._batched_string_buffer + 1] = encoded_value

		if complete then
			local full_value = table.concat(self._batched_string_buffer, "")

			self:_set_rpc(channel_id, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, full_value)

			self._batched_string_buffer = nil
		end
	elseif complete then
		self:_set_rpc(channel_id, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	else
		self._batched_string_buffer = {
			encoded_value
		}
	end
end

SharedState.rpc_shared_state_set_bool = function (self, channel_id, context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self:_set_rpc(channel_id, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
end

SharedState.rpc_shared_state_set_server_int = function (self, channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self:_set_server_rpc(channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
end

SharedState.rpc_shared_state_set_server_string = function (self, channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value, complete)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	if self._batched_string_buffer then
		self._batched_string_buffer[#self._batched_string_buffer + 1] = encoded_value

		if complete then
			local full_value = table.concat(self._batched_string_buffer, "")

			self:_set_server_rpc(channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, full_value)

			self._batched_string_buffer = nil
		end
	elseif complete then
		self:_set_server_rpc(channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	else
		self._batched_string_buffer = {
			encoded_value
		}
	end
end

SharedState.rpc_shared_state_set_server_bool = function (self, channel_id, context, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self:_set_server_rpc(channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
end

SharedState.rpc_shared_state_client_left = function (self, channel_id, context, peer_id)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	dprintf("%s: <rpc client left> %s", self._original_context, peer_id)
	self:_clear_peer_id_data(peer_id)
end

SharedState._set_rpc = function (self, sender_channel_id, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	local key_type = self._key_type_lookup[key_type_lookup]
	local decoder = self._spec.peer[key_type].decode
	local value = decoder and decoder(encoded_value) or encoded_value

	dprintf("%s: <rpc set %s> %s:%s:%d:%d:%d = %s", self._original_context, owner, key_type, peer_id, local_player_id, profile_index, career_index, printable_value(value))
	set(self._peer_state, owner, key_type, peer_id, local_player_id, profile_index, career_index, value)

	if self._is_server then
		local sender_peer_id = CHANNEL_TO_PEER_ID[sender_channel_id]

		if self._network_server then
			local connected_peers = self._network_server:get_peers()

			for _, connected_peer_id in ipairs(connected_peers) do
				if connected_peer_id ~= sender_peer_id and connected_peer_id ~= self._peer_id then
					local channel_id = PEER_ID_TO_CHANNEL[connected_peer_id]

					send_set_peer_rpc(channel_id, self._context, owner, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
				end
			end
		end
	end

	self:_increment_revision()
end

SharedState._set_server_rpc = function (self, sender_channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	local atomic_set_server_cache = self._atomic_set_server_cache

	if atomic_set_server_cache then
		local index = #atomic_set_server_cache
		atomic_set_server_cache[index] = sender_channel_id
		atomic_set_server_cache[index + 1] = key_type_lookup
		atomic_set_server_cache[index + 2] = peer_id
		atomic_set_server_cache[index + 3] = local_player_id
		atomic_set_server_cache[index + 4] = profile_index
		atomic_set_server_cache[index + 5] = career_index
		atomic_set_server_cache[index + 6] = encoded_value

		return
	end

	local key_type = self._key_type_lookup[key_type_lookup]
	local decoder = self._spec.server[key_type].decode
	local value = decoder and decoder(encoded_value) or encoded_value

	dprintf("%s: <rpc set server> %s:%s:%d:%d:%d = %s", self._original_context, key_type, peer_id, local_player_id, profile_index, career_index, printable_value(value))
	set_server(self._server_state, key_type, peer_id, local_player_id, profile_index, career_index, value)
	self:_increment_revision()
end

SharedState._send_all = function (self, channel_id, player_id, player_state)
	for key_type, key_type_state in pairs(player_state) do
		for peer_id, peer_id_state in pairs(key_type_state) do
			for local_player_id, local_player_id_state in pairs(peer_id_state) do
				for profile_index, profile_index_state in pairs(local_player_id_state) do
					for career_index, value in pairs(profile_index_state) do
						local encoder = self._spec.peer[key_type].encode
						local encoded_value = encoder and encoder(value) or value

						send_set_peer_rpc(channel_id, self._context, player_id, self._key_type_lookup[key_type], peer_id, local_player_id, profile_index, career_index, encoded_value)
					end
				end
			end
		end
	end
end

SharedState._clear_peer_id_data = function (self, peer_id)
	for key_type, spec_part in pairs(self._spec.server) do
		if spec_part.clear_when_peer_id_leaves then
			local key_type_state = self._server_state[key_type]

			if key_type_state then
				key_type_state[peer_id] = nil
			end
		end
	end

	self._peer_state[peer_id] = nil

	for key_type, spec_part in pairs(self._spec.peer) do
		if spec_part.clear_when_peer_id_leaves then
			for state_peer_id, state in pairs(self._peer_state) do
				local key_type_state = state[key_type]

				if key_type_state then
					key_type_state[peer_id] = nil
				end
			end
		end
	end

	self:_increment_revision()
end

SharedState._is_destroyed = function (self)
	return self._server_state == nil
end

SharedState._increment_revision = function (self)
	local revision = self._revision
	self._revision = self._revision + 1

	if self._revision == revision then
		dprintf("%s: revision reset back to zero", self._original_context)

		self._revision = 0
	end
end

SharedState.rpc_shared_state_start_atomic_set_server = function (self, context)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	self._atomic_set_server_cache = {}
end

SharedState.rpc_shared_state_end_atomic_set_server = function (self, context)
	if self:_is_destroyed() then
		return
	end

	if context ~= self._context then
		return
	end

	fassert(self._atomic_set_server_cache, "rpc_shared_state_end_atomic_set_server received when rpc_shared_state_start_atomic_set_server had not been called before")

	for i = 1, #self._atomic_set_server_cache, 7 do
		local sender_channel_id = self._atomic_set_server_cache[i]
		local key_type_lookup = self._atomic_set_server_cache[i + 1]
		local peer_id = self._atomic_set_server_cache[i + 2]
		local local_player_id = self._atomic_set_server_cache[i + 3]
		local profile_index = self._atomic_set_server_cache[i + 4]
		local career_index = self._atomic_set_server_cache[i + 5]
		local encoded_value = self._atomic_set_server_cache[i + 6]

		self:_set_server_rpc(sender_channel_id, key_type_lookup, peer_id, local_player_id, profile_index, career_index, encoded_value)
	end
end

local function check_spec_part(spec_part)
	for key_type, elem_spec in pairs(spec_part) do
		fassert(elem_spec.type, "spec %s invalid, missing type", key_type)
		fassert(elem_spec.default_value ~= nil, "spec %s invalid, missing default_value", key_type)
		fassert(type(elem_spec.default_value) == elem_spec.type, "spec %s invalid, missing default_value", key_type)

		if elem_spec.type == "table" then
			fassert(elem_spec.decode and elem_spec.encode, "spec %s invalid, must provide decode and encode method with table type", key_type)
		end

		fassert(elem_spec.composite_keys, "spec %s invalid, missing composite_keys", key_type)

		for key_param, _ in pairs(elem_spec.composite_keys) do
			fassert(key_param == "peer_id" or key_param == "local_player_id" or key_param == "profile_index" or key_param == "career_index", "spec %s invalid, invalid key_param %s, must be one of peer_id, local_player_id, profile_index, career_index", key_type)
		end

		fassert(not elem_spec.clear_when_peer_id_leaves or elem_spec.clear_when_peer_id_leaves and elem_spec.composite_keys.peer_id, "--")
	end
end

SharedState.validate_spec = function (spec)
	fassert(spec, "spec invalid, nil")
	fassert(spec.peer, "spec invalid, missing peer spec")
	fassert(spec.server, "spec invalid, missing server spec")
	check_spec_part(spec.peer)
	check_spec_part(spec.server)
end
