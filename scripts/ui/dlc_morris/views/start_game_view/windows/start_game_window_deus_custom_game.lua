local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_custom_game_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local selection_widget_definitions = definitions.selection_widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definitions = definitions.selector_input_definitions
StartGameWindowDeusCustomGame = class(StartGameWindowDeusCustomGame)
StartGameWindowDeusCustomGame.NAME = "StartGameWindowDeusCustomGame"
local START_GAME_INPUT = "refresh_press"

StartGameWindowDeusCustomGame.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowDeusCustomGame")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._mechanism_name = Managers.mechanism:current_mechanism_name()
	local local_player = Managers.player:local_player()
	self._stats_id = local_player:stats_id()
	self._expeditions_selection_index = 1
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._is_focused = false
	self._play_button_pressed = false
	self._previous_can_play = nil
	self._is_offline = Managers.account:offline_mode()
	self._animations = {}
	self._dlc_name = nil
	self._current_difficulty = self._parent:get_difficulty_option(true) or Managers.state.difficulty:get_difficulty()
	self._backend_deus = Managers.backend:get_interface("deus")

	self:_create_ui_elements(params, offset)
	self:_set_expedition_text_highlight_offset(self._ui_renderer)
	self:_gamepad_selector_input_func(params.input_index or 1)
	self:_update_expedition_option()
	self:_update_difficulty_option(self._current_difficulty)
	self:_update_can_play()

	if self._is_offline then
		self._parent:change_generic_actions("default_deus_custom_game_offline")
	else
		self._parent:change_generic_actions("default_deus_custom_game")
	end

	self:_start_transition_animation("on_enter")
	Managers.state.event:register(self, "_update_additional_curse_frame", "_update_additional_curse_frame")
end

StartGameWindowDeusCustomGame._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

local function is_journey_cycle_expired(journey_cycle, current_time)
	return journey_cycle.remaining_time - (current_time - journey_cycle.time_of_update) < 0
end

StartGameWindowDeusCustomGame._create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_scenegraph = ui_scenegraph
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._selection_widgets, self._selection_widgets_by_name = UIUtils.create_widgets(selection_widget_definitions)

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._widgets_by_name.difficulty_info.content.visible = false
	self._widgets_by_name.upsell_button.content.visible = false

	self:_gather_unlocked_journeys()
	self:_setup_journey_widgets()
	self:_refresh_journey_cycle()
end

StartGameWindowDeusCustomGame.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowDeusCustomGame")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end

	self._parent:set_difficulty_option(self._current_difficulty)
	Managers.state.event:unregister("_update_additional_curse_frame", self)
end

StartGameWindowDeusCustomGame.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowDeusCustomGame.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusCustomGame._can_play = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()
	local can_play = selected_level_id ~= nil and not self._dlc_locked

	return can_play
end

StartGameWindowDeusCustomGame._update_can_play = function (self)
	local can_play = self:_can_play()
	local play_button = self._selection_widgets_by_name.play_button
	play_button.content.button_hotspot.disable_button = not can_play
	local input_desc = (self._is_offline and "default_deus_custom_game_offline") or "default_deus_custom_game"

	if can_play then
		if self._is_offline then
			input_desc = "default_deus_custom_game_offline_play"
		else
			input_desc = "default_deus_custom_game_play"
		end
	elseif self._dlc_locked then
		if self._is_offline then
			input_desc = "default_deus_custom_game_offline_buy"
		else
			input_desc = "default_deus_custom_game_buy"
		end
	end

	if input_desc ~= self._prev_input_desc then
		self._parent:set_input_description(input_desc)

		self._prev_input_desc = input_desc
	end
end

StartGameWindowDeusCustomGame._gather_unlocked_journeys = function (self)
	local unlocked_journeys = {}

	for _, journey_name in ipairs(LevelUnlockUtils.unlocked_journeys(self._statistics_db, self._stats_id)) do
		unlocked_journeys[journey_name] = true
	end

	self._unlocked_journeys = unlocked_journeys
end

