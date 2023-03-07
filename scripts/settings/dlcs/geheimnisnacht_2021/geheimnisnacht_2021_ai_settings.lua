local settings = DLCSettings.geheimnisnacht_2021
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_critter_nurgling"
}
settings.behaviour_tree_nodes = {
	"scripts/entity_system/systems/behaviour/nodes/bt_critter_nurgling_roam_action",
	"scripts/entity_system/systems/behaviour/nodes/bt_critter_nurgling_wait_action",
	"scripts/entity_system/systems/behaviour/nodes/bt_critter_nurgling_flee_action"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/critters/critter_nurgling_behavior"
}
