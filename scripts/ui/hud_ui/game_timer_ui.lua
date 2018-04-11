local definitions = local_require("scripts/ui/hud_ui/game_timer_ui_definitions")
GameTimerUI = class(GameTimerUI)
GameTimerUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager

	self.create_ui_elements(self)

	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "start_game_time", "event_start_game_time")

	self._disabled = Development.parameter("disable_ingame_timer")

	return 
end
GameTimerUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.timer_text_box = UIWidget.init(definitions.widget_definitions.timer_text_box)
	self.timer_widget_content = self.timer_text_box.content

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	return 
end
GameTimerUI.event_start_game_time = function (self, start_time)
	self._start_time = start_time

	return 
end
GameTimerUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager.unregister(event_manager, "start_game_time", self)
	self.set_visible(self, false)

	return 
end
GameTimerUI.set_visible = function (self, visible)
	return 
end
GameTimerUI.update = function (self, dt)
	if self._disabled then
		return 
	end

	local start_time = self._start_time

	if start_time then
		local current_network_time = Managers.state.network:network_time()
		local time = current_network_time - start_time

		self.set_time(self, time)
		self.draw(self, dt)
	end

	return 
end
GameTimerUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.timer_text_box)
	UIRenderer.end_pass(ui_renderer)

	return 
end
GameTimerUI.set_time = function (self, time)
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d:%.2d", floor(time / 3600), floor(time / 60) % 60, floor(time) % 60)
	self.timer_widget_content.timer_text = timer_text

	return 
end

return 
