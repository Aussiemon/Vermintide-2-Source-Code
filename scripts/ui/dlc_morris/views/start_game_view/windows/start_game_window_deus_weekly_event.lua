-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_weekly_event.lua

local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_weekly_event_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local animation_definitions = definitions.animation_definitions
local create_weekly_event_information_box = definitions.create_weekly_event_information_box
local selector_input_definitions = definitions.selector_input_definitions
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"

StartGameWindowDeusWeeklyEvent = class(StartGameWindowDeusWeeklyEvent)
StartGameWindowDeusWeeklyEvent.NAME = "StartGameWindowDeusWeeklyEvent"

StartGameWindowDeusWeeklyEvent.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowDeusWeeklyEvent")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_index = params.input_index or 1
	self._input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)
	self:_handle_new_selection(self._input_index)

	self._current_difficulty = self._parent:get_difficulty_option(true) or Managers.state.difficulty:get_difficulty()

	self:_update_difficulty_option(self._current_difficulty)
	self:_fetch_event_data()

	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil
	self._num_requests = 0

	self._parent:change_generic_actions("deus_default")
	self:_start_transition_animation("on_enter")
end

local EMPTY_TABLE = {}

StartGameWindowDeusWeeklyEvent._fetch_event_data = function (self)
	local live_event_interface = Managers.backend:get_interface("live_events")
	local game_mode_data, information = live_event_interface:get_weekly_chaos_wastes_game_mode_data()
	local rewards = live_event_interface:get_weekly_chaos_wastes_rewards_data() or EMPTY_TABLE

	self._refresh_time = os.time(os.date("!*t", information.end_timestamp / 1000))
	self._weekly_journey_name = game_mode_data and game_mode_data.journey_name

	local widget_definition = create_weekly_event_information_box(game_mode_data)
	local widget = UIWidget.init(widget_definition)

	self._widgets[#self._widgets + 1] = widget
	self._widgets_by_name.weekly_info_box = widget

	local spacing = 10
	local offset_y = 0

	self._info_box_widgets = {}
	offset_y = self:_setup_curses(game_mode_data, spacing, offset_y)
	offset_y = self:_setup_boons(game_mode_data, spacing, offset_y)
	offset_y = self:_setup_rewards(rewards, spacing, offset_y)

	local excess_area = math.abs(scenegraph_definition.info_box.size[2] - math.abs(offset_y))

	if excess_area > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "info_box_anchor"
		local scroll_area_anchor_scenegraph_id = "scrollbar_window"
		local enable_auto_scroll = true
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	end
end

StartGameWindowDeusWeeklyEvent._setup_curses = function (self, game_mode_data, spacing, offset_y)
	local header_type = "curse"
	local widget_definition = definitions.create_header("cw_weekly_expedition_modifier_negative", offset_y, header_type)
	local widget = UIWidget.init(widget_definition)

	self._info_box_widgets[#self._info_box_widgets + 1] = widget
	self._widgets_by_name.curse_header = widget
	offset_y = offset_y - 40 - spacing

	local mutators = game_mode_data.mutators or EMPTY_TABLE
	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	for idx, mutator_name in ipairs(mutators) do
		local mutator_template = MutatorTemplates[mutator_name]
		local title = mutator_template.display_name
		local icon = mutator_template.icon
		local desc = Localize(mutator_template.description)
		local widget_definition = definitions.create_entry_widget(icon, title, desc, offset_y, spacing)
		local widget = UIWidget.init(widget_definition)

		self._info_box_widgets[#self._info_box_widgets + 1] = widget
		self._widgets_by_name["curse_" .. idx] = widget

		local text_style = widget.style.desc
		local font, size_of_font = UIFontByResolution(text_style)
		local font_material, font_size = font[1], size_of_font
		local gui = self._ui_top_renderer.gui
		local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
		local full_font_height = (font_max - font_min) * inv_scale
		local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, desc, font_material, font_size, text_style.area_size[1])

		offset_y = offset_y - full_font_height * #rows

		local text_style = widget.style.title
		local font, size_of_font = UIFontByResolution(text_style)
		local font_material, font_size = font[1], size_of_font
		local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
		local full_font_height = (font_max - font_min) * inv_scale
		local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, Localize(title), font_material, font_size, text_style.area_size[1])

		offset_y = offset_y - full_font_height * #rows - spacing
	end

	return offset_y - spacing
end

StartGameWindowDeusWeeklyEvent._setup_boons = function (self, game_mode_data, spacing, offset_y)
	local header_type = "boon"
	local widget_definition = definitions.create_header("cw_weekly_expedition_modifier_positive", offset_y, header_type)
	local widget = UIWidget.init(widget_definition)

	self._info_box_widgets[#self._info_box_widgets + 1] = widget
	self._widgets_by_name.boon_header = widget
	offset_y = offset_y - 40 - spacing

	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local boons = game_mode_data.boons or EMPTY_TABLE
	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	for idx, boon_name in ipairs(boons) do
		local power_up = DeusPowerUpsLookup[boon_name]
		local title = power_up.display_name
		local icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
		local desc = DeusPowerUpUtils.get_power_up_description(power_up, profile_index, career_index)
		local widget_definition = definitions.create_entry_widget(icon, title, desc, offset_y)
		local widget = UIWidget.init(widget_definition)

		self._info_box_widgets[#self._info_box_widgets + 1] = widget
		self._widgets_by_name["boon_" .. idx] = widget

		local text_style = widget.style.desc
		local font, size_of_font = UIFontByResolution(text_style)
		local font_material, font_size = font[1], size_of_font
		local gui = self._ui_top_renderer.gui
		local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
		local full_font_height = (font_max - font_min) * inv_scale
		local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, desc, font_material, font_size, text_style.area_size[1])

		offset_y = offset_y - full_font_height * #rows

		local text_style = widget.style.title
		local font, size_of_font = UIFontByResolution(text_style)
		local font_material, font_size = font[1], size_of_font
		local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
		local full_font_height = (font_max - font_min) * inv_scale
		local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, Localize(title), font_material, font_size, text_style.area_size[1])

		offset_y = offset_y - full_font_height * #rows - spacing
	end

	return offset_y - spacing
end

StartGameWindowDeusWeeklyEvent._setup_rewards = function (self, rewards, spacing, offset_y)
	local header_type
	local widget_definition = definitions.create_header("cw_weekly_expedition_rewards_name", offset_y, header_type)
	local widget = UIWidget.init(widget_definition)
	local widget_style = widget.style

	widget_style.header.text_color = Colors.get_color_table_with_alpha("white", 255)
	self._info_box_widgets[#self._info_box_widgets + 1] = widget
	self._widgets_by_name.rewards_header = widget
	offset_y = offset_y - 40 - spacing

	local rewards = rewards
	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	for index, difficulty_name in ipairs(DefaultDifficulties) do
		local reward = rewards and rewards[difficulty_name]

		if reward then
			local reward_data = self:_evaluate_rewards(reward, difficulty_name)
			local widget_definition = definitions.create_reward_widget(reward_data, offset_y)
			local widget = UIWidget.init(widget_definition)

			self._info_box_widgets[#self._info_box_widgets + 1] = widget
			self._widgets_by_name["reward_" .. index] = widget

			local text_style = widget.style.desc
			local font, size_of_font = UIFontByResolution(text_style)
			local font_material, font_size = font[1], size_of_font
			local gui = self._ui_top_renderer.gui
			local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
			local full_font_height = (font_max - font_min) * inv_scale
			local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, Localize(reward_data.desc or " "), font_material, font_size, text_style.area_size[1])

			offset_y = offset_y - full_font_height * #rows - spacing - 20
		end
	end

	return offset_y - spacing
end

StartGameWindowDeusWeeklyEvent._evaluate_rewards = function (self, data, difficulty_name)
	local rewards = data.rewards
	local claimed = data.claimed
	local reward_data = {
		difficulty_name = Localize(DifficultySettings[difficulty_name] and DifficultySettings[difficulty_name].display_name or "lb_unknown"),
		num_rewards = #rewards,
		collected = claimed,
	}
	local first_reward = rewards[1]
	local reward_type = first_reward and first_reward.reward_type

	if reward_type == "experience" then
		local amount = tonumber(first_reward.amount) or 0

		reward_data.icon = "experience"

		local desc = Localize("cw_weekly_expedition_xp_reward")

		reward_data.desc = string.format(desc, amount)
	elseif reward_type == "item" or reward_type == "loot_chest" then
		local item_name = first_reward.item_name or first_reward.weapon_skin_name
		local item = item_name and ItemMasterList[item_name]

		reward_data.desc = Localize(item and item.display_name or "lb_unkown")
		reward_data.icon = item and item.inventory_icon or "icons_placeholder"
	elseif reward_type == "weapon_skin" then
		local item_name = first_reward.item_name or first_reward.weapon_skin_name
		local backend_crafting = Managers.backend:get_interface("crafting")
		local unlocked_weapon_skins = backend_crafting:get_unlocked_weapon_skins()

		reward_data.collected = claimed or unlocked_weapon_skins[item_name] ~= nil

		local item = WeaponSkins.skins[item_name] or ItemMasterList[item_name]

		reward_data.desc = Localize(item and item.display_name or "lb_unkown")
		reward_data.icon = item and item.inventory_icon or "icons_placeholder"
	else
		reward_data.icon = "icons_placeholder"
		reward_data.desc = Localize("lb_unkown")
	end

	return reward_data
end

StartGameWindowDeusWeeklyEvent._setup_debug_texts = function (self, scenegraph_id, spacing, offset_y)
	local scenegraph_id = "info_box_anchor"
	local temp_text_style = {
		dynamic_font_size = false,
		font_size = 20,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		localize = false,
		upper_case = false,
		use_shadow = false,
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			0,
			0,
			2,
		},
	}
	local font, size_of_font = UIFontByResolution(temp_text_style)
	local font_material, font_size = font[1], size_of_font
	local gui = self._ui_top_renderer.gui
	local _, font_min, font_max = UIGetFontHeight(gui, temp_text_style.font_type, font_size)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max - font_min) * inv_scale
	local text = "This is just a temporary text This is just a temporary text This is just a temporary text"

	for i = 1, 50 do
		local index_text = text .. " " .. i
		local widget_definition = UIWidgets.create_simple_text(index_text, scenegraph_id, font_size, nil, temp_text_style)
		local widget = UIWidget.init(widget_definition)

		widget.offset[2] = offset_y
		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name["temp_text_" .. i] = widget

		local rows, return_indices = UIRenderer.word_wrap(self._ui_top_renderer, index_text, font_material, font_size, scenegraph_definition.info_box.size[1])

		offset_y = offset_y - full_font_height * #rows - spacing
	end

	return offset_y
