local settings = DLCSettings.mutators_batch_02
settings.breeds = {
	"scripts/settings/breeds/breed_skaven_explosive_loot_rat"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_explosive_loot_rat"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/skaven/skaven_explosive_loot_rat_behavior"
}
settings.enemy_package_loader_breed_categories = {
	level_specific = {
		"skaven_explosive_loot_rat"
	}
}

return
