-- chunkname: @scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_ai_settings.lua

local settings = DLCSettings.mutators_batch_02

settings.breeds = {
	"scripts/settings/breeds/breed_skaven_explosive_loot_rat",
	"scripts/settings/breeds/breed_chaos_mutator_sorcerer",
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_explosive_loot_rat",
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_mutator_sorcerer",
}
settings.behaviour_tree_nodes = {
	"scripts/entity_system/systems/behaviour/nodes/bt_mutator_sorcerer_follow_action",
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/skaven/skaven_explosive_loot_rat_behavior",
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_mutator_sorcerer_behavior",
}
settings.enemy_package_loader_breed_categories = {
	level_specific = {
		"skaven_explosive_loot_rat",
		"chaos_mutator_sorcerer",
	},
}
