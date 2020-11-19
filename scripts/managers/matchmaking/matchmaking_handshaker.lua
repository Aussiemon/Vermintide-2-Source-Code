local function make_handshake_cookie(peer_id, peer_type)
	local prefix = "HSC"
	local peer_id = tostring(Network.peer_id())
	local r = math.floor(math.random() * 1000000)
	local cookie = "%s-%010d-%s-[%s]":format(prefix, r, peer_type, peer_id)

	return cookie
end

MatchmakingHandshakerHost = class(MatchmakingHandshakerHost)
MatchmakingHandshakerHost.NAME = "MatchmakingHandshakerHost"
local host_RPCs = {
	"rpc_matchmaking_handshake_start",
	"rpc_matchmaking_handshake_complete",
	"rpc_pong"
}

MatchmakingHandshakerHost.init = function (self, network_transmit)
	self.network_transmit = network_transmit
	self.peer_id = Network.peer_id()
	self.cookie = make_handshake_cookie(self.peer_id, "host")
	self.num_clients = 0
	self.clients = {}
	self.pings_by_peer_id = {}
	self.client_pong_times = {}
	self.next_ping_time = 0
end

MatchmakingHandshakerHost.destroy = function (self)
	return
end

MatchmakingHandshakerHost.reset_ping = function (self)
	self.next_ping_time = 0
end

MatchmakingHandshakerHost.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	self.network_event_delegate:register(self, unpack(host_RPCs))
end

MatchmakingHandshakerHost.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)
end

MatchmakingHandshakerHost.update = function (self, t)
	if self.next_ping_time <= t then
		for peer_id, client_cookie in pairs(self.clients) do
			if PEER_ID_TO_CHANNEL[peer_id] == nil then
				mm_printf("Handshake host removing client %s", peer_id)

				self.clients[peer_id] = nil
				self.pings_by_peer_id[peer_id] = nil
				self.client_pong_times[peer_id] = nil
				self.num_clients = self.num_clients - 1
			elseif self.pings_by_peer_id[peer_id] == nil then
				self.pings_by_peer_id[peer_id] = {
					0,
					0,
					0,
					0,
					0
				}
			end
		end

		self.ping_start_time = Application.time_since_launch()
		local previous_ping_time_write_index = self.ping_time_write_index or 0
		self.ping_time_write_index = (previous_ping_time_write_index + 1) % 6
		self.next_ping_time = math.floor(t) + 2

		self:send_rpc_to_clients("rpc_ping", self.pings_by_peer_id)
	end
end

MatchmakingHandshakerHost.rpc_matchmaking_handshake_start = function (self, channel_id, client_cookie)
	print("MatchmakingHandshakerHost:rpc_matchmaking_handshake_start()")

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	self.clients[peer_id] = nil
	self.client_pong_times[peer_id] = nil
	local name = nil
	name = (DEDICATED_SERVER and "-") or (LobbyInternal.user_name and LobbyInternal.user_name(peer_id)) or "-"

	mm_printf_force("Got a handshake request from %s with user name '%s'", peer_id, name)
	RPC.rpc_matchmaking_handshake_reply(channel_id, client_cookie, self.cookie)
end

MatchmakingHandshakerHost.rpc_matchmaking_handshake_complete = function (self, channel_id, client_cookie, host_cookie)
	if host_cookie ~= self.cookie then
		return
	end

	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	self.clients[peer_id] = client_cookie
	self.client_pong_times[peer_id] = Managers.time:time("main")
	self.num_clients = self.num_clients + 1
end

MatchmakingHandshakerHost.rpc_pong = function (self, channel_id, client_cookie, host_cookie)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if not self:validate_cookies(peer_id, client_cookie, host_cookie) then
		return
	end

	local last_pong_time = self.client_pong_times[peer_id]
	last_pong_time = math.max(last_pong_time, Managers.time:time("main"))
	self.client_pong_times[peer_id] = last_pong_time
	local ping_start_time = self.ping_start_time
	local ping_time_write_index = self.ping_time_write_index
	self.pings_by_peer_id[peer_id][ping_time_write_index] = Application.time_since_launch() - ping_start_time
end

MatchmakingHandshakerHost.send_rpc_to_client = function (self, rpc_name, peer_id, ...)
	fassert(self.clients[peer_id], "No client with peer_id", peer_id)

	local client_cookie = self.clients[peer_id]
	local host_cookie = self.cookie
	local rpc = RPC[rpc_name]
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	mm_printf("Sending rpc: %s to client: %s", rpc_name, tostring(peer_id))
	rpc(channel_id, client_cookie, host_cookie, ...)
end

MatchmakingHandshakerHost.send_rpc_to_clients = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]

	for peer_id, client_cookie in pairs(self.clients) do
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if channel_id then
			rpc(channel_id, client_cookie, self.cookie, ...)
		end
	end
end

MatchmakingHandshakerHost.send_rpc_to_clients_except = function (self, rpc_name, except, ...)
	local rpc = RPC[rpc_name]

	for peer_id, client_cookie in pairs(self.clients) do
		if peer_id ~= except then
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			if channel_id then
				rpc(channel_id, client_cookie, self.cookie, ...)
			end
		end
	end
