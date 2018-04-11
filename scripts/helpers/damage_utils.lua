DamageUtils = {}
local BLACKBOARDS = BLACKBOARDS
local PLAYER_AND_BOT_UNITS = PLAYER_AND_BOT_UNITS
local PLAYER_TARGET_ARMOR = 4
local DAMAGE_SETTINGS = {}
local POSITION_LOOKUP = POSITION_LOOKUP
local unit_get_data = Unit.get_data
local unit_alive = Unit.alive
local unit_local_position = Unit.local_position
local unit_world_position = Unit.world_position
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
local unit_actor = Unit.actor
local unit_find_actor = Unit.find_actor
local actor_position = Actor.position
local actor_unit = Actor.unit
local actor_node = Actor.node
DamageUtils.get_power_level_percentage = function (power_level)
	local min_power_level = MIN_POWER_LEVEL
	local max_power_level = MAX_POWER_LEVEL
	local actual_power_level = power_level
	local percentage = (actual_power_level - min_power_level) / (max_power_level - min_power_level)

	return percentage
end
DamageUtils.get_unit_armor = function (target_unit, hit_zone_name)
	local breed = target_unit and unit_get_data(target_unit, "breed")
	local target_unit_armor, target_unit_primary_armor = nil

	if breed then
		local target_unit_armor_attack, _, target_unit_primary_armor_attack, _ = ActionUtils.get_target_armor(breed, hit_zone_name, target_unit)
		target_unit_armor = target_unit_armor_attack
		target_unit_primary_armor = target_unit_primary_armor_attack
	elseif target_unit then
		local unit_data_armor = unit_get_data(target_unit, "armor") or 1
		target_unit_armor = unit_data_armor
	end

	return target_unit_armor, target_unit_primary_armor
end
DamageUtils.get_breed_damage_multiplier_type = function (target_unit, hit_zone_name)
	local breed = target_unit and unit_get_data(target_unit, "breed")
	local multiplier_type = breed and breed.hitzone_multiplier_types[hit_zone_name]

	if breed and breed.using_inventory_weakspots then
		local inventory_extension = ScriptUnit.extension(target_unit, "ai_inventory_system")

		if inventory_extension and inventory_extension.inventory_weak_spot then
			if hit_zone_name == inventory_extension.inventory_weak_spot then
				multiplier_type = "weakspot"
			else
				multiplier_type = nil
			end
		end
	end

	if target_unit and not breed and unit_get_data(target_unit, "is_dummy") and hit_zone_name == "head" then
		multiplier_type = "headshot"
	end

	return multiplier_type
end
local WEAKSPOT_MULTIPLIER = 3
local PROTECTED_SPOT_MULTIPLIER = 0.5

local function get_clamped_curve_value(curve, index)
	if index < 1 then
		return curve[1]
	elseif #curve <= index then
		return curve[#curve]
	else
		return curve[index]
	end

	return 
end

DamageUtils.get_boost_curve_multiplier = function (curve, percent)
	local x = (#curve - 1) * percent
	local index = math.floor(x) + 1
	local t = x - math.floor(x)
	local p0 = get_clamped_curve_value(curve, index - 1)
	local p1 = get_clamped_curve_value(curve, index + 0)
	local p2 = get_clamped_curve_value(curve, index + 1)
	local p3 = get_clamped_curve_value(curve, index + 2)
	local a = (-p0 / 2 + (3 * p1) / 2) - (3 * p2) / 2 + p3 / 2
	local b = (p0 - (5 * p1) / 2 + 2 * p2) - p3 / 2
	local c = -p0 / 2 + p2 / 2
	local d = p1
	local value = a * t * t * t + b * t * t + c * t + d

	return value
end
DamageUtils.calculate_damage = function (damage_output, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve, boost_damage_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier)
	if damage_profile and damage_profile.no_damage then
		return 0
	end

	if target_unit then
		local target_unit_health_extension = ScriptUnit.has_extension(target_unit, "health_system")
		local is_invincible = target_unit_health_extension and target_unit_health_extension.is_invincible

		if is_invincible then
			return 0
		end
	end

	damage_output = damage_output or DamageOutput
	local is_enemy_damage = attacker_unit == nil or (attacker_unit and not table.contains(PLAYER_AND_BOT_UNITS, attacker_unit))
	local is_player_on_player_damage = not is_enemy_damage and attacker_unit and table.contains(PLAYER_AND_BOT_UNITS, target_unit) and table.contains(PLAYER_AND_BOT_UNITS, attacker_unit)
	local target_unit_armor, target_unit_primary_armor = nil

	if is_player_on_player_damage then
		target_unit_armor = PLAYER_TARGET_ARMOR
	else
		target_unit_armor, target_unit_primary_armor = DamageUtils.get_unit_armor(target_unit, hit_zone_name)
	end

	local buff_extension = nil
	local has_power_boost = false

	if attacker_unit and unit_alive(attacker_unit) and ScriptUnit.has_extension(attacker_unit, "buff_system") then
		buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
		has_power_boost = buff_extension.has_buff_type(buff_extension, "armor penetration")
	end

	local power_boost_damage = 0
	local headshot_boost_damage = 0

	if has_power_boost or (boost_damage_multiplier and 0 < boost_damage_multiplier) then
		local power_boost_armor = nil

		if target_unit_armor == 2 or target_unit_armor == 5 or target_unit_armor == 6 then
			power_boost_armor = 1
		else
			power_boost_armor = target_unit_armor
		end

		local power_boost_target_damages = damage_output[power_boost_armor] or ((power_boost_armor ~= 0 or 0) and damage_output[1])

		if type(power_boost_target_damages) == "table" then
			local power_boost_damage_range = power_boost_target_damages.max - power_boost_target_damages.min
			local power_boost_attack_power, _ = ActionUtils.get_power_level_for_target(original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, target_unit, hit_zone_name, power_boost_armor)
			local power_boost_percentage = DamageUtils.get_power_level_percentage(power_boost_attack_power)
			power_boost_damage = power_boost_target_damages.min + power_boost_damage_range * power_boost_percentage
		else
			power_boost_damage = power_boost_target_damages
		end
	end

	local damage = 0
	local target_damages = damage_output[target_unit_armor] or ((target_unit_armor ~= 0 or 0) and damage_output[1])

	if type(target_damages) == "table" then
		local damage_range = target_damages.max - target_damages.min
		local percentage = 0

		if damage_profile then
			local attack_power, _ = ActionUtils.get_power_level_for_target(original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, target_unit, hit_zone_name)
			percentage = DamageUtils.get_power_level_percentage(attack_power)
		end

		damage = target_damages.min + damage_range * percentage
	else
		damage = target_damages
	end

	local backstab_damage = nil

	if backstab_multiplier then
		backstab_damage = (power_boost_damage and damage < power_boost_damage and power_boost_damage * (backstab_multiplier - 1)) or damage * (backstab_multiplier - 1)
	end

	if not is_enemy_damage then
		local breed = unit_get_data(target_unit, "breed")
		local power_boost_amount = 0
		local head_shot_boost_amount = 0

		if has_power_boost then
			if target_unit_armor == 1 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 2 then
				power_boost_amount = power_boost_amount + 0.6
			elseif target_unit_armor == 3 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 4 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 5 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 6 then
				power_boost_amount = power_boost_amount + 0.3
			else
				power_boost_amount = power_boost_amount + 0.5
			end
		end

		if boost_damage_multiplier and 0 < boost_damage_multiplier then
			if target_unit_armor == 1 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 2 then
				power_boost_amount = power_boost_amount + 0.3
			elseif target_unit_armor == 3 then
				power_boost_amount = power_boost_amount + 0.75
			elseif target_unit_armor == 4 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 5 then
				power_boost_amount = power_boost_amount + 0.5
			elseif target_unit_armor == 6 then
				power_boost_amount = power_boost_amount + 0.2
			else
				power_boost_amount = power_boost_amount + 0.5
			end
		end

		local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(target_unit, hit_zone_name)
		local target_settings = damage_profile and ((damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target)

		if multiplier_type == "headshot" or multiplier_type == "weakspot" or multiplier_type == "protected_weakspot" then
			if 0 < damage then
				if target_unit_armor == 3 then
					head_shot_boost_amount = head_shot_boost_amount + ((target_settings and (target_settings.headshot_boost_boss or target_settings.headshot_boost)) or 0.25)
				else
					head_shot_boost_amount = head_shot_boost_amount + ((target_settings and target_settings.headshot_boost) or 0.5)
				end
			elseif target_unit_primary_armor == 6 and damage == 0 then
				head_shot_boost_amount = head_shot_boost_amount + (target_settings and (target_settings.headshot_boost_heavy_armor or 0.25))
			elseif target_unit_armor == 2 and damage == 0 then
				head_shot_boost_amount = head_shot_boost_amount + ((target_settings and (target_settings.headshot_boost_armor or target_settings.headshot_boost)) or 0.5)
			end

			if multiplier_type == "protected_weakspot" then
				head_shot_boost_amount = head_shot_boost_amount * 0.25
			end
		end

		if multiplier_type == "protected_spot" then
			power_boost_amount = power_boost_amount - 0.5
			head_shot_boost_amount = head_shot_boost_amount - 0.5
		end

		if damage_profile and damage_profile.no_headshot_boost then
			head_shot_boost_amount = 0
		end

		local crit_boost = 0

		if is_critical_strike then
			crit_boost = damage_profile.crit_boost or 0.5

			if buff_extension then
				crit_boost = buff_extension.apply_buffs_to_value(buff_extension, crit_boost, StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS)
			end

			if damage_profile.no_crit_boost then
				crit_boost = 0
			end
		end

		if boost_curve and (0 < power_boost_amount or 0 < head_shot_boost_amount or 0 < crit_boost) then
			local modified_boost_curve, modified_boost_curve_head_shot = nil
			local boost_coefficient = (target_settings and target_settings.boost_curve_coefficient) or DefaultBoostCurveCoefficient
			local boost_coefficient_headshot = (target_settings and target_settings.boost_curve_coefficient_headshot) or DefaultBoostCurveCoefficient

			if boost_damage_multiplier and 0 < boost_damage_multiplier then
				if breed and breed.boost_curve_multiplier_override then
					boost_damage_multiplier = math.clamp(boost_damage_multiplier, 0, breed.boost_curve_multiplier_override)
				end

				boost_coefficient = boost_coefficient * boost_damage_multiplier
				boost_coefficient_headshot = boost_coefficient_headshot * boost_damage_multiplier
			end

			if 0 < power_boost_amount then
				modified_boost_curve = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient)
				power_boost_amount = math.clamp(power_boost_amount, 0, 1)
				local boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve or boost_curve, power_boost_amount)
				power_boost_damage = math.max(math.max(power_boost_damage, damage), 1) * boost_multiplier
			end

			if head_shot_boost_amount or crit_boost then
				local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
				head_shot_boost_amount = buff_extension.apply_buffs_to_value(buff_extension, head_shot_boost_amount, StatBuffIndex.HEADSHOT_MULTIPLIER)
				modified_boost_curve_head_shot = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient_headshot)
				head_shot_boost_amount = math.clamp(head_shot_boost_amount + crit_boost, 0, 1)
				local head_shot_boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve_head_shot or boost_curve, head_shot_boost_amount)
				headshot_boost_damage = math.max(math.max(power_boost_damage, damage), 1) * head_shot_boost_multiplier
			end
		end

		if breed and breed.armored_boss_damage_reduction then
			damage = damage * 0.8
			power_boost_damage = power_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.75
		end

		if breed and breed.boss_damage_reduction then
			damage = damage * 0.45
			power_boost_damage = power_boost_damage * 0.5
			headshot_boost_damage = headshot_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.75
		end

		if breed and breed.lord_damage_reduction then
			damage = damage * 0.25
			power_boost_damage = power_boost_damage * 0.5
			headshot_boost_damage = headshot_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.5
		end

		damage = damage + power_boost_damage + headshot_boost_damage

		if backstab_damage then
			damage = damage + backstab_damage
		end

		if is_critical_strike then
			local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
			local killing_blow_triggered = nil

			if hit_zone_name == "head" and buff_extension.has_buff_perk(buff_extension, "crit_headshot_killing_blow") then
				killing_blow_triggered = true
			elseif backstab_multiplier and 1 < backstab_multiplier and buff_extension.has_buff_perk(buff_extension, "crit_backstab_killing_blow") then
				killing_blow_triggered = true
			end

			if killing_blow_triggered then
				local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

				if breed then
					local boss = breed.boss
					local primary_armor = breed.primary_armor_category

					if not boss and not primary_armor then
						local breed_health_table = breed.max_health
						local breed_health = breed_health_table[difficulty_rank]
						damage = breed_health
					end
				end
			end
		end
	end

	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()

	if is_player_on_player_damage then
		local friendly_fire_multiplier = difficulty_settings.friendly_fire_multiplier

		if friendly_fire_multiplier then
			damage = damage * friendly_fire_multiplier
		end
	end

	local heavy_armour_damage = false

	return damage, heavy_armour_damage
