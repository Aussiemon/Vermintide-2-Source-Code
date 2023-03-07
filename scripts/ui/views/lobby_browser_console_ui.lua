require("foundation/scripts/util/local_require")
require("scripts/managers/telemetry/iso_country_names")
require("scripts/settings/level_settings")

local definitions = local_require("scripts/ui/views/lobby_browser_console_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local base_widget_definition = definitions.base_widget_definition
local adventure_details_widget_definition = definitions.adventure_details_widget_definition
local weave_details_widget_definition = definitions.weave_details_widget_definition
local deus_details_widget_definition = definitions.deus_details_widget_definition
local animation_definitions = definitions.animation_definitions
LobbyBrowserConsoleUI = class(LobbyBrowserConsoleUI)
local GAME_TYPE_LOOKUP_STRINGS = {
	deus = "area_selection_morris_name",
	adventure = "area_selection_campaign",
	weave = "menu_weave_area_no_wom_title",
	versus = "vs_ui_versus_tag",
	any = "lobby_browser_mission"
}

LobbyBrowserConsoleUI.init = function (self, parent, ingame_ui_context, game_mode_data, show_lobby_data_table, distance_data_table)
	self._ingame_ui_context = ingame_ui_context
	self._game_mode_data = game_mode_data
	self._show_lobby_data_table = show_lobby_data_table
	self._distance_data_table = distance_data_table
	self._parent = parent
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._details_type = "adventure"
	self._ui_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._world_manager = ingame_ui_context.world_manager
	self._world = self._world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(self._world)

	self:_create_ui_elements()
	self:_start_transition_animation("on_enter")
end

LobbyBrowserConsoleUI._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

LobbyBrowserConsoleUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets = {}
	self._animations = {}
	self._lobby_entry_widgets = {}
	self._empty_lobby_entry_widgets = {}
	self._details_widgets = {}
	self._ui_animations = {}
	self._selected_lobby_index = 1
	self._mouse_selected_index = 1
	self._visible_list_index = 1
	self._hold_up_timer = 0
	self._hold_down_timer = 0
	self._hold_up_list_timer = 0
	self._hold_down_list_timer = 0
	self._wanted_pos = 0
	self._base_pos_y = nil
	self._list_base_pos_y = nil
	self._dot_timer = 0
	self._details_filled = false
	local base_widget_definition = base_widget_definition

	for name, widget in pairs(base_widget_definition) do
		self._widgets[name] = UIWidget.init(widget)
	end

	local details_widgets = {}
	local adventure_details_widget_definition = adventure_details_widget_definition

	for name, widget in pairs(adventure_details_widget_definition) do
		details_widgets[name] = UIWidget.init(widget)
	end

	self._details_widgets.adventure = details_widgets
	local details_widgets = {}
	local weave_details_widget_definition = weave_details_widget_definition

	for name, widget in pairs(weave_details_widget_definition) do
		details_widgets[name] = UIWidget.init(widget)
	end

	self._details_widgets.weave = details_widgets
	local details_widgets = {}
	local deus_details_widget_definition = deus_details_widget_definition

	for name, widget in pairs(deus_details_widget_definition) do
		details_widgets[name] = UIWidget.init(widget)
	end

	self._details_widgets.deus = details_widgets

	self:populate_lobby_list(self._lobbies or {}, false)
	self:_create_filters()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

LobbyBrowserConsoleUI._create_filters = function (self)
	self._game_type_filter_widgets = {}
	self._level_filter_widgets = {}
	self._difficulty_filter_widgets = {}
	self._lobby_filter_widgets = {}
	self._distance_filter_widgets = {}
	self._filter_functions = {
		{
			input_function = "_handle_game_type_filter_input",
			render_function = "_render_game_type_filter_list",
			input_function_mouse = "_handle_game_type_filter_input_mouse"
		},
		{
			input_function = "_handle_level_filter_input",
			render_function = "_render_level_filter_list",
			input_function_mouse = "_handle_level_filter_input_mouse"
		},
		{
			input_function = "_handle_difficulty_filter_input",
			render_function = "_render_difficulty_filter_list",
			input_function_mouse = "_handle_difficulty_filter_input_mouse"
		},
		{
			input_function = "_handle_lobby_filter_input",
			render_function = "_render_lobby_filter_list",
			input_function_mouse = "_handle_lobby_filter_input_mouse"
		},
		{
			input_function = "_handle_distance_filter_input",
			render_function = "_render_distance_filter_list",
			input_function_mouse = "_handle_distance_filter_input_mouse"
		}
	}

	self:setup_filter_entries()
end

LobbyBrowserConsoleUI.setup_filter_entries = function (self)
	table.clear(self._game_type_filter_widgets)
	table.clear(self._level_filter_widgets)
	table.clear(self._difficulty_filter_widgets)
	table.clear(self._lobby_filter_widgets)
	table.clear(self._distance_filter_widgets)

	local game_mode_data = self._game_mode_data
	local game_modes = game_mode_data.game_modes
	local game_mode_index = self._parent:get_selected_game_mode_index() or game_modes.adventure
	local game_mode_data = game_mode_data[game_mode_index]
	local game_mode_key = game_mode_data.game_mode_key
	local unlockable_levels = UnlockableLevelsByGameMode[game_mode_key] and table.clone(UnlockableLevelsByGameMode[game_mode_key]) or {}
	local levels = game_mode_data.levels
	local difficulties = game_mode_data.difficulties
	local element_settings = definitions.element_settings
	local offset_y = -element_settings.filter_height - element_settings.spacing
	local create_game_type_filter_entry_func = definitions.create_game_type_filter_entry_func
	local widget = create_game_type_filter_entry_func("any", GAME_TYPE_LOOKUP_STRINGS.any, offset_y)
	self._game_type_filter_widgets[#self._game_type_filter_widgets + 1] = UIWidget.init(widget)

	for _, game_type in ipairs(game_modes) do
		if game_type ~= "any" then
			offset_y = offset_y - element_settings.filter_height - element_settings.spacing
			local widget = create_game_type_filter_entry_func(game_type, GAME_TYPE_LOOKUP_STRINGS[game_type], offset_y)
			self._game_type_filter_widgets[#self._game_type_filter_widgets + 1] = UIWidget.init(widget)
		end
	end

	local level_widgets = {}
	local create_level_filter_entry_func = definitions.create_level_filter_entry_func

	for _, level in pairs(levels) do
		if level ~= "any" then
			local index = table.find(unlockable_levels, level)

			table.remove(unlockable_levels, index)

			local widget = create_level_filter_entry_func(level, true)
			level_widgets[#level_widgets + 1] = UIWidget.init(widget)
		end
	end

	local function sort_func(left, right)
		local left_name = string.gsub(string.lower(left.content.level_name_id), "the ", "")
		local right_name = string.gsub(string.lower(right.content.level_name_id), "the ", "")

		return left_name < right_name
	end

	table.sort(level_widgets, sort_func)

	local locked_level_widgets = {}

	for _, level in pairs(unlockable_levels) do
		local level_settings = LevelSettings[level]

		if not level_settings.ommit_from_lobby_browser then
			local widget = create_level_filter_entry_func(level, false)
			locked_level_widgets[#locked_level_widgets + 1] = UIWidget.init(widget)
		end
	end

	table.sort(locked_level_widgets, sort_func)
	table.append(level_widgets, locked_level_widgets)

	local widget_definition = create_level_filter_entry_func("any", true)
	local widget = UIWidget.init(widget_definition)

	table.insert(level_widgets, 1, widget)

	local offset_y = 0

	for _, widget in ipairs(level_widgets) do
		offset_y = offset_y - element_settings.filter_height - element_settings.spacing
		widget.offset[2] = offset_y
	end

	self._level_filter_widgets = level_widgets
	self._level_filter_scroller = UIWidget.init(definitions.create_level_filter_scroller_func(#level_widgets))
	local offset_y = -element_settings.filter_height - element_settings.spacing
	local create_difficulty_filter_entry_func = definitions.create_difficulty_filter_entry_func
	local widget = create_difficulty_filter_entry_func("any", offset_y)
	self._difficulty_filter_widgets[#self._difficulty_filter_widgets + 1] = UIWidget.init(widget)

	for _, difficulty in pairs(difficulties) do
		if difficulty ~= "any" then
			offset_y = offset_y - element_settings.filter_height - element_settings.spacing
			local widget = create_difficulty_filter_entry_func(difficulty, offset_y)
			self._difficulty_filter_widgets[#self._difficulty_filter_widgets + 1] = UIWidget.init(widget)
		end
	end

	local show_lobby_data_table = self._show_lobby_data_table
	local offset_y = 0
	local create_lobby_filter_entry_func = definitions.create_lobby_filter_entry_func

	for _, show_lobby_type in ipairs(show_lobby_data_table) do
		offset_y = offset_y - element_settings.filter_height - element_settings.spacing
		local widget_definition = create_lobby_filter_entry_func(show_lobby_type, offset_y)
		self._lobby_filter_widgets[#self._lobby_filter_widgets + 1] = UIWidget.init(widget_definition)
	end

	local distance_data_table = self._distance_data_table
	local offset_y = 0
	local create_distance_filter_entry_func = definitions.create_distance_filter_entry_func

	for _, distance in ipairs(distance_data_table) do
		offset_y = offset_y - element_settings.filter_height - element_settings.spacing
		local widget_definition = create_distance_filter_entry_func(distance, offset_y)
		self._distance_filter_widgets[#self._distance_filter_widgets + 1] = UIWidget.init(widget_definition)
	end

	local frame_widget = self._widgets.filter_frame
	local frame_widget_content = frame_widget.content
	frame_widget_content.filter_hotspot_1.disable_button = #self._game_type_filter_widgets < 2
	frame_widget_content.filter_hotspot_2.disable_button = #self._level_filter_widgets < 2
	frame_widget_content.filter_hotspot_3.disable_button = #self._difficulty_filter_widgets < 2
	frame_widget_content.filter_hotspot_4.disable_button = #self._lobby_filter_widgets < 2
	frame_widget_content.filter_hotspot_5.disable_button = #self._distance_filter_widgets < 2
end

LobbyBrowserConsoleUI.update = function (self, dt, t, loading)
	self:_update_info_text(dt, t, loading)
	self:_handle_input(dt, t, loading)
	self:_handle_mouse_input(dt, t, loading)
	self:_handle_input_description(dt, t)
	self:_update_animations(dt, t)
	self:_update_lobby_data(dt, t)
	self:_draw(dt, t)
end

LobbyBrowserConsoleUI._update_info_text = function (self, dt, t, loading)
	local widget = self._widgets.frame
	local widget_content = widget.content

	if loading then
		local text = Localize("start_game_window_lobby_searching")
		text = text .. string.rep(".", self._dot_timer % 4)
		self._dot_timer = self._dot_timer + dt * 5
		widget_content.info_text_id = text
	else
		self._dot_timer = 0
		widget_content.info_text_id = Localize("start_game_window_lobbies_found") .. ": " .. self._num_lobbies
	end
end

LobbyBrowserConsoleUI._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._ui_animations

	for animation_name, animation in pairs(animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animations[animation_name] = nil
		end
	end

	UIWidgetUtils.animate_default_button(self._widgets.join_button, dt)
	UIWidgetUtils.animate_default_button(self._widgets.refresh_button, dt)
end

local VALID_LOBBIES = {}
local VALID_LOBBIES_BY_ID = {}

LobbyBrowserConsoleUI._remove_invalid_lobbies = function (self, lobbies)
	table.clear(VALID_LOBBIES)
	table.clear(VALID_LOBBIES_BY_ID)

	local num_lobbies = #lobbies
	local mission_ids = NetworkLookup.mission_ids
	local invalid = false

	for i = 1, num_lobbies do
		invalid = false
		local lobby = lobbies[i]

		if lobby then
			local selected_mission_id = lobby.selected_mission_id

			if selected_mission_id then
				invalid = mission_ids[selected_mission_id] == nil or invalid
			end

			local mission_id = lobby.mission_id

			if mission_id then
				invalid = mission_ids[mission_id] == nil or invalid
			end

			if not invalid then
				VALID_LOBBIES[#VALID_LOBBIES + 1] = lobby
				VALID_LOBBIES_BY_ID[lobby.id] = lobby
			end
		end
	end

	return VALID_LOBBIES, VALID_LOBBIES_BY_ID
end

LobbyBrowserConsoleUI.populate_lobby_list = function (self, lobbies, ignore_scroll_reset)
	local lobby_frame_widget = self._widgets.frame
	local lobby_frame_widget_content = lobby_frame_widget.content
	lobby_frame_widget_content.timer = 0
	local valid_lobbies, valid_lobbies_by_id = self:_remove_invalid_lobbies(lobbies)
	local element_settings = definitions.element_settings
	local offset_y = 0
	local lobby_entry_widgets = self._lobby_entry_widgets

	table.clear(lobby_entry_widgets)

	local create_lobby_entry_func = definitions.create_lobby_entry_func

	for index, lobby_data in pairs(valid_lobbies) do
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		offset_y = offset_y - element_settings.height - element_settings.spacing
		local completed_difficulty_index = self._parent:completed_level_difficulty_index(lobby_data)
		local lobby_entry = create_lobby_entry_func(offset_y, lobby_data, #lobby_entry_widgets + 1, joinable, completed_difficulty_index)
		local lobby_entry_widget = UIWidget.init(lobby_entry)
		lobby_entry_widgets[#lobby_entry_widgets + 1] = lobby_entry_widget
	end

	self._lobbies = valid_lobbies
	self._num_lobbies = #lobby_entry_widgets

	self:_select_lobby(nil, self._selected_lobby_index)

	local widget = self._widgets.frame
	local widget_content = widget.content
	local widget_style = widget.style
	widget_content.show_scroller = false
	self._empty_lobby_entry_widgets = self._empty_lobby_entry_widgets or {}
	local empty_lobby_entry_widgets = self._empty_lobby_entry_widgets

	table.clear(empty_lobby_entry_widgets)

	if self._num_lobbies < element_settings.num_visible_entries then
		local amount = element_settings.num_visible_entries - self._num_lobbies
		local create_empty_lobby_entry_func = definitions.create_empty_lobby_entry_func

		for i = 1, amount do
			offset_y = offset_y - element_settings.height - element_settings.spacing
			local lobby_entry = create_empty_lobby_entry_func(offset_y)
			local lobby_entry_widget = UIWidget.init(lobby_entry)
			empty_lobby_entry_widgets[#empty_lobby_entry_widgets + 1] = lobby_entry_widget
		end
	elseif element_settings.num_visible_entries < self._num_lobbies then
		widget_content.show_scroller = true
		local scroller_style = widget_style.scroller
		scroller_style.texture_size[2] = math.min(-(element_settings.window_height / (self._num_lobbies / element_settings.num_visible_entries)), -30)
		local inner_scroller_style = widget_style.inner_scroller
		inner_scroller_style.texture_size[2] = math.min(-(element_settings.window_height / (self._num_lobbies / element_settings.num_visible_entries)), -30) + 4
	end
end

LobbyBrowserConsoleUI._handle_input_description = function (self, dt, t)
	if self._filter_active then
		self._parent:set_input_description("set_filter")
	elseif self._selected_lobby_index then
		local lobby_data = self._lobbies[self._selected_lobby_index]

		if lobby_data then
			local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)

			if joinable then
				self._parent:set_input_description("join_filter")
			else
				self._parent:set_input_description("filter")
			end
		else
			self._parent:set_input_description("filter")
		end
	else
		self._parent:set_input_description("filter")
	end
end

LobbyBrowserConsoleUI._handle_input = function (self, dt, t, loading)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active then
		return
	end

	local input_manager = self._input_manager
	local input_service = self._parent:input_service()

	self:_verify_selected_lobby_index()

	local element_settings = definitions.element_settings

	if self._filter_active then
		if self._current_active_filter then
			local filter_function = self._filter_functions[self._current_active_filter]

			self[filter_function.input_function](self, input_service, element_settings, dt, t)
		else
			self:_handle_filter_input(input_service, element_settings, dt, t)
		end
	else
		self:_handle_browser_input(input_service, element_settings, dt, t)
	end
end

LobbyBrowserConsoleUI._handle_mouse_input = function (self, dt, t, loading)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		return
	end

	local input_manager = self._input_manager
	local input_service = self._parent:input_service()

	self:_verify_selected_lobby_index()

	local element_settings = definitions.element_settings

	if self._filter_active then
		if self._current_active_filter then
			local filter_function = self._filter_functions[self._current_active_filter]

			self[filter_function.input_function_mouse](self, input_service, element_settings, dt, t)
		else
			local widget = self._widgets.frame
			local widget_content = widget.content
			widget_content.filter_active = false
			self._filter_active = false
			self._current_active_filter = false
			self._current_filter_index = 1
			self._filter_list_index = nil
			local widget = self._widgets.filter_frame
			local widget_content = widget.content
			widget_content.filter_selection = false
			widget_content.filter_index = self._current_filter_index
		end
	else
		self:_handle_browser_input_mouse(input_service, element_settings, dt, t)
	end
end

LobbyBrowserConsoleUI._verify_selected_lobby_index = function (self)
	local old_selected_lobby_index = self._selected_lobby_index
	self._selected_lobby_index = math.clamp(self._selected_lobby_index, 1, math.max(self._num_lobbies, 1))

	if old_selected_lobby_index ~= self._selected_lobby_index then
		local element_settings = definitions.element_settings
		local num_visible_entries = element_settings.num_visible_entries
		local entry_size_y = element_settings.height + element_settings.spacing
		self._base_pos_y = self._base_pos_y or scenegraph_definition.lobby_entry_anchor.position[2]
		self._visible_list_index = math.max(math.min(num_visible_entries, self._num_lobbies), 1)
		local new_pos = self._base_pos_y

		if num_visible_entries < self._selected_lobby_index then
			new_pos = self._base_pos_y + self._selected_lobby_index * entry_size_y
		end

		local base_pos = self._base_pos_y
		local value = self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y
		self._wanted_pos = math.clamp(new_pos, self._base_pos_y, math.max(self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y, 0))
		self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.lobby_entry_anchor.position, 2, self._ui_scenegraph.lobby_entry_anchor.position[2], self._wanted_pos, 0.3, math.easeOutCubic)

		self:_select_lobby(old_selected_lobby_index, self._selected_lobby_index, self._mouse_selected_index)

		local widget = self._widgets.frame
		local widget_content = widget.content
		local progress = self._wanted_pos / (self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y)

		if self:_is_nan(progress) then
			progress = 0
		end

		self._ui_animations.scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
	end
end

LobbyBrowserConsoleUI._handle_browser_input = function (self, input_service, element_settings, dt, t)
	local hold_down_timer = 0
	local hold_up_timer = 0
	local old_selected_lobby_index = self._selected_lobby_index
	local num_visible_entries = element_settings.num_visible_entries
	local entry_size_y = element_settings.height + element_settings.spacing
	self._base_pos_y = self._base_pos_y or scenegraph_definition.lobby_entry_anchor.position[2]
	self._wanted_pos = self._wanted_pos or self._base_pos_y

	if input_service:get("right_stick_press") then
		local widget = self._widgets.frame
		local widget_content = widget.content
		widget_content.filter_active = true
		self._filter_active = true
		self._current_active_filter = false
		self._current_filter_index = 1
		self._filter_list_index = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true
		widget_content.filter_index = self._current_filter_index

		self._parent:play_sound("Play_hud_hover")

		return
	end

	if input_service:get("refresh") and self._num_lobbies > 0 then
		local widget = self._lobby_entry_widgets[self._selected_lobby_index]
		local widget_content = widget.content
		local lobby_data = widget_content.lobby_data
		local joinable = false

		if lobby_data then
			joinable = self._parent:is_lobby_joinable(lobby_data)

			if joinable then
				self._parent:play_sound("hud_morris_start_menu_play")
				self._parent:_join(lobby_data)
			end
		end

		return
	elseif input_service:get("special_1") then
		self._parent:play_sound("hud_morris_start_menu_set")
		self._parent:refresh()

		return
	elseif input_service:get("left_stick_press") then
		self._parent:play_sound("hud_morris_start_menu_set")
		self._parent:reset_filters()

		return
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_timer + dt
	end

	self._hold_down_timer = hold_down_timer
	self._hold_up_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_timer > 0.5 then
		if self._hold_down_timer > 0.5 then
			self._hold_down_timer = 0.4
		end

		self._selected_lobby_index = math.clamp(self._selected_lobby_index + 1, 1, self._num_lobbies)
		self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, math.min(num_visible_entries, self._num_lobbies))

		if self._visible_list_index == num_visible_entries then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos + entry_size_y, self._base_pos_y, self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y)
			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.lobby_entry_anchor.position, 2, self._ui_scenegraph.lobby_entry_anchor.position[2], self._wanted_pos, 0.3, math.easeOutCubic)

			if self._wanted_pos ~= old_wanted_pos then
				self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, num_visible_entries)
			end
		end
	elseif input_service:get("move_up") or self._hold_up_timer > 0.5 then
		if self._hold_up_timer > 0.5 then
			self._hold_up_timer = 0.4
		end

		self._selected_lobby_index = math.clamp(self._selected_lobby_index - 1, 1, self._num_lobbies)
		self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, math.min(num_visible_entries, self._num_lobbies))

		if self._visible_list_index <= 1 and num_visible_entries < self._num_lobbies then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos - entry_size_y, self._base_pos_y, self._num_lobbies * entry_size_y + entry_size_y)
			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.lobby_entry_anchor.position, 2, self._ui_scenegraph.lobby_entry_anchor.position[2], self._wanted_pos, 0.3, math.easeOutCubic)

			if self._wanted_pos ~= old_wanted_pos then
				self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, num_visible_entries)
			end
		end
	end

	if self._selected_lobby_index ~= old_selected_lobby_index then
		self:_select_lobby(old_selected_lobby_index, self._selected_lobby_index, self._mouse_selected_index)

		local widget = self._widgets.frame
		local widget_content = widget.content
		local progress = self._wanted_pos / (self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y)

		if self:_is_nan(progress) then
			progress = 0
		end

		self._ui_animations.scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
	end
end

LobbyBrowserConsoleUI._handle_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	return
end

LobbyBrowserConsoleUI._handle_browser_input_mouse = function (self, input_service, element_settings, dt, t)
	local old_selected_lobby_index = self._mouse_selected_index
	local num_visible_entries = element_settings.num_visible_entries
	local entry_size_y = element_settings.height + element_settings.spacing
	self._base_pos_y = self._base_pos_y or scenegraph_definition.lobby_entry_anchor.position[2]
	self._wanted_pos = self._wanted_pos or self._base_pos_y
	local left_pressed = input_service:get("left_press")
	local widget = self._widgets.filter_frame
	local widget_content = widget.content

	for i = 1, #self._filter_functions do
		local hotspot = widget_content["filter_hotspot_" .. i]

		if hotspot.on_hover_enter then
			self._parent:play_sound("Play_hud_hover")
		end

		if hotspot.is_hover and left_pressed then
			widget_content.filter_active = true
			self._filter_active = true
			self._current_active_filter = i
			self._current_filter_index = i
			self._filter_list_index = nil
			self._mouse_scroll_index = nil
			local widget_content = widget.content
			widget_content.filter_selection = true
			widget_content.filter_index = self._current_filter_index
			local widget = self._widgets.frame
			local widget_content = widget.content
			widget_content.filter_active = true

			return
		end
	end

	if input_service:get("left_press") then
		local lobby_entry_widgets = self._lobby_entry_widgets

		for idx, widget in ipairs(lobby_entry_widgets) do
			if widget.content.lobby_hotspot.is_hover then
				self:_select_lobby(old_selected_lobby_index, idx, self._selected_lobby_index)

				self._mouse_selected_index = idx

				break
			end
		end
	else
		local join_button_widget = self._widgets.join_button
		local join_button_widget_content = join_button_widget.content
		local join_button_hotspot = join_button_widget_content.button_hotspot

		if join_button_hotspot.on_pressed then
			local widget = self._lobby_entry_widgets[self._mouse_selected_index]

			if widget then
				local widget_content = widget.content
				local lobby_data = widget_content.lobby_data
				local joinable = false

				if lobby_data then
					joinable = self._parent:is_lobby_joinable(lobby_data)

					if joinable then
						self._parent:_join(lobby_data)
					end
				end
			end

			return
		else
			local refresh_button_widget = self._widgets.refresh_button
			local refresh_button_widget_content = refresh_button_widget.content
			local refresh_button_hotspot = refresh_button_widget_content.button_hotspot

			if refresh_button_hotspot.on_pressed then
				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:refresh()

				return
			end
		end
	end

	local scroll_value = input_service:get("scroll_axis")
	local scroll_y = scroll_value[2]

	if scroll_y < 0 then
		self._selected_lobby_index = math.clamp(self._selected_lobby_index + 1, 1, self._num_lobbies)
		self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, math.min(num_visible_entries, self._num_lobbies))

		if num_visible_entries < self._num_lobbies then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos + entry_size_y, self._base_pos_y, self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y)

			if self._wanted_pos ~= old_wanted_pos then
				self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, num_visible_entries)
			end

			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.lobby_entry_anchor.position, 2, self._ui_scenegraph.lobby_entry_anchor.position[2], self._wanted_pos, 0.3, math.easeOutCubic)
		end
	elseif scroll_y > 0 then
		self._selected_lobby_index = math.clamp(self._selected_lobby_index - 1, 1, self._num_lobbies)
		self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, math.min(num_visible_entries, self._num_lobbies))

		if num_visible_entries < self._num_lobbies then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos - entry_size_y, self._base_pos_y, self._num_lobbies * entry_size_y + entry_size_y)

			if self._wanted_pos ~= old_wanted_pos then
				self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, num_visible_entries)
			end

			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.lobby_entry_anchor.position, 2, self._ui_scenegraph.lobby_entry_anchor.position[2], self._wanted_pos, 0.3, math.easeOutCubic)
		end
	end

	if self._selected_lobby_index ~= old_selected_lobby_index then
		local widget = self._widgets.frame
		local widget_content = widget.content
		local progress = self._wanted_pos / (self._num_lobbies * entry_size_y - num_visible_entries * entry_size_y)

		if self:_is_nan(progress) then
			progress = 0
		end

		self._ui_animations.scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
	end
