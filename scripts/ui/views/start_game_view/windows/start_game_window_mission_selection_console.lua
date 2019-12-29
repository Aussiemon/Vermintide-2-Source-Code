local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mission_selection_console_definitions")
local widget_definitions = definitions.widgets
local act_widget_definitions = definitions.act_widgets
local node_widget_definitions = definitions.node_widgets
local end_act_widget_definition = definitions.end_act_widget
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

local SELECTION_INPUT = "confirm_press"
StartGameWindowMissionSelectionConsole = class(StartGameWindowMissionSelectionConsole)
StartGameWindowMissionSelectionConsole.NAME = "StartGameWindowMissionSelectionConsole"

StartGameWindowMissionSelectionConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMissionSelectionConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)

	local area_name = self.parent:get_selected_area_name()

	self:_set_presentation_info()
	self:_setup_levels_by_area(area_name)
	self:_setup_grid_navigation()
	self:_start_transition_animation("on_enter")
end

StartGameWindowMissionSelectionConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowMissionSelectionConsole.create_ui_elements = function (self, params, offset)
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
	local act_widgets = {}
	local act_widgets_by_name = {}

	for name, widget_definition in pairs(act_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		act_widgets[#act_widgets + 1] = widget
		act_widgets_by_name[name] = widget
	end

	self._act_widgets = act_widgets
	self._act_widgets_by_name = act_widgets_by_name
	self.end_act_widget = UIWidget.init(end_act_widget_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowMissionSelectionConsole._setup_levels_by_area = function (self, area_name)
	local area_settings = AreaSettings[area_name]
	local acts = area_settings.acts
	local dlc_name = area_settings.dlc_name
	self._is_dlc = dlc_name ~= nil

	self:_setup_level_acts(acts)
	self:_present_act_levels()
	self:_update_level_option()
end

StartGameWindowMissionSelectionConsole._setup_level_acts = function (self, acts)
	local levels_by_act = {}
	local num_levels_added = 0

	for _, level_key in pairs(UnlockableLevels) do
		if not table.find(NoneActLevels, level_key) then
			local level_settings = LevelSettings[level_key]
			local act = level_settings.act

			if table.find(acts, act) then
				if not levels_by_act[act] then
					levels_by_act[act] = {}
				end

				local act_levels = levels_by_act[act]
				local index = #act_levels + 1
				act_levels[index] = level_settings
				num_levels_added = num_levels_added + 1
			end
		end
	end

	for _, levels in pairs(levels_by_act) do
		table.sort(levels, sort_levels_by_order)
	end

	self._levels_by_act = levels_by_act
end

StartGameWindowMissionSelectionConsole._verify_act = function (self, act)
	if not act then
		return false
	end

	for i = 1, #MapPresentationActs, 1 do
		local act_key = MapPresentationActs[i]

		if act == act_key then
			return true
		end
	end

	return false
end

StartGameWindowMissionSelectionConsole._present_act_levels = function (self, act)
	local node_widgets = self._node_widgets
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}
	local act_widgets = {}
	local level_width_spacing = 190
	local level_height_spacing = 190
	local max_act_number = 4
	local levels_by_act = self._levels_by_act

	for act_key, levels in pairs(levels_by_act) do
		local act_verified = self:_verify_act(act_key)

		if act_verified and (not act or act == act_key) then
			local act_settings = ActSettings[act_key]
			local act_sorting = act_settings.sorting
			local act_index = (act_sorting - 1) % max_act_number + 1
			local is_end_act = max_act_number < act_sorting
			local act_position_y = 0
			local act_widget = nil

			if not is_end_act then
				act_position_y = -level_height_spacing + (max_act_number - act_index) * level_height_spacing
				act_widget = self._act_widgets[act_index]
			else
				act_widget = self.end_act_widget
			end

			act_widgets[#act_widgets + 1] = act_widget
			act_widget.offset[2] = act_position_y
			local act_display_name = act_settings.display_name
			act_widget.content.background = act_settings.banner_texture
			act_widget.content.text = (act_display_name and Localize(act_display_name)) or ""
			local area_name_width = UIUtils.get_text_width(self.ui_renderer, act_widget.style.text, act_widget.content.text)
			local num_levels_in_act = #levels
			local level_position_x = area_name_width - 50
			local level_position_y = 0

			for i = 1, num_levels_in_act, 1 do
				local level_data = levels[i]

				if is_end_act then
					level_position_x = level_width_spacing * 4
				end

				local index = #assigned_widgets + 1
				local widget = node_widgets[index]
				local content = widget.content
				local level_key = level_data.level_id
				local boss_level = level_data.boss_level
				local level_display_name = level_data.display_name
				content.text = Localize(level_display_name)
				local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key)
				local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key)
				local selection_frame_texture = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
				content.frame = selection_frame_texture
				content.locked = not level_unlocked
				content.act_key = act_key
				content.level_key = level_key
				local level_image = level_data.level_image

				if level_image then
					content.icon = level_image
				else
					content.icon = "icons_placeholder"
				end

				content.level_data = level_data
				content.boss_level = boss_level
				local offset = widget.offset
				offset[1] = level_position_x
				offset[2] = act_position_y + level_position_y
				assigned_widgets[index] = widget
				level_position_x = level_position_x + level_width_spacing
			end
		end
	end

	self._active_node_widgets = assigned_widgets
	self._active_act_widgets = act_widgets
end

StartGameWindowMissionSelectionConsole._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

StartGameWindowMissionSelectionConsole._select_level = function (self, level_id)
	local required_completed_levels = LevelUnlockUtils.get_required_completed_levels(self.statistics_db, self._stats_id, level_id)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets, 1 do
			local widget = active_node_widgets[i]
			local content = widget.content
			local level_settings = content.level_data
			local is_selected = level_settings.level_id == level_id
			local button_hotspot = widget.content.button_hotspot
			button_hotspot.is_selected = is_selected
			local unlock_guidance = required_completed_levels[level_settings.level_id]
			content.unlock_guidance = unlock_guidance
		end
	end

	self._selected_level_id = level_id

	self:_set_presentation_info(level_id)
end

StartGameWindowMissionSelectionConsole._set_presentation_info = function (self, level_id)
	local level_text = ""
	local level_description_text = ""
	local frame_texture = "map_frame_00"
	local draw_info = false
	local lock_text = ""
	local widgets_by_name = self._widgets_by_name
	local selected_level_widget = widgets_by_name.selected_level
	local content = selected_level_widget.content

	if level_id then
		local statistics_db = self.statistics_db
		local stats_id = self._stats_id
		local level_settings = LevelSettings[level_id]
		local level_image = level_settings.level_image
		local boss_level = level_settings.boss_level
		local display_name = level_settings.display_name
		level_description_text = level_settings.description_text
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
		frame_texture = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
		local is_locked = not LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_id)

		if is_locked then
			self.parent:set_input_description("select_mission")
		else
			self.parent:set_input_description("select_mission_confirm")
		end

		content.icon = level_image
		content.boss_level = boss_level
		level_text = Localize(display_name)
		level_description_text = Localize(level_description_text)
		draw_info = true
	end

	content.frame = frame_texture
	content.locked = not draw_info
	content.visible = draw_info
	content.button_hotspot.disable_button = true
	widgets_by_name.helper_text.content.visible = not draw_info
	widgets_by_name.level_title_divider.content.visible = draw_info
	widgets_by_name.level_title.content.text = level_text
	widgets_by_name.description_text.content.text = level_description_text
	widgets_by_name.locked_text.content.text = lock_text
