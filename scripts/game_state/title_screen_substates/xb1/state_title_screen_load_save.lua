StateTitleScreenLoadSave = class(StateTitleScreenLoadSave)
StateTitleScreenLoadSave.NAME = "StateTitleScreenLoadSave"
StateTitleScreenLoadSave.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenLoadSave")

	self._params = params
	self._world = params.world
	self._viewport = params.viewport
	self._title_start_ui = params.ui
	self._state = "get_user_profile"
	self._network_event_meta_table = {
		__index = function (event_table, event_key)
			return function ()
				Application.warning("Got RPC %s during forced network update when exiting StateTitleScreenMain", event_key)

				return 
			end
		end
	}

	Managers.transition:show_loading_icon(false)

	if not Managers.account:user_id() then
		self._close_menu(self)
	end

	self._setup_input(self)

	return 
end
StateTitleScreenLoadSave._setup_input = function (self)
	local input_manager = Managers.input
	self.input_manager = input_manager

	return 
end
StateTitleScreenLoadSave.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	title_start_ui.update(title_start_ui, dt, t)
	self._update_network(self, dt, t)

	if not Managers.account:user_detached() then
		if self._state == "get_user_profile" then
			self._get_user_profile(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_acquiring_user_profile"))
		elseif self._state == "check_guest" then
			self._check_guest(self)
		elseif self._state == "enumerate_dlc" then
			title_start_ui.set_information_text(title_start_ui, Localize("loading_checking_downloadable_content"))
			self._enumerate_dlc(self)
		elseif self._state == "check_multiplayer_privileges" then
			self._check_prviileges(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_checking_privileges"))
		elseif self._state == "acquire_storage" then
			self._get_storage_space(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_acquiring_storage"))
		elseif self._state == "query_storage_spaces" then
			self._query_storage_spaces(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_checking_save_data"))
		elseif self._state == "load_save" then
			self._load_save(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_loading_settings"))
		elseif self._state == "check_popup" then
			self._check_popup(self)
		elseif self._state == "create_save" then
			self._create_save(self)
		elseif self._state == "signin_to_backend" then
			self._signin(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_signing_in"))
		elseif self._state == "check_invite" then
			self._check_invite(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_checking_invites"))
		elseif self._state == "signin_to_xsts" then
			title_start_ui.set_information_text(title_start_ui, Localize("loading_acquiring_xsts_token"))
			self._signin_to_xsts(self)
		elseif self._state == "delete_save" then
			self._delete_save(self)
			title_start_ui.set_information_text(title_start_ui, Localize("loading_deleting_settings"))
		elseif self._state == "complete" then
			self._close_menu(self)
			Managers.account:close_storage()
			title_start_ui.set_information_text(title_start_ui, Localize("loading_returning_to_title"))

			self._state = "none"
		end
	elseif self._popup_id then
		self._check_popup(self)
	end

	return self._next_state(self)
end
StateTitleScreenLoadSave._update_network = function (self, dt, t)
	if rawget(_G, "LobbyInternal") and LobbyInternal.network_initialized() then
		Network.update(dt, setmetatable({}, self._network_event_meta_table))
	end

	return 
end
StateTitleScreenLoadSave._signin = function (self)
	Managers.unlock = UnlockManager:new()
	Managers.backend = BackendManagerPlayFab:new("ScriptBackendPlayFab", "PlayFabMirror", "DataServerQueue")

	Managers.backend:signin(self._xsts_result)

	self._xsts_result = nil
	self._state = "check_invite"

	return 
end
StateTitleScreenLoadSave._check_invite = function (self)
	if Managers.play_go:installed() then
		if Managers.invite:has_invitation() then
			Managers.transition:show_loading_icon(false)
			Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", StateLoading))

			self._state = "none"
		else
			self._new_state = StateTitleScreenMainMenu
			self._state = "none"
		end
	elseif Managers.invite:has_invitation() then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._new_state = StateTitleScreenMainMenu
		self._state = "none"
	end

	return 
end
StateTitleScreenLoadSave._check_guest = function (self)
	if Managers.account:is_guest() then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_is_guest"), Localize("popup_is_guest_header"), "verified_guest", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._state = "enumerate_dlc"
	end

	return 
end
StateTitleScreenLoadSave.cb_fade_in_done = function (self)
	self.parent.state = StateLoading
	local loading_context = self.parent.parent.loading_context
	loading_context.restart_network = true
	loading_context.gamma_correct = not SaveData.gamma_corrected
	loading_context.play_trailer = false
	loading_context.first_time = false

	return 
end
StateTitleScreenLoadSave._signin_to_xsts = function (self)
	local token = UserXSTS.has(Managers.account:user_id())
	local script_xsts_token = ScriptXSTSToken:new(token)

	Managers.token:register_token(script_xsts_token, callback(self, "cb_xsts_token_received"))

	self._state = "waiting_for_xsts"

	return 
end
StateTitleScreenLoadSave.cb_xsts_token_received = function (self, data)
	print("[StateTitleScreenLoadSave] cb_xsts_token_received")

	local title_start_ui = self._title_start_ui

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_xsts_signin_failed"), Localize("popup_xsts_signin_failed_header"), "xsts_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		print("[StateTitleScreenLoadSave] Successfully acquired an XSTS token")
		print("XSTS OK!" .. tostring(data.result))

		self._xsts_result = data.result
		self._state = "signin_to_backend"
	end

	return 
end
StateTitleScreenLoadSave._get_user_profile = function (self)
	self._state = "waiting_for_profile"
	local user_id = Managers.account:user_id()
	local xuid = Managers.account:xbox_user_id()

	Managers.account:get_user_profiles(user_id, {
		xuid
	}, callback(self, "cb_profile_acquired"))

	return 
end
StateTitleScreenLoadSave.cb_profile_acquired = function (self, data)
	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_xboxlive_profile_acquire_error"), Localize("popup_xboxlive_profile_acquire_error_header"), "profile_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._title_start_ui:set_user_name(Managers.account:my_gamertag())

		self._state = "check_guest"
	end

	return 
end
StateTitleScreenLoadSave._enumerate_dlc = function (self)
	XboxDLC.initialize()
	XboxDLC.enumerate_dlc()

	self._state = "check_multiplayer_privileges"

	return 
end
StateTitleScreenLoadSave._check_prviileges = function (self)
	if Managers.account:is_privileges_initialized() then
		if Managers.account:has_privilege_error() then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_privilege_error"), Localize("popup_privilege_error_header"), "privilege_error", Localize("menu_ok"))
			self._state = "check_popup"
		elseif Managers.account:has_privilege(UserPrivilege.MULTIPLAYER_SESSIONS) then
			self._state = "acquire_storage"
		else
			self._popup_id = Managers.popup:queue_popup(Localize("popup_xbox_live_gold_error"), Localize("popup_xbox_live_gold_error_header"), "privilege_error", Localize("menu_ok"))
			self._state = "check_popup"
		end
	end

	return 
end
StateTitleScreenLoadSave._get_storage_space = function (self)
	self._state = "waiting_for_storage"

	Managers.account:get_storage_space(callback(self, "cb_storage_acquired"))

	return 
end
StateTitleScreenLoadSave.cb_storage_acquired = function (self, data)
	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_storage_could_not_be_acquired"), Localize("popup_storage_could_not_be_acquired_header"), "storage_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._state = "query_storage_spaces"
	end

	return 
end
StateTitleScreenLoadSave._query_storage_spaces = function (self)
	self._state = "waiting_for_query"

	Managers.save:query_storage_spaces(callback(self, "cb_query_done"))

	return 
end
StateTitleScreenLoadSave.cb_query_done = function (self, data)
	print("######################## QUERY ########################")

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_query_storage_error"), Localize("popup_query_storage_error_header"), "query_storage_error", Localize("menu_ok"))
		self._state = "check_popup"
	elseif self._save_data_contains(self, data, "save_container") then
		if StateTitleScreenLoadSave.DELETE_SAVE then
			self._state = "delete_save"
			StateTitleScreenLoadSave.DELETE_SAVE = false
		else
			self._state = "load_save"
		end
	else
		self._state = "create_save"
	end

	if not GameSettingsDevelopment.disable_intro_trailer then
		self.parent.parent.loading_context.first_time = true
	end

	return 
end
StateTitleScreenLoadSave._save_data_contains = function (self, containers, name)
	for _, container in ipairs(containers) do
		if container.name == name and 0 < container.total_size then
			return true
		end
	end

	return 
end
StateTitleScreenLoadSave._load_save = function (self)
	self._state = "waiting_for_load"

	Managers.save:auto_load(SaveFileName, callback(self, "cb_load_done"))

	return 
end
StateTitleScreenLoadSave.cb_load_done = function (self, data)
	print("######################## DATA LOADED ########################")

	if data.error then
		self._state = "check_popup"
		self._popup_id = Managers.popup:queue_popup(Localize("popup_load_error"), Localize("popup_load_error_header"), "retry_load", Localize("menu_reload"), "reset_save", Localize("menu_reset"))
	elseif Managers.account:is_guest() then
		self._state = "signin_to_backend"
		SaveData = table.clone(DefaultSaveData)

		populate_save_data(SaveData)
	else
		populate_save_data(data)

		local input_service = self.input_manager:get_service("main_menu")

		if input_service.get(input_service, "show_support_info") then
			self._show_support_info(self)
		else
			self._state = "signin_to_xsts"
		end
	end

	return 
end
StateTitleScreenLoadSave._show_support_info = function (self)
	local support_id = BackendUtils.format_profile_hash(SaveData.backend_profile_hash, 14, 2, " ")
	self._popup_id = Managers.popup:queue_popup(support_id, "Support ID", "support_info_done", Localize("button_back_to_title"))
	self._state = "check_popup"

	return 
end
StateTitleScreenLoadSave._check_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "retry_load" then
		self._state = "load_save"
	elseif result == "reset_save" then
		self._state = "delete_save"
	elseif result == "privilege_error" then
		self._close_menu(self)

		self._state = "none"
	elseif result == "profile_error" then
		self._close_menu(self)

		self._state = "none"
	elseif result == "storage_error" then
		self._close_menu(self)

		self._state = "none"
	elseif result == "query_storage_error" then
		self._close_menu(self)
		Managers.account:close_storage()

		self._state = "none"
	elseif result == "save_error" then
		self._close_menu(self)
		Managers.account:close_storage()

		self._state = "none"
	elseif result == "delete_save_error" then
		self._close_menu(self)
		Managers.account:close_storage()

		self._state = "none"
	elseif result == "xsts_error" then
		self._close_menu(self)
		Managers.account:close_storage()

		self._state = "none"
	elseif result == "not_installed" then
		Managers.invite:clear_invites()

		self._new_state = StateTitleScreenMainMenu
		self._state = "none"
	elseif result == "verified_guest" then
		self._state = "enumerate_dlc"
	elseif result == "support_info_done" then
		self._state = "signin_to_xsts"
	elseif result then
		fassert(false, "[StateTitleScreenLoadSave] The popup result doesn't exist (%s)", result)
	end

	if result then
		self._popup_id = nil
	end

	return 
end
StateTitleScreenLoadSave._create_save = function (self)
	self._state = "waiting_for_save"
	SaveData = table.clone(DefaultSaveData)

	Managers.save:auto_save(SaveFileName, SaveData, callback(self, "cb_save_done"))

	return 
end
StateTitleScreenLoadSave.cb_save_done = function (self, data)
	print("######################## DATA SAVED ########################")

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_save_failed"), Localize("popup_save_failed_header"), "save_error", Localize("menu_ok"))
		self._state = "check_popup"
	elseif Managers.account:is_guest() then
		SaveData = table.clone(DefaultSaveData)

		populate_save_data(SaveData)

		self._state = "signin_to_backend"
	else
		populate_save_data(SaveData)

		self._state = "signin_to_xsts"
	end

	return 
end
StateTitleScreenLoadSave._delete_save = function (self)
	self._state = "waiting_for_delete"

	Managers.save:delete_save(SaveFileName, callback(self, "cb_delete_done"))

	return 
end
StateTitleScreenLoadSave.cb_delete_done = function (self, data)
	print("######################## SAVE DELETED ########################")

	if data.error then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_delete_save_failed"), Localize("popup_delete_save_failed_header"), "delete_save_error", Localize("menu_ok"))
		self._state = "check_popup"
	else
		self._state = "create_save"
	end

	return 
end
StateTitleScreenLoadSave._close_menu = function (self)
	self.parent:show_menu(false)
	self._title_start_ui:set_start_pressed(false)

	self._new_state = StateTitleScreenMain
	self._state = "none"
	self._closing_menu = true

	Managers.transition:hide_loading_icon()

	return 
end
StateTitleScreenLoadSave._next_state = function (self)
	if not Managers.popup:has_popup() and not self._popup_id then
		if Managers.backend and Managers.backend:is_disconnected() then
			self._close_menu(self)
			Managers.account:close_storage()

			return self._new_state
		elseif Managers.backend and (Managers.backend:is_local() or Managers.backend:authenticated()) then
			return self._new_state
		elseif self._closing_menu then
			return self._new_state
		else
			return nil
		end
	end

	return 
end
StateTitleScreenLoadSave.on_exit = function (self)
	self._popup_id = nil

	return 
end

return 
