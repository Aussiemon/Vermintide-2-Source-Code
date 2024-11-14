-- chunkname: @scripts/managers/matchmaking/matchmaking_state_flexmatch_host.lua

local FlexmatchQueueStatus = require("scripts/managers/backend_playfab/settings/flexmatch_queue_status")

MatchmakingStateFlexmatchHost = class(MatchmakingStateFlexmatchHost)
MatchmakingStateFlexmatchHost.NAME = "MatchmakingStateFlexmatchHost"

local MatchmakingState = {
	CheckingLatency = "CheckingLatency",
	CollectingTickets = "CollectingTickets",
	InQueue = "InQueue",
	Init = "Init",
	RequestingRegions = "RequestingRegions",
	RequestingTicket = "RequestingTicket",
	StartingMatchmaking = "StartingMatchmaking",
	Succeeded = "Succeeded",
	WaitingForMatchmaking = "WaitingForMatchmaking",
}
local PingCount = 3
local TimeOutCheckingLatency = 10
local TimeoutCollectingTickets = 30
local TimeoutWaitingForMatchmaking = 60
local TimeBetweenMatchmakeUpdates = 5
local TimeoutWaitingForPing = 2
local EMPTY_TABLE = {}

local function flexmatch_printf(text, ...)
	text = "[Flexmatch] " .. text

	printf(text, ...)
end

MatchmakingStateFlexmatchHost.init = function (self, params)
	self._network_transmit = params.network_transmit
	self._network_options = params.network_options
	self._lobby = params.lobby
end

MatchmakingStateFlexmatchHost.terminate = function (self)
	return
end

MatchmakingStateFlexmatchHost.destroy = function (self)
	self:_cleanup()
end

MatchmakingStateFlexmatchHost.on_enter = function (self, state_context)
	self._state_context = state_context

	local search_config = state_context.search_config
	local lobby_members = search_config.party_lobby_host.lobby_members

	self._tt_next_matchmaking_check = 0
	self._timeout = math.huge
	self._ignore_results = false
	self._estimated_wait_time = -1
	self._queue_tickets = {}

	for peer_id, _ in pairs(lobby_members.members) do
		self._queue_tickets[peer_id] = false
	end

	Managers.state.event:register(self, "friend_party_peer_left", "on_friend_party_peer_left")

	self._region_latency = {}
	self._state = MatchmakingState.Init
end

MatchmakingStateFlexmatchHost.on_exit = function (self)
	self:_cleanup()
end

MatchmakingStateFlexmatchHost.update = function (self, dt, t)
	if self._state == MatchmakingState.Init then
		self._state = MatchmakingState.RequestingRegions
	elseif self._state == MatchmakingState.RequestingRegions then
		return self:_update_requesting_regions(dt, t)
	elseif self._state == MatchmakingState.CheckingLatency then
		return self:_update_checking_latency(dt, t)
	elseif self._state == MatchmakingState.RequestingTicket then
		return self:_update_requesting_ticket(dt, t)
	elseif self._state == MatchmakingState.CollectingTickets then
		return self:_update_collecting_tickets(dt, t)
	elseif self._state == MatchmakingState.StartingMatchmaking then
		return self:_update_starting_matchmaking(dt, t)
	elseif self._state == MatchmakingState.WaitingForMatchmaking then
		return self:_update_waiting_for_matchmaking(dt, t)
	elseif self._state == MatchmakingState.InQueue then
		return self:_update_in_queue(dt, t)
	elseif self._state == MatchmakingState.Succeeded then
		return self:_update_succeeded(dt, t)
	else
		self:_temp_update(dt)
		fassert(false, "Unknown state: %s", self._state)
	end
end

MatchmakingStateFlexmatchHost._update_requesting_regions = function (self, dt, t)
	if self._requesting_regions then
		return
	end

	local interface = Managers.backend:get_interface("versus")

	if not interface then
		return self:_cancel_matchmaking("Failed to find versus interface")
	end

	self._requesting_regions = true

	local cb = callback(self, "_request_regions_cb")

	interface:request_regions(cb)
	self._network_transmit:send_rpc_clients("rpc_matchmaking_ticket_request")

	self._timeout = t + TimeoutCollectingTickets + TimeOutCheckingLatency
end

MatchmakingStateFlexmatchHost._update_checking_latency = function (self, dt, t)
	if t >= self._timeout then
		return self:_cancel_matchmaking("Failed to get latency before timeout")
	end

	if self._requesting_latency then
		return
	end

	local interface = Managers.backend:get_interface("versus")

	if not interface then
		return self:_cancel_matchmaking("Failed to find versus interface")
	end

	Managers.ping:ping_multiple_times(TimeoutWaitingForPing, self._regions, PingCount, callback(self, "_ping_cb"))

	self._requesting_latency = true
