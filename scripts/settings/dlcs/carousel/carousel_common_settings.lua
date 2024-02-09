-- chunkname: @scripts/settings/dlcs/carousel/carousel_common_settings.lua

local settings = DLCSettings.carousel

require("scripts/unit_extensions/weapons/area_damage/area_damage_templates_vs")

settings.mechanism_settings = {
	versus = {
		class_name = "VersusMechanism",
		disadvantaged_team_starts = true,
		display_name = "area_selection_carousel_name",
		file = "scripts/managers/game_mode/mechanisms/versus_mechanism",
		hero_respawn_time = 1800,
		keep_leaving_players_grace_period = 90,
		loading_screen_override = "loading_screen_carousel",
		playfab_mirror = "PlayFabMirrorAdventure",
		query_port = 27016,
		rcon_port = 27015,
		server_port = 27017,
		server_universe = "carousel",
		social_wheel = "VersusSocialWheelUI",
		steam_port = 8766,
		sync_backend_id = true,
		use_gamepad_layout = true,
		using_ghost_mode_system = true,
		states = {
			"inn",
			"round_1",
			"round_2",
		},
		venture_end_states_in = {
			"inn",
		},
		venture_end_states_out = {
			"inn",
		},
		deny_outline_color_change_for_party = {
			dark_pact = true,
		},
		override_career_availability = {
			bw_adept = true,
			bw_necromancer = false,
			bw_scholar = true,
			bw_unchained = true,
			dr_engineer = false,
			dr_ironbreaker = true,
			dr_ranger = true,
			dr_slayer = true,
			es_huntsman = true,
			es_knight = true,
			es_mercenary = true,
			es_questingknight = false,
			vs_chaos_spawn = false,
			vs_gutter_runner = true,
			vs_packmaster = true,
			vs_poison_wind_globadier = true,
			vs_rat_ogre = false,
			vs_ratling_gunner = true,
			vs_stormfiend = false,
			vs_warpfire_thrower = true,
			we_maidenguard = true,
			we_shade = true,
			we_thornsister = false,
			we_waywatcher = true,
			wh_bountyhunter = true,
			wh_captain = true,
			wh_priest = false,
			wh_zealot = true,
		},
		override_item_availability = {},
		override_career_talents = {},
		map_pool = {
			"bell_pvp",
		},
		party_data = {
			heroes = {
				game_participating = true,
				name = "heroes",
				num_slots = 4,
				party_id = 1,
				using_bots = true,
				tags = {
					heroes = true,
				},
				party_relations = {
					enemy = {
						"dark_pact",
					},
				},
			},
			dark_pact = {
				game_participating = true,
				name = "dark_pact",
				num_slots = 4,
				party_id = 2,
				using_bots = false,
				tags = {
					dark_pact = true,
				},
				party_relations = {
					enemy = {
						"heroes",
					},
				},
			},
			spectators = {
				game_participating = false,
				name = "spectators",
				num_slots = 4,
				party_id = 3,
				using_bots = false,
				tags = {
					spectators = true,
				},
				party_relations = {},
			},
		},
		gamemode_lookup = {
			default = "versus",
			keep = "inn_vs",
		},
	},
}
settings.network_lookups = {
	inn_vs = "GameModeInnVs",
	versus = "GameModeVersus",
	versus_objective_names = "GameModeSettings.versus.objective_names",
	badges = {
		table_name = "BadgeDefinitions",
		base_table = {
			"n/a",
		},
	},
}
settings.flow_callbacks = "scripts/flow/flow_callbacks_vs"
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_vs",
}
settings.game_mode_files = {
	"scripts/managers/game_mode/game_modes/game_mode_versus",
	"scripts/managers/game_mode/game_modes/game_mode_inn_vs",
}
settings.game_modes = {
	"inn_vs",
	"versus",
}
settings.matchmaking_types = {
	"inn_vs",
	"versus",
}
settings.mechanisms = {
	"versus",
}
settings.matchmaking_state_files = {
	"scripts/managers/matchmaking/matchmaking_state_party_joins",
	"scripts/managers/matchmaking/matchmaking_state_reserve_lobby",
	"scripts/managers/matchmaking/matchmaking_state_search_player_hosted_lobby",
	"scripts/managers/matchmaking/matchmaking_state_reserve_slots_player_hosted",
	"scripts/managers/matchmaking/matchmaking_state_wait_join_player_hosted",
	"scripts/managers/matchmaking/matchmaking_state_player_hosted_game",
}
settings.career_setting_files = {
	"scripts/settings/profiles/career_settings_vs",
}
settings.profile_files = {
	"scripts/settings/profiles/vs_profiles",
}
settings.career_ability_settings = {
	"scripts/unit_extensions/default_player_unit/careers/career_ability_settings_vs",
}
settings.attachment_node_linking = {
	"scripts/settings/dlcs/carousel/attachment_node_linking_vs",
}
settings.outline_settings = {
	"scripts/settings/outline_settings_vs",
}
settings.cosmetics_files = {
	"scripts/settings/equipment/cosmetics_vs",
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_vs",
}
settings.statistics_database = {
	"scripts/managers/backend/statistics_database_vs",
}
settings.talent_settings = {
	"scripts/managers/talents/talent_settings_empty",
}
settings.unit_extension_templates = {
	"scripts/network/unit_extension_templates_vs",
}
settings.end_view = {
	"scripts/ui/views/level_end/level_end_view_versus",
}
settings.end_view_state = {
	"scripts/ui/views/level_end/states/end_view_state_summary_vs",
	"scripts/ui/views/level_end/states/end_view_state_parading_vs",
	"scripts/ui/views/level_end/states/end_view_state_score_vs",
}
settings.status_extensions = {
	"scripts/unit_extensions/generic/dark_pact_status_extension",
}
settings.systems = {
	"scripts/entity_system/systems/ghost_mode/ghost_mode_system",
	"scripts/entity_system/systems/versus/versus_objective_system",
	"scripts/entity_system/systems/versus/versus_item_spawner_system",
}
settings.vote_template_filenames = {
	"scripts/settings/dlcs/carousel/carousel_vote_templates",
}
settings.entity_extensions = {
	"scripts/unit_extensions/objectives/versus_base_objective_extension",
	"scripts/unit_extensions/objectives/versus_volume_objective_extension",
	"scripts/unit_extensions/objectives/versus_capture_point_objective_extension",
	"scripts/unit_extensions/objectives/versus_interact_objective_extension",
	"scripts/unit_extensions/objectives/versus_payload_objective_extension",
	"scripts/unit_extensions/objectives/versus_socket_objective_extension",
	"scripts/unit_extensions/objectives/versus_target_objective_extension",
	"scripts/unit_extensions/objectives/versus_mission_objective_extension",
}
settings.player_breeds = {
	"scripts/settings/breeds/breed_players_vs",
}
settings.career_help_ui = {
	"scripts/ui/hud_ui/career_help_ui_vs_definitions",
}
settings.social_wheel_settings = "scripts/ui/social_wheel/versus_social_wheel_ui_settings"
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/vs_packmaster_claw",
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_vs",
}
settings.animation_callback_template_files = {
	"scripts/entity_system/systems/animation/animation_callback_templates_vs",
}
settings.game_mode = "scripts/settings/game_mode_settings_vs"
settings.script_backend_playfab_files = {
	"scripts/managers/backend_playfab/script_backend_playfab_dedicated",
}
settings.player_movement_settings = "scripts/settings/player_movement_settings_vs"
settings.single_weapon_templates = "scripts/unit_extensions/weapons/single_weapon_unit_templates_vs"
settings.spawn_unit_templates = "scripts/settings/spawn_unit_templates_vs"
settings.anim_lookup = {
	"globe_charge",
	"globe_charge_hold",
	"globe_charge_cancel",
	"globe_throw",
	"equip",
	"cooldown_ready",
	"to_armed",
	"death_dissolve",
	"death_crawl",
}
settings.inventory_package_list = {
	"units/beings/player/dark_pact_first_person_base/chaos_sorcerer/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/chaos_sorcerer/chr_first_person_bot_base",
	"units/beings/player/dark_pact_first_person_base/chaos_spawn/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/chaos_spawn/chr_first_person_bot_base",
	"units/beings/player/dark_pact_first_person_base/chaos_troll/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/chaos_troll/chr_first_person_bot_base",
	"units/beings/player/dark_pact_first_person_base/skaven_common/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/skaven_common/chr_first_person_bot_base",
	"units/beings/player/dark_pact_first_person_base/skaven_rat_ogre/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/skaven_rat_ogre/chr_first_person_bot_base",
	"units/beings/player/dark_pact_first_person_base/skaven_stormfiend/chr_first_person_base",
	"units/beings/player/dark_pact_first_person_base/skaven_stormfiend/chr_first_person_bot_base",
	"units/beings/player/dark_pact_third_person_base/skaven_gutter_runner/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_gutter_runner/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_gutter_runner/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_gutter_runner/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_pack_master/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_pack_master/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_pack_master/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_pack_master/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_wind_globadier/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_wind_globadier/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_wind_globadier/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_wind_globadier/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_corruptor/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_corruptor/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/chaos_sorcerer_corruptor/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/chaos_sorcerer_corruptor/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_vortex/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_vortex/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/chaos_sorcerer_vortex/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/chaos_sorcerer_vortex/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_ratlinggunner/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_ratlinggunner/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_ratlinggunner/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_ratlinggunner/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_warpfire_thrower/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_warpfire_thrower/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_warpfire_thrower/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_warpfire_thrower/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/chaos_troll/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/chaos_troll/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/chaos_troll/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/chaos_troll/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/chaos_spawn/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/chaos_spawn/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/chaos_spawn/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/chaos_spawn/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_stormfiend/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_stormfiend/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_stormfiend/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_stormfiend/skin_0000/third_person/chr_third_person_mesh",
	"units/beings/player/dark_pact_third_person_base/skaven_rat_ogre/chr_third_person_base",
	"units/beings/player/dark_pact_third_person_base/skaven_rat_ogre/chr_third_person_base_husk",
	"units/beings/player/dark_pact_skins/skaven_rat_ogre/skin_0000/first_person/chr_first_person_mesh",
	"units/beings/player/dark_pact_skins/skaven_rat_ogre/skin_0000/third_person/chr_third_person_mesh",
	"units/weapons/player/dark_pact/wpn_skaven_packmaster_claw/wpn_skaven_packmaster_claw",
	"units/weapons/player/dark_pact/wpn_skaven_packmaster_claw/wpn_skaven_packmaster_claw_3p",
	"units/weapons/player/dark_pact/wpn_poison_wind_globe/wpn_poison_wind_globe_3p",
	"units/weapons/player/dark_pact/wpn_poison_wind_globe/wpn_poison_wind_globe",
	"units/weapons/player/dark_pact/wpn_skaven_gutter_runner_claws/wpn_left_claw",
	"units/weapons/player/dark_pact/wpn_skaven_gutter_runner_claws/wpn_left_claw_3p",
	"units/weapons/player/dark_pact/wpn_skaven_gutter_runner_claws/wpn_right_claw",
	"units/weapons/player/dark_pact/wpn_skaven_gutter_runner_claws/wpn_right_claw_3p",
	"units/weapons/player/dark_pact/wpn_skaven_warpfiregun/wpn_skaven_warpfiregun",
	"units/weapons/player/dark_pact/wpn_skaven_warpfiregun/wpn_skaven_warpfiregun_3p",
	"units/weapons/player/dark_pact/wpn_skaven_ratlinggun/wpn_skaven_ratlinggun",
	"units/weapons/player/dark_pact/wpn_skaven_ratlinggun/wpn_skaven_ratlinggun_3p",
	"units/weapons/player/dark_pact/wpn_chaos_sorcerer_stick/wpn_sorcerer_stick",
	"units/weapons/player/dark_pact/wpn_chaos_sorcerer_stick/wpn_sorcerer_stick_3p",
	"units/weapons/player/dark_pact/wpn_chaos_sorcerer_book/wpn_chaos_sorcerer_book",
	"units/weapons/player/dark_pact/wpn_chaos_sorcerer_book/wpn_chaos_sorcerer_book_3p",
	"units/weapons/player/dark_pact/wpn_chaos_troll/wpn_chaos_troll_01",
	"units/weapons/player/dark_pact/wpn_chaos_troll/wpn_chaos_troll_01_3p",
}
settings.husk_lookup = {
	"units/beings/player/dark_pact_third_person_base/skaven_gutter_runner/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_pack_master/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_wind_globadier/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_ratlinggunner/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_warpfire_thrower/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_corruptor/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/chaos_sorcerer_vortex/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/chaos_spawn/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/chaos_troll/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_rat_ogre/chr_third_person_base_husk",
	"units/beings/player/dark_pact_third_person_base/skaven_stormfiend/chr_third_person_base_husk",
	"units/gameplay/versus_volume_objective",
	"units/gameplay/versus_capture_point_objective",
	"units/gameplay/versus_mission_objective",
	"units/test_unit/jump_marker_ground_pactsworn",
}
settings.interactions = {
	"carousel_dark_pact_climb",
	"carousel_start_versus",
	"carousel_dark_pact_tunnel",
	"carousel_dark_pact_spawner",
	"versus_map_access",
}
settings.interactions_filenames = {
	"scripts/settings/dlcs/carousel/carousel_interactions",
}
settings.network_go_types = {
	"versus_objective",
	"versus_volume_objective_unit",
	"versus_capture_point_objective_unit",
	"versus_mission_objective_unit",
	"versus_dark_pact_climbing_interaction_unit",
}
settings.material_effect_mappings_file_names = {
	"scripts/settings/material_effect_mappings_player_enemies",
}
settings.unlock_settings = {
	carousel = {
		class = "AlwaysUnlocked",
	},
}
settings.dialogue_events = {
	"taunting_witch_hunter",
	"taunting_bright_wizard",
	"taunting_dwarf_ranger",
	"taunting_wood_elf",
	"taunting_empire_soldier",
	"vw_affirmative",
	"vw_negation",
	"vw_thank_you",
	"vw_attack_now",
	"vw_boss",
	"vw_gather",
	"vw_go_here",
	"vw_objective_in_sight",
	"vw_help",
	"vw_patrol",
	"vw_ambush",
	"vw_wait",
	"vw_cover_me",
	"vw_answer_ping",
}
settings.social_wheel_sfx_events = {
	dark_pact = {
		CLOSE = "versus_com_wheel_close",
		HOVER = "versus_com_wheel_hover",
		OPEN = "versus_com_wheel_open",
		SELECT = "versus_com_wheel_select",
	},
}
