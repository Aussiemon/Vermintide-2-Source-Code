require("scripts/ui/ui_layer")
require("scripts/utils/colors")

UISettings = UISettings or {
	start_drag_threshold = 0.15,
	tooltip_fade_in_speed = 4,
	double_click_threshold = 0.1,
	crafting_progress_time = 0.3,
	max_craft_material_presentation_amount = 999,
	bots_level_display_text = "BOT",
	console_menu_camera_move_duration = 0.5,
	items_per_chest = 3,
	max_inventory_items = 1000,
	hero_panel_height = 120,
	wait_for_mip_streaming_items = false,
	use_subtitles = true,
	max_fatigue_shields = 20,
	crafting_animation_out_time = 0.1,
	chest_upgrade_score_topics_min_duration = 0.5,
	chest_upgrade_score_topics_max_duration = 7,
	tooltip_wait_duration = 0.1,
	crafting_animation_in_time = 0.2,
	wait_for_mip_streaming_character = true,
	crafting_animation_wait_time = 0.3,
	console_menu_rect_color = Colors.get_color_table_with_alpha("console_menu_rect", 125),
	console_start_game_menu_rect_color = Colors.get_color_table_with_alpha("console_menu_rect", 125),
	game_start_windows = {
		frame = "menu_frame_09",
		background = "menu_frame_bg_01",
		spacing = 25,
		large_window_frame = "menu_frame_08",
		size = {
			520,
			820
		},
		large_window_size = {
			1680,
			900
		}
	},
	game_start_windows_console = {
		frame = "menu_frame_09",
		background = "menu_frame_bg_01",
		spacing = 25,
		large_window_frame = "menu_frame_08",
		size = {
			520,
			740
		},
		large_window_size = {
			1680,
			900
		}
	},
	mission_selection_map_size = {
		1630,
		840
	},
	dice_type_success_sides = {
		gold = 4,
		metal = 3,
		warpstone = 6,
		wood = 2
	},
	subtitles_font_size = Application.user_setting("subtitles_font_size") or 20,
	subtitles_background_alpha = 2.55 * (Application.user_setting("subtitles_background_opacity") or 20),
	root_scale = {
		Application.user_setting("root_scale_x") or 1,
		Application.user_setting("root_scale_y") or 1
	},
	hud_scale = Application.user_setting("hud_scale") or 100,
	hud_clamp_ui_scaling = Application.user_setting("hud_clamp_ui_scaling") or false,
	use_custom_hud_scale = Application.user_setting("use_custom_hud_scale") or false,
	use_pc_menu_layout = Application.user_setting("use_pc_menu_layout") or false,
	use_gamepad_hud_layout = Application.user_setting("use_gamepad_hud_layout") or false,
	interaction = {
		bar = {
			fade_in = 0.1,
			fade_out = 0.1
		}
	},
	inventory_hud = {
		select_animation_duration = 0.2,
		slot_default_alpha = 170,
		slot_select_size = 62,
		slot_select_alpha = 255,
		slot_default_size = 46,
		slot_spacing = 2,
		equip_animation_duration = 0.2,
		bar_lit_fade_out_duration = 0.12,
		bar_lit_pulse_duration = 3
	},
	inventory = {
		item_preview_fade_in_time = 0.2,
		item_list = {
			intro = {
				total_tween_time = 0.2,
				background_fade_in_end_fraction = 0.8,
				background_fade_in_start_fraction = 0.4,
				item_fade_in_end_fraction = 0.4,
				item_fade_in_start_fraction = 0,
				text_fade_in_start_fraction = 0.8,
				non_room_item_alpha_value = 120,
				text_fade_in_end_fraction = 1
			},
			border = {
				alpha_select = 255,
				select_fade_in_time = 0.2,
				alpha_hover = 178.5,
				hover_fade_out_time = 0.1,
				alpha_normal = 0,
				hover_fade_in_time = 0.1,
				select_fade_out_time = 0.2
			}
		},
		button_bars = {
			selected_fade_in = 0.2,
			selected_fade_out = 0.04,
			background = {
				fade_out_time = 0.1,
				alpha_normal = 178.5,
				alpha_hover = 255,
				fade_in_time = 0.1
			},
			icon = {
				fade_out_time = 0.1,
				alpha_normal = 178.5,
				alpha_hover = 255,
				fade_in_time = 0.1
			}
		}
	},
	map = {
		camera_time_exit = 0.5,
		camera_time_enter = 0.5,
		show_debug_levels = true
	},
	end_screen = {
		victory_fade_out = 0.8,
		defeat_fade_out = 0.5,
		victory_fade_in = 0.5,
		gdc_fade_in = 0.2,
		gdc_fade_out = 0.5,
		text_fade_in = 0.5,
		display_time = 5,
		defeat_fade_in = 1.5,
		continue_fade_out = 0.5,
		continue_fade_in = 0.5,
		background_fade_out = 0.9,
		text_fade_out = 0.3,
		background_fade_in = 1.1
	},
	summary_screen = {
		reward_screen_fade_in_time = 0.2,
		summary_entry_start_delay = 0.4,
		tween_in_time = 1,
		tween_out_time = 0.8,
		summary_entry_experience_count_time = 0.5,
		reward_screen_display_time = 1.5,
		reward_screen_fade_out_time = 0.4,
		summary_entry_fade_in_time = 0.2,
		summary_dice_fade_in_time = 0.2,
		element_presentation_time = 0.7,
		element_presentation_experience_count_start_time = 0.2,
		bar_progress_min_time = 2,
		start_delay_time = 2,
		bar_progress_max_time = 3,
		bar_progress_experience_time_multiplier = 0.006,
		speed_up_experience_time_multiplier = 2.5
	},
	scoreboard = {
		topic_select_duration = 0.15,
		arrow_select_duration = 0.12,
		arrow_dehover_duration = 0.12,
		topic_hover_alpha = 255,
		auto_pilot_select_wait_time = 6,
		topic_data_fade_in_duration = 0.2,
		arrow_deselect_duration = 0.12,
		arrow_hover_duration = 0.12,
		player_list_pluse_duration = 0.5,
		topic_hover_duration = 0.15,
		open_duration = 0.4,
		topic_dehover_duration = 0.15,
		topic_deselect_duration = 0.15,
		auto_pilot_wait_time = 15,
		topic_normal_alpha = 180,
		close_duration = 0.4,
		topic_scroll_duration = 0.4
	},
	area_indicator = {
		wait_time = 1,
		fade_time = 1
	},
	mission_objective = {
		wait_time = 3,
		fade_time = 1
	},
	crosshair = {
		hit_marker_fade = 0.6
	},
	unit_frames = {
		health_bar_lerp_time = 1,
		low_health_threshold = 0.42,
		low_health_animation_alpha_from = 255,
		low_health_animation_alpha_to = 200,
		low_health_animation_time = 5,
		health_step_value = 10
	},
	cutscene_ui = {
		skippable = false,
		letterbox = {
			bar_height = 70
		},
		fx_fade = {
			hold_time = 0,
			fade_out_time = 2,
			fade_in_time = 2
		},
		fx_text_popup = {
			hold_time = 3,
			fade_out_time = 1,
			fade_in_time = 1
		}
	},
	tutorial = {
		tooltip = {
			center_clamp_distance = 400
		},
		mission_tooltip = {
			time_lerp_multiplier = 0.24,
			fade_in_time = 0.15,
			alpha_fade_out_value = 100,
			start_scale_distance = 10,
			fade_out_time = 0.15,
			minimum_icon_scale = 0.5,
			pixel_snap_threshold = 1.4,
			end_scale_distance = 100,
			start_lerp_speed = 0.05,
			distance_from_center = {
				width = 400,
				height = 200
			}
		},
		objective_tooltip = {
			time_lerp_multiplier = 0.24,
			fade_in_time = 0.15,
			alpha_fade_out_value = 100,
			start_scale_distance = 10,
			fade_out_time = 0.15,
			minimum_icon_scale = 0.5,
			pixel_snap_threshold = 1.4,
			end_scale_distance = 100,
			start_lerp_speed = 0.05,
			distance_from_center = {
				width = 400,
				height = 200
			}
		}
	},
	chat = {
		output_background_alpha = 255,
		chat_close_delay = 6,
		scrollbar_stroke_alpha = 80,
		tab_notification_alpha_1 = 0,
		output_text_alpha = 255,
		scrollbar_background_stroke_alpha = 80,
		tab_notification_alpha_2 = 120,
		chat_close_fade_length = 2,
		window_background_alpha = 110,
		scrollbar_alpha = 160,
		input_caret_alpha = 255,
		input_background_alpha = 180,
		scrollbar_background_alpha = 80,
		input_text_alpha = 255
	},
	positive_reinforcement = {
		show_duration = 4,
		folding_enabled = true,
		fade_duration = 0.5,
		increment_duration = 0.33
	},
	damage_feedback = {
		fade_duration = 0.5,
		show_duration = 4,
		increment_duration = 0.33
	},
	use_ps4_input_icons = IS_PS4 or Application.user_setting("gamepad_use_ps4_style_input_icons"),
	breed_textures = {
		skaven_ratling_gunner = "unit_frame_portrait_enemy_ratling_gunner",
		pet_skeleton_dual_wield = "unit_frame_portrait_pet_skeleton",
		skaven_warpfire_thrower = "unit_frame_portrait_enemy_warpfire",
		chaos_exalted_champion_warcamp = "unit_frame_portrait_enemy_chaos_warrior",
		skaven_poison_wind_globadier = "unit_frame_portrait_enemy_poison_wind",
		vs_ratling_gunner = "unit_frame_portrait_enemy_ratling_gunner",
		hero_bw_scholar = "small_unit_frame_portrait_sienna_scholar",
		chaos_plague_sorcerer = "unit_frame_portrait_enemy_chaos_sorcerer",
		chaos_vortex_sorcerer = "unit_frame_portrait_enemy_sorcerer_vortex",
		hero_es_questingknight = "small_unit_frame_portrait_kruber_questingknight",
		vs_rat_ogre = "unit_frame_portrait_enemy_rat_ogre",
		chaos_fanatic = "unit_frame_portrait_enemy_fanatic",
		skaven_storm_vermin_champion = "unit_frame_portrait_enemy_stormvermin",
		hero_wh_bountyhunter = "small_unit_frame_portrait_victor_bountyhunter",
		pet_skeleton = "unit_frame_portrait_pet_skeleton",
		skaven_stormfiend_demo = "unit_frame_portrait_enemy_stormfiend",
		pet_skeleton_with_shield = "unit_frame_portrait_pet_skeleton",
		beastmen_standard_bearer = "unit_frame_portrait_enemy_standard_bearer",
		hero_bw_necromancer = "small_unit_frame_portrait_sienna_necromancer",
		hero_we_maidenguard = "small_unit_frame_portrait_kerillian_maidenguard",
		chaos_zombie = "unit_frame_portrait_enemy_plague_zombie",
		hero_bw_unchained = "small_unit_frame_portrait_sienna_unchained",
		skaven_plague_monk = "unit_frame_portrait_enemy_plague_monk",
		hero_dr_slayer = "small_unit_frame_portrait_bardin_slayer",
		chaos_troll = "unit_frame_portrait_enemy_chaos_troll",
		chaos_spawn = "unit_frame_portrait_enemy_chaos_spawn",
		hero_es_huntsman = "small_unit_frame_portrait_kruber_huntsman",
		chaos_exalted_sorcerer_drachenfels = "unit_frame_portrait_enemy_sorcerer_drachenfels",
		vs_stormfiend = "unit_frame_portrait_enemy_stormfiend",
		skaven_storm_vermin = "unit_frame_portrait_enemy_stormvermin",
		hero_es_knight = "small_unit_frame_portrait_kruber_knight",
		chaos_marauder = "unit_frame_portrait_enemy_chaos_marauder",
		vs_warpfire_thrower = "unit_frame_portrait_enemy_warpfire",
		chaos_vortex = "unit_frame_portrait_enemy_sorcerer_vortex",
		pet_skeleton_armored = "unit_frame_portrait_pet_skeleton",
		skaven_clan_rat_with_shield = "unit_frame_portrait_enemy_clanrat",
		chaos_exalted_champion_norsca = "unit_frame_portrait_enemy_chaos_warrior",
		skaven_loot_rat = "unit_frame_portrait_enemy_lootrat",
		skaven_pack_master = "unit_frame_portrait_enemy_packmaster",
		chaos_spawn_exalted_champion_norsca = "unit_frame_portrait_enemy_chaos_spawn",
		vs_chaos_spawn = "unit_frame_portrait_enemy_chaos_spawn",
		hero_dr_ironbreaker = "small_unit_frame_portrait_bardin_ironbreaker",
		hero_wh_priest = "small_unit_frame_portrait_victor_priest",
		hero_wh_captain = "small_unit_frame_portrait_victor_captain",
		chaos_raider = "unit_frame_portrait_enemy_raider",
		hero_wh_zealot = "small_unit_frame_portrait_victor_zealot",
		beastmen_bestigor = "unit_frame_portrait_enemy_bestigor",
		skaven_storm_vermin_warlord = "unit_frame_portrait_enemy_warlord",
		skaven_gutter_runner = "unit_frame_portrait_enemy_gutter_runner",
		hero_es_mercenary = "small_unit_frame_portrait_kruber_mercenary",
		beastmen_minotaur = "unit_frame_portrait_enemy_minotaur",
		vs_poison_wind_globadier = "unit_frame_portrait_enemy_poison_wind",
		skaven_slave = "unit_frame_portrait_enemy_slave_rat",
		skaven_clan_rat = "unit_frame_portrait_enemy_clanrat",
		skaven_stormfiend = "unit_frame_portrait_enemy_stormfiend",
		chaos_exalted_sorcerer = "unit_frame_portrait_enemy_sorcerer_boss",
		chaos_tentacle_sorcerer = "unit_frame_portrait_enemy_chaos_sorcerer",
		skaven_rat_ogre = "unit_frame_portrait_enemy_rat_ogre",
		hero_we_shade = "small_unit_frame_portrait_kerillian_shade",
		chaos_corruptor_sorcerer = "unit_frame_portrait_enemy_sorcerer_corruptor",
		skaven_stormfiend_boss = "unit_frame_portrait_enemy_stormfiend",
		beastmen_gor = "unit_frame_portrait_enemy_standard_bearer",
		skaven_storm_vermin_with_shield = "unit_frame_portrait_enemy_stormvermin",
		hero_we_waywatcher = "small_unit_frame_portrait_kerillian_waywatcher",
		hero_bw_adept = "small_unit_frame_portrait_sienna_adept",
		chaos_berzerker = "unit_frame_portrait_enemy_savage",
		chaos_marauder_with_shield = "unit_frame_portrait_enemy_chaos_marauder",
		hero_dr_engineer = "small_unit_frame_portrait_bardin_engineer",
		chaos_tentacle = "unit_frame_portrait_enemy_chaos_sorcerer",
		hero_dr_ranger = "small_unit_frame_portrait_bardin_ranger",
		vs_packmaster = "unit_frame_portrait_enemy_packmaster",
		beastmen_ungor = "unit_frame_portrait_enemy_standard_bearer",
		hero_we_thornsister = "small_unit_frame_portrait_kerillian_thornsister",
		skaven_grey_seer = "unit_frame_portrait_enemy_rasknitt",
		chaos_warrior = "unit_frame_portrait_enemy_chaos_warrior",
		beastmen_ungor_archer = "unit_frame_portrait_enemy_standard_bearer",
		vs_gutter_runner = "unit_frame_portrait_enemy_gutter_runner",
		skaven_storm_vermin_commander = "unit_frame_portrait_enemy_stormvermin",
		beastmen_standard_bearer_crater = "unit_frame_portrait_enemy_standard_bearer"
	},
	chest_upgrade_score_topics = {
		default = {
			{
				texture = "loot_mutator_icon_06",
				name = "game_won",
				display_name = "end_screen_chest_view_mission_completed"
			},
			{
				texture = "loot_mutator_icon_03",
				name = "quickplay",
				display_name = "end_screen_chest_view_quickplay_bonus"
			},
			{
				texture = "loot_objective_icon_02",
				name = "tome",
				display_name = "end_screen_chest_view_tomes"
			},
			{
				texture = "loot_objective_icon_01",
				name = "grimoire",
				display_name = "end_screen_chest_view_grimoires"
			},
			{
				texture = "loot_mutator_icon_05",
				name = "loot_dice",
				display_name = "end_screen_chest_view_loot_dice"
			},
			{
				texture = "loot_mutator_icon_04",
				name = "max_random_score",
				display_name = "end_screen_chest_view_random_bonus"
			}
		}
	}
}