end
local WEAKSPOT_STAGGER_CATEGORY = 8
DamageUtils.calculate_stagger_player = function (stagger_table, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked)
	local blackboard = BLACKBOARDS[target_unit]
	local breed = blackboard.breed
	local target_unit_armor = breed.stagger_armor_category or breed.armor_category or 1
	local shield_user = AiUtils.shield_user(target_unit)
	local stagger = 0
	local stagger_strength = 0
	local duration = 1
	local distance = 0
	local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]

	if hit_zone_name == "weakspot" and blackboard.stagger_count == 0 and (not blackboard.stagger or blackboard.stagger_anim_done) then
		stagger = WEAKSPOT_STAGGER_CATEGORY
	elseif stagger_table and not breed.stagger_immune then
		local stagger_settings = stagger_table[target_unit_armor]
		local stagger_range = stagger_settings.max - stagger_settings.min
		local _, impact_power = ActionUtils.get_power_level_for_target(original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, target_unit, hit_zone_name, target_unit_armor)
		local percentage = DamageUtils.get_power_level_percentage(impact_power)
		stagger_strength = stagger_range * percentage

		if is_critical_strike then
			local boost_amount = attacker_buff_extension.apply_buffs_to_value(attacker_buff_extension, 0.5, StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS)
			local boost_multiplier = DamageUtils.get_boost_curve_multiplier(boost_curve, boost_amount)
			stagger_strength = stagger_strength + stagger_strength * boost_multiplier
		end

		stagger_strength = stagger_settings.min + stagger_strength
		local has_power_boost = false

		if attacker_unit and unit_alive(attacker_unit) and attacker_buff_extension then
			has_power_boost = attacker_buff_extension.has_buff_type(attacker_buff_extension, "armor penetration")

			if has_power_boost then
				stagger_strength = stagger_strength * 2
			end
		end

		if breed then
			local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
			local stagger_resistance = (breed.diff_stagger_resist and breed.diff_stagger_resist[difficulty_rank]) or breed.stagger_resistance or 2
			local enemy_current_action = blackboard.action
			local action_stagger_reduction = enemy_current_action and enemy_current_action.stagger_reduction
			local stagger_reduction = not damage_profile.ignore_stagger_reduction and (action_stagger_reduction or breed.stagger_reduction)

			if stagger_reduction and type(stagger_reduction) == "table" then
				stagger_reduction = stagger_reduction[difficulty_rank]
			end

			if stagger_reduction then
				stagger_strength = math.clamp(stagger_strength - stagger_reduction, 0, stagger_strength)
			end

			if blackboard.stagger then
				local stagger_bonus = math.clamp(blackboard.stagger * (breed.stagger_multiplier or 0.5) * stagger_strength, 0, stagger_strength)
				stagger_strength = stagger_strength + stagger_bonus
			end

			if 0 < stagger_strength then
				local stagger_threshold_light = (breed.stagger_threshold_light and breed.stagger_threshold_light * stagger_resistance) or 0
				local stagger_threshold_medium = (breed.stagger_threshold_medium and breed.stagger_threshold_medium * stagger_resistance) or stagger_resistance
				local stagger_threshold_heavy = (breed.stagger_threshold_heavy and breed.stagger_threshold_heavy * stagger_resistance) or 2 * stagger_resistance
				local stagger_threshold_explosion = (breed.stagger_threshold_explosion and breed.stagger_threshold_explosion * stagger_resistance) or 10 * stagger_resistance
				local excessive_force = 0
				local scale = nil
				local impact_modifier = 1

				if stagger_strength < stagger_threshold_light then
					stagger = 0
				elseif stagger_strength < stagger_threshold_medium then
					stagger = 1
					excessive_force = stagger_strength
					scale = (0 < excessive_force and excessive_force / stagger_resistance) or 0
					impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
				elseif stagger_strength < stagger_threshold_heavy then
					stagger = 2
					excessive_force = stagger_strength - stagger_threshold_medium
					scale = (0 < excessive_force and excessive_force / stagger_resistance) or 0
					impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
				elseif stagger_strength < stagger_threshold_explosion then
					stagger = 3
					excessive_force = stagger_strength - stagger_threshold_heavy
					scale = (0 < excessive_force and stagger_resistance / excessive_force) or 0
					impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
				elseif damage_profile.is_explosion then
					stagger = 6
				else
					stagger = 3
				end

				if breed.stagger_duration_difficulty_mod then
					local stagger_duration_difficulty_table = breed.stagger_duration_difficulty_mod
					local breed_duration_modifier = stagger_duration_difficulty_table[difficulty_rank] or 1
					duration = duration * breed_duration_modifier
				end

				local time_modifier = 0.75 + 0.25 * math.clamp(excessive_force / stagger_resistance, 0, 2)
				duration = duration * time_modifier
				distance = math.clamp(distance * impact_modifier, 0.8, 1.2)
			end
		end
	end

	if attack_template.ranged_stagger then
		if stagger == 1 then
			stagger = 4
		elseif stagger == 2 then
			stagger = 5
		end
	end

	if breed.stagger_modifier_function then
		stagger, duration, distance = breed.stagger_modifier_function(stagger, duration, distance, hit_zone_name, blackboard, breed)
	end

	local stagger_value = (attack_template and attack_template.stagger_value) or 1

	if blocked then
		local ai_shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")

		if ai_shield_extension then
			ai_shield_extension.blocked_previous_attack = true
		end

		if stagger == 0 then
			stagger = 1
		elseif stagger == 3 and stagger_value == 1 then
			stagger = 2
		end
	end

	if breed.boss_staggers and stagger < 6 then
		stagger = 0
	end

	local action = blackboard.action
	local ignore_staggers = action and action.ignore_staggers

	if ignore_staggers and attacker_buff_extension and attacker_buff_extension.has_buff_type(attacker_buff_extension, "push_increase") then
		ignore_staggers = false
	end

	if not attack_template.always_stagger and ignore_staggers and ignore_staggers[stagger] and (not ignore_staggers.allow_push or not attack_template or not attack_template.is_push) then
		return 0, 0, 0
	end

	if breed.no_stagger_duration and not attack_template.always_stagger then
		duration = duration * 0.25
	end

	local stagger_duration_modifier = target_settings.stagger_duration_modifier or damage_profile.stagger_duration_modifier or DefaultStaggerDurationModifier
	local stagger_distance_modifier = target_settings.stagger_distance_modifier or damage_profile.stagger_distance_modifier or DefaultStaggerDistanceModifier
	local stagger_duration_table = (breed.stagger_duration and breed.stagger_duration[stagger]) or DefaultStaggerDuration
	duration = duration * stagger_duration_table * stagger_duration_modifier
	distance = distance * stagger_distance_modifier

	if not breed.no_random_stagger_duration then
		duration = math.max((duration + math.random() * 1) - 0.5, 0)
	end

	return stagger, duration, distance, stagger_value
end
DamageUtils.calculate_stagger_dummy = function (stagger_table, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked)
	local target_unit_armor = unit_get_data(target_unit, "armor")
	local stagger = 0
	local stagger_strength = 0
	local duration = 1
	local distance = 0
	local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]

	if stagger_table then
		local stagger_settings = stagger_table[target_unit_armor]
		local stagger_range = stagger_settings.max - stagger_settings.min
		local _, impact_power = ActionUtils.get_power_level_for_target(original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, target_unit, hit_zone_name)
		local percentage = DamageUtils.get_power_level_percentage(impact_power)
		stagger_strength = stagger_range * percentage

		if is_critical_strike then
			local boost_amount = attacker_buff_extension.apply_buffs_to_value(attacker_buff_extension, 0.5, StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS)
			local boost_multiplier = DamageUtils.get_boost_curve_multiplier(boost_curve, boost_amount)
			stagger_strength = stagger_strength + stagger_strength * boost_multiplier
		end

		stagger_strength = stagger_settings.min + stagger_strength
		local has_power_boost = false

		if attacker_unit and unit_alive(attacker_unit) and attacker_buff_extension then
			has_power_boost = attacker_buff_extension.has_buff_type(attacker_buff_extension, "armor penetration")

			if has_power_boost then
				stagger_strength = stagger_strength * 2
			end
		end

		local stagger_resistance = 1.5
		local stagger_threshold_light = 0
		local stagger_threshold_medium = stagger_resistance
		local stagger_threshold_heavy = 2 * stagger_resistance
		local stagger_threshold_explosion = 10 * stagger_resistance
		local excessive_force, scale = nil
		local impact_modifier = 1

		if stagger_strength < stagger_threshold_light then
			stagger = 0
		elseif stagger_strength < stagger_threshold_medium then
			stagger = 1
			excessive_force = stagger_strength
			scale = (0 < excessive_force and excessive_force / stagger_resistance) or 0
			impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
		elseif stagger_strength < stagger_threshold_heavy then
			stagger = 2
			excessive_force = stagger_strength - stagger_threshold_medium
			scale = (0 < excessive_force and excessive_force / stagger_resistance) or 0
			impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
		elseif stagger_strength < stagger_threshold_explosion then
			stagger = 3
			excessive_force = stagger_strength - stagger_threshold_heavy
			scale = (0 < excessive_force and stagger_resistance / excessive_force) or 0
			impact_modifier = 0.75 + 0.25 * math.clamp(scale, 0, 1)
		elseif damage_profile.is_explosion then
			stagger = 6
		else
			stagger = 3
		end
	end

	if attack_template.ranged_stagger then
		if stagger == 1 then
			stagger = 4
		elseif stagger == 2 then
			stagger = 5
		end
	end

	local stagger_value = (attack_template and attack_template.stagger_value) or 1

	return stagger, duration, distance, stagger_value
end
DamageUtils.calculate_stagger = function (impact_table, duration_table, target_unit, attacker_unit, attack_template, hit_zone_name, blocked)
	local blackboard = BLACKBOARDS[target_unit]
	local breed = blackboard.breed
	local target_unit_armor = breed.stagger_armor_category or breed.armor_category or 1
	local shield_user = AiUtils.shield_user(target_unit)
	local stagger = 0
	local duration = 0.5

	if hit_zone_name == "weakspot" and blackboard.stagger_count == 0 and (not blackboard.stagger or blackboard.stagger_anim_done) then
		stagger = WEAKSPOT_STAGGER_CATEGORY
	elseif impact_table then
		stagger = impact_table[target_unit_armor] or impact_table[1]
	end

	local stagger_value = (attack_template and attack_template.stagger_value) or 1

	if blocked then
		if stagger == 0 then
			stagger = 1
		elseif stagger == 3 and stagger_value == 1 then
			stagger = 2
		end
	end

	if breed.boss_staggers and stagger < 6 then
		stagger = 0
	end

	local action = blackboard.action
	local ignore_staggers = action and action.ignore_staggers

	if ignore_staggers then
		local owner_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if owner_buff_extension and owner_buff_extension.has_buff_type(owner_buff_extension, "push_increase") then
			ignore_staggers = false
		end
	end

	if ignore_staggers and ignore_staggers[stagger] and (not ignore_staggers.allow_push or not attack_template or not attack_template.is_push) then
		return 0, 0
	end

	if duration_table then
		duration = duration_table[target_unit_armor] or duration_table[1]
	end

	if breed.no_stagger_duration then
		duration = duration * 0.25
	elseif breed.stagger_duration_mod then
		duration = duration * breed.stagger_duration_mod
	elseif blocked then
		duration = math.lerp(duration, 1.25, breed.block_stagger_mod or 0.5)
	elseif shield_user then
		duration = duration * (breed.shield_stagger_mod or 0.6)
	else
		duration = math.max((duration + math.random()) - 0.5, 0)
	end

	return stagger, duration
