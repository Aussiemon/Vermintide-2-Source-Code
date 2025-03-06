-- chunkname: @scripts/settings/dlcs/mutators_batch_01/mutators_batch_01_equipment_settings.lua

local settings = DLCSettings.mutators_batch_01

settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_mutators_batch_01",
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_mutators_batch_01",
}
settings.explosion_templates = {
	ticking_bomb_explosion = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			allow_friendly_fire_override = true,
			attack_template = "ticking_bomb_explosion",
			bot_damage_immunity = true,
			bot_damage_profile = "ticking_bomb_explosion_bot",
			bot_knockback_immunity = false,
			catapult_force = 10,
			catapult_force_z = 5,
			catapult_players = true,
			damage_profile = "ticking_bomb_explosion",
			dot_template_name = "burning_dot_1tick",
			effect_name = "fx/ticking_bomb_explosion_01",
			ignore_attacker_unit = true,
			max_damage_radius = 2,
			radius = 6,
			sound_event_name = "Play_mutator_ticking_bomb_explosion",
			difficulty_power_level = {
				easy = {
					power_level = 200,
					power_level_glance = 100,
				},
				normal = {
					power_level = 400,
					power_level_glance = 200,
				},
				hard = {
					power_level = 600,
					power_level_glance = 300,
				},
				harder = {
					power_level = 800,
					power_level_glance = 400,
				},
				hardest = {
					power_level = 1000,
					power_level_glance = 500,
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
			},
			immune_breeds = {
				skaven_explosive_loot_rat = true,
			},
			camera_effect = {
				far_distance = 20,
				far_scale = 0.15,
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
			},
		},
	},
}