DLCUtils.merge("ui_settings", UISettings)
DLCUtils.merge("breed_textures", UISettings.breed_textures)

UISettings.default_items = {
	es_1h_sword = {
		inventory_icon = "icon_wpn_emp_sword_02_t1",
		description = "description_default_empire_soldier_es_1h_sword",
		display_name = "display_name_default_empire_soldier_es_1h_sword"
	},
	es_1h_mace = {
		inventory_icon = "icon_wpn_emp_mace_02_t1",
		description = "description_default_empire_soldier_es_1h_mace",
		display_name = "display_name_default_empire_soldier_es_1h_mace"
	},
	es_2h_sword_executioner = {
		inventory_icon = "icon_wpn_emp_sword_exe_01_t1",
		description = "description_default_empire_soldier_es_exe_sword",
		display_name = "display_name_default_empire_soldier_es_exe_sword"
	},
	es_2h_sword = {
		inventory_icon = "icon_wpn_empire_2h_sword_01_t1",
		description = "description_default_empire_soldier_es_2h_sword",
		display_name = "display_name_default_empire_soldier_es_2h_sword"
	},
	es_2h_hammer = {
		inventory_icon = "icon_wpn_empire_2h_hammer_01_t1",
		description = "description_default_empire_soldier_es_2h_war_hammer",
		display_name = "display_name_default_empire_soldier_es_2h_war_hammer"
	},
	es_sword_shield = {
		inventory_icon = "icon_wpn_empire_shield_02_sword",
		description = "description_default_empire_soldier_es_1h_sword_shield",
		display_name = "display_name_default_empire_soldier_es_1h_sword_shield"
	},
	es_mace_shield = {
		inventory_icon = "icon_wpn_empire_shield_02_mace",
		description = "description_default_empire_soldier_es_1h_mace_shield",
		display_name = "display_name_default_empire_soldier_es_1h_mace_shield"
	},
	es_1h_flail = {
		inventory_icon = "icon_wpn_emp_flail_01_t1",
		description = "description_default_empire_soldier_es_flail",
		display_name = "display_name_default_empire_soldier_es_flail"
	},
	es_halberd = {
		inventory_icon = "icon_wpn_wh_halberd_01",
		description = "description_default_empire_soldier_es_halberd",
		display_name = "display_name_default_empire_soldier_es_halberd"
	},
	es_longbow = {
		inventory_icon = "icon_wpn_empire_bow_tutorial",
		description = "description_default_empire_soldier_es_longbow",
		display_name = "display_name_default_empire_soldier_es_longbow"
	},
	es_blunderbuss = {
		inventory_icon = "icon_wpn_empire_blunderbuss_t1",
		description = "description_default_empire_soldier_es_blunderbuss",
		display_name = "display_name_default_empire_soldier_es_blunderbuss"
	},
	es_handgun = {
		inventory_icon = "icon_wpn_empire_handgun_t1",
		description = "description_default_empire_soldier_es_handgun",
		display_name = "display_name_default_empire_soldier_es_handgun"
	},
	es_repeating_handgun = {
		inventory_icon = "icon_wpn_emp_handgun_repeater_t1",
		description = "description_default_empire_soldier_es_repeating_handgun",
		display_name = "display_name_default_empire_soldier_es_repeating_handgun"
	},
	we_spear = {
		inventory_icon = "icon_wpn_we_spear_01",
		description = "description_default_wood_elf_ww_spear",
		display_name = "display_name_default_wood_elf_ww_spear"
	},
	we_dual_wield_daggers = {
		inventory_icon = "icon_wpn_we_dagger_01_t1_dual",
		description = "description_default_wood_elf_ww_dual_daggers",
		display_name = "display_name_default_wood_elf_ww_dual_daggers"
	},
	we_dual_wield_swords = {
		inventory_icon = "icon_wpn_we_sword_01_t1_dual",
		description = "description_default_wood_elf_ww_dual_swords",
		display_name = "display_name_default_wood_elf_ww_dual_swords"
	},
	we_1h_sword = {
		inventory_icon = "icon_wpn_we_sword_01_t1",
		description = "description_default_wood_elf_ww_1h_sword",
		display_name = "display_name_default_wood_elf_ww_1h_sword"
	},
	we_dual_wield_sword_dagger = {
		inventory_icon = "icon_wpn_we_sword_01_t1_dagger_dual",
		description = "description_default_wood_elf_ww_sword_and_dagger",
		display_name = "display_name_default_wood_elf_ww_sword_and_dagger"
	},
	we_shortbow = {
		inventory_icon = "icon_wpn_we_bow_short_01",
		description = "description_default_wood_elf_ww_shortbow",
		display_name = "display_name_default_wood_elf_ww_shortbow"
	},
	we_shortbow_hagbane = {
		inventory_icon = "icon_wpn_we_bow_short_01",
		description = "description_default_wood_elf_ww_hagbane",
		display_name = "display_name_default_wood_elf_ww_hagbane"
	},
	we_longbow = {
		inventory_icon = "icon_wpn_we_bow_01_t1",
		description = "description_default_wood_elf_ww_longbow",
		display_name = "display_name_default_wood_elf_ww_longbow"
	},
	we_longbow_trueflight = {
		inventory_icon = "icon_wpn_we_bow_01_t1",
		description = "description_default_wood_elf_ww_trueflight",
		display_name = "display_name_default_wood_elf_ww_trueflight"
	},
	we_2h_axe = {
		inventory_icon = "icon_wpn_we_2h_axe_01_t1",
		description = "description_default_wood_elf_ww_2h_axe",
		display_name = "display_name_default_wood_elf_ww_2h_axe"
	},
	we_2h_sword = {
		inventory_icon = "icon_wpn_we_2h_sword_01_t1",
		description = "description_default_wood_elf_ww_2h_sword",
		display_name = "display_name_default_wood_elf_ww_2h_sword"
	},
	we_crossbow_repeater = {
		inventory_icon = "icon_wpn_we_repeater_crossbow_t1",
		description = "description_default_wood_elf_repeating_crossbow",
		display_name = "display_name_default_wood_elf_repeating_crossbow"
	},
	bw_1h_mace = {
		inventory_icon = "icon_wpn_brw_mace_01",
		description = "description_default_bright_wizard_bw_morningstar",
		display_name = "display_name_default_bright_wizard_bw_morningstar"
	},
	bw_flame_sword = {
		inventory_icon = "icon_wpn_brw_flaming_sword_01_t1",
		description = "description_default_bright_wizard_bw_flame_sword",
		display_name = "display_name_default_bright_wizard_bw_flame_sword"
	},
	bw_sword = {
		inventory_icon = "icon_wpn_brw_sword_01_t1",
		description = "description_default_bright_wizard_bw_1h_sword",
		display_name = "display_name_default_bright_wizard_bw_1h_sword"
	},
	bw_dagger = {
		inventory_icon = "icon_wpn_brw_dagger_01",
		description = "description_default_bright_wizard_bw_dagger",
		display_name = "display_name_default_bright_wizard_bw_dagger"
	},
	bw_skullstaff_fireball = {
		inventory_icon = "icon_wpn_brw_staff_02",
		description = "description_default_bright_wizard_bw_staff_firball",
		display_name = "display_name_default_bright_wizard_bw_staff_firball"
	},
	bw_skullstaff_beam = {
		inventory_icon = "icon_wpn_brw_beam_staff_01",
		description = "description_default_bright_wizard_bw_staff_beam",
		display_name = "display_name_default_bright_wizard_bw_staff_beam"
	},
	bw_skullstaff_geiser = {
		inventory_icon = "icon_wpn_brw_staff_03",
		description = "description_default_bright_wizard_bw_staff_geiser",
		display_name = "display_name_default_bright_wizard_bw_staff_geiser"
	},
	bw_skullstaff_spear = {
		inventory_icon = "icon_wpn_brw_spear_staff_01",
		description = "description_default_bright_wizard_bw_staff_spear",
		display_name = "display_name_default_bright_wizard_bw_staff_spear"
	},
	bw_skullstaff_flamethrower = {
		inventory_icon = "icon_wpn_brw_flame_staff_01",
		description = "description_default_bright_wizard_bw_staff_flamethrower",
		display_name = "display_name_default_bright_wizard_bw_staff_flamethrower"
	},
	dr_1h_axe = {
		inventory_icon = "icon_wpn_dw_axe_01_t1",
		description = "description_default_dwarf_ranger_dr_1h_axes",
		display_name = "display_name_default_dwarf_ranger_dr_1h_axes"
	},
	dr_dual_wield_axes = {
		inventory_icon = "icon_wpn_dw_axe_01_t1_dual",
		description = "description_default_dwarf_ranger_dr_dual_axes",
		display_name = "display_name_default_dwarf_ranger_dr_dual_axes"
	},
	dr_2h_axe = {
		inventory_icon = "icon_wpn_dw_2h_axe_01_t1",
		description = "description_default_dwarf_ranger_dr_2h_axes",
		display_name = "display_name_default_dwarf_ranger_dr_2h_axes"
	},
	dr_2h_hammer = {
		inventory_icon = "icon_wpn_dw_2h_hammer_01_t1",
		description = "description_default_dwarf_ranger_dr_2h_hammer",
		display_name = "display_name_default_dwarf_ranger_dr_2h_hammer"
	},
	dr_1h_hammer = {
		inventory_icon = "icon_wpn_dw_hammer_01_t1",
		description = "description_default_dwarf_ranger_dr_1h_hammer",
		display_name = "display_name_default_dwarf_ranger_dr_1h_hammer"
	},
	dr_shield_axe = {
		inventory_icon = "icon_wpn_dw_shield_01_axe",
		description = "description_default_dwarf_ranger_dr_1h_axe_shield",
		display_name = "display_name_default_dwarf_ranger_dr_1h_axe_shield"
	},
	dr_shield_hammer = {
		inventory_icon = "icon_wpn_dw_shield_01_hammer",
		description = "description_default_dwarf_ranger_dr_1h_hammer_shield",
		display_name = "display_name_default_dwarf_ranger_dr_1h_hammer_shield"
	},
	dr_crossbow = {
		inventory_icon = "icon_wpn_dw_xbox_01_t1",
		description = "description_default_dwarf_ranger_dr_crossbow",
		display_name = "display_name_default_dwarf_ranger_dr_crossbow"
	},
	dr_rakegun = {
		inventory_icon = "icon_wpn_dw_rakegun_t1",
		description = "description_default_dwarf_ranger_dr_grudgeraker",
		display_name = "display_name_default_dwarf_ranger_dr_grudgeraker"
	},
	dr_handgun = {
		inventory_icon = "icon_wpn_dw_handgun_01_t1",
		description = "description_default_dwarf_ranger_dr_handgun",
		display_name = "display_name_default_dwarf_ranger_dr_handgun"
	},
	dr_drakegun = {
		inventory_icon = "icon_wpn_dw_iron_drake_02",
		description = "description_default_dwarf_ranger_dr_drakegun",
		display_name = "display_name_default_dwarf_ranger_dr_drakegun"
	},
	dr_drake_pistol = {
		inventory_icon = "icon_wpn_dw_drake_pistol_01_t1",
		description = "description_default_dwarf_ranger_dr_drakefire_pistols",
		display_name = "display_name_default_dwarf_ranger_dr_drakefire_pistols"
	},
	dr_2h_pick = {
		inventory_icon = "icon_wpn_dw_pick_01_t1",
		description = "description_default_dwarf_ranger_dr_2h_picks",
		display_name = "display_name_default_dwarf_ranger_dr_2h_picks"
	},
	wh_1h_axe = {
		inventory_icon = "icon_wpn_axe_hatchet_t1",
		description = "description_default_witch_hunter_wh_1h_axes",
		display_name = "display_name_default_witch_hunter_wh_1h_axes"
	},
	wh_2h_sword = {
		inventory_icon = "icon_wpn_empire_2h_sword_02_t1",
		description = "description_default_witch_hunter_wh_2h_sword",
		display_name = "display_name_default_witch_hunter_wh_2h_sword"
	},
	wh_fencing_sword = {
		inventory_icon = "icon_wpn_fencingsword_01_t1",
		description = "description_default_witch_hunter_wh_fencing_sword",
		display_name = "display_name_default_witch_hunter_wh_fencing_sword"
	},
	wh_brace_of_pistols = {
		inventory_icon = "icon_wpn_emp_pistol_01_t1",
		description = "description_default_witch_hunter_wh_brace_of_pisols",
		display_name = "display_name_default_witch_hunter_wh_brace_of_pisols"
	},
	wh_repeating_pistols = {
		inventory_icon = "icon_wpn_empire_pistol_repeater_t1",
		description = "description_default_witch_hunter_wh_repeating_pistol",
		display_name = "display_name_default_witch_hunter_wh_repeating_pistol"
	},
	wh_crossbow = {
		inventory_icon = "icon_wpn_emp_crossbow_02_t1",
		description = "description_default_witch_hunter_wh_crossbow",
		display_name = "display_name_default_witch_hunter_wh_crossbow"
	},
	wh_crossbow_repeater = {
		inventory_icon = "icon_wpn_wh_repeater_crossbow_t1",
		description = "description_default_witch_hunter_wh_repeating_crossbow",
		display_name = "display_name_default_witch_hunter_wh_repeating_crossbow"
	},
	wh_1h_falchion = {
		inventory_icon = "icon_wpn_emp_sword_04_t1",
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "display_name_default_witch_hunter_wh_1h_falchions"
	},
	ring = {
		inventory_icon = "icon_charm_09",
		description = "description_default_ring",
		display_name = "display_name_default_ring"
	},
	necklace = {
		inventory_icon = "icon_necklace_09",
		description = "description_default_necklace",
		display_name = "display_name_default_necklace"
	},
	trinket = {
		inventory_icon = "icon_trinket_12",
		description = "description_default_trinket",
		display_name = "display_name_default_trinket"
	}
}