end

LobbyBrowserConsoleUI._is_nan = function (self, value)
	return type(value) == "number" and value ~= value
end

LobbyBrowserConsoleUI._handle_filter_input = function (self, input_service, element_settings, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if input_service:get("right_stick_press") or input_service:get("back_menu", true) then
		local widget = self._widgets.frame
		local widget_content = widget.content
		widget_content.filter_active = false
		self._filter_active = false
		self._current_active_filter = false
		self._current_filter_index = 1
		self._filter_list_index = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = false
		widget_content.filter_index = self._current_filter_index

		return
	end

	local current_filter_index = self._current_filter_index

	if input_service:get("confirm") then
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = false
		self._current_active_filter = self._current_filter_index

		self._parent:play_sound("Play_hud_hover")

		return
	elseif input_service:get("move_left") then
		current_filter_index = self:_update_filter_index(-1)
	elseif input_service:get("move_right") then
		current_filter_index = self:_update_filter_index(1)
	end

	if self._current_filter_index ~= current_filter_index then
		self._current_filter_index = current_filter_index

		self._parent:play_sound("Play_hud_hover")

		self._filter_list_index = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_index = current_filter_index
	end
end

LobbyBrowserConsoleUI._update_filter_index = function (self, index_change)
	local frame_widget = self._widgets.filter_frame
	local frame_widget_content = frame_widget.content
	local new_filter_index = math.clamp(self._current_filter_index + index_change, 1, #self._filter_functions)
	local end_point = index_change > 0 and #self._filter_functions or 1

	for i = new_filter_index, end_point, index_change do
		local filter_hotspot = frame_widget_content["filter_hotspot_" .. i]

		if not filter_hotspot.disable_button then
			return i
		end
	end

	return self._current_filter_index
end

LobbyBrowserConsoleUI._handle_game_type_filter_input = function (self, input_service, element_settings, dt, t)
	local old_selected_list_index = self._filter_list_index
	self._filter_list_index = self._filter_list_index or 1
	local hold_down_timer = 0
	local hold_up_timer = 0
	local num_entries = #self._game_type_filter_widgets
	local back_pressed = input_service:get("back_menu", true)

	if input_service:get("confirm") or back_pressed then
		local current_filter_list_index = self._filter_list_index
		local widget = self._game_type_filter_widgets[current_filter_list_index]
		local widget_content = widget.content
		widget_content.selected = false
		self._filter_list_index = nil
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0

		if not back_pressed then
			self._parent:play_sound("hud_morris_start_menu_set")
			self._parent:set_game_mode(widget_content.game_type)
			self._parent:refresh()
		end

		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_list_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_list_timer + dt
	end

	self._hold_down_list_timer = hold_down_timer
	self._hold_up_list_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_list_timer > 0.5 then
		if self._hold_down_list_timer > 0.5 then
			self._hold_down_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index + 1, 1, num_entries)
	elseif input_service:get("move_up") or self._hold_up_list_timer > 0.5 then
		if self._hold_up_list_timer > 0.5 then
			self._hold_up_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index - 1, 1, num_entries)
	end

	if self._filter_list_index ~= old_selected_list_index then
		local widget = self._game_type_filter_widgets[self._filter_list_index]
		local widget_content = widget.content
		widget_content.selected = true

		if old_selected_list_index then
			local widget = self._game_type_filter_widgets[old_selected_list_index]
			local widget_content = widget.content
			widget_content.selected = false
		end

		self._parent:play_sound("Play_hud_hover")
	end