end

MatchmakingStateFlexmatchHost._ping_cb = function (self, result, data)
	if self._ignore_results then
		return
	end

	if not result then
		return self:_cancel_matchmaking("Failed to get latency")
	end

	self._region_latency = data
	self._state = MatchmakingState.RequestingTicket
end

MatchmakingStateFlexmatchHost._update_requesting_ticket = function (self, dt, t)
	local interface = Managers.backend:get_interface("versus")

	if not interface then
		return self:_cancel_matchmaking("Failed to find versus interface")
	end

	local cb = callback(self, "_request_matchmaking_ticket_cb")

	interface:request_matchmaking_ticket(self._region_latency, cb)

	self._state = MatchmakingState.CollectingTickets
end

MatchmakingStateFlexmatchHost._update_collecting_tickets = function (self, dt, t)
	if t >= self._timeout then
		self:_cancel_matchmaking("Failed to collect tickets before timeout")

		for peer_id, ticket in pairs(self._queue_tickets) do
			if not ticket then
				flexmatch_printf("Missing ticket from: %s", peer_id)
			end
		end

		return
	end

	for peer_id, ticket in pairs(self._queue_tickets) do
		if not ticket then
			return
		end
	end

	self._state = MatchmakingState.StartingMatchmaking
end

MatchmakingStateFlexmatchHost._update_starting_matchmaking = function (self, dt, t)
	flexmatch_printf("Starting matchmaking")
	Managers.backend:get_interface("versus"):start_matchmaking(self._queue_tickets, callback(self, "_start_matchmaking_cb"))

	self._timeout = t + TimeoutWaitingForMatchmaking
	self._state = MatchmakingState.WaitingForMatchmaking
end

MatchmakingStateFlexmatchHost._update_waiting_for_matchmaking = function (self, dt, t)
	if t >= self._timeout then
		return self:_cancel_matchmaking("Failed to start matchmaking before timeout")
	end
end

MatchmakingStateFlexmatchHost._update_in_queue = function (self, dt, t)
	if t >= self._timeout then
		return self:_cancel_matchmaking("Failed to get response from matchmaking before timeout")
	end

	if not self._matchmaking_check_in_progress and t >= self._tt_next_matchmaking_check then
		self._matchmaking_check_in_progress = true

		Managers.backend:get_interface("versus"):fetch_matchmaking_session_data(callback(self, "_fetch_matchmaking_cb"))
	end
end

MatchmakingStateFlexmatchHost._update_succeeded = function (self, dt, t)
	local ip_port = string.format("%s:%s", self._connection_info.ipAddress, self._connection_info.port)

	self._state_context.server_info = {
		ip_port = ip_port,
	}
	self._state_context.game_session_id = self._game_session_id
	self._state_context.is_flexmatch = true

	return MatchmakingStateReserveLobby, self._state_context
end

MatchmakingStateFlexmatchHost._request_regions_cb = function (self, result)
	if self._ignore_results then
		return
	end

	if not result.success or not result.regions then
		return self:_cancel_matchmaking("Requesting regions failed")
	end

	self._regions = result.regions
	self._base_url = result.url
	self._state = MatchmakingState.CheckingLatency
end

MatchmakingStateFlexmatchHost._request_matchmaking_ticket_cb = function (self, result)
	if self._ignore_results then
		return
	end

	if not result.success then
		if result.errorCode == 404 then
			local text = Localize("wrong_game_version")

			Managers.simple_popup:queue_popup(text, Localize("popup_needs_restart_topic"), "confirm", Localize("button_ok"))
		end

		return self:_cancel_matchmaking("Requesting matchmaking ticket failed")
	end

	self._queue_tickets[Network.peer_id()] = result.ticket
end

