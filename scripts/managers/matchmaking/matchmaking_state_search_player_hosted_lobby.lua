-- chunkname: @scripts/managers/matchmaking/matchmaking_state_search_player_hosted_lobby.lua

MatchmakingStateSearchPlayerHostedLobby = class(MatchmakingStateSearchPlayerHostedLobby)
MatchmakingStateSearchPlayerHostedLobby.NAME = "MatchmakingStateSearchPlayerHostedLobby"

MatchmakingStateSearchPlayerHostedLobby.init = function (self, params)
	self._lobby = params.lobby
	self._lobby_finder = params.lobby_finder
	self._peer_id = Network.peer_id()
	self._matchmaking_manager = params.matchmaking_manager
	self._network_server = params.network_server
	self._statistics_db = params.statistics_db
	Managers.matchmaking.countdown_has_finished = false
end

MatchmakingStateSearchPlayerHostedLobby.destroy = function (self)
	return
end

MatchmakingStateSearchPlayerHostedLobby.on_enter = function (self, state_context)
	self._state_context = state_context
	self._search_config = state_context.search_config

	self:_initialize_search()
end

MatchmakingStateSearchPlayerHostedLobby._initialize_search = function (self)
	local search_config = self._search_config
	local current_filters = {}
	local quick_game = search_config.quick_game

	if not quick_game then
		local mission_id = search_config.mission_id

		if mission_id then
			current_filters.selected_mission_id = {
				comparison = "equal",
				value = mission_id,
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
		value = search_config.mechanism,
	}
	self._current_filters = current_filters
	self._current_distance_filter = "close"
	self._current_near_filters = {}

	self._matchmaking_manager:setup_filter_requirements(1, self._current_distance_filter, self._current_filters, self._current_near_filters)

	local lobby_data = self._lobby:get_stored_lobby_data()

	lobby_data.matchmaking = "searching"

	self._lobby:set_lobby_data(lobby_data)
	Managers.level_transition_handler:clear_next_level()
	self._lobby_finder:refresh()

	local player = Managers.player:local_player()

	Managers.telemetry_events:matchmaking_search(player, self._search_config)
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_start_search")
end

MatchmakingStateSearchPlayerHostedLobby.on_exit = function (self)
	return
end

MatchmakingStateSearchPlayerHostedLobby.update = function (self, dt, t)
	self._lobby_finder:update(dt)

	if self._lobby_finder:is_refreshing() then
		return
	end

	local found_lobby = self:_search_for_game(dt)

	if found_lobby then
		self._matchmaking_manager:send_system_chat_message("matchmaking_status_found_game")

		self._state_context.join_lobby_data = found_lobby

		return MatchmakingStateReserveSlotsPlayerHosted, self._state_context
	else
		local distance_filter = self._current_distance_filter
		local next_distance_filter = LobbyAux.get_next_lobby_distance_filter(distance_filter, MatchmakingSettings.max_distance_filter)

		if next_distance_filter ~= nil then
			mm_printf("Changing distance filter from %s to %s", distance_filter, next_distance_filter)
			self._matchmaking_manager:setup_filter_requirements(1, next_distance_filter, self._current_filters, self._current_near_filters)

			self._current_distance_filter = next_distance_filter

			self._matchmaking_manager:send_system_chat_message("matchmaking_status_increased_search_range")
		end

		self._lobby_finder:refresh()
	end
end

local EMPTY_TABLE = {}

