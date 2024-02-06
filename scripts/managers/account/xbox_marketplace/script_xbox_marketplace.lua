-- chunkname: @scripts/managers/account/xbox_marketplace/script_xbox_marketplace.lua

ScriptXboxMarketplace = class(ScriptXboxMarketplace)

ScriptXboxMarketplace.init = function (self)
	self._state = nil
	self._response_cb = nil
	self._error_code = nil

	local settings = Application.settings()

	self._initialized = XboxMarketplace.initialize(settings.xb1_product_id)
end

ScriptXboxMarketplace.destroy = function (self)
	XboxMarketplace.shutdown()
end

ScriptXboxMarketplace.update = function (self, dt)
	if not self._state or not self._initialized then
		return
	end

	self[self._state](self, dt)
end

ScriptXboxMarketplace.get_product_details = function (self, user_id, product_ids, response_callback)
	local success = XboxMarketplace.get_catalog_items(user_id, unpack(product_ids))

	if not success then
		response_callback({
			error = "failed calling XboxMarketplace.get_catalog_items",
		})
	else
		self._state = "_waiting_for_catalog_details_result"
		self._response_cb = response_callback
	end
end

ScriptXboxMarketplace._waiting_for_catalog_details_result = function (self, dt)
	local done, error_code = XboxMarketplace.status()

	if done then
		self._error_code = error_code
		self._state = "_get_catalog_details_information"
	end
end

ScriptXboxMarketplace._get_catalog_details_information = function (self, dt)
	local error_string

	if self._error_code ~= 0 then
		local error_code = "0x" .. string.sub(string.format("%02X", self._error_code), 9)

		error_string = string.format("There was an error while getting catalog items with the error code %q", error_code)
	end

	local result = {
		error = error_string,
		product_details = XboxMarketplace.get_result(),
	}

	self._response_cb(result)

	self._state = "_cleanup"
end

ScriptXboxMarketplace._cleanup = function (self, dt)
	XboxMarketplace.release_catalog()

	self._state = nil
	self._response_cb = nil
	self._error_code = nil
end