DLCUtils.merge("default_items", UISettings.default_items)
DLCUtils.merge("chest_upgrade_score_topics", UISettings.chest_upgrade_score_topics)

UISettings.difficulties_select_sounds = {
	"play_gui_lobby_button_01_difficulty_select_normal",
	"play_gui_lobby_button_01_difficulty_select_hard",
	"play_gui_lobby_button_01_difficulty_select_nightmare",
	"play_gui_lobby_button_01_difficulty_select_cataclysm"
}
UISettings.hero_icons = {
	small = {
		witch_hunter = "tabs_class_icon_witch_hunter_normal",
		empire_soldier = "tabs_class_icon_empire_soldier_normal",
		dwarf_ranger = "tabs_class_icon_dwarf_ranger_normal",
		wood_elf = "tabs_class_icon_way_watcher_normal",
		bright_wizard = "tabs_class_icon_bright_wizard_normal"
	},
	medium = {
		witch_hunter = "hero_icon_medium_witch_hunter_yellow",
		empire_soldier = "hero_icon_medium_empire_soldier_yellow",
		dwarf_ranger = "hero_icon_medium_dwarf_ranger_yellow",
		wood_elf = "hero_icon_medium_way_watcher_yellow",
		bright_wizard = "hero_icon_medium_bright_wizard_yellow"
	}
}
UISettings.hero_tooltips = {
	witch_hunter = "inventory_screen_witch_hunter_tooltip",
	empire_soldier = "inventory_screen_empire_soldier_tooltip",
	dwarf_ranger = "inventory_screen_dwarf_tooltip",
	wood_elf = "inventory_screen_way_watcher_tooltip",
	bright_wizard = "inventory_screen_bright_wizard_tooltip"
}
UISettings.slot_icons = {
	crafting_material = "tabs_icon_crafting_material",
	melee_ranged = "tabs_icon_melee_ranged",
	necklace = "tabs_icon_necklace",
	trinket = "tabs_icon_trinkets",
	melee = "tabs_icon_equipment",
	forge = "tabs_icon_anvil",
	portrait_frame = "tabs_icon_portrait_frame",
	hat = "tabs_icon_cosmetics",
	ring = "tabs_icon_charm",
	ranged = "tabs_icon_ranged",
	skins = "tabs_icon_character_skins"
}
UISettings.item_type_store_icons = {
	weapon_skin = "store_tag_icon_weapon",
	skin = "store_tag_icon_skin",
	hat = "store_tag_icon_hat",
	bundle = "store_tag_icon_bundle"
}