MatchmakingStateFlexmatchHost._start_matchmaking_cb = function (self, result, code, headers, data)
	if not result or code ~= 200 then
		return self:_cancel_matchmaking("Starting matchmaking request failed. result: %s, code: %s", result, tostring(code))
	end

	self._matchmaking_session_id = data.matchmakingSessionId
	self._queue_status = data.status
	self._estimated_wait_time = data.estimatedWaitTime

	if self._ignore_results then
		return self:_cancel_matchmaking()
	end

	flexmatch_printf("session id: %s", self._matchmaking_session_id)

	if self._queue_status == FlexmatchQueueStatus.Queued then
		self._state = MatchmakingState.InQueue

		local packed_session_id = NetworkUtils.net_pack_flexmatch_ticket(self._matchmaking_session_id)

		self._network_transmit:send_rpc_clients("rpc_matchmaking_queue_session_data", packed_session_id, self._estimated_wait_time)
	elseif self._queue_status == FlexmatchQueueStatus.Failed or self._queue_status == FlexmatchQueueStatus.TimedOut or self._queue_status == FlexmatchQueueStatus.Cancelled then
		return self:_cancel_matchmaking("Got unexpected queue status: %s", self._queue_status)
	elseif self._queue_status == FlexmatchQueueStatus.Succeeded then
		self._game_session_id = data.gameSessionId
		self._connection_info = data.connectionInfo
		self._state = MatchmakingState.Succeeded

		flexmatch_printf("Matchmaking successful. ipAddress: %s | port: %s | name: %s", self._connection_info.ipAddress, self._connection_info.port, self._connection_info.name or "???")
	else
		return self:_cancel_matchmaking("Got unexpected queue status: %s", self._queue_status)
	end
end

MatchmakingStateFlexmatchHost._fetch_matchmaking_cb = function (self, result, code, headers, data)
	if self._ignore_results then
		return
	end

	if not result or code ~= 200 then
		return self:_cancel_matchmaking("Checking matchmaking request failed. result: %s, code: %s", result, tostring(code))
	end

	self._queue_status = data.status

	local eta = data.estimatedWaitTime

	self._matchmaking_check_in_progress = false

	if self._queue_status == FlexmatchQueueStatus.Succeeded then
		self._game_session_id = data.gameSessionId
		self._connection_info = data.connectionInfo
		self._state = MatchmakingState.Succeeded

		flexmatch_printf("Matchmaking successful. ipAddress: %s | port: %s | name: %s", self._connection_info.ipAddress, self._connection_info.port, self._connection_info.name or "???")
	elseif self._queue_status == FlexmatchQueueStatus.Queued then
		local t = Managers.time:time("main")

		self._tt_next_matchmaking_check = t + TimeBetweenMatchmakeUpdates
		self._timeout = t + TimeoutWaitingForMatchmaking

		if eta ~= self._estimated_wait_time then
			self._estimated_wait_time = eta

			local packed_session_id = NetworkUtils.net_pack_flexmatch_ticket(self._matchmaking_session_id)

			self._network_transmit:send_rpc_clients("rpc_matchmaking_queue_session_data", packed_session_id, eta)
		end
	elseif self._queue_status == FlexmatchQueueStatus.Failed or self._queue_status == FlexmatchQueueStatus.TimedOut or self._queue_status == FlexmatchQueueStatus.Cancelled then
		return self:_cancel_matchmaking("Got unexpected queue status: %s", self._queue_status)
	else
		return self:_cancel_matchmaking("Got unexpected queue status: %s", self._queue_status)
	end
end

MatchmakingStateFlexmatchHost._cleanup = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("friend_party_peer_left", self)
	end

	self._ignore_results = true

	self:_cancel_matchmaking()

	self._connection_info = nil
	self._game_session_id = nil
	self._queue_status = nil
end

MatchmakingStateFlexmatchHost.on_friend_party_peer_left = function (self, peer_id, approved_for_joining, peer_state)
	if approved_for_joining then
		return self:_cancel_matchmaking("Player left party")
	end
end

MatchmakingStateFlexmatchHost._cancel_matchmaking = function (self, reason, ...)
	if reason then
		flexmatch_printf("Cancelling matchmaking")
		flexmatch_printf(reason, ...)
	end

	if self._matchmaking_session_id then
		Managers.backend:get_interface("versus"):cancel_matchmaking(callback(self, "_cancel_matchmaking_cb"))
	elseif not self._ignore_results then
		Managers.matchmaking:cancel_matchmaking()
	end
end

MatchmakingStateFlexmatchHost._cancel_matchmaking_cb = function (self, result, code, headers, data)
	flexmatch_printf("Matchmaking cancelled")

	self._matchmaking_session_id = nil

	if self._ignore_results then
		return
	end

	Managers.matchmaking:cancel_matchmaking()
end

MatchmakingStateFlexmatchHost.rpc_matchmaking_ticket_response = function (self, channel_id, packed_ticket)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self._queue_tickets[peer_id] = NetworkUtils.unnet_pack_flexmatch_ticket(packed_ticket)
end
