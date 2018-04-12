UtilityConsiderations = {
	chaos_warrior_running_attack = {
		distance_to_target = {
			max_value = 8,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.35000000000000003,
				0,
				0.4266666666666666,
				1,
				0.5266666666666666,
				1,
				0.6066666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.14333333333333334,
				0,
				0.26666666666666666,
				1,
				1,
				0.9966666666666667
			}
		},
		time_since_last = {
			max_value = 8,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.45666666666666667,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		},
		not_walking = {
			is_condition = true,
			invert = true,
			blackboard_input = "walking"
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		}
	},
	chaos_warrior_target_changed = {
		target_changed = {
			is_condition = true,
			blackboard_input = "target_changed"
		}
	},
	storm_vermin_shield_combo_attack = {
		distance_to_target_flat_sq = {
			max_value = 15,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.2018769,
				1,
				0.4392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	storm_vermin_warlord_dual_combo_attack = {
		distance_to_target_flat_sq = {
			max_value = 25,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.2018769,
				1,
				0.4392308,
				1,
				0.8437957,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		}
	},
	storm_vermin_dual_pounce_attack = {
		distance_to_target_flat_sq = {
			max_value = 15,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.2018769,
				1,
				0.4392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	advance_towards_players = {
		distance_to_target = {
			max_value = 30,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.9966666666666667,
				0.26,
				1,
				0.32666666666666666,
				0.25333333333333335,
				0.45,
				0.11333333333333333,
				0.5733333333333334,
				0.24666666666666667,
				0.6366666666666667,
				1,
				1,
				1
			}
		}
	},
	storm_vermin_special_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.3566666666666667,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		}
	},
	chaos_raider_special_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.22,
				1,
				0.22999999999999998,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.3566666666666667,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		}
	},
	plague_monk_normal_attack = {
		distance_to_target_flat_sq = {
			max_value = 13,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.2018769,
				1,
				0.3392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		distance_to_target_height = {
			max_value = 3.75,
			min_value = -2.9,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		}
	},
	player_bot_default_shoot = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.04,
				0,
				0.2,
				1,
				1,
				1
			}
		}
	},
	marauder_running_attack = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				0,
				0.7,
				0,
				0.85,
				1,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		max_occupied_slots = {
			max_value = 3,
			blackboard_input = "total_occupied_slots",
			spline = {
				0,
				1,
				0.5033333333333333,
				1,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.35,
				0.25,
				0.4,
				0.5,
				1,
				0.9966666666666667
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		distance_to_destination = {
			max_value = 12,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.21,
				1,
				1,
				1
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		}
	},
	clan_rat_running_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.15,
				0,
				0.35,
				0.5,
				0.55,
				0.75,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.19,
				0.25,
				0.4,
				0.5,
				1,
				0.9966666666666667
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		distance_to_destination = {
			max_value = 5,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.21,
				1,
				1,
				1
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		}
	},
	jump_slam = {
		distance_to_target = {
			max_value = 25,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.12,
				0,
				0.12333333333333334,
				0.15333333333333332,
				0.37,
				0.2,
				0.5466666666666666,
				1,
				0.6233333333333333,
				1,
				0.6266666666666667,
				0.0033333333333333335,
				1,
				0
			}
		},
		chasing_timer = {
			max_value = 25,
			blackboard_input = "chasing_timer",
			spline = {
				0,
				0,
				0.12,
				0,
				0.36333333333333334,
				1,
				1,
				1
			}
		}
	},
	troll_melee_shove = {
		distance_to_target = {
			max_value = 6,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	troll_melee_sweep = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.7,
				1,
				0.9,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 4,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.95,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	melee_shove = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.95,
				0,
				1,
				1
			}
		}
	},
	spawn_melee_shove = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	chaos_spawn_tentacle_grab = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		time_since_last = {
			max_value = 18,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.95,
				0,
				1,
				1
			}
		}
	},
	attack_grabbed_smash = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.7,
				0,
				1,
				0
			}
		}
	},
	attack_grabbed_chew = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.5233333333333333,
				0,
				0.6,
				1,
				1,
				1
			}
		}
	},
	attack_grabbed_throw = {
		attack_grabbed_attacks = {
			max_value = 4,
			blackboard_input = "attack_grabbed_attacks",
			spline = {
				0,
				0,
				0.25,
				0,
				1,
				1
			}
		},
		grabbed_time = {
			max_value = 10,
			blackboard_input = "grabbed_time",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		}
	},
	clan_rat_shout = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.11,
				0.03,
				0.30333333333333334,
				0.04,
				0.7466666666666667,
				0.09333333333333334,
				0.9166666666666666,
				0.1,
				0.9466666666666667,
				0.10333333333333333,
				1,
				0.11333333333333333
			}
		},
		distance_to_destination = {
			max_value = 3,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0.9133333333333333,
				0.03333333333333333,
				0.9133333333333333,
				0.08666666666666667,
				0.6,
				0.15,
				0.34,
				0.22666666666666666,
				0.17666666666666667,
				0.38,
				0.05333333333333334,
				1,
				0
			}
		},
		wait_slot_distance = {
			max_value = 10,
			blackboard_input = "wait_slot_distance",
			spline = {
				0,
				0.9933333333333333,
				0.39666666666666667,
				0,
				1,
				0
			}
		}
	},
	storm_vermin_shield_push_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.2966666666666667,
				1,
				0.45,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		push_attack = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	troll_follow = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.15000000000000002,
				0,
				0.2,
				1,
				1,
				1
			}
		}
	},
	melee_slam = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		}
	},
	chaos_spawn_melee_slam = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		}
	},
	vomit = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 1,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		time_since_last_done = {
			max_value = 10,
			blackboard_input = "time_since_last_done",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	clan_rat_follow = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.21,
				1,
				1,
				1
			}
		},
		distance_to_destination = {
			max_value = 5,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0,
				0.11333333333333333,
				0,
				0.15,
				1,
				1,
				1
			}
		},
		is_navbot_following_path = {
			is_condition = true,
			blackboard_input = "is_navbot_following_path"
		}
	},
	pet_follow = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.21,
				1,
				1,
				1
			}
		}
	},
	storm_vermin_shield_push_attack_wake_up = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		push_attack = {
			max_value = 500,
			blackboard_input = "wake_up_push",
			spline = {
				0,
				0,
				1,
				1
			}
		}
	},
	anti_ladder_melee_slam = {
		distance_to_ladder = {
			max_value = 5,
			blackboard_input = "ladder_distance",
			spline = {
				0,
				1,
				0.5233333333333333,
				1,
				0.6,
				0,
				1,
				0
			}
		}
	},
	berzerker_frenzy_attack = {
		distance_to_target_flat_sq = {
			max_value = 15,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.3018769,
				1,
				0.5392308,
				1,
				0.7065279999999999,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	plague_monk_frenzy_attack = {
		distance_to_target_flat_sq = {
			max_value = 10,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				0,
				0.2018769,
				1,
				0.4392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	attack_crouch_sweep = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.52,
				1,
				0.55,
				0,
				1,
				0
			}
		}
	},
	chaos_warrior_launch_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		special_attack = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.6,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		stagger_count = {
			max_value = 5,
			blackboard_input = "stagger_count",
			spline = {
				0,
				0,
				0.24666666666666667,
				0,
				0.5666666666666669,
				1,
				1,
				1
			}
		}
	},
	storm_vermin_push_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.2966666666666667,
				1,
				0.45,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		},
		push_attack = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	chaos_raider_push_attack = {
		distance_to_target = {
			max_value = 4,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.2966666666666667,
				1,
				0.7,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		},
		push_attack = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	plague_monk_frenzy_attack_ranged = {
		distance_to_target_flat_sq = {
			max_value = 30,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.2,
				0,
				0.32,
				1,
				0.81,
				1,
				1,
				0
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		distance_to_target_height = {
			max_value = 1.5,
			min_value = -0.6,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	marauder_attack = {
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		},
		distance_to_target_flat_sq = {
			max_value = 20,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.2018769,
				1,
				0.4392308,
				1,
				0.656528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		distance_to_target_height = {
			max_value = 3.75,
			min_value = -2.9,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.2000000000000001,
				1,
				0.3999999999999999,
				0,
				1,
				0
			}
		}
	},
	clan_rat_attack = {
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		},
		distance_to_target_flat_sq = {
			max_value = 13,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				1,
				0.2018769,
				1,
				0.3392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		distance_to_target_height = {
			max_value = 3.75,
			min_value = -2.9,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		}
	},
	berzerker_attack = {
		has_line_of_sight = {
			blackboard_input = "has_line_of_sight",
			is_condition = true
		},
		distance_to_target_flat_sq = {
			max_value = 13,
			blackboard_input = "target_dist_xy_sq",
			spline = {
				0,
				0,
				0.0255212,
				1,
				0.2018769,
				1,
				0.3392308,
				1,
				0.606528,
				0,
				0.8437957,
				0,
				1,
				0
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				1,
				0.3,
				1,
				1,
				0
			}
		},
		not_in_attack_cooldown = {
			blackboard_input = "is_in_attack_cooldown",
			invert = true,
			is_condition = true
		},
		distance_to_target_height = {
			max_value = 3.75,
			min_value = -2.9,
			blackboard_input = "target_dist_z",
			spline = {
				0,
				0,
				0.01,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		}
	},
	chaos_warrior_push_attack = {
		distance_to_target = {
			max_value = 3,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				1,
				0.6,
				1,
				0.75,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		push_attack = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_raider_moving_attack = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.35000000000000003,
				0,
				0.4,
				1,
				0.6066666666666667,
				1,
				0.7506666666666666,
				0,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.1,
				0,
				0.133333333,
				1,
				1,
				0.9966666666666667
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.20666666666666667,
				0,
				0.5,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		}
	},
	chaos_raider_running_attack = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.5,
				0,
				0.7,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.1,
				0,
				0.133333333,
				1,
				1,
				0.9966666666666667
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		}
	},
	player_bot_default_combat = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.25,
				0.25,
				0.75,
				0,
				1,
				0
			}
		}
	},
	troll_cleave = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.5,
				0,
				0.51,
				1,
				0.7,
				1,
				0.92,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.2,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_warrior_special_attack = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.006666666666666667,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.45,
				0,
				1,
				0
			}
		},
		special_attack = {
			max_value = 12,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.4,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		stagger_count = {
			max_value = 5,
			blackboard_input = "stagger_count",
			spline = {
				0,
				1,
				0.24666666666666667,
				1,
				0.2966666666666667,
				0,
				1,
				0.0033333333333333335
			}
		}
	},
	chaos_warrior_sweep_attack = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.006666666666666667,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.45,
				0,
				1,
				0
			}
		},
		special_attack = {
			max_value = 4,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	player_bot_default_follow = {
		distance_to_target = {
			max_value = 40,
			blackboard_input = "ally_distance",
			spline = {
				0,
				0.1,
				0.25,
				0.2,
				0.75,
				1,
				1,
				1
			}
		}
	},
	target_outside_navmesh = {
		target_outside_navmesh = {
			blackboard_input = "target_outside_navmesh",
			is_condition = true
		}
	},
	stormfiend_charge = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0.5,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		ray_can_go_to_target = {
			is_condition = true,
			blackboard_input = "ray_can_go_to_target"
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 25,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		},
		weakspot_rage = {
			is_condition = true,
			blackboard_input = "weakspot_rage"
		}
	},
	stormfiend_boss_charge = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0.5,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		ray_can_go_to_target = {
			is_condition = true,
			blackboard_input = "ray_can_go_to_target"
		},
		mounted_unit_knocked_down = {
			is_condition = true,
			invert = true,
			blackboard_input = "linked_unit"
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 3,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	stormfiend_boss_shoot = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.3,
				0,
				0.55,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 0.5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		time_since_last_done = {
			max_value = 1.5,
			blackboard_input = "time_since_last_done",
			spline = {
				0,
				0,
				0.7,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	stormfiend_boss_dual_shoot = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.3,
				0,
				0.55,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		time_since_last_done = {
			max_value = 1.5,
			blackboard_input = "time_since_last_done",
			spline = {
				0,
				0,
				0.7,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	stormfiend_boss_melee_shove = {
		distance_to_target = {
			max_value = 4.5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.6233333333333333,
				1,
				0.7999999999999999,
				0,
				1,
				0
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	stormfiend_shoot = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.15,
				0,
				0.4,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 0.5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		time_since_last_done = {
			max_value = 2,
			blackboard_input = "time_since_last_done",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	stormfiend_demo_shoot = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.15,
				0,
				0.5,
				1,
				0.6,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 0.5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		},
		time_since_last_done = {
			max_value = 2,
			blackboard_input = "time_since_last_done",
			spline = {
				0,
				0,
				0.8,
				0,
				1,
				1
			}
		}
	},
	grey_seer_missile = {
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	grey_seer_vermintide_spell = {
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	shoot_warpfire_thrower = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.15,
				0,
				0.4,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.20666666666666667,
				0,
				0.2733333333333333,
				1,
				1,
				1
			}
		},
		target_is_not_downed = {
			blackboard_input = "target_is_not_downed",
			is_condition = true
		}
	},
	follow = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.04,
				0,
				0.2,
				1,
				1,
				1
			}
		}
	},
	stormfiend_follow = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.04,
				0,
				0.2,
				1,
				1,
				1
			}
		},
		target_inside_navmesh = {
			is_condition = true,
			invert = true,
			blackboard_input = "target_outside_navmesh"
		}
	},
	chaos_warrior_follow = {
		distance_to_target = {
			max_value = 8,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.08666666666666667,
				0,
				0.11,
				1,
				0.38666666666666666,
				1,
				0.42333333333333334,
				0.19333333333333333,
				0.76,
				0.19333333333333333,
				0.7933333333333333,
				1,
				1,
				1
			}
		},
		distance_to_destination = {
			max_value = 5,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0,
				0.11333333333333333,
				0,
				0.15,
				1,
				1,
				1
			}
		},
		is_navbot_following_path = {
			is_condition = true,
			blackboard_input = "is_navbot_following_path"
		}
	},
	chaos_exalted_follow = {
		distance_to_target = {
			max_value = 8,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.08666666666666667,
				0,
				0.11,
				1,
				0.38666666666666666,
				1,
				0.42333333333333334,
				0.19333333333333333,
				0.76,
				0.19333333333333333,
				0.7933333333333333,
				1,
				1,
				1
			}
		},
		defensive = {
			is_condition = true,
			invert = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	chaos_warrior_combat_step = {
		distance_to_target = {
			max_value = 8,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0,
				0.4766666666666667,
				1,
				0.7633333333333333,
				1,
				0.79,
				0,
				1,
				0
			}
		},
		have_slot = {
			blackboard_input = "have_slot",
			is_condition = true
		},
		not_following_target = {
			is_condition = true,
			invert = true,
			blackboard_input = "is_following_target"
		},
		target_move_speed = {
			max_value = 5,
			blackboard_input = "target_speed_away_small_sample",
			spline = {
				0,
				1,
				0.2,
				1,
				0.25666666666666665,
				0,
				0.36,
				0,
				0.48333333333333334,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.20666666666666667,
				0,
				0.2733333333333333,
				1,
				1,
				1
			}
		},
		is_navbot_following_path = {
			is_condition = true,
			blackboard_input = "is_navbot_following_path"
		}
	},
	chaos_marauder_combat_step = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0,
				0.5066666666666667,
				1,
				0.7033333333333333,
				1,
				0.8500000000000001,
				0,
				1,
				0
			}
		},
		have_slot = {
			blackboard_input = "have_slot",
			is_condition = true
		},
		not_following_target = {
			is_condition = true,
			invert = true,
			blackboard_input = "is_following_target"
		},
		target_move_speed = {
			max_value = 8,
			blackboard_input = "target_speed_away_small_sample",
			spline = {
				0,
				1,
				0.2,
				1,
				0.25666666666666665,
				1,
				0.36,
				1,
				0.48333333333333334,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.20666666666666667,
				0,
				1,
				1
			}
		},
		is_navbot_following_path = {
			is_condition = true,
			blackboard_input = "is_navbot_following_path"
		},
		max_occupied_slots = {
			max_value = 6,
			blackboard_input = "total_occupied_slots",
			spline = {
				0,
				1,
				0.5033333333333333,
				1,
				0.51,
				0,
				1,
				0
			}
		},
		wait_slot_distance = {
			max_value = 10,
			blackboard_input = "wait_slot_distance",
			spline = {
				0,
				0,
				0.39666666666666667,
				0,
				1,
				1
			}
		}
	},
	chaos_exalted_swing_attack = {
		distance_to_target = {
			max_value = 8,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.47333333333333333,
				1,
				0.5533333333333333,
				1,
				0.6066666666666666,
				0,
				1,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_exalted_cleave_attack = {
		distance_to_target = {
			max_value = 7,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.006666666666666667,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.45,
				0,
				1,
				0
			}
		},
		special_attack = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.4,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_exalted_launch_attack = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.15,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_exalted_kick_attack = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	chaos_exalted_launch_attack_defensive = {
		distance_to_target = {
			max_value = 5,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 3,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	storm_vermin_running_attack = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.3,
				0.9966666666666667,
				0.5066666666666666,
				0,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.1,
				0,
				0.133333333,
				1,
				1,
				0.9966666666666667
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.20666666666666667,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		}
	},
	chaos_berzerker_running_attack = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.3,
				0,
				0.5,
				1,
				0.7066666666666667,
				1,
				0.8,
				0,
				1,
				0
			}
		},
		have_slot = {
			max_value = 1,
			blackboard_input = "have_slot",
			spline = {
				0,
				0,
				0.5033333333333333,
				0,
				1,
				1
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.1,
				0,
				0.133333333,
				1,
				1,
				0.9966666666666667
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.4066666666666667,
				0,
				0.6733333333333333,
				1,
				1,
				1
			}
		},
		time_since_last_frenzy = {
			max_value = 20,
			blackboard_input = "time_since_last_combo",
			spline = {
				0,
				0,
				0.3,
				0,
				1,
				1
			}
		}
	},
	chaos_spawn_combo = {
		distance_to_target = {
			max_value = 6,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.8500000000000004,
				1,
				0.9,
				0,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.4,
				0,
				1,
				1
			}
		}
	},
	rat_ogre_combo = {
		distance_to_target = {
			max_value = 6,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.5,
				0,
				0.75,
				0,
				0.95,
				0.85,
				1,
				0
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.2,
				0,
				0.7,
				0,
				1,
				1
			}
		}
	},
	storm_vermin_champion_special_attack = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				1,
				0.3,
				1,
				0.5,
				0
			}
		},
		target_move_speed = {
			max_value = 10,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				1,
				0.14,
				1,
				0.2,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	storm_vermin_champion_special_attack_defensive = {
		distance_to_target = {
			max_value = 10,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				1,
				0.3,
				1,
				0.5,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		}
	},
	storm_vermin_champion_running_attack = {
		distance_to_target = {
			max_value = 4.5,
			min_value = 2,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.21666666666666667,
				0,
				0.47333333333333333,
				1,
				0.6333333333333333,
				1,
				0.7866666666666666,
				0,
				1,
				0
			}
		},
		target_move_speed = {
			max_value = 4,
			blackboard_input = "target_speed_away",
			spline = {
				0,
				0,
				0.15,
				0,
				0.3,
				0.5,
				1,
				0.9966666666666667
			}
		},
		distance_to_destination = {
			max_value = 8,
			blackboard_input = "destination_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.21,
				1,
				1,
				1
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		defensive = {
			is_condition = true,
			invert = true,
			blackboard_input = "defensive_mode_duration"
		},
		time_since_last = {
			max_value = 8,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		}
	},
	storm_vermin_champion_spin = {
		surrounding_players = {
			max_value = 4,
			blackboard_input = "surrounding_players",
			spline = {
				0,
				0,
				0.25,
				0,
				0.5,
				0.15,
				0.75,
				1,
				1,
				1
			}
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		}
	},
	chaos_exalted_aoe = {
		time_since_last = {
			max_value = 22,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		},
		surrounding_players = {
			max_value = 4,
			blackboard_input = "surrounding_players",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		}
	},
	chaos_exalted_defensive_aoe = {
		time_since_last = {
			max_value = 4,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		},
		surrounding_players = {
			max_value = 1,
			blackboard_input = "surrounding_players",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		in_defensive_phase = {
			is_condition = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	chaos_exalted_defensive_idle = {
		in_defensive_phase = {
			is_condition = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	chaos_exalted_champion_lunge_attack = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.4,
				0,
				0.45,
				1,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		ray_can_go_to_target = {
			is_condition = true,
			blackboard_input = "ray_can_go_to_target"
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	chaos_exalted_champion_angry_lunge_attack = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.4,
				0,
				0.45,
				1,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		ray_can_go_to_target = {
			is_condition = true,
			blackboard_input = "ray_can_go_to_target"
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 1,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	chaos_exalted_champion_throw_attack = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.2,
				0,
				0.4,
				0,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		ray_can_go_to_target = {
			is_condition = true,
			blackboard_input = "ray_can_go_to_target"
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		}
	},
	storm_vermin_champion_lunge_attack = {
		distance_to_target = {
			max_value = 9,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		time_since_last = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				0.9,
				1,
				1,
				1
			}
		},
		phase = {
			max_value = 1,
			blackboard_input = "spawned_allies_wave",
			spline = {
				0,
				0,
				1,
				1
			}
		},
		defensive = {
			is_condition = true,
			invert = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	storm_vermin_champion_shatter_attack = {
		distance_to_target = {
			max_value = 15,
			blackboard_input = "target_dist",
			spline = {
				0,
				1,
				0.99,
				1,
				1,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		phase = {
			max_value = 3,
			blackboard_input = "current_phase",
			spline = {
				0,
				0,
				0.7,
				0,
				1,
				1
			}
		},
		defensive = {
			is_condition = true,
			invert = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	storm_vermin_champion_defensive_shatter_attack = {
		distance_to_target = {
			max_value = 9,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.4,
				0,
				0.6,
				1,
				0.8,
				1,
				0.85,
				0,
				1,
				0
			}
		},
		has_line_of_sight = {
			is_condition = true,
			blackboard_input = "has_line_of_sight"
		},
		phase = {
			max_value = 2,
			blackboard_input = "current_phase",
			spline = {
				0,
				0,
				0.5,
				1,
				1,
				1
			}
		},
		defensive = {
			is_condition = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	storm_vermin_champion_spawn = {
		phase = {
			max_value = 2,
			blackboard_input = "current_phase",
			spline = {
				0,
				0,
				0.5,
				0,
				1,
				1
			}
		},
		time_since_last = {
			max_value = 2200,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.025,
				0,
				1,
				1
			}
		}
	},
	chaos_exalted_angry_charge_sequence = {
		phase = {
			max_value = 3,
			blackboard_input = "current_phase",
			spline = {
				0,
				0,
				0.5,
				0,
				0.7,
				0,
				1,
				1
			}
		},
		time_since_last = {
			max_value = 2200,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.025,
				0,
				1,
				1
			}
		}
	},
	grey_seer_death_sequence = {
		phase = {
			max_value = 5,
			blackboard_input = "current_phase",
			spline = {
				0,
				0,
				0.5,
				0,
				0.8,
				0,
				1,
				1
			}
		}
	},
	storm_vermin_champion_follow = {
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.04,
				0,
				0.2,
				1,
				1,
				1
			}
		},
		defensive = {
			is_condition = true,
			invert = true,
			blackboard_input = "defensive_mode_duration"
		}
	},
	storm_vermin_champion_turn_to_face_target = {
		target_changed = {
			is_condition = true,
			blackboard_input = "target_changed"
		}
	},
	storm_vermin_champion_defensive_spin = {
		defensive = {
			is_condition = true,
			blackboard_input = "defensive_mode_duration"
		},
		time_since_last = {
			max_value = 4,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				1
			}
		},
		surrounding_players = {
			max_value = 1,
			blackboard_input = "surrounding_players",
			spline = {
				0,
				0,
				1,
				1
			}
		}
	},
	vortex_skulking = {
		time_since_last_vortex = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				0,
				0.6,
				1,
				1,
				1
			}
		}
	},
	tentacle_skulking = {
		time_since_last_tentacle = {
			max_value = 30,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.75,
				0,
				0.8,
				0.8,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				0,
				0.6,
				1,
				1,
				1
			}
		}
	},
	plague_wave_skulking = {
		time_since_last_plague_wave = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				0,
				0.6,
				1,
				1,
				1
			}
		}
	},
	exalted_plague_wave_skulking = {
		time_since_last_plague_wave = {
			max_value = 8,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		}
	},
	seeking_bomb_missile_skulking = {
		time_since_last_bomb = {
			max_value = 15,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				0.2,
				1,
				1
			}
		}
	},
	magic_missile_skulking = {
		time_since_last_missile = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.5,
				0,
				0.66,
				1,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0,
				0.45,
				0,
				0.6,
				1,
				1,
				1
			}
		},
		recent_attacker = {
			is_condition = true,
			invert = false,
			blackboard_input = "recent_attacker"
		}
	},
	defensive_magic_missile = {
		time_since_last_missile_def = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0.1,
				0.66,
				0.2,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.1,
				0.6,
				1,
				1,
				1
			}
		},
		recent_attacker = {
			is_condition = true,
			invert = false,
			blackboard_input = "recent_attacker_unit"
		},
		target_unit = {
			is_condition = true,
			invert = false,
			blackboard_input = "target_unit"
		}
	},
	defensive_seeking_bomb = {
		time_since_last_bomb_def = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0.1,
				0.66,
				0.2,
				1,
				1
			}
		},
		distance_to_target = {
			max_value = 20,
			blackboard_input = "target_dist",
			spline = {
				0,
				0.1,
				0.6,
				1,
				1,
				1
			}
		}
	},
	defensive_sorcerer_idle = {
		time_since_last_idle = {
			max_value = 10,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0.1,
				0.66,
				0.2,
				1,
				1
			}
		}
	},
	defensive_spawn_tentacle = {
		time_since_last = {
			max_value = 5,
			blackboard_input = "time_since_last",
			spline = {
				0,
				0,
				0.7,
				0,
				1,
				1
			}
		},
		can_spawn_portals = {
			is_condition = true,
			invert = false,
			blackboard_input = "can_spawn_portals"
		},
		in_boss_arena = {
			is_condition = true,
			invert = false,
			blackboard_input = "in_boss_arena"
		}
	}
}

return 
