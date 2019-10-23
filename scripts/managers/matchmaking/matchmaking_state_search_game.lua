MatchmakingStateSearchGame = class(MatchmakingStateSearchGame)
MatchmakingStateSearchGame.NAME = "MatchmakingStateSearchGame"

MatchmakingStateSearchGame.init = function (self, params)
	self._lobby = params.lobby
	self._lobby_finder = params.lobby_finder
	self._game_server_finder = params.game_server_finder
	self._peer_id = Network:peer_id()
	self._matchmaking_manager = params.matchmaking_manager
	self._level_transition_handler = params.level_transition_handler
	self._network_server = params.network_server
	self._statistics_db = params.statistics_db
	Managers.matchmaking.countdown_has_finished = false
end

MatchmakingStateSearchGame.destroy = function (self)
	return
end

MatchmakingStateSearchGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_start_searching_for_games()
end

MatchmakingStateSearchGame._start_searching_for_games = function (self)
	local search_config = self.search_config
	local current_filters = {
		difficulty = {
			value = search_config.difficulty,
			comparison = LobbyComparison.EQUAL
		}
	}
	local quick_game = search_config.quick_game

	if not quick_game then
		local level_key = search_config.level_key

		if level_key then
			current_filters.selected_level_key = {
				value = level_key,
				comparison = LobbyComparison.EQUAL
			}
		end

		local act_key = search_config.act_key

		if act_key then
			current_filters.act_key = {
				value = act_key,
				comparison = LobbyComparison.EQUAL
			}
		end
	end

	local game_mode = search_config.game_mode

	if game_mode then
		if game_mode == "adventure" then
			local game_mode = "custom"
			local game_mode_index = NetworkLookup.game_modes[game_mode]
			current_filters.game_mode = {
				value = game_mode_index,
				comparison = LobbyComparison.LESS_OR_EQUAL
			}
		else
			local game_mode_index = NetworkLookup.game_modes[game_mode]
			current_filters.game_mode = {
				value = game_mode_index,
				comparison = LobbyComparison.EQUAL
			}
		end
	end

	local eac_authorized = false

	if PLATFORM == "win32" then
		local eac_state = EAC.state()
		eac_authorized = eac_state == "trusted"
	end

	current_filters.eac_authorized = {
		value = (eac_authorized and "true") or "false",
		comparison = LobbyComparison.EQUAL
	}
	current_filters.mechanism = {
		value = Managers.mechanism:current_mechanism_name(),
		comparison = LobbyComparison.EQUAL
	}
	self._current_filters = current_filters
	self._current_distance_filter = LobbyDistanceFilter.CLOSE
	local average_power_level = self._matchmaking_manager:get_average_power_level()
	local current_near_filters = {
		{
			key = "power_level",
			value = average_power_level
		}
	}
	self._current_near_filters = current_near_filters

	self._matchmaking_manager:setup_filter_requirements(1, self._current_distance_filter, self._current_filters, self._current_near_filters)

	local lobby_data = self._lobby:get_stored_lobby_data()
	lobby_data.matchmaking = "searching"
	lobby_data.time_of_search = tostring(os.time())

	self._lobby:set_lobby_data(lobby_data)
	self._level_transition_handler:set_next_level(nil)
	self._lobby_finder:refresh()
	self._game_server_finder:refresh()
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_search")

	if search_config.act_key then
		self._matchmaking_manager:send_system_chat_message(search_config.act_key)
	end

	if search_config.level_key then
		local level_display_name = LevelSettings[search_config.level_key].display_name

		self._matchmaking_manager:send_system_chat_message(level_display_name)
	end

	local difficulty_display_name = DifficultySettings[search_config.difficulty].display_name

	self._matchmaking_manager:send_system_chat_message(difficulty_display_name)

	local player = Managers.player:local_player()
	local game_mode = search_config.game_mode
	local level_key = search_config.level_key
	local difficulty = search_config.difficulty
	local country_code = lobby_data.country_code
	local quick_game = search_config.quick_game
	local strict_matchmaking = self.search_config.strict_matchmaking

	Managers.telemetry.events:matchmaking_search({
		player = player,
		game_mode = game_mode,
		level_key = level_key,
		difficulty = difficulty,
		country_code = country_code,
		quick_game = quick_game,
		strict_matchmaking = strict_matchmaking
	})
end

MatchmakingStateSearchGame.on_exit = function (self)
	return
end

