-- chunkname: @scripts/managers/backend/backend_utils.lua

require("scripts/managers/backend_playfab/backend_manager_playfab")

BackendUtils = {}

local placeholder_icon_textures = {
	hat = "icons_placeholder_hat_01",
	melee = "icons_placeholder_melee_01",
	ranged = "icons_placeholder_ranged_01",
	trinket = "icons_placeholder_trinket_01",
}

BackendUtils.get_loadout_item_id = function (career_name, slot_name)
	local loadout_interface = Managers.backend:get_loadout_interface_by_slot(slot_name)

	if loadout_interface then
		return loadout_interface:get_loadout_item_id(career_name, slot_name)
	end
end

BackendUtils.set_loadout_item = function (backend_id, career_name, slot_name)
	local loadout_interface = Managers.backend:get_loadout_interface_by_slot(slot_name)

	if loadout_interface then
		loadout_interface:set_loadout_item(backend_id, career_name, slot_name)
	end
end

BackendUtils.get_loadout_item = function (career_name, slot)
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = BackendUtils.get_loadout_item_id(career_name, slot)

	if not backend_id and CosmeticUtils.is_cosmetic_slot(slot) then
		local profile = PROFILES_BY_CAREER_NAMES[career_name]
		local career_settings = CareerSettings[career_name]

		if career_settings.required_dlc and Managers.unlock:is_dlc_unlocked(career_settings.required_dlc) then
			Crashify.print_exception("[BackendUtils] Failed to find loadout item in slot %q for career %q", slot, career_name)
		end

		return
	end

	return backend_items:get_item_from_id(backend_id)
end

BackendUtils.try_set_loadout_item = function (career_name, slot_name, item_key)
	local backend_items = Managers.backend:get_interface("items")
	local item = backend_items:get_item_from_key(item_key)

	if item then
		local backend_id = item.backend_id

		BackendUtils.set_loadout_item(backend_id, career_name, slot_name)
	elseif CosmeticUtils.is_cosmetic_slot(slot_name) then
		Crashify.print_exception("[BackendUtils] Failed to set loadout item %q in slot %q for career %q", item_key, slot_name, career_name)
	end

	return item
end

