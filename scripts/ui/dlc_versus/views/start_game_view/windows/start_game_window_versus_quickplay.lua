-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_quickplay.lua

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_quickplay_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local animation_definitions = definitions.animation_definitions
local selector_input_definitions = definitions.selector_input_definitions
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"

StartGameWindowVersusQuickplay = class(StartGameWindowVersusQuickplay)
StartGameWindowVersusQuickplay.NAME = "StartGameWindowVersusQuickplay"

StartGameWindowVersusQuickplay.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowVersusQuickplay")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)

	self._input_index = params.input_index or 1

	self:_handle_new_selection(self._input_index)

	self._is_focused = false
	self._play_button_pressed = false
	self._previous_can_play = nil

	self._parent:change_generic_actions("versus_quickplay_default")
	self:_start_transition_animation("on_enter")
end

StartGameWindowVersusQuickplay._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowVersusQuickplay._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowVersusQuickplay.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowVersusQuickplay")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end
end

StartGameWindowVersusQuickplay.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowVersusQuickplay.update = function (self, dt, t)
	self:_update_can_play()
	self:_update_animations(dt)
	self:_handle_gamepad_activity()
	self:_handle_input(dt, t)
	self:_draw(dt)
end

StartGameWindowVersusQuickplay.post_update = function (self, dt, t)
	return
end

StartGameWindowVersusQuickplay._handle_gamepad_activity = function (self)
	local force_update = self.gamepad_active_last_frame == nil
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			self._input_index = 1

			local input_funcs = selector_input_definitions[self._input_index]

			if input_funcs and input_funcs.enter_requirements(self) then
				input_funcs.on_enter(self)
			end
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		local input_funcs = selector_input_definitions[self._input_index]

		input_funcs.on_exit(self)
	end
end

StartGameWindowVersusQuickplay._update_can_play = function (self)
	local can_play = self:_can_play()
	local play_button = self._widgets_by_name.play_button

	play_button.content.button_hotspot.disable_button = not can_play

	local eac_untrusted_disclaimer = self._widgets_by_name.eac_untrusted_disclaimer

	eac_untrusted_disclaimer.content.visible = not can_play

	local input_desc = "versus_quickplay_default"

	if can_play then
		input_desc = "versus_quickplay_play"
	end

	if input_desc ~= self._prev_input_desc then
		self._parent:set_input_description(input_desc)

		self._prev_input_desc = input_desc
	end
end

StartGameWindowVersusQuickplay._handle_input = function (self, dt, t)
	if not self._is_focused then
		return
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")
	local can_play = self:_can_play()

	if not mouse_active then
		local input_index = self._input_index
		local input_change

		if input_service:get("move_down") then
			input_index = input_index + 1
			input_change = 1
		elseif input_service:get("move_up") then
			input_index = input_index - 1
			input_change = -1
		else
			local input_funcs = selector_input_definitions[input_index]

			input_funcs.update(self, input_service, can_play, dt, t)
		end

		if input_index ~= self._input_index then
			self:_gamepad_selector_input_func(input_index, input_change)
		end

		if can_play and input_service:get(START_GAME_INPUT) then
			self._parent:play(t, "versus_quickplay")
		end
	else
		local widgets_by_name = self._widgets_by_name

		for i = 1, #selector_input_definitions do
			local widget_name = selector_input_definitions[i].widget_name
			local widget = widgets_by_name[widget_name]
			local is_selected = widget.content.is_selected

			if widget_name == "play_button" and self:_can_play() then
				if not is_selected and UIUtils.is_button_hover_enter(widgets_by_name.play_button) then
					self:_handle_new_selection(i)
					self:_play_sound("Play_hud_hover")
				end

				if UIUtils.is_button_pressed(widgets_by_name.play_button) then
					self:_option_selected(widget_name, "play_button", t)
				end
			end
		end
	end

	local consume = true

	if input_service:get("right_stick_press", consume) then
		parent:set_window_input_focus("versus_additional_quickplay_settings")
	end
end

StartGameWindowVersusQuickplay._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StartGameWindowVersusQuickplay._can_play = function (self)
	local local_player_peer_id = Managers.player:local_player():network_id()
	local is_player_alone_in_party, is_party_leader
	local party = Managers.party:get_local_player_party()
	local is_player_alone_in_party = party and party.num_used_slots == 1

	if DEDICATED_SERVER then
		is_party_leader = Managers.party:client_is_friend_party_leader(local_player_peer_id) or Managers.party:is_leader(local_player_peer_id)
	else
		is_party_leader = Managers.party:is_leader(local_player_peer_id) or self._ingame_ui_context.is_server
	end

	local can_play = (is_player_alone_in_party or is_party_leader) and not script_data.eac_untrusted

	return can_play
end

StartGameWindowVersusQuickplay._option_selected = function (self, widget_name, button_name, t)
	if widget_name == "play_button" then
		self._parent:play(t, "versus_quickplay")
	else
		ferror("Unknown selector_input_definition: %s", widget_name)
	end
end

StartGameWindowVersusQuickplay._verify_selection_index = function (self, input_index, input_change)
	local verified_index = self._input_index
	local num_inputs = #selector_input_definitions

	input_index = math.clamp(input_index, 1, num_inputs)

	if not input_change then
		return input_index
	end

	local input_funcs = selector_input_definitions[input_index]

	while input_funcs and input_index < num_inputs and not input_funcs.enter_requirements() do
		input_index = input_index + input_change
		input_funcs = selector_input_definitions[input_index]
	end

	if input_funcs and input_funcs.enter_requirements() then
		verified_index = input_index
	end

	return verified_index
end

StartGameWindowVersusQuickplay._gamepad_selector_input_func = function (self, input_index, input_change)
	local mouse_active = Managers.input:is_device_active("mouse")

	input_index = self:_verify_selection_index(input_index, input_change)

	if self._input_index ~= input_index and not mouse_active then
		self._parent:play_sound("play_gui_lobby_button_02_mission_act_click")

		if self._input_index then
			local input_funcs = selector_input_definitions[self._input_index]

			input_funcs.on_exit(self)
		end

		local input_funcs = selector_input_definitions[input_index]

		input_funcs.on_enter(self)
	end

	self._input_index = input_index
end

StartGameWindowVersusQuickplay._handle_new_selection = function (self, input_index, input_change)
	local num_inputs = #selector_input_definitions

	input_index = math.clamp(input_index, 1, num_inputs)

	local widgets_by_name = self._widgets_by_name

	for i = 1, #selector_input_definitions do
		local widget_name = selector_input_definitions[i].widget_name
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index

		widget.content.is_selected = is_selected
	end

	self._input_index = input_index
end

StartGameWindowVersusQuickplay._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	if not Managers.input:is_device_active("gamepad") then
		self:_update_button_animations(dt)
	end

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowVersusQuickplay._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name
end

StartGameWindowVersusQuickplay._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.end_pass(ui_top_renderer)
end
