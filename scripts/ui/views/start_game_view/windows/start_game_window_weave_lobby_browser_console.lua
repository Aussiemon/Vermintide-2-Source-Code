local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_lobby_browser_console_definitions")
StartGameWindowWeaveLobbyBrowserConsole = class(StartGameWindowWeaveLobbyBrowserConsole, StartGameWindowLobbyBrowserConsole)
StartGameWindowWeaveLobbyBrowserConsole.NAME = "StartGameWindowWeaveLobbyBrowserConsole"
local network_options = {
	project_hash = "bulldozer",
	config_file_name = "global",
	lobby_port = GameSettingsDevelopment.network_port,
	server_port = GameSettingsDevelopment.network_port,
	max_members = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
}

StartGameWindowWeaveLobbyBrowserConsole.on_enter = function (self, params, offset)
	print("[StartGameWindowWeaveLobbyBrowserConsole] Enter Substate StartGameWindowWeaveLobbyBrowserConsole")

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

	self:reset_filters("weave")
	Managers.matchmaking:set_active_lobby_browser(self)
	self:_populate_lobby_list()
	self:change_generic_actions("default_lobby_browser")
	self:set_input_description(nil)
	Managers.account:get_friends(2000, callback(self, "cb_friends_collected"))
end

return
