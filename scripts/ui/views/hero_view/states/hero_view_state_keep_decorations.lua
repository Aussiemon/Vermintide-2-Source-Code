local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_keep_decorations_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
HeroViewStateKeepDecorations = class(HeroViewStateKeepDecorations)
HeroViewStateKeepDecorations.NAME = "HeroViewStateKeepDecorations"

HeroViewStateKeepDecorations.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateKeepDecorations")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.voting_manager = ingame_ui_context.voting_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.wwise_world = params.wwise_world
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	local input_service = self:input_service()
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 3, 100, generic_input_actions)

	self.menu_input_description:set_input_description(nil)

	self.is_server = self.parent.is_server
	self._animations = {}
	self._ui_animations = {}
	self._decoration_system = Managers.state.entity:system("keep_decoration_system")

	self:create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	self:play_sound("Play_hud_trophy_open")

	local state_params = params.state_params
	local interactable_unit = state_params.interactable_unit
	self._interactable_unit = interactable_unit
	local camera_interaction_name = Unit.get_data(interactable_unit, "interaction_data", "camera_interaction_name")
	local hide_character = Unit.get_data(interactable_unit, "interaction_data", "hide_character")
	self._hide_character = hide_character
	local player = Managers.player:local_player()

	if player then
		UISettings.map.camera_time_enter = Unit.get_data(interactable_unit, "interaction_data", "camera_transition_time_in") or 0.5
		UISettings.map.camera_time_exit = Unit.get_data(interactable_unit, "interaction_data", "camera_transition_time_out") or 0.5
		local params = {
			camera_interaction_name = camera_interaction_name
		}

		CharacterStateHelper.change_camera_state(player, "camera_state_interaction", params)

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

			first_person_extension:abort_toggle_visibility_timer()
			first_person_extension:abort_first_person_units_visibility_timer()

			if hide_character then
				if not first_person_extension:first_person_mode_active() then
					first_person_extension:set_first_person_mode(true)
				end

				if first_person_extension:first_person_units_visible() then
					first_person_extension:toggle_first_person_units_visibility("third_person_mode")
				end
			elseif first_person_extension:first_person_mode_active() then
				first_person_extension:set_first_person_mode(false)
			end
		end
	end

	local decoration_settings_key = Unit.get_data(interactable_unit, "decoration_settings_key")

	if decoration_settings_key then
		self._customizable_decoration = true
	else
		self:_initialize_simple_decoration_preview()
	end
end

HeroViewStateKeepDecorations._initialize_simple_decoration_preview = function (self)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.list.content.visible = false
	widgets_by_name.list_scrollbar.content.visible = false
	widgets_by_name.confirm_button.content.visible = false
	local interactable_unit = self._interactable_unit
	local hud_text_line_1 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_1")
	local hud_text_line_2 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_2")

	self:_set_selected_title(Localize(hud_text_line_1))
	self:_set_selected_description(Localize(hud_text_line_2))
end

HeroViewStateKeepDecorations.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateKeepDecorations")

	self.ui_animator = nil

	if self._customizable_decoration then
		local interactable_unit = self._interactable_unit

		self._decoration_system:reset_selection(interactable_unit)
	end

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	self:play_sound("Stop_trophy_music")

	local player = Managers.player:local_player()

	if player then
		CharacterStateHelper.change_camera_state(player, "follow")

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

			first_person_extension:abort_toggle_visibility_timer()
			first_person_extension:abort_first_person_units_visibility_timer()

			local delay = UISettings.map.camera_time_exit or 0.5

			if not first_person_extension:first_person_mode_active() then
				first_person_extension:toggle_visibility(delay)
			elseif not first_person_extension:first_person_units_visible() then
				first_person_extension:toggle_first_person_units_visibility("third_person_mode", delay)
			end
		end
	end
end

HeroViewStateKeepDecorations.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self:_activate_list()
end

HeroViewStateKeepDecorations._set_color_alpha_intensity = function (self, color, fraction)
	self:_set_color_values(color, color[1] * fraction)
end

HeroViewStateKeepDecorations._set_color_intensity = function (self, color, fraction)
	self:_set_color_values(color, nil, color[2] * fraction, color[3] * fraction, color[4] * fraction)
end

HeroViewStateKeepDecorations._set_color_values = function (self, color, p1, p2, p3, p4)
	color[1] = p1 or color[1]
	color[2] = p2 or color[2]
	color[3] = p3 or color[3]
	color[4] = p4 or color[4]
end