end

LobbyBrowserConsoleUI._handle_game_type_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_game_type_entry_anchor.position[2]
	local num_entries = #self._game_type_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._game_type_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				any_selected = true

				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:set_game_mode(widget.content.game_type)
				self._parent:refresh()

				exiting = true

				break
			end
		end

		exiting = exiting or not any_selected
	end

	if exiting then
		self._filter_list_index = nil
		self._wanted_list_pos = self._list_base_pos_y
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0
		self._ui_scenegraph.filter_game_type_entry_anchor.position[2] = self._list_base_pos_y
		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end
end

LobbyBrowserConsoleUI._handle_level_filter_input = function (self, input_service, element_settings, dt, t)
	local hold_down_timer = 0
	local hold_up_timer = 0
	local old_selected_list_index = self._filter_list_index
	self._filter_list_index = self._filter_list_index or 1
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_level_entry_anchor.position[2]
	self._wanted_list_pos = self._wanted_list_pos or self._list_base_pos_y
	local num_entries = #self._level_filter_widgets
	local confirm_pressed = input_service:get("confirm")
	local back_pressed = input_service:get("back_menu", true)

	if confirm_pressed or back_pressed then
		local current_filter_list_index = self._filter_list_index
		local widget = self._level_filter_widgets[current_filter_list_index]
		local widget_content = widget.content

		if widget_content.unlocked or back_pressed then
			local widget = self._level_filter_widgets[self._filter_list_index]
			local widget_content = widget.content
			widget_content.selected = false
			self._filter_list_index = nil
			self._wanted_list_pos = self._list_base_pos_y
			self._visible_list_index = 1
			self._hold_up_list_timer = 0
			self._hold_down_list_timer = 0
			self._ui_scenegraph.filter_level_entry_anchor.position[2] = self._list_base_pos_y

			if not back_pressed then
				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:set_level(widget_content.level)
				self._parent:refresh()
			end

			self._current_active_filter = nil
			local widget = self._widgets.filter_frame
			local widget_content = widget.content
			widget_content.filter_selection = true

			return
		end
	end

	for i = 1, #self._level_filter_widgets do
		if UIUtils.is_button_hover_enter(self._level_filter_widgets[i]) then
			self._parent:play_sound("Play_hud_hover")

			break
		end
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_list_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_list_timer + dt
	end

	self._hold_down_list_timer = hold_down_timer
	self._hold_up_list_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_list_timer > 0.5 then
		if self._hold_down_list_timer > 0.5 then
			self._hold_down_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index + 1, 1, num_entries)
		self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, math.min(num_visible_entries, num_entries))

		if self._visible_list_index == num_visible_entries then
			local old_wanted_list_pos = self._wanted_list_pos

			if self._filter_list_index <= num_entries then
				self._wanted_list_pos = math.clamp(self._wanted_list_pos + entry_size_y, self._list_base_pos_y, num_entries * entry_size_y - num_visible_entries * entry_size_y)
				self._ui_animations.move_list = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.filter_level_entry_anchor.position, 2, self._ui_scenegraph.filter_level_entry_anchor.position[2], self._wanted_list_pos, 0.3, math.easeOutCubic)
			end

			if self._wanted_list_pos ~= old_wanted_list_pos then
				self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, num_visible_entries)
			end
		end
	elseif input_service:get("move_up") or self._hold_up_list_timer > 0.5 then
		if self._hold_up_list_timer > 0.5 then
			self._hold_up_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index - 1, 1, num_entries)
		self._visible_list_index = math.clamp(self._visible_list_index - 1, 1, math.min(num_visible_entries, num_entries))

		if self._visible_list_index <= 1 and num_visible_entries < num_entries then
			local old_wanted_list_pos = self._wanted_list_pos
			self._wanted_list_pos = math.clamp(self._wanted_list_pos - entry_size_y, self._list_base_pos_y, self._num_lobbies * entry_size_y + entry_size_y)
			self._ui_animations.move_list = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.filter_level_entry_anchor.position, 2, self._ui_scenegraph.filter_level_entry_anchor.position[2], self._wanted_list_pos, 0.3, math.easeOutCubic)

			if self._wanted_list_pos ~= old_wanted_list_pos then
				self._visible_list_index = math.clamp(self._visible_list_index + 1, 1, num_visible_entries)
			end
		end
	end

	if self._filter_list_index ~= old_selected_list_index then
		local widget = self._level_filter_widgets[self._filter_list_index]
		local widget_content = widget.content
		widget_content.selected = true

		if old_selected_list_index then
			local widget = self._level_filter_widgets[old_selected_list_index]
			local widget_content = widget.content
			widget_content.selected = false
		end

		local widget = self._level_filter_scroller
		local widget_content = widget.content
		local progress = (self._wanted_list_pos - self._list_base_pos_y) / (num_entries * entry_size_y - num_visible_entries * entry_size_y + entry_size_y)

		if self:_is_nan(progress) then
			progress = 0
		end

		self._ui_animations.list_scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)

		self._parent:play_sound("Play_hud_hover")
	end
