ActionAssertFuncs = {
	handgun = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
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
	handgun_lock = function (weapon_name, action_name, sub_action_name, action)
		local damage_profile = action.damage_profile

		fassert(damage_profile, "No damage profile set for [\"%s.%s\"] in weapon [\"%s\"]", action_name, sub_action_name, weapon_name)
		fassert(DamageProfileTemplates[damage_profile], "Damage profile [\"%s\"] does not exist", damage_profile)
	end,
	charge = function (weapon_name, action_name, sub_action_name, action)
		local charge_time = action.charge_time

		fassert(charge_time, "No charge time set")
	end
}

return
