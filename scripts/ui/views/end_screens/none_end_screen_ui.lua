-- chunkname: @scripts/ui/views/end_screens/none_end_screen_ui.lua

require("scripts/ui/views/end_screens/base_end_screen_ui")

local definitions = local_require("scripts/ui/views/end_screens/none_end_screen_ui_definitions")

NoneEndScreenUI = class(NoneEndScreenUI, BaseEndScreenUI)

NoneEndScreenUI.init = function (self, ingame_ui_context, input_service, screen_context, params)
	NoneEndScreenUI.super.init(self, ingame_ui_context, input_service, definitions, params)
end

NoneEndScreenUI._start = function (self)
	self:_on_completed()
end