StartGameWindowDeusCustomGame._setup_journey_widgets = function (self)
	local node_widgets = self._node_widgets
	local statistics_db = self._statistics_db
	local stats_id = self._stats_id
	local unlocked_journeys = self._unlocked_journeys
	local expedition_widgets = {}
	local journey_position_x = -365
	local settings = definitions.journey_widget_settings
	local available_journey_order = AvailableJourneyOrder

	for i = 1, #available_journey_order, 1 do
		local journey_name = AvailableJourneyOrder[i]
		local with_belakor = self._backend_deus:deus_journey_with_belakor(journey_name)
		local journey_data = DeusJourneySettings[journey_name]
		local index = #expedition_widgets + 1
		local next_journey = available_journey_order[index + 1]
		local widget_data = UIWidgets.create_expedition_widget_func("level_root_node", index, journey_data, journey_name)
		local widget = UIWidget.init(widget_data)
		local content = widget.content
		content.text = Localize(journey_data.display_name)
		local width_to_next_journey = settings.width + settings.spacing_x
		journey_position_x = journey_position_x + width_to_next_journey
		local offset = widget.offset
		offset[1] = journey_position_x
		offset[2] = 0
		local completed_difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name)
		local selection_frame_texture = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
		local is_unlocked = unlocked_journeys[journey_name]
		content.level_icon = journey_data.level_image
		content.locked = not is_unlocked
		content.frame = selection_frame_texture
		content.journey_name = journey_name
		content.level_icon_frame = (with_belakor and "morris_expedition_select_border_belakor") or "morris_expedition_select_border"
		content.draw_path = next_journey ~= nil
		content.draw_path_fill = unlocked_journeys[next_journey]
		widget.style.path.texture_size[1] = settings.spacing_x
		widget.style.path_glow.texture_size[1] = settings.spacing_x
		expedition_widgets[index] = widget
		journey_position_x = journey_position_x + settings.spacing_x
	end

	self._expedition_widgets = expedition_widgets
end

StartGameWindowDeusCustomGame._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowDeusCustomGame._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local chest_max_power_level = difficulty_settings.max_chest_power_level
	local selected_difficulty_info_widget = self._widgets_by_name.difficulty_info
	selected_difficulty_info_widget.content.difficulty_description = Localize(description)
	selected_difficulty_info_widget.content.highest_obtainable_level = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_power_level)
end

StartGameWindowDeusCustomGame._update_difficulty_option = function (self, difficulty_key)
	if difficulty_key then
		local difficulty_settings = DifficultySettings[difficulty_key]
		local difficulty_widget = self._selection_widgets_by_name.difficulty_stepper
		difficulty_widget.content.selected_difficulty_text = Localize(difficulty_settings.display_name)
		local display_image = difficulty_settings.display_image
		difficulty_widget.content.difficulty_icon = display_image

		self:_set_info_window(difficulty_key)

		self._current_difficulty = difficulty_key
	end
end

StartGameWindowDeusCustomGame._option_selected = function (self, widget_name, button_name, t)
	local parent = self._parent
	local custom_game_settings = parent:get_custom_game_settings(self._mechanism_name) or parent:get_custom_game_settings("adventure")

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
		self._play_button_pressed = true

		self._parent:set_difficulty_option(self._current_difficulty)
		self._parent:play(t, custom_game_settings.game_mode_type)
	end
end

StartGameWindowDeusCustomGame._update_modifiers = function (self, current_time)
	local journey_cycle = self._journey_cycle

	if not journey_cycle or is_journey_cycle_expired(journey_cycle, current_time) then
		self:_refresh_journey_cycle()
	end
end

StartGameWindowDeusCustomGame._update_modifier_timer = function (self, current_time)
	local journey_cycle = self._journey_cycle
	local remaining_time = journey_cycle.remaining_time - (current_time - journey_cycle.time_of_update)

	if remaining_time < 0 then
		remaining_time = 0
	end

	local floor = math.floor
	local days = floor(remaining_time / 86400)
	local hours = floor(remaining_time / 3600)
	local minutes = floor(remaining_time / 60) % 60
	local widget = self._widgets_by_name.modifier_timer
	local content = widget.content

	if minutes > 0 then
		local text_template = Localize("deus_start_game_mod_timer")
		content.time_text = string.format(text_template, days, hours, minutes)
	else
		local seconds = floor(remaining_time)
		local text_template = Localize("deus_start_game_mod_timer_seconds")
		content.time_text = string.format(text_template, seconds)
	end
end

StartGameWindowDeusCustomGame._refresh_journey_cycle = function (self)
	self._journey_cycle = self._backend_deus:get_journey_cycle()

	self:_update_journey_god_icons()
end

StartGameWindowDeusCustomGame._update_additional_curse_frame = function (self, journey_name)
	for _, widget in ipairs(self._expedition_widgets) do
		local content = widget.content
		local with_belakor = content.journey_name == journey_name
		content.level_icon_frame = (with_belakor and "morris_expedition_select_border_belakor") or "morris_expedition_select_border"
	end
end

