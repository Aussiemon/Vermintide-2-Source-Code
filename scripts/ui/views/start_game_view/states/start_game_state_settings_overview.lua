require("scripts/ui/views/start_game_view/windows/start_game_window_adventure")
require("scripts/ui/views/start_game_view/windows/start_game_window_adventure_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_game_mode")
require("scripts/ui/views/start_game_view/windows/start_game_window_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission")
require("scripts/ui/views/start_game_view/windows/start_game_window_area_selection")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission_selection")
require("scripts/ui/views/start_game_view/windows/start_game_window_difficulty")
require("scripts/ui/views/start_game_view/windows/start_game_window_lobby_browser")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_list")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_summary")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_grid")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_login")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_game_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_panel_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_background_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_adventure_overview_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_custom_game_overview_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_heroic_deed_overview_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_overview_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission_selection_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_area_selection_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_difficulty_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_grid_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_summary_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_login_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_additional_settings_console")
require("scripts/ui/views/start_game_view/windows/start_game_window_lobby_browser_console")

local definitions = local_require("scripts/ui/views/start_game_view/states/definitions/start_game_state_settings_overview_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local game_options_settings = definitions.game_options_settings
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local privacy_settings = {
	"online",
	"private"
}
local privacy_settings_value = {
	online = false,
	private = true
}
local privacy_settings_display_names = {
	online = "map_public_setting",
	private = "map_screen_private_button"
}
local layout_settings = layout_settings or nil
local windows_settings = windows_settings or nil
local window_layouts = window_layouts or nil
local MAX_ACTIVE_WINDOWS = MAX_ACTIVE_WINDOWS or nil
local generic_input_actions = generic_input_actions or nil

local function setup_menu_layout()
	local use_gamepad_layout = PLATFORM == "ps4" or PLATFORM == "xb1" or Managers.input:is_device_active("gamepad") or UISettings.use_gamepad_menu_layout

	if use_gamepad_layout then
		layout_settings = local_require("scripts/ui/views/start_game_view/states/start_game_window_layout_console")
	else
		layout_settings = local_require("scripts/ui/views/start_game_view/states/start_game_window_layout")
	end

	windows_settings = layout_settings.windows
	window_layouts = layout_settings.window_layouts
	MAX_ACTIVE_WINDOWS = layout_settings.max_active_windows
	generic_input_actions = layout_settings.generic_input_actions

	return use_gamepad_layout
end

StartGameStateSettingsOverview = class(StartGameStateSettingsOverview)
StartGameStateSettingsOverview.NAME = "StartGameStateSettingsOverview"

StartGameStateSettingsOverview.on_enter = function (self, params)
	print("[StartGameState] Enter Substate StartGameStateSettingsOverview")

	self.parent = params.parent
	self._gamepad_style_active = setup_menu_layout()
	self.hero_name = params.hero_name
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player = local_player
	self.wwise_world = params.wwise_world
	self._animations = {}
	self._ui_animations = {}
	self._is_game_private = false
	self._always_host = false
	self._use_strict_matchmaking = true

	if self._gamepad_style_active and PLATFORM == "win32" then
		self._game_mode_option_amount = 5
	else
		self._game_mode_option_amount = 4
	end

	self:create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	local window_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		windows_settings = windows_settings,
		input_service = fake_input_service
	}

	self:set_confirm_button_visibility(false)
	self:_initial_windows_setups(window_params)

	if self._gamepad_style_active then
		self:disable_player_world()
	end
end

StartGameStateSettingsOverview.create_ui_elements = function (self, params)
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
	local gui_layer = UILayer.default + 30
	local input_service = self:input_service()
	local use_fullscreen_layout = self._gamepad_style_active

	if generic_input_actions then
		self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 6, gui_layer, generic_input_actions.default, use_fullscreen_layout)

		self._menu_input_description:set_input_description(nil)
	end
end

StartGameStateSettingsOverview.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

StartGameStateSettingsOverview.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

StartGameStateSettingsOverview._start_index = function (self)
	local start_index = PlayerData.mission_selection.start_layout or 1

	return math.max((start_index - 1) % self._game_mode_option_amount + 1, 1)
end

StartGameStateSettingsOverview._initial_windows_setups = function (self, params)
	local active_windows = {}
	self._active_windows = active_windows
	self._window_params = params

	if Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) then
		self:set_layout_by_name("twitch")
	else
		local start_layout = self:_start_index()

		self:set_layout(start_layout)
	end
