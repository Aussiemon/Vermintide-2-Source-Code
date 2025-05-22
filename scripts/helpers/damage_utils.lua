-- chunkname: @scripts/helpers/damage_utils.lua

local stagger_types = require("scripts/utils/stagger_types")
local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

DamageUtils = DamageUtils or {}

local BLACKBOARDS = BLACKBOARDS
local PLAYER_TARGET_ARMOR = 4
local POSITION_LOOKUP = POSITION_LOOKUP
local unit_get_data = Unit.get_data
local unit_alive = Unit.alive
local unit_local_position = Unit.local_position
local unit_local_rotation = Unit.local_rotation
local unit_world_position = Unit.world_position
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
local unit_actor = Unit.actor
local unit_has_animation_state_machine = Unit.has_animation_state_machine
local unit_animation_event = Unit.animation_event
local unit_has_animation_event = Unit.has_animation_event
local vector3_distance_squared = Vector3.distance_squared
local actor_position = Actor.position
local actor_unit = Actor.unit
local actor_node = Actor.node
local POISON_DAMAGE_TYPES = {
	aoe_poison_dot = true,
	arrow_poison = true,
	arrow_poison_dot = true,
	poison = true,
}
local POISON_DAMAGE_SOURCES = {
	poison_dot = true,
	skaven_poison_wind_globadier = true,
}

local function is_immune_to_damage(attacked_unit, damage_type, damage_source, charge_value)
	local victim_buff_extension = ScriptUnit.has_extension(attacked_unit, "buff_system")

	if victim_buff_extension then
		if victim_buff_extension:has_buff_perk("invulnerable") or RangedAttackTypes[charge_value] and victim_buff_extension:has_buff_perk("invulnerable_ranged") then
			return true
		end

		local is_poison_damage = POISON_DAMAGE_TYPES[damage_type] or POISON_DAMAGE_SOURCES[damage_source]
		local poison_proof = victim_buff_extension:has_buff_perk("poison_proof")

		return is_poison_damage and poison_proof
	end

	return false
end

DamageUtils.get_breed_damage_multiplier_type = function (breed, hit_zone_name)
	local multiplier_type

	if breed and breed.hitzone_multiplier_types then
		multiplier_type = breed.hitzone_multiplier_types[hit_zone_name]
	end

	return multiplier_type
end

local function get_clamped_curve_value(curve, index)
	if index < 1 then
		return curve[1]
	elseif index >= #curve then
		return curve[#curve]
	else
		return curve[index]
	end
end

DamageUtils.get_boost_curve_multiplier = function (curve, percent)
	local x = (#curve - 1) * percent
	local index = math.floor(x) + 1
	local t = x - math.floor(x)
	local p0 = get_clamped_curve_value(curve, index - 1)
	local p1 = get_clamped_curve_value(curve, index + 0)
	local p2 = get_clamped_curve_value(curve, index + 1)
	local p3 = get_clamped_curve_value(curve, index + 2)
	local a = -p0 / 2 + 3 * p1 / 2 - 3 * p2 / 2 + p3 / 2
	local b = p0 - 5 * p1 / 2 + 2 * p2 - p3 / 2
	local c = -p0 / 2 + p2 / 2
	local d = p1
	local value = a * t * t * t + b * t * t + c * t + d

	return value
end

local function get_head_shot_boost_amount(target_settings, damage_profile, is_finesse_hit, multiplier_type, will_deal_damage, target_unit_armor, target_unit_primary_armor)
	local head_shot_boost_amount = 0

	if is_finesse_hit then
		if will_deal_damage then
			if target_unit_armor == 3 then
				head_shot_boost_amount = target_settings and (target_settings.headshot_boost_boss or target_settings.headshot_boost) or 0.25
			else
				head_shot_boost_amount = target_settings and target_settings.headshot_boost or 0.5
			end
		elseif target_unit_primary_armor == 6 and not will_deal_damage then
			head_shot_boost_amount = target_settings and target_settings.headshot_boost_heavy_armor or 0.25
		elseif target_unit_armor == 2 and not will_deal_damage then
			head_shot_boost_amount = target_settings and (target_settings.headshot_boost_armor or target_settings.headshot_boost) or 0.5
		end

		if multiplier_type == "protected_weakspot" then
			head_shot_boost_amount = head_shot_boost_amount * 0.25
		end
	end

	if multiplier_type == "protected_spot" then
		head_shot_boost_amount = head_shot_boost_amount - 0.5
	end

	return head_shot_boost_amount
end

local function do_damage_calculation(attacker_unit, damage_source, original_power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk, target_max_health, optional_target_unit)
	if damage_profile and damage_profile.no_damage then
		return 0
	end

	local difficulty_settings = DifficultySettings[difficulty_level]
	local power_boost_damage = 0
	local head_shot_boost_damage = 0
	local head_shot_min_damage = 1
	local power_boost_min_damage = 1
	local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name)
	local is_finesse_hit = multiplier_type == "headshot" or multiplier_type == "weakspot" or multiplier_type == "protected_weakspot"

	if is_finesse_hit or is_critical_strike or has_power_boost or boost_damage_multiplier and boost_damage_multiplier > 0 then
		local power_boost_armor

		power_boost_armor = (target_unit_armor == 2 or target_unit_armor == 5 or target_unit_armor == 6) and 1 or target_unit_armor

		local power_boost_target_damages = damage_output[power_boost_armor] or power_boost_armor == 0 and 0 or damage_output[1]
		local preliminary_boost_damage

		if type(power_boost_target_damages) == "table" then
			local power_boost_damage_range = power_boost_target_damages.max - power_boost_target_damages.min
			local power_boost_attack_power, _ = ActionUtils.get_power_level_for_target(optional_target_unit, original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, power_boost_armor, damage_source, breed, range_scalar_multiplier, difficulty_level, target_unit_armor, target_unit_primary_armor)
			local power_boost_percentage = ActionUtils.get_power_level_percentage(power_boost_attack_power)

			preliminary_boost_damage = power_boost_target_damages.min + power_boost_damage_range * power_boost_percentage
		else
			preliminary_boost_damage = power_boost_target_damages
		end

		if is_finesse_hit then
			head_shot_min_damage = preliminary_boost_damage * 0.5
		end

		if is_critical_strike then
			head_shot_min_damage = preliminary_boost_damage * 0.5
		end

		if has_power_boost or boost_damage_multiplier and boost_damage_multiplier > 0 then
			power_boost_damage = preliminary_boost_damage
		end
	end

	local damage, target_damages

	if type(damage_output) == "table" then
		local armor_type = target_unit_primary_armor or target_unit_armor

		target_damages = damage_output[armor_type] or armor_type == 0 and 0 or damage_output[1]
	else
		target_damages = damage_output
	end

	if type(target_damages) == "table" then
		local damage_range = target_damages.max - target_damages.min
		local percentage = 0

		if damage_profile then
			local attack_power, _ = ActionUtils.get_power_level_for_target(optional_target_unit, original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, nil, damage_source, breed, range_scalar_multiplier, difficulty_level, target_unit_armor, target_unit_primary_armor)

			percentage = ActionUtils.get_power_level_percentage(attack_power)
		end

		damage = target_damages.min + damage_range * percentage
	else
		damage = target_damages
	end

	local backstab_damage

	if backstab_multiplier then
		backstab_damage = power_boost_damage and damage < power_boost_damage and power_boost_damage * (backstab_multiplier - 1) or damage * (backstab_multiplier - 1)
	end

	if not static_base_damage then
		local target_settings = damage_profile and (damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target)
		local power_boost_amount = 0
		local head_shot_boost_amount = get_head_shot_boost_amount(target_settings, damage_profile, is_finesse_hit, multiplier_type, damage > 0, target_unit_armor, target_unit_primary_armor)

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

		if boost_damage_multiplier and boost_damage_multiplier > 0 then
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

		if multiplier_type == "protected_spot" then
			power_boost_amount = power_boost_amount - 0.5
		end

		if damage_profile and damage_profile.no_headshot_boost then
			head_shot_boost_amount = 0
		end

		local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
		local crit_boost = 0

		if is_critical_strike then
			crit_boost = damage_profile and damage_profile.crit_boost or 0.5

			if damage_profile and damage_profile.no_crit_boost then
				crit_boost = 0
			end

			if attacker_buff_extension and attacker_buff_extension:has_buff_perk("no_crit_damage") then
				crit_boost = 0
			end
		end

		if boost_curve and (power_boost_amount > 0 or head_shot_boost_amount > 0 or crit_boost > 0) then
			local modified_boost_curve, modified_boost_curve_head_shot
			local boost_coefficient = target_settings and target_settings.boost_curve_coefficient or DefaultBoostCurveCoefficient
			local boost_coefficient_headshot = target_settings and target_settings.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient

			if boost_damage_multiplier and boost_damage_multiplier > 0 then
				if breed and breed.boost_curve_multiplier_override then
					boost_damage_multiplier = math.clamp(boost_damage_multiplier, 0, breed.boost_curve_multiplier_override)
				end

				boost_coefficient = boost_coefficient * boost_damage_multiplier
				boost_coefficient_headshot = boost_coefficient_headshot * boost_damage_multiplier
			end

			if power_boost_amount > 0 then
				modified_boost_curve = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient)
				power_boost_amount = math.clamp(power_boost_amount, 0, 1)

				local boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve or boost_curve, power_boost_amount)

				power_boost_damage = math.max(math.max(power_boost_damage, damage), power_boost_min_damage) * boost_multiplier
			end

			if head_shot_boost_amount > 0 or crit_boost > 0 then
				modified_boost_curve_head_shot = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient_headshot)
				head_shot_boost_amount = math.clamp(head_shot_boost_amount + crit_boost, 0, 1)

				local head_shot_boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve_head_shot or boost_curve, head_shot_boost_amount)

				head_shot_boost_damage = math.max(math.max(power_boost_damage, damage), head_shot_min_damage) * head_shot_boost_multiplier

				if attacker_buff_extension and is_critical_strike then
					head_shot_boost_damage = head_shot_boost_damage * attacker_buff_extension:apply_buffs_to_value(1, "critical_strike_effectiveness")
				end

				if attacker_buff_extension and is_finesse_hit then
					head_shot_boost_damage = head_shot_boost_damage * attacker_buff_extension:apply_buffs_to_value(1, "headshot_multiplier")
				end

				local target_unit_buff_extension = ScriptUnit.has_extension(optional_target_unit, "buff_system")

				if target_unit_buff_extension and is_finesse_hit then
					head_shot_boost_damage = head_shot_boost_damage * target_unit_buff_extension:apply_buffs_to_value(1, "headshot_vulnerability")
				end
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
			head_shot_boost_damage = head_shot_boost_damage * 0.5
			backstab_damage = backstab_damage and backstab_damage * 0.75
		end

		if breed and breed.lord_damage_reduction then
			damage = damage * 0.2
			power_boost_damage = power_boost_damage * 0.25
			head_shot_boost_damage = head_shot_boost_damage * 0.25
			backstab_damage = backstab_damage and backstab_damage * 0.5
		end

		damage = damage + power_boost_damage + head_shot_boost_damage

		if backstab_damage then
			damage = damage + backstab_damage
		end

		if attacker_buff_extension then
			if multiplier_type == "headshot" then
				damage = attacker_buff_extension:apply_buffs_to_value(damage, "headshot_damage")
			else
				damage = attacker_buff_extension:apply_buffs_to_value(damage, "non_headshot_damage")
			end
		end

		local killing_blow_triggered

		if is_critical_strike then
			if hit_zone_name == "head" and has_crit_head_shot_killing_blow_perk then
				killing_blow_triggered = true
			elseif backstab_multiplier and backstab_multiplier > 1 and has_crit_backstab_killing_blow_perk and damage_profile.charge_value == "heavy_attack" then
				killing_blow_triggered = true
			end
		end

		if killing_blow_triggered and breed then
			local boss = breed.boss
			local primary_armor = breed.primary_armor_category

			if not boss and not primary_armor then
				if target_max_health then
					damage = target_max_health
				else
					local breed_health_table = breed.max_health
					local difficulty_rank = difficulty_settings.rank
					local breed_health = breed_health_table[difficulty_rank] or breed_health_table[2]

					damage = breed_health
				end
			end
		end
	end

	if is_friendly_fire then
		local friendly_fire_multiplier = difficulty_settings.friendly_fire_multiplier or 0
		local mechanism_ok, custom_setting_difficulty_override, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "friendly_fire")

		if mechanism_ok and custom_settings_enabled and custom_setting_difficulty_override then
			local is_dark_pact_attacker = Managers.state.side:versus_is_dark_pact(attacker_unit) or Managers.state.side:versus_is_dark_pact(damage_source)

			if not is_dark_pact_attacker then
				difficulty_settings = DifficultySettings[custom_setting_difficulty_override]
				friendly_fire_multiplier = difficulty_settings and difficulty_settings.friendly_fire_multiplier or 0
			end
		end

		if damage_profile and damage_profile.friendly_fire_multiplier then
			friendly_fire_multiplier = friendly_fire_multiplier * damage_profile.friendly_fire_multiplier
		end

		damage = damage * friendly_fire_multiplier
	end

	local heavy_armor_damage = false

	return damage, heavy_armor_damage
end

local function apply_buffs_to_stagger_damage(attacker_unit, target_index, hit_zone, is_critical_strike, stagger_number)
	local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
	local new_stagger_number = stagger_number

	if attacker_buff_extension then
		local finesse_perk = attacker_buff_extension:has_buff_perk("finesse_stagger_damage")
		local smiter_perk = attacker_buff_extension:has_buff_perk("smiter_stagger_damage")
		local mainstay_perk = attacker_buff_extension:has_buff_perk("linesman_stagger_damage")

		if mainstay_perk and new_stagger_number > 0 then
			new_stagger_number = new_stagger_number + 1
		elseif (is_critical_strike or hit_zone == "head" or hit_zone == "neck") and finesse_perk then
			new_stagger_number = 2
		elseif smiter_perk then
			if target_index and target_index <= 1 then
				new_stagger_number = math.max(1, new_stagger_number)
			else
				new_stagger_number = stagger_number
			end
		end
	end

	return new_stagger_number
end

DamageUtils.calculate_damage_tooltip = function (attacker_unit, damage_source, original_power_level, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor)
	local damage_output = DamageOutput
	local static_base_damage = false
	local is_friendly_fire = false
	local has_crit_head_shot_killing_blow_perk = false
	local has_crit_backstab_killing_blow_perk = false
	local calculated_damage = do_damage_calculation(attacker_unit, damage_source, original_power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk)

	calculated_damage = DamageUtils.networkify_damage(calculated_damage)

	return calculated_damage
end

