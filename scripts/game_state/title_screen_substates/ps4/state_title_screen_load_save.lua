-- chunkname: @scripts/game_state/title_screen_substates/ps4/state_title_screen_load_save.lua

StateTitleScreenLoadSave = class(StateTitleScreenLoadSave)
StateTitleScreenLoadSave.NAME = "StateTitleScreenLoadSave"

StateTitleScreenLoadSave.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenLoadSave")

	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._state = "fetch_dlcs"
	self._network_event_meta_table = {}

	self._network_event_meta_table.__index = function (event_table, event_key)
		return function ()
			Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)
		end
	end

	Managers.transition:show_loading_icon(false)

	if not Managers.account:user_id() then
		self:_close_menu()
	end

	if Managers.backend then
		Managers.backend:reset()
	end

	self:_setup_input()
end

StateTitleScreenLoadSave._setup_input = function (self)
	local input_manager = Managers.input

	self.input_manager = input_manager
end

StateTitleScreenLoadSave.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	title_start_ui:update(dt, t)
	self:_update_network(dt, t)

	if not Managers.account:user_detached() then
		if self._state == "fetch_dlcs" then
			title_start_ui:set_information_text(Localize("loading_checking_downloadable_content"))
			self:_fetch_dlcs()
		elseif self._state == "update_fetch_dlcs" then
			self:_update_fetch_dlcs()
		elseif self._state == "load_save" then
			self:_load_save()
			title_start_ui:set_information_text(Localize("loading_loading_settings"))
		elseif self._state == "check_popup" then
			self:_check_popup()
		elseif self._state == "create_save" then
			self:_create_save()
		elseif self._state == "delete_save" then
			self:_delete_save()
			title_start_ui:set_information_text(Localize("loading_deleting_settings"))
		end
	elseif self._popup_id then
		self:_check_popup()
	end

	return self:_next_state()
end

StateTitleScreenLoadSave._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end
end

StateTitleScreenLoadSave._fetch_dlcs = function (self)
	if not PS4DLC.is_initialized() then
		PS4DLC.initialize()
	end

	PS4DLC.fetch_owned_dlcs()

	self._state = "update_fetch_dlcs"
end

StateTitleScreenLoadSave._update_fetch_dlcs = function (self)
	if PS4DLC.has_fetched_dlcs() then
		if StateTitleScreenLoadSave.DELETE_SAVE then
			self._state = "delete_save"
			StateTitleScreenLoadSave.DELETE_SAVE = nil
		else
			self._state = "load_save"
		end
	end
end

StateTitleScreenLoadSave._load_save = function (self)
	self._state = "waiting_for_load"

	Managers.save:auto_load(SaveFileName, callback(self, "cb_load_done"))
end

StateTitleScreenLoadSave.cb_load_done = function (self, result)
	print("######################## DATA LOADED ########################")

	if result.error and result.error ~= "NOT_FOUND" then
		if result.error == "BROKEN" then
			self._state = "check_popup"
			self._popup_id = Managers.popup:queue_popup(Localize("popup_load_error_consoles"), Localize("popup_load_error_header"), "retry_load", Localize("menu_reload"), "reset_save", Localize("menu_reset"))
		elseif result.sce_error_code then
			self:_show_error_dialog(result.sce_error_code)
		else
			self:_close_menu()
		end
	else
		local data = result.data

		if result.error == "NOT_FOUND" then
			SaveData = table.clone(DefaultSaveData)

			populate_save_data(SaveData)
			self:_do_save()
		else
			populate_save_data(data)

			if data.machine_id == nil then
				self:_do_save()
			else
				self._new_state = StateTitleScreenMainMenu
				self._state = "none"
			end
		end
	end
end

StateTitleScreenLoadSave._check_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "retry_load" then
		self._state = "load_save"
	elseif result == "reset_save" then
		self._state = "delete_save"
	elseif result == "save_error" then
		self:_close_menu()

		self._state = "none"
	elseif result == "delete_save_error" then
		self:_close_menu()

		self._state = "none"
	elseif result then
		fassert(false, "[StateTitleScreenLoadSave] The popup result doesn't exist (%s)", result)
	end

	if result then
		self._popup_id = nil
	end
end

StateTitleScreenLoadSave._create_save = function (self)
	SaveData = table.clone(DefaultSaveData)

	self:_do_save()
end

StateTitleScreenLoadSave._do_save = function (self)
	ensure_user_id_in_save_data(SaveData)
	Managers.save:auto_save(SaveFileName, SaveData, callback(self, "cb_save_done"))

	self._state = "waiting_for_save"
end

StateTitleScreenLoadSave.cb_save_done = function (self, result)
	print("######################## DATA SAVED ########################")

	if result.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_save_failed"), Localize("popup_save_failed_header"), "save_error", Localize("menu_ok"))
		self._state = "check_popup"
	elseif result.sce_error_code then
		self:_show_error_dialog(result.sce_error_code)
	else
		populate_save_data(SaveData)

		self._new_state = StateTitleScreenMainMenu
		self._state = "none"
	end
end

StateTitleScreenLoadSave._delete_save = function (self)
	self._state = "waiting_for_delete"

	Managers.save:delete_save(SaveFileName, callback(self, "cb_delete_done"))
end

StateTitleScreenLoadSave.cb_delete_done = function (self, result)
	print("######################## SAVE DELETED ########################")

	if result.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_delete_save_failed"), Localize("popup_delete_save_failed_header"), "delete_save_error", Localize("menu_ok"))
		self._state = "check_popup"
	elseif result.sce_error_code then
		self:_show_error_dialog(result.sce_error_code)
	else
		self._state = "create_save"
	end
end

StateTitleScreenLoadSave._show_error_dialog = function (self, error_code)
	self._state = "waiting_for_error_dialog"

	Managers.system_dialog:open_error_dialog(error_code, callback(self, "cb_error_dialog_done"))
end

StateTitleScreenLoadSave.cb_error_dialog_done = function (self)
	self:_close_menu()
end

StateTitleScreenLoadSave._close_menu = function (self)
	self.parent:show_menu(false)
	self._title_start_ui:set_start_pressed(false)

	self._new_state = StateTitleScreenMain
	self._state = "none"

	Managers.transition:hide_loading_icon()
end

StateTitleScreenLoadSave._next_state = function (self)
	if not Managers.popup:has_popup() and not self._popup_id then
		if script_data.honduras_demo and not self._title_start_ui:is_ready() then
			return
		end

		return self._new_state
	end
end

StateTitleScreenLoadSave.on_exit = function (self)
	self._title_start_ui:set_information_text("")

	self._popup_id = nil
end
