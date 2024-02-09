-- chunkname: @scripts/settings/dlcs/cog/buff_settings_cog.lua

require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.cog

settings.buff_templates = {
	bardin_engineer_pump_max_overheat_check = {
		buffs = {
			{
				duration = 2,
				max_stacks = 1,
				name = "bardin_engineer_pump_max_overheat_check",
				on_max_stacks_overflow_func = "add_remove_buffs",
				refresh_durations = true,
				max_stack_data = {
					buffs_to_add = {
						"bardin_engineer_pump_max_exhaustion_buff",
					},
				},
			},
		},
	},
	bardin_engineer_pump_max_exhaustion_buff = {
		buffs = {
			{
				apply_buff_func = "bardin_engineer_animation_slow_down_add",
				debuff = true,
				duration = 5,
				icon = "bardin_engineer_pump_max_exhaustion_buff_icon",
				max_stacks = 1,
				name = "bardin_engineer_pump_max_exhaustion_buff",
				priority_buff = true,
				remove_buff_func = "bardin_engineer_animation_slow_down_remove",
				perks = {
					buff_perks.exhausted,
				},
			},
		},
	},
}
settings.proc_functions = {
	add_debuff_on_drakefire_hit = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local target_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[target_unit] then
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local wielded_slot_data = inventory_extension:get_wielded_slot_item_template()

			if wielded_slot_data and wielded_slot_data.weapon_type == "DRAKEFIRE" then
				local buff_system = Managers.state.entity:system("buff_system")
				local template = buff.template
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(target_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	bardin_engineer_remove_pump_stacks = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension and not buff_extension:has_buff_perk("engineer_persistent_pump_stacks") then
				ProcFunctions.remove_buff_stack(owner_unit, buff, params)
			end
		end
	end,
	bardin_engineer_remove_pump_stacks_on_fire = function (owner_unit, buff, params)
		local action = params[1]
		local kind = action and action.kind

		if kind and kind == "career_dr_four" then
			settings.proc_functions.bardin_engineer_remove_pump_stacks(owner_unit, buff, params)
		end
	end,
	bardin_engineer_piston_power_add = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attack_type = params[2]

			if attack_type ~= "heavy_attack" then
				return
			end

			local template = buff.template
			local buff_to_add = template.buff_to_add
			local buff_to_remove = template.buff_to_remove
			local buff_to_check = template.buff_to_check
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if buff_extension:has_buff_type(buff_to_remove) then
				local has_buff_to_remove = buff_extension:get_non_stacking_buff(buff_to_remove)

				if has_buff_to_remove then
					buff_extension:remove_buff(has_buff_to_remove.id)
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
				buff_extension:add_buff(buff_to_check)
			end
		end
	end,
	bardin_engineer_piston_power_sound = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local kind = params[1].charge_value

			if kind and kind == "heavy_attack" then
				local world_manager = Managers.world
				local world = world_manager:world("level_world")
				local wwise_world = world_manager:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "talent_power_swing")
			end
		end
	end,
	bardin_engineer_power_on_next_range = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local action = params[1]

			if action and action.ranged_attack then
				local buff_system = Managers.state.entity:system("buff_system")
				local template = buff.template
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)

				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
}
settings.buff_function_templates = {
	bardin_engineer_animation_slow_down_add = function (unit, buff, params)
		if ALIVE[unit] then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				local first_person_unit = first_person_extension:get_first_person_unit()

				Unit.animation_event(first_person_unit, "cooldown_locked")

				local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
				local slot_data = inventory_extension:get_wielded_slot_data()

				if slot_data.id == "slot_career_skill_weapon" then
					local right_unit_1p = slot_data.right_unit_1p
					local left_unit_1p = slot_data.left_unit_1p
					local right_weapon_extension = ScriptUnit.has_extension(right_unit_1p, "weapon_system")
					local left_weapon_extension = ScriptUnit.has_extension(left_unit_1p, "weapon_system")
					local weapon_extension = right_weapon_extension or left_weapon_extension

					weapon_extension:stop_action("action_complete")
				end
			end
		end
	end,
	bardin_engineer_animation_slow_down_remove = function (unit, buff, params)
		if ALIVE[unit] then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:animation_set_variable("crank_speed", 1)
			end
		end
	end,
	bardin_engineer_piston_power_add_apply = function (unit, buff, params)
		local player_unit = unit

		if ALIVE[player_unit] then
			local template = buff.template
			local buff_to_remove = template.buff_to_remove
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff(buff_to_remove)
		end
	end,
}