MatchmakingStateSearchPlayerHostedLobby._search_for_game = function (self, dt)
	local lobbies = self._lobby_finder:lobbies()
	local search_config = self._search_config
	local matchmaking_manager = self._matchmaking_manager
	local preferred_levels
	local mission_id = search_config.mission_id

	if mission_id then
		preferred_levels = {
			mission_id,
		}
	else
		preferred_levels = table.clone(Managers.mechanism:mechanism_setting_for_title("map_pool"))
		preferred_levels[#preferred_levels + 1] = "any"
	end

	return self:_find_suitable_lobby(lobbies, search_config, preferred_levels)
end

MatchmakingStateSearchPlayerHostedLobby._find_suitable_lobby = function (self, lobbies, search_config, preferred_levels)
	local selected_mission_id = search_config.mission_id
	local difficulty = search_config.difficulty
	local matchmaking_type = search_config.matchmaking_type
	local mechanism = search_config.mechanism
	local max_distance_filter = MatchmakingSettings.max_distance_filter
	local reached_max_distance = self._current_distance_filter == max_distance_filter
	local current_first_prio_lobby, current_secondary_prio_lobby
	local matchmaking_manager = self._matchmaking_manager

	for _, mission_id in pairs(preferred_levels) do
		for _, lobby_data in ipairs(lobbies) do
			local lobby_match, reason = self:_lobby_match(lobby_data, mission_id, difficulty, matchmaking_type, self._peer_id)

			if lobby_match then
				local discard = false
				local discard_reason
				local secondary_option = false
				local level_settings = LevelSettings[lobby_data.mission_id]

				if not level_settings.hub_level then
					secondary_option = true
				end

				if lobby_data.host_afk == "true" then
					secondary_option = true
				end

				if secondary_option and not reached_max_distance then
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
					local host_name = lobby_data.unique_server_name or lobby_data.host

					print("[MatchmakingStateSearchPlayerHostedLobby] Lobby hosted by %s discarded due to '%s'", host_name, discard_reason or "unknown")
				end
			else
				local host_name = lobby_data.unique_server_name or lobby_data.host

				print("[MatchmakingStateSearchPlayerHostedLobby] Lobby hosted by %s failed lobby match due to '%s'", host_name, reason or "unknown")
			end
		end

		if current_first_prio_lobby then
			break
		end
	end

	return current_first_prio_lobby or current_secondary_prio_lobby
end

MatchmakingStateSearchPlayerHostedLobby._lobby_match = function (self, lobby_data, mission_id, difficulty, matchmaking_type, player_peer_id)
	local search_config = self._state_context.search_config
	local matchmaking_manager = self._matchmaking_manager
	local lobby_id = lobby_data.id
	local broken_lobby = matchmaking_manager:lobby_listed_as_broken(lobby_id)

	if broken_lobby then
		return false, "lobby listed as broken"
	end

	if lobby_data.host == player_peer_id then
		return false, "players own lobby"
	end

	if IS_WINDOWS then
		local reservation_data = ProfileSynchronizer.deserialize_lobby_reservation_data(lobby_data)

		for party_id = 1, #reservation_data do
			local peer_datas = reservation_data[party_id]

			for i = 1, #peer_datas do
				local peer_id = ProfileSynchronizer.unpack_lobby_reservation_peer_data(peer_datas[i])
				local relationship = Friends.relationship(peer_id)
				local user_blocked = relationship == 5 or relationship == 6

				if user_blocked then
					return false, "user blocked"
				end
			end
		end
	end

	if lobby_data.twitch_enabled == "true" then
		return false, "twitch_mode"
	end

	local valid_lobby = lobby_data.matchmaking ~= "false" and lobby_data.valid

	if not valid_lobby then
		return false, "lobby is not valid"
	end

	if mission_id then
		local correct_mission = false
		local reason = "<no lobby level>"

		if lobby_data.selected_mission_id then
			correct_mission = lobby_data.selected_mission_id == mission_id
			reason = string.format("(%s ~= %s)", mission_id, lobby_data.selected_mission_id)
		elseif lobby_data.mission_id then
			correct_mission = lobby_data.mission_id == mission_id
			reason = string.format("(%s ~= %s)", mission_id, lobby_data.mission_id)
		end

		if not correct_mission then
			return false, "wrong mission " .. reason
		end
	end

	if difficulty then
		local correct_difficulty = lobby_data.difficulty == difficulty

		if not correct_difficulty then
			return false, "wrong difficulty"
		end
	end

	local party_lobby_host = search_config.party_lobby_host
	local lobby_members = party_lobby_host and party_lobby_host:members()
	local party_members = lobby_members and lobby_members:get_members()
	local matchmaking_settings = Managers.matchmaking.get_matchmaking_settings_for_mechanism(lobby_data.mechanism)
	local my_num_players = party_members and #party_members or 1
	local lobby_num_players = lobby_data.num_players and tonumber(lobby_data.num_players)
	local max_number_of_players = search_config.max_number_of_players or matchmaking_settings.MAX_NUMBER_OF_PLAYERS
	local has_empty_slots = lobby_num_players and max_number_of_players >= lobby_num_players + my_num_players

	if not has_empty_slots then
		return false, "not enough empty slots"
	end

	return true
end

MatchmakingStateSearchPlayerHostedLobby._compare_first_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	local search_config = self._search_config

	return current_lobby
end

MatchmakingStateSearchPlayerHostedLobby._compare_secondary_prio_lobbies = function (self, current_lobby, new_lobby)
	if current_lobby == nil then
		return new_lobby
	end

	local search_config = self._search_config

	return current_lobby
end
