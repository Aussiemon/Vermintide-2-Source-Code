GameTimerUI = class(GameTimerUI)

GameTimerUI.init = function (self, parent, ingame_ui_context)
	self._gui = ingame_ui_context.ui_renderer.gui
	self._visible = true
	self._enabled = Application.make_hash(Application.user_setting("enable_ingame_timer")) == "473df4ed7fa71691" and not Development.parameter("disable_ingame_timer")

	Managers.state.event:register(self, "start_game_time", "event_start_game_time")
end

GameTimerUI.destroy = function (self)
	Managers.state.event:unregister("start_game_time", self)
end

GameTimerUI.event_start_game_time = function (self, start_time)
	self._start_time = start_time
end

GameTimerUI.set_visible = function (self, visible)
	self._visible = visible
end

GameTimerUI.update = function (self)
	if not self._enabled or not self._visible then
		return
	end

	local start_time = self._start_time

	if start_time then
		local gui = self._gui
		local time = Managers.state.network:network_time() - start_time
		local text = string.format("%.2d:%.2d:%06.3f", time / 3600, (time / 60) % 60, time % 60)
		local screen_width, screen_height = Gui.resolution()
		local scale = math.min(screen_width / 1920, screen_height / 1080, 1)
		local font = "materials/fonts/arial"
		local font_size = 28 * scale
		local _, _, car = Gui.slug_text_extents(gui, text, font, font_size)

		Gui.slug_text(gui, text, font, font_size, Vector3(screen_width - scale * 14 * 13, screen_height - scale * 14, 1000), Color(255, 255, 255), "shadow", Color(0, 0, 0))
	end
end

return
