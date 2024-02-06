﻿-- chunkname: @scripts/ui/views/start_game_view/start_game_view.lua

require("scripts/ui/views/hero_view/item_grid_ui")
require("scripts/ui/views/start_game_view/states/start_game_state_settings_overview")
require("scripts/ui/views/start_game_view/states/start_game_state_weave_leaderboard")

local definitions = local_require("scripts/ui/views/start_game_view/start_game_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
local settings_by_screen = definitions.settings_by_screen
local attachments = definitions.attachments
local flow_events = definitions.flow_events

local function dprint(...)
	print("[StartGameView]", ...)
end

local DO_RELOAD = true
local debug_draw_scenegraph = false
local debug_menu = true
local menu_functions = {}

if not IS_WINDOWS then
	menu_functions.console_friends_menu = function (this)
		local input_manager = Managers.input

		input_manager:block_device_except_service("console_friends_menu", "gamepad")
		this:_activate_view("console_friends_view")
	end
end

StartGameView = class(StartGameView)

StartGameView.init = function (self, ingame_ui_context)
	self.world = ingame_ui_context.world
	self.player_manager = ingame_ui_context.player_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.voting_manager = ingame_ui_context.voting_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.is_server = ingame_ui_context.is_server
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.world_manager = ingame_ui_context.world_manager

	local world = self.world_manager:world("level_world")

	self.wwise_world = Managers.world:wwise_world(world)

	local input_manager = ingame_ui_context.input_manager

	self.input_manager = input_manager

	input_manager:create_input_service("start_game_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("start_game_view", "keyboard")
	input_manager:map_device_to_service("start_game_view", "mouse")
	input_manager:map_device_to_service("start_game_view", "gamepad")

	local state_machine_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		settings_by_screen = settings_by_screen,
		input_service = FAKE_INPUT_SERVICE,
	}

	self._state_machine_params = state_machine_params
	self.units = {}
	self.attachment_units = {}
	self.unit_states = {}
	self.ui_animations = {}
	self.ingame_ui_context = ingame_ui_context
	DO_RELOAD = false
end

StartGameView._init_menu_views = function (self)
	local ingame_ui_context = self.ingame_ui_context

	self._views = {
		console_friends_view = ingame_ui_context.ingame_ui.views.console_friends_view,
	}

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()
		end
	end
end

StartGameView._activate_view = function (self, new_view)
	self._active_view = new_view

	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		views[new_view]:on_enter()
	end
end

StartGameView.active_view = function (self)
	return self._active_view
end

StartGameView.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil

	local input_service = Managers.input:get_service("start_game_view")
	local input_service_name = input_service.name
	local input_manager = Managers.input

	input_manager:block_device_except_service(input_service_name, "keyboard")
	input_manager:block_device_except_service(input_service_name, "mouse")
	input_manager:block_device_except_service(input_service_name, "gamepad")
	input_manager:disable_gamepad_cursor()
end

StartGameView.initial_profile_view = function (self)
	return self.ingame_ui.initial_profile_view
end

StartGameView._setup_state_machine = function (self, state_machine_params, optional_start_state, optional_start_sub_state, optional_params)
	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	local start_state = optional_start_state or StartGameStateSettingsOverview
	local profiling_debugging_enabled = false

	state_machine_params.start_state = optional_start_sub_state
	state_machine_params.state_params = optional_params
	self._machine = GameStateMachine:new(self, start_state, state_machine_params, profiling_debugging_enabled)
	self._state_machine_params = state_machine_params
	state_machine_params.state_params = nil
end

StartGameView.wanted_state = function (self)
	return self._wanted_state
end

StartGameView.clear_wanted_state = function (self)
	self._wanted_state = nil
end

StartGameView.input_service = function (self)
	return self._draw_loading and FAKE_INPUT_SERVICE or self.input_manager:get_service("start_game_view")
end

StartGameView.set_input_blocked = function (self, blocked)
	self._input_blocked = blocked
end

StartGameView.input_blocked = function (self)
	return self._input_blocked
end

StartGameView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

StartGameView.play_mechanism_sound = function (self, event_setting_name, default_event)
	local sound_event = Managers.mechanism:mechanism_setting(event_setting_name) or default_event

	if sound_event then
		self:play_sound(sound_event)
	end
end

StartGameView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._static_widgets = {}
	self._loading_widgets = {
		background = UIWidget.init(widget_definitions.loading_bg),
		text = UIWidget.init(widget_definitions.loading_text),
	}
	self._console_cursor_widget = UIWidget.init(widget_definitions.console_cursor)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, definitions.animations)
end