StartGameWindowDeusCustomGame._update_journey_god_icons = function (self)
	local journey_cycle = self._journey_cycle

	for _, widget in ipairs(self._expedition_widgets) do
		local content = widget.content
		local theme = journey_cycle.journey_data[content.journey_name].dominant_god
		local theme_settings = DeusThemeSettings[theme]
		content.theme_icon = theme_settings.text_icon
	end
end

StartGameWindowDeusCustomGame.update = function (self, dt, t)
	local current_time = Managers.time:time("main")

	self:_update_modifiers(current_time)
	self:_update_can_play()
	self:_update_animations(dt, t)
	self:_handle_gamepad_activity()

	if self._is_focused then
		self:_handle_input(dt, t)
	end

	if RESOLUTION_LOOKUP.modified then
		self:_set_expedition_text_highlight_offset(self._ui_renderer)
	end

	self:_draw(dt)
end

StartGameWindowDeusCustomGame._verify_selection_index = function (self, input_index, input_change)
	local verified_index = self._input_index
	local num_inputs = #selector_input_definitions
	input_index = math.clamp(input_index, 1, num_inputs)

	if not input_change then
		return input_index
	end

	local input_funcs = selector_input_definitions[input_index]

	while input_funcs and input_index < num_inputs and not input_funcs.enter_requirements(self) do
		input_index = input_index + input_change
		input_funcs = selector_input_definitions[input_index]
	end

	if input_funcs and input_funcs.enter_requirements(self) then
		verified_index = input_index
	end

	return verified_index
end

StartGameWindowDeusCustomGame._gamepad_selector_input_func = function (self, input_index, input_change)
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

StartGameWindowDeusCustomGame._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local selection_widgets_by_name = self._selection_widgets_by_name
	local widgets = self._expedition_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		self:_animate_expedition_widget(widget, dt)
	end
end

StartGameWindowDeusCustomGame._draw = function (self, dt)
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

	local widgets = self._expedition_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local widgets = self._selection_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowDeusCustomGame._animate_expedition_widget = function (self, widget, dt)
	local content = widget.content
	local hotspot = content.button_hotspot
	local is_selected = hotspot.is_selected
	local selected_progress = hotspot.selected_progress or 0
	local selected_speed = 1.5

	if is_selected then
		selected_progress = math.min(selected_progress + selected_speed * dt, 1)
	else
		selected_progress = math.max(selected_progress - selected_speed * dt, 0)
	end

	local style = widget.style
	style.purple_glow.color[1] = 255 * selected_progress
	hotspot.selected_progress = selected_progress
end

StartGameWindowDeusCustomGame._handle_input = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		local input_index = self._input_index
		local input_change = nil

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

		local consume = true

		if input_service:get("right_stick_press", consume) and not self._is_offline then
			parent:set_window_input_focus("deus_additional_settings")
		end
	else
		local selection_widgets_by_name = self._selection_widgets_by_name

		for widget_name, widget in pairs(selection_widgets_by_name) do
			if widget_name == "difficulty_stepper" then
				if UIUtils.is_button_pressed(widget, "left_arrow_hotspot") then
					self:_option_selected(widget_name, "left_arrow", t)
				elseif UIUtils.is_button_pressed(widget, "right_arrow_hotspot") then
					self:_option_selected(widget_name, "right_arrow", t)
				end

				if UIUtils.is_button_hover(widget, "info_hotspot") or UIUtils.is_button_hover(self._widgets_by_name.difficulty_info, "widget_hotspot") then
					local widgets = {
						difficulty_info = self._widgets_by_name.difficulty_info,
						upsell_button = self._widgets_by_name.upsell_button
					}

					if not self.diff_info_anim_played then
						self._diff_anim_id = self._ui_animator:start_animation("difficulty_info_enter", widgets, scenegraph_definition)
						self.diff_info_anim_played = true
					end

					self:_update_difficulty_lock()
				else
					if self._diff_anim_id then
						self._ui_animator:stop_animation(self._diff_anim_id)
					end

					self.diff_info_anim_played = false
					self._widgets_by_name.upsell_button.content.visible = false
					self._widgets_by_name.difficulty_info.content.visible = false
				end
			elseif UIUtils.is_button_pressed(widget) then
				self:_option_selected(widget_name, nil, t)
			end

			if widget_name == "difficulty_stepper" then
				widget.content.is_selected = UIUtils.is_button_hover(widget, "left_arrow_hotspot") or UIUtils.is_button_hover(widget, "right_arrow_hotspot")
			else
				widget.content.is_selected = UIUtils.is_button_hover(widget)
			end
		end

		local selected_widget = self._expedition_widgets[self._expeditions_selection_index]

		for i = 1, #self._expedition_widgets, 1 do
			local widget = self._expedition_widgets[i]

			if UIUtils.is_button_pressed(widget) then
				if selected_widget then
					selected_widget.content.button_hotspot.is_selected = nil
				end

				widget.content.button_hotspot.is_selected = true
				local journey_name = widget.content.journey_name

				parent:set_selected_level_id(journey_name)

				self._expeditions_selection_index = i

				self:_play_sound("play_gui_lobby_button_01_difficulty_select_normal")
			end

			if UIUtils.is_button_hover_enter(widget) then
				self._parent:play_sound("Play_hud_hover")
			end
		end
	end

	self:_update_gamemode_info_text(input_service)

	local upsell_button = self._widgets_by_name.upsell_button

	if UIUtils.is_button_pressed(upsell_button) then
		Managers.unlock:open_dlc_page(self._dlc_name)
	end

	if self:_can_play() then
		local play_button_widget = self._selection_widgets_by_name.play_button

		if UIUtils.is_button_hover_enter(play_button_widget) then
			self._parent:play_sound("Play_hud_hover")
		end

		if input_service:get(START_GAME_INPUT) or UIUtils.is_button_pressed(play_button_widget) then
			self._play_button_pressed = true
			local custom_game_settings = parent:get_custom_game_settings(self._mechanism_name) or parent:get_custom_game_settings("adventure")

			self._parent:set_difficulty_option(self._current_difficulty)
			parent:play(t, custom_game_settings.game_mode_type)
		end
	end
