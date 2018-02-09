require("scripts/settings/equipment/item_master_list")

ItemHelper = ItemHelper or {}
local item_type_templates = {
	melee = Weapons,
	ranged = Weapons,
	trinket = Attachments,
	ring = Attachments,
	necklace = Attachments,
	hat = Attachments,
	skin = Cosmetics,
	frame = Cosmetics,
	color_tint = Cosmetics
}
local weapon_attack_stats_order = {
	speed = 2,
	range = 5,
	damage = 1,
	targets = 3,
	stagger = 4
}
local stats_localization_keys = {
	burn = "item_compare_burn",
	range = "item_compare_range",
	armor_penetration = "item_compare_armor_penetration",
	damage = "item_compare_damage",
	head_shot = "item_compare_head_shot",
	poison = "item_compare_poison",
	speed = "item_compare_attack_speed",
	targets = "item_compare_targets",
	stagger = "item_compare_stagger"
}
ItemHelper.get_template_by_item_name = function (name)
	local item_data = ItemMasterList[name]

	assert(item_data, "Requested template for item %s which does not exist.", name)

	local slot_type = item_data.slot_type
	local template_name = item_data.template
	local temporary_template = item_data.temporary_template

	if not temporary_template then
	end

	local template = item_type_templates[slot_type][template_name]

	assert(template, "No template by name %s found for item_data %s.", template_name, name)

	return template
end
ItemHelper.get_slot_type = function (slot)
	local slots_n = #InventorySettings.slots

	for i = 1, slots_n, 1 do
		local slot_settings = InventorySettings[i]

		if slot_settings.name == slot then
			return slot_settings.type
		end
	end

	fassert(false, "no slot in InventorySettings.slots with name: ", slot)

	return 
end
ItemHelper.mark_backend_id_as_new = function (backend_id)
	local new_item_ids = PlayerData.new_item_ids or {}
	new_item_ids[backend_id] = true
	PlayerData.new_item_ids = new_item_ids

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
end
ItemHelper.unmark_backend_id_as_new = function (backend_id)
	local new_item_ids = PlayerData.new_item_ids

	assert(new_item_ids, "Requested to unmark item backend id %d without any save data.", backend_id)

	new_item_ids[backend_id] = nil

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
end
ItemHelper.get_new_backend_ids = function ()
	return PlayerData.new_item_ids
end
ItemHelper.is_new_backend_id = function (backend_id)
	local new_item_ids = PlayerData.new_item_ids

	return new_item_ids and new_item_ids[backend_id]
end
ItemHelper.retrieve_weapon_item_statistics = function (item_data, backend_id)
	local stats_data = {}
	local stats_data_by_order = {}
	local item_template = BackendUtils.get_item_template(item_data, backend_id)
	local item_statistics = item_template.compare_statistics
	local stats_by_attack = item_statistics and item_statistics.attacks
	local perks_by_attack = item_statistics and item_statistics.perks

	if stats_by_attack then
		local light_attack_statistics = stats_by_attack.light_attack
		local heavy_attack_statistics = stats_by_attack.heavy_attack

		ItemHelper._retrieve_weapon_attack_data(light_attack_statistics, stats_data)
		ItemHelper._retrieve_weapon_attack_data(heavy_attack_statistics, stats_data)
	end

	for key, data in pairs(stats_data) do
		local index = weapon_attack_stats_order[key]
		stats_data_by_order[index] = data
	end

	return stats_data_by_order
end
ItemHelper._retrieve_weapon_attack_data = function (stats_data, data_store_table)
	for key, value in pairs(stats_data) do
		local localization_key = stats_localization_keys[key]
		local weapon_data = data_store_table[key] or {}
		weapon_data[#weapon_data + 1] = {
			key = key,
			title = Localize(localization_key),
			value = value
		}
		data_store_table[key] = weapon_data
	end

	return 
end
ItemHelper.weapon_stat_order_by_type = function (stat_type)
	return weapon_attack_stats_order[stat_type]
end

return 
