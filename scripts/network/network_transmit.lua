local RPC = RPC
local shared_scratchpad_table = {}

function call_RPC(rpc_func_name, peer_id, ...)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	RPC[rpc_func_name](channel_id, ...)
end

local ignored_rpc_logs = table.mirror_array(GameSettingsDevelopment.ignored_rpc_logs)

local function rpc_local_print(rpc_name, ...)
	if ignored_rpc_logs[rpc_name] == nil then
		print("[LOCAL RPC] ", rpc_name, ...)
	end
end

NetworkTransmit = class(NetworkTransmit)

NetworkTransmit.init = function (self, is_server, server_peer_id)
	self.is_server = is_server
	self.peer_id = Network.peer_id()
	self.server_peer_id = server_peer_id
	self.local_rpc_queue = {
		{},
		{}
	}
	self.local_rpc_queue_n = {
		0,
		0
	}
	self.local_rpc_queue_contains_boxed = {
		{},
		{}
	}
	self.local_rpc_buffer_index = 1
	self.peer_ignore_list = {}
	self.game_session = nil
end

NetworkTransmit.set_game_session = function (self, session)
	self.game_session = session
end

NetworkTransmit.add_peer_ignore = function (self, peer_id)
	self.peer_ignore_list[peer_id] = true
end

NetworkTransmit.remove_peer_ignore = function (self, peer_id)
	self.peer_ignore_list[peer_id] = nil
end

NetworkTransmit.destroy = function (self)
	GarbageLeakDetector.register_object(self, "NetworkTransmit")
end

NetworkTransmit.queue_local_rpc = function (self, rpc_name, ...)
	local local_rpc_buffer_index = self.local_rpc_buffer_index
	local local_rpc_queue = self.local_rpc_queue[local_rpc_buffer_index]
	local local_rpc_queue_n = self.local_rpc_queue_n[local_rpc_buffer_index]
	local local_rpc_queue_contains_boxed = self.local_rpc_queue_contains_boxed[local_rpc_buffer_index]
	local num_varargs = select("#", ...)

	fassert(pack_index[num_varargs + 2], "Could not pack local rpc %q due to too many varargs. Only 20 is currently supported.", rpc_name)

	if self._transmitting_local_rpcs then
		local arguments = {
			...
		}
		local contains_boxed = false

		for i = 1, num_varargs do
			local arg = arguments[i]
			local type_name = Script.type_name(arg)

			if type_name == "Vector3" then
				arguments[i] = Vector3Box(arg)
				contains_boxed = true
			elseif type_name == "Vector4" then
				arguments[i] = QuaternionBox(arg)
				contains_boxed = true
			end
		end

		pack_index[num_varargs + 2](local_rpc_queue, local_rpc_queue_n, rpc_name, num_varargs, unpack(arguments, 1, num_varargs))

		local_rpc_queue_contains_boxed[#local_rpc_queue_contains_boxed + 1] = contains_boxed
	else
		pack_index[num_varargs + 2](local_rpc_queue, local_rpc_queue_n, rpc_name, num_varargs, ...)

		local_rpc_queue_contains_boxed[#local_rpc_queue_contains_boxed + 1] = false
	end

	self.local_rpc_queue_n[local_rpc_buffer_index] = local_rpc_queue_n + num_varargs + 2
end

NetworkTransmit.transmit_local_rpcs = function (self)
	self._transmitting_local_rpcs = true
	local local_rpc_buffer_index = self.local_rpc_buffer_index
	local local_rpc_queue_contains_boxed = self.local_rpc_queue_contains_boxed[local_rpc_buffer_index]
	local local_rpc_queue_n = self.local_rpc_queue_n[local_rpc_buffer_index]
	local local_rpc_queue = self.local_rpc_queue[local_rpc_buffer_index]
	self.local_rpc_buffer_index = 3 - local_rpc_buffer_index
	local event_table = self.network_event_delegate.event_table
	local channel_to_self = 0
	local do_print_local_rpcs = Development.parameter("network_log_messages")
	local i = 0
	local rpc_n = 0

	while i < local_rpc_queue_n do
		rpc_n = rpc_n + 1
		local rpc_name = local_rpc_queue[i]
		local rpc_num_args = local_rpc_queue[i + 1]

		if do_print_local_rpcs then
			rpc_local_print(rpc_name, unpack_index[rpc_num_args](local_rpc_queue, i + 2))
		end

		if local_rpc_queue_contains_boxed[rpc_n] then
			for j = 1, rpc_num_args do
				local argument_index = i + 1 + j
				local arg = local_rpc_queue[argument_index]
				local type_name = Script.type_name(arg)

				if type_name == "Vector3Box" or type_name == "QuaternionBox" then
					local_rpc_queue[argument_index] = arg:unbox()
				end
			end
		end

		event_table[rpc_name](nil, channel_to_self, unpack_index[rpc_num_args](local_rpc_queue, i + 2))

		i = i + rpc_num_args + 2
	end

	fassert(i == local_rpc_queue_n, "Couldn't process all local rpcs!")

	self.local_rpc_queue_n[local_rpc_buffer_index] = 0

	table.clear(local_rpc_queue_contains_boxed)

	self._transmitting_local_rpcs = false
end

NetworkTransmit.set_network_event_delegate = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate
end

NetworkTransmit.send_rpc = function (self, rpc_name, peer_id, ...)
	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc()] rpc does not exist %q", rpc_name)

	if peer_id == self.peer_id then
		self:queue_local_rpc(rpc_name, ...)
	else
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		rpc(channel_id, ...)
	end

	local my_peer_id = self.peer_id
end

NetworkTransmit.send_rpc_server = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_server()] rpc does not exist %q", rpc_name)

	if self.is_server then
		self:queue_local_rpc(rpc_name, ...)
	else
		fassert(self.server_peer_id, "We don't have any server connection when trying to send RPC %q", rpc_name)

		local channel_id = PEER_ID_TO_CHANNEL[self.server_peer_id]

		rpc(channel_id, ...)
	end
