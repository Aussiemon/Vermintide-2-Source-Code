ActionTemplates.action_career_es_4 = {
	default = {
		slot_to_wield = "slot_career_skill_weapon",
		input_override = "action_career",
		weapon_action_hand = "either",
		kind = "instant_wield",
		total_time = 0,
		condition_func = function (action_user, input_extension)
			local buff_extension = ScriptUnit.extension(action_user, "buff_system")
			local is_disabled = buff_extension:has_buff_perk("disable_career_ability")

			if is_disabled then
				return false
			end

			local career_extension = ScriptUnit.extension(action_user, "career_system")
			local activated_ability_data = career_extension:get_activated_ability_data()

			return activated_ability_data.action_name == "action_career_es_4" and career_extension:can_use_activated_ability()
		end,
		action_on_wield = {
			action = "action_career_hold",
			sub_action = "default"
		},
		allowed_chain_actions = {}
	}
}