DamageUtils.calculate_dot_buff_damage = function (target_unit, attacker_unit, hit_zone, damage_source, power_level, damage_profile_name, template)
	hit_zone = hit_zone or "full"

	local power_level = power_level or DefaultPowerLevel
	local is_critical_strike = false

	damage_profile_name = damage_profile_name or "default"

	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local boost_curve_type = damage_profile.default_target.boost_curve_type
	local boost_curve = BoostCurves[boost_curve_type]
	local boost_curve_multiplier = 0
	local target_index, backstab_multiplier

	damage_source = damage_source or "dot_debuff"

	return DamageUtils.calculate_damage(DamageOutput, target_unit, attacker_unit, hit_zone, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
end

DamageUtils.calculate_damage = function (damage_output, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve, boost_damage_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local breed, armor_override, unit_max_health

	if target_unit then
		breed = AiUtils.unit_breed(target_unit)
		armor_override = unit_get_data(target_unit, "armor")

		local target_unit_health_extension = ScriptUnit.has_extension(target_unit, "health_system")
		local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")
		local is_invincible = target_unit_health_extension and target_unit_health_extension:get_is_invincible()

		if not is_invincible and target_buff_extension then
			if target_buff_extension:has_buff_perk("invulnerable") then
				is_invincible = true
			elseif target_buff_extension:has_buff_perk("invulnerable_ranged") then
				local charge_value = damage_profile and damage_profile.charge_value

				is_invincible = RangedAttackTypes[charge_value]
			end
		end

		if is_invincible then
			return 0, is_invincible
		end

		if target_unit_health_extension then
			unit_max_health = target_unit_health_extension:get_max_health()
		elseif breed then
			local breed_health_table = breed.max_health
			local difficulty_rank = difficulty_settings.rank
			local breed_health = breed_health_table[difficulty_rank] or breed_health_table[2]

			unit_max_health = breed_health
		end
	end

	local attacker_breed

	if attacker_unit then
		attacker_breed = Unit.get_data(attacker_unit, "breed")
	end

	local static_base_damage = not attacker_breed or not attacker_breed.is_player
	local is_friendly_fire = not static_base_damage and Managers.state.side:is_ally(attacker_unit, target_unit)
	local target_is_hero = breed and breed.is_hero
	local range_scalar_multiplier = 0

	if damage_profile and not static_base_damage then
		local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target

		range_scalar_multiplier = ActionUtils.get_range_scalar_multiplier(damage_profile, target_settings, attacker_unit, target_unit)
	end

	local buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
	local has_power_boost = false
	local has_crit_head_shot_killing_blow_perk = false
	local has_crit_backstab_killing_blow_perk = false

	if buff_extension then
		has_power_boost = buff_extension:has_buff_perk("potion_armor_penetration")
		has_crit_head_shot_killing_blow_perk = buff_extension:has_buff_perk("crit_headshot_killing_blow")
		has_crit_backstab_killing_blow_perk = buff_extension:has_buff_perk("crit_backstab_killing_blow")
	end

	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local target_unit_armor, target_unit_primary_armor, _

	if target_is_hero then
		target_unit_armor = PLAYER_TARGET_ARMOR
	else
		target_unit_armor, _, target_unit_primary_armor, _ = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)
	end

	local calculated_damage = do_damage_calculation(attacker_unit, damage_source, original_power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, target_unit_armor, target_unit_primary_armor, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk, unit_max_health, target_unit)

	if damage_profile and not damage_profile.is_dot then
		local blackboard = BLACKBOARDS[target_unit]
		local stagger_number = 0

		if blackboard then
			local ignore_stagger_damage_reduction = damage_profile.no_stagger_damage_reduction or breed.no_stagger_damage_reduction
			local min_stagger_number = 0
			local max_stagger_number = 2

			stagger_number = blackboard.is_climbing and 2 or math.min(blackboard.stagger or min_stagger_number, max_stagger_number)

			if damage_profile.no_stagger_damage_reduction_ranged then
				local stagger_number_override = 1

				stagger_number = math.max(stagger_number_override, stagger_number)
			end

			if not damage_profile.no_stagger_damage_reduction_ranged then
				stagger_number = apply_buffs_to_stagger_damage(attacker_unit, target_index, hit_zone_name, is_critical_strike, stagger_number)
			end
		end

		local min_stagger_damage_coefficient = difficulty_settings.min_stagger_damage_coefficient
		local stagger_damage_multiplier = difficulty_settings.stagger_damage_multiplier

		if stagger_damage_multiplier then
			local bonus_damage_percentage = stagger_number * stagger_damage_multiplier
			local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

			if target_buff_extension and not damage_profile.no_stagger_damage_reduction_ranged then
				bonus_damage_percentage = target_buff_extension:apply_buffs_to_value(bonus_damage_percentage, "unbalanced_damage_taken")
			end

			local stagger_damage = calculated_damage * (min_stagger_damage_coefficient + bonus_damage_percentage)

			calculated_damage = stagger_damage
		end
	end

	local weave_manager = Managers.weave

	if target_is_hero and static_base_damage and weave_manager:get_active_weave() then
		local scaling_value = weave_manager:get_scaling_value("enemy_damage")

		calculated_damage = calculated_damage * (1 + scaling_value)
	end

	return calculated_damage
end

local function do_stagger_calculation(stagger_table, breed, blackboard, attacker_unit, target_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, damage_source, range_scalar_multiplier, ai_shield_extension, difficulty_level, shield_user, has_power_boost, override_target_armor)
	local target_unit_armor = override_target_armor or breed.stagger_armor_category or breed.armor_category or 1
	local stagger_type = stagger_types.none
	local stagger_strength = 0
	local duration = 1
	local distance = 1
	local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")

	if attacker_buff_extension then
		attacker_buff_extension:trigger_procs("stagger_calculation_started", target_unit)
	end

	local target_buff_extension = target_unit and ScriptUnit.has_extension(target_unit, "buff_system")
	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = DamageUtils.get_attack_template(attack_template_name)
	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local is_player = blackboard.is_player and not ai_extension
	local is_ranged
	local optional_modifier_data = FrameTable.alloc_table()

	optional_modifier_data.damage_profile = damage_profile

	if breed then
		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template

		if weapon_template_name then
			local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)
			local buff_type = weapon_template and weapon_template.buff_type

			is_ranged = buff_type and RangedBuffTypes[buff_type]
			optional_modifier_data.is_ranged = is_ranged
		end
	end

	optional_modifier_data.is_ranged = is_ranged

	local custom_setting_dark_pact_stagger_immunity = false
	local mechanism_ok, custom_setting_pactsworn_stagger_immunity, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "pactsworn_stagger_immunity")

	if mechanism_ok and custom_settings_enabled and custom_setting_pactsworn_stagger_immunity then
		local career_extension = ScriptUnit.has_extension(target_unit, "career_system")

		if career_extension then
			local profile_index = career_extension:profile_index()
			local profile = SPProfiles[profile_index]

			if profile.affiliation == "dark_pact" then
				custom_setting_dark_pact_stagger_immunity = true
			end
		end
	end

	local stagger_count = is_player and status_extension and status_extension:stagger_count() or blackboard.stagger_count or 0

	if hit_zone_name == "weakspot" and stagger_count == 0 and (not blackboard.stagger or blackboard.stagger_anim_done or is_player and not status_extension:accumulated_stagger()) then
		stagger_type = stagger_types.weakspot
	elseif stagger_table and not breed.stagger_immune and not custom_setting_dark_pact_stagger_immunity then
		local stagger_settings = stagger_table[target_unit_armor]
		local stagger_range = stagger_settings.max - stagger_settings.min
		local _, impact_power = ActionUtils.get_power_level_for_target(target_unit, original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, nil, damage_source, breed, range_scalar_multiplier, difficulty_level, target_unit_armor, nil)

		if attacker_unit and unit_alive(attacker_unit) and attacker_buff_extension then
			impact_power = attacker_buff_extension:apply_buffs_to_value(impact_power, "push_power")

			local blackboard_action = is_player and status_extension:breed_action() or blackboard.action

			if blackboard_action and blackboard_action.damage then
				impact_power = attacker_buff_extension:apply_buffs_to_value(impact_power, "counter_push_power")
			end
		end

		if attacker_buff_extension then
			impact_power = attacker_buff_extension:apply_buffs_to_value(impact_power, "power_level_impact")
		end

		if target_buff_extension then
			impact_power = target_buff_extension:apply_buffs_to_value(impact_power, "impact_vulnerability")
		end

		local percentage = ActionUtils.get_power_level_percentage(impact_power)

		stagger_strength = stagger_range * percentage

		local finesse_hit = is_critical_strike or hit_zone_name == "head" or hit_zone_name == "neck"

		stagger_strength = stagger_settings.min + stagger_strength

		if has_power_boost then
			stagger_strength = stagger_strength * 2
		end

		if breed then
			local difficulty_rank = DifficultySettings[difficulty_level].rank
			local stagger_resistance = breed.diff_stagger_resist and (breed.diff_stagger_resist[difficulty_rank] or breed.diff_stagger_resist[2]) or is_ranged and breed.stagger_resistance_ranged or breed.stagger_resistance or 2

			if target_buff_extension then
				stagger_resistance = target_buff_extension:apply_buffs_to_value(stagger_resistance, "stagger_resistance")
			end

			local enemy_current_action = is_player and status_extension:breed_action() or blackboard.action
			local action_stagger_reduction = enemy_current_action and enemy_current_action.stagger_reduction
			local stagger_reduction = not finesse_hit and not damage_profile.ignore_stagger_reduction and (action_stagger_reduction or breed.stagger_reduction)

			if stagger_reduction and type(stagger_reduction) == "table" then
				stagger_reduction = stagger_reduction[difficulty_rank] or stagger_reduction[2]
			end

			if stagger_reduction then
				stagger_strength = math.clamp(stagger_strength - stagger_reduction, 0, stagger_strength)
			end

			local first_push = false

			if blackboard.stagger then
				local stagger_bonus = math.clamp(blackboard.stagger * (breed.stagger_multiplier or 0.5) * stagger_strength, 0, stagger_strength)

				stagger_strength = stagger_strength + stagger_bonus
			elseif is_player and status_extension and status_extension:accumulated_stagger() > 0 then
				local stagger_tmp = status_extension:accumulated_stagger()
				local stagger_bonus = math.clamp(stagger_tmp * (breed.stagger_multiplier or 0.5) * stagger_strength, 0, stagger_strength)

				stagger_strength = stagger_strength + stagger_bonus
			elseif damage_profile.is_push then
				first_push = true
			end

			if stagger_strength > 0 then
				local no_light_threshold = finesse_hit
				local stagger_threshold_light = breed.stagger_threshold_light and breed.stagger_threshold_light * stagger_resistance or 0.25 * stagger_resistance
				local stagger_threshold_medium = breed.stagger_threshold_medium and breed.stagger_threshold_medium * stagger_resistance or 1 * stagger_resistance
				local stagger_threshold_heavy = breed.stagger_threshold_heavy and breed.stagger_threshold_heavy * stagger_resistance or 2.5 * stagger_resistance

				if first_push then
					stagger_threshold_heavy = stagger_threshold_heavy * 2
				end

				local stagger_threshold_explosion = breed.stagger_threshold_explosion and breed.stagger_threshold_explosion * stagger_resistance or 10 * stagger_resistance
				local excessive_force = 0
				local scale
				local impact_modifier = 1

				if stagger_strength < stagger_threshold_light then
					stagger_type = stagger_types.none
				elseif stagger_strength < stagger_threshold_medium then
					stagger_type = stagger_types.weak
					excessive_force = stagger_strength
					scale = excessive_force > 0 and excessive_force / stagger_resistance or 0
					impact_modifier = 0.5 + 0.5 * math.clamp(scale, 0, 1)
				elseif stagger_strength < stagger_threshold_heavy then
					stagger_type = stagger_types.medium
					excessive_force = stagger_strength - stagger_threshold_medium
					scale = excessive_force > 0 and excessive_force / stagger_resistance or 0
					impact_modifier = 0.5 + 0.5 * math.clamp(scale, 0, 1)
				elseif stagger_strength < stagger_threshold_explosion then
					stagger_type = stagger_types.heavy
					excessive_force = stagger_strength - stagger_threshold_heavy
					scale = excessive_force > 0 and excessive_force / stagger_resistance or 0
					impact_modifier = 0.5 + 0.5 * math.clamp(scale, 0, 1)
				elseif damage_profile.is_explosion then
					stagger_type = stagger_types.explosion
				elseif damage_profile.is_pull then
					stagger_type = stagger_types.pulling
				else
					stagger_type = stagger_types.heavy
				end

				if breed.stagger_duration_difficulty_mod then
					local stagger_duration_difficulty_table = breed.stagger_duration_difficulty_mod
					local breed_duration_modifier = stagger_duration_difficulty_table[difficulty_rank] or stagger_duration_difficulty_table[2] or 1

					duration = duration * breed_duration_modifier
				end

				local time_modifier = 0.75 + 0.25 * math.clamp(excessive_force / stagger_resistance, 0, 2)

				duration = duration * time_modifier
				distance = math.clamp(distance * impact_modifier, 0.5, 1)
			end
		end
	end

	if damage_profile.is_pull and stagger_type <= stagger_types.heavy then
		stagger_type = stagger_types.pulling
	end

	if attack_template.ranged_stagger then
		if stagger_type == stagger_types.weak then
			stagger_type = stagger_types.ranged_weak
		elseif stagger_type == stagger_types.medium then
			stagger_type = stagger_types.ranged_medium
		end
	end

	local stagger_value = attack_template and attack_template.stagger_value or 1

	optional_modifier_data.stagger_value = stagger_value

	local skip_block_stagger_override

	if breed.stagger_modifier_function then
		stagger_type, duration, distance, skip_block_stagger_override = breed.stagger_modifier_function(stagger_type, duration, distance, hit_zone_name, blackboard, breed, optional_modifier_data)
	end

	if blocked then
		if ai_shield_extension then
			ai_shield_extension.blocked_previous_attack = true
		end

		if stagger_type == stagger_types.none and not skip_block_stagger_override then
			stagger_type = stagger_types.weak
		elseif stagger_type == stagger_types.heavy and stagger_value == 1 then
			stagger_type = stagger_types.medium
		end
	end

	if breed.boss_staggers and (stagger_type < stagger_types.explosion or stagger_type == stagger_types.pulling) or breed.small_boss_staggers and stagger_type == stagger_types.pulling then
		stagger_type = stagger_types.none
	end

	local action = is_player and status_extension:breed_action() or blackboard.action
	local ignore_staggers = action and action.ignore_staggers

	if ignore_staggers and attacker_buff_extension and attacker_buff_extension:has_buff_type("push_increase") then
		ignore_staggers = false
	end

	if (not attack_template.always_stagger or breed.boss) and ignore_staggers and ignore_staggers[stagger_type] and (not ignore_staggers.allow_push or not attack_template or not attack_template.is_push) then
		return stagger_types.none, 0, 0, 0, 0
	end

	if breed.no_stagger_duration and not attack_template.always_stagger then
		duration = duration * 0.25
	end

	if attacker_buff_extension and attacker_buff_extension:has_buff_perk("explosive_stagger") then
		stagger_type = stagger_types.explosion
	end

	local stagger_duration_modifier = target_settings.stagger_duration_modifier or damage_profile.stagger_duration_modifier or DefaultStaggerDurationModifier
	local stagger_distance_modifier = target_settings.stagger_distance_modifier or damage_profile.stagger_distance_modifier or DefaultStaggerDistanceModifier
	local stagger_duration_table = breed.stagger_duration and breed.stagger_duration[stagger_type] or DefaultStaggerDuration

	duration = duration * stagger_duration_table * stagger_duration_modifier
	distance = distance * stagger_distance_modifier

	if target_buff_extension then
		distance = target_buff_extension:apply_buffs_to_value(distance, "stagger_distance")
	end

	if attacker_buff_extension then
		distance = attacker_buff_extension:apply_buffs_to_value(distance, "applied_stagger_distance")
	end

	if not breed.no_random_stagger_duration then
		duration = math.max(duration + math.random() * 0.25, 0)
	end

	if breed.max_stagger_duration then
		duration = math.min(duration, breed.max_stagger_duration)
	end

	if damage_profile.is_pull and target_unit then
		local target_position = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)
		local attacker_position = POSITION_LOOKUP[attacker_unit] or Unit.world_position(attacker_unit, 0)
		local closest_distance = Vector3.length(target_position - attacker_position) - 2.25

		distance = math.max(math.min(distance, closest_distance), 0)
	end

	if attacker_buff_extension then
		attacker_buff_extension:trigger_procs("stagger_calculation_ended", target_unit)
	end

	return stagger_type, duration, distance, stagger_value, stagger_strength
end

local EMPTY_TABLE = {}

DamageUtils.calculate_stagger_player_tooltip = function (breed, attacker_unit, hit_zone_name, original_power_level, is_critical_strike, damage_profile, target_index, blocked, damage_source, difficulty_level, has_power_boost, range_scalar_multiplier, target_armor_type)
	local stagger_table = ImpactTypeOutput

	breed = breed or EMPTY_TABLE

	local blackboard = EMPTY_TABLE
	local target_unit
	local shield_user = false
	local ai_shield_extension, boost_curve_multiplier
	local stagger_type, stagger_duration, stagger_distance, stagger_value, stagger_strength = do_stagger_calculation(stagger_table, breed, blackboard, attacker_unit, target_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, damage_source, range_scalar_multiplier, ai_shield_extension, difficulty_level, shield_user, has_power_boost, target_armor_type)

	return stagger_type, stagger_duration, stagger_distance, stagger_value, stagger_strength
end

DamageUtils.calculate_stagger_player = function (stagger_table, target_unit, attacker_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, damage_source)
	local blackboard = BLACKBOARDS[target_unit]
	local breed = blackboard.breed
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local shield_user = AiUtils.shield_user(target_unit)
	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local range_scalar_multiplier = ActionUtils.get_range_scalar_multiplier(damage_profile, target_settings, attacker_unit, target_unit)
	local ai_shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")
	local has_power_boost = false

	if attacker_unit and unit_alive(attacker_unit) then
		local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if attacker_buff_extension then
			has_power_boost = attacker_buff_extension:has_buff_perk("potion_armor_penetration")
		end
	end

	local stagger_type, stagger_duration, stagger_distance, stagger_value, stagger_strength = do_stagger_calculation(stagger_table, breed, blackboard, attacker_unit, target_unit, hit_zone_name, original_power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, damage_source, range_scalar_multiplier, ai_shield_extension, difficulty_level, shield_user, has_power_boost)

	return stagger_type, stagger_duration, stagger_distance, stagger_value, stagger_strength
end

DamageUtils.calculate_stagger = function (impact_table, duration_table, target_unit, attacker_unit, attack_template, hit_zone_name, blocked)
	local blackboard = BLACKBOARDS[target_unit]
	local breed = blackboard.breed
	local target_unit_armor = breed.stagger_armor_category or breed.armor_category or 1
	local shield_user = AiUtils.shield_user(target_unit)
	local stagger_type = stagger_types.none
	local duration = 0.5
	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local is_player = blackboard.is_player and not ai_extension

	if hit_zone_name == "weakspot" and blackboard.stagger_count == 0 and (not blackboard.stagger or blackboard.stagger_anim_done) then
		stagger_type = stagger_types.weakspot
	elseif impact_table then
		stagger_type = impact_table[target_unit_armor] or impact_table[1]
	end

	local stagger_value = attack_template and attack_template.stagger_value or 1

	if blocked then
		if stagger_type == stagger_types.none then
			stagger_type = stagger_types.weak
		elseif stagger_type == stagger_types.heavy and stagger_value == 1 then
			stagger_type = stagger_types.medium
		end
	end

	if breed.boss_staggers and stagger_type < stagger_types.explosion then
		stagger_type = stagger_types.none
	end

	local action = is_player and status_extension:breed_action() or blackboard.action
	local ignore_staggers = action and action.ignore_staggers

	if ignore_staggers then
		local owner_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if owner_buff_extension and owner_buff_extension:has_buff_type("push_increase") then
			ignore_staggers = false
		end
	end

	if ignore_staggers and ignore_staggers[stagger_type] and (not ignore_staggers.allow_push or not attack_template or not attack_template.is_push) then
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
		duration = math.max(duration + math.random() - 0.5, 0)
	end

	return stagger_type, duration
end

DamageUtils.is_player_unit = function (unit)
	return Managers.player:is_player_unit(unit)
end

