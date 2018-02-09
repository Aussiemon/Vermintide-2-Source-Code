StateTitleScreenMainMenu = class(StateTitleScreenMainMenu)
StateTitleScreenMainMenu.NAME = "StateTitleScreenMainMenu"
local menu_functions = {
	function (this)
		this._input_disabled = true

		Managers.transition:show_loading_icon(false)
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done"))
		Managers.music:trigger_event("hud_menu_start_game")
		this._fetch_restrictions(this)

		return 
	end,
	function (this)
		this._input_disabled = true

		Managers.transition:show_loading_icon(false)
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(this, "cb_fade_in_done", "tutorial"))
		Managers.music:trigger_event("hud_menu_start_game")
		this._fetch_restrictions(this)

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
local DO_RELOAD = true
StateTitleScreenMainMenu.on_enter = function (self, params)
	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._title_start_ui = params.ui
	self._auto_start = params.auto_start

	self._setup_sound()
	self._setup_input(self)
	self._init_menu_views(self)
	self.parent:show_menu(true)
	Managers.transition:hide_loading_icon()

	if params.skip_signin then
		self._title_start_ui:set_start_pressed(true)
	end

	self._is_installed = Managers.play_go:installed()

	if not self._is_installed then
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", false, "start_game_disabled_playgo")
	else
		self._title_start_ui:set_menu_item_enable_state_by_index("start_game", true)
	end

	local user_id = Managers.account:user_id()

	if not Managers.account:has_access("chat", user_id) then
		Managers.system_dialog:open_system_dialog(MsgDialog.SYSTEM_MSG_TRC_PSN_CHAT_RESTRICTION, user_id)
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
StateTitleScreenMainMenu.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	self._update_play_go(self, dt, t)

	if Managers.invite:has_invitation() and not self._handled_invite and not self._input_disabled then
		if self._is_installed then
			self._input_disabled = true

			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", nil, true))
			self._fetch_restrictions(self)
		else
			self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		end

		self._handled_invite = true
	end

	local active_view = self._active_view

	if active_view then
		Profiler.start(active_view)
		self._views[active_view]:update(dt, t)
		Profiler.stop(active_view)
		title_start_ui.update(title_start_ui, dt, t, BACKGROUND_ONLY)
	else
		local input_service = self.input_manager:get_service("main_menu")

		if self._auto_start and not self._auto_started then
			self._auto_started = true

			menu_functions[1](self)

			return 
		end

		title_start_ui.update(title_start_ui, dt, t)

		local current_menu_index = title_start_ui.current_menu_index(title_start_ui)
		local active_menu_selection = title_start_ui.active_menu_selection(title_start_ui)
		local has_popup = Managers.popup:has_popup()

		if active_menu_selection and not self._input_disabled and not has_popup then
			if current_menu_index and input_service.get(input_service, "start") then
				menu_functions[current_menu_index](self)
			elseif input_service.get(input_service, "back") then
				self.parent:show_menu(false)

				self._new_state = StateTitleScreenMain
			end
		end
	end

	self._update_start_game(self, dt, t)

	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result == "not_installed" then
			Managers.invite:clear_invites()

			self._popup_id = nil
		elseif result == "ok" then
			self._popup_id = nil
		elseif result then
			fassert(false, "[StateTitleScreenMainMenu] The popup result doesn't exist (%s)", result)
		end

		return 
	end

	return self._next_state(self)
end
StateTitleScreenMainMenu._fetch_restrictions = function (self)
	Managers.account:refetch_restriction_access(nil, {
		"network_availability",
		"playstation_plus"
	})

	self._should_evaluate_network_availability = true
	self._should_evaluate_playstation_plus = true

	return 
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
StateTitleScreenMainMenu._update_start_game = function (self, dt, t)
	if self._should_evaluate_network_availability and not Managers.account:restriction_access_fetched("network_availability") then
		return 
	end

	if self._should_evaluate_network_availability then
		local error_code = Managers.account:has_error("network_availability")
		local has_access = Managers.account:has_access("network_availability")

		if error_code then
			self._show_error_dialog = true

			Managers.system_dialog:open_error_dialog(error_code, callback(self, "cb_error_message_done"))
		elseif not has_access then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_ps4_network_not_available"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
		else
			self._network_available = true
		end

		if not self._network_available then
			self._should_evaluate_playstation_plus = false
			self._has_evaluated_playstation_plus = true
		end

		self._should_evaluate_network_availability = false
		self._has_evaluated_network_availability = true
	end

	if self._should_evaluate_playstation_plus and not Managers.account:restriction_access_fetched("playstation_plus") then
		return 
	end

	if self._should_evaluate_playstation_plus then
		local error_code = Managers.account:has_error("playstation_plus")
		local has_access = Managers.account:has_access("playstation_plus")

		if error_code then
			self._show_error_dialog = true

			Managers.system_dialog:open_error_dialog(error_code, callback(self, "cb_error_message_done"))
		elseif not has_access then
			self._setup_playstation_plus_dialog(self)
		else
			self._playstation_plus_available = true
		end

		if not self._playstation_plus_dialog then
			self._has_evaluated_playstation_plus = true
		end

		self._should_evaluate_playstation_plus = false
	end

	if self._playstation_plus_dialog then
		local status = NpCommerceDialog.update()

		if status == NpCommerceDialog.INITIALIZED then
			NpCommerceDialog.open(Managers.account:user_id(), NpCheck.REALTIME_MULTIPLAY)
		elseif status == NpCommerceDialog.FINISHED then
			local action, result = NpCommerceDialog.result()

			if result == true then
				Managers.account:refetch_restriction_access(nil, {
					"playstation_plus"
				})

				self._playstation_plus_available = true
			end

			self._has_evaluated_playstation_plus = true

			NpCommerceDialog.terminate()

			self._playstation_plus_dialog = nil
		end
	end

	start_game = self._fade_in_done and self._has_evaluated_network_availability and self._has_evaluated_playstation_plus

	if start_game then
		if self._network_available and self._playstation_plus_available then
			self._start_game(self, self._level_key)
		else
			self.parent:show_menu(false)

			self._new_state = StateTitleScreenMain

			Managers.transition:force_fade_out()
			Managers.transition:hide_loading_icon()
		end
	end

	return 
end
StateTitleScreenMainMenu._setup_playstation_plus_dialog = function (self)
	NpCommerceDialog.initialize()

	self._playstation_plus_dialog = true

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
StateTitleScreenMainMenu._start_game = function (self, level_key)
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
		loading_context.play_trailer = false
		loading_context.show_profile_on_startup = true
	end

	return 
end
StateTitleScreenMainMenu.cb_fade_in_done = function (self, level_key)
	self._fade_in_done = true
	self._level_key = level_key

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
StateTitleScreenMainMenu._next_state = function (self)
	if self._show_error_dialog then
		return 
	end

	if not Managers.popup:has_popup() then
		return self._new_state
	end

	return 
end
StateTitleScreenMainMenu.cb_error_message_done = function (self, result)
	self._show_error_dialog = nil

	return 
end

return 
