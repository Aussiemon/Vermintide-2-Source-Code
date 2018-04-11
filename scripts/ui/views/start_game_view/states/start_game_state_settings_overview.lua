require("scripts/ui/views/start_game_view/windows/start_game_window_adventure")
require("scripts/ui/views/start_game_view/windows/start_game_window_adventure_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_game_mode")
require("scripts/ui/views/start_game_view/windows/start_game_window_settings")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission")
require("scripts/ui/views/start_game_view/windows/start_game_window_mission_selection")
require("scripts/ui/views/start_game_view/windows/start_game_window_difficulty")
require("scripts/ui/views/start_game_view/windows/start_game_window_lobby_browser")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_list")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_summary")
require("scripts/ui/views/start_game_view/windows/start_game_window_mutator_grid")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_login")
require("scripts/ui/views/start_game_view/windows/start_game_window_twitch_game_settings")

local definitions = local_require("scripts/ui/views/start_game_view/states/definitions/start_game_state_settings_overview_definitions")
local windows_settings = definitions.windows
local window_layouts = definitions.window_layouts
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local game_options_settings = definitions.game_options_settings
local MAX_ACTIVE_WINDOWS = 3
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
StartGameStateSettingsOverview = class(StartGameStateSettingsOverview)
StartGameStateSettingsOverview.NAME = "StartGameStateSettingsOverview"
StartGameStateSettingsOverview.on_enter = function (self, params)
	print("[StartGameState] Enter Substate StartGameStateSettingsOverview")

	self.parent = params.parent
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
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player = local_player
	self.wwise_world = params.wwise_world
	self._animations = {}
	self._ui_animations = {}
	self._is_game_private = false
	self._always_host = false
	self._use_strict_matchmaking = true

	self.create_ui_elements(self, params)

	if params.initial_state then
		params.initial_state = nil

		self._start_transition_animation(self, "on_enter", "on_enter")
	end

	local window_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		windows_settings = windows_settings,
		input_service = fake_input_service
	}

	self.set_confirm_button_visibility(self, false)
	self._initial_windows_setups(self, window_params)

	return 
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

	return 
end
StartGameStateSettingsOverview._initial_windows_setups = function (self, params)
	local active_windows = {}
	self._active_windows = active_windows
	self._window_params = params

	if Managers.twitch and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) then
		self.set_layout(self, 4)
	else
		local start_layout = PlayerData.mission_selection.start_layout or 1

		self.set_layout(self, start_layout)
	end

	return 
end
StartGameStateSettingsOverview.window_input_service = function (self)
	return (self._show_difficulty_option and fake_input_service) or self.input_service(self)
end
StartGameStateSettingsOverview._close_window_at_index = function (self, window_index)
	local active_windows = self._active_windows
	local params = self._window_params
	local current_window = active_windows[window_index]

	if current_window and current_window.on_exit then
		current_window.on_exit(current_window, params)
	end

	active_windows[window_index] = nil

	return 
end
StartGameStateSettingsOverview._change_window = function (self, window_index, window_name)
	local active_windows = self._active_windows
	local params = self._window_params
	local new_window_settings = windows_settings[window_name]
	local window_class_name = new_window_settings.class_name
	local current_window = active_windows[window_index]

	if current_window then
		if current_window.NAME == window_class_name then
			return 
		end

		self._close_window_at_index(self, window_index)
	end

	local window_class = rawget(_G, window_class_name)
	local window = window_class.new(window_class)
	local window_default_settings = UISettings.game_start_windows
	local window_size = window_default_settings.size
	local window_spacing = window_default_settings.spacing or 10
	local window_width = window_size[1]
	local total_spacing = window_spacing * (MAX_ACTIVE_WINDOWS - 1)
	local total_windows_width = MAX_ACTIVE_WINDOWS * window_width
	local start_width_offset = -(total_windows_width / 2 + window_width / 2) - (total_spacing / 2 + window_spacing)
	local window_width_offset = start_width_offset + window_index * window_width + window_index * window_spacing
	local window_offset = {
		window_width_offset,
		0,
		3
	}

	if window.on_enter then
		window.on_enter(window, params, window_offset)
	end

	active_windows[window_index] = window

	return 
