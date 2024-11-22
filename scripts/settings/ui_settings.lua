-- chunkname: @scripts/settings/ui_settings.lua

require("scripts/ui/ui_layer")
require("scripts/utils/colors")

UISettings = UISettings or {
	bots_level_display_text = "BOT",
	chest_upgrade_score_topics_max_duration = 7,
	chest_upgrade_score_topics_min_duration = 0.5,
	console_menu_camera_move_duration = 0.5,
	crafting_animation_in_time = 0.2,
	crafting_animation_out_time = 0.1,
	crafting_animation_wait_time = 0.3,
	crafting_progress_time = 0.3,
	double_click_threshold = 0.1,
	hero_panel_height = 120,
	items_per_chest = 3,
	max_craft_material_presentation_amount = 999,
	max_fatigue_shields = 20,
	max_inventory_items = 1000,
	start_drag_threshold = 0.15,
	tooltip_fade_in_speed = 4,
	tooltip_wait_duration = 0.1,
	transparent_placeholder_texture = "gui/1080p/single_textures/generic/transparent_placeholder_texture",
	use_subtitles = true,
	wait_for_mip_streaming_character = true,
	wait_for_mip_streaming_items = false,
	console_menu_rect_color = Colors.get_color_table_with_alpha("console_menu_rect", 125),
	console_start_game_menu_rect_color = Colors.get_color_table_with_alpha("console_menu_rect", 125),
	game_start_windows = {
		background = "menu_frame_bg_01",
		frame = "menu_frame_09",
		large_window_frame = "menu_frame_08",
		spacing = 25,
		size = {
			520,
			820,
		},
		large_window_size = {
			1680,
			900,
		},
	},
	game_start_windows_console = {
		background = "menu_frame_bg_01",
		frame = "menu_frame_09",
		large_window_frame = "menu_frame_08",
		spacing = 25,
		size = {
			520,
			740,
		},
		large_window_size = {
			1680,
			900,
		},
	},
	mission_selection_map_size = {
		1630,
		840,
	},
	dice_type_success_sides = {
		gold = 4,
		metal = 3,
		warpstone = 6,
		wood = 2,
	},
	subtitles_font_size = Application.user_setting("subtitles_font_size") or 20,
	subtitles_background_alpha = 2.55 * (Application.user_setting("subtitles_background_opacity") or 20),
	root_scale = {
		Application.user_setting("root_scale_x") or 1,
		Application.user_setting("root_scale_y") or 1,
	},
	hud_scale = Application.user_setting("hud_scale") or 100,
	hud_clamp_ui_scaling = Application.user_setting("hud_clamp_ui_scaling") or false,
	use_custom_hud_scale = Application.user_setting("use_custom_hud_scale") or false,
	use_pc_menu_layout = Application.user_setting("use_pc_menu_layout") or false,
	use_gamepad_hud_layout = Application.user_setting("use_gamepad_hud_layout") or false,
	interaction = {
		bar = {
			fade_in = 0.1,
			fade_out = 0.1,
		},
	},
	inventory_hud = {
		bar_lit_fade_out_duration = 0.12,
		bar_lit_pulse_duration = 3,
		equip_animation_duration = 0.2,
		select_animation_duration = 0.2,
		slot_default_alpha = 170,
		slot_default_size = 46,
		slot_select_alpha = 255,
		slot_select_size = 62,
		slot_spacing = 2,
	},
	inventory = {
		item_preview_fade_in_time = 0.2,
		item_list = {
			intro = {
				background_fade_in_end_fraction = 0.8,
				background_fade_in_start_fraction = 0.4,
				item_fade_in_end_fraction = 0.4,
				item_fade_in_start_fraction = 0,
				non_room_item_alpha_value = 120,
				text_fade_in_end_fraction = 1,
				text_fade_in_start_fraction = 0.8,
				total_tween_time = 0.2,
			},
			border = {
				alpha_hover = 178.5,
				alpha_normal = 0,
				alpha_select = 255,
				hover_fade_in_time = 0.1,
				hover_fade_out_time = 0.1,
				select_fade_in_time = 0.2,
				select_fade_out_time = 0.2,
			},
		},
		button_bars = {
			selected_fade_in = 0.2,
			selected_fade_out = 0.04,
			background = {
				alpha_hover = 255,
				alpha_normal = 178.5,
				fade_in_time = 0.1,
				fade_out_time = 0.1,
			},
			icon = {
				alpha_hover = 255,
				alpha_normal = 178.5,
				fade_in_time = 0.1,
				fade_out_time = 0.1,
			},
		},
	},
	map = {
		camera_time_enter = 0.5,
		camera_time_exit = 0.5,
		show_debug_levels = true,
	},
	end_screen = {
		background_fade_in = 1.1,
		background_fade_out = 0.9,
		continue_fade_in = 0.5,
		continue_fade_out = 0.5,
		defeat_fade_in = 1.5,
		defeat_fade_out = 0.5,
		display_time = 5,
		gdc_fade_in = 0.2,
		gdc_fade_out = 0.5,
		text_fade_in = 0.5,
		text_fade_out = 0.3,
		victory_fade_in = 0.5,
		victory_fade_out = 0.8,
	},
	summary_screen = {
		bar_progress_experience_time_multiplier = 0.006,
		bar_progress_max_time = 3,
		bar_progress_min_time = 2,
		element_presentation_experience_count_start_time = 0.2,
		element_presentation_time = 0.7,
		reward_screen_display_time = 1.5,
		reward_screen_fade_in_time = 0.2,
		reward_screen_fade_out_time = 0.4,
		speed_up_experience_time_multiplier = 2.5,
		start_delay_time = 2,
		summary_dice_fade_in_time = 0.2,
		summary_entry_experience_count_time = 0.5,
		summary_entry_fade_in_time = 0.2,
		summary_entry_start_delay = 0.4,
		tween_in_time = 1,
		tween_out_time = 0.8,
	},
	scoreboard = {
		arrow_dehover_duration = 0.12,
		arrow_deselect_duration = 0.12,
		arrow_hover_duration = 0.12,
		arrow_select_duration = 0.12,
		auto_pilot_select_wait_time = 6,
		auto_pilot_wait_time = 15,
		close_duration = 0.4,
		open_duration = 0.4,
		player_list_pluse_duration = 0.5,
		topic_data_fade_in_duration = 0.2,
		topic_dehover_duration = 0.15,
		topic_deselect_duration = 0.15,
		topic_hover_alpha = 255,
		topic_hover_duration = 0.15,
		topic_normal_alpha = 180,
		topic_scroll_duration = 0.4,
		topic_select_duration = 0.15,
	},
	area_indicator = {
		fade_time = 1,
		wait_time = 1,
	},
	mission_objective = {
		fade_time = 1,
		wait_time = 3,
	},
	crosshair = {
		hit_marker_fade = 0.6,
	},
	unit_frames = {
		health_bar_lerp_time = 1,
		health_step_value = 10,
		low_health_animation_alpha_from = 255,
		low_health_animation_alpha_to = 200,
		low_health_animation_time = 5,
		low_health_threshold = 0.42,
	},
	cutscene_ui = {
		skippable = false,
		letterbox = {
			bar_height = 70,
		},
		fx_fade = {
			fade_in_time = 2,
			fade_out_time = 2,
			hold_time = 0,
		},
		fx_text_popup = {
			fade_in_time = 1,
			fade_out_time = 1,
			hold_time = 3,
		},
	},
	tutorial = {
		tooltip = {
			center_clamp_distance = 400,
		},
		mission_tooltip = {
			alpha_fade_out_value = 100,
			end_scale_distance = 100,
			fade_in_time = 0.15,
			fade_out_time = 0.15,
			minimum_icon_scale = 0.5,
			pixel_snap_threshold = 1.4,
			start_lerp_speed = 0.05,
			start_scale_distance = 10,
			time_lerp_multiplier = 0.24,
			distance_from_center = {
				height = 200,
				width = 400,
			},
		},
		objective_tooltip = {
			alpha_fade_out_value = 100,
			end_scale_distance = 100,
			fade_in_time = 0.15,
			fade_out_time = 0.15,
			minimum_icon_scale = 0.5,
			pixel_snap_threshold = 1.4,
			start_lerp_speed = 0.05,
			start_scale_distance = 10,
			time_lerp_multiplier = 0.24,
			distance_from_center = {
				height = 200,
				width = 400,
			},
		},
	},
	chat = {
		chat_close_delay = 6,
		chat_close_fade_length = 2,
		input_background_alpha = 180,
		input_caret_alpha = 255,
		input_text_alpha = 255,
		output_background_alpha = 255,
		output_text_alpha = 255,
		scrollbar_alpha = 160,
		scrollbar_background_alpha = 80,
		scrollbar_background_stroke_alpha = 80,
		scrollbar_stroke_alpha = 80,
		tab_notification_alpha_1 = 0,
		tab_notification_alpha_2 = 120,
		window_background_alpha = 110,
	},
	positive_reinforcement = {
		fade_duration = 0.5,
		folding_enabled = true,
		increment_duration = 0.33,
		show_duration = 4,
	},
	damage_feedback = {
		fade_duration = 0.5,
		increment_duration = 0.33,
		show_duration = 4,
	},
	use_ps4_input_icons = IS_PS4 or Application.user_setting("gamepad_use_ps4_style_input_icons"),
	breed_textures = {
		beastmen_bestigor = "unit_frame_portrait_enemy_bestigor",
		beastmen_gor = "unit_frame_portrait_enemy_standard_bearer",
		beastmen_minotaur = "unit_frame_portrait_enemy_minotaur",
		beastmen_standard_bearer = "unit_frame_portrait_enemy_standard_bearer",
		beastmen_standard_bearer_crater = "unit_frame_portrait_enemy_standard_bearer",
		beastmen_ungor = "unit_frame_portrait_enemy_standard_bearer",
		beastmen_ungor_archer = "unit_frame_portrait_enemy_standard_bearer",
		chaos_berzerker = "unit_frame_portrait_enemy_savage",
		chaos_bulwark = "unit_frame_portrait_enemy_chaos_bulwark",
		chaos_corruptor_sorcerer = "unit_frame_portrait_enemy_sorcerer_corruptor",
		chaos_exalted_champion_norsca = "unit_frame_portrait_enemy_chaos_warrior",
		chaos_exalted_champion_warcamp = "unit_frame_portrait_enemy_chaos_warrior",
		chaos_exalted_sorcerer = "unit_frame_portrait_enemy_sorcerer_boss",
		chaos_exalted_sorcerer_drachenfels = "unit_frame_portrait_enemy_sorcerer_drachenfels",
		chaos_fanatic = "unit_frame_portrait_enemy_fanatic",
		chaos_marauder = "unit_frame_portrait_enemy_chaos_marauder",
		chaos_marauder_with_shield = "unit_frame_portrait_enemy_chaos_marauder",
		chaos_plague_sorcerer = "unit_frame_portrait_enemy_chaos_sorcerer",
		chaos_raider = "unit_frame_portrait_enemy_raider",
		chaos_spawn = "unit_frame_portrait_enemy_chaos_spawn",
		chaos_spawn_exalted_champion_norsca = "unit_frame_portrait_enemy_chaos_spawn",
		chaos_tentacle = "unit_frame_portrait_enemy_chaos_sorcerer",
		chaos_tentacle_sorcerer = "unit_frame_portrait_enemy_chaos_sorcerer",
		chaos_troll = "unit_frame_portrait_enemy_chaos_troll",
		chaos_vortex = "unit_frame_portrait_enemy_sorcerer_vortex",
		chaos_vortex_sorcerer = "unit_frame_portrait_enemy_sorcerer_vortex",
		chaos_warrior = "unit_frame_portrait_enemy_chaos_warrior",
		chaos_zombie = "unit_frame_portrait_enemy_plague_zombie",
		hero_bw_adept = "small_unit_frame_portrait_sienna_adept",
		hero_bw_necromancer = "small_unit_frame_portrait_sienna_necromancer",
		hero_bw_scholar = "small_unit_frame_portrait_sienna_scholar",
		hero_bw_unchained = "small_unit_frame_portrait_sienna_unchained",
		hero_dr_engineer = "small_unit_frame_portrait_bardin_engineer",
		hero_dr_ironbreaker = "small_unit_frame_portrait_bardin_ironbreaker",
		hero_dr_ranger = "small_unit_frame_portrait_bardin_ranger",
		hero_dr_slayer = "small_unit_frame_portrait_bardin_slayer",
		hero_es_huntsman = "small_unit_frame_portrait_kruber_huntsman",
		hero_es_knight = "small_unit_frame_portrait_kruber_knight",
		hero_es_mercenary = "small_unit_frame_portrait_kruber_mercenary",
		hero_es_questingknight = "small_unit_frame_portrait_kruber_questingknight",
		hero_we_maidenguard = "small_unit_frame_portrait_kerillian_maidenguard",
		hero_we_shade = "small_unit_frame_portrait_kerillian_shade",
		hero_we_thornsister = "small_unit_frame_portrait_kerillian_thornsister",
		hero_we_waywatcher = "small_unit_frame_portrait_kerillian_waywatcher",
		hero_wh_bountyhunter = "small_unit_frame_portrait_victor_bountyhunter",
		hero_wh_captain = "small_unit_frame_portrait_victor_captain",
		hero_wh_priest = "small_unit_frame_portrait_victor_priest",
		hero_wh_zealot = "small_unit_frame_portrait_victor_zealot",
		pet_skeleton = "unit_frame_portrait_pet_skeleton",
		pet_skeleton_armored = "unit_frame_portrait_pet_skeleton",
		pet_skeleton_dual_wield = "unit_frame_portrait_pet_skeleton",
		pet_skeleton_with_shield = "unit_frame_portrait_pet_skeleton",
		skaven_clan_rat = "unit_frame_portrait_enemy_clanrat",
		skaven_clan_rat_with_shield = "unit_frame_portrait_enemy_clanrat",
		skaven_grey_seer = "unit_frame_portrait_enemy_rasknitt",
		skaven_gutter_runner = "unit_frame_portrait_enemy_gutter_runner",
		skaven_loot_rat = "unit_frame_portrait_enemy_lootrat",
		skaven_pack_master = "unit_frame_portrait_enemy_packmaster",
		skaven_plague_monk = "unit_frame_portrait_enemy_plague_monk",
		skaven_poison_wind_globadier = "unit_frame_portrait_enemy_poison_wind",
		skaven_rat_ogre = "unit_frame_portrait_enemy_rat_ogre",
		skaven_ratling_gunner = "unit_frame_portrait_enemy_ratling_gunner",
		skaven_slave = "unit_frame_portrait_enemy_slave_rat",
		skaven_storm_vermin = "unit_frame_portrait_enemy_stormvermin",
		skaven_storm_vermin_champion = "unit_frame_portrait_enemy_stormvermin",
		skaven_storm_vermin_commander = "unit_frame_portrait_enemy_stormvermin",
		skaven_storm_vermin_warlord = "unit_frame_portrait_enemy_warlord",
		skaven_storm_vermin_with_shield = "unit_frame_portrait_enemy_stormvermin",
		skaven_stormfiend = "unit_frame_portrait_enemy_stormfiend",
		skaven_stormfiend_boss = "unit_frame_portrait_enemy_stormfiend",
		skaven_stormfiend_demo = "unit_frame_portrait_enemy_stormfiend",
		skaven_warpfire_thrower = "unit_frame_portrait_enemy_warpfire",
		training_dummy = "unit_frame_portrait_enemy_raider",
		vs_chaos_troll = "unit_frame_portrait_enemy_chaos_troll",
		vs_gutter_runner = "unit_frame_portrait_enemy_gutter_runner",
		vs_packmaster = "unit_frame_portrait_enemy_packmaster",
		vs_poison_wind_globadier = "unit_frame_portrait_enemy_poison_wind",
		vs_ratling_gunner = "unit_frame_portrait_enemy_ratling_gunner",
		vs_warpfire_thrower = "unit_frame_portrait_enemy_warpfire",
	},
	chest_upgrade_score_topics = {
		default = {
			{
				display_name = "end_screen_chest_view_mission_completed",
				name = "game_won",
				texture = "loot_mutator_icon_06",
			},
			{
				display_name = "end_screen_chest_view_quickplay_bonus",
				name = "quickplay",
				texture = "loot_mutator_icon_03",
			},
			{
				display_name = "end_screen_chest_view_tomes",
				name = "tome",
				texture = "loot_objective_icon_02",
			},
			{
				display_name = "end_screen_chest_view_grimoires",
				name = "grimoire",
				texture = "loot_objective_icon_01",
			},
			{
				display_name = "end_screen_chest_view_loot_dice",
				name = "loot_dice",
				texture = "loot_mutator_icon_05",
			},
			{
				display_name = "end_screen_chest_view_random_bonus",
				name = "max_random_score",
				texture = "loot_mutator_icon_04",
			},
		},
	},
}

