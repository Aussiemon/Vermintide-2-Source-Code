-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_quickplay.lua

local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_quickplay_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local animation_definitions = definitions.animation_definitions
local selector_input_definitions = definitions.selector_input_definitions
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"

StartGameWindowDeusQuickplay = class(StartGameWindowDeusQuickplay)
StartGameWindowDeusQuickplay.NAME = "StartGameWindowDeusQuickplay"

StartGameWindowDeusQuickplay.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowDeusQuickplay")

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
	self:_set_expedition_text_highlight_offset(self._ui_renderer)

	self._input_index = params.input_index or 1

	self:_handle_new_selection(self._input_index)

	self._current_difficulty = self._parent:get_difficulty_option(true) or Managers.state.difficulty:get_difficulty()
	self._dlc_name = nil

	self:_update_difficulty_option(self._current_difficulty)

	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil

	self._parent:change_generic_actions("deus_default")
	self:_start_transition_animation("on_enter")
end

StartGameWindowDeusQuickplay._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowDeusQuickplay._create_ui_elements = function (self, params, offset)
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

	self._widgets_by_name.difficulty_info.content.visible = false
end

StartGameWindowDeusQuickplay.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowDeusQuickplay")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end

	self._parent:set_difficulty_option(self._current_difficulty)
end

StartGameWindowDeusQuickplay.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowDeusQuickplay.update = function (self, dt, t)
	self:_update_can_play()
	self:_update_animations(dt)
	self:_handle_gamepad_activity()
	self:_handle_input(dt, t)

	if RESOLUTION_LOOKUP.modified then
		self:_set_expedition_text_highlight_offset(self._ui_renderer)
	end

	self:_draw(dt)
end

StartGameWindowDeusQuickplay.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusQuickplay._handle_gamepad_activity = function (self)
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

StartGameWindowDeusQuickplay._update_can_play = function (self)
	local can_play = self:_can_play()
	local play_button = self._widgets_by_name.play_button

	play_button.content.button_hotspot.disable_button = not can_play

	local input_desc = "deus_default"

	if can_play then
		input_desc = "deus_default_play"
	elseif self._dlc_locked then
		input_desc = "deus_default_buy"
	end

	if input_desc ~= self._prev_input_desc then
		self._parent:set_input_description(input_desc)

		self._prev_input_desc = input_desc
	end
end

