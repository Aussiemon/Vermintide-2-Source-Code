local default_bot_threat_difficulty_data = BotConstants and BotConstants.default.DEFAULT_BOT_THREAT_DIFFICULTY_DATA
local breed_data = {
	detection_radius = 9999999,
	patrol_active_perception = "perception_rat_ogre",
	walk_speed = 5,
	chance_of_starting_sleepy = 0,
	disable_crowd_dispersion = true,
	patrol_detection_radius = 10,
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	target_selection = "pick_rat_ogre_target_idle",
	passive_in_patrol_start_anim = "move_fwd",
	target_selection_angry = "pick_rat_ogre_target_with_weights",
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_radius = 1,
	poison_resistance = 100,
	no_stagger_duration = false,
	is_bot_aid_threat = true,
	bot_opportunity_target_melee_range_while_ranged = 5,
	bots_should_flank = true,
	bot_hitbox_radius_approximation = 0.75,
	ignore_nav_propagation_box = true,
	combat_music_state = "minotaur",
	bot_opportunity_target_melee_range = 7,
	wield_inventory_on_spawn = true,
	trigger_dialogue_on_target_switch = true,
	default_inventory_template = "beastmen_minotaur_dual_axes",
	stagger_resistance = 100,
	use_aggro = true,
	death_sound_event = "Play_enemy_minotaur_die_vce",
	boss_staggers = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	panic_close_detection_radius_sq = 9,
	radius = 2,
	threat_value = 32,
	boss = true,
	hit_mass_count = 50,
	stagger_threshold_explosion = 1,
	animation_movement_template = "beastmen_minotaur",
	race = "beastmen",
	bone_lod_level = 0,
	proximity_system_check = true,
	death_reaction = "minotaur",
	armor_category = 3,
	patrol_walk_speed = 2.5,
	use_navigation_path_splines = true,
	distance_sq_can_detect_target = 2025,
	smart_targeting_width = 0.6,
	perception_continuous = "perception_continuous_rat_ogre",
	behavior = "minotaur",
	boost_curve_multiplier_override = 1.5,
	has_inventory = true,
	run_speed = 6,
	awards_positive_reinforcement_message = true,
	exchange_order = 1,
	stagger_threshold_heavy = 1,
	reach_distance = 3,
	navigation_spline_distance_to_borders = 1,
	stagger_threshold_light = 1,
	hit_reaction = "ai_default",
	passive_in_patrol = true,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1.4,
	hit_effect_template = "HitEffectsChaosSpawn",
	smart_targeting_height_multiplier = 1.5,
	unit_template = "ai_unit_beastmen_minotaur",
	catch_up_speed = 12,
	smart_object_template = "rat_ogre",
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 1.5,
	stagger_threshold_medium = 1,
	distance_sq_idle_auto_detect_target = 49,
	far_off_despawn_immunity = true,
	patrol_passive_perception = "perception_rat_ogre",
	override_mover_move_distance = 1.5,
	boss_damage_reduction = true,
	base_unit = "units/beings/enemies/beastmen_minotaur/chr_beastmen_minotaur",
	aoe_height = 2.4,
	perception_weights = {
		target_catapulted_mul = 1.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_staggered_you_bonus = 100,
		target_stickyness_duration_b = 20,
		aggro_decay_per_sec = 1,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		target_stickyness_duration_a = 5,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 100,
		target_disabled_mul = 0.15
	},
	navigation_path_spline_config = {
		spline_distance_to_borders = 5,
		max_distance_to_spline_position = 5,
		max_distance_between_gates = 5,
		navigation_channel_radius = 6,
		spline_recomputation_ratio = 0.5,
		channel_smoothing_anle = 20,
		turn_sampling_angle = 25,
		min_distance_between_gates = 0.5
	},
	max_health = BreedTweaks.max_health.rat_ogre,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		3,
		0,
		1
	},
	debug_color = {
		255,
		20,
		20,
		20
	},
	run_on_spawn = AiBreedSnippets.on_beastmen_minotaur_spawn,
	run_on_update = AiBreedSnippets.on_beastmen_minotaur_update,
	run_on_death = AiBreedSnippets.on_beastmen_minotaur_death,
	run_on_despawn = AiBreedSnippets.on_beastmen_minotaur_death,
	blackboard_init_data = {
		ladder_distance = math.huge
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
			prio = 2,
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
			prio = 3,
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
			prio = 3,
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
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftupleg",
				"j_leftleg",
				"j_leftfoot"
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
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot"
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
Breeds.beastmen_minotaur = table.create_copy(Breeds.beastmen_minotaur, breed_data)
local pushed_data = {
	ahead_dist = 1,
	push_width = 3,
	push_forward_offset = 1,
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
local AttackIntensityPerDifficulty = {
	melee_slam = {
		easy = {
			running = 2,
			normal = 5
		},
		normal = {
			running = 2,
			normal = 5
		},
		hard = {
			running = 2,
			normal = 5
		},
		harder = {
			running = 2,
			normal = 5
		},
		hardest = {
			running = 2,
			normal = 5
		},
		cataclysm = {
			running = 2,
			normal = 5
		},
		cataclysm_2 = {
			running = 2,
			normal = 5
		},
		cataclysm_3 = {
			running = 2,
			normal = 5
		}
	},
	combo = {
		easy = {
			running = 0.5,
			normal = 3
		},
		normal = {
			running = 0.5,
			normal = 3
		},
		hard = {
			running = 0.5,
			normal = 3
		},
		harder = {
			running = 0.5,
			normal = 3
		},
		hardest = {
			running = 0.5,
			normal = 3
		},
		cataclysm = {
			running = 0.5,
			normal = 3
		},
		cataclysm_2 = {
			running = 0.5,
			normal = 3
		},
		cataclysm_3 = {
			running = 0.5,
			normal = 3
		}
	},
	shove = {
		easy = {
			normal = 1
		},
		normal = {
			normal = 1
		},
		hard = {
			normal = 1
		},
		harder = {
			normal = 1
		},
		hardest = {
			normal = 1
		},
		cataclysm = {
			normal = 1
		},
		cataclysm_2 = {
			normal = 1
		},
		cataclysm_3 = {
			normal = 1
		}
	},
	jump_slam = {
		easy = {
			running = 2,
			normal = 5
		},
		normal = {
			running = 2,
			normal = 5
		},
		hard = {
			running = 2,
			normal = 5
		},
		harder = {
			running = 2,
			normal = 5
		},
		hardest = {
			running = 2,
			normal = 5
		},
		cataclysm = {
			running = 2,
			normal = 5
		},
		cataclysm_2 = {
			running = 2,
			normal = 5
		},
		cataclysm_3 = {
			running = 2,
			normal = 5
		}
	},
	charge = {
		easy = {
			charge = 10
		},
		normal = {
			charge = 10
		},
		hard = {
			charge = 10
		},
		harder = {
			charge = 10
		},
		hardest = {
			charge = 10
		},
		cataclysm = {
			charge = 10
		},
		cataclysm_2 = {
			charge = 10
		},
		cataclysm_3 = {
			charge = 10
		}
	}
}
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_start_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.follow,
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
		init_blackboard = {
			chasing_timer = -10
		}
	},
	smash_door = {
		move_anim = "move_fwd",
		name = "smash_door",
		damage = 15,
		hit_react_type = "heavy",
		damage_type = "cutting",
		unblockable = true,
		attack_anim = "attack_right",
		door_attack_distance = 2,
		ignore_staggers = {
			false,
			true,
			true,
			true,
			false,
			true
		}
	},
	target_rage = {
		change_target_fwd_close_dist = 15,
		rage_time = 1.75,
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
				rad = math.pi / 2
			},
			change_target_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		change_target_fwd_close_anims = {
			"roar",
			"roar_2"
		}
	},
	charge_attack = {
		slow_down_speed = 3,
		impact_animation = "charge_impact",
		charge_rotation_speed = 7,
		dodge_past_sound_event = "Play_enemy_minotaur_charge_attack_miss",
		min_slowdown_angle = 20,
		max_slowdown_percentage = 0.15,
		charge_at_max_speed_duration = 30,
		cancel_animation = "charge_cancel",
		slow_down_start_time = 0.55,
		charge_blocked_animation = "charge_blocked",
		radius = 1.75,
		head_radius = 1.75,
		cancel_slow_down_speed = 2,
		wall_collision_check_range = 0.75,
		hit_ai_radius = 1.2,
		dodge_past_push_speed = 9,
		shield_blocked_fatigue_type = "ogre_shove",
		catapult_on_push_z = 4,
		animation_move_speed = 9,
		catapult_force_z = 6,
		attack_intensity_type = "charge",
		action_weight = 6,
		hit_during_impact_t = 0.5,
		ran_past_target_duration = 0.25,
		target_extrapolation_length_scale = 70,
		player_push_speed_blocked = 10,
		max_slowdown_angle = 40,
		ignore_ledge_death = true,
		lunge_lean_speed = 2.3,
		catapult_player = true,
		lunge_rotation_speed = 6.5,
		hit_react_type = "heavy",
		damage = 20,
		fatigue_type = "blocked_slam",
		charge_max_speed_at = 2,
		damage_type = "cutting",
		charge_speed_min = 9,
		ignore_ai_damage = true,
		unblockable_by_normal_blocks = true,
		start_animation = "charge_start",
		get_lunge_position_duration = 2,
		target_dodged_radius = 0.75,
		player_push_speed = 9.5,
		get_lunge_position_at_distance = 4,
		blocked_velocity_scale = 2,
		max_angle_to_allow_lunge = 65,
		charge_speed_max = 12,
		lunge_rotation_slow_down_speed = 2,
		catapult_on_push_other_targets = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.minotaur_charge,
		charging_distance_thresholds = {
			far = 10,
			medium = 6,
			short = 4
		},
		tracking_durations = {
			far = 4,
			medium = 1.5,
			short = 1
		},
		enter_lunge_thresholds = {
			far = 15,
			medium = 9,
			short = 4
		},
		lunge_velocity_scaling = {
			far = 1.3,
			medium = 1,
			short = 0.6
		},
		charging_animations = {
			far = "charge_loop",
			medium = "charge_loop",
			short = "charge_loop"
		},
		lunge_lean_variables = {
			max = 3,
			min = 2
		},
		push_ai = {
			stagger_distance = 1.5,
			stagger_impact = {
				6,
				6,
				0,
				0,
				6
			},
			stagger_duration = {
				3,
				1,
				0,
				0,
				4
			}
		},
		difficulty_damage = {
			harder = 20,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 40,
			cataclysm_2 = 40,
			easy = 10
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
	melee_slam = {
		stagger_distance = 7,
		radius = 1.2,
		forward_offset = 1.75,
		cooldown = -1,
		height = 2.5,
		fatigue_type = "blocked_slam",
		hit_react_type = "heavy",
		damage_type = "cutting",
		damage = 10,
		player_push_speed = 8,
		attack_intensity_type = "melee_slam",
		action_weight = 1,
		blocked_damage = 5,
		player_push_speed_blocked = 4,
		unblockable = false,
		attack_time = 1.3333333333333333,
		dodge_mitigation_radius_squared = 2.25,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.melee_slam,
		attack_anim = {
			"attack_slam",
			"attack_slam_2",
			"attack_slam_3",
			"attack_slam_4"
		},
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		stagger_impact = {
			1,
			2,
			0,
			0,
			1
		},
		bot_threats = {
			{
				duration = 0.3333333333333333,
				start_time = 0.16666666666666666
			}
		},
		hit_player_func = function (unit, blackboard, hit_unit, damage)
			if damage then
				blackboard.has_dealt_damage = true
			end
		end
	},
	combo_attack = {
		shield_blocked_fatigue_type = "chaos_spawn_combo",
		damage = 15,
		damage_type = "cutting",
		hit_react_type = "medium",
		attack_intensity_type = "combo",
		action_weight = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_spawn_combo,
		attacks = {
			{
				hit_multiple_targets = true,
				offset_forward = 1.5,
				height = 2.5,
				ignores_dodging = true,
				rotation_time = 2,
				anim_driven = true,
				offset_up = 0,
				range = 2.5,
				player_push_speed = 7,
				damage_done_time = 2.1333333333333333,
				rotation_speed = 5,
				player_push_speed_blocked = 7,
				push_close_units_during_attack = true,
				attack_time = 2.5,
				width = 1.5,
				attack_anim = {
					"attack_melee_combo"
				},
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 0.13333333333333333
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 0.7333333333333333
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 1.1333333333333333
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 1.8333333333333333
					}
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_combo_attack,
		fatigue_type = BreedTweaks.fatigue_types.boss_combo.light_combo
	},
	melee_shove = {
		fatigue_type = "blocked_sv_sweep",
		damage = 20,
		hit_react_type = "heavy",
		target_running_velocity_threshold = 2,
		attack_intensity_type = "shove",
		action_weight = 1,
		ignore_ai_damage = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.minotaur_melee_shove,
		attacks = {
			{
				rotation_speed = 8,
				height = 2,
				hit_only_players = false,
				catapult_player = false,
				ignores_dodging = true,
				rotation_time = 0.3,
				freeze_intensity_decay_time = 15,
				range = 2,
				anim_driven = false,
				offset_forward = 0.5,
				player_push_speed_blocked_z = 3,
				offset_up = 0,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 12,
				hit_multiple_targets = true,
				player_push_speed_blocked = 5,
				attack_time = 1.8333333333333333,
				width = 0.4,
				attack_anim = {
					"attack_left",
					"attack_right"
				},
				damage_done_time = {
					attack_right = 0.5666666666666667,
					attack_left = 0.5666666666666667
				},
				continious_overlap = {
					attack_left = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6
					},
					attack_right = {
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
						0,
						6
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
						4
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					attack_left = {
						{
							collision_type = "cylinder",
							offset_forward = 0.5,
							radius = 4.5,
							height = 4,
							offset_right = 0,
							offset_up = 0,
							duration = 0.5666666666666667,
							start_time = 0.26666666666666666
						}
					},
					attack_right = {
						{
							collision_type = "cylinder",
							offset_forward = 0.5,
							radius = 4.5,
							height = 4,
							offset_right = 0,
							offset_up = 0,
							duration = 0.5666666666666667,
							start_time = 0.26666666666666666
						}
					}
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_combo_attack
	},
	headbutt_attack = {
		fatigue_type = "ogre_shove",
		damage = 20,
		hit_react_type = "heavy",
		target_running_velocity_threshold = 2,
		attack_intensity_type = "shove",
		action_weight = 1,
		ignore_ai_damage = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.melee_shove,
		attacks = {
			{
				rotation_speed = 8,
				height = 2,
				hit_only_players = false,
				catapult_player = true,
				ignores_dodging = false,
				rotation_time = 0.5,
				freeze_intensity_decay_time = 15,
				range = 2,
				anim_driven = false,
				offset_forward = 0.5,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 9.6,
				attack_time = 2.3333333333333335,
				width = 0.4,
				attack_anim = {
					"attack_headbutt"
				},
				damage_done_time = {
					attack_headbutt = 1.6666666666666667
				},
				continious_overlap = {
					attack_headbutt = {
						base_node_name = "j_head_end",
						tip_node_name = "j_jaw",
						start_time = 0.6666666666666666
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						6,
						3,
						0,
						0,
						6
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
						4
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					attack_headbutt = {
						{
							collision_type = "cylinder",
							offset_forward = 0.5,
							radius = 4.5,
							height = 4,
							offset_right = 0,
							offset_up = 0,
							duration = 0.6666666666666666,
							start_time = 0.4666666666666667
						}
					}
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack
	},
	target_unreachable = {
		move_anim = "move_start_fwd"
	},
	climb = {
		catapult_players = {
			speed = 7,
			radius = 2,
			collision_filter = "filter_player_hit_box_check",
			angle = math.pi / 6
		}
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 1,
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
			}
		}
	},
	walking = {
		move_anim = "walk_fwd"
	},
	anti_ladder_melee_slam = table.clone(action_data.melee_slam)
}
action_data.anti_ladder_melee_slam.considerations = UtilityConsiderations.anti_ladder_melee_slam
action_data.fling_skaven = table.clone(action_data.melee_shove)
action_data.fling_skaven.self_running_speed_threshold = 2
BreedActions.beastmen_minotaur = table.create_copy(BreedActions.beastmen_minotaur, action_data)

return
