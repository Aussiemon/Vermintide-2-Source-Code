local breed_data = {
	is_bot_threat = true,
	wwise_voice_switch_group = "stormvermin_vce",
	walk_speed = 2.75,
	perception = "perception_regular",
	poison_resistance = 100,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	has_running_attack = true,
	target_selection = "pick_closest_target_with_spillover",
	disable_crowd_dispersion = true,
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_radius = 0.4,
	aoe_height = 1.7,
	race = "skaven",
	no_stagger_duration = false,
	run_speed = 4.8,
	threat_value = 4,
	detection_radius = 12,
	bone_lod_level = 1,
	smart_object_template = "special",
	default_inventory_template = "halberd",
	stagger_resistance = 1,
	patrol_detection_radius = 10,
	flingable = true,
	panic_close_detection_radius_sq = 9,
	radius = 1,
	hit_mass_count = 5,
	patrol_active_perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -4.5,
	death_reaction = "ai_default",
	armor_category = 2,
	death_sound_event = "Play_stormvermin_die_vce",
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "storm_vermin",
	bots_should_flank = true,
	has_inventory = true,
	scale_death_push = 1,
	awards_positive_reinforcement_message = true,
	follow_reach = 1,
	exchange_order = 3,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVermin",
	smart_targeting_height_multiplier = 2.5,
	horde_behavior = "horde_vermin",
	unit_template = "ai_unit_storm_vermin",
	leave_walk_distance = 4.5,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	death_squad_detection_radius = 8,
	base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin",
	enter_walk_distance = 2.5,
	elite = true,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		1.1,
		1.175
	},
	max_health = {
		13,
		13,
		20,
		26,
		39
	},
	diff_stagger_resist = {
		2.25,
		2.25,
		3,
		4,
		6
	},
	stagger_duration = {
		0.5,
		1,
		1.5,
		1,
		1.25,
		3,
		1,
		1
	},
	hit_mass_counts = {
		5,
		5,
		7.5,
		10,
		15
	},
	wwise_voices = {
		"low",
		"medium",
		"high"
	},
	debug_color = {
		255,
		200,
		0,
		170
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		walk_animation_merge_options = {},
		move_animation_merge_options = {}
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
			prio = 3,
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
			prio = 4,
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
			prio = 4,
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
				"j_hips",
				"j_taill"
			}
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
		j_rightfoot = 0.2,
		j_taill = 0.05,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_tail3 = 0.05,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_leftshoulder = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_spine1 = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_tail6 = 0.05,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2,
		j_tail2 = 0.05
	}
}
Breeds.skaven_storm_vermin = table.create_copy(Breeds.skaven_storm_vermin, breed_data)
Breeds.skaven_storm_vermin_commander = table.create_copy(Breeds.skaven_storm_vermin_commander, breed_data)
Breeds.skaven_storm_vermin_commander.behavior = "storm_vermin_commander"
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
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
				rad = math.pi/2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi/2
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
				rad = math.pi/2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi/2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_special_attack
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack
	},
	special_attack_cleave = {
		offset_up = 0,
		offset_forward = 0,
		height = 3,
		hit_react_type = "heavy",
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "blocked_sv_cleave",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		attack_anim = "attack_special",
		range = 3,
		knocked_down_attack_threshold = 0.6,
		move_anim = "move_fwd",
		width = 0.4,
		knocked_down_attack_anim = {
			"attack_downed",
			"attack_downed_2"
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	special_attack_sweep = {
		offset_up = 1,
		offset_forward = 0.5,
		height = 0.1,
		hit_react_type = "medium",
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "blocked_sv_sweep",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		range = 2.2,
		knocked_down_attack_threshold = 0.6,
		move_anim = "move_fwd",
		width = 2,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2"
		},
		step_attack_anim = {
			"attack_move",
			"attack_move_2"
		},
		knocked_down_attack_anim = {
			"attack_downed",
			"attack_downed_2"
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				15,
				10,
				5
			},
			hard = {
				20,
				15,
				10
			},
			survival_hard = {
				20,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false
		}
	},
	push_attack = {
		max_impact_push_speed = 8,
		hit_react_type = "heavy",
		fatigue_type = "sv_push",
		damage_type = "blunt",
		impact_push_speed = 7,
		action_weight = 1,
		unblockable = true,
		attack_anim = "attack_push",
		considerations = UtilityConsiderations.storm_vermin_push_attack,
		damage = {
			0,
			0,
			0
		},
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		hit_react_type = "medium",
		name = "smash_door",
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = "attack_pounce",
		damage = {
			3,
			3,
			3
		}
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
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
					"stun_bwd_sword_2",
					"stun_bwd_sword_3"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
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
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3"
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
BreedActions.skaven_storm_vermin = table.create_copy(BreedActions.skaven_storm_vermin, action_data)
BreedActions.skaven_storm_vermin_commander = table.create_copy(BreedActions.skaven_storm_vermin_commander, action_data)
BreedActions.skaven_storm_vermin_commander.give_command = {}

return 