end

LobbyBrowserConsoleUI._handle_level_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_level_entry_anchor.position[2]
	local num_entries = #self._level_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local widget = self._level_filter_scroller
	local widget_content = widget.content
	local widget_style = widget.style
	local scroller_hotspot = widget_content.scroller_hotspot
	local bar_hotspot = widget_content.bar_hotspot
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._level_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				any_selected = true

				if widget.content.unlocked then
					self._parent:play_sound("hud_morris_start_menu_set")
					self._parent:set_level(widget.content.level)
					self._parent:refresh()

					exiting = true

					break
				end
			end
		end

		any_selected = bar_hotspot.is_hover or any_selected
		exiting = exiting or not any_selected
	end

	if exiting then
		self._filter_list_index = nil
		self._wanted_list_pos = self._list_base_pos_y
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0
		self._ui_scenegraph.filter_level_entry_anchor.position[2] = self._list_base_pos_y
		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true
		local widget = self._level_filter_scroller
		local widget_content = widget.content
		widget_content.scrollbar_progress = 0

		return
	end

	if scroller_hotspot.on_pressed then
		self._old_mouse_y = input_service:get("cursor")[2]
	elseif scroller_hotspot.is_held then
		local total_size_y = (num_entries - num_visible_entries - 3) * element_settings.filter_height
		local mouse_y = input_service:get("cursor")[2]
		local diff_y = mouse_y - self._old_mouse_y
		local progress_diff = diff_y / total_size_y
		local progress = math.clamp(widget_content.scrollbar_progress - progress_diff, 0, 1)
		widget_content.scrollbar_progress = progress
		local new_pos = self._list_base_pos_y + (num_entries - num_visible_entries + 1) * progress * entry_size_y
		self._ui_scenegraph.filter_level_entry_anchor.position[2] = new_pos
		self._mouse_scroll_index = math.floor((num_entries - num_visible_entries + 1) * progress)
		self._old_mouse_y = mouse_y
	elseif num_visible_entries < num_entries then
		local scroll_axis = input_service:get("scroll_axis")
		local scroll_y = scroll_axis[2]

		if math.abs(scroll_y) > 0 then
			self._mouse_scroll_index = math.clamp(self._mouse_scroll_index - math.sign(scroll_y), 1, num_entries - num_visible_entries + 2)
			local offset_num = self._mouse_scroll_index - 1
			local new_pos = self._list_base_pos_y + offset_num * entry_size_y
			self._ui_animations.move_list = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.filter_level_entry_anchor.position, 2, self._ui_scenegraph.filter_level_entry_anchor.position[2], new_pos, 0.3, math.easeOutCubic)
			local widget = self._level_filter_scroller
			local widget_content = widget.content
			local progress = offset_num / (num_entries - num_visible_entries + 1)

			if self:_is_nan(progress) then
				progress = 0
			end

			self._ui_animations.list_scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
		end
	end
