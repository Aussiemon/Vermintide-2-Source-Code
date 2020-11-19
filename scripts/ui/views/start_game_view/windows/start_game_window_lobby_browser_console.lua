require("scripts/ui/views/lobby_browser_console_ui")
require("scripts/network/lobby_aux")

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions")
local input_delay_before_start_new_search = 0
local network_options = {
	project_hash = "bulldozer",
	config_file_name = "global",
	lobby_port = GameSettingsDevelopment.network_port,
	server_port = GameSettingsDevelopment.network_port,
	max_members = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
}
local GAME_MODE_LOOKUP_STRINGS = {
	weave = "lb_game_type_weave",
	deed = "lb_game_type_deed",
	event = "lb_game_type_event",
	custom = "lb_game_type_custom",
	demo = "lb_game_type_none",
	adventure = "lb_game_type_quick_play",
	tutorial = "lb_game_type_prologue",
	twitch = "lb_game_type_twitch",
	["n/a"] = "lb_game_type_none",
	any = "lobby_browser_mission"
}
local GAME_TYPES = {
	"adventure",
	"custom",
	"event",
	"weave",
	"any"
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
	local lobby_finder = LobbyFinder:new(network_options, MatchmakingSettings.MAX_NUM_LOBBIES, true)
	self._lobby_finder = lobby_finder
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

	if self._searching and not is_refreshing then
		self._searching = false

		self:_populate_lobby_list()
	end

	self._lobby_browser_console_ui:update(dt, t, self._searching)
end

StartGameWindowLobbyBrowserConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowLobbyBrowserConsole._is_refreshing = function (self)
	return self._lobby_finder:is_refreshing()
end

StartGameWindowLobbyBrowserConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowLobbyBrowserConsole.cancel_join_lobby = function (self, status_message)
	self.join_lobby_data_id = nil
end

StartGameWindowLobbyBrowserConsole._populate_lobby_list = function (self, auto_update)
	local lobbies = self:_get_lobbies()
	local ignore_scroll_reset = true
	local show_lobbies_index = self._selected_show_lobbies_index
	local show_filter = definitions.show_lobbies_table[show_lobbies_index] or "lb_show_all"
	local lobbies_to_present = {}
	local lobby_count = 0

	for _, lobby_data in pairs(lobbies) do
		local game_mode_id = lobby_data.game_mode

		if PLATFORM == "ps4" then
			game_mode_id = NetworkLookup.game_modes[game_mode_id]
		end

		if tonumber(game_mode_id) <= #NetworkLookup.game_modes then
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

StartGameWindowLobbyBrowserConsole._get_lobbies = function (self)
	local lobby_finder = self._lobby_finder

	return lobby_finder:lobbies() or empty_lobby_list
end

StartGameWindowLobbyBrowserConsole._valid_lobby = function (self, lobby_data)
	local is_valid = lobby_data.valid

	if not is_valid then
		return false
	end

	local is_server = lobby_data.server_info ~= nil

	if not is_server then
		local is_matchmaking = lobby_data.matchmaking and lobby_data.matchmaking ~= "false"
		local level_key = lobby_data.selected_level_key or lobby_data.level_key
		local difficulty = lobby_data.difficulty
		local num_players = tonumber(lobby_data.num_players)

		if not is_matchmaking or not level_key or not difficulty or num_players == MatchmakingSettings.MAX_NUMBER_OF_PLAYERS then
			return false
		end

		local player_manager = Managers.player
		local player = player_manager:local_player()
		local statistics_db = player_manager:statistics_db()
		local player_stats_id = player:stats_id()
		local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level_key)

		if not level_unlocked then
			return false
		end

		local profile_name = player:profile_display_name()
		local career_name = player:career_name()
		local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

		if not has_required_power_level then
			return false
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

