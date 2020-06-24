require("scripts/helpers/weave_utils")

local definitions = local_require("scripts/ui/views/start_game_view/states/definitions/start_game_state_weave_leaderboard_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local console_cursor_definition = definitions.console_cursor_definition
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false
local LIST_EDGE_SPACING = 20
local LIST_SPACING = 4
local LIST_MAX_WIDTH = 800
local LIST_PRESENTATION_AMOUNT = 12
local LIST_FADE_IN_DURATION = 0.3
local MIN_TIME_BETWEEN_LEADERBOARD_REQUESTS = 1.5
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local localized_reward_tier_strings = {
	Localize("menu_weave_leaderboard_tier_3_title"),
	Localize("menu_weave_leaderboard_tier_2_title"),
	Localize("menu_weave_leaderboard_tier_1_title")
}
local localized_reward_tier_tooltip_strings = {
	Localize("menu_weave_leaderboard_tier_tooltip_bronze"),
	Localize("menu_weave_leaderboard_tier_tooltip_silver"),
	Localize("menu_weave_leaderboard_tier_tooltip_gold")
}
local localized_time_strings = {
	Localize("menu_weave_leaderboard_button_refresh_2"),
	Localize("menu_weave_leaderboard_button_refresh_1")
}
StartGameStateWeaveLeaderboard = class(StartGameStateWeaveLeaderboard)
StartGameStateWeaveLeaderboard.NAME = "StartGameStateWeaveLeaderboard"

StartGameStateWeaveLeaderboard.on_enter = function (self, params)
	print("[StartGameState] Enter Substate StartGameStateWeaveLeaderboard")

	self.parent = params.parent
	local use_gamepad_layout = false
	self._gamepad_style_active = use_gamepad_layout
	self._wwise_world = params.wwise_world
	self._hero_name = params.hero_name
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._animations = {}
	self._ui_animations = {}
	self._is_open = true
	self._close_on_exit = true

	self:_create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	if self._gamepad_style_active then
		self:disable_player_world()
	end

	local leaderboard_tab_data = {
		{
			value = "global",
			text = Localize("menu_weave_leaderboard_filter_option_global")
		},
		{
			value = "friends",
			text = Localize("menu_weave_leaderboard_filter_option_friends")
		}
	}
	local filter_data = {
		{
			value = "personal",
			text = Localize("menu_weave_leaderboard_filter_option_you")
		},
		{
			value = "top",
			text = Localize("menu_weave_leaderboard_filter_option_top")
		}
	}
	local team_size_data = {
		{
			value = 1,
			text = Localize("menu_weave_leaderboard_filter_option_players_1")
		},
		{
			value = 2,
			text = Localize("menu_weave_leaderboard_filter_option_players_2")
		},
		{
			value = 3,
			text = Localize("menu_weave_leaderboard_filter_option_players_3")
		},
		{
			value = 4,
			text = Localize("menu_weave_leaderboard_filter_option_players_4")
		}
	}
	local season_stat_data = {}
	local season_data = {}
	local season_text = ""
	local season_name = Localize("menu_weave_leaderboard_filter_sesason")
	self._current_season_id = ScorpionSeasonalSettings.current_season_id

	for i = 1, self._current_season_id, 1 do
		season_stat_data[i] = {
			ScorpionSeasonalSettings.get_leaderboard_stat_for_season(i, 1),
			ScorpionSeasonalSettings.get_leaderboard_stat_for_season(i, 2),
			ScorpionSeasonalSettings.get_leaderboard_stat_for_season(i, 3),
			ScorpionSeasonalSettings.get_leaderboard_stat_for_season(i, 4)
		}

		if i == self._current_season_id then
			season_text = Localize("menu_weave_leaderboard_current_season")
		else
			season_text = string.format(season_name, i)
		end

		season_data[i] = {
			text = season_text,
			value = i
		}
	end

	self._season_data = season_data
	self._season_stat_data = season_stat_data
	self._team_size_data = team_size_data
	self._filter_data = filter_data
	self._leaderboard_tab_data = leaderboard_tab_data

	self:_setup_tab_widget(leaderboard_tab_data)
	self:_select_tab_by_index(1)
	self:_initialize_stepper(1, Localize("menu_weave_leaderboard_filter_title_position"), filter_data)
	self:_initialize_stepper(2, Localize("menu_weave_leaderboard_filter_title_team_size"), team_size_data, #team_size_data)

	if PLATFORM ~= "win32" then
		self:_initialize_stepper(3, Localize("menu_weave_leaderboard_filter_season"), season_data, #season_data)
	end

	self:_restart_poll_queue(Application.time_since_launch())
	self:_update_leaderboard_presentation()
	Managers.input:enable_gamepad_cursor()
	self:play_sound("menu_leaderboard_open")
end

StartGameStateWeaveLeaderboard._setup_poll_queue = function (self, leaderboard_type_data, filter_data, season_stat_data)
	self._poll_queues = {}

	for _, type_data in ipairs(leaderboard_type_data) do
		local leaderboard_type = type_data.value

		for _, filter in ipairs(filter_data) do
			local filter_value = filter.value

			for i = #season_stat_data, 1, -1 do
				local season_id = i
				local stat_names_data = season_stat_data[i]

				for j = #stat_names_data, 1, -1 do
					local stat_name = stat_names_data[j]

					self:_add_poll_queue(filter_value, leaderboard_type, stat_name, season_id)
				end
			end
		end
	end
end

StartGameStateWeaveLeaderboard._restart_poll_queue = function (self, t)
	self._cashed_list_season_data = {}

	self:_setup_poll_queue(self._leaderboard_tab_data, self._filter_data, self._season_stat_data)
	self:_handle_next_poll_request(t)
end

StartGameStateWeaveLeaderboard._add_poll_queue = function (self, filter_value, leaderboard_type, stat_name, season_id)
	if PLATFORM == "win32" and season_id ~= self._current_season_id then
		return
	end

	local leaderboard_tab_data = self._leaderboard_tab_data
	local queue_index = nil

	for i = 1, #leaderboard_tab_data, 1 do
		if leaderboard_tab_data[i].value == leaderboard_type then
			queue_index = i

			break
		end
	end

	if queue_index then
		local poll_queues = self._poll_queues
		local poll_queue = poll_queues[queue_index] or {}
		poll_queues[queue_index] = poll_queue
		poll_queue[#poll_queue + 1] = {
			filter_value = filter_value,
			leaderboard_type = leaderboard_type,
			stat_name = stat_name,
			season_id = season_id
		}
	end

	self._polling_done = false
end

StartGameStateWeaveLeaderboard._handle_next_poll_request = function (self, t)
	if self._polling_done then
		return true
	end

	local poll_queues = self._poll_queues
	local priority_index = self._selected_option_tab_index or 1
	local next_poll_request = nil

	if priority_index and #poll_queues[priority_index] > 0 then
		local poll_queue = poll_queues[priority_index]
		local next_poll_queue_index = nil

		for i = 1, #poll_queue, 1 do
			local poll_queue = poll_queue[i]
			local leaderboard_type = poll_queue.leaderboard_type
			local filter_value = poll_queue.filter_value
			local stat_name = poll_queue.stat_name

			if self._stat_name == stat_name and self._filter_value == filter_value and self._leaderboard_type == leaderboard_type then
				next_poll_queue_index = i

				break
			else
				next_poll_queue_index = next_poll_queue_index or i
			end
		end

		next_poll_request = table.remove(poll_queue, next_poll_queue_index)
	else
		for i = 1, #poll_queues, 1 do
			local poll_queue = poll_queues[i]

			if #poll_queue > 0 then
				next_poll_request = table.remove(poll_queue, 1)

				break
			end
		end
	end

	if not next_poll_request then
		self._polling_done = true

		return
	end

	local filter_value = next_poll_request.filter_value
	local leaderboard_type = next_poll_request.leaderboard_type
	local stat_name = next_poll_request.stat_name
	local season_id = next_poll_request.season_id
	local weave_interface = Managers.backend:get_interface("weaves")

	if filter_value == "top" then
		local start_position = 0

		weave_interface:request_leaderboard(stat_name, start_position, leaderboard_type)
	elseif filter_value == "personal" then
		local max_result_count = 100

		weave_interface:request_leaderboard_around_player(stat_name, leaderboard_type, max_result_count)
	end

	self._polling_callback = callback(self, "_cb_cashe_list_data", filter_value, leaderboard_type, stat_name, season_id)
	local time = Application.time_since_launch()
	self._min_poll_time = time + MIN_TIME_BETWEEN_LEADERBOARD_REQUESTS
end

StartGameStateWeaveLeaderboard._update_leaderboard_presentation = function (self)
	local stat_index, filter_value, season_index, leaderboard_type = nil
	local stepper_settings = self._stepper_settings

	if stepper_settings then
		for i = 1, #stepper_settings, 1 do
			local stepper_setting = stepper_settings[i]
			local content = stepper_setting.content
			local read_index = stepper_setting.read_index
			local stepper_name = stepper_setting.stepper_name
			local read_content = content[read_index]
			local read_value = read_content.value

			if stepper_name == "setting_stepper_1" then
				filter_value = read_value
			end

			if stepper_name == "setting_stepper_2" then
				stat_index = read_value
			end

			if stepper_name == "setting_stepper_3" then
				season_index = read_value
			end
		end
	end

	local selected_option_tab_index = self._selected_option_tab_index
	local selected_option = self._leaderboard_tab_data[selected_option_tab_index]
	leaderboard_type = selected_option.value
	self._filter_value = filter_value
	self._current_season_id = season_index or self._current_season_id
	self._stat_name = self._season_stat_data[self._current_season_id][stat_index]
	self._leaderboard_type = leaderboard_type
	local cashed_list_data = self:_get_cashed_list_data(filter_value, leaderboard_type, self._stat_name, self._current_season_id)
	local waiting_for_list = cashed_list_data == nil
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.loading_icon.content.visible = waiting_for_list
	widgets_by_name.refresh_button.content.button_hotspot.disable_button = waiting_for_list

	if not waiting_for_list then
		local cashed_list_entries = cashed_list_data[1]
		local cashed_list_refresh_time = cashed_list_data[2]
		local show_no_placement = false

		if filter_value == "personal" then
			show_no_placement = not self:_list_including_local_player(cashed_list_entries)
		end

		if show_no_placement then
			self:_populate_list(nil, show_no_placement)
		else
			self:_populate_list(cashed_list_entries, show_no_placement)
		end

		self:_set_refresh_time(cashed_list_refresh_time)
	else
		self:_set_refresh_time(nil)
	end

	self._waiting_for_list = waiting_for_list
end

StartGameStateWeaveLeaderboard._list_including_local_player = function (self, list_entries)
	if list_entries then
		for i = 1, #list_entries, 1 do
			local entry = list_entries[i]

			if entry.local_player then
				return true
			end
		end
	end

	return false
end

StartGameStateWeaveLeaderboard._get_cashed_list_data = function (self, filter_value, leaderboard_type, stat_name, current_season_id)
	local cashed_list_data = self._cashed_list_season_data[current_season_id]

	if not cashed_list_data or not cashed_list_data[filter_value] or not cashed_list_data[filter_value][leaderboard_type] then
		return nil
	end

	return cashed_list_data[filter_value][leaderboard_type][stat_name]
end

StartGameStateWeaveLeaderboard._cb_cashe_list_data = function (self, filter_value, leaderboard_type, stat_name, current_season_id, list_entries, request_failed)
	if request_failed then
		self:_add_poll_queue(filter_value, leaderboard_type, stat_name)

		return
	end

	local cashed_season_list_data = self._cashed_list_season_data

	if not cashed_season_list_data[current_season_id] then
		cashed_season_list_data[current_season_id] = {}
	end

	local cashed_list_data = cashed_season_list_data[current_season_id]

	if not cashed_list_data[filter_value] then
		cashed_list_data[filter_value] = {}
	end

	if not cashed_list_data[filter_value][leaderboard_type] then
		cashed_list_data[filter_value][leaderboard_type] = {}
	end

	if not cashed_list_data[filter_value][leaderboard_type][stat_name] then
		cashed_list_data[filter_value][leaderboard_type][stat_name] = {}
	end

	cashed_list_data[filter_value][leaderboard_type][stat_name] = {
		list_entries,
		Application.time_since_launch()
	}

	if leaderboard_type == "global" and filter_value == "personal" then
		local player_entry = nil

		for i = 1, #list_entries, 1 do
			local entry = list_entries[i]

			if entry.local_player then
				player_entry = table.clone(entry)

				break
			end
		end
	end

	if self._waiting_for_list then
		local correct_stat_name = self._stat_name == stat_name
		local correct_leaderboard_type = self._leaderboard_type == leaderboard_type
		local correct_filter_value = self._filter_value == filter_value

		if correct_stat_name and correct_leaderboard_type and correct_filter_value then
			self:_update_leaderboard_presentation()
		end
	end
end

StartGameStateWeaveLeaderboard._poll_list = function (self, dt, t)
	local weave_interface = Managers.backend:get_interface("weaves")

	if self._polling_callback then
		if weave_interface:is_requesting_leaderboard() then
			return
		elseif t < self._min_poll_time then
			return
		end
	else
		return
	end

	local request_failed = weave_interface:has_leaderboard_request_failed()
	local entries = weave_interface:get_leaderboard_entries()
	local list_entries = self:_create_list_entries(entries)

	if self._polling_callback then
		self._polling_callback(list_entries, request_failed)

		self._polling_callback = nil
	end

	self:_handle_next_poll_request(t)
end

StartGameStateWeaveLeaderboard._set_refresh_time = function (self, t)
	self._refreshed_at_time = t

	self:_update_refresh_time(t)
end

StartGameStateWeaveLeaderboard._update_refresh_time = function (self, t)
	local refreshed_at_time = self._refreshed_at_time
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.refresh_text
	local content = widget.content
	content.visible = refreshed_at_time ~= nil

	if refreshed_at_time then
		local time_diff = t - refreshed_at_time
		time_diff = math.max(time_diff, 0)
		local seconds = math.max(time_diff, 0)
		local minutes = math.floor(seconds / 60)
		local hours = math.floor(minutes / 60)
		local days = math.floor(hours / 24)
		local text = nil

		if minutes > 0 then
			text = string.format(localized_time_strings[1], minutes)
		else
			text = localized_time_strings[2]
		end

		content.text = text
	end
end

StartGameStateWeaveLeaderboard._initialize_stepper = function (self, stepper_index, title_text, content, start_index)
	self._stepper_settings = self._stepper_settings or {}
	local stepper_settings = self._stepper_settings
	local stepper_name = "setting_stepper_" .. stepper_index
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name[stepper_name]
	start_index = start_index or 1
	stepper_settings[stepper_index] = {
		stepper_name = stepper_name,
		title_text = title_text,
		content = content,
		read_index = start_index,
		widget = widget
	}
	widget.content.title_text = title_text

	self:_set_stepper_read_index(stepper_index, start_index)
end

StartGameStateWeaveLeaderboard._set_stepper_read_index = function (self, stepper_index, read_index)
	local stepper_settings = self._stepper_settings
	local settings = stepper_settings[stepper_index]
	local content = settings.content
	settings.read_index = read_index
	local read_data = content[read_index]
	local widget = settings.widget
	widget.content.setting_text = read_data.text
end

StartGameStateWeaveLeaderboard._on_stepper_pressed = function (self, widget)
	local content = widget.content
	local button_hotspot_left = content.button_hotspot_left
	local button_hotspot_right = content.button_hotspot_right

	if button_hotspot_left.on_pressed or button_hotspot_left.on_double_click then
		return -1
	elseif button_hotspot_right.on_pressed or button_hotspot_right.on_double_click then
		return 1
	end
end

StartGameStateWeaveLeaderboard._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._console_cursor_widget = UIWidget.init(console_cursor_definition)
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
	widgets_by_name.loading_icon.content.visible = false

	self:_setup_list_widget()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local gui_layer = UILayer.default + 30
	local input_service = self:input_service()
	local use_fullscreen_layout = self._gamepad_style_active
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 6, gui_layer, generic_input_actions.default, use_fullscreen_layout)

	self._menu_input_description:set_input_description(nil)

	local widget = self._widgets_by_name.no_placement_text
	local widget_content = widget.content
	widget_content.visible = false
end

StartGameStateWeaveLeaderboard._setup_tab_widget = function (self, options)
	local num_tabs = #options
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local option_tabs_segments = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_vertical", {
		5,
		35
	}, "option_tabs_segments", num_tabs - 1))
	local option_tabs_segments_top = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_top", {
		17,
		9
	}, "option_tabs_segments_top", num_tabs - 1))
	local option_tabs_segments_bottom = UIWidget.init(UIWidgets.create_simple_centered_texture_amount("menu_frame_09_divider_bottom", {
		17,
		9
	}, "option_tabs_segments_bottom", num_tabs - 1))
	widgets_by_name.option_tabs_segments = option_tabs_segments
	widgets_by_name.option_tabs_segments_top = option_tabs_segments_top
	widgets_by_name.option_tabs_segments_bottom = option_tabs_segments_bottom
	widgets[#widgets + 1] = option_tabs_segments
	widgets[#widgets + 1] = option_tabs_segments_top
	widgets[#widgets + 1] = option_tabs_segments_bottom
	local scenegraph_id = "option_tabs"
	local size = scenegraph_definition.option_tabs.size
	local widget_definition = UIWidgets.create_default_text_tabs(scenegraph_id, size, num_tabs)
	local widget = UIWidget.init(widget_definition)
	widgets_by_name[scenegraph_id] = widget
	widgets[#widgets + 1] = widget
	local widget_content = widget.content

	for index, option in ipairs(options) do
		local name_suffix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_suffix
		local text_name = "text" .. name_suffix
		local hotspot_content = widget_content[hotspot_name]
		local text = option.text
		local value = option.value
		hotspot_content[text_name] = text
		hotspot_content.index = index
		hotspot_content.value = value
	end
end

StartGameStateWeaveLeaderboard.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

StartGameStateWeaveLeaderboard.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

StartGameStateWeaveLeaderboard.close_on_exit = function (self)
	return self._close_on_exit
end

StartGameStateWeaveLeaderboard.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

StartGameStateWeaveLeaderboard._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

StartGameStateWeaveLeaderboard.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

StartGameStateWeaveLeaderboard.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

StartGameStateWeaveLeaderboard.hotkey_allowed = function (self)
	return true
end

StartGameStateWeaveLeaderboard.on_exit = function (self, params)
	print("[StartGameState] Exit Substate StartGameStateWeaveLeaderboard")

	self.ui_animator = nil
	self._is_open = false

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	if self._gamepad_style_active then
		self:enable_player_world()
	end

	Managers.input:disable_gamepad_cursor()
	self:play_sound("menu_leaderboard_close")

	self._polling_callback = nil
end

StartGameStateWeaveLeaderboard._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

StartGameStateWeaveLeaderboard.input_service = function (self)
	return self.parent:input_service()
end

StartGameStateWeaveLeaderboard.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	local input_manager = self._input_manager
	local input_service = self.parent:input_service()

	self:_poll_list(dt, t)
	self:_update_transition_timer(dt)
	self:_update_scroll_position(dt)
	self:_update_visible_list_entries()
	self._scrollbar_logic:update(dt, t)
	self:_update_refresh_time(t)
	self:draw(input_service, dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_state()

		return wanted_state or self._new_state
	end
end

StartGameStateWeaveLeaderboard.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self:_handle_input(dt, t)
	end
end

StartGameStateWeaveLeaderboard._update_animations = function (self, dt)
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
	local exit_button = widgets_by_name.exit_button
	local refresh_button = widgets_by_name.refresh_button

	UIWidgetUtils.animate_default_button(exit_button, dt)

	local option_tabs = widgets_by_name.option_tabs

	UIWidgetUtils.animate_default_text_tabs(option_tabs, dt)
end

StartGameStateWeaveLeaderboard._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameStateWeaveLeaderboard._is_inventory_tab_pressed = function (self)
	local widget = self._widgets_by_name.option_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_release and not hotspot_content.is_selected then
			return i
		end
	end
end

StartGameStateWeaveLeaderboard._select_tab_by_index = function (self, index)
	local widget = self._widgets_by_name.option_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		hotspot_content.is_selected = index == i
	end

	self._selected_option_tab_index = index
end

StartGameStateWeaveLeaderboard._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local close_on_exit = self._close_on_exit
	local exit_button = widgets_by_name.exit_button
	local refresh_button = widgets_by_name.refresh_button

	if self:_is_button_hover_enter(exit_button) or self:_is_button_hover_enter(refresh_button) then
		self:play_sound("Play_hud_hover")
	end

	local tab_index_pressed = self:_is_inventory_tab_pressed()
	local filter_changed = false

	if tab_index_pressed and tab_index_pressed ~= self._selected_option_tab_index then
		self:_select_tab_by_index(tab_index_pressed)
		self:play_sound("Play_hud_hover")

		filter_changed = true
	end

	local stepper_settings = self._stepper_settings

	if stepper_settings then
		for i = 1, #stepper_settings, 1 do
			local settings = stepper_settings[i]
			local widget = settings.widget
			local direction = self:_on_stepper_pressed(widget)

			if direction then
				local read_index = settings.read_index
				local content = settings.content
				local new_read_index = math.index_wrapper(read_index + direction, #content)

				self:_set_stepper_read_index(i, new_read_index)
				self:play_sound("Play_hud_hover")

				filter_changed = true
			end
		end
	end

	if self:_is_button_pressed(refresh_button) or input_service:get("special_1") then
		self:play_sound("Play_hud_select")
		self:_restart_poll_queue(t)

		filter_changed = true
	elseif close_on_exit and (back_pressed or input_pressed or self:_is_button_pressed(exit_button)) then
		self:close_menu()

		return
	end

	if filter_changed then
		self:_update_leaderboard_presentation()
	end
end

StartGameStateWeaveLeaderboard.close_menu = function (self, ignore_sound_on_close_menu)
	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

StartGameStateWeaveLeaderboard.set_input_description = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(not input_description or self._generic_input_actions[input_description], "[StartGameStateWeaveLeaderboard:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:set_input_description(self._generic_input_actions[input_description])
end

StartGameStateWeaveLeaderboard.change_generic_actions = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(self._generic_input_actions[input_description], "[StartGameStateWeaveLeaderboard:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:change_generic_actions(self._generic_input_actions[input_description])
end

StartGameStateWeaveLeaderboard.draw = function (self, input_service, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")
	local input_description = nil

	if not self._gamepad_style_active then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local snap_pixel_positions = render_settings.snap_pixel_positions
		local alpha_multiplier = render_settings.alpha_multiplier

		for _, widget in ipairs(self._widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end

		render_settings.alpha_multiplier = alpha_multiplier
		local list_entries = self._list_entries

		if list_entries then
			local list_widget = self._list_widget
			local list_draw_index = self._list_draw_index
			local list_fade_in_time = self._list_fade_in_time
			local list_fade_in_progress = nil

			if list_fade_in_time then
				list_fade_in_time = math.max(list_fade_in_time - dt, 0)

				if list_fade_in_time == 0 then
					self._list_fade_in_time = nil
				else
					self._list_fade_in_time = list_fade_in_time
				end

				list_fade_in_progress = 1 - list_fade_in_time / LIST_FADE_IN_DURATION
			end

			if list_entries and list_widget and list_draw_index then
				local start_index = list_draw_index
				local end_index = math.min(list_draw_index + LIST_PRESENTATION_AMOUNT + 1, #list_entries)
				local draw_count = 0

				for i = start_index, end_index, 1 do
					draw_count = draw_count + 1
					local content = list_widget.content
					local style = list_widget.style
					local offset = list_widget.offset
					local size = content.size
					local height = size[2]
					local y_offset = LIST_EDGE_SPACING + (height + LIST_SPACING) * (i - 1)
					offset[2] = -y_offset
					local entry = list_entries[i]
					local name = entry.name
					local weave = entry.weave
					local score = entry.score
					local ranking = entry.ranking
					local career_icon = entry.career_icon
					local real_ranking = entry.real_ranking
					local local_player = entry.local_player
					local platform_user_id = entry.platform_user_id
					content.name = name
					content.score = score
					content.weave = weave
					content.ranking = ranking
					content.real_ranking = real_ranking
					content.career_icon = career_icon
					content.local_player = local_player

					if list_widget.snap_pixel_positions ~= nil then
						render_settings.snap_pixel_positions = list_widget.snap_pixel_positions
					end

					if list_fade_in_progress then
						local internal_progress = math.easeInCubic(math.min(list_fade_in_progress + (end_index - i) * 0.05, 1))
						render_settings.alpha_multiplier = internal_progress
						offset[1] = -30 * (1 - internal_progress)
					end

					UIRenderer.draw_widget(ui_renderer, list_widget)

					render_settings.snap_pixel_positions = snap_pixel_positions
					render_settings.alpha_multiplier = alpha_multiplier

					if PLATFORM ~= "win32" and content.button_hotspot.is_hover then
						input_description = generic_input_actions.open_profile

						if input_service:get("refresh_press") then
							self:_open_profile(platform_user_id)
						end
					end
				end
			end
		end

		UIRenderer.end_pass(ui_renderer)
	end

	if gamepad_active then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)

		if self._menu_input_description and not self.parent:active_view() then
			self._menu_input_description:set_input_description(input_description)
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

StartGameStateWeaveLeaderboard._open_profile = function (self, profile_id)
	if not profile_id then
		return
	end

	if PLATFORM == "xb1" then
		XboxLive.show_gamercard(Managers.account:user_id(), profile_id)
	elseif PLATFORM == "ps4" then
		Managers.account:show_player_profile_with_account_id(profile_id)
	end
end

StartGameStateWeaveLeaderboard._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameStateWeaveLeaderboard.play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameStateWeaveLeaderboard._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

StartGameStateWeaveLeaderboard.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self._ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

StartGameStateWeaveLeaderboard._setup_list_widget = function (self)
	local masked = true
	local scenegraph_id = "list_entry"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = UIWidgets.create_leaderboard_entry_definition(scenegraph_id, size, masked)
	local widget = UIWidget.init(widget_definition)
	self._list_widget = widget
end

StartGameStateWeaveLeaderboard._create_list_entries = function (self, entries)
	local list_entries = {}
	local num_entries = #entries

	for i = 1, num_entries, 1 do
		local entry = entries[i]
		local career_name = entry.career_name
		local career = CareerSettings[career_name]
		local portrait_thumbnail = (career and career.portrait_thumbnail) or "icons_placeholder"
		list_entries[i] = {
			alpha_fade_in_delay = 0.4,
			name = entry.name or "UNKNOWN",
			weave = tostring(entry.weave),
			score = UIUtils.comma_value(entry.score),
			ranking = UIUtils.comma_value(entry.ranking),
			career_name = career_name,
			career_icon = portrait_thumbnail,
			local_player = entry.local_player,
			real_ranking = entry.real_ranking,
			platform_user_id = entry.platform_user_id
		}
	end

	return list_entries
end

StartGameStateWeaveLeaderboard._populate_list = function (self, list_entries, show_no_placement)
	local num_entries = (list_entries and #list_entries) or 0
	self._list_entries = list_entries

	self:_calculate_list_height(num_entries)
	self:_initialize_scrollbar()

	self._list_draw_index = 1
	self._list_fade_in_time = LIST_FADE_IN_DURATION
	local widget = self._widgets_by_name.no_placement_text
	local widget_content = widget.content
	widget_content.visible = show_no_placement
end

StartGameStateWeaveLeaderboard._calculate_list_height = function (self, amount)
	local total_height = LIST_EDGE_SPACING
	local widget = self._list_widget
	local content = widget.content
	local size = content.size

	for index = 1, amount, 1 do
		local height = size[2]
		total_height = total_height + height

		if index ~= amount then
			total_height = total_height + LIST_SPACING
		end
	end

	self._total_list_height = total_height + LIST_EDGE_SPACING
end

StartGameStateWeaveLeaderboard._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_mask.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 220 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	self._widgets_by_name.list_scrollbar.content.visible = draw_length < content_length
end

StartGameStateWeaveLeaderboard._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list_scroll_root.local_position[2] = math.round(length)
		self._scrolled_length = length
	end
end

StartGameStateWeaveLeaderboard._update_visible_list_entries = function (self)
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
	local list_entries = self._list_entries
	local widget = self._list_widget
	local content = widget.content
	local size = content.size
	local height = size[2]
	local start_index = 1
	local num_entries = #list_entries

	for i = 1, num_entries, 1 do
		local y_offset = LIST_EDGE_SPACING + (height + LIST_SPACING) * (i - 1)
		local widget_position = y_offset + height
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < y_offset - scrolled_length then
			is_outside = true
		end

		if not is_outside then
			start_index = i

			break
		end
	end

	self._list_draw_index = start_index
end

StartGameStateWeaveLeaderboard._get_scrollbar_percentage_by_index = function (self, index)
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
		local list_entries = self._list_entries

		if list_entries then
			local widget = self._list_widget
			local content = widget.content
			local size = content.size
			local height = size[2]
			local y_offset = LIST_EDGE_SPACING * 2 + (height + LIST_SPACING) * (index - 1)
			local start_position_top = y_offset
			local start_position_bottom = y_offset + height
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

StartGameStateWeaveLeaderboard._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameStateWeaveLeaderboard._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

return
