SteamManager = class(SteamManager)

SteamManager.init = function (self)
	self._overlay_active = false
end

SteamManager.destroy = function (self)
	return
end

SteamManager.update = function (self, t, dt)
	return

	Steam.run_callbacks(self)
end

SteamManager.on_overlay_activated = function (self, enabled)
	self._overlay_active = enabled
end

SteamManager.is_overlay_active = function (self)
	return self._overlay_active
end

SteamManager.on_inventory_result = function (self, handle, result)
	print("[SteamManager] on_inventory_result, result=", result, "handle=", handle)

	if result == 1 then
		if handle == self._request_user_inventory_handle then
			print("ISI-> GET_ALL_ITEMS!")

			local item_list = SteamInventory.get_result_items(handle)

			self._request_user_inventory_callback(result, item_list)

			self._request_user_inventory_handle = nil
			self._request_user_inventory_callback = nil

			table.dump(item_list, "ITEM-LIST", 3)
		elseif self._purchase_item_callback then
			local item_list = SteamInventory.get_result_items(handle)

			self._purchase_item_callback(result, item_list)

			self._purchase_item_callback = nil

			print("[SteamManager] -> PURCHASE success!")
			table.dump(item_list, "ITEM-LIST", 3)
		end
	else
		if self._request_user_inventory_callback then
			print("[SteamManager] failed empty on_inventory_result callback")
		end

		print("[SteamManager] on_inventory_result FAILED, error-code:", result)

		if self._purchase_item_callback then
			self._purchase_item_callback(result)

			self._purchase_item_callback = nil
		end
	end

	SteamInventory.destroy_result(handle)
end

SteamManager.on_price_result = function (self, result, currency)
	print("[SteamManager] on_price_result", result, currency)

	if self._refresh_item_prices_callback then
		if result == 1 then
			local price_list = SteamInventory.get_items_with_prices()

			self._refresh_item_prices_callback(price_list, currency)

			self._refresh_item_prices_callback = nil

			table.dump(price_list, "price list [item, price]", 3)
		else
			print("[SteamManager] -> on_price_result ERROR:", result)
		end
	end
end

SteamManager.on_start_purchase = function (self, result, order_id, transaction_id)
	print("[SteamManager] on_start_purchase result=", result, "order_id=", order_id, ", transaction_id=", transaction_id)
end

SteamManager.request_user_inventory = function (self, callback)
	self._request_user_inventory_callback = callback
	self._request_user_inventory_handle = SteamInventory.get_all_items()
end

SteamManager.request_item_prices = function (self, callback)
	print("[SteamManager] request_item_prices")
	SteamInventory.request_prices()

	self._refresh_item_prices_callback = callback
	self._last_result = nil
end

SteamManager.request_purchase_item = function (self, steam_itemdefid, amount, callback)
	print("[SteamManager] request_purchase_item")
	SteamInventory.start_purchase(steam_itemdefid, amount)

	self._purchase_item_callback = callback
end

return
