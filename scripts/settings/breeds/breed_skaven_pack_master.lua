local breed_data = {
	detection_radius = 12,
	smart_targeting_outer_width = 0.6,
	has_inventory = true,
	smart_targeting_width = 0.2,
	run_speed = 5,
	flingable = false,
	patrol_active_target_selection = "pick_pack_master_target",
	target_selection = "pick_pack_master_target",
	special = true,
	exchange_order = 2,
	animation_sync_rpc = "rpc_sync_anim_state_6",
	stagger_threshold_heavy = 4,
	armor_category = 3,
	wield_inventory_on_spawn = true,
	stagger_threshold_explosion = 100,
	stagger_threshold_light = 2,
	walk_speed = 2.4,
	poison_resistance = 100,
	hit_reaction = "ai_default",
	boss_staggers = false,
	bot_opportunity_target_melee_range = 5,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	default_inventory_template = "pack_master",
	stagger_resistance = 4,
	patrol_detection_radius = 10,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsSkavenPackMaster",
	smart_targeting_height_multiplier = 3,
	panic_close_detection_radius_sq = 9,
	radius = 1,
	awards_positive_reinforcement_message = true,
	unit_template = "ai_unit_pack_master",
	patrol_active_perception = "perception_regular",
	stagger_reduction = 2,
	race = "skaven",
	bone_lod_level = 1,
	proximity_system_check = true,
	death_reaction = "ai_default",
	perception = "perception_pack_master",
	player_locomotion_constrain_radius = 0.7,
	stagger_threshold_medium = 4,
	smart_object_template = "special",
	dialogue_source_name = "skaven_pack_master",
	weapon_reach = 5,
	bot_opportunity_target_melee_range_while_ranged = 4,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	is_bot_aid_threat = true,
	behavior = "pack_master",
	base_unit = "units/beings/enemies/skaven_pack_master/chr_skaven_pack_master",
	threat_value = 8,
	max_health = {
		25,
		25,
		37.5,
		50,
		75
	},
	diff_stagger_resist = {
		4,
		4,
		5.3,
		6.5,
		6.5
	},
	stagger_duration = {
		0.25,
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
	disabled = Development.setting("disable_pack_master") or false,
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
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
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
			prio = 4,
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
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 1.5,
		bot_ratling_gun_fire = 15,
		jumps = 1.5,
		ledges_with_fence = 1.5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 15,
		fire_grenade = 15
	}
}
Breeds.skaven_pack_master = table.create_copy(Breeds.skaven_pack_master, breed_data)
local action_data = {
	skulk = {
		skulk_time = 1,
		skulk_time_force_attack = 10,
		melee_override_distance_sqr = 16,
		dogpile_aggro_needed = 2
	},
	follow = {
		distance_to_attack = 3,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
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
	grab_attack = {
		attack_anim_duration = 1,
		dodge_angle = 12.5,
		bot_threat_start_time = 0.1,
		cooldown = 4,
		fatigue_type = "blocked_attack",
		dodge_distance = 4,
		damage_type = "pack_master_grab",
		unblockable = true,
		attack_anim = "attack_grab",
		damage = {
			0,
			0
		}
	},
	initial_pull = {
		cooldown = 4,
		pull_time = 1.733,
		pull_distance = 4,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false
		}
	},
	drag = {
		time_to_damage = 1,
		cooldown = 4,
		damage_amount = 3,
		safe_hoist_dist_squared_from_humans = 100,
		hit_zone_name = "full",
		damage_type = "cutting",
		safe_hoist_max_height_differance = 1,
		force_hoist_time = 15,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false
		}
	},
	hoist = {
		cooldown = 4,
		hoist_anim_length = 3.5,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false
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
	stagger = {
		scale_animation_speeds = true,
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
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
					"stun_fwd_sword"
				},
				bwd = {
					"stun_bwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
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
BreedActions.skaven_pack_master = table.create_copy(BreedActions.skaven_pack_master, action_data)

return
