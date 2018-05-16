local pet_pig_data = {
	has_inventory = false,
	walk_speed = 2,
	unit_template = "ai_pet_unit",
	run_speed = 4,
	threat_value = 0,
	perception_previous_attacker_stickyness_value = 0,
	race = "critter",
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	perception = "perception_all_seeing",
	target_selection = "pick_player_controller_allied",
	not_bot_target = true,
	debug_spawn_category = "Allied",
	cannot_far_path = true,
	far_off_despawn_immunity = true,
	disable_local_hit_reactions = true,
	no_autoaim = true,
	bone_lod_level = 1,
	detection_radius = 30,
	behavior = "pet_pig",
	base_unit = "units/beings/critters/chr_critter_pig/chr_critter_pig",
	allied = true,
	size_variation_range = {
		0.5,
		0.5
	},
	animation_merge_options = {
		idle_animation_merge_options = {}
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
		torso = {
			prio = 1,
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
		}
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
Breeds.pet_pig = table.create_copy(Breeds.pet_pig, pet_pig_data)
local pet_rat_data = {
	has_inventory = false,
	walk_speed = 2,
	unit_template = "ai_pet_unit",
	run_speed = 4,
	threat_value = 0,
	perception_previous_attacker_stickyness_value = 0,
	race = "critter",
	exchange_order = 1,
	animation_sync_rpc = "rpc_sync_anim_state_1",
	perception = "perception_all_seeing",
	target_selection = "pick_player_controller_allied",
	not_bot_target = true,
	debug_spawn_category = "Allied",
	cannot_far_path = true,
	far_off_despawn_immunity = true,
	disable_local_hit_reactions = true,
	no_autoaim = true,
	bone_lod_level = 1,
	detection_radius = 30,
	behavior = "pet_pig",
	base_unit = "units/beings/critters/chr_critter_common_rat/chr_critter_common_rat",
	allied = true,
	size_variation_range = {
		0.5,
		0.5
	},
	animation_merge_options = {
		idle_animation_merge_options = {}
	},
	hitzone_multiplier_types = {},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
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
Breeds.pet_rat = table.create_copy(Breeds.pet_rat, pet_rat_data)
BreedActions.pet_pig = {
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
	follow = {
		move_anim = "move_fwd",
		time_to_next_look = 6,
		action_weight = 1,
		start_anims_name = {
			bwd = "walk",
			fwd = "walk",
			left = "walk",
			right = "walk"
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
		considerations = UtilityConsiderations.pet_follow
	},
	avoid_combat = {
		move_anim = "move_fwd",
		start_anims_name = {
			bwd = "walk",
			fwd = "walk",
			left = "walk",
			right = "walk"
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
		}
	},
	idle = {}
}

return
