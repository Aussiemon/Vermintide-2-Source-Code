require("scripts/network/lobby_psn")

StateTitleScreenLoadSave = class(StateTitleScreenLoadSave)
StateTitleScreenLoadSave.NAME = "StateTitleScreenLoadSave"

StateTitleScreenLoadSave.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateTitleScreenLoadSave")

	self._params = params
	self._world = self._params.world
	self._viewport = self._params.viewport
	self._title_start_ui = params.ui
	self._state = "check_availability"

	self._title_start_ui:set_information_text(Localize("loading_checking_network_availability"))
	Managers.transition:show_loading_icon(false)
	Managers.account:add_restriction_user(Managers.account:user_id())
	Managers.account:fetch_user_data()

	local online_id = Managers.account:online_id()

	self._title_start_ui:set_user_name(online_id or "FAILED TO RETRIEVE ONLINE ID")
	self:_setup_input()
end

StateTitleScreenLoadSave._setup_input = function (self)
	local input_manager = Managers.input
	self.input_manager = input_manager
end

StateTitleScreenLoadSave.update = function (self, dt, t)
	local title_start_ui = self._title_start_ui

	title_start_ui:update(dt, t)

	if self._error_popup then
		local result = Managers.popup:query_result(self._error_popup)

		if result == "ok" then
			Managers.popup:cancel_popup(self._error_popup)

			self._error_popup = nil
			self._state = "none"
			self._new_state = StateTitleScreenMain

			Managers.transition:hide_loading_icon()
		end
	elseif self._show_error_dialog then
	elseif self._state == "check_availability" then
		if Managers.account:restriction_access_fetched("network_availability") then
			local error_code = Managers.account:has_error("network_availability")
			local has_access = Managers.account:has_access("network_availability")

			if error_code then
				self:_show_error(error_code)
			elseif not has_access then
				self._error_popup = Managers.popup:queue_popup(Localize("popup_ps4_network_not_available"), Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
			else
				self._state = "playstation_plus_access"

				self._title_start_ui:set_information_text(Localize("loading_checking_privileges"))
			end
		end
	elseif self._state == "playstation_plus_access" then
		if Managers.account:restriction_access_fetched("playstation_plus") then
			local error_code = Managers.account:has_error("playstation_plus")
			local has_access = Managers.account:has_access("playstation_plus")

			if error_code then
				self:_show_error(error_code)
			elseif not has_access then
				self:_setup_playstation_plus_dialog()
			else
				self._state = "parental_control_access"

				self._title_start_ui:set_information_text(Localize("loading_verifying_parental_control"))
			end
		end
	elseif self._state == "playstation_plus_dialog" then
		local status = NpCommerceDialog.update()

		if status == NpCommerceDialog.INITIALIZED then
			NpCommerceDialog.open(Managers.account:user_id(), NpCheck.REALTIME_MULTIPLAY)
		elseif status == NpCommerceDialog.FINISHED then
			local action, result = NpCommerceDialog.result()

			if result == true then
				Managers.account:refetch_restriction_access(nil, {
					"playstation_plus"
				})

				self._state = "parental_control_access"

				self._title_start_ui:set_information_text(Localize("loading_verifying_parental_control"))
			else
				Managers.transition:hide_loading_icon()
				title_start_ui:set_start_pressed(false)

				self._state = "none"
				self._new_state = StateTitleScreenMain
			end

			NpCommerceDialog.terminate()
		end
	elseif self._state == "parental_control_access" then
		if Managers.account:restriction_access_fetched("chat") then
			local error_code = Managers.account:has_error("chat")

			if error_code then
				self:_show_error(error_code)
			else
				self:_load_save()
			end
		end
	elseif self._state == "check_popup" then
		self:_check_popup()
	elseif self._state == "load_save_error_popup" then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			self:_handle_popup_result(result)
			Managers.popup:cancel_popup(self._popup_id)

			self._popup_id = nil
		end
	elseif self._state == "fetching_dlcs" then
		if PS4DLC.has_fetched_dlcs() then
			self._state = "signin_to_backend"
		end
	elseif self._state == "signin_to_backend" then
		self._title_start_ui:set_information_text(Localize("loading_signing_in"))
		self:_signin()
	elseif self._state == "signing_in" and Managers.backend:profiles_loaded() then
		self:_signed_in_to_backend(true)
	end

	if Managers.backend then
		if Managers.backend:is_disconnected() then
			self._state = "none"
			self._new_state = StateTitleScreenMain

			Managers.transition:hide_loading_icon()
		else
			Managers.backend:update(dt)
		end
	end

	return self:_next_state()
end

StateTitleScreenLoadSave._show_error = function (self, error_code)
	self._show_error_dialog = true
	local cb = callback(self, "cb_show_error_done")

	Managers.system_dialog:open_error_dialog(error_code, cb)
end

StateTitleScreenLoadSave.cb_show_error_done = function (self)
	self._show_error_dialog = nil
	self._state = "none"
	self._new_state = StateTitleScreenMain

	Managers.transition:hide_loading_icon()
end

StateTitleScreenLoadSave._check_popup = function (self)
	local result = Managers.popup:query_result(self._popup_id)

	if result == "not_installed" then
		Managers.invite:clear_invites()

		self._new_state = StateTitleScreenMainMenu
		self._state = "none"
	elseif result == "support_info_done" then
		self:_fetch_dlcs()
	elseif result then
		fassert(false, "[StateTitleScreenLoadSave] The popup result doesn't exist (%s)", result)
	end

	if result then
		self._popup_id = nil
	end
end

StateTitleScreenLoadSave._setup_playstation_plus_dialog = function (self)
	NpCommerceDialog.initialize()

	self._state = "playstation_plus_dialog"

	self._title_start_ui:set_information_text(Localize("loading_wating_for_dialog"))
end

StateTitleScreenLoadSave._load_save = function (self)
	Managers.save:auto_load(SaveFileName, callback(self, "cb_load_done"))

	self._state = "waiting_for_load"

	self._title_start_ui:set_information_text(Localize("loading_loading_settings"))
end

StateTitleScreenLoadSave._fetch_dlcs = function (self)
	if not PS4DLC.is_initialized() then
		PS4DLC.initialize()
	end

	PS4DLC.fetch_owned_dlcs()

	self._state = "fetching_dlcs"

	self._title_start_ui:set_information_text(Localize("loading_checking_downloadable_content"))
end

StateTitleScreenLoadSave._signin = function (self)
	require("scripts/managers/backend/backend_manager")

	Managers.unlock = UnlockManager:new()
	Managers.backend = BackendManager:new()

	Managers.backend:signin()

	self._state = "signing_in"

	self._title_start_ui:set_information_text(Localize("loading_signing_in"))
end

StateTitleScreenLoadSave._signed_in_to_backend = function (self, result)
	if result then
		if Managers.play_go:installed() then
			if Managers.invite:has_invitation() then
				self._state = "none"

				Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done"))
				self._title_start_ui:set_information_text(Localize("matchmaking_status_joining_game"))
			else
				self._state = "none"
				self._new_state = StateTitleScreenMainMenu
			end
		elseif Managers.invite:has_invitation() then
			self._popup_id = Managers.popup:queue_popup(Localize("popup_invite_not_installed"), Localize("popup_invite_not_installed_header"), "not_installed", Localize("menu_ok"))
			self._state = "check_popup"
		else
			self._state = "none"
			self._new_state = StateTitleScreenMainMenu
		end
	end
end

StateTitleScreenLoadSave.cb_fade_in_done = function (self)
	self.parent.state = StateLoading
	self.parent.parent.loading_context.restart_network = true
end

StateTitleScreenLoadSave._handle_popup_result = function (self, result)
	if result == "delete" then
		Managers.save:delete_save(SaveFileName, callback(self, "cb_delete_save"))

		self._state = "deleting_save"

		self._title_start_ui:set_information_text(Localize("loading_deleting_settings"))
	elseif result == "back_to_title" then
		self._state = "none"
		self._new_state = StateTitleScreenMain

		Managers.transition:hide_loading_icon()
	else
		ferror("We don't support this result %q", result)
	end
end

StateTitleScreenLoadSave.cb_load_done = function (self, result)
	if result.error and result.error ~= "NOT_FOUND" then
		printf("[StateTitleScreenLoadSave] Error when loading save data: %q", result.error)

		if result.error == "BROKEN" then
			self._popup_id = Managers.popup:queue_popup(Localize("ps4_save_error_broken"), Localize("popup_error_topic"), "delete", Localize("button_delete_save"), "back_to_title", Localize("button_back_to_title"))
			self._state = "load_save_error_popup"
		elseif result.sce_error_code then
			self:_show_error(result.sce_error_code)
		else
			Application.warning("[StateTitleScreenLoadSave] LOAD ERROR, NO ERROR CODE FOUND!")

			self._state = "none"
			self._new_state = StateTitleScreenMain

			Managers.transition:hide_loading_icon()
		end
	else
		print("[StateTitleScreenLoadSave] Save data loaded")
		populate_save_data(result.data or SaveData)

		local input_service = self.input_manager:get_service("main_menu")

		if input_service:get("show_support_info") then
			self:_show_support_info()
		else
			self:_fetch_dlcs()
		end

		if Development.parameter("network_log_spew") then
			Network.log(Network.SPEW)
		elseif Development.parameter("network_log_messages") then
			Network.log(Network.MESSAGES)
		end
	end
end

StateTitleScreenLoadSave._show_support_info = function (self)
	local support_id = BackendUtils.format_profile_hash(SaveData.backend_profile_hash, 14, 2, " ")
	self._popup_id = Managers.popup:queue_popup(support_id, "Support ID", "support_info_done", Localize("button_back_to_title"))
	self._state = "check_popup"
end

StateTitleScreenLoadSave.cb_delete_save = function (self, result)
	if result.error then
		Application.warning(string.format("[StateTitleScreenLoadSave] Error when overriding save data %q", result.error))
	end

	print("[StateTitleScreenLoadSave] Save override done")
	self:_load_save()
end

StateTitleScreenLoadSave._next_state = function (self)
	if not Managers.popup:has_popup() then
		return self._new_state
	end
end

StateTitleScreenLoadSave.on_exit = function (self)
	return
end

return
