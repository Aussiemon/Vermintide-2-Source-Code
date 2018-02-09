local RPC = RPC
local ignored_rpc_logs = table.mirror_array(GameSettingsDevelopment.ignored_rpc_logs)

local function rpc_local_print(rpc_name, ...)
	if ignored_rpc_logs[rpc_name] == nil then
		print("[LOCAL RPC] ", rpc_name, ...)
	end

	return 
end

NetworkTransmit = class(NetworkTransmit)
NetworkTransmit.init = function (self, is_server, connection_handler)
	self.is_server = is_server
	self.peer_id = Network.peer_id()
	self.server_peer_id = connection_handler.server_peer_id
	self.connection_handler = connection_handler
	self.local_rpc_queue = {
		{},
		{}
	}
	self.local_rpc_queue_n = {
		0,
		0
	}
	self.local_rpc_buffer_index = 1
	self.peer_ignore_list = {}
	self.game_session = nil

	return 
end
NetworkTransmit.set_game_session = function (self, session)
	self.game_session = session

	return 
end
NetworkTransmit.add_peer_ignore = function (self, peer_id)
	self.peer_ignore_list[peer_id] = true

	return 
end
NetworkTransmit.remove_peer_ignore = function (self, peer_id)
	self.peer_ignore_list[peer_id] = nil

	return 
end
NetworkTransmit.destroy = function (self)
	GarbageLeakDetector.register_object(self, "NetworkTransmit")

	return 
end
NetworkTransmit.queue_local_rpc = function (self, rpc_name, ...)
	local local_rpc_buffer_index = self.local_rpc_buffer_index
	local local_rpc_queue = self.local_rpc_queue[local_rpc_buffer_index]
	local local_rpc_queue_n = self.local_rpc_queue_n[local_rpc_buffer_index]
	local num_varargs = select("#", ...)

	assert(pack_index[num_varargs + 2], "Could not pack local rpc %q due to too many varargs. Only 20 is currently supported.", rpc_name)
	pack_index[num_varargs + 2](local_rpc_queue, local_rpc_queue_n, rpc_name, num_varargs, ...)

	self.local_rpc_queue_n[local_rpc_buffer_index] = local_rpc_queue_n + num_varargs + 2

	return 
end
NetworkTransmit.transmit_local_rpcs = function (self)
	local local_rpc_buffer_index = self.local_rpc_buffer_index
	local local_rpc_queue_n = self.local_rpc_queue_n[local_rpc_buffer_index]
	local local_rpc_queue = self.local_rpc_queue[local_rpc_buffer_index]
	self.local_rpc_buffer_index = local_rpc_buffer_index - 3
	local event_table = self.network_event_delegate.event_table
	local my_peer_id = self.peer_id
	local do_print_local_rpcs = Development.parameter("network_log_messages")
	local i = 0

	while i < local_rpc_queue_n do
		local rpc_name = local_rpc_queue[i]
		local rpc_num_args = local_rpc_queue[i + 1]

		if do_print_local_rpcs then
			rpc_local_print(rpc_name, unpack_index[rpc_num_args](local_rpc_queue, i + 2))
		end

		event_table[rpc_name](nil, my_peer_id, unpack_index[rpc_num_args](local_rpc_queue, i + 2))

		i = i + rpc_num_args + 2
	end

	assert(i == local_rpc_queue_n)

	self.local_rpc_queue_n[local_rpc_buffer_index] = 0

	return 
end
NetworkTransmit.set_network_event_delegate = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	return 
end
NetworkTransmit.send_rpc = function (self, rpc_name, peer_id, ...)
	local rpc = RPC[rpc_name]
	local my_peer_id = self.peer_id

	assert(rpc, "[NetworkTransmit:send_rpc()] rpc does not exist %q", rpc_name)

	if peer_id == my_peer_id then
		self.queue_local_rpc(self, rpc_name, ...)
	else
		rpc(peer_id, ...)
	end

	return 
end
NetworkTransmit.send_rpc_server = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]

	assert(rpc, "[NetworkTransmit:send_rpc_server()] rpc does not exist %q", rpc_name)

	if self.is_server then
		self.queue_local_rpc(self, rpc_name, ...)
	else
		assert(self.server_peer_id, "We don't have any server connection when trying to send RPC %q", rpc_name)
		rpc(self.server_peer_id, ...)
	end

	return 
end
NetworkTransmit.send_rpc_clients = function (self, rpc_name, ...)
	assert(self.is_server, "Trying to send rpc %q on client to clients which is wrong. Only servers should use this function.", rpc_name)

	local rpc = RPC[rpc_name]
	local server_peer_id = self.server_peer_id

	assert(rpc, "[NetworkTransmit:send_rpc_clients()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return 
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] then
			rpc(peer_id, ...)
		end
	end

	return 
end
NetworkTransmit.send_rpc_clients_except = function (self, rpc_name, except, ...)
	assert(self.is_server)

	local mypeer = self.peer_id
	local rpc = RPC[rpc_name]

	assert(rpc, "[NetworkTransmit:send_rpc_clients_except()] rpc does not exist: %q", rpc_name)

	local session = self.game_session

	if not session then
		return 
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if peer_id ~= except and not peer_ignore_list[peer_id] then
			rpc(peer_id, ...)
		end
	end

	return 
end
NetworkTransmit.send_rpc_all = function (self, rpc_name, ...)
	assert(self.is_server)

	local rpc = RPC[rpc_name]
	local my_peer_id = self.peer_id

	assert(rpc, "[NetworkTransmit:send_rpc_all()] rpc does not exist: %q", rpc_name)
	self.queue_local_rpc(self, rpc_name, ...)

	local session = self.game_session

	if not session then
		return 
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if not peer_ignore_list[peer_id] then
			rpc(peer_id, ...)
		end
	end

	return 
end
NetworkTransmit.send_rpc_all_except = function (self, rpc_name, except, ...)
	assert(self.is_server)

	local rpc = RPC[rpc_name]

	assert(rpc, "[NetworkTransmit:send_rpc_all_except()] rpc does not exist: %q", rpc_name)

	local my_peer_id = self.peer_id

	if except ~= my_peer_id then
		self.queue_local_rpc(self, rpc_name, ...)
	end

	local session = self.game_session

	if not session then
		return 
	end

	local peer_ignore_list = self.peer_ignore_list

	for _, peer_id in ipairs(GameSession.other_peers(session)) do
		if peer_id ~= except and not peer_ignore_list[peer_id] then
			rpc(peer_id, ...)
		end
	end

	return 
end

return 
