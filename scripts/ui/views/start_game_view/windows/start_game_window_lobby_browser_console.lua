-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_lobby_browser_console.lua

require("scripts/ui/views/lobby_browser_console_ui")
require("scripts/network/lobby_aux")

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions")
local input_delay_before_start_new_search = 0
local network_options = {
	config_file_name = "global",
	project_hash = "bulldozer",
	lobby_port = GameSettingsDevelopment.network_port,
	server_port = GameSettingsDevelopment.network_port,
	max_members = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS,
}
local GAME_MODE_LOOKUP_STRINGS = {
	adventure = "lb_game_type_quick_play",
	any = "lobby_browser_mission",
	custom = "lb_game_type_custom",
	deed = "lb_game_type_deed",
	demo = "lb_game_type_none",
	event = "lb_game_type_event",
	["n/a"] = "lb_game_type_none",
	tutorial = "lb_game_type_prologue",
	twitch = "lb_game_type_twitch",
	weave = "lb_game_type_weave",
}
local GAME_TYPE_LOOKUP_STRINGS = {
	adventure = "area_selection_campaign",
	any = "lobby_browser_mission",
	deus = "area_selection_morris_name",
	versus = "vs_ui_versus_tag",
	weave = "menu_weave_area_no_wom_title",
}

StartGameWindowLobbyBrowserConsole = class(StartGameWindowLobbyBrowserConsole)
StartGameWindowLobbyBrowserConsole.NAME = "StartGameWindowLobbyBrowserConsole"

StartGameWindowLobbyBrowserConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowLobbyBrowserConsole")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._statistics_db = ingame_ui_context.statistics_db

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._profile_name = local_player:profile_display_name()
	self._career_name = local_player:career_name()
	self._stats_id = local_player:stats_id()
	self._friend_names = {}

	local lobby_finder = LobbyFinder:new(network_options, MatchmakingSettings.MAX_NUM_LOBBIES, IS_WINDOWS and true)

	self._lobby_finder = lobby_finder
	self._max_num_members = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS

	local ignore_dlc_check = false

	self._current_weave = LevelUnlockUtils.current_weave(self._statistics_db, self._stats_id, ignore_dlc_check)
	self._game_mode_data = definitions.setup_game_mode_data(self._statistics_db, self._stats_id)
	self._lobby_browser_console_ui = LobbyBrowserConsoleUI:new(self, ingame_ui_context, self._game_mode_data, definitions.show_lobbies_table, definitions.distance_table)

	self:reset_filters()
	Managers.matchmaking:set_active_lobby_browser(self)
	self:_populate_lobby_list()
	self:change_generic_actions("default_lobby_browser")
	self:set_input_description(nil)
	Managers.account:get_friends(2000, callback(self, "cb_friends_collected"))
end

StartGameWindowLobbyBrowserConsole.get_selected_game_mode_index = function (self)
	local game_modes = self._game_mode_data.game_modes

	return self._selected_game_mode_index or game_modes.adventure
end

local EMPTY_DATA = {}

StartGameWindowLobbyBrowserConsole.cb_friends_collected = function (self, friend_data)
	table.clear(self._friend_names)

	local friend_data = friend_data or EMPTY_DATA

	for account_id, data in pairs(friend_data) do
		self._friend_names[data.name] = true
	end
end

StartGameWindowLobbyBrowserConsole.change_generic_actions = function (self, input_actions)
	self._parent:change_generic_actions(input_actions)
end

StartGameWindowLobbyBrowserConsole.set_input_description = function (self, input_actions)
	self._parent:set_input_description(input_actions)
end

StartGameWindowLobbyBrowserConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowLobbyBrowserConsole")
	Managers.matchmaking:set_active_lobby_browser(nil)
	self:set_input_description(nil)
	self._lobby_finder:destroy()

	self._lobby_finder = nil
end

StartGameWindowLobbyBrowserConsole.disable_input = function (self, input_name)
	return input_name == "show_gamercard"
end

