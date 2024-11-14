-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_panel.lua

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_panel_definitions")

StartGameWindowVersusPanel = class(StartGameWindowVersusPanel, StartGameWindowPanelConsole)

StartGameWindowVersusPanel._create_ui_elements = function (self, _, params, offset)
	return StartGameWindowVersusPanel.super._create_ui_elements(self, definitions, params, offset)
end
