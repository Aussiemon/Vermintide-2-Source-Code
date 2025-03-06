-- chunkname: @scripts/settings/handbook_settings.lua

HandbookSettings = HandbookSettings or {}
HandbookSettings.outline = {
	{
		display_name = "tutorials_progression_header",
		children = {
			{
				"mission_select",
			},
			{
				"equipment",
			},
			{
				"talents",
			},
			{
				"crafting",
			},
			{
				"new_career_unlocked",
			},
			{
				"game_modes",
			},
		},
	},
	{
		display_name = "tutorials_basic_mechanics_header",
		children = {
			{
				"movement",
			},
			{
				"melee_attacks",
			},
			{
				"blocking",
			},
			{
				"dodging",
			},
			{
				"health_and_stamina_01",
				"health_and_stamina_02",
			},
			{
				"healing_01",
				"healing_02",
			},
			{
				"weapons_01",
				"weapons_02",
			},
			{
				"pushing_01",
				"pushing_02",
			},
			{
				"ranged_attacks_01",
				"ranged_attacks_02",
			},
			{
				"career_ability_01",
				"career_ability_02",
			},
			{
				"knockdowns_wounds_01",
				"knockdowns_wounds_02",
				"knockdowns_wounds_03",
			},
			{
				"hot_bar",
			},
			{
				"potions_01",
				"potions_02",
			},
		},
	},
	{
		display_name = "tutorials_versus_header",
		children = {
			{
				"tutorial_introduction_01",
				"tutorial_introduction_02",
				"tutorial_introduction_03",
			},
			{
				"objectives_01",
				"objectives_02",
				"objectives_03",
			},
			{
				"pactsworn_movement_01",
				"pactsworn_movement_02",
			},
			{
				"ghost_mode_01",
				"ghost_mode_02",
			},
			{
				"poison_wind_globadier_01",
				"poison_wind_globadier_02",
			},
			{
				"tutorial_gutterrunner_01",
				"tutorial_gutterrunner_02",
				"tutorial_gutterrunner_03",
			},
			{
				"packmaster_01",
				"packmaster_02",
			},
			{
				"ratling_gunner_01",
				"ratling_gunner_02",
			},
			{
				"warpfire_thrower_01",
				"warpfire_thrower_03",
			},
			{
				"playing_as_monsters_01",
				"playing_as_monsters_02",
				"playing_as_monsters_03",
			},
			{
				"bile_troll_01",
				"bile_troll_02",
				"bile_troll_03",
			},
			{
				"tutorial_rat_ogre_01",
				"tutorial_rat_ogre_02",
				"tutorial_rat_ogre_03",
			},
			{
				"tutorial_hordeability_01",
				"tutorial_hordeability_02",
			},
			{
				"versus_tagging_01",
				"versus_tagging_02",
			},
		},
	},
}

local function gamepad_active()
	return Managers.input:is_device_active("gamepad")
end

local function not_gamepad_active()
	return not gamepad_active()
end

