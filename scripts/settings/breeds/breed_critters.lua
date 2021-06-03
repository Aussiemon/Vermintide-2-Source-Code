local pig_data = {
	detection_radius = 10,
	target_selection = "pick_no_targets",
	run_speed = 6,
	exchange_order = 1,
	flingable = false,
	has_inventory = false,
	perception = "perception_no_seeing",
	not_bot_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_radius = 0.25,
	is_always_spawnable = true,
	poison_resistance = 70,
	debug_spawn_category = "Misc",
	cannot_far_path = true,
	aoe_height = 0.5,
	walk_speed = 4,
	hit_reaction = "ai_default",
	bone_lod_level = 1,
	hit_effect_template = "HitEffectsCritterPig",
	radius = 1,
	unit_template = "ai_unit_critter",
	perception_previous_attacker_stickyness_value = 0,
	race = "critter",
	no_autoaim = true,
	death_reaction = "ai_default",
	armor_category = 1,
	weapon_reach = 2,
	vortexable = false,
	disable_local_hit_reactions = true,
	behavior = "critter_pig",
	base_unit = "units/beings/critters/chr_critter_pig/chr_critter_pig",
	threat_value = 0,
	ignore_activate_unit = true,
	size_variation_range = {
		0.9,
		1.1
	},
	animation_merge_options = {
		idle_animation_merge_options = {}
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		neck = {
			prio = 1,
			actors = {
				"c_neck"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_neck",
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_spine2"
			},
			push_actors = {
				"c_spine2"
			}
		},
		full = {
			prio = 3,
			actors = {}
		}
	},
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
	num_push_anims = {
		push_backward = 4
	},
	debug_color = {
		255,
		40,
		90,
		170
	},
	allowed_layers = {}
}
Breeds.critter_pig = table.create_copy(Breeds.critter_pig, pig_data)
local rat_data = {
	detection_radius = 10,
	target_selection = "pick_closest_target",
	run_speed = 6,
	exchange_order = 1,
	flingable = false,
	has_inventory = false,
	perception = "perception_regular",
	not_bot_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	aoe_radius = 0.1,
	poison_resistance = 70,
	debug_spawn_category = "Misc",
	aoe_height = 0.1,
	cannot_far_path = true,
	walk_speed = 4,
	hit_reaction = "ai_default",
	bone_lod_level = 1,
	hit_effect_template = "HitEffectsCritterRat",
	radius = 1,
	unit_template = "ai_unit_critter",
	perception_previous_attacker_stickyness_value = 0,
	race = "critter",
	no_autoaim = true,
	death_reaction = "ai_default",
	armor_category = 1,
	weapon_reach = 2,
	vortexable = false,
	disable_local_hit_reactions = true,
	behavior = "critter_rat",
	base_unit = "units/beings/critters/chr_critter_common_rat/chr_critter_common_rat",
	threat_value = 0,
	ignore_activate_unit = true,
	size_variation_range = {
		0.9,
		1.1
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {}
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
		neck = {
			prio = 1,
			actors = {
				"c_head"
			}
		},
		torso = {
			prio = 1,
			actors = {
				"c_head",
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_spine2"
			},
			push_actors = {
				"c_spine2"
			}
		}
	},
	max_health = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	num_push_anims = {
		push_backward = 4
	},
	debug_color = {
		255,
		40,
		90,
		170
	},
	allowed_layers = {
		planks = 1.5,
		bot_ratling_gun_fire = 5,
		doors = 1.5,
		destructible_wall = 0,
		bot_poison_wind = 5,
		temporary_wall = 0,
		fire_grenade = 5
	}
}
Breeds.critter_rat = table.create_copy(Breeds.critter_rat, rat_data)
BreedActions.critter_pig = {
	alerted = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run"
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	flee = {
		time_to_next_look = 6,
		action_weight = 1,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	look_for_players = {
		anim_event = "idle",
		despawn_radius = 30,
		anim_length = 4,
		look_time = 2
	},
	idle = {}
}
BreedActions.critter_rat = {
	alerted = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "run",
			fwd = "run",
			left = "run",
			right = "run"
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	flee = {
		min_far_along_path_pos_distance_sq = 100,
		considerations = UtilityConsiderations.clan_rat_follow,
		cover_point_check = {
			max_height_diff = 2,
			max_cover_point_check_dist = 25,
			min_cover_point_check_dist = 5
		},
		random_point_in_front_check = {
			max_random_point_in_front_check_dist = 15,
			below = 2,
			min_width = 1,
			max_tries = 30,
			max_width = 5,
			above = 1,
			min_random_point_in_front_check_dist = 10
		},
		random_point_check = {
			below = 2,
			max_tries = 30,
			min_random_point_check_dist = 5,
			above = 1,
			max_random_point_check_dist = 10
		},
		dig_timer = {
			max_time_before_dig = 10,
			min_time_before_dig = 5
		}
	},
	look_for_players = {
		anim_event = "idle",
		despawn_radius = 30,
		anim_length = 4,
		look_time = 2
	},
	idle = {}
}

return