end

StartGameWindowDeusCustomGame.handle_expedition_input = function (self, input_service, dt, t)
	return
end

StartGameWindowDeusCustomGame.handle_difficulty_input = function (self, input_service, dt, t)
	return
end

StartGameWindowDeusCustomGame._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowDeusCustomGame._update_expedition_option = function (self)
	local parent = self._parent
	local selected_level_id = parent:get_selected_level_id()

	if not selected_level_id then
		return
	end

	local level_settings = LevelSettings[selected_level_id]
	local display_name = level_settings.display_name
	local icon_texture = level_settings.level_image
	local completed_difficulty_index = self._parent:get_completed_level_difficulty_index(self._statistics_db, self._stats_id, selected_level_id)

	for i = 1, #self._expedition_widgets, 1 do
		local widget = self._expedition_widgets[i]
		local content = widget.content
		local journey_name = content.journey_name

		if selected_level_id == journey_name then
			content.button_hotspot.is_selected = true
			self._expeditions_selection_index = i

			break
		end
	end
end

StartGameWindowDeusCustomGame._handle_gamepad_activity = function (self)
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

StartGameWindowDeusCustomGame._update_gamemode_info_text = function (self, input_service)
	local gamemode_infobox_widget = self._widgets_by_name.custom_gamemode_info_box

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

StartGameWindowDeusCustomGame._update_difficulty_lock = function (self)
	local selected_difficulty_key = self._current_difficulty
	local difficulty_info_widget = self._widgets_by_name.difficulty_info
	local upsell_button = self._widgets_by_name.upsell_button

	if selected_difficulty_key then
		local approved, extra_requirement_failed, dlc_locked, below_power_level = self._parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			if extra_requirement_failed then
				difficulty_info_widget.content.should_show_diff_lock_text = true
				difficulty_info_widget.content.difficulty_lock_text = (extra_requirement_failed and Localize(extra_requirement_failed)) or ""
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
		math.floor(widget_height)
	}, {
		0,
		-offset_y,
		1
	})

	upsell_button.offset[2] = -math.floor(widget_height) / 2 + 24
end

StartGameWindowDeusCustomGame._calculate_difficulty_info_widget_size = function (self, diff_widget)
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

StartGameWindowDeusCustomGame._resize_difficulty_info = function (self, new_size, new_offset)
	local difficulty_info_widget = self._widgets_by_name.difficulty_info
	difficulty_info_widget.content.should_resize = true
	difficulty_info_widget.content.resize_size = new_size
	difficulty_info_widget.content.resize_offset = new_offset
	difficulty_info_widget.style.widget_hotspot.size = new_size
	difficulty_info_widget.style.widget_hotspot.offset = new_offset
end

StartGameWindowDeusCustomGame._set_expedition_text_highlight_offset = function (self, ui_renderer)
	local game_mode_info_box = self._widgets_by_name.custom_gamemode_info_box
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

return
