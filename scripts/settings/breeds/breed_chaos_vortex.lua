-- chunkname: @scripts/settings/breeds/breed_chaos_vortex.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	base_unit = "units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex",
	behavior = "chaos_vortex",
	bone_lod_level = 0,
	debug_despawn_immunity = false,
	debug_spawn_category = "Misc",
	detection_radius = 90,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = false,
	ignore_activate_unit = true,
	ignore_nav_propagation_box = true,
	immediate_threat = true,
	minion_detection_radius = 10,
	perception = "perception_all_seeing",
	race = "chaos",
	run_speed = 1.75,
	target_selection = "pick_closest_vortex_target",
	threat_value = 10,
	unit_template = "ai_unit_vortex",
	use_navigation_path_splines = true,
	infighting = InfightingSettings.small,
	navigation_path_spline_config = {
		navigation_channel_radius = 7,
		spline_distance_to_borders = 3.5,
	},
	debug_color = {
		255,
		255,
		255,
		255,
	},
	hitzone_multiplier_types = {},
	hit_zones = {},
	allowed_layers = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 1,
		jumps = 1.5,
		ledges = 1.5,
		ledges_with_fence = 1.5,
		planks = 1.5,
		temporary_wall = 0,
	},
	nav_cost_map_allowed_layers = {
		lamp_oil_fire = 1,
		plague_wave = 1,
		stormfiend_warpfire = 1,
		troll_bile = 1,
		vortex_danger_zone = 1,
		vortex_near = 1,
		warpfire_thrower_warpfire = 1,
	},
	debug_spawn_optional_data = {
		prepare_func = function (breed, extension_init_data)
			extension_init_data.ai_supplementary_system = {
				vortex_template_name = "standard",
			}
		end,
	},
}

Breeds.chaos_vortex = table.create_copy(Breeds.chaos_vortex, breed_data)

local action_data = {
	smash_door = {
		door_attack_distance = 1,
		move_speed = 3.75,
		rotation_speed = 0,
	},
}

BreedActions.chaos_vortex = table.create_copy(BreedActions.chaos_vortex, action_data)
