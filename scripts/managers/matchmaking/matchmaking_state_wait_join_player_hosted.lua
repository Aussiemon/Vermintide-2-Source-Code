-- chunkname: @scripts/managers/matchmaking/matchmaking_state_wait_join_player_hosted.lua

MatchmakingStateWaitJoinPlayerHosted = class(MatchmakingStateWaitJoinPlayerHosted)
MatchmakingStateWaitJoinPlayerHosted.NAME = "MatchmakingStateWaitJoinPlayerHosted"

MatchmakingStateWaitJoinPlayerHosted.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
	self._is_server = params.is_server
end

MatchmakingStateWaitJoinPlayerHosted.destroy = function (self)
	return
end

MatchmakingStateWaitJoinPlayerHosted.on_enter = function (self, state_context)
	Managers.mechanism:mechanism_try_call("on_enter_custom_game_lobby")

	self._current_lobby = Managers.state.network:lobby()
	self._state_context = state_context
	self._search_config = state_context.search_config

	local lobby_client = Managers.lobby:query_lobby("matchmaking_join_lobby")
	local match_started = lobby_client:lobby_data("match_started") == "true"

	self._next_transition_state = match_started and "start_lobby" or nil
	self._match_host = lobby_client:lobby_host()
	self._friend_joining = state_context.friend_join

	if self._friend_joining and not match_started then
		Managers.ui:handle_transition("start_game_view_force", {
			menu_state_name = "play",
			menu_sub_state_name = "versus_player_hosted_lobby",
			use_fade = true,
		})
	end
end

MatchmakingStateWaitJoinPlayerHosted.on_exit = function (self)
	if not self._next_transition_state then
		self:terminate()
	end
end

MatchmakingStateWaitJoinPlayerHosted.terminate = function (self)
	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end
end

MatchmakingStateWaitJoinPlayerHosted.update = function (self, dt, t)
	local lobby_client = Managers.lobby:query_lobby("matchmaking_join_lobby")

	if not lobby_client then
		return self:_lobby_failed()
	end

	lobby_client:update(dt)

	if lobby_client:failed() then
		return self:_lobby_failed()
	end

	local updated_host = lobby_client.lobby:lobby_host()

	if updated_host and updated_host ~= self._match_host then
		Managers.matchmaking:add_broken_lobby_client(lobby_client, t, true)

		return self:_lobby_failed()
	end
end

MatchmakingStateWaitJoinPlayerHosted._teardown_lobby = function (self)
	if Managers.lobby:query_lobby("matchmaking_join_lobby") then
		Managers.lobby:destroy_lobby("matchmaking_join_lobby")
	end

	self._matchmaking_manager:reset_joining()

	self._state_context.join_lobby_data = nil
end

MatchmakingStateWaitJoinPlayerHosted._lobby_failed = function (self)
	self:_teardown_lobby()

	return MatchmakingStateIdle
end

MatchmakingStateWaitJoinPlayerHosted.get_transition = function (self)
	if self._next_transition_state then
		local start_lobby_data = {
			lobby_client = Managers.lobby:free_lobby("matchmaking_join_lobby"),
		}

		return self._next_transition_state, start_lobby_data
	end
end

MatchmakingStateWaitJoinPlayerHosted.rpc_matchmaking_join_game = function (self, channel_id)
	mm_printf_force("Transition from join due to rpc_matchmaking_join_game")
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_joining_game")

	self._matchmaking_manager.debug.text = "starting_game"
	self._next_transition_state = "start_lobby"

	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()

	match_handler:send_rpc_down("rpc_matchmaking_join_game")
end
