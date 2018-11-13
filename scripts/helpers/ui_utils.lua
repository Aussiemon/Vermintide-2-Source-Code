require("scripts/helpers/item_tooltip_helper")

UIUtils = UIUtils or {}

UIUtils.get_talent_description = function (talent_data)
	local description_text = Localize(talent_data.description)
	local description_values = talent_data.description_values
	local values = {}
	local text = nil

	if description_values then
		for i = 1, #description_values, 1 do
			local data = description_values[i]
			local value_type = data.value_type
			local value = data.value

			if value_type == "percent" then
				values[#values + 1] = math.abs(100 * value)
			elseif value_type == "baked_percent" then
				values[#values + 1] = math.abs(100 * (value - 1))
			else
				values[#values + 1] = value
			end
		end

		text = string.format(description_text, unpack(values))
	else
		text = description_text
	end

	return text
end

UIUtils.get_property_description = function (property_name, lerp_value)
	local property_data = WeaponProperties.properties[property_name]
	local description_text = Localize(property_data.display_name)
	local description_values = property_data.description_values
	local text = nil
	local advanced_description = ""

	if description_values then
		local min_value, max_value = nil
		local data = description_values[1]
		local value_type = data.value_type
		local value = data.value
		local display_value = nil

		if type(value) == "table" then
			if #value > 2 then
				local index = (lerp_value == 1 and #value) or 1 + math.floor(lerp_value / (1 / #value))
				display_value = value[index]
				min_value = value[1]
				max_value = value[#value]
			else
				min_value = value[1]
				max_value = value[2]
				display_value = math.lerp(min_value, max_value, lerp_value)
			end
		else
			display_value = value
		end

		if value_type == "percent" then
			display_value = math.abs(100 * display_value)
			min_value = math.abs(100 * min_value)
			max_value = math.abs(100 * max_value)
			advanced_description = string.format(" (%.1f%% - %.1f%%)", min_value, max_value)
		elseif value_type == "baked_percent" then
			display_value = math.abs(100 * (display_value - 1))
			min_value = math.abs(100 * (min_value - 1))
			max_value = math.abs(100 * (max_value - 1))
			advanced_description = string.format(" (%.1f%% - %.1f%%)", min_value, max_value)
		end

		text = string.format(description_text, display_value)
	else
		text = description_text
	end

	return text, advanced_description
end

UIUtils.get_trait_description = function (trait_name)
	local trait_data = WeaponTraits.traits[trait_name]
	local description_text = Localize(trait_data.advanced_description)
	local description_values = trait_data.description_values
	local text = nil

	if description_values then
		local values = {}

		for i = 1, #description_values, 1 do
			local data = description_values[i]
			local value_type = data.value_type
			local value = data.value

			if value_type == "percent" then
				values[#values + 1] = math.abs(100 * value)
			else
				values[#values + 1] = value
			end
		end

		text = string.format(description_text, unpack(values))
	else
		text = description_text
	end

	return text
end

UIUtils.get_ui_information_from_item = function (item)
	local item_data = item.data
	local item_type = item_data.item_type
	local rarity = item.rarity
	local inventory_icon, display_name, description = nil

	if item_type == "weapon_skin" then
		local skin = item.skin
		local skin_template = WeaponSkins.skins[skin]
		inventory_icon = skin_template.inventory_icon
		display_name = skin_template.display_name
		description = skin_template.description
	elseif item.skin then
		local skin = item.skin
		local skin_template = WeaponSkins.skins[skin]
		inventory_icon = skin_template.inventory_icon
		display_name = skin_template.display_name
		description = skin_template.description
	elseif rarity == "default" then
		local item_key = item_data.key
		local default_item_data = UISettings.default_items[item_key]

		if default_item_data then
			inventory_icon = default_item_data.inventory_icon or item_data.inventory_icon
			display_name = default_item_data.display_name or item_data.display_name
			description = default_item_data.description or item_data.description
		else
			inventory_icon = item_data.inventory_icon
			display_name = item_data.display_name
			description = item_data.description
		end
	else
		inventory_icon = item_data.inventory_icon
		display_name = item_data.display_name
		description = item_data.description
	end

	return inventory_icon, display_name, description
end

UIUtils.presentable_hero_power_level = function (power_level)
	return math.max(0, math.floor(power_level - PowerLevelFromLevelSettings.starting_power_level))
end

UIUtils.get_item_tooltip_value = function (unit, item, stat_descriptor)
	local format_type = stat_descriptor.format_type
	local format_function_name = stat_descriptor.format_function_name
	local format_function = ItemTooltipHelper[format_function_name]
	local values_table = {}

	if stat_descriptor.detailed then
		ItemTooltipHelper.parse_weapon_chain(values_table, unit, item, stat_descriptor, format_function)
	else
		local action = ItemTooltipHelper.get_action(unit, item, stat_descriptor)

		format_function(values_table, action, unit, item, stat_descriptor)
	end

	return ItemTooltipHelper.format_return_string(format_type, values_table)
end

UIUtils.get_hero_statistics_by_template = function (template)
	local layout = {}
	local params = {}

	for index, entry in ipairs(template) do
		local entry_type = entry.type
		local display_name = entry.display_name
		local description_name = entry.description_name
		local value = nil

		if entry_type == "title" then
			display_name = entry.display_name
		elseif entry_type == "entry" then
			display_name = entry.display_name
			value = entry.generate_value(params)
			description_name = entry.description_name or entry.generate_description(params)
		end

		if entry.value_type == "percent" then
			value = tostring(value) .. "%"
		end

		layout[index] = {
			display_name = display_name,
			description_name = description_name,
			value = value,
			value_text = tostring(value),
			type = entry_type
		}
	end

	return layout
end

return
