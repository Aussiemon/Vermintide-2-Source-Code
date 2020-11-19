local definitions = local_require("scripts/ui/views/popup_join_lobby_handler_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local hero_widget_definition = definitions.hero_widget_definition
local hero_icon_widget_definition = definitions.hero_icon_widget_definition
PopupJoinLobbyHandler = class(PopupJoinLobbyHandler)

PopupJoinLobbyHandler.init = function (self, ingame_ui_context)
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.wwise_world = ingame_ui_context.wwise_world
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.peer_id = ingame_ui_context.peer_id
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("popup_join_lobby_handler", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("popup_join_lobby_handler", "keyboard")
	input_manager:map_device_to_service("popup_join_lobby_handler", "mouse")
	input_manager:map_device_to_service("popup_join_lobby_handler", "gamepad")

	self._difficulty = nil

	self:create_ui_elements()
end

PopupJoinLobbyHandler.create_ui_elements = function (self)
	self._ui_animations = {}
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)

	self:_setup_hero_selection_widgets()

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self._widgets_by_name.hero_info_panel.content.visible = false
	self._widgets_by_name.hero_info_panel_glow.content.visible = false
	self._widgets_by_name.hero_info_level_bg.content.visible = false
	self._widgets_by_name.info_career_name.content.visible = false
	self._widgets_by_name.info_hero_name.content.visible = false
	self._widgets_by_name.info_hero_level.content.visible = false
end

PopupJoinLobbyHandler._setup_hero_selection_widgets = function (self)
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local num_max_columns = #SPProfilesAbbreviation
	local num_max_rows = 0

	for i = 1, num_max_columns, 1 do
		num_max_rows = math.max(num_max_rows, #SPProfiles[i].careers)
	end

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[1] = (i - 1) * 124
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_selected = hero_icon_texture .. "_glow"

		for j, career in ipairs(careers) do
			local widget = UIWidget.init(hero_widget_definition)
			hero_widgets[j + (i - 1) * num_max_rows] = widget
			local offset = widget.offset
			local content = widget.content
			content.career_settings = career
			local portrait_image = career.portrait_image
			content.portrait = "medium_" .. portrait_image
			local is_career_unlocked, _, dlc_name = career:is_unlocked_function(hero_name, hero_level)
			content.locked = not is_career_unlocked

			if dlc_name then
				content.lock_texture = content.lock_texture .. "_gold"
				content.frame = content.frame .. "_gold"
			end

			offset[1] = (i - 1) * 124
			offset[2] = -(j - 1) * 144
		end
	end

	self._num_max_hero_rows = num_max_rows
	self._num_max_hero_columns = num_max_columns
end

PopupJoinLobbyHandler._get_widget = function (self, name)
	return self._widgets_by_name[name]
end

PopupJoinLobbyHandler.update = function (self, dt, t)
	self:_update_occupied_profiles()
	self:_update_gamepad_input_buttons()

	local ui_top_renderer = self.ui_top_renderer
	local input_service = self:input_service()

	if self.cancel_timer then
		self.cancel_timer = math.max(self.cancel_timer - dt, 0)
		local timer_text = tostring(math.ceil(self.cancel_timer))

		self:_set_timer_text(timer_text)

		if self.cancel_timer <= 0 then
			local accepted = false

			self:set_result(accepted)
		end
	end

	self:_handle_input(dt, t)
	self:draw(ui_top_renderer, input_service, dt)
end

PopupJoinLobbyHandler._INPUT_DEVICES = {
	"keyboard",
	"gamepad",
	"mouse"
}

PopupJoinLobbyHandler.show = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)
	self.join_lobby_result = nil

	self.ingame_ui:handle_transition((join_by_lobby_browser and "exit_menu") or "close_active")
	ShowCursorStack.push()

	local profile_index = current_profile_index or 1
	local career_index = current_career_index or 1
	local ignore_sound = true

	self:_select_hero(profile_index, career_index, ignore_sound)

	self.cancel_timer = time_until_cancel
	local input_manager = self.input_manager

	input_manager:capture_input(self._INPUT_DEVICES, 1, "popup_join_lobby_handler", "PopupJoinLobbyHandler")
end

PopupJoinLobbyHandler.hide = function (self)
	local input_manager = self.input_manager

	input_manager:release_input(self._INPUT_DEVICES, 1, "popup_join_lobby_handler", "PopupJoinLobbyHandler")
	ShowCursorStack.pop()

	self._selected_hero_name = nil
	self._selected_career_name = nil
end

PopupJoinLobbyHandler.input_service = function (self)
	return self.input_manager:get_service("popup_join_lobby_handler")
end

PopupJoinLobbyHandler.draw = function (self, ui_top_renderer, input_service, dt)
	UIRenderer.begin_pass(ui_top_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for _, widget in ipairs(widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in pairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_icon_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

PopupJoinLobbyHandler.set_result = function (self, accepted)
	local selected_hero_name = accepted and self._selected_hero_name
	local selected_career_name = accepted and self._selected_career_name
	self.join_lobby_result = {
		accepted = accepted,
		selected_hero_name = selected_hero_name,
		selected_career_name = selected_career_name
	}
end

PopupJoinLobbyHandler.query_result = function (self)
	return self.join_lobby_result
end

PopupJoinLobbyHandler.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

PopupJoinLobbyHandler._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = Managers.input:get_service("popup_join_lobby_handler")

	self:_handle_mouse_selection()
	self:_handle_gamepad_selection(input_service)

	local select_button = widgets_by_name.select_button
	local cancel_button = widgets_by_name.cancel_button

	UIWidgetUtils.animate_default_button(select_button, dt)
	UIWidgetUtils.animate_default_button(cancel_button, dt)

	if self:_is_button_hover_enter(select_button) or self:_is_button_hover_enter(cancel_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self._selection_approved and (self:_is_button_pressed(widgets_by_name.select_button) or input_service:get("confirm", true)) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(true)
	elseif self:_is_button_pressed(widgets_by_name.cancel_button) or input_service:get("back_menu", true) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(false)
	end
end

PopupJoinLobbyHandler._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column

	if selected_row and selected_column then
		local widget_index = 1

		for i = 1, num_max_columns, 1 do
			for j = 1, num_max_rows, 1 do
				local widget = hero_widgets[widget_index]

				if widget then
					local content = widget.content
					local button_hotspot = content.button_hotspot

					if button_hotspot.on_hover_enter then
						self:_play_sound("play_gui_hero_select_hero_hover")
					end

					if not content.taken and button_hotspot.on_pressed and (i ~= selected_column or j ~= selected_row) then
						local profile_index = ProfilePriority[i]
						local career_index = j

						self:_select_hero(profile_index, career_index)

						return
					end
				end

				widget_index = widget_index + 1
			end
		end
	end
end

PopupJoinLobbyHandler._handle_gamepad_selection = function (self, input_service)
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column

	if selected_row and selected_column then
		local modified = false

		if selected_column > 1 and input_service:get("move_left_hold_continuous") then
			selected_column = selected_column - 1
			modified = true
		elseif selected_column < num_max_columns and input_service:get("move_right_hold_continuous") then
			selected_column = selected_column + 1
			modified = true
		end

		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			selected_row = selected_row - 1
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			modified = true
		end

		if modified then
			local profile_index = ProfilePriority[selected_column]
			local career_index = selected_row

			self:_select_hero(profile_index, career_index)
		end
	end
end

PopupJoinLobbyHandler._select_hero = function (self, profile_index, career_index, ignore_sound)
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]

	if not career_settings then
		return
	end

	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local career_name = career_settings.name
	local career_display_name = career_settings.display_name
	local hero_display_text = Localize(character_name)
	local career_display_text = Localize(career_display_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(hero_experience)

	self:_set_hero_info(hero_display_text, career_display_text, level)

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name
	self._selected_career_name = career_name
	self._selected_hero_row = career_index
	self._selected_hero_column = ProfileIndexToPriorityIndex[profile_index]

	self:_set_hero_icon_selected(self._selected_hero_column)

	local widget_index = 1

	for i = 1, num_max_columns, 1 do
		for j = 1, num_max_rows, 1 do
			local is_selected = i == self._selected_hero_column and j == self._selected_hero_row
			local widget = hero_widgets[widget_index]

			if widget then
				local content = widget.content
				content.button_hotspot.is_selected = is_selected
			end

			widget_index = widget_index + 1
		end
	end

	if not ignore_sound then
		self:_play_sound("play_gui_hero_select_hero_click")
	end
end

PopupJoinLobbyHandler._set_hero_icon_selected = function (self, index)
	for icon_index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.selected = icon_index == index
	end
end

PopupJoinLobbyHandler._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

PopupJoinLobbyHandler._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

PopupJoinLobbyHandler._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

PopupJoinLobbyHandler._set_timer_text = function (self, timer_text)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.timer_text.content.text = timer_text
end

PopupJoinLobbyHandler.set_unavailable_heroes = function (self, occupied_heroes)
	self._occupied_heroes = occupied_heroes

	self:_update_occupied_profiles()
end

PopupJoinLobbyHandler.set_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

PopupJoinLobbyHandler._update_occupied_profiles = function (self)
	local occupied_heroes = self._occupied_heroes

	if not occupied_heroes then
		return
	end

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local is_button_enabled = false
	local widget_index = 1

	for i = 1, num_max_columns, 1 do
		local profile_index = ProfilePriority[i]
		local occupied = occupied_heroes[profile_index]

		for j = 1, num_max_rows, 1 do
			local widget = hero_widgets[widget_index]

			if widget then
				local content = widget.content
				local button_hotspot = content.button_hotspot
				content.taken = occupied

				if button_hotspot.is_selected then
					is_button_enabled = not occupied and not content.locked
				end
			end

			widget_index = widget_index + 1
		end
	end

	self:set_select_button_enable_state(is_button_enabled)
end

PopupJoinLobbyHandler._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

PopupJoinLobbyHandler.set_select_button_enable_state = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled
	local widgets_by_name = self._widgets_by_name
	local gamepad_select_button = widgets_by_name.gamepad_select_button
	local gamepad_cancel_button = widgets_by_name.gamepad_cancel_button
	gamepad_select_button.content.visible = enabled
	gamepad_cancel_button.scenegraph_id = (enabled and "cancel_button") or "center_button"
	self._selection_approved = enabled
end

PopupJoinLobbyHandler._play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

PopupJoinLobbyHandler._get_gamepad_input_texture_data = function (self, input_service, input_action, ignore_keybinding)
	local platform = PLATFORM

	if platform == "win32" then
		platform = "xb1"
	end

	if ignore_keybinding then
		return ButtonTextureByName(input_action, platform)
	else
		return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
	end
end

PopupJoinLobbyHandler._update_gamepad_input_buttons = function (self)
	local ui_renderer = self.ui_renderer
	local widgets_by_name = self._widgets_by_name
	local gamepad_select_button = widgets_by_name.gamepad_select_button
	local gamepad_cancel_button = widgets_by_name.gamepad_cancel_button
	local input_service = Managers.input:get_service("popup_join_lobby_handler")
	local select_action_texture_data = self:_get_gamepad_input_texture_data(input_service, gamepad_select_button.content.input_action)
	local cancel_action_texture_data = self:_get_gamepad_input_texture_data(input_service, gamepad_cancel_button.content.input_action)
	gamepad_select_button.content.icon = select_action_texture_data.texture
	gamepad_cancel_button.content.icon = cancel_action_texture_data.texture
	local select_button_text = gamepad_select_button.content.text
	local cancel_button_text = gamepad_cancel_button.content.text
	local button_style = gamepad_select_button.style
	local text_style = button_style.text
	local font, scaled_font_size = UIFontByResolution(text_style)
	local select_text_width = UIRenderer.text_size(ui_renderer, select_button_text, font[1], scaled_font_size)
	local cancel_text_width = UIRenderer.text_size(ui_renderer, cancel_button_text, font[1], scaled_font_size)
	gamepad_select_button.style.icon.offset[1] = -(select_text_width * 0.5) - 40
	gamepad_cancel_button.style.icon.offset[1] = -(cancel_text_width * 0.5) - 40
end

return
