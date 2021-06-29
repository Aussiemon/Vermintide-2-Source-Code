require("scripts/managers/unlock/unlock_clan")
require("scripts/managers/unlock/unlock_dlc")
require("scripts/managers/unlock/unlock_game")
require("scripts/managers/unlock/always_unlocked")
require("scripts/settings/unlock_settings")
require("scripts/ui/dlc_upsell/common_popup_settings")

UnlockManager = class(UnlockManager)

UnlockManager.init = function (self)
	self:_init_unlocks()

	if IS_WINDOWS then
		self._state = "handle_reminder_popup"
	else
		self._state = "query_unlocked"
	end

	self._query_unlocked_index = 0
	self._dlc_status_changed = nil
	self._update_unlocks = false
	self._popup_ids = {}
	self._xbox_dlc_package_names = {}
	self._excluded_dlcs = {}
	self._handled_reminders_popups = false

	if IS_XB1 then
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

UnlockManager.set_ingame_ui = function (self, ingame_ui)
	self._ingame_ui = ingame_ui
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
			local fallback_id = IS_PS4 and unlock_config.fallback_id
			local backend_reward_id = unlock_config.backend_reward_id
			local always_unlocked_game_app_ids = unlock_config.always_unlocked_game_app_ids
			local requires_restart = unlock_config.requires_restart
			local cosmetic = unlock_config.cosmetic
			local class = rawget(_G, class_name)
			local instance = class:new(unlock_name, id, backend_reward_id, always_unlocked_game_app_ids, cosmetic, fallback_id, requires_restart)
			unlocks[unlock_name] = instance
			unlocks_indexed[i][unlock_name] = instance
		end
	end

	self._unlocks = unlocks
	self._unlocks_indexed = unlocks_indexed
end

local POPUP_IDS_TO_REMOVE = {}

UnlockManager.update = function (self, dt)
	if IS_XB1 then
		if self._update_unlocks then
			self._dlc_status_changed = nil
			local status = XboxDLC.status()

			if status ~= XboxDLC.IDLE then
				self:_check_licenses()
				self:_reinitialize_backend_dlc()
			end

			if not table.is_empty(self._popup_ids) then
				self:_handle_popups()
			else
				self:_update_console_backend_unlocks()
			end
		end
	elseif IS_PS4 then
		if self._update_unlocks then
			self:_check_ps4_dlc_status()

			if not table.is_empty(self._popup_ids) then
				self:_handle_popups()
			else
				self:_update_console_backend_unlocks()
			end
		end
	elseif self._update_unlocks then
		if not table.is_empty(self._popup_ids) then
			self:_handle_popups()
		else
			self:_update_backend_unlocks()
		end
	end
end

UnlockManager._handle_popups = function (self)
	table.clear(POPUP_IDS_TO_REMOVE)

	for idx, popup_id in ipairs(self._popup_ids) do
		local result = Managers.popup:query_result(popup_id)

		if result then
			self:_handle_popup_results(result)

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
end

UnlockManager._handle_popup_results = function (self, result)
	if result == "restart_game" then
		if IS_WINDOWS then
			self._ingame_ui.restart_game = true
		else
			Managers.account:force_exit_to_title_screen()
		end
	end
end