StartGameView.draw = function (self, dt, input_service)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if debug_draw_scenegraph then
		UISceneGraph.debug_render_scenegraph(ui_renderer, ui_scenegraph)
	end

	for _, widget in ipairs(self._static_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.draw_widget(ui_renderer, self._console_cursor_widget)

	if self._draw_loading then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

		for _, widget in pairs(self._loading_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameView.post_update = function (self, dt, t)
	if self._machine then
		self._machine:post_update(dt, t)
	end
end

StartGameView.update = function (self, dt, t)
	if self.suspended or self.waiting_for_post_update_enter then
		return
	end

	if self:_has_active_level_vote() then
		self:close_menu(nil, true)
	end

	local requested_screen_change_data = self._requested_screen_change_data

	if requested_screen_change_data then
		local screen_name = requested_screen_change_data.screen_name
		local sub_screen_name = requested_screen_change_data.sub_screen_name

		self:_change_screen_by_name(screen_name, sub_screen_name)

		self._requested_screen_change_data = nil
	end

	local is_sub_menu = true
	local input_manager = self.input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")
	local input_blocked = self:input_blocked()
	local input_service = input_blocked and FAKE_INPUT_SERVICE or self:input_service()

	self._state_machine_params.input_service = input_service

	local transitioning = self:transitioning()

	self.ui_animator:update(dt)

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	if not transitioning then
		self:_handle_mouse_input(dt, t, input_service)

		local active_view = self._active_view

		if active_view then
			self._views[active_view]:update(dt, t)
		else
			self:_handle_input(dt, t)
		end
	end

	if self._machine then
		self._machine:update(dt, t)
	end

	self:draw(dt, input_service)
end

StartGameView.on_enter = function (self, params)
	ShowCursorStack.push()

	local input_manager = self.input_manager

	input_manager:block_device_except_service("start_game_view", "keyboard", 1)
	input_manager:block_device_except_service("start_game_view", "mouse", 1)
	input_manager:block_device_except_service("start_game_view", "gamepad", 1)

	local state_machine_params = self._state_machine_params

	state_machine_params.initial_state = true

	self:create_ui_elements()

	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)

	self:set_current_hero(profile_index)

	self.waiting_for_post_update_enter = true
	self._on_enter_transition_params = params
	self._on_enter_sub_state = params.menu_sub_state_name

	self:play_mechanism_sound("start_game_open_sound_event")
	Managers.music:duck_sounds()

	self._draw_loading = false

	self:_init_menu_views()
	self:_handle_new_ui_disclaimer()
end

StartGameView._handle_new_ui_disclaimer = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local global_disclaimer_states = {
		deus = {
			default = false,
			play = false,
		},
		adventure = {
			default = true,
			leaderboard = false,
		},
		default = {
			default = true,
			leaderboard = false,
		},
	}
	local disclaimer_states = global_disclaimer_states[mechanism_name] or global_disclaimer_states.default
	local on_enter_transition_params = self._on_enter_transition_params
	local menu_state_name = on_enter_transition_params and on_enter_transition_params.menu_state_name or "default"

	Managers.ui:handle_new_ui_disclaimer(disclaimer_states, menu_state_name)
end

StartGameView.on_enter_sub_state = function (self)
	return self._on_enter_sub_state
end

StartGameView.set_current_hero = function (self, profile_index)
	local profile_settings = SPProfiles[profile_index]
	local display_name = profile_settings.display_name
	local character_name = profile_settings.character_name

	self._hero_name = display_name

	local state_machine_params = self._state_machine_params

	state_machine_params.hero_name = display_name
end

StartGameView._get_sorted_players = function (self)
	local human_players = self.player_manager:human_players()
	local player_order = {}

	for _, player in pairs(human_players) do
		player_order[#player_order + 1] = player
	end

	table.sort(player_order, function (a, b)
		return a.local_player and not b.local_player
	end)

	return player_order
end

StartGameView._handle_mouse_input = function (self, dt, t, input_service)
	return
end

StartGameView._handle_input = function (self, dt, t)
	if Managers.account:offline_mode() then
		return
	end

	local input_service = self:input_service()

	if input_service:get("show_gamercard") and menu_functions.console_friends_menu then
		local state = self._machine:state()

		if state.disable_input and state:disable_input("show_gamercard") then
			return
		end

		menu_functions.console_friends_menu(self)
	end
end

StartGameView._is_selection_widget_pressed = function (self, widget)
	local content = widget.content
	local steps = content.steps

	for i = 1, steps do
		local hotspot_name = "hotspot_" .. i
		local hotspot = content[hotspot_name]

		if hotspot.on_release then
			return true, i
		end
	end
end

StartGameView.hotkey_allowed = function (self, input, mapping_data)
	if self:input_blocked() then
		return false
	end

	local transition_state = mapping_data.transition_state
	local transition_sub_state = mapping_data.transition_sub_state
	local state_machine = self._machine

	if state_machine then
		local current_state = state_machine:state()
		local current_state_name = current_state.NAME

		if current_state.hotkey_allowed and not current_state:hotkey_allowed(input, mapping_data) then
			return false
		end

		local current_screen_settings = self:_get_screen_settings_by_state_name(current_state_name)
		local name = current_screen_settings.name

		if name == transition_state then
			local active_sub_settings_name = current_state.get_selected_layout_name and current_state:get_selected_layout_name()

			if not transition_sub_state or transition_sub_state == active_sub_settings_name then
				return true
			elseif transition_sub_state then
				return true
			end
		elseif transition_state then
			self:requested_screen_change_by_name(transition_state, transition_sub_state)
		else
			return true
		end
	end

	return false
end

StartGameView._get_screen_settings_by_state_name = function (self, state_name)
	for index, screen_settings in ipairs(settings_by_screen) do
		if screen_settings.state_name == state_name then
			return screen_settings
		end
	end
end

StartGameView.requested_screen_change_by_name = function (self, screen_name, sub_screen_name)
	self._requested_screen_change_data = {
		screen_name = screen_name,
		sub_screen_name = sub_screen_name,
	}
end

StartGameView._change_screen_by_name = function (self, screen_name, sub_screen_name, optional_params)
	local settings, settings_index

	for index, screen_settings in ipairs(settings_by_screen) do
		if screen_settings.name == screen_name then
			settings = screen_settings
			settings_index = index

			break
		end
	end

	assert(settings_index, "[StartGameView] - Could not find state by name: %s", screen_name)

	local state_name = settings.state_name
	local state = rawget(_G, state_name)

	if self._machine and not sub_screen_name then
		self._wanted_state = state
	else
		self:_setup_state_machine(self._state_machine_params, state, sub_screen_name, optional_params)
	end
end

StartGameView._change_screen_by_index = function (self, index)
	local screen_settings = settings_by_screen[index]
	local settings_name = screen_settings.name

	self:_change_screen_by_name(settings_name)
end

StartGameView.post_update_on_enter = function (self)
	self.waiting_for_post_update_enter = nil

	local on_enter_transition_params = self._on_enter_transition_params

	if on_enter_transition_params and on_enter_transition_params.menu_state_name then
		local menu_state_name = on_enter_transition_params.menu_state_name
		local menu_sub_state_name = on_enter_transition_params.menu_sub_state_name

		self:_change_screen_by_name(menu_state_name, menu_sub_state_name, on_enter_transition_params)

		self._on_enter_transition_params = nil
	else
		self:_change_screen_by_index(1)
	end
end

StartGameView.post_update_on_exit = function (self)
	return
end

StartGameView.on_exit = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)
	ShowCursorStack.pop()

	self.exiting = nil

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end

	local active_view = self._active_view
	local views = self._views

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil

	self:play_mechanism_sound("start_game_close_sound_event")
	Managers.music:unduck_sounds()

	self._draw_loading = false
end

StartGameView.exit = function (self, return_to_game, ignore_sound)
	local exit_transition = return_to_game and "exit_menu" or "ingame_menu"

	self.ingame_ui:transition_with_fade(exit_transition)

	if self._active_view then
		self:exit_current_view()
	end

	if not ignore_sound then
		self:play_sound("Play_hud_button_close")
	end

	self.exiting = true
end

StartGameView.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

StartGameView.suspend = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.suspended = true
end

StartGameView.unsuspend = function (self)
	self.input_manager:block_device_except_service("start_game_view", "keyboard", 1)
	self.input_manager:block_device_except_service("start_game_view", "mouse", 1)
	self.input_manager:block_device_except_service("start_game_view", "gamepad", 1)

	self.suspended = nil
end

StartGameView.close_menu = function (self, return_to_main_screen, ignore_sound)
	local return_to_game = not return_to_main_screen

	self:exit(return_to_game, ignore_sound)
end

StartGameView.destroy = function (self)
	self.ingame_ui_context = nil
	self.ui_animator = nil

	if self._machine then
		self._machine:destroy()

		self._machine = nil
	end
end

StartGameView._is_button_pressed = function (self, widget)
	local button_hotspot = widget.content.button_hotspot

	if button_hotspot.on_release then
		button_hotspot.on_release = false

		return true
	end
end

StartGameView._has_active_level_vote = function (self)
	local voting_manager = self.voting_manager
	local is_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

	return is_mission_vote and not voting_manager:has_voted(Network.peer_id())
end

StartGameView._set_loading_overlay_enabled = function (self, enabled, message)
	local loading_widgets = self._loading_widgets
	local loading_text_widget = loading_widgets.text
	local loading_bg_widget = loading_widgets.background
	local alpha = enabled and 255 or 0

	loading_bg_widget.style.color[1] = alpha
	loading_text_widget.style.text.text_color[1] = alpha
	loading_text_widget.content.text = message or ""
	self._draw_loading = enabled
end

StartGameView.number_of_players = function (self)
	local player_manager = Managers.player

	return player_manager:num_human_players()
end

StartGameView.start_game = function (self, params)
	local mechanism_manager = Managers.mechanism

	mechanism_manager:request_vote(params)
	self:play_mechanism_sound("start_game_play_sound_event", "play_gui_lobby_button_play")
	self:close_menu()
end

StartGameView.cancel_matchmaking = function (self)
	local matchmaking_manager = Managers.matchmaking

	if matchmaking_manager:is_game_matchmaking() then
		matchmaking_manager:cancel_matchmaking()
	end
end