DLCUtils.merge("item_type_store_icons", UISettings.item_type_store_icons)

UISettings.crafting_material_order = {
	"crafting_material_scrap",
	"crafting_material_weapon",
	"crafting_material_jewellery",
	"crafting_material_dust_1",
	"crafting_material_dust_2",
	"crafting_material_dust_3",
	"crafting_material_dust_4"
}
UISettings.crafting_material_icons_small = {
	crafting_material_dust_3 = "icon_crafting_dust_03_small",
	crafting_material_dust_1 = "icon_crafting_dust_01_small",
	crafting_material_weapon = "icon_crafting_weapon_part_small",
	crafting_material_dust_4 = "icon_crafting_dust_04_small",
	crafting_material_scrap = "icon_crafting_scrap_small",
	crafting_material_jewellery = "icon_crafting_jewellery_part_small",
	crafting_material_dust_2 = "icon_crafting_dust_02_small"
}
UISettings.crafting_material_order_by_item_key = {
	crafting_material_scrap = 6,
	crafting_material_dust_1 = 1,
	crafting_material_weapon = 7,
	crafting_material_dust_4 = 4,
	crafting_material_dust_3 = 3,
	crafting_material_jewellery = 5,
	crafting_material_dust_2 = 2
}
UISettings.loot_containers = {
	epic = "loot_container_icon_02",
	default = "loot_container_icon_01",
	elite = "loot_container_icon_03"
}
UISettings.item_rarity_textures = {
	common = "icon_bg_common",
	promo = "icon_bg_promo",
	exotic = "icon_bg_exotic",
	magic = "icon_bg_magic",
	plentiful = "icon_bg_plentiful",
	default = "icon_bg_default",
	rare = "icon_bg_rare",
	unique = "icon_bg_unique"
}
UISettings.hud_inventory_panel_data = {
	default = {
		texture_id = "hud_inventory_panel",
		texture_size = {
			624,
			66
		}
	},
	dr_engineer = {
		texture_id = "hud_inventory_panel_cog",
		texture_size = {
			630,
			73
		}
	}
}

