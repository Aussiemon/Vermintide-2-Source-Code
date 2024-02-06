-- chunkname: @scripts/ui/dlc_morris/views/end_screen/deus_journey_presentation_ui.lua

require("scripts/ui/act_presentation/act_presentation_ui")

local definitions = local_require("scripts/ui/act_presentation/act_presentation_ui_definitions")

DeusJourneyPresentationUI = class(DeusJourneyPresentationUI, ActPresentationUI)

DeusJourneyPresentationUI.create_ui_elements = function (self)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.deus_widgets)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.deus_animations)
	self._animations = {}
end

DeusJourneyPresentationUI.start = function (self, journey_name, previous_completed_difficulty_index)
	self._presentation_aborted = nil
	self._journey_name = journey_name

	local journey_data = DeusJourneySettings[journey_name]
	local widgets_by_name = self._widgets_by_name

	self:_set_presentation_info(journey_data, journey_name)

	widgets_by_name.act_title.content.text = ""

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
		render_settings = self.render_settings,
	}

	self.animation_params = animation_params

	local animation_name = first_time_completed and "enter_first_time" or "enter"

	self:start_presentation_animation(animation_name, animation_params)

	self.active = true
end

DeusJourneyPresentationUI._set_presentation_info = function (self, journey_data, journey_name)
	local level_display_name = journey_data.display_name
	local level_image = journey_data.level_image
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.level.content.level_icon = level_image

	local backend = Managers.backend:get_interface("deus")
	local journey_cycle = backend:get_journey_cycle()
	local theme = journey_cycle.journey_data[journey_name].dominant_god
	local theme_settings = DeusThemeSettings[theme]

	widgets_by_name.level.content.theme_icon = theme_settings.text_icon
	widgets_by_name.level_title.content.text = Localize(level_display_name)
	widgets_by_name.level.style.purple_glow.color[1] = 0
end
