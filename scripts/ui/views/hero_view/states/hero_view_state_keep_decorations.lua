-- chunkname: @scripts/ui/views/hero_view/states/hero_view_state_keep_decorations.lua

require("scripts/ui/helpers/scrollbar_logic")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_keep_decorations_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local entry_widget_definition = definitions.entry_widget_definition
local dummy_entry_widget_definition = definitions.dummy_entry_widget_definition
local input_actions = definitions.input_actions
local DO_RELOAD = false
local LIST_SPACING = 4
local LIST_MAX_WIDTH = 800
local DIALOGUE_DELAY = 1

HeroViewStateKeepDecorations = class(HeroViewStateKeepDecorations)
HeroViewStateKeepDecorations.NAME = "HeroViewStateKeepDecorations"

HeroViewStateKeepDecorations.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateKeepDecorations")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._voting_manager = ingame_ui_context.voting_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._wwise_world = params.wwise_world
	self._is_server = ingame_ui_context.is_server

	local input_service = self:input_service()

	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self._ui_top_renderer, input_service, 3, 100, generic_input_actions)

	self._menu_input_description:set_input_description(nil)

	self._animations = {}
	self._ui_animations = {}
	self._decoration_system = Managers.state.entity:system("keep_decoration_system")
	self._keep_decoration_backend_interface = Managers.backend:get_interface("keep_decorations")

	self:_create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	self:_play_sound("Play_hud_trophy_open")

	local state_params = params.state_params
	local interactable_unit = state_params.interactable_unit

	self._interactable_unit = interactable_unit
	self._type = state_params.type

	if self._type == "painting" then
		self._default_table = DefaultPaintings
		self._main_table = Paintings
		self._ordered_table = PaintingOrder
		self._empty_decoration_name = "hor_none"
	elseif self._type == "trophy" then
		self._default_table = DefaultTrophies
		self._main_table = Trophies
		self._ordered_table = TrophyOrder
		self._empty_decoration_name = "hub_trophy_empty"
	end

	self._default_decorations = {}

	table.append(self._default_decorations, DefaultPaintings)
	table.append(self._default_decorations, DefaultTrophies)

	local camera_interaction_name = Unit.get_data(interactable_unit, "interaction_data", "camera_interaction_name")
	local hide_character = Unit.get_data(interactable_unit, "interaction_data", "hide_character")

	self._hide_character = hide_character

	local player = Managers.player:local_player()

	if player then
		UISettings.map.camera_time_enter = Unit.get_data(interactable_unit, "interaction_data", "camera_transition_time_in") or 0.5
		UISettings.map.camera_time_exit = Unit.get_data(interactable_unit, "interaction_data", "camera_transition_time_out") or 0.5

		local params = {
			camera_interaction_name = camera_interaction_name,
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
		local keep_decoration_extension = ScriptUnit.extension(interactable_unit, "keep_decoration_system")
		local selected_decoration = keep_decoration_extension:get_selected_decoration()

		self._keep_decoration_extension = keep_decoration_extension

		local view_only = Unit.get_data(interactable_unit, "interaction_data", "view_only") or not self._is_server

		if view_only then
			self:_set_info_by_decoration_key(selected_decoration, false)
		else
			self._customizable_decoration = true

			self:_setup_decorations_list()

			local start_index = 1
			local widgets = self._list_widgets

			for i = 1, #widgets do
				if widgets[i].content.key == selected_decoration then
					start_index = i

					break
				end
			end

			self:_on_list_index_selected(start_index)

			local start_scroll_percentage = self:_get_scrollbar_percentage_by_index(start_index)

			self._scrollbar_logic:set_scroll_percentage(start_scroll_percentage)
		end
	else
		self:_initialize_simple_decoration_preview()
	end

	if not self._customizable_decoration then
		self:_disable_list_widgets()
	end
end

HeroViewStateKeepDecorations._disable_list_widgets = function (self)
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.list_mask.content.visible = false
	widgets_by_name.list_scrollbar.content.visible = false
	widgets_by_name.confirm_button.content.visible = false
	widgets_by_name.list_detail_top.content.visible = false
	widgets_by_name.list_detail_bottom.content.visible = false
end

HeroViewStateKeepDecorations._initialize_simple_decoration_preview = function (self)
	local interactable_unit = self._interactable_unit
	local hud_text_line_1 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_1")
	local hud_text_line_2 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_2")
	local sound_event = Unit.get_data(interactable_unit, "interaction_data", "sound_event")

	if sound_event and sound_event ~= "" then
		self._sound_event = sound_event
		self._sound_event_delay = self._sound_event and DIALOGUE_DELAY or nil
	end

	local title = Localize(hud_text_line_1)
	local description = Localize(hud_text_line_2)

	self:_set_info_texts(title, description)
end

HeroViewStateKeepDecorations.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateKeepDecorations")

	self.ui_animator = nil

	if self._customizable_decoration then
		local interactable_unit = self._interactable_unit
		local keep_decoration_extension = ScriptUnit.extension(interactable_unit, "keep_decoration_system")

		keep_decoration_extension:reset_selection()
	end

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	self:_play_sound("Stop_all_keep_decorations_desc_vo")
	self:_play_sound("Stop_trophy_music")

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

HeroViewStateKeepDecorations._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

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

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	local scrollbar_widget = self._widgets_by_name.list_scrollbar

	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
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

HeroViewStateKeepDecorations._is_list_hovered = function (self)
	local widget = self._widgets_by_name.list_mask

	return widget.content.hotspot.is_hover or false
end

HeroViewStateKeepDecorations.update = function (self, dt, t)
	self:_handle_gamepad_activity()

	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	local input_service = self._input_blocked and FAKE_INPUT_SERVICE or self:input_service()

	if self._type == "painting" then
		self:_update_client_paintings(dt)
	end

	self:_update_sound_trigger_delay(dt)
	self:_update_scroll_position()
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

HeroViewStateKeepDecorations._update_client_paintings = function (self, dt)
	if not Unit.alive(self._interactable_unit) or not self._keep_decoration_extension or not self._keep_decoration_extension.get_selected_decoration then
		return
	end

	if self._is_server then
		local decoration = self._keep_decoration_extension:get_selected_decoration()

		if decoration == "hidden" then
			self:close_menu()
		end
	else
		local decoration = self._keep_decoration_extension:get_selected_decoration()

		if decoration ~= self._selected_decoration then
			self:_set_info_by_decoration_key(decoration, false)
		end
	end
end

HeroViewStateKeepDecorations._has_active_level_vote = function (self)
	local voting_manager = self._voting_manager
	local is_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

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
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_enter
end

HeroViewStateKeepDecorations._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_exit
end

HeroViewStateKeepDecorations._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroViewStateKeepDecorations._handle_input = function (self, dt, t)
	local input_service = self._input_blocked and FAKE_INPUT_SERVICE or self:input_service()
	local mouse_active = Managers.input:is_device_active("mouse")
	local input_pressed = input_service:get("toggle_menu")
	local input_close_pressed = not mouse_active and input_service:get("back")
	local widgets_by_name = self._widgets_by_name

	self._scrollbar_logic:update(dt, t)

	local close_button = widgets_by_name.close_button
	local confirm_button = widgets_by_name.confirm_button

	if self:_is_button_hover_enter(close_button) or self:_is_button_hover_enter(confirm_button) then
		self:_play_sound("Play_hud_hover")
	end

	if self._customizable_decoration then
		local interactable_unit = self._interactable_unit

		if self:_is_button_pressed(confirm_button) or input_service:get("confirm") then
			local keep_decoration_extension = ScriptUnit.extension(interactable_unit, "keep_decoration_system")

			if self._selected_equipped_decoration then
				keep_decoration_extension:unequip_decoration()

				self._selected_equipped_decoration = false

				self:_update_confirm_button()
				self:_update_equipped_widget()
				self._menu_input_description:set_input_description(input_actions.default)
				self:_play_sound("Play_hud_select")
			else
				self:_verify_decoration_selection()
				keep_decoration_extension:confirm_selection()
				self:_play_sound("hud_add_painting")

				self._selected_equipped_decoration = true

				self:_update_confirm_button()
				self:_update_equipped_widget()
				self._menu_input_description:set_input_description(input_actions.remove)
			end
		end

		local is_list_hovered = false

		if not mouse_active then
			is_list_hovered = true

			self:_handle_gamepad_list_selection(input_service)
		else
			is_list_hovered = self:_is_list_hovered()

			local list_widgets = self._list_widgets

			if list_widgets and is_list_hovered then
				for i, widget in ipairs(list_widgets) do
					if self:_is_button_hover_enter(widget) then
						self:_play_sound("play_gui_equipment_button_hover")
					end
				end
			end

			local list_index = self:_list_index_pressed()

			if list_index and list_index ~= self._selected_list_index then
				self:_on_list_index_selected(list_index)
				self:_play_sound("Play_hud_select")
			end
		end

		self:_animate_list_entries(dt, is_list_hovered)
	end

	if input_pressed or self:_is_button_pressed(close_button) or input_close_pressed then
		self:_play_sound("Play_hud_select")
		self:close_menu()

		return
	end
end

HeroViewStateKeepDecorations._verify_decoration_selection = function (self)
	local keep_decoration_extension = ScriptUnit.extension(self._interactable_unit, "keep_decoration_system")
	local equipped_decoration = keep_decoration_extension:get_selected_decoration()

	if not table.find(self._default_decorations, equipped_decoration) then
		return
	end

	local index = self._selected_list_index
	local list_widgets = self._list_widgets

	if not index or index > #list_widgets then
		return
	end

	local selected_widget = list_widgets[index]
	local selected_content = selected_widget.content
	local selected_key = selected_content.key
	local locked = selected_content.locked

	if locked then
		return
	else
		keep_decoration_extension:decoration_selected(selected_key)
	end
end

HeroViewStateKeepDecorations.close_menu = function (self, ignore_sound_on_close_menu)
	ignore_sound_on_close_menu = true

	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

HeroViewStateKeepDecorations.draw = function (self, input_service, dt)
	self:_update_visible_list_entries()

	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1
	local list_widgets = self._list_widgets

	if list_widgets then
		for _, widget in ipairs(list_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local dummy_list_widgets = self._dummy_list_widgets

	if dummy_list_widgets then
		for _, widget in ipairs(dummy_list_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

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
		self._menu_input_description:draw(ui_top_renderer, dt)
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

HeroViewStateKeepDecorations._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateKeepDecorations._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

HeroViewStateKeepDecorations.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self._ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", enabled and 1 or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", enabled and 0.75 or 0)
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

HeroViewStateKeepDecorations._set_info_by_decoration_key = function (self, key, locked)
	local settings = self._main_table[key]
	local display_name = settings.display_name
	local description = settings.description
	local artist = settings.artist
	local description_text = locked and Localize("interaction_unavailable") or Localize(description)
	local artist_text = artist and not locked and Localize(artist) or ""

	self._selected_decoration = key

	self:_set_info_texts(Localize(display_name), description_text, artist_text)
	self:_play_sound("Stop_all_keep_decorations_desc_vo")

	if not locked then
		local sound_event = settings.sound_event

		self._sound_event_delay = sound_event and DIALOGUE_DELAY or nil
	end
end

HeroViewStateKeepDecorations._update_sound_trigger_delay = function (self, dt)
	local sound_event_delay = self._sound_event_delay

	if not sound_event_delay then
		return
	end

	local time = math.max(sound_event_delay - dt, 0)

	if time == 0 then
		self._sound_event_delay = nil

		local selected_list_index = self._selected_list_index

		if self._selected_decoration and selected_list_index then
			local list_widgets = self._list_widgets
			local selected_widget = list_widgets[selected_list_index]
			local selected_content = selected_widget.content
			local selected_key = selected_content.key
			local settings = self._main_table[selected_key]
			local sound_event = settings.sound_event

			if sound_event then
				self:_play_sound(sound_event)
			end
		elseif self._sound_event then
			self:_play_sound(self._sound_event)
		end
	else
		self._sound_event_delay = time
	end
end

HeroViewStateKeepDecorations._update_confirm_button = function (self)
	local selected_equipped_decoration = self._selected_equipped_decoration == true
	local button = self._widgets_by_name.confirm_button

	if selected_equipped_decoration then
		button.content.title_text = Localize("input_description_remove")
	else
		button.content.title_text = Localize("menu_settings_apply")
	end
end

HeroViewStateKeepDecorations._on_list_index_selected = function (self, index, scrollbar_animation_percentage)
	local interactable_unit = self._interactable_unit
	local keep_decoration_extension = ScriptUnit.extension(interactable_unit, "keep_decoration_system")
	local equipped_decoration = keep_decoration_extension:get_selected_decoration()
	local list_widgets = self._list_widgets

	if not index or index > #list_widgets then
		return
	end

	local selected_widget = list_widgets[index]
	local selected_content = selected_widget.content
	local selected_key = selected_content.key

	if ItemHelper.is_new_keep_decoration_id(selected_key) then
		ItemHelper.unmark_keep_decoration_as_new(selected_key)

		selected_content.new = false
	end

	local locked = selected_content.locked

	self:_set_info_by_decoration_key(selected_key, locked)

	if locked then
		keep_decoration_extension:decoration_selected(self._empty_decoration_name)
	else
		keep_decoration_extension:decoration_selected(selected_key)
	end

	self._selected_equipped_decoration = equipped_decoration == selected_key

	self:_update_confirm_button()

	local input_action_key = self._selected_equipped_decoration and "remove" or "default"

	self._menu_input_description:set_input_description(input_action_key and input_actions[input_action_key])

	if list_widgets then
		for i, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot then
				local is_selected = i == index

				hotspot.is_selected = is_selected

				if is_selected then
					hotspot.on_hover_enter = true
				end
			end
		end
	end

	self._previous_selected_list_index = self._selected_list_index
	self._selected_list_index = index

	if scrollbar_animation_percentage then
		local scrollbar_widget = self._widgets_by_name.list_scrollbar
		local scroll_bar_info = scrollbar_widget.content.scroll_bar_info
		local func = UIAnimation.function_by_time
		local target = scroll_bar_info
		local target_index = "scroll_value"
		local from = scroll_bar_info.scroll_value
		local to = scrollbar_animation_percentage
		local duration = 0.3
		local easing = math.easeOutCubic

		self._ui_animations.scrollbar = UIAnimation.init(func, target, target_index, from, to, duration, easing)
	else
		self._ui_animations.scrollbar = nil
	end
end

HeroViewStateKeepDecorations._update_scrollbar_progress_animation = function (self, dt, t)
	local chest_zoom_in_duration = self._chest_zoom_in_duration

	if not chest_zoom_in_duration then
		return
	end

	chest_zoom_in_duration = chest_zoom_in_duration + dt

	local progress = math.min(chest_zoom_in_duration / CHEST_PRESENTATION_ZOOM_IN_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self:set_camera_zoom(animation_progress)
	self:set_grid_animation_progress(animation_progress)
	self:set_chest_title_alpha_progress(1 - animation_progress)

	if progress == 1 then
		self._chest_zoom_in_duration = nil
		self._chest_open_wait_duration = 0
	else
		self._chest_zoom_in_duration = chest_zoom_in_duration
	end
end

HeroViewStateKeepDecorations._set_info_texts = function (self, title_text, description_text, artist_text)
	local title_height = self:_set_selected_title(title_text)
	local description_height = self:_set_selected_description(description_text)
	local artist_height = artist_text and self:_set_selected_artist(artist_text) or 0
	local ui_scenegraph = self._ui_scenegraph
	local title_scenegraph = ui_scenegraph.title_text

	title_scenegraph.size[2] = title_height

	local artist_scenegraph = ui_scenegraph.artist_text

	artist_scenegraph.size[2] = artist_height

	local window_scenegraph = ui_scenegraph.info_window
	local window_position = window_scenegraph.position
	local window_size = window_scenegraph.size
	local available_description_height = window_size[2] - title_height - artist_height - 110
	local description_scenegraph = ui_scenegraph.description_text

	description_scenegraph.size[2] = available_description_height
end

HeroViewStateKeepDecorations._set_selected_title = function (self, title_text)
	local widget = self._widgets_by_name.title_text

	widget.content.text = title_text

	local scenegraph_id = widget.scenegraph_id
	local text_style = widget.style.text
	local default_scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = default_scenegraph.size
	local text_height = UIUtils.get_text_height(self._ui_renderer, default_size, text_style, title_text)

	return text_height
end

HeroViewStateKeepDecorations._set_selected_description = function (self, description_text)
	local widget = self._widgets_by_name.description_text

	widget.content.text = description_text

	local scenegraph_id = widget.scenegraph_id
	local text_style = widget.style.text
	local default_scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = default_scenegraph.size
	local text_height = UIUtils.get_text_height(self._ui_renderer, default_size, text_style, description_text)

	return text_height
end

HeroViewStateKeepDecorations._set_selected_artist = function (self, artist_text)
	local widget = self._widgets_by_name.artist_text

	widget.content.text = artist_text

	local scenegraph_id = widget.scenegraph_id
	local text_style = widget.style.text
	local default_scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = default_scenegraph.size
	local text_height = UIUtils.get_text_height(self._ui_renderer, default_size, text_style, artist_text)

	return text_height
end

HeroViewStateKeepDecorations._update_equipped_widget = function (self)
	local interactable_unit = self._interactable_unit
	local keep_decoration_extension = ScriptUnit.extension(interactable_unit, "keep_decoration_system")
	local equipped_decoration = keep_decoration_extension:get_selected_decoration()
	local decoration_system = self._decoration_system

	for _, list_widget in pairs(self._list_widgets) do
		local key = list_widget.content.key

		list_widget.content.in_use = decoration_system:is_decoration_in_use(key)
		list_widget.content.equipped = equipped_decoration == key
	end
end

HeroViewStateKeepDecorations._align_list_widgets = function (self)
	local total_height = 0
	local list_widgets = self._list_widgets
	local dummy_widgets = self._dummy_list_widgets
	local num_widgets = #list_widgets + #dummy_widgets

	for index = 1, num_widgets do
		local widget

		if index <= #list_widgets then
			widget = list_widgets[index]
		else
			widget = dummy_widgets[index - #list_widgets]
		end

		local offset = widget.offset
		local content = widget.content
		local size = content.size

		widget.default_offset = table.clone(offset)

		local height = size[2]

		offset[2] = -total_height
		total_height = total_height + height

		if index ~= num_widgets then
			total_height = total_height + LIST_SPACING
		end
	end

	self._total_list_height = total_height
end

HeroViewStateKeepDecorations._handle_gamepad_list_selection = function (self, input_service)
	local current_index = self._selected_list_index

	if not current_index then
		return
	end

	local list_widgets = self._list_widgets
	local num_rows = #list_widgets
	local new_index, scroll_index

	if input_service:get("move_up_hold_continuous") then
		new_index = math.max(current_index - 1, 1)
		scroll_index = math.max(new_index - 3, 1)
	elseif input_service:get("move_down_hold_continuous") then
		new_index = math.min(current_index + 1, num_rows)
		scroll_index = math.min(new_index + 3, num_rows)
	end

	if new_index and new_index ~= current_index then
		local scroll_percentage = self:_get_scrollbar_percentage_by_index(scroll_index)

		self:_on_list_index_selected(new_index, scroll_percentage)
		self:_play_sound("Play_hud_hover")
	end
end

HeroViewStateKeepDecorations._find_closest_neighbour = function (self, column_index_list, current_index)
	local list_widgets = self._list_widgets
	local current_widget = list_widgets[current_index]
	local current_widget_content = current_widget.content
	local current_widget_size = current_widget_content.size
	local current_widget_offset = current_widget.offset
	local current_coordinate_x = current_widget_size[1] * 0.5 + current_widget_offset[1]
	local shortest_distance = math.huge
	local closest_index

	for _, layout_index in pairs(column_index_list) do
		local widget = list_widgets[layout_index]
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local coordinate_x = size[1] * 0.5 + offset[1]
		local distance = math.abs(coordinate_x - current_coordinate_x)

		if distance < shortest_distance then
			shortest_distance = distance
			closest_index = layout_index
		end
	end

	if closest_index then
		return closest_index
	end
end

HeroViewStateKeepDecorations._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_window.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 220 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)
end

HeroViewStateKeepDecorations._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list_scroll_root.local_position[2] = math.round(length)
		self._scrolled_length = length
	end
end

HeroViewStateKeepDecorations._update_visible_list_entries = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if not enabled then
		return
	end

	local scroll_percentage = scrollbar_logic:get_scroll_percentage()
	local scrolled_length = scrollbar_logic:get_scrolled_length()
	local scroll_length = scrollbar_logic:get_scroll_length()
	local list_window_size = scenegraph_definition.list_window.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local widget_position = math.abs(offset[2]) + size[2]
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < math.abs(offset[2]) - scrolled_length then
			is_outside = true
		end

		content.visible = not is_outside
	end
end

HeroViewStateKeepDecorations._get_scrollbar_percentage_by_index = function (self, index)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2])
			local start_position_bottom = start_position_top + height
			local percentage_difference = 0

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height

				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top

				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				return scroll_percentage
			end
		end
	end

	return 0
end

HeroViewStateKeepDecorations._list_index_pressed = function (self)
	local list_widgets = self._list_widgets

	if list_widgets then
		for index, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return index
			end
		end
	end
end

HeroViewStateKeepDecorations._setup_decorations_list = function (self)
	local backend_interface = self._keep_decoration_backend_interface
	local unlocked_decorations = backend_interface and backend_interface:get_unlocked_keep_decorations() or {}
	local widgets = {}
	local index = 0

	for _, key in ipairs(self._ordered_table) do
		if not table.contains(self._default_table, key) then
			local settings = self._main_table[key]

			if settings then
				local unlocked = table.contains(unlocked_decorations, key)
				local display_name = Localize(settings.display_name)
				local new = ItemHelper.is_new_keep_decoration_id(key)

				if unlocked then
					local widget = UIWidget.init(entry_widget_definition)

					index = index + 1
					widgets[index] = widget

					local content = widget.content
					local style = widget.style
					local title = display_name
					local title_style = style.title
					local max_text_width = title_style.size[1] - 10

					content.title = UIRenderer.crop_text_width(self._ui_renderer, title, max_text_width, title_style)
					content.key = key
					content.locked = false
					content.new = new
					content.in_use = self._decoration_system:is_decoration_in_use(key)
				end
			end
		end
	end

	table.sort(widgets, function (a, b)
		local a_content = a.content
		local b_content = b.content

		if a_content.new ~= b_content.new then
			return a_content.new
		end

		return Localize(a_content.title) < Localize(b_content.title)
	end)

	self._list_widgets = widgets
	self._dummy_list_widgets = {}

	self:_align_list_widgets()

	local content_length = self._total_list_height
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local scrollbar_length = list_scrollbar_size[2]
	local dummy_list_widgets = {}

	if content_length < scrollbar_length then
		local dummy_count = 0
		local dummy_height = LIST_SPACING

		while scrollbar_length > content_length + dummy_height do
			dummy_count = dummy_count + 1

			local widget = UIWidget.init(dummy_entry_widget_definition)

			table.insert(dummy_list_widgets, widget)

			local content = widget.content
			local size = content.size
			local height = size[2]

			dummy_height = dummy_height + height + LIST_SPACING
		end
	end

	self._dummy_list_widgets = dummy_list_widgets

	self:_align_list_widgets()
	self:_initialize_scrollbar()
	self:_update_equipped_widget()
end

HeroViewStateKeepDecorations._animate_list_entries = function (self, dt, is_list_hovered)
	local widgets = self._list_widgets

	if not widgets then
		return
	end

	for index, widget in ipairs(widgets) do
		self:_animate_list_widget(widget, dt, is_list_hovered)
	end
end

HeroViewStateKeepDecorations._animate_list_widget = function (self, widget, dt, optional_hover)
	local offset = widget.offset
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot or content.hotspot
	local on_hover_enter = hotspot.on_hover_enter
	local is_hover = hotspot.is_hover

	if optional_hover ~= nil and not optional_hover then
		is_hover = false
		on_hover_enter = false
	end

	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local pulse_progress = hotspot.pulse_progress or 1
	local offset_progress = hotspot.offset_progress or 1
	local selection_progress = hotspot.selection_progress or 0
	local speed = (is_hover or is_selected) and 14 or 3
	local pulse_speed = 3
	local input_speed = 20
	local offset_speed = 5

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if on_hover_enter then
		pulse_progress = 0
	end

	pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)

	local pulse_easing_out_progress = math.easeOutCubic(pulse_progress)
	local pulse_easing_in_progress = math.easeInCubic(pulse_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
		offset_progress = math.min(offset_progress + dt * offset_speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
		offset_progress = math.max(offset_progress - dt * offset_speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress

	style.hover_frame.color[1] = hover_alpha

	local title_text_style = style.title
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_hover_text_color = title_text_style.hover_text_color

	Colors.lerp_color_tables(title_default_text_color, title_hover_text_color, combined_progress, title_text_color)

	local pulse_alpha = 255 - 255 * pulse_progress

	style.pulse_frame.color[1] = pulse_alpha
	offset[1] = 10 * math.ease_in_exp(offset_progress)
	hotspot.offset_progress = offset_progress
	hotspot.pulse_progress = pulse_progress
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

HeroViewStateKeepDecorations._handle_gamepad_activity = function (self)
	local mouse_active = Managers.input:is_device_active("mouse")
	local force_update = self._gamepad_active_last_frame == nil

	if not mouse_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true

			if self._customizable_decoration then
				local selected_list_index = self._selected_list_index

				if selected_list_index then
					local scroll_percentage = self:_get_scrollbar_percentage_by_index(selected_list_index)

					self._scrollbar_logic:set_scroll_percentage(scroll_percentage)
				end
			end
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false
	end
end
