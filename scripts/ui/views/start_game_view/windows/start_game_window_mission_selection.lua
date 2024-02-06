-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_mission_selection.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mission_selection_definitions")
local widget_definitions = definitions.widgets
local large_window_size = definitions.large_window_size
local create_level_widget_definition = definitions.create_level_widget
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

StartGameWindowMissionSelection = class(StartGameWindowMissionSelection)
StartGameWindowMissionSelection.NAME = "StartGameWindowMissionSelection"

StartGameWindowMissionSelection.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMissionSelection")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
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

	self._widgets_by_name.select_button.content.button_hotspot.disable_button = true

	local area_name = self.parent:get_selected_area_name()

	self:_set_presentation_info()
	self:_setup_levels_by_area(area_name)
	self:_update_level_option()
	self.parent:set_input_description("select_mission")

	params.return_layout_name = nil
end

StartGameWindowMissionSelection.create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowMissionSelection._setup_levels_by_area = function (self, area_name)
	local area_settings = AreaSettings[area_name]
	local acts = area_settings.acts
	local dlc_name = area_settings.dlc_name

	self._is_dlc = dlc_name ~= nil

	self:_setup_level_acts()
	self:_present_acts(acts)

	local create_mission_background_widget = area_settings.create_mission_background_widget

	if create_mission_background_widget then
		local background_widget_definition = create_mission_background_widget()

		self._dlc_background_widget = UIWidget.init(background_widget_definition)
	else
		self._dlc_background_widget = nil
	end
end

StartGameWindowMissionSelection._setup_level_acts = function (self)
	local levels_by_act = {}
	local num_levels_added = 0

	for _, level_key in pairs(UnlockableLevels) do
		if not table.find(NoneActLevels, level_key) then
			local level_settings = LevelSettings[level_key]
			local act = level_settings.act

			if not levels_by_act[act] then
				levels_by_act[act] = {}
			end

			local act_levels = levels_by_act[act]
			local index = #act_levels + 1

			act_levels[index] = level_settings
			num_levels_added = num_levels_added + 1
		end
	end

	for _, levels in pairs(levels_by_act) do
		table.sort(levels, sort_levels_by_order)
	end

	self._levels_by_act = levels_by_act
end

StartGameWindowMissionSelection._present_acts = function (self, acts)
	local is_dlc = self._is_dlc

	if is_dlc then
		local ui_scenegraph = self.ui_scenegraph
		local level_root_node = ui_scenegraph.level_root_node
		local large_window_width = large_window_size[1]

		level_root_node.local_position[1] = large_window_width / 2
	end

	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}
	local level_width = 180
	local level_width_spacing = is_dlc and 80 or 34
	local level_height_spacing = 250
	local max_act_number = 3
	local levels_by_act = self._levels_by_act

	for act_key, levels in pairs(levels_by_act) do
		if not acts or table.contains(acts, act_key) then
			local act_settings = ActSettings[act_key]
			local act_sorting = act_settings.sorting
			local act_index = (act_sorting - 1) % max_act_number + 1
			local num_levels_in_act = #levels
			local level_position_x = 0
			local level_position_y = 0
			local act_position_y = 0
			local is_end_act = max_act_number < act_sorting

			if not is_end_act then
				if is_dlc then
					level_position_x = -((level_width + level_width_spacing) * num_levels_in_act) / 2 + (level_width + level_width_spacing) / 2
				else
					act_position_y = -level_height_spacing + (max_act_number - act_index) * level_height_spacing
				end
			end

			for i = 1, #levels do
				local level_data = levels[i]

				if not is_dlc then
					if is_end_act then
						level_position_x = (level_width + level_width_spacing) * 4
					elseif act_index ~= 2 and i == 1 then
						level_position_x = level_position_x + (level_width + level_width_spacing) / 2
					end
				end

				local index = #assigned_widgets + 1
				local scenegraph_id = "level_root_" .. index
				local mission_selection_offset = level_data.mission_selection_offset
				local widget_definition = create_level_widget_definition(scenegraph_id, mission_selection_offset)
				local widget = UIWidget.init(widget_definition)
				local content = widget.content
				local style = widget.style
				local level_key = level_data.level_id
				local level_display_name = level_data.display_name

				content.text = Localize(level_display_name)

				local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key)
				local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key)
				local selection_frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)

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

				local boss_level = level_data.boss_level

				content.level_data = level_data
				content.boss_level = boss_level

				if not mission_selection_offset then
					local offset = widget.offset

					offset[1] = level_position_x
					offset[2] = act_position_y + level_position_y
				end

				if i < num_levels_in_act then
					local next_level_key = levels[i + 1].level_id
					local next_level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, stats_id, next_level_key)

					content.draw_path = act_settings.draw_path or not is_dlc
					content.draw_path_fill = next_level_unlocked
					style.path.texture_size[1] = level_width + level_width_spacing
					style.path_glow.texture_size[1] = level_width + level_width_spacing
				end

				assigned_widgets[index] = widget
				level_position_x = level_position_x + (level_width + level_width_spacing)
			end
		end
	end

	self._active_node_widgets = assigned_widgets

	self:_setup_required_act_connections()
end