DamageUtils.stagger_player = function (unit, breed, stagger_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, stagger_value, always_stagger, is_push, should_play_push_sound)
	fassert(stagger_type > 0, "Tried to use invalid stagger type %q", stagger_type)

	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_modifier = difficulty_settings.stagger_modifier
	local status_extension = ScriptUnit.has_extension(unit, "status_system")
	local breed_action = status_extension:breed_action()
	local breed_action_immunity = breed_action and breed_action.stagger_prohibited

	if breed_action_immunity or status_extension:get_in_ghost_mode() then
		return
	end

	stagger_value = stagger_value or 1
	stagger_animation_scale = stagger_animation_scale or 1

	local stagger_time = stagger_duration * difficulty_modifier
	local accumulated_stagger = status_extension:accumulated_stagger()
	local accumulated_clamped = math.clamp(accumulated_stagger and accumulated_stagger + stagger_value or stagger_value, 0, 2)

	accumulated_stagger = math.max(accumulated_clamped, accumulated_stagger)

	status_extension:set_stagger_values(stagger_type, stagger_direction, stagger_length, accumulated_stagger, stagger_time, stagger_animation_scale, always_stagger, true)

	if should_play_push_sound then
		local push_sound_event = breed.push_sound_event or "Play_generic_pushed_impact_small"

		Managers.state.entity:system("audio_system"):play_audio_unit_event(push_sound_event, unit)
	end
end

DamageUtils.hit_zone = function (unit, actor)
	local breed = AiUtils.unit_breed(unit)

	if breed then
		local node = actor_node(actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone.name

		return hit_zone_name
	else
		return "full"
	end
end

DamageUtils.aoe_hit_zone = function (unit, actor)
	local breed = AiUtils.unit_breed(unit)

	if breed then
		local node = actor_node(actor)
		local hit_zone = breed.hit_zones_lookup[node]
		local hit_zone_name = hit_zone and hit_zone.name

		return hit_zone_name == "afro" and "afro" or "torso"
	else
		return "full"
	end
end

DamageUtils.draw_aoe_size = function (target_unit, breed)
	local radius, height = DamageUtils.calculate_aoe_size(target_unit)
	local unit_position = POSITION_LOOKUP[target_unit]
	local unit_top_position = unit_position + Vector3(0, 0, math.max(height - radius * 0.5, height * 0.5))
	local unit_bottom_position = unit_position + Vector3(0, 0, math.min(radius * 0.5, height * 0.5))

	QuickDrawer:capsule(unit_bottom_position, unit_top_position, radius, Color(255, 255, 0, 255))
end

DamageUtils.calculate_aoe_size = function (target_unit, breed)
	local radius, height

	if breed then
		radius = breed.aoe_radius or DEFAULT_BREED_AOE_RADIUS
		height = breed.aoe_height or DEFAULT_BREED_AOE_HEIGHT
	elseif DamageUtils.is_player_unit(target_unit) then
		radius = 0.3
		height = 1.7
	else
		radius = 1
		height = 1
	end

	return radius, height
end

local AOE_TARGET_UNITS = {}
local AOE_TARGET_ARRAY = {}
local AOE_SIMPLE_DAMAGE_UNITS = {}

DamageUtils.create_explosion = function (world, attacker_unit, impact_position, rotation, explosion_template, scale, damage_source, is_server, is_husk, damaging_unit, attacker_power_level, is_critical_strike, source_attacker_unit)
	local DamageUtils = DamageUtils
	local explosion_data = explosion_template.explosion
	local active_wind = Managers.weave:get_active_wind()
	local wind_settings = Managers.weave:get_active_wind_settings()
	local wind_mutator = explosion_data.wind_mutator

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
		local explosion_rotation = explosion_data.dont_rotate_fx and Quaternion.identity() or rotation

		World.create_particles(world, explosion_data.effect_name, impact_position, explosion_rotation)
	end

	if explosion_data.sound_event_name then
		local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(world, impact_position)
		local husk = is_husk and "true" or "false"

		WwiseWorld.set_switch(wwise_world, "husk", husk, wwise_source_id)
		WwiseWorld.trigger_event(wwise_world, explosion_data.sound_event_name, wwise_source_id)
	end

	local facing_explosion = false

	if explosion_data.only_facing then
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if local_player_unit then
			local unit_pos = Unit.local_position(attacker_unit, 0)
			local hit_unit_pos = POSITION_LOOKUP[local_player_unit]
			local player_rot = Unit.local_rotation(local_player_unit, 0)
			local _, _, nr = Quaternion.to_euler_angles_xyz(player_rot)
			local angle_towards_explosion = nr - math.radians_to_degrees(math.angle(unit_pos.x, unit_pos.y, hit_unit_pos.x, hit_unit_pos.y))

			if angle_towards_explosion < 0 then
				angle_towards_explosion = angle_towards_explosion + 360
			end

			if math.abs(90 - angle_towards_explosion) < 90 then
				facing_explosion = true
			end
		end
	end

	if explosion_data.screenspace_effect_name and (not explosion_data.only_facing or facing_explosion) then
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if local_player_unit then
			local local_player_unit_position = POSITION_LOOKUP[local_player_unit]
			local distance_to_explosion = Vector3.distance(local_player_unit_position, impact_position)
			local radius = explosion_data.screenspace_effect_radius or explosion_data.radius

			if distance_to_explosion <= radius then
				local first_person_extension = ScriptUnit.has_extension(local_player_unit, "first_person_system")

				if first_person_extension then
					first_person_extension:create_screen_particles(explosion_data.screenspace_effect_name)
				end
			end
		end
	end

	local attacker_unit_alive = unit_alive(attacker_unit)

	if is_server and attacker_unit_alive then
		if explosion_data.alert_enemies then
			Managers.state.entity:system("ai_system"):alert_enemies_within_range(attacker_unit, impact_position, explosion_data.alert_enemies_radius)
		end

		local push_speed = explosion_data.player_push_speed
		local difficulty_rank = Managers.state.difficulty:get_difficulty()
		local fallback_difficulty = Managers.state.difficulty.fallback_difficulty
		local radius = explosion_data.radius
		local max_damage_radius

		if wind_mutator and active_wind and wind_settings.radius then
			local wind_strength = Managers.weave:get_wind_strength()

			radius = wind_settings.radius[difficulty_rank][wind_strength] or wind_settings.radius[2][wind_strength]
			max_damage_radius = explosion_data.max_damage_radius or radius - 1
		else
			max_damage_radius = explosion_data.max_damage_radius or 0
		end

		local radius_min = explosion_data.radius_min
		local radius_max = explosion_data.radius_max
		local exponential_falloff = explosion_data.exponential_falloff

		if radius_min and radius_max then
			radius = math.lerp(radius_min, radius_max, scale)

			if explosion_data.max_damage_radius_min then
				local max_damage_radius_min = explosion_data.max_damage_radius_min
				local max_damage_radius_max = explosion_data.max_damage_radius_max

				max_damage_radius = math.lerp(max_damage_radius_min, max_damage_radius_max, scale)
			end
		end

		fassert(radius, "Explosion template [%s] has no radius, or radius_min & radius_max, set", explosion_template.name)

		local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")
		local is_grenade = explosion_template.is_grenade

		if buff_extension then
			local radius_multiplier = 1

			if is_grenade then
				radius_multiplier = radius_multiplier + (buff_extension:apply_buffs_to_value(1, "grenade_radius") - 1)
			end

			radius_multiplier = radius_multiplier + (buff_extension:apply_buffs_to_value(1, "explosion_radius") - 1)
			radius = radius * radius_multiplier
			max_damage_radius = max_damage_radius * radius_multiplier
		end

		local difficulty_power_level = explosion_data.difficulty_power_level and (explosion_data.difficulty_power_level[difficulty_rank] or explosion_data.difficulty_power_level[fallback_difficulty])
		local different_power_levels_for_players = explosion_data.different_power_levels_for_players
		local power_level_settings = difficulty_power_level or explosion_data
		local power_level, power_level_min, power_level_max, wind_power_level_player, wind_power_level_ai

		if wind_mutator and active_wind then
			local wind_strength = Managers.weave:get_wind_strength()

			if different_power_levels_for_players then
				wind_power_level_player = wind_settings.power_level_player[difficulty_rank][wind_strength]
				wind_power_level_ai = wind_settings.power_level_ai[difficulty_rank][wind_strength]
			else
				power_level = wind_settings.power_level and wind_settings.power_level[difficulty_rank][wind_strength] or 0
			end
		else
			power_level = power_level_settings.power_level
			power_level_min = power_level_settings.power_level_min
			power_level_max = power_level_settings.power_level_max
		end

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
		local do_damage = power_level or power_level_min and power_level_max or different_power_levels_for_players or false
		local ignore_attacker_unit = explosion_data.ignore_attacker_unit
		local collision_filter = explosion_data.collision_filter or "filter_explosion_overlap"
		local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
		local only_line_of_sight = explosion_data.only_line_of_sight
		local attacker_player = Managers.player:owner(attacker_unit)
		local attacker_is_player = attacker_player ~= nil
		local friendly_fire_disabled = explosion_data.no_friendly_fire
		local allow_friendly_fire_override = explosion_data.allow_friendly_fire_override
		local friendly_fire_allowed

		if attacker_is_player then
			friendly_fire_allowed = allow_friendly_fire_override or DamageUtils.allow_friendly_fire_ranged(difficulty_settings, attacker_player)
		else
			friendly_fire_allowed = explosion_data.ai_friendly_fire
		end

		local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if buff_extension then
			local no_friendly_damage_perk = buff_extension:has_buff_perk(buff_perk_names.no_explosion_friendly_fire)

			if no_friendly_damage_perk then
				friendly_fire_allowed = false
			end
		end

		local friendly_fire_enabled = friendly_fire_allowed and not friendly_fire_disabled
		local physics_world = World.physics_world(world)
		local actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", impact_position, "size", radius, "collision_filter", collision_filter)
		local aoe_target_units = AOE_TARGET_UNITS
		local aoe_target_array = AOE_TARGET_ARRAY
		local aoe_simple_damage_units = AOE_SIMPLE_DAMAGE_UNITS

		table.clear(aoe_target_units)
		table.clear(aoe_target_array)
		table.clear(aoe_simple_damage_units)

		local explosion_forward_scaling = explosion_data.explosion_forward_scaling
		local explosion_angle = explosion_data.explosion_cone_angle

		explosion_angle = explosion_angle and math.cos(explosion_angle / 2)

		local explosion_direction

		if explosion_forward_scaling or explosion_angle then
			explosion_direction = Quaternion.forward(rotation)
		end

		local num_hits = 0

		for i = 1, num_actors do
			local hit_actor = actors[i]
			local hit_unit = hit_actor and actor_unit(hit_actor)

			if ScriptUnit.has_extension(hit_unit, "health_system") then
				local ignore_damage = unit_get_data(hit_unit, "ignore_explosion_damage")

				if not ignore_damage and not aoe_target_units[hit_unit] and (not ignore_attacker_unit or hit_unit ~= attacker_unit) then
					local hit_zone_name = DamageUtils.aoe_hit_zone(hit_unit, hit_actor)

					if hit_zone_name ~= "afro" then
						if not only_line_of_sight then
							local should_hit = true

							if explosion_angle or explosion_forward_scaling then
								local unit_pos = Unit.world_position(hit_unit, 0) + Vector3.up()
								local delta_pos = unit_pos - impact_position
								local direction = Vector3.normalize(delta_pos)

								if explosion_angle then
									should_hit = explosion_angle <= Vector3.dot(direction, explosion_direction)
								end

								if should_hit and explosion_forward_scaling then
									local modified_radius = math.lerp(radius, radius * explosion_forward_scaling, math.abs(Vector3.dot(direction, explosion_direction)))

									should_hit = modified_radius * modified_radius >= Vector3.length_squared(delta_pos)
								end
							end

							if should_hit then
								num_hits = num_hits + 1
								aoe_target_units[hit_unit] = true
								aoe_target_array[num_hits] = hit_actor
							end
						else
							local unit_pos = Unit.world_position(hit_unit, 0) + Vector3.up()
							local delta_pos = unit_pos - impact_position
							local direction = Vector3.normalize(delta_pos)
							local length = radius
							local in_cone = true

							if explosion_angle then
								in_cone = explosion_angle <= Vector3.dot(direction, explosion_direction)
							end

							local in_range = true

							if in_cone and explosion_forward_scaling then
								local modified_radius = math.lerp(radius, radius * explosion_forward_scaling, math.abs(Vector3.dot(direction, explosion_direction)))

								in_range = modified_radius * modified_radius <= Vector3.length_squared(delta_pos)
							end

							if in_cone and explosion_right_scaling then
								local modified_radius = math.lerp(radius, radius * explosion_right_scaling, 1 - math.abs(Vector3.dot(direction, explosion_right_scaling)))

								in_range = modified_radius * modified_radius <= Vector3.length_squared(delta_pos)
							end

							if in_cone and in_range then
								PhysicsWorld.prepare_actors_for_raycast(physics_world, impact_position, direction, 0.1)

								local result = PhysicsWorld.immediate_raycast(physics_world, impact_position, direction, length, "all", "collision_filter", "filter_explosion_overlap_no_static")

								if result then
									local num_hits_raycast = #result

									for j = 1, num_hits_raycast do
										local hit = result[j]
										local hit_actor_raycast = hit[4]
										local hit_unit_raycast = Actor.unit(hit_actor_raycast)
										local unit_breed = AiUtils.unit_breed(hit_unit_raycast)

										if not unit_breed then
											break
										end

										if hit_unit == hit_unit_raycast then
											num_hits = num_hits + 1
											aoe_target_units[hit_unit] = true
											aoe_target_array[num_hits] = hit_actor

											break
										end
									end
								end
							end
						end
					end
				end
			elseif hit_unit and unit_alive(hit_unit) and hit_actor and not explosion_data.no_prop_damage and not aoe_simple_damage_units[hit_unit] then
				aoe_simple_damage_units[hit_unit] = true

				local hit_direction = Vector3.normalize(actor_position(hit_actor) - impact_position)

				unit_set_flow_variable(hit_unit, "hit_actor", hit_actor)
				unit_set_flow_variable(hit_unit, "hit_direction", hit_direction)
				unit_set_flow_variable(hit_unit, "hit_position", impact_position)
				unit_flow_event(hit_unit, "lua_simple_damage")
			end
		end

		if is_grenade then
			SurroundingAwareSystem.add_event(attacker_unit, "grenade_exp", DialogueSettings.grabbed_broadcast_range, "hit", num_hits, "grenade_owner", ScriptUnit.extension(attacker_unit, "dialogue_system").context.player_profile)
		end

		if num_hits > 0 then
			table.sort(aoe_target_array, function (a, b)
				local a_unit = actor_unit(a)
				local b_unit = actor_unit(b)
				local a_pos = POSITION_LOOKUP[a_unit] or unit_local_position(a_unit, 0)
				local b_pos = POSITION_LOOKUP[b_unit] or unit_local_position(b_unit, 0)
				local a_distance = vector3_distance_squared(impact_position, a_pos)
				local b_distance = vector3_distance_squared(impact_position, b_pos)

				return a_distance < b_distance
			end)
		end

		local side_manager = Managers.state.side
		local area_damage_system = Managers.state.entity:system("area_damage_system")
		local target_number = 0
		local hit_sound_cap = explosion_data.hit_sound_event_cap or num_hits
		local ignore_players = explosion_data.ignore_players
		local hit_sound_count = 0

		for i = 1, num_hits do
			local hit_actor = aoe_target_array[i]
			local hit_unit = actor_unit(hit_actor)
			local blackboard = BLACKBOARDS[hit_unit]
			local breed = blackboard and blackboard.breed
			local is_player = breed and breed.is_player
			local is_ai = breed and not is_player
			local is_ally = side_manager:is_ally(attacker_unit, hit_unit)
			local damage_unit = not is_ally or friendly_fire_enabled

			if is_player then
				if ignore_players then
					damage_unit = false
				elseif not is_ally and damage_unit then
					local ghost_mode_extension = ScriptUnit.has_extension(hit_unit, "ghost_mode_system")

					damage_unit = not ghost_mode_extension or not ghost_mode_extension:is_in_ghost_mode()
				end
			elseif attacker_is_player and is_ai and is_ally then
				damage_unit = false
			end

			if damage_unit then
				local target_radius, target_height = DamageUtils.calculate_aoe_size(hit_unit, breed)
				local unit_position = POSITION_LOOKUP[hit_unit] or unit_local_position(hit_unit, 0)
				local unit_top_position = unit_position + Vector3(0, 0, math.max(target_height - target_radius * 0.5, target_height * 0.5))
				local unit_bottom_position = unit_position + Vector3(0, 0, math.min(target_radius * 0.5, target_height * 0.5))
				local closest_point = Geometry.closest_point_on_line(impact_position, unit_bottom_position, unit_top_position)
				local hit_direction = closest_point - impact_position
				local hit_distance = math.max(Vector3.length(hit_direction) - target_radius, 0)
				local hit_direction_normalized = Vector3.normalize(hit_direction)
				local is_glancing_hit = max_damage_radius < hit_distance
				local scaled_power_level

				if power_level_min and power_level_max then
					scaled_power_level = math.lerp(power_level_min, power_level_max, scale)
				end

				local distance_factor = 1

				if max_damage_radius < hit_distance then
					local distance_scale_range = radius - max_damage_radius

					if distance_scale_range > 0 then
						distance_factor = 1 - (hit_distance - max_damage_radius) / distance_scale_range

						if exponential_falloff then
							distance_factor = distance_factor * distance_factor
						end
					end
				end

				if wind_mutator and different_power_levels_for_players then
					if breed and breed.is_hero then
						power_level = wind_power_level_player
						power_level_glance = wind_power_level_player
					else
						power_level = wind_power_level_ai
						power_level_glance = wind_power_level_ai
					end
				end

				local actual_power_level = is_glancing_hit and power_level_glance or scaled_power_level or power_level or 0

				actual_power_level = actual_power_level * distance_factor
				push_speed = push_speed and math.auto_lerp(max_damage_radius, radius, push_speed, 1, math.clamp(hit_distance, max_damage_radius, radius))

				if HEALTH_ALIVE[hit_unit] then
					target_number = target_number + 1
				end

				local damage_profile = DamageProfileTemplates[explosion_template.explosion.damage_profile]
				local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, attacker_unit)
				local hit_zone_name = DamageUtils.aoe_hit_zone(hit_unit, hit_actor)

				if script_data.debug_projectiles then
					QuickDrawerStay:vector(impact_position, hit_direction, Colors.get("brown"))
				end

				local allow_critical_proc = false

				area_damage_system:add_aoe_damage_target(hit_unit, attacker_unit, impact_position, shield_blocked, do_damage, hit_zone_name, damage_source, hit_distance, push_speed, radius, max_damage_radius, radius_min, radius_max, power_level, actual_power_level, hit_direction_normalized, explosion_template.name, is_critical_strike, allow_critical_proc, source_attacker_unit, target_number)

				if explosion_data.buff_to_apply and DamageUtils.is_player_unit(hit_unit) then
					if not explosion_data.only_facing then
						local buff_system = Managers.state.entity:system("buff_system")

						buff_system:add_buff(hit_unit, explosion_data.buff_to_apply, hit_unit, false)
					else
						local unit_pos = Unit.local_position(attacker_unit, 0)
						local hit_unit_pos = POSITION_LOOKUP[hit_unit] or Unit.local_position(hit_unit, 0)
						local player_rot = Unit.local_rotation(hit_unit, 0)
						local _, _, nr = Quaternion.to_euler_angles_xyz(player_rot)
						local angle_towards_explosion = nr - math.radians_to_degrees(math.angle(unit_pos.x, unit_pos.y, hit_unit_pos.x, hit_unit_pos.y))

						if angle_towards_explosion < 0 then
							angle_towards_explosion = angle_towards_explosion + 360
						end

						if math.abs(90 - angle_towards_explosion) < 90 then
							local buff_system = Managers.state.entity:system("buff_system")

							buff_system:add_buff(hit_unit, explosion_data.buff_to_apply, hit_unit, false)
						end
					end
				elseif explosion_data.enemy_debuff and DamageUtils.is_enemy(attacker_unit, hit_unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local debuffs_to_add = explosion_data.enemy_debuff

					for key, debuff_name in pairs(debuffs_to_add) do
						buff_system:add_buff(hit_unit, debuff_name, hit_unit, false)
					end
				end

				if explosion_data.server_hit_func then
					explosion_data.server_hit_func(hit_unit, damage_source, attacker_unit, impact_position, explosion_data)
				end

				if explosion_data.hit_sound_event and hit_sound_count < hit_sound_cap then
					local audio_system = Managers.state.entity:system("audio_system")

					audio_system:play_audio_unit_event(explosion_data.hit_sound_event, hit_unit)

					hit_sound_count = hit_sound_count + 1
				end

				if explosion_data.catapult_players and DamageUtils.is_player_unit(hit_unit) then
					local bot = Managers.player:owner(hit_unit) and not Managers.player:owner(hit_unit):is_player_controlled()
					local bot_knockback_immunity = bot and explosion_data.bot_knockback_immunity or false

					if not bot_knockback_immunity then
						local force = explosion_data.catapult_force
						local force_z = explosion_data.catapult_force_z
						local block_multiplier = explosion_data.catapult_blocked_multiplier

						if block_multiplier then
							local blocked = DamageUtils.check_block(attacker_unit, hit_unit, explosion_data.fatigue_type)
							local multiplier = blocked and block_multiplier or 1

							force = force * multiplier
							force_z = force_z * multiplier
						end

						local velocity = force * Vector3.normalize(hit_direction)

						if force_z then
							Vector3.set_z(velocity, force_z)
						end

						StatusUtils.set_catapulted_network(hit_unit, true, velocity)
					end
				end
			end
		end
	end
end

local BROADPHASE_TEMP = {}

DamageUtils.create_taunt = function (world, owner_unit, projectile_unit, position, aoe_data)
	local taunt_data = aoe_data.taunt
	local num_targets = AiUtils.broadphase_query(position, taunt_data.target_selection_range, BROADPHASE_TEMP)
	local best_health = -math.huge
	local best_target

	if num_targets > 1 then
		for i = 1, num_targets do
			local unit = BROADPHASE_TEMP[i]
			local health_ext = ScriptUnit.extension(unit, "health_system")
			local current_health = health_ext:current_health()

			if best_health < current_health then
				best_target = unit
				best_health = current_health
			end
		end
	end

	local extension_init_data = {
		health_system = {
			attached_unit = best_target,
			duration = taunt_data.duration,
		},
		death_system = {
			death_reaction_template = "lure_unit",
		},
	}
	local unit_name = "units/hub_elements/empty"
	local unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "lure_unit", extension_init_data, position)

	if best_target then
		World.link_unit(world, unit, best_target)
	end

	local t = Managers.time:time("game")
	local taunt_end_time = t + taunt_data.duration
	local num_taunted_units = AiUtils.broadphase_query(position, taunt_data.range, BROADPHASE_TEMP)

	for i = 1, num_taunted_units do
		local ai_unit = BROADPHASE_TEMP[i]

		if ai_unit ~= best_target then
			local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")
			local ai_blackboard = ai_extension:blackboard()
			local ai_breed = ai_extension:breed()

			if not ai_breed.ignore_taunts then
				ai_blackboard.taunt_unit = unit
				ai_blackboard.taunt_end_time = taunt_end_time
				ai_blackboard.target_unit = unit
				ai_blackboard.target_unit_found_time = t
			end
		end
	end

	return unit
