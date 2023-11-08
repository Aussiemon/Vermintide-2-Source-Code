MutatorUtils = MutatorUtils or {}

local function tweak_horde_size_value(value, multiplier)
	return math.max(1, math.ceil(value * multiplier))
end

local function tweak_horde_composition(compositions, composition_name, tweaked, multiplier)
	if tweaked[composition_name] then
		return
	end

	tweaked[composition_name] = true
	local composition = compositions[composition_name]

	if not composition then
		print("[MutatorUtils.update_conflict_settings_horde_size_modifier] did not find " .. composition_name)

		return
	end

	for _, variant in ipairs(composition) do
		local breeds = variant.breeds

		for i = 2, #breeds, 2 do
			local counts = breeds[i]
			counts[1] = tweak_horde_size_value(counts[1], multiplier)
			counts[2] = tweak_horde_size_value(counts[2], multiplier)
		end
	end
end

local function tweak_horde_compositions(compositions, composition_names, tweaked, multiplier)
	if type(composition_names) == "string" then
		tweak_horde_composition(compositions, composition_names, tweaked, multiplier)
	else
		for _, composition_name in ipairs(composition_names) do
			tweak_horde_composition(compositions, composition_name, tweaked, multiplier)
		end
	end
end

local function modify_time_table(time_table, modifier, dprint_string)
	local tt_1 = time_table[1]
	local tt_2 = time_table[2]
	time_table[1] = tt_1 - tt_1 * modifier
	time_table[2] = tt_2 - tt_2 * modifier
end

MutatorUtils.apply_buff_to_alive_player_units = function (context, data, buff_name)
	if not data.buffed_player_units then
		data.buffed_player_units = {}
	end

	local buffed_player_units = data.buffed_player_units

	if not buffed_player_units[buff_name] then
		buffed_player_units[buff_name] = {}
	end

	local player_units = buffed_player_units[buff_name]

	for unit, _ in pairs(player_units) do
		player_units[unit] = false
	end

	local side = Managers.state.side:get_side_from_name("heroes")
	local current_player_units = data.only_affect_players and side.PLAYER_UNITS or side.PLAYER_AND_BOT_UNITS
	local num_current_player_units = #current_player_units
	local get_extension = ScriptUnit.extension
	local new_buff_ids = {}

	for i = 1, num_current_player_units do
		local unit = current_player_units[i]

		if player_units[unit] == nil and HEALTH_ALIVE[unit] then
			local params = {
				attacker_unit = unit
			}
			local buff_ext = get_extension(unit, "buff_system")
			local buff_id = buff_ext:add_buff(buff_name, params)
			new_buff_ids[unit] = buff_id
		end

		player_units[unit] = true
	end

	for unit, updated in pairs(player_units) do
		if not updated then
			player_units[unit] = nil
		end
	end

	return new_buff_ids
end

MutatorUtils.store_breed_and_action_settings = function (context, data)
	if not context.original_breed_settings and not context.original_breed_action_settings then
		context.original_breed_settings = table.clone(Breeds)
		context.original_breed_action_settings = table.clone(BreedActions)
	end
end

MutatorUtils.restore_breed_and_action_settings = function (context, data)
	if context.original_breed_settings and context.original_breed_action_settings then
		Breeds = context.original_breed_settings
		BreedActions = context.original_breed_action_settings
		context.original_breed_settings = nil
		context.original_breed_action_settings = nil
	end
end

MutatorUtils.update_conflict_settings_horde_size_modifier = function (multipller)
	local pacing_settings = CurrentPacing

	if pacing_settings.disabled then
		return
	end

	local compositions = CurrentHordeSettings.compositions_pacing
	local tweaked = {}

	tweak_horde_compositions(compositions, CurrentHordeSettings.ambush_composition, tweaked, multipller)
	tweak_horde_compositions(compositions, CurrentHordeSettings.vector_composition, tweaked, multipller)
	tweak_horde_compositions(compositions, CurrentHordeSettings.vector_blob_composition, tweaked, multipller)
	tweak_horde_compositions(compositions, CurrentHordeSettings.mini_patrol_composition, tweaked, multipller)
end

