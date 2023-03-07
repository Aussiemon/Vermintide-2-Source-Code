SteamItemService = SteamItemService or {}

local function make_price_table(str_data, out)
	for currency_amount in string.gmatch(str_data, "[^,]+") do
		local currency = string.sub(currency_amount, 1, 3)
		local amount = tonumber(string.sub(currency_amount, 4))
		out[currency] = amount
	end

	return out
end

local _price_chunks = {}

SteamItemService.parse = function (price_data_string)
	string.split(price_data_string, ";", _price_chunks)

	if _price_chunks[1] ~= "1" then
		table.clear(_price_chunks)

		return nil, "unknown version"
	end

	local out = {
		regular_prices = make_price_table(_price_chunks[2], {})
	}
	local discounts_string = _price_chunks[3]

	if discounts_string then
		out.discount_prices = make_price_table(string.sub(discounts_string, 34), {})
		local discount_start = string.sub(discounts_string, 1, 16)
		local discount_end = string.sub(discounts_string, 18, 33)
		local current_date = os.date("!%Y%m%dT%H%M%SZ")
		out.discount_is_active = discount_start <= current_date and current_date < discount_end
		out.discount_start = discount_start
		out.discount_end = discount_end
	end

	table.clear(_price_chunks)

	return out
end

SteamItemService.get_item_data = function (id)
	local price_data_string = SteamInventory.get_item_definition_property(id, "price")

	if not price_data_string then
		return nil, "unknown item"
	end

	return SteamItemService.parse(price_data_string)
end
