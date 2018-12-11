ExplosionTemplates = {
	slow_grenade = {
		aoe = {
			dot_template_name = "slow_grenade_slow",
			radius = 2,
			damage_interval = 0.5,
			duration = 10,
			area_damage_template = "explosion_template_aoe",
			attack_template = "arrow_poison_aoe",
			nav_mesh_effect = {
				particle_radius = 0.6666666666666666,
				particle_name = "fx/wpnfx_fire_grenade_impact_remains",
				particle_spacing = 0.3
			}
		}
	},
	sniper_poison_arrow = {
		explosion = {
			use_attacker_power_level = true,
			radius = 3,
			no_prop_damage = true,
			sound_event_name = "arrow_hit_poison_cloud",
			damage_profile = "poison_aoe",
			effect_name = "fx/wpnfx_poison_arrow_impact_sniper"
		}
	},
	machinegun_poison_arrow = {
		explosion = {
			use_attacker_power_level = true,
			radius = 1,
			no_prop_damage = true,
			sound_event_name = "arrow_hit_poison_cloud",
			damage_profile = "poison_aoe",
			effect_name = "fx/wpnfx_poison_arrow_impact_machinegun"
		}
	},
	carbine_poison_arrow = {
		explosion = {
			use_attacker_power_level = true,
			radius = 2,
			no_prop_damage = true,
			sound_event_name = "arrow_hit_poison_cloud",
			damage_profile = "poison_aoe",
			effect_name = "fx/wpnfx_poison_arrow_impact_carbine"
		}
	},
	fireball = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 0.5,
			radius_max = 1,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.1,
			damage_profile_glance = "fireball_explosion_glance",
			max_damage_radius_max = 0.75,
			sound_event_name = "drakepistol_hit",
			damage_profile = "fireball_explosion",
			effect_name = "fx/wpnfx_drake_pistols_projectile_impact"
		}
	},
	drake_pistol_aoe = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 0.5,
			radius_max = 1,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.1,
			damage_profile_glance = "fireball_explosion_glance",
			max_damage_radius_max = 0.75,
			sound_event_name = "drakepistol_hit",
			damage_profile = "fireball_explosion",
			effect_name = "fx/wpnfx_drake_pistols_projectile_impact"
		}
	},
	fireball_charged = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 1.25,
			sound_event_name = "fireball_big_hit",
			radius_max = 3,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.5,
			alert_enemies_radius = 10,
			damage_profile_glance = "fireball_charged_explosion_glance",
			max_damage_radius_max = 2,
			alert_enemies = true,
			damage_profile = "fireball_charged_explosion",
			effect_name = "fx/wpnfx_fireball_charged_impact"
		}
	},
	grenade = {
		is_grenade = true,
		explosion = {
			dont_rotate_fx = true,
			radius = 5,
			max_damage_radius = 2,
			alert_enemies_radius = 20,
			sound_event_name = "player_combat_weapon_grenade_explosion",
			attack_template = "grenade",
			damage_profile_glance = "frag_grenade_glance",
			alert_enemies = true,
			damage_profile = "frag_grenade",
			effect_name = "fx/wpnfx_frag_grenade_impact",
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
				survival_hard = {
					power_level_glance = 300,
					power_level = 600
				},
				survival_harder = {
					power_level_glance = 400,
					power_level = 800
				},
				survival_hardest = {
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
	},
	explosive_barrel = {
		explosion = {
			radius = 6,
			dot_template_name = "burning_1W_dot",
			max_damage_radius = 1.75,
			sound_event_name = "player_combat_weapon_grenade_explosion",
			damage_type_glance = "grenade_glance",
			alert_enemies = true,
			attack_template = "drakegun",
			alert_enemies_radius = 10,
			always_hurt_players = true,
			damage_type = "grenade",
			damage_profile = "explosive_barrel",
			effect_name = "fx/wpnfx_barrel_explosion",
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
				survival_hard = {
					power_level_glance = 300,
					power_level = 600
				},
				survival_harder = {
					power_level_glance = 400,
					power_level = 800
				},
				survival_hardest = {
					power_level_glance = 500,
					power_level = 1000
				}
			}
		}
	},
	loot_rat_explosion = {
		explosion = {
			radius = 5,
			attack_template = "loot_rat_explosion",
			alert_enemies = true,
			damage_type_glance = "grenade_glance",
			damage_type = "grenade",
			alert_enemies_radius = 10,
			sound_event_name = "player_combat_weapon_grenade_explosion",
			catapult_force = 10,
			effect_name = "fx/wpnfx_barrel_explosion",
			always_hurt_players = true,
			max_damage_radius = 1.75,
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
				survival_hard = {
					power_level_glance = 300,
					power_level = 600
				},
				survival_harder = {
					power_level_glance = 400,
					power_level = 800
				},
				survival_hardest = {
					power_level_glance = 500,
					power_level = 1000
				}
			},
			immune_breeds = {
				skaven_loot_rat = true
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
	lamp_oil = {
		explosion = {
			radius = 3,
			dot_template_name = "burning_3W_dot",
			max_damage_radius = 1.5,
			alert_enemies = true,
			damage_type_glance = "fire_grenade_glance",
			alert_enemies_radius = 15,
			attack_template = "fire_grenade_explosion",
			sound_event_name = "fireball_big_hit",
			always_hurt_players = true,
			damage_type = "fire_grenade",
			damage_profile = "explosive_barrel",
			effect_name = "fx/wpnfx_fire_grenade_impact",
			difficulty_power_level = {
				easy = {
					power_level_glance = 50,
					power_level = 100
				},
				normal = {
					power_level_glance = 100,
					power_level = 200
				},
				hard = {
					power_level_glance = 150,
					power_level = 300
				},
				harder = {
					power_level_glance = 200,
					power_level = 400
				},
				hardest = {
					power_level_glance = 250,
					power_level = 500
				},
				survival_hard = {
					power_level_glance = 150,
					power_level = 300
				},
				survival_harder = {
					power_level_glance = 200,
					power_level = 400
				},
				survival_hardest = {
					power_level_glance = 250,
					power_level = 500
				}
			}
		},
		aoe = {
			dot_template_name = "burning_1W_dot",
			radius = 6,
			nav_tag_volume_layer = "fire_grenade",
			create_nav_tag_volume = true,
			attack_template = "fire_grenade_dot",
			sound_event_name = "player_combat_weapon_fire_grenade_explosion",
			damage_interval = 1,
			duration = 5,
			area_damage_template = "explosion_template_aoe",
			nav_mesh_effect = {
				particle_radius = 2,
				particle_name = "fx/wpnfx_fire_grenade_impact_remains",
				particle_spacing = 0.9
			}
		}
	},
	warpfire_explosion = {
		explosion = {
			always_hurt_players = true,
			radius = 5,
			alert_enemies = true,
			max_damage_radius = 2.5,
			alert_enemies_radius = 15,
			sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
			damage_profile = "warpfire_thrower_explosion",
			power_level = 500,
			effect_name = "fx/chr_warp_fire_explosion_01"
		}
	},
	overcharge_explosion_dwarf = {
		explosion = {
			always_hurt_players = false,
			radius = 5,
			alert_enemies_radius = 10,
			max_damage_radius = 4,
			alert_enemies = true,
			attack_template = "drakegun",
			damage_profile_glance = "overcharge_explosion_glance",
			sound_event_name = "emitter_dwarf_bomb_explosion",
			damage_profile = "overcharge_explosion",
			power_level = 500,
			ignore_attacker_unit = true,
			effect_name = "fx/wpnfx_staff_geiser_fire_large"
		}
	},
	overcharge_explosion_brw = {
		explosion = {
			always_hurt_players = false,
			radius = 5,
			alert_enemies_radius = 10,
			max_damage_radius = 4,
			alert_enemies = true,
			attack_template = "drakegun",
			damage_profile_glance = "overcharge_explosion_glance",
			sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
			damage_profile = "overcharge_explosion",
			power_level = 500,
			ignore_attacker_unit = true,
			effect_name = "fx/wpnfx_staff_geiser_fire_large"
		}
	},
	explosion_bw_unchained_ability = {
		explosion = {
			use_attacker_power_level = true,
			radius = 5,
			alert_enemies = true,
			max_damage_radius = 3,
			alert_enemies_radius = 10,
			attacker_power_level_offset = 0.25,
			always_hurt_players = false,
			attack_template = "drakegun",
			damage_profile_glance = "overcharge_explosion_glance_ability",
			sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
			damage_profile = "overcharge_explosion_ability",
			ignore_attacker_unit = true,
			effect_name = "fx/chr_unchained_living_bomb_3p"
		}
	},
	explosion_bw_unchained_ability_increased_radius = {
		explosion = {
			use_attacker_power_level = true,
			radius = 7.5,
			alert_enemies = true,
			max_damage_radius = 4.5,
			alert_enemies_radius = 15,
			attacker_power_level_offset = 0.25,
			always_hurt_players = false,
			attack_template = "drakegun",
			damage_profile_glance = "overcharge_explosion_glance_ability",
			sound_event_name = "player_combat_weapon_staff_overcharge_explosion",
			damage_profile = "overcharge_explosion_ability",
			ignore_attacker_unit = true,
			effect_name = "fx/chr_unchained_living_bomb_3p"
		}
	},
	smoke_grenade = {
		is_grenade = true,
		aoe = {
			extra_effect_name = "fx/chr_gutter_foff",
			radius = 5,
			create_nav_tag_volume = true,
			sound_event_name = "player_combat_weapon_smoke_grenade_explosion",
			damage_interval = 1,
			duration = 10,
			area_damage_template = "explosion_template_aoe",
			effect_name = "fx/wpnfx_smoke_grenade_impact"
		}
	},
	fire_grenade = {
		is_grenade = true,
		explosion = {
			radius = 2,
			damage_type = "fire_grenade",
			max_damage_radius = 1,
			alert_enemies_radius = 15,
			damage_type_glance = "fire_grenade_glance",
			dont_rotate_fx = true,
			dot_template_name = "burning_1W_dot",
			sound_event_name = "fireball_big_hit",
			alert_enemies = true,
			damage_profile = "explosive_barrel",
			effect_name = "fx/wpnfx_fire_grenade_impact",
			difficulty_power_level = {
				easy = {
					power_level_glance = 50,
					power_level = 59
				},
				normal = {
					power_level_glance = 50,
					power_level = 50
				},
				hard = {
					power_level_glance = 75,
					power_level = 50
				},
				harder = {
					power_level_glance = 100,
					power_level = 100
				},
				hardest = {
					power_level_glance = 150,
					power_level = 200
				},
				survival_hard = {
					power_level_glance = 150,
					power_level = 300
				},
				survival_harder = {
					power_level_glance = 200,
					power_level = 400
				},
				survival_hardest = {
					power_level_glance = 250,
					power_level = 500
				}
			}
		},
		aoe = {
			dot_template_name = "burning_dot_fire_grenade",
			radius = 6,
			nav_tag_volume_layer = "fire_grenade",
			create_nav_tag_volume = true,
			attack_template = "fire_grenade_dot",
			sound_event_name = "player_combat_weapon_fire_grenade_explosion",
			damage_interval = 1,
			duration = 5,
			area_damage_template = "explosion_template_aoe",
			nav_mesh_effect = {
				particle_radius = 2,
				particle_name = "fx/wpnfx_fire_grenade_impact_remains",
				particle_spacing = 0.9
			}
		}
	},
	conflag = {
		aoe = {
			dot_template_name = "burning_1W_dot",
			radius = 4,
			nav_tag_volume_layer = "fire_grenade",
			create_nav_tag_volume = true,
			attack_template = "wizard_staff_geiser",
			sound_event_name = "player_combat_weapon_fire_grenade_explosion",
			damage_interval = 1,
			duration = 2,
			area_damage_template = "explosion_template_aoe",
			nav_mesh_effect = {
				particle_radius = 2,
				particle_name = "fx/wpnfx_fire_grenade_impact_remains",
				particle_spacing = 0.9
			}
		}
	},
	portal_transformer = {
		explosion = {
			always_hurt_players = true,
			radius = 5,
			max_damage_radius = 2,
			player_push_speed = 5,
			damage_profile_glance = "default",
			alert_enemies = false,
			damage_profile = "default",
			power_level = 500,
			level_unit_damage = true
		}
	},
	elven_ruins_finish = {
		explosion = {
			always_hurt_players = false,
			radius = 50,
			no_aggro = true,
			player_push_speed = 5,
			collision_filter = "filter_simple_explosion_overlap",
			alert_enemies = false,
			damage_profile = "elven_ruins_finish",
			power_level = 1000,
			level_unit_damage = true
		}
	},
	military_finish = {
		explosion = {
			always_hurt_players = false,
			radius = 300,
			no_aggro = true,
			player_push_speed = 5,
			collision_filter = "filter_simple_explosion_overlap",
			alert_enemies = false,
			damage_profile = "military_finish",
			power_level = 1000,
			level_unit_damage = true
		}
	},
	bardin_slayer_activated_ability_landing_stagger = {
		explosion = {
			use_attacker_power_level = true,
			radius = 4,
			no_prop_damage = true,
			max_damage_radius = 2,
			always_hurt_players = false,
			attacker_power_level_offset = 0.25,
			alert_enemies = true,
			attack_template = "drakegun",
			alert_enemies_radius = 15,
			damage_type = "grenade",
			damage_profile = "slayer_leap_landing",
			ignore_attacker_unit = true,
			no_friendly_fire = true
		}
	}
}
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact = table.clone(ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger)
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.radius = 6
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.max_damage_radius = 3
ExplosionTemplates.bardin_slayer_activated_ability_landing_stagger_impact.explosion.damage_profile = "slayer_leap_landing_impact"
ExplosionTemplates.cannon_ball_throw = {
	explosion = {
		always_hurt_players = false,
		radius = 4,
		no_prop_damage = true,
		max_damage_radius = 2,
		effect_name = "fx/wpnfx_frag_grenade_impact",
		sound_event_name = "player_combat_weapon_grenade_explosion",
		attack_template = "drakegun",
		damage_type = "grenade",
		damage_profile = "cannonball_impact",
		power_level = 300,
		ignore_attacker_unit = true,
		level_unit_damage = true,
		camera_effect = {
			near_distance = 5,
			near_scale = 1,
			shake_name = "frag_grenade_explosion",
			far_scale = 0.15,
			far_distance = 20
		},
		on_death_func = function (hit_unit)
			local stat_name = "forest_fort_kill_cannonball"
			local current_difficulty = Managers.state.difficulty:get_difficulty()
			local allowed_difficulties = QuestSettings.allowed_difficulties[stat_name]
			local allowed_difficulty = allowed_difficulties[current_difficulty]
			local death_extension = ScriptUnit.extension(hit_unit, "death_system")

			if allowed_difficulty and not death_extension:has_death_started() then
				local local_player = Managers.player:local_player()
				local status_extension = ScriptUnit.has_extension(local_player.player_unit, "status_system")

				if status_extension and not status_extension.completed_cannonball_challenge then
					status_extension.num_cannonball_kills = (status_extension.num_cannonball_kills and status_extension.num_cannonball_kills + 1) or 1

					if QuestSettings.forest_fort_kill_cannonball <= status_extension.num_cannonball_kills then
						local statistics_db = Managers.player:statistics_db()

						statistics_db:increment_stat_and_sync_to_clients(stat_name)

						status_extension.num_cannonball_kills = nil
						status_extension.completed_cannonball_challenge = true

						QuestSettings.send_completed_message(stat_name)
					end
				end
			end
		end
	}
}
ExplosionTemplates.victor_captain_activated_ability_stagger = {
	explosion = {
		no_prop_damage = true,
		radius = 10,
		use_attacker_power_level = true,
		max_damage_radius = 2,
		always_hurt_players = false,
		alert_enemies = true,
		alert_enemies_radius = 15,
		attack_template = "drakegun",
		damage_type = "grenade",
		damage_profile = "ability_push",
		ignore_attacker_unit = true,
		no_friendly_fire = true
	}
}
ExplosionTemplates.sienna_adept_activated_ability_end_stagger = {
	explosion = {
		use_attacker_power_level = true,
		radius = 4,
		dot_template_name = "burning_1W_dot",
		max_damage_radius = 2,
		no_friendly_fire = true,
		always_hurt_players = false,
		alert_enemies = true,
		attack_template = "drakegun",
		alert_enemies_radius = 15,
		damage_type = "grenade",
		damage_profile = "ability_push",
		ignore_attacker_unit = true,
		effect_name = "fx/brw_adept_skill_01"
	}
}
ExplosionTemplates.kruber_mercenary_activated_ability_stagger = {
	explosion = {
		always_hurt_players = false,
		radius = 10,
		no_prop_damage = true,
		max_damage_radius = 3,
		use_attacker_power_level = true,
		attacker_power_level_offset = 0.01,
		alert_enemies_radius = 15,
		alert_enemies = true,
		damage_profile = "ability_push",
		no_friendly_fire = true
	}
}
ExplosionTemplates.bardin_ranger_activated_ability_stagger = {
	explosion = {
		use_attacker_power_level = true,
		radius = 7,
		damage_type = "grenade",
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		always_hurt_players = false,
		attack_template = "drakegun",
		alert_enemies = true,
		alert_enemies_radius = 15,
		sound_event_name = "Play_bardin_ranger_smoke_grenade_ability",
		damage_profile = "ability_push",
		effect_name = "fx/wpnfx_smoke_grenade_impact"
	}
}
ExplosionTemplates.bardin_ranger_activated_ability_upgraded_stagger = {
	explosion = {
		use_attacker_power_level = true,
		radius = 7,
		damage_type = "grenade",
		max_damage_radius = 2,
		no_friendly_fire = true,
		no_prop_damage = true,
		always_hurt_players = false,
		attack_template = "drakegun",
		alert_enemies = true,
		alert_enemies_radius = 15,
		sound_event_name = "Play_bardin_ranger_smoke_grenade_ability",
		damage_profile = "ability_push",
		effect_name = "fx/wpnfx_smoke_grenade_impact_Upgraded"
	}
}
ExplosionTemplates.chaos_zombie_explosion = {
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = true,
		alert_enemies_radius = 20,
		sound_event_name = "Play_enemy_chaos_warrior_transform_explode",
		damage_type_glance = "fire_grenade_glance",
		max_damage_radius_min = 0.5,
		attack_template = "chaos_zombie_explosion",
		dot_template_name = "chaos_zombie_explosion",
		max_damage_radius_max = 2,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/chr_nurgle_explosion_01",
		immune_breeds = {
			chaos_zombie = true,
			chaos_exalted_sorcerer = true
		}
	}
}
ExplosionTemplates.chaos_magic_missile = {
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = false,
		sound_event_name = "fireball_big_hit",
		damage_type_glance = "fire_grenade_glance",
		max_damage_radius_min = 0.5,
		attack_template = "chaos_magic_missile",
		max_damage_radius_max = 1,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/wpnfx_fireball_charged_impact",
		immune_breeds = {
			chaos_zombie = true,
			skaven_grey_seer = true,
			skaven_stormfiend = true
		}
	}
}
ExplosionTemplates.chaos_strike_missile_impact = {
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = false,
		sound_event_name = "fireball_big_hit",
		damage_type_glance = "fire_grenade_glance",
		max_damage_radius_min = 0.5,
		attack_template = "chaos_magic_missile",
		max_damage_radius_max = 1,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/chr_chaos_sorcerer_boss_strike_missile_impact",
		immune_breeds = {
			chaos_zombie = true,
			chaos_exalted_sorcerer = true,
			skaven_grey_seer = true,
			skaven_stormfiend = true
		}
	}
}
ExplosionTemplates.chaos_slow_bomb_missile_missed = {
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = false,
		sound_event_name = "Play_enemy_boss_sorcerer_slow_bomb_hit",
		damage_type_glance = "fire_grenade_glance",
		max_damage_radius_min = 0.5,
		attack_template = "chaos_magic_missile",
		max_damage_radius_max = 1,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/chr_chaos_sorcerer_boss_projectile_flies_impact",
		immune_breeds = {
			chaos_zombie = true,
			chaos_spawn = true,
			skaven_grey_seer = true
		}
	}
}
ExplosionTemplates.grey_seer_warp_lightning_impact = {
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = false,
		sound_event_name = "fireball_big_hit",
		max_damage_radius_min = 0.5,
		attack_template = "chaos_magic_missile",
		max_damage_radius_max = 1,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/warp_lightning_bolt_impact",
		immune_breeds = {
			skaven_stormfiend_boss = true,
			chaos_zombie = true,
			skaven_grey_seer = true
		}
	}
}
ExplosionTemplates.chaos_slow_bomb_missile = {
	server_hit_func = function (projectile_unit, damage_source, owner_unit, hit_position, recent_impacts, explosion_template)
		local hit_unit = recent_impacts[ProjectileImpactDataIndex.UNIT]
		local hit_player = false

		if VALID_PLAYERS_AND_BOTS[hit_unit] then
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
			local explosion_template = ExplosionTemplates.chaos_slow_bomb_missile_missed

			AiUtils.ai_explosion(projectile_unit, owner_unit, blackboard, damage_source, explosion_template)
		end
	end
}
ExplosionTemplates.chaos_vortex_dummy_missile = {
	explosion = {
		always_hurt_players = true,
		radius = 0.1,
		alert_enemies_radius = 20,
		alert_enemies = false,
		damage_type_glance = "fire_grenade_glance",
		max_damage_radius_min = 0.1,
		attack_template = "chaos_magic_missile",
		max_damage_radius_max = 0.1,
		damage_type = "grenade",
		damage_interval = 0,
		power_level = 0
	}
}
ExplosionTemplates.corpse_explosion_default = {
	time_to_explode = 1,
	explosion = {
		always_hurt_players = true,
		radius = 3.2,
		alert_enemies = true,
		damage_profile = "corpse_explosion_default",
		max_damage_radius_min = 0.5,
		alert_enemies_radius = 20,
		max_damage_radius_max = 2,
		sound_event_name = "Play_enemy_chaos_warrior_transform_explode",
		damage_interval = 0,
		power_level = 500,
		effect_name = "fx/chr_nurgle_explosion_01",
		immune_breeds = {
			all = true
		}
	}
}
ExplosionTemplates.sniper_poison_arrow_t2 = table.clone(ExplosionTemplates.sniper_poison_arrow)
ExplosionTemplates.sniper_poison_arrow_t2.explosion.attack_template = "arrow_poison_aoe_t2"
ExplosionTemplates.sniper_poison_arrow_t2.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.sniper_poison_arrow_t3 = table.clone(ExplosionTemplates.sniper_poison_arrow)
ExplosionTemplates.sniper_poison_arrow_t3.explosion.attack_template = "arrow_poison_aoe_t3"
ExplosionTemplates.sniper_poison_arrow_t3.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.machinegun_poison_arrow_t2 = table.clone(ExplosionTemplates.machinegun_poison_arrow)
ExplosionTemplates.machinegun_poison_arrow_t2.explosion.attack_template = "arrow_poison_aoe_t2"
ExplosionTemplates.machinegun_poison_arrow_t2.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.machinegun_poison_arrow_t3 = table.clone(ExplosionTemplates.machinegun_poison_arrow)
ExplosionTemplates.machinegun_poison_arrow_t3.explosion.attack_template = "arrow_poison_aoe_t3"
ExplosionTemplates.machinegun_poison_arrow_t3.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.carbine_poison_arrow_t2 = table.clone(ExplosionTemplates.carbine_poison_arrow)
ExplosionTemplates.carbine_poison_arrow_t2.explosion.attack_template = "arrow_poison_aoe_t2"
ExplosionTemplates.carbine_poison_arrow_t2.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.carbine_poison_arrow_t3 = table.clone(ExplosionTemplates.carbine_poison_arrow)
ExplosionTemplates.carbine_poison_arrow_t3.explosion.attack_template = "arrow_poison_aoe_t3"
ExplosionTemplates.carbine_poison_arrow_t3.explosion.dot_template_name = "aoe_poison_dot"
ExplosionTemplates.fireball_charged_t2 = table.clone(ExplosionTemplates.fireball_charged)
ExplosionTemplates.fireball_charged_t2.explosion.attack_template = "drakegun_t2"
ExplosionTemplates.fireball_charged_t2.explosion.attack_template_glance = "drakegun_glance_t2"
ExplosionTemplates.fireball_charged_t2.explosion.dot_template_name = "burning_1W_dot"
ExplosionTemplates.fireball_charged_t2.explosion.dot_template_name_glance = "burning_1W_dot"
ExplosionTemplates.fireball_charged_t3 = table.clone(ExplosionTemplates.fireball_charged)
ExplosionTemplates.fireball_charged_t3.explosion.attack_template = "drakegun_t3"
ExplosionTemplates.fireball_charged_t3.explosion.attack_template_glance = "drakegun_glance_t3"
ExplosionTemplates.fireball_charged_t3.explosion.dot_template_name = "burning_1W_dot"
ExplosionTemplates.fireball_charged_t3.explosion.dot_template_name_glance = "burning_1W_dot"

for name, templates in pairs(ExplosionTemplates) do
	templates.name = name
end

return