StartGameWindowDeusQuickplay._handle_input = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

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

			input_funcs.update(self, input_service, dt, t)
		end

		if input_index ~= self._input_index then
			self:_gamepad_selector_input_func(input_index, input_change)
		end

		local gamepad_confirm_pressed = input_service:get(SELECTION_INPUT, true)

		if gamepad_confirm_pressed and self._dlc_locked then
			Managers.unlock:open_dlc_page(self._dlc_name)
		end

		if self:_can_play() and input_service:get(START_GAME_INPUT) then
			local custom_game_settings = self._parent:get_quickplay_settings(self._mechanism_name) or self._parent:get_quickplay_settings("adventure")
			local game_mode_type = custom_game_settings.game_mode_type

			self._parent:set_difficulty_option(self._current_difficulty)

			self._play_button_pressed = true

			self._parent:play(t, game_mode_type)
		end
	else
		local widgets_by_name = self._widgets_by_name

		for i = 1, #selector_input_definitions do
			local widget_name = selector_input_definitions[i].widget_name
			local widget = widgets_by_name[widget_name]
			local is_selected = widget.content.is_selected

			if widget_name == "difficulty_stepper" then
				if not is_selected and UIUtils.is_button_hover_enter(widget, "left_arrow_hotspot") then
					self:_handle_new_selection(i)
					self:_play_sound("Play_hud_hover")
				end

				if not is_selected and UIUtils.is_button_hover_enter(widget, "right_arrow_hotspot") then
					self:_handle_new_selection(i)
					self:_play_sound("Play_hud_hover")
				end

				if UIUtils.is_button_hover(widget, "info_hotspot") or UIUtils.is_button_hover(self._widgets_by_name.difficulty_info, "widget_hotspot") or not mouse_active and is_selected then
					local widgets = {
						difficulty_info = self._widgets_by_name.difficulty_info,
						upsell_button = self._widgets_by_name.upsell_button,
					}

					if not self._diff_info_anim_played then
						self._diff_anim_id = self._ui_animator:start_animation("difficulty_info_enter", widgets, scenegraph_definition)
						self._diff_info_anim_played = true
					end

					self:_handle_difficulty_info(true)
				else
					if self._diff_anim_id then
						self._ui_animator:stop_animation(self._diff_anim_id)
					end

					self._diff_info_anim_played = false
					self._widgets_by_name.upsell_button.content.visible = false
					self._widgets_by_name.difficulty_info.content.visible = false

					self:_handle_difficulty_info(false)
				end

				if UIUtils.is_button_pressed(widget, "left_arrow_hotspot") or input_service:get("move_left") then
					self:_option_selected(widget_name, "left_arrow", t)
				elseif UIUtils.is_button_pressed(widget, "right_arrow_hotspot") or input_service:get("move_right") then
					self:_option_selected(widget_name, "right_arrow", t)
				end
			elseif widget_name == "play_button" and self:_can_play() then
				if not is_selected and UIUtils.is_button_hover_enter(widgets_by_name.play_button) then
					self:_handle_new_selection(i)
					self:_play_sound("Play_hud_hover")
				end

				if UIUtils.is_button_pressed(widgets_by_name.play_button) then
					self:_option_selected(widget_name, "play_button", t)
				end
			end
		end

		local upsell_button = self._widgets_by_name.upsell_button

		if UIUtils.is_button_pressed(upsell_button) then
			Managers.unlock:open_dlc_page(self._dlc_name)
		end
	end

	self:_update_gamemode_info_text(input_service)

	local consume = true

	if DLCSettings.quick_play_preferences and input_service:get("right_stick_press", consume) then
		parent:set_layout_by_name("adventure_level_preferences")
	end
end

StartGameWindowDeusQuickplay._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StartGameWindowDeusQuickplay._can_play = function (self)
	local selected_difficulty_key = self._current_difficulty

	return selected_difficulty_key ~= nil and not self._dlc_locked
end

StartGameWindowDeusQuickplay._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local chest_max_power_level = difficulty_settings.max_chest_power_level
	local selected_difficulty_info_widget = self._widgets_by_name.difficulty_info

	selected_difficulty_info_widget.content.difficulty_description = Localize(description)
	selected_difficulty_info_widget.content.highest_obtainable_level = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_power_level)
end

StartGameWindowDeusQuickplay._update_difficulty_option = function (self, difficulty_key)
	if difficulty_key then
		local difficulty_settings = DifficultySettings[difficulty_key]
		local difficulty_widget = self._widgets_by_name.difficulty_stepper

		difficulty_widget.content.selected_difficulty_text = Localize(difficulty_settings.display_name)

		local display_image = difficulty_settings.display_image

		difficulty_widget.content.difficulty_icon = display_image

		self:_set_info_window(difficulty_key)

		self._current_difficulty = difficulty_key
	end
end

StartGameWindowDeusQuickplay._option_selected = function (self, widget_name, button_name, t)
	if widget_name == "difficulty_stepper" then
		local difficulty_key = self._current_difficulty
		local difficulty_list = GameModeSettings.deus.difficulties
		local current_difficulty_index = table.find(difficulty_list, difficulty_key)
		local new_current_index = 0

		if button_name == "left_arrow" then
			if current_difficulty_index - 1 >= 1 then
				new_current_index = current_difficulty_index - 1

				self._parent:play_sound("hud_morris_start_menu_set")
			end
		elseif button_name == "right_arrow" and current_difficulty_index + 1 <= #difficulty_list then
			new_current_index = current_difficulty_index + 1

			self._parent:play_sound("hud_morris_start_menu_set")
		end

		self:_update_difficulty_option(difficulty_list[new_current_index])
	elseif widget_name == "play_button" then
		local custom_game_settings = self._parent:get_quickplay_settings(self._mechanism_name) or self._parent:get_quickplay_settings("adventure")
		local game_mode_type = custom_game_settings.game_mode_type

		self._parent:set_difficulty_option(self._current_difficulty)

		self._play_button_pressed = true

		self._parent:play(t, game_mode_type)
	else
		ferror("Unknown selector_input_definition: %s", widget_name)
	end
