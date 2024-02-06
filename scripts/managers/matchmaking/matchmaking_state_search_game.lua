-- chunkname: @scripts/managers/matchmaking/matchmaking_state_search_game.lua

MatchmakingStateSearchGame = class(MatchmakingStateSearchGame)
MatchmakingStateSearchGame.NAME = "MatchmakingStateSearchGame"

MatchmakingStateSearchGame.init = function (self, params)
	self._lobby = params.lobby
	self._lobby_finder = params.lobby_finder
	self._peer_id = Network.peer_id()
	self._matchmaking_manager = params.matchmaking_manager
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
			comparison = "equal",
			value = search_config.difficulty,
		},
	}
	local quick_game = search_config.quick_game

	if not quick_game then
		local mission_id = search_config.mission_id

		if mission_id then
			current_filters.selected_mission_id = {
				comparison = "equal",
				value = mission_id,
			}
		end

		local act_key = search_config.act_key

		if act_key then
			current_filters.act_key = {
				comparison = "equal",
				value = act_key,
			}
		end
	end

	local matchmaking_type = search_config.matchmaking_type

	if matchmaking_type then
		if matchmaking_type == "standard" then
			local matchmaking_type = "custom"
			local matchmaking_type_index = NetworkLookup.matchmaking_types[matchmaking_type]

			current_filters.matchmaking_type = {
				comparison = "less_or_equal",
				value = matchmaking_type_index,
			}
		else
			local matchmaking_type_index = NetworkLookup.matchmaking_types[matchmaking_type]

			current_filters.matchmaking_type = {
				comparison = "equal",
				value = matchmaking_type_index,
			}
		end
	end

	local eac_authorized = false

	if IS_WINDOWS or IS_LINUX then
		local eac_state = EAC.state()

		eac_authorized = eac_state == "trusted"
	end

	current_filters.eac_authorized = {
		comparison = "equal",
		value = eac_authorized and "true" or "false",
	}
	current_filters.mechanism = {
		comparison = "equal",
		value = self.search_config.mechanism,
	}
	self._current_filters = current_filters
	self._current_distance_filter = "close"

	local average_power_level = self._matchmaking_manager:get_average_power_level()
	local current_near_filters = {
		{
			key = "power_level",
			value = average_power_level,
		},
	}

	self._current_near_filters = current_near_filters

	self._matchmaking_manager:setup_filter_requirements(1, self._current_distance_filter, self._current_filters, self._current_near_filters)

	local lobby_data = self._lobby:get_stored_lobby_data()

	lobby_data.matchmaking = "searching"
	lobby_data.time_of_search = tostring(os.time())

	self._lobby:set_lobby_data(lobby_data)
	Managers.level_transition_handler:clear_next_level()
	self._lobby_finder:refresh()
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_search")

	if search_config.act_key then
		self._matchmaking_manager:send_system_chat_message(search_config.act_key)
	end

	if search_config.mission_id then
		if search_config.mechanism == "weave" then
			local weave_template = WeaveSettings.templates[search_config.mission_id]
			local mission_display_name = weave_template.display_name

			self._matchmaking_manager:send_system_chat_message(mission_display_name)
		else
			local mission_display_name = LevelSettings[search_config.mission_id].display_name

			self._matchmaking_manager:send_system_chat_message(mission_display_name)
		end
	end

	local difficulty_display_name = DifficultySettings[search_config.difficulty].display_name

	self._matchmaking_manager:send_system_chat_message(difficulty_display_name)

	local player = Managers.player:local_player()

	Managers.telemetry_events:matchmaking_search(player, self.search_config)
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

	if self._lobby_finder:is_refreshing() then
		return
	end

	local new_lobby = self:_search_for_game(dt)
	local found_new_lobby = new_lobby ~= nil
	local search_again = false

	if not found_new_lobby then
		local distance_filter = self._current_distance_filter
		local next_distance_filter = LobbyAux.get_next_lobby_distance_filter(distance_filter, MatchmakingSettings.max_distance_filter)

		if next_distance_filter ~= nil then
			mm_printf("Changing distance filter from %s to %s", distance_filter, next_distance_filter)
			self._matchmaking_manager:setup_filter_requirements(1, next_distance_filter, self._current_filters, self._current_near_filters)

			self._current_distance_filter = next_distance_filter
			search_again = true

			self._matchmaking_manager:send_system_chat_message("matchmaking_status_increased_search_range")
		end

		if self.search_config.host_games then
			search_again = self.search_config.host_games == "never"
		elseif MatchmakingSettings.host_games == "never" then
			search_again = true
		end

		if search_again then
			self._lobby_finder:refresh()
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

		Managers.telemetry_events:matchmaking_search_timeout(player, time_taken, self.search_config)

		return MatchmakingStateHostGame, self.state_context
	end

	return nil
end

