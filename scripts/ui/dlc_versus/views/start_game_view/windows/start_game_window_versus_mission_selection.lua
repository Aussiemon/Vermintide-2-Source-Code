-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/start_game_window_versus_mission_selection.lua

local definitions = local_require("scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_mission_selection_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local widget_functions = definitions.widget_functions
local grid_settings = definitions.grid_settings
local SELECTION_INPUT = "confirm_press"

StartGameWindowVersusMissionSelection = class(StartGameWindowVersusMissionSelection)
StartGameWindowVersusMissionSelection.NAME = "StartGameWindowVersusMissionSelection"

StartGameWindowVersusMissionSelection.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowVersusMissionSelection")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self._player_manager = player_manager
	self._peer_id = ingame_ui_context.peer_id
	self._selected_grid_index = {
		1,
		1,
	}
	self._animations = {}
	self._ui_animations = {}

	self:_gather_level_information()
	self:_create_ui_elements(params, offset)
	self:_handle_input_desc()

	self._return_layout_name = self._parent:get_selected_layout_name() or "versus_custom_game"

	self:_start_transition_animation("on_enter")
end

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

StartGameWindowVersusMissionSelection._gather_level_information = function (self)
	local levels = UnlockableLevelsByGameMode.versus
	local sorted_levels = {}

	for i = 1, #levels do
		local level_key = levels[i]

		sorted_levels[i] = LevelSettings[level_key]
	end

	table.sort(sorted_levels, sort_levels_by_order)

	sorted_levels.act_name = "act_versus"
	self._sorted_level_data = {
		{
			area_display_name = "area_selection_carousel_name",
			levels_by_act = {
				sorted_levels,
			},
		},
		{
			area_display_name = "random_level",
			levels_by_act = {
				{
					DummyAnyLevel,
					act_name = "act_versus",
				},
			},
		},
	}
end

StartGameWindowVersusMissionSelection._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

StartGameWindowVersusMissionSelection._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)

	local global_entries = {}
	local area_entries = {}
	local global_grid_entries = {}
	local area_grid_entries = {}
	local global_offset = {
		0,
		0,
		0,
	}
	local global_row = 1

	for i = 1, #self._sorted_level_data do
		global_offset[1] = 0

		local area_data = self._sorted_level_data[i]
		local area_name = area_data.area_name
		local global_area_entry = UIWidget.init(widget_functions.create_area_entry(area_data, global_offset))

		global_entries[#global_entries + 1] = global_area_entry

		local starting_offset_y = global_offset[2]
		local area_background = global_area_entry.style.background
		local area_background_frame = global_area_entry.style.frame

		global_offset[1] = global_offset[1] + grid_settings.area_spacing[1]
		global_offset[2] = global_offset[2] + grid_settings.area_spacing[2]
		global_offset[3] = global_offset[3] + grid_settings.area_spacing[3]

		local offset = {
			0,
			global_offset[2],
			global_offset[3],
		}
		local levels_by_act = area_data.levels_by_act
		local add_acts = #levels_by_act > 1

		for j = 1, #levels_by_act do
			offset[1] = grid_settings.margin
			global_offset[1] = grid_settings.margin

			local levels = levels_by_act[j]
			local act_name = levels.act_name

			if add_acts then
				local act_entry = UIWidget.init(widget_functions.create_act_entry(act_name .. "_display_name", offset))

				offset[1] = offset[1] + grid_settings.act_spacing[1]
				offset[2] = offset[2] + grid_settings.act_spacing[2]
				offset[3] = offset[3] + grid_settings.act_spacing[3]
				area_entries[#area_entries + 1] = act_entry

				local global_act_entry = UIWidget.init(widget_functions.create_act_entry(act_name .. "_display_name", global_offset))

				global_offset[1] = global_offset[1] + grid_settings.act_spacing[1]
				global_offset[2] = global_offset[2] + grid_settings.act_spacing[2]
				global_offset[3] = global_offset[3] + grid_settings.act_spacing[3]
				global_entries[#global_entries + 1] = global_act_entry
			end

			local level_count = #levels

			for k = 1, level_count do
				local temp_offset = table.clone(offset)
				local index = k - 1
				local level_settings = levels[math.min(k, #levels)]
				local is_disabled, disabled_reason = false

				if level_settings.level_id ~= "any" then
					local dlc_name = level_settings.dlc_name

					if dlc_name and not Managers.unlock:is_dlc_unlocked(dlc_name) then
						is_disabled = true
						disabled_reason = "dlc"
					end

					local map_pool = script_data.versus_map_pool or Managers.mechanism:mechanism_setting_for_title("map_pool")

					if map_pool and not table.find(map_pool, level_settings.level_id) then
						is_disabled = true
						disabled_reason = "map_pool"
					end
				end

				temp_offset[1] = temp_offset[1] + grid_settings.level_spacing[1] * (index % grid_settings.columns)
				temp_offset[2] = temp_offset[2] + grid_settings.level_spacing[2] * math.floor(index / grid_settings.columns)
				temp_offset[3] = temp_offset[3] + grid_settings.level_spacing[3]

				local row = math.floor(index / grid_settings.columns) + 1
				local column = index % grid_settings.columns + 1
				local level_entry = UIWidget.init(widget_functions.create_level_entry(level_settings, temp_offset, self._selected_grid_index, {
					row,
					column,
				}, is_disabled, disabled_reason, self._level_preferences))
				local row = math.floor(index / grid_settings.columns) + 1
				local column = index % grid_settings.columns + 1

				area_grid_entries[row] = area_grid_entries[row] or {}
				area_grid_entries[row][column] = area_grid_entries[row][column] or {}
				area_grid_entries[row][column] = level_entry
				area_entries[#area_entries + 1] = level_entry

				local temp_global_offset = table.clone(global_offset)

				temp_global_offset[1] = temp_global_offset[1] + grid_settings.level_spacing[1] * (index % grid_settings.columns)
				temp_global_offset[2] = temp_global_offset[2] + grid_settings.level_spacing[2] * math.floor(index / grid_settings.columns)
				temp_global_offset[3] = temp_global_offset[3] + grid_settings.level_spacing[3]

				local new_global_row = global_row - 1 + row
				local global_level_entry = UIWidget.init(widget_functions.create_level_entry(level_settings, temp_global_offset, self._selected_grid_index, {
					new_global_row,
					column,
				}, is_disabled, disabled_reason, self._level_preferences))

				global_grid_entries[new_global_row] = global_grid_entries[new_global_row] or {}
				global_grid_entries[new_global_row][column] = global_grid_entries[new_global_row][column] or {}
				global_grid_entries[new_global_row][column] = global_level_entry
				global_entries[#global_entries + 1] = global_level_entry
				global_level_entry.content.selected_index = self._selected_grid_index
				global_level_entry.content.preferred_levels = self._level_preferences
			end

			local vertical_offset = 1 + math.floor((level_count - 1) / grid_settings.columns)

			offset[2] = offset[2] + grid_settings.level_spacing[2] * vertical_offset
			global_offset[2] = global_offset[2] + grid_settings.level_spacing[2] * vertical_offset
			global_row = global_row + vertical_offset
		end

		area_background.texture_size[2] = global_offset[2] - starting_offset_y + grid_settings.section_spacing[2] * 0.5
		area_background_frame.area_size[2] = -area_background.texture_size[2] + area_background_frame.edge_height * 2
		area_background.offset[2] = global_offset[2] - starting_offset_y + grid_settings.section_spacing[2] * 0.5
		offset[2] = offset[2] + grid_settings.section_spacing[2]
		global_offset[2] = global_offset[2] + grid_settings.section_spacing[2]
	end

	self._total_length = global_offset[2]
	self._scroll_multiplier = (UISettings.game_start_windows.size[2] + 20) / math.abs(self._total_length)

	local scroller_widget = self._widgets_by_name.scroller
	local scroller_style = scroller_widget.style.scroller

	scroller_style.texture_size[2] = (UISettings.game_start_windows.size[2] + 20) * self._scroll_multiplier - 6
	scroller_widget.content.visible = false
	self._current_entries = global_entries
	self._current_grid_entries = global_grid_entries
	self._global_entries = global_entries
	self._area_entries = area_entries
	self._global_grid_entries = global_grid_entries
	self._area_grid_entries = area_grid_entries

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self:_populate_description()
end

StartGameWindowVersusMissionSelection.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowVersusMissionSelection")

	self._ui_animator = nil

	self._parent:set_input_description(nil)
end

StartGameWindowVersusMissionSelection.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_gamepad_scroller(dt, t)
	self:_update_scroller(dt, t)
	self:_draw(dt)
end

StartGameWindowVersusMissionSelection._update_gamepad_scroller = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local area_size = UISettings.game_start_windows.size[2] + 20
	local window_size = self._total_length + UISettings.game_start_windows.size[2] + 20
	local current_grid_offset = self._ui_scenegraph.grid_anchor.local_position[2]
	local current_grid = self._current_grid_entries
	local current_selection = self._selected_grid_index
	local old_grid_y_selection = self._old_grid_y_selection or 0
	local row = current_selection[1]
	local column = current_selection[2]

	if row == old_grid_y_selection then
		return
	end

	local current_widget = current_grid[row][column]
	local current_widget_offset = current_widget.offset[2]
	local current_screen_position = -current_grid_offset - current_widget_offset
	local wanted_pos = math.clamp(current_grid_offset + (current_screen_position - area_size / 2), 0, math.abs(window_size))

	self._ui_animations.scroll = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.grid_anchor.position, 2, self._ui_scenegraph.grid_anchor.position[2], wanted_pos, 0.3, math.easeOutCubic)

	local scroller_widget = self._widgets_by_name.scroller
	local scroller_style = scroller_widget.style.scroller
	local scroller_offset = 3 + (UISettings.game_start_windows.size[2] - 6) * (1 - self._scroll_multiplier) * (wanted_pos / math.abs(window_size))

	self._ui_animations.scroller = UIAnimation.init(UIAnimation.function_by_time, scroller_style.offset, 2, scroller_style.offset[2], -scroller_offset, 0.3, math.easeOutCubic)
	self._old_grid_y_selection = row
end

StartGameWindowVersusMissionSelection._update_scroller = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		return
	end
end

StartGameWindowVersusMissionSelection.post_update = function (self, dt, t)
	return
end

StartGameWindowVersusMissionSelection._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local animations = self._ui_animations

	for animation_name, animation in pairs(animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animations[animation_name] = nil
		end
	end
end

StartGameWindowVersusMissionSelection._handle_input = function (self, dt, t)
	local input_service = self._parent:window_input_service()

	if input_service:get("move_right_hold_continuous") then
		self:_update_selection(0, 1)
	elseif input_service:get("move_left_hold_continuous") then
		self:_update_selection(0, -1)
	end

	if input_service:get("move_up_hold_continuous") then
		self:_update_selection(-1, 0)
	elseif input_service:get("move_down_hold_continuous") then
		self:_update_selection(1, 0)
	end

	if input_service:get("confirm_press", true) then
		local current_grid_entries = self._current_grid_entries
		local current_selection = self._selected_grid_index
		local row = current_selection[1]
		local column = current_selection[2]
		local current_widget = current_grid_entries[row][column]
		local content = current_widget.content

		if not content.is_disabled then
			local level_id = current_widget.content.level_settings.level_id

			self._parent:set_selected_level_id(level_id)
			self._parent:set_layout_by_name(self._return_layout_name)

			local matchmaking_manager = Managers.matchmaking

			if matchmaking_manager:is_in_versus_custom_game_lobby() then
				matchmaking_manager:set_selected_level(level_id)
			end

			return
		end
	end

	for _, entry in pairs(self._current_entries) do
		local level_settings = entry.content.level_settings

		if level_settings then
			if UIUtils.is_button_hover_enter(entry) then
				local selected_index = entry.content.index

				self:_set_selection(selected_index[1], selected_index[2])
			elseif UIUtils.is_button_pressed(entry) then
				local level_id = level_settings.level_id

				self._parent:set_selected_level_id(level_id)
				self._parent:set_layout_by_name(self._return_layout_name)

				local matchmaking_manager = Managers.matchmaking

				if matchmaking_manager:is_in_versus_custom_game_lobby() then
					matchmaking_manager:set_selected_level(level_id)
				end

				break
			end
		end
	end
end

StartGameWindowVersusMissionSelection._set_selection = function (self, row, column)
	local current_selection = self._selected_grid_index

	current_selection[1] = row
	current_selection[2] = column

	self:_populate_description()
end

StartGameWindowVersusMissionSelection._update_selection = function (self, row_change, column_change)
	local current_grid = self._current_grid_entries
	local current_selection = self._selected_grid_index

	if math.abs(row_change) > 0 then
		local new_row = math.clamp(current_selection[1] + row_change, 1, table.size(current_grid))
		local num_columns = table.size(current_grid[new_row])
		local new_column = math.min(current_selection[2], num_columns)

		current_selection[1] = new_row
		current_selection[2] = new_column
	elseif math.abs(column_change) > 0 then
		local current_row = current_selection[1]
		local new_column = math.clamp(current_selection[2] + column_change, 1, table.size(current_grid[current_row]))

		current_selection[2] = new_column
	end

	self:_handle_input_desc()
	self:_populate_description()
end

StartGameWindowVersusMissionSelection._handle_input_desc = function (self)
	local current_grid = self._current_grid_entries
	local current_selection = self._selected_grid_index
	local row = current_selection[1]
	local column = current_selection[2]
	local current_widget = current_grid[row][column]
	local dlc_is_locked = current_widget.content.dlc_is_locked

	if dlc_is_locked then
		self._parent:set_input_description(nil)

		return
	end

	local level_settings = current_widget.content.level_settings
	local level_id = level_settings.level_id

	do return end

	if not self._level_preferences[1][level_id] and self._level_preferences[2][level_id] then
		-- Nothing
	end
end

StartGameWindowVersusMissionSelection._populate_description = function (self)
	local current_selection = self._selected_grid_index
	local x = current_selection[1]
	local y = current_selection[2]
	local current_level_entry = self._current_grid_entries[x][y]
	local level_settings = current_level_entry.content.level_settings
	local level_text = ""
	local level_description_text = ""
	local frame_texture = "map_frame_00"
	local draw_info = false
	local is_locked = true
	local lock_text = ""
	local widgets_by_name = self._widgets_by_name
	local selected_level_widget = widgets_by_name.selected_level
	local content = selected_level_widget.content

	if level_settings then
		local statistics_db = self._statistics_db
		local stats_id = self._stats_id
		local level_id = level_settings.level_id
		local level_image = level_settings.level_image
		local boss_level = level_settings.boss_level
		local display_name = level_settings.display_name

		level_description_text = level_settings.description_text

		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)

		frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)

		local is_disabled = current_level_entry.content.is_disabled

		is_locked = is_disabled or level_id ~= "any" and not LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_id)

		if is_locked then
			local dlc_name = level_settings.dlc_name

			if dlc_name and not Managers.unlock:is_dlc_unlocked(dlc_name) then
				lock_text = Localize("dlc1_2_dlc_level_locked_tooltip")
			end
		end

		content.icon = level_image
		content.boss_level = boss_level
		level_text = Localize(display_name)
		level_description_text = level_description_text and Localize(level_description_text)
		draw_info = true
	end

	content.frame = frame_texture
	content.locked = is_locked
	content.visible = draw_info
	content.button_hotspot.disable_button = true
	widgets_by_name.helper_text.content.visible = not draw_info
	widgets_by_name.level_title_divider.content.visible = draw_info
	widgets_by_name.level_title.content.text = level_text
	widgets_by_name.description_text.content.text = level_description_text
	widgets_by_name.description_text.content.visible = not not level_description_text
	widgets_by_name.locked_text.content.text = lock_text
end

StartGameWindowVersusMissionSelection._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._global_entries)
	UIRenderer.end_pass(ui_top_renderer)
end
