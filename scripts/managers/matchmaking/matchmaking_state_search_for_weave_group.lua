MatchmakingStateSearchForWeaveGroup = class(MatchmakingStateSearchForWeaveGroup)
MatchmakingStateSearchForWeaveGroup.NAME = "MatchmakingStateSearchForWeaveGroup"
MatchmakingStateSearchForWeaveGroup.UPDATE_SEARCHING = 1
MatchmakingStateSearchForWeaveGroup.UPDATE_JOINING = 2
MatchmakingStateSearchForWeaveGroup.UPDATE_WAITING = 3
MatchmakingStateSearchForWeaveGroup.states = {
	"_update_seraching",
	"_update_joining",
	"_update_waiting_for_vote"
}

MatchmakingStateSearchForWeaveGroup.init = function (self, params)
	self._lobby = params.lobby
	self._lobby_finder = params.lobby_finder
	self._game_server_finder = params.game_server_finder
	self._peer_id = Network:peer_id()
	self._matchmaking_manager = params.matchmaking_manager
	self._level_transition_handler = params.level_transition_handler
	self._network_server = params.network_server
	self._statistics_db = params.statistics_db
	self._stats_id = Managers.player:local_player():stats_id()
	self._discard_list = {}
	local ignore_dlc_check = false
	local current_weave = LevelUnlockUtils.current_weave(self._statistics_db, self._stats_id, ignore_dlc_check)
	local weave_template = WeaveSettings.templates[current_weave]
	local weave_templates_ordererd = WeaveSettings.templates_ordered
	self._current_weave_index = table.find(weave_templates_ordererd, weave_template)
	Managers.matchmaking.countdown_has_finished = false
	self._current_state = MatchmakingStateSearchForWeaveGroup.states[MatchmakingStateSearchForWeaveGroup.UPDATE_SEARCHING]
end

MatchmakingStateSearchForWeaveGroup.destroy = function (self)
	return
end

MatchmakingStateSearchForWeaveGroup.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_start_searching_for_games()
end

MatchmakingStateSearchForWeaveGroup._start_searching_for_games = function (self)
	local search_config = self.search_config
	local current_filters = {}
	local current_near_filters = {}
	local eac_authorized = false

	if PLATFORM == "win32" then
		local eac_state = EAC.state()
		eac_authorized = eac_state == "trusted"
	end

	current_filters.eac_authorized = {
		value = (eac_authorized and "true") or "false",
		comparison = LobbyComparison.EQUAL
	}
	self._current_filters = current_filters

	self._matchmaking_manager:setup_weave_filters(self.state_context, self._current_filters)

	self._current_near_filters = current_near_filters

	self._matchmaking_manager:setup_weave_near_filters(self.state_context, self._current_near_filters)

	self._current_distance_filter = LobbyDistanceFilter.CLOSE

	self._matchmaking_manager:setup_filter_requirements(1, self._current_distance_filter, self._current_filters, self._current_near_filters)

	local lobby_data = self._lobby:get_stored_lobby_data()
	lobby_data.matchmaking = "searching"
	lobby_data.time_of_search = tostring(os.time())

	self._lobby:set_lobby_data(lobby_data)
	self._level_transition_handler:set_next_level(nil)
	self._lobby_finder:refresh()
	self._game_server_finder:refresh()

	if self.state_context.allow_hosted_weaves then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_restart_search")
	else
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_search")
	end

	local player = Managers.player:local_player()

	Managers.telemetry.events:matchmaking_search(player, self.search_config)
end

MatchmakingStateSearchForWeaveGroup.on_exit = function (self)
	return
end

MatchmakingStateSearchForWeaveGroup.update = function (self, dt, t)
	self._current_state = self._current_state or MatchmakingStateSearchForWeaveGroup.states[MatchmakingStateSearchForWeaveGroup.UPDATE_SEARCHING]

	return self[self._current_state](self, dt, t)
