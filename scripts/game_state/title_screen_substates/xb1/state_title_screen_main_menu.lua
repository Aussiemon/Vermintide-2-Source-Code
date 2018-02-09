StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"
local menu_functions = {
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

		input_manager.block_device_except_service(input_manager, "options_menu", "gamepad")
		this.activate_view(this, "options_view")

		return 
	end,
	function (this)
		this.activate_view(this, "credits_view")

		return 
	end,
	function (this)
		this._input_disabled = true

		Managers.transition:show_loading_icon(false)
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "ai_benchmark"))

		return 
	end,
	function (this)
		this._input_disabled = true

		Managers.transition:show_loading_icon(false)
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "ai_benchmark_cycle"))

		return 
	end,
	function (this)
		this._input_disabled = true

		Managers.transition:show_loading_icon(false)
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "whitebox_combat"))

		return 
	end
}
StateTitleScreenMainMenu.on_enter = function (self, params)
	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start

	self._setup_sound()
	self._setup_input(self)
	self._init_menu_views(self)
	self.parent:show_menu(true)

	if params.skip_signin then
		self._title_start_ui:set_start_pressed(true)
	end

	Managers.transition:hide_loading_icon()

	self._network_event_meta_table = {
		__index = function (event_table, event_key)
			return function ()
				Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)

				return 
			end
		end
	}
	self._is_installed = Managers.play_go:installed()

	if not self._is_installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", false, "start_game_disabled_playgo")
	else
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true)
	end

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
StateTitleScreenMainMenu._setup_input = function (self)
	local input_manager = Managers.input
	self.input_manager = input_manager

	return 
end
StateTitleScreenMainMenu._init_menu_views = function (self)
	local ui_renderer = self._title_start_ui:get_ui_renderer()
	local view_context = {
		ui_renderer = ui_renderer,
		input_manager = Managers.input,
		world_manager = Managers.world
	}
	self._views = {
		credits_view = CreditsView:new(view_context),
		options_view = OptionsView:new(view_context)
	}

	for name, view in pairs(self._views) do
		view.exit = function ()
			self:exit_current_view()

			return 
		end
	end

	return 
end
local BACKGROUND_ONLY = BACKGROUND_ONLY or true
StateTitleScreenMainMenu._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end

	return 
end
StateTitleScreenMainMenu.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	self._update_play_go(self, dt, t)
	self._update_network(self, dt, t)

	if self._auto_start then
		menu_functions[1](self)

		return 
	end

	local has_popup = Managers.popup:has_popup()
	local user_detached = Managers.account:user_detached()

	if Managers.invite:has_invitation() and not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
		if self._is_installed then
			self._input_disabled = true

			Managers.transition:show_loading_icon(false)

			self.parent.parent.loading_context.first_time = false

			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", nil, true))
		else
			self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		end
	end

	local active_view = self._active_view

	if active_view then
		Profiler.start(active_view)
		self._views[active_view]:update(dt, t)
		Profiler.stop(active_view)
		title_start_ui.update(title_start_ui, dt, t, BACKGROUND_ONLY)
	else
		local input_service = self.input_manager:get_service("main_menu")

		title_start_ui.update(title_start_ui, dt, t)

		local current_menu_index = title_start_ui.current_menu_index(title_start_ui)
		local active_menu_selection = title_start_ui.active_menu_selection(title_start_ui)
		local active_controller = Managers.account:active_controller()

		if active_menu_selection and not self._input_disabled and not has_popup and not user_detached and not self._popup_id then
			if current_menu_index and input_service.get(input_service, "start") then
				menu_functions[current_menu_index](self)
			elseif active_controller.pressed(active_controller.button_index("b")) then
				self.parent:show_menu(false)

				self._new_state = StateTitleScreenMain
			elseif active_controller.pressed(active_controller.button_index("x")) then
				local controller_id = tonumber(string.gsub(active_controller._name, "Pad", ""), 10)

				XboxLive.show_account_picker(controller_id)

				local error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()

				while error do
					XboxLive.show_account_picker(controller_id)

					error, device_id, user_id_from, user_id_to = XboxLive.show_account_picker_result()
				end

				if user_id_to == user_id_from and not user_id_to ~= AccountManager.SIGNED_OUT then
					return 
				elseif user_id_to ~= AccountManager.SIGNED_OUT then
					self._params.switch_user_auto_sign_in = true
				end

				self.parent:show_menu(false)
				self._title_start_ui:set_start_pressed(false)

				self._new_state = StateTitleScreenMain
			end
		end
	end

	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result == "not_installed" then
			Managers.invite:clear_invites()

			self._popup_id = nil
		elseif result then
			fassert(false, "[StateTitleScreenMainMenu] The popup result doesn't exist (%s)", result)
		end

		return 
	end

	if Managers.account:leaving_game() then
		if active_view then
			self.exit_current_view(self)
		end

		self.parent:show_menu(false)
		self._title_start_ui:set_start_pressed(false)
	end

	return self._new_state
end
StateTitleScreenMainMenu._update_play_go = function (self, dt, t)
	if self._is_installed then
		return 
	end

	local installed = Managers.play_go:installed()

	if installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true)

		self._is_installed = true
	end

	return 
end
StateTitleScreenMainMenu.on_exit = function (self)
	for k, view in pairs(self._views) do
		if view.destroy then
			view.destroy(view)
		end
	end

	self._views = nil

	return 
end
StateTitleScreenMainMenu.cb_fade_in_done = function (self, level_key, disable_trailer)
	self.parent.state = StateLoading
	local loading_context = self.parent.parent.loading_context
	loading_context.restart_network = true
	loading_context.level_key = level_key

	if level_key and loading_context.level_transition_handler then
		loading_context.level_transition_handler:set_next_level(level_key)
	end

	if level_key == "tutorial" then
		Managers.backend:start_tutorial()

		loading_context.wanted_profile_index = 4
		loading_context.gamma_correct = not SaveData.gamma_corrected
		loading_context.play_trailer = false
	elseif not level_key then
		loading_context.gamma_correct = not SaveData.gamma_corrected

		if not disable_trailer then
			loading_context.play_trailer = true
			loading_context.show_profile_on_startup = true
		else
			loading_context.show_profile_on_startup = false
		end
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

	input_manager.block_device_except_service(input_manager, "main_menu", "gamepad")

	return 
end

return 
