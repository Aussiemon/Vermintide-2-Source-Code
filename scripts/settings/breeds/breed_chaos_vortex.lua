local breed_data = {
	detection_radius = 90,
	ignore_nav_propagation_box = true,
	target_selection = "pick_closest_vortex_target",
	unit_template = "ai_unit_vortex",
	run_speed = 1.75,
	far_off_despawn_immunity = true,
	immediate_threat = true,
	navigation_channel_radius = 7,
	race = "chaos",
	has_inventory = false,
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	perception = "perception_all_seeing",
	debug_despawn_immunity = false,
	navigation_spline_distance_to_borders = 3.5,
	debug_spawn_category = "Misc",
	use_navigation_path_splines = true,
	bone_lod_level = 0,
	behavior = "chaos_vortex",
	base_unit = "units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex",
	threat_value = 10,
	ignore_activate_unit = true,
	debug_color = {
		255,
		255,
		255,
		255
	},
	hitzone_multiplier_types = {},
	hit_zones = {},
	allowed_layers = {
		planks = 1.5,
		ledges_with_fence = 1.5,
		doors = 1.5,
		jumps = 1.5,
		ledges = 1.5,
		bot_poison_wind = 1,
		fire_grenade = 1,
		bot_ratling_gun_fire = 1
	},
	nav_cost_map_allowed_layers = {
		plague_wave = 1,
		troll_bile = 1,
		lamp_oil_fire = 1,
		warpfire_thrower_warpfire = 1,
		vortex_near = 1,
		stormfiend_warpfire = 1,
		vortex_danger_zone = 1
	},
	debug_spawn_optional_data = {
		prepare_func = function (breed, extension_init_data)
			extension_init_data.ai_supplementary_system = {
				vortex_template_name = "standard"
			}
		end
	}
}
Breeds.chaos_vortex = table.create_copy(Breeds.chaos_vortex, breed_data)
local action_data = {
	smash_door = {
		move_speed = 3.75,
		rotation_speed = 0,
		door_attack_distance = 1
	}
}
BreedActions.chaos_vortex = table.create_copy(BreedActions.chaos_vortex, action_data)

return
