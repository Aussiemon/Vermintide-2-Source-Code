local definitions = local_require("scripts/ui/views/popup_profile_picker_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local hero_widget_definition = definitions.hero_widget_definition
local hero_icon_widget_definition = definitions.hero_icon_widget_definition
PopupProfilePicker = class(PopupProfilePicker)

PopupProfilePicker.init = function (self, ingame_ui_context, ...)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._wwise_world = ingame_ui_context.wwise_world
	self._render_settings = {
		snap_pixel_positions = true
	}
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager

	input_manager:create_input_service("popup_profile_picker", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("popup_profile_picker", "keyboard")
	input_manager:map_device_to_service("popup_profile_picker", "mouse")
	input_manager:map_device_to_service("popup_profile_picker", "gamepad")

	local input_service = input_manager:get_service("popup_profile_picker")
	self._menu_input_desc = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 5, 900, definitions.generic_input_actions.default)

	self._menu_input_desc:set_input_description(nil)
	self:_create_ui_elements()
	self:show(...)
end

PopupProfilePicker._create_ui_elements = function (self)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	self._num_max_hero_columns = #ProfilePriority
	self._num_max_career_columns = 4

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[1] = (i - 1) * 124
		local hero_icon_texture = profile_settings.hero_selection_image
		icon_widget.content.icon = hero_icon_texture
	end

	for i = 1, 4, 1 do
		local widget = UIWidget.init(hero_widget_definition)
		hero_widgets[i] = widget
		local offset = widget.offset
		offset[1] = (i - 1) * 124 + 62
	end
end

PopupProfilePicker.update = function (self, dt, t)
	self:_update_occupied_profiles()

	local ui_top_renderer = self._ui_top_renderer
	local input_service = self:input_service()

	if self._cancel_timer then
		self._cancel_timer = math.max(self._cancel_timer - dt, 0)
		local timer_text = tostring(math.ceil(self._cancel_timer))

		self:_set_timer_text(timer_text)

		if self._cancel_timer <= 0 then
			local accepted = false

			self:set_result(accepted)
		end
	end

	self:_handle_input(dt, t)
	self:draw(ui_top_renderer, input_service, dt)
end

PopupProfilePicker._INPUT_DEVICES = {
	"keyboard",
	"gamepad",
	"mouse"
}

PopupProfilePicker.show = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, _difficulty, lobby_data)
	self._join_lobby_result = nil
	self._lobby_data = lobby_data

	self._ingame_ui:handle_transition((join_by_lobby_browser and "exit_menu") or "close_active")
	ShowCursorStack.push()

	local profile_index = current_profile_index or 1
	local career_index = current_career_index or 1
	local ignore_sound = true

	self:_select_hero(profile_index, career_index, ignore_sound)

	self._cancel_timer = time_until_cancel
	local input_manager = self._input_manager

	input_manager:capture_input(self._INPUT_DEVICES, 1, "popup_profile_picker", "PopupProfilePicker")
end

PopupProfilePicker.hide = function (self)
	local input_manager = self._input_manager

	input_manager:release_input(self._INPUT_DEVICES, 1, "popup_profile_picker", "PopupProfilePicker")
	ShowCursorStack.pop()

	self._selected_hero_name = nil
	self._selected_career_name = nil
	self._lobby_data = nil
end

PopupProfilePicker.input_service = function (self)
	return self._input_manager:get_service("popup_profile_picker")
end

PopupProfilePicker.draw = function (self, ui_top_renderer, input_service, dt)
	UIRenderer.begin_pass(ui_top_renderer, self._ui_scenegraph, input_service, dt, nil, self._render_settings)

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

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self._menu_input_desc:draw(ui_top_renderer, dt)
	end
end

PopupProfilePicker.set_result = function (self, accepted)
	local selected_hero_name = accepted and self._selected_hero_name
	local selected_career_name = accepted and self._selected_career_name
	self._join_lobby_result = {
		accepted = accepted,
		selected_hero_name = selected_hero_name,
		selected_career_name = selected_career_name
	}
end

PopupProfilePicker.query_result = function (self)
	return self._join_lobby_result
end

PopupProfilePicker.destroy = function (self)
	return
end

