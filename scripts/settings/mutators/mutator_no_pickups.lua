-- chunkname: @scripts/settings/mutators/mutator_no_pickups.lua

return {
	description = "description_mutator_no_pickups",
	display_name = "display_name_mutator_no_pickups",
	icon = "mutator_icon_no_pickups",
	remove_pickups = {
		"all",
	},
	excluded_pickup_item_names = {
		beer_barrel = true,
		explosive_barrel = true,
		explosive_barrel_objective = true,
		lamp_oil = true,
		wpn_grimoire_01 = true,
		wpn_side_objective_tome_01 = true,
	},
}
