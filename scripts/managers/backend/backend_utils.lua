require("scripts/managers/backend_playfab/backend_manager_playfab")

BackendUtils = {}
local placeholder_icon_textures = {
	melee = "icons_placeholder_melee_01",
	ranged = "icons_placeholder_ranged_01",
	hat = "icons_placeholder_hat_01",
	trinket = "icons_placeholder_trinket_01"
}
BackendUtils.get_loadout_item = function (career_name, slot)
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = backend_items.get_loadout_item_id(backend_items, career_name, slot)
	local item = backend_items.get_item_from_id(backend_items, backend_id)

	return item
end
BackendUtils.get_item_from_masterlist = function (backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local item_master_list_data = backend_items.get_item_masterlist_data(backend_items, backend_id)
	local item_data = table.clone(item_master_list_data)
	item_data.backend_id = backend_id

	return item_data
end
BackendUtils.get_total_power_level = function (profile_name, career_name)
	if script_data.power_level_override then
		return script_data.power_level_override
	end

	local settings = PowerLevelFromLevelSettings
	local experience = ExperienceSettings.get_experience(profile_name)
	local level = ExperienceSettings.get_level(experience)
	local hero_power_level = settings.power_level_per_level*level + settings.starting_power_level
	local backend_items = Managers.backend:get_interface("items")
	local slots = InventorySettings.slots_by_slot_index
	local num_slots = 5
	local total_item_power_level = 0

	for _, slot in pairs(slots) do
		local slot_name = slot.name
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			local backend_id = item.backend_id
			local power_level = backend_items.get_item_power_level(backend_items, backend_id)

			if power_level then
				total_item_power_level = total_item_power_level + power_level
			end
		end
	end

	local average_item_power_level = total_item_power_level/num_slots

	return hero_power_level + average_item_power_level
end
BackendUtils.get_item_template = function (item_data, backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = item_data.backend_id or backend_id
	local template = backend_items.get_item_template(backend_items, item_data, backend_id)

	return template
end
BackendUtils.get_item_units = function (item_data, backend_id)
	local left_hand_unit = item_data.left_hand_unit
	local right_hand_unit = item_data.right_hand_unit
	local unit = item_data.unit
	local material = item_data.material
	local icon = item_data.hud_icon
	local backend_id = item_data.backend_id or backend_id

	if backend_id then
		local backend_items = Managers.backend:get_interface("items")
		local skin = backend_items.get_skin(backend_items, backend_id)

		if skin then
			local skin_template = WeaponSkins.skins[skin]
			left_hand_unit = skin_template.left_hand_unit
			right_hand_unit = skin_template.right_hand_unit
			icon = skin_template.hud_icon
		end
	end

	if left_hand_unit or right_hand_unit or unit or material or icon then
		local units = {
			left_hand_unit = left_hand_unit,
			right_hand_unit = right_hand_unit,
			unit = unit,
			material = material,
			icon = icon
		}

		return units
	end

	fassert(false, "no left hand or right hand unit defined for : " .. item_data.backend_id)

	return 
end
BackendUtils.format_profile_hash = function (hash, num_chars, block_length, block_divider)
	if not hash then
		return "n/a"
	end

	local str = ""

	for ii = 1, num_chars, block_length do
		local block = string.sub(hash, ii, (ii + block_length) - 1)

		if str == "" then
			str = block
		else
			str = string.format("%s%s%s", str, block_divider, block)
		end
	end

	return str
end
BackendUtils.has_loot_chest = function ()
	local backend_items = Managers.backend:get_interface("items")
	local item_filter = "slot_type == " .. ItemType.LOOT_CHEST
	local items = backend_items.get_filtered_items(backend_items, item_filter)
	local has_chest = 0 < #items

	return has_chest
end

return 
