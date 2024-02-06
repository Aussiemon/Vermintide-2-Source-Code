-- chunkname: @scripts/managers/load_time/load_time_manager.lua

LoadTimeManager = class(LoadTimeManager)

LoadTimeManager.init = function (self)
	self._previous_level_key = "none"
	self._members_joined = {}
	self._members_left = {}
	self._members = {}
	self._lobby_failed = false
	self._current_lobby = nil
end

LoadTimeManager.start_timer = function (self, time_spent_in_level, end_reason)
	if Managers.time:has_timer("loading_timer") then
		Managers.time:unregister_timer("loading_timer")
	end

	Managers.time:register_timer("loading_timer", "main", 0)

	self._current_lobby = nil
	self._lobby_failed = false
	self._time_spent_in_level = time_spent_in_level or -1
	self._end_reason = end_reason or "unknown"

	table.clear(self._members_joined)
	table.clear(self._members_left)
	table.clear(self._members)
end

LoadTimeManager.set_lobby = function (self, lobby)
	self._current_lobby = lobby

	local lobby_members = self._current_lobby:members()
	local current_members = lobby_members:get_members()

	for i, peer_id in ipairs(current_members) do
		self._members[peer_id] = true
	end
end

LoadTimeManager.has_lobby = function (self)
	if self._lobby_failed then
		return false
	end

	return self._current_lobby ~= nil
end

LoadTimeManager.update = function (self, dt)
	if not self._current_lobby then
		return
	end

	local has_failed = self._current_lobby:failed()

	if has_failed then
		self._current_lobby = nil
		self._lobby_failed = true

		return
	end

	local has_changed = false
	local lobby_members = self._current_lobby:members()

	if not lobby_members then
		return
	end

	local current_members = lobby_members:get_members()

	for i, peer_id in ipairs(current_members) do
		if not self._members[peer_id] then
			self._members_joined[#self._members_joined + 1] = peer_id

			print("[LoadTimeManager] Member Joined")

			has_changed = true
		end
	end

	for peer_id, _ in pairs(self._members) do
		if not table.find(current_members, peer_id) then
			self._members_left[#self._members_left + 1] = peer_id

			print("[LoadTimeManager] Member left")

			has_changed = true
		end
	end

	if has_changed then
		table.clear(self._members)

		for i, peer_id in ipairs(current_members) do
			self._members[peer_id] = true
		end
	end
end

local LOAD_TIME_DATA = {}

LoadTimeManager.end_timer = function (self)
	table.clear(LOAD_TIME_DATA)

	local level_key = "unknown"

	if Managers.state.game_mode then
		level_key = Managers.state.game_mode:level_key()
	end

	local local_player = Managers.player:local_player()
	local is_server = local_player and local_player.is_server or "unknown"
	local previous_level_key = self._previous_level_key
	local time = Managers.time:time("loading_timer") or 0
	local seconds = math.floor(time % 60 + 0.5)
	local minutes = math.floor(time / 60)
	local hours = math.floor(minutes / 60)
	local timer_text = string.format("%02d:%02d:%02d", hours, minutes, seconds)

	print("#################################################################################################################")
	print(string.format("[Loading Time]: %s [Transition]: %s-%s  [Members joined]: %s [Members Left]: %s [Is Server]: %s", timer_text, previous_level_key, level_key, tostring(#self._members_joined), tostring(#self._members_left), tostring(is_server)))
	print("#################################################################################################################")

	LOAD_TIME_DATA.identifier = "load-level"
	LOAD_TIME_DATA.duration = tonumber(string.format("%.2f", time))
	LOAD_TIME_DATA.parameters = {
		from_level = previous_level_key,
		to_level = level_key,
		end_reason = self._end_reason,
		time_spent_in_level = self._time_spent_in_level,
		members_joined = #self._members_joined,
		members_left = #self._members_left,
		lobby_failed = self._lobby_failed,
		is_server = is_server,
	}

	BackendUtils.commit_load_time_data(LOAD_TIME_DATA)

	self._previous_level_key = level_key
	self._current_lobby = nil
	self._lobby_failed = false
end

LoadTimeManager.destroy = function (self)
	if Managers.time and Managers.time:has_timer("loading_timer") then
		Managers.time:unregister_timer("loading_timer")
	end

	self._current_lobby = nil
	self._lobby_failed = false

	table.clear(self._members_joined)
	table.clear(self._members_left)
	table.clear(self._members)
end