DLCUtils.merge("hud_inventory_panel_data", UISettings.hud_inventory_panel_data)

UISettings.gamepad_ability_ui_data = {
	default = {
		always_show_activated_ability_input = false,
		ability_top_texture_id = "ability_glow",
		ability_effect = "gamepad_ability_effect",
		lit_frame_id = false
	},
	dr_engineer = {
		always_show_activated_ability_input = true,
		ability_top_texture_id = "icon_rotarygun",
		ability_effect = "gamepad_ability_effect_cog",
		lit_frame_id = "lit_frame_engineer"
	}
}

DLCUtils.merge("gamepad_ability_ui_data", UISettings.gamepad_ability_ui_data)

UISettings.ability_ui_data = {
	default = {
		ability_effect_top = "ability_effect_top",
		ability_bar_highlight = "hud_player_ability_bar_glow",
		ability_effect = "ability_effect"
	},
	we_thornsister = {
		ability_effect_top = "ability_effect_top",
		ability_bar_highlight = "hud_player_ability_bar_glow",
		ability_effect = "ability_effect",
		ability_effect_thorn = "ability_effect_thornsister",
		ability_effect_top_thorn = "ability_effect_top_thornsister"
	}
}

DLCUtils.merge("ability_ui_data", UISettings.gamepad_ability_ui_data)
setmetatable(UISettings.item_rarity_textures, {
	__index = function (self, rarity)
		return "icons_placeholder"
	end
})

UISettings.item_rarity_order = {
	common = 6,
	promo = 1,
	exotic = 4,
	magic = 2,
	plentiful = 7,
	default = 8,
	rare = 5,
	unique = 3
}
UISettings.item_rarities = {
	"default",
	"plentiful",
	"common",
	"rare",
	"exotic",
	"unique",
	"promo"
}
UISettings.cosmetics_sorting_order = {
	weapon_skin = 3,
	skin = 2,
	hat = 1
}
UISettings.inventory_consumable_slot_colors = {
	healthkit_first_aid_kit_01 = Colors.get_color_table_with_alpha("healthkit_first_aid_kit_01", 255),
	wpn_side_objective_tome_01 = Colors.get_color_table_with_alpha("wpn_side_objective_tome_01", 255),
	potion_healing_draught_01 = Colors.get_color_table_with_alpha("potion_healing_draught_01", 255),
	potion_damage_boost_01 = Colors.get_color_table_with_alpha("potion_damage_boost_01", 255),
	potion_speed_boost_01 = Colors.get_color_table_with_alpha("potion_speed_boost_01", 255),
	potion_cooldown_reduction_01 = Colors.get_color_table_with_alpha("potion_cooldown_reduction_01", 255),
	wpn_grimoire_01 = Colors.get_color_table_with_alpha("wpn_grimoire_01", 255),
	grenade_frag_01 = Colors.get_color_table_with_alpha("grenade_frag_01", 255),
	grenade_frag_02 = Colors.get_color_table_with_alpha("grenade_frag_02", 255),
	grenade_smoke_01 = Colors.get_color_table_with_alpha("grenade_smoke_01", 255),
	grenade_smoke_02 = Colors.get_color_table_with_alpha("grenade_smoke_02", 255),
	grenade_fire_01 = Colors.get_color_table_with_alpha("grenade_fire_01", 255),
	grenade_fire_02 = Colors.get_color_table_with_alpha("grenade_fire_02", 255),
	default = {
		255,
		0,
		0,
		0
	}
}
UISettings.additional_inventory_slot_angles = {
	default = 0,
	potion_damage_boost_01 = math.degrees_to_radians(-45),
	potion_speed_boost_01 = math.degrees_to_radians(-45),
	potion_cooldown_reduction_01 = math.degrees_to_radians(-45)
}

DLCUtils.merge("inventory_consumable_slot_colors", UISettings.inventory_consumable_slot_colors)

UISettings.console_menu_scenegraphs = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	},
	area = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			1820,
			840
		},
		position = {
			50,
			-120,
			1
		}
	},
	area_left = {
		vertical_alignment = "top",
		parent = "area",
		horizontal_alignment = "left",
		size = {
			560,
			840
		},
		position = {
			0,
			0,
			1
		}
	},
	area_right = {
		vertical_alignment = "center",
		parent = "area_divider",
		horizontal_alignment = "left",
		size = {
			1190,
			840
		},
		position = {
			60,
			0,
			1
		}
	},
	area_divider = {
		vertical_alignment = "center",
		parent = "area_left",
		horizontal_alignment = "right",
		size = {
			50,
			840
		},
		position = {
			60,
			0,
			1
		}
	},
	craft_bg_root = {
		vertical_alignment = "top",
		parent = "area_right",
		horizontal_alignment = "left",
		size = {
			512,
			512
		},
		position = {
			40,
			-220,
			1
		}
	},
	craft_button = {
		vertical_alignment = "center",
		parent = "craft_bg_root",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-294,
			1
		}
	}
}
UISettings.hero_selection_camera_position_by_character = {
	witch_hunter = {
		z = 0.9,
		x = 0,
		y = 0.8
	},
	bright_wizard = {
		z = 0.7,
		x = 0,
		y = 0.4
	},
	dwarf_ranger = {
		z = 0.4,
		x = 0,
		y = 0
	},
	wood_elf = {
		z = 0.7,
		x = 0,
		y = 0.4
	},
	empire_soldier = {
		z = 0.7,
		x = 0,
		y = 0.5
	},
	empire_soldier_tutorial = {
		z = 0.7,
		x = 0,
		y = 0.5
	},
	default = {
		z = 0,
		x = 0,
		y = 0
	}
}
UISettings.hero_hat_camera_position_by_character = {
	witch_hunter = {
		z = 0.93,
		x = 0,
		y = -2.1
	},
	bright_wizard = {
		z = 0.7,
		x = 0,
		y = -2.2
	},
	dwarf_ranger = {
		z = 0.17,
		x = 0,
		y = -2
	},
	wood_elf = {
		z = 0.7,
		x = 0,
		y = -2
	},
	empire_soldier = {
		z = 0.88,
		x = 0,
		y = -2.1
	},
	empire_soldier_tutorial = {
		z = 0.88,
		x = 0,
		y = -2.1
	},
	default = {
		z = 0,
		x = 0,
		y = 0
	}
}
UISettings.hero_skin_camera_position_by_character = {
	witch_hunter = {
		z = 0.4,
		x = 0,
		y = -1.2
	},
	bright_wizard = {
		z = 0.2,
		x = 0,
		y = -1.4
	},
	dwarf_ranger = {
		z = -0.2,
		x = 0,
		y = -1.5
	},
	wood_elf = {
		z = 0.25,
		x = 0,
		y = -1.4
	},
	empire_soldier = {
		z = 0.25,
		x = 0,
		y = -1.2
	},
	empire_soldier_tutorial = {
		z = 0.25,
		x = 0,
		y = -1.2
	},
	default = {
		z = 0,
		x = 0,
		y = 0
	}
}
UISettings.console_tooltip_pass_definitions = {
	"console_item_titles",
	"skin_applied",
	"deed_mission",
	"deed_difficulty",
	"mutators",
	"deed_rewards",
	"ammunition",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"weapon_skin_title",
	"item_information_text",
	"loot_chest_difficulty",
	"loot_chest_power_range",
	"unwieldable",
	"console_keywords",
	"console_special_action_tooltip",
	"console_other_equipped_careers_tooltip",
	"console_item_description",
	"light_attack_stats",
	"heavy_attack_stats",
	"detailed_stats_light",
	"detailed_stats_heavy",
	"detailed_stats_push",
	"detailed_stats_ranged_light",
	"detailed_stats_ranged_heavy",
	"console_item_background"
}