end
DamageUtils.is_player_unit = function (unit)
	return Managers.player:is_player_unit(unit)
end
DamageUtils.hit_zone = function (unit, actor)
	local breed = unit_get_data(unit, "breed")

	if breed then
		local node = actor_node(actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone.name

		return hit_zone_name
	elseif DamageUtils.is_player_unit(unit) then
		return "torso"
	else
		return "full"
	end

	return 
end
DamageUtils.aoe_hit_zone = function (unit, actor)
	local breed = unit_get_data(unit, "breed")

	if breed then
		local node = actor_node(actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone.name

		return (hit_zone_name == "afro" and "afro") or "torso"
	elseif DamageUtils.is_player_unit(unit) then
		return "torso"
	else
		return "full"
	end

	return 
end
DamageUtils.draw_aoe_size = function (target_unit, breed)
	local radius, height = DamageUtils.calculate_aoe_size(target_unit)
	local unit_position = POSITION_LOOKUP[target_unit]
	local unit_top_position = unit_position + Vector3(0, 0, math.max(height - radius * 0.5, height * 0.5))
	local unit_bottom_position = unit_position + Vector3(0, 0, math.min(radius * 0.5, height * 0.5))

	QuickDrawer:capsule(unit_bottom_position, unit_top_position, radius, Color(255, 255, 0, 255))

	return 
end
DamageUtils.calculate_aoe_size = function (target_unit, breed)
	local radius, height = nil

	if breed then
		radius = breed.aoe_radius or 0.3
		height = breed.aoe_height or 1.5
	elseif DamageUtils.is_player_unit(target_unit) then
		radius = 0.3
		height = 1.7
	else
		radius = 1
		height = 1
	end

	return radius, height
end
local units = {}
DamageUtils.create_explosion = function (world, attacker_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, damaging_unit, attacker_power_level)
	local DamageUtils = DamageUtils
	local explosion_data = explosion_template.explosion

	if explosion_data.camera_effect then
		local effect_settings = explosion_data.camera_effect
		local shake_name = effect_settings.shake_name
		local near_distance = effect_settings.near_distance
		local far_distance = effect_settings.far_distance
		local near_scale = effect_settings.near_scale
		local far_scale = effect_settings.far_scale
		local t = Managers.time:time("game")

		DamageUtils.camera_shake_by_distance(shake_name, t, nil, damaging_unit, near_distance, far_distance, near_scale, far_scale)
	end

	if explosion_data.effect_name then
		World.create_particles(world, explosion_data.effect_name, position, rotation)
	end

	local attacker_unit_alive = unit_alive(attacker_unit)

	if explosion_data.sound_event_name then
		local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(world, position)
		local husk = (is_husk and "true") or "false"

		WwiseWorld.set_switch(wwise_world, "husk", husk, wwise_source_id)
		WwiseWorld.trigger_event(wwise_world, explosion_data.sound_event_name, wwise_source_id)
	end

	if is_server and attacker_unit_alive then
		if explosion_data.alert_enemies then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(attacker_unit, position, explosion_data.alert_enemies_radius)
		end

		local weapon_system = Managers.state.entity:system("weapon_system")
		local network_manager = Managers.state.network
		local push_speed = explosion_data.player_push_speed
		local radius = explosion_data.radius
		local max_damage_radius = explosion_data.max_damage_radius or 0
		local radius_min = explosion_data.radius_min
		local radius_max = explosion_data.radius_max

		if radius_min and radius_max then
			radius = math.lerp(radius_min, radius_max, scale)

			if explosion_data.max_damage_radius_min then
				local max_damage_radius_min = explosion_data.max_damage_radius_min
				local max_damage_radius_max = explosion_data.max_damage_radius_max
				max_damage_radius = math.lerp(max_damage_radius_min, max_damage_radius_max, scale)
			end
		end

		fassert(radius, "Explosion template [%s] has no radius, or radius_min & radius_max, set", explosion_template.name)

		local is_grenade = explosion_template.is_grenade

		if ScriptUnit.has_extension(attacker_unit, "buff_system") and is_grenade then
			local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
			radius = buff_extension.apply_buffs_to_value(buff_extension, radius, StatBuffIndex.GRENADE_RADIUS)
			max_damage_radius = buff_extension.apply_buffs_to_value(buff_extension, max_damage_radius, StatBuffIndex.GRENADE_RADIUS)
		end

		local difficulty_rank = Managers.state.difficulty:get_difficulty()
		local difficulty_power_level = explosion_data.difficulty_power_level and explosion_data.difficulty_power_level[difficulty_rank]
		local power_level_settings = difficulty_power_level or explosion_data
		local power_level = power_level_settings.power_level
		local power_level_min = power_level_settings.power_level_min
		local power_level_max = power_level_settings.power_level_max

		if explosion_data.use_attacker_power_level then
			assert(attacker_power_level, "No attacker power level argument sent for explosion requiring it!")

			power_level = attacker_power_level
			power_level_max = attacker_power_level
			power_level_min = power_level_max * (explosion_data.attacker_power_level_offset or DefaultAttackerPowerLevelOffset)
		end

		if explosion_data.scale_power_level then
			power_level = math.max(explosion_data.scale_power_level, scale) * power_level
			power_level_max = math.max(explosion_data.scale_power_level, scale) * power_level_max
			power_level_min = math.max(explosion_data.scale_power_level, scale) * power_level_min
		end

		local power_level_glance = power_level_settings.power_level_glance
		local do_damage = power_level or (power_level_min and power_level_max) or false
		local ignore_attacker_unit = explosion_data.ignore_attacker_unit
		local collision_filter = "filter_explosion_overlap_no_player"
		local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
		local attacker_player = Managers.player:owner(attacker_unit)
		local attacker_is_player = attacker_player ~= nil

		if (attacker_is_player and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, attacker_player)) or explosion_data.always_hurt_players then
			collision_filter = "filter_explosion_overlap"
		end

		local physics_world = World.physics_world(world)
		local actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", position, "size", radius, "collision_filter", collision_filter, "use_global_table")

		table.clear(units)

		local impact_position = position
		local num_hits = 0
		local BLACKBOARDS = BLACKBOARDS

		for i = 1, num_actors, 1 do
			local hit_actor = actors[i]
			local hit_unit = actor_unit(hit_actor)

			if ScriptUnit.has_extension(hit_unit, "health_system") then
				local ignore_damage = unit_get_data(hit_unit, "ignore_explosion_damage")

				if not units[hit_unit] and (not ignore_attacker_unit or hit_unit ~= attacker_unit) and not ignore_damage then
					local hit_zone_name = DamageUtils.aoe_hit_zone(hit_unit, hit_actor)

					if hit_zone_name ~= "afro" then
						units[hit_unit] = true
						num_hits = num_hits + 1
						local breed = unit_get_data(hit_unit, "breed")
						local is_immune = breed and explosion_data.immune_breeds and explosion_data.immune_breeds[breed.name]
						local target_radius, target_height = DamageUtils.calculate_aoe_size(hit_unit, breed)
						local unit_position = POSITION_LOOKUP[hit_unit] or unit_local_position(hit_unit, 0)
						local unit_top_position = unit_position + Vector3(0, 0, math.max(target_height - target_radius * 0.5, target_height * 0.5))
						local unit_bottom_position = unit_position + Vector3(0, 0, math.min(target_radius * 0.5, target_height * 0.5))
						local closest_point = Geometry.closest_point_on_line(impact_position, unit_bottom_position, unit_top_position)
						local hit_direction = closest_point - impact_position
						local hit_distance = math.max(Vector3.length(hit_direction) - target_radius, 0)
						local hit_direction_normalized = Vector3.normalize(hit_direction)
						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, attacker_unit)

						if shield_blocked then
							hit_distance = math.lerp(hit_distance, radius, 0.5)
						end

						local distance_factor = 1

						if max_damage_radius < hit_distance then
							distance_factor = 1 - (hit_distance - max_damage_radius) / (radius - max_damage_radius)
						end

						local glancing_hit = max_damage_radius < hit_distance

						if script_data.debug_projectiles then
							QuickDrawerStay:vector(position, hit_direction, Colors.get("brown"))
						end

						if attacker_is_player then
							local item_data = rawget(ItemMasterList, damage_source)

							if breed and item_data and not IGNORED_ITEM_TYPES_FOR_BUFFS[item_data.item_type] then
								local attacker_player = Managers.player:owner(attacker_unit)
								local attack_type = "aoe"

								if item_data and item_data.item_type == "grenade" then
									attack_type = item_data.item_type
								end

								local send_to_server = false
								local is_critical = false

								if attacker_player and attacker_player.remote then
									local peer_id = attacker_player.peer_id
									local attack_type_id = NetworkLookup.buff_attack_types.aoe
									local attacker_unit_id = network_manager.unit_game_object_id(network_manager, attacker_unit)
									local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
									local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

									RPC.rpc_buff_on_attack(peer_id, attacker_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, 1)
									DamageUtils.buff_on_attack(attacker_unit, hit_unit, attack_type, is_critical, hit_zone_name, 1, send_to_server)
								elseif attacker_player then
									DamageUtils.buff_on_attack(attacker_unit, hit_unit, attack_type, is_critical, hit_zone_name, 1, send_to_server)
								end

								AiUtils.aggro_unit_of_enemy(hit_unit, attacker_unit)
							end
						end

						if not is_immune then
							local blocking = false
							local blackboard = BLACKBOARDS[hit_unit]

							if blackboard and radius < hit_distance and blackboard.shield_user then
								local stagger = blackboard.stagger
								blocking = not stagger or stagger < 1
							end

							local hit_ragdoll_actor = nil

							if not blocking and breed and breed.hitbox_ragdoll_translation then
								hit_ragdoll_actor = breed.hitbox_ragdoll_translation.j_spine or breed.hitbox_ragdoll_translation.j_spine1
							end

							local scaled_power_level = nil

							if power_level_min and power_level_max then
								scaled_power_level = math.lerp(power_level_min, power_level_max, scale)
							end

							if scaled_power_level and distance_factor then
								scaled_power_level = scaled_power_level * distance_factor
							end

							local damage_profile_name = (glancing_hit and explosion_data.damage_profile_glance) or explosion_data.damage_profile or "default"

							if not do_damage or is_immune then
								damage_profile_name = damage_profile_name .. "_no_damage"
							end

							local actual_power_level = (glancing_hit and power_level_glance) or scaled_power_level or power_level
							local t = Managers.time:time("game")
							local damage_profile = DamageProfileTemplates[damage_profile_name]
							local target_index = nil
							local boost_curve_multiplier = 0
							local shield_break_procc = false
							local is_critical_strike = false
							local backstab_multiplier = 1

							DamageUtils.add_damage_network_player(damage_profile, target_index, actual_power_level, hit_unit, attacker_unit, hit_zone_name, hit_direction_normalized, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, backstab_multiplier)

							local target_alive = AiUtils.unit_alive(hit_unit)

							if target_alive then
								DamageUtils.stagger_ai(t, damage_profile, target_index, actual_power_level, hit_unit, attacker_unit, hit_zone_name, hit_direction_normalized, boost_curve_multiplier, is_critical_strike, shield_blocked)
							end

							DamageUtils.apply_dot(damage_profile, target_index, power_level, hit_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)

							if max_damage_radius then
								push_speed = push_speed and math.auto_lerp(max_damage_radius, radius, push_speed, 1, math.clamp(hit_distance, max_damage_radius, radius))
							end

							if push_speed and DamageUtils.is_player_unit(hit_unit) then
								local status_extension = ScriptUnit.extension(hit_unit, "status_system")

								if not status_extension.is_disabled(status_extension) then
									ScriptUnit.extension(hit_unit, "locomotion_system"):add_external_velocity(hit_direction_normalized * push_speed)
								end
							end
						end
					end
				end
			elseif hit_unit and unit_alive(hit_unit) and hit_actor then
				local hit_direction = actor_position(hit_actor) - impact_position

				unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
				unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
				unit_set_flow_variable(hit_unit, "hit_position", impact_position)
				unit_flow_event(hit_unit, "lua_simple_damage")
			end
		end

		if is_grenade then
			SurroundingAwareSystem.add_event(attacker_unit, "grenade_exp", DialogueSettings.grabbed_broadcast_range, "hit", num_hits, "grenade_owner", ScriptUnit.extension(attacker_unit, "dialogue_system").context.player_profile)
		end
	end

	return 