BackendUtils.get_item_from_masterlist = function (backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local item_master_list_data = backend_items:get_item_masterlist_data(backend_id)

	if item_master_list_data then
		local item_data = table.clone(item_master_list_data)

		item_data.backend_id = backend_id

		return item_data
	end
end

BackendUtils.get_hero_power_level_from_level = function (profile_name)
	local settings = PowerLevelFromLevelSettings
	local experience = ExperienceSettings.get_experience(profile_name)
	local level = ExperienceSettings.get_level(experience)

	return settings.power_level_per_level * level
end

BackendUtils.get_hero_power_level = function (profile_name)
	local settings = PowerLevelFromLevelSettings
	local experience = ExperienceSettings.get_experience(profile_name)
	local level = ExperienceSettings.get_level(experience)

	return settings.power_level_per_level * level + settings.starting_power_level
end

BackendUtils.get_average_item_power_level = function (career_name)
	local backend_items = Managers.backend:get_interface("items")
	local slots = InventorySettings.equipment_slots
	local num_slots = 5
	local total_item_power_level = 0

	for _, slot in pairs(slots) do
		local slot_name = slot.name
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			local backend_id = item.backend_id
			local power_level = backend_items:get_item_power_level(backend_id)

			if power_level then
				total_item_power_level = total_item_power_level + power_level
			end
		end
	end

	return total_item_power_level / num_slots
end

BackendUtils.get_total_power_level = function (profile_name, career_name, optional_game_mode_key)
	if script_data.power_level_override then
		return script_data.power_level_override
	end

	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager:has_activated_mutator("whiterun") then
		return MIN_POWER_LEVEL_CAP
	end

	local game_mode_key = optional_game_mode_key or game_mode_manager:game_mode_key()
	local game_mode_setting = GameModeSettings[game_mode_key]

	if game_mode_setting and game_mode_setting.power_level_override then
		return game_mode_setting.power_level_override
	end

	return Managers.backend:get_total_power_level(profile_name, career_name, game_mode_key)
end

BackendUtils.get_item_template = function (item_data, backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = item_data.backend_id or backend_id
	local template = backend_items:get_item_template(item_data, backend_id)

	return template
end

BackendUtils.get_item_units = function (item_data, backend_id, skin, career_name)
	local left_hand_unit = item_data.left_hand_unit
	local right_hand_unit = item_data.right_hand_unit
	local ammo_unit = item_data.ammo_unit
	local ammo_unit_3p = item_data.ammo_unit_3p
	local is_ammo_weapon = item_data.is_ammo_weapon
	local projectile_units_template = item_data.projectile_units_template
	local pickup_template_name = item_data.pickup_template_name
	local link_pickup_template_name = item_data.link_pickup_template_name
	local unit = item_data.unit
	local material = item_data.material
	local icon = item_data.hud_icon
	local backend_id = item_data.backend_id or backend_id
	local skin_name, material_settings

	if career_name then
		left_hand_unit = item_data.left_hand_unit_override and item_data.left_hand_unit_override[career_name] or left_hand_unit
		right_hand_unit = item_data.right_hand_unit_override and item_data.right_hand_unit_override[career_name] or right_hand_unit
	end

	if backend_id or skin then
		if not skin then
			local backend_items = Managers.backend:get_interface("items")

			skin = backend_items:get_skin(backend_id)
		end

		if skin then
			local skin_template = WeaponSkins.skins[skin]

			left_hand_unit = skin_template.left_hand_unit
			right_hand_unit = skin_template.right_hand_unit
			ammo_unit = skin_template.ammo_unit
			ammo_unit_3p = skin_template.ammo_unit_3p
			projectile_units_template = skin_template.projectile_units_template
			pickup_template_name = skin_template.pickup_template_name
			link_pickup_template_name = skin_template.link_pickup_template_name
			icon = skin_template.hud_icon
			skin_name = skin
			material_settings = skin_template.material_settings

			if career_name then
				left_hand_unit = skin_template.left_hand_unit_override and skin_template.left_hand_unit_override[career_name] or left_hand_unit
				right_hand_unit = skin_template.right_hand_unit_override and skin_template.right_hand_unit_override[career_name] or right_hand_unit
			end
		end
	end

	if item_data.item_units_to_replace or left_hand_unit or right_hand_unit or unit or material or icon then
		local units = {
			left_hand_unit = left_hand_unit,
			right_hand_unit = right_hand_unit,
			ammo_unit = ammo_unit,
			ammo_unit_3p = ammo_unit_3p,
			projectile_units_template = projectile_units_template,
			pickup_template_name = pickup_template_name,
			link_pickup_template_name = link_pickup_template_name,
			is_ammo_weapon = is_ammo_weapon,
			unit = unit,
			material = material,
			icon = icon,
			skin = skin_name,
			material_settings = material_settings,
		}

		return units
	end

	fassert(false, "no left hand or right hand unit defined for : " .. item_data.backend_id)
end

BackendUtils.format_profile_hash = function (hash, num_chars, block_length, block_divider)
	if not hash then
		return "n/a"
	end

	local str = ""

	for ii = 1, num_chars, block_length do
		local block = string.sub(hash, ii, ii + block_length - 1)

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
	local items = backend_items:get_filtered_items(item_filter)
	local has_chest = #items > 0

	return has_chest
end

local CAREER_ID_LOOKUP = {
	"dr_ranger",
	"dr_slayer",
	"dr_ironbreaker",
	"dr_engineer",
	"we_waywatcher",
	"we_shade",
	"we_maidenguard",
	"es_huntsman",
	"es_mercenary",
	"es_knight",
	"es_questingknight",
	"bw_adept",
	"bw_scholar",
	"bw_unchained",
	"wh_captain",
	"wh_bountyhunter",
	"wh_zealot",
	"we_thornsister",
	"wh_priest",
	"bw_necromancer",
}

BackendUtils.calculate_weave_score = function (tier, score, career_name)
	local career_index = table.find(CAREER_ID_LOOKUP, career_name)
	local weave_score = math.floor((tier * 100000 + score) * 100 + career_index - 2147483648)

	return weave_score
end

BackendUtils.convert_weave_score = function (weave_score)
	local value = weave_score + 2147483648
	local career_index = math.round((value / 100 - math.floor(value / 100)) * 100)
	local career_name = CAREER_ID_LOOKUP[career_index]

	value = math.floor(value / 100)

	local score = math.round((value / 100000 - math.floor(value / 100000)) * 100000)

	value = math.floor(value / 100000)

	local tier = value

	return tier, score, career_name
end

BackendUtils.commit_load_time_data = function (load_time_data)
	local common = Managers.backend:get_interface("common")

	common:commit_load_time_data(load_time_data)
end

local CURRENCY_LOOKUP = {
	SM = {
		"shillings_01",
		[5] = "shillings_02",
		[10] = "shillings_03",
		[25] = "shillings_04",
		[50] = "shillings_05",
		[100] = "shillings_06",
	},
}

BackendUtils.get_fake_currency_item = function (currency_code, amount)
	local lookup = CURRENCY_LOOKUP[currency_code]

	fassert(lookup, "Unsupported currency code '%s'", currency_code)

	local item_key = lookup[amount]

	item_key = item_key or amount >= 1 and amount < 50 and "shillings_small" or amount >= 50 and amount < 100 and "shillings_medium" or "shillings_large"

	local data = Currencies[item_key]

	return table.clone(data), item_key
end
