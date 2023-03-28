local settings = DLCSettings.grudge_marks
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

local function is_server()
	return Managers.state.network.is_server
end

local function owner_is_local_player(owner_unit)
	if DEDICATED_SERVER then
		return false
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local owner_player = player_manager:unit_owner(owner_unit)

	if owner_player == local_player then
		return true
	end

	return false
end

local function teleport_validation_func(pos, validation_data)
	local enemy_positions = validation_data.side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #enemy_positions do
		if Vector3.distance_squared(pos, enemy_positions[i]) < validation_data.min_dist_sqr then
			return false
		end
	end

	return true
end

settings.buff_templates = {
	grudge_mark_health = {
		buffs = {
			{
				multiplier = 0.5,
				name = "grudge_mark_health",
				stat_buff = "max_health"
			},
			{
				remove_buff_func = "ai_update_max_health",
				name = "grudge_mark_health_update",
				apply_buff_func = "ai_update_max_health"
			}
		}
	},
	grudge_mark_damage = {
		buffs = {
			{
				multiplier = 0.2,
				name = "grudge_mark_damage",
				stat_buff = "damage_dealt"
			}
		}
	},
	grudge_mark_stagger_distance_resistance = {
		buffs = {
			{
				multiplier = -0.7,
				name = "grudge_mark_stagger_distance_resistance",
				stat_buff = "stagger_distance"
			}
		}
	},
	grudge_mark_warping = {
		buffs = {
			{
				proc_cooldown = 10,
				name = "grudge_mark_warping",
				buff_func = "random_teleport_ai",
				event = "on_damage_taken",
				proc_chance = 0.1,
				max_teleport_distance = 8,
				min_teleport_distance = 3,
				find_valid_pos_attempts = 5,
				min_dist_from_players = 3
			}
		}
	},
	grudge_mark_unstaggerable = {
		buffs = {
			{
				apply_buff_func = "make_stagger_immune",
				name = "grudge_mark_unstaggerable"
			}
		}
	},
	grudge_mark_raging = {
		buffs = {
			{
				buff_to_add = "grudge_mark_raging_buff",
				name = "grudge_mark_raging",
				update_frequency = 25,
				update_func = "add_buff",
				update_start_delay = 5
			}
		}
	},
	grudge_mark_raging_buff = {
		activation_sound_3p = true,
		activation_sound = "enemy_grudge_raging",
		buffs = {
			{
				multiplier = 1,
				name = "grudge_mark_raging_buff",
				stat_buff = "damage_dealt",
				duration = 10,
				particles = {
					{
						orphaned_policy = "stop",
						first_person = false,
						third_person = true,
						effect = "fx/cw_khorne_boss",
						continuous = true,
						destroy_policy = "stop"
					}
				}
			}
		}
	},
	grudge_mark_vampiric = {
		buffs = {
			{
				name = "grudge_mark_vampiric",
				multiplier = 2,
				buff_func = "ai_heal_on_damage_dealt",
				event = "on_damage_dealt",
				bonus = 0
			}
		}
	},
	grudge_mark_ranged_immune = {
		buffs = {
			{
				name = "grudge_mark_ranged_immune",
				perk = buff_perks.invulnerable_ranged
			}
		}
	},
	grudge_mark_periodic_shield = {
		buffs = {
			{
				buff_to_add = "grudge_mark_periodic_shield_buff",
				name = "grudge_mark_periodic_shield",
				update_frequency = 20,
				update_func = "add_buff",
				update_start_delay = 0
			}
		}
	},
	grudge_mark_periodic_shield_buff = {
		deactivation_sound = "enemy_grudge_shield_end",
		activation_sound_3p = true,
		activation_sound = "enemy_grudge_shield_start",
		buffs = {
			{
				name = "grudge_mark_periodic_shield_buff",
				duration = 5,
				perk = buff_perks.invulnerable,
				particles = {
					{
						orphaned_policy = "stop",
						first_person = false,
						third_person = true,
						effect = "fx/cw_shield",
						continuous = true,
						destroy_policy = "stop"
					}
				}
			}
		}
	},
	grudge_mark_intangible = {
		buffs = {
			{
				num_mirrors = 3,
				name = "grudge_mark_intangible",
				update_func = "ai_spawn_mirror_images",
				update_dialogue_delay = 1,
				update_frequency_time = 45,
				update_start_delay = 5
			}
		}
	},
	grudge_mark_intangible_mirror = {
		buffs = {
			{
				multiplier = -1,
				name = "grudge_mark_intangible_mirror_damage",
				stat_buff = "damage_dealt",
				remove_buff_func = "remove_intangible_mirror_damage"
			},
			{
				multiplier = -10,
				name = "grudge_mark_intangible_mirror_health_stat",
				stat_buff = "max_health"
			},
			{
				remove_buff_func = "ai_update_max_health",
				name = "grudge_mark_intangible_mirror_health_update",
				apply_buff_func = "ai_update_max_health"
			}
		}
	},
	grudge_mark_crippling_blow = {
		buffs = {
			{
				event = "on_damage_dealt",
				name = "grudge_mark_crippling_blow",
				buff_to_add = "grudge_mark_crippling_blow_debuff",
				buff_func = "ai_add_buff_on_damage_dealt"
			}
		}
	},
	grudge_mark_crippling_blow_debuff = {
		buffs = {
			{
				name = "grudge_mark_crippling_blow_debuff_flow_event",
				flow_event = "sfx_vce_struggle",
				max_stacks = 1,
				duration = 5,
				apply_buff_func = "first_person_flow_event"
			},
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_run",
				icon = "grudge_mark_crippling_debuff",
				priority_buff = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				debuff = true,
				max_stacks = 1,
				duration = 5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				sfx = {
					activation_sound = "enemy_grudge_crippling_hit"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_crouch",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 5,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_slow_walk",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 5,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				multiplier = 0.3,
				name = "grudge_mark_crippling_blow_jump_debuff",
				duration = 5,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "grudge_mark_crippling_blow_dodge_speed_debuff",
				duration = 5,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				multiplier = 0.5,
				name = "grudge_mark_crippling_blow_dodge_distance_debuff",
				duration = 5,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	grudge_mark_crushing_blow = {
		buffs = {
			{
				buff_to_add = "grudge_mark_crushing_blow_debuff",
				name = "grudge_mark_crushing_blow",
				buff_func = "ai_crushing_blow",
				event = "on_damage_dealt",
				perk = buff_perks.ai_unblockable
			},
			{
				remove_buff_func = "ai_remove_hit_sfx",
				name = "grudge_mark_crushing_blow_sfx",
				apply_buff_func = "ai_add_hit_sfx",
				hit_sfx_name = "enemy_grudge_crushing_hit"
			}
		}
	},
	grudge_mark_crushing_blow_debuff = {
		buffs = {
			{
				duration = 8,
				name = "grudge_mark_crushing_blow_debuff",
				stat_buff = "max_fatigue",
				debuff = true,
				max_stacks = 20,
				refresh_durations = true,
				icon = "troll_vomit_debuff",
				bonus = -1
			}
		}
	},
	grudge_mark_regeneratig = {
		buffs = {
			{
				frequency = 1,
				name = "grudge_mark_regeneratig",
				part_healed_of_max_heath = 0.02,
				buff_func = "ai_delay_regen",
				event = "on_damage_taken",
				update_func = "ai_health_regen_update",
				on_hit_delay = 3
			}
		}
	},
	grudge_mark_periodic_curse_aura = {
		buffs = {
			{
				buff_to_add = "grudge_mark_curse",
				name = "grudge_mark_periodic_curse_aura",
				update_frequency = 0.5,
				time_between_curses = 2,
				update_start_delay = 0,
				max_distance = 4,
				update_func = "apply_curse_to_nearby_players",
				sound_on_enter = "enemy_grudge_cursed_enter",
				particles = {
					{
						orphaned_policy = "stop",
						first_person = false,
						third_person = true,
						effect = "fx/gm_cursed_aoe",
						continuous = true,
						destroy_policy = "stop",
						custom_variables = {
							{
								name = "radius",
								value = {
									z = 1,
									x = 4,
									y = 4
								}
							},
							{
								name = "diameter",
								value = {
									z = 1,
									x = 8,
									y = 8
								}
							}
						}
					}
				}
			}
		}
	},
	grudge_mark_curse = {
		deactivation_sound = "enemy_grudge_cursed_exit",
		activation_sound = "enemy_grudge_cursed_damage",
		buffs = {
			{
				icon = "grudge_mark_cursed_debuff",
				name = "grudge_mark_curse",
				stat_buff = "health_curse",
				debuff = true,
				max_stacks = 20,
				duration = 5,
				refresh_durations = true,
				bonus = -0.05
			}
		}
	},
	grudge_mark_commander = {
		buffs = {
			{
				update_frequency = 40,
				name = "grudge_mark_commander",
				update_func = "trigger_terror_event",
				update_start_delay = 8,
				faction_terror_events = {
					default = "grudge_mark_commander_terror_event_skaven",
					skaven = "grudge_mark_commander_terror_event_skaven",
					beastmen = "grudge_mark_commander_terror_event_beastmen",
					chaos = "grudge_mark_commander_terror_event_chaos"
				}
			}
		}
	},
	grudge_mark_frenzy = {
		buffs = {
			{
				buff_to_add = "grudge_mark_frenzy_handler",
				name = "grudge_mark_frenzy",
				stacking_buff = "grudge_mark_frenzy_stack",
				buff_func = "add_frenzy_handler",
				event = "on_damage_taken",
				remove_buff_func = "remove_frenzy_handlers"
			}
		}
	},
	grudge_mark_frenzy_handler = {
		buffs = {
			{
				buff_to_add = "grudge_mark_frenzy_stack",
				name = "grudge_mark_frenzy_handler",
				blocker_buff = "grudge_mark_frenzy_buff",
				buff_func = "add_frenzy_stack",
				event = "on_melee_hit",
				apply_buff_func = "add_extra_frenzy_stack"
			}
		}
	},
	grudge_mark_frenzy_stack = {
		buffs = {
			{
				reset_on_max_stacks = true,
				name = "grudge_mark_frenzy_stack",
				icon = "grudge_mark_frenzy_debuff",
				max_stacks = 10,
				refresh_durations = true,
				debuff = true,
				on_max_stacks_func = "add_remove_buffs",
				duration = 3,
				max_stack_data = {
					buffs_to_add = {
						"grudge_mark_frenzy_buff"
					}
				}
			}
		}
	},
	grudge_mark_frenzy_buff = {
		deactivation_sound = "enemy_grudge_frenzy_end",
		buffs = {
			{
				buff_to_add = "grudge_mark_frenzy_buff",
				name = "grudge_mark_frenzy_buff",
				icon = "grudge_mark_frenzy_debuff",
				buff_func = "add_buff",
				event = "on_melee_hit",
				refresh_durations = true,
				apply_buff_func = "apply_frenzy_func",
				remove_buff_func = "remove_frenzy_func",
				max_stacks = 1,
				duration = 5
			},
			{
				name = "grudge_mark_frenzy_buff_attack_speed",
				multiplier = 0.25,
				stat_buff = "attack_speed",
				duration = 5,
				max_stacks = 1,
				refresh_durations = true
			},
			{
				refresh_durations = true,
				name = "grudge_mark_frenzy_buff_move_speed",
				multiplier = 1.25,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				duration = 5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				refresh_durations = true,
				multiplier = 0.2,
				stat_buff = "power_level_melee",
				buff_func = "deus_reckless_swings_buff_on_hit",
				event = "on_melee_hit",
				damage_to_deal = 10,
				name = "grudge_mark_frenzy_buff_reckless_swings",
				is_non_lethal = true,
				max_stacks = 1,
				duration = 5
			}
		}
	}
}
settings.buff_function_templates = {
	make_stagger_immune = function (unit, buff, params)
		if ALIVE[unit] then
			local blackboard = BLACKBOARDS[unit]

			if blackboard then
				local stagger_immunity = {
					health_threshold = 0
				}
				blackboard.stagger_immunity = stagger_immunity
			end
		end
	end,
	apply_buff_to_all_players = function (unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[unit] then
			local side = Managers.state.side:get_side_from_name("heroes")
			local buff_name = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units do
				local player_unit = player_and_bot_units[i]

				buff_system:add_buff(player_unit, buff_name, unit, false)
			end

			local effect_name = buff.template.effect_name

			if effect_name then
				local unit_pos = POSITION_LOOKUP[unit]

				Managers.state.network:rpc_play_particle_effect(nil, NetworkLookup.effects[effect_name], NetworkConstants.invalid_game_object_id, 0, unit_pos, Quaternion.identity(), false)
			end
		end
	end,
	remove_intangible_mirror_damage = function (unit, buff, params)
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("enemy_grudge_intangible_destroy", unit)
	end,
	ai_spawn_mirror_images = function (unit, buff, params)
		if not is_server() then
			return
		end

		local t = params.t

		if not buff.update_frequency_time then
			buff.update_frequency_time = t + buff.template.update_frequency_time
		end

		if t < buff.update_frequency_time and buff.first_update_done then
			local update_dialogue_delay = buff.template.update_dialogue_delay

			if update_dialogue_delay and not buff.update_dialogue_done then
				if not buff.update_dialogue_delay_time then
					buff.update_dialogue_delay_time = t + update_dialogue_delay
				end

				if buff.update_dialogue_delay_time < t then
					local dialogue_name = "curse_very_negative_effect_happened"
					local random_player = DialogueSystem:get_random_player()

					if random_player ~= nil then
						local dialogue_input = ScriptUnit.extension_input(random_player, "dialogue_system")
						local event_data = FrameTable.alloc_table()

						dialogue_input:trigger_dialogue_event(dialogue_name, event_data)
					end

					buff.update_dialogue_done = true
				end
			end

			return
		end

		buff.update_frequency_time = t + buff.template.update_frequency_time
		buff.first_update_done = true

		local function nav_callback()
			if ALIVE[unit] then
				local blackboard = BLACKBOARDS[unit]
				local breed = blackboard.breed
				local side = Managers.state.side.side_by_unit[unit]
				local unit_pos = POSITION_LOOKUP[unit]
				local spread = 4
				local dist = 10
				local tries = 5
				local play_effect = "fx/grudge_marks_illusionist"
				local play_sound = "enemy_grudge_intangible"
				local teleport_position = ConflictUtils.get_spawn_pos_on_circle(blackboard.nav_world, unit_pos, dist, spread, tries, nil, nil, nil, 8, 8)

				if teleport_position then
					ConflictUtils.teleport_ai_unit(unit, teleport_position, play_sound, play_effect)
				end

				local enhancements = {
					{
						"grudge_mark_intangible_mirror",
						no_attribute = true,
						name = "mirror_base"
					}
				}
				local ai_system = Managers.state.entity:system("ai_system")
				local parent_attributes = ai_system:get_attributes(unit)
				local breed_enhancements = parent_attributes.breed_enhancements

				for enhancement_name, value in pairs(breed_enhancements) do
					if value then
						if enhancement_name == "intangible" then
							enhancement_name = "intangible_mirror"
						end

						enhancements[#enhancements + 1] = BreedEnhancements.boss[enhancement_name]
					end
				end

				local name_index = parent_attributes.grudge_marked.name_index
				local old_mirrors = buff._mirror_units or {}
				buff._mirror_units = old_mirrors

				for i = 1, #old_mirrors do
					local mirror_unit = old_mirrors[i]

					if ALIVE[mirror_unit] then
						AiUtils.kill_unit(mirror_unit, unit)
					end
				end

				table.clear(old_mirrors)

				local pos_list = {}
				local min_dist_sqr = 6.25

				local function valid_teleport_pos_func(pos, pos_list)
					for i = 1, #pos_list do
						if Vector3.distance_squared(pos, pos_list[i]) < min_dist_sqr then
							return false
						end
					end

					local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS

					for i = 1, #enemy_positions do
						if Vector3.distance_squared(pos, enemy_positions[i]) < min_dist_sqr then
							return false
						end
					end

					return true
				end

				local buff_template = buff.template
				local num_mirrors = buff_template.num_mirrors

				for i = 1, num_mirrors do
					local mirror_pos = ConflictUtils.get_spawn_pos_on_circle_with_func(blackboard.nav_world, unit_pos, dist, spread, tries, valid_teleport_pos_func, pos_list, 8, 8)

					if mirror_pos then
						pos_list[#pos_list + 1] = mirror_pos
						local optional_data = {
							side_id = side.side_id,
							spawned_func = function (ai_unit, breed, optional_data)
								local blackboard = BLACKBOARDS[ai_unit]
								blackboard.deny_kill_loot = true
								blackboard.is_illusion = true
								local mirror_units = buff._mirror_units

								if mirror_units then
									mirror_units[#mirror_units + 1] = ai_unit
								end

								if breed.name == "chaos_troll" then
									local health_extension = ScriptUnit.has_extension(ai_unit, "health_system")

									if health_extension.force_set_wounded then
										health_extension:force_set_wounded()
									end
								end
							end,
							enhancements = enhancements,
							name_index = name_index,
							prepare_func = ConflictUtils.override_extension_init_data,
							extension_init_data = {
								death_system = {
									death_reaction_template = "despawn",
									play_effect = "fx/mutator_death_03",
									despawn_after_time = 0
								}
							}
						}
						local target_position = ConflictUtils.get_closest_position(mirror_pos, side.ENEMY_PLAYER_AND_BOT_POSITIONS)
						local rot = ConflictUtils.look_at_position_flat(mirror_pos, target_position)

						Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(mirror_pos), QuaternionBox(rot), "mirror_spawn", nil, nil, optional_data, nil)

						local effect_name_id = NetworkLookup.effects[play_effect]
						local node_id = 0
						local rotation_offset = Quaternion.identity()
						local network_manager = Managers.state.network

						network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, mirror_pos, rotation_offset, false)
					end
				end
			end
		end

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(nav_callback)
	end,
	ai_spawn_liquid_blob = function (unit, buff, params)
		if not is_server() then
			return
		end

		local function nav_callback()
			if ALIVE[unit] then
				local blackboard = BLACKBOARDS[unit]
				local unit_pos = POSITION_LOOKUP[unit]
				local spread = 1
				local dist = 3
				local tries = 5
				local mesh_pos = ConflictUtils.get_spawn_pos_on_circle(blackboard.nav_world, unit_pos, dist, spread, tries)

				if not mesh_pos then
					return
				end

				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:play_audio_unit_event("enemy_grudge_bubonic_spawn", unit)

				local blob_unit = AiUtils.spawn_nurgle_liquid_blob_dynamic(Managers.state.network, mesh_pos, unit)
				local side_manager = Managers.state.side
				local side = side_manager.side_by_unit[unit] or side_manager:get_side_from_name("dark_pact")
				local side_id = side.side_id

				side_manager:add_unit_to_side(blob_unit, side_id)
			end
		end

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(nav_callback)
	end,
	ai_health_regen_update = function (unit, buff, params)
		local t = Managers.time:time("game")
		local frequency = buff.template.frequency

		if not buff.timer then
			buff.timer = t + frequency
		end

		if t < buff.timer then
			return
		end

		buff.timer = t + frequency

		if is_server() and ALIVE[unit] then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension and health_extension:is_alive() then
				local max_health = health_extension:get_max_health()
				local amount_to_heal = max_health * buff.template.part_healed_of_max_heath

				health_extension:add_heal(unit, amount_to_heal, nil, "leech")
			end
		end
	end,
	apply_curse_to_nearby_players = function (unit, buff, params, world)
		local template = buff.template
		local max_distance = template.max_distance
		local position = POSITION_LOOKUP[unit]
		buff.cursed_players = buff.cursed_players or {}
		buff.inside_last_frame = buff.inside_last_frame or {}
		local inside_last_frame = buff.inside_last_frame
		local cursed_players = buff.cursed_players
		local local_player = Managers.player:local_player().player_unit
		local proximity_system = Managers.state.entity:system("proximity_system")
		local player_broadphase = proximity_system.player_units_broadphase
		local nearby_players = FrameTable.alloc_table()
		local nearby_players_n = Broadphase.query(player_broadphase, position, max_distance, nearby_players)
		local inside_this_frame = FrameTable.alloc_table()

		for i = 1, nearby_players_n do
			local player_unit = nearby_players[i]
			inside_this_frame[player_unit] = true

			if not inside_last_frame[player_unit] then
				if player_unit == local_player and ALIVE[player_unit] then
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					local buff_to_add = template.buff_to_add
					local num_stacks = buff_extension:num_buff_stacks(buff_to_add)

					if num_stacks == 0 then
						local wwise_world = Managers.world:wwise_world(world)

						WwiseWorld.trigger_event(wwise_world, template.sound_on_enter)
					end
				end

				cursed_players[player_unit] = true
				inside_last_frame[player_unit] = true
			end
		end

		if is_server() then
			local t = Managers.time:time("game")
			buff.last_curse_t = buff.last_curse_t or t
			local time_between_curses = template.time_between_curses
			local next_curse_t = buff.last_curse_t + time_between_curses
			local should_apply_buff = t >= next_curse_t

			for cursed_player, _ in pairs(cursed_players) do
				if should_apply_buff then
					if inside_this_frame[cursed_player] then
						local buff_to_add = template.buff_to_add
						local buff_system = Managers.state.entity:system("buff_system")

						buff_system:add_buff(cursed_player, buff_to_add, unit)
					else
						cursed_players[cursed_player] = nil
					end
				end

				inside_last_frame[cursed_player] = inside_this_frame[cursed_player] and true or nil
			end

			buff.last_curse_t = should_apply_buff and next_curse_t or buff.last_curse_t
		elseif ALIVE[local_player] then
			inside_last_frame[local_player] = inside_this_frame[local_player] and true or nil
		end
	end,
	ai_create_explosion = function (owner_unit, buff, params, world)
		if not is_server() or not ALIVE[owner_unit] then
			return
		end

		local buff_template = buff.template
		local explosion_template_name = buff_template.explosion_template_name
		local damage_source_name = buff_template.damage_source_name or "buff"
		local explosion_position = POSITION_LOOKUP[owner_unit] or Unit.world_position(owner_unit, 0)
		local explosion_template = ExplosionTemplates[explosion_template_name]

		DamageUtils.create_explosion(world, owner_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source_name, true, false, owner_unit, 0, false)

		local attacker_unit_id = Managers.state.unit_storage:go_id(owner_unit)
		local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
		local damage_source_id = NetworkLookup.damage_sources[damage_source_name]

		Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
	end,
	ai_add_hit_sfx = function (unit, buff, params)
		local template = buff.template
		local override_sfx = template and template.hit_sfx_name

		if override_sfx then
			local ai_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

			if ai_inventory_extension then
				buff._override_id = ai_inventory_extension:add_additional_hit_sfx(override_sfx)
			end
		end
	end,
	ai_remove_hit_sfx = function (unit, buff, params)
		local ai_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

		if ai_inventory_extension then
			ai_inventory_extension:remove_additioanl_hit_sfx(buff._override_id)

			buff._override_id = nil
		end
	end,
	first_person_flow_event = function (unit, buff, params)
		local flow_event = buff.template.flow_event
		local local_player = owner_is_local_player(unit)

		if local_player then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
			local first_person_unit = first_person_extension and first_person_extension:get_first_person_unit()

			if first_person_unit then
				Unit.flow_event(first_person_unit, flow_event)
			end
		end
	end,
	remove_all_stamina = function (unit, buff, params)
		local local_player = owner_is_local_player(unit)

		if local_player then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points("complete", params.attacker_unit)
			end
		end
	end,
	trigger_terror_event = function (owner_unit, buff, params)
		if not is_server() or not ALIVE[owner_unit] then
			return
		end

		local buff_template = buff.template
		local faction_terror_events = buff_template.faction_terror_events
		local blackboard = BLACKBOARDS[owner_unit]
		local breed = blackboard and blackboard.breed
		local faction = breed and breed.race
		local terror_event = faction_terror_events[faction] or faction_terror_events.default
		local seed = buff.seed or Managers.mechanism:get_level_seed()

		Managers.state.conflict:start_terror_event(terror_event, seed, owner_unit)

		buff.seed = Math.next_random(seed)
	end,
	add_extra_frenzy_stack = function (unit, buff, params)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				buff_extension:add_buff(buff.template.buff_to_add)
			end
		end
	end,
	frenzy_damage_over_time = function (unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[unit] then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if not health_extension then
				return
			end

			local current_health = health_extension:current_health()
			local damage_per_tick = buff.template.damage_per_tick

			if current_health <= damage_per_tick then
				damage_per_tick = current_health - 1
			end

			if damage_per_tick > 0 then
				DamageUtils.add_damage_network(unit, unit, damage_per_tick, "torso", "buff", nil, Vector3(0, 0, 0), "buff", nil, unit)
			end
		end
	end,
	apply_frenzy_func = function (unit, buff, params)
		if ALIVE[unit] then
			local player = Managers.player:owner(unit)

			if player and not player.remote then
				MOOD_BLACKBOARD.skill_zealot = true
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("enemy_grudge_frenzy_start")
			end
		end
	end,
	remove_frenzy_func = function (unit, buff, params)
		if ALIVE[unit] then
			local player = Managers.player:owner(unit)

			if player and not player.remote then
				MOOD_BLACKBOARD.skill_zealot = false
			end
		end
	end,
	remove_frenzy_handlers = function (unit, buff, params)
		if buff.buff_ids then
			local buff_system = Managers.state.entity:system("buff_system")

			for unit, buff_id in pairs(buff.buff_ids) do
				if ALIVE[unit] then
					buff_system:remove_server_controlled_buff(unit, buff_id)
				end
			end
		end
	end
}
settings.proc_functions = {
	add_frenzy_handler = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local attacker_unit = params[1]
		local attack_type = params[4]

		if ALIVE[owner_unit] and ALIVE[attacker_unit] and MeleeAttackTypes[attack_type] then
			local buff_to_add = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			if not buff.buff_ids then
				buff.buff_ids = {}
			end

			if not buff.buff_ids[attacker_unit] then
				buff.buff_ids[attacker_unit] = buff_system:add_buff(attacker_unit, buff_to_add, owner_unit, true)
			end
		end
	end,
	add_frenzy_stack = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			if not buff.attacker_unit or hit_unit ~= buff.attacker_unit then
				return
			end

			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension and not buff_extension:has_buff_type(buff.template.blocker_buff) then
				buff_extension:add_buff(buff.template.buff_to_add)
			end
		end
	end,
	spawn_liquid_forward = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		BuffUtils.create_liquid_forward(owner_unit, buff)
	end,
	ai_add_buff_on_damage_dealt = function (owner_unit, buff, params, world, param_order)
		local target_unit = params[param_order.attacked_unit]
		local damage_amount = params[param_order.damage_amount]

		if ALIVE[target_unit] and damage_amount > 0 then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(target_unit, "buff_system")
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(target_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = target_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	ai_delay_regen = function (owner_unit, buff, params)
		local t = Managers.time:time("game")
		local on_hit_delay = buff.template.on_hit_delay

		if not buff.timer then
			buff.timer = t + on_hit_delay
		end

		buff.timer = t + on_hit_delay
	end,
	ai_heal_on_damage_dealt = function (owner_unit, buff, params, world, param_order)
		if not is_server() then
			return
		end

		local target_unit = params[param_order.attacked_unit]

		if ALIVE[owner_unit] and ALIVE[target_unit] and DamageUtils.is_enemy(owner_unit, target_unit) then
			local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")

			if health_extension and health_extension:is_alive() then
				local damage_amount = params[param_order.damage_amount]
				local buff_template = buff.template
				local multiplier = buff_template.multiplier or 1
				local bonus = buff_template.bonus or 0
				local amount_to_heal = math.clamp(damage_amount * multiplier + bonus, 0, 255)

				health_extension:add_heal(owner_unit, amount_to_heal, nil, "leech")
			end
		end
	end,
	random_teleport_ai = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local function nav_callback()
			if ALIVE[owner_unit] then
				local blackboard = BLACKBOARDS[owner_unit]
				local unit_pos = POSITION_LOOKUP[owner_unit]
				local template = buff.template
				local min_dist = template.min_teleport_distance
				local max_dist = template.max_teleport_distance
				local tries = template.find_valid_pos_attempts
				local min_player_dist = template.min_dist_from_players
				local side = Managers.state.side.side_by_unit[owner_unit]
				local validation_data = {
					side = side,
					min_dist_sqr = min_player_dist * min_player_dist
				}
				local teleport_position = ConflictUtils.get_spawn_pos_on_circle_with_func_range(blackboard.nav_world, unit_pos, min_dist, max_dist, tries, teleport_validation_func, validation_data, 8, 8)

				if teleport_position then
					local play_sound = "enemy_grudge_warping"
					local play_effect = "fx/grudge_marks_shadow_step"

					ConflictUtils.teleport_ai_unit(owner_unit, teleport_position, play_sound, play_effect)
				end
			end
		end

		local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

		ai_navigation_system:add_safe_navigation_callback(nav_callback)
	end,
	ai_crushing_blow = function (owner_unit, buff, params, world, param_order)
		if not is_server() or not ALIVE[owner_unit] then
			return
		end

		local attacked_unit = params[param_order.attacked_unit]
		local blackboard = BLACKBOARDS[owner_unit]
		local status_extension = ScriptUnit.has_extension(attacked_unit, "status_system")

		if blackboard and blackboard.hit_through_block and status_extension then
			local buff_extension = ScriptUnit.extension(attacked_unit, "buff_system")
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local action = blackboard.action

			if action and action.fatigue_type then
				local can_block, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction = status_extension:can_block(owner_unit)
				local fatigue_type = action.fatigue_type

				if type(fatigue_type) == "table" then
					local difficulty_manager = Managers.state.difficulty
					fatigue_type = difficulty_manager:get_difficulty_value_from_table(fatigue_type)
				end

				status_extension:blocked_attack(fatigue_type, owner_unit, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction)

				if is_server() then
					local network_manager = Managers.state.network
					local unit_storage = Managers.state.unit_storage
					local go_id = unit_storage:go_id(attacked_unit)
					local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]
					local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(owner_unit)

					network_manager.network_transmit:send_rpc_clients("rpc_player_blocked_attack", go_id, fatigue_type_id, attacker_unit_id, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction, attacker_is_level_unit)
				end
			end

			local proc_mod_table = params[param_order.PROC_MODIFIABLE]
			proc_mod_table.damage_amount = 0

			if action and action.blocked_damage then
				proc_mod_table.damage_amount = action.blocked_damage
			end

			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(attacked_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	ai_create_explosion = settings.buff_function_templates.ai_create_explosion
}
settings.max_stacks_functions = {}
