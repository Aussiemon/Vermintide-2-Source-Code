local settings = DLCSettings.wizards_part_2
settings.breeds = {
	"scripts/settings/breeds/breed_tower_homing_skull",
	"scripts/settings/breeds/breed_ethereal_skeleton_with_shield",
	"scripts/settings/breeds/breed_ethereal_skeleton_with_hammer"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_horde_rat_defend_destructible",
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_tower_homing_skull"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/skaven/skaven_horde_rat_defend_destructible_behavior",
	"scripts/entity_system/systems/behaviour/trees/shadow/tower_homing_skull_behavior"
}
settings.behaviour_tree_nodes = {
	"scripts/entity_system/systems/behaviour/nodes/bt_set_defend_position_action",
	"scripts/entity_system/systems/behaviour/nodes/bt_ethereal_homing_flight_action",
	"scripts/entity_system/systems/behaviour/nodes/bt_ethereal_skull_take_off_action"
}
settings.ai_inventory = {}
settings.anim_lookup = {}
settings.ethereal_skull_settings = {
	patrol_target_adjustment_speed = 0.75,
	patrol_speed = 15,
	despawn_dist_sq = 1600,
	patrol_target_height = 154,
	patrol_target_horizontal_dist_from_origin = 5,
	vertical_offset_multiplier = 0.1,
	max_speed_multiplier = 0.02,
	spawn_traversal_outward_speed = 0.8,
	base_speed = 250,
	vertical_offset_frequency_multiplier = 4,
	spawn_traversal_downward_speed = 1.9,
	patrol_target_marginal = 0.3,
	knockback_speed = 27,
	spawn_traversal_duration = 5,
	aggro_distance_sq = 225,
	min_speed_multiplier = 0.009,
	knockback_duration = 1,
	lerp_constant = 2,
	num_spawned_per_difficulty = {
		2,
		2,
		3,
		3,
		4,
		4,
		4
	},
	speed_multiplier_curve_func = function (lifetime)
		return -(1 / (math.min(lifetime + 2, 4) / 4)) + 2
	end
}