StartGameWindowLobbyBrowserConsole.update = function (self, dt, t)
	self._lobby_finder:update(dt)

	local is_refreshing = self:_is_refreshing()

	if not is_refreshing then
		if self._do_populate then
			self:_populate_lobby_list()
		end

		self._searching = false
		self._do_populate = false
	end

	self:_update_auto_refresh(dt)
	self._lobby_browser_console_ui:update(dt, t, self._searching and self._do_populate)
end

StartGameWindowLobbyBrowserConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowLobbyBrowserConsole._is_refreshing = function (self)
	local is_refreshing = self._lobby_finder:is_refreshing()

	return is_refreshing
end

StartGameWindowLobbyBrowserConsole.play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowLobbyBrowserConsole.cancel_join_lobby = function (self, status_message)
	self.join_lobby_data_id = nil
end

StartGameWindowLobbyBrowserConsole._populate_lobby_list = function (self, auto_update)
	local lobbies = self:get_lobbies()
	local ignore_scroll_reset = true
	local show_lobbies_index = self._selected_show_lobbies_index
	local show_filter = definitions.show_lobbies_table[show_lobbies_index] or "lb_show_all"
	local lobbies_to_present = {}
	local lobby_count = 0

	for _, lobby_data in pairs(lobbies) do
		local matchmaking_type_id = lobby_data.matchmaking_type

		if IS_PS4 then
			matchmaking_type_id = NetworkLookup.matchmaking_types[matchmaking_type_id]
		end

		if tonumber(matchmaking_type_id) <= #NetworkLookup.matchmaking_types then
			if show_filter == "lb_show_joinable" then
				if self:_valid_lobby(lobby_data) then
					lobby_count = lobby_count + 1
					lobbies_to_present[lobby_count] = lobby_data
				end
			elseif show_filter == "lb_search_type_friends" then
				if self:_is_friend_lobby(lobby_data) then
					lobby_count = lobby_count + 1
					lobbies_to_present[lobby_count] = lobby_data
				end
			else
				lobby_count = lobby_count + 1
				lobbies_to_present[lobby_count] = lobby_data
			end
		end
	end

	self._lobby_list_update_timer = nil

	self._lobby_browser_console_ui:populate_lobby_list(lobbies_to_present, ignore_scroll_reset)
end

local empty_lobby_list = {}

StartGameWindowLobbyBrowserConsole.get_lobbies = function (self)
	local lobby_finder = self._lobby_finder
	local lobbies = lobby_finder:lobbies() or empty_lobby_list

	return lobbies
end

local REQUIRED_DLCS = {}

