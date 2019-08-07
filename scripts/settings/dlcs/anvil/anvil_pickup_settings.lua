local settings = DLCSettings.anvil
local base_pickup_definition = {
	only_once = true,
	refill_amount = 1,
	type = "ammo",
	spawn_weighting = 1e-06,
	debug_pickup_category = "throwing_weapons",
	pickup_sound_event = "pickup_ammo",
	outline_distance = "small_pickup",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "interaction_ammunition_axe",
	ammo_kind = "thrown",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		return inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
	end,
	outline_available_func = function (local_player_unit)
		local inventory_extension = ScriptUnit.has_extension(local_player_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		return inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
	end,
	on_pick_up_func = function (world, interactor_unit, is_server, interactable_unit)
		local peer_id = Network.peer_id()
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:delete_limited_owned_pickup_unit(peer_id, interactable_unit)
	end
}
local mapping = {
	ammo_throwing_axe_01_t1 = {
		unit_template_name = "limited_owned_pickup_projectile_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1",
		category = "ammo"
	},
	ammo_throwing_axe_01_t1_runed_01 = {
		unit_template_name = "limited_owned_pickup_projectile_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1_runed_01",
		category = "ammo"
	},
	ammo_throwing_axe_01_t2 = {
		unit_template_name = "limited_owned_pickup_projectile_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2",
		category = "ammo"
	},
	link_ammo_throwing_axe_01_t1 = {
		unit_template_name = "limited_owned_pickup_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1",
		category = "ammo"
	},
	link_ammo_throwing_axe_01_t1_runed_01 = {
		unit_template_name = "limited_owned_pickup_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1_runed_01",
		category = "ammo"
	},
	link_ammo_throwing_axe_01_t2 = {
		unit_template_name = "limited_owned_pickup_unit",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2",
		category = "ammo"
	}
}
settings.pickups = {}

for pickup_name, data in pairs(mapping) do
	if not settings.pickups[data.category] then
		settings.pickups[data.category] = {}
	end

	local category = data.category
	settings.pickups[category][pickup_name] = table.clone(base_pickup_definition)
	settings.pickups[category][pickup_name].unit_name = data.unit_name
	settings.pickups[category][pickup_name].unit_template_name = data.unit_template_name
end

return
