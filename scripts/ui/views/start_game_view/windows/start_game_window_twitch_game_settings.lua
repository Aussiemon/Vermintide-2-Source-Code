local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_twitch_game_settings_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = true
StartGameWindowTwitchGameSettings = class(StartGameWindowTwitchGameSettings)
StartGameWindowTwitchGameSettings.NAME = "StartGameWindowTwitchGameSettings"
StartGameWindowTwitchGameSettings.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowTwitchGameSettings")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self._player_manager = player_manager
	self._peer_id = ingame_ui_context.peer_id
	self._starting_privacy_option = self._parent:is_private_option_enabled()
	self._animations = {}
	self._offset = offset

	self._create_ui_elements(self, params, offset)
	self._update_private_option(self)
	self._update_difficulty_option(self)
	self._update_mission_selection(self)

	return 
end
StartGameWindowTwitchGameSettings._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
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

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	return 
end
StartGameWindowTwitchGameSettings.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowTwitchGameSettings")

	self._ui_animator = nil

	self._parent:set_private_option_enabled(self._starting_privacy_option)

	return 
end
StartGameWindowTwitchGameSettings.update = function (self, dt, t)
	script_data.twitch_settings = self

	if DO_RELOAD then
		DO_RELOAD = false

		self._create_ui_elements(self, nil, self._offset)
	end

	self._update_private_option(self)
	self._update_difficulty_option(self)
	self._update_mission_selection(self)
	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_connected(self)
	self._draw(self, dt)

	return 
end
StartGameWindowTwitchGameSettings._update_mission_selection = function (self)
	local parent = self._parent
	local selected_level_id = parent.get_selected_level_id(parent)

	if selected_level_id ~= self._selected_level_id then
		self._set_selected_level(self, selected_level_id)

		self._selected_level_id = selected_level_id

		if Managers.twitch:is_connected() then
			self._set_play_button_enabled(self, true)
		end
	elseif not selected_level_id then
		self._set_play_button_enabled(self, false)
	elseif not Managers.twitch:is_connected() then
		self._set_play_button_enabled(self, false)
	end

	return 
end
StartGameWindowTwitchGameSettings.post_update = function (self, dt, t)
	return 
end
StartGameWindowTwitchGameSettings._update_animations = function (self, dt)
	self._ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
StartGameWindowTwitchGameSettings._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowTwitchGameSettings._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end

	return 
end
StartGameWindowTwitchGameSettings._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local twitch_disable_privacy_option = Managers.twitch and Managers.twitch:is_connected()

	if not twitch_disable_privacy_option then
		local private_option_widget = widgets_by_name.private_option
		local private_option_content = private_option_widget.content
		private_option_content.is_disabled = false

		parent.set_private_option_enabled(parent, self._starting_privacy_option)
	else
		parent.set_private_option_enabled(parent, true)

		local private_option_widget = widgets_by_name.private_option
		local private_option_content = private_option_widget.content
		local private_option_style = private_option_widget.style
		private_option_content.is_disabled = true
	end

	if self._is_button_pressed(self, widgets_by_name.difficulty_button) then
		parent.set_layout(parent, 5)
	end

	if self._is_button_pressed(self, widgets_by_name.change_button) then
		parent.set_layout(parent, 6)
	end

	if self._is_button_pressed(self, widgets_by_name.play_button) then
		parent.play(parent, t)
	end

	return 
end
StartGameWindowTwitchGameSettings._update_connected = function (self)
	local widgets_by_name = self._widgets_by_name
	local is_connected = Managers.twitch:is_connected()
	widgets_by_name.change_button.content.button_hotspot.disable_button = not is_connected
	widgets_by_name.difficulty_button.content.button_hotspot.disable_button = not is_connected

	return 
end
StartGameWindowTwitchGameSettings._set_selected_level = function (self, level_id)
	local level_settings = LevelSettings[level_id]
	local display_name = level_settings.display_name
	local widget = self._widgets_by_name.mission_title
	widget.content.text = Localize(display_name)

	return 
end
StartGameWindowTwitchGameSettings._update_private_option = function (self)
	local parent = self._parent
	local private_enabled = parent.is_private_option_enabled(parent)

	if private_enabled ~= self._private_enabled then
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.private_option.content.checked = private_enabled
		self._private_enabled = private_enabled
	end

	return 
end
StartGameWindowTwitchGameSettings._update_difficulty_option = function (self)
	local parent = self._parent
	local difficulty_key = parent.get_difficulty_option(parent)

	if difficulty_key ~= self._difficulty_key then
		self._set_difficulty_option(self, difficulty_key)

		self._difficulty_key = difficulty_key
	end

	return 
end
StartGameWindowTwitchGameSettings._set_difficulty_option = function (self, difficulty_key)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.difficulty_title
	local difficulty_settings = DifficultySettings[difficulty_key]
	local display_name = difficulty_settings.display_name
	widget.content.text = Localize(display_name)

	return 
end
StartGameWindowTwitchGameSettings._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowTwitchGameSettings._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowTwitchGameSettings._play_sound = function (self, event)
	self._parent:play_sound(event)

	return 
end
StartGameWindowTwitchGameSettings._set_play_button_enabled = function (self, enabled)
	self._widgets_by_name.play_button.content.button_hotspot.disable_button = not enabled

	return 
end

return 
