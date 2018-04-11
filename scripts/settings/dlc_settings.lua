local function count_event_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed_during_event(breed_name)
end

local function count_breed(breed_name)
	return Managers.state.conflict:count_units_by_breed(breed_name)
end

local function current_intensity()
	return Managers.state.conflict.pacing:get_intensity()
end

local function current_difficulty()
	return Managers.state.difficulty.difficulty
end

DLCSettings = {
	full_game = {
		package_name = "resource_packages/dlcs/full_game",
		breeds = {
			"scripts/settings/breeds/breed_chaos_exalted_sorcerer",
			"scripts/settings/breeds/breed_skaven_grey_seer",
			"scripts/settings/breeds/breed_skaven_stormfiend_boss",
			"scripts/settings/breeds/breed_skaven_storm_vermin_warlord",
			"scripts/settings/breeds/breed_chaos_zombie",
			"scripts/settings/breeds/breed_chaos_tentacle"
		},
		behaviour_trees_precompiled = {
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_champion_norsca",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_sorcerer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_grey_seer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_stormfiend_boss",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_storm_vermin_warlord",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tentacle",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_tentacle_sorcerer",
			"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_zombie"
		},
		behaviour_tree_nodes = {},
		behaviour_trees = {
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_grey_seer_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_boss_behavior",
			"scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_warlord_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_sorcerer_behavior",
			"scripts/entity_system/systems/behaviour/trees/chaos/chaos_zombie_behavior"
		},
		terror_event_blueprints = {},
		weighted_random_terror_events = {},
		horde_settings_compositions = {}
	}
}

return 
