local definitions = local_require("scripts/ui/hud_ui/game_timer_ui_definitions")
GameTimerUI = class(GameTimerUI)
GameTimerUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager

	self.create_ui_elements(self)
	rawset(_G, "game_timer_ui", self)

	return 
end
GameTimerUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.timer_text_box = UIWidget.init(definitions.widget_definitions.timer_text_box)
	self.timer_background = UIWidget.init(definitions.widget_definitions.timer_background)
	self.timer_widget_content = self.timer_text_box.content

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	return 
end
GameTimerUI.destroy = function (self)
	self.set_visible(self, false)
	rawset(_G, "game_timer_ui", nil)

	return 
end
GameTimerUI.set_visible = function (self, visible)
	UIRenderer.set_element_visible(self.ui_renderer, self.timer_background.element, visible)

	return 
end
GameTimerUI.update = function (self, dt, survival_mission_data)
	local resolution_modified = RESOLUTION_LOOKUP.modified
	local is_dirty = false

	if resolution_modified then
		is_dirty = true
		self.timer_background.element.dirty = true
	end

	local start_time = survival_mission_data.start_time
	local current_network_time = Managers.state.network:network_time()
	local time = current_network_time - start_time

	self.set_time(self, time)
	self.draw(self, dt)

	return 
end
GameTimerUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.timer_text_box)
	UIRenderer.draw_widget(ui_renderer, self.timer_background)
	UIRenderer.end_pass(ui_renderer)

	return 
end
GameTimerUI.set_time = function (self, time)
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d:%.2d", floor(time/3600), floor(time/60)%60, floor(time)%60)
	self.timer_widget_content.timer_text = timer_text

	return 
end

return 
