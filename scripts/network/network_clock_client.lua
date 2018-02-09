local function get_median(list)
	local n = #list
	local median = nil

	if n%2 == 0 then
		local i1 = n/2
		local i2 = i1 + 1
		local d1 = list[i1]
		local d2 = list[i2]
		median = (d1 + d2)/2
	else
		local i = math.ceil(n/2)
		median = list[i]
	end

	return median
end

local function get_mean(list)
	local n = #list
	local s = 0

	for i = 1, n, 1 do
		s = s + list[i]
	end

	local mean = s/n

	return mean
end

local function get_sd(list, median)
	local n = #list
	local differences = 0

	for i = 1, n, 1 do
		local val = list[i]
		local difference_squared = (val - median)^2
		differences = differences + difference_squared
	end

	local variance = differences/n
	local sd = math.sqrt(variance)

	return sd
end

NetworkClockClient = class(NetworkClockClient)
local RPCS = {
	"rpc_network_time_sync_response",
	"rpc_network_current_server_time_response"
}
NetworkClockClient.init = function (self)
	self._clock = 0
	self._delta_mean = nil
	self._delta_history = {}
	self._request_timer = 0
	self._times_synced = 0
	self._state = "syncing"

	return 
end
NetworkClockClient.register_rpcs = function (self, network_event_delegate)
	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate

	return 
end
NetworkClockClient.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
NetworkClockClient.synchronized = function (self)
	return (self._state == "synced" and true) or false
end
NetworkClockClient.time = function (self)
	return self._clock
end
local INIT_SYNC_TIME_STEP = 3
local INIT_SYNC_TIMES = 6
local SYNC_TIME_STEP = 2
NetworkClockClient.update = function (self, dt)
	if self._state == "syncing" then
		self._update_clock(self, dt)

		local network_manager = Managers.state.network

		if not network_manager.game(network_manager) then
			return 
		end

		local request_timer = self._request_timer + dt

		if INIT_SYNC_TIME_STEP <= request_timer and self._times_synced < INIT_SYNC_TIMES then
			request_timer = 0
			self._times_synced = self._times_synced + 1

			network_manager.network_transmit:send_rpc_server("rpc_network_clock_sync_request", self._clock)
		end

		self._request_timer = request_timer
	elseif self._state == "synced" then
		self._update_clock(self, dt)

		local network_manager = Managers.state.network

		if not network_manager.game(network_manager) then
			return 
		end

		local request_timer = self._request_timer + dt

		if SYNC_TIME_STEP <= request_timer then
			request_timer = 0

			network_manager.network_transmit:send_rpc_server("rpc_network_current_server_time_request", self._clock)
		end

		self._request_timer = request_timer
	else
		printf("[NetworkClockClient] FAIL Unknown state: %q", self._state)
	end

	if Development.parameter("network_clock_debug") then
		self._debug_stuff(self, dt)
	end

	return 
end
NetworkClockClient._update_clock = function (self, delta)
	local new_time = self._clock + delta

	if new_time < 0 then
		new_time = 0

		printf("[NetworkClockClient] delta (%f) larger than current time (%f), clamping resulting time to 0.", delta, self._clock)
	end

	self._clock = new_time

	return 
end

local function sort_function(a, b)
	return a < b
end

NetworkClockClient._update_delta_history = function (self, delta)
	local delta_history = self._delta_history
	delta_history[#delta_history + 1] = delta

	table.sort(delta_history, sort_function)

	self._delta_history = delta_history

	return 
end
NetworkClockClient._calculate_mean_dt = function (self)
	local delta_history = self._delta_history
	local median = get_median(delta_history)
	local sd = get_sd(delta_history, median)
	local n = #delta_history
	local i = 1

	while i <= n do
		local dt = delta_history[i]

		if median + sd < dt or dt < median - sd then
			table.remove(delta_history, i)

			n = n - 1
		else
			i = i + 1
		end
	end

	self._mean_dt = get_mean(delta_history)
	self._delta_history = delta_history

	return 
end
NetworkClockClient.destroy = function (self)
	return 
end
NetworkClockClient._debug_stuff = function (self, dt)
	local debug_text_manager = Managers.state.debug_text

	if debug_text_manager then
		local text = tostring(math.floor(self._clock))

		debug_text_manager.output_screen_text(debug_text_manager, text, 22, 0.1)
	end

	if Keyboard.pressed(Keyboard.button_index("p")) then
		print("<[NetworkClockClient] DEBUG INFO>")
		printf("state: %q", self._state)
		printf("mean dt: %q", self._mean_dt)
		table.dump(self._delta_history, "delta_history")
		print("</[NetworkClockClient] DEBUG INFO>")
	end

	return 
end
NetworkClockClient.rpc_network_time_sync_response = function (self, sender, time_sent_request, server_time)
	local current_time = self._clock
	local client_latency_delta = (current_time - time_sent_request)/2
	local client_server_delta = server_time - current_time
	local delta = client_server_delta + client_latency_delta

	if #self._delta_history == 0 then
		self._update_clock(self, delta)
	end

	self._update_delta_history(self, delta)

	if INIT_SYNC_TIMES <= self._times_synced then
		self._calculate_mean_dt(self)
		self._update_clock(self, self._mean_dt)

		self._state = "synced"
		self._request_timer = 0
	end

	return 
end
NetworkClockClient.rpc_network_current_server_time_response = function (self, sender, time_sent_request, server_time)
	local current_time = self._clock
	local client_latency_delta = (current_time - time_sent_request)/2
	local client_server_delta = server_time - current_time
	local delta = client_server_delta + client_latency_delta

	self._update_clock(self, delta)

	return 
end

return 
