WeaponUtils = WeaponUtils or {}

WeaponUtils.add_bot_meta_data_chain_actions = function (actions, attack_chain_transitions)
	for action_name, action_data in pairs(attack_chain_transitions) do
		for sub_action_name, sub_action_data in pairs(action_data) do
			local wanted_action_name = sub_action_data.wanted_action_name
			local wanted_sub_action_name = sub_action_data.wanted_sub_action_name
			local current_action_settings = actions[action_name][sub_action_name]
			local allowed_chain_actions = current_action_settings.allowed_chain_actions
			local chain_action = WeaponUtils.find_allowed_chain_action(allowed_chain_actions, action_name, sub_action_name, wanted_action_name, wanted_sub_action_name)
			sub_action_data.chain_action = chain_action
		end
	end
end

WeaponUtils.find_allowed_chain_action = function (allowed_chain_actions, action_name, sub_action_name, wanted_action_name, wanted_sub_action_name)
	local found_chain_action = nil
	local num_allowed_chain_actions = #allowed_chain_actions

	for i = 1, num_allowed_chain_actions, 1 do
		local chain_action = allowed_chain_actions[i]

		if chain_action.action == wanted_action_name and chain_action.sub_action == wanted_sub_action_name then
			found_chain_action = chain_action

			break
		end
	end

	fassert(found_chain_action ~= nil, "Error: Couldn't find chain action from [%s-%s] to [%s-%s]", action_name, sub_action_name, wanted_action_name, wanted_sub_action_name)

	return found_chain_action
end

return
