-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_lobby_browser.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions")

StartGameWindowVersusLobbyBrowser = class(StartGameWindowVersusLobbyBrowser, StartGameWindowLobbyBrowserConsole)
StartGameWindowVersusLobbyBrowser.NAME = "StartGameWindowVersusLobbyBrowser"

local network_options = {
	config_file_name = "global",
	project_hash = "bulldozer",
	lobby_port = GameSettingsDevelopment.network_port,
	server_port = GameSettingsDevelopment.network_port,
	max_members = MatchmakingSettingsOverrides.versus.MAX_NUMBER_OF_PLAYERS,
}

StartGameWindowVersusLobbyBrowser.on_enter = function (self, params, offset)
	print("[StartGameWindowVersusLobbyBrowser] Enter Substate StartGameWindowVersusLobbyBrowser")

	self._max_num_members = MatchmakingSettingsOverrides.versus.MAX_NUMBER_OF_PLAYERS
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

	local ignore_dlc_check = false

	self._current_weave = LevelUnlockUtils.current_weave(self._statistics_db, self._stats_id, ignore_dlc_check)
	self._game_mode_data = definitions.setup_game_mode_data(self._statistics_db, self._stats_id)
	self._lobby_browser_console_ui = LobbyBrowserConsoleUI:new(self, ingame_ui_context, self._game_mode_data, definitions.show_lobbies_table, definitions.distance_table)

	self:reset_filters("versus")
	Managers.matchmaking:set_active_lobby_browser(self)
	self:_populate_lobby_list()
	self:change_generic_actions("default_lobby_browser")
	self:set_input_description(nil)
	Managers.account:get_friends(2000, callback(self, "cb_friends_collected"))
end

StartGameWindowVersusLobbyBrowser._join = function (self, lobby_data, join_params)
	Managers.matchmaking:request_join_lobby(lobby_data, join_params)

	self.join_lobby_data_id = lobby_data.id

	self._parent:set_layout_by_name("versus_player_hosted_lobby")
end

StartGameWindowVersusLobbyBrowser.is_lobby_joinable = function (self, lobby_data)
	if not Managers.player.is_server then
		return false, "matchmaking_promotion_popup_no_wom_title"
	end

	return StartGameWindowVersusLobbyBrowser.super.is_lobby_joinable(self, lobby_data)
end

StartGameWindowVersusLobbyBrowser.update = function (self, dt, t)
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