end
local BROADPHASE_TEMP = {}
DamageUtils.create_taunt = function (world, owner_unit, projectile_unit, position, aoe_data)
	local taunt_data = aoe_data.taunt
	local num_targets = AiUtils.broadphase_query(position, taunt_data.target_selection_range, BROADPHASE_TEMP)
	local best_health = -math.huge
	local best_target = nil

	if 1 < num_targets then
		for i = 1, num_targets, 1 do
			local unit = BROADPHASE_TEMP[i]
			local health_ext = ScriptUnit.extension(unit, "health_system")
			local current_health = health_ext.current_health(health_ext)

			if best_health < current_health then
				best_target = unit
				best_health = current_health
			end
		end
	end

	local extension_init_data = {
		health_system = {
			attached_unit = best_target,
			duration = taunt_data.duration
		},
		death_system = {
			death_reaction_template = "lure_unit"
		}
	}
	local unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "lure_unit", extension_init_data, position)

	if best_target then
		World.link_unit(world, unit, best_target)
	end

	local taunt_end_time = Managers.time:time("game") + taunt_data.duration
	local num_taunted_units = AiUtils.broadphase_query(position, taunt_data.range, BROADPHASE_TEMP)

	for i = 1, num_taunted_units, 1 do
		local ai_unit = BROADPHASE_TEMP[i]

		if ai_unit ~= best_target then
			local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")
			local ai_blackboard = ai_extension.blackboard(ai_extension)
			local ai_breed = ai_extension.breed(ai_extension)

			if not ai_breed.ignore_taunts then
				ai_blackboard.taunt_unit = unit
				ai_blackboard.taunt_end_time = taunt_end_time
				ai_blackboard.target_unit = unit
			end
		end
	end

	return unit
end
DamageUtils.create_aoe = function (world, attacker_unit, position, damage_source, explosion_template)
	local aoe_data = explosion_template.aoe
	local radius = aoe_data.radius
	local is_grenade = explosion_template.is_grenade

	if ScriptUnit.has_extension(attacker_unit, "buff_system") and is_grenade then
		local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
		radius = buff_extension.apply_buffs_to_value(buff_extension, radius, StatBuffIndex.GRENADE_RADIUS)
	end

	local attacker_player = Managers.player:owner(attacker_unit)
	local damage_players = true

	if attacker_player ~= nil then
		local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
		damage_players = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, attacker_player)
	end

	local extension_init_data = {
		area_damage_system = {
			invisible_unit = true,
			aoe_dot_damage = 0,
			aoe_dot_damage_interval = aoe_data.damage_interval,
			radius = radius,
			life_time = aoe_data.duration,
			damage_players = damage_players,
			player_screen_effect_name = aoe_data.player_screen_effect_name,
			dot_effect_name = aoe_data.effect_name,
			extra_dot_effect_name = aoe_data.extra_effect_name,
			nav_mesh_effect = aoe_data.nav_mesh_effect,
			area_damage_template = aoe_data.area_damage_template or "explosion_template_aoe",
			damage_source = damage_source,
			create_nav_tag_volume = aoe_data.create_nav_tag_volume,
			nav_tag_volume_layer = aoe_data.nav_tag_volume_layer,
			explosion_template_name = explosion_template.name,
			owner_player = attacker_player
		}
	}
	local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "aoe_unit", extension_init_data, position)
	local unit_id = Managers.state.unit_storage:go_id(aoe_unit)

	Unit.set_unit_visibility(aoe_unit, false)
	Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, position)

	return 
end
DamageUtils.networkify_damage = function (damage_amount)
	local damage = NetworkConstants.damage
	damage_amount = math.clamp(damage_amount, damage.min, damage.max)
	local decimal = damage_amount % 1
	local rounded_decimal = math.round(decimal * 4) * 0.25

	return math.floor(damage_amount) + rounded_decimal
end
DamageUtils.networkify_health = function (health_amount)
	local health = NetworkConstants.health
	health_amount = math.clamp(health_amount, health.min, health.max)
	local decimal = health_amount % 1
	local rounded_decimal = math.round(decimal * 4) * 0.25

	return math.floor(health_amount) + rounded_decimal
end
DamageUtils.create_hit_zone_lookup = function (unit, breed)
	local hit_zones = breed.hit_zones
	local hit_zones_lookup = {}

	for zone_name, zone in pairs(hit_zones) do
		for k, actor_name in ipairs(zone.actors) do
			local actor = Unit.actor(unit, actor_name)

			if not actor then
				print("Actor ", actor_name .. " not found in ", breed.name)
			end

			local node = actor_node(actor)
			hit_zones_lookup[node] = {
				name = zone_name,
				prio = zone.prio,
				actor_name = actor_name
			}
		end
	end

	breed.hit_zones_lookup = hit_zones_lookup
	BreedHitZonesLookup[breed.name] = hit_zones_lookup

	return 
end
local victim_units = {}
DamageUtils.add_damage_network = function (attacked_unit, attacker_unit, original_damage_amount, hit_zone_name, damage_type, damage_direction, damage_source, hit_ragdoll_actor, damaging_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot)
	local network_manager = Managers.state.network

	if not network_manager.game(network_manager) or (DamageUtils.is_in_inn and PLAYER_AND_BOT_UNITS[attacked_unit]) then
		return 
	end

	local player_manager = Managers.player
	local is_server = player_manager.is_server

	if is_server or LEVEL_EDITOR_TEST then
		table.clear(victim_units)

		local networkified_value = DamageUtils.networkify_damage(original_damage_amount)
		original_damage_amount = DamageUtils.apply_buffs_to_damage(networkified_value, attacked_unit, attacker_unit, damage_source, victim_units, damage_type, buff_attack_type)
	end

	local damage_amount = DamageUtils.networkify_damage(original_damage_amount)

	if is_server or LEVEL_EDITOR_TEST then
		local num_victim_units = #victim_units
		local t = Managers.time:time("game")

		for i = 1, num_victim_units, 1 do
			local victim_unit = victim_units[i]
			damage_type = (victim_unit == attacked_unit and damage_type) or "buff"
			local health_extension = ScriptUnit.extension(victim_unit, "health_system")

			health_extension.add_damage(health_extension, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source, hit_ragdoll_actor, damaging_unit, hit_react_type, is_critical_strike, added_dot)

			if not health_extension.is_alive(health_extension) then
				Managers.state.unit_spawner:prioritize_death_watch_unit(attacked_unit, t)
			end
		end
	else
		local unit_id, is_level_unit = network_manager.game_object_or_level_id(network_manager, attacked_unit)
		local attacker_unit_id, attacker_is_level_unit = network_manager.game_object_or_level_id(network_manager, attacker_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local damage_type_id = NetworkLookup.damage_types[damage_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source or "n/a"]
		local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]
		is_critical_strike = is_critical_strike or false
		added_dot = added_dot or false

		network_manager.network_transmit:send_rpc_server("rpc_add_damage_network", unit_id, is_level_unit, attacker_unit_id, attacker_is_level_unit, damage_amount, hit_zone_id, damage_type_id, damage_direction, damage_source_id, hit_react_type_id, is_critical_strike, added_dot)
	end

	return 
end
DamageUtils.add_damage_network_player = function (damage_profile, target_index, power_level, hit_unit, attacker_unit, hit_zone_name, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, backstab_multiplier, added_dot)
	local network_manager = Managers.state.network

	if not network_manager.game(network_manager) or (DamageUtils.is_in_inn and PLAYER_AND_BOT_UNITS[hit_unit]) then
		return 
	end

	local player_manager = Managers.player
	local attacker_player = player_manager.owner(player_manager, attacker_unit)

	if attacker_player and attacker_player.bot_player and not DamageUtils.can_bots_damage(hit_unit) then
		return 
	end

	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]
	local damage_type = target_settings.damage_type or damage_profile.damage_type or attack_template.damage_type
	local charge_value = damage_profile.charge_value
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local original_damage_amount, heavy_armour_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier)

	table.clear(victim_units)

	local buffed_damage_amount = DamageUtils.apply_buffs_to_damage(original_damage_amount, hit_unit, attacker_unit, damage_source, victim_units, damage_type, charge_value)
	local damage_amount = (heavy_armour_damage and DamageUtils.networkify_damage(0.5)) or DamageUtils.networkify_damage(buffed_damage_amount)

	if attacker_player and player_manager.is_server and script_data.debug_show_damage_numbers and not attacker_player.bot_player then
		local is_alive = AiUtils.unit_alive(hit_unit)

		if is_alive then
			local color_modifier_red = math.min(120 + damage_amount * 4, 255)
			local color_modifier_green = math.max(200 - damage_amount * 4, 0)
			local color1 = Vector3(color_modifier_red, color_modifier_green, 0)
			local random_x = math.random(-30, 30) * 0.01
			local text_size = 40 + damage_amount * 0.75
			local duration = 2.2

			if is_critical_strike then
				color1[1] = 255
				duration = 3.2
				text_size = text_size + 0.05
			end

			Managers.state.event:trigger("add_damage_number", damage_amount, text_size, hit_unit, duration, color1, is_critical_strike)
		end
	end

	if player_manager.is_server or LEVEL_EDITOR_TEST then
		local num_victim_units = #victim_units
		local t = Managers.time:time("game")

		for i = 1, num_victim_units, 1 do
			local victim_unit = victim_units[i]
			damage_type = (victim_unit == hit_unit and damage_type) or "buff"
			local target_health_extension = ScriptUnit.extension(victim_unit, "health_system")

			target_health_extension.add_damage(target_health_extension, attacker_unit, damage_amount, hit_zone_name, damage_type, attack_direction, damage_source, hit_ragdoll_actor, nil, nil, is_critical_strike, added_dot)

			if not target_health_extension.is_alive(target_health_extension) then
				Managers.state.unit_spawner:prioritize_death_watch_unit(hit_unit, t)
			end
		end
	end

	return 
