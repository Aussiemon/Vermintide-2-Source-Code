-- chunkname: @scripts/ui/views/level_end/states/end_view_state_summary_vs.lua

require("scripts/ui/views/level_end/states/end_view_state_summary")

EndViewStateSummaryVS = class(EndViewStateSummaryVS, EndViewStateSummary)
EndViewStateSummaryVS.NAME = "EndViewStateSummaryVS"

EndViewStateSummaryVS.on_enter = function (self, params)
	self.super.on_enter(self, params)
end

EndViewStateSummaryVS._get_definitions = function (self)
	return local_require("scripts/ui/views/level_end/states/definitions/end_view_state_summary_deus_definitions")
end