end

StartGameStateSettingsOverview.window_input_service = function (self)
	return (self._show_difficulty_option and fake_input_service) or self:input_service()
end

StartGameStateSettingsOverview._close_window_at_index = function (self, window_index)
	local active_windows = self._active_windows
	local params = self._window_params
	local current_window = active_windows[window_index]

	if current_window and current_window.on_exit then
		current_window:on_exit(params)
	end

	active_windows[window_index] = nil
end

StartGameStateSettingsOverview._change_window = function (self, window_index, window_name)
	local active_windows = self._active_windows
	local new_window_settings = windows_settings[window_name]
	local window_class_name = new_window_settings.class_name
	local current_window = active_windows[window_index]

	if current_window then
		if current_window.NAME == window_class_name then
			return
		end

		self:_close_window_at_index(window_index)
	end

	local window_class = rawget(_G, window_class_name)
	local window = window_class:new()
	local ignore_alignment = new_window_settings.ignore_alignment
	local window_offset = nil

	if not ignore_alignment then
		local window_default_settings = UISettings.game_start_windows
		local window_size = window_default_settings.size
		local window_spacing = window_default_settings.spacing or 10
		local window_width = window_size[1]
		local total_spacing = window_spacing * (MAX_ACTIVE_WINDOWS - 1)
		local total_windows_width = MAX_ACTIVE_WINDOWS * window_width
		local start_width_offset = -(total_windows_width / 2 + window_width / 2) - (total_spacing / 2 + window_spacing)
		local window_width_offset = start_width_offset + window_index * window_width + window_index * window_spacing
		window_offset = {
			window_width_offset,
			0,
			3
		}
	end

	if window.on_enter then
		local params = self._window_params

		window:on_enter(params, window_offset)
	end

	active_windows[window_index] = window
end

StartGameStateSettingsOverview._set_new_save_data_table = function (self, table_name)
	if table_name then
		local mission_selection_save_data = PlayerData.mission_selection

		if not mission_selection_save_data[table_name] or not self:_validate_mission_save_data(mission_selection_save_data[table_name]) then
			mission_selection_save_data[table_name] = {}
		end

		local table = mission_selection_save_data[table_name]
		self._layout_save_settings = table

		self:set_private_option_enabled(table.is_private)
		self:set_always_host_option_enabled(table.always_host)
		self:set_strict_matchmaking_option_enabled(table.use_strict_matchmaking)
		self:set_selected_level_id(table.level_id)
		self:set_difficulty_option(table.difficulty_key)
	else
		self._layout_save_settings = nil
	end
end

StartGameStateSettingsOverview._validate_mission_save_data = function (self, mission_save_data)
	local level_id = mission_save_data and mission_save_data.level_id

	if not level_id then
		return true
	end

	local stats_id = self._stats_id
	local statistics_db = self.statistics_db

	return LevelUnlockUtils.level_unlocked(statistics_db, stats_id, level_id)
end

StartGameStateSettingsOverview.close_on_exit = function (self)
	return self._close_on_exit
end

StartGameStateSettingsOverview.get_layout_name = function (self)
	local index = self._selected_game_mode_index

	for i, layout_setting in ipairs(window_layouts) do
		if i == index then
			return layout_setting.name
		end
	end
end

StartGameStateSettingsOverview.set_layout_by_name = function (self, name)
	printf("[StartGameStateSettingsOverview]:set_layout_by_name() - %s", name)

	for index, layout_setting in ipairs(window_layouts) do
		if layout_setting.name == name then
			self:set_layout(index)

			return
		end
	end

	ferror("[StartGameStateSettingsOverview]:set_layout_by_name() - Could not find a layout with name %s", name)
end

