-- chunkname: @scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_pickups_settings.lua

local settings = DLCSettings.mutators_batch_02

settings.pickups = {
	level_events = {
		mutator_statue_01 = {
			debug_pickup_category = "level_event",
			hud_description = "mutator_statue_01",
			item_description = "mutator_statue_01",
			item_name = "mutator_statue_01",
			only_once = true,
			slot_name = "slot_level_event",
			spawn_weighting = 1e-06,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_mutator_statue_01/pup_mutator_statue_01",
			unit_template_name = "pickup_projectile_unit",
			wield_on_pickup = true,
		},
	},
}
