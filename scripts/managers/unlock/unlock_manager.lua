require("scripts/managers/unlock/unlock_clan")
require("scripts/managers/unlock/unlock_dlc")
require("scripts/managers/unlock/always_unlocked")
require("scripts/settings/unlock_settings")

UnlockManager = class(UnlockManager)

UnlockManager.init = function (self)
	self:_init_unlocks()

	self._state = "query_unlocked"
	self._query_unlocked_index = 0
	self._dlc_status_changed = nil

	if PLATFORM == "xb1" then
		self._licensed_packages = XboxDLC.licensed_packages()
	end

	self._award_queue = {}
	self._award_queue_id = 0
end

UnlockManager._init_unlocks = function (self)
	local unlocks = {}
	local unlocks_indexed = {}

	for i, settings in ipairs(UnlockSettings) do
		unlocks_indexed[i] = {}

		for unlock_name, unlock_config in pairs(settings.unlocks) do
			local class_name = unlock_config.class
			local id = unlock_config.id
			local backend_id = unlock_config.backend_id
			local class = rawget(_G, class_name)
			local instance = class:new(unlock_name, id, backend_id)
			unlocks[unlock_name] = instance
			unlocks_indexed[i][unlock_name] = instance
		end
	end

	self._unlocks = unlocks
	self._unlocks_indexed = unlocks_indexed
end

UnlockManager.update = function (self, dt)
	if PLATFORM == "xb1" then
		self._dlc_status_changed = nil
		local status = XboxDLC.status()

		if status ~= XboxDLC.IDLE then
			self:_check_licenses()
			self:_reinitialize_backend_dlc()
		end

		if self._popup_id then
			local result = Managers.popup:query_result(self._popup_id)

			if result then
				self._popup_id = nil

				if nil then
				end
			end
		end
	end
end

UnlockManager._reinitialize_backend_dlc = function (self)
	self._state = "query_unlocked"
	self._query_unlocked_index = 0
end

UnlockManager._check_licenses = function (self)
	Application.warning("[UnlockManager] Checking DLC licenses")

	local new_licensed_dlc = ""
	local removed_dlc_licenses = ""
	local licensed_packages = XboxDLC.licensed_packages()

	for _, dlc in ipairs(licensed_packages) do
		if not table.find(self._licensed_packages, dlc) then
			new_licensed_dlc = new_licensed_dlc .. XboxDLC.display_name(dlc) .. "\n"
		end
	end

	for _, dlc in ipairs(self._licensed_packages) do
		if not table.find(licensed_packages, dlc) then
			removed_dlc_licenses = removed_dlc_licenses .. XboxDLC.display_name(dlc) .. "\n"
		end
	end

	self._licensed_packages = licensed_packages

	for _, unlock in pairs(self._unlocks) do
		if unlock.update_license then
			unlock:update_license()
		end
	end

	if new_licensed_dlc ~= "" then
		if Managers.state.event then
			Managers.state.event:trigger("event_dlc_status_changed")
		end

		self._popup_id = Managers.popup:queue_popup(new_licensed_dlc, Localize("new_dlc_installed"), "ok", Localize("button_ok"))
		self._dlc_status_changed = true
	elseif removed_dlc_licenses ~= "" then
		if Managers.state.event then
			Managers.state.event:trigger("event_dlc_status_changed")
		end

		self._popup_id = Managers.popup:queue_popup(removed_dlc_licenses, Localize("dlc_license_terminated"), "ok", Localize("button_ok"))
		self._dlc_status_changed = true
	end
end

UnlockManager.dlc_status_changed = function (self)
	return self._dlc_status_changed
end