UISettings.hero_fullscreen_menu_on_enter = function ()
	print("hero_fullscreen_menu_on_enter")
end

UISettings.hero_fullscreen_menu_on_exit = function ()
	print("hero_fullscreen_menu_on_exit")
end

UISettings.dlc_order_data = {
	{
		dlc = "pre_order",
		display_name = "gift_popup_text_vt2_pre_order_bonus"
	},
	{
		dlc = "vermintide_1",
		display_name = "gift_popup_text_vt1"
	},
	{
		dlc = "base_game",
		display_name = "warhammer_vermintide_2"
	},
	{
		dlc = "bogenhafen",
		display_name = "store_bogenhafen_title"
	},
	{
		dlc = "holly",
		display_name = "store_ubersreik_title"
	},
	{
		dlc = "scorpion",
		display_name = "store_wom_title"
	},
	{
		dlc = "grass",
		display_name = "store_grass_title"
	},
	{
		dlc = "grass_2",
		display_name = "store_grass_title"
	},
	{
		dlc = "mm_1001",
		display_name = "display_name_mercenary_hat_1001"
	},
	{
		dlc = "mh_1001",
		display_name = "display_name_huntsman_hat_1001"
	},
	{
		dlc = "mk_1001",
		display_name = "display_name_knight_hat_1001"
	},
	{
		dlc = "br_1001",
		display_name = "display_name_ranger_hat_1001"
	},
	{
		dlc = "bi_1001",
		display_name = "display_name_ironbreaker_hat_1001"
	},
	{
		dlc = "bs_1001",
		display_name = "display_name_slayer_hat_1001"
	},
	{
		dlc = "kw_1001",
		display_name = "display_name_waywatcher_hat_1001"
	},
	{
		dlc = "kh_1001",
		display_name = "display_name_maidenguard_hat_1001"
	},
	{
		dlc = "ks_1001",
		display_name = "display_name_shade_hat_1001"
	},
	{
		dlc = "vw_1001",
		display_name = "display_name_witchhunter_hat_1001"
	},
	{
		dlc = "vb_1001",
		display_name = "display_name_bountyhunter_hat_1001"
	},
	{
		dlc = "vz_1001",
		display_name = "display_name_zealot_hat_1001"
	},
	{
		dlc = "vz_1003",
		display_name = "display_name_zealot_hat_1003"
	},
	{
		dlc = "sb_1001",
		display_name = "display_name_adept_hat_1001"
	},
	{
		dlc = "sp_1001",
		display_name = "display_name_scholar_hat_1001"
	},
	{
		dlc = "su_1001",
		display_name = "display_name_unchained_hat_1001"
	},
	{
		dlc = "bountyhunter_bundle",
		display_name = "bounty_hunter_bundle_01"
	},
	{
		dlc = "shade_bundle",
		display_name = "shade_bundle_01"
	},
	{
		dlc = "ironbreaker_bundle",
		display_name = "ironbreaker_bundle_01"
	},
	{
		dlc = "mercenary_bundle",
		display_name = "mercenary_bundle_01"
	},
	{
		dlc = "scholar_bundle",
		display_name = "pyromancer_bundle_01"
	},
	{
		dlc = "adept_bundle_0001",
		display_name = "display_name_adept_bundle_0001"
	},
	{
		dlc = "slayer_bundle_0001",
		display_name = "display_name_slayer_bundle_0001"
	},
	{
		dlc = "zealot_bundle_0001",
		display_name = "display_name_zealot_bundle_0001"
	},
	{
		dlc = "huntsman_bundle_0001",
		display_name = "display_name_huntsman_bundle_0001"
	},
	{
		dlc = "maidenguard_bundle_0001",
		display_name = "display_name_maidenguard_bundle_0001"
	},
	{
		dlc = "lake",
		display_name = "store_lake_title"
	},
	{
		dlc = "lake_upgrade",
		display_name = "store_lake_upgrade_title"
	},
	{
		dlc = "cog",
		display_name = "store_cog_title"
	},
	{
		dlc = "cog_upgrade",
		display_name = "store_cog_upgrade_title"
	},
	{
		dlc = "woods",
		display_name = "store_woods_title"
	},
	{
		dlc = "woods_upgrade",
		display_name = "store_woods_upgrade_title"
	},
	{
		dlc = "bless",
		display_name = "store_bless_title"
	},
	{
		dlc = "bless_upgrade",
		display_name = "store_bless_upgrade_title"
	},
	{
		dlc = "shovel",
		display_name = "store_shovel_title"
	},
	{
		dlc = "shovel_upgrade",
		display_name = "store_shovel_upgrade_title"
	},
	{
		dlc = "q1_ranger_bundle",
		display_name = "display_name_q1_ranger_bundle"
	},
	{
		dlc = "q1_waywatcher_bundle",
		display_name = "display_name_q1_waywatcher_bundle"
	},
	{
		dlc = "q1_footknight_bundle",
		display_name = "display_name_q1_footknight_bundle"
	},
	{
		dlc = "q1_unchained_bundle",
		display_name = "display_name_q1_unchained_bundle"
	},
	{
		dlc = "q1_wh_captain_bundle",
		display_name = "display_name_q1_wh_captain_bundle"
	},
	{
		dlc = "q1_collection_bundle",
		display_name = "display_name_q1_collection_bundle"
	},
	{
		dlc = "ironbreaker_bundle_0002",
		display_name = "display_name_ironbreaker_bundle_0002"
	},
	{
		dlc = "maidenguard_bundle_0002",
		display_name = "display_name_maidenguard_bundle_0002"
	},
	{
		dlc = "huntsman_bundle_0002",
		display_name = "display_name_huntsman_bundle_0002"
	},
	{
		dlc = "scholar_bundle_0002",
		display_name = "display_name_scholar_bundle_0002"
	},
	{
		dlc = "zealot_bundle_0002",
		display_name = "display_name_zealot_bundle_0002"
	},
	{
		dlc = "five_career_bundle_0004",
		display_name = "display_name_five_career_bundle_0004"
	},
	{
		dlc = "ranger_bundle_0002",
		display_name = "display_name_ranger_bundle_0002"
	},
	{
		dlc = "shade_bundle_0002",
		display_name = "display_name_shade_bundle_0002"
	},
	{
		dlc = "footknight_bundle_0002",
		display_name = "display_name_knight_bundle_0002"
	},
	{
		dlc = "unchained_bundle_0002",
		display_name = "display_name_unchained_bundle_0002"
	},
	{
		dlc = "bountyhunter_bundle_0002",
		display_name = "display_name_bountyhunter_bundle_0002"
	},
	{
		dlc = "five_career_bundle_0005",
		display_name = "display_name_five_career_bundle_0005"
	},
	{
		dlc = "engineer_bundle_0001",
		display_name = "display_name_engineer_bundle_0001"
	},
	{
		dlc = "maidenguard_bundle_0003",
		display_name = "display_name_maidenguard_bundle_0003"
	},
	{
		dlc = "questing_knight_bundle_0001",
		display_name = "display_name_questing_knight_bundle_0001"
	},
	{
		dlc = "adept_bundle_0002",
		display_name = "display_name_adept_bundle_0002"
	},
	{
		dlc = "priest_bundle_0001",
		display_name = "display_name_priest_bundle_0001"
	},
	{
		dlc = "five_career_bundle_0006",
		display_name = "display_name_five_career_bundle_0006"
	},
	{
		dlc = "adept_hat_1003",
		display_name = "display_name_adept_hat_1003"
	},
	{
		dlc = "ironbreaker_hat_1005",
		display_name = "display_name_ironbreaker_hat_1005"
	},
	{
		dlc = "huntsman_hat_1003",
		display_name = "display_name_huntsman_hat_1003"
	},
	{
		dlc = "shade_hat_1004",
		display_name = "display_name_shade_hat_1004"
	},
	{
		dlc = "bountyhunter_hat_1004",
		display_name = "display_name_bountyhunter_hat_1004"
	},
	{
		dlc = "q2_2023_hat_collection",
		display_name = "display_name_q2_2023_hat_collection"
	},
	{
		dlc = "shovel",
		display_name = "store_shovel_title"
	},
	{
		dlc = "shovel_upgrade",
		display_name = "store_shovel_upgrade_title"
	},
	{
		dlc = "slayer_bundle_0002",
		display_name = "display_name_slayer_bundle_0002"
	},
	{
		dlc = "waywatcher_bundle_0001",
		display_name = "display_name_waywatcher_bundle_0001"
	},
	{
		dlc = "mercenary_bundle_0002",
		display_name = "display_name_mercenary_bundle_0002"
	},
	{
		dlc = "scholar_bundle_0003",
		display_name = "display_name_scholar_bundle_0003"
	},
	{
		dlc = "witchhunter_bundle_0001",
		display_name = "display_name_witchhunter_bundle_0001"
	},
	{
		dlc = "five_career_bundle_0007",
		display_name = "display_name_five_career_bundle_0007"
	}
}
local pc_button_icon = {
	{
		texture = "pc_button_icon_left",
		size = {
			20,
			36
		}
	},
	{
		texture = "pc_button_icon_middle",
		tileable = true,
		size = {
			8,
			36
		}
	},
	{
		texture = "pc_button_icon_right",
		size = {
			20,
			36
		}
	}
}
local button_mapping = {
	win32 = {
		mouse_0 = {
			texture = "mouse_input_left",
			size = {
				50,
				66
			}
		},
		left = {
			texture = "mouse_input_left",
			size = {
				50,
				66
			}
		},
		right = {
			texture = "mouse_input_right",
			size = {
				50,
				66
			}
		},
		middle = {
			texture = "mouse_input_middle",
			size = {
				50,
				66
			}
		},
		wheel = {
			texture = "mouse_input_middle",
			size = {
				50,
				66
			}
		},
		default = {
			texture = "mouse_input",
			size = {
				50,
				66
			}
		}
	},
	xb1 = {
		a = {
			texture = "xbone_button_icon_a",
			size = {
				34,
				34
			}
		},
		b = {
			texture = "xbone_button_icon_b",
			size = {
				34,
				34
			}
		},
		x = {
			texture = "xbone_button_icon_x",
			size = {
				34,
				34
			}
		},
		y = {
			texture = "xbone_button_icon_y",
			size = {
				34,
				34
			}
		},
		d_up = {
			texture = "xbone_button_icon_d_pad_up",
			size = {
				33,
				33
			}
		},
		d_down = {
			texture = "xbone_button_icon_d_pad_down",
			size = {
				33,
				33
			}
		},
		d_left = {
			texture = "xbone_button_icon_d_pad_left",
			size = {
				33,
				33
			}
		},
		d_right = {
			texture = "xbone_button_icon_d_pad_right",
			size = {
				33,
				33
			}
		},
		d_horizontal = {
			texture = "xbone_button_icon_d_pad_horizontal",
			size = {
				33,
				33
			}
		},
		d_vertical = {
			texture = "xbone_button_icon_d_pad_vertical",
			size = {
				33,
				33
			}
		},
		d_pad = {
			texture = "xbone_button_icon_d_pad",
			size = {
				33,
				33
			}
		},
		left_shoulder = {
			texture = "xbone_button_icon_lb",
			size = {
				36,
				26
			}
		},
		left_trigger = {
			texture = "xbone_button_icon_lt",
			size = {
				38,
				33
			}
		},
		left_thumb = {
			texture = "xbone_button_icon_l3",
			size = {
				30,
				33
			}
		},
		right_shoulder = {
			texture = "xbone_button_icon_rb",
			size = {
				36,
				26
			}
		},
		right_trigger = {
			texture = "xbone_button_icon_rt",
			size = {
				38,
				33
			}
		},
		right_thumb = {
			texture = "xbone_button_icon_r3",
			size = {
				30,
				33
			}
		},
		l1_r1 = {
			texture = "xbone_button_icon_lb_rb",
			size = {
				69,
				26
			}
		},
		l2_r2 = {
			texture = "xbone_button_icon_lt_rt",
			size = {
				77,
				33
			}
		},
		left_stick = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_stick = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		left_axis = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_axis = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		left = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		start = {
			texture = "xbone_button_icon_menu",
			size = {
				26,
				26
			}
		},
		back = {
			texture = "xbone_button_icon_show",
			size = {
				26,
				26
			}
		}
	},
	ps4 = {
		cross = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34
			}
		},
		circle = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34
			}
		},
		square = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34
			}
		},
		triangle = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34
			}
		},
		up = {
			texture = "ps4_button_icon_d_pad_up",
			size = {
				33,
				33
			}
		},
		down = {
			texture = "ps4_button_icon_d_pad_down",
			size = {
				33,
				33
			}
		},
		left = {
			texture = "ps4_button_icon_d_pad_left",
			size = {
				33,
				33
			}
		},
		right = {
			texture = "ps4_button_icon_d_pad_right",
			size = {
				33,
				33
			}
		},
		d_horizontal = {
			texture = "ps4_button_icon_d_pad_horizontal",
			size = {
				33,
				33
			}
		},
		d_vertical = {
			texture = "ps4_button_icon_d_pad_vertical",
			size = {
				33,
				33
			}
		},
		d_pad = {
			texture = "ps4_button_icon_d_pad",
			size = {
				33,
				33
			}
		},
		l1 = {
			texture = "ps4_button_icon_l1",
			size = {
				36,
				26
			}
		},
		l2 = {
			texture = "ps4_button_icon_l2",
			size = {
				38,
				33
			}
		},
		l3 = {
			texture = "ps4_button_icon_l3",
			size = {
				30,
				33
			}
		},
		r1 = {
			texture = "ps4_button_icon_r1",
			size = {
				36,
				26
			}
		},
		r2 = {
			texture = "ps4_button_icon_r2",
			size = {
				38,
				33
			}
		},
		r3 = {
			texture = "ps4_button_icon_r3",
			size = {
				30,
				33
			}
		},
		l1_r1 = {
			texture = "ps4_button_icon_l1_r1",
			size = {
				69,
				26
			}
		},
		l2_r2 = {
			texture = "ps4_button_icon_l2_r2",
			size = {
				73,
				33
			}
		},
		left_stick = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_stick = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		left_axis = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_axis = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		options = {
			texture = "ps4_button_icon_options",
			size = {
				44,
				33
			}
		},
		share = {
			texture = "ps4_button_icon_share",
			size = {
				44,
				33
			}
		},
		touch = {
			texture = "ps4_button_icon_touchpad",
			size = {
				42,
				28
			}
		}
	},
	win32_ps4 = {
		a = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34
			}
		},
		b = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34
			}
		},
		x = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34
			}
		},
		y = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34
			}
		},
		cross = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34
			}
		},
		circle = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34
			}
		},
		square = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34
			}
		},
		triangle = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34
			}
		},
		d_up = {
			texture = "ps4_button_icon_d_pad_up",
			size = {
				33,
				33
			}
		},
		d_down = {
			texture = "ps4_button_icon_d_pad_down",
			size = {
				33,
				33
			}
		},
		d_left = {
			texture = "ps4_button_icon_d_pad_left",
			size = {
				33,
				33
			}
		},
		d_right = {
			texture = "ps4_button_icon_d_pad_right",
			size = {
				33,
				33
			}
		},
		d_horizontal = {
			texture = "ps4_button_icon_d_pad_horizontal",
			size = {
				33,
				33
			}
		},
		d_vertical = {
			texture = "ps4_button_icon_d_pad_vertical",
			size = {
				33,
				33
			}
		},
		d_pad = {
			texture = "ps4_button_icon_d_pad",
			size = {
				33,
				33
			}
		},
		left_shoulder = {
			texture = "ps4_button_icon_l1",
			size = {
				36,
				26
			}
		},
		left_trigger = {
			texture = "ps4_button_icon_l2",
			size = {
				38,
				33
			}
		},
		left_thumb = {
			texture = "ps4_button_icon_l3",
			size = {
				30,
				33
			}
		},
		right_shoulder = {
			texture = "ps4_button_icon_r1",
			size = {
				36,
				26
			}
		},
		right_trigger = {
			texture = "ps4_button_icon_r2",
			size = {
				38,
				33
			}
		},
		right_thumb = {
			texture = "ps4_button_icon_r3",
			size = {
				30,
				33
			}
		},
		l1_r1 = {
			texture = "ps4_button_icon_l1_r1",
			size = {
				69,
				26
			}
		},
		l2_r2 = {
			texture = "ps4_button_icon_l2_r2",
			size = {
				73,
				33
			}
		},
		left_stick = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_stick = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		left_axis = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right_axis = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		left = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33
			}
		},
		right = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33
			}
		},
		start = {
			texture = "ps4_button_icon_options",
			size = {
				44,
				33
			}
		},
		back = {
			texture = "ps4_button_icon_share",
			size = {
				44,
				33
			}
		},
		touch = {
			texture = "ps4_button_icon_touchpad",
			size = {
				42,
				28
			}
		}
	}
}
UISettings.gamepad_button_texture_data = button_mapping