HandbookSettings.popups = {
	mission_select = {
		pages = {
			"mission_select",
		},
		triggers = {
			"start_game_menu_opened",
		},
		conditions = {
			"is_adventure_mechanism",
		},
	},
	equipment = {
		pages = {
			"equipment",
		},
		triggers = {
			"loot_menu_opened",
		},
	},
	talents = {
		pages = {
			"talents",
		},
		triggers = {
			"keep_menu_left",
		},
		conditions = {
			"has_unspent_talent_points",
		},
	},
	crafting = {
		pages = {
			"crafting",
		},
		triggers = {
			"keep_menu_left",
		},
		custom_condition = function (context)
			return context:get("player_level") >= 8
		end,
	},
	new_career_unlocked = {
		pages = {
			"new_career_unlocked",
		},
		triggers = {
			"keep_menu_left",
		},
		conditions = {
			"has_unlocked_non_dlc_career_for_current_hero",
		},
	},
	difficulty_unlocked_champion = {
		pages = {
			"difficulty_unlocked_champion",
		},
		triggers = {
			"start_game_menu_opened",
		},
		conditions = {
			"harder_unlocked",
		},
	},
	difficulty_unlocked_legend = {
		pages = {
			"difficulty_unlocked_legend",
		},
		triggers = {
			"start_game_menu_opened",
		},
		conditions = {
			"hardest_unlocked",
		},
	},
	difficulty_unlocked_cataclysm = {
		pages = {
			"difficulty_unlocked_cataclysm",
		},
		triggers = {
			"start_game_menu_opened",
		},
		conditions = {
			"cataclysm_unlocked",
		},
	},
	game_modes = {
		pages = {
			"game_modes",
		},
		triggers = {
			"keep_menu_left",
		},
		custom_condition = function (context)
			return context:get("player_level") >= 15
		end,
	},
	tutorial_introduction = {
		pages = {
			"tutorial_introduction_01",
			"tutorial_introduction_02",
			"tutorial_introduction_03",
		},
		triggers = {
			"keep_menu_left",
		},
		conditions = {
			"is_versus_mechanism",
		},
	},
}
HandbookSettings.pages = {
	mission_select = {
		{
			texture = "tutorial_mission_select_01",
			type = "image",
		},
		{
			text = "tutorial_mission_select_text_01",
			type = "text",
		},
		display_name = "wom_tutorial_mission_select",
	},
	equipment = {
		{
			texture = "tutorial_weapons_02",
			type = "image",
		},
		{
			text = "tutorial_equipment_text_01",
			type = "text",
		},
		display_name = "hero_window_equipment",
	},
	talents = {
		{
			texture = "tutorial_talents_01",
			type = "image",
		},
		{
			text = "tutorial_talents_text_01",
			type = "text",
		},
		display_name = "hero_window_talents",
	},
	crafting = {
		{
			texture = "tutorial_crafting_01",
			type = "image",
		},
		{
			text = "tutorial_crafting_text_01",
			type = "text",
		},
		display_name = "hero_window_crafting",
	},
	new_career_unlocked = {
		{
			texture = "tutorial_careers_01",
			type = "image",
		},
		{
			text = "tutorial_careers_text_01",
			type = "text",
		},
		display_name = "tutorial_careers_header",
	},
	difficulty_unlocked_champion = {
		{
			texture = "tutorial_difficulty_champion_01",
			type = "image",
		},
		{
			text = "tutorial_difficulty_text_01",
			type = "text",
		},
		display_name = "tutorial_difficulty_champion_header",
	},
	difficulty_unlocked_legend = {
		{
			texture = "tutorial_difficulty_legend_01",
			type = "image",
		},
		{
			text = "tutorial_difficulty_text_01",
			type = "text",
		},
		display_name = "tutorial_difficulty_legend_header",
	},
	difficulty_unlocked_cataclysm = {
		{
			texture = "tutorial_difficulty_cataclysm_01",
			type = "image",
		},
		{
			text = "tutorial_difficulty_text_02",
			type = "text",
		},
		display_name = "tutorial_difficulty_cataclysm_header",
	},
	game_modes = {
		{
			texture = "tutorial_game_modes_01",
			type = "image",
		},
		{
			text = "tutorial_game_modes_text_01",
			type = "text",
		},
		display_name = "start_game_window_game_mode_header",
	},
	movement = {
		{
			path = "tutorial_movement_01",
			type = "video",
		},
		{
			text = "tutorial_movement_text_01",
			type = "text",
			condition_func = not_gamepad_active,
			inputs = {
				"move_forward",
				"move_left",
				"move_back",
				"move_right",
				"jump_1",
				"crouch",
			},
		},
		{
			text = "tutorial_movement_text_01",
			type = "text",
			condition_func = gamepad_active,
			inputs = {
				"move_controller",
				"move_controller",
				"move_controller",
				"move_controller",
				"jump_1",
				"crouch",
			},
		},
		display_name = "tutorial_movement_header",
	},
	melee_attacks = {
		{
			path = "tutorial_melee_attacks_01",
			type = "video",
		},
		{
			text = "tutorial_melee_attacks_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_one",
			},
		},
		display_name = "tutorial_melee_attacks_header",
	},
	blocking = {
		{
			path = "tutorial_blocking_01",
			type = "video",
		},
		{
			text = "tutorial_blocking_text_01",
			type = "text",
			inputs = {
				"action_two",
			},
		},
		display_name = "tutorial_blocking_header",
	},
	weapons_01 = {
		{
			path = "tutorial_weapons_01",
			type = "video",
		},
		{
			text = "tutorial_weapons_text_01",
			type = "text",
			inputs = {
				"wield_switch_1",
			},
		},
		display_name = "tutorial_weapons_header",
	},
	weapons_02 = {
		{
			texture = "tutorial_weapons_02",
			type = "image",
		},
		{
			text = "tutorial_weapons_text_02",
			type = "text",
		},
		display_name = "tutorial_weapons_header",
	},
	pushing_01 = {
		{
			path = "tutorial_push_01",
			type = "video",
		},
		{
			text = "tutorial_pushing_text_01",
			type = "text",
			inputs = {
				"action_one",
			},
		},
		display_name = "tutorial_pushing_header",
	},
	pushing_02 = {
		{
			path = "tutorial_push_02",
			type = "video",
		},
		{
			text = "tutorial_pushing_text_02",
			type = "text",
			inputs = {
				"action_one",
			},
		},
		display_name = "tutorial_pushing_header",
	},
	ranged_attacks_01 = {
		{
			path = "tutorial_ranged_attacks_01",
			type = "video",
		},
		{
			text = "tutorial_ranged_attacks_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_two",
			},
		},
		display_name = "tutorial_ranged_attacks_header",
	},
	ranged_attacks_02 = {
		{
			texture = "tutorial_ranged_attacks_02",
			type = "image",
		},
		{
			text = "tutorial_ranged_attacks_text_02",
			type = "text",
		},
		display_name = "tutorial_ranged_attacks_header",
	},
	career_ability_01 = {
		{
			path = "tutorial_career_ability_01",
			type = "video",
		},
		{
			text = "tutorial_career_ability_text_01",
			type = "text",
			inputs = {
				"action_career",
			},
			condition_func = not_gamepad_active,
		},
		{
			text = "tutorial_career_ability_text_01",
			type = "text",
			inputs = {
				"ability",
			},
			condition_func = gamepad_active,
		},
		display_name = "tutorial_career_ability_header",
	},
	career_ability_02 = {
		{
			texture = "tutorial_career_ability_02_console",
			type = "image",
		},
		{
			text = "tutorial_career_ability_text_02",
			type = "text",
		},
		display_name = "tutorial_career_ability_header",
	},
	dodging = {
		{
			path = "tutorial_dodging_01",
			type = "video",
		},
		{
			text = "tutorial_dodging_text_01",
			type = "text",
			inputs = {
				"dodge_hold",
			},
			condition_func = not_gamepad_active,
		},
		{
			text = "tutorial_dodging_text_01",
			type = "text",
			inputs = {
				"dodge_1",
			},
			condition_func = gamepad_active,
		},
		display_name = "tutorial_dodging_header",
	},
	healing_01 = {
		{
			texture = "tutorial_healing_01",
			type = "image",
		},
		{
			text = "tutorial_healing_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_two",
			},
		},
		display_name = "tutorial_healing_header",
	},
	healing_02 = {
		{
			texture = "tutorial_healing_02",
			type = "image",
		},
		{
			text = "tutorial_healing_text_02",
			type = "text",
			inputs = {
				"action_one",
				"action_two",
			},
		},
		display_name = "tutorial_healing_header",
	},
	health_and_stamina_01 = {
		{
			texture = "tutorial_health_and_stamina_01_console",
			type = "image",
		},
		{
			text = "tutorial_health_stamina_text_01",
			type = "text",
		},
		display_name = "tutorial_health_stamina_header",
	},
	health_and_stamina_02 = {
		{
			texture = "tutorial_health_and_stamina_02",
			type = "image",
		},
		{
			text = "tutorial_health_stamina_text_02",
			type = "text",
		},
		display_name = "tutorial_health_stamina_header",
	},
	knockdowns_wounds_01 = {
		{
			path = "tutorial_knockdowns_01",
			type = "video",
		},
		{
			text = "tutorial_knockdowns_wounds_text_01",
			type = "text",
			inputs = {
				"interact",
			},
		},
		display_name = "tutorial_knockdowns_wounds_header",
	},
	knockdowns_wounds_02 = {
		{
			texture = "tutorial_knockdowns_02",
			type = "image",
		},
		{
			text = "tutorial_knockdowns_wounds_text_02",
			type = "text",
		},
		display_name = "tutorial_knockdowns_wounds_header",
	},
	knockdowns_wounds_03 = {
		{
			path = "tutorial_knockdowns_03",
			type = "video",
		},
		{
			text = "tutorial_knockdowns_wounds_text_03",
			type = "text",
		},
		display_name = "tutorial_knockdowns_wounds_header",
	},
	hot_bar = {
		{
			texture = "tutorial_hot_bar_01_console",
			type = "image",
			condition_func = function ()
				return UIUtils.use_gamepad_hud_layout()
			end,
		},
		{
			texture = "tutorial_hot_bar_01_pc",
			type = "image",
			condition_func = function ()
				return not UIUtils.use_gamepad_hud_layout()
			end,
		},
		{
			text = "tutorial_hot_bar_text_01",
			type = "text",
			inputs = {
				"wield_switch_1",
			},
		},
		display_name = "tutorial_hot_bar_header",
	},
	bombs_01 = {
		{
			path = "tutorial_bombs_01",
			type = "video",
		},
		{
			text = "tutorial_bombs_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_two",
			},
		},
		display_name = "tutorial_bombs_header",
	},
	bombs_02 = {
		{
			texture = "tutorial_bombs_02",
			type = "image",
		},
		{
			text = "tutorial_bombs_text_02",
			type = "text",
		},
		display_name = "tutorial_bombs_header",
	},
	potions_01 = {
		{
			path = "tutorial_potions_01",
			type = "video",
		},
		{
			text = "tutorial_potions_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_two",
			},
		},
		display_name = "tutorial_potions_header",
	},
	potions_02 = {
		{
			texture = "tutorial_potions_02",
			type = "image",
		},
		{
			text = "tutorial_potions_text_02",
			type = "text",
		},
		display_name = "tutorial_potions_header",
	},
	tutorial_introduction_01 = {
		{
			texture = "tutorial_introduction_01",
			type = "image",
		},
		{
			text = "tutorial_introduction_text_01",
			type = "text",
		},
		display_name = "tutorial_introduction_header",
	},
	tutorial_introduction_02 = {
		{
			texture = "tutorial_introduction_02",
			type = "image",
		},
		{
			text = "tutorial_introduction_text_02",
			type = "text",
		},
		display_name = "tutorial_introduction_header",
	},
	tutorial_introduction_03 = {
		{
			texture = "tutorial_introduction_03",
			type = "image",
		},
		{
			text = "tutorial_introduction_text_03",
			type = "text",
		},
		display_name = "tutorial_introduction_header",
	},
	loadouts_01 = {
		{
			path = "tutorial_loadouts_01",
			type = "video",
		},
		{
			text = "tutorial_loadouts_text_01",
			type = "text",
		},
		display_name = "tutorial_loadouts_header",
	},
	loadouts_02 = {
		{
			texture = "tutorial_loadouts_02",
			type = "image",
		},
		{
			text = "tutorial_loadouts_text_02",
			type = "text",
		},
		display_name = "tutorial_loadouts_header",
	},
	objectives_01 = {
		{
			texture = "tutorial_objectives_01",
			type = "image",
		},
		{
			text = "tutorial_objectives_text_01",
			type = "text",
		},
		display_name = "tutorial_objectives_header",
	},
	objectives_02 = {
		{
			texture = "tutorial_objectives_02",
			type = "image",
		},
		{
			text = "tutorial_objectives_text_02",
			type = "text",
		},
		display_name = "tutorial_objectives_header",
	},
	objectives_03 = {
		{
			texture = "tutorial_objectives_03",
			type = "image",
		},
		{
			text = "tutorial_objectives_text_03",
			type = "text",
		},
		display_name = "tutorial_objectives_header",
	},
	pactsworn_movement_01 = {
		{
			path = "tutorial_pactsworn_movement_01",
			type = "video",
		},
		{
			text = "tutorial_pactsworn_movement_text_01",
			type = "text",
			inputs = {
				"move_forward",
				"move_left",
				"move_back",
				"move_right",
				"jump_1",
			},
		},
		display_name = "tutorial_pactsworn_movement_header",
	},
	pactsworn_movement_02 = {
		{
			path = "tutorial_pactsworn_movement_02",
			type = "video",
		},
		{
			text = "tutorial_pactsworn_movement_text_02",
			type = "text",
			inputs = {
				"interact",
			},
		},
		display_name = "tutorial_pactsworn_movement_header",
	},
	ghost_mode_01 = {
		{
			path = "tutorial_ghost_mode_01",
			type = "video",
		},
		{
			text = "tutorial_ghostmode_text_01",
			type = "text",
			inputs = {
				"ghost_mode_exit",
			},
		},
		display_name = "tutorial_ghostmode_header",
	},
	ghost_mode_02 = {
		{
			texture = "tutorial_ghost_mode_02",
			type = "image",
		},
		{
			text = "tutorial_ghostmode_text_02",
			type = "text",
		},
		display_name = "tutorial_ghostmode_header",
	},
	poison_wind_globadier_01 = {
		{
			path = "tutorial_globadier_01",
			type = "video",
		},
		{
			text = "tutorial_poisonwindglobadier_text_01",
			type = "text",
			inputs = {
				"action_one",
			},
		},
		display_name = "tutorial_poisonwindglobadier_header",
	},
	poison_wind_globadier_02 = {
		{
			texture = "tutorial_globadier_02",
			type = "image",
		},
		{
			text = "tutorial_poisonwindglobadier_text_02",
			type = "text",
		},
		display_name = "tutorial_poisonwindglobadier_header",
	},
	tutorial_gutterrunner_01 = {
		{
			path = "tutorial_gutter_runner_01",
			type = "video",
		},
		{
			text = "tutorial_gutterrunner_text_01",
			type = "text",
			inputs = {
				"action_one",
			},
		},
		display_name = "tutorial_gutterrunner_header",
	},
	tutorial_gutterrunner_02 = {
		{
			texture = "tutorial_gutter_runner_02",
			type = "image",
		},
		{
			text = "tutorial_gutterrunner_text_02",
			type = "text",
		},
		display_name = "tutorial_gutterrunner_header",
	},
	tutorial_gutterrunner_03 = {
		{
			path = "tutorial_gutter_runner_03",
			type = "video",
		},
		{
			text = "tutorial_gutterrunner_text_03",
			type = "text",
			inputs = {
				"weapon_reload",
			},
			condition_func = not_gamepad_active,
		},
		{
			text = "tutorial_gutterrunner_text_03",
			type = "text",
			inputs = {
				"weapon_reload_input",
			},
			condition_func = gamepad_active,
		},
		display_name = "tutorial_gutterrunner_header",
	},
	packmaster_01 = {
		{
			path = "tutorial_packmaster_01",
			type = "video",
		},
		{
			text = "tutorial_packmaster_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_one",
			},
		},
		display_name = "tutorial_packmaster_header",
	},
	packmaster_02 = {
		{
			texture = "tutorial_packmaster_02",
			type = "image",
		},
		{
			text = "tutorial_packmaster_text_02",
			type = "text",
		},
		display_name = "tutorial_packmaster_header",
	},
	ratling_gunner_01 = {
		{
			path = "tutorial_ratling_gunner_01",
			type = "video",
		},
		{
			text = "tutorial_ratling_gunner_text_01",
			type = "text",
			inputs = {
				"action_one",
				"weapon_reload",
			},
			condition_func = not_gamepad_active,
		},
		{
			text = "tutorial_ratling_gunner_text_01",
			type = "text",
			inputs = {
				"action_one",
				"weapon_reload_input",
			},
			condition_func = gamepad_active,
		},
		display_name = "tutorial_ratling_gunner_header",
	},
	ratling_gunner_02 = {
		{
			texture = "tutorial_ratling_gunner_02",
			type = "image",
		},
		{
			text = "tutorial_ratling_gunner_text_02",
			type = "text",
		},
		display_name = "tutorial_ratling_gunner_header",
	},
	warpfire_thrower_01 = {
		{
			path = "tutorial_warpfire_thrower_01",
			type = "video",
		},
		{
			text = "tutorial_warpfire_thrower_text_01",
			type = "text",
			inputs = {
				"action_one",
				"weapon_reload",
			},
			condition_func = not_gamepad_active,
		},
		{
			text = "tutorial_warpfire_thrower_text_01",
			type = "text",
			inputs = {
				"action_one",
				"weapon_reload_input",
			},
			condition_func = gamepad_active,
		},
		display_name = "tutorial_warpfire_thrower_header",
	},
	warpfire_thrower_03 = {
		{
			texture = "tutorial_warpfire_thrower_03",
			type = "image",
		},
		{
			text = "tutorial_warpfire_thrower_text_03",
			type = "text",
		},
		display_name = "tutorial_warpfire_thrower_header",
	},
	bile_troll_01 = {
		{
			path = "tutorial_bile_troll_01",
			type = "video",
		},
		{
			text = "tutorial_biletroll_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_one",
			},
		},
		display_name = "tutorial_biletroll_header",
	},
	bile_troll_02 = {
		{
			path = "tutorial_bile_troll_02",
			type = "video",
		},
		{
			text = "tutorial_biletroll_text_02",
			type = "text",
			inputs = {
				"action_two",
			},
		},
		display_name = "tutorial_biletroll_header",
	},
	bile_troll_03 = {
		{
			texture = "tutorial_playable_monsters_01",
			type = "image",
		},
		{
			text = "tutorial_biletroll_text_03",
			type = "text",
		},
		display_name = "tutorial_biletroll_header",
	},
	playing_as_monsters_01 = {
		{
			texture = "tutorial_playable_monsters_01",
			type = "image",
		},
		{
			text = "tutorial_playing_as_monsters_text_01",
			type = "text",
		},
		display_name = "tutorial_playing_as_monsters_header",
	},
	playing_as_monsters_02 = {
		{
			texture = "tutorial_playable_monsters_01",
			type = "image",
		},
		{
			text = "tutorial_playing_as_monsters_text_02",
			type = "text",
		},
		display_name = "tutorial_playing_as_monsters_header",
	},
	playing_as_monsters_03 = {
		{
			path = "tutorial_playable_monsters_03",
			type = "video",
		},
		{
			text = "tutorial_playing_as_monsters_text_03",
			type = "text",
		},
		display_name = "tutorial_playing_as_monsters_header",
	},
	versus_tagging_01 = {
		{
			texture = "tutorial_tagging_01",
			type = "image",
		},
		{
			text = "tutorial_versus_tagging_text_01",
			type = "text",
			inputs = {
				"ping",
				"ping",
				"ping",
			},
		},
		display_name = "tutorial_versus_tagging_header",
	},
	versus_tagging_02 = {
		{
			texture = "tutorial_tagging_02",
			type = "image",
		},
		{
			text = "tutorial_versus_tagging_text_02",
			type = "text",
			inputs = {
				"ping",
				"ping",
			},
		},
		display_name = "tutorial_versus_tagging_header",
	},
	tutorial_hordeability_01 = {
		{
			path = "tutorial_horde_ability_01",
			type = "video",
		},
		{
			text = "tutorial_hordeability_text_01",
			type = "text",
			inputs = {
				"versus_horde_ability",
			},
		},
		display_name = "tutorial_hordeability_header",
	},
	tutorial_hordeability_02 = {
		{
			texture = "tutorial_horde_ability_02",
			type = "image",
		},
		{
			text = "tutorial_hordeability_text_02",
			type = "text",
		},
		display_name = "tutorial_hordeability_header",
	},
	tutorial_rat_ogre_01 = {
		{
			path = "tutorial_rat_ogre_01",
			type = "video",
		},
		{
			text = "tutorial_rat_ogre_text_01",
			type = "text",
			inputs = {
				"action_one",
				"action_one",
			},
		},
		display_name = "tutorial_rat_ogre_header",
	},
	tutorial_rat_ogre_02 = {
		{
			path = "tutorial_rat_ogre_02",
			type = "video",
		},
		{
			text = "tutorial_rat_ogre_text_02",
			type = "text",
			inputs = {
				"action_two",
			},
		},
		display_name = "tutorial_rat_ogre_header",
	},
	tutorial_rat_ogre_03 = {
		{
			texture = "tutorial_rat_ogre_03",
			type = "image",
		},
		{
			text = "tutorial_rat_ogre_text_03",
			type = "text",
		},
		display_name = "tutorial_rat_ogre_header",
	},
}
