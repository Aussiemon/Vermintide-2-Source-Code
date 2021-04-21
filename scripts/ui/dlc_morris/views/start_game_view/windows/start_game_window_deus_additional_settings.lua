StartGameWindowDeusAdditionalSettings = class(StartGameWindowDeusAdditionalSettings, StartGameWindowAdditionalSettingsConsole)
StartGameWindowDeusAdditionalSettings.NAME = "StartGameWindowDeusAdditionalSettings"
local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_additional_settings_definitions")

StartGameWindowDeusAdditionalSettings.create_ui_elements = function (self, _, params, offset)
	StartGameWindowDeusAdditionalSettings.super.create_ui_elements(self, definitions, params, offset)
end

return