UnlockManager._update_backend_unlocks = function (self)
	if self._state == "poll_update_required_popup" then
		local result = Managers.popup:query_result(self._update_required_popup_id)

		if result then
			Application.quit()
		end
	elseif self._state == "query_unlocked" then
		local backend_manager = Managers.backend

		if backend_manager:profiles_loaded() then
			if not backend_manager:available() then
				self._state = "backend_not_available"

				return
			end

			if not self._startup_script_started then
				local queue = backend_manager:get_data_server_queue()

				queue:register_executor("script_startup", callback(self, "_executor_script_startup"))

				local startup_script = GameSettingsDevelopment.backend_settings.startup_script
				local backend_items = backend_manager:get_interface("items")
				local startup_script_params = {}

				if PLATFORM == "win32" then
					queue:register_executor("revision_check", callback(self, "_executor_revision_check"))

					local engine_revision = script_data.build_identifier

					if engine_revision then
						startup_script_params[#startup_script_params + 1] = "param_engine_revision"
						startup_script_params[#startup_script_params + 1] = engine_revision
					end

					local content_revision = script_data.settings.content_revision

					if content_revision then
						startup_script_params[#startup_script_params + 1] = "param_content_revision"
						startup_script_params[#startup_script_params + 1] = content_revision
					end
				end

				backend_items:data_server_script(startup_script, unpack(startup_script_params))

				self._startup_script_started = true
			end

			local index = self._query_unlocked_index + 1

			if index > #self._unlocks_indexed then
				self._state = "done"

				return
			end

			self._query_unlocked_index = index
			local settings = UnlockSettings[index]
			local unlock_script = settings.unlock_script

			if unlock_script then
				local profile_attribute = settings.profile_attribute
				local backend_profile_attributes = backend_manager:get_interface("profile_attributes")
				local profile_unlocked_string = backend_profile_attributes:get_string(profile_attribute)
				local profile_unlocked_table = {}

				if profile_unlocked_string then
					for id in string.gmatch(profile_unlocked_string, "([^,]+)") do
						profile_unlocked_table[id] = true
					end
				end

				local unlocks = self._unlocks_indexed[index]
				local new_unlocked = ""
				local removed_unlocked = ""
				local all_unlocked = ""

				for _, unlock in pairs(unlocks) do
					local id = unlock:backend_id()

					if id then
						if unlock:unlocked() then
							all_unlocked = string.format("%s%s,", all_unlocked, id)

							if not profile_unlocked_table[id] then
								new_unlocked = string.format("%s%s,", new_unlocked, id)
							end
						elseif profile_unlocked_table[id] then
							removed_unlocked = string.format("%s%s,", removed_unlocked, id)
						end
					end
				end

				local unlock_script_param = settings.unlock_script_param
				local remove_script_param = settings.remove_script_param

				if new_unlocked ~= "" or (remove_script_param and removed_unlocked ~= "") then
					local backend_items = backend_manager:get_interface("items")

					if remove_script_param then
						self._data_server_request = backend_items:data_server_script(unlock_script, unlock_script_param, new_unlocked, remove_script_param, removed_unlocked)
					else
						self._data_server_request = backend_items:data_server_script(unlock_script, unlock_script_param, new_unlocked)
					end

					self._data_server_request:disable_registered_commands()

					self._set_profile_attribute = {
						name = profile_attribute,
						value = all_unlocked
					}
					self._state = "generating"
				end
			end
		end
	elseif self._state == "generating" then
		local request = self._data_server_request

		if request:is_done() then
			if request:error_message() then
				print("[DlcManager] ERROR generating unlock loot:", request:error_message())

				self._state = "query_unlocked"
			else
				table.dump(request:items(), "dlc items")

				local attribute_name = self._set_profile_attribute.name
				local attribute_value = self._set_profile_attribute.value
				local backend_manager = Managers.backend
				local backend_profile_attributes = backend_manager:get_interface("profile_attributes")

				backend_profile_attributes:set_string(attribute_name, attribute_value)
				backend_manager:commit()

				self._set_profile_attribute = nil
				self._state = "query_unlocked"
				local parameters = request:parameters()
				local presentation_data_json = parameters.presentation_data

				if presentation_data_json then
					local presentation_data = cjson.decode(presentation_data_json)

					for _, popup_data in ipairs(presentation_data) do
						self:_add_startup_award(popup_data)
					end
				end
			end
		end
	elseif self._state == "backend_not_available" and Managers.backend:available() then
		self._state = "query_unlocked"
	end
end

UnlockManager._executor_revision_check = function (self, revision_check_data)
	local valid_engine = revision_check_data.valid_engine
	local valid_content = revision_check_data.valid_content

	if not valid_engine or not valid_content then
		self._update_required_popup_id = Managers.popup:queue_popup(Localize("new_version_available_on_steam"), Localize("update_required"), "quit", Localize("menu_quit"))
		self._state = "poll_update_required_popup"
	end
end

UnlockManager._executor_script_startup = function (self, script_startup_data)
	for _, data in ipairs(script_startup_data) do
		self:_add_startup_award(data)
	end

	local queue = Managers.backend:get_data_server_queue()

	queue:unregister_executor("script_startup")
end

UnlockManager._add_startup_award = function (self, data)
	self._award_queue[#self._award_queue + 1] = data
end

UnlockManager.poll_script_startup_data = function (self)
	if #self._award_queue <= self._award_queue_id then
		return
	end

	self._award_queue_id = self._award_queue_id + 1
	local data = self._award_queue[self._award_queue_id]

	if data.silent then
		return
	end

	return data
end

UnlockManager.is_dlc_unlocked = function (self, name)
	if PLATFORM == "xb1" then
		return true
	end

	local unlock = self._unlocks[name]

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock:unlocked()
end

UnlockManager.dlc_id = function (self, name)
	local unlock = self._unlocks[name]

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock:id()
end

UnlockManager.ps4_dlc_product_label = function (self, name)
	assert(PLATFORM == "ps4", "Only call this function on a PS4")

	local unlock = self._unlocks[name]

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock:product_label()
end

return
