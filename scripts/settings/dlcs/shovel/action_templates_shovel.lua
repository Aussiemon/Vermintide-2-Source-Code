ActionTemplates.action_career_bw_necromancer = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		weapon_action_hand = "either",
		kind = "instant_wield",
		input_override = "action_career",
		total_time = 0,
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
			local passive_ability = career_extension:get_passive_ability_by_name("bw_necromancer")

			if not passive_ability or not passive_ability:is_ready() then
				return false
			end

			local activated_ability_data = career_extension:get_activated_ability_data()

			return career_extension:can_use_activated_ability() and activated_ability_data.action_name == "action_career_bw_necromancer"
		end,
		enter_function = function (attacker_unit, input_extension)
			local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

			if inventory_extension then
				inventory_extension:check_and_drop_pickups("career_ability")
			end
		end,
		action_on_wield = {
			action = "action_career_hold",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
