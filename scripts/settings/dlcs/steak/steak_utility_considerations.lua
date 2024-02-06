-- chunkname: @scripts/settings/dlcs/steak/steak_utility_considerations.lua

UtilityConsiderations = UtilityConsiderations or {}
UtilityConsiderations.minotaur_melee_shove = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 5,
		spline = {
			0,
			0,
			0.15,
			0,
			0.16,
			1,
			0.5233333333333333,
			1,
			0.6,
			0,
			1,
			0,
		},
	},
	time_since_last = {
		blackboard_input = "time_since_last",
		max_value = 2,
		spline = {
			0,
			0,
			0.95,
			0,
			1,
			1,
		},
	},
}
UtilityConsiderations.minotaur_charge = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 30,
		spline = {
			0,
			0,
			0.1,
			0,
			0.32,
			0,
			0.4,
			1,
			0.8,
			1,
			0.85,
			0.6,
			1,
			0,
		},
	},
	has_valid_astar_path = {
		blackboard_input = "has_valid_astar_path",
		is_condition = true,
	},
	is_navbot_following_path = {
		blackboard_input = "is_navbot_following_path",
		is_condition = true,
	},
	time_since_last_done = {
		blackboard_input = "time_since_last_done",
		max_value = 5,
		spline = {
			0,
			0,
			0.7,
			0,
			0.9,
			1,
			1,
			1,
		},
	},
	target_is_not_charged = {
		blackboard_input = "target_is_charged",
		invert = true,
		is_condition = true,
	},
}