end

LobbyBrowserConsoleUI._handle_difficulty_filter_input = function (self, input_service, element_settings, dt, t)
	local old_selected_list_index = self._filter_list_index
	self._filter_list_index = self._filter_list_index or 1
	local hold_down_timer = 0
	local hold_up_timer = 0
	local num_entries = #self._difficulty_filter_widgets
	local back_pressed = input_service:get("back_menu", true)

	if input_service:get("confirm") or back_pressed then
		local current_filter_list_index = self._filter_list_index
		local widget = self._difficulty_filter_widgets[current_filter_list_index]
		local widget_content = widget.content

		if widget_content.unlocked or back_pressed then
			widget_content.selected = false
			self._filter_list_index = nil
			self._visible_list_index = 1
			self._hold_up_list_timer = 0
			self._hold_down_list_timer = 0

			if not back_pressed then
				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:set_difficulty(widget_content.difficulty)
				self._parent:refresh()
			end

			self._current_active_filter = nil
			local widget = self._widgets.filter_frame
			local widget_content = widget.content
			widget_content.filter_selection = true

			return
		end
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_list_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_list_timer + dt
	end

	self._hold_down_list_timer = hold_down_timer
	self._hold_up_list_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_list_timer > 0.5 then
		if self._hold_down_list_timer > 0.5 then
			self._hold_down_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index + 1, 1, num_entries)
	elseif input_service:get("move_up") or self._hold_up_list_timer > 0.5 then
		if self._hold_up_list_timer > 0.5 then
			self._hold_up_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index - 1, 1, num_entries)
	end

	if self._filter_list_index ~= old_selected_list_index then
		local widget = self._difficulty_filter_widgets[self._filter_list_index]
		local widget_content = widget.content
		widget_content.selected = true

		if old_selected_list_index then
			local widget = self._difficulty_filter_widgets[old_selected_list_index]
			local widget_content = widget.content
			widget_content.selected = false
		end

		self._parent:play_sound("Play_hud_hover")
	end
end

LobbyBrowserConsoleUI._handle_difficulty_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_difficulty_entry_anchor.position[2]
	local num_entries = #self._difficulty_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._difficulty_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				any_selected = true

				if widget.content.unlocked then
					self._parent:play_sound("hud_morris_start_menu_set")
					self._parent:set_difficulty(widget.content.difficulty)
					self._parent:refresh()

					exiting = true

					break
				end
			end
		end

		exiting = exiting or not any_selected
	end

	if exiting then
		self._filter_list_index = nil
		self._wanted_list_pos = self._list_base_pos_y
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0
		self._ui_scenegraph.filter_difficulty_entry_anchor.position[2] = self._list_base_pos_y
		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end
end

LobbyBrowserConsoleUI._handle_lobby_filter_input = function (self, input_service, element_settings, dt, t)
	local old_selected_list_index = self._filter_list_index
	self._filter_list_index = self._filter_list_index or 1
	local hold_down_timer = 0
	local hold_up_timer = 0
	local num_entries = #self._lobby_filter_widgets
	local back_pressed = input_service:get("back_menu", true)

	if input_service:get("confirm") or back_pressed then
		local current_filter_list_index = self._filter_list_index
		local widget = self._lobby_filter_widgets[current_filter_list_index]
		local widget_content = widget.content
		widget_content.selected = false
		self._filter_list_index = nil
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0

		if not back_pressed then
			self._parent:play_sound("hud_morris_start_menu_set")
			self._parent:set_lobby_filter(widget_content.lobby_filter)
			self._parent:refresh()
		end

		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_list_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_list_timer + dt
	end

	self._hold_down_list_timer = hold_down_timer
	self._hold_up_list_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_list_timer > 0.5 then
		if self._hold_down_list_timer > 0.5 then
			self._hold_down_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index + 1, 1, num_entries)
	elseif input_service:get("move_up") or self._hold_up_list_timer > 0.5 then
		if self._hold_up_list_timer > 0.5 then
			self._hold_up_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index - 1, 1, num_entries)
	end

	if self._filter_list_index ~= old_selected_list_index then
		local widget = self._lobby_filter_widgets[self._filter_list_index]
		local widget_content = widget.content
		widget_content.selected = true

		if old_selected_list_index then
			local widget = self._lobby_filter_widgets[old_selected_list_index]
			local widget_content = widget.content
			widget_content.selected = false
		end

		self._parent:play_sound("Play_hud_hover")
	end
end

LobbyBrowserConsoleUI._handle_lobby_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_lobby_entry_anchor.position[2]
	local num_entries = #self._lobby_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._lobby_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:set_lobby_filter(widget.content.lobby_filter)
				self._parent:refresh()

				exiting = true
				any_selected = true

				break
			end
		end

		exiting = exiting or not any_selected
	end

	if exiting then
		self._filter_list_index = nil
		self._wanted_list_pos = self._list_base_pos_y
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0
		self._ui_scenegraph.filter_lobby_entry_anchor.position[2] = self._list_base_pos_y
		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end
end