end

StartGameWindowDeusWeeklyEvent._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowDeusWeeklyEvent._create_ui_elements = function (self, params, offset)
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

StartGameWindowDeusWeeklyEvent.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowDeusWeeklyEvent")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end

	self._parent:set_difficulty_option(self._current_difficulty)
end

StartGameWindowDeusWeeklyEvent.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowDeusWeeklyEvent.update = function (self, dt, t)
	self:_update_can_play()
	self:_update_animations(dt)
	self:_update_time_left()
	self:_handle_gamepad_activity()
	self:_handle_input(dt, t)
	self:_draw(dt, t)
end

StartGameWindowDeusWeeklyEvent.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusWeeklyEvent._handle_gamepad_activity = function (self)
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

StartGameWindowDeusWeeklyEvent._update_can_play = function (self)
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

StartGameWindowDeusWeeklyEvent._handle_input = function (self, dt, t)
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
			self._parent:set_difficulty_option(self._current_difficulty)

			self._play_button_pressed = true

			self._parent:play(t, "deus_weekly")
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

	local consume = true

	if DLCSettings.quick_play_preferences and input_service:get("right_stick_press", consume) then
		parent:set_layout_by_name("adventure_level_preferences")
	end
end

StartGameWindowDeusWeeklyEvent._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StartGameWindowDeusWeeklyEvent._can_play = function (self)
	local selected_difficulty_key = self._current_difficulty
	local can_play = selected_difficulty_key ~= nil and not self._dlc_locked

	if not can_play then
		return false
	end

	return self._weekly_journey_name and not LevelUnlockUtils.is_journey_disabled(self._weekly_journey_name)
