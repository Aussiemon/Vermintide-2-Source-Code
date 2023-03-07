local settings = DLCSettings.mutators_batch_01
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_mutators_batch_01"
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_mutators_batch_01"
}
settings.explosion_templates = {
	ticking_bomb_explosion = {
		explosion = {
			radius = 6,
			attack_template = "ticking_bomb_explosion",
			sound_event_name = "Play_mutator_ticking_bomb_explosion",
			alert_enemies = true,
			damage_type_glance = "grenade_glance",
			alert_enemies_radius = 10,
			damage_type = "grenade",
			catapult_force = 10,
			ignore_attacker_unit = true,
			effect_name = "fx/ticking_bomb_explosion_01",
			always_hurt_players = true,
			max_damage_radius = 2,
			catapult_players = true,
			dot_template_name = "burning_1W_dot",
			catapult_force_z = 5,
			bot_damage_profile = "ticking_bomb_explosion_bot",
			damage_profile = "ticking_bomb_explosion",
			difficulty_power_level = {
				easy = {
					power_level_glance = 100,
					power_level = 200
				},
				normal = {
					power_level_glance = 200,
					power_level = 400
				},
				hard = {
					power_level_glance = 300,
					power_level = 600
				},
				harder = {
					power_level_glance = 400,
					power_level = 800
				},
				hardest = {
					power_level_glance = 500,
					power_level = 1000
				},
				cataclysm = {
					power_level_glance = 300,
					power_level = 600
				},
				cataclysm_2 = {
					power_level_glance = 400,
					power_level = 800
				},
				cataclysm_3 = {
					power_level_glance = 500,
					power_level = 1000
				}
			},
			immune_breeds = {
				skaven_explosive_loot_rat = true
			},
			camera_effect = {
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
				far_scale = 0.15,
				far_distance = 20
			}
		}
	}
}
