-- chunkname: @scripts/settings/dlcs/grudge_marks/grudge_marks_common_settings.lua

local settings = DLCSettings.grudge_marks

settings.challenge_categories = {}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_grudge_marks",
}
settings.statistics_lookup = {
	"grudge_mark_kills_we_thornsister",
	"grudge_mark_kills_we_shade",
	"grudge_mark_kills_bw_adept",
	"grudge_mark_kills_wh_captain",
	"grudge_mark_kills_wh_priest",
	"grudge_mark_kills_dr_ranger",
	"grudge_mark_kills_wh_bountyhunter",
	"grudge_mark_kills_es_questingknight",
	"grudge_mark_kills_we_maidenguard",
	"grudge_mark_kills_dr_ironbreaker",
	"grudge_mark_kills_es_knight",
	"grudge_mark_kills_dr_engineer",
	"grudge_mark_kills_es_huntsman",
	"grudge_mark_kills_dr_slayer",
	"grudge_mark_kills_es_mercenary",
	"grudge_mark_kills_bw_scholar",
	"grudge_mark_kills_bw_unchained",
}
settings.anim_lookup = {}
settings.effects = {
	"fx/grudge_marks_shadow_step",
	"fx/grudge_marks_illusionist",
}
settings.unlock_settings = {}
settings.material_effect_mappings_file_names = {
	"scripts/settings/material_effect_mappings_grudge_marks",
}
settings.explosion_templates = {
	grudge_mark_shockwave = {
		explosion = {
			ai_friendly_fire = true,
			alert_enemies = true,
			alert_enemies_radius = 15,
			catapult_blocked_multiplier = 0.2,
			catapult_force = 7.5,
			catapult_force_z = 3,
			catapult_players = true,
			damage_profile = "ai_shockwave",
			effect_name = "fx/chr_kruber_shockwave",
			fatigue_type = "blocked_attack",
			ignore_attacker_unit = true,
			max_damage_radius = 4.5,
			radius = 4.5,
			sound_event_name = "Play_mutator_ticking_bomb_explosion",
			difficulty_power_level = {
				easy = {
					power_level = 200,
					power_level_glance = 100,
				},
				normal = {
					power_level = 100,
					power_level_glance = 100,
				},
				hard = {
					power_level = 200,
					power_level_glance = 200,
				},
				harder = {
					power_level = 300,
					power_level_glance = 300,
				},
				hardest = {
					power_level = 400,
					power_level_glance = 400,
				},
				cataclysm = {
					power_level = 600,
					power_level_glance = 300,
				},
				cataclysm_2 = {
					power_level = 800,
					power_level_glance = 400,
				},
				cataclysm_3 = {
					power_level = 1000,
					power_level_glance = 500,
				},
				versus_base = {
					power_level = 200,
					power_level_glance = 200,
				},
			},
		},
	},
	grudge_mark_termite_shockwave = {
		explosion = {
			ai_friendly_fire = true,
			alert_enemies = true,
			alert_enemies_radius = 15,
			catapult_blocked_multiplier = 0.2,
			catapult_force = 7.5,
			catapult_force_z = 3,
			catapult_players = true,
			damage_profile = "ai_shockwave",
			effect_name = "fx/chr_kruber_shockwave",
			fatigue_type = "blocked_attack",
			ignore_attacker_unit = true,
			max_damage_radius = 10,
			radius = 10,
			sound_event_name = "Play_mutator_ticking_bomb_explosion",
			difficulty_power_level = {
				easy = {
					power_level = 200,
					power_level_glance = 100,
				},
				normal = {
					power_level = 100,
					power_level_glance = 100,
				},
				hard = {
					power_level = 200,
					power_level_glance = 200,
				},
				harder = {
					power_level = 300,
					power_level_glance = 300,
				},
				hardest = {
					power_level = 400,
					power_level_glance = 400,
				},
				cataclysm = {
					power_level = 600,
					power_level_glance = 300,
				},
				cataclysm_2 = {
					power_level = 800,
					power_level_glance = 400,
				},
				cataclysm_3 = {
					power_level = 1000,
					power_level_glance = 500,
				},
				versus_base = {
					power_level = 200,
					power_level_glance = 200,
				},
			},
		},
	},
}