end
StartGameStateSettingsOverview._set_new_save_data_table = function (self, table_name)
	if table_name then
		local mission_selection_save_data = PlayerData.mission_selection

		if not mission_selection_save_data[table_name] then
			mission_selection_save_data[table_name] = {}
		end

		local table = mission_selection_save_data[table_name]
		self._layout_save_settings = table

		self.set_private_option_enabled(self, table.is_private)
		self.set_always_host_option_enabled(self, table.always_host)
		self.set_strict_matchmaking_option_enabled(self, table.use_strict_matchmaking)
		self.set_selected_level_id(self, table.level_id)
		self.set_difficulty_option(self, table.difficulty_key)
	else
		self._layout_save_settings = nil
	end

	return 
end
StartGameStateSettingsOverview.set_layout = function (self, index)
	local layout_setting = self._get_layout_setting(self, index)
	local windows = layout_setting.windows
	local close_on_exit = layout_setting.close_on_exit
	local reset_on_exit = layout_setting.reset_on_exit
	local sound_event_enter = layout_setting.sound_event_enter
	local close_on_exit = layout_setting.close_on_exit

	if sound_event_enter then
		self.play_sound(self, sound_event_enter)
	end

	local save_data_table = layout_setting.save_data_table

	self._set_new_save_data_table(self, save_data_table)

	slot9 = self._widgets_by_name.exit_button.content

	if reset_on_exit then
	end

	slot9.visible = close_on_exit
	self._widgets_by_name.back_button.content.visible = reset_on_exit or not close_on_exit
	self._close_on_exit = close_on_exit
	self._reset_on_exit = reset_on_exit

	for i = 1, MAX_ACTIVE_WINDOWS, 1 do
		local window_changed = false

		for window_name, window_position_index in pairs(windows) do
			if window_position_index == i then
				self._change_window(self, window_position_index, window_name)

				window_changed = true
			end
		end

		if not window_changed then
			self._close_window_at_index(self, i)
		end
	end

	if self._selected_game_mode_index then
		self._previous_selected_game_mode_index = self._selected_game_mode_index
	end

	self._selected_game_mode_index = index

	return 
end
StartGameStateSettingsOverview.get_selected_game_mode_index = function (self)
	return self._selected_game_mode_index
end
StartGameStateSettingsOverview.get_previous_selected_game_mode_index = function (self)
	return self._previous_selected_game_mode_index
end
StartGameStateSettingsOverview._get_layout_setting = function (self, index)
	return window_layouts[index]
end
StartGameStateSettingsOverview._windows_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window.update(window, dt, t)
	end

	return 
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

	return 
end
StartGameStateSettingsOverview.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end

	return 
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

	return 
end
StartGameStateSettingsOverview.on_exit = function (self, params)
	print("[StartGameState] Exit Substate StartGameStateSettingsOverview")

	self.ui_animator = nil

	if self._fullscreen_effect_enabled then
		self.set_fullscreen_effect_enable_state(self, false)
	end

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
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

	return 
end
StartGameStateSettingsOverview.input_service = function (self)
	return self.parent:input_service()
end
StartGameStateSettingsOverview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	local input_manager = self.input_manager
	local input_service = self.parent:input_service()

	self.draw(self, input_service, dt)
	self._update_transition_timer(self, dt)

	if not self._show_difficulty_option then
		self._windows_update(self, dt, t)
	end

	local wanted_state = self._wanted_state(self)

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_state()

		return wanted_state or self._new_state
	end

	return 
