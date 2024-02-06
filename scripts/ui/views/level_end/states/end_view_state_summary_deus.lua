-- chunkname: @scripts/ui/views/level_end/states/end_view_state_summary_deus.lua

require("scripts/ui/views/level_end/states/end_view_state_summary")

EndViewStateSummaryDeus = class(EndViewStateSummaryDeus, EndViewStateSummary)
EndViewStateSummaryDeus.NAME = "EndViewStateSummaryDeus"

EndViewStateSummaryDeus.on_enter = function (self, params)
	self.super.on_enter(self, params)

	local summary_title = self._widgets_by_name.summary_title

	summary_title.content.text = Localize("expedition_summary")

	if self.game_won then
		local deus_progress_reset_text = self._widgets_by_name.deus_progress_reset_text

		deus_progress_reset_text.content.visible = false
	end

	local deus_backend = Managers.backend:get_interface("deus")
	local coin_count = deus_backend:get_rolled_over_soft_currency() or 0

	self._widgets_by_name.coins_retained_total_text.content.coin_count_text = string.format("%d", coin_count)
end

EndViewStateSummaryDeus._get_definitions = function (self)
	return local_require("scripts/ui/views/level_end/states/definitions/end_view_state_summary_deus_definitions")
end
