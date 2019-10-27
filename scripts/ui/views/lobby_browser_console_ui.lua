require("foundation/scripts/util/local_require")
require("scripts/managers/telemetry/iso_country_names")
require("scripts/settings/level_settings")

local definitions = local_require("scripts/ui/views/lobby_browser_console_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local base_widget_definition = definitions.base_widget_definition
local details_widget_definition = definitions.details_widget_definition
local weave_details_widget_definition = definitions.weave_details_widget_definition
LobbyBrowserConsoleUI = class(LobbyBrowserConsoleUI)

LobbyBrowserConsoleUI.init = function (self, parent, ingame_ui_context, game_mode_data, show_lobby_data_table, distance_data_table)
	self._ingame_ui_context = ingame_ui_context
	self._game_mode_data = game_mode_data
	self._show_lobby_data_table = show_lobby_data_table
	self._distance_data_table = distance_data_table
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._world_manager = ingame_ui_context.world_manager
	self._world = self._world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(self._world)

	self:_create_ui_elements()
end

LobbyBrowserConsoleUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets = {}
	self._lobby_entry_widgets = {}
	self._empty_lobby_entry_widgets = {}
	self._details_widgets = {}
	self._weave_details_widgets = {}
	self._ui_animations = {}
	self._selected_lobby_index = 1
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

	local details_widget_definition = details_widget_definition

	for name, widget in pairs(details_widget_definition) do
		self._details_widgets[name] = UIWidget.init(widget)
	end

	local weave_details_widget_definition = weave_details_widget_definition

	for name, widget in pairs(weave_details_widget_definition) do
		self._weave_details_widgets[name] = UIWidget.init(widget)
	end

	self:populate_lobby_list(self._lobbies or {}, false)
	self:_create_filters()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

LobbyBrowserConsoleUI._create_filters = function (self)
	self._level_filter_widgets = {}
	self._difficulty_filter_widgets = {}
	self._lobby_filter_widgets = {}
	self._distance_filter_widgets = {}
	self._filter_functions = {
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
	local game_mode_data = self._game_mode_data[1]
	local game_mode_key = game_mode_data.game_mode_key
	local unlockable_levels = table.clone(UnlockableLevelsByGameMode[game_mode_key])
	local levels = game_mode_data.levels
	local difficulties = game_mode_data.difficulties
	local element_settings = definitions.element_settings
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
		local widget = create_level_filter_entry_func(level, false)
		locked_level_widgets[#locked_level_widgets + 1] = UIWidget.init(widget)
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
end

LobbyBrowserConsoleUI.update = function (self, dt, t, loading)
	self:_update_info_text(dt, t, loading)
	self:_handle_input(dt, t, loading)
	self:_handle_mouse_input(dt, t, loading)
	self:_handle_input_description(dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt, t)
end

LobbyBrowserConsoleUI._update_info_text = function (self, dt, t, loading)
	local widget = self._widgets.frame
	local widget_content = widget.content

	if loading then
		local text = Localize("start_game_window_lobby_searching")
		local dots = 1 + math.floor(self._dot_timer + 0.5) % 4

		for i = 1, dots, 1 do
			if i > 1 then
				text = text .. "."
			end
		end

		self._dot_timer = self._dot_timer + dt * 5
		widget_content.info_text_id = text
	else
		self._dot_timer = 0
		widget_content.info_text_id = Localize("start_game_window_lobbies_found") .. ": " .. self._num_lobbies
	end
end

LobbyBrowserConsoleUI._update_animations = function (self, dt, t)
	local animations = self._ui_animations

	for animation_name, animation in pairs(animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animations[animation_name] = nil
		end
	end
end

LobbyBrowserConsoleUI._remove_invalid_lobbies = function (self, lobbies)
	local valid_lobbies = {}
	local num_lobbies = #lobbies

	for i = 1, num_lobbies, 1 do
		local lobby = lobbies[i]

		if lobby then
			valid_lobbies[#valid_lobbies + 1] = lobby
		end
	end

	return valid_lobbies
end

LobbyBrowserConsoleUI.populate_lobby_list = function (self, lobbies, ignore_scroll_reset)
	local lobby_frame_widget = self._widgets.frame
	local lobby_frame_widget_content = lobby_frame_widget.content
	lobby_frame_widget_content.timer = 0
	local valid_lobbies = self:_remove_invalid_lobbies(lobbies)
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

		for i = 1, amount, 1 do
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

		return
	end

	if Managers.matchmaking:is_game_matchmaking() then
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
				self._parent:_join(lobby_data)
			end
		end

		return
	elseif input_service:get("special_1") then
		self._parent:refresh()

		return
	elseif input_service:get("left_stick_press") then
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

	if input_service:get("left_press") then
		local widget = self._widgets.filter_frame
		local widget_content = widget.content

		for i = 1, #self._filter_functions, 1 do
			local hotspot = widget_content["filter_hotspot_" .. i]

			if hotspot.is_hover then
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
	end

	if Managers.matchmaking:is_game_matchmaking() then
		return
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
		self._ui_animations.scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
	end
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
		self._current_active_filter = self._current_filter_index
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_selection = false

		return
	elseif input_service:get("move_left") then
		current_filter_index = math.clamp(current_filter_index - 1, 1, #self._filter_functions)
		self._filter_list_index = nil
	elseif input_service:get("move_right") then
		current_filter_index = math.clamp(current_filter_index + 1, 1, #self._filter_functions)
		self._filter_list_index = nil
	end

	if self._current_filter_index ~= current_filter_index then
		self._current_filter_index = current_filter_index
		local widget = self._widgets.filter_frame
		local widget_content = widget.content
		widget_content.filter_index = current_filter_index
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
	local back_pressed = input_service:get("back_menu", true)

	if input_service:get("confirm") or back_pressed then
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
		self._ui_animations.list_scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
	end
end

LobbyBrowserConsoleUI._handle_level_filter_input_mouse = function (self, input_service, element_settings, dt, t)
	local length = element_settings.window_height + element_settings.filter_height
	local num_visible_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing))
	local entry_size_y = element_settings.filter_height + element_settings.spacing
	self._list_base_pos_y = self._list_base_pos_y or scenegraph_definition.filter_level_entry_anchor.position[2]
	local num_entries = #self._level_filter_widgets
	self._mouse_scroll_index = self._mouse_scroll_index or 1
	local any_selected = false
	local exiting = input_service:get("back_menu", true)

	if input_service:get("left_press") then
		for idx, widget in ipairs(self._level_filter_widgets) do
			local button_hotspot = widget.content.button_hotspot

			if button_hotspot.is_hover then
				any_selected = true

				if widget.content.unlocked then
					self._parent:set_level(widget.content.level)
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
		self._ui_animations.list_scrollbar = UIAnimation.init(UIAnimation.function_by_time, widget_content, "scrollbar_progress", widget_content.scrollbar_progress, progress, 0.3, math.easeOutCubic)
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

	local lobby_data = self._lobbies[new_selected_lobby_index]

	if lobby_data then
		local game_mode_id = lobby_data.game_mode
		local game_mode = (PLATFORM == "ps4" and game_mode_id) or NetworkLookup.game_modes[tonumber(game_mode_id)]

		if game_mode == "weave" then
			self:_fill_weave_details(lobby_data)
		else
			self:_fill_details(lobby_data)
		end
	end
end

LobbyBrowserConsoleUI._fill_details = function (self, lobby_data)
	local details_widgets = self._details_widgets
	local level_image = "level_image_any"
	local level_name = nil
	local level_key = lobby_data and (lobby_data.selected_level_key or lobby_data.level_key)

	if level_key then
		if level_key == "default_start_level" then
			level_key = LevelSettings[level_key]
		end

		local level_settings = LevelSettings[level_key]
		level_name = level_settings.display_name
		level_image = level_settings.level_image or level_image
	end

	local level_image_widget = details_widgets.level_image
	level_image_widget.content.texture_id = level_image
	local level_name_widget = details_widgets.level_name
	level_name_widget.content.text = (level_name and Localize(level_name)) or " "
	local occupied_profiles = {}

	if lobby_data then
		local num_profiles = #SPProfiles

		for i = 1, num_profiles, 1 do
			if not SlotAllocator.is_free_in_lobby(i, lobby_data) then
				occupied_profiles[i] = true
			end
		end
	end

	local content = details_widgets.hero_tabs.content

	for i = 1, #ProfilePriority, 1 do
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
	local locked_reason_widget = details_widgets.locked_reason
	local locked_reason_widget_content = locked_reason_widget.content

	if lobby_data then
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		locked_reason_widget_content.text = locked_reason
	else
		locked_reason_widget_content.text = "tutorial_no_text"
	end

	local details_information_widget = details_widgets.details_information
	local details_information_widget_content = details_information_widget.content

	if lobby_data then
		local game_mode_lookup = {
			event = "lb_game_type_event",
			deed = "lb_game_type_deed",
			weave_find_group = "lb_game_type_weave_find_group",
			weave = "lb_game_type_weave",
			custom = "lb_game_type_custom",
			adventure = "lb_game_type_quick_play",
			tutorial = "lb_game_type_prologue",
			twitch = "lb_game_type_twitch",
			["n/a"] = "lb_game_type_none"
		}
		local game_mode_id = lobby_data.game_mode
		local game_mode = (PLATFORM == "ps4" and game_mode_id) or NetworkLookup.game_modes[tonumber(game_mode_id)]
		local level_setting = LevelSettings[lobby_data.level_key]
		details_information_widget_content.game_type_id = (game_mode and (game_mode_lookup[game_mode] or "lb_unknown")) or "lb_game_type_none"
		details_information_widget_content.status_id = (level_setting.hub_level and "lb_in_inn") or "lb_playing"
	else
		details_information_widget_content.game_type_id = "lb_unknown"
		details_information_widget_content.status_id = "lb_unknown"
	end

	self._show_weave_description = false
	self._details_filled = true
end

LobbyBrowserConsoleUI._fill_weave_details = function (self, lobby_data)
	local details_widgets = self._weave_details_widgets
	local weave_name = lobby_data.weave_name
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
	local wind_icon_style = wind_icon_widget.style.texture_id
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

	for i = 1, #objectives, 1 do
		local objective = objectives[i]
		local objective_display_name = objective.display_name
		local objective_icon = objective.icon

		self:_assign_objective(i, objective_display_name, objective_icon, objective_spacing)
	end

	local level_image = "level_image_any"
	local level_name = weave_template.display_name
	local level_key = lobby_data and (lobby_data.selected_level_key or lobby_data.level_key)

	if level_key then
		if level_key == "default_start_level" then
			level_key = LevelSettings[level_key]
		end

		local level_settings = LevelSettings[level_key]
		level_image = level_settings.level_image or level_image
	end

	local level_image_widget = details_widgets.level_image
	level_image_widget.content.texture_id = level_image
	local level_name_widget = details_widgets.level_name
	level_name_widget.content.text = weave_index .. ". " .. Localize(level_name)
	local occupied_profiles = {}

	if lobby_data then
		local num_profiles = #SPProfiles

		for i = 1, num_profiles, 1 do
			if not SlotAllocator.is_free_in_lobby(i, lobby_data) then
				occupied_profiles[i] = true
			end
		end
	end

	local content = details_widgets.hero_tabs.content

	for i = 1, #ProfilePriority, 1 do
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
	local locked_reason_widget = details_widgets.locked_reason
	local locked_reason_widget_content = locked_reason_widget.content

	if lobby_data then
		local joinable, locked_reason = self._parent:is_lobby_joinable(lobby_data)
		locked_reason_widget_content.text = locked_reason
	else
		locked_reason_widget_content.text = "tutorial_no_text"
	end

	local details_information_widget = details_widgets.details_information
	local details_information_widget_content = details_information_widget.content

	if lobby_data then
		local game_mode_lookup = {
			event = "lb_game_type_event",
			deed = "lb_game_type_deed",
			weave_find_group = "lb_game_type_weave_find_group",
			weave = "lb_game_type_weave",
			custom = "lb_game_type_custom",
			adventure = "lb_game_type_quick_play",
			tutorial = "lb_game_type_prologue",
			twitch = "lb_game_type_twitch",
			["n/a"] = "lb_game_type_none"
		}
		local game_mode_id = lobby_data.game_mode
		local game_mode = (PLATFORM == "ps4" and game_mode_id) or NetworkLookup.game_modes[tonumber(game_mode_id)]
		local level_setting = LevelSettings[lobby_data.level_key]
		details_information_widget_content.game_type_id = (game_mode and (game_mode_lookup[game_mode] or "lb_unknown")) or "lb_game_type_none"
		details_information_widget_content.status_id = (level_setting.hub_level and "lb_in_inn") or "lb_playing"
	else
		details_information_widget_content.game_type_id = "lb_unknown"
		details_information_widget_content.status_id = "lb_unknown"
	end

	self._details_filled = true
	self._show_weave_description = true
end

LobbyBrowserConsoleUI._assign_objective = function (self, index, text, icon, spacing)
	local widget_name = "objective_" .. index
	local widget = self._weave_details_widgets[widget_name]
	local content = widget.content
	local style = widget.style
	content.icon = icon or "trial_gem"
	content.text = text or "-"
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
	local input_service = self._parent:input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

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
		if self._show_weave_description then
			for _, widget in pairs(self._weave_details_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		else
			for _, widget in pairs(self._details_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
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

return
