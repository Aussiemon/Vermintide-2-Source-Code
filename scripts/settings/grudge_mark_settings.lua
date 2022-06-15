BreedEnhancements = BreedEnhancements or {
	base = {
		base = {
			"grudge_mark_health",
			"grudge_mark_damage",
			"grudge_mark_stagger_distance_resistance",
			no_attribute = true
		}
	},
	boss = {
		warping = {
			"grudge_mark_warping",
			display_name = "display_name_warping"
		},
		intangible = {
			"grudge_mark_intangible",
			display_name = "display_name_intangible"
		},
		unstaggerable = {
			"grudge_mark_unstaggerable",
			display_name = "display_name_unstaggerable"
		},
		raging = {
			"grudge_mark_raging",
			display_name = "display_name_raging"
		},
		vampiric = {
			"grudge_mark_vampiric",
			display_name = "display_name_vampiric"
		},
		ranged_immune = {
			"grudge_mark_ranged_immune",
			display_name = "display_name_ranged_immune"
		},
		periodic_shield = {
			"grudge_mark_periodic_shield",
			display_name = "display_name_periodic_shield"
		},
		crippling = {
			"grudge_mark_crippling_blow",
			display_name = "display_name_crippling"
		},
		crushing = {
			"grudge_mark_crushing_blow",
			display_name = "display_name_crushing"
		},
		regenerating = {
			"grudge_mark_regeneratig",
			display_name = "display_name_regenerating"
		},
		intangible_mirror = {
			display_name = "display_name_intangible",
			dummy_enhancement = true
		},
		periodic_curse = {
			"grudge_mark_periodic_curse_aura",
			display_name = "display_name_periodic_curse"
		},
		commander = {
			"grudge_mark_commander",
			display_name = "display_name_commander"
		},
		frenzy = {
			"grudge_mark_frenzy",
			display_name = "display_name_frenzy"
		}
	}
}
BREED_ENHANCEMENTS_PER_DIFFICULTY = {
	normal = {
		[10.0] = 1
	},
	hard = {
		[0] = 1,
		[10.0] = 2
	},
	harder = {
		[-3.0] = 1,
		[10.0] = 3,
		[7.0] = 2
	},
	hardest = {
		[-3.0] = 2,
		[10.0] = 3,
		[-7.0] = 1
	},
	cataclysm = {
		[-3.0] = 2,
		[-10.0] = 1,
		[6.0] = 3
	},
	cataclysm_2 = {
		[6.0] = 3,
		[-10.0] = 1,
		[-7.0] = 2
	},
	cataclysm_3 = {
		[0] = 3,
		[-10.0] = 2
	},
	default = {}
}
BreedEnhancementExclusionList = {
	periodic_shield = {
		regenerating = true
	},
	crushing = {
		crippling = true
	},
	crippling = {
		crushing = true
	},
	intangible = {
		periodic_shield = true,
		warping = true
	}
}
BreedEnhancementBannedBreeds = {
	chaos_troll = {
		periodic_shield = true
	}
}
GrudgeMarkedNames = {
	skaven_rat_ogre = {
		"name_grudge_rat_ogre_001",
		"name_grudge_rat_ogre_002",
		"name_grudge_rat_ogre_003",
		"name_grudge_rat_ogre_004",
		"name_grudge_rat_ogre_005",
		"name_grudge_rat_ogre_006",
		"name_grudge_rat_ogre_007",
		"name_grudge_rat_ogre_008",
		"name_grudge_rat_ogre_009",
		"name_grudge_rat_ogre_010",
		"name_grudge_rat_ogre_011",
		"name_grudge_rat_ogre_012",
		"name_grudge_rat_ogre_013",
		"name_grudge_rat_ogre_014",
		"name_grudge_rat_ogre_015",
		"name_grudge_rat_ogre_016",
		"name_grudge_rat_ogre_017",
		"name_grudge_rat_ogre_018",
		"name_grudge_rat_ogre_019",
		"name_grudge_rat_ogre_020"
	},
	skaven_stormfiend = {
		"name_grudge_stormfiend_001",
		"name_grudge_stormfiend_002",
		"name_grudge_stormfiend_003",
		"name_grudge_stormfiend_004",
		"name_grudge_stormfiend_005",
		"name_grudge_stormfiend_006",
		"name_grudge_stormfiend_007",
		"name_grudge_stormfiend_008",
		"name_grudge_stormfiend_009",
		"name_grudge_stormfiend_010",
		"name_grudge_stormfiend_011",
		"name_grudge_stormfiend_012",
		"name_grudge_stormfiend_013",
		"name_grudge_stormfiend_014",
		"name_grudge_stormfiend_015",
		"name_grudge_stormfiend_016",
		"name_grudge_stormfiend_017",
		"name_grudge_stormfiend_018",
		"name_grudge_stormfiend_019",
		"name_grudge_stormfiend_020"
	},
	chaos_troll = {
		"name_grudge_troll_001",
		"name_grudge_troll_002",
		"name_grudge_troll_003",
		"name_grudge_troll_004",
		"name_grudge_troll_005",
		"name_grudge_troll_006",
		"name_grudge_troll_007",
		"name_grudge_troll_008",
		"name_grudge_troll_009",
		"name_grudge_troll_010",
		"name_grudge_troll_011",
		"name_grudge_troll_012",
		"name_grudge_troll_013",
		"name_grudge_troll_014",
		"name_grudge_troll_015",
		"name_grudge_troll_016",
		"name_grudge_troll_017",
		"name_grudge_troll_018",
		"name_grudge_troll_019",
		"name_grudge_troll_020"
	},
	chaos_spawn = {
		"name_grudge_spawn_001",
		"name_grudge_spawn_002",
		"name_grudge_spawn_003",
		"name_grudge_spawn_004",
		"name_grudge_spawn_005",
		"name_grudge_spawn_006",
		"name_grudge_spawn_007",
		"name_grudge_spawn_008",
		"name_grudge_spawn_009",
		"name_grudge_spawn_010",
		"name_grudge_spawn_011",
		"name_grudge_spawn_012",
		"name_grudge_spawn_013",
		"name_grudge_spawn_014",
		"name_grudge_spawn_015",
		"name_grudge_spawn_016",
		"name_grudge_spawn_017",
		"name_grudge_spawn_018",
		"name_grudge_spawn_019",
		"name_grudge_spawn_020"
	},
	beastmen_minotaur = {
		"name_grudge_minotaur_001",
		"name_grudge_minotaur_002",
		"name_grudge_minotaur_003",
		"name_grudge_minotaur_004",
		"name_grudge_minotaur_005",
		"name_grudge_minotaur_006",
		"name_grudge_minotaur_007",
		"name_grudge_minotaur_008",
		"name_grudge_minotaur_009",
		"name_grudge_minotaur_010",
		"name_grudge_minotaur_011",
		"name_grudge_minotaur_012",
		"name_grudge_minotaur_013",
		"name_grudge_minotaur_014",
		"name_grudge_minotaur_015",
		"name_grudge_minotaur_016",
		"name_grudge_minotaur_017",
		"name_grudge_minotaur_018",
		"name_grudge_minotaur_019",
		"name_grudge_minotaur_020"
	},
	shadow_lieutenant = {
		"name_shadow_lieutenant"
	},
	skaven = {
		"name_grudge_skaven_001"
	},
	chaos = {
		"name_grudge_chaos_001"
	},
	beastmen = {
		"name_grudge_beastmen_001"
	}
}

return