end

StartGameWindowMissionSelectionConsole._setup_grid_navigation = function (self)
	local navigation_grid = {}
	local levels_by_act = self._levels_by_act

	for act_key, levels in pairs(levels_by_act) do
		if act_key then
			local level_ids = {}

			for i = 1, #levels, 1 do
				level_ids[i] = levels[i].level_id
			end

			local act_settings = ActSettings[act_key]
			local sorting = act_settings.sorting
			navigation_grid[sorting] = level_ids
		end
	end

	self._navigation_grid = navigation_grid
	local row, column = self:_find_level_location_in_grid(self._selected_level_id)
	self._current_row = row
	self._current_column = column
end

StartGameWindowMissionSelectionConsole._find_level_location_in_grid = function (self, level_id)
	local navigation_grid = self._navigation_grid
	local num_rows = 0

	for row, data in pairs(navigation_grid) do
		if num_rows < row then
			num_rows = row
		end
	end

	local row, column = nil

	if level_id then
		for i = 1, num_rows, 1 do
			local levels = navigation_grid[i]

			if levels then
				local num_levels = #levels

				for j = 1, num_levels, 1 do
					if levels[j] == level_id then
						row = i
						column = j

						break
					end
				end

				if row and column then
					break
				end
			end
		end
	else
		column = 1
		row = 1
	end

	if PLATFORM ~= "xb1" then
	end

	if not row or not column then
		for i = 1, num_rows, 1 do
			local levels = navigation_grid[i]

			if levels then
				row = i
				column = 1

				break
			end
		end

		self._selected_level_id = nil
	end

	fassert(row and column, "level_id %s does not exist in navigation grid", level_id)

	return row, column
end

StartGameWindowMissionSelectionConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMissionSelectionConsole")

	self.ui_animator = nil

	self.parent:set_input_description(nil)
end

StartGameWindowMissionSelectionConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

StartGameWindowMissionSelectionConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowMissionSelectionConsole._update_animations = function (self, dt)
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

	for i = 1, #node_widgets, 1 do
		local node_widget = node_widgets[i]

		self:_animate_node_widget(node_widget, dt)
	end
end

StartGameWindowMissionSelectionConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowMissionSelectionConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowMissionSelectionConsole._update_level_option = function (self)
	local level_id = self.parent:get_selected_level_id()

	if level_id ~= self._selected_level_id or not level_id then
		if level_id and self:_is_level_presented(level_id) then
			self:_select_level(level_id)
		elseif not self._selected_level_id then
			local first_level_id = self:_get_first_level_id()

			self:_select_level(first_level_id)
		end
	end
end

