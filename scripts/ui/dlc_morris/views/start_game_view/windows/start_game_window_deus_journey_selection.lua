-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/start_game_window_deus_journey_selection.lua

require("scripts/settings/dlcs/morris/deus_theme_settings")

local definitions = local_require("scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_journey_selection_definitions")
local widget_definitions = definitions.widgets
local node_widget_definitions = definitions.node_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local journey_widget_settings = definitions.journey_widget_settings
local SELECTION_INPUT = "confirm_press"

local function is_journey_cycle_expired(journey_cycle, current_time)
	return journey_cycle.remaining_time - (current_time - journey_cycle.time_of_update) < 0
end

StartGameWindowDeusJourneySelection = class(StartGameWindowDeusJourneySelection)
StartGameWindowDeusJourneySelection.NAME = "StartGameWindowDeusJourneySelection"

StartGameWindowDeusJourneySelection.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowDeusJourneySelection")

	local ingame_ui_context = params.ingame_ui_context
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.parent = params.parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self._unlocked_journeys = self:_get_unlocked_journeys()
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_set_presentation_info()
	self:_setup_journey_widgets()
	self:_refresh_journey_cycle()
	self:_update_selected_journey()
	self:_setup_grid_navigation()
	self:_start_transition_animation("on_enter")
end

StartGameWindowDeusJourneySelection._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowDeusJourneySelection.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self.ui_scenegraph = ui_scenegraph

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	local node_widgets = {}
	local node_widgets_by_name = {}

	for name, widget_definition in pairs(node_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		node_widgets[#node_widgets + 1] = widget
		node_widgets_by_name[name] = widget
	end

	self._node_widgets = node_widgets
	self._node_widgets_by_name = node_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowDeusJourneySelection._get_unlocked_journeys = function (self)
	local unlocked_journeys = {}

	for _, journey_name in ipairs(LevelUnlockUtils.unlocked_journeys(self.statistics_db, self._stats_id)) do
		unlocked_journeys[journey_name] = true
	end

	return unlocked_journeys
end

StartGameWindowDeusJourneySelection._setup_journey_widgets = function (self)
	local node_widgets = self._node_widgets
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local unlocked_journeys = self._unlocked_journeys
	local assigned_widgets = {}
	local journey_position_x = -365
	local settings = journey_widget_settings
	local available_journey_order = AvailableJourneyOrder

	for _, journey_name in ipairs(available_journey_order) do
		local journey_data = DeusJourneySettings[journey_name]
		local index = #assigned_widgets + 1
		local next_journey = available_journey_order[index + 1]
		local widget = node_widgets[index]
		local content = widget.content

		content.text = Localize(journey_data.display_name)

		local width_to_next_journey = settings.width + settings.spacing_x

		journey_position_x = journey_position_x + width_to_next_journey

		local offset = widget.offset

		offset[1] = journey_position_x
		offset[2] = 0

		local completed_difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name)
		local selection_frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
		local is_unlocked = unlocked_journeys[journey_name]

		content.icon = journey_data.level_image
		content.locked = not is_unlocked
		content.frame = selection_frame_texture
		content.journey_name = journey_name
		content.draw_path = next_journey ~= nil
		content.draw_path_fill = unlocked_journeys[next_journey]
		widget.style.path.texture_size[1] = width_to_next_journey
		widget.style.path_glow.texture_size[1] = width_to_next_journey
		assigned_widgets[index] = widget
		journey_position_x = journey_position_x + settings.spacing_x
	end

	self._active_node_widgets = assigned_widgets
end

StartGameWindowDeusJourneySelection._get_first_journey_name = function (self)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		local widget = active_node_widgets[1]
		local content = widget.content

		return content.journey_name
	end
end

StartGameWindowDeusJourneySelection._is_journey_presented = function (self, journey_name)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]
			local content = widget.content

			if content.journey_name == journey_name then
				return true
			end
		end
	end

	return false
end

StartGameWindowDeusJourneySelection._select_journey = function (self, selected_journey_name)
	local required_completed_journeys = DeusJourneySettings[selected_journey_name].required_journeys or {}
	local active_node_widgets = self._active_node_widgets
	local unlocked_journeys = self._unlocked_journeys
	local is_selected_journey_unlocked = unlocked_journeys[selected_journey_name]

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]
			local content = widget.content
			local is_selected = content.journey_name == selected_journey_name
			local button_hotspot = widget.content.button_hotspot

			button_hotspot.is_selected = is_selected

			local is_a_required_journey = table.contains(required_completed_journeys, content.journey_name)
			local show_unlock_guidance = is_a_required_journey and (content.locked or not is_selected_journey_unlocked)

			content.unlock_guidance = show_unlock_guidance
		end
	end

	self._selected_journey_name = selected_journey_name

	self:_set_presentation_info(selected_journey_name)
	self:_update_modifier_god_info(selected_journey_name)
