require("scripts/settings/dlcs/morris/deus_weapons")
require("scripts/helpers/deus_gen_utils")

local FLOAT_CONVERSION_EPSILON = 100000
local deus_rarity_chance = {}

for difficulty, config in pairs(DeusDropRarityWeights) do
	local normalized_config = {}
	local count = #config.plentiful

	for i = 1, count, 1 do
		local weight_sum = 0

		for _, weights in pairs(config) do
			weight_sum = weight_sum + weights[i]
		end

		for rarity, weights in pairs(config) do
			normalized_config[rarity] = normalized_config[rarity] or {}
			normalized_config[rarity][i] = weights[i] / weight_sum
		end
	end

	deus_rarity_chance[difficulty] = normalized_config
end

local function get_random_rarity(random_generator, difficulty, run_progress)
	fassert(run_progress < 1 and run_progress >= 0, "Run progress should never be equal or higher than 1.0")

	local config = deus_rarity_chance[difficulty] or deus_rarity_chance.default
	local progress_index = nil
	local total_weight_sum = 0

	for _, weights in pairs(config) do
		progress_index = progress_index or math.floor(#weights * run_progress + 1)
		total_weight_sum = total_weight_sum + weights[progress_index]
	end

	local random = random_generator(1, total_weight_sum * 100)
	local current_weight_sum = 0

	for rarity, weights in pairs(config) do
		current_weight_sum = current_weight_sum + weights[progress_index] * 100

		if random <= current_weight_sum then
			return rarity
		end
	end

	fassert(false, "shouldn't happen, something wrong with the code")
end

local function get_power_level(rarity, difficulty, run_progress)
	local config = DeusDropPowerlevelRanges[difficulty] or DeusDropPowerlevelRanges.default
	local min = config[rarity][1]
	local max = config[rarity][2]

	return math.ceil(math.lerp(min, max, run_progress))
end

local function deus_get_combined_slot_chances(weapon_groups_pool, slot_chance_melee, slot_chance_ranged)
	local num_weapons = table.size(weapon_groups_pool)
	local default_weapon_weight = 1 / num_weapons
	local weight_melee = 0
	local weight_ranged = 0
	local deus_weapon_groups = DeusWeaponGroups

	for weapon_group_name, _ in pairs(weapon_groups_pool) do
		local slot_type = deus_weapon_groups[weapon_group_name].slot_type

		if slot_type == "melee" then
			weight_melee = weight_melee + default_weapon_weight
		else
			weight_ranged = weight_ranged + default_weapon_weight
		end
	end

	return weight_melee * slot_chance_melee, weight_ranged * slot_chance_ranged
end

local function get_random_slot(rarity, random_generator, weapon_pool, slot_chance_melee, slot_chance_ranged)
	local chance_melee, chance_ranged = deus_get_combined_slot_chances(weapon_pool[rarity], slot_chance_melee, slot_chance_ranged)
	local slot = nil

	if chance_melee > 0 and chance_ranged > 0 then
		local slot_random = random_generator(0, chance_melee + chance_ranged)

		if slot_random < chance_melee then
			slot = "melee"
		else
			slot = "ranged"
		end
	elseif chance_melee > 0 then
		slot = "melee"
	else
		slot = "ranged"
	end

	return slot
end

local function get_random_weapon_key(slot, rarity, weapon_pool, random_generator)
	local weapon_keys = {}
	local deus_weapon_groups = DeusWeaponGroups

	for weapon_group_name, weapon_key in pairs(weapon_pool[rarity]) do
		local weapon_slot = deus_weapon_groups[weapon_group_name].slot_type

		if weapon_slot == slot then
			table.insert(weapon_keys, weapon_key)
		end
	end

	fassert(#weapon_keys > 0, "Failed to generate a weapon due to weapon_pool state : " .. table.tostring(weapon_pool))

	local random_index = random_generator(1, #weapon_keys)

	return weapon_keys[random_index]
end

local function get_possible_skins(item_key, rarity)
	local deus_item_data = DeusWeapons[item_key]
	local base_item_data = ItemMasterList[deus_item_data.base_item]
	local skins = nil

	if deus_item_data.fixed_skin then
		skins = {
			deus_item_data.fixed_skin
		}
	elseif base_item_data.skin_combination_table then
		local skin_combination_table = base_item_data.skin_combination_table
		local skin_by_rarity = WeaponSkins.skin_combinations[skin_combination_table]
		skins = skin_by_rarity and skin_by_rarity[rarity]
	end

	if skins then
		local unlocked_skins = Managers.backend:get_interface("crafting"):get_unlocked_weapon_skins()

		for i = #skins, 1, -1 do
			if not unlocked_skins[skins[i]] then
				table.remove(skins, i)
			end
		end
	end

	return skins
end

local function get_possible_property_combinations(item_key, rarity)
	local deus_item_data = DeusWeapons[item_key]
	local property_combinations_by_rarity = WeaponProperties.combinations[deus_item_data.property_table_name]

	return property_combinations_by_rarity and property_combinations_by_rarity[rarity]
end

local function get_possible_trait_combinations(item_key, rarity)
	if rarity ~= "exotic" and rarity ~= "unique" then
		return
	end

	local deus_item_data = DeusWeapons[item_key]
	local combinations = nil
	combinations = WeaponTraits.combinations[deus_item_data.trait_table_name]

	return combinations
end

local function get_possible_archetypes(item_key)
	local deus_item_data = DeusWeapons[item_key]

	return deus_item_data.archetypes
end

local function create_item(item_key, properties, traits, skin, powerlevel, rarity)
	local deus_item_data = DeusWeapons[item_key]
	local base_item_data = ItemMasterList[deus_item_data.base_item]
	local item = {
		power_level = powerlevel,
		data = base_item_data,
		rarity = rarity,
		key = deus_item_data.base_item,
		deus_item_key = item_key,
		properties = properties,
		traits = traits,
		skin = skin,
		bypass_skin_ownership_check = true
	}

	return item
end

local function generate_item_from_item_key(item_key, difficulty, run_progress, rarity, random_generator)
	local powerlevel = get_power_level(rarity, difficulty, run_progress)
	local archetypes = get_possible_archetypes(item_key)
	local properties, traits = nil

	if archetypes then
		local archetype_random = random_generator(1, #archetypes)
		local archetype = DeusWeaponArchetypes[archetypes[archetype_random]]
		properties = archetype.properties
		traits = archetype.traits
	else
		local property_combinations = get_possible_property_combinations(item_key, rarity)

		if property_combinations and #property_combinations > 0 then
			local property_random = random_generator(1, #property_combinations)
			local properties_to_apply = property_combinations[property_random]
			properties = {}

			for _, property_key in ipairs(properties_to_apply) do
				local value = nil

				if rarity == "unique" then
					value = 1
				else
					value = random_generator(1, 100) / 100
				end

				properties[property_key] = value
			end
		end

		local trait_combinations = get_possible_trait_combinations(item_key, rarity)

		if trait_combinations and #trait_combinations > 0 then
			local trait_random = random_generator(1, #trait_combinations)
			local traits_to_apply = trait_combinations[trait_random]
			traits = {}

			for _, trait_key in ipairs(traits_to_apply) do
				traits[#traits + 1] = trait_key
			end
		end
	end

	local skins = get_possible_skins(item_key, rarity)
	local skin = (skins and #skins > 0 and skins[random_generator(1, #skins)]) or nil

	return create_item(item_key, properties, traits, skin, powerlevel, rarity)
end

local function upgrade_item(item, difficulty, run_progress, target_rarity, random_generator)
	local powerlevel = get_power_level(target_rarity, difficulty, run_progress)
	local item_key = item.deus_item_key
	local properties = {}
	local existing_properties = item.properties or {}
	local traits = {}
	local existing_traits = item.traits or {}
	local property_combinations = get_possible_property_combinations(item_key, target_rarity) or {}
	local filtered_property_combinations = {}

	for _, property_combination in ipairs(property_combinations) do
		local contains_existing_properties = true

		for existing_property, _ in pairs(existing_properties) do
			contains_existing_properties = contains_existing_properties and table.contains(property_combination, existing_property)
		end

		if contains_existing_properties then
			table.insert(filtered_property_combinations, property_combination)
		end
	end

	if #filtered_property_combinations > 0 then
		local property_random = random_generator(1, #filtered_property_combinations)
		local properties_to_apply = filtered_property_combinations[property_random]

		for _, property_key in ipairs(properties_to_apply) do
			local value = nil
			local is_existing_property = table.contains(table.keys(existing_properties), property_key)

			if target_rarity == "unique" then
				value = 1
			elseif is_existing_property then
				value = existing_properties[property_key]
			else
				value = random_generator(1, 100) / 100
			end

			properties[property_key] = value
		end
	end

	local trait_combinations = get_possible_trait_combinations(item_key, target_rarity) or {}
	local filtered_trait_combinations = {}

	for _, trait_combination in ipairs(trait_combinations) do
		local contains_existing_traits = true

		for _, existing_trait in ipairs(existing_traits) do
			contains_existing_traits = contains_existing_traits and table.contains(trait_combination, existing_trait)
		end

		if contains_existing_traits then
			table.insert(filtered_trait_combinations, trait_combination)
		end
	end

	if #filtered_trait_combinations > 0 then
		local trait_random = random_generator(1, #filtered_trait_combinations)
		local traits_to_apply = filtered_trait_combinations[trait_random]

		for _, trait_key in ipairs(traits_to_apply) do
			traits[#traits + 1] = trait_key
		end
	end

	local skins = get_possible_skins(item_key, target_rarity)
	local skin = (skins and #skins > 0 and skins[random_generator(1, #skins)]) or nil

	return create_item(item_key, properties, traits, skin, powerlevel, target_rarity)
end

DeusWeaponGeneration = DeusWeaponGeneration or {}

DeusWeaponGeneration.serialize_weapon = function (item)
	local string_array = {}

	fassert(item.deus_item_key, "weapon malformed.")

	string_array[#string_array + 1] = "item_key="
	string_array[#string_array + 1] = item.deus_item_key
	string_array[#string_array + 1] = ","
	string_array[#string_array + 1] = "powerlevel="
	string_array[#string_array + 1] = tostring(item.power_level)
	string_array[#string_array + 1] = ","
	string_array[#string_array + 1] = "rarity="
	string_array[#string_array + 1] = item.rarity

	if item.skin then
		string_array[#string_array + 1] = ","
		string_array[#string_array + 1] = "skin="
		string_array[#string_array + 1] = item.skin
	end

	if item.properties then
		for prop_name, prop_value in pairs(item.properties) do
			string_array[#string_array + 1] = ","
			string_array[#string_array + 1] = "property="
			string_array[#string_array + 1] = prop_name
			string_array[#string_array + 1] = ":"
			string_array[#string_array + 1] = math.round(prop_value * FLOAT_CONVERSION_EPSILON)
		end
	end

	if item.traits then
		for _, trait_name in ipairs(item.traits) do
			string_array[#string_array + 1] = ","
			string_array[#string_array + 1] = "trait="
			string_array[#string_array + 1] = trait_name
		end
	end

	return table.concat(string_array)
end

DeusWeaponGeneration.deserialize_weapon = function (item_string)
	local item_key, properties, traits, skin, power_level, rarity = nil
	local weapon_items = string.split(item_string, ",")

	for _, weapon_item in ipairs(weapon_items) do
		local prefix_and_value = string.split(weapon_item, "=")
		local prefix = prefix_and_value[1]
		local value = prefix_and_value[2]

		if prefix == "item_key" then
			item_key = value
		elseif prefix == "skin" then
			skin = value
		elseif prefix == "trait" then
			traits = traits or {}
			traits[#traits + 1] = value
		elseif prefix == "property" then
			local prop_name_and_value = string.split(value, ":")
			properties = properties or {}
			properties[prop_name_and_value[1]] = tonumber(prop_name_and_value[2]) / FLOAT_CONVERSION_EPSILON
		elseif prefix == "powerlevel" then
			power_level = tonumber(value)
		elseif prefix == "rarity" then
			rarity = value
		end
	end

	return create_item(item_key, properties, traits, skin, power_level, rarity)
end

DeusWeaponGeneration.create_weapon = function (item_key, properties, traits, skin, powerlevel, rarity)
	return create_item(item_key, properties, traits, skin, powerlevel, rarity)
end

DeusWeaponGeneration.get_possibilities_for_item_key = function (item_key, difficulty, run_progress, rarity)
	local archetypes = get_possible_archetypes(item_key)
	local skins = get_possible_skins(item_key, rarity)
	local powerlevel = get_power_level(rarity, difficulty, run_progress)
	local property_combinations, trait_combinations = nil

	if not archetypes then
		property_combinations = get_possible_property_combinations(item_key, rarity)
		trait_combinations = get_possible_trait_combinations(item_key, rarity)
	end

	return powerlevel, archetypes, property_combinations, trait_combinations, (skins and #skins > 0 and skins) or nil
end

DeusWeaponGeneration.generate_item_from_item_key = function (item_key, difficulty, run_progress, rarity, seed)
	local random_generator = DeusGenUtils.create_random_generator(seed)

	return generate_item_from_item_key(item_key, difficulty, run_progress, rarity, random_generator)
end

DeusWeaponGeneration.get_random_rarity = function (difficulty, run_progress, seed)
	local random_generator = DeusGenUtils.create_random_generator(seed)

	return get_random_rarity(random_generator, difficulty, run_progress)
end

DeusWeaponGeneration.upgrade_item = function (item, difficulty, run_progress, target_rarity, seed)
	local random_generator = DeusGenUtils.create_random_generator(seed)

	return upgrade_item(item, difficulty, run_progress, target_rarity, random_generator)
end

DeusWeaponGeneration.generate_weapon = function (difficulty, run_progress, rarity, seed, weapon_pool, slot_chance_melee, slot_chance_ranged)
	local random_generator = DeusGenUtils.create_random_generator(seed)
	local slot = get_random_slot(rarity, random_generator, weapon_pool, slot_chance_melee, slot_chance_ranged)
	local weapon_key = get_random_weapon_key(slot, rarity, weapon_pool, random_generator)

	if not weapon_key then
		return
	end

	return generate_item_from_item_key(weapon_key, difficulty, run_progress, rarity, random_generator)
end

DeusWeaponGeneration.generate_weapon_for_slot = function (difficulty, run_progress, rarity, seed, weapon_pool, slot)
	local random_generator = DeusGenUtils.create_random_generator(seed)
	local weapon_key = get_random_weapon_key(slot, rarity, weapon_pool, random_generator)

	if not weapon_key then
		return
	end

	return generate_item_from_item_key(weapon_key, difficulty, run_progress, rarity, random_generator)
end

DeusWeaponGeneration.generate_weapon_pool = function (career, weapon_group_whitelist)
	local weapon_pool = {}

	for _, rarities in pairs(DeusDropRarityWeights) do
		for rarity in pairs(rarities) do
			weapon_pool[rarity] = {}
		end
	end

	for weapon_group_name, data in pairs(DeusWeaponGroups) do
		local can_wield_weapon = table.contains(data.can_wield, career)
		local is_weapon_unlocked = weapon_group_whitelist[weapon_group_name]

		if is_weapon_unlocked and can_wield_weapon then
			local weapon_key = data.default

			for _, weapon_keys in pairs(weapon_pool) do
				weapon_keys[weapon_group_name] = weapon_key
			end

			for rarity, weapon_keys in pairs(data.items_per_rarity) do
				for _, weapon_key in ipairs(weapon_keys) do
					weapon_pool[rarity][weapon_group_name] = weapon_key
				end
			end
		end
	end

	return weapon_pool
end

DeusWeaponGeneration.get_weapon_pool_slot_amounts = function (base_weapon_pool, weapon_pool)
	local slot_amounts = {}
	local deus_weapon_groups = DeusWeaponGroups

	for rarity, weapon_groups in pairs(base_weapon_pool) do
		for weapon_group_name, _ in pairs(weapon_groups) do
			local slot_type = deus_weapon_groups[weapon_group_name].slot_type
			slot_amounts[rarity] = slot_amounts[rarity] or {}
			slot_amounts[rarity][slot_type] = slot_amounts[rarity][slot_type] or 0
			local has_slot = weapon_pool[rarity][weapon_group_name] ~= nil

			if has_slot then
				slot_amounts[rarity][slot_type] = slot_amounts[rarity][slot_type] + 1
			end
		end
	end

	return slot_amounts
end

return