DLCUtils.merge("ui_settings", UISettings)
DLCUtils.merge("breed_textures", UISettings.breed_textures)

UISettings.default_items = {
	es_1h_sword = {
		description = "description_default_empire_soldier_es_1h_sword",
		display_name = "display_name_default_empire_soldier_es_1h_sword",
		inventory_icon = "icon_wpn_emp_sword_02_t1",
	},
	es_1h_mace = {
		description = "description_default_empire_soldier_es_1h_mace",
		display_name = "display_name_default_empire_soldier_es_1h_mace",
		inventory_icon = "icon_wpn_emp_mace_02_t1",
	},
	es_2h_sword_executioner = {
		description = "description_default_empire_soldier_es_exe_sword",
		display_name = "display_name_default_empire_soldier_es_exe_sword",
		inventory_icon = "icon_wpn_emp_sword_exe_01_t1",
	},
	es_2h_sword = {
		description = "description_default_empire_soldier_es_2h_sword",
		display_name = "display_name_default_empire_soldier_es_2h_sword",
		inventory_icon = "icon_wpn_empire_2h_sword_01_t1",
	},
	es_2h_hammer = {
		description = "description_default_empire_soldier_es_2h_war_hammer",
		display_name = "display_name_default_empire_soldier_es_2h_war_hammer",
		inventory_icon = "icon_wpn_empire_2h_hammer_01_t1",
	},
	es_sword_shield = {
		description = "description_default_empire_soldier_es_1h_sword_shield",
		display_name = "display_name_default_empire_soldier_es_1h_sword_shield",
		inventory_icon = "icon_wpn_empire_shield_02_sword",
	},
	es_mace_shield = {
		description = "description_default_empire_soldier_es_1h_mace_shield",
		display_name = "display_name_default_empire_soldier_es_1h_mace_shield",
		inventory_icon = "icon_wpn_empire_shield_02_mace",
	},
	es_1h_flail = {
		description = "description_default_empire_soldier_es_flail",
		display_name = "display_name_default_empire_soldier_es_flail",
		inventory_icon = "icon_wpn_emp_flail_01_t1",
	},
	es_halberd = {
		description = "description_default_empire_soldier_es_halberd",
		display_name = "display_name_default_empire_soldier_es_halberd",
		inventory_icon = "icon_wpn_wh_halberd_01",
	},
	es_longbow = {
		description = "description_default_empire_soldier_es_longbow",
		display_name = "display_name_default_empire_soldier_es_longbow",
		inventory_icon = "icon_wpn_empire_bow_tutorial",
	},
	es_blunderbuss = {
		description = "description_default_empire_soldier_es_blunderbuss",
		display_name = "display_name_default_empire_soldier_es_blunderbuss",
		inventory_icon = "icon_wpn_empire_blunderbuss_t1",
	},
	es_handgun = {
		description = "description_default_empire_soldier_es_handgun",
		display_name = "display_name_default_empire_soldier_es_handgun",
		inventory_icon = "icon_wpn_empire_handgun_t1",
	},
	es_repeating_handgun = {
		description = "description_default_empire_soldier_es_repeating_handgun",
		display_name = "display_name_default_empire_soldier_es_repeating_handgun",
		inventory_icon = "icon_wpn_emp_handgun_repeater_t1",
	},
	we_spear = {
		description = "description_default_wood_elf_ww_spear",
		display_name = "display_name_default_wood_elf_ww_spear",
		inventory_icon = "icon_wpn_we_spear_01",
	},
	we_dual_wield_daggers = {
		description = "description_default_wood_elf_ww_dual_daggers",
		display_name = "display_name_default_wood_elf_ww_dual_daggers",
		inventory_icon = "icon_wpn_we_dagger_01_t1_dual",
	},
	we_dual_wield_swords = {
		description = "description_default_wood_elf_ww_dual_swords",
		display_name = "display_name_default_wood_elf_ww_dual_swords",
		inventory_icon = "icon_wpn_we_sword_01_t1_dual",
	},
	we_1h_sword = {
		description = "description_default_wood_elf_ww_1h_sword",
		display_name = "display_name_default_wood_elf_ww_1h_sword",
		inventory_icon = "icon_wpn_we_sword_01_t1",
	},
	we_dual_wield_sword_dagger = {
		description = "description_default_wood_elf_ww_sword_and_dagger",
		display_name = "display_name_default_wood_elf_ww_sword_and_dagger",
		inventory_icon = "icon_wpn_we_sword_01_t1_dagger_dual",
	},
	we_shortbow = {
		description = "description_default_wood_elf_ww_shortbow",
		display_name = "display_name_default_wood_elf_ww_shortbow",
		inventory_icon = "icon_wpn_we_bow_short_01",
	},
	we_shortbow_hagbane = {
		description = "description_default_wood_elf_ww_hagbane",
		display_name = "display_name_default_wood_elf_ww_hagbane",
		inventory_icon = "icon_wpn_we_bow_short_01",
	},
	we_longbow = {
		description = "description_default_wood_elf_ww_longbow",
		display_name = "display_name_default_wood_elf_ww_longbow",
		inventory_icon = "icon_wpn_we_bow_01_t1",
	},
	we_longbow_trueflight = {
		description = "description_default_wood_elf_ww_trueflight",
		display_name = "display_name_default_wood_elf_ww_trueflight",
		inventory_icon = "icon_wpn_we_bow_01_t1",
	},
	we_2h_axe = {
		description = "description_default_wood_elf_ww_2h_axe",
		display_name = "display_name_default_wood_elf_ww_2h_axe",
		inventory_icon = "icon_wpn_we_2h_axe_01_t1",
	},
	we_2h_sword = {
		description = "description_default_wood_elf_ww_2h_sword",
		display_name = "display_name_default_wood_elf_ww_2h_sword",
		inventory_icon = "icon_wpn_we_2h_sword_01_t1",
	},
	we_crossbow_repeater = {
		description = "description_default_wood_elf_repeating_crossbow",
		display_name = "display_name_default_wood_elf_repeating_crossbow",
		inventory_icon = "icon_wpn_we_repeater_crossbow_t1",
	},
	bw_1h_mace = {
		description = "description_default_bright_wizard_bw_morningstar",
		display_name = "display_name_default_bright_wizard_bw_morningstar",
		inventory_icon = "icon_wpn_brw_mace_01",
	},
	bw_flame_sword = {
		description = "description_default_bright_wizard_bw_flame_sword",
		display_name = "display_name_default_bright_wizard_bw_flame_sword",
		inventory_icon = "icon_wpn_brw_flaming_sword_01_t1",
	},
	bw_sword = {
		description = "description_default_bright_wizard_bw_1h_sword",
		display_name = "display_name_default_bright_wizard_bw_1h_sword",
		inventory_icon = "icon_wpn_brw_sword_01_t1",
	},
	bw_dagger = {
		description = "description_default_bright_wizard_bw_dagger",
		display_name = "display_name_default_bright_wizard_bw_dagger",
		inventory_icon = "icon_wpn_brw_dagger_01",
	},
	bw_skullstaff_fireball = {
		description = "description_default_bright_wizard_bw_staff_firball",
		display_name = "display_name_default_bright_wizard_bw_staff_firball",
		inventory_icon = "icon_wpn_brw_staff_02",
	},
	bw_skullstaff_beam = {
		description = "description_default_bright_wizard_bw_staff_beam",
		display_name = "display_name_default_bright_wizard_bw_staff_beam",
		inventory_icon = "icon_wpn_brw_beam_staff_01",
	},
	bw_skullstaff_geiser = {
		description = "description_default_bright_wizard_bw_staff_geiser",
		display_name = "display_name_default_bright_wizard_bw_staff_geiser",
		inventory_icon = "icon_wpn_brw_staff_03",
	},
	bw_skullstaff_spear = {
		description = "description_default_bright_wizard_bw_staff_spear",
		display_name = "display_name_default_bright_wizard_bw_staff_spear",
		inventory_icon = "icon_wpn_brw_spear_staff_01",
	},
	bw_skullstaff_flamethrower = {
		description = "description_default_bright_wizard_bw_staff_flamethrower",
		display_name = "display_name_default_bright_wizard_bw_staff_flamethrower",
		inventory_icon = "icon_wpn_brw_flame_staff_01",
	},
	dr_1h_axe = {
		description = "description_default_dwarf_ranger_dr_1h_axes",
		display_name = "display_name_default_dwarf_ranger_dr_1h_axes",
		inventory_icon = "icon_wpn_dw_axe_01_t1",
	},
	dr_dual_wield_axes = {
		description = "description_default_dwarf_ranger_dr_dual_axes",
		display_name = "display_name_default_dwarf_ranger_dr_dual_axes",
		inventory_icon = "icon_wpn_dw_axe_01_t1_dual",
	},
	dr_2h_axe = {
		description = "description_default_dwarf_ranger_dr_2h_axes",
		display_name = "display_name_default_dwarf_ranger_dr_2h_axes",
		inventory_icon = "icon_wpn_dw_2h_axe_01_t1",
	},
	dr_2h_hammer = {
		description = "description_default_dwarf_ranger_dr_2h_hammer",
		display_name = "display_name_default_dwarf_ranger_dr_2h_hammer",
		inventory_icon = "icon_wpn_dw_2h_hammer_01_t1",
	},
	dr_1h_hammer = {
		description = "description_default_dwarf_ranger_dr_1h_hammer",
		display_name = "display_name_default_dwarf_ranger_dr_1h_hammer",
		inventory_icon = "icon_wpn_dw_hammer_01_t1",
	},
	dr_shield_axe = {
		description = "description_default_dwarf_ranger_dr_1h_axe_shield",
		display_name = "display_name_default_dwarf_ranger_dr_1h_axe_shield",
		inventory_icon = "icon_wpn_dw_shield_01_axe",
	},
	dr_shield_hammer = {
		description = "description_default_dwarf_ranger_dr_1h_hammer_shield",
		display_name = "display_name_default_dwarf_ranger_dr_1h_hammer_shield",
		inventory_icon = "icon_wpn_dw_shield_01_hammer",
	},
	dr_crossbow = {
		description = "description_default_dwarf_ranger_dr_crossbow",
		display_name = "display_name_default_dwarf_ranger_dr_crossbow",
		inventory_icon = "icon_wpn_dw_xbox_01_t1",
	},
	dr_rakegun = {
		description = "description_default_dwarf_ranger_dr_grudgeraker",
		display_name = "display_name_default_dwarf_ranger_dr_grudgeraker",
		inventory_icon = "icon_wpn_dw_rakegun_t1",
	},
	dr_handgun = {
		description = "description_default_dwarf_ranger_dr_handgun",
		display_name = "display_name_default_dwarf_ranger_dr_handgun",
		inventory_icon = "icon_wpn_dw_handgun_01_t1",
	},
	dr_drakegun = {
		description = "description_default_dwarf_ranger_dr_drakegun",
		display_name = "display_name_default_dwarf_ranger_dr_drakegun",
		inventory_icon = "icon_wpn_dw_iron_drake_02",
	},
	dr_drake_pistol = {
		description = "description_default_dwarf_ranger_dr_drakefire_pistols",
		display_name = "display_name_default_dwarf_ranger_dr_drakefire_pistols",
		inventory_icon = "icon_wpn_dw_drake_pistol_01_t1",
	},
	dr_2h_pick = {
		description = "description_default_dwarf_ranger_dr_2h_picks",
		display_name = "display_name_default_dwarf_ranger_dr_2h_picks",
		inventory_icon = "icon_wpn_dw_pick_01_t1",
	},
	wh_1h_axe = {
		description = "description_default_witch_hunter_wh_1h_axes",
		display_name = "display_name_default_witch_hunter_wh_1h_axes",
		inventory_icon = "icon_wpn_axe_hatchet_t1",
	},
	wh_2h_sword = {
		description = "description_default_witch_hunter_wh_2h_sword",
		display_name = "display_name_default_witch_hunter_wh_2h_sword",
		inventory_icon = "icon_wpn_empire_2h_sword_02_t1",
	},
	wh_fencing_sword = {
		description = "description_default_witch_hunter_wh_fencing_sword",
		display_name = "display_name_default_witch_hunter_wh_fencing_sword",
		inventory_icon = "icon_wpn_fencingsword_01_t1",
	},
	wh_brace_of_pistols = {
		description = "description_default_witch_hunter_wh_brace_of_pisols",
		display_name = "display_name_default_witch_hunter_wh_brace_of_pisols",
		inventory_icon = "icon_wpn_emp_pistol_01_t1",
	},
	wh_repeating_pistols = {
		description = "description_default_witch_hunter_wh_repeating_pistol",
		display_name = "display_name_default_witch_hunter_wh_repeating_pistol",
		inventory_icon = "icon_wpn_empire_pistol_repeater_t1",
	},
	wh_crossbow = {
		description = "description_default_witch_hunter_wh_crossbow",
		display_name = "display_name_default_witch_hunter_wh_crossbow",
		inventory_icon = "icon_wpn_emp_crossbow_02_t1",
	},
	wh_crossbow_repeater = {
		description = "description_default_witch_hunter_wh_repeating_crossbow",
		display_name = "display_name_default_witch_hunter_wh_repeating_crossbow",
		inventory_icon = "icon_wpn_wh_repeater_crossbow_t1",
	},
	wh_1h_falchion = {
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "display_name_default_witch_hunter_wh_1h_falchions",
		inventory_icon = "icon_wpn_emp_sword_04_t1",
	},
	ring = {
		description = "description_default_ring",
		display_name = "display_name_default_ring",
		inventory_icon = "icon_charm_09",
	},
	necklace = {
		description = "description_default_necklace",
		display_name = "display_name_default_necklace",
		inventory_icon = "icon_necklace_09",
	},
	trinket = {
		description = "description_default_trinket",
		display_name = "display_name_default_trinket",
		inventory_icon = "icon_trinket_12",
	},
}