StartGameWindowMissionSelectionConsole._is_level_presented = function (self, level_id)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets, 1 do
			local widget = active_node_widgets[i]
			local content = widget.content
			local level_settings = content.level_data

			if level_settings.level_id == level_id then
				return true
			end
		end
	end

	return false
end

StartGameWindowMissionSelectionConsole._get_first_level_id = function (self)
	local area_name = self.parent:get_selected_area_name()
	local area_settings = AreaSettings[area_name]
	local acts = area_settings.acts
	local first_act = acts[1]
	local first_act_levels = self._levels_by_act[first_act]
	local first_level_data = first_act_levels[1]
	local first_level_id = first_level_data.level_id

	return first_level_id
end

StartGameWindowMissionSelectionConsole._update_selection_from_grid = function (self)
	local current_row = self._current_row
	local current_column = self._current_column
	local selected_level_id = self._navigation_grid[current_row][current_column]

	fassert(selected_level_id, "No level id at %s-%s", tostring(current_row), tostring(current_column))
	self:_select_level(selected_level_id)
	self:_play_sound("play_gui_lobby_button_02_mission_act_click")
end

StartGameWindowMissionSelectionConsole._update_grid_row = function (self, new_row)
	local navigation_grid = self._navigation_grid
	local num_rows = #navigation_grid
	self._current_row = math.clamp(new_row, 1, num_rows)

	self:_update_grid_column(self._current_column)
	self:_update_selection_from_grid()
end

StartGameWindowMissionSelectionConsole._update_grid_column = function (self, new_column)
	local navigation_column = self._navigation_grid[self._current_row]
	local num_columns = #navigation_column
	self._current_column = math.clamp(new_column, 1, num_columns)

	self:_update_selection_from_grid()
end

StartGameWindowMissionSelectionConsole._update_grid_navigation = function (self, row_change, column_change)
	local new_row = self:_find_row(row_change)

	if new_row ~= self._current_row then
		self:_update_grid_row(new_row)
	end

	local new_column = self:_find_column(column_change)

	if new_column ~= self._current_column then
		self:_update_grid_column(new_column)
	end
end

StartGameWindowMissionSelectionConsole._find_row = function (self, row_change)
	if row_change == 0 then
		return self._current_row
	end

	local closest_row = self._current_row
	local current_row = self._current_row
	local grid = self._navigation_grid

	if row_change < 0 then
		for idx, _ in pairs(grid) do
			if idx < current_row then
				closest_row = idx
			else
				break
			end
		end
	else
		for idx, _ in pairs(grid) do
			if current_row < idx then
				closest_row = idx

				break
			end
		end
	end

	return closest_row
end

StartGameWindowMissionSelectionConsole._find_column = function (self, column_change)
	if column_change == 0 then
		return self._current_column
	end

	local closest_column = self._current_column
	local current_column = self._current_column
	local grid = self._navigation_grid[self._current_row]

	if column_change < 0 then
		for idx, _ in pairs(grid) do
			if idx < current_column then
				closest_column = idx
			else
				break
			end
		end
	else
		for idx, _ in pairs(grid) do
			if current_column < idx then
				closest_column = idx

				break
			end
		end
	end

	return closest_column
end

StartGameWindowMissionSelectionConsole._level_is_unlocked = function (self, level_id)
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id

	return LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_id)
end

StartGameWindowMissionSelectionConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local input_service = parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		if input_service:get("move_down_hold_continuous") then
			self:_update_grid_navigation(1, 0)
		elseif input_service:get("move_up_hold_continuous") then
			self:_update_grid_navigation(-1, 0)
		elseif input_service:get("move_right_hold_continuous") then
			self:_update_grid_navigation(0, 1)
		elseif input_service:get("move_left_hold_continuous") then
			self:_update_grid_navigation(0, -1)
		end
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets, 1 do
			local widget = active_node_widgets[i]
			local content = widget.content
			local level_settings = content.level_data
			local level_id = level_settings.level_id

			if self:_is_button_hovered(widget) and self._selected_level_id ~= level_id then
				self:_play_sound("play_gui_lobby_button_02_mission_act_click")
				self:_select_level(level_id)
			end

			if self:_is_button_pressed(widget) then
				parent:set_selected_level_id(level_id)

				local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

				parent:set_layout_by_name(game_mode_layout_name)

				return
			end
		end
	end

	local gamepad_confirm_pressed = gamepad_active and input_service:get(SELECTION_INPUT, true)

	if gamepad_confirm_pressed and self:_level_is_unlocked(self._selected_level_id) then
		self:_play_sound("play_gui_lobby_button_02_mission_select")
		parent:set_selected_level_id(self._selected_level_id)

		local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

		parent:set_layout_by_name(game_mode_layout_name)
	end
end

StartGameWindowMissionSelectionConsole.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets, 1 do
			local widget = active_node_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local active_act_widgets = self._active_act_widgets

	if active_act_widgets then
		for i = 1, #active_act_widgets, 1 do
			local widget = active_act_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StartGameWindowMissionSelectionConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowMissionSelectionConsole._animate_node_widget = function (self, widget, dt)
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

return