StartGameWindowLobbyBrowserConsole._update_auto_refresh = function (self, dt)
	local lobby_list_update_timer = self._lobby_list_update_timer or MatchmakingSettings.TIME_BETWEEN_EACH_SEARCH

	if lobby_list_update_timer then
		lobby_list_update_timer = lobby_list_update_timer - dt

		if lobby_list_update_timer < 0 then
			self:_populate_lobby_list(true)
		else
			self._lobby_list_update_timer = lobby_list_update_timer
		end
	end
end

StartGameWindowLobbyBrowserConsole.reset_filters = function (self)
	self:set_level("any")
	self:set_difficulty("any")
	self:set_lobby_filter(((BUILD == "dev" or BUILD == "debug") and "lb_show_all") or "lb_show_joinable")
	self:set_distance_filter("map_zone_options_5")
	self:_search()
end

StartGameWindowLobbyBrowserConsole._create_filter_requirements = function (self)
	local lobby_finder = self._lobby_finder
	local game_mode_index = self.selected_game_mode_index
	local game_mode = GAME_TYPES[game_mode_index]
	local level_index = self._selected_level_index
	local levels_table = self:_get_levels()
	local level_key = levels_table[level_index]
	local difficulty_index = self._selected_difficulty_index
	local difficulty_table = self:_get_difficulties()
	local difficulty_key = difficulty_table[difficulty_index]
	local only_show_valid_lobbies = true
	local distance_index = self._selected_distance_index
	local distance_filter = LobbyAux.map_lobby_distance_filter[distance_index]
	local show_lobbies_index = self._selected_show_lobbies_index
	local only_show_joinable = definitions.show_lobbies_table[show_lobbies_index] == "lb_show_joinable"
	local free_slots = 1
	local requirements = {
		filters = {},
		near_filters = {},
		free_slots = free_slots,
		distance_filter = PLATFORM ~= "ps4" and distance_filter
	}

	if PLATFORM == "ps4" then
		local user_region = Managers.account:region()

		if distance_filter == "close" then
			requirements.filters.primary_region = {
				comparison = "equal",
				value = MatchmakingRegionLookup.primary[user_region] or MatchmakingRegionLookup.secondary[user_region] or "default"
			}
		elseif distance_filter == "medium" then
			requirements.filters.secondary_region = {
				comparison = "equal",
				value = MatchmakingRegionLookup.secondary[user_region] or MatchmakingRegionLookup.primary[user_region] or "default"
			}
		end
	end

	local eac_state = EAC.state()
	local eac_authorized = eac_state == "trusted"
	requirements.filters.eac_authorized = {
		comparison = "equal",
		value = (eac_authorized and "true") or "false"
	}

	if difficulty_key ~= "any" and difficulty_key then
		requirements.filters.difficulty = {
			comparison = "equal",
			value = difficulty_key
		}
	end

	if level_key ~= "any" and level_key then
		requirements.filters.selected_level_key = {
			comparison = "equal",
			value = level_key
		}
	end

	if game_mode ~= "any" and game_mode then
		requirements.filters.game_mode = {
			comparison = "equal",
			value = NetworkLookup.game_modes[game_mode]
		}
	end

	if only_show_valid_lobbies then
		requirements.filters.network_hash = {
			comparison = "equal",
			value = lobby_finder:network_hash()
		}
	end

	if only_show_joinable then
		requirements.filters.matchmaking = {
			value = "false",
			comparison = "not_equal"
		}
	end

	return requirements
end

StartGameWindowLobbyBrowserConsole._join = function (self, lobby_data, join_params)
	Managers.matchmaking:request_join_lobby(lobby_data, join_params)

	self.join_lobby_data_id = lobby_data.id
end

StartGameWindowLobbyBrowserConsole._search = function (self)
	local requirements = self:_create_filter_requirements()
	local lobby_finder = self._lobby_finder

	if PLATFORM == "win32" then
		local lobby_browser = lobby_finder:get_lobby_browser()

		LobbyInternal.clear_filter_requirements(lobby_browser)
	else
		LobbyInternal.clear_filter_requirements()
	end

	local force_refresh = true

	lobby_finder:add_filter_requirements(requirements, force_refresh)

	self._searching = true
