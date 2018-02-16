MatchmakingStateWaitForCountdown = class(MatchmakingStateWaitForCountdown)
MatchmakingStateWaitForCountdown.NAME = "MatchmakingStateWaitForCountdown"
MatchmakingStateWaitForCountdown.init = function (self, params)
	self._lobby = params.lobby

	return 
end
MatchmakingStateWaitForCountdown.destroy = function (self)
	return 
end
MatchmakingStateWaitForCountdown.on_enter = function (self, state_context)
	self._state_context = state_context
	self._search_config = state_context.search_config

	return 
end
MatchmakingStateWaitForCountdown.on_exit = function (self)
	Managers.matchmaking:activate_waystone_portal(false)

	return 
end
MatchmakingStateWaitForCountdown.update = function (self, dt, t)
	self._capture_telemetry(self)

	local manager = Managers.matchmaking

	if manager.countdown_has_finished then
		manager.countdown_has_finished = false

		return MatchmakingStateStartGame, self._state_context
	end

	return nil
end
MatchmakingStateWaitForCountdown._capture_telemetry = function (self)
	local members_joined = self._lobby:members():get_members_joined()
	local num_members_joined = #members_joined

	if 0 < num_members_joined then
		local player = Managers.player:local_player()
		local time_taken = Managers.time:time("main") - self._state_context.started_hosting_t

		for i, peer_id in ipairs(members_joined) do
			local is_friend = false

			if rawget(_G, "Steam") and rawget(_G, "Friends") then
				is_friend = Friends.in_category(peer_id, Friends.FRIEND_FLAG)
			end

			Managers.telemetry.events:matchmaking_player_joined(player, time_taken, is_friend)
		end
	end

	return 
end

return 