StartGameWindowLobbyBrowserConsole._valid_lobby = function (self, lobby_data)
	local is_valid = lobby_data.valid

	if not is_valid then
		return false
	end

	table.clear(REQUIRED_DLCS)

	local is_server = lobby_data.server_info ~= nil

	if not is_server then
		local is_matchmaking = lobby_data.matchmaking and lobby_data.matchmaking ~= "false"
		local mission_id = lobby_data.selected_mission_id or lobby_data.mission_id
		local difficulty = lobby_data.difficulty
		local matchmaking_types_index = tonumber(lobby_data.matchmaking_type)
		local matchmaking_type = IS_PS4 and lobby_data.matchmaking_type or NetworkLookup.matchmaking_types[matchmaking_types_index]
		local num_players = tonumber(lobby_data.num_players)
		local quick_play = lobby_data.quick_play
		local mechanism = lobby_data.mechanism

		if not is_matchmaking or not mission_id or not difficulty or num_players == self._max_num_members then
			return false
		end

		if difficulty and mechanism ~= "weave" then
			local difficulty_settings = DifficultySettings[difficulty]

			if difficulty_settings.extra_requirement_name then
				local extra_requirement = ExtraDifficultyRequirements[difficulty_settings.extra_requirement_name]

				if not Development.parameter("unlock_all_difficulties") and not extra_requirement.requirement_function() then
					return false
				end
			end

			if difficulty_settings.dlc_requirement then
				REQUIRED_DLCS[difficulty_settings.dlc_requirement] = true
			end
		end

		local player_manager = Managers.player
		local player = player_manager:local_player()
		local statistics_db = player_manager:statistics_db()
		local player_stats_id = player:stats_id()
		local level_key = mission_id
		local mechanism_settings = MechanismSettings[mechanism]

		if mechanism_settings and mechanism_settings.required_dlc then
			REQUIRED_DLCS[mechanism_settings.required_dlc] = true
		end

		for dlc_name, _ in pairs(REQUIRED_DLCS) do
			if not Managers.unlock:is_dlc_unlocked(dlc_name) then
				return false
			end
		end

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[mission_id]

			level_key = weave_template and weave_template.objectives[1].level_id or level_key
		end

		local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level_key)

		if not level_unlocked then
			return false
		end

		if mechanism ~= "weave" then
			local private_game = MatchmakingManager.is_lobby_private(lobby_data)

			if not private_game then
				local profile_name = player:profile_display_name()
				local career_name = player:career_name()
				local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

				if not has_required_power_level then
					return false
				end
			end
		end
	elseif is_server then
		local wanted_server_name = self._current_server_name

		if wanted_server_name ~= "" and string.find(lobby_data.server_info.name, wanted_server_name) == nil then
			return false
		end
	else
		ferror("Sanity check")
	end

	return true
end

StartGameWindowLobbyBrowserConsole._is_friend_lobby = function (self, lobby_data)
	local name = lobby_data.name

	print(name, self._friend_names[name])

	return self._friend_names[name] ~= nil
end

StartGameWindowLobbyBrowserConsole.input_service = function (self)
	return self._parent:window_input_service()
end

StartGameWindowLobbyBrowserConsole.dirty = function (self)
	local dirty = self._dirty

	self._dirty = false

	return dirty
end

StartGameWindowLobbyBrowserConsole._update_auto_refresh = function (self, dt)
	local is_refreshing = self:_is_refreshing()
	local lobby_list_update_timer = self._lobby_list_update_timer or MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH

	if lobby_list_update_timer then
		lobby_list_update_timer = lobby_list_update_timer - dt

		if lobby_list_update_timer < 0 and not is_refreshing then
			self._lobby_list_update_timer = MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH

			local skip_populate = true

			self:_search(skip_populate)
		else
			self._lobby_list_update_timer = lobby_list_update_timer
		end
	end

	if self._was_refreshing and not is_refreshing then
		self._dirty = true
	end

	self._was_refreshing = is_refreshing
end

StartGameWindowLobbyBrowserConsole.reset_filters = function (self, selected_game_mode, selected_level, selected_difficulty, selected_filter, selected_distance)
	self:set_level(selected_level or "any")
	self:set_difficulty(selected_difficulty or "any")
	self:set_lobby_filter(selected_filter or (BUILD == "dev" or BUILD == "debug") and "lb_show_all" or "lb_show_joinable")
	self:set_distance_filter(selected_distance or "map_zone_options_5")
	self:set_game_mode(selected_game_mode or "any")
	self:_search()
end