end

StartGameWindowDeusJourneySelection._set_presentation_info = function (self, journey_name)
	local journey_name_text = ""
	local journey_description_text = ""
	local frame_texture
	local draw_info = false
	local widgets_by_name = self._widgets_by_name
	local selected_journey_widget = widgets_by_name.selected_level
	local content = selected_journey_widget.content

	if journey_name then
		local statistics_db = self.statistics_db
		local stats_id = self._stats_id
		local journey_settings = DeusJourneySettings[journey_name]
		local icon = journey_settings.level_image
		local display_name = journey_settings.display_name

		journey_description_text = journey_settings.description

		local completed_difficulty_index = LevelUnlockUtils.completed_journey_difficulty_index(statistics_db, stats_id, journey_name)

		frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)

		local is_unlocked = self._unlocked_journeys[journey_name]

		if is_unlocked then
			self.parent:set_input_description("select_mission_confirm")
		else
			self.parent:set_input_description("select_mission")
		end

		content.icon = icon
		journey_name_text = Localize(display_name)
		journey_description_text = Localize(journey_description_text)
		draw_info = true
	end

	content.frame = frame_texture
	content.locked = not draw_info
	content.visible = draw_info
	content.draw_chaos_symbol = false
	content.button_hotspot.disable_button = true
	widgets_by_name.helper_text.content.visible = not draw_info
	widgets_by_name.level_title_divider.content.visible = draw_info
	widgets_by_name.level_title.content.text = journey_name_text
	widgets_by_name.description_text.content.text = journey_description_text
	widgets_by_name.locked_text.content.text = ""
end

StartGameWindowDeusJourneySelection._setup_grid_navigation = function (self)
	local navigation_grid = {}

	for _, widget in pairs(self._active_node_widgets) do
		local content = widget.content

		table.insert(navigation_grid, content.journey_name)
	end

	self._navigation_grid = navigation_grid

	local column = self:_find_journey_location_in_grid(self._selected_journey_name)

	self._current_column = column
end

StartGameWindowDeusJourneySelection._find_journey_location_in_grid = function (self, journey_name_to_find)
	if not journey_name_to_find then
		return 1
	end

	local navigation_grid = self._navigation_grid
	local column = 1

	if navigation_grid then
		for index, journey_name in ipairs(navigation_grid) do
			if journey_name == journey_name_to_find then
				column = index

				break
			end
		end
	end

	fassert(column, "journey %s does not exist in navigation grid", journey_name_to_find)

	return column
end

StartGameWindowDeusJourneySelection.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowDeusJourneySelection")

	self.ui_animator = nil

	self.parent:set_input_description(nil)
end

StartGameWindowDeusJourneySelection.update = function (self, dt, t)
	local current_time = Managers.time:time("main")

	self:_update_modifiers(current_time)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowDeusJourneySelection.post_update = function (self, dt, t)
	return
end

StartGameWindowDeusJourneySelection._update_modifiers = function (self, current_time)
	local journey_cycle = self._journey_cycle

	if not journey_cycle or is_journey_cycle_expired(journey_cycle, current_time) then
		self:_refresh_journey_cycle()
	end

	self:_update_modifier_timer(current_time)
end

StartGameWindowDeusJourneySelection._refresh_journey_cycle = function (self)
	local backend_deus = Managers.backend:get_interface("deus")

	self._journey_cycle = backend_deus:get_journey_cycle()

	self:_on_new_journey_cycle()
end

StartGameWindowDeusJourneySelection._update_modifier_timer = function (self, current_time)
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

StartGameWindowDeusJourneySelection._update_modifier_god_info = function (self, journey_name)
	local journey_cycle = self._journey_cycle
	local widget = self._widgets_by_name.modifier_info_god
	local content = widget.content
	local theme = journey_cycle.journey_data[journey_name].dominant_god
	local theme_settings = DeusThemeSettings[theme]

	content.icon = theme_settings.text_icon
	content.title = theme_settings.journey_title
	content.description = Localize(theme_settings.journey_description)

	local color = theme_settings.color
	local style = widget.style

	style.icon.color = color
	style.title.text_color = color
end

StartGameWindowDeusJourneySelection._update_journey_god_icons = function (self)
	local journey_cycle = self._journey_cycle

	for _, node_widget in ipairs(self._active_node_widgets) do
		local content = node_widget.content
		local theme = journey_cycle.journey_data[content.journey_name].dominant_god
		local theme_settings = DeusThemeSettings[theme]

		content.theme_icon = theme_settings.icon
	end
end

StartGameWindowDeusJourneySelection._on_new_journey_cycle = function (self)
	local journey_name = self._selected_journey_name

	if journey_name then
		self:_update_modifier_god_info(journey_name)
	end

	self:_update_journey_god_icons()
