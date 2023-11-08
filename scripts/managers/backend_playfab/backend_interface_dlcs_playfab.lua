local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceDLCsPlayfab = class(BackendInterfaceDLCsPlayfab)

BackendInterfaceDLCsPlayfab.init = function (self, backend_mirror)
	self.is_local = false
	self._backend_mirror = backend_mirror
	self._last_id = 0
	self._updating_dlc_ownership = false
	self._owned_dlcs = backend_mirror:get_owned_dlcs()
	self._platform_dlcs = backend_mirror:get_platform_dlcs()
end

BackendInterfaceDLCsPlayfab.ready = function (self)
	return true
end

BackendInterfaceDLCsPlayfab.update = function (self, dt)
	return
end

BackendInterfaceDLCsPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceDLCsPlayfab.update_dlc_ownership = function (self)
	local unlock_manager = Managers.unlock
	local installed_dlcs = unlock_manager:get_installed_dlcs()
	local json_string = cjson.encode(installed_dlcs)
	local request = {
		FunctionName = "updateDLCOwnership",
		FunctionParameter = {
			installed_dlcs = json_string
		}
	}
	local success_callback = callback(self, "_update_owned_dlcs_cb")
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, false)

	self._updating_dlc_ownership = true
end

BackendInterfaceDLCsPlayfab._update_owned_dlcs_cb = function (self, result)
	local function_result = result.FunctionResult
	local owned_dlcs = function_result.owned_dlcs
	local platform_dlcs = function_result.platform_dlcs
	local excluded_dlcs = function_result.excluded_dlcs
	local new_dlcs = function_result.new_dlcs
	local revoked_dlcs = function_result.revoked_dlcs
	self._owned_dlcs = owned_dlcs or {}
	self._platform_dlcs = platform_dlcs
	local unlock_manager = Managers.unlock

	unlock_manager:set_excluded_dlcs(excluded_dlcs, owned_dlcs)
	self._backend_mirror:set_owned_dlcs(owned_dlcs)
	self._backend_mirror:set_platform_dlcs(platform_dlcs)
	print("Finished Updating Owned DLCS")
	table.dump(self._owned_dlcs, nil, 2)
	self._backend_mirror:update_owned_dlcs(true)

	if revoked_dlcs and #revoked_dlcs > 0 then
		local unlocked_keep_decorations = function_result.unlocked_keep_decorations

		if unlocked_keep_decorations then
			self._backend_mirror:set_read_only_data("unlocked_keep_decorations", unlocked_keep_decorations, true)
		end

		local unlocked_cosmetics = function_result.unlocked_cosmetics

		if unlocked_cosmetics then
			self._backend_mirror:set_read_only_data("unlocked_cosmetics", unlocked_cosmetics, true)
		end

		local unlocked_weapon_skins = function_result.unlocked_weapon_skins

		if unlocked_weapon_skins then
			self._backend_mirror:set_read_only_data("unlocked_weapon_skins", unlocked_weapon_skins, true)
		end
	end

	if not script_data["eac-untrusted"] and (not new_dlcs or not revoked_dlcs or #new_dlcs > 0 or #revoked_dlcs > 0) then
		self:_execute_dlc_specific_logic()

		if HAS_STEAM then
			self._backend_mirror:handle_new_dlcs(new_dlcs)
		end
	else
		self._updating_dlc_ownership = false
	end
end

BackendInterfaceDLCsPlayfab._execute_dlc_specific_logic = function (self)
	local request = {
		FunctionName = "executeDLCLogic",
		FunctionParameter = {}
	}
	local success_callback = callback(self, "_execute_dlc_logic_cb")
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, true)
end

BackendInterfaceDLCsPlayfab._execute_dlc_logic_cb = function (self, result)
	local function_result = result.FunctionResult
	local new_rewards = function_result.item_grant_results
	local unseen_rewards = self._backend_mirror:get_user_data("unseen_rewards")
	unseen_rewards = unseen_rewards and cjson.decode(unseen_rewards) or {}

	for i = 1, #new_rewards do
		local item = new_rewards[i]
		local item_id = item.ItemId
		local item_type = item.ItemType

		if item_type == "keep_decoration_painting" then
			local reward = {
				reward_type = "keep_decoration_painting",
				rewarded_from = item.Data.rewarded_from,
				keep_decoration_name = item_id
			}
			unseen_rewards[#unseen_rewards + 1] = reward

			self._backend_mirror:add_keep_decoration(item_id)
		elseif CosmeticUtils.is_cosmetic_item(item_type) then
			local backend_id = self._backend_mirror:add_item(nil, {
				ItemId = item_id
			})

			if backend_id then
				local reward = {
					reward_type = item_type,
					backend_id = backend_id,
					rewarded_from = item.Data.rewarded_from,
					item_type = item_type,
					item_id = item_id
				}
				unseen_rewards[#unseen_rewards + 1] = reward
			end
		else
			local data = ItemMasterList[item_id]
			local custom_data = item.CustomData
			local rewarded_from = custom_data.rewarded_from

			if data.bundle then
				local bundled_currencies = data.bundle.BundledVirtualCurrencies

				for currency_type, currency_amount in pairs(bundled_currencies) do
					if rewarded_from then
						local reward = {
							reward_type = "currency",
							currency_type = currency_type,
							currency_amount = currency_amount,
							rewarded_from = rewarded_from
						}
						unseen_rewards[#unseen_rewards + 1] = reward
					end

					if currency_type == "SM" then
						local peddler_interface = Managers.backend:get_interface("peddler")
						local current_chips = peddler_interface:get_chips("SM")

						peddler_interface:set_chips(currency_type, current_chips + currency_amount)
					end
				end
			else
				local backend_id = item.ItemInstanceId

				if rewarded_from then
					local item_type = ItemMasterList[item.ItemId].item_type
					local reward = {
						reward_type = "item",
						backend_id = backend_id,
						rewarded_from = rewarded_from,
						item_type = item_type,
						item_id = item_id
					}
					unseen_rewards[#unseen_rewards + 1] = reward
				end

				self._backend_mirror:add_item(backend_id, item)
			end
		end
	end

	self._backend_mirror:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
	print("Finished Getting New DLC Rewards")
	print("New Rewards:")
	table.dump(unseen_rewards, "unseen_rewards", 5)

	self._updating_dlc_ownership = false
end

BackendInterfaceDLCsPlayfab.get_owned_dlcs = function (self)
	return self._owned_dlcs
end

BackendInterfaceDLCsPlayfab.get_platform_dlcs = function (self)
	return self._platform_dlcs
end

BackendInterfaceDLCsPlayfab.updating_dlc_ownership = function (self)
	return self._updating_dlc_ownership
end

BackendInterfaceDLCsPlayfab.is_unreleased_career = function (self, career_name)
	local title_data = self._backend_mirror:get_title_data()
	local unreleased_careers = title_data.unreleased_careers

	if unreleased_careers and string.find(unreleased_careers, career_name) then
		return true
	end

	return false
end