MatchmakingStateSearchGame._search_for_game = function (self, dt)
	local lobbies = self:_get_server_lobbies()
	local active_lobby, wanted_profile_index
	local player = Managers.player:player_from_peer_id(self._peer_id)
	local profile_index = player:profile_index()
	local wanted_profile = profile_index
	local search_config = self.search_config
	local matchmaking_manager = self._matchmaking_manager
	local chosen_level
	local preferred_levels = {}
	local matchmaking_type = search_config.matchmaking_type
	local mission_id = search_config.mission_id
	local preferred_level_keys = search_config.preferred_level_keys
	local any_level = search_config.any_level

	if any_level then
		preferred_levels = {
			"any",
		}
	elseif mission_id then
		preferred_levels = {
			mission_id,
		}
	elseif preferred_level_keys then
		preferred_levels = table.clone(preferred_level_keys)

		if search_config.include_hub_level then
			local mechanism = Managers.mechanism:game_mechanism()
			local hub_level_name = mechanism:get_hub_level_key()

			preferred_levels[#preferred_levels + 1] = hub_level_name
		end
	else
		chosen_level, preferred_levels = matchmaking_manager:get_weighed_random_unlocked_level(false, not search_config.quick_game)
	end

	active_lobby = self:_find_suitable_lobby(lobbies, search_config, wanted_profile, preferred_levels)

	return active_lobby
end

local server_lobbies = {}

MatchmakingStateSearchGame._get_server_lobbies = function (self)
	local lobbies = self:_get_lobbies()

	table.clear(server_lobbies)
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
	local matchmaking_type = search_config.matchmaking_type
	local mechanism = search_config.mechanism

	if mechanism == "deus" or mechanism == "weave" then
		return current_lobby
	end

	local current_mission_id = current_lobby.selected_mission_id
	local new_mission_id = new_lobby.selected_mission_id
	local current_level_settings = current_mission_id and LevelSettings[current_mission_id]
	local new_level_settings = new_mission_id and LevelSettings[new_mission_id]

	if quick_game and current_level_settings and not current_level_settings.hub_level and new_level_settings and not new_level_settings.hub_level then
		local current_times_completed = self:_times_party_completed_level(current_mission_id)
		local new_times_completed = self:_times_party_completed_level(new_mission_id)

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
	local matchmaking_type = search_config.matchmaking_type
	local mechanism = search_config.mechanism

	if mechanism == "deus" or mechanism == "weave" then
		return current_lobby
	end

	local current_mission_id = current_lobby.selected_mission_id
	local new_mission_id = new_lobby.selected_mission_id
	local current_level_settings = current_mission_id and LevelSettings[current_mission_id]
	local new_level_settings = new_mission_id and LevelSettings[new_mission_id]

	if quick_game and current_level_settings and not current_level_settings.hub_level and new_level_settings and not new_level_settings.hub_level then
		local current_times_completed = self:_times_party_completed_level(current_mission_id)
		local new_times_completed = self:_times_party_completed_level(new_mission_id)

		if new_times_completed < current_times_completed then
			return new_lobby
		end
	end

	return current_lobby
end

MatchmakingStateSearchGame._find_suitable_lobby = function (self, lobbies, search_config, wanted_profile_id, preferred_levels)
	local selected_mission_id = search_config.mission_id
	local difficulty = search_config.difficulty
	local matchmaking_type = search_config.matchmaking_type
	local weave_name = search_config.mechanism == "weave" and selected_mission_id or "false"
	local act_key = search_config.act_key
	local mechanism = search_config.mechanism
	local using_strict_matchmaking = search_config.strict_matchmaking
	local max_distance_filter = search_config.max_distance_filter or MatchmakingSettings.max_distance_filter
	local reached_max_distance = self._current_distance_filter == max_distance_filter

	mm_printf("max_quick_play_search_range: %s", max_distance_filter)

	local allow_occupied_hero_lobbies = Application.user_setting("allow_occupied_hero_lobbies")
	local current_first_prio_lobby, current_secondary_prio_lobby
	local matchmaking_manager = self._matchmaking_manager

	table.dump(preferred_levels, "preferred levels", 2)

	for _, level_key in pairs(preferred_levels) do
		if current_first_prio_lobby then
			break
		end

		for _, lobby_data in ipairs(lobbies) do
			local host_name = lobby_data.unique_server_name or lobby_data.host
			local lobby_match, reason = matchmaking_manager:lobby_match(lobby_data, act_key, level_key, difficulty, matchmaking_type, self._peer_id, weave_name, mechanism)

			if lobby_match then
				local discard = false
				local discard_reason
				local secondary_option = false
				local lobby_mission_id = lobby_data.selected_mission_id or lobby_data.mission_id
				local ignore_dlc_check = search_config.quick_game
				local is_event_mode = search_config.matchmaking_type == "event"

				if mechanism ~= "weave" and not selected_mission_id and not discard and not matchmaking_manager:party_has_level_unlocked(lobby_mission_id, ignore_dlc_check, nil, is_event_mode) then
					discard = true
					discard_reason = string.format("Mission(%s) is not unlocked by party", lobby_mission_id)
				end

				if not discard and not matchmaking_manager:hero_available_in_lobby_data(wanted_profile_id, lobby_data) then
					local any_allowed_hero_available = false

					for i = 1, 5 do
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

				local level_settings = LevelSettings[lobby_data.mission_id]

				if not discard and not level_settings.hub_level then
					if using_strict_matchmaking then
						discard = true
						discard_reason = "strict matchmaking"
					else
						secondary_option = true
					end
				end

				if not discard and using_strict_matchmaking and lobby_data.selected_mission_id ~= selected_mission_id then
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
