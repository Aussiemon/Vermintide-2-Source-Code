local breed_data = {
	is_bot_threat = true,
	no_stagger_duration = false,
	walk_speed = 2.75,
	has_inventory = true,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	disable_crowd_dispersion = true,
	has_running_attack = true,
	aoe_height = 1.7,
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_radius = 0.4,
	is_always_spawnable = true,
	opt_base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin_baked",
	run_speed = 4.8,
	exchange_order = 3,
	death_reaction = "ai_default",
	detection_radius = 12,
	slot_template = "skaven_elite",
	push_sound_event = "Play_generic_pushed_impact_small_armour",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	default_inventory_template = "halberd",
	stagger_resistance = 2.25,
	patrol_detection_radius = 10,
	awards_positive_reinforcement_message = true,
	flingable = true,
	wwise_voice_switch_group = "stormvermin_vce",
	panic_close_detection_radius_sq = 9,
	radius = 1,
	bone_lod_level = 1,
	hit_mass_count = 5,
	patrol_active_perception = "perception_regular",
	threat_value = 5,
	perception_previous_attacker_stickyness_value = -4.5,
	race = "skaven",
	smart_object_template = "special",
	ai_strength = 6,
	poison_resistance = 100,
	armor_category = 2,
	backstab_player_sound_event = "Play_stormvermin_attack_player_back_vce",
	death_sound_event = "Play_stormvermin_die_vce",
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "storm_vermin",
	bots_should_flank = true,
	target_selection = "pick_closest_target_with_spillover",
	scale_death_push = 1,
	follow_reach = 1,
	ai_toughness = 3,
	stagger_threshold_light = 0.5,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVermin",
	smart_targeting_height_multiplier = 2.5,
	horde_behavior = "horde_vermin",
	unit_template = "ai_unit_storm_vermin",
	leave_walk_distance = 4.5,
	no_stagger_damage_reduction = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
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
	max_health = BreedTweaks.max_health.stormvermin,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_elite,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.stormvermin,
	stagger_reduction = BreedTweaks.stagger_reduction.stormvermin,
	stagger_duration = BreedTweaks.stagger_duration.stormvermin,
	hit_mass_counts = BreedTweaks.hit_mass_counts.stormvermin,
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
Breeds.skaven_storm_vermin_commander.killfeed_fold_with = "skaven_storm_vermin"
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1,
			sweep = 2
		},
		normal = {
			normal = 1,
			sweep = 2
		},
		hard = {
			normal = 1,
			sweep = 2
		},
		harder = {
			normal = 1,
			sweep = 2
		},
		hardest = {
			normal = 1,
			sweep = 2
		},
		cataclysm = {
			normal = 1,
			sweep = 2
		},
		cataclysm_2 = {
			normal = 1,
			sweep = 2
		},
		cataclysm_3 = {
			normal = 1,
			sweep = 2
		}
	},
	cleave = {
		easy = {
			cleave = 2,
			normal = 1
		},
		normal = {
			cleave = 2,
			normal = 1
		},
		hard = {
			cleave = 2,
			normal = 1
		},
		harder = {
			cleave = 2,
			normal = 1
		},
		hardest = {
			cleave = 11,
			normal = -10
		},
		cataclysm = {
			cleave = 11,
			normal = -10
		},
		cataclysm_2 = {
			cleave = 11,
			normal = -10
		},
		cataclysm_3 = {
			cleave = 11,
			normal = -10
		}
	},
	push = {
		easy = {
			push = 1.5
		},
		normal = {
			push = 1.5
		},
		hard = {
			push = 1.5
		},
		harder = {
			push = 1.5
		},
		hardest = {
			push = 1.5
		},
		cataclysm = {
			push = 1.5
		},
		cataclysm_2 = {
			push = 1.5
		},
		cataclysm_3 = {
			push = 1.5
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
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_special_attack
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack
	},
	special_attack_cleave = {
		height = 3,
		offset_forward = 0,
		offset_up = 0,
		cooldown = 1,
		rotation_time = 1,
		hit_react_type = "heavy",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		attack_anim = "attack_special",
		range = 3,
		damage = 30,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "cleave",
		move_anim = "move_fwd",
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		knocked_down_attack_anim = {
			"attack_downed",
			"attack_downed_2"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	special_attack_sweep = {
		hit_react_type = "medium",
		height = 0.1,
		offset_forward = 0.5,
		offset_up = 1,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		range = 2.2,
		damage = 20,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "sweep",
		move_anim = "move_fwd",
		width = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
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
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	push_attack = {
		impact_push_speed = 7,
		damage = 0,
		max_impact_push_speed = 8,
		fatigue_type = "sv_push",
		hit_react_type = "heavy",
		attack_intensity_type = "push",
		action_weight = 1,
		damage_type = "blunt",
		unblockable = true,
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_push_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
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
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = "attack_pounce"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_elite
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
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
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
			}
		}
	}
}
BreedActions.skaven_storm_vermin = table.create_copy(BreedActions.skaven_storm_vermin, action_data)
BreedActions.skaven_storm_vermin_commander = table.create_copy(BreedActions.skaven_storm_vermin_commander, action_data)
BreedActions.skaven_storm_vermin_commander.give_command = {}