DLCUtils.merge("default_items", UISettings.default_items)
DLCUtils.merge("chest_upgrade_score_topics", UISettings.chest_upgrade_score_topics)

UISettings.difficulties_select_sounds = {
	"play_gui_lobby_button_01_difficulty_select_normal",
	"play_gui_lobby_button_01_difficulty_select_hard",
	"play_gui_lobby_button_01_difficulty_select_nightmare",
	"play_gui_lobby_button_01_difficulty_select_cataclysm",
}
UISettings.hero_icons = {
	small = {
		bright_wizard = "tabs_class_icon_bright_wizard_normal",
		dwarf_ranger = "tabs_class_icon_dwarf_ranger_normal",
		empire_soldier = "tabs_class_icon_empire_soldier_normal",
		witch_hunter = "tabs_class_icon_witch_hunter_normal",
		wood_elf = "tabs_class_icon_way_watcher_normal",
	},
	medium = {
		bright_wizard = "hero_icon_medium_bright_wizard_yellow",
		dwarf_ranger = "hero_icon_medium_dwarf_ranger_yellow",
		empire_soldier = "hero_icon_medium_empire_soldier_yellow",
		witch_hunter = "hero_icon_medium_witch_hunter_yellow",
		wood_elf = "hero_icon_medium_way_watcher_yellow",
	},
	medium_white = {
		bright_wizard = "hero_icon_medium_bright_wizard_white",
		dwarf_ranger = "hero_icon_medium_dwarf_ranger_white",
		empire_soldier = "hero_icon_medium_empire_soldier_white",
		witch_hunter = "hero_icon_medium_witch_hunter_white",
		wood_elf = "hero_icon_medium_way_watcher_white",
	},
}
UISettings.hero_tooltips = {
	bright_wizard = "inventory_screen_bright_wizard_tooltip",
	dwarf_ranger = "inventory_screen_dwarf_tooltip",
	empire_soldier = "inventory_screen_empire_soldier_tooltip",
	witch_hunter = "inventory_screen_witch_hunter_tooltip",
	wood_elf = "inventory_screen_way_watcher_tooltip",
}
UISettings.slot_icons = {
	crafting_material = "tabs_icon_crafting_material",
	forge = "tabs_icon_anvil",
	hat = "tabs_icon_cosmetics",
	melee = "tabs_icon_equipment",
	melee_ranged = "tabs_icon_melee_ranged",
	necklace = "tabs_icon_necklace",
	portrait_frame = "tabs_icon_portrait_frame",
	pose = "tabs_icon_inventory",
	ranged = "tabs_icon_ranged",
	ring = "tabs_icon_charm",
	skins = "tabs_icon_character_skins",
	trinket = "tabs_icon_trinkets",
}
UISettings.item_type_store_icons = {
	bundle = "store_tag_icon_bundle",
	chips = "store_tag_icon_versus_coin",
	cosmetic_bundle = "store_tag_icon_skin",
	frame = "store_tag_icon_portrait_frame",
	hat = "store_tag_icon_hat",
	skin = "store_tag_icon_skin",
	weapon_pose_bundle = "store_tag_icon_pose",
	weapon_skin = "store_tag_icon_weapon",
}

