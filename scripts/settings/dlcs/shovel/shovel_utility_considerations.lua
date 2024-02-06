-- chunkname: @scripts/settings/dlcs/shovel/shovel_utility_considerations.lua

UtilityConsiderations = UtilityConsiderations or {}
UtilityConsiderations.pet_skeleton_taunt = {
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 5,
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0,
		},
	},
}
UtilityConsiderations.pet_skeleton_explode = {
	distance_to_target = {
		blackboard_input = "destination_dist",
		max_value = 1,
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0,
		},
	},
	distance_to_target = {
		blackboard_input = "target_dist",
		max_value = 5,
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0,
		},
	},
}
UtilityConsiderations.pet_skeleton_explode_follow = {
	distance_to_destination = {
		blackboard_input = "destination_dist",
		max_value = 0,
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			1,
		},
	},
	is_navbot_following_path = {
		blackboard_input = "is_navbot_following_path",
		is_condition = true,
	},
}