end

MatchmakingStateSearchForWeaveGroup.weave_vote_result = function (self, accepted)
	if accepted then
		self.state_context.join_lobby_data = self._potential_lobby_data
		self._potential_lobby_data = nil

		self:_change_state(MatchmakingStateSearchForWeaveGroup.UPDATE_JOINING)
	else
		local id = self._potential_lobby_data.id
		self._discard_list[id] = true
		self._potential_lobby_data = nil
		self._vote_wait_timer = Managers.time:time("main") + 2
	end
end

MatchmakingStateSearchForWeaveGroup._change_state = function (self, state)
	fassert(MatchmakingStateSearchForWeaveGroup.states[state], "[MatchmakingStateSearchForWeaveGroup] There is no state with the index %s", tostring(state))

	self._current_state = MatchmakingStateSearchForWeaveGroup.states[state]
end

MatchmakingStateSearchForWeaveGroup._update_waiting_for_vote = function (self, dt, t)
	if self._vote_wait_timer and self._vote_wait_timer < t then
		self:_change_state(MatchmakingStateSearchForWeaveGroup.UPDATE_SEARCHING)

		self._vote_wait_timer = nil
	end
end

MatchmakingStateSearchForWeaveGroup._update_joining = function (self, dt, t)
	if self.state_context.join_lobby_data then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_found_game")

		return MatchmakingStateRequestJoinGame, self.state_context
	end

	local lobby_game_mode = self._potential_lobby_data.game_mode

	if PLATFORM ~= "ps4" then
		local lobby_game_mode_index = tonumber(lobby_game_mode)
		lobby_game_mode = lobby_game_mode_index and NetworkLookup.game_modes[lobby_game_mode_index]
	end

	if lobby_game_mode == "weave" then
		local weave_name = self._potential_lobby_data.weave_name
		local weave_template = WeaveSettings.templates[weave_name]
		local level_key = weave_template.objectives[1].level_id
		local difficulty = weave_template.difficulty_key
		local vote_data = {
			game_mode = "weave",
			objective_index = 1,
			level_key = level_key,
			difficulty = difficulty,
			weave_name = weave_name
		}

		Managers.state.voting:request_vote("game_settings_join_weave_vote", vote_data, Network.peer_id())
		self:_change_state(MatchmakingStateSearchForWeaveGroup.UPDATE_WAITING)
	else
		self.state_context.join_lobby_data = self._potential_lobby_data
		self._potential_lobby_data = nil
	end
end

MatchmakingStateSearchForWeaveGroup._update_seraching = function (self, dt, t)
	local num_active_peers = self._network_server:num_active_peers()

	if num_active_peers > 1 then
		mm_printf("Leaving MatchmakingStateSearchForWeaveGroup and becoming host due to having connections, probably a friend joining.")

		return MatchmakingStateHostFindWeaveGroup, self.state_context
	end

	self._lobby_finder:update(dt)
	self._game_server_finder:update(dt)

	if self._lobby_finder:is_refreshing() or self._game_server_finder:is_refreshing() then
		return
	end

	local new_lobby = self:_search_for_game(dt, t)
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

		if search_again then
			self._lobby_finder:refresh()
			self._game_server_finder:refresh()
		end
	end

	if new_lobby then
		self._potential_lobby_data = new_lobby

		self:_change_state(MatchmakingStateSearchForWeaveGroup.UPDATE_JOINING)
	elseif not search_again then
		local player = Managers.player:local_player(1)
		local connection_state = "search_game_timeout"
		local started_matchmaking_t = self.state_context.started_matchmaking_t
		local main_t = Managers.time:time("main")
		local time_taken = main_t - started_matchmaking_t
		local using_strict_matchmaking = self.search_config.strict_matchmaking

		Managers.telemetry.events:matchmaking_search_timeout(player, time_taken, self.search_config)

		return MatchmakingStateHostFindWeaveGroup, self.state_context
	end

	return nil