end

DamageUtils.create_aoe = function (world, attacker_unit, position, damage_source, explosion_template, radius, duration)
	local aoe_data = explosion_template.aoe
	local radius = radius or aoe_data.radius
	local duration = duration or aoe_data.duration
	local attacker_unit = AiUtils.get_actual_attacker_unit(attacker_unit)
	local is_grenade = explosion_template.is_grenade
	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension then
		local radius_multiplier = 1

		if is_grenade then
			radius_multiplier = radius_multiplier + (buff_extension:apply_buffs_to_value(1, "grenade_radius") - 1)
		end

		radius_multiplier = radius_multiplier + (buff_extension:apply_buffs_to_value(1, "explosion_radius") - 1)
		radius = radius * radius_multiplier
	end

	local attacker_player = Managers.player:owner(attacker_unit)
	local damage_players = true
	local mechanism_name = Managers.mechanism:current_mechanism_name()

	if attacker_player ~= nil and mechanism_name ~= "versus" then
		local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
		local friendly_fire_disabled = aoe_data.no_friendly_fire
		local friendly_fire_allowed = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, attacker_player)
		local forced_friendly_fire = aoe_data.allow_friendly_fire

		damage_players = forced_friendly_fire or friendly_fire_allowed and not friendly_fire_disabled
	end

	local extension_init_data = {
		area_damage_system = {
			aoe_dot_damage = 0,
			invisible_unit = true,
			aoe_dot_damage_interval = aoe_data.damage_interval,
			radius = radius,
			life_time = duration,
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
			owner_player = attacker_player,
			source_attacker_unit = attacker_unit,
		},
	}
	local aoe_unit_name = "units/hub_elements/empty"
	local aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "aoe_unit", extension_init_data, position)
	local unit_id = Managers.state.unit_storage:go_id(aoe_unit)

	Unit.set_unit_visibility(aoe_unit, false)
	Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, position)

	return aoe_unit
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
	local breed_name = breed.name

	if not breed_name then
		table.dump(breed, "breed", 2)
		error("breed.name was nil in DamageUtils.create_hit_zone_lookup")
	end

	for zone_name, zone in pairs(hit_zones) do
		for k, actor_name in ipairs(zone.actors) do
			local actor = unit_actor(unit, actor_name)

			if not actor then
				printf("Actor %s not found in %s", actor_name, breed_name)
			end

			local node = actor_node(actor)

			hit_zones_lookup[node] = {
				name = zone_name,
				prio = zone.prio,
				actor_name = actor_name,
			}
			hit_zones_lookup[zone_name] = node
			hit_zones_lookup[breed_name] = true
		end
	end

	breed.hit_zones_lookup = hit_zones_lookup
	BreedHitZonesLookup[breed_name] = hit_zones_lookup
end

DamageUtils.vs_register_dark_pact_player_damage = function (attacker_unit, attacked_unit, damage_source, damage_type, player_manager, source_attacker_unit)
	local attacker_player = player_manager:owner(attacker_unit)
	local attacked_player = player_manager:owner(attacked_unit)

	if attacker_player and attacked_player then
		local is_dark_pact_attacker = Managers.state.side:versus_is_dark_pact(attacker_unit) or Managers.state.side:versus_is_dark_pact(source_attacker_unit)
		local status_extension = ScriptUnit.has_extension(attacked_unit, "status_system")
		local target_downed = status_extension.is_ledge_hanging or status_extension.knocked_down

		if attacker_unit and is_dark_pact_attacker then
			local horde_ability_system = Managers.state.entity:system("versus_horde_ability_system")

			horde_ability_system:server_ability_recharge_boost(attacker_player.peer_id, nil, damage_source, damage_type, target_downed)
		end
	end
end

DamageUtils.add_damage_network = function (attacked_unit, attacker_unit, original_damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source, hit_ragdoll_actor, source_attacker_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, skip_buffs, target_index)
	local network_manager = Managers.state.network

	if not network_manager:game() then
		return 0
	end

	local attacked_side = Managers.state.side.side_by_unit[attacked_unit]

	if DamageUtils.is_in_inn and attacked_side and attacked_side.VALID_ENEMY_PLAYERS_AND_BOTS[attacked_unit] then
		return 0
	end

	local player_manager = Managers.player
	local is_server = player_manager.is_server

	if is_immune_to_damage(attacked_unit, damage_type, damage_source, buff_attack_type) then
		if is_server or LEVEL_EDITOR_TEST then
			Managers.state.achievement:trigger_event("register_damage_resisted_immune", attacked_unit, attacker_unit, damage_type)
		end

		return 0
	end

	if is_server and Managers.mechanism:current_mechanism_name() == "versus" then
		DamageUtils.vs_register_dark_pact_player_damage(attacker_unit, attacked_unit, damage_source, damage_type, player_manager, source_attacker_unit)
	end

	local victim_units = FrameTable.alloc_table()

	if is_server or LEVEL_EDITOR_TEST then
		local mechanism_ok, custom_setting_damage_multiplier, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "hero_damage_taken")

		if mechanism_ok and custom_settings_enabled then
			local unit_is_hero = attacked_side and attacked_side:name() == "heroes"

			original_damage_amount = unit_is_hero and original_damage_amount * custom_setting_damage_multiplier or original_damage_amount
		end

		local attacker_breed = AiUtils.unit_breed(attacker_unit)

		if attacker_breed and attacker_breed.is_hero then
			original_damage_amount = DamageUtils.networkify_damage(original_damage_amount)
		end

		original_damage_amount = DamageUtils.apply_buffs_to_damage(original_damage_amount, attacked_unit, attacker_unit, damage_source, victim_units, damage_type, buff_attack_type, first_hit, source_attacker_unit)
	end

	local damage_amount = DamageUtils.networkify_damage(original_damage_amount)

	hit_position = hit_position or Unit.world_position(attacked_unit, 0)
	hit_position = NetworkUtils.network_clamp_position(hit_position)

	if HEALTH_ALIVE[attacked_unit] then
		local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if buff_extension and not skip_buffs then
			local on_damage_dealt_proc_modifiable = FrameTable.alloc_table()

			on_damage_dealt_proc_modifiable.damage_amount = damage_amount

			buff_extension:trigger_procs("on_damage_dealt", attacked_unit, attacker_unit, damage_amount, hit_zone_name, 0, is_critical_strike, buff_attack_type, 100, damage_source, damage_type, first_hit, on_damage_dealt_proc_modifiable)

			damage_amount = on_damage_dealt_proc_modifiable.damage_amount
		end

		Managers.state.achievement:trigger_event("on_damage_dealt", attacked_unit, attacker_unit, damage_amount, hit_zone_name, 0, is_critical_strike, buff_attack_type, 100, damage_source, damage_type, first_hit)
	end

	Managers.state.game_mode:game_mode():projectile_hit_character(nil, source_attacker_unit, attacker_unit, attacked_unit, hit_position, nil, damage_direction, damage_amount)

	if is_server or LEVEL_EDITOR_TEST then
		local num_victim_units = #victim_units
		local t = Managers.time:time("game")

		for i = 1, num_victim_units do
			local victim_unit = victim_units[i]

			damage_type = victim_unit == attacked_unit and damage_type or "buff"

			local health_extension = ScriptUnit.extension(victim_unit, "health_system")

			health_extension:add_damage(attacker_unit, damage_amount, hit_zone_name, damage_type, hit_position, damage_direction, damage_source, hit_ragdoll_actor, source_attacker_unit, hit_react_type, is_critical_strike, added_dot, first_hit, total_hits, buff_attack_type, backstab_multiplier, target_index)

			if not HEALTH_ALIVE[victim_unit] then
				Managers.state.unit_spawner:prioritize_death_watch_unit(attacked_unit, t)
			end
		end
	else
		local unit_id, is_level_unit = network_manager:game_object_or_level_id(attacked_unit)
		local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacker_unit)
		local source_attacker_unit_id = network_manager:unit_game_object_id(source_attacker_unit) or NetworkConstants.invalid_game_object_id
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local damage_type_id = NetworkLookup.damage_types[damage_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source or "n/a"]
		local hit_react_type_id = NetworkLookup.hit_react_types[hit_react_type or "light"]

		is_critical_strike = is_critical_strike or false
		added_dot = added_dot or false
		first_hit = first_hit or false
		total_hits = total_hits or 0
		backstab_multiplier = backstab_multiplier or 1
		target_index = target_index or 1

		network_manager.network_transmit:send_rpc_server("rpc_add_damage_network", unit_id, is_level_unit, attacker_unit_id, attacker_is_level_unit, source_attacker_unit_id, damage_amount, hit_zone_id, damage_type_id, hit_position, damage_direction, damage_source_id, hit_react_type_id, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, target_index)
	end

	return damage_amount
end

DamageUtils.get_damage_type = function (damage_profile, target_index)
	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = DamageUtils.get_attack_template(attack_template_name)
	local damage_type = target_settings.damage_type or damage_profile.damage_type or attack_template.damage_type

	return damage_type
end

DamageUtils.add_damage_network_player = function (damage_profile, target_index, power_level, hit_unit, attacker_unit, hit_zone_name, hit_position, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)
	local network_manager = Managers.state.network

	if not network_manager:game() then
		return 0
	end

	local attacked_side = Managers.state.side.side_by_unit[hit_unit]

	if DamageUtils.is_in_inn and attacked_side and attacked_side.VALID_ENEMY_PLAYERS_AND_BOTS[hit_unit] then
		return 0
	end

	local player_manager = Managers.player
	local attacker_player = player_manager:owner(attacker_unit)

	if attacker_player and attacker_player.bot_player and not DamageUtils.can_bots_damage(hit_unit) then
		return 0
	end

	local mechanism_name = Managers.mechanism:current_mechanism_name()

	if mechanism_name == "versus" and attacker_unit and Managers.state.side:versus_is_dark_pact(attacker_unit) then
		if not DamageUtils.vs_dark_pact_can_damage(attacker_unit, hit_unit) then
			return 0
		end

		DamageUtils.vs_register_dark_pact_player_damage(attacker_unit, hit_unit, damage_source, nil, player_manager)
	end

	local damage_type = DamageUtils.get_damage_type(damage_profile, target_index)

	if damage_profile.instant_death and DamageUtils.is_ai(hit_unit) then
		AiUtils.kill_unit(hit_unit, attacker_unit, hit_zone_name, damage_type, attack_direction, damage_source)

		return 0
	end

	local charge_value = damage_profile.charge_value

	if is_immune_to_damage(hit_unit, damage_type, damage_source, charge_value) then
		return 0
	end

	local ghost_mode_extension = ScriptUnit.has_extension(hit_unit, "ghost_mode_system")

	if ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode() then
		return 0
	end

	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local original_damage_amount = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
	local victim_units = FrameTable.alloc_table()
	local max_network_damage = NetworkConstants.damage.max
	local buffed_damage_amount = DamageUtils.apply_buffs_to_damage(original_damage_amount, hit_unit, attacker_unit, damage_source, victim_units, damage_type, charge_value, first_hit, source_attacker_unit)
	local damage_amount = buffed_damage_amount

	hit_position = hit_position or Unit.world_position(hit_unit, 0)
	hit_position = NetworkUtils.network_clamp_position(hit_position)

	local buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
	local source_buff_extension = source_attacker_unit and ScriptUnit.has_extension(source_attacker_unit, "buff_system")

	if (buff_extension or source_buff_extension) and HEALTH_ALIVE[hit_unit] then
		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template
		local buff_type = "other"
		local no_crit_headshot_damage = damage_amount

		if weapon_template_name then
			local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)

			buff_type = weapon_template.buff_type
			no_crit_headshot_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, "torso", power_level, boost_curve, boost_curve_multiplier, false, damage_profile, target_index, backstab_multiplier, damage_source)
		end

		if damage_profile.deal_min_damage then
			damage_amount = math.max(damage_amount, 0.25)
		end

		local on_damage_dealt_proc_modifiable = FrameTable.alloc_table()

		on_damage_dealt_proc_modifiable.damage_amount = damage_amount

		local buff_extension = buff_extension or source_buff_extension

		buff_extension:trigger_procs("on_player_damage_dealt", hit_unit, damage_amount, hit_zone_name, no_crit_headshot_damage, is_critical_strike, charge_value, target_index, damage_source, first_hit, on_damage_dealt_proc_modifiable)
		buff_extension:trigger_procs("on_damage_dealt", hit_unit, attacker_unit, damage_amount, hit_zone_name, no_crit_headshot_damage, is_critical_strike, charge_value, target_index, damage_source, damage_type, first_hit, on_damage_dealt_proc_modifiable)

		damage_amount = on_damage_dealt_proc_modifiable.damage_amount
	end

	if player_manager.is_server or LEVEL_EDITOR_TEST then
		local num_victim_units = #victim_units
		local mechanism_ok, custom_setting_damage_multiplier, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "hero_damage_taken")

		if mechanism_ok and custom_settings_enabled then
			local unit_is_hero = attacked_side and attacked_side:name() == "heroes"

			damage_amount = unit_is_hero and damage_amount * custom_setting_damage_multiplier or damage_amount
		end

		local t = Managers.time:time("game")

		for i = 1, num_victim_units do
			local victim_unit = victim_units[i]

			damage_type = victim_unit == hit_unit and damage_type or "buff"

			local target_health_extension = ScriptUnit.extension(victim_unit, "health_system")

			if max_network_damage < damage_amount then
				local num_calls = math.floor(damage_amount / max_network_damage)

				for _ = 1, num_calls do
					target_health_extension:add_damage(attacker_unit, max_network_damage, hit_zone_name, damage_type, hit_position, attack_direction, damage_source, hit_ragdoll_actor, source_attacker_unit, nil, is_critical_strike, added_dot, first_hit, total_hits, charge_value, backstab_multiplier, target_index)
				end

				local remaining_damage_amount = damage_amount - max_network_damage * num_calls

				damage_amount = remaining_damage_amount
			end

			local networkified_damage_amount = DamageUtils.networkify_damage(damage_amount)

			target_health_extension:add_damage(attacker_unit, networkified_damage_amount, hit_zone_name, damage_type, hit_position, attack_direction, damage_source, hit_ragdoll_actor, source_attacker_unit, nil, is_critical_strike, added_dot, first_hit, total_hits, charge_value, backstab_multiplier, target_index)

			if not HEALTH_ALIVE[victim_unit] then
				Managers.state.unit_spawner:prioritize_death_watch_unit(hit_unit, t)
			end
		end
	end

	return damage_amount