function ButtonTextureByName(button_name, platform)
	local use_ps4_input_icons = UISettings.use_ps4_input_icons
	local input_device = Managers.input and Managers.input:get_most_recent_device()

	if input_device then
		local device_type = input_device.type()
		local is_ps_pad = device_type == "sce_pad"
		use_ps4_input_icons = is_ps_pad or use_ps4_input_icons
	end

	if IS_WINDOWS and (platform == "xb1" or platform == "ps_pad") and use_ps4_input_icons then
		platform = "win32_ps4"
	end

	local data = button_mapping[platform][button_name]

	if not data and platform == "win32" then
		data = pc_button_icon
	end

	return data
end

UISettings.get_gamepad_input_texture_data = function (input_service, input_action, gamepad_active, optional_alternative_input_service)
	local platform = PLATFORM

	if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not gamepad_active then
		platform = "win32"
	elseif IS_WINDOWS and gamepad_active then
		platform = "xb1"
	end

	local button_texture_data = nil
	local button_name = ""
	local keymap_binding = input_service:get_keymapping(input_action, platform)

	if #keymap_binding < 3 then
		return button_texture_data, button_name
	end

	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local unassigned = key_index == UNASSIGNED_KEY

	if key_index == UNASSIGNED_KEY and optional_alternative_input_service then
		keymap_binding = optional_alternative_input_service:get_keymapping(input_action, platform)
		device_type = keymap_binding[1]
		key_index = keymap_binding[2]
		key_action_type = keymap_binding[3]
		unassigned = true
	end

	if key_index and key_index ~= UNASSIGNED_KEY then
		if device_type == "keyboard" then
			button_name = Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index)
		elseif device_type == "mouse" then
			if key_action_type == "axis" then
				button_name = Mouse.axis_name(key_index)
			else
				button_name = Mouse.button_name(key_index)
			end

			button_texture_data = button_mapping.win32[button_name] or button_mapping.win32.default
		elseif device_type == "gamepad" then
			if key_action_type == "axis" then
				button_name = Pad1.axis_name(key_index)
				button_name = button_name .. "_axis"
			else
				button_name = Pad1.button_name(key_index)
			end
		end
	end

	button_name = button_name or "ERROR"
	local use_ps4_input_icons = UISettings.use_ps4_input_icons
	local input_device = Managers.input:get_most_recent_device()
	local device_type = input_device.type()
	local is_ps_pad = device_type == "sce_pad"
	use_ps4_input_icons = is_ps_pad or use_ps4_input_icons

	if use_ps4_input_icons and IS_WINDOWS and device_type == "gamepad" then
		platform = "win32_ps4"
	end

	button_texture_data = button_texture_data or ButtonTextureByName(button_name, platform)

	return button_texture_data, button_name, keymap_binding, unassigned
