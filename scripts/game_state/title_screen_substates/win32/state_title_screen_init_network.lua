require("scripts/game_state/state_loading")

StateTitleScreenInitNetwork = class(StateTitleScreenInitNetwork)
StateTitleScreenInitNetwork.NAME = "StateTitleScreenInitNetwork"

StateTitleScreenInitNetwork.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenInitNetwork")

	self._params = params
	self._title_start_ui = params.ui
	self._save_data_loaded = false
	local loading_context = self.parent.parent.loading_context
	local loading_view = loading_context.loading_view

	if loading_view then
		loading_view:destroy()

		loading_context.loading_view = nil
	end

	self:_load_save_data()
	Managers.transition:show_loading_icon(false)
end

StateTitleScreenInitNetwork._load_save_data = function (self)
	print("[StateTitleScreenInitNetwork] SaveFileName", SaveFileName)
	Managers.save:auto_load(SaveFileName, callback(self, "cb_save_data_loaded"))
end

StateTitleScreenInitNetwork.cb_save_data_loaded = function (self, info)
	if info.error then
		Application.warning("Load error %q", info.error)
	else
		populate_save_data(info.data)
	end

	self._save_data_loaded = true
	GameSettingsDevelopment.trunk_path = Development.parameter("trunk_path")
	self.parent.parent.loading_context.restart_network = true
end

StateTitleScreenInitNetwork.update = function (self, dt, t)
	if self._title_start_ui then
		self._title_start_ui:update(dt, t)
	end

	if not Managers.backend:is_disconnected() then
		Managers.backend:update(dt)
	end

	if self._popup_id then
		self:_handle_popup()

		return
	end

	local connected_to_steam = self:_connected_to_steam()

	if not connected_to_steam then
		self:create_popup("failure_start_no_steam")

		return
	end

	local backend_signin_initated = self.backend_signin_initated
	local backend_manager = Managers.backend

	if not backend_signin_initated and not backend_manager:signed_in() and self._save_data_loaded then
		backend_manager:signin()

		self.backend_signin_initated = true
	end

	return self:_next_state()
end

StateTitleScreenInitNetwork._connected_to_steam = function (self)
	if Development.parameter("use_lan_backend") then
		return true
	end

	local connected_to_network = true

	if PLATFORM == "win32" and rawget(_G, "Steam") then
		connected_to_network = Steam.connected()
	end

	return connected_to_network
end

StateTitleScreenInitNetwork._next_state = function (self)
	local eac_initialized = EAC.is_initialized()
	local eac_init_error, eac_error = EAC.initialization_error()
	local ready_to_exit = Managers.backend:profiles_loaded() and not Managers.backend:is_waiting_for_user_input() and eac_initialized

	if ready_to_exit then
		if eac_init_error then
			self:_create_eac_error_popup(eac_error)

			return
		end

		if GameSettingsDevelopment.skip_start_screen then
			return StateTitleScreenLoadSave
		else
			if script_data.honduras_demo and not self._title_start_ui:is_ready() then
				return
			end

			return StateTitleScreenMainMenu
		end
	end
end

StateTitleScreenInitNetwork.on_exit = function (self, application_shutdown)
	return
end

StateTitleScreenInitNetwork.create_popup = function (self, error)
	assert(error, "[StateTitleScreenInitNetwork] No error was passed to popup handler")
	assert(self._popup_id == nil, "Tried to show popup even though we already had one.")

	local header = Localize("popup_steam_error_header")
	local localized_error = Localize(error)
	self._popup_id = Managers.popup:queue_popup(localized_error, header, "retry", Localize("button_retry"), "quit", Localize("menu_quit"))
end

StateTitleScreenInitNetwork._create_eac_error_popup = function (self, localized_error)
	assert(localized_error, "[StateTitleScreenInitNetwork] No error was passed to popup handler")
	assert(self._popup_id == nil, "Tried to show popup even though we already had one.")

	local header = Localize("popup_eac_error_header")
	self._popup_id = Managers.popup:queue_popup(localized_error, header, "quit", Localize("menu_quit"))
end

StateTitleScreenInitNetwork._handle_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "retry" then
		self._popup_id = nil
	elseif result == "quit" then
		Boot.quit_game = true
		self._popup_id = nil
	elseif result then
		print(string.format("[StateTitleScreenInitNetwork] No such result handled (%s)", result))
	end
end

return
