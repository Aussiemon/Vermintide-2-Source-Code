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
		icon = "icons_placeholder",
		display_name = "display_name_mutator_no_ammo",
		remove_pickups = {
			"ammo"
		}
	},
	no_pickups = {
		description = "description_mutator_no_pickups",
		icon = "icons_placeholder",
		display_name = "display_name_mutator_no_pickups",
		remove_pickups = {
			"all"
		}
	},
	player_dot = {
		description = "description_mutator_player_dot",
		display_name = "display_name_mutator_player_dot",
		icon = "icons_placeholder",
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
		icon = "icons_placeholder",
		display_name = "display_name_mutator_instant_death",
		server_update_function = function (context, data, dt, t)
			local player_units = PLAYER_AND_BOT_UNITS
			local num_player_unit = #player_units
			local get_extension = ScriptUnit.extension

			for i = 1, num_player_unit, 1 do
				local unit = player_units[i]
				local status_ext = get_extension(unit, "status_system")

				if status_ext.is_knocked_down(status_ext) then
					local health_ext = get_extension(unit, "health_system")

					health_ext.die(health_ext)
				end
			end

			return 
		end
	},
	whiterun = {
		description = "description_mutator_whiterun",
		display_name = "display_name_mutator_whiterun",
		icon = "icons_placeholder",
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
				return 65
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
		icon = "icons_placeholder",
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
		icon = "icons_placeholder",
		display_name = "display_name_mutator_elite_run",
		roamer_override_lookup = {
			chaos_marauder_with_shield = "chaos_berzerker",
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

			return 
		end,
		server_stop_function = function (context, data)
			local vanilla_horde_compositions = data.vanilla_horde_compositions

			for name, composition in pairs(vanilla_horde_compositions) do
				mutator_dprint("Switching horde composition(%s) back to vanilla state", name)

				HordeCompositions[name] = composition
			end

			return 
		end
	},
	specials_frequency = {
		description = "description_mutator_specials_frequency",
		icon = "icons_placeholder",
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
							method_settings.spawn_interval[1] = method_settings.spawn_interval[1]*spawn_time_reduction
							method_settings.spawn_interval[2] = method_settings.spawn_interval[2]*spawn_time_reduction
							modified = true
							local new_1 = method_settings.spawn_interval[1]
							local new_2 = method_settings.spawn_interval[2]
							local old_1 = new_1/spawn_time_reduction
							local old_2 = new_2/spawn_time_reduction
							debug_string = sprintf("%s specials_by_time_window.spawn_interval(%s, %s) old(%s, %s)", debug_string, new_1, new_2, old_1, old_2)
						end

						if method_name == "specials_by_slots" then
							local spawn_cooldown = method_settings.spawn_cooldown
							method_settings.spawn_cooldown[1] = method_settings.spawn_cooldown[1]*spawn_time_reduction
							method_settings.spawn_cooldown[2] = method_settings.spawn_cooldown[2]*spawn_time_reduction
							modified = true
							local new_1 = method_settings.spawn_cooldown[1]
							local new_2 = method_settings.spawn_cooldown[2]
							local old_1 = new_1/spawn_time_reduction
							local old_2 = new_2/spawn_time_reduction
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

			for name, settings in pairs(vanilla_specials_settings) do
				mutator_dprint("Switching specials setting(%s) back to vanilla state", name)

				SpecialsSettings[name] = settings
			end

			return 
		end
	},
	hordes_galore = {
		description = "description_mutator_hordes_galore",
		display_name = "display_name_mutator_hordes_galore",
		horde_frequency_modifier = 0.9,
		horde_startup_time_modifier = 0.9,
		icon = "icons_placeholder",
		server_start_function = function (context, data)
			local template = data.template
			local horde_frequency_modifier = template.horde_frequency_modifier
			local horde_startup_time_modifier = template.horde_startup_time_modifier
			local vanilla_pacing_settings = {}

			for name, pacing_settings in pairs(PacingSettings) do
				vanilla_pacing_settings[name] = table.clone(pacing_settings)

				if not pacing_settings.disabled then
					local horde_frequency_1 = pacing_settings.horde_frequency[1]
					local horde_frequency_2 = pacing_settings.horde_frequency[2]
					pacing_settings.horde_frequency[1] = horde_frequency_1 - horde_frequency_1*horde_frequency_modifier
					pacing_settings.horde_frequency[2] = horde_frequency_2 - horde_frequency_2*horde_frequency_modifier
					local horde_startup_time_1 = pacing_settings.horde_startup_time[1]
					local horde_startup_time_2 = pacing_settings.horde_startup_time[2]
					pacing_settings.horde_startup_time[1] = horde_startup_time_1 - horde_startup_time_1*horde_startup_time_modifier
					pacing_settings.horde_startup_time[2] = horde_startup_time_2 - horde_startup_time_2*horde_startup_time_modifier

					mutator_dprint("Changed horde frequency for pacing setting (%s) from ({%s, %s}) to ({%s,%s}), (%s))", name, horde_frequency_1, horde_frequency_2, pacing_settings.horde_frequency[1], pacing_settings.horde_frequency[2], horde_frequency_modifier)
					mutator_dprint("Changed horde startup time for pacing setting (%s) from ({%s, %s}) to ({%s,%s}), (%s))", name, horde_startup_time_1, horde_startup_time_2, pacing_settings.horde_startup_time[1], pacing_settings.horde_startup_time[2], horde_startup_time_modifier)
				end
			end

			data.vanilla_pacing_settings = vanilla_pacing_settings

			return 
		end,
		server_stop_function = function (context, data)
			local vanilla_pacing_settings = data.vanilla_pacing_settings

			for name, horde_setting in pairs(vanilla_pacing_settings) do
				mutator_dprint("Switching pace setting(%s) back to vanilla state", name)

				PacingSettings[name] = horde_setting
			end

			return 
		end
	},
	powerful_elites = {
		description = "description_mutator_powerful_elites",
		health_modifier = 2,
		display_name = "display_name_mutator_powerful_elites",
		icon = "icons_placeholder",
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
