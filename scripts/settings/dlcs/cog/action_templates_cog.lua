﻿-- chunkname: @scripts/settings/dlcs/cog/action_templates_cog.lua

ActionTemplates.action_career_dr_4 = {
	default = {
		input_override = "action_career",
		kind = "instant_wield",
		slot_to_wield = "slot_career_skill_weapon",
		total_time = 0,
		weapon_action_hand = "either",
		condition_func = function (action_user, input_extension)
			local buff_extension = ScriptUnit.extension(action_user, "buff_system")
			local is_disabled = buff_extension:has_buff_perk("disable_career_ability")

			if is_disabled then
				return false
			end

			local inventory_extension = ScriptUnit.extension(action_user, "inventory_system")

			if not inventory_extension:can_wield() then
				return false
			end

			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_dr_4"
		end,
		enter_function = function (attacker_unit, input_extension)
			local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

			if inventory_extension then
				inventory_extension:check_and_drop_pickups("career_ability")
			end
		end,
		allowed_chain_actions = {},
	},
}
