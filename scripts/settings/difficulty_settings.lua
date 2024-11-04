-- chunkname: @scripts/settings/difficulty_settings.lua

DifficultySettings = DifficultySettings or {}
DifficultySettings.normal = {
	allow_respawns = true,
	always_damage_heavy = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 0.3,
	completed_frame_texture = "map_frame_01",
	damage_percent_cap = 0.1,
	description = "difficulty_normal_desc",
	display_image = "difficulty_option_2",
	display_name = "difficulty_normal",
	friendly_fire_melee = false,
	friendly_fire_ranged = false,
	knocked_down_damage_multiplier = 0.5,
	max_chest_power_level = 100,
	max_hp = 150,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 400,
	power_level_max_target = 400,
	rank = 2,
	required_power_level = 0,
	slot_healthkit = "potion_healing_draught_01",
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 1,
	wounds = 5,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "iron_tokens",
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
}
DifficultySettings.hard = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 0.7,
	completed_frame_texture = "map_frame_02",
	description = "difficulty_hard_desc",
	display_image = "difficulty_option_3",
	display_name = "difficulty_hard",
	friendly_fire_melee = false,
	friendly_fire_ranged = false,
	max_chest_power_level = 300,
	max_hp = 150,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 500,
	power_level_max_target = 500,
	rank = 3,
	required_power_level = 300,
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 1,
	wounds = 3,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "bronze_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 1.5,
	},
	pacing_overrides = {
		peak_intensity_threshold = 50,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
}
DifficultySettings.harder = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 1,
	completed_frame_texture = "map_frame_03",
	description = "difficulty_harder_desc",
	display_image = "difficulty_option_4",
	display_name = "difficulty_harder",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.1,
	friendly_fire_ranged = true,
	max_chest_power_level = 300,
	max_hp = 150,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 800,
	power_level_max_target = 300,
	rank = 4,
	required_power_level = 400,
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 1,
	wounds = 2,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "bronze_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 1,
	},
	pacing_overrides = {
		peak_intensity_threshold = 55,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
}
DifficultySettings.hardest = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 1,
	completed_frame_texture = "map_frame_04",
	description = "difficulty_hardest_desc",
	display_image = "difficulty_option_5",
	display_name = "difficulty_hardest",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	max_chest_power_level = 300,
	max_hp = 100,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 935,
	power_level_max_target = 400,
	rank = 5,
	required_power_level = 600,
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 0.9,
	wounds = 2,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0.25,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "silver_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 0.5,
	},
	pacing_overrides = {
		peak_intensity_threshold = 70,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
}
DifficultySettings.cataclysm = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 1,
	completed_frame_texture = "map_frame_05",
	description = "difficulty_cataclysm_desc",
	display_image = "difficulty_option_6",
	display_name = "difficulty_cataclysm",
	dlc_requirement = "scorpion",
	extra_requirement_name = "kill_all_lords_on_legend",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	max_chest_power_level = 300,
	max_hp = 100,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 2000,
	power_level_max_target = 100,
	rank = 6,
	required_power_level = 700,
	show_warning = true,
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 0.75,
	wounds = 2,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0.25,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "silver_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 0.5,
	},
	pacing_overrides = {
		peak_intensity_threshold = 70,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
	button_textures = {
		background = "difficulty_cataclysm_button_background",
		lit_texture = "scorpion_icon_lit",
		unlit_texture = "scorpion_icon_unlit",
	},
}
DifficultySettings.cataclysm_2 = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 1,
	completed_frame_texture = "map_frame_05",
	description = "difficulty_cataclysm_desc",
	display_image = "difficulty_option_6",
	display_name = "difficulty_cataclysm_2",
	dlc_requirement = "scorpion",
	extra_requirement_name = "kill_all_lords_on_legend",
	fallback_difficulty = "cataclysm",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	max_chest_power_level = 300,
	max_hp = 100,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 2000,
	power_level_max_target = 100,
	rank = 7,
	required_power_level = 700,
	show_warning = true,
	stagger_damage_multiplier = 0.3,
	stagger_modifier = 0.6,
	wounds = 2,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.25,
		temporary_health_percentage = 0.5,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "silver_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 0.5,
	},
	pacing_overrides = {
		peak_intensity_threshold = 70,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
	button_textures = {
		background = "difficulty_cataclysm_button_background",
		lit_texture = "scorpion_icon_lit",
		unlit_texture = "scorpion_icon_unlit",
	},
}
DifficultySettings.cataclysm_3 = {
	allow_respawns = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 1,
	completed_frame_texture = "map_frame_05",
	description = "difficulty_cataclysm_desc",
	display_image = "difficulty_option_6",
	display_name = "difficulty_cataclysm_3",
	dlc_requirement = "scorpion",
	extra_requirement_name = "kill_all_lords_on_legend",
	fallback_difficulty = "cataclysm",
	friendly_fire_melee = false,
	friendly_fire_multiplier = 0.25,
	friendly_fire_ranged = true,
	max_chest_power_level = 300,
	max_hp = 100,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 2000,
	rank = 8,
	required_power_level = 700,
	show_warning = true,
	stagger_damage_multiplier = 0.5,
	stagger_modifier = 0.6,
	wounds = 2,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.1,
		temporary_health_percentage = 0.65,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "silver_tokens",
	},
	intensity_overrides = {
		intensity_add_per_percent_dmg_taken = 0.5,
	},
	pacing_overrides = {
		peak_intensity_threshold = 70,
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
	button_textures = {
		background = "difficulty_cataclysm_button_background",
		lit_texture = "scorpion_icon_lit",
		unlit_texture = "scorpion_icon_unlit",
	},
}
DifficultySettings.versus_base = {
	allow_respawns = true,
	always_damage_heavy = true,
	amount_shield_vermin_patrol = 2,
	chance_of_shield_vermin_patrol = 0.3,
	completed_frame_texture = "map_frame_01",
	damage_percent_cap = 1,
	description = "difficulty_versus_desc",
	display_image = "difficulty_option_2",
	display_name = "difficulty_versus",
	fallback_difficulty = "hard",
	friendly_fire_melee = false,
	friendly_fire_ranged = false,
	knocked_down_damage_multiplier = 0.5,
	max_chest_power_level = 100,
	max_hp = 150,
	min_stagger_damage_coefficient = 1,
	power_level_cap = 400,
	power_level_max_target = 400,
	rank = 9,
	required_power_level = 0,
	stagger_damage_multiplier = 0.2,
	stagger_modifier = 1,
	wounds = 5,
	xp_multiplier = 2,
	respawn = {
		ammo_melee = 0.5,
		ammo_ranged = 0.5,
		health_percentage = 0.5,
		temporary_health_percentage = 0,
	},
	level_failed_reward = {
		token_amount = 8,
		token_type = "iron_tokens",
	},
	weave_settings = {
		experience_reward_on_complete = 200,
	},
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
		end,
	},
}
DifficultyRanks = {}
DifficultyRankLookup = {}
MinimumDifficultyRank = math.huge
MaximumDifficultyRank = 0

for key, settings in pairs(DifficultySettings) do
	DifficultyRanks[#DifficultyRanks + 1] = settings.rank
	DifficultyRankLookup[settings.rank] = key
	DifficultyRankLookup[key] = settings.rank
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
	"cataclysm_3",
	"versus_base",
}
DefaultDifficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}
DifficultyMapping = {
	cataclysm = "cataclysm",
	hard = "veteran",
	harder = "champion",
	hardest = "legend",
	normal = "recruit",
}
DefaultStartingDifficulty = "hard"
DefaultQuickPlayStartingDifficulty = "normal"
DefaultAdventureModeStartingDifficulty = "normal"

require("scripts/settings/difficulty_tweak")