HeroViewStateKeepDecorations.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

HeroViewStateKeepDecorations._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

HeroViewStateKeepDecorations.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

HeroViewStateKeepDecorations.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

HeroViewStateKeepDecorations._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

HeroViewStateKeepDecorations.input_service = function (self)
	return self.parent:input_service()
end

HeroViewStateKeepDecorations.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local input_service = (self._input_blocked and fake_input_service) or self:input_service()

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	local transitioning = self.parent:transitioning()
	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		if not transitioning then
			if self:_has_active_level_vote() then
				local ignore_sound_on_close_menu = true

				self:close_menu(ignore_sound_on_close_menu)
			else
				self:_handle_input(dt, t)
			end
		end

		if wanted_state or self._new_state then
			self.parent:clear_wanted_state()

			return wanted_state or self._new_state
		end
	end
end

HeroViewStateKeepDecorations._has_active_level_vote = function (self)
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager:vote_in_progress()
	local is_mission_vote = active_vote_name == "game_settings_vote" or active_vote_name == "game_settings_deed_vote"

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

HeroViewStateKeepDecorations.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)
end

HeroViewStateKeepDecorations._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
	local close_button = widgets_by_name.close_button
	local confirm_button = widgets_by_name.confirm_button

	UIWidgetUtils.animate_default_button(close_button, dt)
	UIWidgetUtils.animate_default_button(confirm_button, dt)
end

HeroViewStateKeepDecorations._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

HeroViewStateKeepDecorations._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