PopupProfilePicker._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = Managers.input:get_service("popup_profile_picker")

	self:_handle_mouse_selection()
	self:_handle_gamepad_selection(input_service)

	local select_button = widgets_by_name.select_button
	local cancel_button = widgets_by_name.cancel_button

	UIWidgetUtils.animate_default_button(select_button, dt)
	UIWidgetUtils.animate_default_button(cancel_button, dt)

	if UIUtils.is_button_hover_enter(select_button) or UIUtils.is_button_hover_enter(cancel_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self._selection_approved and (UIUtils.is_button_pressed(widgets_by_name.select_button) or input_service:get("confirm", true)) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(true)
	elseif UIUtils.is_button_pressed(widgets_by_name.cancel_button) or input_service:get("back_menu", true) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(false)
	end
end

PopupProfilePicker._handle_mouse_selection = function (self)
	local hero_icon_widgets = self._hero_icon_widgets

	for i = 1, #hero_icon_widgets, 1 do
		local widget = hero_icon_widgets[i]
		local content = widget.content

		if not content.taken then
			local button_hotspot = content.button_hotspot

			if button_hotspot.on_hover_enter then
				self:_play_sound("play_gui_hero_select_hero_hover")
			end

			if button_hotspot.on_pressed and i ~= self._selected_hero_column then
				local profile_index = ProfilePriority[i]
				local career_index = math.min(self._selected_career_index, #SPProfiles[profile_index].careers)

				self:_select_hero(profile_index, career_index)

				return
			end
		end
	end

	local hero_widgets = self._hero_widgets

	for i = 1, #hero_widgets, 1 do
		local widget = hero_widgets[i]
		local content = widget.content

		if content.exists and not content.taken and not content.locked then
			local button_hotspot = content.button_hotspot

			if button_hotspot.on_hover_enter then
				self:_play_sound("play_gui_hero_select_career_hover")
			end

			if button_hotspot.on_pressed and i ~= self._selected_career_column then
				local profile_index = self._selected_profile_index
				local career_index = i

				self:_select_hero(profile_index, career_index)

				return
			end
		end
	end
end

PopupProfilePicker._handle_gamepad_selection = function (self, input_service)
	local num_max_hero_columns = self._num_max_hero_columns
	local num_max_career_columns = self._num_max_career_columns
	local selected_hero_column = self._selected_hero_column
	local selected_career_column = self._selected_career_column

	if selected_hero_column and selected_career_column then
		local modified = false

		if selected_hero_column > 1 and input_service:get("cycle_previous") then
			selected_hero_column = selected_hero_column - 1
			modified = true
		elseif selected_hero_column < num_max_hero_columns and input_service:get("cycle_next") then
			selected_hero_column = selected_hero_column + 1
			modified = true
		end

		if selected_career_column > 1 and input_service:get("move_left") then
			selected_career_column = selected_career_column - 1
			modified = true
		elseif selected_career_column < num_max_career_columns and input_service:get("move_right") then
			selected_career_column = selected_career_column + 1
			modified = true
		end

		if modified then
			local profile_index = ProfilePriority[selected_hero_column]
			local career_index = selected_career_column

			self:_select_hero(profile_index, career_index)
		end
	end
end

PopupProfilePicker._select_hero = function (self, profile_index, career_index, ignore_sound)
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local backend_dlcs = Managers.backend:get_interface("dlcs")

	if not career_settings or backend_dlcs:is_unreleased_career(career_settings.name) then
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
	self._selected_hero_column = ProfileIndexToPriorityIndex[profile_index]
	self._selected_career_column = career_index

	self:_set_hero_icon_selected(self._selected_hero_column)

	local backend_dlcs = Managers.backend:get_interface("dlcs")

	for i, widget in ipairs(self._hero_widgets) do
		local career = profile_settings.careers[i]
		local content = widget.content
		local available = career and not backend_dlcs:is_unreleased_career(career.name)
		content.exists = available

		if available then
			content.career_settings = career
			content.portrait = career.picking_image or "medium_" .. career.portrait_image
			local is_career_unlocked, _, dlc_name = career:is_unlocked_function(hero_name, level)
			content.locked = not is_career_unlocked

			if dlc_name then
				content.lock_texture = "hero_icon_locked_gold"
				content.frame = "menu_frame_12_gold"
			else
				content.lock_texture = "hero_icon_locked"
				content.frame = "menu_frame_12"
			end

			content.button_hotspot.is_selected = i == self._selected_career_column
		end
	end

	if not ignore_sound then
		self:_play_sound("play_gui_hero_select_hero_click")
	end
end

PopupProfilePicker._set_hero_icon_selected = function (self, index)
	for icon_index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.button_hotspot.is_selected = icon_index == index
	end
end

PopupProfilePicker._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

PopupProfilePicker._set_timer_text = function (self, timer_text)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.timer_text.content.text = timer_text
end

PopupProfilePicker.set_unavailable_heroes = function (self, occupied_heroes)
	self._occupied_heroes = occupied_heroes

	self:_update_occupied_profiles()
end

PopupProfilePicker.set_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

PopupProfilePicker._update_occupied_profiles = function (self)
	local lobby_data = self._lobby_data
	local hero_widgets = self._hero_widgets
	local hero_icon_widgets = self._hero_icon_widgets
	local is_button_enabled = false

	for i = 1, #hero_icon_widgets, 1 do
		local profile_index = ProfilePriority[i]
		local occupied = self._lobby_data and not ProfileSynchronizer.is_free_in_lobby(profile_index, lobby_data)
		local widget = hero_icon_widgets[i]
		local content = widget.content
		local button_hotspot = content.button_hotspot
		content.taken = occupied
	end

	if self._lobby_data then
		local taken = not ProfileSynchronizer.is_free_in_lobby(self._selected_profile_index, lobby_data)

		for i = 1, #hero_widgets, 1 do
			local widget = hero_widgets[i]
			local content = widget.content
			content.taken = taken
		end
	end

	local widget = hero_widgets[self._selected_career_column]
	local content = widget.content

	if content.button_hotspot.is_selected and not content.taken and not content.locked then
		is_button_enabled = true
	end

	self:set_select_button_enable_state(is_button_enabled)
end

PopupProfilePicker._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

PopupProfilePicker.set_select_button_enable_state = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled
	self._selection_approved = enabled

	if enabled then
		self._menu_input_desc:set_input_description(definitions.generic_input_actions.confirm_available)
	else
		self._menu_input_desc:set_input_description(nil)
	end
end

PopupProfilePicker._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

return