StartGameStateSettingsOverview.set_layout = function (self, index)
	local layout_setting = self:_get_layout_setting(index)
	local windows = layout_setting.windows
	local close_on_exit = layout_setting.close_on_exit
	local reset_on_exit = layout_setting.reset_on_exit
	local sound_event_enter = layout_setting.sound_event_enter
	local close_on_exit = layout_setting.close_on_exit
	local input_focus_window = layout_setting.input_focus_window

	if sound_event_enter then
		self:play_sound(sound_event_enter)
	end

	local save_data_table = layout_setting.save_data_table

	self:_set_new_save_data_table(save_data_table)

	slot10 = self._widgets_by_name.exit_button.content

	if reset_on_exit then
	end

	slot10.visible = close_on_exit
	self._widgets_by_name.back_button.content.visible = reset_on_exit or not close_on_exit
	self._close_on_exit = close_on_exit
	self._reset_on_exit = reset_on_exit

	for i = 1, MAX_ACTIVE_WINDOWS, 1 do
		local window_changed = false

		for window_name, window_position_index in pairs(windows) do
			if window_position_index == i then
				self:_change_window(window_position_index, window_name)

				window_changed = true
			end
		end

		if not window_changed then
			self:_close_window_at_index(i)
		end
	end

	if self._selected_game_mode_index then
		self._previous_selected_game_mode_index = self._selected_game_mode_index
	end

	if index <= self._game_mode_option_amount then
		self._selected_game_mode_index = index
	end

	if self._selected_layout_index then
		self._previous_selected_layout_index = self._selected_layout_index
	end

	self._selected_layout_index = index

	self:set_window_input_focus(input_focus_window)
end

StartGameStateSettingsOverview.set_window_input_focus = function (self, window_name)
	local layout_index = self._selected_game_mode_index
	local layout_setting = self:_get_layout_setting(layout_index)
	local window_setting = windows_settings[window_name]
	local window_class_name = window_setting and window_setting.class_name
	local window_found = false
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		local name = window.NAME
		local focused = name == window_class_name

		if window.set_focus then
			window:set_focus(focused)
		end

		if focused then
			window_found = true
		end
	end

	if window_name and not window_found then
		ferror("[StartGameStateSettingsOverview] - (set_window_input_focus) Could not find a window by name: %s", window_name)
	end

	self._window_focused = window_name
end

StartGameStateSettingsOverview.get_selected_game_mode_index = function (self)
	return self._selected_game_mode_index
end

StartGameStateSettingsOverview.get_previous_selected_game_mode_index = function (self)
	return self._previous_selected_game_mode_index
end

StartGameStateSettingsOverview.get_selected_layout_index = function (self)
	return self._selected_layout_index
end

StartGameStateSettingsOverview.get_previous_selected_layout_index = function (self)
	return self._previous_selected_layout_index
end

StartGameStateSettingsOverview._get_layout_setting = function (self, index)
	return window_layouts[index]
end

StartGameStateSettingsOverview._windows_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window:update(dt, t)
	end
end

StartGameStateSettingsOverview._windows_post_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window:post_update(dt, t)
	end
end

StartGameStateSettingsOverview.enable_widget = function (self, active_window_index, widget_name, enable)
	local active_windows = self._active_windows
	local active_window = active_windows[active_window_index]
	local widget = active_window._widgets_by_name[widget_name]

	if widget then
		local widget_content = widget.content
		local button_hotspot = widget_content.button_hotspot

		if button_hotspot then
			button_hotspot.disable_button = not enable
		end
	end
end

StartGameStateSettingsOverview.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

StartGameStateSettingsOverview._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

StartGameStateSettingsOverview.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

StartGameStateSettingsOverview.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

StartGameStateSettingsOverview.on_exit = function (self, params)
	print("[StartGameState] Exit Substate StartGameStateSettingsOverview")

	self.ui_animator = nil

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	Managers.save:auto_save(SaveFileName, SaveData, nil)
	self:_close_active_windows()

	if self._gamepad_style_active then
		self:enable_player_world()
	end
end

StartGameStateSettingsOverview._close_active_windows = function (self)
	local active_windows = self._active_windows
	local params = self._window_params

	for _, window in pairs(active_windows) do
		if window.on_exit then
			window:on_exit(params)
		end
	end

	table.clear(active_windows)
end

StartGameStateSettingsOverview._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

StartGameStateSettingsOverview.input_service = function (self)
	return self.parent:input_service()
end

StartGameStateSettingsOverview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local input_manager = self.input_manager
	local input_service = self.parent:input_service()

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	if not self._show_difficulty_option then
		self:_windows_update(dt, t)
	end

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_state()

		return wanted_state or self._new_state
	end
end

StartGameStateSettingsOverview.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self:_handle_input(dt, t)
	end

	self:_windows_post_update(dt, t)
end

StartGameStateSettingsOverview._update_animations = function (self, dt)
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
end