end
local HIT_MARKER_FREQ = 0.1
local HIT_CRITICAL_MULTIPLIER_TYPES = {
	"headshot",
	"weakspot"
}
DamageUtils.handle_hit_indication = function (attacker_unit, victim_unit, damage_amount, hit_zone_name, added_dot)
	local health_extension = ScriptUnit.extension(victim_unit, "health_system")
	local should_indicate_hit = health_extension.is_alive(health_extension) and attacker_unit ~= victim_unit

	if should_indicate_hit then
		local target_unit_armor, target_unit_primary_armor = DamageUtils.get_unit_armor(victim_unit, hit_zone_name)
		local is_player = DamageUtils.is_player_unit(victim_unit)
		local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(victim_unit, hit_zone_name)
		local hit_critical = table.contains(HIT_CRITICAL_MULTIPLIER_TYPES, multiplier_type)
		local hud_extension = ScriptUnit.extension(attacker_unit, "hud_system")
		local hit_marker_data = hud_extension.hit_marker_data
		local diff = 1
		local breed = unit_get_data(victim_unit, "breed")
		local override_armored = breed and breed.armored_on_no_damage

		if hit_marker_data.hit_marker_timestamp then
			local curr_time = Managers.time:time("game")
			diff = curr_time - hit_marker_data.hit_marker_timestamp
		end

		if HIT_MARKER_FREQ < diff then
			hit_marker_data.shield_break = false
			hit_marker_data.shield_open = false
			hit_marker_data.hit_enemy = true
			hit_marker_data.hit_player = is_player
			hit_marker_data.damage_amount = damage_amount
			hit_marker_data.hit_zone = hit_zone_name
			hit_marker_data.hit_critical = hit_critical
			hit_marker_data.has_armor = override_armored or target_unit_primary_armor == 6 or target_unit_armor == 2 or target_unit_armor == 0
			hit_marker_data.hit_marker_timestamp = Managers.time:time("game")
			hit_marker_data.added_dot = added_dot
		end
	end

	return 
end
local buff_params = {}
DamageUtils.buff_on_attack = function (unit, hit_unit, attack_type, is_critical, hit_zone_name, target_number, send_to_server)
	local network_manager = Managers.state.network
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	if not unit_alive(hit_unit) then
		return false
	end

	local hit_unit_health_extension = ScriptUnit.extension(hit_unit, "health_system")

	if not hit_unit_health_extension.is_alive(hit_unit_health_extension) then
		return false
	end

	buff_extension.trigger_procs(buff_extension, "on_hit", hit_unit, attack_type, hit_zone_name, target_number)

	if is_critical then
		buff_extension.trigger_procs(buff_extension, "on_critical_hit", hit_unit, attack_type, hit_zone_name, target_number)
	end

	if send_to_server and not Managers.player.is_server then
		local network_manager = Managers.state.network
		local attacker_unit_id = network_manager.unit_game_object_id(network_manager, unit)
		local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
		local attack_type_id = NetworkLookup.buff_attack_types[attack_type]
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

		network_manager.network_transmit:send_rpc_server("rpc_buff_on_attack", attacker_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, target_number)
	end

	return true
end
local ignored_shared_damage_types = {
	wounded_dot = true,
	suicide = true,
	knockdown_bleed = true
}
DamageUtils.apply_buffs_to_damage = function (current_damage, attacked_unit, attacker_unit, damage_source, victim_units, damage_type, buff_attack_type)
	local damage = current_damage
	local network_manager = Managers.state.network
	victim_units[#victim_units + 1] = attacked_unit
	local health_extension = ScriptUnit.extension(attacked_unit, "health_system")

	if health_extension.has_assist_shield(health_extension) and not ignored_shared_damage_types[damage_source] then
		local attacked_unit_id = network_manager.unit_game_object_id(network_manager, attacked_unit)

		network_manager.network_transmit:send_rpc_clients("rpc_remove_assist_shield", attacked_unit_id)
	end

	local attacked_player = Managers.player:owner(attacked_unit)
	local attacker_player = Managers.player:owner(attacker_unit)

	if ScriptUnit.has_extension(attacked_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(attacked_unit, "buff_system")

		if SKAVEN[damage_source] then
			damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.PROTECTION_SKAVEN)
		elseif CHAOS[damage_source] then
			damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.PROTECTION_CHAOS)
		end

		if DAMAGE_TYPES_AOE[damage_type] then
			damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.PROTECTION_AOE)
		end

		damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.DAMAGE_TAKEN)

		if ELITES[damage_source] then
			local damage_before = damage
			damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.DAMAGE_TAKEN_ELITES)
			slot14 = damage
		end

		status_extension = attacked_player and ScriptUnit.extension(attacked_unit, "status_system")
		local is_knocked_down = status_extension and status_extension.is_knocked_down(status_extension)

		if is_knocked_down then
			damage = (damage_type ~= "overcharge" and buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.DAMAGE_TAKEN_KD)) or 0
		end

		local valid_damage_to_overheat = damage_source ~= "ground_impact" and damage_type ~= "overcharge" and damage_type ~= "temporary_health_degen"

		if valid_damage_to_overheat and 0 < damage and not is_knocked_down then
			local original_damage = damage
			local new_damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.DAMAGE_TAKEN_TO_OVERCHARGE)

			if new_damage < original_damage then
				local damage_to_overcharge = original_damage - new_damage
				damage_to_overcharge = DamageUtils.networkify_damage(damage_to_overcharge)

				if attacked_player.remote then
					local peer_id = attacked_player.peer_id
					local unit_id = network_manager.unit_game_object_id(network_manager, attacked_unit)

					RPC.rpc_damage_taken_overcharge(peer_id, unit_id, damage_to_overcharge)
				else
					DamageUtils.apply_damage_to_overcharge(attacked_unit, damage_to_overcharge)
				end

				damage = new_damage
			end
		end

		local damage_cap = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.MAX_DAMAGE_TAKEN)

		if 0 < damage_cap and damage_cap <= damage then
			damage = math.max(damage * 0.5, damage_cap)
		end

		if buff_extension.has_buff_type(buff_extension, "shared_health_pool") and not ignored_shared_damage_types[damage_source] then
			local player_and_bot_units = PLAYER_AND_BOT_UNITS
			local num_player_and_bot_units = #player_and_bot_units
			local num_players_with_shared_health_pool = 1

			for i = 1, num_player_and_bot_units, 1 do
				local unit = player_and_bot_units[i]

				if unit ~= attacked_unit then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					if buff_extension.has_buff_type(buff_extension, "shared_health_pool") then
						num_players_with_shared_health_pool = num_players_with_shared_health_pool + 1
						victim_units[#victim_units + 1] = unit
					end
				end
			end

			damage = damage / num_players_with_shared_health_pool
		end

		local is_invulnerable = buff_extension.has_buff_type(buff_extension, "invulnerable")
		local has_gromril_armour = buff_extension.has_buff_type(buff_extension, "bardin_ironbreaker_gromril_armour")
		local valid_damage_source = damage_source ~= "ground_impact" and damage_source ~= "temporary_health_degen" and damage_source ~= "overcharge"

		if is_invulnerable or (has_gromril_armour and valid_damage_source) then
			damage = 0
		end

		if has_gromril_armour and valid_damage_source then
			local buff = buff_extension.get_non_stacking_buff(buff_extension, "bardin_ironbreaker_gromril_armour")
			local id = buff.id

			buff_extension.remove_buff(buff_extension, id)
			buff_extension.trigger_procs(buff_extension, "on_gromril_armour_removed")

			local attacked_unit_id = network_manager.unit_game_object_id(network_manager, attacked_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_remove_gromril_armour", attacked_unit_id)
		end
	end

	if ScriptUnit.has_extension(attacker_unit, "buff_system") and attacker_player then
		local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")
		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template

		if weapon_template_name then
			local weapon_template = Weapons[weapon_template_name]
			local buff_type = weapon_template.buff_type

			if buff_type then
				damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE)
			end

			local is_melee = MeleeBuffTypes[buff_type]
			local is_ranged = RangedBuffTypes[buff_type]

			if is_melee then
				damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE)

				if buff_type == "MELEE_1H" then
					damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE_1H)
				elseif buff_type == "MELEE_2H" then
					damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE_2H)
				end

				if buff_attack_type == "heavy_attack" then
					damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_HEAVY_ATTACK)
				end
			elseif is_ranged then
				damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED)
				local attacked_health_extension = ScriptUnit.extension(attacked_unit, "health_system")

				if 0 < attacked_health_extension.get_damage_taken(attacked_health_extension) then
					damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED_TO_WOUNDED)
				end
			end

			local weapon_type = weapon_template.weapon_type

			if weapon_type then
				local stat_buff = WeaponSpecificStatBuffs[weapon_type].damage
				damage = buff_extension.apply_buffs_to_value(buff_extension, damage, StatBuffIndex[stat_buff])
			end
		end
	end

	return damage
end
DamageUtils.apply_damage_to_overcharge = function (unit, damage)
	local overcharge_extension = ScriptUnit.has_extension(unit, "overcharge_system")

	if overcharge_extension then
		overcharge_extension.add_charge(overcharge_extension, damage)
	end

	return 
end
DamageUtils.assist_shield_network = function (shielded_unit, shielder_unit, shield_amount)
	assert(Managers.player.is_server or LEVEL_EDITOR_TEST)

	local health_extension = ScriptUnit.extension(shielded_unit, "health_system")

	health_extension.shield(health_extension, shield_amount)

	local status_extension = ScriptUnit.extension(shielded_unit, "status_system")

	status_extension.set_shielded(status_extension, true)

	if not LEVEL_EDITOR_TEST then
		local network_manager = Managers.state.network
		local shielded_unit_id = network_manager.unit_game_object_id(network_manager, shielded_unit)
		local shielder_unit_id, shielder_is_level_unit = network_manager.game_object_or_level_id(network_manager, shielder_unit)
		local heal_type_id = NetworkLookup.heal_types.shield_by_assist

		network_manager.network_transmit:send_rpc_clients("rpc_heal", shielded_unit_id, false, shielder_unit_id, shielder_is_level_unit, shield_amount, heal_type_id)
	end

	return 
end
local healed_units = {}
DamageUtils.heal_network = function (healed_unit, healer_unit, heal_amount, heal_type)
	fassert(Managers.player.is_server or LEVEL_EDITOR_TEST, "Only server can heal")
	table.clear(healed_units)

	local shared_medpack = false
	heal_amount, shared_medpack = DamageUtils.apply_buffs_to_heal(healed_unit, healer_unit, heal_amount, heal_type, healed_units)
	heal_amount = DamageUtils.networkify_damage(heal_amount)

	if healed_unit ~= healer_unit then
		local healer_buff_extension = ScriptUnit.extension(healer_unit, "buff_system")

		healer_buff_extension.trigger_procs(healer_buff_extension, "on_healed_ally", healed_unit, heal_amount, heal_type)
	end

	local network_manager = Managers.state.network
	local healer_unit_id, healer_is_level_unit = network_manager.game_object_or_level_id(network_manager, healer_unit)
	local num_healed_units = #healed_units

	for i = 1, num_healed_units, 1 do
		local unit = healed_units[i]
		heal_type = (shared_medpack and "buff_shared_medpack") or (unit == healed_unit and heal_type) or "buff"
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.add_heal(health_extension, healer_unit, heal_amount, nil, heal_type)

		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension.healed(status_extension, heal_type)

		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension.trigger_procs(buff_extension, "on_healed", healer_unit, heal_amount, heal_type)

		if not LEVEL_EDITOR_TEST and status_extension.heal_can_remove_wounded(status_extension, heal_type) then
			StatusUtils.set_wounded_network(unit, false, "healed")
		end
	end

	return 
