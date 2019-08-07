require("scripts/managers/unlock/unlock_clan")
require("scripts/managers/unlock/unlock_dlc")
require("scripts/managers/unlock/unlock_game")
require("scripts/managers/unlock/always_unlocked")
require("scripts/settings/unlock_settings")

UnlockManager = class(UnlockManager)

UnlockManager.init = function (self)
	self:_init_unlocks()

	self._state = "query_unlocked"
	self._query_unlocked_index = 0
	self._dlc_status_changed = nil
	self._update_unlocks = false
	self._popup_ids = {}
	self._xbox_dlc_package_names = {}

	if PLATFORM == "xb1" then
		self._unlocks_ready = false
		self._licensed_packages = XboxDLC.licensed_packages() or {}

		for _, dlc in ipairs(self._licensed_packages) do
			local display_name = XboxDLC.display_name(dlc) or " "
			display_name = string.gsub(display_name, "%c", "")
			self._xbox_dlc_package_names[dlc] = display_name
		end
	end

	self._reward_queue = {}
	self._reward_queue_id = 0
end

UnlockManager.enable_update_unlocks = function (self, enable)
	self._update_unlocks = enable
end

UnlockManager._init_unlocks = function (self)
	local unlocks = {}
	local unlocks_indexed = {}

	for i, settings in ipairs(UnlockSettings) do
		unlocks_indexed[i] = {}

		for unlock_name, unlock_config in pairs(settings.unlocks) do
			local class_name = unlock_config.class
			local id = unlock_config.id
			local backend_reward_id = unlock_config.backend_reward_id
			local always_unlocked_game_app_ids = unlock_config.always_unlocked_game_app_ids
			local class = rawget(_G, class_name)
			local instance = class:new(unlock_name, id, backend_reward_id, always_unlocked_game_app_ids)
			unlocks[unlock_name] = instance
			unlocks_indexed[i][unlock_name] = instance
		end
	end

	self._unlocks = unlocks
	self._unlocks_indexed = unlocks_indexed
end

local POPUP_IDS_TO_REMOVE = {}

