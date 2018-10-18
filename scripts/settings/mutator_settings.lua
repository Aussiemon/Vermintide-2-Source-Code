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

			buff_ext:add_buff(buff_name, params)
		end

		player_units[unit] = true
	end

	for unit, updated in pairs(player_units) do
		if not updated then
			player_units[unit] = nil
		end
	end
end

function store_breed_and_action_settings(context, data)
	if not context.original_breed_settings and not context.original_breed_action_settings then
		context.original_breed_settings = table.clone(Breeds)
		context.original_breed_action_settings = table.clone(BreedActions)
	end
end

function restore_breed_and_action_settings(context, data)
	if context.original_breed_settings and context.original_breed_action_settings then
		Breeds = context.original_breed_settings
		BreedActions = context.original_breed_action_settings
		context.original_breed_settings = nil
		context.original_breed_action_settings = nil
	end
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
		end,
		server_update_function = function (context, data, dt, t)
			apply_buff_to_alive_player_units(context, data, "mutator_player_dot")
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
		end,
		client_stop_function = function (context, data)
			BackendUtils.get_total_power_level = data.vanilla_get_total_power_level
			data.vanilla_get_total_power_level = nil
			GearUtils.get_property_and_trait_buffs = data.vanilla_get_property_and_trait_buffs
			data.vanilla_get_property_and_trait_buffs = nil
		end
	},
	no_respawn = {
		description = "description_mutator_no_respawn",
		display_name = "display_name_mutator_no_respawn",
		icon = "mutator_icon_no_respawn",
		server_start_game_mode_function = function (context, data)
			Managers.state.spawn:set_respawning_enabled(false)
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
		server_start_game_mode_function = function (context, data)
			local roamer_override_lookup = data.template.roamer_override_lookup

			Managers.state.entity:system("ai_interest_point_system"):set_breed_override_lookup(roamer_override_lookup)
			Managers.state.conflict:set_breed_override_lookup(roamer_override_lookup)
		end,
		server_stop_function = function (context, data)
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
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			local settings = CurrentSpecialsSettings

			if not settings.disabled then
				local template = data.template
				local debug_string = sprintf("Modifying SpecialsSettings.%s", settings.name)

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
	},
	more_specials = {
		description = "description_mutator_more_specials",
		display_name = "display_name_mutator_more_specials",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentSpecialsSettings.max_specials = CurrentSpecialsSettings.max_specials * 2
		end
	},
	same_specials = {
		description = "description_mutator_same_specials",
		display_name = "display_name_mutator_same_specials",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			local method = CurrentSpecialsSettings.methods.specials_by_slots
			method.select_next_breed = "get_random_breed"
			method.chance_of_coordinated_attack = 1
			method.max_of_same = 99
			method.same_breeds = true
			method.coordinated_trickle_time = 1
			method.always_coordinated = true
			method.spawn_cooldown = {
				60,
				90
			}
			method.after_safe_zone_delay = {
				30,
				70
			}
		end
	},
	big_specials = {
		description = "description_big_specials",
		display_name = "display_name_big_specials",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			local method = CurrentSpecialsSettings.methods.specials_by_slots
			method.select_next_breed = "get_chance_of_boss_breed"
		end
	},
	elite_specials = {
		description = "description_big_specials",
		display_name = "display_name_big_specials",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			store_breed_and_action_settings(context, data)

			local breeds = Breeds
			Breeds.skaven_gutter_runner.run_speed = 14
			Breeds.skaven_gutter_runner.jump_speed = 40
			Breeds.skaven_gutter_runner.jump_range = 40
			BreedActions.skaven_ratling_gunner.shoot_ratling_gun.attack_time = {
				12,
				20
			}
			BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_start = 20
			BreedActions.skaven_ratling_gunner.shoot_ratling_gun.fire_rate_at_end = 35
			BreedActions.skaven_ratling_gunner.shoot_ratling_gun.ignore_staggers = {
				true,
				true,
				true,
				true,
				true,
				true
			}
			Breeds.skaven_poison_wind_globadier.armor_category = 2
			BreedActions.skaven_poison_wind_globadier.advance_towards_players.time_until_first_throw = {
				0,
				1
			}
			BreedActions.skaven_poison_wind_globadier.advance_towards_players.throw_at_distance = {
				5,
				40
			}
			BreedActions.skaven_poison_wind_globadier.advance_towards_players.range = 60
			BreedActions.skaven_poison_wind_globadier.throw_poison_globe.barrage_count = 8
			BreedActions.skaven_poison_wind_globadier.throw_poison_globe.time_between_throws = {
				8,
				1
			}
			Breeds.skaven_warpfire_thrower.run_speed = 6
			BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.ignore_staggers = {
				true,
				true,
				true,
				true,
				true,
				true
			}
			BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.close_attack_range = 25
			BreedActions.skaven_warpfire_thrower.shoot_warpfire_thrower.buff_name = "warpfire_thrower_face_base_mutator"
			BreedActions.skaven_warpfire_thrower.follow.distance_to_attack = 15
			Breeds.skaven_pack_master.run_speed = 6.2
			BreedActions.skaven_pack_master.follow.distance_to_attack = 4
			BreedActions.skaven_pack_master.initial_pull.pull_time = 0.8
			BreedActions.skaven_pack_master.initial_pull.pull_distance = 6
			BreedActions.skaven_pack_master.drag.override_movement_speed = 8
			BreedActions.skaven_pack_master.drag.force_hoist_time = 10
			BreedActions.skaven_pack_master.hoist.hoist_anim_length = 1
			Breeds.chaos_vortex_sorcerer.armor_category = 2
			Breeds.chaos_vortex.run_speed = 2.25
			Breeds.chaos_vortex_sorcerer.no_despawn_when_master_dies = true
			BreedActions.chaos_vortex_sorcerer.spawn_vortex.summoning_time = 1.5
			BreedActions.chaos_vortex_sorcerer.spawn_vortex.vortex_template_name = "elite_mutator"
			BreedActions.chaos_corruptor_sorcerer.grab_attack.max_distance_squared = 400
			BreedActions.chaos_corruptor_sorcerer.grab_attack.projectile_speed = 35
			BreedActions.chaos_corruptor_sorcerer.grab_attack.ignore_staggers = {
				true,
				true,
				true,
				true,
				true,
				true
			}
			BreedActions.chaos_corruptor_sorcerer.skulk_approach.min_wave_distance = 5
			BreedActions.chaos_corruptor_sorcerer.skulk_approach.max_wave_distance = 15
			BreedActions.chaos_corruptor_sorcerer.skulk_approach.third_wave_min_distance = 4
			BreedActions.chaos_corruptor_sorcerer.skulk_approach.third_wave_max_distance = 15
		end,
		server_stop_function = function (context, data)
			restore_breed_and_action_settings(context, data)
		end
	},
	gutter_runner_mayhem = {
		description = "description_mutator_same_specials",
		display_name = "display_name_mutator_same_specials",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentSpecialsSettings.breeds = {
				"skaven_gutter_runner"
			}
			local method = CurrentSpecialsSettings.methods.specials_by_slots
			method.max_of_same = 99
			method.spawn_cooldown = {
				30,
				50
			}
			method.chance_of_coordinated_attack = 1
			method.coordinated_trickle_time = 0.66
		end
	},
	chaos_warriors_trickle = {
		description = "description_mutator_chaos_warriors_trickle",
		display_name = "display_name_mutator_chaos_warriors_trickle",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentHordeSettings.mini_patrol_composition = "mutator_chaos_warrior_mini_patrol"
			CurrentPacing.mini_patrol = {
				only_spawn_above_intensity = -1,
				override_timer = 45,
				only_spawn_below_intensity = 90,
				frequency = {
					45,
					60
				}
			}
		end
	},
	mixed_horde = {
		description = "description_mutator_same_specials",
		display_name = "display_name_mutator_same_specials",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentHordeSettings.ambush_composition = "mutator_mixed_horde"
			CurrentHordeSettings.vector_composition = "mutator_mixed_horde"
			CurrentHordeSettings.vector_blob_composition = "mutator_mixed_horde"
		end
	},
	multiple_bosses = {
		description = "description_mutator_multiple_bosses",
		display_name = "display_name_mutator_multiple_bosses",
		icon = "mutator_icon_specials_frequency",
		server_start_function = function (context, data)
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentBossSettings.boss_events.event_lookup.event_boss = {
				"boss_event_dual_spawn"
			}
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
			return
		end,
		server_stop_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			local function modify_time_table(time_table, modifier, dprint_string)
				local tt_1 = time_table[1]
				local tt_2 = time_table[2]
				time_table[1] = tt_1 - tt_1 * modifier
				time_table[2] = tt_2 - tt_2 * modifier

				mutator_dprint(dprint_string, tt_1, tt_2, time_table[1], time_table[2], modifier)
			end

			local template = data.template
			local horde_frequency_modifier = template.horde_frequency_modifier
			local horde_startup_time_modifier = template.horde_startup_time_modifier
			local relax_duration_modifier = template.relax_duration_modifier
			local max_delay_modifier = template.max_delay_modifier
			local pacing_settings = CurrentPacing

			if not pacing_settings.disabled then
				mutator_dprint("Modifying pacing settings - %s", pacing_settings.name)
				modify_time_table(pacing_settings.horde_frequency, horde_frequency_modifier, "Changed horde frequency from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
				modify_time_table(pacing_settings.horde_startup_time, horde_startup_time_modifier, "Changed horde startup time from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
				modify_time_table(pacing_settings.relax_duration, relax_duration_modifier, "Changed relax duration from ({%s, %s}) to ({%s, %s}), modifier: %s - original")

				if pacing_settings.max_delay_until_next_horde then
					modify_time_table(pacing_settings.max_delay_until_next_horde, max_delay_modifier, "Changed max_delay_until_next_horde from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
				end
			end
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
		end,
		server_update_function = function (context, data)
			apply_buff_to_alive_player_units(context, data, "damage_taken_powerful_elites")
		end
	},
	corpse_explosion = {
		description = "description_mutator_corpse_explosion",
		icon = "icon_deed_normal_01",
		display_name = "display_name_mutator_corpse_explosion"
	},
	slayer_curse = {
		description = "description_mutator_slayer_curse",
		display_name = "display_name_mutator_slayer_curse",
		decay_tick = 1,
		icon = "icon_deed_normal_01",
		decay_start = 5,
		add_buff = function (buffs, buff_system, player_unit)
			local is_server_controlled = true
			local server_buff_id = buff_system:add_buff(player_unit, "slayer_curse_debuff", player_unit, is_server_controlled)
			buffs[#buffs + 1] = server_buff_id
		end,
		remove_buff = function (buffs, buff_system, player_unit)
			local num_buffs = #buffs
			local server_buff_id = buffs[num_buffs]

			buff_system:remove_server_controlled_buff(player_unit, server_buff_id)

			buffs[num_buffs] = nil
		end,
		server_start_game_mode_function = function (context, data)
			data.player_units = {}
			data.buff_system = Managers.state.entity:system("buff_system")
			data.player_manager = Managers.player
		end,
		server_update_function = function (context, data)
			local t = Managers.time:time("game")
			local template = data.template
			local player_units = data.player_units

			for unit, unit_data in pairs(player_units) do
				if not Unit.alive(unit) then
					player_units[unit] = nil
				elseif AiUtils.unit_knocked_down(unit) then
					local buffs = unit_data.buffs
					local num_buffs = #buffs

					for i = 1, num_buffs, 1 do
						template.remove_buff(buffs, data.buff_system, unit)
					end

					player_units[unit] = nil
				elseif unit_data.next_decay <= t then
					local buffs = unit_data.buffs

					template.remove_buff(buffs, data.buff_system, unit)

					if #buffs > 0 then
						unit_data.next_decay = t + template.decay_tick
					else
						player_units[unit] = nil
					end
				end
			end
		end,
		server_ai_killed_function = function (context, data, killed_unit, killer_unit)
			if not data.player_manager:is_player_unit(killer_unit) then
				return
			end

			local player_units = data.player_units

			if not player_units[killer_unit] then
				player_units[killer_unit] = {
					next_decay = 0,
					buffs = {}
				}
			end

			local unit_data = player_units[killer_unit]

			data.template.add_buff(unit_data.buffs, data.buff_system, killer_unit)

			unit_data.next_decay = Managers.time:time("game") + data.template.decay_start
		end
	},
	shared_health_pool = {
		description = "description_mutator_shared_health_pool",
		display_name = "display_name_mutator_shared_health_pool",
		icon = "icon_deed_normal_01",
		server_start_function = function (context, data)
			data.player_units = {}
		end,
		server_update_function = function (context, data)
			apply_buff_to_alive_player_units(context, data, "trinket_shared_damage")
		end
	},
	skulking_sorcerer = {
		description = "description_skulking_sorcerer",
		display_name = "display_name_skulking_sorcerer",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			return
		end,
		server_update_function = function (context, data)
			if #PLAYER_AND_BOT_UNITS == 0 then
				return
			end

			local t = Managers.time:time("game")

			if not data.has_spawned_mutator_sorcerer then
				if not data.has_wanted_position then
					local wanted_position = Unit.local_position(PLAYER_AND_BOT_UNITS[1], 0)
					data.wanted_position = Vector3Box(wanted_position)
					data.spawn_at_time = t + 30
					data.has_wanted_position = true
				elseif data.spawn_at_time < t then
					local conflict_director = Managers.state.conflict
					local breed = Breeds.chaos_mutator_sorcerer
					local spawn_category = "misc"

					conflict_director:spawn_queued_unit(breed, data.wanted_position, QuaternionBox(Quaternion.identity()), spawn_category, nil, nil)

					data.has_spawned_mutator_sorcerer = true
				end
			end
		end
	},
	explosive_loot_rats = {
		description = "description_explosive_loot_rats",
		display_name = "display_name_explosive_loot_rats",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			data.spawn_loot_rats_at = Managers.time:time("game") + 10 + math.random(5, 10)
			local old_detection_radius = Breeds.skaven_loot_rat.detection_radius
			data.old_detection_radius = old_detection_radius
			local old_health = Breeds.skaven_loot_rat.max_health
			data.old_health = old_health
			local new_max_health = {
				5,
				8,
				12.5,
				15,
				18
			}
			Breeds.skaven_loot_rat.detection_radius = math.huge
			Breeds.skaven_loot_rat.max_health = new_max_health
		end,
		server_update_function = function (context, data)
			local t = Managers.time:time("game")

			if not global_is_inside_inn and data.spawn_loot_rats_at < t then
				local spawn_list = {}
				local num_loot_rats = math.random(4, 10)

				for i = 1, num_loot_rats, 1 do
					spawn_list[#spawn_list + 1] = "skaven_loot_rat"
				end

				local conflict_director = Managers.state.conflict

				conflict_director.horde_spawner:execute_custom_horde(spawn_list)

				data.spawn_loot_rats_at = t + 20 + math.random(5, 15)
			end
		end,
		server_stop_function = function (context, data)
			Breeds.skaven_loot_rat.detection_radius = data.old_detection_radius
			Breeds.skaven_loot_rat.max_health = data.old_health
		end
	},
	high_intensity = {
		description = "description_mutator_powerful_elites",
		display_name = "display_name_mutator_powerful_elites",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			return
		end,
		update_conflict_settings = function (context, data)
			CurrentIntensitySettings.max_intensity = 200
			CurrentIntensitySettings.decay_per_second = 10
			CurrentIntensitySettings.decay_delay = 0.5
			CurrentIntensitySettings.intensity_add_per_percent_dmg_taken = 0.1
			CurrentPacing.delay_horde_threat_value = 200
			CurrentPacing.delay_specials_threat_value = 200
			CurrentPacing.delay_mini_patrol_threat_value = 200
		end,
		server_stop_function = function (context, data)
			return
		end
	},
	waves_of_plague_monks = {
		description = "description_mutator_powerful_elites",
		display_name = "display_name_mutator_powerful_elites",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			local current_difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
			local base_amount = 5
			local difficulty_amount_modifier = 2
			local num_to_spawn = base_amount + current_difficulty_rank * difficulty_amount_modifier
			local spawn_list = {}

			for i = 1, num_to_spawn, 1 do
				spawn_list[i] = "skaven_plague_monk"
			end

			local t = Managers.time:time("game")
			data.spawn_list = spawn_list
			data.spawn_at = t + math.random(30, 50)
			data.current_difficulty_rank = current_difficulty_rank
			BreedActions.skaven_plague_monk.frenzy_attack.attack_intensity = 0
			BreedActions.skaven_plague_monk.frenzy_attack_ranged.attack_intensity = 0
			local old_threat_value = Breeds.skaven_plague_monk.threat_value
			data.old_threat_value = old_threat_value

			Managers.state.conflict:set_threat_value("skaven_plague_monk", 1)
		end,
		server_update_function = function (context, data)
			local t = Managers.time:time("game")

			if data.spawn_at < t then
				local spawn_list = data.spawn_list
				local horde_spawner = Managers.state.conflict.horde_spawner

				horde_spawner:execute_custom_horde(spawn_list)

				local difficulty_rank = data.current_difficulty_rank
				local spawn_frequency_modifier = 80 - difficulty_rank * 5
				data.spawn_at = t + math.random(40, spawn_frequency_modifier)
			end
		end,
		server_stop_function = function (context, data)
			BreedActions.skaven_plague_monk.frenzy_attack.attack_intensity = nil
			BreedActions.skaven_plague_monk.frenzy_attack_ranged.attack_intensity = nil

			Managers.state.conflict:set_threat_value("skaven_plague_monk", data.old_threat_value)
		end
	},
	waves_of_berzerkers = {
		description = "description_mutator_powerful_elites",
		display_name = "display_name_mutator_powerful_elites",
		icon = "mutator_icon_powerful_elites",
		server_start_function = function (context, data)
			local current_difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
			local base_amount = 5
			local difficulty_amount_modifier = 2
			local num_to_spawn = base_amount + current_difficulty_rank * difficulty_amount_modifier
			local spawn_list = {}

			for i = 1, num_to_spawn, 1 do
				spawn_list[i] = "chaos_berzerker"
			end

			local t = Managers.time:time("game")
			data.spawn_list = spawn_list
			data.spawn_at = t + math.random(30, 50)
			data.current_difficulty_rank = current_difficulty_rank
			BreedActions.chaos_berzerker.frenzy_attack.attack_intensity = 0
			local old_threat_value = Breeds.chaos_berzerker.threat_value
			data.old_threat_value = old_threat_value

			Managers.state.conflict:set_threat_value("chaos_berzerker", 1)
		end,
		server_update_function = function (context, data)
			local t = Managers.time:time("game")

			if data.spawn_at < t then
				local spawn_list = data.spawn_list
				local horde_spawner = Managers.state.conflict.horde_spawner

				horde_spawner:execute_custom_horde(spawn_list)

				local difficulty_rank = data.current_difficulty_rank
				local spawn_frequency_modifier = 80 - difficulty_rank * 5
				data.spawn_at = t + math.random(40, spawn_frequency_modifier)
			end
		end,
		server_stop_function = function (context, data)
			BreedActions.chaos_berzerker.frenzy_attack.attack_intensity = nil

			Managers.state.conflict:set_threat_value("chaos_berzerker", data.old_threat_value)
		end
	},
	night_mode = {
		description = "description_night_mode_mutator",
		display_name = "display_name_night_mode_mutator",
		icon = "mutator_icon_powerful_elites",
		server_start_game_mode_function = function (context, data)
			local world = Managers.world:world("level_world")

			LevelHelper:flow_event(world, "mutator_night")
		end,
		server_stop_function = function (context, data)
			return
		end,
		client_start_game_mode_function = function (context, data)
			local world = Managers.world:world("level_world")

			LevelHelper:flow_event(world, "mutator_night")
		end,
		client_stop_function = function (context, data)
			return
		end
	},
	darkness = {
		description = "description_darkness_mutator",
		display_name = "display_name_darkness_mutator",
		icon = "mutator_icon_powerful_elites",
		server_start_game_mode_function = function (context, data)
			local world = Managers.world:world("level_world")

			LevelHelper:flow_event(world, "mutator_darkness")
		end,
		server_update_function = function (context, data)
			if #PLAYER_AND_BOT_UNITS > 0 and not data.has_spawned_torches then
				local num_torches = #PLAYER_AND_BOT_UNITS

				for i = 1, num_torches, 1 do
					local player_unit = PLAYER_AND_BOT_UNITS[i]
					local position = Unit.world_position(player_unit, 0) + Vector3.up()
					local rotation = Quaternion.identity()
					local network_position = AiAnimUtils.position_network_scale(position, true)
					local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
					local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
					local network_angular_velocity = network_velocity
					local extension_init_data = {
						pickup_system = {
							has_physics = true,
							pickup_name = "torch",
							spawn_type = "guaranteed"
						},
						projectile_locomotion_system = {
							network_position = network_position,
							network_rotation = network_rotation,
							network_velocity = network_velocity,
							network_angular_velocity = network_angular_velocity
						}
					}
					local unit_name = "units/weapons/player/pup_torch/pup_torch"
					local unit_template_name = "pickup_torch_unit"

					print("Spawning torch at ", player_unit, " at position ", position)
					Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
				end

				data.has_spawned_torches = true
			end
		end,
		server_stop_function = function (context, data)
			return
		end,
		client_start_game_mode_function = function (context, data)
			local world = Managers.world:world("level_world")

			LevelHelper:flow_event(world, "mutator_darkness")
		end,
		client_stop_function = function (context, data)
			return
		end
	}
}

return mutator_settings
