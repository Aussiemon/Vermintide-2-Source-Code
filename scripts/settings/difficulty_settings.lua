DifficultySettings = DifficultySettings or {}
DifficultySettings.normal = {
	completed_frame_texture = "map_frame_01",
	display_name = "difficulty_normal",
	always_damage_heavy = true,
	allow_respawns = true,
	friendly_fire_melee = false,
	slot_healthkit = "potion_healing_draught_01",
	stagger_modifier = 1,
	required_power_level = 0,
	power_level_cap = 400,
	xp_multiplier = 2,
	max_chest_power_level = 100,
	friendly_fire_ranged = false,
	damage_percent_cap = 0.1,
	wounds = 5,
	description = "difficulty_normal_desc",
	stagger_damage_multiplier = 0.2,
	knocked_down_damage_multiplier = 0.5,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 400,
	rank = 2,
	chance_of_shield_vermin_patrol = 0.3,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_2",
	respawn = {
		temporary_health_percentage = 0,
		health_percentage = 0.5,
		ammo_melee = 0.5,
		ammo_ranged = 0.5
	},
	level_failed_reward = {
		token_type = "iron_tokens",
		token_amount = 8
	},
	weave_settings = {
		experience_reward_on_complete = 200
	}
}
DifficultySettings.hard = {
	completed_frame_texture = "map_frame_02",
	display_name = "difficulty_hard",
	allow_respawns = true,
	friendly_fire_ranged = false,
	friendly_fire_melee = false,
	stagger_modifier = 1,
	required_power_level = 300,
	power_level_cap = 500,
	xp_multiplier = 2,
	max_chest_power_level = 300,
	wounds = 3,
	description = "difficulty_hard_desc",
	stagger_damage_multiplier = 0.2,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 500,
	rank = 3,
	chance_of_shield_vermin_patrol = 0.7,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_3",
	respawn = {
		temporary_health_percentage = 0,
		health_percentage = 0.5,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	}
}
DifficultySettings.harder = {
	completed_frame_texture = "map_frame_03",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.1,
	display_name = "difficulty_harder",
	friendly_fire_ranged = true,
	allow_respawns = true,
	stagger_modifier = 1,
	required_power_level = 400,
	power_level_cap = 800,
	xp_multiplier = 2,
	max_chest_power_level = 300,
	wounds = 2,
	description = "difficulty_harder_desc",
	stagger_damage_multiplier = 0.2,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 300,
	rank = 4,
	chance_of_shield_vermin_patrol = 1,
	max_hp = 150,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_4",
	respawn = {
		temporary_health_percentage = 0,
		health_percentage = 0.5,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	}
}
DifficultySettings.hardest = {
	completed_frame_texture = "map_frame_04",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	display_name = "difficulty_hardest",
	friendly_fire_ranged = true,
	allow_respawns = true,
	stagger_modifier = 0.9,
	required_power_level = 600,
	power_level_cap = 935,
	xp_multiplier = 2,
	max_chest_power_level = 300,
	wounds = 2,
	description = "difficulty_hardest_desc",
	stagger_damage_multiplier = 0.2,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 400,
	rank = 5,
	chance_of_shield_vermin_patrol = 1,
	max_hp = 100,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_5",
	respawn = {
		temporary_health_percentage = 0.25,
		health_percentage = 0.5,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	}
}
DifficultySettings.cataclysm = {
	completed_frame_texture = "map_frame_05",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	display_name = "difficulty_cataclysm",
	extra_requirement_name = "kill_all_lords_on_legend",
	friendly_fire_ranged = true,
	allow_respawns = true,
	stagger_modifier = 0.75,
	required_power_level = 700,
	power_level_cap = 2000,
	xp_multiplier = 2,
	max_chest_power_level = 300,
	wounds = 2,
	description = "difficulty_cataclysm_desc",
	dlc_requirement = "scorpion",
	stagger_damage_multiplier = 0.2,
	show_warning = true,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 100,
	rank = 6,
	chance_of_shield_vermin_patrol = 1,
	max_hp = 100,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_6",
	respawn = {
		temporary_health_percentage = 0.25,
		health_percentage = 0.5,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	},
	button_textures = {
		lit_texture = "scorpion_icon_lit",
		background = "difficulty_cataclysm_button_background",
		unlit_texture = "scorpion_icon_unlit"
	}
}
DifficultySettings.cataclysm_2 = {
	completed_frame_texture = "map_frame_05",
	display_name = "difficulty_cataclysm_2",
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	extra_requirement_name = "kill_all_lords_on_legend",
	allow_respawns = true,
	friendly_fire_melee = false,
	stagger_modifier = 0.6,
	required_power_level = 700,
	fallback_difficulty = "cataclysm",
	power_level_cap = 2000,
	xp_multiplier = 2,
	wounds = 2,
	description = "difficulty_cataclysm_desc",
	max_chest_power_level = 300,
	stagger_damage_multiplier = 0.3,
	dlc_requirement = "scorpion",
	max_hp = 100,
	show_warning = true,
	min_stagger_damage_coefficient = 1,
	power_level_max_target = 100,
	rank = 7,
	chance_of_shield_vermin_patrol = 1,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_6",
	respawn = {
		temporary_health_percentage = 0.5,
		health_percentage = 0.25,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	},
	button_textures = {
		lit_texture = "scorpion_icon_lit",
		background = "difficulty_cataclysm_button_background",
		unlit_texture = "scorpion_icon_unlit"
	}
}
DifficultySettings.cataclysm_3 = {
	completed_frame_texture = "map_frame_05",
	display_name = "difficulty_cataclysm_3",
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	extra_requirement_name = "kill_all_lords_on_legend",
	allow_respawns = true,
	friendly_fire_melee = false,
	stagger_modifier = 0.6,
	required_power_level = 700,
	fallback_difficulty = "cataclysm",
	power_level_cap = 2000,
	xp_multiplier = 2,
	wounds = 2,
	description = "difficulty_cataclysm_desc",
	max_chest_power_level = 300,
	stagger_damage_multiplier = 0.5,
	dlc_requirement = "scorpion",
	max_hp = 100,
	show_warning = true,
	min_stagger_damage_coefficient = 1,
	rank = 8,
	chance_of_shield_vermin_patrol = 1,
	amount_shield_vermin_patrol = 2,
	display_image = "difficulty_option_6",
	respawn = {
		temporary_health_percentage = 0.65,
		health_percentage = 0.1,
		ammo_melee = 0.5,
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
	},
	weave_settings = {
		experience_reward_on_complete = 200
	},
	button_textures = {
		lit_texture = "scorpion_icon_lit",
		background = "difficulty_cataclysm_button_background",
		unlit_texture = "scorpion_icon_unlit"
	}
}

