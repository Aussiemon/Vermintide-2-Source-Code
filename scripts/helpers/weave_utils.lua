﻿-- chunkname: @scripts/helpers/weave_utils.lua

WeaveUtils = WeaveUtils or {}

WeaveUtils.get_rating = function (score)
	local rating_values = WeaveSettings.rating_values
	local max_rating = 5
	local rating = 0

	if score then
		for i = 1, #rating_values do
			if score > rating_values[i] then
				rating = max_rating - i + 1

				break
			end
		end
	end

	return rating
end

WeaveUtils.magic_level_to_power_level = function (magic_level)
	local settings = PowerLevelFromMagicLevel

	return math.min(math.ceil(settings.starting_power_level + magic_level * settings.power_level_per_magic_level), settings.max_power_level)
end

WeaveUtils.weave_equivalent_item_unlocked = function (base_item_key)
	local weaves_item_name = MagicItemByUnlockName[base_item_key]
	local backend_interface_items = Managers.backend:get_interface("items")
	local weave_item = backend_interface_items:get_item_from_key(weaves_item_name)

	return weave_item and weave_item.backend_id
end