StartGameWindowMissionSelection._setup_required_act_connections = function (self)
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local ui_scenegraph = self.ui_scenegraph
	local assigned_widgets = self._active_node_widgets

	for i = 1, #assigned_widgets do
		local widget = assigned_widgets[i]
		local level_settings = LevelSettings[widget.content.level_key]
		local required_acts = level_settings.required_acts

		if required_acts then
			local scenegraph_id = widget.scenegraph_id
			local position = ui_scenegraph[scenegraph_id].world_position
			local offset = widget.offset
			local pos_x, pos_y = position[1] + offset[1], position[2] + offset[2]

			for j = 1, #required_acts do
				local required_act = required_acts[j]
				local required_level_key = self:_get_last_level_in_act(required_act)

				for k = 1, #assigned_widgets do
					local level_widget = assigned_widgets[k]

					if level_widget.content.level_key == required_level_key then
						local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, required_level_key)
						local level_completed = completed_difficulty_index and completed_difficulty_index > 0
						local level_scenegraph_id = level_widget.scenegraph_id
						local level_position = ui_scenegraph[level_scenegraph_id].world_position
						local path_style = level_widget.style.path
						local path_glow_style = level_widget.style.path_glow
						local level_offset = level_widget.offset
						local level_pos_x, level_pos_y = level_position[1] + level_offset[1], level_position[2] + level_offset[2]
						local distance = math.distance_2d(level_pos_x, level_pos_y, pos_x, pos_y)
						local angle = math.angle(level_pos_x, level_pos_y, pos_x, pos_y)

						angle = pos_y < level_pos_y and math.abs(angle) or -angle
						path_style.angle = angle
						path_style.texture_size[1] = distance
						path_glow_style.texture_size[1] = distance
						path_glow_style.angle = angle
						level_widget.content.draw_path = true
						level_widget.content.draw_path_fill = level_completed
					end
				end
			end

			return
		end
	end
end

StartGameWindowMissionSelection._get_last_level_in_act = function (self, act_key)
	local act_levels = GameActs[act_key]
	local best_level_id, best_sort_order = nil, 0

	for i = 1, #act_levels do
		local level_id = act_levels[i]
		local level_settings = LevelSettings[level_id]
		local sort_order = level_settings.act_presentation_order

		if best_sort_order < sort_order then
			best_sort_order = sort_order
			best_level_id = level_id
		end
	end

	return best_level_id, best_sort_order
end

StartGameWindowMissionSelection._get_first_level_id = function (self)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		local widget = active_node_widgets[1]
		local content = widget.content
		local level_settings = content.level_data

		return level_settings.level_id
	end
end

StartGameWindowMissionSelection._is_level_presented = function (self, level_id)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
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

StartGameWindowMissionSelection._select_level = function (self, level_id)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]
			local content = widget.content
			local level_settings = content.level_data
			local is_selected = level_settings.level_id == level_id
			local button_hotspot = widget.content.button_hotspot

			button_hotspot.is_selected = is_selected
		end
	end

	self._selected_level_id = level_id

	self:_set_presentation_info(level_id)

	self._widgets_by_name.select_button.content.button_hotspot.disable_button = level_id == nil
end

StartGameWindowMissionSelection._set_presentation_info = function (self, level_id)
	local level_text = ""
	local level_description_text = ""
	local frame_texture = "map_frame_00"
	local draw_info = false
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

		frame_texture = UIWidgetUtils.get_level_frame_by_difficulty_index(completed_difficulty_index)
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
end

StartGameWindowMissionSelection.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMissionSelection")

	self.ui_animator = nil

	self.parent:set_input_description(nil)
end

StartGameWindowMissionSelection.update = function (self, dt, t)
	self:_update_animations(dt)
	self:draw(dt)
end

StartGameWindowMissionSelection.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StartGameWindowMissionSelection._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowMissionSelection._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowMissionSelection._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

StartGameWindowMissionSelection._update_level_option = function (self)
	local level_id = self.parent:get_selected_level_id()

	if level_id ~= self._selected_level_id then
		if self:_is_level_presented(level_id) then
			self:_select_level(level_id)
		elseif not self._selected_level_id then
			local first_level_id = self:_get_first_level_id()

			self:_select_level(first_level_id)
		end
	end
end

StartGameWindowMissionSelection._handle_input = function (self, dt, t)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]

			if self:_is_button_hovered(widget) then
				self:_play_sound("play_gui_lobby_button_02_mission_act_hover")
			end

			if self:_is_button_pressed(widget) then
				local content = widget.content
				local level_settings = content.level_data
				local level_id = level_settings.level_id

				if self._selected_level_id ~= level_id then
					self:_play_sound("play_gui_lobby_button_02_mission_act_click")
					self:_select_level(level_id)
				end

				return
			end
		end
	end

	local widgets_by_name = self._widgets_by_name
	local select_button = widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	if self:_is_button_hovered(select_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self:_is_button_pressed(select_button) then
		self:_play_sound("play_gui_lobby_button_02_mission_select")

		local parent = self.parent
		local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

		parent:set_layout_by_name(game_mode_layout_name)
		parent:set_selected_level_id(self._selected_level_id)
	end
end

StartGameWindowMissionSelection.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for i = 1, #active_node_widgets do
			local widget = active_node_widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local dlc_background_widget = self._dlc_background_widget

	if dlc_background_widget then
		UIRenderer.draw_widget(ui_renderer, dlc_background_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowMissionSelection._play_sound = function (self, event)
	self.parent:play_sound(event)
end