end
DamageUtils.apply_buffs_to_heal = function (healed_unit, healer_unit, heal_amount, heal_type, healed_units)
	local shared_medpack = false
	healed_units[#healed_units + 1] = healed_unit

	if ScriptUnit.has_extension(healed_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(healed_unit, "buff_system")
		heal_amount = buff_extension.apply_buffs_to_value(buff_extension, heal_amount, StatBuffIndex.HEALING_RECEIVED)

		if buff_extension.has_buff_type(buff_extension, "shared_health_pool") then
			local player_and_bot_units = PLAYER_AND_BOT_UNITS
			local num_player_and_bot_units = #player_and_bot_units
			local num_players_with_shared_health_pool = 1

			for i = 1, num_player_and_bot_units, 1 do
				local unit = player_and_bot_units[i]

				if unit ~= healed_unit then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					if buff_extension.has_buff_type(buff_extension, "shared_health_pool") then
						num_players_with_shared_health_pool = num_players_with_shared_health_pool + 1
						healed_units[#healed_units + 1] = unit
					end
				end
			end

			heal_amount = heal_amount / num_players_with_shared_health_pool

			if heal_type == "bandage" or heal_type == "healing_draught" then
				shared_medpack = true
			end
		end
	end

	return heal_amount, shared_medpack
end
DamageUtils.debug_heal = function (unit, amount)
	if Managers.player.is_server then
		DamageUtils.heal_network(unit, unit, amount, "debug")
	else
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)
		local heal_type_id = NetworkLookup.heal_types.debug

		network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", unit_id, amount, heal_type_id)
	end

	return 
end
DamageUtils.debug_deal_damage = function (victim_unit, attack_template_name, hit_zone_name)
	local network_manager = Managers.state.network
	local attack_direction = Vector3(1, 0, 0)
	local hit_unit_id = network_manager.unit_game_object_id(network_manager, victim_unit)

	if hit_unit_id == nil then
		print("DamageUtils.debug_deal_damage failed, victim_unit had no go_id")

		return 
	end

	local attacker_unit_id = hit_unit_id
	hit_zone_name = hit_zone_name or "torso"
	local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
	local damage_source = "debug"
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local damage_profile_name = "debug_damage"
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local weapon_system = Managers.state.entity:system("weapon_system")

	weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", 100, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", 0, "is_critical_strike", false)

	return 
end
DamageUtils.check_distance = function (action, blackboard, attacking_unit, target_unit)
	local breed_attacker = unit_get_data(attacking_unit, "breed")
	local pos_attacker = unit_local_position(attacking_unit, 0)
	local pos_target = unit_local_position(target_unit, 0)
	local to_target = pos_target - pos_attacker
	local blackboard = BLACKBOARDS[attacking_unit]
	local breed = blackboard.breed
	local current_action = blackboard.action
	local player_radius = 1

	if blackboard.target_dodged_during_attack or blackboard.set_dodge_rotation_timer then
		player_radius = player_radius * (current_action.player_dodged_radius or breed.player_dodged_radius or 0.75)
	end

	if action.use_box_range then
		local x = to_target.x
		local y = to_target.y
		local z = to_target.z
		local flat_range = blackboard.attack_range_flat + player_radius

		if z < blackboard.attack_range_up and blackboard.attack_range_down < z and x * x + y * y < flat_range * flat_range then
			return true
		end
	else
		local dist = Vector3.length(to_target)

		if dist <= (current_action.weapon_reach or breed_attacker.weapon_reach or breed_attacker.radius) + player_radius then
			return true
		end
	end

	return false
end
DamageUtils.check_infront = function (attacking_unit, target_unit)
	local pos_attacker = unit_local_position(attacking_unit, 0)
	local pos_target = unit_local_position(target_unit, 0)
	local to_target = Vector3.flat(pos_target - pos_attacker)
	local rot_attacker = Unit.local_rotation(attacking_unit, 0)
	local fwd_attacker = Quaternion.forward(rot_attacker)
	local cos_a = Vector3.dot(Vector3.normalize(to_target), fwd_attacker)
	local blackboard = BLACKBOARDS[attacking_unit]
	local breed = blackboard.breed
	local current_action = blackboard.action
	local default_reach_cone = 0.866

	if blackboard.target_dodged_during_attack or blackboard.set_dodge_rotation_timer then
		default_reach_cone = current_action.player_dodged_cone or breed.player_dodged_cone or 0.95
	end

	if (breed.weapon_reach_cone or default_reach_cone) < cos_a then
		return true
	end

	return false
end
DamageUtils.check_block = function (attacking_unit, target_unit, fatigue_type, enemy_weapon_direction)
	if attacking_unit == target_unit then
		return false
	end

	local network_manager = Managers.state.network
	local _, is_level_unit = network_manager.game_object_or_level_id(network_manager, target_unit)

	if is_level_unit or DamageUtils.is_enemy(target_unit) then
		return false
	end

	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if status_extension then
		local is_blocking = status_extension.is_blocking(status_extension)
		local can_block, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction = status_extension.can_block(status_extension, attacking_unit, enemy_weapon_direction)

		if is_blocking and can_block then
			status_extension.blocked_attack(status_extension, fatigue_type, attacking_unit, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction)

			if not LEVEL_EDITOR_TEST and Managers.player.is_server then
				local unit_storage = Managers.state.unit_storage
				local go_id = unit_storage.go_id(unit_storage, target_unit)
				local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]
				local attacking_unit_id = unit_storage.go_id(unit_storage, attacking_unit)

				network_manager.network_transmit:send_rpc_clients("rpc_player_blocked_attack", go_id, fatigue_type_id, attacking_unit_id, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction)

				local blackboard = BLACKBOARDS[attacking_unit]
				local action = blackboard.action

				if action.no_block_stagger then
				elseif not blackboard.stagger then
					blackboard.blocked = true
				end
			end

			return true
		end

		slot13 = BLACKBOARDS[attacking_unit]
	end

	return false
end
DamageUtils.check_ranged_block = function (attacking_unit, target_unit, attack_direction, fatigue_type)
	local status_extension = ScriptUnit.extension(target_unit, "status_system")
	local network_manager = Managers.state.network
	local player = Managers.player
	local is_blocking = status_extension.is_blocking(status_extension)
	local can_block, fatigue_point_costs_multiplier, improved_block, _ = status_extension.can_block(status_extension, attacking_unit)

	if is_blocking and can_block then
		local inventory_extension = ScriptUnit.extension(target_unit, "inventory_system")
		local weapon_data = inventory_extension.get_wielded_slot_item_template(inventory_extension)

		if not weapon_data then
			return false
		end

		if not weapon_data.can_block_ranged_attacks then
			return false
		end

		local network_manager = Managers.state.network
		local game = network_manager.game(network_manager)
		local unit_id = network_manager.unit_game_object_id(network_manager, target_unit)
		local aim_direction = GameSession.game_object_field(game, unit_id, "aim_direction")
		local dot = Vector3.dot(Vector3.normalize(attack_direction), Vector3.normalize(aim_direction))

		if -0.7 < dot then
			return false
		end

		status_extension.blocked_attack(status_extension, fatigue_type, attacking_unit, fatigue_point_costs_multiplier, false)

		if not LEVEL_EDITOR_TEST and Managers.player.is_server then
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage.go_id(unit_storage, target_unit)
			local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]
			local attacking_unit_id = unit_storage.go_id(unit_storage, attacking_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_player_blocked_attack", go_id, fatigue_type_id, attacking_unit_id, fatigue_point_costs_multiplier, improved_block, "back")
		end

		return true
	end

	return false
end
DamageUtils.camera_shake_by_distance = function (shake_name, start_time, player_unit, source_unit, near_dist, far_dist, near_value, far_value)
	local local_player = Managers.player:local_player()

	if not local_player then
		return 
	end

	local player_unit_to_shake = player_unit or local_player.player_unit

	if not player_unit_to_shake then
		return 
	end

	local scale = 1

	if source_unit then
		local d = Vector3.distance(unit_local_position(source_unit, 0), unit_local_position(player_unit_to_shake, 0))
		scale = 1 - math.clamp((d - near_dist) / (far_dist - near_dist), 0, 1)
		scale = far_value + scale * (near_value - far_value)
	end

	Managers.state.camera:camera_effect_shake_event(shake_name, start_time, scale)

	return 
end
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
local hit_units = {}
local hit_data = {}
DamageUtils.is_enemy = function (unit)
	local breed = unit_get_data(unit, "breed")

	return breed
end
DamageUtils.is_character = function (unit)
	local has_breed = Unit.has_data(unit, "breed")

	return has_breed or table.contains(PLAYER_AND_BOT_UNITS, unit), has_breed
end
DamageUtils.can_bots_damage = function (unit)
	local is_character, _ = DamageUtils.is_character(unit)
	local is_level_unit = Managers.state.network:level_object_id(unit)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	return is_character or is_level_unit or health_extension.bots_can_do_damage
end
DamageUtils.allow_friendly_fire_ranged = function (difficulty_settings, attacker_player)
	return difficulty_settings.friendly_fire_ranged and not attacker_player.bot_player
end
DamageUtils.allow_friendly_fire_melee = function (difficulty_settings, attacker_player)
	return difficulty_settings.friendly_fire_melee and not attacker_player.bot_player
end
DamageUtils.damage_level_unit = function (hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_normal, damage_source)
	local target_settings = damage_profile[target_index] or damage_profile.default_target

	if target_settings then
		local boost_curve = BoostCurves[target_settings.boost_curve_type]
		local damage_amount = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index)
		local damage_type = "destructible_level_object_hit"
		local hit_ragdoll_actor, damaging_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot = nil

		DamageUtils.add_damage_network(hit_unit, attacker_unit, damage_amount, hit_zone_name, damage_type, hit_normal, damage_source, hit_ragdoll_actor, damaging_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot)
	end

	return 
end
local dummy_units = {}
DamageUtils.damage_dummy_unit = function (hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
	local target_settings = damage_profile[target_index] or damage_profile.default_target

	if target_settings then
		local boost_curve = BoostCurves[target_settings.boost_curve_type]
		local damage_amount = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index)
		local damage_type = "destructible_level_object_hit"
		local hit_ragdoll_actor, damaging_unit, buff_attack_type, hit_react_type, added_dot = nil
		local charge_value = damage_profile.charge_value
		local buffed_damage_amount = DamageUtils.apply_buffs_to_damage(damage_amount, hit_unit, attacker_unit, damage_source, dummy_units, damage_type, charge_value)
		local final_damage_amount = DamageUtils.networkify_damage(buffed_damage_amount)
		local color_modifier_red = math.min(120 + final_damage_amount * 4, 255)
		local color_modifier_green = math.max(200 - final_damage_amount * 4, 0)
		local color1 = Vector3(color_modifier_red, color_modifier_green, 0)
		local random_x = math.random(-30, 30) * 0.01
		local text_size = 40 + final_damage_amount * 0.75
		local duration = 2.2

		if is_critical_strike then
			color1[1] = 255
			duration = 3.2
			text_size = text_size + 0.05
		end

		Managers.state.event:trigger("add_damage_number", final_damage_amount, text_size, hit_unit, duration, color1, is_critical_strike)
		DamageUtils.handle_hit_indication(attacker_unit, hit_unit, final_damage_amount, hit_zone_name, added_dot)
		DamageUtils.add_damage_network(hit_unit, attacker_unit, 0, hit_zone_name or "full", damage_type, attack_direction, damage_source, hit_ragdoll_actor, damaging_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot)
		table.clear(dummy_units)

		local hit_anim = nil
		local stagger_type, stagger_duration, stagger_length, stagger_value = DamageUtils.calculate_stagger_dummy(ImpactTypeOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, false)
		local target_settings = damage_profile.targets[target_index] or damage_profile.default_target
		local dot_template_name = target_settings.dot_template_name
		local attack_template_name = target_settings.attack_template
		local attack_template = AttackTemplates[attack_template_name]
		local stagger_angle = attack_template.stagger_angle
		local target_unit_position = POSITION_LOOKUP[hit_unit] or unit_world_position(hit_unit, 0)
		local attacker_position = POSITION_LOOKUP[attacker_unit] or unit_world_position(attacker_unit, 0)

		if stagger_angle == "down" or stagger_angle == "smiter" then
			attack_direction = Vector3.normalize(target_unit_position - attacker_position)
			attack_direction.z = -1
		elseif stagger_angle == "stab" or stagger_angle == "smiter" then
			attack_direction = Vector3.normalize(target_unit_position - attacker_position)
		end

		if attack_template.ranged_stagger then
			if stagger_type == 1 then
				stagger_type = 4
			elseif stagger_type == 2 then
				stagger_type = 5
			end
		end

		local hit_unit_dir = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
		local angle_difference = Vector3.flat_angle(hit_unit_dir, attack_direction)

		if angle_difference < -math.pi * 0.75 or math.pi * 0.75 < angle_difference then
			if stagger_type == 3 then
				hit_anim = "stagger_heavy_fwd"
			else
				hit_anim = "stagger_light_fwd"
			end
		elseif angle_difference < -math.pi * 0.25 then
			if stagger_type == 3 then
				hit_anim = "stagger_heavy_right"
			else
				hit_anim = "stagger_light_right"
			end
		elseif angle_difference < math.pi * 0.25 then
			if stagger_type == 3 then
				hit_anim = "stagger_heavy_bwd"
			else
				hit_anim = "stagger_light_bwd"
			end
		elseif stagger_type == 3 then
			hit_anim = "stagger_heavy_left"
		else
			hit_anim = "stagger_light_left"
		end

		Managers.state.network:anim_event(hit_unit, hit_anim)
	end

	return 
