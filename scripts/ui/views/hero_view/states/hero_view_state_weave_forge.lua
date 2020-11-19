local_require("scripts/ui/views/hero_view/windows/hero_window_weave_properties")
local_require("scripts/ui/views/hero_view/windows/hero_window_weave_forge_overview")
local_require("scripts/ui/views/hero_view/windows/hero_window_weave_forge_weapons")
local_require("scripts/ui/views/hero_view/windows/hero_window_weave_forge_background")
local_require("scripts/ui/views/hero_view/windows/hero_window_weave_forge_panel")

local definitions = local_require("scripts/ui/views/hero_view/states/definitions/hero_view_state_weave_forge_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local console_cursor_definition = definitions.console_cursor_definition
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false
local rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}
HeroViewStateWeaveForge = class(HeroViewStateWeaveForge)
HeroViewStateWeaveForge.NAME = "HeroViewStateWeaveForge"

HeroViewStateWeaveForge.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate HeroViewStateWeaveForge")

	self.parent = params.parent
	self._gamepad_style_active = self:_setup_menu_layout()
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.voting_manager = ingame_ui_context.voting_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.wwise_world = params.wwise_world
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.player = local_player
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local career_index = hero_attributes:get(display_name, "career")
	self.hero_name = display_name
	self.career_index = career_index
	self.profile_index = profile_index
	self._animations = {}
	self._ui_animations = {}

	if PLATFORM == "win32" then
		self._friends_component_ui = FriendsUIComponent:new(ingame_ui_context)
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
		windows_settings = self._windows_settings,
		input_service = FAKE_INPUT_SERVICE,
		hero_name = self.hero_name,
		career_index = self.career_index,
		profile_index = self.profile_index,
		start_state = params.start_state
	}

	self:_initial_windows_setups(window_params)

	if self._gamepad_style_active then
		UISettings.hero_fullscreen_menu_on_enter()

		if self.is_in_inn then
			self:play_sound("play_gui_amb_hero_screen_loop_begin")
			self:_setup_gamepad_gui()
			self:disable_player_world()
		else
			self:enable_ingame_overlay()
		end
	else
		self:play_sound("hud_magic_forge_open")
	end

	Managers.input:enable_gamepad_cursor()
	Managers.state.event:trigger("weave_forge_entered")
end

HeroViewStateWeaveForge.gamepad_style_active = function (self)
	return self._gamepad_style_active
end

HeroViewStateWeaveForge.get_ui_renderer = function (self)
	if self._gamepad_style_active then
		return self._gui_data.bottom.renderer
	else
		return self.ui_renderer
	end
end

HeroViewStateWeaveForge.get_ui_top_renderer = function (self)
	return self.ui_top_renderer
end

HeroViewStateWeaveForge.hdr_renderer = function (self)
	return self.parent:hdr_renderer()
end

HeroViewStateWeaveForge.hdr_top_renderer = function (self)
	return self.parent:hdr_top_renderer()
end

HeroViewStateWeaveForge._setup_gamepad_gui = function (self)
	if self.is_in_inn then
		local gui_data = {}
		local world_name = "weave_forge_gamepad"
		local renderer, world, viewport_name = self:_setup_gamepad_renderer(world_name, 1, GameSettingsDevelopment.default_environment)
		gui_data.bottom = {
			renderer = renderer,
			world = world,
			viewport_name = viewport_name
		}
		self._gui_data = gui_data
	end
end

HeroViewStateWeaveForge._setup_gamepad_renderer = function (self, name, layer, shading_environment)
	local world_flags = {
		Application.DISABLE_SOUND,
		Application.DISABLE_ESRAM
	}
	local world_name = name
	local viewport_name = name
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(world_flags))
	local viewport_type = "overlay"
	local viewport = ScriptWorld.create_viewport(world, viewport_name, viewport_type, 999)
	local renderer = self.ingame_ui:create_ui_renderer(world, false, self.is_in_inn)

	return renderer, world, viewport_name
end

HeroViewStateWeaveForge._destroy_gamepad_gui = function (self)
	local gui_data = self._gui_data

	if gui_data then
		for _, data in pairs(gui_data) do
			local renderer = data.renderer
			local world = data.world
			local viewport_name = data.viewport_name

			UIRenderer.destroy(renderer, world)
			ScriptWorld.destroy_viewport(world, viewport_name)
			Managers.world:destroy_world(world)
		end

		self._gui_data = nil
	end
