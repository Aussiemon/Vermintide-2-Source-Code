local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_character_selection_console_definitions")
local widget_definitions = definitions.widgets
local hero_widget_definition = definitions.hero_widget
local empty_hero_widget_definition = definitions.empty_hero_widget
local hero_icon_widget_definition = definitions.hero_icon_widget
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local DO_RELOAD = false
HeroWindowCharacterSelectionConsole = class(HeroWindowCharacterSelectionConsole)
HeroWindowCharacterSelectionConsole.NAME = "HeroWindowCharacterSelectionConsole"

HeroWindowCharacterSelectionConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCharacterSelectionConsole")

	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._parent = params.parent
	self._wwise_world = params.wwise_world
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._hero_name = params.hero_name
	self._career_index = params.career_index or 0
	self._profile_index = params.profile_index or 0
	self._profile_selectable = false
	self._animations = {}
	self._ui_animations = {}
	local local_player = Managers.player:local_player()
	self._peer_id = local_player:network_id()
	self._local_player_id = local_player:local_player_id()
	local gui_layer = UILayer.default + 30
	local input_description_input_service = self._parent:window_input_service()
	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self._ui_top_renderer, input_description_input_service, 4, gui_layer + 100, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter", "on_enter")

	if self._profile_index > 0 and self._career_index > 0 then
		self:_select_hero(self._profile_index, self._career_index, true)
	else
		local profile_index, career_index = self._profile_synchronizer:profile_by_peer(self._peer_id, self._local_player_id)

		if profile_index and career_index then
			self._profile_index = profile_index
			self._career_index = career_index
			local hero_attributes = Managers.backend:get_interface("hero_attributes")

			self:_select_hero(profile_index, career_index, true)
		end
	end
end