end

StartGameWindowDeusWeeklyEvent._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local chest_max_power_level = difficulty_settings.max_chest_power_level
	local selected_difficulty_info_widget = self._widgets_by_name.difficulty_info

	selected_difficulty_info_widget.content.difficulty_description = Localize(description)
	selected_difficulty_info_widget.content.highest_obtainable_level = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_power_level)
end

StartGameWindowDeusWeeklyEvent._update_difficulty_option = function (self, difficulty_key)
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

StartGameWindowDeusWeeklyEvent._option_selected = function (self, widget_name, button_name, t)
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
		self._parent:set_difficulty_option(self._current_difficulty)

		self._play_button_pressed = true

		self._parent:play(t, "deus_weekly")
	else
		ferror("Unknown selector_input_definition: %s", widget_name)
	end
end

StartGameWindowDeusWeeklyEvent._verify_selection_index = function (self, input_index, input_change)
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

StartGameWindowDeusWeeklyEvent._gamepad_selector_input_func = function (self, input_index, input_change)
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

StartGameWindowDeusWeeklyEvent._handle_new_selection = function (self, input_index, input_change)
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

StartGameWindowDeusWeeklyEvent._update_animations = function (self, dt)
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

StartGameWindowDeusWeeklyEvent._refresh_data = function (self)
	if self._num_requests > 0 then
		return
	end

	local live_event_interface = Managers.backend:get_interface("live_events")
	local cb = callback(self, "_refresh_data_cb")

	live_event_interface:request_live_events(cb)
	live_event_interface:request_weekly_event_rewards(cb)

	self._num_requests = 2
