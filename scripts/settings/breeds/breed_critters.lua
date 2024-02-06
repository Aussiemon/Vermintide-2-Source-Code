-- chunkname: @scripts/settings/breeds/breed_critters.lua

local pig_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_height = 0.5,
	aoe_radius = 0.25,
	armor_category = 1,
	base_unit = "units/beings/critters/chr_critter_pig/chr_critter_pig",
	behavior = "critter_pig",
	bone_lod_level = 1,
	cannot_far_path = true,
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	detection_radius = 10,
	disable_local_hit_reactions = true,
	exchange_order = 1,
	flingable = false,
	has_inventory = false,
	hit_effect_template = "HitEffectsCritterPig",
	hit_reaction = "ai_default",
	ignore_activate_unit = true,
	is_always_spawnable = true,
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_no_seeing",
	perception_previous_attacker_stickyness_value = 0,
	poison_resistance = 70,
	race = "critter",
	radius = 1,
	run_speed = 6,
	target_selection = "pick_no_targets",
	threat_value = 0,
	unit_template = "ai_unit_critter",
	vortexable = false,
	walk_speed = 4,
	weapon_reach = 2,
	size_variation_range = {
		0.9,
		1.1,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		neck = {
			prio = 1,
			actors = {
				"c_neck",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_neck",
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_spine2",
			},
			push_actors = {
				"c_spine2",
			},
		},
		full = {
			prio = 3,
			actors = {},
		},
	},
	infighting = InfightingSettings.small,
	max_health = {
		3,
		3,
		3,
		3,
		3,
		3,
		3,
		3,
	},
	num_push_anims = {
		push_backward = 4,
	},
	debug_color = {
		255,
		40,
		90,
		170,
	},
	allowed_layers = {},
}

Breeds.critter_pig = table.create_copy(Breeds.critter_pig, pig_data)

local rat_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_height = 0.1,
	aoe_radius = 0.1,
	armor_category = 1,
	base_unit = "units/beings/critters/chr_critter_common_rat/chr_critter_common_rat",
	behavior = "critter_rat",
	bone_lod_level = 1,
	cannot_far_path = true,
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	detection_radius = 10,
	disable_local_hit_reactions = true,
	exchange_order = 1,
	flingable = false,
	has_inventory = false,
	hit_effect_template = "HitEffectsCritterRat",
	hit_reaction = "ai_default",
	ignore_activate_unit = true,
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = 0,
	poison_resistance = 70,
	race = "critter",
	radius = 1,
	run_speed = 6,
	target_selection = "pick_closest_target",
	threat_value = 0,
	unit_template = "ai_unit_critter",
	vortexable = false,
	walk_speed = 4,
	weapon_reach = 2,
	size_variation_range = {
		0.9,
		1.1,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		full = {
			prio = 1,
			actors = {},
		},
		neck = {
			prio = 1,
			actors = {
				"c_head",
			},
		},
		torso = {
			prio = 1,
			actors = {
				"c_head",
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_spine2",
			},
			push_actors = {
				"c_spine2",
			},
		},
	},
	infighting = InfightingSettings.small,
	max_health = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	num_push_anims = {
		push_backward = 4,
	},
	debug_color = {
		255,
		40,
		90,
		170,
	},
	allowed_layers = {
		bot_poison_wind = 5,
		bot_ratling_gun_fire = 5,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 5,
		planks = 1.5,
		temporary_wall = 0,
	},
}

Breeds.critter_rat = table.create_copy(Breeds.critter_rat, rat_data)

local nurgling_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_height = 0.1,
	aoe_radius = 0.1,
	armor_category = 1,
	base_unit = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling",
	behavior = "critter_nurgling",
	bone_lod_level = 1,
	cannot_far_path = true,
	death_reaction = "critter_nurgling",
	debug_spawn_category = "Misc",
	default_inventory_template = "critter_nurgling",
	detection_radius = 10,
	disable_local_hit_reactions = true,
	exchange_order = 1,
	flingable = false,
	has_inventory = true,
	hit_effect_template = "HitEffectsCritterRat",
	hit_reaction = "ai_default",
	ignore_activate_unit = true,
	no_autoaim = true,
	not_bot_target = true,
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = 0,
	poison_resistance = 70,
	race = "critter",
	radius = 1,
	run_speed = 4,
	target_selection = "pick_closest_target",
	threat_value = 0,
	unit_template = "ai_unit_critter_nurgling",
	vortexable = false,
	walk_speed = 1.6,
	weapon_reach = 2,
	size_variation_range = {
		0.9,
		1.1,
	},
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned,
		}),
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		full = {
			prio = 1,
			actors = {},
		},
		neck = {
			prio = 1,
			actors = {
				"c_head",
			},
		},
		torso = {
			prio = 1,
			actors = {
				"c_hips",
				"c_spine",
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
			},
			push_actors = {
				"c_spine",
			},
		},
	},
	infighting = InfightingSettings.small,
	max_health = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	num_push_anims = {
		push_backward = 4,
	},
	debug_color = {
		255,
		40,
		90,
		170,
	},
	allowed_layers = {
		bot_poison_wind = 5,
		bot_ratling_gun_fire = 5,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 5,
		planks = 1.5,
		temporary_wall = 0,
	},
}

Breeds.critter_nurgling = table.create_copy(Breeds.critter_nurgling, nurgling_data)
BreedActions.critter_nurgling = {
	roam = {
		check_overlap_radius = 0.3,
		find_move_pos = {
			radius = 5,
			spread = 3,
			tries = 15,
		},
	},
	wait = {
		wait_time_max = 12,
		wait_time_min = 2,
	},
	flee = {
		random_point_check = {
			above = 1,
			below = 2,
			max_random_point_check_dist = 10,
			max_tries = 30,
			min_random_point_check_dist = 5,
		},
		has_escaped_players = {
			despawn_distance_sq = 1600,
		},
	},
}
BreedActions.critter_pig = {
	alerted = {
		action_weight = 1,
		cooldown = -1,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run",
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	flee = {
		action_weight = 1,
		time_to_next_look = 6,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		considerations = UtilityConsiderations.clan_rat_follow,
	},
	look_for_players = {
		anim_event = "idle",
		anim_length = 4,
		despawn_radius = 30,
		look_time = 2,
	},
	idle = {},
}
BreedActions.critter_rat = {
	alerted = {
		action_weight = 1,
		cooldown = -1,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run",
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	flee = {
		min_far_along_path_pos_distance_sq = 100,
		considerations = UtilityConsiderations.clan_rat_follow,
		cover_point_check = {
			max_cover_point_check_dist = 25,
			max_height_diff = 2,
			min_cover_point_check_dist = 5,
		},
		random_point_in_front_check = {
			above = 1,
			below = 2,
			max_random_point_in_front_check_dist = 15,
			max_tries = 30,
			max_width = 5,
			min_random_point_in_front_check_dist = 10,
			min_width = 1,
		},
		random_point_check = {
			above = 1,
			below = 2,
			max_random_point_check_dist = 10,
			max_tries = 30,
			min_random_point_check_dist = 5,
		},
		dig_timer = {
			max_time_before_dig = 10,
			min_time_before_dig = 5,
		},
	},
	look_for_players = {
		anim_event = "idle",
		anim_length = 4,
		despawn_radius = 30,
		look_time = 2,
	},
	idle = {},
}
