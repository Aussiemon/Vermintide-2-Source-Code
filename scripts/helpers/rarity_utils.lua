require("scripts/settings/dlcs/morris/rarity_settings")

RarityUtils = RarityUtils or {}

RarityUtils.get_previous_rarity = function (rarity)
	local rarity_settings = RaritySettings
	local order = rarity_settings[rarity].order
	local best_rarity = rarity
	local best_rarity_order = 0

	for other_rarity, settings in pairs(rarity_settings) do
		if settings.order < order and best_rarity_order < settings.order then
			best_rarity = other_rarity
			best_rarity_order = rarity_settings[best_rarity].order
		end
	end

	local has_previous_rarity = best_rarity ~= rarity

	return best_rarity, has_previous_rarity
end

RarityUtils.get_lower_rarities = function (rarity)
	local rarity_settings = RaritySettings
	local order = rarity_settings[rarity].order
	local rarities = {}

	for other_rarity, settings in pairs(rarity_settings) do
		if settings.order < order then
			table.insert(rarities, other_rarity)
		end
	end

	return rarities
end

RarityUtils.get_higher_rarities = function (rarity)
	local rarity_settings = RaritySettings
	local order = rarity_settings[rarity].order
	local rarities = {}

	for other_rarity, settings in pairs(rarity_settings) do
		if order < settings.order then
			table.insert(rarities, other_rarity)
		end
	end

	return rarities
end

return
