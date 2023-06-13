MatchmakingStateWaitForCountdown = class(MatchmakingStateWaitForCountdown)
MatchmakingStateWaitForCountdown.NAME = "MatchmakingStateWaitForCountdown"

MatchmakingStateWaitForCountdown.init = function (self, params)
	self._lobby = params.lobby
end

MatchmakingStateWaitForCountdown.destroy = function (self)
	return
end

MatchmakingStateWaitForCountdown.on_enter = function (self, state_context)
	self._state_context = state_context
	self._search_config = state_context.search_config
	self._wait_to_start_game = self._search_config.wait_to_start_game
end

MatchmakingStateWaitForCountdown.on_exit = function (self)
	if not self._wait_to_start_game then
		Managers.matchmaking:activate_waystone_portal(nil)
	end
end

MatchmakingStateWaitForCountdown.update = function (self, dt, t)
	if not DEDICATED_SERVER then
		self:_capture_telemetry()
	end

	local manager = Managers.matchmaking

	if self._wait_to_start_game then
		if manager.start_game_now then
			manager.start_game_now = false

			return MatchmakingStateStartGame, self._state_context
		end

		return nil
	end

	if manager.countdown_has_finished then
		manager.countdown_has_finished = false

		return MatchmakingStateStartGame, self._state_context
	end

	return nil
end

MatchmakingStateWaitForCountdown._capture_telemetry = function (self)
	local members_joined = self._lobby:members():get_members_joined()
	local num_members_joined = #members_joined

	if num_members_joined > 0 then
		local player = Managers.player:local_player()
		local time_taken = Managers.time:time("main") - self._state_context.started_hosting_t

		for i, peer_id in ipairs(members_joined) do
			local is_friend = false

			if rawget(_G, "Steam") and rawget(_G, "Friends") then
				is_friend = Friends.in_category(peer_id, Friends.FRIEND_FLAG)
			end

			Managers.telemetry_events:matchmaking_player_joined(player, time_taken, self._search_config)
		end
	end
end
