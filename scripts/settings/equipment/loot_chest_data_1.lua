LootChestData = LootChestData or {}
LootChestData.scores = {
	default = {
		loot_dice = 5,
		tome = 10,
		game_won = 10,
		quickplay = 10,
		max_random_score = 30,
		grimoire = 15
	}
}
LootChestData.score_per_chest = 20
LootChestData.score_thresholds = {
	0,
	20,
	40,
	60,
	80,
	100
}
LootChestData.score_thresholds_per_chest = {
	0
}

for i = 2, #LootChestData.score_thresholds do
	LootChestData.score_thresholds_per_chest[i] = LootChestData.score_thresholds[i] - LootChestData.score_thresholds[i - 1]
end

LootChestData.max_score = LootChestData.score_thresholds[#LootChestData.score_thresholds]
LootChestData.power_level_tables = {
	category_1 = {
		default = 1,
		bonus_item_2 = 1,
		bonus_item_1 = 1
	},
	category_2 = {
		default = 2,
		bonus_item_2 = 2,
		bonus_item_1 = 2
	},
	category_3 = {
		default = 3,
		bonus_item_2 = 3,
		bonus_item_1 = 3
	},
	category_4 = {
		default = 4,
		bonus_item_2 = 4,
		bonus_item_1 = 4
	},
	category_5 = {
		default = 5,
		bonus_item_2 = 5,
		bonus_item_1 = 5
	},
	category_6 = {
		default = 6,
		bonus_item_2 = 6,
		bonus_item_1 = 6
	},
	category_7 = {
		default = 7,
		bonus_item_2 = 7,
		bonus_item_1 = 7
	},
	category_8 = {
		default = 8,
		bonus_item_2 = 8,
		bonus_item_1 = 8
	},
	category_9 = {
		default = 9,
		bonus_item_2 = 9,
		bonus_item_1 = 9
	},
	category_10 = {
		default = 10,
		bonus_item_2 = 10,
		bonus_item_1 = 10
	},
	category_11 = {
		default = 11,
		bonus_item_2 = 11,
		bonus_item_1 = 11
	},
	category_12 = {
		default = 12,
		bonus_item_2 = 12,
		bonus_item_1 = 12
	},
	category_13 = {
		default = 13,
		bonus_item_2 = 13,
		bonus_item_1 = 13
	},
	category_14 = {
		default = 14,
		bonus_item_2 = 14,
		bonus_item_1 = 14
	},
	category_15 = {
		default = 15,
		bonus_item_2 = 15,
		bonus_item_1 = 15
	},
	category_16 = {
		default = 16,
		bonus_item_2 = 16,
		bonus_item_1 = 16
	},
	category_17 = {
		default = 17,
		bonus_item_2 = 17,
		bonus_item_1 = 17
	},
	category_18 = {
		default = 18,
		bonus_item_2 = 18,
		bonus_item_1 = 18
	},
	category_19 = {
		default = 19,
		bonus_item_2 = 19,
		bonus_item_1 = 19
	},
	category_20 = {
		default = 20,
		bonus_item_2 = 20,
		bonus_item_1 = 20
	},
	category_21 = {
		default = 21,
		bonus_item_2 = 21,
		bonus_item_1 = 21
	},
	category_22 = {
		default = 22,
		bonus_item_2 = 22,
		bonus_item_1 = 22
	},
	category_23 = {
		default = 23,
		bonus_item_2 = 23,
		bonus_item_1 = 23
	},
	category_24 = {
		default = 24,
		bonus_item_2 = 24,
		bonus_item_1 = 24
	}
}
LootChestData.chests_by_category = {
	easy = {
		package_name = "resource_packages/chests_d1",
		backend_keys = {
			"loot_chest_01_01",
			"loot_chest_01_02",
			"loot_chest_01_03",
			"loot_chest_01_04",
			"loot_chest_01_05",
			"loot_chest_01_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d1_t1",
			"resource_packages/individual_chests/loot_chest_d1_t2",
			"resource_packages/individual_chests/loot_chest_d1_t3",
			"resource_packages/individual_chests/loot_chest_d1_t4",
			"resource_packages/individual_chests/loot_chest_d1_t5",
			"resource_packages/individual_chests/loot_chest_d1_t6"
		},
		display_names = {
			"display_name_loot_chest_normal_01",
			"display_name_loot_chest_normal_02",
			"display_name_loot_chest_normal_03",
			"display_name_loot_chest_normal_04",
			"display_name_loot_chest_normal_05",
			"display_name_loot_chest_normal_06"
		}
	},
	normal = {
		package_name = "resource_packages/chests_d1",
		backend_keys = {
			"loot_chest_01_01",
			"loot_chest_01_02",
			"loot_chest_01_03",
			"loot_chest_01_04",
			"loot_chest_01_05",
			"loot_chest_01_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d1_t1",
			"resource_packages/individual_chests/loot_chest_d1_t2",
			"resource_packages/individual_chests/loot_chest_d1_t3",
			"resource_packages/individual_chests/loot_chest_d1_t4",
			"resource_packages/individual_chests/loot_chest_d1_t5",
			"resource_packages/individual_chests/loot_chest_d1_t6"
		},
		display_names = {
			"display_name_loot_chest_normal_01",
			"display_name_loot_chest_normal_02",
			"display_name_loot_chest_normal_03",
			"display_name_loot_chest_normal_04",
			"display_name_loot_chest_normal_05",
			"display_name_loot_chest_normal_06"
		}
	},
	hard = {
		package_name = "resource_packages/chests_d2",
		backend_keys = {
			"loot_chest_02_01",
			"loot_chest_02_02",
			"loot_chest_02_03",
			"loot_chest_02_04",
			"loot_chest_02_05",
			"loot_chest_02_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d2_t1",
			"resource_packages/individual_chests/loot_chest_d2_t2",
			"resource_packages/individual_chests/loot_chest_d2_t3",
			"resource_packages/individual_chests/loot_chest_d2_t4",
			"resource_packages/individual_chests/loot_chest_d2_t5",
			"resource_packages/individual_chests/loot_chest_d2_t6"
		},
		display_names = {
			"display_name_loot_chest_hard_01",
			"display_name_loot_chest_hard_02",
			"display_name_loot_chest_hard_03",
			"display_name_loot_chest_hard_04",
			"display_name_loot_chest_hard_05",
			"display_name_loot_chest_hard_06"
		}
	},
	harder = {
		package_name = "resource_packages/chests_d3",
		backend_keys = {
			"loot_chest_03_01",
			"loot_chest_03_02",
			"loot_chest_03_03",
			"loot_chest_03_04",
			"loot_chest_03_05",
			"loot_chest_03_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d3_t1",
			"resource_packages/individual_chests/loot_chest_d3_t2",
			"resource_packages/individual_chests/loot_chest_d3_t3",
			"resource_packages/individual_chests/loot_chest_d3_t4",
			"resource_packages/individual_chests/loot_chest_d3_t5",
			"resource_packages/individual_chests/loot_chest_d3_t6"
		},
		display_names = {
			"display_name_loot_chest_nightmare_01",
			"display_name_loot_chest_nightmare_02",
			"display_name_loot_chest_nightmare_03",
			"display_name_loot_chest_nightmare_04",
			"display_name_loot_chest_nightmare_05",
			"display_name_loot_chest_nightmare_06"
		}
	},
	hardest = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6"
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06"
		}
	},
	cataclysm = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6"
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06"
		}
	},
	cataclysm_2 = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6"
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06"
		}
	},
	cataclysm_3 = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6"
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6"
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06"
		}
	},
	deed = {
		package_name = "resource_packages/chests_d2",
		backend_keys = {
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t6"
		}
	},
	level_up = {
		package_name = "resource_packages/chests_level_up",
		backend_keys = {
			"level_chest"
		},
		individual_chest_package_names = {
			"resource_packages/chests_level_up"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_level_up"
		}
	},
	level_up_2 = {
		package_name = "resource_packages/chests_level_up",
		backend_keys = {
			"level_chest"
		},
		individual_chest_package_names = {
			"resource_packages/chest_cc_t1"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_cc_t1"
		}
	},
	bogenhafen = {
		package_name = "resource_packages/chests_bogenhafen",
		backend_keys = {
			"bogenhafen_chest"
		},
		individual_chest_package_names = {
			"resource_packages/chests_bogenhafen"
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_bghf_01"
		}
	}
}
LootChestData.rarity_weights_tables = {
	tier_1 = {
		{
			weight = 15,
			name = "plentiful"
		},
		{
			weight = 5,
			name = "common"
		},
		{
			weight = 0.5,
			name = "rare"
		}
	},
	tier_2 = {
		{
			weight = 8,
			name = "plentiful"
		},
		{
			weight = 4,
			name = "common"
		},
		{
			weight = 1,
			name = "rare"
		},
		{
			weight = 0.25,
			name = "exotic"
		}
	},
	tier_3 = {
		{
			weight = 4,
			name = "plentiful"
		},
		{
			weight = 7,
			name = "common"
		},
		{
			weight = 1,
			name = "rare"
		},
		{
			weight = 0.25,
			name = "exotic"
		}
	},
	tier_4 = {
		{
			weight = 3,
			name = "plentiful"
		},
		{
			weight = 7,
			name = "common"
		},
		{
			weight = 4,
			name = "rare"
		},
		{
			weight = 0.5,
			name = "exotic"
		}
	},
	tier_5 = {
		{
			weight = 1,
			name = "common"
		},
		{
			weight = 4,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		}
	},
	tier_6 = {
		{
			weight = 3,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		}
	},
	tier_5_nightmare = {
		{
			weight = 1,
			name = "common"
		},
		{
			weight = 3,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.1,
			name = "unique"
		}
	},
	tier_6_nightmare = {
		{
			weight = 3,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.1,
			name = "unique"
		}
	},
	tier_1_cata = {
		{
			weight = 6,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.5,
			name = "unique"
		}
	},
	tier_2_cata = {
		{
			weight = 5,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.5,
			name = "unique"
		}
	},
	tier_3_cata = {
		{
			weight = 4,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.5,
			name = "unique"
		}
	},
	tier_4_cata = {
		{
			weight = 3,
			name = "rare"
		},
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 0.5,
			name = "unique"
		}
	},
	tier_5_cata = {
		{
			weight = 3,
			name = "exotic"
		},
		{
			weight = 1,
			name = "unique"
		}
	},
	tier_6_cata = {
		{
			weight = 1,
			name = "exotic"
		},
		{
			weight = 1,
			name = "unique"
		}
	}
}
LootChestData.rarity_weights_tables_new = {
	level_up = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				10
			}
		},
		{
			name = "common",
			weight_constraints = {
				2.5,
				3
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				0.05,
				5
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0,
				2
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				30,
				30
			}
		}
	},
	tier_1 = {
		{
			name = "plentiful",
			weight_constraints = {
				20,
				5
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				2.5,
				5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				0.05,
				1
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_2 = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				3
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				2,
				4
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				0.05,
				1
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.05,
				0.5
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_3 = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				3
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				3.5,
				5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				0.5,
				1.5
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.05,
				0.5
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_4 = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				3
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				3.5,
				5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				4
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_5 = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				4,
				1.5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				4
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				0.5
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_6 = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				6,
				1
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				4
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				0.6
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_5_nightmare = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				5,
				1.5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				4
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0.1
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_6_nightmare = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				1,
				0
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				2
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0,
				0.15
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_1_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				6,
				1
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				5
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.1,
				0.25
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_2_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				5,
				0.5
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				4
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.1,
				0.25
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_3_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				4,
				0
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				2
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.1,
				0.25
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_4_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				3,
				0
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				1
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				1
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.1,
				0.2
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_5_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				2,
				0
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				1
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				3
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.25,
				0.45
			},
			level_constraints = {
				25,
				30
			}
		}
	},
	tier_6_cata = {
		{
			name = "plentiful",
			weight_constraints = {
				10,
				0
			},
			level_constraints = {
				1,
				8
			}
		},
		{
			name = "common",
			weight_constraints = {
				1,
				0
			},
			level_constraints = {
				3,
				10
			}
		},
		{
			name = "rare",
			weight_constraints = {
				1,
				0.5
			},
			level_constraints = {
				7,
				15
			}
		},
		{
			name = "exotic",
			weight_constraints = {
				0.1,
				2
			},
			level_constraints = {
				10,
				20
			}
		},
		{
			name = "unique",
			weight_constraints = {
				0.25,
				0.5
			},
			level_constraints = {
				25,
				30
			}
		}
	}
}
LootChestData.items = {
	dwarf_ranger = {
		plentiful = {
			melee = {
				{
					weight = 1,
					key = "dr_1h_axe"
				},
				{
					weight = 1,
					key = "dr_dual_wield_axes"
				},
				{
					weight = 1,
					key = "dr_2h_axe"
				},
				{
					weight = 1,
					key = "dr_2h_hammer"
				},
				{
					weight = 1,
					key = "dr_1h_hammer"
				},
				{
					weight = 1,
					key = "dr_shield_axe"
				},
				{
					weight = 1,
					key = "dr_shield_hammer"
				},
				{
					weight = 1,
					key = "dr_2h_pick"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "dr_crossbow"
				},
				{
					weight = 1,
					key = "dr_rakegun"
				},
				{
					weight = 1,
					key = "dr_handgun"
				},
				{
					weight = 1,
					key = "dr_drake_pistol"
				},
				{
					weight = 1,
					key = "dr_drakegun"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		common = {
			melee = {
				{
					weight = 1,
					key = "dr_1h_axe"
				},
				{
					weight = 1,
					key = "dr_dual_wield_axes"
				},
				{
					weight = 1,
					key = "dr_2h_axe"
				},
				{
					weight = 1,
					key = "dr_2h_hammer"
				},
				{
					weight = 1,
					key = "dr_1h_hammer"
				},
				{
					weight = 1,
					key = "dr_shield_axe"
				},
				{
					weight = 1,
					key = "dr_shield_hammer"
				},
				{
					weight = 1,
					key = "dr_2h_pick"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "dr_crossbow"
				},
				{
					weight = 1,
					key = "dr_rakegun"
				},
				{
					weight = 1,
					key = "dr_handgun"
				},
				{
					weight = 1,
					key = "dr_drake_pistol"
				},
				{
					weight = 1,
					key = "dr_drakegun"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		rare = {
			melee = {
				{
					weight = 1,
					key = "dr_1h_axe"
				},
				{
					weight = 1,
					key = "dr_dual_wield_axes"
				},
				{
					weight = 1,
					key = "dr_2h_axe"
				},
				{
					weight = 1,
					key = "dr_2h_hammer"
				},
				{
					weight = 1,
					key = "dr_1h_hammer"
				},
				{
					weight = 1,
					key = "dr_shield_axe"
				},
				{
					weight = 1,
					key = "dr_shield_hammer"
				},
				{
					weight = 1,
					key = "dr_2h_pick"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "dr_crossbow"
				},
				{
					weight = 1,
					key = "dr_rakegun"
				},
				{
					weight = 1,
					key = "dr_handgun"
				},
				{
					weight = 1,
					key = "dr_drake_pistol"
				},
				{
					weight = 1,
					key = "dr_drakegun"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		exotic = {
			melee = {
				{
					weight = 1,
					key = "dr_1h_axe"
				},
				{
					weight = 1,
					key = "dr_dual_wield_axes"
				},
				{
					weight = 1,
					key = "dr_2h_axe"
				},
				{
					weight = 1,
					key = "dr_2h_hammer"
				},
				{
					weight = 1,
					key = "dr_1h_hammer"
				},
				{
					weight = 1,
					key = "dr_shield_axe"
				},
				{
					weight = 1,
					key = "dr_shield_hammer"
				},
				{
					weight = 1,
					key = "dr_2h_pick"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "dr_crossbow"
				},
				{
					weight = 1,
					key = "dr_rakegun"
				},
				{
					weight = 1,
					key = "dr_handgun"
				},
				{
					weight = 1,
					key = "dr_drake_pistol"
				},
				{
					weight = 1,
					key = "dr_drakegun"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		unique = {
			melee = {
				{
					weight = 1,
					key = "dr_1h_axe"
				},
				{
					weight = 1,
					key = "dr_dual_wield_axes"
				},
				{
					weight = 1,
					key = "dr_2h_axe"
				},
				{
					weight = 1,
					key = "dr_2h_hammer"
				},
				{
					weight = 1,
					key = "dr_1h_hammer"
				},
				{
					weight = 1,
					key = "dr_shield_axe"
				},
				{
					weight = 1,
					key = "dr_shield_hammer"
				},
				{
					weight = 1,
					key = "dr_2h_pick"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "dr_crossbow"
				},
				{
					weight = 1,
					key = "dr_rakegun"
				},
				{
					weight = 1,
					key = "dr_handgun"
				},
				{
					weight = 1,
					key = "dr_drake_pistol"
				},
				{
					weight = 1,
					key = "dr_drakegun"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		}
	},
	witch_hunter = {
		plentiful = {
			melee = {
				{
					weight = 1,
					key = "wh_1h_axe"
				},
				{
					weight = 1,
					key = "wh_2h_sword"
				},
				{
					weight = 1,
					key = "wh_fencing_sword"
				},
				{
					weight = 1,
					key = "wh_1h_falchion"
				},
				{
					weight = 1,
					key = "es_1h_flail"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "wh_brace_of_pistols"
				},
				{
					weight = 1,
					key = "wh_repeating_pistols"
				},
				{
					weight = 1,
					key = "wh_crossbow"
				},
				{
					weight = 1,
					key = "wh_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		common = {
			melee = {
				{
					weight = 1,
					key = "wh_1h_axe"
				},
				{
					weight = 1,
					key = "wh_2h_sword"
				},
				{
					weight = 1,
					key = "wh_fencing_sword"
				},
				{
					weight = 1,
					key = "wh_1h_falchion"
				},
				{
					weight = 1,
					key = "es_1h_flail"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "wh_brace_of_pistols"
				},
				{
					weight = 1,
					key = "wh_repeating_pistols"
				},
				{
					weight = 1,
					key = "wh_crossbow"
				},
				{
					weight = 1,
					key = "wh_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		rare = {
			melee = {
				{
					weight = 1,
					key = "wh_1h_axe"
				},
				{
					weight = 1,
					key = "wh_2h_sword"
				},
				{
					weight = 1,
					key = "wh_fencing_sword"
				},
				{
					weight = 1,
					key = "wh_1h_falchion"
				},
				{
					weight = 1,
					key = "es_1h_flail"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "wh_brace_of_pistols"
				},
				{
					weight = 1,
					key = "wh_repeating_pistols"
				},
				{
					weight = 1,
					key = "wh_crossbow"
				},
				{
					weight = 1,
					key = "wh_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		exotic = {
			melee = {
				{
					weight = 1,
					key = "wh_1h_axe"
				},
				{
					weight = 1,
					key = "wh_2h_sword"
				},
				{
					weight = 1,
					key = "wh_fencing_sword"
				},
				{
					weight = 1,
					key = "wh_1h_falchion"
				},
				{
					weight = 1,
					key = "es_1h_flail"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "wh_brace_of_pistols"
				},
				{
					weight = 1,
					key = "wh_repeating_pistols"
				},
				{
					weight = 1,
					key = "wh_crossbow"
				},
				{
					weight = 1,
					key = "wh_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		unique = {
			melee = {
				{
					weight = 1,
					key = "wh_1h_axe"
				},
				{
					weight = 1,
					key = "wh_2h_sword"
				},
				{
					weight = 1,
					key = "wh_fencing_sword"
				},
				{
					weight = 1,
					key = "wh_1h_falchion"
				},
				{
					weight = 1,
					key = "es_1h_flail"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "wh_brace_of_pistols"
				},
				{
					weight = 1,
					key = "wh_repeating_pistols"
				},
				{
					weight = 1,
					key = "wh_crossbow"
				},
				{
					weight = 1,
					key = "wh_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		}
	},
	empire_soldier = {
		plentiful = {
			melee = {
				{
					weight = 1,
					key = "es_1h_sword"
				},
				{
					weight = 1,
					key = "es_1h_mace"
				},
				{
					weight = 1,
					key = "es_2h_sword"
				},
				{
					weight = 1,
					key = "es_2h_hammer"
				},
				{
					weight = 1,
					key = "es_sword_shield"
				},
				{
					weight = 1,
					key = "es_mace_shield"
				},
				{
					weight = 1,
					key = "es_halberd"
				},
				{
					weight = 1,
					key = "es_2h_sword_executioner"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "es_blunderbuss"
				},
				{
					weight = 1,
					key = "es_handgun"
				},
				{
					weight = 1,
					key = "es_repeating_handgun"
				},
				{
					weight = 1,
					key = "es_longbow"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		common = {
			melee = {
				{
					weight = 1,
					key = "es_1h_sword"
				},
				{
					weight = 1,
					key = "es_1h_mace"
				},
				{
					weight = 1,
					key = "es_2h_sword"
				},
				{
					weight = 1,
					key = "es_2h_hammer"
				},
				{
					weight = 1,
					key = "es_sword_shield"
				},
				{
					weight = 1,
					key = "es_mace_shield"
				},
				{
					weight = 1,
					key = "es_halberd"
				},
				{
					weight = 1,
					key = "es_2h_sword_executioner"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "es_blunderbuss"
				},
				{
					weight = 1,
					key = "es_handgun"
				},
				{
					weight = 1,
					key = "es_repeating_handgun"
				},
				{
					weight = 1,
					key = "es_longbow"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		rare = {
			melee = {
				{
					weight = 1,
					key = "es_1h_sword"
				},
				{
					weight = 1,
					key = "es_1h_mace"
				},
				{
					weight = 1,
					key = "es_2h_sword"
				},
				{
					weight = 1,
					key = "es_2h_hammer"
				},
				{
					weight = 1,
					key = "es_sword_shield"
				},
				{
					weight = 1,
					key = "es_mace_shield"
				},
				{
					weight = 1,
					key = "es_halberd"
				},
				{
					weight = 1,
					key = "es_2h_sword_executioner"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "es_blunderbuss"
				},
				{
					weight = 1,
					key = "es_handgun"
				},
				{
					weight = 1,
					key = "es_repeating_handgun"
				},
				{
					weight = 1,
					key = "es_longbow"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		exotic = {
			melee = {
				{
					weight = 1,
					key = "es_1h_sword"
				},
				{
					weight = 1,
					key = "es_1h_mace"
				},
				{
					weight = 1,
					key = "es_2h_sword"
				},
				{
					weight = 1,
					key = "es_2h_hammer"
				},
				{
					weight = 1,
					key = "es_sword_shield"
				},
				{
					weight = 1,
					key = "es_mace_shield"
				},
				{
					weight = 1,
					key = "es_halberd"
				},
				{
					weight = 1,
					key = "es_2h_sword_executioner"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "es_blunderbuss"
				},
				{
					weight = 1,
					key = "es_handgun"
				},
				{
					weight = 1,
					key = "es_repeating_handgun"
				},
				{
					weight = 1,
					key = "es_longbow"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		unique = {
			melee = {
				{
					weight = 1,
					key = "es_1h_sword"
				},
				{
					weight = 1,
					key = "es_1h_mace"
				},
				{
					weight = 1,
					key = "es_2h_sword"
				},
				{
					weight = 1,
					key = "es_2h_hammer"
				},
				{
					weight = 1,
					key = "es_sword_shield"
				},
				{
					weight = 1,
					key = "es_mace_shield"
				},
				{
					weight = 1,
					key = "es_halberd"
				},
				{
					weight = 1,
					key = "es_2h_sword_executioner"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "es_blunderbuss"
				},
				{
					weight = 1,
					key = "es_handgun"
				},
				{
					weight = 1,
					key = "es_repeating_handgun"
				},
				{
					weight = 1,
					key = "es_longbow"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		}
	},
	wood_elf = {
		plentiful = {
			melee = {
				{
					weight = 1,
					key = "we_dual_wield_daggers"
				},
				{
					weight = 1,
					key = "we_dual_wield_swords"
				},
				{
					weight = 1,
					key = "we_1h_sword"
				},
				{
					weight = 1,
					key = "we_dual_wield_sword_dagger"
				},
				{
					weight = 1,
					key = "we_2h_axe"
				},
				{
					weight = 1,
					key = "we_2h_sword"
				},
				{
					weight = 1,
					key = "we_spear"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "we_shortbow"
				},
				{
					weight = 1,
					key = "we_shortbow_hagbane"
				},
				{
					weight = 1,
					key = "we_longbow"
				},
				{
					weight = 1,
					key = "we_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		common = {
			melee = {
				{
					weight = 1,
					key = "we_dual_wield_daggers"
				},
				{
					weight = 1,
					key = "we_dual_wield_swords"
				},
				{
					weight = 1,
					key = "we_1h_sword"
				},
				{
					weight = 1,
					key = "we_dual_wield_sword_dagger"
				},
				{
					weight = 1,
					key = "we_2h_axe"
				},
				{
					weight = 1,
					key = "we_2h_sword"
				},
				{
					weight = 1,
					key = "we_spear"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "we_shortbow"
				},
				{
					weight = 1,
					key = "we_shortbow_hagbane"
				},
				{
					weight = 1,
					key = "we_longbow"
				},
				{
					weight = 1,
					key = "we_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		rare = {
			melee = {
				{
					weight = 1,
					key = "we_dual_wield_daggers"
				},
				{
					weight = 1,
					key = "we_dual_wield_swords"
				},
				{
					weight = 1,
					key = "we_1h_sword"
				},
				{
					weight = 1,
					key = "we_dual_wield_sword_dagger"
				},
				{
					weight = 1,
					key = "we_2h_axe"
				},
				{
					weight = 1,
					key = "we_2h_sword"
				},
				{
					weight = 1,
					key = "we_spear"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "we_shortbow"
				},
				{
					weight = 1,
					key = "we_shortbow_hagbane"
				},
				{
					weight = 1,
					key = "we_longbow"
				},
				{
					weight = 1,
					key = "we_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		exotic = {
			melee = {
				{
					weight = 1,
					key = "we_dual_wield_daggers"
				},
				{
					weight = 1,
					key = "we_dual_wield_swords"
				},
				{
					weight = 1,
					key = "we_1h_sword"
				},
				{
					weight = 1,
					key = "we_dual_wield_sword_dagger"
				},
				{
					weight = 1,
					key = "we_2h_axe"
				},
				{
					weight = 1,
					key = "we_2h_sword"
				},
				{
					weight = 1,
					key = "we_spear"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "we_shortbow"
				},
				{
					weight = 1,
					key = "we_shortbow_hagbane"
				},
				{
					weight = 1,
					key = "we_longbow"
				},
				{
					weight = 1,
					key = "we_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		unique = {
			melee = {
				{
					weight = 1,
					key = "we_dual_wield_daggers"
				},
				{
					weight = 1,
					key = "we_dual_wield_swords"
				},
				{
					weight = 1,
					key = "we_1h_sword"
				},
				{
					weight = 1,
					key = "we_dual_wield_sword_dagger"
				},
				{
					weight = 1,
					key = "we_2h_axe"
				},
				{
					weight = 1,
					key = "we_2h_sword"
				},
				{
					weight = 1,
					key = "we_spear"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "we_shortbow"
				},
				{
					weight = 1,
					key = "we_shortbow_hagbane"
				},
				{
					weight = 1,
					key = "we_longbow"
				},
				{
					weight = 1,
					key = "we_crossbow_repeater"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		}
	},
	bright_wizard = {
		plentiful = {
			melee = {
				{
					weight = 1,
					key = "bw_1h_mace"
				},
				{
					weight = 1,
					key = "bw_flame_sword"
				},
				{
					weight = 1,
					key = "bw_sword"
				},
				{
					weight = 1,
					key = "bw_dagger"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "bw_skullstaff_fireball"
				},
				{
					weight = 1,
					key = "bw_skullstaff_beam"
				},
				{
					weight = 1,
					key = "bw_skullstaff_geiser"
				},
				{
					weight = 1,
					key = "bw_skullstaff_spear"
				},
				{
					weight = 1,
					key = "bw_skullstaff_flamethrower"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		common = {
			melee = {
				{
					weight = 1,
					key = "bw_1h_mace"
				},
				{
					weight = 1,
					key = "bw_flame_sword"
				},
				{
					weight = 1,
					key = "bw_sword"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "bw_skullstaff_fireball"
				},
				{
					weight = 1,
					key = "bw_skullstaff_beam"
				},
				{
					weight = 1,
					key = "bw_skullstaff_geiser"
				},
				{
					weight = 1,
					key = "bw_skullstaff_spear"
				},
				{
					weight = 1,
					key = "bw_skullstaff_flamethrower"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		rare = {
			melee = {
				{
					weight = 1,
					key = "bw_1h_mace"
				},
				{
					weight = 1,
					key = "bw_flame_sword"
				},
				{
					weight = 1,
					key = "bw_sword"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "bw_skullstaff_fireball"
				},
				{
					weight = 1,
					key = "bw_skullstaff_beam"
				},
				{
					weight = 1,
					key = "bw_skullstaff_geiser"
				},
				{
					weight = 1,
					key = "bw_skullstaff_spear"
				},
				{
					weight = 1,
					key = "bw_skullstaff_flamethrower"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		exotic = {
			melee = {
				{
					weight = 1,
					key = "bw_1h_mace"
				},
				{
					weight = 1,
					key = "bw_flame_sword"
				},
				{
					weight = 1,
					key = "bw_sword"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "bw_skullstaff_fireball"
				},
				{
					weight = 1,
					key = "bw_skullstaff_beam"
				},
				{
					weight = 1,
					key = "bw_skullstaff_geiser"
				},
				{
					weight = 1,
					key = "bw_skullstaff_spear"
				},
				{
					weight = 1,
					key = "bw_skullstaff_flamethrower"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		},
		unique = {
			melee = {
				{
					weight = 1,
					key = "bw_1h_mace"
				},
				{
					weight = 1,
					key = "bw_flame_sword"
				},
				{
					weight = 1,
					key = "bw_sword"
				}
			},
			ranged = {
				{
					weight = 1,
					key = "bw_skullstaff_fireball"
				},
				{
					weight = 1,
					key = "bw_skullstaff_beam"
				},
				{
					weight = 1,
					key = "bw_skullstaff_geiser"
				},
				{
					weight = 1,
					key = "bw_skullstaff_spear"
				},
				{
					weight = 1,
					key = "bw_skullstaff_flamethrower"
				}
			},
			ring = {
				{
					weight = 1,
					key = "ring"
				},
				{
					weight = 1,
					key = "ring_02"
				},
				{
					weight = 1,
					key = "ring_03"
				},
				{
					weight = 1,
					key = "ring_04"
				},
				{
					weight = 1,
					key = "ring_05"
				},
				{
					weight = 1,
					key = "ring_06"
				},
				{
					weight = 1,
					key = "ring_07"
				},
				{
					weight = 1,
					key = "ring_08"
				},
				{
					weight = 1,
					key = "ring_09"
				},
				{
					weight = 1,
					key = "ring_10"
				}
			},
			necklace = {
				{
					weight = 1,
					key = "necklace"
				},
				{
					weight = 1,
					key = "necklace_02"
				},
				{
					weight = 1,
					key = "necklace_03"
				},
				{
					weight = 1,
					key = "necklace_04"
				},
				{
					weight = 1,
					key = "necklace_05"
				},
				{
					weight = 1,
					key = "necklace_06"
				},
				{
					weight = 1,
					key = "necklace_07"
				},
				{
					weight = 1,
					key = "necklace_08"
				},
				{
					weight = 1,
					key = "necklace_09"
				},
				{
					weight = 1,
					key = "necklace_10"
				}
			},
			trinket = {
				{
					weight = 1,
					key = "trinket"
				},
				{
					weight = 1,
					key = "trinket_02"
				},
				{
					weight = 1,
					key = "trinket_03"
				},
				{
					weight = 1,
					key = "trinket_04"
				},
				{
					weight = 1,
					key = "trinket_05"
				},
				{
					weight = 1,
					key = "trinket_06"
				},
				{
					weight = 1,
					key = "trinket_07"
				},
				{
					weight = 1,
					key = "trinket_08"
				},
				{
					weight = 1,
					key = "trinket_09"
				},
				{
					weight = 1,
					key = "trinket_10"
				}
			},
			crafting_material = {
				{
					weight = 1,
					key = "crafting_material_weapon"
				},
				{
					weight = 1,
					key = "crafting_material_jewellery"
				}
			},
			deed = {
				{
					weight = 1,
					key = "deed"
				},
				{
					weight = 1,
					key = "deed_0002"
				}
			}
		}
	}
}
LootChestData.items_new = {
	dwarf_ranger = {
		melee = {
			{
				weight = 1,
				key = "dr_1h_axe"
			},
			{
				weight = 1,
				key = "dr_dual_wield_axes"
			},
			{
				weight = 1,
				key = "dr_2h_axe"
			},
			{
				weight = 1,
				key = "dr_2h_hammer"
			},
			{
				weight = 1,
				key = "dr_1h_hammer"
			},
			{
				weight = 1,
				key = "dr_shield_axe"
			},
			{
				weight = 1,
				key = "dr_shield_hammer"
			},
			{
				weight = 1,
				key = "dr_2h_pick"
			}
		},
		ranged = {
			{
				weight = 1,
				key = "dr_crossbow"
			},
			{
				weight = 1,
				key = "dr_rakegun"
			},
			{
				weight = 1,
				key = "dr_handgun"
			},
			{
				weight = 1,
				key = "dr_drake_pistol"
			},
			{
				weight = 1,
				key = "dr_drakegun"
			}
		},
		ring = {
			{
				weight = 1,
				key = "ring"
			},
			{
				weight = 1,
				key = "ring_02"
			},
			{
				weight = 1,
				key = "ring_03"
			},
			{
				weight = 1,
				key = "ring_04"
			},
			{
				weight = 1,
				key = "ring_05"
			},
			{
				weight = 1,
				key = "ring_06"
			},
			{
				weight = 1,
				key = "ring_07"
			},
			{
				weight = 1,
				key = "ring_08"
			},
			{
				weight = 1,
				key = "ring_09"
			},
			{
				weight = 1,
				key = "ring_10"
			}
		},
		necklace = {
			{
				weight = 1,
				key = "necklace"
			},
			{
				weight = 1,
				key = "necklace_02"
			},
			{
				weight = 1,
				key = "necklace_03"
			},
			{
				weight = 1,
				key = "necklace_04"
			},
			{
				weight = 1,
				key = "necklace_05"
			},
			{
				weight = 1,
				key = "necklace_06"
			},
			{
				weight = 1,
				key = "necklace_07"
			},
			{
				weight = 1,
				key = "necklace_08"
			},
			{
				weight = 1,
				key = "necklace_09"
			},
			{
				weight = 1,
				key = "necklace_10"
			}
		},
		trinket = {
			{
				weight = 1,
				key = "trinket"
			},
			{
				weight = 1,
				key = "trinket_02"
			},
			{
				weight = 1,
				key = "trinket_03"
			},
			{
				weight = 1,
				key = "trinket_04"
			},
			{
				weight = 1,
				key = "trinket_05"
			},
			{
				weight = 1,
				key = "trinket_06"
			},
			{
				weight = 1,
				key = "trinket_07"
			},
			{
				weight = 1,
				key = "trinket_08"
			},
			{
				weight = 1,
				key = "trinket_09"
			},
			{
				weight = 1,
				key = "trinket_10"
			}
		},
		crafting_material = {
			{
				weight = 1,
				key = "crafting_material_weapon"
			},
			{
				weight = 1,
				key = "crafting_material_jewellery"
			}
		},
		deed = {
			{
				weight = 1,
				key = "deed"
			}
		}
	},
	witch_hunter = {
		melee = {
			{
				weight = 1,
				key = "wh_1h_axe"
			},
			{
				weight = 1,
				key = "wh_2h_sword"
			},
			{
				weight = 1,
				key = "wh_fencing_sword"
			},
			{
				weight = 1,
				key = "wh_1h_falchion"
			},
			{
				weight = 1,
				key = "es_1h_flail"
			}
		},
		ranged = {
			{
				weight = 1,
				key = "wh_brace_of_pistols"
			},
			{
				weight = 1,
				key = "wh_repeating_pistols"
			},
			{
				weight = 1,
				key = "wh_crossbow"
			},
			{
				weight = 1,
				key = "wh_crossbow_repeater"
			}
		},
		ring = {
			{
				weight = 1,
				key = "ring"
			},
			{
				weight = 1,
				key = "ring_02"
			},
			{
				weight = 1,
				key = "ring_03"
			},
			{
				weight = 1,
				key = "ring_04"
			},
			{
				weight = 1,
				key = "ring_05"
			},
			{
				weight = 1,
				key = "ring_06"
			},
			{
				weight = 1,
				key = "ring_07"
			},
			{
				weight = 1,
				key = "ring_08"
			},
			{
				weight = 1,
				key = "ring_09"
			},
			{
				weight = 1,
				key = "ring_10"
			}
		},
		necklace = {
			{
				weight = 1,
				key = "necklace"
			},
			{
				weight = 1,
				key = "necklace_02"
			},
			{
				weight = 1,
				key = "necklace_03"
			},
			{
				weight = 1,
				key = "necklace_04"
			},
			{
				weight = 1,
				key = "necklace_05"
			},
			{
				weight = 1,
				key = "necklace_06"
			},
			{
				weight = 1,
				key = "necklace_07"
			},
			{
				weight = 1,
				key = "necklace_08"
			},
			{
				weight = 1,
				key = "necklace_09"
			},
			{
				weight = 1,
				key = "necklace_10"
			}
		},
		trinket = {
			{
				weight = 1,
				key = "trinket"
			},
			{
				weight = 1,
				key = "trinket_02"
			},
			{
				weight = 1,
				key = "trinket_03"
			},
			{
				weight = 1,
				key = "trinket_04"
			},
			{
				weight = 1,
				key = "trinket_05"
			},
			{
				weight = 1,
				key = "trinket_06"
			},
			{
				weight = 1,
				key = "trinket_07"
			},
			{
				weight = 1,
				key = "trinket_08"
			},
			{
				weight = 1,
				key = "trinket_09"
			},
			{
				weight = 1,
				key = "trinket_10"
			}
		},
		crafting_material = {
			{
				weight = 1,
				key = "crafting_material_weapon"
			},
			{
				weight = 1,
				key = "crafting_material_jewellery"
			}
		},
		deed = {
			{
				weight = 1,
				key = "deed"
			}
		}
	},
	empire_soldier = {
		melee = {
			{
				weight = 1,
				key = "es_1h_sword"
			},
			{
				weight = 1,
				key = "es_1h_mace"
			},
			{
				weight = 1,
				key = "es_2h_sword"
			},
			{
				weight = 1,
				key = "es_2h_hammer"
			},
			{
				weight = 1,
				key = "es_sword_shield"
			},
			{
				weight = 1,
				key = "es_mace_shield"
			},
			{
				weight = 1,
				key = "es_halberd"
			},
			{
				weight = 1,
				key = "es_2h_sword_executioner"
			}
		},
		ranged = {
			{
				weight = 1,
				key = "es_blunderbuss"
			},
			{
				weight = 1,
				key = "es_handgun"
			},
			{
				weight = 1,
				key = "es_repeating_handgun"
			},
			{
				weight = 1,
				key = "es_longbow"
			}
		},
		ring = {
			{
				weight = 1,
				key = "ring"
			},
			{
				weight = 1,
				key = "ring_02"
			},
			{
				weight = 1,
				key = "ring_03"
			},
			{
				weight = 1,
				key = "ring_04"
			},
			{
				weight = 1,
				key = "ring_05"
			},
			{
				weight = 1,
				key = "ring_06"
			},
			{
				weight = 1,
				key = "ring_07"
			},
			{
				weight = 1,
				key = "ring_08"
			},
			{
				weight = 1,
				key = "ring_09"
			},
			{
				weight = 1,
				key = "ring_10"
			}
		},
		necklace = {
			{
				weight = 1,
				key = "necklace"
			},
			{
				weight = 1,
				key = "necklace_02"
			},
			{
				weight = 1,
				key = "necklace_03"
			},
			{
				weight = 1,
				key = "necklace_04"
			},
			{
				weight = 1,
				key = "necklace_05"
			},
			{
				weight = 1,
				key = "necklace_06"
			},
			{
				weight = 1,
				key = "necklace_07"
			},
			{
				weight = 1,
				key = "necklace_08"
			},
			{
				weight = 1,
				key = "necklace_09"
			},
			{
				weight = 1,
				key = "necklace_10"
			}
		},
		trinket = {
			{
				weight = 1,
				key = "trinket"
			},
			{
				weight = 1,
				key = "trinket_02"
			},
			{
				weight = 1,
				key = "trinket_03"
			},
			{
				weight = 1,
				key = "trinket_04"
			},
			{
				weight = 1,
				key = "trinket_05"
			},
			{
				weight = 1,
				key = "trinket_06"
			},
			{
				weight = 1,
				key = "trinket_07"
			},
			{
				weight = 1,
				key = "trinket_08"
			},
			{
				weight = 1,
				key = "trinket_09"
			},
			{
				weight = 1,
				key = "trinket_10"
			}
		},
		crafting_material = {
			{
				weight = 1,
				key = "crafting_material_weapon"
			},
			{
				weight = 1,
				key = "crafting_material_jewellery"
			}
		},
		deed = {
			{
				weight = 1,
				key = "deed"
			}
		}
	},
	wood_elf = {
		melee = {
			{
				weight = 1,
				key = "we_dual_wield_daggers"
			},
			{
				weight = 1,
				key = "we_dual_wield_swords"
			},
			{
				weight = 1,
				key = "we_1h_sword"
			},
			{
				weight = 1,
				key = "we_dual_wield_sword_dagger"
			},
			{
				weight = 1,
				key = "we_2h_axe"
			},
			{
				weight = 1,
				key = "we_2h_sword"
			},
			{
				weight = 1,
				key = "we_spear"
			}
		},
		ranged = {
			{
				weight = 1,
				key = "we_shortbow"
			},
			{
				weight = 1,
				key = "we_shortbow_hagbane"
			},
			{
				weight = 1,
				key = "we_longbow"
			},
			{
				weight = 1,
				key = "we_crossbow_repeater"
			}
		},
		ring = {
			{
				weight = 1,
				key = "ring"
			},
			{
				weight = 1,
				key = "ring_02"
			},
			{
				weight = 1,
				key = "ring_03"
			},
			{
				weight = 1,
				key = "ring_04"
			},
			{
				weight = 1,
				key = "ring_05"
			},
			{
				weight = 1,
				key = "ring_06"
			},
			{
				weight = 1,
				key = "ring_07"
			},
			{
				weight = 1,
				key = "ring_08"
			},
			{
				weight = 1,
				key = "ring_09"
			},
			{
				weight = 1,
				key = "ring_10"
			}
		},
		necklace = {
			{
				weight = 1,
				key = "necklace"
			},
			{
				weight = 1,
				key = "necklace_02"
			},
			{
				weight = 1,
				key = "necklace_03"
			},
			{
				weight = 1,
				key = "necklace_04"
			},
			{
				weight = 1,
				key = "necklace_05"
			},
			{
				weight = 1,
				key = "necklace_06"
			},
			{
				weight = 1,
				key = "necklace_07"
			},
			{
				weight = 1,
				key = "necklace_08"
			},
			{
				weight = 1,
				key = "necklace_09"
			},
			{
				weight = 1,
				key = "necklace_10"
			}
		},
		trinket = {
			{
				weight = 1,
				key = "trinket"
			},
			{
				weight = 1,
				key = "trinket_02"
			},
			{
				weight = 1,
				key = "trinket_03"
			},
			{
				weight = 1,
				key = "trinket_04"
			},
			{
				weight = 1,
				key = "trinket_05"
			},
			{
				weight = 1,
				key = "trinket_06"
			},
			{
				weight = 1,
				key = "trinket_07"
			},
			{
				weight = 1,
				key = "trinket_08"
			},
			{
				weight = 1,
				key = "trinket_09"
			},
			{
				weight = 1,
				key = "trinket_10"
			}
		},
		crafting_material = {
			{
				weight = 1,
				key = "crafting_material_weapon"
			},
			{
				weight = 1,
				key = "crafting_material_jewellery"
			}
		},
		deed = {
			{
				weight = 1,
				key = "deed"
			}
		}
	},
	bright_wizard = {
		melee = {
			{
				weight = 1,
				key = "bw_1h_mace"
			},
			{
				weight = 1,
				key = "bw_flame_sword"
			},
			{
				weight = 1,
				key = "bw_sword"
			}
		},
		ranged = {
			{
				weight = 1,
				key = "bw_skullstaff_fireball"
			},
			{
				weight = 1,
				key = "bw_skullstaff_beam"
			},
			{
				weight = 1,
				key = "bw_skullstaff_geiser"
			},
			{
				weight = 1,
				key = "bw_skullstaff_spear"
			},
			{
				weight = 1,
				key = "bw_skullstaff_flamethrower"
			}
		},
		ring = {
			{
				weight = 1,
				key = "ring"
			},
			{
				weight = 1,
				key = "ring_02"
			},
			{
				weight = 1,
				key = "ring_03"
			},
			{
				weight = 1,
				key = "ring_04"
			},
			{
				weight = 1,
				key = "ring_05"
			},
			{
				weight = 1,
				key = "ring_06"
			},
			{
				weight = 1,
				key = "ring_07"
			},
			{
				weight = 1,
				key = "ring_08"
			},
			{
				weight = 1,
				key = "ring_09"
			},
			{
				weight = 1,
				key = "ring_10"
			}
		},
		necklace = {
			{
				weight = 1,
				key = "necklace"
			},
			{
				weight = 1,
				key = "necklace_02"
			},
			{
				weight = 1,
				key = "necklace_03"
			},
			{
				weight = 1,
				key = "necklace_04"
			},
			{
				weight = 1,
				key = "necklace_05"
			},
			{
				weight = 1,
				key = "necklace_06"
			},
			{
				weight = 1,
				key = "necklace_07"
			},
			{
				weight = 1,
				key = "necklace_08"
			},
			{
				weight = 1,
				key = "necklace_09"
			},
			{
				weight = 1,
				key = "necklace_10"
			}
		},
		trinket = {
			{
				weight = 1,
				key = "trinket"
			},
			{
				weight = 1,
				key = "trinket_02"
			},
			{
				weight = 1,
				key = "trinket_03"
			},
			{
				weight = 1,
				key = "trinket_04"
			},
			{
				weight = 1,
				key = "trinket_05"
			},
			{
				weight = 1,
				key = "trinket_06"
			},
			{
				weight = 1,
				key = "trinket_07"
			},
			{
				weight = 1,
				key = "trinket_08"
			},
			{
				weight = 1,
				key = "trinket_09"
			},
			{
				weight = 1,
				key = "trinket_10"
			}
		},
		crafting_material = {
			{
				weight = 1,
				key = "crafting_material_weapon"
			},
			{
				weight = 1,
				key = "crafting_material_jewellery"
			}
		},
		deed = {
			{
				weight = 1,
				key = "deed"
			}
		}
	}
}

DLCUtils.merge("extra_loot_chest_score_types", LootChestData.scores)
