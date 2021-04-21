require("scripts/settings/dlcs/morris/deus_blessing_settings")

local NORMAL = 2
local HARD = 3
local HARDER = 4
local HARDEST = 5
local CATACLYSM = 6
local POWER_LEVEL_BONUSES = {
	[NORMAL] = 50,
	[HARD] = 50,
	[HARDER] = 50,
	[HARDEST] = 50,
	[CATACLYSM] = 50
}

local function save_weapon(player, weapon, slot_name)
	local deus_backend = Managers.backend:get_interface("deus")

	deus_backend:grant_deus_weapon(weapon)
	deus_backend:refresh_deus_weapons_in_items_backend()

	local backend_id = weapon.backend_id

	BackendUtils.set_loadout_item(backend_id, player:career_name(), slot_name)

	local inventory_extension = ScriptUnit.extension(player.player_unit, "inventory_system")

	inventory_extension:create_equipment_in_slot(slot_name, backend_id)

	local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()

	deus_run_controller:save_loadout(weapon, slot_name)
end

local function get_weapons(player)
	local career_name = player:career_name()
	local melee_weapon = BackendUtils.get_loadout_item(career_name, "slot_melee")
	local ranged_weapon = BackendUtils.get_loadout_item(career_name, "slot_ranged")

	return {
		slot_melee = melee_weapon,
		slot_ranged = ranged_weapon
	}
end

return {
	display_name = DeusBlessingSettings.blessing_of_power.display_name,
	description = DeusBlessingSettings.blessing_of_power.description,
	icon = DeusBlessingSettings.blessing_of_power.icon,
	client_update_function = function (context, data)
		if data.blessing_applied then
			return
		end

		local player = Managers.player:local_player()
		local player_unit = player.player_unit

		if not player_unit then
			return
		end

		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		local resyncing_loadout = inventory_extension:resyncing_loadout()

		if resyncing_loadout then
			return
		end

		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local power_level_bonus = POWER_LEVEL_BONUSES[difficulty_rank] or POWER_LEVEL_BONUSES[NORMAL]
		local weapons_to_buff = get_weapons(player)

		for slot_name, weapon in pairs(weapons_to_buff) do
			weapon.power_level = weapon.power_level + power_level_bonus

			save_weapon(player, weapon, slot_name)
		end

		data.blessing_applied = true
	end
}
