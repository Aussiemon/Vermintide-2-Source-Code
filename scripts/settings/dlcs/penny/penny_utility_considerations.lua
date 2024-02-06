-- chunkname: @scripts/settings/dlcs/penny/penny_utility_considerations.lua

UtilityConsiderations = UtilityConsiderations or {}
UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_tp_trickle = {
	time_since_last = {
		blackboard_input = "time_since_last",
		max_value = 14,
		min_value = 10,
		spline = {
			0,
			0,
			0.5,
			0,
			1,
			1,
		},
	},
}
UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_floating_trickle = {
	time_since_last = {
		blackboard_input = "time_since_last",
		max_value = 8,
		min_value = 8,
		spline = {
			0,
			0,
			0.5,
			0.25,
			1,
			1,
		},
	},
}
UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_defensive_aoe = {
	time_since_last = {
		blackboard_input = "time_since_last",
		max_value = 12,
		min_value = 7,
		spline = {
			0,
			0,
			0.5,
			0.25,
			1,
			1,
		},
	},
	surrounding_players = {
		blackboard_input = "surrounding_players",
		max_value = 4,
		spline = {
			0,
			0,
			0.5,
			0.5,
			1,
			1,
		},
	},
	recent_melee_attacker = {
		blackboard_input = "recent_melee_attacker_unit",
		invert = false,
		is_condition = true,
	},
}
UtilityConsiderations.drachenfels_swing_floating_attack = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 4,
		spline = {
			0,
			1,
			0.2,
			1,
			0.4,
			1,
			0.4,
			0.5,
			1,
			0,
		},
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true,
	},
}
UtilityConsiderations.drachenfels_overhead_floating_attack = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 3.5,
		spline = {
			0,
			1,
			0.2,
			1,
			0.4,
			1,
			0.4,
			0.5,
			1,
			0,
		},
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true,
	},
}
UtilityConsiderations.drachenfels_floating_combo = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 8,
		min_value = 3,
		spline = {
			0,
			0,
			0.5,
			0.1,
			0.75,
			0.4,
			0.95,
			0.85,
			1,
			0,
		},
	},
	time_since_last = {
		blackboard_input = "time_since_last",
		max_value = 8,
		min_value = 4,
		spline = {
			0,
			0,
			0.5,
			0.25,
			1,
			1,
		},
	},
}
UtilityConsiderations.drachenfels_overhead_downed_attack = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 3.5,
		spline = {
			0,
			1,
			0.2,
			1,
			0.4,
			1,
			0.4,
			0.5,
			0.9,
			1,
			1,
			0,
		},
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true,
	},
}
UtilityConsiderations.drachenfels_punch_downed_attack = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 2.5,
		spline = {
			0,
			1,
			0.2,
			1,
			0.4,
			1,
			0.4,
			0.5,
			0.9,
			1,
			1,
			0,
		},
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true,
	},
}
UtilityConsiderations.drachenfels_cleave_downed_attack = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 3.5,
		spline = {
			0,
			1,
			0.2,
			1,
			0.4,
			1,
			0.4,
			0.5,
			0.9,
			1,
			1,
			0,
		},
	},
	has_line_of_sight = {
		blackboard_input = "has_line_of_sight",
		is_condition = true,
	},
}
UtilityConsiderations.defensive_magic_missile_drachenfels = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 20,
		spline = {
			0,
			0.1,
			0.6,
			1,
			1,
			1,
		},
	},
	recent_melee_attacker = {
		blackboard_input = "recent_melee_attacker_unit",
		invert = true,
		is_condition = true,
	},
	target_unit = {
		blackboard_input = "target_unit",
		invert = false,
		is_condition = true,
	},
}
