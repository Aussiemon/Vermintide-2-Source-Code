local settings = DLCSettings.steak
settings.breeds = {
	"scripts/settings/breeds/breed_beastmen_minotaur"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_minotaur"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_minotaur_behavior"
}
settings.enemy_package_loader_breed_categories = {
	bosses = {
		"beastmen_minotaur"
	}
}
settings.ai_breed_snippets_file_names = {
	"scripts/settings/dlcs/steak/steak_ai_breed_snippets"
}
settings.utility_considerations_file_names = {
	"scripts/settings/dlcs/steak/steak_utility_considerations"
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/steak/steak_unit_extension_templates"
}
settings.anim_lookup = {
	"crater_intro_1"
}

return