end

HeroViewStateWeaveForge._setup_menu_layout = function (self)
	local use_gamepad_layout = PLATFORM == "ps4" or PLATFORM == "xb1" or Managers.input:is_device_active("gamepad") or UISettings.use_gamepad_menu_layout
	self._layout_settings = local_require("scripts/ui/views/hero_view/states/weave_forge_window_layout")
	self._windows_settings = self._layout_settings.windows
	self._window_layouts = self._layout_settings.window_layouts
	self._max_active_windows = self._layout_settings.max_active_windows

	return use_gamepad_layout
end

HeroViewStateWeaveForge.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	local gui_layer = UILayer.default + 30
	local input_service = self:input_service()
	local use_fullscreen_layout = self._gamepad_style_active
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 6, gui_layer, generic_input_actions.default, use_fullscreen_layout)

	self._menu_input_description:set_input_description(nil)

	self._current_input_desc = nil
end

HeroViewStateWeaveForge.set_input_description = function (self, input_description)
	local input_description_settings = generic_input_actions[input_description]

	if self._current_input_desc == input_description then
		return
	end

	if input_description_settings then
		self._menu_input_description:set_input_description(input_description_settings)
	else
		self._menu_input_description:set_input_description(nil)
	end

	self._current_input_desc = input_description
end

HeroViewStateWeaveForge.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

HeroViewStateWeaveForge.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

HeroViewStateWeaveForge.enable_ingame_overlay = function (self)
	if not self._ingame_overlay_enabled then
		self._ingame_overlay_enabled = true
		local world = Managers.world:world("level_world")

		World.set_data(world, "fullscreen_blur", 0.5)
		World.set_data(world, "greyscale", 1)
	end
end

HeroViewStateWeaveForge.disable_ingame_overlay = function (self)
	if self._ingame_overlay_enabled then
		self._ingame_overlay_enabled = false
		local world = Managers.world:world("level_world")

		World.set_data(world, "fullscreen_blur", nil)
		World.set_data(world, "greyscale", nil)
	end
end

HeroViewStateWeaveForge._initial_windows_setups = function (self, params)
	local active_windows = {}
	self._active_windows = active_windows
	self._window_params = params
	self._layouts_index_history = {}
	local start_state = params.start_state

	if start_state then
		self:set_layout_by_name(start_state)
	else
		self:set_layout(1)
	end
end

HeroViewStateWeaveForge.window_input_service = function (self)
	return (self._input_blocked and FAKE_INPUT_SERVICE) or self:input_service()
end

HeroViewStateWeaveForge._close_window_at_index = function (self, window_index)
	local active_windows = self._active_windows
	local params = self._window_params
	local current_window = active_windows[window_index]

	if current_window and current_window.on_exit then
		current_window:on_exit(params)
	end

	active_windows[window_index] = nil
end

HeroViewStateWeaveForge._change_window = function (self, window_index, window_name)
	local active_windows = self._active_windows
	local new_window_settings = self._windows_settings[window_name]
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
		local alignment_index = new_window_settings.alignment_index or window_index
		local window_default_settings = UISettings.game_start_windows
		local window_size = window_default_settings.size
		local window_spacing = window_default_settings.spacing or 10
		local window_width = window_size[1]
		local total_spacing = window_spacing * 2
		local total_windows_width = 3 * window_width
		local start_width_offset = -(total_windows_width / 2 + window_width / 2) - (total_spacing / 2 + window_spacing)
		local window_width_offset = start_width_offset + alignment_index * window_width + alignment_index * window_spacing
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

HeroViewStateWeaveForge.get_layout_name = function (self)
	local index = self._selected_layout_index

	for i, layout_setting in ipairs(self._window_layouts) do
		if i == index then
			return layout_setting.name
		end
	end
end

HeroViewStateWeaveForge.set_layout_by_name = function (self, name)
	for index, layout_setting in ipairs(self._window_layouts) do
		if layout_setting.name == name then
			self:set_layout(index)

			return
		end
	end
end

HeroViewStateWeaveForge.close_on_exit = function (self)
	return self._close_on_exit
end

