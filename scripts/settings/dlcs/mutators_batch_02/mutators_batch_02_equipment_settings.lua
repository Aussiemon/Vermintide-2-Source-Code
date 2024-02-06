-- chunkname: @scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_equipment_settings.lua

local settings = DLCSettings.mutators_batch_02

settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_mutators_batch_02",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/mutator_statue_01",
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_mutators_batch_02",
}
settings.attack_template_files_names = {
	"scripts/settings/equipment/attack_templates_dlc_mutators_batch_02",
}
settings.explosion_templates = {
	loot_rat_explosion = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			allow_friendly_fire_override = true,
			attack_template = "loot_rat_explosion",
			catapult_force = 10,
			catapult_force_z = 5,
			catapult_players = true,
			damage_profile = "loot_rat_explosion",
			dot_template_name = "burning_dot_1tick",
			effect_name = "fx/mutator_warp_explosion_01",
			max_damage_radius = 1.5,
			radius = 4,
			sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
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
	mutator_statue_explosion_01 = {
		explosion = {
			alert_enemies = true,
			alert_enemies_radius = 10,
			allow_friendly_fire = true,
			attack_template = "mutator_statue_explosion_01",
			catapult_force = 10,
			catapult_force_z = 5,
			catapult_players = true,
			damage_profile = "mutator_statue_explosion_01",
			dot_template_name = "burning_dot_1tick",
			effect_name = "fx/ticking_bomb_explosion_01",
			ignore_attacker_unit = true,
			level_unit_damage = true,
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