end

StartGameWindowDeusJourneySelection._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local node_widgets = self._node_widgets

	for i = 1, #node_widgets do
		local node_widget = node_widgets[i]

		self:_animate_node_widget(node_widget, dt)
	end
end

StartGameWindowDeusJourneySelection._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowDeusJourneySelection._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowDeusJourneySelection._update_selected_journey = function (self)
	local journey_name = self.parent:get_selected_level_id()

	if journey_name ~= self._selected_journey_name or not journey_name then
		if self:_is_journey_presented(journey_name) then
			self:_select_journey(journey_name)
		elseif not self._selected_journey_name then
			local first_journey_name = self:_get_first_journey_name()

			self:_select_journey(first_journey_name)
		end
	end
end

StartGameWindowDeusJourneySelection._update_selection_from_grid = function (self)
	local current_column = self._current_column
	local selected_journey_name = self._navigation_grid[current_column]

	fassert(selected_journey_name, "No journey_name at column %s", tostring(current_column))
	self:_select_journey(selected_journey_name)
	self:_play_sound("play_gui_lobby_button_02_mission_act_click")
end

StartGameWindowDeusJourneySelection._update_grid_column = function (self, new_column)
	local num_columns = #self._navigation_grid

	self._current_column = math.clamp(new_column, 1, num_columns)

	self:_update_selection_from_grid()
end

StartGameWindowDeusJourneySelection._update_grid_navigation = function (self, column_change)
	local new_column = self:_find_column(column_change)

	if new_column ~= self._current_column then
		self:_update_grid_column(new_column)
	end
end

StartGameWindowDeusJourneySelection._find_column = function (self, column_change)
	if column_change == 0 then
		return self._current_column
	end

	local closest_column = self._current_column
	local current_column = self._current_column
	local grid = self._navigation_grid

	if column_change < 0 then
		for index, _ in pairs(grid) do
			if index < current_column then
				closest_column = index
			else
				break
			end
		end
	else
		for index, _ in pairs(grid) do
			if current_column < index then
				closest_column = index

				break
			end
		end
	end

	return closest_column
end

StartGameWindowDeusJourneySelection._handle_input = function (self, dt, t)
	local parent = self.parent
	local input_service = parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if input_service:get("move_right_hold_continuous") then
			self:_update_grid_navigation(1)
		elseif input_service:get("move_left_hold_continuous") then
			self:_update_grid_navigation(-1)
		end
	end

	local active_node_widgets = self._active_node_widgets
	local gamepad_confirm_pressed = gamepad_active and input_service:get(SELECTION_INPUT, true)

	if gamepad_confirm_pressed and self._unlocked_journeys[self._selected_journey_name] then
		self:_play_sound("play_gui_lobby_button_02_mission_select")

		local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

		parent:set_selected_level_id(self._selected_journey_name)
		parent:set_layout_by_name(game_mode_layout_name)
	elseif active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]
			local content = widget.content
			local journey_name = content.journey_name

			if self:_is_button_hovered(widget) and self._selected_journey_name ~= journey_name then
				self:_play_sound("play_gui_lobby_button_02_mission_act_click")
				self:_select_journey(journey_name)
			end

			if self:_is_button_pressed(widget) then
				self:_play_sound("play_gui_lobby_button_02_mission_select")

				local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

				parent:set_selected_level_id(journey_name)
				parent:set_layout_by_name(game_mode_layout_name)
			end
		end
	end
end

StartGameWindowDeusJourneySelection.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowDeusJourneySelection._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowDeusJourneySelection._animate_node_widget = function (self, widget, dt)
	local content = widget.content
	local hotspot = content.button_hotspot
	local is_selected = hotspot.is_selected
	local selected_progress = hotspot.selected_progress or 0
	local selected_speed = 9

	if is_selected then
		selected_progress = math.min(selected_progress + selected_speed * dt, 1)
	else
		selected_progress = math.max(selected_progress - selected_speed * dt, 0)
	end

	local is_unlock_guidance = content.unlock_guidance
	local unlock_guidance_progress = content.unlock_guidance_progress or 0
	local unlock_guidance_speed = 2

	if is_unlock_guidance then
		unlock_guidance_progress = math.min(unlock_guidance_progress + dt * unlock_guidance_speed, 1)
	else
		unlock_guidance_progress = math.max(unlock_guidance_progress - dt * unlock_guidance_speed, 0)
	end

	local style = widget.style

	style.icon_glow.color[1] = 255 * selected_progress

	local alpha_modifier = math.max(math.lerp(-2.5, 1, unlock_guidance_progress), 0)

	style.icon_unlock_guidance_glow.color[1] = 255 * alpha_modifier
	hotspot.selected_progress = selected_progress
	content.unlock_guidance_progress = unlock_guidance_progress
end
