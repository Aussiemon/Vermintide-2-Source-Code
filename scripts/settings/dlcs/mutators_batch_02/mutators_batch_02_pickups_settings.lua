local settings = DLCSettings.mutators_batch_02
settings.pickups = {
	level_events = {
		mutator_statue_01 = {
			only_once = true,
			slot_name = "slot_level_event",
			type = "inventory_item",
			item_description = "mutator_statue_01",
			spawn_weighting = 1e-06,
			debug_pickup_category = "level_event",
			item_name = "mutator_statue_01",
			unit_name = "units/weapons/player/pup_mutator_statue_01/pup_mutator_statue_01",
			unit_template_name = "pickup_projectile_unit",
			wield_on_pickup = true,
			hud_description = "mutator_statue_01"
		}
	}
}

return