end
script_data.debug_legendary_traits = script_data.debug_legendary_traits or Development.parameter("debug_legendary_traits")
DamageUtils.process_projectile_hit = function (world, damage_source, owner_unit, is_server, raycast_result, current_action, direction, check_buffs, target, ignore_list, is_critical_strike, power_level, override_damage_profile)
	local hit_units = hit_units

	table.clear(hit_units)
	table.clear(hit_data)

	local attack_direction = direction
	local owner_is_player = owner_unit and Managers.player:owner(owner_unit)
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
	local owner_career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
	local amount_of_mass_hit = 0
	local num_penetrations = 0
	local power_level = power_level or DefaultPowerLevel
	local damage_profile_name = override_damage_profile or current_action.damage_profile or "default"
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local cleave_distribution = damage_profile.cleave_distribution or DefaultCleaveDistribution
	local cleave_range = Cleave.max - Cleave.min
	local cleave_power_level = ActionUtils.scale_powerlevels(power_level, "cleave", owner_unit)
	local attack_cleave_power_level = cleave_power_level * cleave_distribution.attack
	local attack_percentage = DamageUtils.get_power_level_percentage(attack_cleave_power_level)
	local max_targets_attack = cleave_range * attack_percentage
	local impact_cleave_power_level = cleave_power_level * cleave_distribution.impact
	local impact_percentage = DamageUtils.get_power_level_percentage(impact_cleave_power_level)
	local max_targets_impact = cleave_range * impact_percentage

	if owner_buff_extension then
		max_targets_attack = owner_buff_extension.apply_buffs_to_value(owner_buff_extension, max_targets_attack, StatBuffIndex.PENETRATING_SHOT_PROC)
		max_targets_impact = owner_buff_extension.apply_buffs_to_value(owner_buff_extension, max_targets_impact, StatBuffIndex.PENETRATING_SHOT_PROC)

		owner_buff_extension.trigger_procs(owner_buff_extension, "on_ranged_hit")
	end

	local has_ranged_boost, boost_curve_multiplier = nil

	if owner_career_extension then
		has_ranged_boost, boost_curve_multiplier = owner_career_extension.has_ranged_boost(owner_career_extension)
	end

	local max_targets = (max_targets_impact < max_targets_attack and max_targets_attack) or max_targets_impact
	local ai_system = Managers.state.entity:system("ai_system")
	local owner_is_bot = owner_is_player and owner_is_player.bot_player
	local is_husk = (owner_is_bot and true) or false
	local hit_effect = current_action.hit_effect
	local critical_hit_effect = current_action.critical_hit_effect
	local num_hits = #raycast_result
	hit_data.hits = num_penetrations
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()

	for i = 1, num_hits, 1 do
		local hit = raycast_result[i]
		local hit_position = hit[INDEX_POSITION]
		local hit_distance = hit[INDEX_DISTANCE]
		local hit_normal = hit[INDEX_NORMAL]
		local hit_actor = hit[INDEX_ACTOR]
		local hit_valid_target = hit_actor ~= nil
		local hit_unit = (hit_valid_target and actor_unit(hit_actor)) or nil

		if unit_alive(hit_unit) then
			hit_unit, hit_actor = DamageUtils.redirect_shield_hit(hit_unit, hit_actor)
		end

		local attack_hit_self = hit_unit == owner_unit

		if not attack_hit_self and hit_valid_target then
			local target_settings = (damage_profile.targets and damage_profile.targets[num_penetrations + 1]) or damage_profile.default_target
			local hit_rotation = Quaternion.look(hit_normal)
			local is_inventory_item = ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system")
			local is_target = hit_unit == target or target == nil
			local breed = unit_get_data(hit_unit, "breed")
			local hit_zone_name = "full"

			if breed then
				local node = actor_node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]
				hit_zone_name = hit_zone.name
			end

			if ignore_list and breed and ignore_list[hit_unit] and hit_zone_name ~= "afro" then
				return hit_data
			end

			local is_player = table.contains(PLAYER_AND_BOT_UNITS, hit_unit)
			local is_character = breed or is_player

			if not is_character then
				local network_manager = Managers.state.network
				local level_index, is_level_unit = network_manager.game_object_or_level_id(network_manager, hit_unit)
				local is_dummy_unit = not is_level_unit and unit_get_data(hit_unit, "is_dummy")
				local has_health_extension = ScriptUnit.has_extension(hit_unit, "health_system")
				local owner = Managers.player:owner(hit_unit)
				local allow_ranged_damage = unit_get_data(hit_unit, "allow_ranged_damage") ~= false

				if is_dummy_unit and not hit_units[hit_unit] then
					hit_units[hit_unit] = true
					local node = actor_node(hit_actor)
					local hit_zone_lookup = HitReactions.templates.dummy.hit_zones

					if hit_zone_lookup then
						hit_zone_name = hit_zone_lookup[node]
					end

					if hit_zone_name == "head" and AiUtils.unit_alive(hit_unit) then
						local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

						first_person_extension.play_hud_sound_event(first_person_extension, "Play_hud_headshot", nil, false)
					end

					amount_of_mass_hit = amount_of_mass_hit + 1
					local target_index = math.ceil(amount_of_mass_hit)

					DamageUtils.damage_dummy_unit(hit_unit, owner_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)

					hit_data.stop = true
					hit_data.hits = num_penetrations + 1

					return hit_data
				elseif is_level_unit and not hit_units[hit_unit] and (GameSettingsDevelopment.allow_ranged_attacks_to_damage_props or allow_ranged_damage) and has_health_extension then
					hit_units[hit_unit] = true
					amount_of_mass_hit = amount_of_mass_hit + 1
					local target_index = math.ceil(amount_of_mass_hit)

					DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)

					hit_data.stop = true
					hit_data.hits = num_penetrations + 1

					return hit_data
				elseif not is_level_unit and allow_ranged_damage and has_health_extension and not owner then
					hit_units[hit_unit] = true
					local network_manager = Managers.state.network
					local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
					local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local weapon_system = Managers.state.entity:system("weapon_system")

					weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike)

					if is_critical_strike and critical_hit_effect then
						EffectHelper.play_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
					else
						EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
					end

					if Managers.state.network:game() then
						if is_critical_strike and critical_hit_effect then
							EffectHelper.remote_play_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_server, hit_actor)
						else
							EffectHelper.remote_play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_server, hit_actor)
						end
					end

					hit_data.stop = true
					hit_data.hits = num_penetrations + 1

					return hit_data
				else
					if current_action.alert_sound_range_hit and owner_unit then
						ai_system.alert_enemies_within_range(ai_system, owner_unit, hit_position, current_action.alert_sound_range_fire)
					end

					if not is_inventory_item then
						local hit_unit_owner = Managers.player:owner(hit_unit)

						if hit_unit_owner == nil or hit_unit_owner.player_unit == nil then
							if is_critical_strike and critical_hit_effect then
								EffectHelper.play_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
							else
								EffectHelper.play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, nil, is_husk, nil, hit_actor)
							end

							if Managers.state.network:game() then
								if is_critical_strike and critical_hit_effect then
									EffectHelper.remote_play_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_server, hit_actor)
								else
									EffectHelper.remote_play_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_server, hit_actor)
								end
							end

							if allow_ranged_damage and hit_unit and unit_alive(hit_unit) and hit_actor then
								local hit_direction = Vector3.multiply(hit_normal, -1)

								unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
								unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
								unit_set_flow_variable(hit_unit, "hit_position", hit_position)
								unit_flow_event(hit_unit, "lua_simple_damage")
							end
						end

						hit_data.stop = true
						hit_data.hits = 1

						return hit_data
					end
				end
			elseif not hit_units[hit_unit] and is_target and ((is_player and (not owner_is_player or DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_is_player))) or breed) then
				local network_manager = Managers.state.network
				local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
				local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
				local hit_zone_name = nil
				local shield_blocked = false

				if breed then
					local node = actor_node(hit_actor)
					local hit_zone = breed.hit_zones_lookup[node]
					hit_zone_name = hit_zone.name

					if hit_zone_name ~= "afro" then
						shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)

						if shield_blocked then
							hit_data.blocked_by_unit = hit_unit
						end

						if owner_is_player and not shield_blocked then
							local _, procced = owner_buff_extension.apply_buffs_to_value(owner_buff_extension, 0, StatBuffIndex.AUTOMATIC_HEAD_SHOT)

							if procced and breed.hit_zones.head then
								hit_zone_name = "head"
							end
						end
					end
				else
					hit_zone_name = "torso"
				end

				if current_action.hit_zone_override and hit_zone_name ~= "afro" then
					hit_zone_name = current_action.hit_zone_override
				end

				if breed and hit_zone_name == "head" and owner_is_player and not shield_blocked then
					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
					local _, procced = owner_buff_extension.apply_buffs_to_value(owner_buff_extension, 0, StatBuffIndex.COOP_STAMINA)

					if (procced or script_data.debug_legendary_traits) and AiUtils.unit_alive(hit_unit) then
						local headshot_coop_stamina_fatigue_type = breed.headshot_coop_stamina_fatigue_type or "headshot_clan_rat"
						local fatigue_type_id = NetworkLookup.fatigue_types[headshot_coop_stamina_fatigue_type]

						if is_server then
							network_manager.network_transmit:send_rpc_clients("rpc_replenish_fatigue_other_players", fatigue_type_id)
						else
							network_manager.network_transmit:send_rpc_server("rpc_replenish_fatigue_other_players", fatigue_type_id)
						end

						StatusUtils.replenish_stamina_local_players(owner_unit, headshot_coop_stamina_fatigue_type)
						first_person_extension.play_hud_sound_event(first_person_extension, "hud_player_buff_headshot", nil, false)
					end

					if AiUtils.unit_alive(hit_unit) then
						first_person_extension.play_hud_sound_event(first_person_extension, "Play_hud_headshot", nil, false)
					end
				end

				local hit_unit_player = Managers.player:owner(hit_unit)

				if hit_zone_name == "afro" then
					local attacker_is_player = Managers.player:owner(owner_unit)

					if attacker_is_player then
						if is_server then
							if ScriptUnit.has_extension(hit_unit, "ai_system") then
								AiUtils.alert_unit_of_enemy(hit_unit, owner_unit)
							end
						else
							local network_manager = Managers.state.network

							network_manager.network_transmit:send_rpc_server("rpc_alert_enemy", hit_unit_id, attacker_unit_id)
						end
					end
				elseif hit_unit_player and hit_actor == unit_actor(hit_unit, "c_afro") then
					local afro_hit_sound = current_action.afro_hit_sound

					if afro_hit_sound and not hit_unit_player.bot_player and Managers.state.network:game() then
						local sound_id = NetworkLookup.sound_events[afro_hit_sound]

						network_manager.network_transmit:send_rpc("rpc_play_first_person_sound", hit_unit_player.peer_id, hit_unit_id, sound_id, hit_position)
					end
				else
					hit_units[hit_unit] = true
					local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
					local attack_template_name = target_settings.attack_template
					local attack_template = AttackTemplates[attack_template_name]

					if owner_is_player and breed and check_buffs and not shield_blocked then
						local send_to_server = true
						local buffs_checked = DamageUtils.buff_on_attack(owner_unit, hit_unit, "instant_projectile", is_critical_strike, hit_zone_name, num_penetrations + 1, send_to_server)
						hit_data.buffs_checked = hit_data.buffs_checked or buffs_checked
					end

					local target_health_extension = ScriptUnit.extension(hit_unit, "health_system")

					if breed and target_health_extension.is_alive(target_health_extension) then
						local action_mass_override = current_action.hit_mass_count

						if action_mass_override and action_mass_override[breed.name] then
							local mass_cost = current_action.hit_mass_count[breed.name]
							amount_of_mass_hit = amount_of_mass_hit + (mass_cost or 1)
						else
							amount_of_mass_hit = amount_of_mass_hit + ((shield_blocked and ((breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank]) or breed.hit_mass_count_block)) or (breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank]) or breed.hit_mass_count or 1)
						end
					end

					local actual_target_index = math.ceil(amount_of_mass_hit)
					local damage_sound = attack_template.sound_type
					local predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index)
					local no_damage = predicted_damage <= 0

					if breed then
						local enemy_type = breed.name

						if is_critical_strike and critical_hit_effect then
							EffectHelper.play_skinned_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked)
						else
							EffectHelper.play_skinned_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked)
						end

						if Managers.state.network:game() then
							if is_critical_strike and critical_hit_effect then
								EffectHelper.remote_play_skinned_surface_material_effects(critical_hit_effect, world, hit_position, hit_rotation, hit_normal, enemy_type, damage_sound, no_damage, hit_zone_name, is_server)
							else
								EffectHelper.remote_play_skinned_surface_material_effects(hit_effect, world, hit_position, hit_rotation, hit_normal, enemy_type, damage_sound, no_damage, hit_zone_name, is_server)
							end
						end
					elseif hit_unit_player and current_action.player_push_velocity then
						local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")
						local no_ranged_knockback = hit_unit_buff_extension and hit_unit_buff_extension.has_buff_perk(hit_unit_buff_extension, "no_ranged_knockback")

						if not no_ranged_knockback then
							local status_extension = ScriptUnit.extension(hit_unit, "status_system")

							if not status_extension.is_disabled(status_extension) then
								local max_impact_push_speed = current_action.max_impact_push_speed
								local locomotion = ScriptUnit.extension(hit_unit, "locomotion_system")

								locomotion.add_external_velocity(locomotion, current_action.player_push_velocity:unbox(), max_impact_push_speed)
							end
						end
					end

					local deal_damage = true
					local owner_unit_alive = unit_alive(owner_unit)

					if owner_unit_alive and hit_unit_player then
						deal_damage = not DamageUtils.check_ranged_block(owner_unit, hit_unit, attack_direction, "blocked_ranged")
					end

					if deal_damage then
						local weapon_system = Managers.state.entity:system("weapon_system")

						weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike)
						EffectHelper.player_critical_hit(world, is_critical_strike, owner_unit, hit_unit, hit_position)

						if not owner_is_player and owner_unit_alive and hit_unit_player and hit_unit_player.bot_player then
							local bot_ai_extension = ScriptUnit.extension(hit_unit, "ai_system")

							bot_ai_extension.hit_by_projectile(bot_ai_extension, owner_unit)
						end
					end

					local target_unit_armor, target_unit_primary_armor = DamageUtils.get_unit_armor(hit_unit, hit_zone_name)

					if no_damage or shield_blocked or target_unit_primary_armor == 6 or target_unit_armor == 2 then
						max_targets = num_penetrations
					else
						num_penetrations = num_penetrations + 1
					end

					if max_targets <= amount_of_mass_hit then
						hit_data.stop = true
						hit_data.hits = num_penetrations

						return hit_data
					end
				end
			end
		end
	end

	return hit_data