DLCUtils.merge("item_type_store_icons", UISettings.item_type_store_icons)

UISettings.crafting_material_order = {
	"crafting_material_scrap",
	"crafting_material_weapon",
	"crafting_material_jewellery",
	"crafting_material_dust_1",
	"crafting_material_dust_2",
	"crafting_material_dust_3",
	"crafting_material_dust_4",
}
UISettings.crafting_material_icons_small = {
	crafting_material_dust_1 = "icon_crafting_dust_01_small",
	crafting_material_dust_2 = "icon_crafting_dust_02_small",
	crafting_material_dust_3 = "icon_crafting_dust_03_small",
	crafting_material_dust_4 = "icon_crafting_dust_04_small",
	crafting_material_jewellery = "icon_crafting_jewellery_part_small",
	crafting_material_scrap = "icon_crafting_scrap_small",
	crafting_material_weapon = "icon_crafting_weapon_part_small",
}
UISettings.crafting_material_order_by_item_key = {
	crafting_material_dust_1 = 1,
	crafting_material_dust_2 = 2,
	crafting_material_dust_3 = 3,
	crafting_material_dust_4 = 4,
	crafting_material_jewellery = 5,
	crafting_material_scrap = 6,
	crafting_material_weapon = 7,
}
UISettings.loot_containers = {
	default = "loot_container_icon_01",
	elite = "loot_container_icon_03",
	epic = "loot_container_icon_02",
}
UISettings.item_rarity_textures = {
	common = "icon_bg_common",
	default = "icon_bg_default",
	exotic = "icon_bg_exotic",
	magic = "icon_bg_magic",
	plentiful = "icon_bg_plentiful",
	promo = "icon_bg_promo",
	rare = "icon_bg_rare",
	unique = "icon_bg_unique",
}
UISettings.hud_inventory_panel_data = {
	default = {
		texture_id = "hud_inventory_panel",
		texture_size = {
			624,
			66,
		},
	},
	dr_engineer = {
		texture_id = "hud_inventory_panel_cog",
		texture_size = {
			630,
			73,
		},
	},
}

