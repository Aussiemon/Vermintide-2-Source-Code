local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_event_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
StartGameWindowEvent = class(StartGameWindowEvent)
StartGameWindowEvent.NAME = "StartGameWindowEvent"

StartGameWindowEvent.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowEvent")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}

	self:_create_ui_elements(params, offset)
	self._parent:set_play_button_enabled(true)
end

StartGameWindowEvent._create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.ui_scenegraph = ui_scenegraph
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self:_setup_content_from_backend()
end

StartGameWindowEvent._setup_content_from_backend = function (self)
	local widgets_by_name = self._widgets_by_name
	local live_event_interface = Managers.backend:get_interface("live_events")
	local game_mode_data = live_event_interface:get_game_mode_data()
	local title_text_id = game_mode_data.title_text_id
	local event_title_widget = widgets_by_name.event_title
	event_title_widget.content.text = Localize(title_text_id)
	local description_text_id = game_mode_data.description_text_id
	local description_text_widget = widgets_by_name.description_text
	description_text_widget.content.text = Localize(description_text_id)
	local icon_id = game_mode_data.icon_id
	local event_texture_widget = widgets_by_name.event_texture
	local reference_name = "event_mode_texture"
	local texture_name = game_mode_data.image_id or "event_default_ui_art"
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
	local material_name = self._parent:setup_backend_image_material(gui, reference_name, texture_name)

	if material_name then
		event_texture_widget.content.texture_id = material_name
	else
		event_texture_widget.content.texture_id = icon_id
	end
end

StartGameWindowEvent.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowEvent")
end

StartGameWindowEvent.update = function (self, dt, t)
	self:_draw(dt)
end

StartGameWindowEvent.post_update = function (self, dt, t)
	return
end

StartGameWindowEvent._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

return
