PingReporter = class(PingReporter)
PingReporter.NAME = "PingReporter"
local SAMPLE_RATE = 10

local function find_local_player()
	local players = Managers.player:players()

	for _, player in pairs(players) do
		if player.local_player then
			return player
		end
	end
end

local function sum(t)
	local s = 0

	for _, elem in pairs(t) do
		s = s + elem
	end

	return s
end

local function average(t)
	return sum(t) / #t
end

local function percentile(t, p)
	return t[math.round(p / 100 * #t)]
end

local function variance(t)
	local avg = average(t)
	local diff = {}

	for i, v in pairs(t) do
		diff[i] = (v - avg)^2
	end

	return average(diff)
end

PingReporter.init = function (self)
	self._measures = {}
	self._measure_taken = 0
	local write_network_debug_output_to_log = Application.user_setting("write_network_debug_output_to_log")

	if write_network_debug_output_to_log then
		self._dump_detailed_connection_status = true
	end
end

PingReporter.update = function (self, dt, t)
	if SAMPLE_RATE < t - self._measure_taken then
		self:_take_measure()

		self._measure_taken = math.floor(t)
	end
end

PingReporter._take_measure = function (self)
	local player = find_local_player()

	if not player then
		return
	end

	local game_object_id = player.game_object_id
	local game_session = Managers.state.network:game()

	if not player.is_server and not player.bot_player and game_session and game_object_id then
		local ping = GameSession.game_object_field(game_session, game_object_id, "ping")
		self._measures[#self._measures + 1] = ping
	end

	if self._dump_detailed_connection_status and LobbyInternal.client then
		print([[


STEAM NETWORK DEBUG:
]])
		SteamClient.write_detailed_connection_status_to_log(LobbyInternal.client)
		print("Network.get_local_ping_location()\n", Network.get_local_ping_location())
		table.dump(SteamClient.get_connection_info(LobbyInternal.client), "SteamClient.get_connection_info", 2)
		table.dump(Network.get_relay_network_status(), "Network.get_relay_network_status()", 2)
	end
end

PingReporter.report = function (self)
	if #self._measures == 0 then
		return
	end

	table.sort(self._measures)

	local avg = average(self._measures)
	local std_dev = math.sqrt(variance(self._measures))
	local p99 = percentile(self._measures, 99)
	local p95 = percentile(self._measures, 95)
	local p90 = percentile(self._measures, 90)
	local p75 = percentile(self._measures, 75)
	local p50 = percentile(self._measures, 50)
	local p25 = percentile(self._measures, 25)
	local observations = #self._measures

	Managers.telemetry_events:network_ping(avg, std_dev, p99, p95, p90, p75, p50, p25, observations)
end