end

MatchmakingStateSearchForWeaveGroup._search_for_game = function (self, dt, t)
	local lobbies = self:_get_server_lobbies()
	local active_lobby, wanted_profile_index = nil
	local player = Managers.player:player_from_peer_id(self._peer_id)
	local profile_index = player:profile_index()
	local wanted_profile = profile_index
	local search_config = self.search_config
	local matchmaking_manager = self._matchmaking_manager
	local game_mode = search_config.game_mode
	active_lobby = self:_find_suitable_lobby(lobbies, search_config, wanted_profile, t)

	return active_lobby
end

local server_lobbies = {}

MatchmakingStateSearchForWeaveGroup._get_server_lobbies = function (self)
	local lobbies = self:_get_lobbies()
	local servers = self:_get_servers()

	table.clear(server_lobbies)
	table.merge(server_lobbies, servers)
	table.merge(server_lobbies, lobbies)

	return server_lobbies
end

MatchmakingStateSearchForWeaveGroup._get_lobbies = function (self)
	return self._lobby_finder:lobbies()
end

MatchmakingStateSearchForWeaveGroup._get_servers = function (self)
	return self._game_server_finder:servers()
end

MatchmakingStateSearchForWeaveGroup._compare_first_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	return current_lobby
end

MatchmakingStateSearchForWeaveGroup._compare_secondary_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	local current_game_mode = current_lobby.game_mode

	if PLATFORM ~= "ps4" then
		local current_game_mode_index = tonumber(current_game_mode)
		current_game_mode = current_game_mode_index and NetworkLookup.game_modes[current_game_mode_index]
	end

	if current_game_mode == "weave_find_group" then
		return current_lobby
	end

	local new_game_mode = new_lobby.game_mode

	if PLATFORM ~= "ps4" then
		local new_game_mode_index = tonumber(new_game_mode)
		new_game_mode = new_game_mode_index and NetworkLookup.game_modes[new_game_mode_index]
	end

	if new_game_mode == "weave_find_group" then
		return new_lobby
	end

	local weave_templates_ordererd = WeaveSettings.templates_ordered
	local current_lobby_weave_name = current_lobby.weave_name
	local current_lobby_weave_template = WeaveSettings.templates[current_lobby_weave_name]
	local current_lobby_weave_index = table.find(weave_templates_ordererd, current_lobby_weave_template)
	local current_diff = math.abs(self._current_weave_index - current_lobby_weave_index)
	local new_lobby_weave_name = new_lobby.weave_name
	local new_lobby_weave_template = WeaveSettings.templates[new_lobby_weave_name]
	local new_lobby_weave_index = table.find(weave_templates_ordererd, new_lobby_weave_template)
	local new_diff = math.abs(self._current_weave_index - new_lobby_weave_index)

	if current_diff <= new_diff then
		return current_lobby
	else
		return new_lobby
	end

	return current_lobby
end

