BackendInterfacePeddlerPlayFab = class(BackendInterfacePeddlerPlayFab)
local PEDDLER_ID = "Store"

BackendInterfacePeddlerPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._peddler_stock = {}
	self._chips = {}
	self._app_prices = {}
	self._stock_ready = false
	self._chips_ready = false
	self._app_prices_ready = false

	self:refresh_stock()
	self:refresh_chips()
	self:refresh_layout_override()
	self:refresh_app_prices()
end

BackendInterfacePeddlerPlayFab.ready = function (self)
	return self._stock_ready and self._chips_ready and self._app_prices_ready
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

BackendInterfacePeddlerPlayFab.refresh_stock = function (self, external_cb)
	local request = {
		StoreId = PEDDLER_ID
	}
	local request_cb = callback(self, "_refresh_stock_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("GetStoreItems", request, request_cb)
end

BackendInterfacePeddlerPlayFab._refresh_stock_cb = function (self, external_cb, result)
	local stock = result.Store
	local peddler_stock = {}
	local mirror = self._backend_mirror
	local inventory_items = mirror:get_all_inventory_items()
	local num_inventory_items = #inventory_items

	for i = 1, #stock, 1 do
		local item = stock[i]
		local key = item.ItemId
		local data = ItemMasterList[key]
		local owned = false

		for j = 1, num_inventory_items, 1 do
			local inventory_item = inventory_items[j]

			if key == inventory_item.key then
				owned = true

				break
			end
		end

		peddler_stock[i] = {
			data = table.clone(data),
			key = key,
			regular_prices = item.CustomData.regular_prices,
			current_prices = item.VirtualCurrencyPrices,
			owned = owned
		}

		print(string.format("[BackendInterfacePeddlerPlayFab] Added %s to the peddler stock", key))
	end

	self._peddler_stock = peddler_stock
	self._stock_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
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
		self._chips[chip_type] = chip_amount

		print(string.format("[BackendInterfacePeddlerPlayFab] User has %s %s chips", chip_amount, chip_type))
	end

	self._chips_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab.refresh_layout_override = function (self)
	local mirror = self._backend_mirror
	local title_data = mirror:get_title_data()
	local override = cjson.decode(title_data.store_layout_override)
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

BackendInterfacePeddlerPlayFab.refresh_app_prices = function (self, external_cb)
	local platform = PLATFORM

	if platform == "win32" then
		self:_refresh_app_prices_steam(external_cb)
	elseif platform == "ps4" then
		self:_refresh_app_prices_psn(external_cb)
	elseif platform == "xb1" then
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
	self._app_prices_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab._refresh_app_prices_xboxlive = function (self, external_cb)
	self._app_prices_ready = true

	if external_cb then
		local success = true

		external_cb(success)
	end
end

BackendInterfacePeddlerPlayFab.exchange_chips = function (self, item_id, chip_type, expected_chip_amount, external_cb)
	local request = {
		StoreId = PEDDLER_ID,
		ItemId = item_id,
		VirtualCurrency = chip_type,
		Price = expected_chip_amount
	}
	local request_cb = callback(self, "_exchange_chips_cb", external_cb)
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue_api_request("PurchaseItem", request, request_cb)
end

BackendInterfacePeddlerPlayFab._exchange_chips_cb = function (self, external_cb, result)
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

	if external_cb then
		local success = true

		external_cb(success, items)
	end
end

return
