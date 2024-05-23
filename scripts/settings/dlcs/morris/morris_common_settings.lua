-- chunkname: @scripts/settings/dlcs/morris/morris_common_settings.lua

local settings = DLCSettings.morris

settings.unlock_settings = {
	morris = {
		class = "AlwaysUnlocked",
	},
	grass = {
		class = "UnlockDlc",
		id = "1592630",
	},
	grass_2 = {
		class = "UnlockDlc",
		id = "1592630",
	},
}
settings.unlock_settings_xb1 = {
	morris = {
		class = "AlwaysUnlocked",
	},
	grass = {
		backend_reward_id = "grass",
		class = "UnlockDlc",
		id = "58375039-3534-3043-C036-354E4233F200",
	},
	grass_2 = {
		backend_reward_id = "grass_2",
		class = "UnlockDlc",
		id = "58375039-3534-3043-C036-354E4233F200",
	},
	five_career_bundle = {
		backend_reward_id = "five_career_bundle",
		class = "UnlockDlc",
		id = "4C344E39-384E-3048-C037-4C4443513000",
	},
	scholar_bundle = {
		backend_reward_id = "scholar_bundle",
		class = "UnlockDlc",
		id = "37444E39-4D52-3035-C033-524E56515000",
	},
	ironbreaker_bundle = {
		backend_reward_id = "ironbreaker_bundle",
		class = "UnlockDlc",
		id = "544A4E39-434E-3058-C030-384434372500",
	},
	bountyhunter_bundle = {
		backend_reward_id = "bountyhunter_bundle",
		class = "UnlockDlc",
		id = "56434E39-3757-304A-C056-524A53367300",
	},
	mercenary_bundle = {
		backend_reward_id = "mercenary_bundle",
		class = "UnlockDlc",
		id = "43564E39-5853-3037-C04A-505257438800",
	},
	shade_bundle = {
		backend_reward_id = "shade_bundle",
		class = "UnlockDlc",
		id = "50425039-424A-304A-C031-373454422300",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		morris = {
			class = "AlwaysUnlocked",
		},
		grass = {
			backend_reward_id = "grass",
			class = "UnlockDlc",
			id = "d3a78a970d0d40ea8abdded9dd3e8bf3",
			product_label = "V2USFORGOTTENREL",
		},
		grass_2 = {
			backend_reward_id = "grass_2",
			class = "UnlockDlc",
			id = "d3a78a970d0d40ea8abdded9dd3e8bf3",
			product_label = "V2USFORGOTTENREL",
		},
		five_career_bundle = {
			backend_reward_id = "five_career_bundle",
			class = "UnlockDlc",
			id = "614a9ea6b2ad44c6834218ee784c5535",
			product_label = "V2USLOHNERSCOLLE",
		},
		scholar_bundle = {
			backend_reward_id = "scholar_bundle",
			class = "UnlockDlc",
			id = "69a59b3b817948b28b4574f9255b68bd",
			product_label = "V2USLIGHTOFJUDGE",
		},
		ironbreaker_bundle = {
			backend_reward_id = "ironbreaker_bundle",
			class = "UnlockDlc",
			id = "878a07aa09394108a0959ae864df5d3f",
			product_label = "V2USKARAKNORNHOL",
		},
		bountyhunter_bundle = {
			backend_reward_id = "bountyhunter_bundle",
			class = "UnlockDlc",
			id = "46725f0f69634f5b9cc49ab9d77f92d0",
			product_label = "V2USDASHINGROGUE",
		},
		mercenary_bundle = {
			backend_reward_id = "mercenary_bundle",
			class = "UnlockDlc",
			id = "7b90a25a8e914000847a078da21be54a",
			product_label = "V2USFLAMBOYANTSE",
		},
		shade_bundle = {
			backend_reward_id = "shade_bundle",
			class = "UnlockDlc",
			id = "3f020561f477420d812f3281b5e0826f",
			product_label = "V2USAGENTOFMALEK",
		},
	},
	CUSA13645_00 = {
		morris = {
			class = "AlwaysUnlocked",
		},
		grass = {
			backend_reward_id = "grass",
			class = "UnlockDlc",
			id = "78047b6b56134b6e86b44903e3bb9468",
			product_label = "V2EUFORGOTTENREL",
		},
		grass_2 = {
			backend_reward_id = "grass_2",
			class = "UnlockDlc",
			id = "78047b6b56134b6e86b44903e3bb9468",
			product_label = "V2EUFORGOTTENREL",
		},
		five_career_bundle = {
			backend_reward_id = "five_career_bundle",
			class = "UnlockDlc",
			id = "aa1ff0f288944f27a73434f9ed93474d",
			product_label = "V2EULOHNERSCOLLE",
		},
		scholar_bundle = {
			backend_reward_id = "scholar_bundle",
			class = "UnlockDlc",
			id = "c8e5abd113d941f687157e3718c1a65c",
			product_label = "V2EULIGHTOFJUDGE",
		},
		ironbreaker_bundle = {
			backend_reward_id = "ironbreaker_bundle",
			class = "UnlockDlc",
			id = "feb6dcf10e4948c893a03ba83a6ae401",
			product_label = "V2EUKARAKNORNHOL",
		},
		bountyhunter_bundle = {
			backend_reward_id = "bountyhunter_bundle",
			class = "UnlockDlc",
			id = "a61971e97ad34fd4b28f8c8b850356fe",
			product_label = "V2EUDASHINGROGUE",
		},
		mercenary_bundle = {
			backend_reward_id = "mercenary_bundle",
			class = "UnlockDlc",
			id = "874e8163f0524748b467ea1ac2a1c402",
			product_label = "V2EUFLAMBOYANTSE",
		},
		shade_bundle = {
			backend_reward_id = "shade_bundle",
			class = "UnlockDlc",
			id = "4f7781f15dae4dc7ad33953a62259dbc",
			product_label = "V2EUAGENTOFMALEK",
		},
	},
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_morris",
}
settings.statistics_util = {
	"scripts/managers/backend/statistics_util_morris",
}
settings.attachment_node_linking = {
	"scripts/settings/dlcs/morris/attachment_node_linking_morris",
}
settings.anim_lookup = {
	"to_dr_deus_01",
	"to_dr_deus_01_loaded",
	"to_dr_deus_01_noammo",
	"parry_stab_02",
}
settings.mutators = {
	"no_sorcerers",
	"curse_corrupted_flesh",
	"curse_skulls_of_fury",
	"curse_change_of_tzeentch",
	"curse_blood_storm",
	"curse_bolt_of_change",
	"curse_monophobia",
	"curse_empathy",
	"curse_rotten_miasma",
	"curse_khorne_champions",
	"curse_skulking_sorcerer",
	"curse_abundance_of_life",
	"curse_greed_pinata",
	"curse_egg_of_tzeentch",
	"blessing_of_shallya",
	"blessing_of_grimnir",
	"blessing_of_isha",
	"blessing_of_ranald",
	"blessing_of_abundance",
	"increased_grenades",
	"increased_deus_potions",
	"increased_deus_soft_currency",
	"increased_healing",
	"deus_more_hordes",
	"deus_less_hordes",
	"deus_more_monsters",
	"deus_less_monsters",
	"deus_more_roamers",
	"deus_less_roamers",
	"deus_more_specials",
	"deus_less_specials",
	"deus_more_elites",
	"deus_less_elites",
	"deus_pacing_tweak",
	"deus_difficulty_tweak",
	"no_roamers",
	"easier_packs",
	"easier_hordes",
	"pacing_frozen",
	"escape",
}
settings.mutator_common_settings = {
	deus = {
		initial_activation_delay = 10,
	},
}
settings.interactions = {
	"deus_access",
	"deus_weapon_chest",
	"deus_cursed_chest",
	"deus_debug_changelog",
	"deus_cursed_chest",
	"deus_setup_rally_flag",
	"deus_arena_interactable",
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/morris/morris_interactions",
}
settings.interaction_ui_components = {
	swap_melee = {
		class_name = "DeusSwapWeaponInteractionUI",
		filename = "scripts/settings/dlcs/morris/deus_swap_weapon_interaction_ui",
	},
	swap_ranged = {
		class_name = "DeusSwapRangedInteractionUI",
		filename = "scripts/settings/dlcs/morris/deus_swap_ranged_interaction_ui",
	},
	upgrade = {
		class_name = "DeusUpgradeWeaponInteractionUI",
		filename = "scripts/settings/dlcs/morris/deus_upgrade_weapon_interaction_ui",
	},
	power_up = {
		class_name = "DeusPowerUpInteractionUI",
		filename = "scripts/settings/dlcs/morris/deus_power_up_interaction_ui",
	},
}
settings.vote_template_filenames = {
	"scripts/settings/dlcs/morris/morris_vote_templates",
}
settings.mechanism_settings = {
	deus = {
		check_matchmaking_hero_availability = true,
		class_name = "DeusMechanism",
		default_inventory = true,
		disable_difficulty_check = true,
		display_name = "area_selection_morris_name",
		file = "scripts/managers/game_mode/mechanisms/deus_mechanism",
		playfab_mirror = "PlayFabMirrorAdventure",
		query_port = 27016,
		rcon_port = 27015,
		server_port = 27017,
		server_universe = "deus",
		should_display_weapon_disclaimer = true,
		start_game_close_sound_event = "hud_morris_start_menu_close",
		start_game_open_sound_event = "hud_morris_start_menu_open",
		start_game_play_sound_event = "hud_morris_start_menu_play",
		steam_port = 8766,
		use_alt_horde_spawning = true,
		use_gamepad_layout = true,
		vote_switch_mechanism_background = "vote_switch_mechanism_morris_background",
		vote_switch_mechanism_text = "vote_switch_mechanism_morris_description",
		states = {
			"inn_deus",
			"ingame_deus",
			"map_deus",
			"tutorial",
		},
		venture_end_states_in = {
			"inn_deus",
		},
		venture_end_states_out = {
			"inn_deus",
		},
		party_data = {
			heroes = {
				name = "heroes",
				num_slots = 4,
				party_id = 1,
			},
		},
		progress_loss_warning_message_data = {
			message = "exit_warning",
			is_allowed = function ()
				return Managers.mechanism:get_state() ~= "inn_deus"
			end,
		},
		gamemode_lookup = {},
	},
}
settings.game_mode_files = {
	"scripts/managers/game_mode/game_modes/game_mode_inn_deus",
	"scripts/managers/game_mode/game_modes/game_mode_map_deus",
	"scripts/managers/game_mode/game_modes/game_mode_deus",
}
settings.game_modes = {
	"inn_deus",
	"map_deus",
	"deus",
}
settings.mechanisms = {
	"deus",
}
settings.matchmaking_types = {
	"inn_deus",
	"map_deus",
	"deus",
	"deus_weekly",
}
settings.game_mode = "scripts/settings/dlcs/morris/game_mode_settings_morris"
settings.end_view = {
	"scripts/ui/views/level_end/level_end_view_deus",
}
settings.husk_lookup = {
	"units/props/inn/deus/deus_chest_01",
	"units/props/inn/deus/deus_cursed_chest",
	"units/props/deus_pickups/deus_loot_pyramide_01",
	"units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
	"units/weapons/player/wpn_dr_deus_projectile_01/wpn_dr_deus_projectile_01_3ps",
	"units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3ps",
	"units/props/skull_of_fury",
	"units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
	"units/weapons/player/pup_deus_folded_rally_flag_01/pup_deus_folded_rally_flag_01",
	"units/props/deus_rally_flag/deus_rally_flag",
	"units/gameplay/rotten_miasma_safe_area/rotten_miasma_safe_area_01",
	"units/decals/deus_decal_bloodstorm_inner",
	"units/decals/deus_decal_bloodstorm_outer",
	"units/weapons/player/pup_grenades/pup_holy_hand_grenade_01_t1",
	"units/weapons/player/wpn_emp_holy_hand_grenade_01_t1/wpn_emp_holy_hand_grenade_01_t1_3p",
	"units/props/egg_of_tzeentch",
	"units/decals/deus_decal_aoe_bluefire_02",
	"units/props/deus_pinata/deus_pinata_01",
	"units/weapons/player/pup_explosive_barrel/pup_tiny_explosive_barrel_01",
	"units/props/level_hero_assets/deus_portal_02",
	"units/decals/deus_decal_aoe_cursedchest_01",
}
settings.hit_effects = {
	"scripts/settings/hit_effects/hit_effects_chaos_greed_pinata",
}
settings.effects = {
	"fx/deus_prop_pinata_teleport",
	"fx/cw_chain_lightning",
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/morris/morris_unit_extension_templates",
}
settings.game_object_initializers = {
	deus_weapon_chest = function (unit, unit_name, unit_template, gameobject_functor_context)
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local data_table = {
			go_type = NetworkLookup.go_types.deus_weapon_chest,
			husk_unit = NetworkLookup.husks[unit_name],
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
		}

		return data_table
	end,
	deus_cursed_chest = function (unit, unit_name, unit_template, gameobject_functor_context)
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local data_table = {
			go_type = NetworkLookup.go_types.deus_cursed_chest,
			husk_unit = NetworkLookup.husks[unit_name],
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
		}

		return data_table
	end,
	buff_objective_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local network_buff_ids = {}
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local initial_buff_names = buff_extension:initial_buff_names()

		for _, buff_name in pairs(initial_buff_names) do
			local buff_id = NetworkLookup.buff_templates[buff_name]

			table.insert(network_buff_ids, buff_id)
		end

		local data_table = {
			go_type = NetworkLookup.go_types.buff_objective_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			network_buff_ids = network_buff_ids,
		}

		return data_table
	end,
	egg_of_tzeentch_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local network_buff_ids = {}
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local initial_buff_names = buff_extension:initial_buff_names()

		for _, buff_name in pairs(initial_buff_names) do
			local buff_id = NetworkLookup.buff_templates[buff_name]

			table.insert(network_buff_ids, buff_id)
		end

		local health_extension = ScriptUnit.has_extension(unit, "health_system")
		local timed_spawner_extension = ScriptUnit.has_extension(unit, "timed_spawner_system")
		local spawn_rate = timed_spawner_extension:get_spawn_rate()
		local network_breed_ids = {}
		local spawnable_breeds = timed_spawner_extension:get_spawnable_breeds()

		for _, breed_name in pairs(spawnable_breeds) do
			local breed_id = NetworkLookup.breeds[breed_name]

			table.insert(network_breed_ids, breed_id)
		end

		local max_spawn_amount = timed_spawner_extension:get_max_spawn_amount()
		local data_table = {
			go_type = NetworkLookup.go_types.egg_of_tzeentch_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			network_buff_ids = network_buff_ids,
			health = health_extension:get_max_health(),
			max_spawn_amount = max_spawn_amount,
			spawnable_breeds = network_breed_ids,
			spawn_rate = spawn_rate,
		}

		return data_table
	end,
	deus_relic = function (unit, unit_name, unit_template, gameobject_functor_context)
		local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
		local network_position = locomotion_extension.network_position
		local network_rotation = locomotion_extension.network_rotation
		local network_velocity = locomotion_extension.network_velocity
		local network_angular_velocity = locomotion_extension.network_angular_velocity
		local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
		local pickup_name = pickup_extension.pickup_name
		local has_physics = pickup_extension.has_physics
		local spawn_type = pickup_extension.spawn_type
		local data_table = {
			go_type = NetworkLookup.go_types.deus_relic,
			husk_unit = NetworkLookup.husks[unit_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
			debug_pos = Unit.local_position(unit, 0),
			pickup_name = NetworkLookup.pickup_names[pickup_name],
			has_physics = has_physics,
			spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
		}

		return data_table
	end,
	buffed_timed_explosion_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
		local timed_explosion_extension = ScriptUnit.extension(unit, "area_damage_system")
		local follow_unit = timed_explosion_extension.follow_unit
		local explosion_template_name = timed_explosion_extension.explosion_template_name
		local network_manager = Managers.state.network
		local network_buff_ids = {}
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local initial_buff_names = buff_extension:initial_buff_names()

		for _, buff_name in pairs(initial_buff_names) do
			local buff_id = NetworkLookup.buff_templates[buff_name]

			table.insert(network_buff_ids, buff_id)
		end

		local data_table = {
			go_type = NetworkLookup.go_types.buffed_timed_explosion_unit,
			husk_unit = NetworkLookup.husks[unit_name],
			follow_unit = network_manager:unit_game_object_id(follow_unit),
			explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name],
			position = Unit.local_position(unit, 0),
			rotation = Unit.local_rotation(unit, 0),
			network_buff_ids = network_buff_ids,
		}

		return data_table
	end,
}
settings.game_object_extractors = {
	deus_weapon_chest = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local pickup_name = GameSession.game_object_field(game_session, game_object_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, game_object_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, game_object_id, "spawn_type")
		local extension_init_data = {
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			},
		}
		local unit_template_name = "deus_weapon_chest"

		return unit_template_name, extension_init_data
	end,
	deus_cursed_chest = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local pickup_name = GameSession.game_object_field(game_session, game_object_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, game_object_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, game_object_id, "spawn_type")
		local extension_init_data = {
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			},
		}
		local unit_template_name = "deus_cursed_chest"

		return unit_template_name, extension_init_data
	end,
	buff_objective_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local initial_buff_names = {}
		local network_buff_ids = GameSession.game_object_field(game_session, game_object_id, "network_buff_ids")

		if network_buff_ids then
			for _, buff_id in ipairs(network_buff_ids) do
				local buff_name = NetworkLookup.buff_templates[buff_id]

				table.insert(initial_buff_names, buff_name)
			end
		end

		local extension_init_data = {
			buff_system = {
				initial_buff_names = initial_buff_names,
			},
		}
		local unit_template_name = "buff_objective_unit"

		return unit_template_name, extension_init_data
	end,
	deus_relic = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
		local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
		local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
		local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
		local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
		local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
		local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
		local extension_init_data = {
			projectile_locomotion_system = {
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
			},
			pickup_system = {
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
			},
		}
		local unit_template_name = "deus_relic"

		return unit_template_name, extension_init_data
	end,
	egg_of_tzeentch_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
		local initial_buff_names = {}
		local network_buff_ids = GameSession.game_object_field(game_session, game_object_id, "network_buff_ids")

		if network_buff_ids then
			for _, buff_id in ipairs(network_buff_ids) do
				local buff_name = NetworkLookup.buff_templates[buff_id]

				table.insert(initial_buff_names, buff_name)
			end
		end

		local health = GameSession.game_object_field(game_session, game_object_id, "health")
		local spawn_rate = GameSession.game_object_field(game_session, game_object_id, "spawn_rate")
		local spawnable_breeds = GameSession.game_object_field(game_session, game_object_id, "spawnable_breeds")
		local max_spawn_amount = GameSession.game_object_field(game_session, game_object_id, "max_spawn_amount")
		local extension_init_data = {
			health_system = {
				health = health,
			},
			death_system = {
				death_reaction_template = "destructible_buff_objective_unit",
				is_husk = true,
			},
			hit_reaction_system = {
				hit_reaction_template = "level_object",
				is_husk = true,
			},
			buff_system = {
				initial_buff_names = initial_buff_names,
			},
			timed_spawner_system = {
				spawn_rate = spawn_rate,
				spawnable_breeds = spawnable_breeds,
				max_spawn_amount = max_spawn_amount,
			},
		}
		local unit_template_name = "egg_of_tzeentch_unit"

		return unit_template_name, extension_init_data
	end,
	buffed_timed_explosion_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
		local follow_unit = GameSession.game_object_field(game_session, go_id, "follow_unit")
		local explosion_template_name = GameSession.game_object_field(game_session, go_id, "explosion_template_name")
		local initial_buff_names = {}
		local network_buff_ids = GameSession.game_object_field(game_session, go_id, "network_buff_ids")

		if network_buff_ids then
			for _, buff_id in ipairs(network_buff_ids) do
				local buff_name = NetworkLookup.buff_templates[buff_id]

				table.insert(initial_buff_names, buff_name)
			end
		end

		local extension_init_data = {
			area_damage_system = {
				follow_unit = Managers.state.unit_storage:unit(follow_unit),
				explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name],
			},
			buff_system = {
				initial_buff_names = initial_buff_names,
			},
		}
		local unit_template_name = "buffed_timed_explosion_unit"

		return unit_template_name, extension_init_data
	end,
}
settings.game_object_templates = {
	deus_weapon_chest = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
	deus_cursed_chest = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
	buff_objective_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
	deus_relic = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
	egg_of_tzeentch_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		syncs_position = true,
		syncs_rotation = true,
	},
	buffed_timed_explosion_unit = {
		game_object_created_func_name = "game_object_created_network_unit",
		game_object_destroyed_func_name = "game_object_destroyed_network_unit",
		is_level_unit = false,
		syncs_position = true,
		syncs_rotation = true,
	},
}
settings.network_go_types = {
	"deus_weapon_chest",
	"deus_cursed_chest",
	"buff_objective_unit",
	"deus_relic",
	"egg_of_tzeentch_unit",
	"buffed_timed_explosion_unit",
}
settings.conflict_settings_files = {
	"scripts/settings/dlcs/morris/deus_conflict_settings",
}
settings.generic_terror_event_files = {
	"scripts/settings/dlcs/morris/deus_generic_terror_events",
}
settings.weapon_skins_file_names = {
	"scripts/settings/equipment/weapon_skins_morris",
}
settings.weapon_traits_file_names = {
	"scripts/settings/equipment/weapon_traits_morris",
}
settings.weapon_properties_file_names = {
	"scripts/settings/equipment/weapon_properties_morris",
}
settings.hero_hud_components = {
	"DeusSoftCurrencyIndicatorUI",
	"DeusCurseUI",
	"EnergyBarUI",
}

