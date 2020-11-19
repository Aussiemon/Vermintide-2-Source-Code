ActionAssertFuncs = {
	handgun = function (weapon_name, action_name, sub_action_name, action)
		local impact_data = action.impact_data

		if impact_data then
			local damage_profile = impact_data.damage_profile

			fassert(damage_profile, "No damage profile set in impact_data for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
		else
			local damage_profile = action.damage_profile

			fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
		end
	end,
	sweep = function (weapon_name, action_name, sub_action_name, action)
		if action.weapon_action_hand == "both" then
			local left_damage_profile = action.damage_profile_left

			fassert(left_damage_profile, "No left damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[left_damage_profile], "Damage profile [\"%s\"] does not exist", left_damage_profile)

			local right_damage_profile = action.damage_profile_right

			fassert(right_damage_profile, "No right damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[right_damage_profile], "Damage profile [\"%s\"] does not exist", right_damage_profile)
		else
			local damage_profile = action.damage_profile

			fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
		end
	end,
	charged_sweep = function (weapon_name, action_name, sub_action_name, action)
		if action.weapon_action_hand == "both" then
			local left_damage_profile = action.damage_profile_left

			fassert(left_damage_profile, "No left damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[left_damage_profile], "Damage profile [\"%s\"] does not exist", left_damage_profile)

			local right_damage_profile = action.damage_profile_right

			fassert(right_damage_profile, "No right damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[right_damage_profile], "Damage profile [\"%s\"] does not exist", right_damage_profile)
		else
			local damage_profile = action.damage_profile

			fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
			fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
		end

		fassert(not action.hit_time, "unsupported parameter hit_time set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)

		if action.discharge_attack then
			fassert(action.discharge_effects, "Action marked as discharge attack, but no discharge_effects set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		else
			fassert(action.overcharge_type, "Action marked as charge attack, but no overcharge_type set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		end
	end,
	push_stagger = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile_inner = action.damage_profile_inner

		fassert(damage_profile_inner, "No inner damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile_inner], "Damage profile [\"%s\"] does not exist", damage_profile_inner)

		local damage_profile_outer = action.damage_profile_outer

		fassert(damage_profile_outer, "No outer damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile_outer], "Damage profile [\"%s\"] does not exist", damage_profile_outer)
	end,
	shield_slam = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)

		local damage_profile_aoe = action.damage_profile_aoe

		fassert(damage_profile_aoe, "No aoe damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile_aoe], "Damage profile [\"%s\"] does not exist", damage_profile_aoe)
	end,
	shotgun = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
	end,
	geiser = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
	end,
	beam = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
	end,
	flamethrower = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
	end,
	charge = function (weapon_name, action_name, sub_action_name, action)
		local charge_time = action.charge_time

		fassert(charge_time, "No charge time set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
	end,
	action_selector = function (weapon_name, action_name, sub_action_name, action)
		local actions = Weapons[weapon_name].actions
		local conditional_actions = action.conditional_actions
		local default_linked_action = action.default_action

		fassert(conditional_actions, "No conditional_actions set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(default_linked_action, "No default_action set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(actions, "No default_action set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)

		local default_action_name = default_linked_action.action or action_name
		local default_action = actions[default_action_name]

		fassert(default_action, "Linked to invalid default action [\"%s\"] for [\"%s.%s\"] in weapon [\"%s\"]", default_action_name, action_name, sub_action_name, weapon_name)

		local default_sub_action_name = default_linked_action.sub_action
		local default_sub_action = default_action[default_sub_action_name]

		fassert(default_sub_action, "Linked to invalid default sub_action [\"%s.%s\"] for [\"%s.%s\"] in weapon [\"%s\"]", default_action_name, default_sub_action_name, action_name, sub_action_name, weapon_name)
		fassert(default_sub_action.kind ~= "action_selector", "Recursive action_selector in [\"%s.%s\"] -> [\"%s.%s\"]  in weapon [\"%s\"]", action_name, sub_action_name, default_action_name, default_sub_action_name, weapon_name)

		for i = 1, #conditional_actions, 1 do
			local linked_sub_action = conditional_actions[i].sub_action

			fassert(linked_sub_action, "No linked sub action set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)

			local condition = conditional_actions[i].condition

			fassert(condition, "No linked sub action condition set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)

			local linked_action = conditional_actions[i].action or action_name
			local action = actions[linked_action]

			fassert(action, "Linked to invalid action [\"%s\"] for [\"%s.%s\"] in weapon [\"%s\"]", linked_action, action_name, sub_action_name, weapon_name)

			local sub_action = action[linked_sub_action]

			fassert(sub_action, "Linked to invalid sub_action [\"%s.%s\"] for [\"%s.%s\"] in weapon [\"%s\"]", linked_action, linked_sub_action, action_name, sub_action_name, weapon_name)
			fassert(sub_action.kind ~= "action_selector", "Recursive action_selector in [\"%s.%s\"] -> [\"%s.%s\"]  in weapon [\"%s\"]", action_name, sub_action_name, linked_action, linked_sub_action, weapon_name)
		end
	end
}

return