LobbyBrowserConsoleUI._handle_distance_filter_input = function (self, input_service, element_settings, dt, t)
	local old_selected_list_index = self._filter_list_index
	self._filter_list_index = self._filter_list_index or 1
	local hold_down_timer = 0
	local hold_up_timer = 0
	local num_entries = #self._distance_filter_widgets
	local back_pressed = input_service:get("back_menu", true)

	if input_service:get("confirm") or back_pressed then
		local current_filter_list_index = self._filter_list_index
		local widget = self._distance_filter_widgets[current_filter_list_index]
		local widget_content = widget.content
		widget_content.selected = false
		self._filter_list_index = nil
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0

		if not back_pressed then
			self._parent:play_sound("hud_morris_start_menu_set")
			self._parent:set_distance_filter(widget_content.distance)
			self._parent:refresh()
		end

		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_list_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_list_timer + dt
	end

	self._hold_down_list_timer = hold_down_timer
	self._hold_up_list_timer = hold_up_timer

	if input_service:get("move_down") or self._hold_down_list_timer > 0.5 then
		if self._hold_down_list_timer > 0.5 then
			self._hold_down_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index + 1, 1, num_entries)
	elseif input_service:get("move_up") or self._hold_up_list_timer > 0.5 then
		if self._hold_up_list_timer > 0.5 then
			self._hold_up_list_timer = 0.4
		end

		self._filter_list_index = math.clamp(self._filter_list_index - 1, 1, num_entries)
	end

	if self._filter_list_index ~= old_selected_list_index then
		local widget = self._distance_filter_widgets[self._filter_list_index]
		local widget_content = widget.content
		widget_content.selected = true

		if old_selected_list_index then
			local widget = self._distance_filter_widgets[old_selected_list_index]
			local widget_content = widget.content
			widget_content.selected = false
		end

		self._parent:play_sound("Play_hud_hover")
	end
end

LobbyBrowserConsoleUI._handle_distance_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_distance_entry_anchor.position[2]
	local num_entries = #self._distance_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._distance_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				self._parent:play_sound("hud_morris_start_menu_set")
				self._parent:set_distance_filter(widget.content.distance)
				self._parent:refresh()

				exiting = true
				any_selected = true

				break
			end
		end

		exiting = exiting or not any_selected
	end

	if exiting then
		self._filter_list_index = nil
		self._wanted_list_pos = self._list_base_pos_y
		self._visible_list_index = 1
		self._hold_up_list_timer = 0
		self._hold_down_list_timer = 0
		self._ui_scenegraph.filter_distance_entry_anchor.position[2] = self._list_base_pos_y
		self._current_active_filter = nil
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = true

		return
	end
end

LobbyBrowserConsoleUI._select_lobby = function (self, old_selected_lobby_index, new_selected_lobby_index, device_selected_lobby_index)
	self._details_filled = false
	local widgets = self._lobby_entry_widgets

	if old_selected_lobby_index then
		local widget = widgets[old_selected_lobby_index]

		if widget then
			local content = widget.content
			content.selected = false
		end
	end

	if device_selected_lobby_index then
		local widget = widgets[device_selected_lobby_index]

		if widget then
			local content = widget.content
			content.selected = false
		end
	end

	if new_selected_lobby_index then
		local widget = widgets[new_selected_lobby_index]

		if widget then
			local content = widget.content
			content.selected = true
		end
	end

	local selected_lobby_entry_widget = self._lobby_entry_widgets[new_selected_lobby_index]
	local selected_lobby_entry_content = selected_lobby_entry_widget and selected_lobby_entry_widget.content
	local selected_lobby_data = selected_lobby_entry_content and selected_lobby_entry_content.lobby_data
	local id = selected_lobby_data and selected_lobby_data.id
	self._selected_lobby_id = id
	local current_lobbies = self._parent:get_lobbies()
	local valid_current_lobbies, valid_current_lobbies_by_id = self:_remove_invalid_lobbies(current_lobbies)
	local lobby_data = valid_current_lobbies_by_id[self._selected_lobby_id]

	if lobby_data then
		self:_update_lobby_details(valid_current_lobbies_by_id)
	end
end

LobbyBrowserConsoleUI._update_lobby_data = function (self, dt, t)
	if not self._parent:dirty() then
		return
	end

	local current_lobbies = self._parent:get_lobbies()
	local valid_current_lobbies, valid_current_lobbies_by_id = self:_remove_invalid_lobbies(current_lobbies)

	self:_update_lobby_details(valid_current_lobbies_by_id)
	self:_update_lobby_list(valid_current_lobbies_by_id, dt, t)
end

LobbyBrowserConsoleUI._update_lobby_details = function (self, valid_lobbies_by_id)
	local selected_lobby_id = self._selected_lobby_id

	if not selected_lobby_id then
		self._details_filled = false
	end

	local lobby_data = valid_lobbies_by_id[selected_lobby_id]

	if lobby_data then
		local mechanism = lobby_data.mechanism
		local mission_id = lobby_data.selected_mission_id

		if mechanism == "weave" and WeaveSettings.templates[mission_id] then
			self:_fill_weave_details(lobby_data)
		elseif mechanism == "deus" and DeusJourneySettings[mission_id] then
			self:_fill_deus_details(lobby_data)
		else
			self:_fill_details(lobby_data)
		end
	else
		self._details_filled = false
	end
end

LobbyBrowserConsoleUI._update_lobby_list = function (self, valid_current_lobbies_by_id, dt, t)
	for index, lobby_entry_widget in ipairs(self._lobby_entry_widgets) do
		local content = lobby_entry_widget.content
		local lobby_entry_lobby_data = content.lobby_data
		local selected = content.selected
		local offset_y = lobby_entry_widget.offset[2]

		self:_update_lobby_entry(index, offset_y, selected, lobby_entry_lobby_data, valid_current_lobbies_by_id, dt, t)
	end
end

LobbyBrowserConsoleUI._update_lobby_entry = function (self, index, offset_y, selected, lobby_entry_lobby_data, valid_current_lobbies_by_id, dt, t)
	local entry_lobby_id = lobby_entry_lobby_data and lobby_entry_lobby_data.id
	local lobby_data = valid_current_lobbies_by_id[entry_lobby_id]

	if lobby_data then
		local create_lobby_entry_func = definitions.create_lobby_entry_func
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		local completed_difficulty_index = self._parent:completed_level_difficulty_index(lobby_data)
		local lobby_entry = create_lobby_entry_func(offset_y, lobby_data, index, joinable, completed_difficulty_index)
		local lobby_entry_widget = UIWidget.init(lobby_entry)
		local lobby_entry_content = lobby_entry_widget.content
		lobby_entry_content.selected = selected
		self._lobby_entry_widgets[index] = lobby_entry_widget
	else
		local create_unavailable_lobby_entry_func = definitions.create_unavailable_lobby_entry_func
		local lobby_entry = create_unavailable_lobby_entry_func(offset_y)
		local lobby_entry_widget = UIWidget.init(lobby_entry)
		local lobby_entry_content = lobby_entry_widget.content
		lobby_entry_content.selected = selected
		self._lobby_entry_widgets[index] = lobby_entry_widget
	end
end