end

StartGameWindowDeusWeeklyEvent._refresh_data_cb = function (self, result)
	self._num_requests = self._num_requests - 1

	if self._num_requests <= 0 then
		self:_fetch_event_data()
	end
end

StartGameWindowDeusWeeklyEvent._update_time_left = function (self)
	local now = os.time(os.date("!*t"))
	local remaining_time = self._refresh_time - now
	local widget = self._widgets_by_name.timer
	local widget_content = widget.content

	if remaining_time > 120 then
		local days = remaining_time / 86400
		local hours = remaining_time / 3600 % 24
		local minutes = remaining_time / 60 % 60
		local fmt = Localize("deus_start_game_mod_timer")

		widget_content.text = string.format(fmt, days, hours, minutes)
	else
		local fmt = Localize("deus_start_game_mod_timer_seconds")

		if remaining_time < 0 then
			remaining_time = 0

			self:_refresh_data()
		end

		widget_content.text = string.format(fmt, remaining_time)
	end
end

StartGameWindowDeusWeeklyEvent._update_button_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.upsell_button, dt)
end

StartGameWindowDeusWeeklyEvent._draw = function (self, dt, t)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)

	if not table.is_empty(self._info_box_widgets) then
		UIRenderer.draw_all_widgets(ui_top_renderer, self._info_box_widgets)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._scrollbar_ui then
		self._scrollbar_ui:update(dt, t, ui_top_renderer, input_service, render_settings)
	end
end

StartGameWindowDeusWeeklyEvent._update_difficulty_lock = function (self)
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

StartGameWindowDeusWeeklyEvent._handle_difficulty_info = function (self, show_widget)
	if show_widget then
		self:_update_difficulty_lock()
	end
end

StartGameWindowDeusWeeklyEvent._calculate_difficulty_info_widget_size = function (self, diff_widget)
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

StartGameWindowDeusWeeklyEvent._resize_difficulty_info = function (self, new_size, new_offset)
	local difficulty_info_widget = self._widgets_by_name.difficulty_info

	difficulty_info_widget.content.should_resize = true
	difficulty_info_widget.content.resize_size = new_size
	difficulty_info_widget.content.resize_offset = new_offset
	difficulty_info_widget.style.widget_hotspot.size = new_size
	difficulty_info_widget.style.widget_hotspot.offset = new_offset
end

StartGameWindowDeusWeeklyEvent._handle_difficulty_stepper_gamepad = function (self, widget, input_service, t)
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