end

MatchmakingHandshakerHost.send_rpc_to_all = function (self, rpc_name, ...)
	self.network_transmit:queue_local_rpc(rpc_name, ...)

	local rpc = RPC[rpc_name]

	for peer_id, client_cookie in pairs(self.clients) do
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		if channel_id then
			rpc(channel_id, client_cookie, self.cookie, ...)
		end
	end
end

MatchmakingHandshakerHost.send_rpc_to_self = function (self, rpc_name, ...)
	self.network_transmit:queue_local_rpc(rpc_name, nil, self.cookie, ...)
end

MatchmakingHandshakerHost.validate_cookies = function (self, sender, client_cookie, host_cookie)
	if self.cookie ~= host_cookie then
		mm_printf_force("Invalid host cookie %s from %s", host_cookie, sender)

		return false
	end

	if self.clients[sender] ~= client_cookie then
		mm_printf_force("Invalid client cookie %s from %s", client_cookie, sender)

		return false
	end

	return true
end

MatchmakingHandshakerHost.handshake_done = function (self, peer_id)
	return self.clients[peer_id] ~= nil
end

MatchmakingHandshakerClient = class(MatchmakingHandshakerClient)
MatchmakingHandshakerClient.NAME = "MatchmakingHandshakerClient"
local client_RPCs = {
	"rpc_matchmaking_handshake_reply",
	"rpc_ping"
}

MatchmakingHandshakerClient.init = function (self)
	self.peer_id = Network.peer_id()
end

MatchmakingHandshakerClient.destroy = function (self)
	return
end

MatchmakingHandshakerClient.register_rpcs = function (self, network_event_delegate)
	self.network_event_delegate = network_event_delegate

	self.network_event_delegate:register(self, unpack(client_RPCs))
end

MatchmakingHandshakerClient.unregister_rpcs = function (self)
	self.network_event_delegate:unregister(self)
end

MatchmakingHandshakerClient.reset = function (self)
	mm_printf_force("Resetting client handshaker", self.cookie, self.host_cookie)

	self.cookie = nil
	self.host_cookie = nil
	self.host_peer_id = nil
	self.last_pong_time = 0
end

MatchmakingHandshakerClient.start_handshake = function (self, peer_id)
	self.cookie = make_handshake_cookie(self.peer_id, "client")
	self.host_cookie = nil
	self.host_peer_id = peer_id

	mm_printf_force("Starting handshake with host %s using client cookie %s", peer_id, self.cookie)

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	RPC.rpc_matchmaking_handshake_start(channel_id, self.cookie)
end

MatchmakingHandshakerClient.rpc_matchmaking_handshake_reply = function (self, channel_id, client_cookie, host_cookie)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if client_cookie ~= self.cookie then
		mm_printf_force("Invalid client cookie %s in reply from %s", client_cookie, peer_id)

		return
	end

	mm_printf_force("Handshake successful (%s) (%s) (%s)", peer_id, client_cookie, host_cookie)

	self.host_cookie = host_cookie
	self.host_peer_id = peer_id
	self.last_pong_time = Managers.time:time("main")

	RPC.rpc_matchmaking_handshake_complete(channel_id, client_cookie, host_cookie)
end

MatchmakingHandshakerClient.rpc_ping = function (self, channel_id, client_cookie, host_cookie, pings_by_peer_id)
	if not self:validate_cookies(client_cookie, host_cookie) then
		return
	end

	local last_pong_time = self.last_pong_time
	last_pong_time = math.max(last_pong_time, Managers.time:time("main"))
	self.last_pong_time = last_pong_time

	RPC.rpc_pong(channel_id, client_cookie, host_cookie)

	self.pings_by_peer_id = pings_by_peer_id
end

MatchmakingHandshakerClient.send_rpc_to_host = function (self, rpc_name, ...)
	fassert(self.host_cookie, "Tried to send RPC %s before handshake finished", rpc_name)
	mm_printf("Sending rpc: %s to host: %s", rpc_name, tostring(self.host_peer_id))

	local rpc = RPC[rpc_name]
	local channel_id = PEER_ID_TO_CHANNEL[self.host_peer_id]

	if channel_id then
		rpc(channel_id, self.cookie, self.host_cookie, ...)
	end
end

MatchmakingHandshakerClient.validate_cookies = function (self, client_cookie, host_cookie)
	if self.cookie ~= client_cookie then
		mm_printf_force("Invalid client cookie %s", client_cookie)

		return false
	end

	if self.host_cookie ~= host_cookie then
		mm_printf_force("Invalid host cookie %s", host_cookie)

		return false
	end

	return true
end

MatchmakingHandshakerClient.handshake_done = function (self)
	return self.host_cookie ~= nil
end

MatchmakingHandshakerClient.reset = function (self)
	self.cookie = nil
	self.host_cookie = nil
	self.host_peer_id = nil
end

MatchmakingHandshakerClient.is_timed_out_from_server = function (self, t)
	local timeout = (script_data.network_timeout_really_long and 10000) or 4

	return t > self.last_pong_time + timeout
end

return
