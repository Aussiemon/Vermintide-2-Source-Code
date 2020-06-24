local breed_data = {
	is_bot_aid_threat = true,
	target_selection_angry = "pick_rat_ogre_target_with_weights",
	poison_resistance = 100,
	use_avoidance = false,
	target_selection = "pick_rat_ogre_target_idle",
	lord_damage_reduction = true,
	always_look_at_target = true,
	aoe_radius = 1,
	armored_on_no_damage = true,
	bot_hitbox_radius_approximation = 1,
	behavior = "stormfiend_boss",
	animation_sync_rpc = "rpc_sync_anim_state_9",
	stagger_count_reset_time = 5,
	run_speed = 5,
	walk_speed = 5,
	aim_template = "stormfiend",
	ignore_nav_propagation_box = true,
	bots_should_flank = true,
	bot_opportunity_target_melee_range = 7,
	threat_value = 32,
	server_controlled_health_bar = true,
	default_inventory_template = "rat_ogre",
	stagger_resistance = 5,
	bone_lod_level = 0,
	boss_staggers = true,
	perception = "perception_rat_ogre",
	radius = 2,
	boss = true,
	hit_mass_count = 20,
	chance_of_starting_sleepy = 0,
	race = "skaven",
	proximity_system_check = true,
	death_reaction = "ai_default",
	armor_category = 3,
	distance_sq_can_detect_target = 2025,
	smart_targeting_width = 0.6,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	boost_curve_multiplier_override = 2,
	has_inventory = true,
	no_stagger_duration = true,
	awards_positive_reinforcement_message = true,
	exchange_order = 1,
	default_spawn_animation = "to_stormfiend_rasknitt_boss",
	reach_distance = 3,
	combat_music_state = "no_boss",
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	smart_targeting_outer_width = 1.4,
	hit_effect_template = "HitEffectsStormfiend",
	smart_targeting_height_multiplier = 1.5,
	unit_template = "ai_unit_stormfiend_boss",
	stagger_reduction = 1,
	smart_object_template = "stormfiend",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	player_locomotion_constrain_radius = 1.5,
	bot_opportunity_target_melee_range_while_ranged = 5,
	distance_sq_idle_auto_detect_target = 49,
	far_off_despawn_immunity = true,
	trigger_dialogue_on_target_switch = true,
	override_mover_move_distance = 2,
	base_unit = "units/beings/enemies/skaven_stormfiend/chr_skaven_stormfiend_boss",
	aoe_height = 2.4,
	bots_flank_while_targeted = true,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.1,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 1,
		target_stickyness_duration_b = 2,
		aggro_decay_per_sec = 25,
		target_outside_navmesh_mul = 0.7,
		old_target_aggro_mul = 0.5,
		target_disabled_aggro_mul = 0,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 20,
		target_disabled_mul = 0.15
	},
	max_health = BreedTweaks.max_health.stormfiend_boss,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		3,
		1,
		1
	},
	debug_color = {
		255,
		20,
		20,
		20
	},
	run_on_spawn = AiBreedSnippets.on_stormfiend_boss_spawn,
	run_on_update = AiBreedSnippets.on_stormfiend_boss_update,
	run_on_death = AiBreedSnippets.on_stormfiend_death,
	run_on_despawn = AiBreedSnippets.on_stormfiend_despawn,
	hitzone_multiplier_types = {
		head = "headshot",
		weakspot = "weakspot"
	},
	hitzone_armor_categories = {
		head = 2,
		right_arm = 2,
		left_arm = 2,
		aux = 2
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
				"c_leftforearm_ammo",
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
				"c_rightforearm_ammo",
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
		weakspot = {
			prio = 3,
			actors = {
				"c_packmaster_sling_02"
			},
			push_actors = {
				"j_spine1"
			}
		},
		aux = {
			prio = 4,
			actors = {
				"c_packmaster_sling",
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
	allowed_layers = {
		planks = 1.5,
		ledges = 1.5,
		bot_ratling_gun_fire = 15,
		jumps = 1.5,
		big_boy_destructible = 1.5,
		ledges_with_fence = 1.5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 1.5,
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
	before_stagger_enter_function = function (unit, blackboard, attacker_unit, is_push)
		QuestSettings.handle_charge_stagger(unit, blackboard, attacker_unit)
	end
}
Breeds.skaven_stormfiend_boss = table.create_copy(Breeds.skaven_stormfiend_boss, breed_data)
local AttackIntensityPerDifficulty = {
	aoe = {
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
	}
}
local action_data = {
	climb = {
		sync_with_linked_unit = false,
		catapult_players = {
			speed = 7,
			radius = 2,
			collision_filter = "filter_player_hit_box_check",
			angle = math.pi / 6
		}
	},
	mount_unit = {
		animation = "back_up_on_back"
	},
	charge = {
		fatigue_type = "blocked_slam",
		damage = 20,
		attack_intensity_type = "charge",
		action_weight = 20,
		blocked_damage = 5,
		ignore_ai_damage = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.stormfiend_boss_charge,
		attacks = {
			{
				anim_driven = true,
				height = 2.3,
				catapult_player = true,
				hit_only_players = false,
				ignores_dodging = false,
				rotation_time = 2.5,
				freeze_intensity_decay_time = 15,
				ignore_targets_behind = true,
				offset_forward = 0.25,
				player_push_speed_blocked_z = 6,
				offset_up = 0,
				player_push_speed_z = 8,
				range = 2,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 9.6,
				attack_time = 5.92,
				width = 1.2,
				attack_anim = {
					"attack_charge_fwd"
				},
				continious_overlap = {
					attack_charge_fwd = {
						base_node_name = "root_point",
						tip_node_name = "root_point",
						start_time = 2
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						6,
						6,
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
				wall_collision = {
					stun_time = 0.8333333333333334,
					check_range = 1.5,
					start_check_time = 1.6666666666666667,
					animation = "attack_charge_end"
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		blocked_difficulty_damage = {
			harder = 9,
			hard = 7,
			normal = 5,
			hardest = 10,
			cataclysm = 12,
			cataclysm_3 = 20,
			cataclysm_2 = 15,
			easy = 4
		},
		difficulty_damage = {
			harder = 30,
			hard = 25,
			normal = 20,
			hardest = 50,
			cataclysm = 25,
			cataclysm_3 = 75,
			cataclysm_2 = 30,
			easy = 15
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
			true,
			true
		}
	},
	fling_skaven = {
		fatigue_type = "ogre_shove",
		sync_with_linked_unit = false,
		damage = 20,
		attack_intensity_type = "shove",
		ignore_ai_damage = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attacks = {
			{
				anim_driven = true,
				height = 2,
				catapult_player = true,
				ignore_targets_behind = true,
				ignores_dodging = false,
				rotation_time = 0.3,
				freeze_intensity_decay_time = 0,
				hit_only_players = false,
				offset_forward = 0,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				range = 2,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 9.6,
				attack_time = 2.17,
				width = 0.4,
				multi_attack_anims = {
					bwd = "attack_melee_bwd",
					fwd = "attack_melee_fwd",
					left = "attack_melee_left",
					right = "attack_melee_right"
				},
				multi_anims_data = {
					attack_melee_fwd = {},
					attack_melee_bwd = {
						dir = 1,
						rad = math.pi
					},
					attack_melee_left = {
						dir = 1,
						rad = math.pi / 2
					},
					attack_melee_right = {
						dir = -1,
						rad = math.pi / 2
					}
				},
				continious_overlap = {
					attack_melee_fwd = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.6
					},
					attack_melee_bwd = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 1.2
					},
					attack_melee_left = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.97
					},
					attack_melee_right = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.97
					}
				},
				push_ai = {
					stagger_distance = 4,
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
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		difficulty_damage = {
			harder = 50,
			hard = 40,
			normal = 30,
			hardest = 75,
			cataclysm = 100,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 20
		}
	},
	follow = {
		move_anim = "move_start_fwd",
		sync_with_linked_unit = false,
		action_weight = 1,
		follow_target_function_name = "_follow_target_stormfiend",
		considerations = UtilityConsiderations.stormfiend_follow,
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
		follow_target_function_data = {
			check_distance = 4,
			max_wanted_distance = 10,
			check_ray_can_go_to_target = true,
			min_angle_step = 0,
			max_angle_step = 2,
			failed_move_attempt_angle_increment = 45,
			min_wanted_distance = 1
		},
		init_blackboard = {
			chasing_timer = -10,
			next_rage_time = 0
		}
	},
	pick_up_grey_seer = {
		move_anim = "move_start_fwd",
		action_weight = 1,
		follow_target_function_name = "_follow_target_stormfiend",
		override_move_speed = 8,
		considerations = UtilityConsiderations.stormfiend_follow,
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
		follow_target_function_data = {
			check_distance = 12,
			max_wanted_distance = 10,
			check_ray_can_go_to_target = true,
			min_angle_step = 0,
			max_angle_step = 2,
			failed_move_attempt_angle_increment = 45,
			min_wanted_distance = 8
		},
		init_blackboard = {
			chasing_timer = -10,
			next_rage_time = 0
		}
	},
	melee_shove = {
		fatigue_type = "ogre_shove",
		damage = 20,
		sync_with_linked_unit = false,
		attack_intensity_type = "shove",
		action_weight = 1,
		ignore_ai_damage = true,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.stormfiend_boss_melee_shove,
		attacks = {
			{
				anim_driven = true,
				height = 2,
				catapult_player = true,
				range = 2.5,
				ignores_dodging = false,
				rotation_time = 0.3,
				freeze_intensity_decay_time = 15,
				hit_only_players = false,
				offset_forward = 0,
				player_push_speed_blocked_z = 4,
				offset_up = 0,
				player_push_speed_z = 4,
				ignore_targets_behind = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 9.6,
				attack_time = 2.17,
				width = 0.4,
				multi_attack_anims = {
					bwd = "attack_melee_bwd",
					fwd = "attack_melee_fwd",
					left = "attack_melee_left",
					right = "attack_melee_right"
				},
				multi_anims_data = {
					attack_melee_fwd = {},
					attack_melee_bwd = {
						dir = 1,
						rad = math.pi
					},
					attack_melee_left = {
						dir = 1,
						rad = math.pi / 2
					},
					attack_melee_right = {
						dir = -1,
						rad = math.pi / 2
					}
				},
				damage_done_time = {
					attack_melee_left = 1.6,
					attack_melee_fwd = 1.3333333333333333,
					attack_melee_bwd = 1.6666666666666667,
					attack_melee_right = 1.6333333333333333
				},
				continious_overlap = {
					attack_melee_fwd = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.6
					},
					attack_melee_bwd = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 1.2
					},
					attack_melee_left = {
						base_node_name = "j_rightforearm",
						tip_node_name = "j_righthand",
						start_time = 0.97
					},
					attack_melee_right = {
						base_node_name = "j_leftforearm",
						tip_node_name = "j_lefthand",
						start_time = 0.97
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
				immune_breeds = {
					skaven_grey_seer = true
				},
				bot_threats = {
					attack_melee_fwd = {
						{
							collision_type = "cylinder",
							offset_forward = 0,
							radius = 3.5,
							height = 3.5,
							offset_right = 0,
							offset_up = 0,
							duration = 1.1666666666666667,
							start_time = 0.16666666666666666
						}
					},
					attack_melee_bwd = {
						{
							collision_type = "cylinder",
							offset_forward = 0,
							radius = 3.75,
							height = 3.75,
							offset_right = 0,
							offset_up = 0,
							duration = 0.9,
							start_time = 0.7666666666666667
						}
					},
					attack_melee_left = {
						{
							collision_type = "cylinder",
							offset_forward = 0,
							radius = 3.75,
							height = 3.5,
							offset_right = 0,
							offset_up = 0,
							duration = 1.0666666666666667,
							start_time = 0.5333333333333333
						}
					},
					attack_melee_right = {
						{
							collision_type = "cylinder",
							offset_forward = 0,
							radius = 3.5,
							height = 2.5,
							offset_right = 0,
							offset_up = 0,
							duration = 1.1,
							start_time = 0.5333333333333333
						}
					}
				}
			}
		},
		difficulty_damage = {
			harder = 40,
			hard = 30,
			normal = 20,
			hardest = 60,
			cataclysm = 75,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 15
		}
	},
	special_attack_aoe = {
		offset_forward = -4,
		height = 4,
		radius = 4.5,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		shove_z_speed = 4,
		bot_threat_duration = 0.75,
		damage_type = "cutting",
		offset_up = -0.6,
		attack_anim = "attack_push_back",
		offset_right = 0,
		damage = 20,
		player_push_speed = 20,
		attack_intensity_type = "aoe",
		action_weight = 4,
		shove_speed = 10,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.stormfiend_boss_aoe,
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 45,
			cataclysm_3 = 100,
			cataclysm_2 = 75,
			easy = 15
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	shoot = {
		fire_rate_at_start = 20,
		firing_time = 3.5,
		fire_rate_at_end = 40,
		environment_max_intensity = 100,
		beam_sfx_start_event = "Play_stormfiend_torch_loop",
		damage_type = "warpfire_ground",
		start_distance = 4,
		warpfire_switch_range = 8,
		aim_start_offset = -1,
		environment_intensity_increase_per_firewall = 10,
		sync_with_linked_unit = false,
		minimum_length = 2,
		maximum_length = 15,
		beam_sfx_stop_event = "Stop_stormfiend_torch_loop",
		action_weight = 1,
		max_fire_rate_at_percentage = 0.75,
		global_sound_parameter = "stormfiend_mood",
		weapon_setup = "ratling_gun",
		light_weight_projectile_template_name = "stormfiend_boss",
		considerations = UtilityConsiderations.stormfiend_boss_shoot,
		ratling_gun_switch_range = math.huge,
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
			attack_fire_right_arm = 3,
			attack_fire_turn_left = 3,
			attack_fire_turn_bwd = 3,
			attack_fire_left_arm = 3,
			attack_fire_turn_right = 3
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
			harder = {
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
			cataclysm = {
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
			skaven_grey_seer = true,
			chaos_spawn = true,
			skaven_warpfire_thrower = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true
		},
		bot_threats = {
			attack_fire_left_arm = {
				{
					height = 2,
					offset_forward = 1,
					duration = 1.5333333333333334,
					offset_up = 0,
					width = 4.5,
					start_time = 0
				}
			},
			attack_fire_right_arm = {
				{
					height = 2,
					offset_forward = 1,
					duration = 1.5333333333333334,
					offset_up = 0,
					width = 4.5,
					start_time = 0
				}
			},
			attack_fire_turn_bwd = {
				{
					height = 2,
					offset_forward = 1,
					duration = 1.8666666666666667,
					offset_up = 0,
					width = 4.5,
					start_time = 0.6
				}
			},
			attack_fire_turn_left = {
				{
					height = 2,
					offset_forward = 1,
					duration = 1.8666666666666667,
					offset_up = 0,
					width = 4.5,
					start_time = 0.4666666666666667
				}
			},
			attack_fire_turn_right = {
				{
					height = 2,
					offset_forward = 1,
					duration = 1.8666666666666667,
					offset_up = 0,
					width = 4.5,
					start_time = 0.6
				}
			}
		}
	},
	dual_shoot_intro = {
		fire_rate_at_start = 25,
		minimum_length = 2,
		firing_time = 2,
		aim_start_offset = -1,
		rotation_time = 2,
		fire_rate_at_end = 35,
		stop_shoot_sfx = "Stop_stormfiend_shooting_loop",
		max_fire_rate_at_percentage = 0.35,
		attack_animation = "intro_frenzy",
		light_weight_projectile_template_name = "stormfiend_boss_dual_intro",
		damage_type = "warpfire_ground",
		start_distance = 4,
		maximum_length = 15,
		warpfire_switch_range = 8,
		action_weight = 2,
		shoot_sfx = "Play_stormfiend_shooting_loop",
		weapon_setup = "ratling_gun",
		attack_time = 4,
		considerations = UtilityConsiderations.stormfiend_boss_shoot,
		ratling_gun_switch_range = math.huge,
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
			harder = {
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
			cataclysm = {
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
			skaven_grey_seer = true,
			chaos_spawn = true,
			skaven_warpfire_thrower = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true
		}
	},
	dual_shoot_narrow = {
		fire_rate_at_start = 35,
		minimum_length = 2,
		firing_time = 1.2,
		aim_start_offset = -1,
		rotation_time = 1,
		fire_rate_at_end = 35,
		stop_shoot_sfx = "Stop_stormfiend_shooting_loop",
		max_fire_rate_at_percentage = 0.35,
		attack_animation = "attack_fire_dual_narrow",
		light_weight_projectile_template_name = "stormfiend_boss_narrow",
		damage_type = "warpfire_ground",
		start_distance = 4,
		maximum_length = 15,
		warpfire_switch_range = 8,
		action_weight = 2,
		shoot_sfx = "Play_stormfiend_shooting_loop",
		weapon_setup = "ratling_gun",
		attack_time = 3,
		considerations = UtilityConsiderations.stormfiend_boss_dual_shoot,
		ratling_gun_switch_range = math.huge,
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
			harder = {
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
			cataclysm = {
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
			skaven_grey_seer = true,
			chaos_spawn = true,
			skaven_warpfire_thrower = true,
			skaven_rat_ogre = true,
			skaven_stormfiend = true
		}
	},
	smash_door = {
		unblockable = true,
		damage = 25,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_slam",
		door_attack_distance = 2,
		ignore_staggers = {
			false,
			true,
			true,
			true,
			false,
			true,
			true,
			true
		}
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 1.3,
		sync_with_linked_unit = false,
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
				fwd = {
					"stagger_weakspot"
				},
				bwd = {
					"stagger_weakspot"
				},
				left = {
					"stagger_weakspot"
				},
				right = {
					"stagger_weakspot"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			}
		}
	},
	target_rage = {
		sync_with_linked_unit = false,
		rage_time = 3.8,
		start_anims_name = {
			bwd = "intro_frenzy",
			fwd = "intro_frenzy",
			left = "intro_frenzy",
			right = "intro_frenzy"
		},
		start_anims_data = {
			change_target_fwd = {},
			intro_frenzy = {
				dir = 1,
				rad = math.pi
			}
		}
	},
	target_unreachable = {
		move_anim = "move_start_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.target_outside_navmesh
	}
}
BreedActions.skaven_stormfiend_boss = table.create_copy(BreedActions.skaven_stormfiend_boss, action_data)

return