end

local HIT_MARKER_FREQ = 0.1
local HIT_CRITICAL_MULTIPLIER_TYPES = {
	"headshot",
	"weakspot",
}

DamageUtils.handle_hit_indication = function (attacker_unit, victim_unit, damage_amount, hit_zone_name, added_dot, invulnerable, shield_break)
	local hud_extension = ScriptUnit.has_extension(attacker_unit, "hud_system")

	if hud_extension and HEALTH_ALIVE[victim_unit] and attacker_unit ~= victim_unit then
		local hit_marker_data = hud_extension.hit_marker_data
		local curr_time = Managers.time:time("game")
		local diff = 1

		if hit_marker_data.hit_marker_timestamp then
			diff = curr_time - hit_marker_data.hit_marker_timestamp
		end

		if diff > HIT_MARKER_FREQ then
			local breed = AiUtils.unit_breed(victim_unit)
			local armor_override = unit_get_data(victim_unit, "armor")
			local target_unit_armor, _, target_unit_primary_armor, _ = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)
			local is_character = DamageUtils.is_character(victim_unit)
			local friendly_fire = is_character and not DamageUtils.is_enemy(attacker_unit, victim_unit)
			local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name)
			local hit_critical = table.contains(HIT_CRITICAL_MULTIPLIER_TYPES, multiplier_type)
			local override_armored = breed and breed.armored_on_no_damage

			hit_marker_data.shield_break = shield_break
			hit_marker_data.shield_open = false
			hit_marker_data.hit_enemy = true
			hit_marker_data.friendly_fire = friendly_fire
			hit_marker_data.damage_amount = damage_amount
			hit_marker_data.hit_zone = hit_zone_name
			hit_marker_data.hit_critical = hit_critical
			hit_marker_data.has_armor = override_armored or target_unit_primary_armor == 6 or target_unit_armor == 2 or target_unit_armor == 0
			hit_marker_data.hit_marker_timestamp = curr_time
			hit_marker_data.added_dot = added_dot
			hit_marker_data.invulnerable = invulnerable
		end
	end
end

DamageUtils.get_item_buff_type = function (damage_source)
	local item_data = rawget(ItemMasterList, damage_source)
	local weapon_template_name = item_data and item_data.template or item_data.temporary_template
	local buff_type

	if weapon_template_name then
		local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)

		buff_type = weapon_template.buff_type
	end

	return buff_type or "n/a"
end

