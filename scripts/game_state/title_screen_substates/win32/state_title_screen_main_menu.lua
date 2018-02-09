StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"
local menu_functions = nil

if Development.parameter("honduras_demo") then
	menu_functions = {
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", DemoSettings.demo_level))
			Managers.music:trigger_event("hud_menu_start_game")

			return 
		end
	}
else
	menu_functions = {
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done"))
			Managers.music:trigger_event("hud_menu_start_game")

			return 
		end,
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "tutorial"))
			Managers.music:trigger_event("hud_menu_start_game")

			return 
		end,
		function (this)
			local input_manager = Managers.input

			input_manager.block_device_except_service(input_manager, "options_menu", "keyboard", 1)
			input_manager.block_device_except_service(input_manager, "options_menu", "mouse", 1)
			input_manager.block_device_except_service(input_manager, "options_menu", "gamepad", 1)
			this.activate_view(this, "options_view")
			Managers.music:trigger_event("play_hud_select")

			return 
		end,
		function (this)
			this.activate_view(this, "credits_view")
			Managers.music:trigger_event("play_hud_select")

			return 
		end,
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "ai_benchmark"))
			Managers.music:trigger_event("play_hud_select")

			return 
		end,
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "ai_benchmark_cycle"))
			Managers.music:trigger_event("play_hud_select")

			return 
		end,
		function (this)
			this._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "whitebox_combat"))
			Managers.music:trigger_event("play_hud_select")

			return 
		end
	}
end

StateTitleScreenMainMenu.on_enter = function (self, params)
	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start

	if Development.parameter("honduras_demo") then
		Wwise.set_state("menu_mute_ingame_sounds", "false")
	end

	self._setup_sound()
	self._init_menu_views(self)
	self.parent:show_menu(true)
	Managers.transition:hide_loading_icon()

	return 
end
StateTitleScreenMainMenu._setup_sound = function (self)
	local master_bus_volume = Application.user_setting("master_bus_volume") or 90
	local music_bus_volume = Application.user_setting("music_bus_volume") or 90
	local music_world = Managers.world:world("music_world")
	local wwise_world = Managers.world:wwise_world(music_world)

	WwiseWorld.set_global_parameter(wwise_world, "master_bus_volume", master_bus_volume)
	Managers.music:set_master_volume(master_bus_volume)
	Managers.music:set_music_volume(music_bus_volume)

	return 
end
StateTitleScreenMainMenu.cb_camera_animation_complete = function (self)
	ShowCursorStack.push()
	self._title_start_ui:activate_career_ui(true)

	return 
end
StateTitleScreenMainMenu.cb_camera_animation_complete_back = function (self)
	self._new_state = StateTitleScreenMain

	return 
end
StateTitleScreenMainMenu._init_menu_views = function (self)
	local ui_renderer = self._title_start_ui:get_ui_renderer()
	local view_context = {
		ui_renderer = ui_renderer,
		input_manager = Managers.input,
		world_manager = Managers.world
	}

	if Development.parameter("honduras_demo") then
		self._title_start_ui:animate_to_camera(DemoSettings.camera_end_position, nil, callback(self, "cb_camera_animation_complete"))

		self._views = {}
	else
		self._views = {
			credits_view = CreditsView:new(view_context),
			options_view = OptionsView:new(view_context)
		}
	end

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()

			return 
		end
	end

	return 
end
StateTitleScreenMainMenu.update = function (self, dt, t)
	local active_view = self._active_view

	if active_view then
		Profiler.start(active_view)
		self._views[active_view]:update(dt, t)
		Profiler.stop(active_view)
	else
		local input_service = Managers.input:get_service("main_menu")

		if self._auto_start then
			menu_functions[1](self)

			return 
		end

		local title_start_ui = self._title_start_ui

		title_start_ui.update(title_start_ui, dt, t)

		local current_menu_index = title_start_ui.current_menu_index(title_start_ui)
		local active_menu_selection = title_start_ui.active_menu_selection(title_start_ui)

		if active_menu_selection and current_menu_index and input_service.get(input_service, "start") then
			menu_functions[current_menu_index](self)
		end

		if Development.parameter("honduras_demo") and self._title_start_ui:should_start() and not self._input_disabled then
			local profile_name, career_index = self._title_start_ui:selected_profile()
			self._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", DemoSettings.demo_level, profile_name))
			Managers.music:trigger_event("hud_menu_start_game")
		end

		if input_service.get(input_service, "back") or Managers.time:get_demo_transition() then
			self.parent:show_menu(false)

			if Development.parameter("honduras_demo") and not self._title_start_ui:in_transition() then
				self._title_start_ui:animate_to_camera(DemoSettings.starting_camera_name, nil, callback(self, "cb_camera_animation_complete_back"))
				self._title_start_ui:activate_career_ui(false)
			end
		end
	end

	return self._new_state
end
StateTitleScreenMainMenu.on_exit = function (self)
	for k, view in pairs(self._views) do
		if view.destroy then
			view.destroy(view)
		end
	end

	self._views = nil

	ShowCursorStack.pop()

	return 
end
StateTitleScreenMainMenu.cb_fade_in_done = function (self, level_key, profile_name)
	self.parent.state = StateLoading
	self.parent.parent.loading_context.restart_network = true
	self.parent.parent.loading_context.level_key = level_key

	if level_key == "tutorial" then
		Managers.backend:make_tutorial()

		self.parent.parent.loading_context.wanted_profile_index = 4
	elseif Development.parameter("honduras_demo") then
		self.parent.parent.loading_context.wanted_profile_index = (profile_name and FindProfileIndex(profile_name)) or DemoSettings.wanted_profile_index
		GameSettingsDevelopment.disable_free_flight = DemoSettings.disable_free_flight
		GameSettingsDevelopment.disable_intro_trailer = DemoSettings.disable_intro_trailer
	end

	return 
end
StateTitleScreenMainMenu.activate_view = function (self, new_view)
	self._active_view = new_view
	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		views[new_view]:on_enter()
	end

	return 
end
StateTitleScreenMainMenu.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil
	local input_manager = Managers.input

	input_manager.block_device_except_service(input_manager, "main_menu", "gamepad", 1)

	return 
end

return 
