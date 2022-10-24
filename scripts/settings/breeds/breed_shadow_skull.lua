local breed_data = {
	detection_radius = 9999999,
	debug_despawn_immunity = false,
	target_selection = "pick_closest_target",
	flesh_material = "stone",
	debug_spawn_func_name = "aim_spawning_air",
	poison_resistance = 100,
	no_blood_splatter_on_damage = true,
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	impact_template_name = "no_owner_direct_impact",
	impact_collision_filter = "filter_ray_projectile",
	debug_spawn_category = "Misc",
	target_head_node = "c_skull",
	hit_reaction = "ai_default",
	only_one_impact = true,
	hit_effect_template = "HitEffectsShadowSkull",
	collision_detection_sphere_radius = 0.2,
	immediate_threat = true,
	unit_template = "shadow_skull_unit",
	race = "chaos",
	air_spawning_distance = 20,
	death_reaction = "shadow_skull",
	perception = "perception_all_seeing",
	inside_wall_spawn_distance = -1,
	far_off_despawn_immunity = true,
	impact_explosion_name = "homing_skull_impact",
	behavior = "shadow_skull",
	base_unit = "units/props/blk/blk_curse_shadow_homing_skull_01",
	threat_value = 10,
	ignore_activate_unit = true,
	max_health = {
		3,
		3,
		3,
		3,
		3,
		3,
		3,
		3
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
				"detailed"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		head = {
			prio = 2,
			actors = {
				"detailed"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		neck = {
			prio = 3,
			actors = {
				"detailed"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		},
		torso = {
			prio = 4,
			actors = {
				"detailed"
			},
			push_actors = {
				"c_skull",
				"c_jaw"
			}
		}
	},
	modify_extension_init_data = function (breed, is_husk, extension_init_data)
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
	end,
	debug_spawn_optional_data = {
		prepare_func = function (breed, extension_init_data)
			local is_husk = false

			breed:modify_extension_init_data(is_husk, extension_init_data)
		end
	}
}
Breeds.shadow_skull = table.create_copy(Breeds.shadow_skull, breed_data)

return