DamageUtils.buff_on_attack = function (unit, hit_unit, attack_type, is_critical, hit_zone_name, target_number, send_to_server, buff_type, unmodified, damage_source)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return false
	end

	if not HEALTH_ALIVE[hit_unit] then
		return false
	end

	local side_manager = Managers.state.side
	local hostile_unit = side_manager:is_enemy(unit, hit_unit)

	if hostile_unit then
		local ranged_attack = RangedAttackTypes[attack_type]

		if ranged_attack then
			buff_extension:trigger_procs("on_ranged_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified)
		else
			buff_extension:trigger_procs("on_melee_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified)
		end

		buff_extension:trigger_procs("on_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified)
		Managers.state.achievement:trigger_event("on_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified, unit, damage_source)
		Managers.state.event:trigger("on_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type, is_critical, unmodified, unit)
	end

	if is_critical and hostile_unit then
		buff_extension:trigger_procs("on_critical_hit", hit_unit, attack_type, hit_zone_name, target_number, buff_type)
	end

	if send_to_server and not Managers.player.is_server then
		local network_manager = Managers.state.network
		local attacker_unit_id = network_manager:unit_game_object_id(unit)
		local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
		local attack_type_id = NetworkLookup.buff_attack_types[attack_type]
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local buff_type_id = NetworkLookup.buff_weapon_types[buff_type]
		local damage_source_id = NetworkLookup.damage_sources[damage_source or "undefined"]

		if hit_unit_id then
			network_manager.network_transmit:send_rpc_server("rpc_buff_on_attack", attacker_unit_id, hit_unit_id, attack_type_id, is_critical, hit_zone_id, target_number, buff_type_id, damage_source_id)
		end
	end

	return true
end

local IGNORED_SHARED_DAMAGE_TYPES = {
	knockdown_bleed = true,
	suicide = true,
	wounded_dot = true,
}
local INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_SOURCES = {
	ground_impact = true,
	life_drain = true,
	life_tap = true,
	overcharge = true,
	temporary_health_degen = true,
}
local INVALID_GROMRIL_DAMAGE_SOURCE = {
	ground_impact = true,
	life_drain = true,
	life_tap = true,
	overcharge = true,
	temporary_health_degen = true,
}
local IGNORE_DAMAGE_REDUCTION_DAMAGE_SOURCE = {
	life_tap = true,
	suicide = true,
	temporary_health_degen = true,
}

DamageUtils.apply_buffs_to_damage = function (current_damage, attacked_unit, attacker_unit, damage_source, victim_units, damage_type, buff_attack_type, first_hit, source_attacker_unit)
	local damage = current_damage
	local network_manager = Managers.state.network
	local attacker_unit_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system") or ScriptUnit.has_extension(source_attacker_unit, "buff_system")

	if attacker_unit_buff_extension then
		attacker_unit_buff_extension:trigger_procs("damage_calculation_started", attacked_unit)
	end

	local attacked_player = Managers.player:owner(attacked_unit)
	local attacker_player = Managers.player:owner(attacker_unit)

	if attacked_player then
		damage = Managers.state.game_mode:modify_player_base_damage(attacked_unit, attacker_unit, damage, damage_type)
	end

	victim_units[#victim_units + 1] = attacked_unit

	local health_extension = ScriptUnit.extension(attacked_unit, "health_system")

	if health_extension:has_assist_shield() and not IGNORED_SHARED_DAMAGE_TYPES[damage_source] then
		local attacked_unit_id = network_manager:unit_game_object_id(attacked_unit)

		network_manager.network_transmit:send_rpc_clients("rpc_remove_assist_shield", attacked_unit_id)
	end

	if ScriptUnit.has_extension(attacked_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(attacked_unit, "buff_system")

		if SKAVEN[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_skaven")
		elseif CHAOS[damage_source] or BEASTMEN[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_chaos")
		end

		if DAMAGE_TYPES_AOE[damage_type] then
			damage = buff_extension:apply_buffs_to_value(damage, "protection_aoe")
		end

		if not IGNORE_DAMAGE_REDUCTION_DAMAGE_SOURCE[damage_source] then
			damage = buff_extension:apply_buffs_to_value(damage, "damage_taken")

			if ELITES[damage_source] then
				damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_elites")
			end
		end

		if RangedAttackTypes[buff_attack_type] then
			damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_ranged")
		elseif MeleeAttackTypes[buff_attack_type] then
			damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_melee")
		end

		local status_extension = attacked_player and ScriptUnit.has_extension(attacked_unit, "status_system")

		if status_extension then
			local is_knocked_down = status_extension:is_knocked_down()

			if is_knocked_down then
				damage = damage_type ~= "overcharge" and buff_extension:apply_buffs_to_value(damage, "damage_taken_kd") or 0
			end

			local is_disabled = status_extension:is_disabled()

			if not is_disabled then
				local valid_damage_to_overheat = not INVALID_DAMAGE_TO_OVERHEAT_DAMAGE_SOURCES[damage_source]

				if valid_damage_to_overheat and damage > 0 and not is_knocked_down then
					local original_damage = damage
					local new_damage = buff_extension:apply_buffs_to_value(damage, "damage_taken_to_overcharge")

					if new_damage < original_damage then
						local damage_to_overcharge = original_damage - new_damage

						damage_to_overcharge = buff_extension:apply_buffs_to_value(damage_to_overcharge, "reduced_overcharge_from_passive")
						damage_to_overcharge = DamageUtils.networkify_damage(damage_to_overcharge)

						if attacked_player.remote then
							local peer_id = attacked_player.peer_id
							local unit_id = network_manager:unit_game_object_id(attacked_unit)
							local channel_id = PEER_ID_TO_CHANNEL[peer_id]

							RPC.rpc_damage_taken_overcharge(channel_id, unit_id, damage_to_overcharge)
						else
							DamageUtils.apply_damage_to_overcharge(attacked_unit, damage_to_overcharge)
						end

						damage = new_damage
					end
				end
			end
		end

		if attacker_unit_buff_extension then
			local is_grenade = buff_attack_type == AttackTypes.grenade or DamageUtils.attacker_is_fire_bomb(attacker_unit)

			if is_grenade then
				damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "explosion_damage")
			end

			local has_burning_perk = attacker_unit_buff_extension:has_buff_perk("burning") or attacker_unit_buff_extension:has_buff_perk("burning_balefire") or attacker_unit_buff_extension:has_buff_perk("burning_elven_magic")

			if has_burning_perk then
				local side_manager = Managers.state.side
				local side = side_manager.side_by_unit[attacked_unit]

				if side then
					local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
					local num_units = #player_and_bot_units

					for i = 1, num_units do
						local unit = player_and_bot_units[i]
						local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

						if talent_extension and talent_extension:has_talent("sienna_unchained_burning_enemies_reduced_damage") then
							damage = damage * (1 + BuffUtils.get_buff_template("sienna_unchained_burning_enemies_reduced_damage").buffs[1].multiplier)

							break
						end
					end
				end
			end
		end

		local boss_elite_damage_cap = buff_extension:get_buff_value("max_damage_taken_from_boss_or_elite")
		local all_damage_cap = buff_extension:get_buff_value("max_damage_taken")
		local has_anti_oneshot = buff_extension:has_buff_perk("anti_oneshot")

		if has_anti_oneshot then
			local max_health = health_extension:get_max_health()
			local max_damage_allowed = max_health * 0.3

			if max_damage_allowed < damage then
				damage = max_damage_allowed
			end
		end

		local breed = ALIVE[attacker_unit] and unit_get_data(attacker_unit, "breed")

		if breed and (breed.boss or breed.elite) then
			local min_damage_cap

			if boss_elite_damage_cap and all_damage_cap then
				min_damage_cap = math.min(boss_elite_damage_cap, all_damage_cap)
			else
				min_damage_cap = boss_elite_damage_cap and boss_elite_damage_cap or all_damage_cap
			end

			if min_damage_cap and min_damage_cap <= damage then
				damage = math.max(damage * 0.5, min_damage_cap)
			end
		elseif all_damage_cap and all_damage_cap <= damage then
			damage = math.max(damage * 0.5, all_damage_cap)
		end

		if buff_extension:has_buff_type("shared_health_pool") and not IGNORED_SHARED_DAMAGE_TYPES[damage_source] then
			local attacked_side = Managers.state.side.side_by_unit[attacked_unit]
			local player_and_bot_units = attacked_side.PLAYER_AND_BOT_UNITS
			local num_player_and_bot_units = #player_and_bot_units
			local num_players_with_shared_health_pool = 1

			for i = 1, num_player_and_bot_units do
				local friendly_unit = player_and_bot_units[i]

				if friendly_unit ~= attacked_unit then
					local friendly_buff_extension = ScriptUnit.extension(friendly_unit, "buff_system")

					if friendly_buff_extension:has_buff_type("shared_health_pool") then
						num_players_with_shared_health_pool = num_players_with_shared_health_pool + 1
						victim_units[#victim_units + 1] = friendly_unit
					end
				end
			end

			damage = damage / num_players_with_shared_health_pool
		end

		local talent_extension = ScriptUnit.has_extension(attacked_unit, "talent_system")

		if talent_extension and talent_extension:has_talent("bardin_ranger_reduced_damage_taken_headshot") then
			local has_position = POSITION_LOOKUP[attacker_unit]

			if has_position and AiUtils.unit_is_flanking_player(attacker_unit, attacked_unit) and not buff_extension:has_buff_type("bardin_ranger_reduced_damage_taken_headshot_buff") then
				damage = damage * (1 + BuffUtils.get_buff_template("bardin_ranger_reduced_damage_taken_headshot_buff").buffs[1].multiplier)
			end
		end

		local is_invulnerable = buff_extension:has_buff_perk("invulnerable")
		local has_gromril_armor = buff_extension:has_buff_type("bardin_ironbreaker_gromril_armour")
		local has_metal_mutator_gromril_armor = buff_extension:has_buff_type("metal_mutator_gromril_armour")
		local valid_damage_source = not INVALID_GROMRIL_DAMAGE_SOURCE[damage_source]
		local unit_side = Managers.state.side.side_by_unit[attacked_unit]

		if unit_side and unit_side:name() == "dark_pact" then
			is_invulnerable = is_invulnerable or damage_source == "ground_impact"
		end

		if is_invulnerable or (has_gromril_armor or has_metal_mutator_gromril_armor) and valid_damage_source then
			damage = 0
		end

		if has_gromril_armor and valid_damage_source and current_damage > 0 then
			local buff = buff_extension:get_non_stacking_buff("bardin_ironbreaker_gromril_armour")
			local id = buff.id

			buff_extension:remove_buff(id)
			buff_extension:trigger_procs("on_gromril_armour_removed")

			local attacked_unit_id = network_manager:unit_game_object_id(attacked_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_remove_gromril_armour", attacked_unit_id)
		end

		if buff_extension:has_buff_type("invincibility_standard") then
			local buff = buff_extension:get_non_stacking_buff("invincibility_standard")

			if not buff.applied_damage then
				buff.stored_damage = not buff.stored_damage and damage or buff.stored_damage + damage
				damage = 0
			end
		end
	end

	if attacker_unit_buff_extension then
		local attacked_buff_extension = ScriptUnit.has_extension(attacked_unit, "buff_system")

		if attacker_player then
			local item_data = rawget(ItemMasterList, damage_source)
			local weapon_template_name = item_data and item_data.template

			if weapon_template_name then
				local weapon_template = WeaponUtils.get_weapon_template(weapon_template_name)
				local buff_type = weapon_template.buff_type

				if buff_type then
					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage")

					if attacker_unit_buff_extension:has_buff_perk("missing_health_damage") then
						local attacked_health_extension = ScriptUnit.extension(attacked_unit, "health_system")
						local missing_health_percentage = 1 - attacked_health_extension:current_health_percent()
						local damage_mult = 1 + missing_health_percentage / 2

						damage = damage * damage_mult
					end
				end

				local is_melee = MeleeBuffTypes[buff_type]
				local is_ranged = RangedBuffTypes[buff_type]

				if is_melee then
					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee")

					if buff_type == "MELEE_1H" then
						damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee_1h")
					elseif buff_type == "MELEE_2H" then
						damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_melee_2h")
					end

					if buff_attack_type == "heavy_attack" then
						damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_heavy_attack")
					end

					if first_hit then
						damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "first_melee_hit_damage")
					end
				elseif is_ranged then
					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_ranged")

					local attacked_health_extension = ScriptUnit.extension(attacked_unit, "health_system")

					if attacked_health_extension:current_health_percent() <= 0.9 or attacked_health_extension:current_max_health_percent() <= 0.9 then
						damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_ranged_to_wounded")
					end
				end

				local weapon_type = weapon_template.weapon_type

				if weapon_type then
					local stat_buff = WeaponSpecificStatBuffs[weapon_type].damage

					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, stat_buff)
				end

				if is_melee or is_ranged then
					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "reduced_non_burn_damage")
				end
			end

			if attacked_buff_extension then
				local has_poison_or_bleed = attacked_buff_extension:has_buff_perk("poisoned") or attacked_buff_extension:has_buff_perk("bleeding")

				if has_poison_or_bleed then
					damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_weapon_damage_poisoned_or_bleeding")
				end
			end

			if damage_type == "burninating" then
				damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_burn_dot_damage")
			end
		end

		damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "damage_dealt")

		local has_balefire, applied_this_frame = Managers.state.status_effect:has_status(attacked_unit, StatusEffectNames.burning_balefire)

		if has_balefire and not applied_this_frame then
			damage = attacker_unit_buff_extension:apply_buffs_to_value(damage, "increased_damage_to_balefire")
		end
	end

	Managers.state.game_mode:damage_taken(attacked_unit, attacker_unit, damage, damage_source, damage_type)

	if attacker_unit_buff_extension then
		attacker_unit_buff_extension:trigger_procs("damage_calculation_ended", attacked_unit)
	end

	return damage
end

DamageUtils.apply_damage_to_overcharge = function (unit, damage)
	local overcharge_extension = ScriptUnit.has_extension(unit, "overcharge_system")

	if overcharge_extension then
		overcharge_extension:add_charge(damage, nil, "damage_to_overcharge")
	end
end

DamageUtils.assist_shield_network = function (shielded_unit, shielder_unit, shield_amount)
	assert(Managers.player.is_server or LEVEL_EDITOR_TEST)

	local health_extension = ScriptUnit.extension(shielded_unit, "health_system")

	health_extension:shield(shield_amount)

	local status_extension = ScriptUnit.extension(shielded_unit, "status_system")

	status_extension:set_shielded(true)

	if not LEVEL_EDITOR_TEST then
		local network_manager = Managers.state.network
		local shielded_unit_id = network_manager:unit_game_object_id(shielded_unit)
		local shielder_unit_id, shielder_is_level_unit = network_manager:game_object_or_level_id(shielder_unit)
		local heal_type_id = NetworkLookup.heal_types.shield_by_assist

		network_manager.network_transmit:send_rpc_clients("rpc_heal", shielded_unit_id, false, shielder_unit_id, shielder_is_level_unit, shield_amount, heal_type_id)
	end
end

local HEALED_UNITS = {}

DamageUtils.heal_network = function (healed_unit, healer_unit, heal_amount, heal_type)
	fassert(Managers.player.is_server or LEVEL_EDITOR_TEST, "Only server can heal")
	table.clear(HEALED_UNITS)

	local buffed_heal_amount, shared_medpack = DamageUtils.apply_buffs_to_heal(healed_unit, healer_unit, heal_amount, heal_type, HEALED_UNITS)

	buffed_heal_amount = DamageUtils.networkify_damage(buffed_heal_amount)

	if healed_unit == healer_unit then
		local is_healing_draught = heal_type == "healing_draught" or heal_type == "healing_draught_temp_health"

		if is_healing_draught then
			local healed_unit_health_extension = ScriptUnit.extension(healed_unit, "health_system")

			if healed_unit_health_extension:current_permanent_health() > 80 then
				local target_name = ScriptUnit.extension(healed_unit, "dialogue_system").context.player_profile

				SurroundingAwareSystem.add_event(healed_unit, "early_healing_draught", DialogueSettings.default_view_distance, "target_name", target_name)
			end
		end
	end

	if buffed_heal_amount > 0 then
		if healed_unit ~= healer_unit then
			local healer_buff_extension = ScriptUnit.extension(healer_unit, "buff_system")

			healer_buff_extension:trigger_procs("on_healed_ally", healed_unit, buffed_heal_amount, heal_type)
		end

		local num_healed_units = #HEALED_UNITS

		for i = 1, num_healed_units do
			local unit = HEALED_UNITS[i]

			heal_type = shared_medpack and ("buff_shared_medpack" or "buff_shared_medpack_temp_health") or unit == healed_unit and heal_type or "buff"

			local health_extension = ScriptUnit.extension(unit, "health_system")

			health_extension:add_heal(healer_unit, buffed_heal_amount, nil, heal_type)

			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:healed(heal_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:trigger_procs("on_healed", healer_unit, buffed_heal_amount, heal_type)

			if heal_type == "healing_draught" or heal_type == "bandage" or heal_type == "healing_draught_temp_health" or heal_type == "bandage_temp_health" or heal_type == "bandage_trinket" then
				buff_extension:trigger_procs("on_healed_consumeable", healer_unit, buffed_heal_amount, heal_type)
			end

			if not LEVEL_EDITOR_TEST and status_extension and status_extension:heal_can_remove_wounded(heal_type) then
				StatusUtils.set_wounded_network(unit, false, "healed")
			end
		end
	else
		local num_healed_units = #HEALED_UNITS

		for i = 1, num_healed_units do
			local unit = HEALED_UNITS[i]
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if not LEVEL_EDITOR_TEST and status_extension and status_extension:is_wounded() and status_extension:heal_can_remove_wounded(heal_type) then
				StatusUtils.set_wounded_network(unit, false, "healed")
			end
		end
	end
end

DamageUtils.apply_buffs_to_heal = function (healed_unit, healer_unit, heal_amount, heal_type, healed_units)
	local shared_medpack = false

	healed_units[#healed_units + 1] = healed_unit

	if ScriptUnit.has_extension(healed_unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(healed_unit, "buff_system")

		if heal_type ~= "raw_heal" and heal_type ~= "health_conversion" then
			heal_amount = buff_extension:apply_buffs_to_value(heal_amount, "healing_received")
		end

		if buff_extension:has_buff_type("shared_health_pool") then
			local healed_side = Managers.state.side.side_by_unit[healed_unit]
			local player_and_bot_units = healed_side.PLAYER_AND_BOT_UNITS
			local num_player_and_bot_units = #player_and_bot_units
			local num_players_with_shared_health_pool = 1

			for i = 1, num_player_and_bot_units do
				local unit = player_and_bot_units[i]

				if unit ~= healed_unit then
					local target_buff_extension = ScriptUnit.extension(unit, "buff_system")

					if target_buff_extension:has_buff_type("shared_health_pool") then
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
		local unit_id = network_manager:unit_game_object_id(unit)
		local heal_type_id = NetworkLookup.heal_types.debug

		network_transmit:send_rpc_server("rpc_request_heal", unit_id, amount, heal_type_id)
	end
end

DamageUtils.debug_deal_damage = function (victim_unit, damage)
	if not ALIVE[victim_unit] then
		return
	end

	DamageUtils.add_damage_network(victim_unit, victim_unit, damage, "torso", "undefined", nil, Vector3(0, 0, 1), "debug", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
end

DamageUtils.check_distance = function (action, blackboard, attacking_unit, target_unit)
	local breed = blackboard.breed
	local pos_attacker = POSITION_LOOKUP[attacking_unit]
	local pos_target = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)

	if not pos_target then
		return false
	end

	local to_target = pos_target - pos_attacker
	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
	local is_player = blackboard.is_player and not ai_extension
	local current_action = is_player and status_extension:breed_action() or blackboard.action
	local player_radius = 1

	if blackboard.target_dodged_during_attack or blackboard.set_dodge_rotation_timer or blackboard.locked_attack_rotation then
		player_radius = player_radius * (current_action.player_dodged_radius or breed.player_dodged_radius or 0.75)
	end

	if action.use_box_range then
		local x = to_target.x
		local y = to_target.y
		local z = to_target.z
		local flat_range = blackboard.attack_range_flat + player_radius

		if z < blackboard.attack_range_up and z > blackboard.attack_range_down and x * x + y * y < flat_range * flat_range then
			return true
		end
	else
		local dist = Vector3.length(to_target)

		if dist <= (current_action.weapon_reach or breed.weapon_reach or breed.radius) + player_radius then
			return true
		end
	end

	return false
end

DamageUtils.check_infront = function (attacking_unit, target_unit)
	local pos_attacker = POSITION_LOOKUP[attacking_unit]
	local pos_target = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)

	if not pos_target or not pos_attacker then
		return false
	end

	local to_target = Vector3.flat(pos_target - pos_attacker)
	local rot_attacker = unit_local_rotation(attacking_unit, 0)
	local fwd_attacker = Quaternion.forward(rot_attacker)
	local cos_a = Vector3.dot(Vector3.normalize(to_target), fwd_attacker)
	local blackboard = BLACKBOARDS[attacking_unit]
	local breed = blackboard.breed
	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local is_player = blackboard.is_player and not ai_extension
	local current_action = is_player and status_extension:breed_action() or blackboard.action
	local default_reach_cone = 0.866

	if blackboard.target_dodged_during_attack or blackboard.set_dodge_rotation_timer or blackboard.locked_attack_rotation then
		default_reach_cone = current_action.player_dodged_cone or breed.player_dodged_cone or 0.95
	end

	if cos_a > (breed.weapon_reach_cone or default_reach_cone) then
		return true
	end

	return false
end

DamageUtils.check_block = function (attacking_unit, target_unit, fatigue_type, original_enemy_weapon_direction)
	if attacking_unit == target_unit then
		return false
	end

	if type(fatigue_type) == "table" then
		local difficulty_manager = Managers.state.difficulty

		fatigue_type = difficulty_manager:get_difficulty_value_from_table(fatigue_type)
	end

	local network_manager = Managers.state.network
	local _, is_level_unit = network_manager:game_object_or_level_id(target_unit)

	if is_level_unit then
		return false
	elseif DamageUtils.is_ai(target_unit) then
		local shield_blocked = AiUtils.attack_is_shield_blocked(target_unit, attacking_unit, false, original_enemy_weapon_direction)

		if shield_blocked then
			local blackboard = BLACKBOARDS[attacking_unit]
			local action = blackboard.action
			local no_block_stagger = action and action.no_block_stagger

			blackboard.blocked = not no_block_stagger

			return true
		end
	end

	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if status_extension then
		local is_blocking = status_extension:is_blocking()
		local can_block, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction = status_extension:can_block(attacking_unit, original_enemy_weapon_direction)
		local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")
		local is_invulnerable = target_buff_extension and target_buff_extension:has_buff_perk("invulnerable")

		if is_blocking and can_block and not is_invulnerable then
			local buff_extension = ScriptUnit.has_extension(attacking_unit, "buff_system")

			if Managers.player.is_server and buff_extension and buff_extension:has_buff_perk("ai_unblockable") then
				local blackboard = BLACKBOARDS[attacking_unit]

				blackboard.hit_through_block = true

				return false
			end

			status_extension:blocked_attack(fatigue_type, attacking_unit, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction)

			if not LEVEL_EDITOR_TEST and Managers.player.is_server then
				local unit_storage = Managers.state.unit_storage
				local go_id = unit_storage:go_id(target_unit)
				local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]
				local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacking_unit)

				network_manager.network_transmit:send_rpc_clients("rpc_player_blocked_attack", go_id, fatigue_type_id, attacker_unit_id, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction, attacker_is_level_unit)

				local blackboard = BLACKBOARDS[attacking_unit]
				local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
				local is_player = blackboard.is_player and not ai_extension
				local action = is_player and status_extension:breed_action() or blackboard.action

				if action and action.no_block_stagger then
					-- Nothing
				elseif not blackboard.stagger then
					blackboard.blocked = true
				end
			end

			return true
		end
	end

	return false
end

DamageUtils.check_ranged_block = function (attacking_unit, target_unit, fatigue_type)
	local status_extension = ScriptUnit.extension(target_unit, "status_system")
	local is_blocking = status_extension:is_blocking()
	local can_block, fatigue_point_costs_multiplier, improved_block, _ = status_extension:can_block(attacking_unit)
	local breed, blockable_ranged_attack

	if attacking_unit then
		breed = AiUtils.unit_breed(attacking_unit)

		if breed then
			blockable_ranged_attack = breed.blockable_ranged_attack
		end
	end

	if is_blocking and can_block and improved_block then
		local buff_extension = ScriptUnit.has_extension(attacking_unit, "buff_system")

		if Managers.player.is_server and buff_extension and buff_extension:has_buff_perk("ai_unblockable") then
			local blackboard = BLACKBOARDS[attacking_unit]

			blackboard.hit_through_block = true

			return false
		end

		local inventory_extension = ScriptUnit.extension(target_unit, "inventory_system")
		local weapon_data = inventory_extension:get_wielded_slot_item_template()

		if not weapon_data then
			return false
		end

		if not weapon_data.can_block_ranged_attacks and not blockable_ranged_attack then
			return false
		end

		status_extension:blocked_attack(fatigue_type, attacking_unit, fatigue_point_costs_multiplier, false)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage:go_id(target_unit)
			local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]
			local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(attacking_unit)

			if Managers.player.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_player_blocked_attack", go_id, fatigue_type_id, attacker_unit_id, fatigue_point_costs_multiplier, improved_block, "back", attacker_is_level_unit)
			else
				network_manager.network_transmit:send_rpc_server("rpc_player_blocked_attack", go_id, fatigue_type_id, attacker_unit_id, fatigue_point_costs_multiplier, improved_block, "back", attacker_is_level_unit)
			end
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

	local game_mode_manager = Managers.state.game_mode
	local game_end_reason = game_mode_manager and game_mode_manager:get_end_reason()

	if game_end_reason then
		return
	end

	local scale = 1

	if source_unit then
		local d = Vector3.distance(unit_local_position(source_unit, 0), unit_local_position(player_unit_to_shake, 0))

		scale = 1 - math.clamp((d - near_dist) / (far_dist - near_dist), 0, 1)
		scale = far_value + scale * (near_value - far_value)
	end

	Managers.state.camera:camera_effect_shake_event(shake_name, start_time, scale)
end

local INDEX_POSITION = 1
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
local HIT_UNITS = {}
local HIT_DATA = {}

DamageUtils.is_enemy = function (attacker_unit, target_unit)
	local side = Managers.state.side.side_by_unit[attacker_unit]

	return side and side.enemy_units_lookup[target_unit] ~= nil
end

DamageUtils.is_ai = function (unit)
	local breed = AiUtils.unit_breed(unit)

	if breed then
		return breed.is_ai
	end
end

DamageUtils.is_character = function (unit)
	local has_breed = Unit.has_data(unit, "breed")

	return has_breed or false
end

DamageUtils.can_bots_damage = function (unit)
	local is_character, _ = DamageUtils.is_character(unit)
	local is_level_unit = Managers.state.network:level_object_id(unit)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	return is_character or is_level_unit or health_extension.bots_can_do_damage
end

DamageUtils.vs_dark_pact_can_damage = function (damaging_unit, hit_unit)
	local is_character, _ = DamageUtils.is_character(hit_unit)
	local is_level_unit = Managers.state.network:level_object_id(hit_unit)
	local prop_extension = ScriptUnit.has_extension(hit_unit, "props_system")
	local prop_owner = prop_extension and prop_extension.owner and prop_extension:owner()
	local is_enemy_owned = prop_owner and Managers.state.side:is_enemy(damaging_unit, prop_owner)

	return is_character or is_level_unit or is_enemy_owned
end

DamageUtils.allow_friendly_fire_ranged = function (difficulty_settings, attacker_player)
	local friendly_fire_enabled = difficulty_settings.friendly_fire_ranged
	local mechanism_ok, custom_setting_override, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "friendly_fire")

	if mechanism_ok and custom_settings_enabled then
		local attacker_unit = attacker_player and attacker_player.player_unit
		local is_dark_pact_attacker = attacker_unit and Managers.state.side:versus_is_dark_pact(attacker_unit)

		if not is_dark_pact_attacker then
			friendly_fire_enabled = not not custom_setting_override
		end
	end

	return friendly_fire_enabled and attacker_player and not attacker_player.bot_player
end

DamageUtils.allow_friendly_fire_melee = function (difficulty_settings, attacker_player)
	return difficulty_settings.friendly_fire_melee and not attacker_player.bot_player
end

DamageUtils.damage_level_unit = function (hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, hit_normal, damage_source)
	local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

	if no_player_damage then
		return
	end

	local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

	if is_versus then
		local is_objective = ScriptUnit.has_extension(hit_unit, "objective_system")

		if is_objective then
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]

			if not attacker_side or attacker_side:name() ~= "heroes" then
				return
			end
		end
	end

	local target_settings = damage_profile[target_index] or damage_profile.default_target

	if not target_settings then
		return
	end

	local filter_damage_source = unit_get_data(hit_unit, "filter_damage_source")

	if filter_damage_source and filter_damage_source ~= damage_source then
		return
	end

	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local damage_amount = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, nil, damage_source)
	local damage_type = "destructible_level_object_hit"
	local hit_ragdoll_actor, source_attacker_unit, buff_attack_type, hit_react_type, added_dot

	DamageUtils.add_damage_network(hit_unit, attacker_unit, damage_amount, hit_zone_name, damage_type, nil, hit_normal, damage_source, hit_ragdoll_actor, source_attacker_unit, buff_attack_type, hit_react_type, is_critical_strike, added_dot, nil, nil, nil, nil, target_index)
end

DamageUtils._projectile_hit_object = function (current_action, owner_unit, owner_player, owner_buff_extension, target_settings, hit_unit, hit_actor, hit_position, hit_rotation, hit_normal, is_husk, breed, is_server, check_buffs, check_backstab, is_critical_strike, difficulty_rank, power_level, ranged_boost_curve_multiplier, damage_profile, damage_source, critical_hit_effect, world, hit_effect, attack_direction, damage_source_id, damage_profile_id, max_targets, num_penetrations, current_amount_of_mass_hit)
	local hit_units = HIT_UNITS
	local hit_data = HIT_DATA
	local ai_system = Managers.state.entity:system("ai_system")
	local network_manager = Managers.state.network
	local _, is_level_unit = network_manager:game_object_or_level_id(hit_unit)
	local has_health_extension = ScriptUnit.has_extension(hit_unit, "health_system")
	local owner = Managers.player:owner(hit_unit)
	local hit_zone_name = "full"
	local amount_of_mass_hit = current_amount_of_mass_hit
	local allow_ranged_damage = unit_get_data(hit_unit, "allow_ranged_damage") ~= false

	if is_level_unit and not hit_units[hit_unit] and (GameSettingsDevelopment.allow_ranged_attacks_to_damage_props or allow_ranged_damage) and has_health_extension then
		hit_units[hit_unit] = true
		amount_of_mass_hit = amount_of_mass_hit + 1

		local target_index = math.ceil(amount_of_mass_hit)

		DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, ranged_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)

		hit_data.stop = true
		hit_data.hits = num_penetrations + 1
	elseif not is_level_unit and allow_ranged_damage and has_health_extension and not owner then
		hit_units[hit_unit] = true

		local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
		local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
		local weapon_system = Managers.state.entity:system("weapon_system")

		weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", nil, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "first_hit", num_penetrations == 0)

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
	else
		if current_action.alert_sound_range_hit and owner_unit then
			ai_system:alert_enemies_within_range(owner_unit, hit_position, current_action.alert_sound_range_fire)
		end

		local is_inventory_item = ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system")

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
		end
	end

	return amount_of_mass_hit
end

DamageUtils._projectile_hit_character = function (current_action, owner_unit, owner_player, owner_buff_extension, target_settings, hit_unit, hit_actor, hit_position, hit_rotation, hit_normal, is_husk, breed, is_server, check_buffs, is_critical_strike, difficulty_rank, power_level, ranged_boost_curve_multiplier, damage_profile, damage_source, critical_hit_effect, world, hit_effect, attack_direction, damage_source_id, damage_profile_id, max_targets, current_num_penetrations, current_amount_of_mass_hit, target_number)
	local hit_units = HIT_UNITS
	local hit_data = HIT_DATA
	local network_manager = Managers.state.network
	local attacker_unit_id, attacker_is_level_unit = network_manager:game_object_or_level_id(owner_unit)
	local hit_unit_id, _ = network_manager:game_object_or_level_id(hit_unit)
	local hit_zone_name = "torso"
	local predicted_damage = 0
	local invulnerable = false
	local shield_blocked = false
	local num_penetrations = current_num_penetrations
	local amount_of_mass_hit = current_amount_of_mass_hit

	if breed then
		local node = actor_node(hit_actor)
		local hit_zone = breed.hit_zones_lookup[node]

		hit_zone_name = hit_zone.name

		if hit_zone_name ~= "afro" then
			shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit) and not current_action.ignore_shield_hit

			if shield_blocked then
				hit_data.blocked_by_unit = hit_unit
			end
		end
	end

	if current_action.hit_zone_override and hit_zone_name ~= "afro" then
		hit_zone_name = current_action.hit_zone_override
	end

	local unmodified = true

	if hit_zone_name ~= "head" and HEALTH_ALIVE[hit_unit] and breed and breed.hit_zones and breed.hit_zones.head then
		local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
		local auto_headshot = owner_buff_extension and owner_buff_extension:has_buff_perk("auto_headshot")

		if auto_headshot and hit_zone_name ~= "afro" then
			hit_zone_name = "head"
			unmodified = false

			owner_buff_extension:trigger_procs("on_auto_headshot")
		end
	end

	if breed and hit_zone_name == "head" and owner_player and not shield_blocked then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local _, procced = owner_buff_extension:apply_buffs_to_value(0, "coop_stamina")

		if procced and HEALTH_ALIVE[hit_unit] then
			local headshot_coop_stamina_fatigue_type = breed.headshot_coop_stamina_fatigue_type or "headshot_clan_rat"
			local fatigue_type_id = NetworkLookup.fatigue_types[headshot_coop_stamina_fatigue_type]

			if is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_replenish_fatigue_other_players", fatigue_type_id)
			else
				network_manager.network_transmit:send_rpc_server("rpc_replenish_fatigue_other_players", fatigue_type_id)
			end

			StatusUtils.replenish_stamina_local_players(owner_unit, headshot_coop_stamina_fatigue_type)
			first_person_extension:play_hud_sound_event("hud_player_buff_headshot", nil, false)
		end

		if not current_action.no_headshot_sound and HEALTH_ALIVE[hit_unit] then
			first_person_extension:play_hud_sound_event("Play_hud_headshot", nil, false)
		end
	end

	local hit_unit_player = Managers.player:owner(hit_unit)

	if hit_zone_name == "afro" then
		if breed.is_ai then
			local is_enemy = Managers.state.side:is_enemy(hit_unit, owner_unit)

			if is_enemy then
				if is_server then
					if ScriptUnit.has_extension(hit_unit, "ai_system") then
						AiUtils.alert_unit_of_enemy(hit_unit, owner_unit)
					end
				else
					network_manager.network_transmit:send_rpc_server("rpc_alert_enemy", hit_unit_id, attacker_unit_id)
				end
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
		local attack_template = DamageUtils.get_attack_template(attack_template_name)

		if owner_player and breed and check_buffs and not shield_blocked then
			local send_to_server = true
			local buff_type = DamageUtils.get_item_buff_type(damage_source)
			local buffs_checked = DamageUtils.buff_on_attack(owner_unit, hit_unit, "instant_projectile", is_critical_strike, hit_zone_name, target_number or num_penetrations + 1, send_to_server, buff_type, unmodified, damage_source)

			hit_data.buffs_checked = hit_data.buffs_checked or buffs_checked
		end

		if breed and HEALTH_ALIVE[hit_unit] then
			local action_mass_override = current_action.hit_mass_count

			if action_mass_override and action_mass_override[breed.name] then
				local mass_cost = current_action.hit_mass_count[breed.name]

				amount_of_mass_hit = amount_of_mass_hit + (mass_cost or 1)
			else
				amount_of_mass_hit = amount_of_mass_hit + (shield_blocked and (breed.hit_mass_counts_block and breed.hit_mass_counts_block[difficulty_rank] or breed.hit_mass_count_block) or breed.hit_mass_counts and breed.hit_mass_counts[difficulty_rank] or breed.hit_mass_count or 1)
			end

			local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

			if hit_unit_buff_extension then
				amount_of_mass_hit = hit_unit_buff_extension:apply_buffs_to_value(amount_of_mass_hit, "hit_mass_amount")
			end
		end

		local actual_target_index = math.ceil(amount_of_mass_hit)
		local damage_sound = attack_template.sound_type

		predicted_damage, invulnerable = DamageUtils.calculate_damage(DamageOutput, hit_unit, owner_unit, hit_zone_name, power_level, BoostCurves[target_settings.boost_curve_type], ranged_boost_curve_multiplier, is_critical_strike, damage_profile, actual_target_index, nil, damage_source)

		local no_damage = predicted_damage <= 0

		if invulnerable then
			hit_effect = "invulnerable"
			critical_hit_effect = "invulnerable"

			DamageUtils.handle_hit_indication(owner_unit, hit_unit, 0, hit_zone_name, false, true)
		end

		if breed and not breed.is_hero then
			local enemy_type = breed.name

			if is_critical_strike and critical_hit_effect then
				EffectHelper.play_skinned_surface_material_effects(critical_hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked, breed)
			else
				EffectHelper.play_skinned_surface_material_effects(hit_effect, world, hit_unit, hit_position, hit_rotation, hit_normal, is_husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked, breed)
			end

			if Managers.state.network:game() then
				if is_critical_strike and critical_hit_effect then
					EffectHelper.remote_play_skinned_surface_material_effects(critical_hit_effect, world, hit_position, hit_rotation, hit_normal, enemy_type, damage_sound, no_damage, hit_zone_name, is_server)
				else
					EffectHelper.remote_play_skinned_surface_material_effects(hit_effect, world, hit_position, hit_rotation, hit_normal, enemy_type, damage_sound, no_damage, hit_zone_name, is_server)
				end
			end
		elseif hit_unit_player and breed.is_hero and current_action.player_push_velocity then
			local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")
			local no_ranged_knockback = hit_unit_buff_extension and hit_unit_buff_extension:has_buff_perk("no_ranged_knockback")

			if not no_ranged_knockback then
				local status_extension = ScriptUnit.extension(hit_unit, "status_system")

				if not status_extension:is_disabled() then
					local max_impact_push_speed = current_action.max_impact_push_speed
					local locomotion = ScriptUnit.extension(hit_unit, "locomotion_system")

					locomotion:add_external_velocity(current_action.player_push_velocity:unbox(), max_impact_push_speed)
				end
			end
		end

		local deal_damage = true
		local owner_unit_alive = unit_alive(owner_unit)

		if owner_unit_alive and hit_unit_player then
			local range_fatigue_damage = damage_profile.fatigue_damage_override or "blocked_ranged"
			local ranged_block = DamageUtils.check_ranged_block(owner_unit, hit_unit, range_fatigue_damage)

			deal_damage = not ranged_block
			shield_blocked = ranged_block

			if ranged_block and Managers.state.side:versus_is_dark_pact(owner_unit) then
				WwiseUtils.trigger_unit_event(world, "Play_versus_ui_damage_mitigated_indicator", hit_unit)
			end

			local owner_breed = Unit.get_data(owner_unit, "breed")

			if shield_blocked and owner_breed and owner_breed.track_projectile_blocked_vo then
				local t = Managers.time:time("game")
				local tracked_blocked_projectiles = Unit.get_data(owner_unit, "blocked_projectile_hits") or {}
				local num_blocked = #tracked_blocked_projectiles + 1

				tracked_blocked_projectiles[num_blocked] = t

				for i = num_blocked, 1, -1 do
					if t > tracked_blocked_projectiles[i] + DialogueSettings.vs_track_projectiles_blocked_timer then
						table.swap_delete(tracked_blocked_projectiles, i)

						num_blocked = num_blocked - 1
					end
				end

				if num_blocked > DialogueSettings.vs_num_blocked_projectiles_to_track then
					local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")

					dialogue_input:trigger_networked_dialogue_event("vs_ratling_hitting_shield")
					table.clear(tracked_blocked_projectiles)
				end

				Unit.set_data(owner_unit, "blocked_projectile_hits", tracked_blocked_projectiles)
			end
		end

		if hit_unit_player and breed.boss and Managers.state.side:versus_is_dark_pact(owner_unit) then
			deal_damage = false
		end

		if deal_damage then
			local weapon_system = Managers.state.entity:system("weapon_system")

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", actual_target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "attacker_is_level_unit", attacker_is_level_unit, "first_hit", num_penetrations == 0)
			EffectHelper.player_critical_hit(world, is_critical_strike, owner_unit, hit_unit, hit_position)
			Managers.state.game_mode:game_mode():projectile_hit_character(owner_player, nil, owner_unit, hit_unit, hit_position, breed, attack_direction, predicted_damage)

			if not owner_player and owner_unit_alive and hit_unit_player and hit_unit_player.bot_player then
				local bot_ai_extension = ScriptUnit.extension(hit_unit, "ai_system")

				bot_ai_extension:hit_by_projectile(owner_unit)
			end
		end

		local armor_override = unit_get_data(hit_unit, "armor")
		local target_unit_armor, _, target_unit_primary_armor, _ = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)

		if no_damage or shield_blocked or target_unit_primary_armor == 6 or target_unit_armor == 2 then
			max_targets = num_penetrations
		else
			num_penetrations = num_penetrations + 1
		end

		if max_targets <= amount_of_mass_hit then
			hit_data.stop = true
			hit_data.hits = num_penetrations
		end
	end

	return amount_of_mass_hit, num_penetrations, predicted_damage, shield_blocked
