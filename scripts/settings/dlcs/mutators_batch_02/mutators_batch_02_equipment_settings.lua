local settings = DLCSettings.mutators_batch_02
settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_mutators_batch_02"
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/mutator_statue_01"
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_mutators_batch_02"
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_mutators_batch_02"
}
settings.explosion_templates = {
	loot_rat_explosion = {
		explosion = {
			radius = 4,
			attack_template = "loot_rat_explosion",
			alert_enemies = true,
			damage_type_glance = "grenade_glance",
			damage_type = "grenade",
			alert_enemies_radius = 10,
			sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
			catapult_force = 10,
			effect_name = "fx/mutator_warp_explosion_01",
			always_hurt_players = true,
			max_damage_radius = 1.5,
			catapult_players = true,
			dot_template_name = "burning_1W_dot",
			catapult_force_z = 5,
			damage_profile = "loot_rat_explosion",
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
	},
	mutator_statue_explosion_01 = {
		explosion = {
			radius = 6,
			sound_event_name = "Play_mutator_ticking_bomb_explosion",
			attack_template = "mutator_statue_explosion_01",
			alert_enemies = true,
			damage_type_glance = "grenade_glance",
			effect_name = "fx/ticking_bomb_explosion_01",
			alert_enemies_radius = 10,
			damage_type = "grenade",
			catapult_force = 10,
			ignore_attacker_unit = true,
			level_unit_damage = true,
			always_hurt_players = true,
			max_damage_radius = 2,
			catapult_players = true,
			dot_template_name = "burning_1W_dot",
			catapult_force_z = 5,
			damage_profile = "mutator_statue_explosion_01",
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