MatchmakingStateSearchGame.update = function (self, dt, t)
	local num_active_peers = self._network_server:num_active_peers()

	if num_active_peers > 1 then
		mm_printf("Leaving MatchmakingStateSearchGame and becoming host due to having connections, probably a friend joining.")

		return MatchmakingStateHostGame, self.state_context
	end

	if self.state_context.join_lobby_data then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_found_game")

		return MatchmakingStateRequestJoinGame, self.state_context
	end

	self._lobby_finder:update(dt)
	self._game_server_finder:update(dt)

	if self._lobby_finder:is_refreshing() or self._game_server_finder:is_refreshing() then
		return
	end

	local new_lobby = self:_search_for_game(dt)
	local found_new_lobby = new_lobby ~= nil
	local search_again = false

	if not found_new_lobby then
		local distance_filter = self._current_distance_filter
		local next_distance_filter = LobbyDistanceFilter.get_next(distance_filter, MatchmakingSettings.max_distance_filter)

		if next_distance_filter ~= nil then
			mm_printf("Changing distance filter from %s to %s", distance_filter, next_distance_filter)
			self._matchmaking_manager:setup_filter_requirements(1, next_distance_filter, self._current_filters, self._current_near_filters)

			self._current_distance_filter = next_distance_filter
			search_again = true

			self._matchmaking_manager:send_system_chat_message("matchmaking_status_increased_search_range")
		end

		if MatchmakingSettings.host_games == "never" then
			search_again = true
		end

		if search_again then
			self._lobby_finder:refresh()
			self._game_server_finder:refresh()
		end
	end

	if new_lobby then
		self.state_context.join_lobby_data = new_lobby
	elseif not search_again then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_cannot_find_game")

		local player = Managers.player:local_player(1)
		local connection_state = "search_game_timeout"
		local started_matchmaking_t = self.state_context.started_matchmaking_t
		local main_t = Managers.time:time("main")
		local time_taken = main_t - started_matchmaking_t
		local using_strict_matchmaking = self.search_config.strict_matchmaking

		Managers.telemetry.events:matchmaking_search_timeout(player, time_taken)

		return MatchmakingStateHostGame, self.state_context
	end

	return nil
end

MatchmakingStateSearchGame._search_for_game = function (self, dt)
	local lobbies = self:_get_server_lobbies()
	local active_lobby, wanted_profile_index = nil
	local player = Managers.player:player_from_peer_id(self._peer_id)
	local profile_index = player:profile_index()
	local wanted_profile = profile_index
	local search_config = self.search_config
	local matchmaking_manager = self._matchmaking_manager
	local chosen_level = nil
	local preferred_levels = {}
	local game_mode = search_config.game_mode
	local selected_level_key = search_config.level_key
	local preferred_level_keys = search_config.preferred_level_keys

	if selected_level_key then
		preferred_levels = {
			selected_level_key
		}
	elseif preferred_level_keys then
		preferred_levels = table.clone(preferred_level_keys)
	else
		chosen_level, preferred_levels = matchmaking_manager:get_weighed_random_unlocked_level(false, not search_config.quick_game)
	end

	active_lobby = self:_find_suitable_lobby(lobbies, search_config, wanted_profile, preferred_levels)

	return active_lobby
end

local server_lobbies = {}

MatchmakingStateSearchGame._get_server_lobbies = function (self)
	local lobbies = self:_get_lobbies()
	local servers = self:_get_servers()

	table.clear(server_lobbies)
	table.merge(server_lobbies, servers)
	table.merge(server_lobbies, lobbies)

	return server_lobbies
end

MatchmakingStateSearchGame._get_lobbies = function (self)
	return self._lobby_finder:lobbies()
end

MatchmakingStateSearchGame._get_servers = function (self)
	return self._game_server_finder:servers()
end

MatchmakingStateSearchGame._times_party_completed_level = function (self, level_key)
	local times_completed = 0
	local statistics_db = self._statistics_db
	local players = Managers.player:human_players()

	for _, player in pairs(players) do
		times_completed = times_completed + statistics_db:get_persistent_stat(player:stats_id(), "completed_levels", level_key)
	end

	return times_completed
end

MatchmakingStateSearchGame._compare_first_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	local search_config = self.search_config
	local quick_game = search_config.quick_game
	local current_level_key = current_lobby.selected_level_key
	local new_level_key = new_lobby.selected_level_key

	if quick_game and current_level_key and current_level_key ~= "inn_level" and new_level_key and new_level_key ~= "inn_level" then
		local current_times_completed = self:_times_party_completed_level(current_level_key)
		local new_times_completed = self:_times_party_completed_level(new_level_key)

		if new_times_completed < current_times_completed then
			return new_lobby
		end
	end

	return current_lobby