UnlockManager.update = function (self, dt)
	if PLATFORM == "xb1" then
		self._dlc_status_changed = nil
		local status = XboxDLC.status()

		if status ~= XboxDLC.IDLE then
			self:_check_licenses()
			self:_reinitialize_backend_dlc()
		end

		if not table.is_empty(self._popup_ids) then
			table.clear(POPUP_IDS_TO_REMOVE)

			for idx, popup_id in ipairs(self._popup_ids) do
				local result = Managers.popup:query_result(popup_id)

				if result then
					POPUP_IDS_TO_REMOVE[#POPUP_IDS_TO_REMOVE + 1] = idx
				end
			end

			if not table.is_empty(POPUP_IDS_TO_REMOVE) then
				local num_popups = #POPUP_IDS_TO_REMOVE

				for i = num_popups, 1, -1 do
					local idx = POPUP_IDS_TO_REMOVE[i]

					table.remove(self._popup_ids, idx)
				end
			end
		elseif self._update_unlocks then
			self:_update_console_backend_unlocks()
		end
	elseif PLATFORM == "ps4" and self._update_unlocks then
		self:_update_console_backend_unlocks()
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
			local display_name = XboxDLC.display_name(dlc) or " "
			display_name = string.gsub(display_name, "%c", "")
			new_licensed_dlc = new_licensed_dlc .. display_name .. "\n"
			self._xbox_dlc_package_names[dlc] = display_name
		end
	end

	for _, dlc in ipairs(self._licensed_packages) do
		if not table.find(licensed_packages, dlc) then
			local display_name = self._xbox_dlc_package_names[dlc] or " "
			removed_dlc_licenses = removed_dlc_licenses .. display_name .. "\n"
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

		self._popup_ids[#self._popup_ids + 1] = Managers.popup:queue_popup(new_licensed_dlc, Localize("new_dlc_installed"), "ok", Localize("button_ok"))
		self._dlc_status_changed = true
	elseif removed_dlc_licenses ~= "" then
		if Managers.state.event then
			Managers.state.event:trigger("event_dlc_status_changed")
		end

		self._popup_ids[#self._popup_ids + 1] = Managers.popup:queue_popup(removed_dlc_licenses, Localize("dlc_license_terminated"), "ok", Localize("button_ok"))
		self._dlc_status_changed = true
	end
end

UnlockManager.dlc_status_changed = function (self)
	return self._dlc_status_changed
end

UnlockManager._update_console_backend_unlocks = function (self)
	if self._state == "query_unlocked" then
		local backend_manager = Managers.backend

		if backend_manager:profiles_loaded() then
			if not backend_manager:available() then
				self._state = "backend_not_available"

				return
			end

			if backend_manager:is_tutorial_backend() then
				return
			end

			if not self._unlocks_ready then
				local all_ready = true

				for name, instance in pairs(self._unlocks) do
					if not instance:ready() then
						all_ready = false

						break
					end
				end

				if all_ready then
					self._unlocks_ready = true

					print("[UnlockManager] All unlocks ready")
				else
					return
				end
			end

			local index = self._query_unlocked_index + 1

			if index > #self._unlocks_indexed then
				self._state = "done"

				return
			end

			self._query_unlocked_index = index
			local settings = UnlockSettings[index]
			local interface_name = settings.interface

			if interface_name then
				local unlocks = self._unlocks_indexed[index]
				local unlock_interface = Managers.backend:get_interface(interface_name)

				for _, unlock in pairs(unlocks) do
					local reward_id = unlock:backend_reward_id()

					if reward_id then
						if unlock:has_error() then
							unlock:remove_backend_reward_id()
						else
							local reward_claimed = unlock_interface:reward_claimed(reward_id)
							local is_unlocked = unlock:unlocked()

							if is_unlocked and not reward_claimed then
								unlock_interface:claim_reward(reward_id, callback(self, "cb_reward_claimed", unlock))
							elseif not is_unlocked and reward_claimed and PLATFORM == "ps4" then
								unlock_interface:remove_reward(reward_id, callback(self, "cb_reward_removed", unlock))
							end
						end
					end
				end
			end
		end
	end
end

UnlockManager.cb_reward_claimed = function (self, unlock, success, rewarded_items, presentation_text)
	if not success then
		unlock:remove_backend_reward_id()
	elseif rewarded_items and presentation_text then
		self:_add_reward(rewarded_items, presentation_text)
	end
end

UnlockManager.cb_reward_removed = function (self, unlock, success)
	if not success then
		unlock:remove_backend_reward_id()
	end
end

UnlockManager._add_reward = function (self, items, presentation_text)
	self._reward_queue[#self._reward_queue + 1] = {
		items = items,
		presentation_text = presentation_text
	}
end

UnlockManager.poll_rewards = function (self)
	if #self._reward_queue <= self._reward_queue_id then
		return
	end

	self._reward_queue_id = self._reward_queue_id + 1
	local data = self._reward_queue[self._reward_queue_id]

	return data
end

UnlockManager.get_unlocked_dlcs = function (self)
	local unlocks = self._unlocks
	local unlocked_unlocks = {}

	for unlock_name, unlock in pairs(unlocks) do
		if unlock:unlocked() then
			unlocked_unlocks[#unlocked_unlocks + 1] = unlock_name
		end
	end

	return unlocked_unlocks
end

UnlockManager.is_dlc_unlocked = function (self, name)
	local unlock = self._unlocks[name]

	if PLATFORM ~= "win32" and not unlock then
		return false
	end

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock and unlock:unlocked()
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

UnlockManager.debug_add_console_dlc_reward = function (self, reward_id)
	local unlock, index = nil

	for i, unlocks in ipairs(self._unlocks_indexed) do
		for _, u in pairs(unlocks) do
			local backend_reward_id = u:backend_reward_id()

			if backend_reward_id and backend_reward_id == reward_id then
				unlock = u
				index = i

				break
			end
		end
	end

	fassert(unlock, "No unlock with reward_id", reward_id)

	local settings = UnlockSettings[index]
	local interface_name = settings.interface
	local unlock_interface = Managers.backend:get_interface(interface_name)

	local function claim_reward_cb(success, rewarded_items, presentation_text)
		if not success then
			print("Failed adding reward")
		elseif rewarded_items and presentation_text then
			print("Reward added")
			self:_add_reward(rewarded_items, presentation_text)

			self._state = "query_unlocked"
		end
	end

	unlock_interface:claim_reward(reward_id, claim_reward_cb)

	self._state = "claiming_reward"
end

UnlockManager.debug_remove_console_dlc_reward = function (self, reward_id)
	local unlock, index = nil

	for i, unlocks in ipairs(self._unlocks_indexed) do
		for _, u in pairs(unlocks) do
			local backend_reward_id = u:backend_reward_id()

			if backend_reward_id and backend_reward_id == reward_id then
				unlock = u
				index = i

				break
			end
		end
	end

	fassert(unlock, "No unlock with reward_id", reward_id)

	local settings = UnlockSettings[index]
	local interface_name = settings.interface
	local unlock_interface = Managers.backend:get_interface(interface_name)

	local function remove_reward_cb(success)
		if not success then
			print("Failed removing reward")
		else
			print("Reward removed")

			self._state = "query_unlocked"
		end
	end

	unlock_interface:remove_reward(reward_id, remove_reward_cb)

	self._state = "removing_reward"
end

return
