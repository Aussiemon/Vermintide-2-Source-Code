DifficultySettings = DifficultySettings or {}
DifficultySettings.easy = {
	amount_storm_vermin_patrol = 6,
	display_name = "difficulty_easy",
	allow_respawns = true,
	friendly_fire_ranged = false,
	display_image = "difficulty_option_1",
	stagger_modifier = 1,
	slot_potion = "potion_damage_boost_01",
	friendly_fire_melee = false,
	completed_frame_texture = "map_frame_01",
	required_power_level = 0,
	power_level_cap = 400,
	wounds = 5,
	description = "difficulty_easy_desc",
	xp_multiplier = 1,
	slot_healthkit = "healthkit_first_aid_kit_01",
	rank = 1,
	chance_of_shield_vermin_patrol = 0,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	attack_intensity_threshold = 2.5,
	respawn = {
		ammo_melee = 0.5,
		health_percentage = 0.5,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "iron_tokens",
		token_amount = 8
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 3
	},
	pacing_overrides = {
		peak_intensity_threshold = 45
	}
}
DifficultySettings.normal = {
	amount_storm_vermin_patrol = 8,
	display_name = "difficulty_normal",
	friendly_fire_ranged = false,
	allow_respawns = true,
	friendly_fire_melee = false,
	stagger_modifier = 0.8,
	display_image = "difficulty_option_2",
	completed_frame_texture = "map_frame_01",
	required_power_level = 0,
	power_level_cap = 400,
	xp_multiplier = 1,
	wounds = 5,
	description = "difficulty_normal_desc",
	slot_healthkit = "potion_healing_draught_01",
	rank = 2,
	chance_of_shield_vermin_patrol = 0.3,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	attack_intensity_threshold = 2.5,
	respawn = {
		ammo_melee = 0.5,
		health_percentage = 0.5,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "iron_tokens",
		token_amount = 8
	}
}
DifficultySettings.hard = {
	amount_storm_vermin_patrol = 10,
	display_name = "difficulty_hard",
	allow_respawns = true,
	friendly_fire_melee = false,
	stagger_modifier = 0.9,
	display_image = "difficulty_option_3",
	friendly_fire_ranged = false,
	completed_frame_texture = "map_frame_02",
	required_power_level = 300,
	power_level_cap = 600,
	xp_multiplier = 1.25,
	wounds = 3,
	description = "difficulty_hard_desc",
	rank = 3,
	chance_of_shield_vermin_patrol = 0.7,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	attack_intensity_threshold = 3.5,
	respawn = {
		ammo_melee = 0.5,
		health_percentage = 0.5,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "bronze_tokens",
		token_amount = 8
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 1.5
	},
	pacing_overrides = {
		peak_intensity_threshold = 50
	}
}
DifficultySettings.survival_hard = table.clone(DifficultySettings.hard)
DifficultySettings.survival_hard.display_name = "dlc1_2_difficulty_survival_hard"
DifficultySettings.harder = {
	amount_storm_vermin_patrol = 14,
	display_name = "difficulty_harder",
	friendly_fire_multiplier = 0.25,
	friendly_fire_melee = false,
	friendly_fire_ranged = true,
	stagger_modifier = 0.8,
	display_image = "difficulty_option_4",
	allow_respawns = true,
	completed_frame_texture = "map_frame_03",
	required_power_level = 400,
	power_level_cap = 800,
	wounds = 2,
	description = "difficulty_harder_desc",
	xp_multiplier = 1.5,
	rank = 4,
	chance_of_shield_vermin_patrol = 1,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	attack_intensity_threshold = 6,
	respawn = {
		ammo_melee = 0.5,
		health_percentage = 0.5,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "bronze_tokens",
		token_amount = 8
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 1
	},
	pacing_overrides = {
		peak_intensity_threshold = 55
	}
}
DifficultySettings.survival_harder = table.clone(DifficultySettings.harder)
DifficultySettings.survival_harder.friendly_fire_ranged = false
DifficultySettings.survival_harder.display_name = "dlc1_2_difficulty_survival_harder"
DifficultySettings.hardest = {
	amount_storm_vermin_patrol = 20,
	display_name = "difficulty_hardest",
	friendly_fire_multiplier = 0.5,
	friendly_fire_melee = false,
	friendly_fire_ranged = true,
	stagger_modifier = 0.6,
	display_image = "difficulty_option_5",
	allow_respawns = true,
	completed_frame_texture = "map_frame_04",
	required_power_level = 600,
	power_level_cap = 1000,
	wounds = 2,
	description = "difficulty_hardest_desc",
	xp_multiplier = 2,
	rank = 5,
	chance_of_shield_vermin_patrol = 1,
	max_hp = 100,
	amount_shield_vermin_patrol = 2,
	attack_intensity_threshold = 100,
	respawn = {
		ammo_melee = 0.5,
		health_percentage = 0.75,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "silver_tokens",
		token_amount = 8
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 0.5
	},
	pacing_overrides = {
		peak_intensity_threshold = 70
	}
}
DifficultySettings.survival_hardest = table.clone(DifficultySettings.hardest)
DifficultySettings.survival_hardest.max_hp = 150
DifficultySettings.survival_hardest.friendly_fire_ranged = false
DifficultySettings.survival_hardest.display_name = "dlc1_2_difficulty_survival_hardest"
DifficultyRanks = {}

for _, settings in pairs(DifficultySettings) do
	DifficultyRanks[#DifficultyRanks + 1] = settings.rank
end

Difficulties = {
	"easy",
	"normal",
	"hard",
	"harder",
	"hardest",
	"survival_hard",
	"survival_harder",
	"survival_hardest"
}
DefaultDifficulties = {
	"normal",
	"hard",
	"harder",
	"hardest"
}
SurvivalDifficulties = {
	"survival_hard",
	"survival_harder",
	"survival_hardest"
}
DefaultStartingDifficulty = "hard"
DefaultQuickPlayStartingDifficulty = "normal"
SurvivalStartWaveByDifficulty = {
	survival_harder = 13,
	survival_hardest = 26,
	survival_hard = 0
}
SurvivalDifficultyByStartWave = {}

for difficulty, wave in pairs(SurvivalStartWaveByDifficulty) do
	SurvivalDifficultyByStartWave[wave] = difficulty
end

SurvivalEndWaveByDifficulty = {
	survival_harder = 26,
	survival_hardest = 39,
	survival_hard = 13
}

return 