DLCUtils.merge("hud_inventory_panel_data", UISettings.hud_inventory_panel_data)

UISettings.gamepad_ability_ui_data = {
	default = {
		ability_effect = "gamepad_ability_effect",
		ability_top_texture_id = "ability_glow",
		always_show_activated_ability_input = false,
		lit_frame_id = false,
	},
	dr_engineer = {
		ability_effect = "gamepad_ability_effect_cog",
		ability_top_texture_id = "icon_rotarygun",
		always_show_activated_ability_input = true,
		lit_frame_id = "lit_frame_engineer",
	},
}

DLCUtils.merge("gamepad_ability_ui_data", UISettings.gamepad_ability_ui_data)

UISettings.ability_ui_data = {
	default = {
		ability_bar_highlight = "hud_player_ability_bar_glow",
		ability_effect = "ability_effect",
		ability_effect_top = "ability_effect_top",
	},
	we_thornsister = {
		ability_bar_highlight = "hud_player_ability_bar_glow",
		ability_effect = "ability_effect",
		ability_effect_thorn = "ability_effect_thornsister",
		ability_effect_top = "ability_effect_top",
		ability_effect_top_thorn = "ability_effect_top_thornsister",
	},
}

DLCUtils.merge("ability_ui_data", UISettings.gamepad_ability_ui_data)
setmetatable(UISettings.item_rarity_textures, {
	__index = function (self, rarity)
		return "icons_placeholder"
	end,
})

UISettings.item_rarity_order = {
	common = 6,
	default = 8,
	exotic = 4,
	magic = 2,
	plentiful = 7,
	promo = 1,
	rare = 5,
	unique = 3,
}
UISettings.item_rarities = {
	"default",
	"plentiful",
	"common",
	"rare",
	"exotic",
	"unique",
	"promo",
}
UISettings.cosmetics_sorting_order = {
	hat = 1,
	skin = 2,
	weapon_skin = 3,
}
UISettings.inventory_consumable_slot_colors = {
	healthkit_first_aid_kit_01 = Colors.get_color_table_with_alpha("healthkit_first_aid_kit_01", 255),
	wpn_side_objective_tome_01 = Colors.get_color_table_with_alpha("wpn_side_objective_tome_01", 255),
	potion_healing_draught_01 = Colors.get_color_table_with_alpha("potion_healing_draught_01", 255),
	potion_damage_boost_01 = Colors.get_color_table_with_alpha("potion_damage_boost_01", 255),
	potion_speed_boost_01 = Colors.get_color_table_with_alpha("potion_speed_boost_01", 255),
	potion_cooldown_reduction_01 = Colors.get_color_table_with_alpha("potion_cooldown_reduction_01", 255),
	wpn_grimoire_01 = Colors.get_color_table_with_alpha("wpn_grimoire_01", 255),
	grenade_engineer = Colors.get_color_table_with_alpha("grenade_engineer", 255),
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
		0,
	},
}
UISettings.additional_inventory_slot_angles = {
	default = 0,
	potion_damage_boost_01 = math.degrees_to_radians(-45),
	potion_speed_boost_01 = math.degrees_to_radians(-45),
	potion_cooldown_reduction_01 = math.degrees_to_radians(-45),
}

DLCUtils.merge("inventory_consumable_slot_colors", UISettings.inventory_consumable_slot_colors)

UISettings.console_menu_scenegraphs = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	area = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1820,
			840,
		},
		position = {
			50,
			-120,
			1,
		},
	},
	area_left = {
		horizontal_alignment = "left",
		parent = "area",
		vertical_alignment = "top",
		size = {
			560,
			840,
		},
		position = {
			0,
			0,
			1,
		},
	},
	area_right = {
		horizontal_alignment = "left",
		parent = "area_divider",
		vertical_alignment = "center",
		size = {
			1190,
			840,
		},
		position = {
			60,
			0,
			1,
		},
	},
	area_divider = {
		horizontal_alignment = "right",
		parent = "area_left",
		vertical_alignment = "center",
		size = {
			50,
			840,
		},
		position = {
			60,
			0,
			1,
		},
	},
	craft_bg_root = {
		horizontal_alignment = "left",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			512,
			512,
		},
		position = {
			40,
			-220,
			1,
		},
	},
	craft_button = {
		horizontal_alignment = "center",
		parent = "craft_bg_root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			-294,
			1,
		},
	},
}
UISettings.hero_selection_camera_position_by_character = {
	witch_hunter = {
		x = 0,
		y = 0.8,
		z = 0.9,
	},
	bright_wizard = {
		x = 0,
		y = 0.4,
		z = 0.7,
	},
	dwarf_ranger = {
		x = 0,
		y = 0,
		z = 0.4,
	},
	wood_elf = {
		x = 0,
		y = 0.4,
		z = 0.7,
	},
	empire_soldier = {
		x = 0,
		y = 0.5,
		z = 0.7,
	},
	empire_soldier_tutorial = {
		x = 0,
		y = 0.5,
		z = 0.7,
	},
	default = {
		x = 0,
		y = 0,
		z = 0,
	},
}
UISettings.hero_hat_camera_position_by_character = {
	witch_hunter = {
		x = 0,
		y = -2.1,
		z = 0.93,
	},
	bright_wizard = {
		x = 0,
		y = -2.2,
		z = 0.7,
	},
	dwarf_ranger = {
		x = 0,
		y = -2,
		z = 0.17,
	},
	wood_elf = {
		x = 0,
		y = -2,
		z = 0.7,
	},
	empire_soldier = {
		x = 0,
		y = -2.1,
		z = 0.88,
	},
	empire_soldier_tutorial = {
		x = 0,
		y = -2.1,
		z = 0.88,
	},
	vs_chaos_troll = {
		x = 0.8,
		y = -0.2,
		z = 1.4,
	},
	vs_gutter_runner = {
		x = 0.6,
		y = -0.9,
		z = 0.2,
	},
	vs_packmaster = {
		x = 0.6,
		y = -0.8,
		z = 0.1,
	},
	vs_ratling_gunner = {
		x = 0.6,
		y = -0.8,
		z = 0.1,
	},
	vs_warpfire_thrower = {
		x = 0.6,
		y = -0.8,
		z = 0.1,
	},
	vs_poison_wind_globadier = {
		x = 0.6,
		y = -0.8,
		z = 0.2,
	},
	default = {
		x = 0,
		y = 0,
		z = 0,
	},
}
UISettings.hero_skin_camera_position_by_character = {
	witch_hunter = {
		x = 0,
		y = -1.2,
		z = 0.4,
	},
	bright_wizard = {
		x = 0,
		y = -1.4,
		z = 0.2,
	},
	dwarf_ranger = {
		x = 0,
		y = -1.5,
		z = -0.2,
	},
	wood_elf = {
		x = 0,
		y = -1.4,
		z = 0.25,
	},
	empire_soldier = {
		x = 0,
		y = -1.2,
		z = 0.25,
	},
	empire_soldier_tutorial = {
		x = 0,
		y = -1.2,
		z = 0.25,
	},
	vs_chaos_troll = {
		x = 0.8,
		y = -0.2,
		z = 1.4,
	},
	vs_gutter_runner = {
		x = 0,
		y = -1,
		z = 0,
	},
	vs_packmaster = {
		x = 0,
		y = -1,
		z = 0,
	},
	vs_ratling_gunner = {
		x = 0,
		y = -1,
		z = 0,
	},
	vs_warpfire_thrower = {
		x = 0,
		y = -1,
		z = 0,
	},
	vs_poison_wind_globadier = {
		x = 0,
		y = -1,
		z = 0,
	},
	default = {
		x = 0,
		y = 0,
		z = 0,
	},
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
	"console_item_background",
}

