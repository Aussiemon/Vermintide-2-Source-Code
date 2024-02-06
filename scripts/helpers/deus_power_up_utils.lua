-- chunkname: @scripts/helpers/deus_power_up_utils.lua

require("scripts/settings/dlcs/morris/deus_power_up_settings")

PowerUpClientIdCount = PowerUpClientIdCount or 0

local function generate_random_id()
	return math.random_seed()
end

local function get_random_power_up(seed, power_ups)
	if #power_ups > 0 then
		local power_up_index

		seed, power_up_index = Math.next_random(seed, 1, #power_ups)

		return seed, power_ups[power_up_index]
	end

	return seed, nil
end

local function get_random_power_up_rarity(seed, difficulty, run_progress)
	local config = DeusPowerUpRarityChance[difficulty] or DeusPowerUpRarityChance.default
	local random

	seed, random = Math.next_random(seed)

	local index
	local weight_sum = 0

	for rarity, weights in pairs(config) do
		index = index or math.floor(#weights * run_progress + 1)
		weight_sum = weight_sum + weights[index]

		local value = weight_sum

		if random < value then
			return seed, rarity
		end
	end

	ferror("shouldn't happen, something wrong with the code")
end

local function get_maxed_out_power_ups(power_ups)
	local maxed_out_power_ups = {}
	local power_ups_by_amount = {}

	for _, power_up_instance in ipairs(power_ups) do
		local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

		if power_up.max_amount then
			local amount = power_ups_by_amount[power_up.name] or power_up.max_amount

			amount = amount - 1
			power_ups_by_amount[power_up.name] = amount

			if amount <= 0 then
				maxed_out_power_ups[power_up.name] = true
			end
		end
	end

	return maxed_out_power_ups
end

local function is_power_up_in_incompatibility_list(career_name, power_up_name, incompatibility)
	local default_list = incompatibility.default

	if default_list and table.contains(default_list, power_up_name) then
		return true
	end

	local career_list = incompatibility[career_name]

	if career_list and table.contains(career_list, power_up_name) then
		return true
	end

	return false
end

local function is_power_up_incompatible(career_name, existing_power_ups, power_up)
	local new_power_up_incompatibility = power_up.incompatibility
	local power_up_name = power_up.name

	for _, existing_power_up_instance in ipairs(existing_power_ups) do
		local existing_power_up = DeusPowerUps[existing_power_up_instance.rarity][existing_power_up_instance.name]
		local existing_power_up_name = existing_power_up.name
		local existing_power_up_incompatibility = existing_power_up.incompatibility

		if existing_power_up_incompatibility and is_power_up_in_incompatibility_list(career_name, power_up_name, existing_power_up_incompatibility) then
			return true
		end

		if new_power_up_incompatibility and is_power_up_in_incompatibility_list(career_name, existing_power_up_name, new_power_up_incompatibility) then
			return true
		end
	end

	return false
end

local function get_available_power_ups_array(career_name, excluded_power_ups, existing_power_ups, rarity, availability_type)
	local all_excluded_power_ups = {}

	for _, power_up in ipairs(excluded_power_ups) do
		all_excluded_power_ups[power_up.name] = true
	end

	local maxed_out_power_ups = get_maxed_out_power_ups(existing_power_ups)

	for power_up_name, _ in pairs(maxed_out_power_ups) do
		all_excluded_power_ups[power_up_name] = true
	end

	local career_excluded_power_ups = DeusPowerUpExclusionList[career_name] or {}

	for power_up_name, _ in pairs(career_excluded_power_ups) do
		all_excluded_power_ups[power_up_name] = true
	end

	local available_power_ups = {}
	local possible_power_ups_array = DeusPowerUpsArray[rarity] or {}

	for _, power_up_instance in ipairs(possible_power_ups_array) do
		local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
		local excluded = all_excluded_power_ups[power_up.name]

		if not excluded and table.contains(power_up.availability, availability_type) and not is_power_up_incompatible(career_name, existing_power_ups, power_up_instance) then
			table.insert(available_power_ups, power_up)
		end
	end

	return available_power_ups
end

local function generate_random_power_up(seed, new_power_ups, existing_power_ups, difficulty, run_progress, availability_type, career_name, forced_rarity)
	local possible_power_ups = {}
	local rarity

	if forced_rarity then
		rarity = forced_rarity
	else
		seed, rarity = get_random_power_up_rarity(seed, difficulty, run_progress)
	end

	local start_rarity_index = table.index_of(DeusPowerUpRarities, rarity)

	for current_rarity_index = start_rarity_index, 1, -1 do
		rarity = DeusPowerUpRarities[current_rarity_index]
		possible_power_ups = get_available_power_ups_array(career_name, new_power_ups, existing_power_ups, rarity, availability_type)

		if #possible_power_ups > 0 then
			break
		end
	end

	if #possible_power_ups == 0 then
		for current_rarity_index = start_rarity_index + 1, #DeusPowerUpRarities do
			rarity = DeusPowerUpRarities[current_rarity_index]
			possible_power_ups = get_available_power_ups_array(career_name, new_power_ups, existing_power_ups, rarity, availability_type)

			if #possible_power_ups > 0 then
				break
			end
		end
	end

	fassert(#possible_power_ups > 0, "not enough power_ups left in the pool")

	local power_up

	seed, power_up = get_random_power_up(seed, possible_power_ups)

	local power_up_instance = {
		name = power_up.name,
		rarity = power_up.rarity,
		client_id = generate_random_id(),
	}

	return seed, power_up_instance
end

local function generate_specific_power_up(power_up_name, rarity)
	return {
		name = power_up_name,
		rarity = rarity,
		client_id = generate_random_id(),
	}
end

local function get_power_up_title_text(name)
	local power_up_data = DeusPowerUpTemplates[name]
	local display_name = power_up_data.display_name
	local description_values = power_up_data.description_values

	return UIUtils.format_localized_description(display_name, description_values)
end

DeusPowerUpUtils = DeusPowerUpUtils or {}

DeusPowerUpUtils.get_talent_from_power_up = function (talent_index, talent_tier, profile_index, career_index)
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_name = TalentTrees[profile_name][talent_tree_index][talent_tier][talent_index]
	local lookup = TalentIDLookup[talent_name]

	return Talents[profile_name][lookup.talent_id]
end

DeusPowerUpUtils.get_talent_power_up_from_tier_and_column = function (tier, column)
	local power_up_name = DeusPowerUpTalentLookup[tier][column]

	for rarity, power_ups in pairs(DeusPowerUps) do
		local actual_power_up = power_ups[power_up_name]

		if actual_power_up then
			return actual_power_up, rarity
		end
	end

	ferror("could not find power_up for tier %s and column %s", tier, column)
end

DeusPowerUpUtils.get_power_up_description = function (power_up_instance, profile_index, career_index)
	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

	if power_up.talent then
		local talent_settings = DeusPowerUpUtils.get_talent_from_power_up(power_up.talent_index, power_up.talent_tier, profile_index, career_index)

		return UIUtils.get_talent_description(talent_settings)
	else
		local power_up_description = UIUtils.get_trait_description(nil, power_up)

		return power_up_description
	end
end

DeusPowerUpUtils.get_power_up_icon = function (power_up_instance, profile_index, career_index)
	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

	if power_up.talent then
		local talent_settings = DeusPowerUpUtils.get_talent_from_power_up(power_up.talent_index, power_up.talent_tier, profile_index, career_index)

		return talent_settings.icon
	else
		return power_up.icon
	end
end

DeusPowerUpUtils.get_power_up_name_text = function (name, talent_index, talent_tier, profile_index, career_index)
	local title_text
	local sub_text = ""

	if talent_index and talent_tier then
		local talent = DeusPowerUpUtils.get_talent_from_power_up(talent_index, talent_tier, profile_index, career_index)

		title_text = Localize(talent.name)
	else
		title_text = get_power_up_title_text(name)
	end

	return title_text, sub_text
end

DeusPowerUpUtils.power_ups_to_string = function (power_ups)
	local string_array = {}

	for _, power_up in ipairs(power_ups) do
		table.insert(string_array, power_up.name)
		table.insert(string_array, "/")
		table.insert(string_array, power_up.rarity)
		table.insert(string_array, "/")
		table.insert(string_array, power_up.client_id)
		table.insert(string_array, ",")
	end

	return table.concat(string_array, "")
end

DeusPowerUpUtils.string_to_power_ups = function (power_ups_string)
	local power_ups = {}
	local power_up_data_strings = string.split(power_ups_string, ",")

	for _, power_up_data_string in ipairs(power_up_data_strings) do
		local power_up_data = string.split(power_up_data_string, "/")
		local power_up_name = power_up_data[1]
		local rarity = power_up_data[2]
		local power_up_client_id_string = power_up_data[3]
		local power_up_client_id = tonumber(power_up_client_id_string) or -1

		table.insert(power_ups, {
			name = power_up_name,
			rarity = rarity,
			client_id = power_up_client_id,
		})
	end

	return power_ups
end

DeusPowerUpUtils.generate_specific_power_up = function (power_up_name, rarity)
	return generate_specific_power_up(power_up_name, rarity)
end

DeusPowerUpUtils.generate_random_power_ups = function (seed, count, existing_power_ups, difficulty, run_progress, availability_type, career_name, forced_rarity)
	local new_power_ups = {}
	local skip_metatable = true

	existing_power_ups = table.clone(existing_power_ups, skip_metatable)

	for i = 1, count do
		local power_up

		seed, power_up = generate_random_power_up(seed, new_power_ups, existing_power_ups, difficulty, run_progress, availability_type, career_name, forced_rarity)

		table.insert(new_power_ups, power_up)
		table.insert(existing_power_ups, power_up)
	end

	return seed, new_power_ups
end

DeusPowerUpUtils.activate_deus_power_up = function (power_up_instance, buff_system, talent_interface, deus_backend, deus_run_controller, local_player_unit, profile_index, career_index)
	fassert(power_up_instance and buff_system and talent_interface and deus_backend and deus_run_controller and local_player_unit and profile_index and career_index, "DeusPowerUpUtils.activate_deus_power_up invalid arguments")

	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]

	if power_up.talent then
		local profile = SPProfiles[profile_index]
		local career_data = profile.careers[career_index]
		local career_name = career_data.name
		local profile_name = career_data.profile_name
		local talent_tree_index = career_data.talent_tree_index
		local talent_ids = talent_interface:get_talent_ids(career_name)
		local talent_index = power_up.talent_index
		local talent_tier = power_up.talent_tier
		local talent_name = TalentTrees[profile_name][talent_tree_index][talent_tier][talent_index]
		local lookup = TalentIDLookup[talent_name]
		local talent_id = lookup.talent_id

		talent_ids[#talent_ids + 1] = talent_id

		deus_backend:set_deus_talent_ids(career_name, talent_ids)

		local talent_extension = ScriptUnit.extension(local_player_unit, "talent_system")

		talent_extension:talents_changed()

		local inventory_extension = ScriptUnit.extension(local_player_unit, "inventory_system")

		inventory_extension:apply_buffs_to_ammo()
	else
		buff_system:add_buff(local_player_unit, power_up.buff_name, local_player_unit)
	end
end