StartGameStateSettingsOverview._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameStateSettingsOverview._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local close_on_exit = self._close_on_exit
	local reset_on_exit = self._reset_on_exit
	local back_button = widgets_by_name.back_button
	local exit_button = widgets_by_name.exit_button

	UIWidgetUtils.animate_default_button(back_button, dt)
	UIWidgetUtils.animate_default_button(exit_button, dt)

	if self:_is_button_hover_enter(back_button) or self:_is_button_hover_enter(exit_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

	if reset_on_exit and (input_pressed or back_pressed or self:_is_button_pressed(back_button)) then
		self:play_sound("play_gui_lobby_back")

		local start_layout = self:_start_index()

		self:set_layout(start_layout)
	elseif close_on_exit and (back_pressed or input_pressed or self:_is_button_pressed(exit_button)) then
		self:close_menu()

		return
	elseif input_pressed or back_pressed or self:_is_button_pressed(back_button) then
		self:play_sound("Play_hud_select")

		local return_layout_index = nil
		local window_params = self._window_params

		if window_params then
			return_layout_index = window_params.return_layout_index
			window_params.return_layout_index = nil
		end

		return_layout_index = return_layout_index or self:get_previous_selected_layout_index()

		if return_layout_index then
			self:set_layout(return_layout_index)
		end
	end
end

StartGameStateSettingsOverview.close_menu = function (self, ignore_sound_on_close_menu)
	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

StartGameStateSettingsOverview.play = function (self, t, game_mode_type)
	printf("[StartGameStateSettingsOverview:play() - game_mode_type(%s)", game_mode_type)

	local is_offline = Managers.account:offline_mode()

	if game_mode_type == "adventure" then
		local level_key = nil
		local difficulty = self._selected_difficulty_key
		local is_private = is_offline
		local quick_game = true
		local always_host = is_offline
		local strict_matchmaking = false
		local deed_backend_id = nil

		self.parent:start_game(level_key, difficulty, is_private, quick_game, always_host, strict_matchmaking, t, deed_backend_id)
	elseif game_mode_type == "custom" then
		local network_lobby = self._network_lobby
		local num_members = #network_lobby:members():get_members()
		local is_alone = num_members == 1
		local level_key = self:get_selected_level_id()
		local difficulty = self._selected_difficulty_key
		local is_private = is_offline or self:is_private_option_enabled()
		local quick_game = false
		local always_host = is_offline or is_private or self:is_always_host_option_enabled()
		local strict_matchmaking = is_alone and not is_private and not always_host and self:is_strict_matchmaking_option_enabled()
		local deed_backend_id = nil

		self.parent:start_game(level_key, difficulty, is_private, quick_game, always_host, strict_matchmaking, t, deed_backend_id)
	elseif game_mode_type == "deed" then
		local level_key, difficulty = nil
		local is_private = true
		local quick_game = false
		local always_host = true
		local strict_matchmaking = false
		local deed_backend_id = self:get_selected_heroic_deed_backend_id()

		self.parent:start_game(level_key, difficulty, is_private, quick_game, always_host, strict_matchmaking, t, deed_backend_id)
	elseif game_mode_type == "twitch" then
		local level_key = self:get_selected_level_id()
		local difficulty = self._selected_difficulty_key
		local is_private = true
		local quick_game = false
		local always_host = true
		local strict_matchmaking = false
		local deed_backend_id = nil

		self.parent:start_game(level_key, difficulty, is_private, quick_game, always_host, strict_matchmaking, t, deed_backend_id)
	else
		ferror("Unknown game_mode_type(%s)", game_mode_type)
	end
end

StartGameStateSettingsOverview.is_confirm_putton_pressed = function (self)
	return false
end

StartGameStateSettingsOverview.set_input_description = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(not input_description or generic_input_actions[input_description], "[StartGameStateSettingsOverview:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:set_input_description(generic_input_actions[input_description])
end

StartGameStateSettingsOverview.change_generic_actions = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(generic_input_actions[input_description], "[StartGameStateSettingsOverview:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:change_generic_actions(generic_input_actions[input_description])
end

StartGameStateSettingsOverview.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings

	if not self._gamepad_style_active then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local snap_pixel_positions = render_settings.snap_pixel_positions

		for _, widget in ipairs(self._widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end

		UIRenderer.end_pass(ui_renderer)
	end

	local gamepad_active = input_manager:is_device_active("gamepad")

	if gamepad_active and self._menu_input_description and not self.parent:active_view() then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

StartGameStateSettingsOverview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameStateSettingsOverview.play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameStateSettingsOverview._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

StartGameStateSettingsOverview.get_selected_heroic_deed_backend_id = function (self)
	return self._selected_heroic_deed_backend_id
end

StartGameStateSettingsOverview.set_selected_heroic_deed_backend_id = function (self, backend_id)
	self._selected_heroic_deed_backend_id = backend_id
end

StartGameStateSettingsOverview.get_selected_level_id = function (self)
	return self._specific_level_id
end

StartGameStateSettingsOverview.set_selected_level_id = function (self, level_id)
	if self._layout_save_settings then
		self._layout_save_settings.level_id = level_id
	end

	self._specific_level_id = level_id
end

StartGameStateSettingsOverview.get_selected_area_name = function (self)
	if self._specific_area_name then
		return self._specific_area_name
	end

	if self._layout_save_settings then
		local area_name = self._layout_save_settings.area_name

		if area_name then
			return area_name
		end
	end

	return "helmgart"
end

StartGameStateSettingsOverview.set_selected_area_name = function (self, area_name)
	if self._layout_save_settings then
		self._layout_save_settings.area_name = area_name
	end

	self._specific_area_name = area_name
end

StartGameStateSettingsOverview.show_difficulty_option = function (self)
	self._show_difficulty_option = true
end

StartGameStateSettingsOverview.hide_difficulty_option = function (self)
	self._show_difficulty_option = false
end

StartGameStateSettingsOverview.set_private_option_enabled = function (self, is_private)
	if is_private == nil then
		is_private = false
	end

	if self._layout_save_settings then
		self._layout_save_settings.is_private = is_private
	end

	self._is_game_private = is_private
end

StartGameStateSettingsOverview.is_private_option_enabled = function (self)
	return self._is_game_private
end

StartGameStateSettingsOverview.set_always_host_option_enabled = function (self, always_host)
	if always_host == nil then
		always_host = false
	end

	if self._layout_save_settings then
		self._layout_save_settings.always_host = always_host
	end

	self._always_host = always_host
end

StartGameStateSettingsOverview.is_always_host_option_enabled = function (self)
	return self._always_host
end

StartGameStateSettingsOverview.set_strict_matchmaking_option_enabled = function (self, use_strict_matchmaking)
	if use_strict_matchmaking == nil then
		use_strict_matchmaking = true
	end

	if self._layout_save_settings then
		self._layout_save_settings.use_strict_matchmaking = use_strict_matchmaking
	end

	self._use_strict_matchmaking = use_strict_matchmaking
end

StartGameStateSettingsOverview.is_strict_matchmaking_option_enabled = function (self)
	return self._use_strict_matchmaking
end

StartGameStateSettingsOverview.is_difficulty_approved = function (self, difficulty_key)
	if script_data.disable_hero_power_requirement then
		return true
	end

	if not difficulty_key then
		return false
	end

	local human_players = Managers.player:human_players()
	local players_below_difficulty = DifficultyManager.players_below_required_power_level(difficulty_key, human_players)

	if #players_below_difficulty > 0 then
		return false
	end

	return true
end

StartGameStateSettingsOverview.set_difficulty_option = function (self, difficulty_key)
	if self._layout_save_settings then
		self._layout_save_settings.difficulty_key = difficulty_key
	end

	self._selected_difficulty_key = difficulty_key
end

StartGameStateSettingsOverview.get_difficulty_option = function (self, ignore_approval)
	local selected_difficulty_key = self._selected_difficulty_key

	if not ignore_approval and selected_difficulty_key and not self:is_difficulty_approved(selected_difficulty_key) then
		selected_difficulty_key = nil
	end

	return selected_difficulty_key
end

StartGameStateSettingsOverview.set_play_button_enabled = function (self, enabled)
	return
end

StartGameStateSettingsOverview.set_confirm_button_visibility = function (self, visible)
	return
end

StartGameStateSettingsOverview.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

StartGameStateSettingsOverview.set_mutator_option = function (self, mutator_key)
	self._selected_mutator_key = mutator_key
end

StartGameStateSettingsOverview.get_mutator_option = function (self)
	return self._selected_mutator_key
end

return