StartGameWindowLobbyBrowserConsole._create_filter_requirements = function (self)
	local lobby_finder = self._lobby_finder
	local game_mode_index = self._selected_game_mode_index
	local mechanism = self._game_mode_data.game_modes[self._selected_game_mode_index] or "any"
	local level_index = self._selected_level_index
	local levels_table = self:_get_levels()
	local level_key = levels_table[level_index]
	local difficulty_index = self._selected_difficulty_index
	local difficulty_table = self:_get_difficulties()
	local difficulty_key = difficulty_table[difficulty_index]
	local only_show_valid_lobbies = not script_data.show_invalid_lobbies
	local distance_index = self._selected_distance_index
	local distance_filter = LobbyAux.map_lobby_distance_filter[distance_index]
	local show_lobbies_index = self._selected_show_lobbies_index
	local only_show_joinable = definitions.show_lobbies_table[show_lobbies_index] == "lb_show_joinable"
	local free_slots = 1
	local requirements = {
		filters = {},
		near_filters = {},
		free_slots = free_slots,
		distance_filter = not IS_PS4 and distance_filter,
	}

	if IS_PS4 then
		local user_region = Managers.account:region()

		if distance_filter == "close" then
			requirements.filters.primary_region = {
				comparison = "equal",
				value = MatchmakingRegionLookup.primary[user_region] or MatchmakingRegionLookup.secondary[user_region] or "default",
			}
		elseif distance_filter == "medium" then
			requirements.filters.secondary_region = {
				comparison = "equal",
				value = MatchmakingRegionLookup.secondary[user_region] or MatchmakingRegionLookup.primary[user_region] or "default",
			}
		end
	end

	local eac_authorized = Managers.eac:is_trusted()

	requirements.filters.eac_authorized = {
		comparison = "equal",
		value = eac_authorized and "true" or "false",
	}

	if difficulty_key ~= "any" and difficulty_key then
		requirements.filters.difficulty = {
			comparison = "equal",
			value = difficulty_key,
		}
	end

	if level_key ~= "any" and level_key then
		requirements.filters.selected_mission_id = {
			comparison = "equal",
			value = level_key,
		}
	end

	if mechanism ~= "any" and mechanism then
		requirements.filters.mechanism = {
			comparison = "equal",
			value = mechanism,
		}
	end

	if only_show_valid_lobbies then
		requirements.filters.network_hash = {
			comparison = "equal",
			value = lobby_finder:network_hash(),
		}
	end

	if only_show_joinable then
		requirements.filters.matchmaking = {
			comparison = "not_equal",
			value = "false",
		}
	end

	return requirements
end

StartGameWindowLobbyBrowserConsole._join = function (self, lobby_data, join_params)
	Managers.matchmaking:request_join_lobby(lobby_data, join_params)

	self.join_lobby_data_id = lobby_data.id
end

StartGameWindowLobbyBrowserConsole._search = function (self, skip_populate)
	local requirements = self:_create_filter_requirements()
	local lobby_finder = self._lobby_finder

	if IS_WINDOWS then
		local lobby_browser = lobby_finder:get_lobby_browser()

		LobbyInternal.clear_filter_requirements(lobby_browser)
	else
		LobbyInternal.clear_filter_requirements()
	end

	local force_refresh = true

	lobby_finder:add_filter_requirements(requirements, force_refresh)

	self._searching = true
	self._do_populate = not skip_populate
end

StartGameWindowLobbyBrowserConsole._get_game_modes = function (self)
	local game_mode_data = self._game_mode_data
	local game_modes = game_mode_data.game_modes

	return game_modes
end

StartGameWindowLobbyBrowserConsole._get_levels = function (self)
	local game_mode_data = self._game_mode_data
	local game_modes = game_mode_data.game_modes
	local game_mode_index = self._selected_game_mode_index or game_modes.adventure
	local data = game_mode_data[game_mode_index]
	local levels = data.levels

	return levels
end

StartGameWindowLobbyBrowserConsole._get_difficulties = function (self)
	local game_mode_data = self._game_mode_data
	local game_modes = game_mode_data.game_modes
	local game_mode_index = self._selected_game_mode_index or game_modes.adventure
	local data = game_mode_data[game_mode_index] or game_mode_data[1]
	local difficulties = data.difficulties

	return difficulties
end

StartGameWindowLobbyBrowserConsole.completed_level_difficulty_index = function (self, lobby_data)
	local level_key = lobby_data.selected_mission_id
	local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(self._statistics_db, self._stats_id, level_key) or 0

	return completed_difficulty_index
end

StartGameWindowLobbyBrowserConsole.refresh = function (self)
	if not self:_is_refreshing() then
		self:_search()
	end
end