end
StartGameStateSettingsOverview.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self._update_animations(self, dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self._handle_input(self, dt, t)
	end

	return 
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
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
StartGameStateSettingsOverview._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end
StartGameStateSettingsOverview._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service.get(input_service, "toggle_menu")
	local close_on_exit = self._close_on_exit
	local reset_on_exit = self._reset_on_exit
	local back_button = widgets_by_name.back_button
	local exit_button = widgets_by_name.exit_button

	UIWidgetUtils.animate_default_button(back_button, dt)
	UIWidgetUtils.animate_default_button(exit_button, dt)

	if self._is_button_hover_enter(self, back_button) or self._is_button_hover_enter(self, exit_button) then
		self.play_sound(self, "play_gui_equipment_button_hover")
	end

	if reset_on_exit and (input_pressed or self._is_button_pressed(self, back_button)) then
		self.play_sound(self, "play_gui_lobby_back")

		local start_layout = PlayerData.mission_selection.start_layout or 1

		self.set_layout(self, start_layout)
	elseif close_on_exit and (input_pressed or self._is_button_pressed(self, exit_button)) then
		self.parent:close_menu()

		return 
	elseif input_pressed or self._is_button_pressed(self, back_button) then
		self.play_sound(self, "Play_hud_select")

		local previous_layout_key = self.get_previous_selected_game_mode_index(self)

		if previous_layout_key then
			self.set_layout(self, previous_layout_key)
		end
	end

	return 
end
StartGameStateSettingsOverview.play = function (self, t)
	local layout_setting = self._get_layout_setting(self, self._selected_game_mode_index)
	local windows = layout_setting.windows

	for window_name, _ in pairs(windows) do
		if window_name == "adventure" then
			self.set_selected_level_id(self, nil)
		end
	end

	local twitch_active = Managers.twitch and Managers.twitch:is_connected()
	local network_lobby = self._network_lobby
	local num_members = #network_lobby.members(network_lobby):get_members()
	local is_alone = num_members == 1
	local level_key = self.get_selected_level_id(self)
	local difficulty = self._selected_difficulty_key
	local quick_game = level_key == nil
	local is_private = not quick_game and (twitch_active or self.is_private_option_enabled(self))
	local always_host = not quick_game and (twitch_active or not is_alone or is_private or self.is_always_host_option_enabled(self))
	local strict_matchmaking = not quick_game and not twitch_active and is_alone and not is_private and not always_host and self.is_strict_matchmaking_option_enabled(self)
	local deed_backend_id = self.get_selected_heroic_deed_backend_id(self)

	self.parent:start_game(level_key, difficulty, is_private, quick_game, always_host, strict_matchmaking, t, deed_backend_id)

	return 
end
StartGameStateSettingsOverview.is_confirm_putton_pressed = function (self)
	return false
end
StartGameStateSettingsOverview.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings

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

	return 
end
StartGameStateSettingsOverview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameStateSettingsOverview.play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
StartGameStateSettingsOverview._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id

	return 
end
StartGameStateSettingsOverview.get_selected_heroic_deed_backend_id = function (self)
	return self._selected_heroic_deed_backend_id
end
StartGameStateSettingsOverview.set_selected_heroic_deed_backend_id = function (self, backend_id)
	self._selected_heroic_deed_backend_id = backend_id

	return 
end
StartGameStateSettingsOverview.get_selected_level_id = function (self)
	return self._specific_level_id
end
StartGameStateSettingsOverview.set_selected_level_id = function (self, level_id)
	if self._layout_save_settings then
		self._layout_save_settings.level_id = level_id
	end

	self._specific_level_id = level_id

	return 
end
StartGameStateSettingsOverview.show_difficulty_option = function (self)
	self._show_difficulty_option = true

	return 
end
StartGameStateSettingsOverview.hide_difficulty_option = function (self)
	self._show_difficulty_option = false

	return 
end
StartGameStateSettingsOverview.set_private_option_enabled = function (self, is_private)
	if is_private == nil then
		is_private = false
	end

	if self._layout_save_settings then
		self._layout_save_settings.is_private = is_private
	end

	self._is_game_private = is_private

	return 
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

	return 
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

	return 
end
StartGameStateSettingsOverview.is_strict_matchmaking_option_enabled = function (self)
	return self._use_strict_matchmaking
end
StartGameStateSettingsOverview.is_difficulty_approved = function (self, difficulty_key)
	if not difficulty_key then
		return false
	end

	local human_players = Managers.player:human_players()
	local players_below_difficulty = DifficultyManager.players_below_required_power_level(difficulty_key, human_players)

	if 0 < #players_below_difficulty then
		return false
	end

	return true
end
StartGameStateSettingsOverview.set_difficulty_option = function (self, difficulty_key)
	if self._layout_save_settings then
		self._layout_save_settings.difficulty_key = difficulty_key
	end

	self._selected_difficulty_key = difficulty_key

	return 
end
StartGameStateSettingsOverview.get_difficulty_option = function (self, ignore_approval)
	local selected_difficulty_key = self._selected_difficulty_key

	if not ignore_approval and selected_difficulty_key and not self.is_difficulty_approved(self, selected_difficulty_key) then
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

	return 
end
StartGameStateSettingsOverview.set_mutator_option = function (self, mutator_key)
	self._selected_mutator_key = mutator_key

	return 
end
StartGameStateSettingsOverview.get_mutator_option = function (self)
	return self._selected_mutator_key
end

return 
