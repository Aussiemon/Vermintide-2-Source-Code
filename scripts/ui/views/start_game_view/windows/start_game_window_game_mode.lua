local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_game_mode_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowGameMode = class(StartGameWindowGameMode)
StartGameWindowGameMode.NAME = "StartGameWindowGameMode"

StartGameWindowGameMode.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowGameMode")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
end

StartGameWindowGameMode.create_ui_elements = function (self, params, offset)
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
	local game_mode_widgets = {}
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts
	local game_mode_option_spacing = 16

	for i = 1, #window_layouts, 1 do
		local settings = window_layouts[i]

		if self.parent:is_valid_game_mode_option(settings) then
			local scenegraph_id = "game_mode_option"
			local size = scenegraph_definition[scenegraph_id].size
			local display_name = settings.display_name or "n/a"
			local localize = settings.localize == nil or settings.localize

			if localize then
				display_name = Localize(display_name)
			end

			local icon_name = settings.icon_name
			local background_icon_name = settings.background_icon_name
			local dynamic_font_size = settings.dynamic_font_size
			local widget_definition = UIWidgets.create_window_category_button(scenegraph_id, size, display_name, icon_name, background_icon_name, dynamic_font_size)
			local widget = UIWidget.init(widget_definition)
			local current_game_mode_index = #game_mode_widgets + 1
			local layout_name = settings.name
			widget.content.layout_name = layout_name
			widget.offset[2] = -game_mode_option_spacing * current_game_mode_index - size[2] * (current_game_mode_index - 1)

			if layout_name == "twitch" then
				widget.content.disabled = not GameSettingsDevelopment.twitch_enabled or Managers.account:offline_mode()
			end

			game_mode_widgets[current_game_mode_index] = widget
		end
	end

	self._game_mode_widgets = game_mode_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowGameMode.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowGameMode")

	self.ui_animator = nil
end

StartGameWindowGameMode.update = function (self, dt, t)
	self:_update_selected_option()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowGameMode.post_update = function (self, dt, t)
	return
end

StartGameWindowGameMode._update_animations = function (self, dt)
	self:_update_game_options_hover_effect(dt)

	local ui_animations = self._ui_animations

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowGameMode._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowGameMode._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowGameMode._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StartGameWindowGameMode._handle_input = function (self, dt, t)
	local game_mode_widgets = self._game_mode_widgets

	for i = 1, #game_mode_widgets, 1 do
		local widget = game_mode_widgets[i]

		if self:_is_button_pressed(widget) and not self:_is_button_selected(widget) then
			local layout_name = widget.content.layout_name

			self.parent:set_layout_by_name(layout_name)

			PlayerData.mission_selection.start_layout = layout_name
		end
	end

	local widgets_by_name = self._widgets_by_name
	local lobby_browser_widget = widgets_by_name.lobby_browser_option

	if self:_is_button_pressed(lobby_browser_widget) then
		self.parent:set_layout_by_name("lobby_browser")
	end
end

StartGameWindowGameMode._update_game_options_hover_effect = function (self, dt)
	local game_mode_widgets = self._game_mode_widgets

	for i = 1, #game_mode_widgets, 1 do
		local widget = game_mode_widgets[i]

		UIWidgetUtils.animate_option_button(widget, dt)

		if self:_is_button_hover_enter(widget) and not self:_is_button_selected(widget) then
			self:_play_sound("play_gui_equipment_button_hover")
		end
	end

	local widgets_by_name = self._widgets_by_name
	local lobby_browser_widget = widgets_by_name.lobby_browser_option

	if self:_is_button_hover_enter(lobby_browser_widget) then
		self:_play_sound("play_gui_equipment_button_hover")
	end

	UIWidgetUtils.animate_default_button(lobby_browser_widget, dt)
end

StartGameWindowGameMode._set_selected_option = function (self, selected_layout_name)
	local game_mode_widgets = self._game_mode_widgets

	for i = 1, #game_mode_widgets, 1 do
		local widget = game_mode_widgets[i]
		local layout_name = widget.content.layout_name
		local is_selected = layout_name == selected_layout_name
		widget.content.button_hotspot.is_selected = is_selected
	end

	self._selected_layout_name = selected_layout_name
end

StartGameWindowGameMode._update_selected_option = function (self)
	local parent = self.parent
	local selected_layout_name = parent:get_selected_layout_name()

	if selected_layout_name ~= self._selected_layout_name then
		self:_set_selected_option(selected_layout_name)
	end
end

StartGameWindowGameMode.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in pairs(self._widgets_by_name) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local game_mode_widgets = self._game_mode_widgets

	for i = 1, #game_mode_widgets, 1 do
		local widget = game_mode_widgets[i]

		if not widget.content.disabled then
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowGameMode._play_sound = function (self, event)
	self.parent:play_sound(event)
end

return