StartGameWindowLobbyBrowserConsole.set_game_mode = function (self, game_mode)
	local game_modes_table = self:_get_game_modes()
	local new_index = table.find(game_modes_table, game_mode)
	local game_mode_display_name = "lobby_browser_mission"
	local game_mode = game_modes_table[new_index]

	if game_mode and game_mode ~= "any" then
		game_mode_display_name = GAME_TYPE_LOOKUP_STRINGS[game_mode]
	end

	self._selected_game_mode_index = new_index
	self._search_timer = input_delay_before_start_new_search
	self._do_populate = true

	self:set_level("any")
	self._lobby_browser_console_ui:set_game_type_filter(Localize(game_mode_display_name))
	self._lobby_browser_console_ui:setup_filter_entries()
end

StartGameWindowLobbyBrowserConsole.set_level = function (self, level)
	local levels_table = self:_get_levels()
	local new_index = table.find(levels_table, level)
	local level_display_name = "lobby_browser_mission"
	local level = levels_table[new_index]

	if level ~= "any" then
		local level_setting = LevelSettings[level]

		level_display_name = level_setting.display_name
	end

	self._selected_level_index = new_index
	self._search_timer = input_delay_before_start_new_search

	self._lobby_browser_console_ui:set_level_filter(Localize(level_display_name))
end

StartGameWindowLobbyBrowserConsole.set_difficulty = function (self, difficulty)
	local difficulties_table = self:_get_difficulties()
	local new_index = table.find(difficulties_table, difficulty)
	local difficulty_display_name = "lobby_browser_difficulty"
	local difficulty = difficulties_table[new_index]

	if difficulty ~= "any" then
		local difficulty_setting = DifficultySettings[difficulty]

		difficulty_display_name = difficulty_setting.display_name
	end

	self._selected_difficulty_index = new_index
	self._search_timer = input_delay_before_start_new_search

	self._lobby_browser_console_ui:set_difficulty_filter(Localize(difficulty_display_name))
end

StartGameWindowLobbyBrowserConsole.set_lobby_filter = function (self, lobby_filter)
	local show_lobbies_table = definitions.show_lobbies_table
	local new_index = table.find(show_lobbies_table, lobby_filter)
	local show_lobbies_text = show_lobbies_table[new_index]

	self._selected_show_lobbies_index = new_index
	self._search_timer = input_delay_before_start_new_search

	self._lobby_browser_console_ui:set_show_lobbies_filter(Localize(show_lobbies_text))
end

StartGameWindowLobbyBrowserConsole.set_distance_filter = function (self, distance)
	local distance_table = definitions.distance_table
	local new_index = table.find(distance_table, distance)
	local distance_text = distance_table[new_index]

	self._selected_distance_index = new_index
	self._search_timer = input_delay_before_start_new_search

	self._lobby_browser_console_ui:set_distance_filter(Localize(distance_text))
end

