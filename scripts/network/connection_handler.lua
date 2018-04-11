PeerConnectionState = PeerConnectionState or CreateStrictEnumTable("Connected", "Connecting", "Broken", "Disconnecting", "Disconnected")
script_data.network_debug_connections = script_data.network_debug_connections or Development.parameter("network_debug_connections")

local function ch_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[ConnectionHandler] " .. format, ...)
	end

	return 
end

ConnectionHandler = class(ConnectionHandler)
ConnectionHandler.init = function (self, server_peer_id)
	self.pending_disconnects = {}
	self.pending_connects = {}
	self.broken_connections = {}
	self.num_broken_connections = 0
	self.current_connections = {}
	self.last_connected_value = 2
	self.server_peer_id = server_peer_id
	self.peer_states = {}

	return 
end
ConnectionHandler.update_peer = function (self, peer_id, new_state)
	if self.peer_states[peer_id] ~= new_state then
		ch_printf("Peer state for %q: [%s] ==> [%s]", peer_id, tostring(self.peer_states[peer_id]), tostring(new_state))

		local from_state = PeerConnectionState[self.peer_states[peer_id]]
		self.peer_states[peer_id] = new_state
	end

	return 
end
ConnectionHandler.get_current_connections = function (self)
	return self.current_connections
end
ConnectionHandler.destroy = function (self)
	assert(false, "Is this used?")

	for peer_id, _ in pairs(self.current_connections) do
		Network.destroy_connection(peer_id)
	end

	self.pending_disconnects = nil
	self.pending_connects = nil
	self.broken_connections = nil
	self.current_connections = nil

	return 
end
local new_connections = {}
ConnectionHandler.update = function (self, dt)
	table.clear(new_connections)

	local num_new_connections = 0
	local pending_connects = self.pending_connects
	local current_connections = self.current_connections
	local connected_value = 3 - self.last_connected_value

	for peer_id, _ in pairs(pending_connects) do
		if Network.has_connection(peer_id) and not Network.is_broken(peer_id) then
			pending_connects[peer_id] = nil
			current_connections[peer_id] = connected_value

			self.update_peer(self, peer_id, PeerConnectionState.Connected)
		end
	end

	local pending_disconnects = self.pending_disconnects

	for peer_id, _ in pairs(pending_disconnects) do
		if not Network.is_used(peer_id) then
			if Network.has_connection(peer_id) then
				Network.destroy_connection(peer_id)
			end

			pending_disconnects[peer_id] = nil
			current_connections[peer_id] = nil

			self.update_peer(self, peer_id, PeerConnectionState.Disconnected)
		end
	end

	local running_connections = Network.connections()

	for i, peer_id in ipairs(running_connections) do
		if not Network.is_broken(peer_id) then
			if not current_connections[peer_id] and not pending_connects[peer_id] then
				num_new_connections = num_new_connections + 1
				new_connections[num_new_connections] = peer_id

				self.update_peer(self, peer_id, PeerConnectionState.Connecting)

				pending_connects[peer_id] = connected_value
			else
				current_connections[peer_id] = connected_value
			end
		end
	end

	if PLATFORM == "xb1" then
		for i, peer_id in ipairs(running_connections) do
			if not current_connections[peer_id] and not pending_connects[peer_id] and not pending_disconnects[peer_id] and not Network.is_used(peer_id) then
				ch_printf("Destroying connection to peer %q since not used.", peer_id)
				Network.destroy_connection(peer_id)
			end
		end
	end

	local peer_states = self.peer_states
	local broken_connections = self.broken_connections
	local num_broken_connections = self.num_broken_connections

	for peer_id, peer_connected_value in pairs(current_connections) do
		if Network.is_broken(peer_id) then
			if peer_states[peer_id] ~= PeerConnectionState.Broken then
				ch_printf("Peer %q is now broken.", peer_id)
				self.update_peer(self, peer_id, PeerConnectionState.Broken)
			end

			num_broken_connections = num_broken_connections + 1
			broken_connections[num_broken_connections] = peer_id
			current_connections[peer_id] = nil
			self.pending_disconnects[peer_id] = true
		elseif not Network.is_used(peer_id) then
			ch_printf("Destroying connection to peer %q since it's not used.", peer_id)
			Network.destroy_connection(peer_id)

			current_connections[peer_id] = nil
			num_broken_connections = num_broken_connections + 1
			broken_connections[num_broken_connections] = peer_id
		else
			assert(connected_value == peer_connected_value)
		end
	end

	self.num_broken_connections = num_broken_connections
	self.last_connected_value = connected_value

	return new_connections, num_new_connections
end
local temp_table = {}
ConnectionHandler.disconnect_all = function (self)
	ch_printf("Disconnecting all peers")

	local current_connections = self.current_connections

	for peer_id, _ in pairs(current_connections) do
		temp_table[#temp_table + 1] = peer_id
	end

	self.disconnect_peers(self, unpack(current_connections))
	table.clear(current_connections)

	return 
end
ConnectionHandler.connect_peers = function (self, ...)
	local num_args = select("#", ...)
	local pending_disconnects = self.pending_disconnects

	ch_printf("Connecting %d peers", num_args)

	for i = 1, num_args, 1 do
		local peer_id = select(i, ...)

		if pending_disconnects[peer_id] then
			pending_disconnects[peer_id] = nil
		end

		if not Network.has_connection(peer_id) then
			Network.create_connection(peer_id)

			self.pending_connects[peer_id] = true

			self.update_peer(self, peer_id, PeerConnectionState.Connecting)
		else
			self.update_peer(self, peer_id, PeerConnectionState.Connected)
		end
	end

	return 
end
ConnectionHandler.disconnect_peers = function (self, ...)
	local num_args = select("#", ...)
	local pending_connects = self.pending_connects
	local pending_disconnects = self.pending_disconnects
	local current_connections = self.current_connections

	ch_printf("Disconnecting %d peers", num_args)

	for i = 1, num_args, 1 do
		local peer_id = select(i, ...)

		if pending_connects[peer_id] then
			pending_connects[peer_id] = nil
		end

		if Network.has_connection(peer_id) then
			if Network.is_used(peer_id) then
				pending_disconnects[peer_id] = true

				self.update_peer(self, peer_id, PeerConnectionState.Disconnecting)
			else
				Network.destroy_connection(peer_id)

				current_connections[peer_id] = nil

				self.update_peer(self, peer_id, PeerConnectionState.Disconnected)
			end
		end
	end

	return 
end
ConnectionHandler.get_broken_connections = function (self)
	local num_broken_connections = self.num_broken_connections
	self.num_broken_connections = 0

	return self.broken_connections, num_broken_connections
end

return 