if BUILD ~= "release" or script_data.debug_enabled then
	table.insert(settings.hero_hud_components, "DeusDebugUI")
	table.insert(settings.hero_hud_components, "DeusDebugMapUI")
end

settings.horde_composition_file = "scripts/settings/dlcs/morris/morris_horde_compositions"
settings.horde_compositions_pacing_file = "scripts/settings/dlcs/morris/morris_horde_compositions_pacing"
settings.material_effect_mappings_file_names = {
	"scripts/settings/material_effect_mappings_morris",
}
settings.systems = {
	"scripts/entity_system/systems/deus_chest/deus_chest_preload_system",
}
settings.entity_extensions = {
	"scripts/unit_extensions/deus/deus_chest_preload_extension",
	"scripts/unit_extensions/deus/deus_cursed_chest_extension",
	"scripts/unit_extensions/deus/deus_relic_extension",
	"scripts/unit_extensions/deus/deus_arena_idol_extension",
	"scripts/unit_extensions/deus/deus_arena_interactable_extension",
	"scripts/unit_extensions/generic/timed_spawner_extension",
	"scripts/unit_extensions/ai_supplementary/curse_corruptor_beam_extension",
}
settings.entity_system_params = {
	deus_chest_preload_system = {
		system_class_name = "DeusChestPreloadSystem",
		system_name = "deus_chest_preload_system",
		extension_list = {
			"DeusChestPreloadExtension",
		},
	},
	deus_cursed_chest_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_cursed_chest_system",
		extension_list = {
			"DeusCursedChestExtension",
		},
	},
	deus_relic_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_relic_system",
		extension_list = {
			"DeusRelicExtension",
		},
	},
	timed_spawner_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "timed_spawner_system",
		extension_list = {
			"TimedSpawnerExtension",
		},
	},
	deus_arena_idol_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_arena_idol_system",
		extension_list = {
			"DeusArenaIdolExtension",
		},
	},
	deus_arena_interactable_system = {
		system_class_name = "ExtensionSystemBase",
		system_name = "deus_arena_interactable_system",
		extension_list = {
			"DeusArenaInteractableExtension",
		},
	},
}
settings.additional_system_extensions = {
	pickup_system = {
		{
			class = "DeusChestExtension",
			require = "scripts/unit_extensions/pickups/deus_chest_extension",
		},
	},
}
settings.network_damage_types = {
	"curse_empathy",
	"skulls_of_fury",
	"blood_storm",
	"bolt_of_change",
}
settings.network_damage_sources = {
	"poison_dot",
}
settings.network_lookups = {
	deus_blessings = "DeusBlessingSettings",
	deus_chest_types = "DEUS_CHEST_TYPES",
	deus_journeys = "DeusJourneySettings",
	deus_power_up_templates = "DeusPowerUpTemplates",
	deus_themes = "DeusThemeSettings",
}
settings.twitch_settings = {
	vote_templates_file = "scripts/settings/dlcs/morris/twitch_vote_templates_morris",
	supported_game_modes = {
		deus = true,
		map_deus = true,
	},
	vote_whitelists = {
		map_deus = {},
		deus = {
			"twitch_vote_infinite_bombs",
			"twitch_add_damage_potion_buff",
			"twitch_add_cooldown_potion_buff",
			"twitch_spawn_minotaur",
			"twitch_spawn_poison_wind_globadier",
			"twitch_health_regen",
			"twitch_vote_activate_ticking_bomb",
			"twitch_spawn_stormfiend",
			"twitch_vote_activate_realism",
			"twitch_spawn_rat_ogre",
			"twitch_give_healing_draught",
			"twitch_spawn_death_squad_chaos_warrior",
			"twitch_spawn_horde_vector_blob",
			"twitch_spawn_berzerkers",
			"twitch_give_frag_grenade_t1",
			"twitch_vote_full_temp_hp",
			"twitch_give_first_aid_kit",
			"twitch_spawn_explosive_loot_rats",
			"twitch_spawn_death_squad_storm_vermin",
			"twitch_give_fire_grenade_t1",
			"twitch_spawn_gutter_runner",
			"twitch_spawn_plague_monks",
			"twitch_spawn_vortex_sorcerer",
			"twitch_spawn_pack_master",
			"twitch_vote_hemmoraghe",
			"twitch_vote_activate_root",
			"twitch_add_speed_potion_buff",
			"twitch_health_degen",
			"twitch_vote_critical_strikes",
			"twitch_spawn_warpfire_thrower",
			"twitch_spawn_chaos_troll",
			"twitch_spawn_ratling_gunner",
			"twitch_spawn_chaos_spawn",
		},
	},
}
settings.camera_shake_settings = {
	holy_hand_grenade_explosion = {
		amplitude = 1.5,
		duration = 0.4,
		fade_out = 0.5,
		octaves = 7,
		persistance = 1.2,
	},
}
settings.death_reactions = {
	"scripts/settings/dlcs/morris/morris_death_reactions",
}
settings.dot_type_lookup = {
	boon_career_ability_bleed_aoe = "poison_dot",
	boon_career_ability_burning_aoe = "burning_dot",
	boon_career_ability_poison_aoe = "poison_dot",
	burning_magma_dot = "burning_dot",
	we_deus_01_dot = "burning_dot",
	we_deus_01_dot_charged = "burning_dot",
	we_deus_01_dot_fast = "burning_dot",
	we_deus_01_dot_special_charged = "burning_dot",
}
settings.end_view_state = {
	"scripts/ui/views/level_end/states/end_view_state_summary_deus",
}
settings.loading_tips_file = "scripts/settings/dlcs/morris/morris_loading_tips"
settings.drone_templates = {
	deus_damage_drone = {
		impact_sfx = "Play_boon_drone_impact",
		impact_vfx = "fx/skulls_2024/boons_drone_projectile_impact_fx",
		spawn_sfx = "Play_boon_drone_spawn",
		linked_vfx = {
			destroy_policy = "stop",
			name = "fx/skulls_2024/boons_drone_projectile_fx",
		},
	},
}