StartGameWindowLobbyBrowserConsole.is_lobby_joinable = function (self, lobby_data)
	local mission_id = lobby_data.selected_mission_id or lobby_data.mission_id
	local difficulty = lobby_data.difficulty
	local num_players = tonumber(lobby_data.num_players)
	local mechanism = lobby_data.mechanism
	local matchmaking_settings = Managers.matchmaking.get_matchmaking_settings_for_mechanism(mechanism)

	if Managers.matchmaking:is_game_matchmaking() then
		return false, "cannot_join_while_matchmaking"
	end

	if not mission_id or not difficulty or mission_id == "n/a" then
		return false, "dlc1_2_difficulty_unavailable"
	end

	if num_players == matchmaking_settings.MAX_NUMBER_OF_PLAYERS then
		return false, "lobby_is_full"
	end

	local current_lobby = Managers.state.network:lobby()
	local host = current_lobby:lobby_host()

	if lobby_data.host == host then
		return false, "lobby_browser_own_server_error"
	end

	if MatchmakingManager.is_lobby_private(lobby_data) or lobby_data.matchmaking == "false" then
		return false, "not_searching_for_players"
	end

	if not lobby_data.valid then
		return false, "lobby_id_mismatch"
	end

	if Managers.matchmaking:is_matchmaking_paused() then
		return false, "painting_none_name"
	end

	local statistics_db = self._statistics_db
	local player_stats_id = self._stats_id
	local profile_name = self._profile_name
	local career_name = self._career_name
	local required_dlcs = {}
	local quick_game = lobby_data.quick_game == "true"
	local mechanism_settings = MechanismSettings[mechanism]
	local difficulty_lock_reason

	if mechanism == "weave" then
		if mission_id ~= "false" and not quick_game then
			local weave_name = mission_id
			local ignore_dlc_check = false
			local weave_unlocked = LevelUnlockUtils.weave_unlocked(statistics_db, player_stats_id, weave_name, ignore_dlc_check) or weave_name == self._current_weave

			if not weave_unlocked then
				return false, "weave_not_unlocked"
			end
		end
	elseif mechanism == "deus" and DeusJourneySettings[mission_id] then
		local unlocked_journeys = LevelUnlockUtils.unlocked_journeys(statistics_db, player_stats_id)
		local journey_unlocked = table.find(unlocked_journeys, mission_id)

		if not journey_unlocked then
			return false, "start_game_level_locked"
		end

		if difficulty then
			local difficulty_settings = DifficultySettings[difficulty]

			if difficulty_settings.extra_requirement_name then
				local extra_requirement = ExtraDifficultyRequirements[difficulty_settings.extra_requirement_name]

				if not Development.parameter("unlock_all_difficulties") and not extra_requirement.requirement_function() then
					return false, "difficulty_requirements_not_met"
				end
			end

			if difficulty_settings.dlc_requirement then
				required_dlcs[difficulty_settings.dlc_requirement] = true
			end
		end
	elseif mechanism == "versus" then
		if not quick_game and Managers.mechanism:current_mechanism_name() ~= "versus" then
			return false, "vs_player_hosted_lobby_wrong_mechanism_error"
		end
	else
		local level_key = mission_id
		local level_unlocked = level_key == "any" or LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level_key)

		if not level_unlocked then
			local settings = LevelSettings[level_key]
			local dlc_name = settings.dlc_name

			if dlc_name then
				local is_unlocked = Managers.unlock:is_dlc_unlocked(dlc_name)

				if not is_unlocked then
					return false, "dlc1_2_dlc_level_locked_tooltip"
				else
					return false, "start_game_level_locked"
				end
			else
				return false, "start_game_level_locked"
			end
		end

		if mechanism_settings and mechanism_settings.extra_requirements_function and not mechanism_settings.extra_requirements_function() then
			return false, "game_mode_requirements_not_met"
		end

		if mechanism ~= "deus" then
			local private_game = MatchmakingManager.is_lobby_private(lobby_data)

			if not private_game then
				local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

				if not has_required_power_level then
					return false, "difficulty_blocked_by_me"
				end
			end
		end

		if difficulty then
			local difficulty_settings = DifficultySettings[difficulty]

			if difficulty_settings.extra_requirement_name then
				local extra_requirement = ExtraDifficultyRequirements[difficulty_settings.extra_requirement_name]

				if not Development.parameter("unlock_all_difficulties") and not extra_requirement.requirement_function() then
					difficulty_lock_reason = "difficulty_requirements_not_met"
				end
			end

			if difficulty_settings.dlc_requirement then
				required_dlcs[difficulty_settings.dlc_requirement] = true
			end
		end
	end

	if mechanism_settings and mechanism_settings.required_dlc then
		required_dlcs[mechanism_settings.required_dlc] = true
	end

	for dlc_name, _ in pairs(required_dlcs) do
		if not Managers.unlock:is_dlc_unlocked(dlc_name) then
			return false, "dlc1_2_dlc_level_locked_tooltip"
		end
	end

	if difficulty_lock_reason then
		return false, difficulty_lock_reason
	end

	return true, "tutorial_no_text"
end
