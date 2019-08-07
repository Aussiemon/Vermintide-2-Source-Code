local settings = DLCSettings.scorpion
settings.pickups = {
	ammo = {
		ammo_throwing_axe_01_t2_magic_01 = {
			only_once = true,
			refill_amount = 1,
			type = "ammo",
			pickup_sound_event = "pickup_ammo",
			debug_pickup_category = "throwing_weapons",
			outline_distance = "small_pickup",
			spawn_weighting = 1e-06,
			unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2_magic_01",
			unit_template_name = "limited_owned_pickup_projectile_unit",
			consumable_item = true,
			local_pickup_sound = true,
			hud_description = "interaction_ammunition_axe",
			can_interact_func = function (interactor_unit, interactable_unit, data)
				local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

				return inventory_extension and inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
			end,
			outline_available_func = function (local_player_unit)
				local inventory_extension = ScriptUnit.has_extension(local_player_unit, "inventory_system")

				return inventory_extension and inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
			end
		},
		link_ammo_throwing_axe_01_t2_magic_01 = {
			only_once = true,
			refill_amount = 1,
			type = "ammo",
			pickup_sound_event = "pickup_ammo",
			debug_pickup_category = "throwing_weapons",
			outline_distance = "small_pickup",
			spawn_weighting = 1e-06,
			unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2_magic_01",
			unit_template_name = "limited_owned_pickup_unit",
			consumable_item = true,
			local_pickup_sound = true,
			hud_description = "interaction_ammunition_axe",
			can_interact_func = function (interactor_unit, interactable_unit, data)
				local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

				return inventory_extension and inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
			end,
			outline_available_func = function (local_player_unit)
				local inventory_extension = ScriptUnit.has_extension(local_player_unit, "inventory_system")

				return inventory_extension and inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
			end
		}
	}
}

return