UnlockManager._check_ps4_dlc_status = function (self)
	if self._state ~= "done" then
		return
	end

	if not PS4DLC.has_fetched_dlcs() then
		return
	end

	if not self._updating_ps4_entitlements then
		if PS4.entitlements_dirty() then
			print("************************************************")
			print("*************** DETECTED NEW DLC ***************")
			print("************************************************")
			PS4DLC.fetch_owned_dlcs()

			self._updating_ps4_entitlements = true
		end
	else
		local dlcs_interface = Managers.backend:get_interface("dlcs")

		if not dlcs_interface:updating_dlc_ownership() then
			local owned_dlcs = dlcs_interface:get_owned_dlcs()
			local platform_dlcs = dlcs_interface:get_platform_dlcs()

			for i = 1, #platform_dlcs, 1 do
				local unlock_name = platform_dlcs[i]

				if not table.find(owned_dlcs, unlock_name) then
					local unlock = self._unlocks[unlock_name]

					if unlock and unlock.update_license then
						unlock:update_license()
					end

					if unlock and unlock:unlocked() then
						print("New DLC Unlocked: ", unlock_name)
						self:_reinitialize_backend_dlc()
					end
				end
			end

			self._updating_ps4_entitlements = false
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

	local is_in_store = self._ingame_ui and self._ingame_ui:is_in_view_state("HeroViewStateStore")

	if new_licensed_dlc ~= "" then
		if Managers.state.event then
			Managers.state.event:trigger("event_dlc_status_changed")
		end

		if not is_in_store then
			self._popup_ids[#self._popup_ids + 1] = Managers.popup:queue_popup(new_licensed_dlc, Localize("new_dlc_installed"), "ok", Localize("button_ok"))
		end

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
				self._state = "update_backend_dlcs"
				local peddler_interface = Managers.backend:get_interface("peddler")

				peddler_interface:refresh_chips()

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
							elseif not is_unlocked and reward_claimed and IS_PS4 then
								unlock_interface:remove_reward(reward_id, callback(self, "cb_reward_removed", unlock))
							end
						end
					end
				end
			end
		end
	elseif self._state == "update_backend_dlcs" then
		local dlcs_interface = Managers.backend:get_interface("dlcs")

		if not dlcs_interface:updating_dlc_ownership() then
			dlcs_interface:update_dlc_ownership()

			self._state = "waiting_for_backend_dlc_update"
		end
	elseif self._state == "waiting_for_backend_dlc_update" then
		local dlcs_interface = Managers.backend:get_interface("dlcs")

		if not dlcs_interface:updating_dlc_ownership() then
			self._state = "check_unseen_rewards"
		end
	elseif self._state == "check_unseen_rewards" then
		if self._ingame_ui and not self._ingame_ui:is_in_view_state("HeroViewStateStore") then
			self:_handle_unseen_rewards()

			self._state = "wait_for_rewards"
		end
	elseif self._state == "wait_for_rewards" then
		if self._ingame_ui and #self._reward_queue <= self._reward_queue_id then
			local gift_popup_ui = self._ingame_ui:get_hud_component("GiftPopupUI")

			if gift_popup_ui and not gift_popup_ui:has_presentation_data() then
				self._state = "evaluate_restart"
			end
		end
	elseif self._state == "evaluate_restart" and table.is_empty(self._popup_ids) then
		local requires_restart = false

		for name, unlock in pairs(self._unlocks) do
			if unlock:requires_restart() then
				requires_restart = true

				break
			end
		end

		if requires_restart then
			self._popup_ids[#self._popup_ids + 1] = Managers.popup:queue_popup(Localize("popup_console_dlc_needs_restart"), Localize("popup_notice_topic"), "restart_game", Localize("menu_return_to_title_screen"))
		end

		self._state = "done"
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

UnlockManager.get_installed_dlcs = function (self)
	local unlocks = self._unlocks
	local installed_unlocks = {}

	for unlock_name, unlock in pairs(unlocks) do
		if unlock:installed() then
			installed_unlocks[#installed_unlocks + 1] = unlock_name
		end
	end

	return installed_unlocks
end

UnlockManager.get_dlcs = function (self)
	return self._unlocks
end

UnlockManager.get_dlc = function (self, name)
	return self._unlocks[name]
end

UnlockManager.dlc_requires_restart = function (self, dlc_name)
	local unlock = self._unlocks[dlc_name]

	return unlock:requires_restart()
end

UnlockManager.is_dlc_unlocked = function (self, name)
	if script_data.all_dlcs_unlocked then
		return true
	end

	local unlock = self._unlocks[name]

	if not IS_WINDOWS and not IS_LINUX and not unlock then
		return false
	end

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock and unlock:unlocked()
end

UnlockManager.is_dlc_cosmetic = function (self, name)
	local unlock = self._unlocks[name]

	if not IS_WINDOWS and not IS_LINUX and not unlock then
		return true
	end

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock and unlock:is_cosmetic()
end

UnlockManager.dlc_exists = function (self, name)
	return self._unlocks[name] ~= nil
end

UnlockManager.dlc_id = function (self, name)
	local unlock = self._unlocks[name]

	fassert(unlock, "No such unlock %q", name or "nil")

	return unlock:id()
end

local function find_steam_store_page_url(dlc_name)
	for _, dlc_settings in pairs(StoreDlcSettings) do
		if dlc_settings.dlc_name == dlc_name then
			return dlc_settings.store_page_url
		end
	end

	return nil
end

UnlockManager.open_dlc_page = function (self, dlc_name)
	if IS_WINDOWS and HAS_STEAM then
		local url = find_steam_store_page_url(dlc_name)

		if url then
			Steam.open_url(url)
		end
	elseif IS_XB1 then
		local product_id = UnlockSettings[1].unlocks[dlc_name].id
		local user_id = Managers.account:user_id()

		XboxLive.show_product_details(user_id, product_id)
	elseif IS_PS4 then
		local user_id = Managers.account:user_id()
		local product_label = ProductLabels[dlc_name]

		Managers.system_dialog:open_commerce_dialog(NpCommerceDialog.MODE_PRODUCT, user_id, {
			product_label
		})
	end
end

UnlockManager.ps4_dlc_product_label = function (self, name)
	assert(IS_PS4, "Only call this function on a PS4")

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

UnlockManager._update_backend_unlocks = function (self)
	if self._state == "handle_reminder_popup" then
		if SaveData.new_dlcs_unlocks and not self._handled_reminders_popups then
			for dlc_name, first_time in pairs(SaveData.new_dlcs_unlocks) do
				local popup_settings = CommonPopupSettings[dlc_name]

				if first_time then
					if popup_settings and popup_settings.popup_type == "reminder" then
						Managers.state.event:trigger("ui_show_popup", dlc_name, "reminder")

						self._handled_reminders_popups = true
					else
						SaveData.new_dlcs_unlocks[dlc_name] = false
					end
				end
			end
		end

		if not self:_has_new_dlc() then
			self._state = "query_unlocked"
		end
	elseif self._state == "query_unlocked" then
		local backend_manager = Managers.backend

		if backend_manager:interfaces_ready() then
			if not backend_manager:available() then
				self._state = "backend_not_available"

				return
			end

			if backend_manager:is_tutorial_backend() then
				return
			end

			if backend_manager:is_benchmark_backend() then
				return
			end

			if script_data["eac-untrusted"] then
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

			if HAS_STEAM then
				local dlcs_interface = Managers.backend:get_interface("dlcs")
				local owned_dlcs = dlcs_interface:get_owned_dlcs()
				local platform_dlcs = dlcs_interface:get_platform_dlcs()
				local new_dlc_installed = false

				for i = 1, #platform_dlcs, 1 do
					local unlock_name = platform_dlcs[i]

					if not self._excluded_dlcs[unlock_name] and not table.find(owned_dlcs, unlock_name) then
						local unlock = self._unlocks[unlock_name]
						local id = unlock and unlock:id()

						if id and Steam.is_installed(id) then
							printf("INSTALLED: %s", unlock_name)

							new_dlc_installed = true

							break
						end
					end
				end

				if new_dlc_installed then
					self._state = "update_backend_dlcs"

					return
				end

				self._state = (new_dlc_installed and "update_backend_dlcs") or "check_unseen_rewards"
			end
		end
	elseif self._state == "update_backend_dlcs" then
		local dlcs_interface = Managers.backend:get_interface("dlcs")

		if not dlcs_interface:updating_dlc_ownership() then
			dlcs_interface:update_dlc_ownership()

			self._state = "waiting_for_backend_dlc_update"
		end
	elseif self._state == "waiting_for_backend_dlc_update" then
		local dlcs_interface = Managers.backend:get_interface("dlcs")

		if not dlcs_interface:updating_dlc_ownership() then
			Managers.backend:get_interface("dlcs")._backend_mirror:request_characters()

			self._state = "waiting_for_backend_refresh"
		end
	elseif self._state == "waiting_for_backend_refresh" then
		if Managers.backend:get_interface("dlcs")._backend_mirror:ready() then
			self._state = "check_unseen_rewards"
		end
	elseif self._state == "check_unseen_rewards" then
		local is_in_store = false

		if self._ingame_ui then
			local current_view = self._ingame_ui.current_view

			if current_view == "hero_view" then
				local hero_view = self._ingame_ui.views.hero_view
				local current_state = hero_view:current_state()

				if current_state and current_state.NAME == "HeroViewStateStore" then
					is_in_store = true
				end
			end
		end

		if not is_in_store then
			self:_handle_unseen_rewards()

			self._state = "wait_for_rewards"
		end
	elseif self._state == "wait_for_rewards" then
		if self._ingame_ui and #self._reward_queue <= self._reward_queue_id then
			local gift_popup_ui = self._ingame_ui:get_hud_component("GiftPopupUI")

			if gift_popup_ui and not gift_popup_ui:has_presentation_data() then
				self._state = "evaluate_restart"
			end
		end
	elseif self._state == "evaluate_restart" and table.is_empty(self._popup_ids) then
		local requires_restart = false

		for name, unlock in pairs(self._unlocks) do
			if unlock:requires_restart() then
				requires_restart = true

				break
			end
		end

		if requires_restart then
			self._popup_ids[#self._popup_ids + 1] = Managers.popup:queue_popup(Localize("popup_console_dlc_needs_restart"), Localize("popup_notice_topic"), "restart_game", Localize("menu_return_to_title_screen"))
		end

		self._state = "query_unlocked"
	end
end

UnlockManager._handle_unseen_rewards = function (self)
	local backend_manager = Managers.backend
	local item_interface = backend_manager:get_interface("items")
	local unseen_rewards = item_interface:get_unseen_item_rewards()

	if unseen_rewards then
		for i = 1, #unseen_rewards, 1 do
			local reward = unseen_rewards[i]
			local item = nil

			if reward.item_type == "weapon_skin" then
				local item_id = reward.item_id
				local weapon_skin_data = WeaponSkins.skins[item_id]
				weapon_skin_data.item_type = "weapon_skin"
				local backend_id, _ = item_interface:get_weapon_skin_from_skin_key(item_id)
				item = {
					data = weapon_skin_data,
					backend_id = backend_id,
					key = item_id
				}
			elseif reward.reward_type == "keep_decoration_painting" then
				local painting_data = Paintings[reward.keep_decoration_name]
				item = {
					data = {
						item_type = "keep_decoration_painting",
						display_name = painting_data.display_name,
						description = painting_data.description,
						inventory_icon = painting_data.icon,
						rarity = painting_data.rarity
					},
					key = reward.keep_decoration_name
				}
			else
				item = item_interface:get_item_from_id(reward.backend_id)
			end

			if item then
				local item_data = item.data
				local display_name = item_data.display_name

				self:_add_reward({
					item
				}, display_name)
			end
		end
	end
end

UnlockManager.set_excluded_dlcs = function (self, dlcs_to_exclude)
	local excluded_dlcs = self._excluded_dlcs

	table.clear(excluded_dlcs)

	if not dlcs_to_exclude then
		return
	end

	for i = 1, #dlcs_to_exclude, 1 do
		local dlc = dlcs_to_exclude[i]
		excluded_dlcs[dlc] = true
	end
end

UnlockManager._has_new_dlc = function (self)
	if SaveData.new_dlcs_unlocks then
		for _, first_time in pairs(SaveData.new_dlcs_unlocks) do
			if first_time == true then
				return true
			end
		end
	end

	Managers.save:auto_save(SaveFileName, SaveData)

	return false
end

return
