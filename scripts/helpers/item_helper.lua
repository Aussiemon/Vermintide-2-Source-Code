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
	template_name = temporary_template or template_name
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
end

ItemHelper.mark_sign_in_reward_as_new = function (reward_id, item_backend_id)
	local new_sign_in_rewards = PlayerData.new_sign_in_rewards or {}
	local reward_items = new_sign_in_rewards[reward_id]

	if not reward_items then
		reward_items = {}
		new_sign_in_rewards[reward_id] = reward_items
	end

	reward_items[#reward_items + 1] = item_backend_id
	PlayerData.new_sign_in_rewards = new_sign_in_rewards

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

ItemHelper.unmark_sign_in_reward_as_new = function (reward_id)
	local new_sign_in_rewards = PlayerData.new_sign_in_rewards

	fassert(new_sign_in_rewards, "Tried to unmark sign-in reward as new but the save data wasn't found")

	local reward_items = new_sign_in_rewards[reward_id]

	if reward_items then
		for _, item_backend_id in ipairs(reward_items) do
			ItemHelper.unmark_backend_id_as_new(item_backend_id)
		end
	end

	new_sign_in_rewards[reward_id] = nil

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

ItemHelper.has_new_sign_in_reward = function (reward_id)
	if Managers.backend:is_local() then
		return false
	end

	if reward_id then
		local new_sign_in_rewards = PlayerData.new_sign_in_rewards
		local reward_items = new_sign_in_rewards[reward_id]

		return (reward_items and true) or false
	else
		local has_rewards = next(PlayerData.new_sign_in_rewards) ~= nil

		return has_rewards
	end
end

ItemHelper.mark_backend_id_as_new = function (backend_id)
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(backend_id)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local can_wield = item_data.can_wield
	local new_item_ids = PlayerData.new_item_ids or {}
	new_item_ids[backend_id] = true
	local career_settings = CareerSettings
	local new_item_ids_by_career = PlayerData.new_item_ids_by_career or {}

	for _, career_name in ipairs(can_wield) do
		local item_ids_by_career = new_item_ids_by_career[career_name] or {}
		local item_ids_by_slot_type = item_ids_by_career[slot_type] or {}
		item_ids_by_slot_type[backend_id] = true
		item_ids_by_career[slot_type] = item_ids_by_slot_type
		new_item_ids_by_career[career_name] = item_ids_by_career
	end

	PlayerData.new_item_ids = new_item_ids
	PlayerData.new_item_ids_by_career = new_item_ids_by_career

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

ItemHelper.unmark_backend_id_as_new = function (backend_id)
	local new_item_ids = PlayerData.new_item_ids
	local new_item_ids_by_career = PlayerData.new_item_ids_by_career

	assert(new_item_ids, "Requested to unmark item backend id %d without any save data.", backend_id)

	new_item_ids[backend_id] = nil

	for career_name, item_ids_by_slot_type in pairs(new_item_ids_by_career) do
		for slot_type, backend_ids in pairs(item_ids_by_slot_type) do
			for item_backend_id, _ in pairs(backend_ids) do
				if item_backend_id == backend_id then
					backend_ids[backend_id] = nil

					break
				end
			end
		end
	end
end

ItemHelper.get_new_backend_ids = function ()
	return PlayerData.new_item_ids
end

ItemHelper.is_new_backend_id = function (backend_id)
	local new_item_ids = PlayerData.new_item_ids

	return new_item_ids and new_item_ids[backend_id]
end

ItemHelper.has_new_backend_ids_by_career_name_and_slot_type = function (career_name, slot_type_name)
	local new_item_ids_by_career = PlayerData.new_item_ids_by_career

	for career, item_ids_by_slot_type in pairs(new_item_ids_by_career) do
		if career_name == career then
			for slot_type, backend_ids in pairs(item_ids_by_slot_type) do
				if slot_type_name == slot_type then
					for item_backend_id, value in pairs(backend_ids) do
						if value then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

ItemHelper.has_new_backend_ids_by_slot_type = function (slot_type_name)
	local new_item_ids_by_career = PlayerData.new_item_ids_by_career

	for career_name, item_ids_by_slot_type in pairs(new_item_ids_by_career) do
		for slot_type, backend_ids in pairs(item_ids_by_slot_type) do
			if slot_type_name == slot_type then
				for item_backend_id, value in pairs(backend_ids) do
					if value then
						return true
					end
				end
			end
		end
	end

	return false
end

ItemHelper.has_new_backend_ids_by_career_name = function (career_name)
	local new_item_ids_by_career = PlayerData.new_item_ids_by_career

	for career, item_ids_by_slot_type in pairs(new_item_ids_by_career) do
		if career_name == career then
			for slot_type, backend_ids in pairs(item_ids_by_slot_type) do
				for item_backend_id, value in pairs(backend_ids) do
					if value then
						return true
					end
				end
			end
		end
	end

	return false
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
end

ItemHelper.weapon_stat_order_by_type = function (stat_type)
	return weapon_attack_stats_order[stat_type]
end

ItemHelper.on_inventory_item_added = function (item)
	if item.data.slot_type == ItemType.LOOT_CHEST then
		local world_manager = Managers.world

		if world_manager:has_world("level_world") then
			local world = world_manager:world("level_world")

			LevelHelper:flow_event(world, "local_player_received_loot_chest")
		end
	end
end

ItemHelper.mark_backend_id_as_favorite = function (backend_id, save)
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(backend_id)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local can_wield = item_data.can_wield
	local favorite_item_ids = PlayerData.favorite_item_ids or {}
	favorite_item_ids[backend_id] = true
	local career_settings = CareerSettings
	local favorite_item_ids_by_career = PlayerData.favorite_item_ids_by_career or {}

	for _, career_name in ipairs(can_wield) do
		local item_ids_by_career = favorite_item_ids_by_career[career_name] or {}
		local item_ids_by_slot_type = item_ids_by_career[slot_type] or {}
		item_ids_by_slot_type[backend_id] = true
		item_ids_by_career[slot_type] = item_ids_by_slot_type
		favorite_item_ids_by_career[career_name] = item_ids_by_career
	end

	PlayerData.favorite_item_ids = favorite_item_ids
	PlayerData.favorite_item_ids_by_career = favorite_item_ids_by_career

	if save then
		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

ItemHelper.unmark_backend_id_as_favorite = function (backend_id)
	local favorite_item_ids = PlayerData.favorite_item_ids
	local favorite_item_ids_by_career = PlayerData.favorite_item_ids_by_career

	assert(favorite_item_ids, "Requested to unmark item backend id %d without any save data.", backend_id)

	favorite_item_ids[backend_id] = nil

	for career_name, item_ids_by_slot_type in pairs(favorite_item_ids_by_career) do
		for slot_type, backend_ids in pairs(item_ids_by_slot_type) do
			for item_backend_id, _ in pairs(backend_ids) do
				if item_backend_id == backend_id then
					backend_ids[backend_id] = nil

					break
				end
			end
		end
	end
end

ItemHelper.get_favorite_backend_ids = function ()
	return PlayerData.favorite_item_ids
end

ItemHelper.is_favorite_backend_id = function (backend_id)
	local favorite_item_ids = PlayerData.favorite_item_ids

	return favorite_item_ids and favorite_item_ids[backend_id]
end

ItemHelper.is_equiped_backend_id = function (backend_id, career)
	local item_interface = Managers.backend:get_interface("items")
	local career_names = item_interface:equipped_by(backend_id)
	local num_equipped_careers = #career_names

	return num_equipped_careers > 0 and (not career or table.contains(career_names, career)), career_names, num_equipped_careers
end

ItemHelper.mark_keep_decoration_as_new = function (keep_decoration_id)
	local new_keep_decoration_ids = PlayerData.new_keep_decoration_ids or {}
	new_keep_decoration_ids[keep_decoration_id] = true
	PlayerData.new_keep_decoration_ids = new_keep_decoration_ids

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

ItemHelper.unmark_keep_decoration_as_new = function (keep_decoration_id)
	local new_keep_decoration_ids = PlayerData.new_keep_decoration_ids
	new_keep_decoration_ids[keep_decoration_id] = nil

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

ItemHelper.get_new_keep_decoration_ids = function ()
	return PlayerData.new_keep_decoration_ids
end

ItemHelper.is_new_keep_decoration_id = function (keep_decoration_id)
	local new_keep_decoration_ids = PlayerData.new_keep_decoration_ids

	return new_keep_decoration_ids and new_keep_decoration_ids[keep_decoration_id]
end

return