end

NetworkTransmit.send_rpc_party_clients = function (self, rpc_name, party, include_spectators, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return
	end

	local occupied_slots = party.occupied_slots
	local peer_ids = shared_scratchpad_table

	table.clear(peer_ids)

	for _, player_data in ipairs(occupied_slots) do
		if player_data.is_player then
			peer_ids[player_data.peer_id] = true
		end
	end

	if include_spectators then
		local spectator_party = Managers.party:get_party_from_name("spectators")

		if spectator_party then
			local occupied_slots = spectator_party.occupied_slots

			for _, player_data in ipairs(occupied_slots) do
				if player_data.is_player then
					peer_ids[player_data.peer_id] = true
				end
			end
		end
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] and peer_ids[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_party = function (self, rpc_name, party, include_spectators, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)
	self:queue_local_rpc(rpc_name, ...)

	local session = self.game_session

	if not session then
		return
	end

	local occupied_slots = party.occupied_slots
	local peer_ids = shared_scratchpad_table

	table.clear(peer_ids)

	for _, player_data in ipairs(occupied_slots) do
		if player_data.is_player then
			peer_ids[player_data.peer_id] = true
		end
	end

	if include_spectators then
		local spectator_party = Managers.party:get_party_from_name("spectators")

		if spectator_party then
			local occupied_slots = spectator_party.occupied_slots

			for _, player_data in ipairs(occupied_slots) do
				if player_data.is_player then
					peer_ids[player_data.peer_id] = true
				end
			end
		end
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] and peer_ids[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_side_clients = function (self, rpc_name, side, include_spectators, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return
	end

	local player_units = side.PLAYER_UNITS
	local peer_ids = shared_scratchpad_table

	table.clear(peer_ids)

	for _, unit in ipairs(player_units) do
		local player = Managers.player:owner(unit)
		peer_ids[player:network_id()] = true
	end

	if include_spectators then
		local spectator_side = Managers.state.side:get_side_from_name("spectators")

		if spectator_side then
			local player_units = side.PLAYER_UNITS

			for _, unit in ipairs(player_units) do
				local player = Managers.player:owner(unit)
				peer_ids[player:network_id()] = true
			end
		end
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] and peer_ids[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_clients = function (self, rpc_name, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_clients_except = function (self, rpc_name, except, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients_except()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if peer_id ~= except and not peer_ignore_list[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_side_clients_except = function (self, rpc_name, side, include_spectators, except, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return
	end

	local player_units = side.PLAYER_UNITS
	local peer_ids = shared_scratchpad_table

	table.clear(peer_ids)

	for _, unit in ipairs(player_units) do
		local player = Managers.player:owner(unit)
		peer_ids[player:network_id()] = true
	end

	if include_spectators then
		local spectator_side = Managers.state.side:get_side_from_name("spectators")

		if spectator_side then
			local player_units = side.PLAYER_UNITS

			for _, unit in ipairs(player_units) do
				local player = Managers.player:owner(unit)
				peer_ids[player:network_id()] = true
			end
		end
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] and peer_ids[peer_id] and peer_id ~= except then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_all = function (self, rpc_name, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_all()] rpc does not exist: %q", rpc_name)
	self:queue_local_rpc(rpc_name, ...)

	local session = self.game_session

	if not session then
		return
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

NetworkTransmit.send_rpc_all_except = function (self, rpc_name, except, ...)
	fassert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]

	fassert(rpc, "[NetworkTransmit:send_rpc_all_except()] rpc does not exist: %q", rpc_name)

	local my_peer_id = self.peer_id

	if except ~= my_peer_id then
		self:queue_local_rpc(rpc_name, ...)
	end

	local session = self.game_session

	if not session then
		return
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if peer_id ~= except and not peer_ignore_list[peer_id] then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end
