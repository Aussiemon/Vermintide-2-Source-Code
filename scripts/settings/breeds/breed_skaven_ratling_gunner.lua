local breed_data = {
	spawning_rule = "always_ahead",
	has_inventory = true,
	flingable = true,
	run_speed = 4,
	special = true,
	walk_speed = 1.9,
	target_selection = "pick_closest_target",
	always_look_at_target = true,
	exchange_order = 2,
	animation_sync_rpc = "rpc_sync_anim_state_4",
	smart_targeting_width = 0.3,
	armor_category = 2,
	aim_template = "ratling_gunner",
	poison_resistance = 100,
	no_stagger_duration = true,
	scale_death_push = 2,
	is_bot_aid_threat = true,
	hit_reaction = "ai_default",
	bots_flank_while_targeted = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	wield_inventory_on_spawn = true,
	awards_positive_reinforcement_message = true,
	default_inventory_template = "ratlinggun",
	smart_targeting_outer_width = 0.7,
	hit_effect_template = "HitEffectsRatlingGunner",
	smart_targeting_height_multiplier = 2.1,
	bone_lod_level = 1,
	radius = 1,
	smart_object_template = "special",
	unit_template = "ai_unit_ratling_gunner",
	perception_previous_attacker_stickyness_value = -20,
	race = "skaven",
	proximity_system_check = true,
	death_reaction = "ai_default",
	perception = "perception_all_seeing",
	player_locomotion_constrain_radius = 0.7,
	death_sound_event = "Play_enemy_vo_ratling_gunner_die",
	weapon_reach = 2,
	vortexable = true,
	perception_continuous = "perception_continuous_keep_target",
	behavior = "skaven_ratling_gunner",
	base_unit = "units/beings/enemies/skaven_ratlinggunner/chr_skaven_ratlinggunner",
	threat_value = 8,
	bots_should_flank = true,
	detection_radius = math.huge,
	size_variation_range = {
		1.1,
		1.1
	},
	max_health = {
		12,
		12,
		18,
		24,
		36
	},
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	debug_color = {
		255,
		200,
		200,
		0
	},
	disabled = Development.setting("disable_ratling_gunner") or false,
	line_of_sight_cast_template = {
		"c_spine",
		"c_head",
		c_spine = false,
		c_head = false,
		current_index = 1
	},
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
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
				"c_neck",
				"c_neck1"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine2",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_arm = {
			prio = 4,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		right_arm = {
			prio = 4,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_leg = {
			prio = 4,
			actors = {
				"c_leftleg",
				"c_leftupleg",
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
			prio = 4,
			actors = {
				"c_rightleg",
				"c_rightupleg",
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
			prio = 4,
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
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		},
		aux = {
			prio = 6,
			actors = {
				"c_backpack"
			},
			push_actors = {
				"j_backpack"
			}
		}
	}
}
Breeds.skaven_ratling_gunner = table.create_copy(Breeds.skaven_ratling_gunner, breed_data)
local action_data = {
	move_to_players = {
		find_target_function_name = "_find_target_ratling_gunner"
	},
	lurk = {
		move_anim = "move_fwd",
		check_distance = 35,
		move_speed = breed_data.walk_speed
	},
	engage = {
		check_distance = 20,
		max_angle_step = 2,
		move_anim = "move_fwd_run",
		min_angle_step = 0,
		move_speed = breed_data.run_speed
	},
	move_to_shoot_position = {
		move_anim = "move_fwd_run",
		move_speed = breed_data.run_speed,
		keep_target_distance = {
			15,
			20
		}
	},
	wind_up_ratling_gun = {
		wind_up_time = {
			2,
			2
		}
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "smash_door",
		damage = {
			5,
			5,
			5
		}
	},
	shoot_ratling_gun = {
		fire_rate_at_start = 10,
		attack_template = "shot_machinegun",
		angle_speed = 20,
		nav_obstacle_layer_name = "bot_ratling_gun_fire",
		fire_rate_at_end = 25,
		projectile_speed = 80,
		impact_push_speed = 1.5,
		max_fire_rate_at_percentage = 0.25,
		hit_effect = "ratling_gunner",
		afro_hit_sound = "bullet_pass_by",
		projectile_max_range = 50,
		light_weight_projectile_particle_effect = "ratling_gun_bullet",
		attack_time = {
			7,
			10
		},
		attack_power_level = {
			50,
			100,
			150,
			200,
			250
		},
		power_distribution = {
			attack = 0.3,
			impact = 0.7
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		armour_modifier = {
			attack = {
				1,
				0.5,
				2.5,
				1,
				1.5
			},
			impact = {
				1,
				1,
				0,
				1,
				1.5
			}
		},
		spread = math.degrees_to_radians(7),
		target_switch_distance = {
			15,
			15
		},
		radial_speed_feet_shooting = math.pi * 0.725,
		radial_speed_upper_body_shooting = math.pi * 0.35,
		line_of_fire_nav_obstacle_half_extents = Vector3Box(1, 25, 1),
		arc_of_sight_nav_obstacle_half_extents = Vector3Box(5, 5, 1),
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	stagger = {
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
					"stun_fwd_sword_2"
				},
				bwd = {
					"stun_bwd_sword",
					"stun_bwd_sword_2"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2"
				}
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2"
				},
				left = {
					"stagger_left",
					"stagger_left_2"
				},
				right = {
					"stagger_right",
					"stagger_right_2"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stun_ranged_fwd"
				},
				bwd = {
					"stun_ranged_bwd"
				},
				left = {
					"stun_ranged_left"
				},
				right = {
					"stun_ranged_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_stab"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				left = {
					"stagger_left_exp"
				},
				right = {
					"stagger_right_exp"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			}
		}
	}
}
BreedActions.skaven_ratling_gunner = table.create_copy(BreedActions.skaven_ratling_gunner, action_data)

return
