-- chunkname: @scripts/settings/dlcs/anvil/anvil_pickup_settings.lua

local settings = DLCSettings.anvil
local base_pickup_definition = {
	ammo_kind = "thrown",
	consumable_item = true,
	debug_pickup_category = "throwing_weapons",
	hud_description = "interaction_ammunition_axe",
	local_pickup_sound = true,
	only_once = true,
	outline_distance = "small_pickup",
	pickup_sound_event = "pickup_ammo",
	refill_amount = 1,
	spawn_weighting = 1e-06,
	type = "ammo",
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
	end,
}
local mapping = {
	ammo_throwing_axe_01_t1 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1",
		unit_template_name = "limited_owned_pickup_projectile_unit",
	},
	ammo_throwing_axe_01_t1_runed_01 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1_runed_01",
		unit_template_name = "limited_owned_pickup_projectile_unit",
	},
	ammo_throwing_axe_01_t2 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2",
		unit_template_name = "limited_owned_pickup_projectile_unit",
	},
	link_ammo_throwing_axe_01_t1 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1",
		unit_template_name = "limited_owned_pickup_unit",
	},
	link_ammo_throwing_axe_01_t1_runed_01 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t1/pup_dw_thrown_axe_01_t1_runed_01",
		unit_template_name = "limited_owned_pickup_unit",
	},
	link_ammo_throwing_axe_01_t2 = {
		category = "ammo",
		unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2",
		unit_template_name = "limited_owned_pickup_unit",
	},
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
