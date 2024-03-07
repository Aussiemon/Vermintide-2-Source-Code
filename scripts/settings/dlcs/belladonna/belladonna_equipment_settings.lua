-- chunkname: @scripts/settings/dlcs/belladonna/belladonna_equipment_settings.lua

local settings = DLCSettings.belladonna

local function degrees_to_radians(degrees)
	return degrees * 0.0174532925
end

settings.light_weight_projectiles = {
	ungor_archer = {
		damage_profile = "ungor_archer_arrow",
		hit_effect = "arrow_impact",
		impact_push_speed = 3,
		light_weight_projectile_effect = "ungor_arrow",
		projectile_max_range = 50,
		projectile_speed = 35,
		spread = degrees_to_radians(0.05),
		dodge_spread = degrees_to_radians(4),
		first_shot_spread = degrees_to_radians(8),
		miss_spread = degrees_to_radians(4),
		attack_power_level = {
			20,
			40,
			70,
			100,
			150,
			250,
			250,
			250,
			40,
		},
		first_person_hit_flow_events = {
			"arrow_left",
			"arrow_right",
			"arrow_center",
		},
		projectile_linker = {
			depth = 0.1,
			depth_offset = -0.6,
			unit = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_arrow_01_3p",
		},
	},
}
settings.light_weight_projectile_effects = {
	ungor_arrow = {
		vfx = {
			{
				kill_policy = "destroy",
				particle_name = "fx/ungor_arrow",
			},
			{
				particle_name = "fx/ungor_arrow_flash",
			},
		},
		sfx = {
			{
				looping_sound_event_name = "Play_enemy_weapon_ungor_archer_arrow_start",
				looping_sound_stop_event_name = "Stop_enemy_weapon_ungor_archer_arrow_start",
			},
		},
	},
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_scorpion",
}
settings.explosion_templates = {
	standard_bearer_explosion = {
		explosion = {
			alert_enemies = false,
			alert_enemies_radius = 20,
			attack_template = "loot_rat_explosion",
			catapult_force = 7,
			catapult_players = true,
			damage_profile = "standard_bearer_explosion",
			effect_name = "fx/chr_beastmen_standard_bearer_start_01",
			max_damage_radius = 4,
			player_push_speed = 10,
			radius = 7,
			difficulty_power_level = {
				easy = {
					power_level = 800,
					power_level_glance = 800,
				},
				normal = {
					power_level = 800,
					power_level_glance = 800,
				},
				hard = {
					power_level = 800,
					power_level_glance = 800,
				},
				harder = {
					power_level = 800,
					power_level_glance = 800,
				},
				hardest = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm_2 = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm_3 = {
					power_level = 800,
					power_level_glance = 800,
				},
				versus_base = {
					power_level = 800,
					power_level_glance = 800,
				},
			},
			camera_effect = {
				far_distance = 30,
				far_scale = 0.25,
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
			},
			immune_breeds = {
				beastmen_standard_bearer = true,
			},
		},
	},
	standard_death_explosion = {
		explosion = {
			alert_enemies = false,
			alert_enemies_radius = 10,
			attack_template = "loot_rat_explosion",
			damage_profile = "standard_death_explosion",
			effect_name = "fx/chr_beastmen_standard_bearer_end_01",
			max_damage_radius = 3,
			player_push_speed = 10,
			radius = 4,
			difficulty_power_level = {
				easy = {
					power_level = 800,
					power_level_glance = 800,
				},
				normal = {
					power_level = 800,
					power_level_glance = 800,
				},
				hard = {
					power_level = 800,
					power_level_glance = 800,
				},
				harder = {
					power_level = 800,
					power_level_glance = 800,
				},
				hardest = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm_2 = {
					power_level = 800,
					power_level_glance = 800,
				},
				cataclysm_3 = {
					power_level = 800,
					power_level_glance = 800,
				},
				versus_base = {
					power_level = 800,
					power_level_glance = 800,
				},
			},
			camera_effect = {
				far_distance = 30,
				far_scale = 0.25,
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
			},
		},
	},
}
