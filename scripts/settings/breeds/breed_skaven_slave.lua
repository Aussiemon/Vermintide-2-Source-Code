local stagger_types = require("scripts/utils/stagger_types")
breed_data = {
	detection_radius = 10,
	walk_speed = 2.5,
	leave_walk_distance = 1,
	enter_walk_distance = 0.1,
	has_inventory = true,
	ai_toughness = 1,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	scale_death_push = 1,
	is_always_spawnable = true,
	opt_base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_slave_baked",
	death_reaction = "ai_default",
	dialogue_source_name = "skaven_slave",
	attack_general_sound_event = "Play_slave_rat_attack_husk_vce",
	slot_template = "skaven_horde",
	aoe_height = 1.2,
	bone_lod_level = 1,
	has_running_attack = true,
	stagger_resistance = 1,
	patrol_detection_radius = 10,
	flingable = true,
	wwise_voice_switch_group = "clan_rat_vce",
	panic_close_detection_radius_sq = 9,
	radius = 1.75,
	use_backstab_vo = true,
	hit_mass_count = 1,
	patrol_active_perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -12.5,
	race = "skaven",
	ai_strength = 1,
	poison_resistance = 70,
	armor_category = 1,
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	death_sound_event = "Play_slave_rat_die_vce",
	smart_targeting_width = 0.1,
	behavior = "slave_rat",
	attack_player_sound_event = "Play_slave_rat_attack_player_vce",
	target_selection = "pick_closest_target_with_spillover",
	run_speed = 4.25,
	exchange_order = 5,
	stagger_threshold_light = 0,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 0.5,
	unit_variation_setting_name = "skaven_slave",
	hit_effect_template = "HitEffectsSkavenSlave",
	smart_targeting_height_multiplier = 3,
	passive_walk_speed = 2,
	horde_behavior = "horde_rat",
	unit_template = "ai_unit_clan_rat",
	smart_object_template = "default_clan_rat",
	stagger_duration_mod = 1,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_slave",
	threat_value = 1,
	default_inventory_template = {
		"skaven_slave_sword",
		"skaven_slave_spear"
	},
	opt_default_inventory_template = {
		"opt_skaven_slave_sword",
		"opt_skaven_slave_spear"
	},
	size_variation_range = {
		0.85,
		0.95
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
		walk_animation_merge_options = {},
		interest_point_animation_merge_options = {}
	},
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
				"j_neck",
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
				"j_neck",
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
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
				"j_hips",
				"j_taill"
			}
		},
		full = {
			prio = 4,
			actors = {}
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_righthand = "j_righthand",
		c_rightfoot = "j_rightfoot",
		c_tail2 = "j_tail2",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_tail5 = "j_tail5",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine1",
		c_tail6 = "j_tail6",
		c_rightupleg = "j_rightupleg",
		c_tail1 = "j_taill",
		c_tail4 = "j_tail4",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_righttoebase = "j_righttoebase",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_tail3 = "j_tail3",
		c_rightforearm = "j_rightforearm",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips",
		c_lefttoebase = "j_lefttoebase"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.15,
		j_taill = 0.05,
		j_leftarm = 0.15,
		j_leftforearm = 0.15,
		j_leftleg = 0.15,
		j_tail3 = 0.05,
		j_neck_1 = 0.2,
		j_leftupleg = 0.15,
		j_rightshoulder = 0.2,
		j_rightarm = 0.15,
		j_righttoebase = 0.15,
		j_tail4 = 0.05,
		j_hips = 0.2,
		j_spine1 = 0.2,
		j_rightleg = 0.15,
		j_leftfoot = 0.15,
		j_leftshoulder = 0.2,
		j_tail5 = 0.05,
		j_rightupleg = 0.15,
		j_righthand = 0.15,
		j_lefttoebase = 0.15,
		j_head = 0.3,
		j_tail6 = 0.05,
		j_neck = 0.2,
		j_spine = 0.2,
		j_lefthand = 0.15,
		j_rightforearm = 0.15,
		j_tail2 = 0.05
	},
	max_health = BreedTweaks.max_health.slave_rat,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_horde,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.slave_rat,
	stagger_duration = BreedTweaks.stagger_duration.slave_rat,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	hit_mass_counts = BreedTweaks.hit_mass_counts.slave_rat,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	num_push_anims = {
		push_backward = 4
	},
	wwise_voices = {
		"slave_james",
		"slave_magnus"
	},
	debug_color = {
		255,
		240,
		90,
		10
	}
}
Breeds.skaven_slave = table.create_copy(Breeds.skaven_slave, breed_data)
local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 2
		},
		normal = {
			normal = 2
		},
		hard = {
			normal = 2
		},
		harder = {
			normal = 2
		},
		hardest = {
			normal = 2
		},
		cataclysm = {
			normal = 2
		},
		cataclysm_2 = {
			normal = 2
		},
		cataclysm_3 = {
			normal = 2
		}
	},
	running = {
		easy = {
			running = 2.5
		},
		normal = {
			running = 2.5
		},
		hard = {
			running = 2.5
		},
		harder = {
			running = 2.5
		},
		hardest = {
			running = 2.5
		},
		cataclysm = {
			running = 2.5
		},
		cataclysm_2 = {
			running = 2.5
		},
		cataclysm_3 = {
			running = 2.5
		}
	}
}
local action_data = {
	idle = {
		alerted_anims = {
			"alerted"
		}
	},
	alerted = {
		cooldown = -1,
		do_wall_check = true,
		action_weight = 1,
		start_anims_name = {
			bwd = "alerted_bwd",
			fwd = "alerted_fwd",
			left = "alerted_left",
			right = "alerted_right"
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
		cooldown = -1,
		action_weight = 1,
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
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	climb = {},
	running_attack = {
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "running",
		action_weight = 10,
		moving_attack = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_move",
				"attack_move_1",
				"attack_move_2"
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_horde_attack,
		considerations = UtilityConsiderations.clan_rat_running_attack,
		fatigue_type = BreedTweaks.fatigue_types.horde.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.horde,
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_horde,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack
	},
	normal_attack = {
		damage_type = "cutting",
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "normal",
		action_weight = 1,
		move_anim = "move_fwd",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2",
				"attack_pounce_3",
				"attack_pounce_4"
			},
			damage_box_range = {
				flat = 2,
				up = 1.7,
				down = -0.75
			}
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_reach_up",
				"attack_reach_up_2",
				"attack_reach_up_3",
				"attack_reach_up_4"
			},
			damage_box_range = {
				flat = 1.5,
				up = 3.8,
				down = 0
			}
		},
		mid_attack = {
			z_threshold = -0.6,
			flat_threshold = 1.5,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3"
			},
			damage_box_range = {
				flat = 2,
				up = 1.7,
				down = -2
			}
		},
		low_attack = {
			z_threshold = -0.6,
			anims = {
				"attack_reach_down",
				"attack_reach_down_2",
				"attack_reach_down_3"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		target_type_exceptions = {
			poison_well = {
				anims = "poison_well",
				damage_box_range = {
					flat = 2,
					up = 1.7,
					down = -0.75
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_horde_attack,
		considerations = UtilityConsiderations.clan_rat_attack,
		fatigue_type = BreedTweaks.fatigue_types.horde.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.horde,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		attack_directions = {
			attack_pounce_down_3 = "left",
			attack_move_2 = "left",
			attack_reach_down_2 = "left",
			attack_pounce_2 = "left",
			attack_reach_up_3 = "right",
			attack_move_1 = "right",
			attack_reach_up_2 = "left",
			attack_pounce_down = "left",
			attack_move = "left",
			attack_reach_down = "left",
			attack_run = "left",
			attack_pounce_down_2 = "right",
			attack_reach_up_4 = "left",
			attack_reach_up = "left",
			attack_reach_down_3 = "right",
			attack_pounce_4 = "right",
			attack_pounce_3 = "right",
			attack_pounce = "right"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_horde
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		unblockable = true,
		name = "smash_door",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce"
	},
	interest_point_choose = {
		max_range = 10,
		name = "interest_point_choose",
		min_range = 4
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		name = "utility_action",
		fail_cooldown_name = "utility_fail_cooldown"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3"
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_horde
	},
	stagger = {
		scale_animation_speeds = true,
		imation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 1.25
				blackboard.heavy_stagger_immune_time = t + 0.5
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 2.5
				blackboard.heavy_stagger_immune_time = t + 2
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stun_fwd_sword"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5"
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4"
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2"
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2"
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2"
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2"
				}
			},
			{
				fwd = {
					"stagger_fwd_stab"
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2"
				},
				left = {
					"stagger_left_stab"
				},
				right = {
					"stagger_right_stab"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_exp",
					"stagger_bwd_exp_2"
				},
				left = {
					"stagger_left_exp",
					"stagger_left_exp_2"
				},
				right = {
					"stagger_right_exp",
					"stagger_right_exp_2"
				}
			},
			{
				fwd = {
					"stagger_short_fwd",
					"stagger_short_fwd_2"
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2",
					"stagger_short_bwd_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
					"stagger_short_left",
					"stagger_short_left_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_right",
					"stagger_short_right_2"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5"
				},
				dwn = {
					"stun_down"
				}
			}
		}
	}
}
BreedActions.skaven_slave_rat = table.create_copy(BreedActions.skaven_slave_rat, action_data)