HeroWindowCharacterSelectionConsole._select_hero = function (self, profile_index, career_index, initial_selection)
	if not initial_selection then
		self:_play_sound("play_gui_hero_select_career_click")
	end

	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local character_career_name = career_settings.display_name

	GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", character_career_name == "bw_necromancer")

	local hero_display_name = Localize(character_name)
	local career_display_name = Localize(character_career_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(hero_experience)

	self:_set_hero_info(hero_display_name, career_display_name, level)

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name
	self._selected_hero_row = ProfileIndexToPriorityIndex[profile_index]
	self._selected_hero_column = career_index

	self:_set_hero_icon_selected(self._selected_hero_row)

	local widget_index = 1
	local info_text_content = self._widgets_by_name.info_text.content
	local spawn_character = true

	for i = 1, num_max_rows do
		local num_max_columns = self._num_hero_columns[i]

		for j = 1, num_max_columns do
			local is_selected = i == self._selected_hero_row and j == self._selected_hero_column
			local widget = hero_widgets[widget_index]
			local content = widget.content
			content.button_hotspot.is_selected = is_selected
			widget_index = widget_index + 1

			if is_selected then
				local selectable = not content.locked
				local dlc_name = content.dlc_name

				self:_update_selectable(selectable, dlc_name)

				spawn_character = selectable
			end
		end
	end

	if not initial_selection then
		if spawn_character then
			Managers.state.event:trigger("respawn_hero", {
				hero_name = hero_name,
				career_index = career_index
			})
		else
			Managers.state.event:trigger("despawn_hero")
		end
	end
end

HeroWindowCharacterSelectionConsole._update_selectable = function (self, selectable, dlc_name)
	local select_button = self._widgets_by_name.select_button
	select_button.content.button_hotspot.disable_button = not selectable
	select_button.content.dlc_name = not selectable and dlc_name
	self._widgets_by_name.info_text.content.visible = selectable
	local input_action = "default"

	if not selectable then
		input_action = "hero_unavailable"

		if dlc_name then
			input_action = "dlc_unavailable"
		end
	end

	self._menu_input_description:change_generic_actions(generic_input_actions[input_action])
end

HeroWindowCharacterSelectionConsole._set_hero_icon_selected = function (self, index)
	for icon_index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.selected = icon_index == index
	end
end

HeroWindowCharacterSelectionConsole._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

HeroWindowCharacterSelectionConsole._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

HeroWindowCharacterSelectionConsole._create_ui_elements = function (self, params, offset)
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

	self:_setup_hero_selection_widgets()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowCharacterSelectionConsole._setup_hero_selection_widgets = function (self)
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local current_profile_index, current_career_index = self._profile_synchronizer:profile_by_peer(self._peer_id, self._local_player_id)
	local num_max_rows = #SPProfilesAbbreviation
	local bot_spawn_priority = PlayerData.bot_spawn_priority

	if not bot_spawn_priority[1] then
		bot_spawn_priority = ProfileIndexToPriorityIndex
	end

	self._num_hero_columns = {}

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		self._num_hero_columns[i] = #careers
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[2] = -((i - 1) * 144)
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_selected = hero_icon_texture .. "_glow"

		for j, career in ipairs(careers) do
			local widget = UIWidget.init(hero_widget_definition)
			hero_widgets[#hero_widgets + 1] = widget
			local offset = widget.offset
			local content = widget.content
			content.career_settings = career
			local portrait_image = career.portrait_image
			content.portrait = "medium_" .. portrait_image
			local is_career_unlocked, reason, dlc_name, localized = career:is_unlocked_function(hero_name, hero_level)
			content.locked = not is_career_unlocked
			content.locked_reason = not is_career_unlocked and (localized and reason or Localize(reason))
			content.dlc_name = dlc_name

			if reason == "dlc_not_owned" then
				content.lock_texture = content.lock_texture .. "_gold"
				content.frame = content.frame .. "_gold"
			end

			local career_index = hero_attributes:get(hero_name, "career")
			local bot_career_index = hero_attributes:get(hero_name, "bot_career") or career_index or 1

			if bot_career_index == j then
				content.bot_selected = true
			end

			if current_profile_index == profile_index and current_career_index == j then
				content.is_currently_selected_character = true
			end

			offset[1] = (j - 1) * 124
			offset[2] = -((i - 1) * 144)
		end

		local widgets = self._widgets

		for j = #careers + 1, 4 do
			local widget = UIWidget.init(empty_hero_widget_definition)
			local offset = widget.offset
			offset[1] = offset[1] + 124 * (j - 1)
			offset[2] = offset[2] - 144 * (i - 1)
			widgets[#widgets + 1] = widget
		end
	end

	self._num_max_hero_rows = num_max_rows
end

HeroWindowCharacterSelectionConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCharacterSelectionConsole")

	self._ui_animator = nil
	local profile_index, career_index, hero_name = self._parent:currently_selected_profile()

	if self._selected_profile_index ~= profile_index or self._selected_career_index ~= career_index then
		Managers.state.event:trigger("respawn_hero", {
			hero_name = hero_name,
			career_index = career_index
		})

		local profile = SPProfiles[profile_index]
		local career = profile.careers[career_index]
		local career_name = career.name

		GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", career_name == "bw_necromancer")
	end
end

HeroWindowCharacterSelectionConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_animations(dt)
	self:_update_input(dt)
	self:_draw(dt)
end

HeroWindowCharacterSelectionConsole.post_update = function (self, dt, t)
	return
end

HeroWindowCharacterSelectionConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowCharacterSelectionConsole._update_input = function (self, dt)
	local input_service = self._parent:window_input_service()

	self:_handle_gamepad_selection(input_service)
	self:_handle_mouse_selection()

	local current_profile_index, current_career_index = self._profile_synchronizer:profile_by_peer(self._peer_id, self._local_player_id)
	local select_button = self._widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	if UIUtils.is_button_hover_enter(select_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local confirm_available = not select_button.content.button_hotspot.disable_button
	local confirm_pressed = input_service:get("confirm", true)
	local back_pressed = gamepad_active and self.allow_back_button and input_service:get("back_menu", true)

	if (UIUtils.is_button_pressed(select_button) or confirm_pressed) and confirm_available then
		self:_play_sound("play_gui_start_menu_button_click")

		local dlc_name = select_button.content.verify_dlc_name

		if dlc_name and Managers.unlock:dlc_requires_restart(dlc_name) then
			self._parent:close_menu()

			return
		end

		self._parent:change_profile(self._selected_profile_index, self._selected_career_index)

		local previous_layout_key = self._parent:get_previous_selected_game_mode_index()

		self._parent:set_layout(previous_layout_key or 1)
	elseif confirm_pressed and select_button.content.dlc_name then
		self:_play_sound("play_gui_start_menu_button_click")
		Managers.state.event:trigger("ui_show_popup", select_button.content.dlc_name, "upsell")
	end
end

HeroWindowCharacterSelectionConsole._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local widget_index = 1

	for i = 1, num_max_rows do
		local num_max_columns = self._num_hero_columns[i]

		for j = 1, num_max_columns do
			local widget = hero_widgets[widget_index]
			local content = widget.content
			local button_hotspot = content.button_hotspot

			if not content.locked and button_hotspot.on_pressed and (i ~= selected_row or j ~= selected_column) then
				local profile_index = ProfilePriority[i]
				local career_index = j

				self:_select_hero(profile_index, career_index)

				return
			elseif content.dlc_name and button_hotspot.on_pressed and (i ~= selected_row or j ~= selected_column) then
				Managers.state.event:trigger("ui_show_popup", content.dlc_name, "upsell")
			end

			widget_index = widget_index + 1
		end
	end
end

HeroWindowCharacterSelectionConsole._handle_gamepad_selection = function (self, input_service)
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_hero_columns[selected_row]

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
			num_max_columns = self._num_hero_columns[selected_row]
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			num_max_columns = self._num_hero_columns[selected_row]
			modified = true
		end

		if num_max_columns < selected_column then
			selected_column = num_max_columns
			modified = true
		end

		if modified then
			local profile_index = ProfilePriority[selected_row]
			local career_index = selected_column

			self:_select_hero(profile_index, career_index)
		end
	end
end

HeroWindowCharacterSelectionConsole.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowCharacterSelectionConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCharacterSelectionConsole._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_icon_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowCharacterSelectionConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end