MatchmakingStateSearchForWeaveGroup._handle_expansion_rules = function (self, my_expansion_rules, lobby_data)
	if PLATFORM == "ps4" then
		Application.warning("[MatchmakingStateSearchForWeaveGroup] Expansion rules not implemented on PS4 yet")

		return false
	end

	local my_near_filters = my_expansion_rules.near_filters

	for key, filter_data in pairs(my_near_filters) do
		local requirements = filter_data.requirements

		if requirements then
			local lobby_value = (filter_data.transform_data_function and filter_data.transform_data_function(lobby_data[key])) or lobby_data[key]
			local own_value = filter_data.fetch_function(self)

			if filter_data.transform_data_function then
				own_value = filter_data.transform_data_function(own_value) or own_value
			end

			local range_up = requirements.range_up
			local range_down = requirements.range_down

			if range_up and lobby_value > own_value + range_up then
				return true, key .. "_is_too_high"
			elseif range_down and lobby_value < own_value - range_down then
				return true, key .. "_is_too_low"
			end
		end
	end

	if lobby_data.expansion_rule_index then
		local expansion_rule_index = tonumber(lobby_data.expansion_rule_index)
		local lobby_expansion_rule_index = math.min(expansion_rule_index, WeaveMatchmakingSettings.num_expansion_rules)
		local lobby_expansion_rules = WeaveMatchmakingSettings.expansion_rules[lobby_expansion_rule_index]
		local lobby_near_filters = lobby_expansion_rules.near_filters or {}

		for key, filter_data in pairs(lobby_near_filters) do
			local lobby_requirements = filter_data.requirements

			if lobby_requirements then
				local lobby_value = (filter_data.transform_data_function and filter_data.transform_data_function(lobby_data[key])) or lobby_data[key]
				local own_value = filter_data.fetch_function(self)

				if filter_data.transform_data_function then
					own_value = filter_data.transform_data_function(own_value) or own_value
				end

				local lobby_range_up = lobby_requirements.range_up
				local lobby_range_down = lobby_requirements.range_down

				if lobby_range_up and own_value > lobby_value + lobby_range_up then
					return true, key .. "_is_too_high_for_the_remote_lobby"
				elseif lobby_range_down and own_value < lobby_value - lobby_range_down then
					return true, key .. "_is_too_low_for_the_remote_lobby"
				end
			end
		end
	end

	return false
end

MatchmakingStateSearchForWeaveGroup._find_suitable_lobby = function (self, lobbies, search_config, wanted_profile_id, t)
	local game_mode = search_config.game_mode
	local reached_max_distance = self._current_distance_filter == MatchmakingSettings.max_distance_filter
	local expansion_rule_index = math.min(self.state_context.expansion_rule_index or 1, WeaveMatchmakingSettings.num_expansion_rules)
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[expansion_rule_index]
	local other_requirements = expansion_rules.other_requirements
	local allow_occupied_hero_lobbies = other_requirements.allow_occupied_hero_lobbies or Application.user_setting("allow_occupied_hero_lobbies")
	local allow_hosted_weaves = other_requirements.allow_hosted_weaves
	local current_first_prio_lobby, current_secondary_prio_lobby = nil
	local matchmaking_manager = self._matchmaking_manager

	for _, lobby_data in ipairs(lobbies) do
		local host_name = lobby_data.unique_server_name or lobby_data.host
		local lobby_match, reason = matchmaking_manager:lobby_match(lobby_data, nil, nil, nil, game_mode, self._peer_id)

		if lobby_match then
			local discard = false
			local discard_reason = nil
			local secondary_option = false

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

			local level_settings = LevelSettings[lobby_data.level_key]

			if not discard and not level_settings.hub_level then
				secondary_option = true
			end

			if not discard and lobby_data.host_afk == "true" then
				secondary_option = true
			end

			if not discard then
				local lobby_game_mode = lobby_data.game_mode

				if PLATFORM ~= "ps4" then
					local lobby_game_mode_index = tonumber(lobby_game_mode)
					lobby_game_mode = NetworkLookup.game_modes[lobby_game_mode_index]
				end

				if lobby_game_mode == "weave" and allow_hosted_weaves then
					secondary_option = true
				elseif lobby_game_mode ~= "weave_find_group" then
					discard = true
					discard_reason = "Search doesn't allow hosted weaves"
				end
			end

			if not discard and secondary_option and not reached_max_distance then
				discard = true
				discard_reason = "secondary lobby before reaching max distance"
			end

			if not discard then
				local id = lobby_data.id

				if self._discard_list[id] then
					discard = true
					discard_reason = "player has discarded this lobby"
				end
			end

			if not discard then
				discard, discard_reason = self:_handle_expansion_rules(expansion_rules, lobby_data)
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

	return current_first_prio_lobby or current_secondary_prio_lobby
end

return