end

DamageUtils.process_projectile_hit = function (world, damage_source, owner_unit, is_server, raycast_result, current_action, direction, check_buffs, target, ignore_list, is_critical_strike, power_level, override_damage_profile_name, target_number)
	table.clear(HIT_UNITS)
	table.clear(HIT_DATA)

	local hit_units = HIT_UNITS
	local hit_data = HIT_DATA
	local attack_direction = direction
	local owner_player = owner_unit and Managers.player:owner(owner_unit)
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local check_backstab = false
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
	local amount_of_mass_hit = 0
	local num_penetrations = 0
	local num_additional_penetrations = 0
	local predicted_damage, shield_blocked

	power_level = power_level or DefaultPowerLevel

	local damage_profile_name = override_damage_profile_name or current_action.damage_profile or "default"
	local override_damage_profile = override_damage_profile_name and DamageProfileTemplates[override_damage_profile_name]
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	local damage_profile = override_damage_profile or DamageProfileTemplates[damage_profile_name]
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local cleave_power_level = ActionUtils.scale_power_levels(power_level, "cleave", owner_unit, difficulty_level)
	local max_targets_attack, max_targets_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)

	if owner_buff_extension then
		num_additional_penetrations = owner_buff_extension:apply_buffs_to_value(num_additional_penetrations, "ranged_additional_penetrations")
	end

	local _, ranged_boost_curve_multiplier = ActionUtils.get_ranged_boost(owner_unit)
	local max_targets = max_targets_impact < max_targets_attack and max_targets_attack or max_targets_impact
	local owner_is_bot = owner_player and owner_player.bot_player
	local is_husk = owner_is_bot and true or false
	local hit_effect = current_action.hit_effect
	local critical_hit_effect = current_action.critical_hit_effect
	local num_hits = #raycast_result

	hit_data.hits = num_penetrations

	local friendly_fire_disabled = damage_profile.no_friendly_fire
	local forced_friendly_fire = damage_profile.allow_friendly_fire
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local allow_friendly_fire = forced_friendly_fire or not friendly_fire_disabled and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)
	local side_manager = Managers.state.side
	local player_manager = Managers.player

	for i = 1, num_hits do
		repeat
			local hit = raycast_result[i]
			local hit_position = hit[INDEX_POSITION]
			local hit_normal = hit[INDEX_NORMAL]
			local hit_actor = hit[INDEX_ACTOR]
			local hit_valid_target = hit_actor ~= nil
			local hit_unit = hit_valid_target and actor_unit(hit_actor) or nil

			if not unit_alive(hit_unit) or Unit.is_frozen(hit_unit) then
				hit_valid_target = false
				hit_unit = nil
			else
				hit_unit, hit_actor = ActionUtils.redirect_shield_hit(hit_unit, hit_actor)
			end

			local attack_hit_self = hit_unit == owner_unit

			if attack_hit_self or not hit_valid_target then
				break
			end

			local target_settings = damage_profile.targets and damage_profile.targets[num_penetrations + 1] or damage_profile.default_target
			local hit_rotation = Quaternion.look(hit_normal)
			local is_target = hit_unit == target or target == nil
			local breed = AiUtils.unit_breed(hit_unit)
			local hit_zone_name

			if breed then
				local node = actor_node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]

				hit_zone_name = hit_zone.name

				if ignore_list and ignore_list[hit_unit] and hit_zone_name ~= "afro" then
					return hit_data
				end
			end

			local is_player = player_manager:is_player_unit(hit_unit)
			local is_character = breed or is_player

			hit_data.hit_any_player = hit_data.hit_any_player or is_player

			local block_processing = false

			if is_character and owner_player then
				local side = side_manager.side_by_unit[hit_unit]
				local owner_side = side_manager.side_by_unit[owner_unit]
				local units_on_same_side = side and owner_side and side.side_id == owner_side.side_id

				if side and owner_side and units_on_same_side and not breed.boss then
					block_processing = not allow_friendly_fire or breed.disable_projectile_friendly_fire
				end
			end

			if not is_character and not hit_units[hit_unit] then
				amount_of_mass_hit = DamageUtils._projectile_hit_object(current_action, owner_unit, owner_player, owner_buff_extension, target_settings, hit_unit, hit_actor, hit_position, hit_rotation, hit_normal, is_husk, breed, is_server, check_buffs, check_backstab, is_critical_strike, difficulty_rank, power_level, ranged_boost_curve_multiplier, damage_profile, damage_source, critical_hit_effect, world, hit_effect, attack_direction, damage_source_id, damage_profile_id, max_targets, num_penetrations, amount_of_mass_hit)

				if hit_data.stop then
					if num_additional_penetrations > 0 then
						num_additional_penetrations = num_additional_penetrations - 1
						hit_data.stop = false

						break
					end

					hit_data.hit_unit = hit_unit
					hit_data.hit_actor = hit_actor
					hit_data.hit_position = hit_position
					hit_data.hit_direction = attack_direction

					return hit_data
				end

				break
			end

			if not hit_units[hit_unit] and is_target and not block_processing then
				amount_of_mass_hit, num_penetrations, predicted_damage, shield_blocked = DamageUtils._projectile_hit_character(current_action, owner_unit, owner_player, owner_buff_extension, target_settings, hit_unit, hit_actor, hit_position, hit_rotation, hit_normal, is_husk, breed, is_server, check_buffs, is_critical_strike, difficulty_rank, power_level, ranged_boost_curve_multiplier, damage_profile, damage_source, critical_hit_effect, world, hit_effect, attack_direction, damage_source_id, damage_profile_id, max_targets, num_penetrations, amount_of_mass_hit, target_number)

				if hit_data.stop then
					if num_additional_penetrations > 0 then
						num_additional_penetrations = num_additional_penetrations - 1
						hit_data.stop = false

						break
					end

					hit_data.hit_unit = hit_unit
					hit_data.hit_actor = hit_actor
					hit_data.hit_position = hit_position
					hit_data.hit_direction = attack_direction
					hit_data.predicted_damage = predicted_damage
					hit_data.shield_blocked = shield_blocked
					hit_data.hit_player = is_player

					return hit_data
				end
			end
		until true
	end

	return hit_data