end

StartGameWindowLobbyBrowserConsole._get_levels = function (self)
	local game_mode_data = self._game_mode_data
	local game_mode_index = self._selected_game_mode_index or 1
	local data = game_mode_data[game_mode_index]
	local levels = data.levels

	return levels
end

StartGameWindowLobbyBrowserConsole._get_difficulties = function (self)
	local game_mode_data = self._game_mode_data
	local game_mode_index = self._selected_game_mode_index or 1
	local data = game_mode_data[game_mode_index]
	local difficulties = data.difficulties

	return difficulties
end

StartGameWindowLobbyBrowserConsole.completed_level_difficulty_index = function (self, lobby_data)
	local level_key = lobby_data.selected_level_key
	local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(self._statistics_db, self._stats_id, level_key) or 0

	return completed_difficulty_index
end

StartGameWindowLobbyBrowserConsole.refresh = function (self)
	if not self._searching then
		self:_search()
	end
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
	local level_key = lobby_data.selected_level_key or lobby_data.level_key
	local difficulty = lobby_data.difficulty
	local num_players = tonumber(lobby_data.num_players)

	if Managers.matchmaking:is_game_matchmaking() then
		return false, "cannot_join_while_matchmaking"
	end

	if not level_key or not difficulty or level_key == "n/a" then
		return false, "dlc1_2_difficulty_unavailable"
	end

	if num_players == MatchmakingSettings.MAX_NUMBER_OF_PLAYERS then
		return false, "lobby_is_full"
	end

	local current_lobby = Managers.state.network:lobby()
	local host = current_lobby:lobby_host()

	if lobby_data.host == host then
		return false, "lobby_browser_own_server_error"
	end

	if lobby_data.is_private == "true" or lobby_data.matchmaking == "false" then
		return false, "not_searching_for_players"
	end

	if not lobby_data.valid then
		return false, "lobby_id_mismatch"
	end

	local statistics_db = self._statistics_db
	local player_stats_id = self._stats_id
	local profile_name = self._profile_name
	local career_name = self._career_name
	local required_dlcs = {}
	local weave_name = lobby_data.weave_name
	local difficulty = lobby_data.difficulty

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

	local game_mode_index = tonumber(lobby_data.game_mode)
	local game_mode_names = table.clone(NetworkLookup.game_modes, true)
	local game_mode = (PLATFORM == "ps4" and game_mode_index) or game_mode_names[game_mode_index]
	local game_mode_settings = GameModeSettings[game_mode]
	local weave_name = lobby_data.weave_name
	local quick_game = lobby_data.quick_game == "true"

	if game_mode_settings and game_mode_settings.required_dlc then
		required_dlcs[game_mode_settings.required_dlc] = true
	end

	for dlc_name, _ in pairs(required_dlcs) do
		if not Managers.unlock:is_dlc_unlocked(dlc_name) then
			return false, "dlc1_2_dlc_level_locked_tooltip"
		end
	end

	if game_mode_settings and game_mode_settings.extra_requirements_function and not game_mode_settings.extra_requirements_function() then
		return false, "game_mode_requirements_not_met"
	end

	if game_mode == "weave" then
		if weave_name ~= "false" and not quick_game then
			local ignore_dlc_check = false
			local weave_unlocked = LevelUnlockUtils.weave_unlocked(statistics_db, player_stats_id, weave_name, ignore_dlc_check) or weave_name == self._current_weave

			if not weave_unlocked then
				return false, "weave_not_unlocked"
			end
		end
	else
		local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, player_stats_id, level_key)

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

		local has_required_power_level = Managers.matchmaking:has_required_power_level(lobby_data, profile_name, career_name)

		if not has_required_power_level then
			return false, "difficulty_blocked_by_me"
		end
	end

	return true, "tutorial_no_text"
end

return