LobbyBrowserConsoleUI._fill_details = function (self, lobby_data)
	local details_widgets = self._details_widgets.adventure
	local level_image = "level_image_any"
	local level_name = nil
	local selected_mission_id = lobby_data and (lobby_data.selected_mission_id or lobby_data.mission_id)
	local matchmaking_type_id = lobby_data and lobby_data.matchmaking_type
	local matchmaking_type = matchmaking_type_id and (IS_PS4 and matchmaking_type_id or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)])
	local mechanism = lobby_data and lobby_data.mechanism

	if selected_mission_id then
		if selected_mission_id == "default_start_level" then
			selected_mission_id = LevelSettingsDefaultStartLevel
		end

		local level_key = selected_mission_id

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[selected_mission_id]

			if weave_template then
				level_key = weave_template.objectives[1].level_id
			end
		end

		local level_settings = LevelSettings[level_key]
		level_name = level_settings.display_name
		level_image = level_settings.level_image or level_image
	end

	local level_image_widget = details_widgets.level_image
	level_image_widget.content.texture_id = level_image
	local level_name_widget = details_widgets.level_name
	level_name_widget.content.text = level_name and Localize(level_name) or " "
	local occupied_profiles = {}

	if lobby_data then
		local num_profiles = #SPProfiles

		for i = 1, num_profiles do
			if not ProfileSynchronizer.is_free_in_lobby(i, lobby_data) then
				occupied_profiles[i] = true
			end
		end
	end

	local content = details_widgets.hero_tabs.content

	for i = 1, #ProfilePriority do
		local profile_index = ProfilePriority[i]
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]

		if occupied_profiles[profile_index] then
			hotspot_content.disable_button = true
		else
			hotspot_content.disable_button = false
		end
	end

	local level_image_frame_widget = details_widgets.level_image_frame
	local level_image_frame_widget_content = level_image_frame_widget.content
	local level_frame = "map_frame_00"

	if lobby_data then
		local completed_difficulty_index = self._parent:completed_level_difficulty_index(lobby_data)

		if completed_difficulty_index > 0 then
			local difficulty_key = DefaultDifficulties[completed_difficulty_index]
			local settings = DifficultySettings[difficulty_key]
			level_frame = settings.completed_frame_texture
		end
	end

	level_image_frame_widget_content.texture_id = level_frame
	local join_button_widget = self._widgets.join_button
	local join_button_widget_content = join_button_widget.content
	local button_hotspot = join_button_widget_content.button_hotspot
	local locked_reason_widget = details_widgets.locked_reason
	local locked_reason_widget_content = locked_reason_widget.content

	if lobby_data then
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		locked_reason_widget_content.text = locked_reason or "tutorial_no_text"
		button_hotspot.disable_button = not joinable
	else
		locked_reason_widget_content.text = "tutorial_no_text"
		button_hotspot.disable_button = true
	end

	local details_information_widget = details_widgets.details_information
	local details_information_widget_content = details_information_widget.content

	if lobby_data then
		local matchmaking_type_lookup = {
			event = "lb_game_type_event",
			deed = "lb_game_type_deed",
			tutorial = "lb_game_type_prologue",
			weave = "lb_game_type_weave",
			custom = "lb_game_type_custom",
			standard = "lb_game_type_quick_play",
			weave_quick_play = "lb_game_type_weave_quick_play",
			["n/a"] = "lb_game_type_none",
			deus = "area_selection_morris_name"
		}
		local mission_id = lobby_data.mission_id
		local level_key = mission_id

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[mission_id]

			if weave_template then
				level_key = weave_template.objectives[1].level_id
			end

			if lobby_data.quick_game == "true" then
				matchmaking_type = "weave_quick_play"
			else
				matchmaking_type = "weave"
			end
		elseif mechanism == "deus" then
			matchmaking_type = "deus"
		end

		local level_setting = LevelSettings[level_key]
		details_information_widget_content.game_type_id = matchmaking_type and (matchmaking_type_lookup[matchmaking_type] or "lb_unknown") or "lb_game_type_none"
		details_information_widget_content.status_id = level_setting.hub_level and "lb_in_inn" or "lb_playing"
	else
		details_information_widget_content.game_type_id = "lb_unknown"
		details_information_widget_content.status_id = "lb_unknown"
	end

	details_widgets.twitch_logo.content.visible = to_boolean(lobby_data and lobby_data.twitch_enabled)
	self._details_type = "adventure"
	self._details_filled = true
end

LobbyBrowserConsoleUI._fill_weave_details = function (self, lobby_data)
	local details_widgets = self._details_widgets.weave
	local weave_name = lobby_data.selected_mission_id
	local weave_template = WeaveSettings.templates[weave_name]
	local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)
	local wind_name = weave_template.wind
	local wind_settings = WindSettings[wind_name]
	local wind_display_name = Localize(wind_settings.display_name)
	local wind_color = Colors.get_color_table_with_alpha(wind_name, 255)
	local wind_thumbnail_icon = wind_settings.thumbnail_icon
	local wind_thumbnail_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(wind_thumbnail_icon)
	local wind_thumbnail_icon_size = wind_thumbnail_icon_settings.size
	local wind_icon_widget = details_widgets.wind_icon
	local wind_icon_content = wind_icon_widget.content
	local wind_icon_style = wind_icon_widget.style.texture_id
	wind_icon_content.texture_id = wind_thumbnail_icon
	wind_icon_style.texture_size = {
		wind_thumbnail_icon_size[1] * 0.6,
		wind_thumbnail_icon_size[2] * 0.6
	}
	wind_icon_style.horizontal_alignment = "center"
	wind_icon_style.vertical_alignment = "center"
	local wind_icon_glow = details_widgets.wind_icon_glow
	wind_icon_glow.style.texture_id.color = wind_color
	local wind_icon_bg = details_widgets.wind_icon_bg
	wind_icon_bg.style.texture_id.color = wind_color
	local wind_name_widget = details_widgets.wind_name
	wind_name_widget.content.text = wind_display_name
	wind_name_widget.style.text.text_color = wind_color
	local mutator_name = wind_settings.mutator
	local mutator_data = MutatorTemplates[mutator_name]
	local wind_mutator_icon_widget = details_widgets.wind_mutator_icon
	local wind_mutator_title_text_widget = details_widgets.wind_mutator_title_text
	local wind_mutator_description_text_widget = details_widgets.wind_mutator_description_text
	wind_mutator_icon_widget.content.texture_id = mutator_data.icon
	wind_mutator_title_text_widget.content.text = mutator_data.display_name
	wind_mutator_description_text_widget.content.text = mutator_data.description
	local objectives = weave_template.objectives
	local objective_spacing = 10
	local largest_objective_width = 0

	for i = 1, #objectives do
		local objective = objectives[i]
		local objective_display_name = objective.display_name
		local objective_icon = objective.icon

		self:_assign_objective(i, objective_display_name, objective_icon, objective_spacing)
	end

	local level_image = "level_image_any"
	local level_name = weave_template.display_name
	local mission_id = lobby_data and (lobby_data.selected_mission_id or lobby_data.mission_id)
	local mechanism = lobby_data.mechanism

	if mission_id then
		local level_key = mission_id

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[mission_id]

			if weave_template then
				level_key = weave_template.objectives[1].level_id
			end
		end

		if level_key == "default_start_level" then
			level_key = LevelSettingsDefaultStartLevel
		end

		local level_settings = LevelSettings[level_key]
		level_image = level_settings.level_image or level_image
	end

	local level_image_widget = details_widgets.level_image
	level_image_widget.content.texture_id = level_image
	local level_name_widget = details_widgets.level_name

	if lobby_data.quick_game == "true" then
		level_name_widget.content.text = Localize(level_name)
	else
		level_name_widget.content.text = weave_index .. ". " .. Localize(level_name)
	end

	local occupied_profiles = {}

	if lobby_data then
		local num_profiles = #SPProfiles

		for i = 1, num_profiles do
			if not ProfileSynchronizer.is_free_in_lobby(i, lobby_data) then
				occupied_profiles[i] = true
			end
		end
	end

	local content = details_widgets.hero_tabs.content

	for i = 1, #ProfilePriority do
		local profile_index = ProfilePriority[i]
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]

		if occupied_profiles[profile_index] then
			hotspot_content.disable_button = true
		else
			hotspot_content.disable_button = false
		end
	end

	local level_image_frame_widget = details_widgets.level_image_frame
	local level_image_frame_widget_content = level_image_frame_widget.content
	level_image_frame_widget_content.texture_id = "map_frame_weaves"
	level_image_frame_widget.style.texture_id.color = wind_color
	local join_button_widget = self._widgets.join_button
	local join_button_widget_content = join_button_widget.content
	local button_hotspot = join_button_widget_content.button_hotspot
	local locked_reason_widget = details_widgets.locked_reason
	local locked_reason_widget_content = locked_reason_widget.content

	if lobby_data then
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		locked_reason_widget_content.text = locked_reason or "tutorial_no_text"
		button_hotspot.disable_button = not joinable
	else
		locked_reason_widget_content.text = "tutorial_no_text"
		button_hotspot.disable_button = true
	end

	local details_information_widget = details_widgets.details_information
	local details_information_widget_content = details_information_widget.content

	if lobby_data then
		local matchmaking_type_lookup = {
			event = "lb_game_type_event",
			deed = "lb_game_type_deed",
			tutorial = "lb_game_type_prologue",
			weave = "lb_game_type_weave",
			custom = "lb_game_type_custom",
			standard = "lb_game_type_quick_play",
			weave_quick_play = "lb_game_type_weave_quick_play",
			["n/a"] = "lb_game_type_none",
			deus = "area_selection_morris_name"
		}
		local mechanism = lobby_data.mechanism
		local matchmaking_type_id = lobby_data.matchmaking_type
		local matchmaking_type = IS_PS4 and matchmaking_type_id or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)]
		local mission_id = lobby_data.mission_id
		local level_key = mission_id

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[mission_id]

			if weave_template then
				level_key = weave_template.objectives[1].level_id
			end

			if lobby_data.quick_game == "true" then
				matchmaking_type = "weave_quick_play"
			end
		elseif mechanism == "deus" then
			matchmaking_type = "deus"
		end

		local level_setting = LevelSettings[level_key]
		details_information_widget_content.game_type_id = matchmaking_type and (matchmaking_type_lookup[matchmaking_type] or "lb_unknown") or "lb_game_type_none"
		details_information_widget_content.status_id = level_setting.hub_level and "lb_in_inn" or "lb_playing"
	else
		details_information_widget_content.game_type_id = "lb_unknown"
		details_information_widget_content.status_id = "lb_unknown"
	end

	self._details_type = "weave"
	self._details_filled = true
