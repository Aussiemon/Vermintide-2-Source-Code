DeedManager = class(DeedManager)
local RPCS = {
	"rpc_select_deed",
	"rpc_reset_deed",
	"rpc_deed_consumed"
}
DeedManager.init = function (self)
	self._selected_deed_data = nil
	self._selected_deed_id = nil
	self._owner_peer_id = nil

	return 
end
DeedManager.destroy = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	return 
end
DeedManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	self._is_server = server_peer_id == own_peer_id

	return 
end
DeedManager.network_context_destroyed = function (self)
	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil

	return 
end
DeedManager.register_rpcs = function (self, network_event_delegate)
	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate

	return 
end
DeedManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
DeedManager.reset = function (self)
	if self._is_server then
		self._selected_deed_data = nil
		self._selected_deed_id = nil
		self._owner_peer_id = nil
		self._deed_session_faulty = nil

		self._send_rpc_to_clients(self, "rpc_reset_deed")
	end

	return 
end
DeedManager.mutators = function (self)
	if self._selected_deed_data then
		return self._selected_deed_data.mutators
	else
		return {}
	end

	return 
end
DeedManager.rewards = function (self)
	if self._selected_deed_data then
		return self._selected_deed_data.rewards
	else
		return nil
	end

	return 
end
DeedManager.has_deed = function (self)
	return self._selected_deed_data ~= nil
end
DeedManager.active_deed = function (self)
	fassert(self._selected_deed_data, "Has no active deed")

	return self._selected_deed_data, self._selected_deed_id
end
DeedManager.is_deed_owner = function (self, peer_id)
	peer_id = peer_id or self._peer_id

	return self._owner_peer_id == peer_id
end
DeedManager.is_session_faulty = function (self)
	return self._deed_session_faulty
end
DeedManager.consume_deed = function (self, reward_callback)
	if self._owner_peer_id == self._peer_id then
		if self._is_server then
			self._send_rpc_to_clients(self, "rpc_deed_consumed")
		else
			self._send_rpc_to_server(self, "rpc_deed_consumed")
		end
	elseif self._has_consumed_deed then
		self._has_consumed_deed = nil
		self._reward_callback = reward_callback

		self._use_reward_callback(self)
	else
		self._reward_callback = reward_callback
	end

	return 
end
DeedManager.update = function (self, dt)
	if self.has_deed(self) then
		self._update_owner(self, dt)
	end

	return 
end
DeedManager.select_deed = function (self, backend_id, peer_id)
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface.get_item_from_id(item_interface, backend_id)
	local item_data = item.data
	self._selected_deed_data = item_data
	self._selected_deed_id = backend_id
	self._owner_peer_id = peer_id
	self._deed_session_faulty = false
	local item_name_id = NetworkLookup.item_names[item_data.name]

	if self._is_server then
		self._send_rpc_to_clients(self, "rpc_select_deed", item_name_id, peer_id)
	else
		self._send_rpc_to_server(self, "rpc_select_deed", item_name_id, peer_id)
	end

	return 
end
DeedManager._update_owner = function (self, dt)
	if self._deed_session_faulty then
		return 
	end

	local owner_peer_id = self._owner_peer_id
	local lobby = self._lobby
	local members_map = lobby.members(lobby):members_map()

	if not members_map[owner_peer_id] then
		Managers.chat:add_local_system_message(1, "deed_owner_left_game", true)

		self._deed_session_faulty = true
	end

	return 
end
DeedManager._use_reward_callback = function (self)
	fassert(self._reward_callback, "there is no reward callback")

	local reward_callback = self._reward_callback
	self._reward_callback = nil

	reward_callback()

	return 
end
DeedManager.rpc_select_deed = function (self, sender, item_name_id, owner_peer_id)
	local item_name = NetworkLookup.item_names[item_name_id]
	local item_data = ItemMasterList[item_name]
	self._selected_deed_data = item_data
	self._selected_deed_id = nil
	self._owner_peer_id = owner_peer_id

	if self._is_server then
		self._send_rpc_to_clients_except(self, "rpc_select_deed", sender, item_name_id, owner_peer_id)
	end

	return 
end
DeedManager.rpc_deed_consumed = function (self, sender)
	if not self._reward_callback then
		self._has_consumed_deed = true
	else
		self._use_reward_callback(self)
	end

	if self._is_server then
		self._send_rpc_to_clients_except("rpc_deed_consumed", sender)
	end

	return 
end
DeedManager.rpc_reset_deed = function (self, sender)
	self._selected_deed_data = nil
	self._selected_deed_id = nil
	self._owner_peer_id = nil

	return 
end
DeedManager._send_rpc_to_server = function (self, rpc_name, ...)
	if not self._lobby then
		return 
	end

	local rpc = RPC[rpc_name]

	rpc(self._server_peer_id, ...)

	return 
end
DeedManager._send_rpc_to_clients = function (self, rpc_name, ...)
	if not self._lobby then
		return 
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local members = self._lobby:members():get_members()
	local num_members = #members

	for i = 1, num_members, 1 do
		local peer_id = members[i]

		if peer_id ~= server_peer_id then
			rpc(peer_id, ...)
		end
	end

	return 
end
DeedManager._send_rpc_to_clients_except = function (self, rpc_name, except, ...)
	if not self._lobby then
		return 
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local members = self._lobby:members():get_members()
	local num_members = #members

	for i = 1, num_members, 1 do
		local peer_id = members[i]

		if peer_id ~= server_peer_id and peer_id ~= except then
			rpc(peer_id, ...)
		end
	end

	return 
end

return 
