local pushed_data = {
	ahead_dist = 1.5,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 4,
	push_stagger_impact = {
		2,
		2,
		0,
		0
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
local breed_data = {
	detection_radius = 12,
	aoe_radius = 0.4,
	walk_speed = 2.4,
	big_boy_turning_dot = 0.4,
	leave_walk_distance = 4.5,
	target_stickyness_modifier = -10,
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	exchange_order = 2,
	always_look_at_target = true,
	disable_crowd_dispersion = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	stagger_count_reset_time = 5,
	race = "chaos",
	ignore_targets_outside_detection_radius = true,
	sync_full_rotation = false,
	target_selection = "pick_rat_ogre_target_with_weights",
	aoe_height = 1.7,
	perception_previous_attacker_stickyness_value = 0,
	poison_resistance = 100,
	no_stagger_duration = true,
	is_bot_threat = true,
	bot_hitbox_radius_approximation = 0.8,
	default_inventory_template = "warrior_axe",
	stagger_resistance = 5,
	patrol_detection_radius = 10,
	bot_melee_aim_node = "j_spine1",
	wwise_voice_switch_group = "stormvermin_vce",
	primary_armor_category = 6,
	panic_close_detection_radius_sq = 9,
	radius = 1,
	use_slot_type = "large",
	hit_mass_count = 20,
	patrol_active_perception = "perception_regular_update_aggro",
	attack_player_sound_event = "Play_breed_triggered_sound",
	friends_alert_range = 10,
	use_avoidance = false,
	attack_general_sound_event = "Play_breed_triggered_sound",
	proximity_system_check = true,
	death_reaction = "ai_default",
	armor_category = 2,
	dialogue_source_name = "chaos_warrior",
	trigger_dialogue_on_target_switch = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	threat_value = 12,
	awards_positive_reinforcement_message = true,
	use_big_boy_turning = true,
	use_navigation_path_splines = true,
	bone_lod_level = 0,
	smart_targeting_width = 0.2,
	smart_object_template = "chaos_warrior",
	is_bot_aid_threat = true,
	behavior = "chaos_warrior",
	use_regular_horde_spawning = true,
	bots_should_flank = true,
	has_inventory = true,
	run_speed = 4.2,
	aim_template = "chaos_warrior",
	navigation_spline_distance_to_borders = 1,
	stagger_threshold_light = 0.5,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsChaosWarrior",
	smart_targeting_height_multiplier = 3,
	horde_behavior = "chaos_warrior",
	unit_template = "ai_unit_chaos_warrior",
	has_running_attack = true,
	perception = "perception_regular_update_aggro",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	patrol_passive_perception = "perception_regular",
	vortexable = false,
	death_squad_detection_radius = 8,
	base_unit = "units/beings/enemies/chaos_warrior/chr_chaos_warrior",
	enter_walk_distance = 3,
	elite = true,
	displace_players_data = pushed_data,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 5,
		target_stickyness_duration_b = 20,
		aggro_decay_per_sec = 1,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 100,
		target_disabled_mul = 0.15
	},
	size_variation_range = {
		1,
		1
	},
	max_health = {
		40,
		40,
		60,
		80,
		120
	},
	stagger_reduction = {
		1.8,
		1.8,
		2.4,
		3,
		3
	},
	diff_stagger_resist = {
		4.8,
		4.8,
		6.4,
		8,
		8
	},
	stagger_duration = {
		0.1,
		0.3,
		0.75,
		0.1,
		0.1,
		1,
		0.1,
		1
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
	run_on_spawn = AiBreedSnippets.on_chaos_warrior_spawn,
	run_on_update = AiBreedSnippets.on_chaos_warrior_update,
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed, direction)
		if blackboard.stagger_type == 3 or blackboard.stagger_type == 6 then
			if stagger == 3 and blackboard.heavy_stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			elseif stagger ~= 3 and blackboard.stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			end
		end

		return stagger, duration, length
	end,
	hitzone_multiplier_types = {
		head = "headshot",
		neck = "headshot"
	},
	hitzone_primary_armor_categories = {
		head = {
			attack = 6,
			impact = 2
		},
		neck = {
			attack = 6,
			impact = 2
		}
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
				"c_lefthand",
				"c_leftshoulder"
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
				"c_righthand",
				"c_rightshoulder"
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
				"c_leftfoot"
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
				"c_rightfoot"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
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
		c_spine = "j_spine1",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_rightfoot = "j_rightfoot",
		c_lefthand = "j_lefthand",
		c_rightleg = "j_rightleg",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_leftleg = "j_leftleg",
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_rightupleg = "j_rightupleg",
		c_leftarm = "j_leftarm",
		c_rightforearm = "j_rightforearm",
		c_hips = "j_hips",
		c_righthand = "j_righthand"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_spine1 = 0.3,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_righthand = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightarm = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	}
}
Breeds.chaos_warrior = table.create_copy(Breeds.chaos_warrior, breed_data)
local action_data = {
	alerted = {
		no_hesitation = true,
		override_time_alerted = 0.2,
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
		slow_approach_distance_sq = 144,
		slow_approach_time = 5,
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_warrior_follow,
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
	combat_step = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_warrior_combat_step
	},
	special_attack_cleave = {
		step_attack_target_speed_away = 1.5,
		height = 2,
		range = 3,
		fatigue_type = "complete",
		offset_forward = 0,
		rotation_time = 1.5,
		hit_react_type = "heavy",
		bot_threat_duration = 1,
		bot_threat_start_time = 1.25,
		no_block_stagger = true,
		offset_up = 0,
		damage_type = "cutting",
		step_attack_target_speed_away_override = 2,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 1.3,
		action_weight = 1,
		step_attack_distance = 1.8,
		bot_threat_start_time_step = 1.45,
		step_attack_distance_override = 3.2,
		width = 0.4,
		considerations = UtilityConsiderations.chaos_warrior_special_attack,
		attack_anim = {
			"attack_cleave_01",
			"attack_cleave_02"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		reset_attack_animations = {
			"attack_special_reset"
		},
		step_attack_anim = {
			"attack_cleave_moving_01"
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
			true,
			false,
			true,
			true,
			false
		}
	},
	special_attack_sweep = {
		step_attack_target_speed_away = 1.65,
		height = 1,
		fatigue_type = "blocked_sv_cleave",
		push = true,
		range = 3,
		rotation_time = 1,
		hit_react_type = "medium",
		offset_forward = 0,
		blocked_anim = "blocked",
		bot_threat_start_time = 0.4,
		bot_threat_duration = 0.7,
		damage_type = "cutting",
		bot_threat_start_time_step = 0.5,
		step_attack_target_speed_away_override = 2.1,
		offset_up = 0,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 1.2,
		action_weight = 1,
		step_attack_distance = 1.9,
		player_push_speed = 5,
		player_push_speed_blocked = 7.5,
		step_attack_distance_override = 3.2,
		width = 1,
		considerations = UtilityConsiderations.chaos_warrior_sweep_attack,
		attack_anim = {
			"attack_sweep_01",
			"attack_sweep_02",
			"attack_sweep_03"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		reset_attack_animations = {
			"attack_right_reset"
		},
		step_attack_anim = {
			"attack_sweep_moving_01"
		},
		damage = {
			15,
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
			true,
			true,
			false
		}
	},
	special_attack_quick = {
		knocked_down_attack_threshold = 0.6,
		height = 1,
		hit_react_type = "heavy",
		push = true,
		offset_forward = 0,
		rotation_time = 0.75,
		fatigue_type = "blocked_shove",
		offset_up = 0,
		no_block_stagger = true,
		damage_type = "cutting",
		range = 3,
		player_push_speed = 9,
		reset_attack_animation_speed = 1.3,
		action_weight = 1,
		player_push_speed_blocked = 9,
		width = 0.4,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attack_anim = {
			"attack_quick_01",
			"attack_quick_02"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		damage = {
			10,
			5,
			2
		},
		difficulty_damage = {
			easy = {
				10,
				5,
				2
			},
			normal = {
				12,
				7,
				5
			},
			hard = {
				14,
				9,
				7
			},
			survival_hard = {
				14,
				9,
				7
			},
			harder = {
				16,
				11,
				9
			},
			survival_harder = {
				16,
				11,
				9
			},
			hardest = {
				20,
				15,
				10
			},
			survival_hardest = {
				20,
				15,
				10
			}
		},
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false
		}
	},
	running_attack_right = {
		fatigue_type = "blocked_sv_cleave",
		height = 1,
		offset_forward = 0.5,
		push = true,
		offset_up = 1,
		rotation_time = 1.5,
		hit_react_type = "heavy",
		bot_threat_duration = 0.7,
		blocked_anim = "blocked",
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		moving_attack = true,
		range = 3,
		player_push_speed = 9,
		reset_attack_animation_speed = 1.3,
		action_weight = 5,
		player_push_speed_blocked = 9,
		width = 1,
		considerations = UtilityConsiderations.chaos_warrior_running_attack,
		attack_anim = {
			"attack_run",
			"attack_sweep_run_01"
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				10,
				5,
				2
			},
			normal = {
				12,
				7,
				5
			},
			hard = {
				14,
				9,
				7
			},
			survival_hard = {
				14,
				9,
				7
			},
			harder = {
				16,
				11,
				9
			},
			survival_harder = {
				16,
				11,
				9
			},
			hardest = {
				20,
				15,
				10
			},
			survival_hardest = {
				20,
				15,
				10
			}
		},
		ignore_staggers = {
			false,
			false,
			false,
			true,
			false,
			false
		}
	},
	special_attack_launch = {
		shove_z_speed = 2,
		height = 1,
		hit_react_type = "heavy",
		reset_stagger_count = true,
		knocked_down_attack_threshold = 0.6,
		rotation_time = 0.75,
		fatigue_type = "blocked_slam",
		offset_up = 0,
		bot_threat_duration = 0.75,
		no_block_stagger = true,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		offset_forward = 0,
		attack_anim = "attack_pounce",
		range = 4,
		catapult = true,
		reset_attack_animation_speed = 1.3,
		action_weight = 1,
		shove_speed = 5,
		width = 2.2,
		considerations = UtilityConsiderations.chaos_warrior_launch_attack,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		damage = {
			5,
			3,
			2
		},
		difficulty_damage = {
			easy = {
				5,
				3,
				2
			},
			normal = {
				7,
				5,
				3
			},
			hard = {
				10,
				7,
				5
			},
			survival_hard = {
				10,
				7,
				5
			},
			harder = {
				15,
				10,
				7
			},
			survival_harder = {
				15,
				10,
				7
			},
			hardest = {
				20,
				15,
				10
			},
			survival_hardest = {
				20,
				15,
				10
			}
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	push_attack = {
		max_impact_push_speed = 9,
		impact_push_speed = 11,
		fatigue_type = "blocked_slam",
		hit_react_type = "heavy",
		action_weight = 1,
		damage_type = "blunt",
		unblockable = true,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attack_anim = {
			"attack_push_2",
			"attack_push"
		},
		damage = {
			0,
			0,
			0
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce",
		damage = {
			3,
			3,
			3
		}
	},
	blocked = {
		blocked_anims = {
			"blocked"
		}
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 4.5
				blackboard.heavy_stagger_immune_time = t + 4
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				},
				dwn = {
					"hit_react_overhead"
				}
			},
			{
				fwd = {
					"stagger_light_fwd"
				},
				bwd = {
					"stagger_light_bwd"
				},
				left = {
					"stagger_light_left"
				},
				right = {
					"stagger_light_right"
				}
			},
			{
				fwd = {
					"stagger_medium_fwd"
				},
				bwd = {
					"stagger_medium_bwd"
				},
				left = {
					"stagger_medium_left"
				},
				right = {
					"stagger_medium_right"
				}
			},
			{
				fwd = {
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				}
			},
			{
				fwd = {
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_downed"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				left = {
					"stagger_left_downed"
				},
				right = {
					"stagger_right_downed"
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
BreedActions.chaos_warrior = table.create_copy(BreedActions.chaos_warrior, action_data)

return 
