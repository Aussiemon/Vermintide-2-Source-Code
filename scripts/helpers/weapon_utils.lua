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

	for i = 1, num_allowed_chain_actions do
		local chain_action = allowed_chain_actions[i]

		if chain_action.action == wanted_action_name and chain_action.sub_action == wanted_sub_action_name then
			found_chain_action = chain_action

			break
		end
	end

	fassert(found_chain_action ~= nil, "Error: Couldn't find chain action from [%s-%s] to [%s-%s]", action_name, sub_action_name, wanted_action_name, wanted_sub_action_name)

	return found_chain_action
end

WeaponUtils.get_weapon_packages = function (item_template, item_units, first_person)
	local packages = {}
	local left_hand_unit_name = item_units.left_hand_unit

	if left_hand_unit_name then
		if first_person then
			packages[#packages + 1] = left_hand_unit_name
		end

		packages[#packages + 1] = left_hand_unit_name .. "_3p"
		local wwise_deps = item_template.wwise_dep_left_hand

		if wwise_deps then
			for i = 1, #wwise_deps do
				local wwise_dep = wwise_deps[i]
				packages[#packages + 1] = wwise_dep
			end
		end
	end

	local right_hand_unit_name = item_units.right_hand_unit

	if right_hand_unit_name then
		if first_person then
			packages[#packages + 1] = right_hand_unit_name
		end

		packages[#packages + 1] = right_hand_unit_name .. "_3p"
		local wwise_deps = item_template.wwise_dep_right_hand

		if wwise_deps then
			for i = 1, #wwise_deps do
				local wwise_dep = wwise_deps[i]
				packages[#packages + 1] = wwise_dep
			end
		end
	end

	local ammo_unit_name = item_units.ammo_unit

	if ammo_unit_name then
		if first_person then
			packages[#packages + 1] = ammo_unit_name
		end

		packages[#packages + 1] = item_units.ammo_unit_3p or ammo_unit_name .. "_3p"
		local wwise_deps = item_template.wwise_dep_ammo

		if wwise_deps then
			for i = 1, #wwise_deps do
				local wwise_dep = wwise_deps[i]
				packages[#packages + 1] = wwise_dep
			end
		end
	end

	local actions = item_template.actions

	for _, sub_actions in pairs(actions) do
		for _, sub_action_data in pairs(sub_actions) do
			local projectile_info = sub_action_data.projectile_info

			if projectile_info then
				if projectile_info.projectile_unit_name then
					packages[#packages + 1] = projectile_info.projectile_unit_name
				end

				if projectile_info.dummy_linker_unit_name then
					packages[#packages + 1] = projectile_info.dummy_linker_unit_name
				end

				if projectile_info.dummy_linker_broken_units then
					for _, unit in pairs(projectile_info.dummy_linker_broken_units) do
						packages[#packages + 1] = unit
					end
				end
			end
		end
	end

	return packages
end

WeaponUtils.get_used_actions = function (template)
	local missing_actions = {}
	local checked_actions = {}
	local pending_actions = {}

	for name, data in pairs(template.actions) do
		if data.default then
			pending_actions[name] = {}
			checked_actions[name] = {}
			pending_actions[name].default = true
		end
	end

	local action_to_check_n, action_to_check_v = next(pending_actions)

	while action_to_check_n ~= nil do
		local sub_action_to_check_n = next(action_to_check_v)

		while sub_action_to_check_n ~= nil do
			local sub_action = ActionUtils.resolve_action_selector(template.actions[action_to_check_n][sub_action_to_check_n])
			local chain_actions = sub_action.allowed_chain_actions

			for chain_action_id = 1, #chain_actions do
				local chain_action_name = chain_actions[chain_action_id].action
				local chain_sub_action_name = chain_actions[chain_action_id].sub_action

				if chain_action_name and chain_sub_action_name then
					local chain_action = template.actions[chain_action_name]
					local chain_sub_action = chain_action and chain_action[chain_sub_action_name]

					if chain_sub_action then
						if (not checked_actions[chain_action_name] or not checked_actions[chain_action_name][chain_sub_action_name]) and (not pending_actions[chain_action_name] or not pending_actions[chain_action_name][chain_sub_action_name]) then
							if not pending_actions[chain_action_name] then
								pending_actions[chain_action_name] = {}
							end

							pending_actions[chain_action_name][chain_sub_action_name] = true
						end
					else
						if not missing_actions[chain_action_name] then
							missing_actions[chain_action_name] = {}
						end

						missing_actions[chain_action_name][chain_sub_action_name] = true
					end
				end
			end

			pending_actions[action_to_check_n][sub_action_to_check_n] = nil

			if not checked_actions[action_to_check_n] then
				checked_actions[action_to_check_n] = {}
			end

			checked_actions[action_to_check_n][sub_action_to_check_n] = true
			sub_action_to_check_n = next(action_to_check_v)
		end

		pending_actions[action_to_check_n] = nil
		action_to_check_n, action_to_check_v = next(pending_actions)
	end

	return checked_actions, missing_actions
end

WeaponUtils.is_valid_weapon_override = function (source_slot_data, destination_item_data)
	local source_slot_weapon_template = source_slot_data and source_slot_data.item_template.name

	return not destination_item_data.valid_templates_to_replace or destination_item_data.valid_templates_to_replace[source_slot_weapon_template]
end
