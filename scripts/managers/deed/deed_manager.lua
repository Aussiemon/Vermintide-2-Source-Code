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
end

DeedManager.destroy = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

DeedManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id, is_server, network_handler)
	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	self._network_server = (is_server and network_handler) or nil
	self._is_server = is_server
	local ignore_send = true

	self:reset(ignore_send)
end

DeedManager.network_context_destroyed = function (self)
	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._network_server = nil
	self._is_server = false
	local ignore_send = true

	self:reset(ignore_send)
end

DeedManager.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
end

DeedManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

DeedManager.reset = function (self, ignore_send)
	self._selected_deed_data = nil
	self._selected_deed_id = nil
	self._owner_peer_id = nil
	self._deed_session_faulty = nil

	if self._is_server and not ignore_send then
		self:_send_rpc_to_clients("rpc_reset_deed")
	end
end

DeedManager.mutators = function (self)
	if self._selected_deed_data then
		return self._selected_deed_data.mutators
	else
		return nil
	end
end

DeedManager.rewards = function (self)
	if self._selected_deed_data then
		return self._selected_deed_data.rewards
	else
		return nil
	end
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
	print("[DeedManager]:consume_deed()")

	if self._owner_peer_id == self._peer_id then
		local network_manager = Managers.state.network

		if network_manager and network_manager:game() then
			if self._is_server then
				self:_send_rpc_to_clients("rpc_deed_consumed")
			else
				self:_send_rpc_to_server("rpc_deed_consumed")
			end
		end
	elseif self._has_consumed_deed then
		self._has_consumed_deed = nil
		self._reward_callback = reward_callback

		self:_use_reward_callback()
	else
		self._reward_callback = reward_callback
	end
end

DeedManager.update = function (self, dt)
	if self:has_deed() then
		self:_update_owner(dt)
	end
end

DeedManager.select_deed = function (self, backend_id, peer_id)
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(backend_id)
	local item_data = item.data
	self._selected_deed_data = item_data
	self._selected_deed_id = backend_id
	self._owner_peer_id = peer_id
	self._deed_session_faulty = false
	local network_manager = Managers.state.network

	if network_manager and network_manager:game() then
		local item_name_id = NetworkLookup.item_names[item_data.name]

		if self._is_server then
			self:_send_rpc_to_clients("rpc_select_deed", item_name_id, peer_id)
		else
			self:_send_rpc_to_server("rpc_select_deed", item_name_id, peer_id)
		end
	end
end

DeedManager._update_owner = function (self, dt)
	if self._deed_session_faulty then
		return
	end

	local owner_peer_id = self._owner_peer_id
	local lobby = self._lobby
	local members_map = lobby:members():members_map()

	if not members_map[owner_peer_id] then
		Managers.chat:add_local_system_message(1, Localize("deed_owner_left_game"), true)

		self._deed_session_faulty = true
	end
end

DeedManager._use_reward_callback = function (self)
	fassert(self._reward_callback, "there is no reward callback")

	local reward_callback = self._reward_callback
	self._reward_callback = nil

	reward_callback()
end

DeedManager.rpc_select_deed = function (self, channel_id, item_name_id, owner_peer_id)
	local item_name = NetworkLookup.item_names[item_name_id]
	local item_data = ItemMasterList[item_name]
	self._selected_deed_data = item_data
	self._selected_deed_id = nil
	self._owner_peer_id = owner_peer_id
	local network_manager = Managers.state.network

	if self._is_server and network_manager and network_manager:game() then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self:_send_rpc_to_clients_except("rpc_select_deed", peer_id, item_name_id, owner_peer_id)
	end
end

DeedManager.rpc_deed_consumed = function (self, channel_id)
	print("Deed has been consumed by owner, act on reward callback!")

	if not self._reward_callback then
		self._has_consumed_deed = true
	else
		self:_use_reward_callback()
	end

	local network_manager = Managers.state.network

	if self._is_server and network_manager and network_manager:game() then
		print("Sending to the other clients to act on deed consume")

		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self:_send_rpc_to_clients_except("rpc_deed_consumed", peer_id)
	end
end

DeedManager.rpc_reset_deed = function (self, channel_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._server_peer_id then
		print("[DeedManager] Skipping rpc_reset_deed, not sent from current server")

		return
	end

	local ignore_send = true

	self:reset(ignore_send)
end

DeedManager._send_rpc_to_server = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]
	local channel_id = PEER_ID_TO_CHANNEL[self._server_peer_id]

	rpc(channel_id, ...)
end

DeedManager._send_rpc_to_clients = function (self, rpc_name, ...)
	local network_server = self._network_server

	if not network_server then
		return
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local client_peer_ids = network_server:players_past_connecting()

	for i = 1, #client_peer_ids, 1 do
		local peer_id = client_peer_ids[i]

		if peer_id ~= server_peer_id then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

DeedManager._send_rpc_to_clients_except = function (self, rpc_name, except, ...)
	local network_server = self._network_server

	if not network_server then
		return
	end

	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id
	local client_peer_ids = network_server:players_past_connecting()

	for i = 1, #client_peer_ids, 1 do
		local peer_id = client_peer_ids[i]

		if peer_id ~= server_peer_id and peer_id ~= except then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			rpc(channel_id, ...)
		end
	end
end

return
