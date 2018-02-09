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
	Managers.matchmaking.countdown_has_finished = false

	return 
end
MatchmakingStateSearchGame.destroy = function (self)
	return 
end
MatchmakingStateSearchGame.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self._start_searching_for_games(self)

	return 
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

	local eac_authorized = "false"

	if Managers.eac:enabled() then
		if Managers.eac:authorized() then
			eac_authorized = "true"
		else
			eac_authorized = "false"
		end
	end

	current_filters.eac_authorized = {
		value = eac_authorized,
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
		self._matchmaking_manager:send_system_chat_message(search_config.level_key)
	end

	local difficulty_display_name = DifficultySettings[search_config.difficulty].display_name

	self._matchmaking_manager:send_system_chat_message(difficulty_display_name)

	return 
end
MatchmakingStateSearchGame.on_exit = function (self)
	return 
end
MatchmakingStateSearchGame.update = function (self, dt, t)
	local num_active_peers = self._network_server:num_active_peers()

	if 1 < num_active_peers then
		mm_printf("Leaving MatchmakingStateSearchGame and becoming host due to having connections, probably a friend joining.")

		return MatchmakingStateHostGame, self.state_context
	end

	if self.state_context.join_lobby_data then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_found_game")

		return MatchmakingStateRequestJoinGameVerifyHostEAC, self.state_context
	end

	self._lobby_finder:update(dt)
	self._game_server_finder:update(dt)

	if self._lobby_finder:is_refreshing() or self._game_server_finder:is_refreshing() then
		return 
	end

	local new_lobby = self._search_for_game(self, dt)
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

		Managers.telemetry.events:matchmaking_connection(player, connection_state, time_taken)

		return MatchmakingStateHostGame, self.state_context
	end

	return nil
end
MatchmakingStateSearchGame._search_for_game = function (self, dt)
	local lobbies = self._get_server_lobbies(self)
	local active_lobby, wanted_profile_index = nil
	local player = Managers.player:player_from_peer_id(self._peer_id)
	local profile_index = player.profile_index(player)
	local wanted_profile = profile_index
	local search_config = self.search_config
	active_lobby = self._find_suitable_lobby(self, lobbies, search_config, wanted_profile)

	return active_lobby
end
local server_lobbies = {}
MatchmakingStateSearchGame._get_server_lobbies = function (self)
	local lobbies = self._get_lobbies(self)
	local servers = self._get_servers(self)

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
MatchmakingStateSearchGame._find_suitable_lobby = function (self, lobbies, search_config, wanted_profile_id)
	local level_key = search_config.level_key
	local difficulty = search_config.difficulty
	local game_mode = search_config.game_mode
	local act_key = search_config.act_key
	local allow_lobby_with_occupied_hero = true
	local secondary_option_lobby_data = nil
	local matchmaking_manager = self._matchmaking_manager

	for _, lobby_data in ipairs(lobbies) do
		local lobby_match = matchmaking_manager.lobby_match(matchmaking_manager, lobby_data, act_key, level_key, difficulty, game_mode, self._peer_id)

		if lobby_match then
			if not matchmaking_manager.hero_available_in_lobby_data(matchmaking_manager, wanted_profile_id, lobby_data) then
				local any_allowed_hero_available = false

				for i = 1, 5, 1 do
					if MatchmakingSettings.hero_search_filter[i] == true then
						local hero_available = matchmaking_manager.hero_available_in_lobby_data(matchmaking_manager, i, lobby_data)

						if hero_available then
							any_allowed_hero_available = true

							break
						end
					end
				end

				if allow_lobby_with_occupied_hero and any_allowed_hero_available then
					secondary_option_lobby_data = lobby_data
				end
			elseif lobby_data.level_key ~= "inn_level" then
				secondary_option_lobby_data = lobby_data
			elseif lobby_data.host_afk == "true" then
				secondary_option_lobby_data = lobby_data
			else
				return lobby_data
			end
		end
	end

	return secondary_option_lobby_data
end

return 
