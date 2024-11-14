-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_difficulty_console.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_difficulty_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local create_difficulty_button = definitions.create_difficulty_button
local animation_definitions = definitions.animation_definitions
local STARTING_DIFFICULTY_INDEX = 1
local SELECTION_INPUT = "confirm_press"

StartGameWindowDifficultyConsole = class(StartGameWindowDifficultyConsole)
StartGameWindowDifficultyConsole.NAME = "StartGameWindowDifficultyConsole"

StartGameWindowDifficultyConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowDifficultyConsole")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_difficulties()

	local difficulty_key = self:_verify_difficulty(self.parent:get_difficulty_option() or Managers.state.difficulty:get_difficulty())

	self:_update_selected_difficulty_option(difficulty_key)

	if difficulty_key then
		self._difficulty_navigation_id = self:_get_difficulty_navigation_id_from_difficulty_key(difficulty_key)
	else
		self._difficulty_navigation_id = 1
	end

	self:_start_transition_animation("on_enter")
end

StartGameWindowDifficultyConsole._verify_difficulty = function (self, difficulty_key)
	local difficulties = Managers.state.difficulty:get_default_difficulties()

	for _, difficulty in pairs(difficulties) do
		if difficulty == difficulty_key then
			return difficulty_key
		end
	end

	Application.warning(string.format("Difficulty %q is not valid - Defaulting to %q", difficulty_key, difficulties[1]))

	return difficulties[1]
end

StartGameWindowDifficultyConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowDifficultyConsole.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowDifficultyConsole._setup_difficulties = function (self)
	local difficulty_widgets = {}
	local difficulty_reward_widgets = {}
	local difficulties = self:_get_difficulty_options()
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local rewards_root = widgets_by_name.difficulty_rewards_root
	local widget_index_counter = 1
	local widget_prefix = "difficulty_option_"
	local spacing = 10
	local scenegraph_id = "difficulty_option"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = create_difficulty_button(scenegraph_id, size)

	for i = STARTING_DIFFICULTY_INDEX, #difficulties do
		local difficulty_key = difficulties[i]
		local difficulty_settings = DifficultySettings[difficulty_key]
		local display_name = difficulty_settings.display_name
		local display_image = difficulty_settings.display_image
		local frame_texture = difficulty_settings.completed_frame_texture
		local widget = UIWidget.init(widget_definition)
		local widget_name = widget_prefix .. widget_index_counter

		widgets_by_name[widget_name] = widget
		widgets[#widgets + 1] = widget
		difficulty_widgets[#difficulty_widgets + 1] = widget

		local offset = widget.offset
		local content = widget.content

		content.difficulty_key = difficulty_key
		content.title_text = Localize(display_name)
		content.icon = display_image
		content.difficulty_key = difficulty_key
		content.text_title = Localize(display_name)
		content.icon_texture = display_image
		content.icon_frame_texture = frame_texture
		offset[2] = -(size[2] + spacing) * (widget_index_counter - 1)

		local reward_data = self:_rewards_by_difficulty(difficulty_key)
		local num_rewards = #reward_data

		for reward_i = 1, num_rewards do
			local item_name = reward_data[reward_i]
			local widget_definition = definitions.create_difficulty_reward_widget(difficulty_key, item_name, reward_i, num_rewards)
			local reward_widget = UIWidget.init(widget_definition)
			local widget_name = string.format("reward_%s_%s", difficulty_key, reward_i)

			widgets_by_name[widget_name] = reward_widget
			widgets[#widgets + 1] = reward_widget
			difficulty_reward_widgets[#difficulty_reward_widgets + 1] = reward_widget
		end

		widget_index_counter = widget_index_counter + 1
	end

	self._difficulty_widgets = difficulty_widgets
	self._difficulty_reward_widgets = difficulty_reward_widgets
end

StartGameWindowDifficultyConsole._rewards_by_difficulty = function (self, difficulty_name)
	return LootChestData.chests_by_category[difficulty_name].backend_keys
end

StartGameWindowDifficultyConsole._get_difficulty_options = function (self)
	return Managers.state.difficulty:get_default_difficulties()
end

StartGameWindowDifficultyConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowDifficultyConsole")

	self.ui_animator = nil

	self.parent:set_input_description(nil)
end

StartGameWindowDifficultyConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_difficulty_locks()
	self:draw(dt)
end

StartGameWindowDifficultyConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowDifficultyConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	self.ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowDifficultyConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

StartGameWindowDifficultyConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

StartGameWindowDifficultyConsole._handle_input = function (self, dt, t)
	local input_service = self.parent:window_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		if input_service:get("move_down_hold_continuous") then
			self:_update_difficulty_selection(1)
		elseif input_service:get("move_up_hold_continuous") then
			self:_update_difficulty_selection(-1)
		end
	end

	local difficulty_widgets = self._difficulty_widgets

	for i = 1, #difficulty_widgets do
		local widget = difficulty_widgets[i]
		local content = widget.content

		if not content.is_selected and self:_is_button_hover_enter(widget) then
			self:_update_difficulty_selection(nil, i)
		end

		if self:_is_button_pressed(widget) and self._difficulty_approved then
			self:_on_difficulty_selection_confirmed()

			return
		end
	end

	local widgets_by_name = self._widgets_by_name
	local buy_button = widgets_by_name.buy_button

	UIWidgetUtils.animate_default_button(buy_button, dt)

	if self:_is_button_hover_enter(buy_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self:_is_button_released(buy_button) then
		local dlc_name = buy_button.content.dlc_name
		local area_settings = AreaSettings[dlc_name]
		local store_page_url = area_settings.store_page_url

		self:_show_storepage(store_page_url, dlc_name)
	end

	local gamepad_confirm_pressed = not mouse_active and input_service:get(SELECTION_INPUT, true)

	if gamepad_confirm_pressed then
		if self._difficulty_approved then
			self:_on_difficulty_selection_confirmed()
		elseif self._dlc_locked then
			local dlc_name = self._dlc_locked
			local area_settings = AreaSettings[dlc_name]
			local store_page_url = area_settings.store_page_url

			self:_show_storepage(store_page_url, dlc_name)
		end
	end
end

StartGameWindowDifficultyConsole._on_difficulty_selection_confirmed = function (self)
	local parent = self.parent

	parent:set_difficulty_option(self._selected_difficulty_key)

	local difficulties_select_sounds = UISettings.difficulties_select_sounds
	local sound_event = difficulties_select_sounds[self._difficulty_navigation_id] or difficulties_select_sounds[#difficulties_select_sounds]

	self:_play_sound(sound_event)

	local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

	parent:set_layout_by_name(game_mode_layout_name)
end

StartGameWindowDifficultyConsole._update_difficulty_selection = function (self, navigation_id_change, new_navigation_id)
	local difficulties = self:_get_difficulty_options()

	if not new_navigation_id then
		new_navigation_id = self._difficulty_navigation_id + navigation_id_change

		local num_difficulties = #difficulties

		new_navigation_id = math.clamp(new_navigation_id, 1, num_difficulties)
	end

	if new_navigation_id ~= self._difficulty_navigation_id then
		local difficulty_key = difficulties[new_navigation_id]

		self:_update_selected_difficulty_option(difficulty_key)
		self:_play_sound("play_gui_lobby_button_02_mission_act_click")

		self._difficulty_navigation_id = new_navigation_id
	end
end

StartGameWindowDifficultyConsole._get_difficulty_navigation_id_from_difficulty_key = function (self, difficulty_key)
	local difficulties = self:_get_difficulty_options()

	for i = 1, #difficulties do
		if difficulty_key == difficulties[i] then
			return i
		end
	end

	ferror("Difficulty Key not found %s", difficulty_key)
end

StartGameWindowDifficultyConsole._set_selected_difficulty_option = function (self, new_difficulty_key)
	local difficulty_widgets = self._difficulty_widgets

	for i = 1, #difficulty_widgets do
		local widget = difficulty_widgets[i]
		local content = widget.content
		local difficulty_key = content.difficulty_key
		local is_selected = difficulty_key == new_difficulty_key

		content.is_selected = is_selected
	end

	local difficulty_reward_widgets = self._difficulty_reward_widgets

	for i = 1, #difficulty_reward_widgets do
		local widget = difficulty_reward_widgets[i]
		local content = widget.content

		content.visible = content.difficulty_key == new_difficulty_key
	end
end

StartGameWindowDifficultyConsole._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local display_name = difficulty_settings.display_name
	local display_image = difficulty_settings.display_image
	local xp_multiplier_number = difficulty_settings.xp_multiplier or 1
	local chest_max_powerlevel = difficulty_settings.max_chest_power_level
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.difficulty_title.content.text = Localize(display_name)
	widgets_by_name.difficulty_texture.content.texture_id = display_image
	widgets_by_name.description_text.content.text = Localize(description)
	widgets_by_name.difficulty_chest_info.content.text = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_powerlevel)

	local xp_decimal = xp_multiplier_number % 1
	local xp_integer = xp_multiplier_number - xp_decimal

	widgets_by_name.xp_multiplier.content.text = string.format("%s: %s.%sx", Localize("difficulty_xp_multiplier"), xp_integer, string.pad_end(string.sub(tostring(xp_decimal), 3, 4), 2, "0"))
end

StartGameWindowDifficultyConsole._update_difficulty_locks = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "difficulty_option_"
	local level_difficulties = Managers.state.difficulty:get_default_difficulties()

	for i = 1, #level_difficulties do
		local difficulty_key = level_difficulties[i]
		local difficulty_settings = DifficultySettings[difficulty_key]
		local approved = self.parent:is_difficulty_approved(difficulty_key)
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		widget.content.locked = not approved
		widget.style.icon_texture.offset[3] = approved and widget.content.icon_unlocked_z_offset or widget.content.icon_locked_z_offset
	end

	local buy_button = widgets_by_name.buy_button
	local difficulty_second_lock_text = widgets_by_name.difficulty_second_lock_text
	local difficulty_lock_text = widgets_by_name.difficulty_lock_text
	local difficulty_is_locked_text = widgets_by_name.difficulty_is_locked_text
	local dlc_lock_text = widgets_by_name.dlc_lock_text
	local selected_difficulty_key = self._selected_difficulty_key

	if selected_difficulty_key then
		local difficulty_settings = DifficultySettings[selected_difficulty_key]
		local approved, extra_requirement_failed, dlc_locked, below_power_level = self.parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			if dlc_locked then
				buy_button.content.button_hotspot.disable_button = false
				buy_button.content.visible = true
				buy_button.content.dlc_name = dlc_locked
				difficulty_second_lock_text.offset[2] = 38
				difficulty_lock_text.offset[2] = 38
				difficulty_is_locked_text.offset[2] = 38
				dlc_lock_text.content.visible = true
				self._dlc_locked = dlc_locked
			else
				buy_button.content.button_hotspot.disable_button = true
				buy_button.content.visible = false
				buy_button.content.dlc_name = nil
				difficulty_second_lock_text.offset[2] = 0
				difficulty_lock_text.offset[2] = 0
				difficulty_is_locked_text.offset[2] = 0
				dlc_lock_text.content.visible = false
				self._dlc_locked = nil
			end

			if below_power_level or extra_requirement_failed then
				widgets_by_name.difficulty_is_locked_text.content.text = Localize("required_power_level_not_met_in_party")

				if below_power_level then
					local required_power_level = difficulty_settings.required_power_level
					local difficulty_lock_text = Localize("required_power_level")

					widgets_by_name.difficulty_lock_text.content.text = string.format("%s: %s", difficulty_lock_text, tostring(UIUtils.presentable_hero_power_level(required_power_level)))
					widgets_by_name.difficulty_second_lock_text.content.text = extra_requirement_failed and Localize(extra_requirement_failed) or ""
				else
					widgets_by_name.difficulty_lock_text.content.text = extra_requirement_failed and Localize(extra_requirement_failed) or ""
				end
			end

			if dlc_locked then
				self.parent:set_input_description("select_difficulty_buy")
			else
				self.parent:set_input_description("select_difficulty")
			end
		else
			buy_button.content.button_hotspot.disable_button = true
			buy_button.content.visible = false
			buy_button.content.dlc_name = nil
			dlc_lock_text.content.visible = false
			widgets_by_name.difficulty_lock_text.content.text = ""
			widgets_by_name.difficulty_second_lock_text.content.text = ""
			widgets_by_name.difficulty_is_locked_text.content.text = ""
			self._dlc_locked = nil

			self.parent:set_input_description("select_difficulty_confirm")
		end

		self._difficulty_approved = approved
	else
		buy_button.content.button_hotspot.disable_button = true
		buy_button.content.visible = false
		buy_button.content.dlc_name = nil
		dlc_lock_text.content.visible = false

		if not self._has_exited then
			self.parent:set_input_description(nil)
		end
	end
end

StartGameWindowDifficultyConsole._update_selected_difficulty_option = function (self, difficulty_key)
	difficulty_key = difficulty_key or Managers.state.difficulty:get_difficulty()

	if difficulty_key ~= self._selected_difficulty_key then
		self:_set_selected_difficulty_option(difficulty_key)

		self._selected_difficulty_key = difficulty_key

		self:_set_info_window(difficulty_key)
	end
end

StartGameWindowDifficultyConsole.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowDifficultyConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowDifficultyConsole._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowDifficultyConsole._show_storepage = function (self, store_page_url, dlc_name)
	local platform = PLATFORM

	if IS_WINDOWS and rawget(_G, "Steam") then
		Steam.open_url(store_page_url)
	elseif IS_XB1 then
		local user_id = Managers.account:user_id()

		if dlc_name then
			local product_id = Managers.unlock:dlc_id(dlc_name)

			if product_id then
				XboxLive.show_product_details(user_id, product_id)
			else
				Application.error(string.format("[StartGameWindowAreaSelection:_show_storepage] No product_id for dlc: %s", dlc_name))
			end
		else
			Application.error("[StartGameWindowAreaSelection:_show_storepage] No dlc name")
		end
	elseif IS_PS4 then
		local user_id = Managers.account:user_id()

		if dlc_name then
			local product_label = Managers.unlock:ps4_dlc_product_label(dlc_name)

			if product_label then
				Managers.system_dialog:open_commerce_dialog(NpCommerceDialog.MODE_PRODUCT, user_id, {
					product_label,
				})
			else
				Application.error(string.format("[StartGameWindowAreaSelection:_show_storepage] No product_id for dlc: %s", dlc_name))
			end
		else
			Application.error("[StartGameWindowAreaSelection:_show_storepage] No dlc name")
		end
	end
end
