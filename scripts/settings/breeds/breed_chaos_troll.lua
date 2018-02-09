local pushed_data = {
	ahead_dist = 1.5,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 7,
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
local running_pushed_data = {
	ahead_dist = 2.5,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 9,
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
	detection_radius = 9999999,
	husk_hit_reaction_cooldown = 1,
	walk_speed = 4,
	big_boy_turning_dot = 0.4,
	has_inventory = true,
	behavior = "troll",
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	death_reaction = "ai_default",
	always_look_at_target = true,
	patrol_active_perception = "perception_rat_ogre",
	animation_sync_rpc = "rpc_sync_anim_state_9",
	aoe_radius = 1,
	exchange_order = 1,
	patrol_detection_radius = 10,
	boss = true,
	chance_of_starting_sleepy = 0,
	regen_pulse_intensity = 0.1,
	use_avoidance = false,
	ignore_nav_propagation_box = true,
	target_selection_angry = "pick_rat_ogre_target_with_weights",
	bot_opportunity_target_melee_range = 7,
	wield_inventory_on_spawn = true,
	default_inventory_template = "chaos_troll",
	stagger_resistance = 100,
	use_aggro = true,
	scale_death_push = 1,
	boss_staggers = true,
	downed_pulse_interval = 1,
	panic_close_detection_radius_sq = 9,
	radius = 2,
	poison_resistance = 100,
	keep_weapon_on_death = false,
	no_stagger_duration = false,
	stagger_threshold_explosion = 1,
	is_bot_aid_threat = true,
	distance_sq_idle_auto_detect_target = 49,
	race = "chaos",
	bot_opportunity_target_melee_range_while_ranged = 5,
	proximity_system_check = true,
	armor_category = 3,
	bot_hitbox_radius_approximation = 1,
	combat_music_state = "troll",
	trigger_dialogue_on_target_switch = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	threat_value = 32,
	use_big_boy_turning = true,
	use_navigation_path_splines = true,
	bone_lod_level = 0,
	distance_sq_can_detect_target = 2025,
	smart_object_template = "chaos_troll",
	perception_continuous = "perception_continuous_chaos_troll",
	initial_is_passive = false,
	passive_in_patrol_start_anim = "move_fwd",
	bots_should_flank = true,
	downed_pulse_intensity = 0.2,
	bot_melee_aim_node = "j_hips",
	target_selection = "pick_rat_ogre_target_idle",
	run_speed = 5.25,
	awards_positive_reinforcement_message = true,
	aim_template = "chaos_warrior",
	stagger_threshold_heavy = 1,
	reach_distance = 3,
	navigation_spline_distance_to_borders = 1,
	stagger_threshold_light = 1,
	hit_reaction = "ai_default",
	passive_in_patrol = true,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	hit_effect_template = "HitEffectsChaosTroll",
	unit_template = "ai_unit_chaos_troll",
	has_running_attack = true,
	dialogue_target_switch_event = "enemy_target_changed",
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 1.5,
	stagger_threshold_medium = 1,
	dialogue_target_switch_attack_tag = "chaos_troll_target_changed",
	regen_pulse_interval = 2,
	far_off_despawn_immunity = true,
	patrol_passive_perception = "perception_rat_ogre",
	base_unit = "units/beings/enemies/chaos_troll/chr_chaos_troll",
	aoe_height = 2.4,
	displace_players_data = pushed_data,
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 5,
		target_stickyness_duration_b = 10,
		aggro_decay_per_sec = 5,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 100,
		target_disabled_mul = 0.15
	},
	max_health = {
		700,
		700,
		1050,
		1400,
		2000
	},
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		5,
		0,
		1
	},
	health_regen_per_sec = {
		2.5,
		2.5,
		3.75,
		5,
		7.5
	},
	debug_color = {
		255,
		20,
		20,
		20
	},
	run_on_spawn = AiBreedSnippets.on_chaos_troll_spawn,
	run_on_death = AiBreedSnippets.on_chaos_troll_death,
	run_on_despawn = AiBreedSnippets.on_chaos_troll_despawn,
	blackboard_init_data = {
		ladder_distance = math.huge
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
				"c_spine",
				"c_spine1",
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
			prio = 4,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand"
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
				"j_rightarm",
				"j_rightforearm",
				"j_righthand"
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
				"j_leftupleg",
				"j_leftleg",
				"j_leftfoot"
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
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot"
			}
		},
		afro = {
			prio = 5,
			actors = {
				"afro"
			}
		}
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 1.5,
		bot_ratling_gun_fire = 15,
		jumps = 1.5,
		big_boy_destructible = 1.5,
		ledges_with_fence = 1.5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 0,
		fire_grenade = 15
	},
	nav_cost_map_allowed_layers = {
		plague_wave = 1,
		troll_bile = 1,
		lamp_oil_fire = 15,
		warpfire_thrower_warpfire = 1,
		vortex_near = 1,
		stormfiend_warpfire = 1,
		vortex_danger_zone = 1
	}
}
Breeds.chaos_troll = table.create_copy(Breeds.chaos_troll, breed_data)
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_rat_ogre",
		override_move_speed = 4.25,
		move_anim = "move_start_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.troll_follow,
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
		init_blackboard = {
			chasing_timer = -10
		}
	},
	follow_crouching = {
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_start_fwd",
		action_weight = 1,
		override_move_speed = 4,
		crouching = true,
		considerations = UtilityConsiderations.troll_follow,
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
		init_blackboard = {
			chasing_timer = -10
		}
	},
	smash_door = {
		unblockable = true,
		name = "smash_door",
		damage_type = "cutting",
		move_anim = "move_start_fwd",
		attack_anim = "smash_door",
		door_attack_distance = 2,
		damage = {
			25,
			25,
			25
		}
	},
	attack_cleave = {
		damage_type = "cutting",
		target_running_velocity_threshold = 0.75,
		fatigue_type = "complete",
		action_weight = 1,
		considerations = UtilityConsiderations.troll_cleave,
		attacks = {
			{
				height = 2.5,
				offset_forward = 1.1,
				ignores_dodging = false,
				rotation_time = 1.6,
				anim_driven = false,
				offset_up = 0,
				range = 2.5,
				player_push_speed = 8,
				damage_done_time = 1.5333333333333334,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 2.5,
				width = 1.5,
				multi_attack_anims = {
					fwd = "attack_cleave",
					left = "attack_cleave_left",
					right = "attack_cleave_right"
				},
				multi_anims_data = {
					attack_cleave = {},
					attack_cleave_left = {
						dir = 1,
						rad = math.pi/2
					},
					attack_cleave_right = {
						dir = -1,
						rad = math.pi/2
					}
				},
				attack_anim = {
					"attack_cleave"
				},
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						duration = 0.6666666666666666,
						start_time = 1
					}
				}
			}
		},
		running_attacks = {
			{
				player_push_speed = 8,
				range = 2.5,
				height = 2.5,
				width = 1.5,
				ignores_dodging = false,
				rotation_time = 2.3,
				anim_driven = true,
				offset_forward = 1,
				damage_done_time = 1.4333333333333333,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 3,
				offset_up = 0,
				attack_anim = {
					"attack_move_cleave"
				},
				push_units_in_the_way = running_pushed_data,
				bot_threats = {
					{
						duration = 0.6666666666666666,
						start_time = 0.9
					}
				}
			}
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				25,
				20,
				15
			},
			normal = {
				35,
				25,
				20
			},
			hard = {
				50,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				80,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				150,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		blocked_damage = {
			15,
			4,
			2.5
		},
		blocked_difficulty_damage = {
			easy = {
				2,
				4,
				2.5
			},
			normal = {
				5,
				4,
				2.5
			},
			hard = {
				15,
				5,
				2.5
			},
			survival_hard = {
				7,
				5,
				2.5
			},
			harder = {
				20,
				7.5,
				5
			},
			survival_harder = {
				9,
				7.5,
				5
			},
			hardest = {
				25,
				10,
				7.5
			},
			survival_hardest = {
				50,
				15,
				11.25
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
	attack_crouch_sweep = {
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		action_weight = 1,
		considerations = UtilityConsiderations.attack_crouch_sweep,
		attacks = {
			{
				anim_driven = false,
				height = 2,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				rotation_time = 1,
				freeze_intensity_decay_time = 15,
				catapult_player = true,
				offset_forward = 0,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				range = 2,
				player_push_speed = 16,
				damage_done_time = 1.3333333333333333,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 2.3333333333333335,
				width = 0.4,
				attack_anim = {
					"attack_sweep"
				},
				continious_overlap = {
					attack_sweep = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6666666666666666
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						6,
						3,
						0,
						0
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threats = {
					{
						collision_type = "cylinder",
						offset_forward = 0,
						radius = 3.5,
						height = 3.5,
						offset_right = 0,
						offset_up = 0,
						duration = 1.2,
						start_time = 0.13333333333333333
					}
				}
			}
		},
		damage = {
			8,
			20,
			20
		},
		difficulty_damage = {
			easy = {
				5,
				20,
				20
			},
			normal = {
				8,
				20,
				20
			},
			hard = {
				12,
				25,
				25
			},
			survival_hard = {
				12,
				25,
				25
			},
			harder = {
				20,
				30,
				30
			},
			survival_harder = {
				20,
				30,
				30
			},
			hardest = {
				40,
				50,
				50
			},
			survival_hardest = {
				40,
				75,
				75
			}
		},
		blocked_damage = {
			15,
			4,
			2.5
		},
		blocked_difficulty_damage = {
			easy = {
				1,
				4,
				2.5
			},
			normal = {
				2,
				4,
				2.5
			},
			hard = {
				4,
				5,
				2.5
			},
			survival_hard = {
				4,
				5,
				2.5
			},
			harder = {
				6,
				7.5,
				5
			},
			survival_harder = {
				6,
				7.5,
				5
			},
			hardest = {
				10,
				10,
				7.5
			},
			survival_hardest = {
				10,
				10,
				7.5
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
	melee_shove = {
		damage_type = "cutting",
		target_running_velocity_threshold = 0.75,
		fatigue_type = "ogre_shove",
		action_weight = 1,
		ignore_ai_damage = true,
		considerations = UtilityConsiderations.troll_melee_shove,
		attacks = {
			{
				anim_driven = false,
				height = 2,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				rotation_time = 0.3,
				freeze_intensity_decay_time = 15,
				catapult_player = true,
				offset_forward = 0,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				range = 2,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 1.75,
				width = 0.4,
				attack_anim = {
					"attack_sweep",
					"attack_pounce"
				},
				damage_done_time = {
					attack_pounce = 1.0333333333333334,
					attack_sweep = 1
				},
				continious_overlap = {
					attack_sweep = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6
					},
					attack_pounce = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.6
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						6,
						3,
						0,
						0
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threats = {
					{
						collision_type = "cylinder",
						offset_forward = 0,
						radius = 3,
						height = 3.5,
						offset_right = 0,
						offset_up = 0,
						duration = 0.9333333333333333,
						start_time = 0.16666666666666666
					}
				}
			}
		},
		running_attacks = {
			{
				anim_driven = true,
				height = 2,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				rotation_time = 0.3,
				freeze_intensity_decay_time = 15,
				catapult_player = true,
				offset_forward = 0,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				range = 2,
				player_push_speed = 16,
				damage_done_time = 1,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 1.75,
				width = 0.4,
				attack_anim = {
					"attack_move_sweep"
				},
				continious_overlap = {
					attack_move_sweep = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						6,
						3,
						0,
						0
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threats = {
					{
						collision_type = "cylinder",
						offset_forward = 2,
						radius = 3,
						height = 3.7,
						offset_right = 0,
						offset_up = 0,
						duration = 0.9333333333333333,
						start_time = 0.16666666666666666
					}
				}
			}
		},
		damage = {
			8,
			20,
			20
		},
		difficulty_damage = {
			easy = {
				5,
				20,
				20
			},
			normal = {
				8,
				20,
				20
			},
			hard = {
				12,
				25,
				25
			},
			survival_hard = {
				12,
				25,
				25
			},
			harder = {
				20,
				30,
				30
			},
			survival_harder = {
				20,
				30,
				30
			},
			hardest = {
				40,
				50,
				50
			},
			survival_hardest = {
				40,
				75,
				75
			}
		},
		blocked_damage = {
			2,
			4,
			2.5
		},
		blocked_difficulty_damage = {
			easy = {
				1,
				4,
				2.5
			},
			normal = {
				2,
				4,
				2.5
			},
			hard = {
				4,
				5,
				2.5
			},
			survival_hard = {
				4,
				5,
				2.5
			},
			harder = {
				6,
				7.5,
				5
			},
			survival_harder = {
				6,
				7.5,
				5
			},
			hardest = {
				10,
				10,
				7.5
			},
			survival_hardest = {
				10,
				10,
				7.5
			}
		}
	},
	vomit = {
		firing_time = 0.67,
		attack_time = 3,
		action_weight = 1,
		considerations = UtilityConsiderations.vomit,
		attack_anims = {
			ranged_vomit = "attack_vomit_high",
			near_vomit = "attack_vomit_high"
		},
		bot_threats = {
			{
				height = 3,
				range = 8,
				offset_forward = 1,
				duration = 1,
				offset_up = 0,
				width = 2.5,
				start_time = 0.7
			}
		}
	},
	target_rage = {
		rage_time = 0.25,
		start_anims_name = {
			bwd = "change_target_bwd",
			fwd = "change_target_fwd",
			left = "change_target_left",
			right = "change_target_right"
		},
		start_anims_data = {
			change_target_fwd = {},
			change_target_bwd = {
				dir = -1,
				rad = math.pi
			},
			change_target_left = {
				dir = 1,
				rad = math.pi/2
			},
			change_target_right = {
				dir = -1,
				rad = math.pi/2
			}
		}
	},
	target_unreachable = {
		move_anim = "move_start_fwd"
	},
	climb = {
		catapult_players = {
			speed = 7,
			radius = 2,
			collision_filter = "filter_player_hit_box_check",
			angle = math.pi/6
		}
	},
	downed = {
		respawn_hp_max_percent = 0.8,
		standup_anim_duration = 5,
		reset_duration = 5,
		reduce_hp_permanently = true,
		respawn_hp_min_percent = 0.6,
		min_downed_duration = 3,
		become_downed_hp_percent = 0.4,
		downed_duration = 5
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 1,
		override_mover_move_distance = 2,
		stagger_anims = {
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
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
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			}
		}
	}
}
BreedActions.chaos_troll = table.create_copy(BreedActions.chaos_troll, action_data)

return 