MutatorUtils.update_conflict_settings_horde_frequency = function (horde_frequency_modifier, horde_startup_time_modifier, relax_duration_modifier, max_delay_modifier)
	local pacing_settings = CurrentPacing

	if not pacing_settings.disabled then
		modify_time_table(pacing_settings.horde_frequency, horde_frequency_modifier, "Changed horde frequency from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
		modify_time_table(pacing_settings.horde_startup_time, horde_startup_time_modifier, "Changed horde startup time from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
		modify_time_table(pacing_settings.relax_duration, relax_duration_modifier, "Changed relax duration from ({%s, %s}) to ({%s, %s}), modifier: %s - original")

		if pacing_settings.max_delay_until_next_horde then
			modify_time_table(pacing_settings.max_delay_until_next_horde, max_delay_modifier, "Changed max_delay_until_next_horde from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
		end
	end
end

MutatorUtils.tweak_pack_spawning_settings_convert_breeds = function (pack_spawning_settings, conversion_table)
	local breed_packs = pack_spawning_settings.roaming_set.breed_packs
	pack_spawning_settings.roaming_set.breed_packs = conversion_table[breed_packs] or breed_packs

	for _, breed_pack_override in ipairs(pack_spawning_settings.roaming_set.breed_packs_override) do
		local breed = breed_pack_override[1]
		breed_pack_override[1] = conversion_table[breed] or breed
	end

	if pack_spawning_settings.difficulty_overrides then
		for _, difficulty_override in pairs(pack_spawning_settings.difficulty_overrides) do
			for i = 1, #difficulty_override do
				local breed_pack_override = difficulty_override[i]
				local breed = breed_pack_override[1]
				breed_pack_override[1] = conversion_table[breed] or breed
			end
		end
	end
end

MutatorUtils.tweak_pack_spawning_settings_density_multiplier = function (pack_spawning_settings, density_multiplier)
	pack_spawning_settings.area_density_coefficient = pack_spawning_settings.area_density_coefficient * density_multiplier

	if pack_spawning_settings.difficulty_overrides then
		for _, difficulty_override in pairs(pack_spawning_settings.difficulty_overrides) do
			difficulty_override.area_density_coefficient = difficulty_override.area_density_coefficient * density_multiplier

			for i = 1, #difficulty_override do
				local breed_pack_override = difficulty_override[i]
				breed_pack_override[3] = breed_pack_override[3] * density_multiplier
			end
		end
	end
end

MutatorUtils.tweak_pack_spawning_settings_override_chance = function (pack_spawning_settings, min, max)
	pack_spawning_settings.roaming_set.breed_packs_peeks_overide_chance[1] = math.clamp(min, 0, 1)
	pack_spawning_settings.roaming_set.breed_packs_peeks_overide_chance[2] = math.clamp(max, 0, 1)
end

MutatorUtils.update_conflict_settings_specials_frequency = function (max_specials_multiplier, spawn_time_reduction_multiplier)
	local settings = CurrentSpecialsSettings

	if not settings.disabled then
		if settings.max_specials then
			local original = settings.max_specials
			settings.max_specials = math.round(settings.max_specials * max_specials_multiplier)
		end

		for method_name, method_settings in pairs(settings.methods) do
			local modified = false

			if method_name == "specials_by_time_window" then
				local spawn_interval = method_settings.spawn_interval
				spawn_interval[1] = spawn_interval[1] * spawn_time_reduction_multiplier
				spawn_interval[2] = spawn_interval[2] * spawn_time_reduction_multiplier
				modified = true
				local new_1 = spawn_interval[1]
				local new_2 = spawn_interval[2]
				local old_1 = new_1 / spawn_time_reduction_multiplier
				local old_2 = new_2 / spawn_time_reduction_multiplier
			end

			if method_name == "specials_by_slots" then
				local spawn_cooldown = method_settings.spawn_cooldown
				spawn_cooldown[1] = spawn_cooldown[1] * spawn_time_reduction_multiplier
				spawn_cooldown[2] = spawn_cooldown[2] * spawn_time_reduction_multiplier
				modified = true
				local new_1 = spawn_cooldown[1]
				local new_2 = spawn_cooldown[2]
				local old_1 = new_1 / spawn_time_reduction_multiplier
				local old_2 = new_2 / spawn_time_reduction_multiplier
			end

			fassert(modified, "MutatorUtils.update_conflict_settings_specials_frequency: Found new method_name (%s)", method_name)
		end
	end
end
