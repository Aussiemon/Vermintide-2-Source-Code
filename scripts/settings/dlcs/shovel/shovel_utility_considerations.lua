UtilityConsiderations = UtilityConsiderations or {}
UtilityConsiderations.pet_skeleton_taunt = {
	distance_to_target = {
		max_value = 5,
		blackboard_input = "target_dist",
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0
		}
	}
}
UtilityConsiderations.pet_skeleton_explode = {
	distance_to_target = {
		max_value = 1,
		blackboard_input = "destination_dist",
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0
		}
	},
	distance_to_target = {
		max_value = 5,
		blackboard_input = "target_dist",
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			0
		}
	}
}
UtilityConsiderations.pet_skeleton_explode_follow = {
	distance_to_destination = {
		max_value = 0,
		blackboard_input = "destination_dist",
		spline = {
			0,
			1,
			0,
			1,
			0.9,
			1,
			1,
			1
		}
	},
	is_navbot_following_path = {
		is_condition = true,
		blackboard_input = "is_navbot_following_path"
	}
}