end
DamageUtils.pitch_from_rotation = function (rotation)
	local forward = Vector3.normalize(Quaternion.forward(rotation))
	local forward_flat = Vector3.normalize(Vector3.flat(forward))
	local dot = Vector3.dot(forward, forward_flat)
	dot = math.clamp(dot, -1, 1)
	local forward_flat_length = Vector3.length(forward_flat)
	local angle = math.radians_to_degrees(math.acos(dot))
	local up_vector = Vector3(0, 0, 1)
	local up_dot = Vector3.dot(forward, up_vector)

	if up_dot < 0 then
		angle = -angle
	end

	return angle
end
DamageUtils.redirect_shield_hit = function (hit_unit, hit_actor)
	local potential_hit_unit_owner = unit_get_data(hit_unit, "shield_owner_unit")

	if potential_hit_unit_owner then
		local health_extension = ScriptUnit.extension(potential_hit_unit_owner, "health_system")

		if not health_extension.is_alive(health_extension) then
			return hit_unit, hit_actor
		end

		local new_hit_actor = unit_actor(potential_hit_unit_owner, unit_find_actor(potential_hit_unit_owner, "c_leftforearm"))

		return potential_hit_unit_owner, new_hit_actor
	else
		return hit_unit, hit_actor
	end

	return 
end
local modified_boost_curve = {}
DamageUtils.get_modified_boost_curve = function (boost_curve, boost_curve_coefficient)
	table.clear(modified_boost_curve)

	for index, value in ipairs(boost_curve) do
		modified_boost_curve[index] = boost_curve[index] * boost_curve_coefficient
	end

	return modified_boost_curve
end

local function add_stagger_hit(blackboard, t)
	local stagger_immunity = blackboard.stagger_immunity

	if not stagger_immunity then
		return 
	end

	local num_attacks_needed = stagger_immunity.num_attacks
	local num_hits = stagger_immunity.num_hits or 0
	num_hits = num_hits + 1

	if num_hits == num_attacks_needed then
		stagger_immunity.stagger_immune_at = t
		stagger_immunity.stagger_immune_at_health = blackboard.current_health_percent
		stagger_immunity.debug_damage_left = stagger_immunity.damage_threshold
		num_hits = 0
	end

	stagger_immunity.num_hits = num_hits

	return 
end

local function is_stagger_immune(blackboard, t)
	local stagger_immunity = blackboard.stagger_immunity

	if not stagger_immunity then
		return false
	end

	local health_percent = blackboard.current_health_percent
	local health_threshold = stagger_immunity.health_threshold

	if health_threshold and health_threshold < health_percent then
		return true
	end

	local damage_left = 0
	local stagger_immune_at_health = stagger_immunity.stagger_immune_at_health

	if stagger_immune_at_health then
		local damage_threshold = stagger_immunity.damage_threshold
		local damage_accumulated = stagger_immune_at_health - health_percent
		damage_left = damage_threshold - damage_accumulated
		stagger_immunity.debug_damage_left = damage_left
	end

	local time_left = 0
	local stagger_immune_at = stagger_immunity.stagger_immune_at

	if stagger_immune_at then
		local stagger_immune_until = stagger_immune_at + stagger_immunity.time or 0
		time_left = stagger_immune_until - t
	end

	if 0 < damage_left and 0 < time_left then
		return true
	end

	return false
end

local function action_ignores_stagger(blackboard, attack_template, stagger_type)
	local action = blackboard.action
	local ignore_staggers = action and action.ignore_staggers

	if blackboard.anim_cb_stagger_immune then
		return true
	end

	if not ignore_staggers or attack_template.always_stagger then
		return false
	end

	if ignore_staggers.allow_push and attack_template.is_push then
		return false
	end

	local ignore_stagger = ignore_staggers[stagger_type]

	if type(ignore_stagger) == "table" then
		local type = ignore_stagger.type

		if type == "ignore_by_health" then
			local health_percent = blackboard.current_health_percent
			local health_threshold = ignore_stagger.health
			local health_ignore_stagger = health_threshold.min < health_percent and health_percent <= health_threshold.max

			return health_ignore_stagger
		elseif type == "reset_attack" then
			blackboard.reset_attack = true
			blackboard.reset_attack_delay = ignore_stagger.delay

			if script_data.debug_stagger then
				printf("stagger delay: %f type: %d", ignore_stagger.delay, stagger_type)
			end

			return true
		end
	elseif type(ignore_stagger) == "boolean" then
		return ignore_stagger
	else
		error("action_ignores_stagger: unsupported type")
	end

	return 
end

local function ignore_stagger_during_dot(hit_unit, dot_type, dot_template_name, ignore_dot_template_name)
	if ScriptUnit.has_extension(hit_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")
		local has_buff_type = buff_extension.has_buff_type(buff_extension, dot_type)
		local same_dot_template = dot_template_name == ignore_dot_template_name

		if has_buff_type and same_dot_template then
			return true
		end
	end

	return false
end

DamageUtils.stagger_ai = function (t, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocked)
	if not DamageUtils.is_enemy(target_unit) then
		return 
	end

	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")

	if not ai_extension then
		return 
	end

	local blackboard = ai_extension.blackboard(ai_extension)

	if is_stagger_immune(blackboard, t) then
		return 
	end

	local target_settings = damage_profile.targets[target_index] or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = AttackTemplates[attack_template_name]
	local stagger_type, stagger_duration, stagger_length, stagger_value = DamageUtils.calculate_stagger_player(ImpactTypeOutput, target_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, attack_direction)

	if stagger_type == 0 then
		return 
	end

	if action_ignores_stagger(blackboard, attack_template, stagger_type) then
		return 
	end

	add_stagger_hit(blackboard, t)

	local stagger_angle = attack_template.stagger_angle
	local target_unit_position = POSITION_LOOKUP[target_unit] or unit_world_position(target_unit, 0)
	local attacker_position = POSITION_LOOKUP[attacker_unit] or unit_world_position(attacker_unit, 0)

	if stagger_angle == "down" or (stagger_angle == "smiter" and blocked) then
		attack_direction = Vector3.normalize(target_unit_position - attacker_position)
		attack_direction.z = -1
	elseif stagger_angle == "stab" or stagger_angle == "smiter" or blocked then
		attack_direction = Vector3.normalize(target_unit_position - attacker_position)
	end

	if 0 < stagger_type then
		AiUtils.stagger(target_unit, blackboard, attacker_unit, attack_direction, stagger_length, stagger_type, stagger_duration, attack_template.stagger_animation_scale, t, stagger_value, attack_template.always_stagger)
	end

	return 
end
DamageUtils.server_apply_hit = function (t, attacker_unit, target_unit, hit_zone_name, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier)
	if not blocking then
		local attack_power_level = power_level

		if not can_damage then
			attack_power_level = 0
		end

		if damage_profile.charge_value == "heavy_attack" and DamageUtils.is_player_unit(attacker_unit) then
			local status_extension = ScriptUnit.has_extension(attacker_unit, "status_system")

			if status_extension then
				local current_fall_distance = status_extension.fall_distance(status_extension)

				if MinFallDistanceForBonus <= current_fall_distance then
					attack_power_level = attack_power_level * FallingPowerLevelBonusMultiplier
				end
			end
		end

		local added_dot = nil

		if not damage_profile.require_damage_for_dot or attack_power_level ~= 0 then
			added_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
		end

		DamageUtils.add_damage_network_player(damage_profile, target_index, attack_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, backstab_multiplier, added_dot)
	elseif shield_breaking_hit then
		local shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")

		if shield_extension then
			shield_extension.break_shield(shield_extension)
		end

		blocking = false
	end

	local target_alive = AiUtils.unit_alive(target_unit)

	if target_alive and not damage_profile.no_stagger then
		local stagger_power_level = power_level

		if not can_stagger then
			stagger_power_level = 0
		end

		DamageUtils.stagger_ai(t, damage_profile, target_index, stagger_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocking)
	end

	return 
end
DamageUtils.apply_dot = function (damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local dot_template_name = target_settings.dot_template_name or damage_profile.dot_template_name
	local dot_type = DotTypeLookup[dot_template_name]

	if dot_type then
		local dot_func = Dots[dot_type]

		return dot_func(dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
	end

	return false
end

return 
