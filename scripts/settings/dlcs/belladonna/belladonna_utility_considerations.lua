UtilityConsiderations = UtilityConsiderations or {}
UtilityConsiderations.beastmen_ungor_archer_find_ranged_position = {
	does_not_have_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		invert = true,
		is_condition = true
	},
	distance_to_target = {
		max_value = 10,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.25,
			0,
			1,
			1
		}
	},
	does_not_have_ranged_position = {
		blackboard_input = "ranged_position",
		invert = true,
		is_condition = true
	}
}
UtilityConsiderations.beastmen_ungor_archer_move_to_ranged_position = {
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
	has_ranged_position = {
		blackboard_input = "ranged_position",
		is_condition = true
	},
	is_navbot_following_path = {
		is_condition = true,
		blackboard_input = "is_navbot_following_path"
	}
}
UtilityConsiderations.beastmen_ungor_attack = {
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true
	},
	distance_to_target_flat_sq = {
		max_value = 15,
		blackboard_input = "target_dist_xy_sq",
		spline = {
			0,
			0,
			0.18,
			1,
			0.7392308,
			1,
			0.8,
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
		blackboard_input = "target_dist_z_abs",
		spline = {
			0,
			0,
			0.01,
			1,
			0.9,
			1,
			0.92,
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
}
UtilityConsiderations.beastmen_ungor_running_attack = {
	distance_to_target = {
		max_value = 4,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.45,
			0,
			0.6,
			1,
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
		blackboard_input = "target_num_occupied_slots",
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
	},
	is_following_target = {
		is_condition = true,
		blackboard_input = "is_following_target"
	}
}
UtilityConsiderations.beastmen_ungor_archer_fire_projectile = {
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true
	},
	distance_to_target = {
		max_value = 40,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.2,
			1,
			0.8,
			1,
			0.9,
			0
		}
	}
}
UtilityConsiderations.beastmen_gor_attack = {
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
		blackboard_input = "target_dist_z_abs",
		spline = {
			0,
			0,
			0.01,
			1,
			0.9,
			1,
			0.92,
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
}
UtilityConsiderations.beastmen_gor_headbutt_attack = {
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
			0.33,
			1,
			0.35,
			0,
			0.8437957,
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
			0.7,
			0,
			0.9,
			1,
			1,
			1
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
		max_value = 4,
		blackboard_input = "target_num_occupied_slots",
		spline = {
			0,
			1,
			0.5033333333333333,
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
}
UtilityConsiderations.beastmen_place_standard = {
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true
	},
	distance_to_target = {
		max_value = 20,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.2,
			1,
			0.5,
			1,
			0.7,
			0
		}
	},
	has_not_placed_standard = {
		is_condition = true,
		invert = true,
		blackboard_input = "has_placed_standard"
	},
	has_valid_astar_path = {
		is_condition = true,
		blackboard_input = "has_valid_astar_path"
	}
}
UtilityConsiderations.beastmen_charge = {
	distance_to_target = {
		max_value = 30,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.1,
			0,
			0.2,
			0,
			0.29,
			0,
			0.3,
			1,
			0.6,
			1,
			0.8,
			1,
			0.85,
			0.6,
			1,
			0
		}
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true
	},
	has_valid_astar_path = {
		is_condition = true,
		blackboard_input = "has_valid_astar_path"
	},
	is_navbot_following_path = {
		is_condition = true,
		blackboard_input = "is_navbot_following_path"
	},
	time_since_last_done = {
		max_value = 5,
		blackboard_input = "time_since_last_done",
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
		blackboard_input = "target_num_occupied_slots",
		spline = {
			0,
			1,
			0.5033333333333333,
			1,
			1,
			0
		}
	},
	num_charges_targeting_target = {
		max_value = 2,
		blackboard_input = "num_charges_targeting_target",
		spline = {
			0,
			1,
			0.25,
			1,
			0.45,
			0,
			1,
			0
		}
	},
	target_is_not_charged = {
		is_condition = true,
		invert = true,
		blackboard_input = "target_is_charged"
	}
}
UtilityConsiderations.beastmen_gor_running_attack = {
	distance_to_target = {
		max_value = 8,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.45,
			0,
			0.6,
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
		blackboard_input = "target_num_occupied_slots",
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
	},
	is_following_target = {
		is_condition = true,
		blackboard_input = "is_following_target"
	}
}
UtilityConsiderations.place_standard_follow = {
	distance_to_target = {
		max_value = 25,
		blackboard_input = "target_dist",
		spline = {
			0,
			0,
			0.25,
			0,
			0.26,
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
	}
}
UtilityConsiderations.bestigor_sweep_attack = {
	distance_to_target = {
		max_value = 4.5,
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
		max_value = 7,
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
	},
	distance_to_target_height = {
		max_value = 1.75,
		min_value = 0,
		blackboard_input = "target_dist_z_abs",
		spline = {
			0,
			1,
			0.9,
			1,
			0.92,
			0
		}
	}
}
UtilityConsiderations.bestigor_cleave_attack = {
	distance_to_target = {
		max_value = 4.5,
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
		max_value = 7,
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
}