end

local modified_boost_curve = {}

DamageUtils.get_modified_boost_curve = function (boost_curve, boost_curve_coefficient)
	table.clear(modified_boost_curve)

	for index, _ in ipairs(boost_curve) do
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

	if damage_left > 0 and time_left > 0 then
		return true
	end

	return false
end

local function action_ignores_stagger(blackboard, attack_template, stagger_type, target_unit, is_player)
	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
	local action = is_player and status_extension:breed_action() or blackboard.action
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
			local health_ignore_stagger = health_percent > health_threshold.min and health_percent <= health_threshold.max

			return health_ignore_stagger
		elseif type == "reset_attack" then
			blackboard.reset_attack = true
			blackboard.reset_attack_delay = ignore_stagger.delay

			return true
		end
	elseif type(ignore_stagger) == "boolean" then
		return ignore_stagger
	else
		error("action_ignores_stagger: unsupported type")
	end
end

DamageUtils.stagger_ai = function (t, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocked, damage_source, source_attacker_unit, optional_predicted_damage)
	local hazard = EnvironmentalHazards[damage_source]

	if not damage_profile.always_stagger_ai and not DamageUtils.is_enemy(source_attacker_unit or attacker_unit, target_unit) and (not hazard or not hazard.enemy.can_stagger) then
		return
	end

	local ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")
	local blackboard = ai_extension and ai_extension:blackboard() or BLACKBOARDS[target_unit]

	if not blackboard then
		return
	end

	local is_hero_player = blackboard.breed.is_hero and not ai_extension

	if is_hero_player then
		return
	end

	if is_stagger_immune(blackboard, t) then
		return
	end

	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local attack_template_name = target_settings.attack_template
	local attack_template = DamageUtils.get_attack_template(attack_template_name)
	local stagger_type, stagger_duration, stagger_length, stagger_value = DamageUtils.calculate_stagger_player(ImpactTypeOutput, target_unit, attacker_unit, hit_zone_name, power_level, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, blocked, damage_source)
	local is_push = damage_profile.is_push

	if stagger_type == 0 then
		return
	end

	local is_player = blackboard.is_player and not ai_extension

	if action_ignores_stagger(blackboard, attack_template, stagger_type, target_unit, is_player) then
		return
	end

	if not is_player then
		add_stagger_hit(blackboard, t)
	end

	local stagger_angle = attack_template.stagger_angle
	local target_unit_position = POSITION_LOOKUP[target_unit] or unit_world_position(target_unit, 0)
	local attacker_position = POSITION_LOOKUP[attacker_unit] or unit_world_position(attacker_unit, 0)

	if stagger_angle == "down" or stagger_angle == "smiter" and blocked then
		attack_direction = Vector3.normalize(target_unit_position - attacker_position)
		attack_direction.z = -1
	elseif stagger_angle == "stab" or stagger_angle == "smiter" or blocked then
		attack_direction = Vector3.normalize(target_unit_position - attacker_position)
	elseif stagger_angle == "pull" then
		attack_direction = Vector3.normalize(attacker_position - target_unit_position)
	end

	if stagger_type > stagger_types.none then
		if is_player then
			DamageUtils.stagger_player(target_unit, blackboard.breed, attack_direction, stagger_length, stagger_type, stagger_duration, attack_template.stagger_animation_scale, t, stagger_value, attack_template.always_stagger, is_push)
		else
			AiUtils.stagger(target_unit, blackboard, attacker_unit, attack_direction, stagger_length, stagger_type, stagger_duration, attack_template.stagger_animation_scale, t, stagger_value, attack_template.always_stagger, is_push, nil, optional_predicted_damage)
		end

		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template
		local weapon_template = weapon_template_name and WeaponUtils.get_weapon_template(weapon_template_name)
		local buff_type = weapon_template and weapon_template.buff_type or nil
		local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")

		if attacker_buff_extension and not blackboard.override_stagger then
			Managers.state.achievement:trigger_event("register_ai_stagger", target_unit, attacker_unit, damage_profile, is_push, stagger_type)
			attacker_buff_extension:trigger_procs("on_stagger", target_unit, damage_profile, attacker_unit, stagger_type, stagger_duration, stagger_value, buff_type, target_index)
		end

		local attacked_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

		if attacked_buff_extension then
			attacked_buff_extension:trigger_procs("on_staggered", target_unit, damage_profile, attacker_unit, stagger_type, stagger_duration, stagger_value, buff_type, target_index)
		end
	end
end

local damage_source_procs = {
	charge_ability_hit = "on_charge_ability_hit",
	charge_ability_hit_blast = "on_charge_ability_hit_blast",
}

DamageUtils.server_apply_hit = function (t, attacker_unit, target_unit, hit_zone_name, hit_position, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, source_attacker_unit, optional_predicted_damage)
	source_attacker_unit = source_attacker_unit or attacker_unit

	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension and damage_source_procs[damage_source] then
		buff_extension:trigger_procs(damage_source_procs[damage_source], target_unit, target_index)
	end

	if not blocking then
		local attack_power_level = power_level

		if not can_damage then
			attack_power_level = 0
		end

		if damage_profile.charge_value == "heavy_attack" and DamageUtils.is_player_unit(attacker_unit) then
			local status_extension = ScriptUnit.has_extension(attacker_unit, "status_system")

			if status_extension then
				local current_fall_distance = status_extension:fall_distance()

				if current_fall_distance >= MinFallDistanceForBonus then
					attack_power_level = attack_power_level * FallingPowerLevelBonusMultiplier
				end
			end
		end

		local added_dot = false

		if buff_extension then
			local witch_hunter_bleed = buff_extension:has_buff_perk("victor_witchhunter_bleed_on_critical_hit") and (damage_profile.charge_value == "light_attack" or damage_profile.charge_value == "heavy_attack") and not buff_extension:has_buff_perk("victor_witchhunter_bleed_on_critical_hit_disable")
			local kerillian_bleed = buff_extension:has_buff_perk("kerillian_critical_bleed_dot") and damage_profile.charge_value == "projectile" and not buff_extension:has_buff_perk("kerillian_critical_bleed_dot_disable")
			local generic_melee_bleed = buff_extension:has_buff_perk("generic_melee_bleed") and (damage_profile.charge_value == "light_attack" or damage_profile.charge_value == "heavy_attack")
			local custom_dot_name

			if witch_hunter_bleed or kerillian_bleed or generic_melee_bleed then
				custom_dot_name = "weapon_bleed_dot_whc"
			elseif buff_extension:has_buff_perk("sienna_unchained_burn_push") and damage_profile and damage_profile.is_push then
				custom_dot_name = "burning_dot_unchained_push"
			end

			if custom_dot_name then
				local custom_dot = FrameTable.alloc_table()

				custom_dot.dot_template_name = custom_dot_name

				local added_custom_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, nil, source_attacker_unit, custom_dot)

				added_dot = added_dot or added_custom_dot
			end
		end

		if (not damage_profile.require_damage_for_dot or attack_power_level ~= 0) and not added_dot then
			local added_profile_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, nil, source_attacker_unit, nil)

			added_dot = added_dot or added_profile_dot
		end

		DamageUtils.add_damage_network_player(damage_profile, target_index, attack_power_level, target_unit, attacker_unit, hit_zone_name, hit_position, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)
	elseif shield_breaking_hit then
		local shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")

		if shield_extension then
			local item_actually_dropped = shield_extension:break_shield()

			if item_actually_dropped and buff_extension then
				buff_extension:trigger_procs("on_broke_shield", target_unit)
			end
		end

		blocking = false
	end

	local target_alive = HEALTH_ALIVE[target_unit]

	if target_alive and not damage_profile.no_stagger then
		local stagger_power_level = power_level

		if not can_stagger then
			stagger_power_level = 0
		end

		DamageUtils.stagger_ai(t, damage_profile, target_index, stagger_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocking, damage_source, source_attacker_unit, optional_predicted_damage)
	end
end

local function parse_dot_name(damage_profile, target_index, explosion_or_aoe_data, custom_dot)
	local dot_name
	local balefire = false

	if custom_dot then
		dot_name = custom_dot.dot_template_name
		balefire = custom_dot.dot_balefire_variant
	elseif explosion_or_aoe_data and explosion_or_aoe_data.dot_template_name then
		dot_name = explosion_or_aoe_data.dot_template_name
		balefire = explosion_or_aoe_data.dot_balefire_variant
	elseif damage_profile then
		local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target

		if target_settings then
			dot_name = target_settings.dot_template_name
			balefire = target_settings.dot_balefire_variant
		end

		if not dot_name then
			dot_name = damage_profile.dot_template_name
			balefire = damage_profile.dot_balefire_variant
		end
	end

	return dot_name, balefire
end

DamageUtils.apply_dot = function (damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, explosion_or_aoe_data, source_attacker_unit, custom_dot)
	if damage_profile then
		local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target

		if damage_profile.allow_dot_finesse_hit then
			local breed = AiUtils.unit_breed(target_unit)
			local multiplier_type = DamageUtils.get_breed_damage_multiplier_type(breed, hit_zone_name)
			local is_finesse_hit = multiplier_type == "headshot" or multiplier_type == "weakspot" or multiplier_type == "protected_weakspot"

			if is_finesse_hit or is_critical_strike then
				local boost_coefficient_headshot = target_settings.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient
				local boost_curve = BoostCurves[target_settings.boost_curve_type]
				local modified_boost_curve_head_shot = DamageUtils.get_modified_boost_curve(boost_curve, boost_coefficient_headshot)
				local fallback_armor_type = 1
				local target_unit_armor, _, target_unit_primary_armor, _ = ActionUtils.get_target_armor(hit_zone_name, breed, fallback_armor_type)
				local head_shot_boost_amount = get_head_shot_boost_amount(target_settings, damage_profile, is_finesse_hit, multiplier_type, true, target_unit_armor, target_unit_primary_armor)
				local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

				if attacker_buff_extension then
					if is_finesse_hit then
						head_shot_boost_amount = attacker_buff_extension:apply_buffs_to_value(head_shot_boost_amount, "headshot_multiplier")
					end

					if is_critical_strike then
						head_shot_boost_amount = attacker_buff_extension:apply_buffs_to_value(head_shot_boost_amount, "critical_strike_effectiveness")
					end
				end

				local target_unit_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

				if target_unit_buff_extension and is_finesse_hit then
					head_shot_boost_amount = target_unit_buff_extension:apply_buffs_to_value(head_shot_boost_amount, "headshot_vulnerability")
				end

				local head_shot_boost_multiplier = DamageUtils.get_boost_curve_multiplier(modified_boost_curve_head_shot or boost_curve, head_shot_boost_amount)

				power_level = power_level + power_level * head_shot_boost_multiplier
			end
		end
	end

	local dot_template_name, dot_balefire_variant = parse_dot_name(damage_profile, target_index, explosion_or_aoe_data, custom_dot)

	if dot_balefire_variant then
		local career_extension = ScriptUnit.has_extension(source_attacker_unit, "career_system") or ScriptUnit.has_extension(attacker_unit, "career_system")

		dot_template_name = career_extension and career_extension:career_name() == "bw_necromancer" and BalefireBurnDotLookup[dot_template_name] or dot_template_name
	end

	local applied_dot = false
	local dot_type = DotTypeLookup[dot_template_name]

	if dot_type then
		local dot_func = Dots[dot_type]

		applied_dot = dot_func(dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, source_attacker_unit)

		if applied_dot then
			Managers.state.achievement:trigger_event("on_dot_applied", dot_template_name, damage_source, attacker_unit)
		end
	end

	return applied_dot
end

DamageUtils.custom_calculate_damage = function (attacker_unit, damage_source, power_level, damage_profile, target_index, range_scalar_multiplier, is_critical_strike, backstab_multiplier, has_power_boost, boost_damage_multiplier, breed, hit_zone_name, stagger_level, difficulty_level)
	local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local fallback_armor_type = 1
	local armor_type, _, primary_armor_type, _ = ActionUtils.get_target_armor(hit_zone_name, breed, fallback_armor_type)
	local difficulty_settings = DifficultySettings[difficulty_level]
	local damage_output = DamageOutput
	local static_base_damage = false
	local is_friendly_fire = false
	local has_crit_head_shot_killing_blow_perk = false
	local has_crit_backstab_killing_blow_perk = false
	local target_buff_extension, target_max_health, target_unit
	local base_damage = do_damage_calculation(attacker_unit, damage_source, power_level, damage_output, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, range_scalar_multiplier, static_base_damage, is_friendly_fire, has_power_boost, difficulty_level, armor_type, primary_armor_type, has_crit_head_shot_killing_blow_perk, has_crit_backstab_killing_blow_perk, target_max_health, target_unit)
	local stagger_damage = base_damage * DamageUtils.calculate_stagger_multiplier(damage_profile, target_buff_extension, difficulty_settings, stagger_level)
	local total_damage = base_damage + stagger_damage

	return total_damage, base_damage, stagger_damage
end

DamageUtils.calculate_stagger_multiplier = function (damage_profile, target_buff_extension, difficulty_settings, stagger_number)
	if difficulty_settings then
		local min_stagger_damage_coefficient = difficulty_settings.min_stagger_damage_coefficient
		local stagger_damage_multiplier = difficulty_settings.stagger_damage_multiplier

		if stagger_damage_multiplier then
			local bonus_damage_percentage = stagger_number * stagger_damage_multiplier

			if target_buff_extension and not damage_profile.no_stagger_damage_reduction_ranged then
				bonus_damage_percentage = target_buff_extension:apply_buffs_to_value(bonus_damage_percentage, "unbalanced_damage_taken")
			end

			local stagger_damage_mult = min_stagger_damage_coefficient + bonus_damage_percentage - 1

			return stagger_damage_mult
		end
	end

	return 0
end

local dot_hit_types = {
	arrow_poison_dot = true,
	bleed = true,
	burninating = true,
}
local dmg_color_lookup = {
	{
		255,
		252,
		219,
		3,
	},
	{
		255,
		252,
		169,
		3,
	},
	{
		255,
		252,
		128,
		3,
	},
	{
		255,
		252,
		98,
		3,
	},
	{
		255,
		252,
		65,
		3,
	},
	{
		255,
		207,
		49,
		31,
	},
	{
		255,
		156,
		29,
		19,
	},
}

DamageUtils.get_color_from_damage = function (damage)
	local index = math.clamp(math.floor(math.remap(0, 30, 1, 7, damage)), 1, 7)
	local color = dmg_color_lookup[index]

	return color
end

DamageUtils.add_unit_floating_damage_numbers = function (unit, damage_type, damage_amount, is_critical_strike, streak_damage, z_offset_override, damage_numbers_font_override, data)
	local color
	local is_dot_damage = dot_hit_types[damage_type]

	if streak_damage then
		local c = DamageUtils.get_color_from_damage(streak_damage)

		color = Vector3(c[2], c[3], c[4])
	else
		local color_modifier_red = math.min(120 + damage_amount * 4, 255)
		local color_modifier_green = math.max(200 - damage_amount * 4, 0)

		if is_dot_damage then
			color = Vector3(192, 192, 192)
		else
			color = Vector3(color_modifier_red, color_modifier_green, 0)
		end
	end

	local text_size = 40 + damage_amount * 0.75 * (damage_numbers_font_override or 1)
	local duration = 2.2

	if is_critical_strike then
		color[1] = 255
		duration = 3.2
		text_size = text_size + 0.05
	end

	if is_dot_damage then
		duration = 1.5
		text_size = text_size - 0.05
	end

	Managers.state.event:trigger("add_damage_number", damage_amount, text_size, unit, duration, color, is_critical_strike, z_offset_override, data)
end

DamageUtils.add_hit_reaction = function (hit_unit, breed, husk, attack_direction, target_presumed_dead)
	if husk or target_presumed_dead or not breed or breed.disable_local_hit_reactions or not unit_has_animation_state_machine(hit_unit) then
		return
	end

	local hit_anim

	if unit_has_animation_event(hit_unit, "hit_reaction_climb") then
		local network_manager = Managers.state.network
		local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
		local action_name = NetworkLookup.bt_action_names[GameSession.game_object_field(network_manager:game(), hit_unit_id, "bt_action_name")]

		if action_name and action_name == "climb" then
			hit_anim = "hit_reaction_climb"
		end
	end

	local hit_unit_dir = Quaternion.forward(unit_local_rotation(hit_unit, 0))
	local angle_difference = Vector3.flat_angle(hit_unit_dir, attack_direction)

	if not hit_anim and breed.hit_reaction_function then
		hit_anim = breed.hit_reaction_function(hit_unit, breed, hit_unit_dir, attack_direction, angle_difference)
	else
		hit_anim = hit_anim or (angle_difference < -math.pi * 0.75 or angle_difference > math.pi * 0.75) and "hit_reaction_backward" or angle_difference < -math.pi * 0.25 and "hit_reaction_left" or angle_difference < math.pi * 0.25 and "hit_reaction_forward" or "hit_reaction_right"
	end

	unit_animation_event(hit_unit, hit_anim)
end

DamageUtils.attacker_is_fire_bomb = function (attacker_unit)
	local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

	if not liquid_extension then
		return false
	end

	if liquid_extension.explosion_template_name ~= "fire_grenade" and liquid_extension.explosion_template_name ~= "frag_fire_grenade" then
		return false
	end

	return true
end

DamageUtils.get_attack_template = function (template_name)
	return MechanismOverrides.get(AttackTemplates[template_name])
end
