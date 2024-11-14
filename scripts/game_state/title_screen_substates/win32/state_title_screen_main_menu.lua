-- chunkname: @scripts/game_state/title_screen_substates/win32/state_title_screen_main_menu.lua

local settings = local_require("scripts/game_state/title_screen_substates/win32/state_title_screen_main_menu_settings")

StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"

StateTitleScreenMainMenu.on_enter = function (self, params)
	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start

	if script_data.honduras_demo then
		Wwise.set_state("menu_mute_ingame_sounds", "false")
	end

	self._setup_sound()
	self:_init_menu_views()
	self:_setup_menu_options()
	self.parent:show_menu(true)
	Managers.transition:hide_loading_icon()
end

StateTitleScreenMainMenu._check_prologue_status = function (self)
	local success = true
	local has_completed_tutorial = Managers.backend:get_user_data("has_completed_tutorial") or SaveData.has_completed_tutorial or false

	if has_completed_tutorial or script_data.disable_tutorial_at_start then
		success = false
	else
		self._input_disabled = true

		Managers.transition:show_loading_icon(false)
		self._title_start_ui:disable_input(true)

		self._new_state = StateTitleScreenLoadSave
	end

	return success
end

StateTitleScreenMainMenu._start_game = function (self, level_key)
	local is_tutorial = level_key == "prologue"

	self.parent.parent.loading_context.restart_network = true
	self.parent.parent.loading_context.level_key = level_key
	self.parent.parent.loading_context.play_trailer = is_tutorial or Application.user_setting("play_intro_cinematic")
	self.parent.parent.loading_context.force_run_tutorial = is_tutorial
	self.parent.parent.loading_context.first_time = is_tutorial

	Managers.level_transition_handler:set_next_level(level_key)
	Managers.level_transition_handler:promote_next_level_data()

	local current_mechanism_name

	if Managers.mechanism then
		current_mechanism_name = Managers.mechanism:current_mechanism_name()

		Managers.mechanism:destroy()
	end

	Managers.mechanism = GameMechanismManager:new(current_mechanism_name)
	self._input_disabled = true

	Managers.transition:show_loading_icon(false)
	self._title_start_ui:disable_input(true)
	self._title_start_ui:view_activated(true)

	self._new_state = StateTitleScreenLoadSave
end

StateTitleScreenMainMenu._quit_game = function (self)
	self._popup_id = Managers.popup:queue_popup(Localize("quit_game_popup_text"), Localize("popup_exit_game_topic"), "end_game", Localize("popup_choice_yes"), "cancel", Localize("popup_choice_no"))
end

StateTitleScreenMainMenu._initiate_quit_game = function (self)
	self._input_disabled = true

	self._title_start_ui:disable_input(true)
	Managers.transition:fade_in(GameSettings.transition_fade_in_speed, callback(self, "cb_quit_game"))
end

StateTitleScreenMainMenu.cb_quit_game = function (self)
	Boot.quit_game = true
end

StateTitleScreenMainMenu._setup_menu_options = function (self)
	local menu_layout = settings.create_menu_layout(self)

	self._title_start_ui:create_menu_options(menu_layout)
end

StateTitleScreenMainMenu._setup_sound = function (self)
	local master_bus_volume = Application.user_setting("master_bus_volume") or 90
	local music_bus_volume = Application.user_setting("music_bus_volume") or 90
	local wwise_world

	if GLOBAL_MUSIC_WORLD then
		wwise_world = MUSIC_WWISE_WORLD
	else
		local music_world = Managers.world:world("music_world")

		wwise_world = Managers.world:wwise_world(music_world)
	end

	WwiseWorld.set_global_parameter(wwise_world, "master_bus_volume", master_bus_volume)
	Managers.music:set_master_volume(master_bus_volume)
	Managers.music:set_music_volume(music_bus_volume)
end

StateTitleScreenMainMenu.cb_camera_animation_complete = function (self)
	ShowCursorStack.push()
	self._title_start_ui:activate_career_ui(true)
end

StateTitleScreenMainMenu.cb_camera_animation_complete_back = function (self)
	self._new_state = StateTitleScreenMain
end