end

MatchmakingStateSearchGame._compare_secondary_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	local search_config = self.search_config
	local quick_game = search_config.quick_game
	local current_level_key = current_lobby.selected_level_key
	local new_level_key = new_lobby.selected_level_key

	if quick_game and current_level_key and current_level_key ~= "inn_level" and new_level_key and new_level_key ~= "inn_level" then
		local current_level_key = current_lobby.selected_level_key
		local current_times_completed = self:_times_party_completed_level(current_level_key)
		local new_level_key = current_lobby.selected_level_key
		local new_times_completed = self:_times_party_completed_level(new_level_key)

		if new_times_completed < current_times_completed then
			return new_lobby
		end
	end

	return current_lobby
end

MatchmakingStateSearchGame._find_suitable_lobby = function (self, lobbies, search_config, wanted_profile_id, preferred_levels)
	local selected_level_key = search_config.level_key
	local difficulty = search_config.difficulty
	local game_mode = search_config.game_mode
	local weave_name = search_config.weave_name
	local act_key = search_config.act_key
	local using_strict_matchmaking = search_config.strict_matchmaking
	local reached_max_distance = self._current_distance_filter == MatchmakingSettings.max_distance_filter
	local allow_occupied_hero_lobbies = Application.user_setting("allow_occupied_hero_lobbies")
	local current_first_prio_lobby, current_secondary_prio_lobby = nil
	local matchmaking_manager = self._matchmaking_manager

	for _, level_key in pairs(preferred_levels) do
		if current_first_prio_lobby then
			break
		end

		for _, lobby_data in ipairs(lobbies) do
			local host_name = lobby_data.unique_server_name or lobby_data.host
			local lobby_match, reason = matchmaking_manager:lobby_match(lobby_data, act_key, level_key, difficulty, game_mode, self._peer_id, weave_name)

			if lobby_match then
				local discard = false
				local discard_reason = nil
				local secondary_option = false
				local lobby_level_key = lobby_data.selected_level_key or lobby_data.level_key
				local ignore_dlc_check = search_config.quick_game
				local is_event_mode = search_config.game_mode == "event"

				if not selected_level_key and not discard and not matchmaking_manager:party_has_level_unlocked(lobby_level_key, ignore_dlc_check, nil, is_event_mode) then
					discard = true
					discard_reason = string.format("level(%s) is not unlocked by party", lobby_level_key)
				end

				if not discard and not matchmaking_manager:hero_available_in_lobby_data(wanted_profile_id, lobby_data) then
					local any_allowed_hero_available = false

					for i = 1, 5, 1 do
						if MatchmakingSettings.hero_search_filter[i] == true then
							local hero_available = matchmaking_manager:hero_available_in_lobby_data(i, lobby_data)

							if hero_available then
								any_allowed_hero_available = true

								break
							end
						end
					end

					if any_allowed_hero_available and allow_occupied_hero_lobbies then
						secondary_option = true
					else
						discard = true
						discard_reason = "hero is unavailable"
					end
				end

				if not discard and lobby_data.level_key ~= "inn_level" then
					if using_strict_matchmaking then
						discard = true
						discard_reason = "strict matchmaking"
					else
						secondary_option = true
					end
				end

				if not discard and using_strict_matchmaking and lobby_data.selected_level_key ~= selected_level_key then
					discard = true
					discard_reason = "strict matchmaking"
				end

				if not discard and lobby_data.host_afk == "true" then
					secondary_option = true
				end

				if not discard and secondary_option and not reached_max_distance then
					discard = true
					discard_reason = "secondary lobby before reaching max distance"
				end

				if not discard then
					if not secondary_option then
						current_first_prio_lobby = self:_compare_first_prio_lobbies(current_first_prio_lobby, lobby_data)
					else
						current_secondary_prio_lobby = self:_compare_secondary_prio_lobbies(current_secondary_prio_lobby, lobby_data)
					end
				else
					mm_printf("Lobby hosted by %s discarded due to '%s'", host_name, discard_reason or "unknown")
				end
			else
				mm_printf("Lobby hosted by %s failed lobby match due to '%s'", host_name, reason or "unknown")
			end
		end
	end

	return current_first_prio_lobby or current_secondary_prio_lobby
end

return