end

StartGameWindowDeusQuickplay._verify_selection_index = function (self, input_index, input_change)
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

StartGameWindowDeusQuickplay._gamepad_selector_input_func = function (self, input_index, input_change)
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

StartGameWindowDeusQuickplay._handle_new_selection = function (self, input_index, input_change)
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

StartGameWindowDeusQuickplay._update_animations = function (self, dt)
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

StartGameWindowDeusQuickplay._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.upsell_button, dt)
end

StartGameWindowDeusQuickplay._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowDeusQuickplay._update_difficulty_lock = function (self)
	local selected_difficulty_key = self._current_difficulty
	local difficulty_info_widget = self._widgets_by_name.difficulty_info
	local upsell_button = self._widgets_by_name.upsell_button

	if selected_difficulty_key then
		local approved, extra_requirement_failed, dlc_locked, below_power_level = self._parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			if extra_requirement_failed then
				difficulty_info_widget.content.should_show_diff_lock_text = true
				difficulty_info_widget.content.difficulty_lock_text = extra_requirement_failed and Localize(extra_requirement_failed) or ""
			else
				difficulty_info_widget.content.should_show_diff_lock_text = false
			end

			if dlc_locked then
				difficulty_info_widget.content.should_show_dlc_lock = true
				self._dlc_locked = dlc_locked
				self._dlc_name = dlc_locked
				upsell_button.content.visible = true
			else
				difficulty_info_widget.content.should_show_dlc_lock = false
				upsell_button.content.visible = false
				self._dlc_locked = nil
				self._dlc_name = nil
			end
		else
			difficulty_info_widget.content.should_show_dlc_lock = false
			difficulty_info_widget.content.should_show_diff_lock_text = false
			difficulty_info_widget.content.should_resize = false
			upsell_button.content.visible = false
			self._dlc_locked = nil
			self._dlc_name = nil
		end

		self._difficulty_approved = approved
	else
		difficulty_info_widget.content.should_show_dlc_lock = false
		upsell_button.content.visible = false
	end

	local widget_height = self:_calculate_difficulty_info_widget_size(difficulty_info_widget)
	local offset_y = (math.floor(widget_height) - scenegraph_definition.difficulty_info.size[2]) / 2

	self:_resize_difficulty_info({
		math.floor(scenegraph_definition.difficulty_info.size[1]),
		math.floor(widget_height),
	}, {
		0,
		-offset_y,
		1,
	})

	upsell_button.offset[2] = -math.floor(widget_height) / 2 + 24
end

StartGameWindowDeusQuickplay._handle_difficulty_info = function (self, show_widget)
	if show_widget then
		self:_update_difficulty_lock()
	end
end

StartGameWindowDeusQuickplay._calculate_difficulty_info_widget_size = function (self, diff_widget)
	local spacing = 20
	local description_text_style = diff_widget.style.difficulty_description
	local description_text = diff_widget.content.difficulty_description
	local description_text_height = UIUtils.get_text_height(self._ui_renderer, description_text_style.size, description_text_style, description_text)

	diff_widget.content.difficulty_description_text_size = description_text_height

	local chest_text_style = diff_widget.style.highest_obtainable_level
	local chest_text = diff_widget.content.highest_obtainable_level
	local chest_text_height = UIUtils.get_text_height(self._ui_renderer, chest_text_style.size, chest_text_style, chest_text) + spacing
	local difficulty_lock_text_style = diff_widget.style.difficulty_lock_text
	local difficulty_lock_text = diff_widget.content.difficulty_lock_text
	local difficulty_lock_text_height = 0

	if diff_widget.content.should_show_diff_lock_text then
		difficulty_lock_text_height = UIUtils.get_text_height(self._ui_renderer, difficulty_lock_text_style.size, difficulty_lock_text_style, difficulty_lock_text) + spacing
		diff_widget.content.difficulty_lock_text_height = difficulty_lock_text_height
	end

	local dlc_lock_text_style = diff_widget.style.dlc_lock_text
	local dlc_lock_text = diff_widget.content.dlc_lock_text
	local dlc_lock_text_height = 0

	if diff_widget.content.should_show_dlc_lock then
		dlc_lock_text_height = UIUtils.get_text_height(self._ui_renderer, dlc_lock_text_style.size, dlc_lock_text_style, dlc_lock_text) + spacing
	end

	local widget_height = chest_text_height + description_text_height + difficulty_lock_text_height + dlc_lock_text_height + 50

	return widget_height