StateTitleScreenMainMenu._init_menu_views = function (self)
	local ui_renderer = self._title_start_ui:get_ui_renderer()
	local view_context = {
		in_title_screen = true,
		ui_renderer = ui_renderer,
		ui_top_renderer = ui_renderer,
		input_manager = Managers.input,
		world_manager = Managers.world,
	}

	self._views = {
		credits_view = CreditsView:new(view_context),
		options_view = OptionsView:new(view_context),
		cinematics_view = CinematicsView:new(view_context),
	}

	ShowCursorStack.push()

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()
		end
	end
end

StateTitleScreenMainMenu.update = function (self, dt, t)
	local active_view = self._active_view

	if self._auto_start and (Development.parameter("auto_host_level") or Development.parameter("auto_join") or Development.parameter("deus_auto_host") or Development.parameter("vs_auto_search") or Development.parameter("weave_name")) then
		self._input_disabled = true

		Managers.transition:show_loading_icon(false)
		self._title_start_ui:disable_input(true)

		self._new_state = StateTitleScreenLoadSave
		self._auto_start = nil
	elseif self._auto_start and Development.parameter("skip_splash") then
		local index = 1

		self._title_start_ui:_activate_menu_widget(index)

		self._auto_start = nil
	elseif active_view then
		self._views[active_view]:update(dt, t)
	end

	local title_start_ui = self._title_start_ui

	title_start_ui:update(dt, t)

	if not self._input_disabled then
		local input_service = Managers.input:get_service("main_menu")

		if input_service:get("back") then
			self:_close_menu()
		end
	end

	self:_handle_popups()

	return self._new_state
end

StateTitleScreenMainMenu._handle_popups = function (self)
	if not self._popup_id then
		return
	end

	local result = Managers.popup:query_result(self._popup_id)

	if result then
		self._popup_id = nil

		self:_handle_popup_result(result)
	end
end

StateTitleScreenMainMenu._handle_popup_result = function (self, result)
	if result == "end_game" then
		self:_initiate_quit_game()
	end
end

StateTitleScreenMainMenu._close_menu = function (self)
	self.parent:show_menu(false)
	self._title_start_ui:set_start_pressed(false)
	self._title_start_ui:disable_input(false)

	self._closing_menu = true

	Managers.transition:hide_loading_icon()
	Managers.transition:force_fade_in()
	Managers.transition:fade_out(GameSettings.transition_fade_in_speed * 2)

	self._new_state = StateTitleScreenMain
end

StateTitleScreenMainMenu.on_exit = function (self)
	for k, view in pairs(self._views) do
		if view.destroy then
			view:destroy()
		end
	end

	self._views = nil

	ShowCursorStack.pop()
end

StateTitleScreenMainMenu.cb_fade_in_done = function (self, level_key, profile_name)
	self._new_state = StateTitleScreenLoadSave
	self.parent.parent.loading_context.restart_network = true
	self.parent.parent.loading_context.level_key = level_key
	self.parent.parent.loading_context.play_trailer = level_key == "prologue" or Application.user_setting("play_intro_cinematic")

	if level_key == "tutorial" then
		Managers.backend:make_tutorial()

		self.parent.parent.loading_context.wanted_profile_index = 4
	elseif script_data.honduras_demo then
		self.parent.parent.loading_context.wanted_profile_index = profile_name and FindProfileIndex(profile_name) or DemoSettings.wanted_profile_index
		GameSettingsDevelopment.disable_free_flight = DemoSettings.disable_free_flight
		GameSettingsDevelopment.disable_intro_trailer = DemoSettings.disable_intro_trailer
	end
end

StateTitleScreenMainMenu._activate_view = function (self, new_view)
	self._active_view = new_view

	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		views[new_view]:on_enter()

		self._input_disabled = true

		self._title_start_ui:disable_input(true)
		self._title_start_ui:view_activated(true)
	end
end

StateTitleScreenMainMenu.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()

		self._input_disabled = false

		self._title_start_ui:disable_input(false)
		self._title_start_ui:view_activated(false)
	end

	self._active_view = nil

	local input_manager = Managers.input

	input_manager:block_device_except_service("main_menu", "gamepad", 1)
end
