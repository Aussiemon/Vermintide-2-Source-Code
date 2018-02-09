require("scripts/settings/act_settings")

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mission_selection_definitions")
local widget_definitions = definitions.widgets
local map_size = definitions.map_size
local act_widget_definitions = definitions.act_widgets
local node_widget_definitions = definitions.node_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

local DO_RELOAD = false
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
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)

	self._widgets_by_name.select_button.content.button_hotspot.disable_button = true

	self._set_presentation_info(self)
	self._setup_level_acts(self)
	self._present_act_levels(self)
	self._update_level_option(self)

	return 
end
StartGameWindowMissionSelection.create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	return 
end
StartGameWindowMissionSelection._setup_level_acts = function (self)
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local levels_by_act = {}
	local num_levels_added = 0

	for _, level_key in pairs(UnlockableLevels) do
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

	for _, levels in pairs(levels_by_act) do
		table.sort(levels, sort_levels_by_order)
	end

	self._levels_by_act = levels_by_act

	return 
end
StartGameWindowMissionSelection._verify_act = function (self, act)
	if not act then
		return false
	end

	for _, act_key in ipairs(MapPresentationActs) do
		if act == act_key then
			return true
		end
	end

	return false
end
StartGameWindowMissionSelection._present_act_levels = function (self, act)
	local ui_scenegraph = self.ui_scenegraph
	local map_width = map_size[1]
	local map_height = map_size[2]
	local node_widgets = self._node_widgets
	local levels_by_act = self._levels_by_act
	local temp_y_pos = 0
	local temp_x_pos = 0
	local statistics_db = self.statistics_db
	local stats_id = self._stats_id
	local assigned_widgets = {}
	local act_widgets = {}
	local level_width_spacing = 250
	local level_height_spacing = 256
	local max_act_number = 3

	for act_key, levels in pairs(levels_by_act) do
		local act_verified = self._verify_act(self, act_key)

		if act_verified and (not act or act == act_key) then
			local act_settings = ActSettings[act_key]
			local act_sorting = act_settings.sorting
			local act_index = (act_sorting - 1)%max_act_number + 1
			local act_position_y = -level_height_spacing + (max_act_number - act_index)*level_height_spacing
			local act_widget = self._act_widgets[act_index]
			act_widgets[#act_widgets + 1] = act_widget
			act_widget.offset[2] = act_position_y
			local act_banner_texture = act_settings.banner_texture
			local act_display_name = act_settings.display_name
			act_widget.content.background = act_settings.banner_texture
			act_widget.content.text = Localize(act_display_name)
			local num_levels_in_act = #levels
			local level_position_x = -((num_levels_in_act - 1)*level_width_spacing)*0.5

			for _, level_data in ipairs(levels) do
				local index = #assigned_widgets + 1
				local widget = node_widgets[index]
				local content = widget.content
				local level_key = level_data.level_id
				local level_display_name = level_data.display_name
				content.text = Localize(level_display_name)
				local level_unlocked = LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_key)
				local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_key)
				local selection_frame_texture = self._get_selection_frame_by_difficulty_index(self, completed_difficulty_index)
				content.frame = selection_frame_texture
				content.locked = not level_unlocked
				local level_image = level_data.level_image

				if level_image then
					content.icon = level_image
				else
					content.icon = "icons_placeholder"
				end

				content.level_data = level_data
				local offset = widget.offset
				offset[1] = level_position_x
				offset[2] = act_position_y
				assigned_widgets[index] = widget
				level_position_x = level_position_x + level_width_spacing
			end
		end
	end

	self._active_node_widgets = assigned_widgets
	self._active_act_widgets = act_widgets

	return 
end
StartGameWindowMissionSelection._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if 0 < difficulty_index then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local difficulty_manager = Managers.state.difficulty
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end
StartGameWindowMissionSelection._select_level = function (self, level_id)
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for index, widget in ipairs(active_node_widgets) do
			local content = widget.content
			local level_settings = content.level_data
			local is_selected = level_settings.level_id == level_id
			local button_hotspot = widget.content.button_hotspot
			button_hotspot.is_selected = is_selected
		end
	end

	self._selected_level_id = level_id

	self._set_presentation_info(self, level_id)

	self._widgets_by_name.select_button.content.button_hotspot.disable_button = level_id == nil

	return 
end
StartGameWindowMissionSelection._set_presentation_info = function (self, level_id)
	local widgets_by_name = self._widgets_by_name
	local level_text = ""
	local description_text = ""
	local frame_texture = "map_frame_00"
	local draw_info = false

	if level_id then
		local statistics_db = self.statistics_db
		local stats_id = self._stats_id
		local level_settings = LevelSettings[level_id]
		local level_image = level_settings.level_image
		local display_name = level_settings.display_name
		local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
		frame_texture = self._get_selection_frame_by_difficulty_index(self, completed_difficulty_index)
		widgets_by_name.level_texture.content.texture_id = level_image
		level_text = Localize(display_name)
		draw_info = true
	end

	widgets_by_name.level_texture_lock.content.visible = not draw_info
	widgets_by_name.helper_text.content.visible = not draw_info
	widgets_by_name.level_title_divider.content.visible = draw_info
	widgets_by_name.level_title.content.text = level_text
	widgets_by_name.description_text.content.text = description_text
	widgets_by_name.level_texture_frame.content.texture_id = frame_texture

	return 
end
StartGameWindowMissionSelection.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMissionSelection")

	self.ui_animator = nil

	return 
end
StartGameWindowMissionSelection.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self.draw(self, dt)

	return 
end
StartGameWindowMissionSelection.post_update = function (self, dt, t)
	return 
end
StartGameWindowMissionSelection._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
StartGameWindowMissionSelection._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowMissionSelection._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end

	return 
end
StartGameWindowMissionSelection._update_level_option = function (self)
	local level_id = self.parent:get_selected_level_id()

	if level_id ~= self._selected_level_id then
		self._select_level(self, level_id)
	end

	return 
end
StartGameWindowMissionSelection._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for index, widget in ipairs(active_node_widgets) do
			if self._is_button_pressed(self, widget) then
				local content = widget.content
				local level_settings = content.level_data
				local level_id = level_settings.level_id

				self._select_level(self, level_id)

				return 
			end
		end
	end

	local select_button = widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	if self._is_button_pressed(self, select_button) then
		local previous_game_mode_index = parent.get_previous_selected_game_mode_index(parent)

		parent.set_selected_level_id(parent, self._selected_level_id)
		parent.set_layout(parent, previous_game_mode_index)
	end

	return 
end
StartGameWindowMissionSelection._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowMissionSelection.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local active_act_widgets = self._active_act_widgets

	if active_act_widgets then
		for _, widget in ipairs(active_act_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowMissionSelection._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end

return 
