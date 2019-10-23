local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_find_group_console_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definition = definitions.selector_input_definition
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"
StartGameWindowWeaveFindGroupConsole = class(StartGameWindowWeaveFindGroupConsole)
StartGameWindowWeaveFindGroupConsole.NAME = "StartGameWindowWeaveFindGroupConsole"

StartGameWindowWeaveFindGroupConsole.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowWeaveFindGroupConsole")

	self._parent = params.parent
	self._params = params
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._is_server = ingame_ui_context.is_server
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)

	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil

	self._parent:change_generic_actions("default_weave_find_group")
	self._parent:set_input_description(nil)
	self:_start_transition_animation("on_enter")
end

StartGameWindowWeaveFindGroupConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowWeaveFindGroupConsole._create_ui_elements = function (self, params, offset)
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

	self:_setup_input_buttons()
end

StartGameWindowWeaveFindGroupConsole._setup_input_buttons = function (self)
	local input_service = self._parent:window_input_service()
	local start_game_input_data = UISettings.get_gamepad_input_texture_data(input_service, START_GAME_INPUT, true)
	local widgets_by_name = self._widgets_by_name
	local play_button_console = widgets_by_name.play_button_console
	local input_texture_style = play_button_console.style.input_texture
	input_texture_style.horizontal_alignment = "center"
	input_texture_style.vertical_alignment = "center"
	input_texture_style.texture_size = {
		start_game_input_data.size[1],
		start_game_input_data.size[2]
	}
	play_button_console.content.input_texture = start_game_input_data.texture
end

StartGameWindowWeaveFindGroupConsole.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowWeaveFindGroupConsole")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end
end

StartGameWindowWeaveFindGroupConsole.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowWeaveFindGroupConsole.update = function (self, dt, t)
	self:_update_can_play(dt, t)
	self:_update_animations(dt, t)
	self:_handle_input(dt, t)
	self:_handle_gamepad_activity()
	self:_draw(dt, t)
end

StartGameWindowWeaveFindGroupConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveFindGroupConsole._update_can_play = function (self)
	local can_play = self:_can_play()
	local is_matchmaking = Managers.matchmaking:is_game_matchmaking()

	if self._previous_can_play ~= can_play or is_matchmaking ~= self._previous_is_matchmaking then
		self._previous_can_play = can_play
		self._previous_is_matchmaking = is_matchmaking
		local play_button = self._widgets_by_name.play_button
		local play_button_console = self._widgets_by_name.play_button_console

		if is_matchmaking then
			play_button.content.text = Localize("cancel_matchmaking")
			play_button_console.content.text = Localize("cancel_matchmaking")

			if self._is_server then
				play_button.content.button_hotspot.disable_button = false
				play_button_console.content.locked = false
			else
				play_button.content.button_hotspot.disable_button = true
				play_button_console.content.locked = true
			end
		else
			play_button_console.content.locked = not can_play
			play_button_console.content.text = (can_play and Localize("lb_search")) or Localize("start_game_window_weave_group_is_full")
			play_button.content.button_hotspot.disable_button = not can_play
			play_button.content.text = (can_play and Localize("lb_search")) or Localize("start_game_window_weave_group_is_full")
		end

		if is_matchmaking then
			if self._is_server then
				self._parent:set_input_description("cancel_matchmaking")
			else
				self._parent:set_input_description(nil)
			end
		elseif can_play then
			self._parent:set_input_description("search_available")
		else
			self._parent:set_input_description(nil)
		end
	end
end

StartGameWindowWeaveFindGroupConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowWeaveFindGroupConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowWeaveFindGroupConsole._handle_input = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local is_matchmaking = Managers.matchmaking:is_game_matchmaking()

	if is_matchmaking then
		if self:_is_button_hover_enter(self._widgets_by_name.play_button) then
			self._parent:play_sound("Play_hud_hover")
		end

		if self._is_server and (input_service:get(START_GAME_INPUT) or self:_is_button_pressed(self._widgets_by_name.play_button)) then
			Managers.matchmaking:cancel_matchmaking()
		end
	elseif self:_can_play() then
		if self:_is_button_hover_enter(self._widgets_by_name.play_button) then
			self._parent:play_sound("Play_hud_hover")
		end

		if input_service:get(START_GAME_INPUT) or self:_is_button_pressed(self._widgets_by_name.play_button) then
			self._play_button_pressed = true
			local force_close_menu = true

			self._parent:play(t, "weave_find_group", force_close_menu)
		end
	end
end

StartGameWindowWeaveFindGroupConsole._can_play = function (self)
	local lobby = Managers.state.network:lobby()
	local lobby_members = lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members
	local can_play = #members < 4

	return can_play
end

StartGameWindowWeaveFindGroupConsole._update_animations = function (self, dt)
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

	UIWidgetUtils.animate_play_button(widgets_by_name.play_button, dt)
end

StartGameWindowWeaveFindGroupConsole._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowWeaveFindGroupConsole._handle_gamepad_activity = function (self)
	local force_update = self.gamepad_active_last_frame == nil
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name
			widgets_by_name.play_button.content.visible = false
			widgets_by_name.play_button_console.content.visible = true
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.play_button.content.visible = true
		widgets_by_name.play_button_console.content.visible = false
	end
end

return