UISettings.hero_fullscreen_menu_on_enter = function ()
	print("hero_fullscreen_menu_on_enter")
end

UISettings.hero_fullscreen_menu_on_exit = function ()
	print("hero_fullscreen_menu_on_exit")
end

UISettings.dlc_order_data = {
	{
		display_name = "gift_popup_text_vt2_pre_order_bonus",
		dlc = "pre_order",
	},
	{
		display_name = "gift_popup_text_vt1",
		dlc = "vermintide_1",
	},
	{
		display_name = "warhammer_vermintide_2",
		dlc = "base_game",
	},
	{
		display_name = "store_bogenhafen_title",
		dlc = "bogenhafen",
	},
	{
		display_name = "store_ubersreik_title",
		dlc = "holly",
	},
	{
		display_name = "store_wom_title",
		dlc = "scorpion",
	},
	{
		display_name = "store_grass_title",
		dlc = "grass",
	},
	{
		display_name = "store_grass_title",
		dlc = "grass_2",
	},
	{
		display_name = "hat",
		dlc = "mm_1001",
	},
	{
		display_name = "hat",
		dlc = "mh_1001",
	},
	{
		display_name = "hat",
		dlc = "mk_1001",
	},
	{
		display_name = "hat",
		dlc = "br_1001",
	},
	{
		display_name = "hat",
		dlc = "bi_1001",
	},
	{
		display_name = "hat",
		dlc = "bs_1001",
	},
	{
		display_name = "hat",
		dlc = "kw_1001",
	},
	{
		display_name = "hat",
		dlc = "kh_1001",
	},
	{
		display_name = "hat",
		dlc = "ks_1001",
	},
	{
		display_name = "hat",
		dlc = "vw_1001",
	},
	{
		display_name = "hat",
		dlc = "vb_1001",
	},
	{
		display_name = "hat",
		dlc = "vz_1001",
	},
	{
		display_name = "hat",
		dlc = "vz_1003",
	},
	{
		display_name = "hat",
		dlc = "sb_1001",
	},
	{
		display_name = "hat",
		dlc = "sp_1001",
	},
	{
		display_name = "hat",
		dlc = "su_1001",
	},
	{
		display_name = "bounty_hunter_bundle_01",
		dlc = "bountyhunter_bundle",
	},
	{
		display_name = "shade_bundle_01",
		dlc = "shade_bundle",
	},
	{
		display_name = "ironbreaker_bundle_01",
		dlc = "ironbreaker_bundle",
	},
	{
		display_name = "mercenary_bundle_01",
		dlc = "mercenary_bundle",
	},
	{
		display_name = "pyromancer_bundle_01",
		dlc = "scholar_bundle",
	},
	{
		display_name = "display_name_adept_bundle_0001",
		dlc = "adept_bundle_0001",
	},
	{
		display_name = "display_name_slayer_bundle_0001",
		dlc = "slayer_bundle_0001",
	},
	{
		display_name = "display_name_zealot_bundle_0001",
		dlc = "zealot_bundle_0001",
	},
	{
		display_name = "display_name_huntsman_bundle_0001",
		dlc = "huntsman_bundle_0001",
	},
	{
		display_name = "display_name_maidenguard_bundle_0001",
		dlc = "maidenguard_bundle_0001",
	},
	{
		display_name = "store_lake_title",
		dlc = "lake",
	},
	{
		display_name = "store_lake_upgrade_title",
		dlc = "lake_upgrade",
	},
	{
		display_name = "store_cog_title",
		dlc = "cog",
	},
	{
		display_name = "store_cog_upgrade_title",
		dlc = "cog_upgrade",
	},
	{
		display_name = "store_woods_title",
		dlc = "woods",
	},
	{
		display_name = "store_woods_upgrade_title",
		dlc = "woods_upgrade",
	},
	{
		display_name = "store_bless_title",
		dlc = "bless",
	},
	{
		display_name = "store_bless_upgrade_title",
		dlc = "bless_upgrade",
	},
	{
		display_name = "store_shovel_title",
		dlc = "shovel",
	},
	{
		display_name = "store_shovel_upgrade_title",
		dlc = "shovel_upgrade",
	},
	{
		display_name = "display_name_q1_ranger_bundle",
		dlc = "q1_ranger_bundle",
	},
	{
		display_name = "display_name_q1_waywatcher_bundle",
		dlc = "q1_waywatcher_bundle",
	},
	{
		display_name = "display_name_q1_footknight_bundle",
		dlc = "q1_footknight_bundle",
	},
	{
		display_name = "display_name_q1_unchained_bundle",
		dlc = "q1_unchained_bundle",
	},
	{
		display_name = "display_name_q1_wh_captain_bundle",
		dlc = "q1_wh_captain_bundle",
	},
	{
		display_name = "display_name_q1_collection_bundle",
		dlc = "q1_collection_bundle",
	},
	{
		display_name = "display_name_ironbreaker_bundle_0002",
		dlc = "ironbreaker_bundle_0002",
	},
	{
		display_name = "display_name_maidenguard_bundle_0002",
		dlc = "maidenguard_bundle_0002",
	},
	{
		display_name = "display_name_huntsman_bundle_0002",
		dlc = "huntsman_bundle_0002",
	},
	{
		display_name = "display_name_scholar_bundle_0002",
		dlc = "scholar_bundle_0002",
	},
	{
		display_name = "display_name_zealot_bundle_0002",
		dlc = "zealot_bundle_0002",
	},
	{
		display_name = "display_name_five_career_bundle_0004",
		dlc = "five_career_bundle_0004",
	},
	{
		display_name = "display_name_ranger_bundle_0002",
		dlc = "ranger_bundle_0002",
	},
	{
		display_name = "display_name_shade_bundle_0002",
		dlc = "shade_bundle_0002",
	},
	{
		display_name = "display_name_knight_bundle_0002",
		dlc = "footknight_bundle_0002",
	},
	{
		display_name = "display_name_unchained_bundle_0002",
		dlc = "unchained_bundle_0002",
	},
	{
		display_name = "display_name_bountyhunter_bundle_0002",
		dlc = "bountyhunter_bundle_0002",
	},
	{
		display_name = "display_name_five_career_bundle_0005",
		dlc = "five_career_bundle_0005",
	},
	{
		display_name = "display_name_engineer_bundle_0001",
		dlc = "engineer_bundle_0001",
	},
	{
		display_name = "display_name_maidenguard_bundle_0003",
		dlc = "maidenguard_bundle_0003",
	},
	{
		display_name = "display_name_questing_knight_bundle_0001",
		dlc = "questing_knight_bundle_0001",
	},
	{
		display_name = "display_name_adept_bundle_0002",
		dlc = "adept_bundle_0002",
	},
	{
		display_name = "display_name_priest_bundle_0001",
		dlc = "priest_bundle_0001",
	},
	{
		display_name = "display_name_five_career_bundle_0006",
		dlc = "five_career_bundle_0006",
	},
	{
		display_name = "display_name_adept_hat_1003",
		dlc = "adept_hat_1003",
	},
	{
		display_name = "display_name_ironbreaker_hat_1005",
		dlc = "ironbreaker_hat_1005",
	},
	{
		display_name = "display_name_huntsman_hat_1003",
		dlc = "huntsman_hat_1003",
	},
	{
		display_name = "display_name_shade_hat_1004",
		dlc = "shade_hat_1004",
	},
	{
		display_name = "display_name_bountyhunter_hat_1004",
		dlc = "bountyhunter_hat_1004",
	},
	{
		display_name = "display_name_q2_2023_hat_collection",
		dlc = "q2_2023_hat_collection",
	},
	{
		display_name = "store_shovel_title",
		dlc = "shovel",
	},
	{
		display_name = "store_shovel_upgrade_title",
		dlc = "shovel_upgrade",
	},
	{
		display_name = "display_name_premium_career_bundle",
		dlc = "premium_career_bundle",
	},
	{
		display_name = "display_name_premium_career_bundle_upgrade",
		dlc = "premium_career_bundle_upgrade",
	},
	{
		display_name = "display_name_slayer_bundle_0002",
		dlc = "slayer_bundle_0002",
	},
	{
		display_name = "display_name_waywatcher_bundle_0001",
		dlc = "waywatcher_bundle_0001",
	},
	{
		display_name = "display_name_mercenary_bundle_0002",
		dlc = "mercenary_bundle_0002",
	},
	{
		display_name = "display_name_scholar_bundle_0003",
		dlc = "scholar_bundle_0003",
	},
	{
		display_name = "display_name_witchhunter_bundle_0001",
		dlc = "witchhunter_bundle_0001",
	},
	{
		display_name = "display_name_five_career_bundle_0007",
		dlc = "five_career_bundle_0007",
	},
}