HeroViewStateKeepDecorations._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroViewStateKeepDecorations._handle_input = function (self, dt, t)
	local input_service = (self._input_blocked and fake_input_service) or self:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_pressed = input_service:get("toggle_menu")
	local input_close_pressed = gamepad_active and input_service:get("back")
	local widgets_by_name = self._widgets_by_name
	local close_button = widgets_by_name.close_button
	local confirm_button = widgets_by_name.confirm_button

	if self:_is_button_hover_enter(close_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

	if self._customizable_decoration then
		local decoration_system = self._decoration_system
		local interactable_unit = self._interactable_unit

		if self:_is_button_pressed(confirm_button) then
			decoration_system:confirm_selection(interactable_unit)
		end

		local list_index = self:_list_index_pressed()

		if list_index then
			self:_on_list_index_selected(list_index)
		end

		self:_update_mouse_scroll_input()
		self:_animate_list_entries(dt)
	end

	if input_pressed or self:_is_button_pressed(close_button) or input_close_pressed then
		self:play_sound("Play_hud_hover")
		self:close_menu()

		return
	end
end

HeroViewStateKeepDecorations.close_menu = function (self, ignore_sound_on_close_menu)
	ignore_sound_on_close_menu = true

	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

HeroViewStateKeepDecorations.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroViewStateKeepDecorations._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroViewStateKeepDecorations.play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateKeepDecorations._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

HeroViewStateKeepDecorations.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

HeroViewStateKeepDecorations.block_input = function (self)
	self._input_blocked = true
end

HeroViewStateKeepDecorations.unblock_input = function (self)
	self._input_blocked = false
end

HeroViewStateKeepDecorations.input_blocked = function (self)
	return self._input_blocked
end

HeroViewStateKeepDecorations._populate_list = function (self, layout)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local num_entries = #layout

	for i = 1, num_entries, 1 do
		local entry = layout[i]
		local title = ""
		local name = ""
		local entry_type = entry.type

		if entry_type == "title" then
			title = entry.display_name
		elseif entry_type == "entry" then
			name = entry.display_name
		end

		local content = list_content[i]
		content.name = UIRenderer.crop_text_width(self.ui_renderer, name, 300, item_styles[i].name)
		content.title = UIRenderer.crop_text_width(self.ui_renderer, title, 300, item_styles[i].title)
	end

	style.num_draws = num_entries

	self:_update_scroll_height()
end

HeroViewStateKeepDecorations._list_index_pressed = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local num_draws = style.num_draws

	for i = 1, num_draws, 1 do
		local content = list_content[i]
		local hotspot = content.button_hotspot

		if hotspot and hotspot.on_release then
			hotspot.on_release = false

			return i
		end
	end
end

HeroViewStateKeepDecorations._on_list_index_selected = function (self, index)
	local decoration_system = self._decoration_system
	local interactable_unit = self._interactable_unit

	decoration_system:cycle_next(interactable_unit)
	self:_set_selected_title("placeholder_title_text_" .. index)
	self:_set_selected_description("placeholder_description_text_" .. index)
end

HeroViewStateKeepDecorations._set_selected_title = function (self, title_text)
	local widget = self._widgets_by_name.title_text
	widget.content.text = title_text
end

HeroViewStateKeepDecorations._set_selected_description = function (self, description_text)
	local widget = self._widgets_by_name.description_text
	widget.content.text = description_text
end

HeroViewStateKeepDecorations._activate_list = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list
	local temp_list_entries = {}

	for i = 1, 40, 1 do
		temp_list_entries[i] = {
			type = "entry",
			display_name = i .. " - THIS IS A PLACEHOLDER"
		}
	end

	self:_populate_list(temp_list_entries)
end

HeroViewStateKeepDecorations._setup_scrollbar = function (self, height, optional_value)
	local widget = self._widgets_by_name.list_scrollbar
	local scenegraph_id = widget.scenegraph_id
	local scrollbar_size_y = self.ui_scenegraph[scenegraph_id].size[2]
	local percentage = math.min(scrollbar_size_y / height, 1)
	widget.content.scroll_bar_info.bar_height_percentage = percentage

	self:_set_scrollbar_value(optional_value or 0)

	local scroll_step_multiplier = 2
	local entry_height = 50
	local scroll_amount = math.max(entry_height / self.total_scroll_height, 0) * scroll_step_multiplier
	self._widgets_by_name.list.content.scrollbar.scroll_amount = scroll_amount
end

HeroViewStateKeepDecorations._update_mouse_scroll_input = function (self)
	local using_scrollbar = true

	if using_scrollbar then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.list_scrollbar
		local list_widget = widgets_by_name.list

		if widget.content.scroll_bar_info.on_pressed then
			list_widget.content.scrollbar.scroll_add = nil
		end

		local mouse_scroll_value = list_widget.content.scrollbar.scroll_value

		if not mouse_scroll_value then
			return
		end

		local scroll_bar_value = widget.content.scroll_bar_info.value
		local current_scroll_value = self.scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self:_set_scrollbar_value(mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self:_set_scrollbar_value(scroll_bar_value)
		end
	end
end

HeroViewStateKeepDecorations._set_scrollbar_value = function (self, value)
	local current_scroll_value = self.scroll_value

	if value then
		local widgets_by_name = self._widgets_by_name
		local widget = widgets_by_name.list_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		widgets_by_name.list.content.scrollbar.scroll_value = value
		local list_widget = self._widgets_by_name.list
		local list_style = list_widget.style.list_style
		local list_scenegraph_id = list_style.scenegraph_id
		local scenegraph_node = self.ui_scenegraph[list_scenegraph_id]
		local scenegraph_pos = scenegraph_node.local_position
		local list_window_size = scenegraph_definition.list_window.size
		scenegraph_pos[2] = -list_window_size[2] + self.total_scroll_height * value
		self.scroll_value = value
	end
end

HeroViewStateKeepDecorations._update_scroll_height = function (self, optional_scroll_value)
	local total_height = self:_calculate_scroll_height()
	local list_size = scenegraph_definition.list.size
	self.total_scroll_height = math.max(total_height - list_size[2], 0)

	self:_setup_scrollbar(total_height, optional_scroll_value)
end

HeroViewStateKeepDecorations._calculate_scroll_height = function (self)
	local widget = self._widgets_by_name.list
	local list_style = widget.style.list_style
	local list_member_offset_y = list_style.list_member_offset[2]
	local num_draws = list_style.num_draws
	local total_size = nil

	if num_draws == 0 then
		total_size = math.abs(list_member_offset_y)
	else
		total_size = math.abs(list_member_offset_y * num_draws)
	end

	return total_size
end

HeroViewStateKeepDecorations._animate_list_entries = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.list
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local num_draws = style.num_draws

	for i = 1, num_draws, 1 do
		local content = list_content[i]
		local style = item_styles[i]

		self:_animate_list_entry(content, style, dt)
	end
end

HeroViewStateKeepDecorations._animate_list_entry = function (self, content, style, dt)
	local hotspot = content.button_hotspot or content.hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 14
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress
	style.hover_frame.color[1] = hover_alpha
	local name_text_style = style.name
	local name_text_color = name_text_style.text_color
	local name_default_text_color = name_text_style.default_text_color
	local name_select_text_color = name_text_style.select_text_color

	Colors.lerp_color_tables(name_default_text_color, name_select_text_color, combined_progress, name_text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

return
