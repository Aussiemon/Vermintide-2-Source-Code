-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_custom_game_overview_console.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_custom_game_overview_console_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definition = definitions.selector_input_definition
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"

StartGameWindowCustomGameOverviewConsole = class(StartGameWindowCustomGameOverviewConsole)
StartGameWindowCustomGameOverviewConsole.NAME = "StartGameWindowCustomGameOverviewConsole"

StartGameWindowCustomGameOverviewConsole.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowCustomGameOverviewConsole")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._mechanism_name = Managers.mechanism:current_mechanism_name()

	local local_player = Managers.player:local_player()

	self._stats_id = local_player:stats_id()
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)

	self._input_index = params.input_index or 1

	self:_handle_new_selection(self._input_index)
	self:_update_mission_option()
	self:_update_difficulty_option()

	self._is_focused = false
	self._play_button_pressed = false
	self._previous_can_play = nil

	local is_online = not Managers.account:offline_mode()

	self._is_online = is_online

	if is_online then
		self._parent:change_generic_actions("default_custom_game")
	else
		self._parent:change_generic_actions("offline_custom_game")
	end

	self:_start_transition_animation("on_enter")
end

StartGameWindowCustomGameOverviewConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowCustomGameOverviewConsole._create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self._ui_scenegraph = ui_scenegraph

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

	self._ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowCustomGameOverviewConsole.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowCustomGameOverviewConsole")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end
end

StartGameWindowCustomGameOverviewConsole.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowCustomGameOverviewConsole.update = function (self, dt, t)
	self:_update_can_play()
	self:_update_animations(dt)

	if self._is_focused then
		self:_handle_input(dt, t)
	end

	self:_draw(dt)
end

StartGameWindowCustomGameOverviewConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowCustomGameOverviewConsole._update_can_play = function (self)
	local can_play = self:_can_play()

	if self._previous_can_play ~= can_play then
		self._previous_can_play = can_play

		local play_button = self._widgets_by_name.play_button

		play_button.content.button_hotspot.disable_button = not can_play
		play_button.content.disabled = not can_play

		if can_play then
			self._parent:set_input_description("play_available")
		else
			self._parent:set_input_description(nil)
		end
	end
end

StartGameWindowCustomGameOverviewConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowCustomGameOverviewConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowCustomGameOverviewConsole._handle_input = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()

	if input_service:get(SELECTION_INPUT) then
		self:_option_selected(self._input_index, t)
	end

	local input_index = self._input_index

	if input_service:get("move_down") then
		input_index = input_index + 1
	elseif input_service:get("move_up") then
		input_index = input_index - 1
	end

	if input_index ~= self._input_index then
		self:_handle_new_selection(input_index)
	end

	local widgets_by_name = self._widgets_by_name

	for i = 1, #selector_input_definition do
		local widget_name = selector_input_definition[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = widget.content.is_selected

		if not is_selected and self:_is_button_hover_enter(widget) then
			self:_handle_new_selection(i)
		end

		if self:_is_button_pressed(widget) then
			self:_option_selected(self._input_index, t)
		end
	end

	if self:_can_play() then
		if self:_is_button_hover_enter(widgets_by_name.play_button) then
			self._parent:play_sound("Play_hud_hover")
		end

		if input_service:get(START_GAME_INPUT) or self:_is_button_pressed(widgets_by_name.play_button) then
			self._play_button_pressed = true

			local custom_game_settings = parent:get_custom_game_settings(self._mechanism_name) or parent:get_custom_game_settings("adventure")

			parent:play(t, custom_game_settings.game_mode_type)
		end
	end

	local consume = true

	if input_service:get("right_stick_press", consume) and self._is_online then
		parent:set_window_input_focus("additional_settings")
	end
end

StartGameWindowCustomGameOverviewConsole._can_play = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()
	local selected_difficulty_key = parent:get_difficulty_option()
	local can_play = selected_level_id ~= nil and selected_difficulty_key ~= nil

	return can_play
end

StartGameWindowCustomGameOverviewConsole._update_mission_option = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()

	if not selected_level_id then
		return
	end

	local level_settings = LevelSettings[selected_level_id]
	local display_name = level_settings.display_name
	local icon_texture = level_settings.level_image
	local completed_difficulty_index = self._parent:get_completed_level_difficulty_index(self._statistics_db, self._stats_id, selected_level_id)
	local mission_widget = self._widgets_by_name.mission_setting

	mission_widget.content.input_text = Localize(display_name)
	mission_widget.content.icon_texture = icon_texture
	mission_widget.content.icon_frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
end

StartGameWindowCustomGameOverviewConsole._update_difficulty_option = function (self)
	local selected_difficulty_key = self._parent:get_difficulty_option()

	if selected_difficulty_key then
		local difficulty_settings = DifficultySettings[selected_difficulty_key]
		local difficulty_widget = self._widgets_by_name.difficulty_setting

		difficulty_widget.content.input_text = Localize(difficulty_settings.display_name)

		local display_image = difficulty_settings.display_image

		difficulty_widget.content.icon_texture = display_image

		local completed_frame_texture = difficulty_settings.completed_frame_texture

		difficulty_widget.content.icon_frame_texture = completed_frame_texture
	end
end

StartGameWindowCustomGameOverviewConsole._option_selected = function (self, input_index, t)
	local parent = self._parent
	local custom_game_settings = parent:get_custom_game_settings(self._mechanism_name) or parent:get_custom_game_settings("adventure")
	local selected_widget_name = selector_input_definition[input_index]

	if selected_widget_name == "mission_setting" then
		self._parent:set_layout_by_name(custom_game_settings.layout_name)
	elseif selected_widget_name == "difficulty_setting" then
		self._parent:set_layout_by_name("difficulty_selection_custom")
	elseif selected_widget_name == "play_button" then
		self._play_button_pressed = true

		self._parent:play(t, custom_game_settings.game_mode_type)
	else
		ferror("Unknown selector_input_definition: %s", selected_widget_name)
	end
end

StartGameWindowCustomGameOverviewConsole._handle_new_selection = function (self, input_index)
	local widgets_by_name = self._widgets_by_name
	local num_inputs = #selector_input_definition

	input_index = math.clamp(input_index, 1, num_inputs)

	local widget_name = selector_input_definition[input_index]
	local widget = widgets_by_name[widget_name]
	local widget_content = widget.content

	if widget_content.disabled then
		return
	end

	for i = 1, #selector_input_definition do
		local widget_name = selector_input_definition[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index

		widget.content.is_selected = is_selected
	end

	if self._input_index ~= input_index then
		self._parent:play_sound("play_gui_lobby_button_02_mission_act_click")
	end

	self._input_index = input_index
end

StartGameWindowCustomGameOverviewConsole._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_start_game_console_setting_button(widgets_by_name.mission_setting, dt)
	UIWidgetUtils.animate_start_game_console_setting_button(widgets_by_name.difficulty_setting, dt)
	UIWidgetUtils.animate_play_button(widgets_by_name.play_button, dt)
end

StartGameWindowCustomGameOverviewConsole._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end
