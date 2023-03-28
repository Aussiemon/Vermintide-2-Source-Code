local all_curses = {
	nurgle = {
		"curse_corrupted_flesh",
		"curse_rotten_miasma",
		"curse_skulking_sorcerer"
	},
	tzeentch = {
		"curse_change_of_tzeentch",
		"curse_bolt_of_change",
		"curse_egg_of_tzeentch"
	},
	khorne = {
		"curse_skulls_of_fury",
		"curse_khorne_champions",
		"curse_blood_storm"
	},
	slaanesh = {
		"curse_greed_pinata",
		"curse_empathy",
		"curse_abundance_of_life"
	},
	belakor = {
		"curse_shadow_homing_skulls",
		"curse_belakor_totems"
	}
}
local default_config = {
	CURSES_HOT_SPOT_MAX_RANGE = 0.3,
	CURSES_HOT_SPOTS_MAX_COUNT = 1,
	CURSES_HOT_SPOT_MIN_RANGE = 0.2,
	CURSES_MIN_PROGRESS = 0.35,
	ARENA_BELAKOR_SHOWS_UP_IN_DEPTH = 2,
	CURSES_HOT_SPOTS_MIN_COUNT = 1,
	MINOR_MODIFIABLE_MIN_PROGRESS = -0.1,
	POWER_UP_LOOKAHEAD = 2,
	MINOR_MODIFIABLE_NODE_CHANCE = 1,
	AVAILABLE_GODS = {
		"nurgle",
		"tzeentch",
		"khorne",
		"slaanesh"
	},
	AVAILABLE_CURSES = {
		SIGNATURE = all_curses,
		TRAVEL = all_curses,
		ARENA = {
			nurgle = {
				"curse_corrupted_flesh",
				"curse_rotten_miasma"
			},
			tzeentch = {
				"curse_change_of_tzeentch",
				"curse_bolt_of_change"
			},
			khorne = {
				"curse_skulls_of_fury",
				"curse_khorne_champions"
			},
			slaanesh = {
				"curse_empathy"
			},
			belakor = {}
		}
	},
	CURSEABLE_NODE_TYPES = {
		"SIGNATURE",
		"TRAVEL",
		"ARENA"
	},
	MUTATORS = {
		SIGNATURE = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak"
		},
		TRAVEL = {
			"deus_pacing_tweak",
			"deus_difficulty_tweak",
			"easier_hordes"
		},
		SHOP = {},
		ARENA = {},
		START = {}
	},
	AVAILABLE_MINOR_MODIFIERS = {
		{
			"deus_less_monsters",
			"deus_more_hordes"
		},
		{
			"deus_less_monsters",
			"deus_more_specials"
		},
		{
			"deus_less_monsters",
			"deus_more_roamers"
		},
		{
			"deus_less_monsters",
			"deus_more_elites"
		},
		{
			"deus_less_specials",
			"deus_more_hordes"
		},
		{
			"deus_less_specials",
			"deus_more_monsters"
		},
		{
			"deus_less_specials",
			"deus_more_roamers"
		},
		{
			"deus_less_specials",
			"deus_more_elites"
		},
		{
			"deus_less_hordes",
			"deus_more_specials"
		},
		{
			"deus_less_hordes",
			"deus_more_monsters"
		},
		{
			"deus_less_hordes",
			"deus_more_roamers"
		},
		{
			"deus_less_hordes",
			"deus_more_elites"
		},
		{
			"deus_less_roamers",
			"deus_more_specials"
		},
		{
			"deus_less_roamers",
			"deus_more_monsters"
		},
		{
			"deus_less_roamers",
			"deus_more_hordes"
		},
		{
			"deus_less_roamers",
			"deus_more_elites"
		},
		{
			"deus_less_elites",
			"deus_more_specials"
		},
		{
			"deus_less_elites",
			"deus_more_monsters"
		},
		{
			"deus_less_elites",
			"deus_more_hordes"
		},
		{
			"deus_less_elites",
			"deus_more_roamers"
		},
		{
			"increased_deus_potions"
		}
	},
	MINOR_MODIFIABLE_NODE_TYPES = {
		"SIGNATURE",
		"TRAVEL"
	},
	MINOR_MODIFIER_VALIDATORS = {
		"prevent_modifier_on_curse_abundance_of_life"
	},
	DEUS_CHEST_GRANTABLE_NODE_TYPES = {
		"SIGNATURE",
		"TRAVEL"
	},
	CONFLICT_DIRECTORS = {
		default = {
			"deus_skaven_chaos",
			"deus_skaven_beastmen"
		}
	},
	LEVEL_ALIAS = {
		sig_snare_wastes_path3 = "sig_snare_c_wastes_path1",
		sig_snare_wastes_path2 = "sig_snare_b_wastes_path1",
		sig_snare_nurgle_path1 = "sig_snare_a_nurgle_path1",
		sig_snare_wastes_path1 = "sig_snare_a_wastes_path1",
		sig_snare_nurgle_path5 = "sig_snare_e_nurgle_path1",
		sig_snare_khorne_path2 = "sig_snare_b_khorne_path1",
		sig_snare_slaanesh_path5 = "sig_snare_e_slaanesh_path1",
		sig_snare_belakor_path2 = "sig_snare_b_belakor_path1",
		sig_snare_nurgle_path3 = "sig_snare_c_nurgle_path1",
		sig_snare_slaanesh_path1 = "sig_snare_a_slaanesh_path1",
		sig_snare_nurgle_path4 = "sig_snare_d_nurgle_path1",
		sig_snare_khorne_path3 = "sig_snare_c_khorne_path1",
		sig_snare_slaanesh_path2 = "sig_snare_b_slaanesh_path1",
		sig_snare_tzeentch_path3 = "sig_snare_c_tzeentch_path1",
		sig_snare_nurgle_path2 = "sig_snare_b_nurgle_path1",
		sig_snare_slaanesh_path3 = "sig_snare_c_slaanesh_path1",
		sig_snare_slaanesh_path4 = "sig_snare_d_slaanesh_path1",
		sig_snare_khorne_path4 = "sig_snare_d_khorne_path1",
		sig_snare_wastes_path5 = "sig_snare_e_wastes_path1",
		sig_snare_tzeentch_path2 = "sig_snare_b_tzeentch_path1",
		arena_belakor_belakor_path1 = "arena_belakor",
		sig_snare_belakor_path5 = "sig_snare_e_belakor_path1",
		sig_snare_belakor_path3 = "sig_snare_c_belakor_path1",
		sig_snare_khorne_path5 = "sig_snare_e_khorne_path1",
		sig_snare_belakor_path4 = "sig_snare_d_belakor_path1",
		sig_snare_tzeentch_path1 = "sig_snare_a_tzeentch_path1",
		sig_snare_tzeentch_path5 = "sig_snare_e_tzeentch_path1",
		sig_snare_tzeentch_path4 = "sig_snare_d_tzeentch_path1",
		sig_snare_wastes_path4 = "sig_snare_d_wastes_path1",
		sig_snare_belakor_path1 = "sig_snare_a_belakor_path1",
		sig_snare_khorne_path1 = "sig_snare_a_khorne_path1"
	},
	LEVEL_AVAILABILITY = {},
	LEVEL_VALIDATIONS = {
		SIGNATURE = {
			"prevent_same_level_choice"
		},
		TRAVEL = {
			"prevent_same_level_choice"
		},
		SHOP = {
			"prevent_same_level_choice"
		},
		ARENA = {},
		START = {}
	},
	LEVEL_SHUFFLERS = {
		"lower_priority_of_already_used_levels_on_path"
	},
	LABEL_OVERRIDES = {},
	TERROR_POWER_UPS = {
		{
			"attack_speed",
			"rare"
		},
		{
			"stamina",
			"rare"
		},
		{
			"crit_chance",
			"rare"
		},
		{
			"push_block_arc",
			"rare"
		},
		{
			"ability_cooldown_reduction",
			"rare"
		},
		{
			"crit_boost",
			"rare"
		},
		{
			"power_vs_large",
			"rare"
		},
		{
			"health",
			"rare"
		},
		{
			"block_cost",
			"rare"
		},
		{
			"fatigue_regen",
			"rare"
		},
		{
			"movespeed",
			"rare"
		}
	}
}
DEUS_MAP_POPULATE_SETTINGS = {
	journey_ruin = table.clone(default_config)
}
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.MUTATORS = {
	SIGNATURE = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	TRAVEL = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak",
		"easier_hordes"
	},
	SHOP = {},
	ARENA = {},
	START = {}
}
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.CURSES_HOT_SPOTS_MIN_COUNT = 3
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.CURSES_HOT_SPOTS_MAX_COUNT = 5
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.CURSES_HOT_SPOT_MIN_RANGE = 0.1
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.CURSES_HOT_SPOT_MAX_RANGE = 0.3
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.CURSES_MIN_PROGRESS = 0.2
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.AVAILABLE_MINOR_MODIFIERS = {
	{
		"deus_less_monsters",
		"deus_more_hordes"
	},
	{
		"deus_less_monsters",
		"deus_more_specials"
	},
	{
		"deus_less_monsters",
		"deus_more_roamers"
	},
	{
		"deus_less_monsters",
		"deus_more_elites"
	},
	{
		"deus_less_specials",
		"deus_more_hordes"
	},
	{
		"deus_less_specials",
		"deus_more_monsters"
	},
	{
		"deus_less_specials",
		"deus_more_roamers"
	},
	{
		"deus_less_specials",
		"deus_more_elites"
	},
	{
		"deus_less_hordes",
		"deus_more_specials"
	},
	{
		"deus_less_hordes",
		"deus_more_monsters"
	},
	{
		"deus_less_hordes",
		"deus_more_roamers"
	},
	{
		"deus_less_hordes",
		"deus_more_elites"
	},
	{
		"deus_less_roamers",
		"deus_more_specials"
	},
	{
		"deus_less_roamers",
		"deus_more_monsters"
	},
	{
		"deus_less_roamers",
		"deus_more_hordes"
	},
	{
		"deus_less_roamers",
		"deus_more_elites"
	},
	{
		"deus_less_elites",
		"deus_more_specials"
	},
	{
		"deus_less_elites",
		"deus_more_monsters"
	},
	{
		"deus_less_elites",
		"deus_more_hordes"
	},
	{
		"deus_less_elites",
		"deus_more_roamers"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_specials"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_monsters"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_elites"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_hordes"
	},
	{
		"increased_healing",
		"deus_more_monsters"
	},
	{
		"increased_healing",
		"deus_more_specials"
	},
	{
		"increased_healing",
		"deus_more_elites"
	},
	{
		"increased_healing",
		"deus_more_hordes"
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_ruin.LEVEL_AVAILABILITY = {
	TRAVEL = {
		pat_forest = {
			themes = DEUS_LEVEL_SETTINGS.pat_forest.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_forest.paths
		},
		pat_town = {
			themes = DEUS_LEVEL_SETTINGS.pat_town.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_town.paths
		},
		pat_mountain = {
			themes = DEUS_LEVEL_SETTINGS.pat_mountain.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mountain.paths
		},
		pat_mines = {
			themes = DEUS_LEVEL_SETTINGS.pat_mines.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mines.paths
		},
		pat_tower = {
			themes = DEUS_LEVEL_SETTINGS.pat_tower.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_tower.paths
		},
		pat_bay = {
			themes = DEUS_LEVEL_SETTINGS.pat_bay.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_bay.paths
		}
	},
	SIGNATURE = {
		sig_mordrek = {
			themes = DEUS_LEVEL_SETTINGS.sig_mordrek.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_mordrek.paths
		},
		sig_gorge = {
			themes = DEUS_LEVEL_SETTINGS.sig_gorge.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_gorge.paths
		},
		sig_volcano = {
			themes = DEUS_LEVEL_SETTINGS.sig_volcano.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_volcano.paths
		},
		sig_snare = {
			themes = {
				DEUS_THEME_TYPES.KHORNE,
				DEUS_THEME_TYPES.NURGLE,
				DEUS_THEME_TYPES.SLAANESH,
				DEUS_THEME_TYPES.TZEENTCH,
				DEUS_THEME_TYPES.BELAKOR,
				DEUS_THEME_TYPES.WASTES
			},
			paths = {
				1,
				2,
				3,
				4,
				5
			}
		},
		sig_crag = {
			themes = DEUS_LEVEL_SETTINGS.sig_crag.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_crag.paths
		}
	},
	ARENA = {
		arena_ruin = {
			themes = DEUS_LEVEL_SETTINGS.arena_ruin.themes,
			paths = DEUS_LEVEL_SETTINGS.arena_ruin.paths
		}
	},
	SHOP = {
		shop_strife = {
			themes = {},
			paths = {}
		},
		shop_harmony = {
			themes = {},
			paths = {}
		},
		shop_fortune = {
			themes = {},
			paths = {}
		}
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_cave = table.clone(default_config)
DEUS_MAP_POPULATE_SETTINGS.journey_cave.MUTATORS = {
	SIGNATURE = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	TRAVEL = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	SHOP = {},
	ARENA = {},
	START = {}
}
DEUS_MAP_POPULATE_SETTINGS.journey_cave.CURSES_HOT_SPOTS_MIN_COUNT = 4
DEUS_MAP_POPULATE_SETTINGS.journey_cave.CURSES_HOT_SPOTS_MAX_COUNT = 6
DEUS_MAP_POPULATE_SETTINGS.journey_cave.CURSES_HOT_SPOT_MIN_RANGE = 0.1
DEUS_MAP_POPULATE_SETTINGS.journey_cave.CURSES_HOT_SPOT_MAX_RANGE = 0.2
DEUS_MAP_POPULATE_SETTINGS.journey_cave.CURSES_MIN_PROGRESS = 0.2
DEUS_MAP_POPULATE_SETTINGS.journey_cave.AVAILABLE_MINOR_MODIFIERS = {
	{
		"deus_less_monsters",
		"deus_more_hordes"
	},
	{
		"deus_less_monsters",
		"deus_more_specials"
	},
	{
		"deus_less_monsters",
		"deus_more_roamers"
	},
	{
		"deus_less_monsters",
		"deus_more_elites"
	},
	{
		"deus_less_specials",
		"deus_more_hordes"
	},
	{
		"deus_less_specials",
		"deus_more_monsters"
	},
	{
		"deus_less_specials",
		"deus_more_roamers"
	},
	{
		"deus_less_specials",
		"deus_more_elites"
	},
	{
		"deus_less_hordes",
		"deus_more_specials"
	},
	{
		"deus_less_hordes",
		"deus_more_monsters"
	},
	{
		"deus_less_hordes",
		"deus_more_roamers"
	},
	{
		"deus_less_hordes",
		"deus_more_elites"
	},
	{
		"deus_less_roamers",
		"deus_more_specials"
	},
	{
		"deus_less_roamers",
		"deus_more_monsters"
	},
	{
		"deus_less_roamers",
		"deus_more_hordes"
	},
	{
		"deus_less_roamers",
		"deus_more_elites"
	},
	{
		"deus_less_elites",
		"deus_more_specials"
	},
	{
		"deus_less_elites",
		"deus_more_monsters"
	},
	{
		"deus_less_elites",
		"deus_more_hordes"
	},
	{
		"deus_less_elites",
		"deus_more_roamers"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_specials"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_monsters"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_elites"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_hordes"
	},
	{
		"increased_healing",
		"deus_more_monsters"
	},
	{
		"increased_healing",
		"deus_more_specials"
	},
	{
		"increased_healing",
		"deus_more_elites"
	},
	{
		"increased_healing",
		"deus_more_hordes"
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_cave.LEVEL_AVAILABILITY = {
	TRAVEL = {
		pat_forest = {
			themes = DEUS_LEVEL_SETTINGS.pat_forest.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_forest.paths
		},
		pat_town = {
			themes = DEUS_LEVEL_SETTINGS.pat_town.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_town.paths
		},
		pat_mountain = {
			themes = DEUS_LEVEL_SETTINGS.pat_mountain.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mountain.paths
		},
		pat_mines = {
			themes = DEUS_LEVEL_SETTINGS.pat_mines.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mines.paths
		},
		pat_tower = {
			themes = DEUS_LEVEL_SETTINGS.pat_tower.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_tower.paths
		},
		pat_bay = {
			themes = DEUS_LEVEL_SETTINGS.pat_bay.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_bay.paths
		}
	},
	SIGNATURE = {
		sig_mordrek = {
			themes = DEUS_LEVEL_SETTINGS.sig_mordrek.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_mordrek.paths
		},
		sig_gorge = {
			themes = DEUS_LEVEL_SETTINGS.sig_gorge.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_gorge.paths
		},
		sig_volcano = {
			themes = DEUS_LEVEL_SETTINGS.sig_volcano.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_volcano.paths
		},
		sig_snare = {
			themes = {
				DEUS_THEME_TYPES.KHORNE,
				DEUS_THEME_TYPES.NURGLE,
				DEUS_THEME_TYPES.SLAANESH,
				DEUS_THEME_TYPES.TZEENTCH,
				DEUS_THEME_TYPES.BELAKOR,
				DEUS_THEME_TYPES.WASTES
			},
			paths = {
				1,
				2,
				3,
				4,
				5
			}
		},
		sig_crag = {
			themes = DEUS_LEVEL_SETTINGS.sig_crag.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_crag.paths
		}
	},
	ARENA = {
		arena_cave = {
			themes = DEUS_LEVEL_SETTINGS.arena_cave.themes,
			paths = DEUS_LEVEL_SETTINGS.arena_cave.paths
		}
	},
	SHOP = {
		shop_strife = {
			themes = {},
			paths = {}
		},
		shop_harmony = {
			themes = {},
			paths = {}
		},
		shop_fortune = {
			themes = {},
			paths = {}
		}
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_ice = table.clone(default_config)
DEUS_MAP_POPULATE_SETTINGS.journey_ice.MUTATORS = {
	SIGNATURE = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	TRAVEL = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	SHOP = {},
	ARENA = {},
	START = {}
}
DEUS_MAP_POPULATE_SETTINGS.journey_ice.CURSES_HOT_SPOTS_MIN_COUNT = 5
DEUS_MAP_POPULATE_SETTINGS.journey_ice.CURSES_HOT_SPOTS_MAX_COUNT = 7
DEUS_MAP_POPULATE_SETTINGS.journey_ice.CURSES_HOT_SPOT_MIN_RANGE = 0.1
DEUS_MAP_POPULATE_SETTINGS.journey_ice.CURSES_HOT_SPOT_MAX_RANGE = 0.2
DEUS_MAP_POPULATE_SETTINGS.journey_ice.CURSES_MIN_PROGRESS = 0.01
DEUS_MAP_POPULATE_SETTINGS.journey_ice.AVAILABLE_MINOR_MODIFIERS = {
	{
		"deus_less_monsters",
		"deus_more_hordes"
	},
	{
		"deus_less_monsters",
		"deus_more_specials"
	},
	{
		"deus_less_monsters",
		"deus_more_roamers"
	},
	{
		"deus_less_monsters",
		"deus_more_elites"
	},
	{
		"deus_less_specials",
		"deus_more_hordes"
	},
	{
		"deus_less_specials",
		"deus_more_monsters"
	},
	{
		"deus_less_specials",
		"deus_more_roamers"
	},
	{
		"deus_less_specials",
		"deus_more_elites"
	},
	{
		"deus_less_hordes",
		"deus_more_specials"
	},
	{
		"deus_less_hordes",
		"deus_more_monsters"
	},
	{
		"deus_less_hordes",
		"deus_more_roamers"
	},
	{
		"deus_less_hordes",
		"deus_more_elites"
	},
	{
		"deus_less_roamers",
		"deus_more_specials"
	},
	{
		"deus_less_roamers",
		"deus_more_monsters"
	},
	{
		"deus_less_roamers",
		"deus_more_hordes"
	},
	{
		"deus_less_roamers",
		"deus_more_elites"
	},
	{
		"deus_less_elites",
		"deus_more_specials"
	},
	{
		"deus_less_elites",
		"deus_more_monsters"
	},
	{
		"deus_less_elites",
		"deus_more_hordes"
	},
	{
		"deus_less_elites",
		"deus_more_roamers"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_specials"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_monsters"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_elites"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_hordes"
	},
	{
		"increased_healing",
		"deus_more_monsters"
	},
	{
		"increased_healing",
		"deus_more_specials"
	},
	{
		"increased_healing",
		"deus_more_elites"
	},
	{
		"increased_healing",
		"deus_more_hordes"
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_ice.LEVEL_AVAILABILITY = {
	TRAVEL = {
		pat_forest = {
			themes = DEUS_LEVEL_SETTINGS.pat_forest.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_forest.paths
		},
		pat_town = {
			themes = DEUS_LEVEL_SETTINGS.pat_town.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_town.paths
		},
		pat_mountain = {
			themes = DEUS_LEVEL_SETTINGS.pat_mountain.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mountain.paths
		},
		pat_mines = {
			themes = DEUS_LEVEL_SETTINGS.pat_mines.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mines.paths
		},
		pat_tower = {
			themes = DEUS_LEVEL_SETTINGS.pat_tower.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_tower.paths
		},
		pat_bay = {
			themes = DEUS_LEVEL_SETTINGS.pat_bay.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_bay.paths
		}
	},
	SIGNATURE = {
		sig_mordrek = {
			themes = DEUS_LEVEL_SETTINGS.sig_mordrek.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_mordrek.paths
		},
		sig_gorge = {
			themes = DEUS_LEVEL_SETTINGS.sig_gorge.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_gorge.paths
		},
		sig_volcano = {
			themes = DEUS_LEVEL_SETTINGS.sig_volcano.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_volcano.paths
		},
		sig_snare = {
			themes = {
				DEUS_THEME_TYPES.KHORNE,
				DEUS_THEME_TYPES.NURGLE,
				DEUS_THEME_TYPES.SLAANESH,
				DEUS_THEME_TYPES.TZEENTCH,
				DEUS_THEME_TYPES.BELAKOR,
				DEUS_THEME_TYPES.WASTES
			},
			paths = {
				1,
				2,
				3,
				4,
				5
			}
		},
		sig_crag = {
			themes = DEUS_LEVEL_SETTINGS.sig_crag.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_crag.paths
		}
	},
	ARENA = {
		arena_ice = {
			themes = DEUS_LEVEL_SETTINGS.arena_ice.themes,
			paths = DEUS_LEVEL_SETTINGS.arena_ice.paths
		}
	},
	SHOP = {
		shop_strife = {
			themes = {},
			paths = {}
		},
		shop_harmony = {
			themes = {},
			paths = {}
		},
		shop_fortune = {
			themes = {},
			paths = {}
		}
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_citadel = table.clone(default_config)
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.SPECIFIC_SIGNATURE_LEVEL = "sig_citadel"
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.LABEL_OVERRIDES = {
	"last_signature_level_is_specific_level"
}
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.MUTATORS = {
	SIGNATURE = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	TRAVEL = {
		"deus_pacing_tweak",
		"deus_difficulty_tweak"
	},
	SHOP = {},
	ARENA = {},
	START = {}
}
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.CURSES_HOT_SPOTS_MIN_COUNT = 5
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.CURSES_HOT_SPOTS_MAX_COUNT = 7
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.CURSES_HOT_SPOT_MIN_RANGE = 0.19
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.CURSES_HOT_SPOT_MAX_RANGE = 0.2
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.CURSES_MIN_PROGRESS = -0.1
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.AVAILABLE_MINOR_MODIFIERS = {
	{
		"deus_less_monsters",
		"deus_more_hordes"
	},
	{
		"deus_less_monsters",
		"deus_more_specials"
	},
	{
		"deus_less_monsters",
		"deus_more_roamers"
	},
	{
		"deus_less_monsters",
		"deus_more_elites"
	},
	{
		"deus_less_specials",
		"deus_more_hordes"
	},
	{
		"deus_less_specials",
		"deus_more_monsters"
	},
	{
		"deus_less_specials",
		"deus_more_roamers"
	},
	{
		"deus_less_specials",
		"deus_more_elites"
	},
	{
		"deus_less_hordes",
		"deus_more_specials"
	},
	{
		"deus_less_hordes",
		"deus_more_monsters"
	},
	{
		"deus_less_hordes",
		"deus_more_roamers"
	},
	{
		"deus_less_hordes",
		"deus_more_elites"
	},
	{
		"deus_less_roamers",
		"deus_more_specials"
	},
	{
		"deus_less_roamers",
		"deus_more_monsters"
	},
	{
		"deus_less_roamers",
		"deus_more_hordes"
	},
	{
		"deus_less_roamers",
		"deus_more_elites"
	},
	{
		"deus_less_elites",
		"deus_more_specials"
	},
	{
		"deus_less_elites",
		"deus_more_monsters"
	},
	{
		"deus_less_elites",
		"deus_more_hordes"
	},
	{
		"deus_less_elites",
		"deus_more_roamers"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_specials"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_monsters"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_elites"
	},
	{
		"increased_deus_soft_currency",
		"deus_more_hordes"
	},
	{
		"increased_healing",
		"deus_more_monsters"
	},
	{
		"increased_healing",
		"deus_more_specials"
	},
	{
		"increased_healing",
		"deus_more_elites"
	},
	{
		"increased_healing",
		"deus_more_hordes"
	}
}
DEUS_MAP_POPULATE_SETTINGS.journey_citadel.LEVEL_AVAILABILITY = {
	TRAVEL = {
		pat_forest = {
			themes = DEUS_LEVEL_SETTINGS.pat_forest.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_forest.paths
		},
		pat_town = {
			themes = DEUS_LEVEL_SETTINGS.pat_town.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_town.paths
		},
		pat_mountain = {
			themes = DEUS_LEVEL_SETTINGS.pat_mountain.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mountain.paths
		},
		pat_mines = {
			themes = DEUS_LEVEL_SETTINGS.pat_mines.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_mines.paths
		},
		pat_tower = {
			themes = DEUS_LEVEL_SETTINGS.pat_tower.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_tower.paths
		},
		pat_bay = {
			themes = DEUS_LEVEL_SETTINGS.pat_bay.themes,
			paths = DEUS_LEVEL_SETTINGS.pat_bay.paths
		}
	},
	SIGNATURE = {
		sig_mordrek = {
			themes = DEUS_LEVEL_SETTINGS.sig_mordrek.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_mordrek.paths
		},
		sig_gorge = {
			themes = DEUS_LEVEL_SETTINGS.sig_gorge.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_gorge.paths
		},
		sig_volcano = {
			themes = DEUS_LEVEL_SETTINGS.sig_volcano.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_volcano.paths
		},
		sig_snare = {
			themes = {
				DEUS_THEME_TYPES.KHORNE,
				DEUS_THEME_TYPES.NURGLE,
				DEUS_THEME_TYPES.SLAANESH,
				DEUS_THEME_TYPES.TZEENTCH,
				DEUS_THEME_TYPES.BELAKOR,
				DEUS_THEME_TYPES.WASTES
			},
			paths = {
				1,
				2,
				3,
				4,
				5
			}
		},
		sig_crag = {
			themes = DEUS_LEVEL_SETTINGS.sig_crag.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_crag.paths
		},
		sig_citadel = {
			themes = DEUS_LEVEL_SETTINGS.sig_citadel.themes,
			paths = DEUS_LEVEL_SETTINGS.sig_citadel.paths
		}
	},
	ARENA = {
		arena_citadel = {
			themes = DEUS_LEVEL_SETTINGS.arena_citadel.themes,
			paths = DEUS_LEVEL_SETTINGS.arena_citadel.paths
		}
	},
	SHOP = {
		shop_strife = {
			themes = {},
			paths = {}
		},
		shop_harmony = {
			themes = {},
			paths = {}
		},
		shop_fortune = {
			themes = {},
			paths = {}
		}
	}
}