end

LobbyBrowserConsoleUI._gather_unlocked_journeys = function (self)
	local unlocked_journeys = {}
	local statistics_db = Managers.player:statistics_db()
	local stats_id = Managers.player:local_player():stats_id()

	for _, journey_name in ipairs(LevelUnlockUtils.unlocked_journeys(statistics_db, stats_id)) do
		unlocked_journeys[journey_name] = true
	end

	return unlocked_journeys
end

LobbyBrowserConsoleUI._fill_deus_details = function (self, lobby_data)
	local unlocked_journeys, completed_difficulty_index = self:_gather_unlocked_journeys()
	local details_widgets = self._details_widgets.deus
	local level_image = "level_image_any"
	local level_name = nil
	local selected_mission_id = lobby_data and (lobby_data.selected_mission_id or lobby_data.mission_id)
	local matchmaking_type_id = lobby_data and lobby_data.matchmaking_type
	local matchmaking_type = matchmaking_type_id and (IS_PS4 and matchmaking_type_id or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)])
	local mechanism = lobby_data and lobby_data.mechanism
	local journey_name = selected_mission_id
	local journey_data = DeusJourneySettings[journey_name]
	local widget = details_widgets.expedition_icon
	local content = widget.content
	content.level_icon = journey_data.level_image
	content.locked = not unlocked_journeys[journey_name]
	local backend_deus = Managers.backend:get_interface("deus")
	local journey_cycle = backend_deus:get_journey_cycle()
	local theme = journey_cycle.journey_data[journey_name].dominant_god
	local theme_settings = DeusThemeSettings[theme]
	content.theme_icon = theme_settings.icon
	local level_name_widget = details_widgets.level_name
	level_name_widget.content.text = Localize(journey_data.display_name)
	local occupied_profiles = {}

	if lobby_data then
		local num_profiles = #SPProfiles

		for i = 1, num_profiles do
			if not ProfileSynchronizer.is_free_in_lobby(i, lobby_data) then
				occupied_profiles[i] = true
			end
		end
	end

	local content = details_widgets.hero_tabs.content

	for i = 1, #ProfilePriority do
		local profile_index = ProfilePriority[i]
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]

		if occupied_profiles[profile_index] then
			hotspot_content.disable_button = true
		else
			hotspot_content.disable_button = false
		end
	end

	local join_button_widget = self._widgets.join_button
	local join_button_widget_content = join_button_widget.content
	local button_hotspot = join_button_widget_content.button_hotspot
	local locked_reason_widget = details_widgets.locked_reason
	local locked_reason_widget_content = locked_reason_widget.content

	if lobby_data then
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		locked_reason_widget_content.text = locked_reason or "tutorial_no_text"
		button_hotspot.disable_button = not joinable
	else
		locked_reason_widget_content.text = "tutorial_no_text"
		button_hotspot.disable_button = true
	end

	local details_information_widget = details_widgets.details_information
	local details_information_widget_content = details_information_widget.content

	if lobby_data then
		local matchmaking_type_lookup = {
			event = "lb_game_type_event",
			deed = "lb_game_type_deed",
			tutorial = "lb_game_type_prologue",
			weave = "lb_game_type_weave",
			custom = "lb_game_type_custom",
			standard = "lb_game_type_quick_play",
			weave_quick_play = "lb_game_type_weave_quick_play",
			["n/a"] = "lb_game_type_none",
			deus = "area_selection_morris_name"
		}
		local mission_id = lobby_data.mission_id
		local level_key = mission_id

		if mechanism == "weave" then
			local weave_template = WeaveSettings.templates[mission_id]

			if weave_template then
				level_key = weave_template.objectives[1].level_id
			end

			if lobby_data.quick_game == "true" then
				matchmaking_type = "weave_quick_play"
			else
				matchmaking_type = "weave"
			end
		elseif mechanism == "deus" then
			matchmaking_type = "deus"
		end

		local level_setting = LevelSettings[level_key]
		details_information_widget_content.game_type_id = matchmaking_type and (matchmaking_type_lookup[matchmaking_type] or "lb_unknown") or "lb_game_type_none"
		details_information_widget_content.status_id = level_setting.hub_level and "lb_in_inn" or "lb_playing"
	else
		details_information_widget_content.game_type_id = "lb_unknown"
		details_information_widget_content.status_id = "lb_unknown"
	end

	details_widgets.twitch_logo.content.visible = to_boolean(lobby_data and lobby_data.twitch_enabled)
	self._details_type = "deus"
	self._details_filled = true
end

LobbyBrowserConsoleUI._assign_objective = function (self, index, text, icon, spacing)
	local widget_name = "objective_" .. index
	local details_widgets = self._details_widgets.weave
	local widget = details_widgets[widget_name]
	local content = widget.content
	local style = widget.style
	content.icon = icon or "trial_gem"
	content.text = text or "-"
end

LobbyBrowserConsoleUI.set_game_type_filter = function (self, game_type_name)
	local widget = self._widgets.filter_frame
	local content = widget.content
	content.game_type_name = game_type_name
end

LobbyBrowserConsoleUI.set_level_filter = function (self, level_display_name)
	local widget = self._widgets.filter_frame
	local content = widget.content
	content.mission_name = level_display_name
end

LobbyBrowserConsoleUI.set_difficulty_filter = function (self, difficulty_display_name)
	local widget = self._widgets.filter_frame
	local content = widget.content
	content.difficulty_name = difficulty_display_name
end

LobbyBrowserConsoleUI.set_show_lobbies_filter = function (self, show_lobbies_text)
	local widget = self._widgets.filter_frame
	local content = widget.content
	content.show_lobbies_name = show_lobbies_text
end

LobbyBrowserConsoleUI.set_distance_filter = function (self, distance_text)
	local widget = self._widgets.filter_frame
	local content = widget.content
	content.distance_name = distance_text
end

LobbyBrowserConsoleUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local input_service = self._parent:input_service()
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._filter_active then
		self:_render_filter(ui_renderer, ui_scenegraph, input_service, dt, t)
	end

	self:_render_lobby_browser(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.end_pass(ui_renderer)
end

LobbyBrowserConsoleUI._render_filter = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	if self._current_active_filter then
		local filter_functions = self._filter_functions[self._current_active_filter]

		self[filter_functions.render_function](self, ui_renderer, ui_scenegraph, input_service, dt, t)
	end
end

LobbyBrowserConsoleUI._render_game_type_filter_list = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	for _, widget in ipairs(self._game_type_filter_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

LobbyBrowserConsoleUI._render_level_filter_list = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	for _, widget in ipairs(self._level_filter_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.draw_widget(ui_renderer, self._level_filter_scroller)
end

LobbyBrowserConsoleUI._render_difficulty_filter_list = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	for _, widget in ipairs(self._difficulty_filter_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

LobbyBrowserConsoleUI._render_lobby_filter_list = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	for _, widget in ipairs(self._lobby_filter_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

LobbyBrowserConsoleUI._render_distance_filter_list = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	for _, widget in ipairs(self._distance_filter_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

LobbyBrowserConsoleUI._render_lobby_browser = function (self, ui_renderer, ui_scenegraph, input_service, dt, t)
	local element_settings = definitions.element_settings

	for idx, widget in ipairs(self._lobby_entry_widgets) do
		if self:_is_inside(widget, element_settings, idx) then
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	if self._details_filled then
		local details_widgets = self._details_widgets[self._details_type]

		for _, widget in pairs(details_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	for _, widget in ipairs(self._empty_lobby_entry_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

LobbyBrowserConsoleUI._is_inside = function (self, widget, element_settings, idx)
	local entry_height = element_settings.height
	local window_height = element_settings.window_height
	local base_pos_y = self._ui_scenegraph.lobby_entry_anchor.position[2]
	local start_pos_y = base_pos_y + widget.offset[2]
	local end_pos_y = start_pos_y + entry_height
	local start_limit = 0
	local end_limit = -window_height

	return start_pos_y < start_limit and end_limit < end_pos_y
end

LobbyBrowserConsoleUI.destroy = function (self)
	return
end