local pc_button_icon = {
	{
		texture = "pc_button_icon_left",
		size = {
			20,
			36,
		},
	},
	{
		texture = "pc_button_icon_middle",
		tileable = true,
		size = {
			8,
			36,
		},
	},
	{
		texture = "pc_button_icon_right",
		size = {
			20,
			36,
		},
	},
}
local button_mapping = {
	win32 = {
		mouse_0 = {
			texture = "mouse_input_left",
			size = {
				50,
				66,
			},
		},
		left = {
			texture = "mouse_input_left",
			size = {
				50,
				66,
			},
		},
		right = {
			texture = "mouse_input_right",
			size = {
				50,
				66,
			},
		},
		middle = {
			texture = "mouse_input_middle",
			size = {
				50,
				66,
			},
		},
		wheel = {
			texture = "mouse_input_middle",
			size = {
				50,
				66,
			},
		},
		default = {
			texture = "mouse_input",
			size = {
				50,
				66,
			},
		},
	},
	xb1 = {
		a = {
			texture = "xbone_button_icon_a",
			size = {
				34,
				34,
			},
		},
		b = {
			texture = "xbone_button_icon_b",
			size = {
				34,
				34,
			},
		},
		x = {
			texture = "xbone_button_icon_x",
			size = {
				34,
				34,
			},
		},
		y = {
			texture = "xbone_button_icon_y",
			size = {
				34,
				34,
			},
		},
		d_up = {
			texture = "xbone_button_icon_d_pad_up",
			size = {
				33,
				33,
			},
		},
		d_down = {
			texture = "xbone_button_icon_d_pad_down",
			size = {
				33,
				33,
			},
		},
		d_left = {
			texture = "xbone_button_icon_d_pad_left",
			size = {
				33,
				33,
			},
		},
		d_right = {
			texture = "xbone_button_icon_d_pad_right",
			size = {
				33,
				33,
			},
		},
		d_horizontal = {
			texture = "xbone_button_icon_d_pad_horizontal",
			size = {
				33,
				33,
			},
		},
		d_vertical = {
			texture = "xbone_button_icon_d_pad_vertical",
			size = {
				33,
				33,
			},
		},
		d_pad = {
			texture = "xbone_button_icon_d_pad",
			size = {
				33,
				33,
			},
		},
		left_shoulder = {
			texture = "xbone_button_icon_lb",
			size = {
				36,
				26,
			},
		},
		left_trigger = {
			texture = "xbone_button_icon_lt",
			size = {
				38,
				33,
			},
		},
		left_thumb = {
			texture = "xbone_button_icon_l3",
			size = {
				30,
				33,
			},
		},
		right_shoulder = {
			texture = "xbone_button_icon_rb",
			size = {
				36,
				26,
			},
		},
		right_trigger = {
			texture = "xbone_button_icon_rt",
			size = {
				38,
				33,
			},
		},
		right_thumb = {
			texture = "xbone_button_icon_r3",
			size = {
				30,
				33,
			},
		},
		l1_r1 = {
			texture = "xbone_button_icon_lb_rb",
			size = {
				69,
				26,
			},
		},
		l2_r2 = {
			texture = "xbone_button_icon_lt_rt",
			size = {
				77,
				33,
			},
		},
		left_stick = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_stick = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		left_axis = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_axis = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		left = {
			texture = "xbone_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right = {
			texture = "xbone_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		start = {
			texture = "xbone_button_icon_menu",
			size = {
				26,
				26,
			},
		},
		back = {
			texture = "xbone_button_icon_show",
			size = {
				26,
				26,
			},
		},
	},
	ps4 = {
		cross = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34,
			},
		},
		circle = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34,
			},
		},
		square = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34,
			},
		},
		triangle = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34,
			},
		},
		up = {
			texture = "ps4_button_icon_d_pad_up",
			size = {
				33,
				33,
			},
		},
		down = {
			texture = "ps4_button_icon_d_pad_down",
			size = {
				33,
				33,
			},
		},
		left = {
			texture = "ps4_button_icon_d_pad_left",
			size = {
				33,
				33,
			},
		},
		right = {
			texture = "ps4_button_icon_d_pad_right",
			size = {
				33,
				33,
			},
		},
		d_horizontal = {
			texture = "ps4_button_icon_d_pad_horizontal",
			size = {
				33,
				33,
			},
		},
		d_vertical = {
			texture = "ps4_button_icon_d_pad_vertical",
			size = {
				33,
				33,
			},
		},
		d_pad = {
			texture = "ps4_button_icon_d_pad",
			size = {
				33,
				33,
			},
		},
		l1 = {
			texture = "ps4_button_icon_l1",
			size = {
				36,
				26,
			},
		},
		l2 = {
			texture = "ps4_button_icon_l2",
			size = {
				38,
				33,
			},
		},
		l3 = {
			texture = "ps4_button_icon_l3",
			size = {
				30,
				33,
			},
		},
		r1 = {
			texture = "ps4_button_icon_r1",
			size = {
				36,
				26,
			},
		},
		r2 = {
			texture = "ps4_button_icon_r2",
			size = {
				38,
				33,
			},
		},
		r3 = {
			texture = "ps4_button_icon_r3",
			size = {
				30,
				33,
			},
		},
		l1_r1 = {
			texture = "ps4_button_icon_l1_r1",
			size = {
				69,
				26,
			},
		},
		l2_r2 = {
			texture = "ps4_button_icon_l2_r2",
			size = {
				73,
				33,
			},
		},
		left_stick = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_stick = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		left_axis = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_axis = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		options = {
			texture = "ps4_button_icon_options",
			size = {
				44,
				33,
			},
		},
		share = {
			texture = "ps4_button_icon_share",
			size = {
				44,
				33,
			},
		},
		touch = {
			texture = "ps4_button_icon_touchpad",
			size = {
				42,
				28,
			},
		},
	},
	win32_ps4 = {
		a = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34,
			},
		},
		b = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34,
			},
		},
		x = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34,
			},
		},
		y = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34,
			},
		},
		cross = {
			texture = "ps4_button_icon_cross",
			size = {
				34,
				34,
			},
		},
		circle = {
			texture = "ps4_button_icon_circle",
			size = {
				34,
				34,
			},
		},
		square = {
			texture = "ps4_button_icon_square",
			size = {
				34,
				34,
			},
		},
		triangle = {
			texture = "ps4_button_icon_triangle",
			size = {
				34,
				34,
			},
		},
		d_up = {
			texture = "ps4_button_icon_d_pad_up",
			size = {
				33,
				33,
			},
		},
		d_down = {
			texture = "ps4_button_icon_d_pad_down",
			size = {
				33,
				33,
			},
		},
		d_left = {
			texture = "ps4_button_icon_d_pad_left",
			size = {
				33,
				33,
			},
		},
		d_right = {
			texture = "ps4_button_icon_d_pad_right",
			size = {
				33,
				33,
			},
		},
		d_horizontal = {
			texture = "ps4_button_icon_d_pad_horizontal",
			size = {
				33,
				33,
			},
		},
		d_vertical = {
			texture = "ps4_button_icon_d_pad_vertical",
			size = {
				33,
				33,
			},
		},
		d_pad = {
			texture = "ps4_button_icon_d_pad",
			size = {
				33,
				33,
			},
		},
		left_shoulder = {
			texture = "ps4_button_icon_l1",
			size = {
				36,
				26,
			},
		},
		left_trigger = {
			texture = "ps4_button_icon_l2",
			size = {
				38,
				33,
			},
		},
		left_thumb = {
			texture = "ps4_button_icon_l3",
			size = {
				30,
				33,
			},
		},
		right_shoulder = {
			texture = "ps4_button_icon_r1",
			size = {
				36,
				26,
			},
		},
		right_trigger = {
			texture = "ps4_button_icon_r2",
			size = {
				38,
				33,
			},
		},
		right_thumb = {
			texture = "ps4_button_icon_r3",
			size = {
				30,
				33,
			},
		},
		l1_r1 = {
			texture = "ps4_button_icon_l1_r1",
			size = {
				69,
				26,
			},
		},
		l2_r2 = {
			texture = "ps4_button_icon_l2_r2",
			size = {
				73,
				33,
			},
		},
		left_stick = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_stick = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		left_axis = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right_axis = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		left = {
			texture = "ps4_button_icon_left_stick",
			size = {
				32,
				33,
			},
		},
		right = {
			texture = "ps4_button_icon_right_stick",
			size = {
				32,
				33,
			},
		},
		start = {
			texture = "ps4_button_icon_options",
			size = {
				44,
				33,
			},
		},
		back = {
			texture = "ps4_button_icon_touchpad",
			size = {
				42,
				28,
			},
		},
		touch = {
			texture = "ps4_button_icon_touchpad",
			size = {
				42,
				28,
			},
		},
	},
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

	local button_texture_data
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
	achievement_access = "hotkey_achievements",
	characters_access = "hotkey_hero",
	inventory_access = "hotkey_inventory",
	loot_access = "hotkey_loot",
	map_access = "hotkey_map",
	store_access = "hotkey_store",
	weave_leaderboard_access = "hotkey_weave_leaderboard",
	weave_level_select_access = "hotkey_weave_play",
	weave_magic_forge_access = "hotkey_weave_forge",
}
UISettings.achievement_search_definitions = {
	{
		{
			true,
			"search_keywords_true",
		},
		{
			false,
			"search_keywords_false",
		},
		key = "claimed",
	},
	{
		{
			true,
			"search_keywords_true",
		},
		{
			false,
			"search_keywords_false",
		},
		key = "completed",
	},
	{
		{
			true,
			"search_keywords_true",
		},
		{
			false,
			"search_keywords_false",
		},
		key = "locked",
	},
	{
		{
			"default",
			"search_keywords_default",
		},
		{
			"plentiful",
			"search_keywords_plentiful",
		},
		{
			"common",
			"search_keywords_common",
		},
		{
			"rare",
			"search_keywords_rare",
		},
		{
			"exotic",
			"search_keywords_exotic",
		},
		{
			"unique",
			"search_keywords_unique",
		},
		{
			"promo",
			"search_keywords_promo",
		},
		key = "rarity",
	},
	{
		{
			"loot_chest",
			"search_keywords_chest",
		},
		{
			"chips",
			"search_keywords_currency",
		},
		{
			"keep_decoration_painting",
			"search_keywords_decoration",
		},
		{
			"frame",
			"search_keywords_frame",
		},
		{
			"hat",
			"search_keywords_hat",
		},
		{
			"skin",
			"search_keywords_skin",
		},
		{
			"weapon_skin",
			"search_keywords_illusion",
		},
		{
			"melee",
			"search_keywords_melee",
		},
		{
			"ranged",
			"search_keywords_ranged",
		},
		key = "reward",
	},
}
UISettings.crosshair_styles = {
	ranged = {
		projectile = {
			crosshair_icon = "icon_crosshair_01",
			enabled = true,
		},
		shotgun = {
			crosshair_icon = "icon_crosshair_02",
			enabled = true,
		},
		default = {
			crosshair_icon = "icon_crosshair_03",
			enabled = true,
		},
		arrows = {
			crosshair_icon = "icon_crosshair_05",
			enabled = true,
		},
		circle = {
			crosshair_icon = "icon_crosshair_06",
			enabled = true,
		},
		wh_priest = {
			crosshair_icon = "icon_crosshair_07",
			enabled = true,
		},
	},
	melee = {
		dot = {
			crosshair_icon = "icon_crosshair_04",
			enabled = true,
		},
	},
	default = {
		crosshair_icon = "icon_crosshair_01",
		enabled = true,
	},
}
UISettings.INSIGNIA_OFFSET = 45
UISettings.default_loadout_settings = {
	we_shade = {
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_stealth,loadout_tag_high_damage",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_stealth,loadout_tag_high_damage",
		},
	},
	bw_adept = {
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_charge,loadout_tag_burn,loadout_tag_volotile",
		},
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_charge,loadout_tag_burn,loadout_tag_volotile",
		},
	},
	wh_captain = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_high_damage,loadout_tag_ammo,loadout_tag_high_health",
		},
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_high_health,loadout_tag_support",
		},
	},
	bw_necromancer = {
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_summoner,loadout_tag_sniper,loadout_tag_volatile",
		},
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_summoner,loadout_tag_sniper,loadout_tag_volatile",
		},
	},
	we_waywatcher = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_ammo,loadout_tag_sniper",
		},
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_healer",
		},
	},
	wh_priest = {
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_shield,loadout_tag_high_health,loadout_tag_support",
		},
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_shield,loadout_tag_high_health",
		},
	},
	dr_ranger = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_stealth,loadout_tag_ammo",
		},
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_stealth,loadout_tag_shield",
		},
	},
	wh_bountyhunter = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_ammo,loadout_tag_high_damage",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_ammo,loadout_tag_high_damage",
		},
	},
	es_questingknight = {
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_high_health,loadout_tag_high_cleave",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_high_health,loadout_tag_high_damage",
		},
	},
	dr_ironbreaker = {
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_taunt,loadout_tag_shield,loadout_tag_high_health",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_taunt,loadout_tag_high_health",
		},
	},
	es_knight = {
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_shield,loadout_tag_high_health",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_high_health",
		},
	},
	dr_engineer = {
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_versatile",
		},
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_shield",
		},
	},
	we_thornsister = {
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_poison,loadout_tag_aoe,loadout_tag_support",
		},
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_poison",
		},
	},
	es_huntsman = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_stealth,loadout_tag_ammo",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_stealth,loadout_tag_high_damage",
		},
	},
	dr_slayer = {
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_charge,loadout_tag_high_health",
		},
		{
			icon = "balanced_loadout_icon",
			tags = "loadout_tag_melee_only,loadout_tag_charge,loadout_tag_high_health",
		},
	},
	es_mercenary = {
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_high_cleave,loadout_tag_healer",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_healer,loadout_tag_ammo",
		},
	},
	we_maidenguard = {
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_charge,loadout_tag_stealth,loadout_tag_high_health",
		},
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_charge,loadout_tag_high_health",
		},
	},
	bw_scholar = {
		{
			icon = "sniper_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_aoe,loadout_tag_burn,loadout_tag_volatile",
		},
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_ranged,loadout_tag_aoe,loadout_tag_burn,loadout_tag_volatile",
		},
	},
	bw_unchained = {
		{
			icon = "hordekiller_loadout_icon",
			tags = "loadout_tag_versatile,loadout_tag_aoe,loadout_tag_burn,loadout_tag_high_health",
		},
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_burn,loadout_tag_volatile,loadout_tag_high_health",
		},
	},
	wh_zealot = {
		{
			icon = "tank_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_high_health,loadout_tag_charge",
		},
		{
			icon = "smiter_loadout_icon",
			tags = "loadout_tag_melee,loadout_tag_high_health,loadout_tag_charge",
		},
	},
}