end

UISettings.set_console_settings = function ()
	UISettings.subtitles_font_size = Application.user_setting("subtitles_font_size") or 20
	UISettings.subtitles_background_alpha = 2.55 * (Application.user_setting("subtitles_background_opacity") or 20)
	local use_subtitles = Application.user_setting("use_subtitles")

	if use_subtitles ~= nil then
		UISettings.use_subtitles = use_subtitles
	end
end

UISettings.interaction_hotkey_lookup = {
	weave_magic_forge_access = "hotkey_weave_forge",
	weave_leaderboard_access = "hotkey_weave_leaderboard",
	inventory_access = "hotkey_inventory",
	map_access = "hotkey_map",
	characters_access = "hotkey_hero",
	achievement_access = "hotkey_achievements",
	store_access = "hotkey_store",
	weave_level_select_access = "hotkey_weave_play",
	loot_access = "hotkey_loot"
}
UISettings.achievement_search_definitions = {
	{
		{
			true,
			"search_keywords_true"
		},
		{
			false,
			"search_keywords_false"
		},
		key = "claimed"
	},
	{
		{
			true,
			"search_keywords_true"
		},
		{
			false,
			"search_keywords_false"
		},
		key = "completed"
	},
	{
		{
			true,
			"search_keywords_true"
		},
		{
			false,
			"search_keywords_false"
		},
		key = "locked"
	},
	{
		{
			"default",
			"search_keywords_default"
		},
		{
			"plentiful",
			"search_keywords_plentiful"
		},
		{
			"common",
			"search_keywords_common"
		},
		{
			"rare",
			"search_keywords_rare"
		},
		{
			"exotic",
			"search_keywords_exotic"
		},
		{
			"unique",
			"search_keywords_unique"
		},
		{
			"promo",
			"search_keywords_promo"
		},
		key = "rarity"
	},
	{
		{
			"loot_chest",
			"search_keywords_chest"
		},
		{
			"chips",
			"search_keywords_currency"
		},
		{
			"keep_decoration_painting",
			"search_keywords_decoration"
		},
		{
			"frame",
			"search_keywords_frame"
		},
		{
			"hat",
			"search_keywords_hat"
		},
		{
			"skin",
			"search_keywords_skin"
		},
		{
			"weapon_skin",
			"search_keywords_illusion"
		},
		{
			"melee",
			"search_keywords_melee"
		},
		{
			"ranged",
			"search_keywords_ranged"
		},
		key = "reward"
	}
}
UISettings.crosshair_styles = {
	ranged = {
		projectile = {
			enabled = true,
			crosshair_icon = "icon_crosshair_01"
		},
		shotgun = {
			enabled = true,
			crosshair_icon = "icon_crosshair_02"
		},
		default = {
			enabled = true,
			crosshair_icon = "icon_crosshair_03"
		},
		arrows = {
			enabled = true,
			crosshair_icon = "icon_crosshair_05"
		},
		circle = {
			enabled = true,
			crosshair_icon = "icon_crosshair_06"
		},
		wh_priest = {
			enabled = true,
			crosshair_icon = "icon_crosshair_07"
		}
	},
	melee = {
		dot = {
			enabled = true,
			crosshair_icon = "icon_crosshair_04"
		}
	},
	default = {
		enabled = true,
		crosshair_icon = "icon_crosshair_01"
	}
}
