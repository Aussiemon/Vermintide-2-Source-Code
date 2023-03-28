local breed_data = {
	detection_radius = 9999999,
	walk_speed = 1.5,
	flesh_material = "stone",
	debug_despawn_immunity = false,
	debug_spawn_func_name = "aim_spawning_air",
	exchange_order = 1,
	run_speed = 1,
	target_selection = "pick_closest_target",
	not_bot_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	is_bot_threat = false,
	impact_template_name = "no_owner_direct_impact",
	impact_collision_filter = "filter_ray_projectile_enemy",
	debug_spawn_category = "Misc",
	race = "chaos",
	target_head_node = "c_skull",
	air_spawning_distance = 20,
	hit_reaction = "ai_ethereal_skull_knock_back",
	death_reaction = "tower_homing_skull",
	only_one_impact = true,
	hit_effect_template = "HitEffectsShadowSkull",
	collision_detection_sphere_radius = 0.2,
	radius = 1,
	unit_template = "ethereal_skull_unit",
	no_blood_splatter_on_damage = true,
	bot_threat_start_time = 0,
	no_autoaim = true,
	poison_resistance = 100,
	perception = "perception_all_seeing",
	inside_wall_spawn_distance = -1,
	far_off_despawn_immunity = true,
	impact_explosion_name = "ethereal_skull_impact",
	behavior = "tower_homing_skull",
	base_unit = "units/beings/enemies/undead_ethereal_skeleton/chr_undead_ethereal_skeleton_skull",
	threat_value = 0,
	ignore_activate_unit = true,
	max_health = BreedTweaks.max_health.marauder,
	size_variation_range = {
		1,
		1
	},
	debug_color = {
		255,
		255,
		255,
		255
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {
				"c_hitbox"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		head = {
			prio = 2,
			actors = {
				"c_hitbox"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		neck = {
			prio = 3,
			actors = {
				"c_hitbox"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		torso = {
			prio = 4,
			actors = {
				"c_hitbox"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		}
	}
}

breed_data.modify_extension_init_data = function (breed, is_husk, extension_init_data)
	local impact_explosion_name = breed.impact_explosion_name
	local sphere_radius = breed.collision_detection_sphere_radius
	local only_one_impact = breed.only_one_impact
	local impact_collision_filter = breed.impact_collision_filter
	local impact_template_name = breed.impact_template_name
	local damage_source = "n/a"
	local projectile_impact_system_data = extension_init_data.projectile_impact_system or {}
	projectile_impact_system_data.sphere_radius = sphere_radius
	projectile_impact_system_data.only_one_impact = only_one_impact
	projectile_impact_system_data.collision_filter = impact_collision_filter
	extension_init_data.projectile_impact_system = projectile_impact_system_data
	local projectile_system_data = extension_init_data.projectile_system or {}
	projectile_system_data.damage_source = damage_source
	projectile_system_data.impact_template_name = impact_template_name
	projectile_system_data.explosion_template_name = impact_explosion_name
	extension_init_data.projectile_system = projectile_system_data
end

breed_data.debug_spawn_optional_data = {
	prepare_func = function (breed, extension_init_data)
		local is_husk = false

		breed:modify_extension_init_data(is_husk, extension_init_data)
	end
}
Breeds.tower_homing_skull = table.create_copy(Breeds.tower_homing_skull, breed_data)
