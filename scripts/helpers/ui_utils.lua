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
				values[#values + 1] = math.abs(value*100)
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
			if 2 < #value then
				local index = (lerp_value == 1 and #value) or math.floor(lerp_value/#value/1) + 1
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
			display_value = math.abs(display_value*100)
			min_value = math.abs(min_value*100)
			max_value = math.abs(max_value*100)
			advanced_description = string.format(" (%.1f%% - %.1f%%)", min_value, max_value)
		else
			advanced_description = string.format(" (%.1f - %.1f)", min_value, max_value)
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
				values[#values + 1] = math.abs(value*100)
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
	local inventory_icon, display_name, description = nil

	if item_type == "weapon_skin" then
		local skin = item.skin
		local skin_template = WeaponSkins.skins[skin]
		inventory_icon = skin_template.inventory_icon
		display_name = skin_template.display_name
		description = skin_template.description
	else
		inventory_icon = item_data.inventory_icon
		display_name = item_data.display_name
		description = item_data.description
	end

	return inventory_icon, display_name, description
end

return 
