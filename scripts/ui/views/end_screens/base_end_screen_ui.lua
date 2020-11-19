BaseEndScreenUI = class(BaseEndScreenUI)

BaseEndScreenUI.init = function (self, ingame_ui_context, input_service, definitions)
	self._ui_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui_context = ingame_ui_context
	local world_manager = ingame_ui_context.world_manager
	local world = world_manager:world("level_world")
	self._wwise_world = world_manager:wwise_world(world)
	self._input_service = input_service
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._draw_flags = {
		alpha_multiplier = 0
	}
	self._started = false
	self._completed = false

	self:_create_ui_elements(definitions)
end

BaseEndScreenUI.destroy = function (self)
	self:_destroy()
end

BaseEndScreenUI.on_fade_in = function (self)
	self:_on_fade_in()
end

BaseEndScreenUI._on_fade_in = function (self)
	return
end

BaseEndScreenUI._start = function (self)
	return
end

BaseEndScreenUI._update = function (self, dt)
	return
end

BaseEndScreenUI._destroy = function (self)
	return
end

BaseEndScreenUI._draw_widgets = function (self, render_settings)
	return
end

BaseEndScreenUI._on_completed = function (self)
	self._completed = true
end

BaseEndScreenUI.completed = function (self)
	return self._completed
end

BaseEndScreenUI._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

BaseEndScreenUI._create_ui_elements = function (self, definitions)
	local scenegraph_definition = definitions.scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	local widgets = {}
	local widgets_by_name = {}

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local animation_definitions = definitions.animation_definitions
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

BaseEndScreenUI.start = function (self)
	self._started = true

	self:_start()
end

BaseEndScreenUI.started = function (self)
	return self._started
end

BaseEndScreenUI.update = function (self, dt)
	if not self._started then
		return
	end

	self._ui_animator:update(dt)
	self:_update(dt)
end

BaseEndScreenUI.draw = function (self, dt)
	if not self._started then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_service
	local render_settings = self._render_settings
	local draw_flags = self._draw_flags
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	render_settings.alpha_multiplier = draw_flags.alpha_multiplier or 0
	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	self:_draw_widgets(ui_renderer, render_settings)

	render_settings.alpha_multiplier = 1

	UIRenderer.end_pass(ui_renderer)
end

return
