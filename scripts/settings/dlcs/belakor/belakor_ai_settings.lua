local settings = DLCSettings.belakor
settings.breeds = {
	"scripts/settings/breeds/breed_shadow_lieutenant",
	"scripts/settings/breeds/breed_shadow_skull",
	"scripts/settings/breeds/breed_shadow_totem"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_shadow_skull",
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_shadow_totem"
}
settings.behaviour_tree_nodes = {
	"scripts/entity_system/systems/behaviour/nodes/bt_homing_flight_action"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/shadow/shadow_skull_behavior",
	"scripts/entity_system/systems/behaviour/trees/shadow/shadow_totem_behavior"
}
