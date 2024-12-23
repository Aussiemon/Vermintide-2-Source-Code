-- chunkname: @scripts/settings/explosion_templates.lua

require("scripts/settings/explosion_utils")

ExplosionTemplates = {}
ExplosionTemplates.machinegun_poison_arrow = {
	explosion = {
		damage_profile = "poison_aoe",
		effect_name = "fx/wpnfx_poison_arrow_impact_machinegun",
		no_prop_damage = true,
		radius = 1,
		sound_event_name = "arrow_hit_poison_cloud",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.carbine_poison_arrow = {
	explosion = {
		damage_profile = "poison_aoe",
		effect_name = "fx/wpnfx_poison_arrow_impact_carbine",
		no_prop_damage = true,
		radius = 2,
		sound_event_name = "arrow_hit_poison_cloud",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.fireball = {
	explosion = {
		attacker_power_level_offset = 0.25,
		damage_profile = "fireball_explosion",
		damage_profile_glance = "fireball_explosion_glance",
		effect_name = "fx/wpnfx_drake_pistols_projectile_impact",
		max_damage_radius_max = 0.75,
		max_damage_radius_min = 0.1,
		radius_max = 1,
		radius_min = 0.5,
		sound_event_name = "drakepistol_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.drake_pistol_aoe = {
	explosion = {
		attacker_power_level_offset = 0.25,
		damage_profile = "fireball_explosion",
		damage_profile_glance = "fireball_explosion_glance",
		effect_name = "fx/wpnfx_drake_pistols_projectile_impact",
		max_damage_radius_max = 0.75,
		max_damage_radius_min = 0.1,
		radius_max = 1,
		radius_min = 0.5,
		sound_event_name = "drakepistol_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.fireball_charged = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		attacker_power_level_offset = 0.25,
		damage_profile = "fireball_charged_explosion",
		damage_profile_glance = "fireball_charged_explosion_glance",
		effect_name = "fx/wpnfx_fireball_charged_impact_remap",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		radius_max = 3,
		radius_min = 1.25,
		sound_event_name = "fireball_big_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.flaming_flail_impact = {
	explosion = {
		attacker_power_level_offset = 0.25,
		damage_profile = "fireball_explosion",
		damage_profile_glance = "fireball_explosion_glance",
		effect_name = "fx/wpnfx_flaming_flail_hit_01_remap",
		max_damage_radius_max = 0.75,
		max_damage_radius_min = 0.1,
		no_friendly_fire = true,
		radius_max = 1,
		radius_min = 0.5,
		sound_event_name = "drakepistol_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.flaming_flail_impact_heavy = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 10,
		attacker_power_level_offset = 0.1,
		damage_profile = "flaming_flail_explosion",
		damage_profile_glance = "flaming_flail_explosion_glance",
		effect_name = "fx/wpnfx_flaming_flail_hit_01_remap",
		exponential_falloff = true,
		max_damage_radius_max = 0.25,
		max_damage_radius_min = 0.2,
		no_friendly_fire = true,
		radius_max = 3,
		radius_min = 1.5,
		sound_event_name = "fireball_big_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.sienna_unchained_burning_enemies_explosion = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		attacker_power_level_offset = 0.01,
		damage_profile = "slayer_leap_landing",
		effect_name = "fx/wpnfx_fireball_charged_impact",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		no_friendly_fire = true,
		radius_max = 1.5,
		radius_min = 0.5,
		sound_event_name = "fireball_big_hit",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.grenade = {
	is_grenade = true,
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		attack_template = "grenade",
		damage_profile = "frag_grenade",
		damage_profile_glance = "frag_grenade_glance",
		dont_rotate_fx = true,
		effect_name = "fx/wpnfx_frag_grenade_impact",
		max_damage_radius = 2,
		radius = 5,
		sound_event_name = "player_combat_weapon_grenade_explosion",
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
				power_level = 1100,
				power_level_glance = 550,
			},
			cataclysm_2 = {
				power_level = 1150,
				power_level_glance = 575,
			},
			cataclysm_3 = {
				power_level = 1200,
				power_level_glance = 600,
			},
			versus_base = {
				power_level = 400,
				power_level_glance = 200,
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
}
ExplosionTemplates.engineer_grenade = {
	is_grenade = true,
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		attack_template = "grenade",
		damage_profile = "engineer_grenade",
		damage_profile_glance = "engineer_grenade_glance",
		dont_rotate_fx = true,
		effect_name = "fx/wpnfx_grenade_impact",
		max_damage_radius = 1,
		radius = 2.5,
		sound_event_name = "player_combat_weapon_grenade_explosion",
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
				power_level = 1100,
				power_level_glance = 550,
			},
			cataclysm_2 = {
				power_level = 1150,
				power_level_glance = 575,
			},
			cataclysm_3 = {
				power_level = 1200,
				power_level_glance = 600,
			},
			versus_base = {
				power_level = 400,
				power_level_glance = 200,
			},
		},
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 0.5,
			shake_name = "frag_grenade_explosion",
		},
	},
}
ExplosionTemplates.explosive_barrel = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		allow_friendly_fire_override = true,
		attack_template = "drakegun",
		damage_profile = "explosive_barrel",
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/wpnfx_barrel_explosion",
		max_damage_radius = 1.75,
		radius = 6,
		sound_event_name = "player_combat_weapon_grenade_explosion",
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
				power_level = 1100,
				power_level_glance = 550,
			},
			cataclysm_2 = {
				power_level = 1150,
				power_level_glance = 575,
			},
			cataclysm_3 = {
				power_level = 1200,
				power_level_glance = 600,
			},
			versus_base = {
				power_level = 400,
				power_level_glance = 200,
			},
		},
	},
}
ExplosionTemplates.lamp_oil = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		allow_friendly_fire_override = true,
		attack_template = "fire_grenade_explosion",
		damage_profile = "explosive_barrel",
		dot_template_name = "burning_dot_3tick",
		effect_name = "fx/wpnfx_fire_grenade_impact",
		max_damage_radius = 1.5,
		radius = 3,
		sound_event_name = "fireball_big_hit",
		difficulty_power_level = {
			easy = {
				power_level = 100,
				power_level_glance = 50,
			},
			normal = {
				power_level = 200,
				power_level_glance = 100,
			},
			hard = {
				power_level = 300,
				power_level_glance = 150,
			},
			harder = {
				power_level = 400,
				power_level_glance = 200,
			},
			hardest = {
				power_level = 500,
				power_level_glance = 250,
			},
			cataclysm = {
				power_level = 550,
				power_level_glance = 275,
			},
			cataclysm_2 = {
				power_level = 600,
				power_level_glance = 300,
			},
			cataclysm_3 = {
				power_level = 650,
				power_level_glance = 325,
			},
			versus_base = {
				power_level = 200,
				power_level_glance = 100,
			},
		},
	},
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "fire_grenade_dot",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_template_name = "burning_dot_1tick",
		duration = 5,
		nav_tag_volume_layer = "fire_grenade",
		radius = 6,
		sound_event_name = "player_combat_weapon_fire_grenade_explosion",
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.warpfire_explosion = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		allow_friendly_fire_override = true,
		damage_profile = "warpfire_thrower_explosion",
		effect_name = "fx/chr_warp_fire_explosion_01",
		max_damage_radius = 2.5,
		radius = 5,
		sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
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
				power_level = 100,
				power_level_glance = 100,
			},
		},
	},
}
ExplosionTemplates.huge_boss_explosion = {
	explosion = {
		collision_filter = "filter_explosion_overlap",
		damage_profile = "huge_boss_explosion",
		effect_name = "fx/warpfire_explosion_huge_01",
		ignore_attacker_unit = true,
		max_damage_radius = 2.5,
		only_line_of_sight = true,
		radius = 25,
		sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
		difficulty_power_level = {
			easy = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			normal = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			hard = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			harder = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			hardest = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			cataclysm = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			cataclysm_2 = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			cataclysm_3 = {
				power_level = 1000,
				power_level_glance = 1000,
			},
			versus_base = {
				power_level = 1000,
				power_level_glance = 1000,
			},
		},
	},
}
ExplosionTemplates.overcharge_explosion_dwarf = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		attack_template = "drakegun",
		damage_profile = "overcharge_explosion",
		damage_profile_glance = "overcharge_explosion_glance",
		effect_name = "fx/chr_overcharge_explosion_dwarf",
		ignore_attacker_unit = true,
		max_damage_radius = 4,
		power_level = 500,
		radius = 5,
		sound_event_name = "emitter_dwarf_bomb_explosion",
	},
}
ExplosionTemplates.overcharge_explosion_brw = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		attack_template = "drakegun",
		damage_profile = "overcharge_explosion",
		damage_profile_glance = "overcharge_explosion_glance",
		effect_name = "fx/wpnfx_staff_geiser_fire_large",
		ignore_attacker_unit = true,
		max_damage_radius = 4,
		power_level = 500,
		radius = 5,
		sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
	},
}
ExplosionTemplates.overcharge_explosion_necromancer = table.clone(ExplosionTemplates.overcharge_explosion_brw)
ExplosionTemplates.overcharge_explosion_necromancer.explosion.effect_name = "fx/player_overcharge_explosion_necromancer"
ExplosionTemplates.explosion_bw_unchained_ability = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		attack_template = "drakegun",
		attacker_power_level_offset = 0.25,
		damage_profile = "overcharge_explosion_ability",
		damage_profile_glance = "overcharge_explosion_glance_ability",
		effect_name = "fx/chr_unchained_living_bomb_3p",
		ignore_attacker_unit = true,
		max_damage_radius = 3,
		no_friendly_fire = true,
		radius = 5,
		sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.explosion_bw_unchained_ability_increased_radius = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		attacker_power_level_offset = 0.25,
		damage_profile = "overcharge_explosion_strong_ability",
		effect_name = "fx/chr_unchained_living_bomb_3p",
		ignore_attacker_unit = true,
		max_damage_radius = 3,
		no_friendly_fire = true,
		radius = 5,
		sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.fire_grenade = {
	is_grenade = true,
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		damage_profile = "explosive_barrel",
		dont_rotate_fx = true,
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/wpnfx_fire_grenade_impact",
		max_damage_radius = 1,
		radius = 2,
		sound_event_name = "fireball_big_hit",
		difficulty_power_level = {
			easy = {
				power_level = 59,
				power_level_glance = 50,
			},
			normal = {
				power_level = 50,
				power_level_glance = 50,
			},
			hard = {
				power_level = 50,
				power_level_glance = 75,
			},
			harder = {
				power_level = 100,
				power_level_glance = 100,
			},
			hardest = {
				power_level = 200,
				power_level_glance = 150,
			},
			cataclysm = {
				power_level = 300,
				power_level_glance = 150,
			},
			cataclysm_2 = {
				power_level = 400,
				power_level_glance = 200,
			},
			cataclysm_3 = {
				power_level = 500,
				power_level_glance = 250,
			},
			versus_base = {
				power_level = 50,
				power_level_glance = 50,
			},
		},
	},
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "fire_grenade_dot",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_template_name = "burning_dot_fire_grenade",
		duration = 5,
		nav_tag_volume_layer = "fire_grenade",
		radius = 6,
		sound_event_name = "player_combat_weapon_fire_grenade_explosion",
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.frag_fire_grenade = {
	is_grenade = true,
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		attack_template = "grenade",
		damage_profile = "frag_grenade",
		damage_profile_glance = "frag_grenade_glance",
		dont_rotate_fx = true,
		effect_name = "fx/wpnfx_frag_grenade_impact",
		max_damage_radius = 2,
		radius = 5,
		sound_event_name = "player_combat_weapon_grenade_explosion",
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
				power_level = 1100,
				power_level_glance = 550,
			},
			cataclysm_2 = {
				power_level = 1150,
				power_level_glance = 575,
			},
			cataclysm_3 = {
				power_level = 1200,
				power_level_glance = 600,
			},
			versus_base = {
				power_level = 400,
				power_level_glance = 200,
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
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "fire_grenade_dot",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_template_name = "burning_dot_fire_grenade",
		duration = 5,
		nav_tag_volume_layer = "fire_grenade",
		radius = 6,
		sound_event_name = "player_combat_weapon_fire_grenade_explosion",
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.conflag = {
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "wizard_staff_geiser",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_balefire_variant = true,
		dot_template_name = "burning_dot_1tick",
		duration = 2,
		nav_tag_volume_layer = "fire_grenade",
		radius = 4,
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains_remap",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.conflag_vs = {
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "wizard_staff_geiser",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_balefire_variant = true,
		dot_template_name = "burning_dot_1tick_vs",
		duration = 2,
		nav_tag_volume_layer = "fire_grenade",
		radius = 4,
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains_remap",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.portal_transformer = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		damage_profile = "default",
		damage_profile_glance = "default",
		level_unit_damage = true,
		max_damage_radius = 2,
		player_push_speed = 5,
		power_level = 500,
		radius = 5,
	},
}
ExplosionTemplates.elven_ruins_finish = {
	explosion = {
		alert_enemies = false,
		collision_filter = "filter_simple_explosion_overlap",
		damage_profile = "elven_ruins_finish",
		level_unit_damage = true,
		no_aggro = true,
		player_push_speed = 5,
		power_level = 2000,
		radius = 50,
	},
}
ExplosionTemplates.military_finish = {
	explosion = {
		alert_enemies = false,
		collision_filter = "filter_simple_explosion_overlap",
		damage_profile = "military_finish",
		level_unit_damage = true,
		no_aggro = true,
		player_push_speed = 5,
		power_level = 1000,
		radius = 300,
	},
}
ExplosionTemplates.doomwheel_finish = {
	explosion = {
		alert_enemies = false,
		collision_filter = "filter_simple_explosion_overlap",
		damage_profile = "military_finish",
		level_unit_damage = true,
		no_aggro = true,
		player_push_speed = 5,
		power_level = 1000,
		radius = 5,
	},
}
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		attacker_power_level_offset = 0.25,
		damage_profile = "slayer_leap_landing",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 4,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact = table.clone(ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger)
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.radius = 6
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.max_damage_radius = 3
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.damage_profile = "slayer_leap_landing_impact"
ExplosionTemplates.cannon_ball_throw = {
	explosion = {
		attack_template = "drakegun",
		damage_profile = "cannonball_impact",
		effect_name = "fx/wpnfx_frag_grenade_impact",
		ignore_attacker_unit = true,
		ignore_players = true,
		level_unit_damage = true,
		max_damage_radius = 5,
		no_prop_damage = true,
		power_level = 300,
		radius = 10,
		sound_event_name = "player_combat_weapon_grenade_explosion",
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 1,
			shake_name = "frag_grenade_explosion",
		},
		on_death_func = function (hit_unit)
			local stat_names = {
				"forest_fort_kill_cannonball",
				"forest_fort_kill_cannonball_cata",
			}

			for i = 1, #stat_names do
				local current_difficulty = Managers.state.difficulty:get_difficulty()
				local allowed_difficulties = QuestSettings.allowed_difficulties[stat_names[i]]
				local allowed_difficulty = allowed_difficulties[current_difficulty]
				local death_extension = ScriptUnit.extension(hit_unit, "death_system")

				if allowed_difficulty and not death_extension:has_death_started() then
					local local_player = Managers.player:local_player()
					local status_extension = ScriptUnit.has_extension(local_player.player_unit, "status_system")

					if status_extension and not status_extension.completed_cannonball_challenge then
						status_extension.num_cannonball_kills = status_extension.num_cannonball_kills and status_extension.num_cannonball_kills + 1 or 1

						if status_extension.num_cannonball_kills >= QuestSettings.forest_fort_kill_cannonball then
							local statistics_db = Managers.player:statistics_db()

							statistics_db:increment_stat_and_sync_to_clients(stat_names[i])

							status_extension.num_cannonball_kills = nil
							status_extension.completed_cannonball_challenge = true
						end
					end
				end
			end
		end,
	},
}
ExplosionTemplates.victor_captain_activated_ability_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.victor_captain_activated_ability_stagger_ping_debuff = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
		enemy_debuff = {
			"defence_debuff_enemies",
		},
	},
}
ExplosionTemplates.victor_captain_activated_ability_stagger_ping_debuff_improved = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
		enemy_debuff = {
			"defence_debuff_enemies",
			"victor_witchhunter_improved_damage_taken_ping",
		},
	},
}
ExplosionTemplates.sienna_adept_activated_ability_start_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/wpnfx_fireball_charged_impact",
		ignore_attacker_unit = true,
		max_damage_radius = 1.5,
		no_friendly_fire = true,
		radius = 3,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.sienna_adept_activated_ability_step_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/brw_adept_skill_03",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		radius = 4,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.sienna_adept_activated_ability_end_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/brw_adept_skill_01",
		ignore_attacker_unit = true,
		max_damage_radius = 2,
		no_friendly_fire = true,
		radius = 4,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.sienna_adept_activated_ability_end_stagger_improved = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		dot_template_name = "burning_dot",
		effect_name = "fx/brw_adept_skill_01",
		ignore_attacker_unit = true,
		max_damage_radius = 3,
		no_friendly_fire = true,
		radius = 5,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.kruber_mercenary_activated_ability_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attacker_power_level_offset = 0.01,
		damage_profile = "ability_push",
		max_damage_radius = 3,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.bardin_ranger_activated_ability_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		effect_name = "fx/wpnfx_smoke_grenade_impact",
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 7,
		sound_event_name = "Play_bardin_ranger_smoke_grenade_ability",
		use_attacker_power_level = true,
		mechanism_overrides = {
			versus = {
				effect_name = "fx/wpnfx_smoke_grenade_impact_versus",
			},
		},
	},
}
ExplosionTemplates.bardin_ranger_activated_ability_upgraded_stagger = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		attacker_power_level_offset = 0.01,
		damage_profile = "ability_push",
		max_damage_radius = 3,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.bardin_ironbreaker_gromril_stagger = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "ability_push",
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 5,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.bardin_slayer_push_on_dodge = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_profile = "light_push",
		max_damage_radius = 1.5,
		no_friendly_fire = true,
		no_prop_damage = true,
		radius = 1.5,
		use_attacker_power_level = true,
	},
}
ExplosionTemplates.chaos_zombie_explosion = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		allow_friendly_fire_override = true,
		attack_template = "chaos_zombie_explosion",
		damage_interval = 0,
		dot_template_name = "chaos_zombie_explosion",
		effect_name = "fx/chr_nurgle_explosion_01",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		power_level = 500,
		radius = 3.2,
		sound_event_name = "Play_enemy_chaos_warrior_transform_explode",
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
		},
	},
}
ExplosionTemplates.generic_mutator_explosion = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 20,
		attack_template = "chaos_zombie_explosion",
		damage_interval = 0,
		dot_template_name = "chaos_zombie_explosion",
		effect_name = "fx/mutator_death_01",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		power_level = 0,
		radius = 3.2,
		sound_event_name = "Play_mutator_enemy_split_small",
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
		},
	},
}
ExplosionTemplates.generic_mutator_explosion_medium = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 20,
		attack_template = "chaos_zombie_explosion",
		damage_interval = 0,
		dot_template_name = "chaos_zombie_explosion",
		effect_name = "fx/mutator_death_02",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		power_level = 0,
		radius = 3.2,
		sound_event_name = "Play_mutator_enemy_split_medium",
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
		},
	},
}
ExplosionTemplates.generic_mutator_explosion_large = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 20,
		attack_template = "chaos_zombie_explosion",
		damage_interval = 0,
		dot_template_name = "chaos_zombie_explosion",
		effect_name = "fx/mutator_death_03",
		max_damage_radius_max = 2,
		max_damage_radius_min = 0.5,
		power_level = 0,
		radius = 3.2,
		sound_event_name = "Play_mutator_enemy_split_large",
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
		},
	},
}
ExplosionTemplates.chaos_magic_missile = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		effect_name = "fx/wpnfx_fireball_charged_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		power_level = 500,
		radius = 3.2,
		sound_event_name = "fireball_big_hit",
		immune_breeds = {
			chaos_zombie = true,
			skaven_grey_seer = true,
			skaven_stormfiend = true,
		},
	},
}
ExplosionTemplates.chaos_strike_missile_impact = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		effect_name = "fx/chr_chaos_sorcerer_boss_strike_missile_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		radius = 2,
		sound_event_name = "fireball_big_hit",
		difficulty_power_level = {
			easy = {
				power_level = 10,
				power_level_glance = 5,
			},
			normal = {
				power_level = 20,
				power_level_glance = 10,
			},
			hard = {
				power_level = 30,
				power_level_glance = 20,
			},
			harder = {
				power_level = 40,
				power_level_glance = 30,
			},
			hardest = {
				power_level = 50,
				power_level_glance = 40,
			},
			cataclysm = {
				power_level = 50,
				power_level_glance = 40,
			},
		},
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
			skaven_grey_seer = true,
			skaven_stormfiend = true,
		},
	},
}
ExplosionTemplates.chaos_drachenfels_strike_missile_impact = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		damage_profile = "nurgle_ball",
		effect_name = "fx/drachenfels_gas_projectile_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		radius = 2,
		sound_event_name = "fireball_big_hit",
		difficulty_power_level = {
			easy = {
				power_level = 10,
				power_level_glance = 5,
			},
			normal = {
				power_level = 20,
				power_level_glance = 10,
			},
			hard = {
				power_level = 30,
				power_level_glance = 20,
			},
			harder = {
				power_level = 40,
				power_level_glance = 30,
			},
			hardest = {
				power_level = 50,
				power_level_glance = 40,
			},
			cataclysm = {
				power_level = 50,
				power_level_glance = 40,
			},
		},
		immune_breeds = {
			chaos_exalted_sorcerer = true,
			chaos_zombie = true,
			skaven_grey_seer = true,
			skaven_stormfiend = true,
		},
	},
}
ExplosionTemplates.chaos_slow_bomb_missile_missed = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		effect_name = "fx/chr_chaos_sorcerer_boss_projectile_flies_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		power_level = 500,
		radius = 3.2,
		sound_event_name = "Play_enemy_boss_sorcerer_slow_bomb_hit",
		immune_breeds = {
			chaos_spawn = true,
			chaos_zombie = true,
			skaven_grey_seer = true,
		},
	},
}
ExplosionTemplates.chaos_slow_bomb_missile_missed_new = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		effect_name = "fx/drachenfels_flies_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		power_level = 500,
		radius = 3.2,
		sound_event_name = "Play_enemy_boss_sorcerer_slow_bomb_hit",
		immune_breeds = {
			chaos_spawn = true,
			chaos_zombie = true,
			skaven_grey_seer = true,
		},
	},
}
ExplosionTemplates.grey_seer_warp_lightning_impact = {
	explosion = {
		alert_enemies = false,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		effect_name = "fx/warp_lightning_bolt_impact",
		max_damage_radius_max = 1,
		max_damage_radius_min = 0.5,
		power_level = 500,
		radius = 3.2,
		sound_event_name = "fireball_big_hit",
		immune_breeds = {
			chaos_zombie = true,
			skaven_grey_seer = true,
			skaven_stormfiend_boss = true,
		},
	},
}
ExplosionTemplates.chaos_slow_bomb_missile = {
	server_hit_func = function (projectile_unit, damage_source, owner_unit, hit_position, recent_impacts, explosion_template)
		local hit_unit = recent_impacts[ProjectileImpactDataIndex.UNIT]
		local hit_player = false
		local attacker_side = Managers.state.side.side_by_unit[owner_unit]

		if attacker_side and attacker_side.VALID_ENEMY_PLAYERS_AND_BOTS[hit_unit] then
			local status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

			if status_extension and not status_extension:is_disabled() then
				hit_player = true
			end
		end

		if hit_player then
			local projectile_locomotion_extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")
			local missile_template = projectile_locomotion_extension.true_flight_template
			local blob_unit = AiUtils.spawn_overpowering_blob(Managers.state.network, hit_unit, missile_template.overpowered_blob_health, missile_template.attached_life_time)
			local overpowered_template_name = "slow_bomb"

			StatusUtils.set_overpowered_network(hit_unit, true, overpowered_template_name, blob_unit)
			Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
		else
			local blackboard = BLACKBOARDS[owner_unit]
			local missed_explosion_template = ExplosionTemplates.chaos_slow_bomb_missile_missed

			AiUtils.ai_explosion(projectile_unit, owner_unit, blackboard, damage_source, missed_explosion_template)
		end
	end,
}
ExplosionTemplates.chaos_slow_bomb_missile_new = {
	server_hit_func = function (projectile_unit, damage_source, owner_unit, hit_position, recent_impacts, explosion_template)
		local hit_unit = recent_impacts[ProjectileImpactDataIndex.UNIT]
		local hit_player = false
		local attacker_side = Managers.state.side.side_by_unit[owner_unit]

		if attacker_side and attacker_side.VALID_ENEMY_PLAYERS_AND_BOTS[hit_unit] then
			local status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

			if status_extension and not status_extension:is_disabled() then
				hit_player = true
			end
		end

		if hit_player then
			local projectile_locomotion_extension = ScriptUnit.extension(projectile_unit, "projectile_locomotion_system")
			local missile_template = projectile_locomotion_extension.true_flight_template
			local blob_unit = AiUtils.spawn_overpowering_blob(Managers.state.network, hit_unit, missile_template.overpowered_blob_health, missile_template.attached_life_time)
			local overpowered_template_name = "fly_bomb"

			StatusUtils.set_overpowered_network(hit_unit, true, overpowered_template_name, blob_unit)
			Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
		else
			local blackboard = BLACKBOARDS[owner_unit]
			local missed_explosion_template = ExplosionTemplates.chaos_slow_bomb_missile_missed_new

			AiUtils.ai_explosion(projectile_unit, owner_unit, blackboard, damage_source, missed_explosion_template)
		end
	end,
}
ExplosionTemplates.chaos_vortex_dummy_missile = {
	explosion = {
		alert_enemies = false,
		alert_enemies_radius = 20,
		allow_friendly_fire_override = true,
		attack_template = "chaos_magic_missile",
		damage_interval = 0,
		max_damage_radius_max = 0.1,
		max_damage_radius_min = 0.1,
		power_level = 0,
		radius = 0.1,
	},
}
ExplosionTemplates.lightning_strike = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		allow_friendly_fire_override = true,
		attack_template = "grenade",
		buildup_effect_name = "fx/magic_wind_heavens_lightning_strike_02",
		buildup_effect_time = 1.5,
		damage_interval = 0,
		damage_profile = "heavens_lightning_strike",
		different_power_levels_for_players = true,
		effect_name = "fx/magic_wind_heavens_lightning_strike_01",
		radius = 4,
		sound_event_name = "Play_mutator_enemy_split_large",
		trigger_on_server_only = true,
		wind_mutator = true,
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 1,
			shake_name = "lightning_strike",
		},
	},
}
ExplosionTemplates.lightning_strike_twitch = {
	follow_time = 5,
	time_to_explode = 5,
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 20,
		allow_friendly_fire_override = true,
		attack_template = "grenade",
		buildup_effect_name = "fx/magic_wind_heavens_lightning_strike_02",
		buildup_effect_time = 1.5,
		damage_interval = 0,
		damage_profile = "heavens_lightning_strike",
		effect_name = "fx/magic_wind_heavens_lightning_strike_01",
		power_level = 250,
		radius = 4,
		sound_event_name = "Play_mutator_enemy_split_large",
		trigger_on_server_only = true,
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 1,
			shake_name = "lightning_strike",
		},
	},
}
ExplosionTemplates.death_spirit_bomb = {
	explosion = {
		effect_name = "fx/magic_wind_death_spirit_explosion_01",
		power_level = 0,
		radius = 1,
		trigger_on_server_only = true,
		wind_mutator = true,
	},
}
ExplosionTemplates.bastion_light_spirit = {
	explosion = {
		effect_name = "fx/bastion_light_spirit_impact",
		power_level = 0,
		radius = 1,
		trigger_on_server_only = true,
		wind_mutator = true,
	},
}
ExplosionTemplates.light_pulse = {
	explosion = {
		allow_friendly_fire_override = true,
		buff_to_apply = "mutator_light_cleansing_curse_buff",
		effect_name = "fx/magic_wind_light_beacon_01",
		power_level = 0,
		radius = 5,
		trigger_on_server_only = true,
		wind_mutator = true,
		immune_breeds = {
			all = true,
		},
	},
}
ExplosionTemplates.metal_mutator_blade_dance = {
	explosion = {
		damage_profile = "blade_storm",
		hit_sound_event = "Play_wind_metal_gameplay_mutator_wind_hit",
		ignore_buffs = true,
		no_friendly_fire = true,
		radius = 4,
		wind_mutator = true,
	},
}
ExplosionTemplates.fire_bomb = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 10,
		allow_friendly_fire_override = true,
		attack_template = "ticking_bomb_explosion",
		bot_damage_profile = "ticking_bomb_explosion_bot",
		damage_profile = "ticking_bomb_explosion",
		dot_template_name = "burning_dot_1tick",
		effect_name = "fx/magic_wind_fire_explosion_01",
		radius = 1,
		sound_event_name = "Play_mutator_ticking_bomb_explosion",
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 1,
			shake_name = "frag_grenade_explosion",
		},
	},
}
ExplosionTemplates.twitch_pulse_explosion = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		damage_profile = "ability_push",
		effect_name = "fx/chr_kruber_shockwave",
		max_damage_radius = 3,
		no_friendly_fire = true,
		no_prop_damage = true,
		power_level = 600,
		radius = 10,
		sound_event_name = "Play_mutator_ticking_bomb_explosion",
	},
}
ExplosionTemplates.suicide_blast = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 15,
		allow_friendly_fire_override = true,
		attack_template = "fire_grenade_explosion",
		damage_profile = "explosive_barrel",
		dot_template_name = "burning_3W_dot",
		effect_name = "fx/wpnfx_fire_grenade_impact",
		max_damage_radius = 4,
		radius = 4,
		sound_event_name = "fireball_big_hit",
		difficulty_power_level = {
			easy = {
				power_level = 100,
				power_level_glance = 50,
			},
			normal = {
				power_level = 200,
				power_level_glance = 100,
			},
			hard = {
				power_level = 300,
				power_level_glance = 150,
			},
			harder = {
				power_level = 400,
				power_level_glance = 200,
			},
			hardest = {
				power_level = 500,
				power_level_glance = 250,
			},
			survival_hard = {
				power_level = 300,
				power_level_glance = 150,
			},
			survival_harder = {
				power_level = 400,
				power_level_glance = 200,
			},
			survival_hardest = {
				power_level = 500,
				power_level_glance = 250,
			},
		},
	},
	aoe = {
		area_damage_template = "explosion_template_aoe",
		attack_template = "fire_grenade_dot",
		create_nav_tag_volume = true,
		damage_interval = 1,
		dot_template_name = "burning_dot_1tick",
		duration = 3,
		nav_tag_volume_layer = "bot_poison_wind",
		radius = 4,
		sound_event_name = "player_combat_weapon_fire_grenade_explosion",
		nav_mesh_effect = {
			particle_name = "fx/wpnfx_fire_grenade_impact_remains",
			particle_radius = 2,
			particle_spacing = 0.9,
		},
	},
}
ExplosionTemplates.gutter_runner_foff = {
	explosion = {
		attack_template = "drakegun",
		damage_profile = "ability_push",
		duration = 1,
		effect_name = "fx/chr_gutter_foff",
		max_damage_radius = 2,
		power_level = 200,
		radius = 3,
	},
}
ExplosionTemplates.vs_rat_ogre_leap_landing = {
	explosion = {
		allow_friendly_fire_override = true,
		attack_template = "rat_ogre_leap_vs",
		catapult_force = 10,
		catapult_force_z = 4,
		catapult_players = true,
		damage_profile = "playable_boss_rat_ogre_leap_explosion_vs",
		effect_name = "fx/chr_rat_ogre_land_3p",
		ignore_attacker_unit = true,
		max_damage_radius = 3,
		no_prop_damage = true,
		player_push_speed = 100,
		power_level = 100,
		power_level_glance = 50,
		radius = 3.2,
		sound_event_name = "Play_vs_rat_ogre_jump_attack_impact",
		camera_effect = {
			far_distance = 20,
			far_scale = 0.15,
			near_distance = 5,
			near_scale = 1,
			shake_name = "frag_grenade_explosion",
		},
	},
}
ExplosionTemplates.shadow_flare = {
	spawn_unit = {
		glow_time = 15,
		unit_name = "shadow_flare_light",
		unit_path = "units/weapons/player/wpn_shadow_gargoyle_head/wpn_shadow_gargoyle_head",
	},
}
ExplosionTemplates.tower_wipe = {
	explosion = {
		alert_enemies = false,
		collision_filter = "filter_simple_explosion_overlap",
		damage_profile = "tower_wipe",
		level_unit_damage = true,
		no_aggro = true,
		player_push_speed = 5,
		power_level = 1000,
		radius = 300,
	},
}
ExplosionTemplates.claw_explosion_dwarf = {
	explosion = {
		alert_enemies = true,
		alert_enemies_radius = 30,
		allow_friendly_fire_override = true,
		attack_template = "drakegun",
		damage_profile = "overcharge_explosion",
		damage_profile_glance = "overcharge_explosion_glance",
		effect_name = "fx/chr_warp_fire_explosion_01",
		ignore_attacker_unit = true,
		level_unit_damage = true,
		max_damage_radius = 50,
		power_level = 1000,
		radius = 5,
		sound_event_name = "emitter_dwarf_bomb_explosion",
	},
}

DLCUtils.merge("explosion_templates", ExplosionTemplates)

for name, templates in pairs(ExplosionTemplates) do
	templates.name = name
end