for name, setting in pairs(DifficultySettings) do
	setting.difficulty = name
end

ExtraDifficultyRequirements = {
	kill_all_lords_on_legend = {
		description_text = "achv_scorpion_cataclysm_unlock_kill_all_lords_desc",
		requirement_function = function ()
			if Development.parameter("unlock_all_difficulties") then
				return true
			end

			local backend_stats = Managers.backend:get_stats()
			local champion_completed = (tonumber(backend_stats.kill_chaos_exalted_champion_scorpion_hardest) or 0) >= 5
			local sorcerer_completed = (tonumber(backend_stats.kill_chaos_exalted_sorcerer_scorpion_hardest) or 0) >= 5
			local gray_seer_completed = (tonumber(backend_stats.kill_skaven_grey_seer_scorpion_hardest) or 0) >= 5
			local storm_vermin_completed = (tonumber(backend_stats.kill_skaven_storm_vermin_warlord_scorpion_hardest) or 0) >= 5
			local difficulty_approved = champion_completed and sorcerer_completed and gray_seer_completed and storm_vermin_completed

			return difficulty_approved
		end
	}
}
DifficultyRanks = {}
MinimumDifficultyRank = math.huge
MaximumDifficultyRank = 0

for _, settings in pairs(DifficultySettings) do
	DifficultyRanks[#DifficultyRanks + 1] = settings.rank
	MinimumDifficultyRank = math.min(MinimumDifficultyRank, settings.rank)
	MaximumDifficultyRank = math.max(MaximumDifficultyRank, settings.rank)
end

Difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
	"cataclysm_2",
	"cataclysm_3"
}
DefaultDifficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
DifficultyMapping = {
	hardest = "legend",
	hard = "veteran",
	harder = "champion",
	cataclysm = "cataclysm",
	normal = "recruit"
}
DefaultStartingDifficulty = "hard"
DefaultQuickPlayStartingDifficulty = "normal"
DefaultAdventureModeStartingDifficulty = "normal"

require("scripts/settings/difficulty_tweak")

return
