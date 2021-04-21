require("scripts/ui/act_presentation/act_presentation_ui")

DeusJourneyPresentationUI = class(DeusJourneyPresentationUI, ActPresentationUI)

DeusJourneyPresentationUI.start = function (self, journey_name, previous_completed_difficulty_index)
	self._presentation_aborted = nil
	local journey_data = DeusJourneySettings[journey_name]
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.level.content.icon = journey_data.level_image
	widgets_by_name.act_title.content.text = ""
	widgets_by_name.level_title.content.text = Localize(journey_data.display_name)
	local statistics_db = self.statistics_db
	local stats_id = self.stats_id
	local difficulty_complete_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name) or 0
	local first_time_completed = previous_completed_difficulty_index < difficulty_complete_index
	local widget_name = "level"
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	content.locked = first_time_completed
	local animation_params = {
		wwise_world = self.wwise_world,
		journey_name = journey_name,
		widget = self._widgets_by_name.level,
		first_time = first_time_completed,
		previous_difficulty_index = previous_completed_difficulty_index,
		difficulty_index = difficulty_complete_index,
		render_settings = self.render_settings
	}
	self.animation_params = animation_params
	local animation_name = (first_time_completed and "enter_first_time") or "enter"

	self:start_presentation_animation(animation_name, animation_params)

	self.active = true
end

return
