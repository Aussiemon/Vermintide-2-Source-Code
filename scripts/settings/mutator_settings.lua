local function apply_buff_to_alive_player_units(context, data, buff_name)
	local player_units = data.player_units

	for unit, _ in pairs(player_units) do
		player_units[unit] = false
	end

	local current_player_units = PLAYER_AND_BOT_UNITS
	local num_current_player_units = #current_player_units
	local get_extension = ScriptUnit.extension
	local unit_alive = AiUtils.unit_alive

	for i = 1, num_current_player_units, 1 do
		local unit = current_player_units[i]
		local unit_alive = unit_alive(unit)

		if player_units[unit] == nil and unit_alive then
			mutator_dprint("Added buff (%s) to player", buff_name)

			local params = {
				attacker_unit = unit
			}
			local buff_ext = get_extension(unit, "buff_system")

			buff_ext.add_buff(buff_ext, buff_name, params)
		end

		player_units[unit] = true
	end

	for unit, updated in pairs(player_units) do
		if not updated then
			player_units[unit] = nil
		end
	end

	return 
end

local mutator_settings = {
	no_ammo = {
		description = "description_mutator_no_ammo",
		icon = "mutator_icon_no_ammo",
		display_name = "display_name_mutator_no_ammo",
		remove_pickups = {
			"ammo"
		}
	},
	no_pickups = {
		description = "description_mutator_no_pickups",
		icon = "mutator_icon_no_pickups",
		display_name = "display_name_mutator_no_pickups",
		remove_pickups = {
			"all"
		}
	},
	player_dot = {
		description = "description_mutator_player_dot",
		display_name = "display_name_mutator_player_dot",
		icon = "mutator_icon_player_dot",
		server_start_function = function (context, data)
			data.player_units = {}

			return 
		end,
		server_update_function = function (context, data, dt, t)
			apply_buff_to_alive_player_units(context, data, "mutator_player_dot")

			return 
		end
	},
	instant_death = {
		description = "description_mutator_instant_death",
		icon = "mutator_icon_instant_death",
		display_name = "display_name_mutator_instant_death"
	},
	whiterun = {
		description = "description_mutator_whiterun",
		display_name = "display_name_mutator_whiterun",
		icon = "mutator_icon_whiterun",
		check_dependencies = function ()
			if not BackendUtils.get_total_power_level then
				return false
			end

			if not GearUtils.get_property_and_trait_buffs then
				return false
			end

			return true
		end,
		client_start_function = function (context, data)
			local vanilla_get_total_power_level = BackendUtils.get_total_power_level

			local function get_total_power_level_whiterun(profile_name, career_name)
				return 200
			end

			BackendUtils.get_total_power_level = get_total_power_level_whiterun
			data.vanilla_get_total_power_level = vanilla_get_total_power_level
			local vanilla_get_property_and_trait_buffs = GearUtils.get_property_and_trait_buffs

			local function get_property_and_trait_buffs_whiterun(backend_items, backend_id, buffs_table)
				return buffs_table
			end

			GearUtils.get_property_and_trait_buffs = get_property_and_trait_buffs_whiterun
			data.vanilla_get_property_and_trait_buffs = vanilla_get_property_and_trait_buffs

			return 
		end,
		client_stop_function = function (context, data)
			BackendUtils.get_total_power_level = data.vanilla_get_total_power_level
			data.vanilla_get_total_power_level = nil
			GearUtils.get_property_and_trait_buffs = data.vanilla_get_property_and_trait_buffs
			data.vanilla_get_property_and_trait_buffs = nil

			return 
		end
	},
	no_respawn = {
		description = "description_mutator_no_respawn",
		display_name = "display_name_mutator_no_respawn",
		icon = "mutator_icon_no_respawn",
		server_start_game_mode_function = function (context, data)
			Managers.state.spawn:set_respawning_enabled(false)

			return 
		end,
		server_stop_function = function (context, data)
			return 
		end
	},
	elite_run = {
		description = "description_mutator_elite_run",
		icon = "mutator_icon_elite_run",
		display_name = "display_name_mutator_elite_run",
		roamer_override_lookup = {
			chaos_marauder_with_shield = "chaos_berzerker",
			chaos_fanatic = "chaos_marauder",
			skaven_clan_rat_with_shield = "skaven_storm_vermin",
			skaven_clan_rat = "skaven_storm_vermin",
			chaos_marauder = "chaos_raider"
		},
		horde_override_lookup = {
			chaos_fanatic = "chaos_marauder",
			skaven_slave = "skaven_clan_rat"
		},
		server_start_function = function (context, data)
			local horde_override_lookup = data.template.horde_override_lookup
			local vanilla_horde_compositions = {}

			for name, composition in pairs(HordeCompositions) do
				vanilla_horde_compositions[name] = table.clone(composition)
				local i = 1

				while composition[i] ~= nil do
					local variant = composition[i]
					local breeds = variant.breeds
					local num_breeds = #breeds

					for j = 1, num_breeds, 2 do
						local breed_name = breeds[j]
						local new_breed_name = horde_override_lookup[breed_name]

						if new_breed_name then
							mutator_dprint("Switching horde composition(%s) variant(%i), breed_name(%s) to (%s)", name, i, breed_name, new_breed_name)

							breeds[j] = new_breed_name
						end
					end

					i = i + 1
				end
			end

			data.vanilla_horde_compositions = vanilla_horde_compositions

			return 
		end,
		server_start_game_mode_function = function (context, data)
			local roamer_override_lookup = data.template.roamer_override_lookup

			Managers.state.entity:system("ai_interest_point_system"):set_breed_override_lookup(roamer_override_lookup)
			Managers.state.conflict:set_breed_override_lookup(roamer_override_lookup)

			return 
		end,
		server_stop_function = function (context, data)
			local vanilla_horde_compositions = data.vanilla_horde_compositions

			for name, composition in pairs(HordeCompositions) do
				local vanilla_composition = vanilla_horde_compositions[name]
				local i = 1

				while composition[i] ~= nil do
					local variant = composition[i]
					local breeds = variant.breeds
					local num_breeds = #breeds
					variant.breeds = vanilla_composition[i].breeds
					i = i + 1
				end

				mutator_dprint("Switching back horde composition for %s", name)
			end

			return 
		end
	},
	specials_frequency = {
		description = "description_mutator_specials_frequency",
		icon = "mutator_icon_specials_frequency",
		display_name = "display_name_mutator_specials_frequency",
		spawn_time_reduction = 0.4,
		max_specials = 2,
		server_start_function = function (context, data)
			local template = data.template
			local vanilla_specials_settings = {}

			for name, settings in pairs(SpecialsSettings) do
				vanilla_specials_settings[name] = table.clone(settings)

				if not settings.disabled then
					local debug_string = sprintf("Modifying SpecialsSettings.%s", name)

					if settings.max_specials then
						settings.max_specials = settings.max_specials + template.max_specials
						debug_string = sprintf("%s max_specials=%s old(%s)", debug_string, tostring(settings.max_specials), tostring(settings.max_specials - template.max_specials))
					end

					local spawn_time_reduction = template.spawn_time_reduction

					for method_name, method_settings in pairs(settings.methods) do
						local modified = false

						if method_name == "specials_by_time_window" then
							method_settings.spawn_interval[1] = method_settings.spawn_interval[1] * spawn_time_reduction
							method_settings.spawn_interval[2] = method_settings.spawn_interval[2] * spawn_time_reduction
							modified = true
							local new_1 = method_settings.spawn_interval[1]
							local new_2 = method_settings.spawn_interval[2]
							local old_1 = new_1 / spawn_time_reduction
							local old_2 = new_2 / spawn_time_reduction
							debug_string = sprintf("%s specials_by_time_window.spawn_interval(%s, %s) old(%s, %s)", debug_string, new_1, new_2, old_1, old_2)
						end

						if method_name == "specials_by_slots" then
							local spawn_cooldown = method_settings.spawn_cooldown
							method_settings.spawn_cooldown[1] = method_settings.spawn_cooldown[1] * spawn_time_reduction
							method_settings.spawn_cooldown[2] = method_settings.spawn_cooldown[2] * spawn_time_reduction
							modified = true
							local new_1 = method_settings.spawn_cooldown[1]
							local new_2 = method_settings.spawn_cooldown[2]
							local old_1 = new_1 / spawn_time_reduction
							local old_2 = new_2 / spawn_time_reduction
							debug_string = sprintf("%s specials_by_slots.spawn_cooldown(%s, %s) old(%s, %s)", debug_string, new_1, new_2, old_1, old_2)
						end

						fassert(modified, "MutatorSettings.specials_frequency: Found new method_name (%s)", method_name)
					end

					mutator_dprint(debug_string)
				end
			end

			data.vanilla_specials_settings = vanilla_specials_settings

			return 
		end,
		server_stop_function = function (context, data)
			local vanilla_specials_settings = data.vanilla_specials_settings

			for name, settings in pairs(SpecialsSettings) do
				local vanilla_settings = vanilla_specials_settings[name]

				if not settings.disabled then
					mutator_dprint("Switching back special settings to vanilla state - %s", name)

					if settings.max_specials then
						settings.max_specials = vanilla_settings.max_specials

						mutator_dprint("Max Specials - %s", settings.max_specials)
					end

					mutator_dprint("Methods")

					for method_name, method_settings in pairs(settings.methods) do
						local vanilla_method_settings = vanilla_settings.methods[method_name]

						if method_name == "specials_by_time_window" then
							method_settings.spawn_interval[1] = vanilla_method_settings.spawn_interval[1]
							method_settings.spawn_interval[2] = vanilla_method_settings.spawn_interval[2]

							mutator_dprint("({%s, %s}) - %s", method_settings.spawn_interval[1], method_settings.spawn_interval[2], method_name)
						end

						if method_name == "specials_by_slots" then
							method_settings.spawn_cooldown[1] = vanilla_method_settings.spawn_cooldown[1]
							method_settings.spawn_cooldown[2] = vanilla_method_settings.spawn_cooldown[2]

							mutator_dprint("({%s, %s}) - %s", method_settings.spawn_cooldown[1], method_settings.spawn_cooldown[2], method_name)
						end
					end
				end
			end

			return 
		end
	},
	hordes_galore = {
		relax_duration_modifier = 0.7,
		horde_frequency_modifier = 0.9,
		display_name = "display_name_mutator_hordes_galore",
		description = "description_mutator_hordes_galore",
		horde_startup_time_modifier = 0.9,
		max_delay_modifier = 0.7,
		icon = "mutator_icon_hordes_galore",
		server_start_function = function (context, data)
			local function modify_time_table(time_table, modifier, dprint_string)
				local tt_1 = time_table[1]
				local tt_2 = time_table[2]
				time_table[1] = tt_1 - tt_1 * modifier
				time_table[2] = tt_2 - tt_2 * modifier

				mutator_dprint(dprint_string, tt_1, tt_2, time_table[1], time_table[2], modifier)

				return 
			end

			local template = data.template
			local horde_frequency_modifier = template.horde_frequency_modifier
			local horde_startup_time_modifier = template.horde_startup_time_modifier
			local relax_duration_modifier = template.relax_duration_modifier
			local max_delay_modifier = template.max_delay_modifier
			local vanilla_pacing_settings = {}

			for name, pacing_settings in pairs(PacingSettings) do
				vanilla_pacing_settings[name] = table.clone(pacing_settings)

				if not pacing_settings.disabled then
					mutator_dprint("Modifying pacing settings - %s", name)
					modify_time_table(pacing_settings.horde_frequency, horde_frequency_modifier, "Changed horde frequency from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
					modify_time_table(pacing_settings.horde_startup_time, horde_startup_time_modifier, "Changed horde startup time from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
					modify_time_table(pacing_settings.relax_duration, relax_duration_modifier, "Changed relax duration from ({%s, %s}) to ({%s, %s}), modifier: %s - original")

					if pacing_settings.max_delay_until_next_horde then
						modify_time_table(pacing_settings.max_delay_until_next_horde, max_delay_modifier, "Changed max_delay_until_next_horde from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
					end

					local difficulty_overrides = pacing_settings.difficulty_overrides

					if difficulty_overrides then
						mutator_dprint("DIFFICULTY OVERRIDES")

						for difficulty, overrides in pairs(difficulty_overrides) do
							if overrides.horde_frequency then
								modify_time_table(overrides.horde_frequency, horde_frequency_modifier, "Changed horde frequency from ({%s, %s}) to ({%s, %s}), modifier: %s - " .. difficulty)
							end

							if overrides.horde_startup_time then
								modify_time_table(overrides.horde_startup_time, horde_startup_time_modifier, "Changed horde startup time from ({%s, %s}) to ({%s, %s}), modifier: %s - " .. difficulty)
							end

							if overrides.relax_duration then
								modify_time_table(overrides.relax_duration, relax_duration_modifier, "Changed relax duration from ({%s, %s}) to ({%s, %s}), modifier: %s - " .. difficulty)
							end

							if overrides.max_delay_until_next_horde then
								modify_time_table(overrides.max_delay_until_next_horde, max_delay_modifier, "Changed max_delay_until_next_horde from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
							end
						end
					end
				end
			end

			data.vanilla_pacing_settings = vanilla_pacing_settings

			return 
		end,
		server_stop_function = function (context, data)
			local function reset_time_table(time_table, vanilla_time_table, dprint_string)
				local tt_1 = time_table[1]
				local tt_2 = time_table[2]
				local vanilla_tt_1 = vanilla_time_table[1]
				local vanilla_tt_2 = vanilla_time_table[2]
				time_table[1] = vanilla_tt_1
				time_table[2] = vanilla_tt_2
				local s = sprintf("Resetting time table from ({%s, %s}) to ({%s, %s}) - %s", tt_1, tt_2, vanilla_tt_1, vanilla_tt_2, dprint_string)

				mutator_dprint(s)

				return 
			end

			for name, pacing_settings in pairs(PacingSettings) do
				local vanilla_pacing_settings = data.vanilla_pacing_settings[name]

				if not pacing_settings.disabled then
					mutator_dprint("Switching back pace setting to vanilla state - %s", name)

					local vanilla_horde_frequency = vanilla_pacing_settings.horde_frequency

					reset_time_table(pacing_settings.horde_frequency, vanilla_horde_frequency, "horde_frequency - original")

					local vanilla_horde_startup_time = vanilla_pacing_settings.horde_startup_time

					reset_time_table(pacing_settings.horde_startup_time, vanilla_horde_startup_time, "horde_startup_time - original")

					local vanilla_relax_duration = vanilla_pacing_settings.relax_duration

					reset_time_table(pacing_settings.relax_duration, vanilla_relax_duration, "relax_duration - original")

					if pacing_settings.max_delay_until_next_horde then
						local vanilla_max_delay_until_next_horde = vanilla_pacing_settings.max_delay_until_next_horde

						reset_time_table(pacing_settings.max_delay_until_next_horde, vanilla_max_delay_until_next_horde, "max_delay_until_next_horde - original")
					end

					if pacing_settings.difficulty_overrides then
						for difficulty, overrides in pairs(pacing_settings.difficulty_overrides) do
							local vanilla_difficulty_overrides = vanilla_pacing_settings.difficulty_overrides[difficulty]

							if overrides.horde_frequency then
								reset_time_table(overrides.horde_frequency, vanilla_difficulty_overrides.horde_frequency, "horde_frequency - " .. difficulty)
							end

							if overrides.horde_startup_time then
								reset_time_table(overrides.horde_startup_time, vanilla_difficulty_overrides.horde_startup_time, "horde_startup_time - " .. difficulty)
							end

							if overrides.relax_duration then
								reset_time_table(overrides.relax_duration, vanilla_difficulty_overrides.relax_duration, "relax_duration - " .. difficulty)
							end

							if overrides.max_delay_until_next_horde then
								reset_time_table(overrides.max_delay_until_next_horde, vanilla_difficulty_overrides.max_delay_until_next_horde, "max_delay_until_next_horde - " .. difficulty)
							end
						end
					end
				end
			end

			return 
		end
	},
	powerful_elites = {
		description = "description_mutator_powerful_elites",
		health_modifier = 2,
		display_name = "display_name_mutator_powerful_elites",
		icon = "mutator_icon_powerful_elites",
		modify_health_breeds = {
			"skaven_storm_vermin",
			"skaven_storm_vermin_commander",
			"skaven_storm_vermin_with_shield",
			"skaven_plague_monk",
			"chaos_raider",
			"chaos_warrior",
			"chaos_berzerker"
		},
		server_start_function = function (context, data)
			data.player_units = {}

			return 
		end,
		server_update_function = function (context, data)
			apply_buff_to_alive_player_units(context, data, "damage_taken_powerful_elites")

			return 
		end
	}
}

return mutator_settings
