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
	local unlocked_dlcs = unlock_manager:get_unlocked_dlcs()
	local json_string = cjson.encode(unlocked_dlcs)
	local request = {
		FunctionName = "updateDLCOwnership",
		FunctionParameter = {
			unlocked_dlcs = json_string
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
	self._owned_dlcs = owned_dlcs or {}
	self._platform_dlcs = platform_dlcs

	self._backend_mirror:set_owned_dlcs()
	self._backend_mirror:set_platform_dlcs()
	print("Finished Updating Owned DLCS")
	table.dump(self._owned_dlcs, nil, 2)
	self:_execute_dlc_specific_logic()
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
	local user_data = self._backend_mirror:get_user_data()
	local unseen_rewards = user_data.unseen_rewards
	unseen_rewards = (unseen_rewards and cjson.decode(unseen_rewards)) or {}

	for i = 1, #new_rewards, 1 do
		local item = new_rewards[i]
		local item_id = item.ItemId
		local data = ItemMasterList[item_id]
		local custom_data = item.CustomData
		local rewarded_from = custom_data.rewarded_from

		if data.bundle then
			local bundled_currencies = data.bundle.BundledVirtualCurrencies

			for currency_type, currency_amount in pairs(bundled_currencies) do
				local reward = {
					reward_type = "currency",
					currency_type = currency_type,
					currency_amount = currency_amount,
					rewarded_from = rewarded_from
				}
				unseen_rewards[#unseen_rewards + 1] = reward

				if currency_type == "SM" then
					local peddler_interface = Managers.backend:get_interface("peddler")
					local current_chips = peddler_interface:get_chips("SM")

					peddler_interface:set_chips(currency_type, current_chips + currency_amount)
				end
			end
		else
			local backend_id = item.ItemInstanceId
			local reward = {
				reward_type = "item",
				backend_id = backend_id,
				rewarded_from = rewarded_from
			}
			unseen_rewards[#unseen_rewards + 1] = reward

			self._backend_mirror:add_item(backend_id, item)
		end
	end

	self._backend_mirror:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
	print("Finished Getting New DLC Rewards")
	print("New Rewards:")
	table.dump(unseen_rewards, nil, 5)

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

return
