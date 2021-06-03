BackendInterfacePeddlerPlayFab = class(BackendInterfacePeddlerPlayFab)
local PEDDLER_ID = "Store"
local NON_FATAL_ERROR_CODES = {
	[1052.0] = true,
	[1053.0] = true,
	[1047.0] = true,
	[1059.0] = true
}

BackendInterfacePeddlerPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._peddler_stock = {}
	self._chips = {}
	self._app_prices = {}
	self._stock_ready = false
	self._chips_ready = false
	self._steam_stock_ready = not HAS_STEAM
	self._app_prices_ready = false
	self._steam_item_prices = {}

	self:refresh_stock()
	self:refresh_chips()
	self:refresh_layout_override(true)
	self:refresh_app_prices()
	self:refresh_platform_item_prices()
end

BackendInterfacePeddlerPlayFab.ready = function (self)
	return self._stock_ready and self._steam_stock_ready and self._chips_ready and self._app_prices_ready
end

BackendInterfacePeddlerPlayFab.destroy = function (self)
	self._peddler_stock = nil
	self._chips = nil
	self._app_prices = nil
end

BackendInterfacePeddlerPlayFab.get_peddler_stock = function (self)
	return self._peddler_stock
end

local empty_params = {}

BackendInterfacePeddlerPlayFab.get_filtered_items = function (self, filter, params)
	local all_items = self._peddler_stock
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common:filter_items(all_items, filter, params or empty_params)

	return items
end

BackendInterfacePeddlerPlayFab.get_chips = function (self, chip_type)
	return self._chips[chip_type]
end

BackendInterfacePeddlerPlayFab.get_app_price = function (self, app_id)
	return self._app_prices[app_id]
end

BackendInterfacePeddlerPlayFab.get_steam_item_price = function (self, steam_itemdefid)
	return self._steam_item_prices[steam_itemdefid], self._steam_item_currency
end