end

StartGameWindowDeusQuickplay._resize_difficulty_info = function (self, new_size, new_offset)
	local difficulty_info_widget = self._widgets_by_name.difficulty_info

	difficulty_info_widget.content.should_resize = true
	difficulty_info_widget.content.resize_size = new_size
	difficulty_info_widget.content.resize_offset = new_offset
	difficulty_info_widget.style.widget_hotspot.size = new_size
	difficulty_info_widget.style.widget_hotspot.offset = new_offset
end

StartGameWindowDeusQuickplay._update_gamemode_info_text = function (self, input_service)
	local gamemode_infobox_widget = self._widgets_by_name.quickplay_gamemode_info_box

	if input_service:get("trigger_cycle_next") and not gamemode_infobox_widget.content.is_showing_info then
		self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

		gamemode_infobox_widget.content.is_showing_info = true
	elseif input_service:get("trigger_cycle_next") and gamemode_infobox_widget.content.is_showing_info then
		self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

		gamemode_infobox_widget.content.is_showing_info = false
	end

	if UIUtils.is_button_pressed(gamemode_infobox_widget, "info_hotspot") then
		if not gamemode_infobox_widget.content.is_showing_info then
			self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

			gamemode_infobox_widget.content.is_showing_info = true
		else
			self._ui_animator:start_animation("gamemode_text_swap", gamemode_infobox_widget, scenegraph_definition)

			gamemode_infobox_widget.content.is_showing_info = false
		end
	end
end

StartGameWindowDeusQuickplay._handle_difficulty_stepper_gamepad = function (self, widget, input_service, t)
	local anim_params = {}

	if input_service:get("move_left") and widget.content.is_selected then
		self:_option_selected(self._input_index, "left_arrow", t)

		widget.content.left_arrow_pressed = true
		anim_params.left_key = widget.style.left_arrow_gamepad_highlight

		if self._arrow_anim_id then
			self._ui_animator:stop_animation(self._arrow_anim_id)

			widget.style.right_arrow_gamepad_highlight.color[1] = 0
		end

		local anim_id = self._ui_animator:start_animation("left_arrow_flick", widget, scenegraph_definition, anim_params)

		self._arrow_anim_id = anim_id
	elseif input_service:get("move_right") and widget.content.is_selected then
		self:_option_selected(self._input_index, "right_arrow", t)

		widget.content.right_arrow_pressed = true
		anim_params.right_key = widget.style.right_arrow_gamepad_highlight

		if self._arrow_anim_id then
			self._ui_animator:stop_animation(self._arrow_anim_id)

			widget.style.left_arrow_gamepad_highlight.color[1] = 0
		end

		local anim_id = self._ui_animator:start_animation("right_arrow_flick", widget, scenegraph_definition, anim_params)

		self._arrow_anim_id = anim_id
	end
end

StartGameWindowDeusQuickplay._set_expedition_text_highlight_offset = function (self, ui_renderer)
	local game_mode_info_box = self._widgets_by_name.quickplay_gamemode_info_box
	local text = game_mode_info_box.content.game_mode_text
	local expedition_text_style = game_mode_info_box.style.expedition_highlight_text
	local expedition_word = Utf8.lower(Localize("expedition_highlight_text"))
	local index_start = string.find(text, expedition_word, 1, true)

	if index_start then
		local prefix = string.sub(text, 1, index_start - 1)
		local split_text_length = UIUtils.get_text_width(ui_renderer, game_mode_info_box.style.game_mode_text, prefix)
		local new_offset = 25 + split_text_length

		game_mode_info_box.content.expedition_highlight_text = expedition_word
		expedition_text_style.offset[1] = new_offset
	else
		game_mode_info_box.content.expedition_highlight_text = ""
	end
end
