local breed_data = {
	detection_radius = 90,
	far_off_despawn_immunity = true,
	target_selection = "pick_closest_vortex_target",
	unit_template = "ai_unit_vortex",
	run_speed = 1.75,
	immediate_threat = true,
	use_navigation_path_splines = true,
	has_inventory = false,
	race = "chaos",
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	perception = "perception_all_seeing",
	minion_detection_radius = 10,
	debug_despawn_immunity = false,
	debug_spawn_category = "Misc",
	ignore_nav_propagation_box = true,
	bone_lod_level = 0,
	behavior = "chaos_vortex",
	base_unit = "units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex",
	threat_value = 10,
	ignore_activate_unit = true,
	navigation_path_spline_config = {
		spline_distance_to_borders = 3.5,
		navigation_channel_radius = 7
	},
	debug_color = {
		255,
		255,
		255,
		255
	},
	hitzone_multiplier_types = {},
	hit_zones = {},
	allowed_layers = {
		ledges = 1.5,
		ledges_with_fence = 1.5,
		planks = 1.5,
		jumps = 1.5,
		temporary_wall = 0,
		bot_ratling_gun_fire = 1,
		doors = 1.5,
		destructible_wall = 0,
		bot_poison_wind = 1,
		fire_grenade = 1
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