BackendInterfacePeddlerPlayFab.get_unseen_currency_rewards = function (self)
	local user_data = self._backend_mirror:get_user_data()
	local unseen_rewards_json = user_data.unseen_rewards

	if not unseen_rewards_json then
		return nil
	end

	local unseen_rewards = cjson.decode(unseen_rewards_json)
	local unseen_items = nil
	local index = 1

	while index <= #unseen_rewards do
		local reward = unseen_rewards[index]
		local reward_type = reward.reward_type

		if reward_type == "currency" and reward.currency_type == "SM" then
			unseen_items = unseen_items or {}
			unseen_items[#unseen_items + 1] = reward

			table.remove(unseen_rewards, index)
		else
			index = index + 1
		end
	end

	if unseen_items then
		self._backend_mirror:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
	end

	return unseen_items
end

BackendInterfacePeddlerPlayFab.refresh_stock = function (self, external_cb)
	self._peddler_stock = {}
	local request = {
		StoreId = PEDDLER_ID
	}
	local request_cb = callback(self, "_refresh_stock_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("GetStoreItems", request, request_cb)
end

local function verify_stock_item(item_master_list_data)
	local required_dlc = item_master_list_data.required_dlc

	if required_dlc and not Managers.unlock:is_dlc_unlocked(required_dlc) then
		return false
	end

	local has_platform_id = nil

	if IS_CONSOLE then
		return true
	else
		local steam_itemdefid = item_master_list_data.steam_itemdefid
		has_platform_id = steam_itemdefid ~= nil

		if has_platform_id then
			local platform_id_approved = false

			if steam_itemdefid and HAS_STEAM then
				platform_id_approved = true
			end

			if not platform_id_approved then
				return false
			end
		end
	end

	return true, has_platform_id
end

BackendInterfacePeddlerPlayFab._refresh_stock_cb = function (self, external_cb, result)
	local stock = result.Store
	local peddler_stock = self._peddler_stock
	local mirror = self._backend_mirror
	local inventory_items = mirror:get_all_inventory_items()
	local has_steam = HAS_STEAM
	local stock_index = #peddler_stock + 1

	for i = 1, #stock, 1 do
		local item = stock[i]
		local key = item.ItemId

		if item.ItemId and not rawget(ItemMasterList, item.ItemId) then
			Crashify.print_exception("BackendInterfacePeddlerPlayFab", string.format("ItemMasterList has no item %q", tostring(item.ItemId)))
		else
			local data = ItemMasterList[key]
			local owned = false

			for backend_id, inventory_item in pairs(inventory_items) do
				if key == inventory_item.key then
					owned = true

					break
				end
			end

			local verified, has_platform = verify_stock_item(data)

			if verified and not has_platform then
				peddler_stock[stock_index] = {
					type = "item",
					data = table.clone(data),
					key = key,
					id = key,
					regular_prices = item.CustomData.regular_prices,
					current_prices = item.VirtualCurrencyPrices,
					end_time = item.CustomData.end_time,
					owned = owned,
					dlc_name = data.dlc_name,
					steam_itemdefid = has_steam and data.steam_itemdefid
				}
				stock_index = stock_index + 1
			end
		end
	end

	print(string.format("[BackendInterfacePeddlerPlayFab] _refresh_stock_cb -> Added %s item(s) to the peddler stock", #peddler_stock))

	self._peddler_stock = peddler_stock
	self._stock_ready = true

	if external_cb then
		external_cb()
	end
end

BackendInterfacePeddlerPlayFab.set_chips = function (self, chip_type, chip_amount)
	self._chips[chip_type] = chip_amount
end

BackendInterfacePeddlerPlayFab.refresh_chips = function (self, external_cb)
	local request = {
		FunctionName = "getUserChips",
		FunctionParameter = {}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, callback(self, "_refresh_chips_cb", external_cb), false)
end

BackendInterfacePeddlerPlayFab._refresh_chips_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local chips = function_result.chips

	for chip_type, chip_amount in pairs(chips) do
		self:set_chips(chip_type, chip_amount)
	end

	self._chips_ready = true

	if external_cb then
		external_cb()
	end
end

BackendInterfacePeddlerPlayFab.refresh_layout_override = function (self, use_mirrored_title_data, external_cb)
	local mirror = self._backend_mirror

	if use_mirrored_title_data then
		local title_data = mirror:get_title_data()
		local override_json = title_data.store_layout_override

		if override_json then
			local override = cjson.decode(override_json)
			local layout = StoreLayoutConfig

			if override.menu_options then
				layout.menu_options = override.menu_options
			end

			if override.structure then
				for key, value in pairs(override.structure) do
					layout.structure[key] = value
				end
			end

			if override.pages then
				for key, value in pairs(override.pages) do
					layout.pages[key] = value
				end
			end
		end

		if external_cb then
			external_cb()
		end
	else
		local request = {
			Keys = {
				"store_layout_override"
			}
		}
		local success_cb = callback(self, "_refresh_layout_override_cb", external_cb)
		local mirror = self._backend_mirror
		local request_queue = mirror:request_queue()

		request_queue:enqueue_api_request("GetTitleData", request, success_cb)
	end
end

BackendInterfacePeddlerPlayFab._refresh_layout_override_cb = function (self, external_cb, result)
	local override = result.Data and result.Data.store_layout_override
	local mirror = self._backend_mirror

	mirror:set_title_data("store_layout_override", override)
	self:refresh_layout_override(true, external_cb)
end

BackendInterfacePeddlerPlayFab.refresh_platform_item_prices = function (self)
	if HAS_STEAM then
		print("[BackendInterfacePeddlerPlayFab] refresh steam item prices")
		Managers.steam:request_item_prices(callback(self, "_refresh_steam_item_prices_cb"))
	end
end

BackendInterfacePeddlerPlayFab._read_bundle_from_steam = function (self, steam_itemdefid)
	local bundle_string = SteamInventory.get_item_definition_property(steam_itemdefid, "bundle")

	if bundle_string then
		local bundle_contains = string.split(bundle_string, ";")

		for k, v in ipairs(bundle_contains) do
			bundle_contains[k] = tonumber(v)
		end

		local discount = SteamInventory.get_item_definition_property(steam_itemdefid, "purchase_bundle_discount")

		return bundle_contains, tonumber(discount)
	end
end

BackendInterfacePeddlerPlayFab._refresh_steam_item_prices_cb = function (self, price_list, currency)
	print("_refresh_steam_item_prices_cb")

	local mirror = self._backend_mirror
	local inventory_items = mirror:get_all_inventory_items()
	local peddler_stock = self._peddler_stock
	local steam_stock_index = #peddler_stock + 1
	local bundles = {}

	for i = 1, #price_list, 2 do
		local steam_itemdefid = price_list[i]
		local price = price_list[i + 1]
		local item_key = SteamitemdefidToMasterList[steam_itemdefid]

		if item_key then
			self._steam_item_prices[steam_itemdefid] = price
			local master_item = ItemMasterList[item_key]

			if not master_item.steam_store_hidden and verify_stock_item(master_item) then
				local owned = false

				for backend_id, inventory_item in pairs(inventory_items) do
					if item_key == inventory_item.key then
						owned = true

						break
					end
				end

				local cloned_master_item = table.clone(master_item)

				if master_item.item_type == "bundle" then
					local contains, discount = self:_read_bundle_from_steam(steam_itemdefid)

					if contains then
						cloned_master_item.bundle_contains = contains
						cloned_master_item.discount = discount
					end

					bundles[#bundles + 1] = cloned_master_item
				end

				peddler_stock[steam_stock_index] = {
					type = "item",
					data = cloned_master_item,
					key = item_key,
					id = item_key,
					owned = owned,
					steam_itemdefid = master_item.steam_itemdefid,
					steam_price = price
				}
				steam_stock_index = steam_stock_index + 1
			end
		else
			print("Missing item masterlist item for steam_itemdefid:", steam_itemdefid)
		end
	end

	for i = 1, #bundles, 1 do
		local bundle_item_data = bundles[i]
		local price_sum = 0
		local bundle_contains = bundle_item_data.bundle_contains

		for j = 1, #bundle_contains, 1 do
			local steam_itemdefid = bundle_contains[j]
			price_sum = price_sum + (self._steam_item_prices[steam_itemdefid] or 0)
		end

		bundle_item_data.bundle_price = price_sum
	end

	self._steam_item_currency = currency
	self._steam_stock_ready = true
end

BackendInterfacePeddlerPlayFab.refresh_app_prices = function (self, external_cb)
	local platform = PLATFORM

	if IS_WINDOWS or IS_LINUX then
		self:_refresh_app_prices_steam(external_cb)
	elseif IS_PS4 then
		self:_refresh_app_prices_psn(external_cb)
	elseif IS_XB1 then
		self:_refresh_app_prices_xboxlive(external_cb)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_steam = function (self, external_cb)
	local request = {
		FunctionName = "getSteamAppPriceInfo",
		FunctionParameter = {}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, callback(self, "_refresh_app_prices_steam_cb", external_cb), false)
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_steam_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local success = true

	if function_result.error then
		print("[BackendInterfacePeddlerPlayFab] _refresh_app_prices_steam_cb ERROR", function_result.error)

		success = false
	else
		local price_info = function_result.price_info

		if price_info then
			for app_id, info in pairs(price_info) do
				local currency = info.currency
				local regular_price = info.initial_price
				local current_price = info.final_price
				self._app_prices[app_id] = {
					currency = currency,
					regular_price = regular_price,
					current_price = current_price
				}
			end
		end
	end

	self._app_prices_ready = true

	if external_cb then
		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_psn = function (self, external_cb)
	local product_label_lookup = {}
	local product_labels_string = ""
	local title_id = PS4.title_id()

	table.clear(self._app_prices)

	for name, dlc_data in pairs(DLCSettings) do
		local unlock_settings_ps4 = dlc_data.unlock_settings_ps4

		if unlock_settings_ps4 then
			local regional_unlock_settings = unlock_settings_ps4[title_id] or {}

			for name, unlock_settings in pairs(regional_unlock_settings) do
				local product_label = unlock_settings.product_label

				if product_label then
					product_labels_string = product_labels_string .. unlock_settings.product_label .. ":"
					product_label_lookup[product_label] = name
				end
			end
		end
	end

	Managers.account:get_product_details(product_labels_string, 0, callback(self, "_refresh_app_prices_psn_cb", external_cb, product_label_lookup))
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_psn_cb = function (self, external_cb, product_label_lookup, result_json)
	if result_json then
		local empty_table = {}
		local result = cjson.decode(result_json)

		for idx, product in pairs(result) do
			local product_label = product.label
			local skus = product.skus
			local sku = (skus and skus[1]) or empty_table
			local dlc_name = product_label_lookup[product_label]
			self._app_prices[dlc_name] = {
				name = product.name,
				is_plus_price = sku.is_plus_price,
				plus_upsell_price = sku.plus_upsell_price,
				original_price = sku.original_price,
				price = sku.price,
				display_original_price = sku.display_original_price,
				display_plus_upsell_price = sku.display_plus_upsell_price,
				display_price = sku.display_price,
				product_id = sku.product_id,
				product_label = product_label
			}
		end

		if external_cb then
			local success = true

			external_cb(success)
		end
	elseif external_cb then
		local success = false

		external_cb(success)
	end

	self._app_prices_ready = true
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_xboxlive = function (self, external_cb)
	local product_id_lookup = {}
	local product_ids = {}

	table.clear(self._app_prices)

	for name, dlc_data in pairs(DLCSettings) do
		local unlock_settings_xb1 = dlc_data.unlock_settings_xb1 or {}

		for name, unlock_settings in pairs(unlock_settings_xb1) do
			local product_id = unlock_settings.id

			if product_id then
				product_ids[#product_ids + 1] = product_id
				product_id_lookup[product_id] = name
			end
		end
	end

	if #product_ids < 0 then
		local success = true

		if external_cb(success) then
			external_cb(success)
		end

		return
	end

	print("####### GET PRICING INFORMATION")
	table.dump(product_ids, "PRODUCT_IDS", 5)
	table.dump(product_id_lookup, "PRODUCT_ID_LOOKUP", 5)
	Managers.account:get_product_details(product_ids, callback(self, "_refresh_app_prices_xboxlive_cb", external_cb, product_id_lookup))
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_xboxlive_cb = function (self, external_cb, product_id_lookup, result)
	if result.error then
		Application.warning(result.error)
	end

	if result.product_details then
		for product_id, catalog_item_details in pairs(result.product_details) do
			local capitalized_product_id = string.upper(product_id)
			local dlc_name = product_id_lookup[capitalized_product_id]
			self._app_prices[dlc_name] = catalog_item_details
		end
	end

	if external_cb then
		local success = result.error == nil

		external_cb(success)
	end

	self._app_prices_ready = true
end

BackendInterfacePeddlerPlayFab.exchange_chips = function (self, item_id, chip_type, expected_chip_amount, external_cb)
	local request = {
		StoreId = PEDDLER_ID,
		ItemId = item_id,
		VirtualCurrency = chip_type,
		Price = expected_chip_amount
	}
	local success_cb = callback(self, "_exchange_chips_success_cb", external_cb)
	local error_cb = callback(self, "_exchange_chips_error_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("PurchaseItem", request, success_cb, error_cb)
end

BackendInterfacePeddlerPlayFab._exchange_chips_success_cb = function (self, external_cb, result)
	local items = result.Items
	local chips = self._chips
	local mirror = self._backend_mirror

	for i = 1, #items, 1 do
		local item = items[i]
		local item_instance_id = item.ItemInstanceId
		local chip_type = item.UnitCurrency
		local chip_amount = item.UnitPrice

		mirror:add_item(item_instance_id, item)

		chips[chip_type] = chips[chip_type] - chip_amount

		print(string.format("[BackendInterfacePeddlerPlayFab] Exchanged %s %s for %s", chip_amount, chip_type, item.ItemId))
	end

	local request = {
		FunctionName = "storePurchaseMade",
		FunctionParameter = {
			items = items
		}
	}
	local request_cb = callback(self, "_store_purchase_made_cb")
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, request_cb, false)
	external_cb(true, items)
end

BackendInterfacePeddlerPlayFab._exchange_chips_error_cb = function (self, external_cb, result, reenable_queue_function)
	local error_code = result.errorCode
	local is_non_fatal = NON_FATAL_ERROR_CODES[error_code]

	if is_non_fatal then
		reenable_queue_function()
		self:_refresh_on_error(external_cb)
	else
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR, error_code)
		external_cb(false)
	end
end

BackendInterfacePeddlerPlayFab._store_purchase_made_cb = function (self, result)
	local function_result = result.FunctionResult
	local updated_statistics = function_result.updated_statistics

	if updated_statistics then
		local player = Managers.player and Managers.player:local_player()
		local statistics_db = Managers.player:statistics_db()

		if not player or not statistics_db then
			print("[BackendInterfacePeddlerPlayFab] Could not get statistics_db, skipping updating statistics...")
		else
			local player_stats_id = player:stats_id()

			for key, value in pairs(updated_statistics) do
				if not statistics_db.statistics[player_stats_id][key] then
					Application.warning("[BackendInterfacePeddlerPlayFab] updated_statistics " .. key .. " doesn't exist.")
				else
					statistics_db:set_stat(player_stats_id, key, value)
				end
			end
		end
	end
end

BackendInterfacePeddlerPlayFab._refresh_on_error = function (self, external_cb)
	self:refresh_stock(callback(self, "_refresh_stock_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_stock_on_error_cb = function (self, external_cb)
	self:refresh_chips(callback(self, "_refresh_chips_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_chips_on_error_cb = function (self, external_cb)
	self:refresh_layout_override(false, callback(self, "_refresh_layout_override_on_error_cb", external_cb))
end

BackendInterfacePeddlerPlayFab._refresh_layout_override_on_error_cb = function (self, external_cb)
	Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_NON_FATAL_STORE_ERROR, nil)
	external_cb(false)
end

local PlayFabClientApi_RedeemCoupon = require("PlayFab.PlayFabClientApi").RedeemCoupon

BackendInterfacePeddlerPlayFab.redeem_coupon = function (self, coupon_code, resolve_cb, reject_cb)
	local function success_handler(result)
		local backend_mirror = self._backend_mirror
		local items = result.GrantedItems

		for i = 1, #items, 1 do
			local item = items[i]

			backend_mirror:add_item(item.ItemInstanceId, item)
			printf("[BackendInterfacePeddlerPlayFab] Redeemed `%s`", item.ItemId)
		end

		self:refresh_chips()
		resolve_cb(result.GrantedItems)
	end

	local function error_handler(result)
		reject_cb(result.errorCode or result.code, result.error or "Unknown")
	end

	PlayFabClientApi_RedeemCoupon({
		CouponCode = coupon_code
	}, success_handler, error_handler)
end

return