HeroViewStateWeaveForge.set_layout = function (self, index, ignore_layout_history)
	local layout_setting = self:_get_layout_setting(index)
	local windows = layout_setting.windows
	local sound_event_enter = layout_setting.sound_event_enter
	local close_on_exit = layout_setting.close_on_exit
	local input_focus_window = layout_setting.input_focus_window
	local layout_name = layout_setting.name

	if sound_event_enter then
		self:play_sound(sound_event_enter)
	end

	self._widgets_by_name.exit_button.content.visible = close_on_exit
	self._widgets_by_name.back_button.content.visible = not close_on_exit
	self._close_on_exit = close_on_exit

	for i = 1, self._max_active_windows, 1 do
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

	if self._selected_layout_index then
		self._previous_selected_layout_index = self._selected_layout_index

		if not ignore_layout_history then
			self._layouts_index_history[#self._layouts_index_history + 1] = self._previous_selected_layout_index
		end
	end

	self._selected_layout_name = layout_name
	self._selected_layout_index = index

	self:set_window_input_focus(input_focus_window)
end

HeroViewStateWeaveForge.set_window_input_focus = function (self, window_name)
	local layout_index = self._selected_layout_index
	local layout_setting = self:_get_layout_setting(layout_index)
	local window_setting = self._windows_settings[window_name]
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
		ferror("[HeroViewStateWeaveForge] - (set_window_input_focus) Could not find a window by name: %s", window_name)
	end

	self._window_focused = window_name
end

HeroViewStateWeaveForge.get_selected_layout_name = function (self)
	return self._selected_layout_name
end

HeroViewStateWeaveForge.get_selected_layout_index = function (self)
	return self._selected_layout_index
end

HeroViewStateWeaveForge.get_previous_selected_layout_index = function (self)
	return self._previous_selected_layout_index
end

HeroViewStateWeaveForge._get_layout_setting = function (self, index)
	return self._window_layouts[index]
end

HeroViewStateWeaveForge._windows_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		window:update(dt, t)
	end
end

HeroViewStateWeaveForge._windows_post_update = function (self, dt, t)
	local active_windows = self._active_windows

	for _, window in pairs(active_windows) do
		if window.post_update then
			window:post_update(dt, t)
		end
	end
end

HeroViewStateWeaveForge.enable_widget = function (self, active_window_index, widget_name, enable)
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

HeroViewStateWeaveForge.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

HeroViewStateWeaveForge._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

HeroViewStateWeaveForge.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

HeroViewStateWeaveForge.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

HeroViewStateWeaveForge.requested_screen_change_by_name = function (self, state)
	self._on_close_next_state = state

	self:close_menu()
end

HeroViewStateWeaveForge.on_exit = function (self, params)
	print("[HeroViewState] Exit Substate HeroViewStateWeaveForge")

	self.ui_animator = nil
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui and self:is_friends_list_active() then
		friends_component_ui:deactivate_friends_ui()
	end

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	self:_close_active_windows()

	if self._gamepad_style_active then
		UISettings.hero_fullscreen_menu_on_exit()

		if self.is_in_inn then
			self:play_sound("play_gui_amb_hero_screen_loop_end")
			self:_destroy_gamepad_gui()
			self:enable_player_world()
		else
			self:disable_ingame_overlay()
		end
	else
		self:play_sound("hud_magic_forge_close")
	end

	Managers.input:disable_gamepad_cursor()
end

HeroViewStateWeaveForge._close_active_windows = function (self)
	local active_windows = self._active_windows
	local params = self._window_params

	for _, window in pairs(active_windows) do
		if window.on_exit then
			window:on_exit(params)
		end
	end

	table.clear(active_windows)
end

HeroViewStateWeaveForge._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

HeroViewStateWeaveForge.input_service = function (self)
	return self.parent:input_service()
end

HeroViewStateWeaveForge.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local input_manager = self.input_manager
	local input_service = self:window_input_service()
	local friends_component_ui = self._friends_component_ui
	local gamepad_active = input_manager:is_device_active("gamepad")

	if friends_component_ui and not gamepad_active and Managers.account:is_online() then
		friends_component_ui:update(dt, input_service)
	end

	if not self._gamepad_style_active then
		self:draw(input_service, dt)
	else
		self:draw_gamepad_cursor(input_service, dt)
	end

	self:_update_transition_timer(dt)
	self:_windows_update(dt, t)

	local transitioning = self.parent:transitioning()
	local wanted_state = self:_wanted_state()

	if not self._transition_timer then
		if not transitioning and self:_has_active_level_vote() then
			local ignore_sound_on_close_menu = true

			self:close_menu(ignore_sound_on_close_menu)
		end

		if wanted_state then
			self.parent:clear_wanted_state()

			self._new_state = wanted_state
		else
			return self._new_state
		end
	end
end

HeroViewStateWeaveForge.is_friends_list_active = function (self)
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui then
		return friends_component_ui:is_active()
	end

	return false
end

HeroViewStateWeaveForge._handle_friend_joining = function (self)
	local friends_component_ui = self._friends_component_ui

	if friends_component_ui then
		local join_lobby_data = friends_component_ui:join_lobby_data()

		if join_lobby_data and Managers.matchmaking:allowed_to_initiate_join_lobby() then
			Managers.matchmaking:request_join_lobby(join_lobby_data)
			self:close_menu(true)

			return true
		end
	end
end

HeroViewStateWeaveForge._has_active_level_vote = function (self)
	local voting_manager = self.voting_manager
	local is_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

HeroViewStateWeaveForge.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	if not self._transition_timer and not self._new_state then
		local transitioning = self.parent:transitioning()

		if not transitioning and not self:_has_active_level_vote() then
			self:_handle_input(dt, t)
		end
	end

	self:_windows_post_update(dt, t)

	if self._new_state then
		self:_close_active_windows()
	end
end

HeroViewStateWeaveForge._update_animations = function (self, dt)
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

HeroViewStateWeaveForge._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

HeroViewStateWeaveForge._handle_input = function (self, dt, t)
	local input_blocked = self._input_blocked
	local window_focused = self._window_focused

	if input_blocked then
		return
	end

	if self:_handle_friend_joining() then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local close_on_exit = self._close_on_exit
	local exit_button = widgets_by_name.exit_button
	local back_button = widgets_by_name.back_button

	UIWidgetUtils.animate_default_button(exit_button, dt)
	UIWidgetUtils.animate_default_button(back_button, dt)

	if self:_is_button_hover_enter(back_button) or self:_is_button_hover_enter(exit_button) then
		self:play_sound("play_gui_equipment_button_hover")
	end

	if close_on_exit and (back_pressed or input_pressed or self:_is_button_pressed(exit_button)) then
		self:play_sound("Play_hud_hover")
		self:close_menu()

		return
	elseif input_pressed or back_pressed or self:_is_button_pressed(back_button) then
		self:play_sound("Play_hud_hover")

		local previous_layout_key = self:get_previous_selected_layout_index()
		local layouts_index_history = self._layouts_index_history

		if layouts_index_history and #layouts_index_history >= 1 then
			local previous_visited_layout_index = layouts_index_history[#layouts_index_history]
			layouts_index_history[#layouts_index_history] = nil

			self:set_layout(previous_visited_layout_index, true)
		end
	end
end

HeroViewStateWeaveForge.close_menu = function (self, ignore_sound_on_close_menu)
	if self._on_close_next_state then
		self.parent:requested_screen_change_by_name(self._on_close_next_state)
	else
		self.parent:close_menu(nil, ignore_sound_on_close_menu)
	end
end

HeroViewStateWeaveForge.draw_gamepad_cursor = function (self, input_service, dt)
	local ui_renderer = self:get_ui_renderer()
	local ui_top_renderer = self:get_ui_top_renderer()
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	if gamepad_active then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)

		if self._menu_input_description then
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

HeroViewStateWeaveForge.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local render_settings = self.render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)

		if self._menu_input_description then
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

HeroViewStateWeaveForge._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroViewStateWeaveForge.play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroViewStateWeaveForge._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

HeroViewStateWeaveForge.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

HeroViewStateWeaveForge.block_input = function (self, start_loading_icon)
	self._input_blocked = true
	local widgets_by_name = self._widgets_by_name

	if start_loading_icon then
		widgets_by_name.loading_icon.content.visible = true
	end

	widgets_by_name.exit_button.content.button_hotspot.disable_button = true
	widgets_by_name.back_button.content.button_hotspot.disable_button = true

	self.parent:set_input_blocked(true)
end

HeroViewStateWeaveForge.unblock_input = function (self)
	self._input_blocked = false
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.loading_icon.content.visible = false
	widgets_by_name.exit_button.content.button_hotspot.disable_button = false
	widgets_by_name.back_button.content.button_hotspot.disable_button = false

	self.parent:set_input_blocked(false)
end

HeroViewStateWeaveForge.input_blocked = function (self)
	return self._input_blocked
end

return
