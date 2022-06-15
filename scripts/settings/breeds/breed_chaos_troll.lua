local stagger_types = require("scripts/utils/stagger_types")
local pushed_data = {
	ahead_dist = 1.5,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 7,
	push_stagger_impact = {
		stagger_types.medium,
		stagger_types.medium,
		stagger_types.none,
		stagger_types.none
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
		stagger_types.medium,
		stagger_types.medium,
		stagger_types.none,
		stagger_types.none
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
local default_bot_threat_difficulty_data = BotConstants and BotConstants.default.DEFAULT_BOT_THREAT_DIFFICULTY_DATA
local breed_data = {
	detection_radius = 9999999,
	minion_detection_radius = 10,
	walk_speed = 4,
	big_boy_turning_dot = 0.4,
	patrol_detection_radius = 10,
	race = "chaos",
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	regen_taken_damage_pause_time = 2,
	always_look_at_target = true,
	behavior = "troll",
	animation_sync_rpc = "rpc_sync_anim_state_9",
	aoe_radius = 1,
	is_always_spawnable = true,
	ai_toughness = 10,
	boss = true,
	scale_death_push = 1,
	proximity_system_check = true,
	regen_pulse_intensity = 0.05,
	exchange_order = 1,
	ignore_nav_propagation_box = true,
	bot_opportunity_target_melee_range = 7,
	wield_inventory_on_spawn = true,
	default_inventory_template = "chaos_troll",
	stagger_resistance = 100,
	use_aggro = true,
	no_stagger_duration = false,
	boss_staggers = true,
	stagger_threshold_medium = 1,
	panic_close_detection_radius_sq = 9,
	radius = 2,
	stagger_threshold_heavy = 1,
	keep_weapon_on_death = false,
	hit_mass_count = 50,
	patrol_active_perception = "perception_rat_ogre",
	animation_movement_template = "chaos_troll",
	use_avoidance = false,
	ai_strength = 10,
	death_reaction = "ai_default",
	armor_category = 3,
	regen_pulse_interval = 2,
	target_selection_angry = "pick_chaos_troll_target_with_weights",
	target_selection = "pick_rat_ogre_target_idle",
	downed_pulse_interval = 1,
	is_bot_aid_threat = true,
	poison_resistance = 100,
	use_big_boy_turning = true,
	use_navigation_path_splines = true,
	bot_opportunity_target_melee_range_while_ranged = 5,
	distance_sq_can_detect_target = 2025,
	bots_should_flank = true,
	perception_continuous = "perception_continuous_chaos_troll",
	initial_is_passive = false,
	trigger_dialogue_on_target_switch = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	boost_curve_multiplier_override = 2,
	downed_pulse_intensity = 0.2,
	threat_value = 32,
	bot_melee_aim_node = "j_hips",
	has_inventory = true,
	run_speed = 5.25,
	awards_positive_reinforcement_message = true,
	bone_lod_level = 0,
	smart_object_template = "chaos_troll",
	bot_hitbox_radius_approximation = 1,
	aim_template = "chaos_warrior",
	passive_in_patrol_start_anim = "move_fwd",
	reach_distance = 4.2,
	navigation_spline_distance_to_borders = 1,
	stagger_threshold_light = 1,
	combat_music_state = "troll",
	hit_reaction = "ai_default",
	stagger_threshold_explosion = 1,
	passive_in_patrol = true,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	hit_effect_template = "HitEffectsChaosTroll",
	unit_template = "ai_unit_chaos_troll",
	catch_up_speed = 10,
	has_running_attack = true,
	dialogue_target_switch_event = "enemy_target_changed",
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 1.5,
	husk_hit_reaction_cooldown = 1,
	dialogue_target_switch_attack_tag = "chaos_troll_target_changed",
	distance_sq_idle_auto_detect_target = 49,
	far_off_despawn_immunity = true,
	patrol_passive_perception = "perception_rat_ogre",
	boss_damage_reduction = true,
	base_unit = "units/beings/enemies/chaos_troll/chr_chaos_troll",
	aoe_height = 2.4,
	displace_players_data = pushed_data,
	perception_weights = {
		target_catapulted_mul = 2,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_staggered_you_bonus = 100,
		target_stickyness_duration_b = 5,
		aggro_decay_per_sec = 4,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 0.5,
		target_is_in_vomit_multiplier = 10,
		target_disabled_aggro_mul = 0,
		target_stickyness_duration_a = 3,
		max_distance = 10,
		target_stickyness_bonus_a = 50,
		distance_weight = 10,
		target_disabled_mul = 0
	},
	max_health = BreedTweaks.max_health.chaos_troll,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		2.5,
		0,
		1
	},
	max_health_regen_per_sec = {
		2,
		4,
		7,
		14,
		28,
		32,
		34,
		36
	},
	max_health_regen_time = {
		12,
		12,
		10,
		8,
		6,
		4,
		3,
		2
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
				"c_leftfoot"
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
				"c_rightfoot"
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
				"afro"
			}
		}
	},
	allowed_layers = {
		ledges = 1.5,
		ledges_with_fence = 1.5,
		big_boy_destructible = 1.5,
		jumps = 1.5,
		destructible_wall = 0,
		temporary_wall = 0,
		bot_ratling_gun_fire = 15,
		doors = 1.5,
		teleporters = 5,
		planks = 1.5,
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
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_chaos_troll_killed_without_regen(blackboard, killer_unit)
		QuestSettings.check_chaos_troll_killed_without_bile_damage(blackboard, killer_unit)
	end
}
Breeds.chaos_troll = table.create_copy(Breeds.chaos_troll, breed_data)
local AttackIntensityPerDifficulty = {
	cleave = {
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
	sweep = {
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
	vomit = {
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
	}
}
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
		unblockable = true,
		name = "smash_door",
		damage = 25,
		damage_type = "cutting",
		move_anim = "move_start_fwd",
		attack_anim = "smash_door",
		door_attack_distance = 2
	},
	attack_cleave = {
		blocked_damage = 15,
		damage = 30,
		fatigue_type = "chaos_cleave",
		damage_type = "cutting",
		target_running_velocity_threshold = 1,
		attack_intensity_type = "cleave",
		action_weight = 1,
		target_running_distance_threshold = 4.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_cleave,
		attacks = {
			{
				height = 2.5,
				offset_forward = 1.1,
				ignores_dodging = true,
				rotation_time = 1.7,
				anim_driven = false,
				offset_up = 0,
				range = 2.75,
				player_push_speed = 8,
				damage_done_time = 1.5333333333333334,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 2.6666666666666665,
				width = 1.75,
				multi_attack_anims = {
					fwd = "attack_cleave",
					left = "attack_cleave_left",
					right = "attack_cleave_right"
				},
				multi_anims_data = {
					attack_cleave = {},
					attack_cleave_left = {
						dir = 1,
						rad = math.pi / 2
					},
					attack_cleave_right = {
						dir = -1,
						rad = math.pi / 2
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
				height = 2.5,
				offset_forward = 1,
				rotation_speed = 20,
				ignores_dodging = false,
				rotation_time = 2.2,
				anim_driven = true,
				offset_up = 0,
				range = 2.75,
				player_push_speed = 8,
				damage_done_time = 1.4333333333333333,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 2.6666666666666665,
				width = 1.75,
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
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
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
		fatigue_type = "ogre_shove",
		damage_type = "cutting",
		damage = 8,
		cooldown = -1,
		attack_intensity_type = "sweep",
		action_weight = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.attack_crouch_sweep,
		attacks = {
			{
				anim_driven = false,
				height = 2,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = true,
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
					"attack_sweep",
					"attack_shove"
				},
				continious_overlap = {
					attack_sweep = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6666666666666666
					},
					attack_shove = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.6666666666666666
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						offset_forward = 0,
						radius = 3.5,
						height = 3.5,
						offset_right = 0,
						offset_up = 0,
						duration = 0.7333333333333333,
						start_time = 0.6
					}
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
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
		fatigue_type = "ogre_shove",
		damage = 8,
		damage_type = "cutting",
		target_running_velocity_threshold = 0.75,
		attack_intensity_type = "shove",
		action_weight = 1,
		ignore_ai_damage = true,
		self_running_speed_threshold = 2,
		target_running_distance_threshold = 4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_melee_shove,
		attacks = {
			{
				rotation_speed = 7,
				height = 0.8,
				hit_only_players = false,
				catapult_player = true,
				ignores_dodging = false,
				rotation_time = 0.6,
				freeze_intensity_decay_time = 15,
				range = 0.7,
				anim_driven = false,
				offset_forward = 0.5,
				player_push_speed_blocked_z = 4,
				offset_up = 0.5,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 1.6666666666666667,
				width = 0.8,
				attack_anim = {
					"attack_shove"
				},
				damage_done_time = {
					attack_shove = 0.9
				},
				continious_overlap = {
					attack_shove = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.7
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
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
				rotation_speed = 7,
				height = 0.9,
				hit_only_players = false,
				catapult_player = true,
				ignores_dodging = false,
				rotation_time = 1,
				freeze_intensity_decay_time = 15,
				range = 0.7,
				anim_driven = true,
				offset_forward = 1.2,
				player_push_speed_blocked_z = 4,
				offset_up = 0.5,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 2,
				width = 1.1,
				attack_anim = {
					"attack_pounce"
				},
				damage_done_time = {
					attack_pounce = 1.0333333333333334
				},
				continious_overlap = {
					attack_pounce = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.6
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
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
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack
	},
	melee_sweep = {
		blocked_damage = 2,
		damage = 8,
		fatigue_type = "ogre_shove",
		damage_type = "cutting",
		target_running_velocity_threshold = 0.75,
		attack_intensity_type = "sweep",
		action_weight = 1,
		ignore_ai_damage = true,
		self_running_speed_threshold = 2,
		target_running_distance_threshold = 4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_melee_sweep,
		attacks = {
			{
				rotation_speed = 7,
				height = 0.8,
				hit_only_players = false,
				catapult_player = true,
				ignores_dodging = true,
				rotation_time = 0.6,
				freeze_intensity_decay_time = 15,
				range = 0.8,
				anim_driven = false,
				offset_forward = 1,
				player_push_speed_blocked_z = 4,
				offset_up = 0.5,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 1.6666666666666667,
				width = 1.1,
				attack_anim = {
					"attack_sweep"
				},
				damage_done_time = {
					attack_sweep = 1
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
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						offset_forward = 0,
						radius = 3,
						height = 3.5,
						offset_right = 0,
						offset_up = 0,
						duration = 0.6666666666666666,
						start_time = 0.3333333333333333
					}
				}
			}
		},
		running_attacks = {
			{
				rotation_speed = 12,
				height = 0.9,
				hit_only_players = false,
				catapult_player = true,
				ignores_dodging = false,
				rotation_time = 1,
				freeze_intensity_decay_time = 15,
				range = 1,
				anim_driven = true,
				offset_forward = 1.8,
				player_push_speed_blocked_z = 4,
				offset_up = 0.3,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 12.8,
				attack_time = 2,
				width = 1.4,
				attack_anim = {
					"attack_move_sweep"
				},
				damage_done_time = {
					attack_move_sweep = 1
				},
				continious_overlap = {
					attack_move_sweep = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.6666666666666666
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0
					}
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
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
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked
	},
	vomit = {
		firing_time = 0.77,
		rotation_time = 0.8,
		attack_intensity_type = "vomit",
		action_weight = 1,
		near_vomit_distance = 25,
		attack_time = 2.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.vomit,
		attack_anims = {
			ranged_vomit = "attack_vomit_high",
			near_vomit = "attack_vomit"
		},
		bot_threat_difficulty_data = default_bot_threat_difficulty_data,
		bot_threats = {
			{
				height = 3,
				range = 8,
				offset_forward = 1,
				duration = 1,
				offset_up = 0,
				width = 2.5,
				start_time = 0.7333333333333333
			}
		}
	},
	target_rage = {
		rage_time = 0.75,
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
			angle = math.pi / 6
		}
	},
	downed = {
		respawn_hp_max_percent = 0.8,
		standup_anim_duration = 5,
		reset_duration = 5,
		reduce_hp_permanently = true,
		respawn_hp_min_percent = 0.5,
		min_downed_duration = 3,
		become_downed_hp_percent = 0.4,
		downed_duration = 7
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
	}
}
BreedActions.chaos_troll = table.create_copy(BreedActions.chaos_troll, action_data)

return
