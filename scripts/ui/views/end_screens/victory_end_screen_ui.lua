require("scripts/ui/views/end_screens/base_end_screen_ui")
require("scripts/ui/act_presentation/act_presentation_ui")

local definitions = local_require("scripts/ui/views/end_screens/victory_end_screen_ui_definitions")
VictoryEndScreenUI = class(VictoryEndScreenUI, BaseEndScreenUI)

VictoryEndScreenUI.init = function (self, ingame_ui_context, input_service, screen_context)
	VictoryEndScreenUI.super.init(self, ingame_ui_context, input_service, definitions)
	fassert(screen_context.show_act_presentation ~= nil, "show_act_presentation not set.")

	if screen_context.show_act_presentation then
		fassert(screen_context.level_key, "No level_key set in screen_context")

		self._level_key = screen_context.level_key

		fassert(screen_context.previous_completed_difficulty_index, "No previous_completed_difficulty_index set in screen_context")

		self._previous_completed_difficulty_index = screen_context.previous_completed_difficulty_index
		self._act_presentation_ui = ActPresentationUI:new(ingame_ui_context)
	end

	self:_play_sound("play_gui_splash_victory")
end

VictoryEndScreenUI._destroy = function (self)
	if self._act_presentation_ui then
		self._act_presentation_ui:destroy()

		self._act_presentation_ui = nil
	end
end

VictoryEndScreenUI._start = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	local params = {
		draw_flags = self._draw_flags,
		wwise_world = self._wwise_world
	}
	self._victory_anim_id = self._ui_animator:start_animation("victory", self._widgets_by_name, scenegraph_definition, params)

	if self._act_presentation_ui then
		self._act_presentation_ui:start(self._level_key, self._previous_completed_difficulty_index)
	end
end

VictoryEndScreenUI._update = function (self, dt)
	if self._completed then
		return
	end

	if self._victory_anim_id and self._ui_animator:is_animation_completed(self._victory_anim_id) then
		self._victory_anim_id = nil
	end

	local act_presentation_ui = self._act_presentation_ui

	if act_presentation_ui and act_presentation_ui.active then
		act_presentation_ui:update(dt)
	end

	local act_presentation_done = not act_presentation_ui or act_presentation_ui:presentation_completed()

	if self._victory_anim_id == nil and act_presentation_done then
		self:_on_completed()
	end
end
