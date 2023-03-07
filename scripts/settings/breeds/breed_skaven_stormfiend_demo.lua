local breed_data = {
	target_selection = "pick_rat_ogre_target_idle",
	target_selection_angry = "pick_closest_target_with_filter",
	is_of_interest_func = "is_of_interest_stormfiend_demo",
	race = "skaven",
	perception_continuous = "perception_continuous_keep_target",
	behavior = "stormfiend_demo",
	perception = "perception_rat_ogre",
	debug_spawn_category = "Misc",
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck1",
				"c_spine1"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm"
			},
			push_actors = {
				"j_spine1"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		tail = {
			prio = 3,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			push_actors = {
				"j_hips"
			}
		},
		aux = {
			prio = 4,
			actors = {
				"c_packmaster_sling",
				"c_packmaster_sling_02",
				"c_back_pack"
			}
		},
		full = {
			prio = 5,
			actors = {}
		},
		afro = {
			prio = 6,
			actors = {
				"c_afro"
			}
		}
	},
	run_on_death = AiBreedSnippets.on_stormfiend_demo_death,
	run_on_despawn = AiBreedSnippets.on_stormfiend_demo_despawn
}

for key, value in pairs(Breeds.skaven_stormfiend) do
	local keep_value = breed_data[key]

	if keep_value == "SET_TO_NIL" then
		breed_data[key] = nil
	elseif keep_value ~= nil then
		breed_data[key] = keep_value
	else
		breed_data[key] = value
	end
end

Breeds.skaven_stormfiend_demo = table.create_copy(Breeds.skaven_stormfiend_demo, breed_data)
Breeds.skaven_stormfiend_demo.is_always_spawnable = nil
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_stormfiend",
		move_anim = "move_start_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.stormfiend_follow,
		follow_target_function_data = {
			check_distance = 12,
			max_wanted_distance = 12,
			min_angle_step = 0,
			max_angle_step = 2,
			failed_move_attempt_angle_increment = 45,
			min_wanted_distance = 10
		},
		init_blackboard = {
			chasing_timer = -10,
			next_rage_time = 0
		}
	},
	shoot = {
		environment_intensity_increase_per_firewall = 10,
		environment_max_intensity = 100,
		firing_time = 1.2,
		aim_start_offset = -1,
		minimum_length = 2,
		maximum_length = 15,
		beam_sfx_start_event = "Play_stormfiend_torch_loop",
		damage_type = "warpfire_ground",
		start_distance = 4,
		beam_sfx_stop_event = "Stop_stormfiend_torch_loop",
		action_weight = 1,
		use_demo_flow_event = true,
		global_sound_parameter = "stormfiend_mood",
		aim_constraint_target = {
			attack_right = "right_arm_aim_target",
			attack_left = "left_arm_aim_target"
		},
		aim_constraint_animations = {
			attack_left = {
				off = "aim_at_left_off",
				on = "aim_at_left_on"
			},
			attack_right = {
				off = "aim_at_right_off",
				on = "aim_at_right_on"
			}
		},
		attack_anims = {
			fwd = {
				attack_right = "attack_fire_right_arm",
				attack_left = "attack_fire_left_arm"
			},
			bwd = {
				attack_right = "attack_fire_turn_bwd"
			},
			left = {
				attack_left = "attack_fire_turn_left"
			},
			right = {
				attack_right = "attack_fire_turn_right"
			}
		},
		attack_anims_data = {
			attack_fire_left_arm = {
				rad = 0,
				dir = 1
			},
			attack_fire_right_arm = {
				rad = 0,
				dir = 1
			},
			attack_fire_turn_bwd = {
				dir = 1,
				rad = math.pi
			},
			attack_fire_turn_left = {
				dir = 1,
				rad = math.pi / 2
			},
			attack_fire_turn_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		attack_times = {
			attack_fire_right_arm = 1.6,
			attack_fire_turn_left = 2.3,
			attack_fire_turn_bwd = 2.3,
			attack_fire_left_arm = 1.6,
			attack_fire_turn_right = 2.3
		},
		shoulder_nodes = {
			attack_right = "j_rightshoulder",
			attack_left = "j_leftshoulder"
		},
		muzzle_nodes = {
			attack_right = "fx_right_muzzle",
			attack_left = "fx_left_muzzle"
		},
		damage = {
			10,
			10,
			0,
			0,
			10
		},
		difficulty_damage = {
			easy = {
				10,
				10,
				0,
				0,
				10
			},
			normal = {
				10,
				10,
				0,
				0,
				10
			},
			hard = {
				10,
				10,
				0,
				0,
				10
			},
			cataclysm = {
				10,
				10,
				0,
				0,
				10
			},
			harder = {
				10,
				10,
				0,
				0,
				10
			},
			cataclysm_2 = {
				10,
				10,
				0,
				0,
				10
			},
			hardest = {
				10,
				10,
				0,
				0,
				10
			},
			cataclysm_3 = {
				10,
				10,
				0,
				0,
				10
			}
		},
		immune_breeds = {
			chaos_troll = true,
			chaos_dummy_troll = true,
			chaos_spawn = true,
			skaven_warpfire_thrower = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true
		},
		considerations = UtilityConsiderations.stormfiend_demo_shoot
	}
}

for key, value in pairs(BreedActions.skaven_stormfiend) do
	local keep_value = action_data[key]

	if keep_value == "SET_TO_NIL" then
		action_data[key] = nil
	elseif keep_value ~= nil then
		action_data[key] = keep_value
	else
		action_data[key] = value
	end
end

BreedActions.skaven_stormfiend_demo = table.create_copy(BreedActions.skaven_stormfiend_demo, action_data)
