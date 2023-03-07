require("scripts/ui/views/end_screens/base_end_screen_ui")

local definitions = local_require("scripts/ui/views/end_screens/defeat_end_screen_ui_definitions")
DefeatEndScreenUI = class(DefeatEndScreenUI, BaseEndScreenUI)

DefeatEndScreenUI.init = function (self, ingame_ui_context, input_service, screen_context)
	DefeatEndScreenUI.super.init(self, ingame_ui_context, input_service, definitions)
	self:_play_sound("play_gui_splash_defeat")
end

DefeatEndScreenUI._start = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	local params = {
		draw_flags = self._draw_flags,
		wwise_world = self._wwise_world
	}
	self._defeat_anim_id = self._ui_animator:start_animation("defeat", self._widgets_by_name, scenegraph_definition, params)
end

DefeatEndScreenUI._update = function (self, dt)
	if self._completed then
		return
	end

	if self._defeat_anim_id and self._ui_animator:is_animation_completed(self._defeat_anim_id) then
		self._defeat_anim_id = nil
	end

	if self._defeat_anim_id == nil then
		self:_on_completed()
	end
end
