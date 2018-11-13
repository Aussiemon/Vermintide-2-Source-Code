ActionUtils = ActionUtils or {}
local unit_get_data = Unit.get_data
local unit_actor = Unit.actor
local unit_find_actor = Unit.find_actor
script_data.no_critical_strikes = script_data.no_critical_strikes or Development.parameter("no_critical_strikes")
script_data.always_critical_strikes = script_data.always_critical_strikes or Development.parameter("always_critical_strikes")
script_data.alternating_critical_strikes = script_data.alternating_critical_strikes or Development.parameter("alternating_critical_strikes")

ActionUtils.get_power_level_percentage = function (power_level)
	local min_power_level = MIN_POWER_LEVEL
	local max_power_level = MAX_POWER_LEVEL
	local percentage = (power_level - min_power_level) / (max_power_level - min_power_level)

	return percentage
end

ActionUtils.get_max_targets = function (damage_profile, cleave_power_level)
	local cleave_distribution = damage_profile.cleave_distribution or DefaultCleaveDistribution
	local cleave_range = Cleave.max - Cleave.min
	local attack_cleave_power_level = cleave_power_level * cleave_distribution.attack
	local attack_percentage = ActionUtils.get_power_level_percentage(attack_cleave_power_level)
	local max_targets_attack = cleave_range * attack_percentage
	local impact_cleave_power_level = cleave_power_level * cleave_distribution.impact
	local impact_percentage = ActionUtils.get_power_level_percentage(impact_cleave_power_level)
	local max_targets_impact = cleave_range * impact_percentage

	return max_targets_attack, max_targets_impact
end

ActionUtils.get_target_armor = function (hit_zone_name, breed, dummy_unit_armor)
	local target_unit_armor_attack, target_unit_armor_impact, target_unit_armor, target_unit_primary_armor_attack, target_unit_primary_armor_impact = nil

	if breed and hit_zone_name then
		local hitzone_armor_categories = breed.hitzone_armor_categories
		target_unit_armor = (hitzone_armor_categories and hitzone_armor_categories[hit_zone_name]) or breed.armor_category

		if type(target_unit_armor) == "table" then
			target_unit_armor_attack = target_unit_armor.attack
			target_unit_armor_impact = target_unit_armor.impact
		else
			target_unit_armor_attack = target_unit_armor
			target_unit_armor_impact = target_unit_armor
		end

		local hitzone_primary_armor_categories = breed.hitzone_primary_armor_categories
		local target_pritority_unit_armor = (hitzone_primary_armor_categories and hitzone_primary_armor_categories[hit_zone_name]) or breed.primary_armor_category

		if type(target_pritority_unit_armor) == "table" then
			target_unit_primary_armor_attack = target_pritority_unit_armor.attack
			target_unit_primary_armor_impact = target_pritority_unit_armor.impact
		else
			target_unit_primary_armor_attack = breed.primary_armor_category
			target_unit_primary_armor_impact = breed.primary_armor_category
		end
	elseif breed then
		target_unit_armor_attack = breed.armor_category
		target_unit_armor_impact = breed.armor_category
		target_unit_primary_armor_attack = breed.primary_armor_category
		target_unit_primary_armor_impact = breed.primary_armor_category
	elseif dummy_unit_armor then
		target_unit_armor_attack = dummy_unit_armor
		target_unit_armor_impact = dummy_unit_armor
	else
		local player_armor = 1
		target_unit_armor_attack = player_armor
		target_unit_armor_impact = player_armor
	end

	return target_unit_armor_attack, target_unit_armor_impact, target_unit_primary_armor_attack, target_unit_primary_armor_impact
end

ActionUtils.get_dropoff_scalar = function (damage_profile, target_settings, attacker_unit, target_unit)
	local range_dropoff_settings = target_settings.range_dropoff_settings or damage_profile.range_dropoff_settings

	if not range_dropoff_settings then
		return 0
	end

	local attacker_position = POSITION_LOOKUP[attacker_unit] or Unit.world_position(attacker_unit, 0)
	local target_position = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)
	local distance = Vector3.distance(target_position, attacker_position)
	local dropoff_start = range_dropoff_settings.dropoff_start
	local dropoff_end = range_dropoff_settings.dropoff_end
	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension:has_buff_perk("no_damage_dropoff") then
		dropoff_start = dropoff_start * 2
		dropoff_end = dropoff_end * 2
	end

	local dropoff_scale = dropoff_end - dropoff_start
	local dropoff_distance = math.clamp(distance - dropoff_start, 0, dropoff_scale)
	local dropoff_scalar = dropoff_distance / dropoff_scale

	return dropoff_scalar
end

ActionUtils.get_armor_power_modifier = function (power_type, damage_profile, target_settings, target_unit_armor, target_unit_primary_armor, critical_strike_settings, dropoff_scalar)
	local armor_modifier = target_settings.armor_modifier or damage_profile.armor_modifier or DefaultArmorPowerModifier
	local armor_modifier_near = target_settings.armor_modifier_near or damage_profile.armor_modifier_near
	local armor_modifier_far = target_settings.armor_modifier_far or damage_profile.armor_modifier_far
	local armor_power_modifier, critical_armor_power_modifier = nil

	if critical_strike_settings then
		critical_armor_power_modifier = critical_strike_settings[power_type .. "_armor_power_modifer"]
	end

	if critical_armor_power_modifier and critical_armor_power_modifier[target_unit_armor] then
		armor_power_modifier = (target_unit_primary_armor and critical_armor_power_modifier[target_unit_primary_armor]) or critical_armor_power_modifier[target_unit_armor]
	elseif armor_modifier_near and armor_modifier_far and dropoff_scalar then
		local armor_power_modifier_near = (target_unit_primary_armor and armor_modifier_near[power_type][target_unit_primary_armor]) or armor_modifier_near[power_type][target_unit_armor] or 1
		local armor_power_modifier_far = (target_unit_primary_armor and armor_modifier_far[power_type][target_unit_primary_armor]) or armor_modifier_far[power_type][target_unit_armor] or 1
		armor_power_modifier = math.lerp(armor_power_modifier_near, armor_power_modifier_far, dropoff_scalar)
	else
		armor_power_modifier = (target_unit_primary_armor and armor_modifier[power_type][target_unit_primary_armor]) or armor_modifier[power_type][target_unit_armor] or 1
	end

	return armor_power_modifier
end

ActionUtils.scale_power_levels = function (power_level, power_type, attacker_unit, difficulty_level)
	local actual_power_level = power_level

	if not global_is_inside_inn then
		local difficulty_settings = DifficultySettings[difficulty_level]
		local difficulty_power_level_cap = difficulty_settings.power_level_cap
		local difficulty_power_level_max_target = difficulty_settings.power_level_max_target

		if difficulty_power_level_cap < actual_power_level and difficulty_power_level_max_target then
			local above_cap = actual_power_level - difficulty_power_level_cap
			local cap_to_max = 800 - difficulty_power_level_cap
			actual_power_level = difficulty_power_level_cap + difficulty_power_level_max_target * above_cap / cap_to_max
		else
			actual_power_level = math.min(power_level, difficulty_power_level_cap)
		end
	end

	local scaled_power_level = actual_power_level

	if MIN_POWER_LEVEL_CAP <= actual_power_level then
		local starting_power_level_bonus = 50
		local starting_bonus_range = 100
		local native_diff_ratio = 5
		local scaled_power_level_section = nil

		if actual_power_level >= MIN_POWER_LEVEL_CAP + starting_bonus_range then
			scaled_power_level_section = (actual_power_level - MIN_POWER_LEVEL_CAP) * (POWER_LEVEL_DIFF_RATIO[power_type] - 1) / (native_diff_ratio - 1)
		else
			local starting_bonus = starting_power_level_bonus * (1 - (actual_power_level - 200) / starting_bonus_range)
			scaled_power_level_section = ((actual_power_level + starting_bonus) - MIN_POWER_LEVEL_CAP) * (POWER_LEVEL_DIFF_RATIO[power_type] - 1) / (native_diff_ratio - 1)
		end

		scaled_power_level = MIN_POWER_LEVEL_CAP + scaled_power_level_section
	end

	if attacker_unit then
		scaled_power_level = ActionUtils.apply_buffs_to_power_level(attacker_unit, scaled_power_level)
	end

	return scaled_power_level
end

ActionUtils.get_power_level = function (power_type, power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar, attacker_unit, difficulty_level)
	local power_distribution = target_settings.power_distribution or damage_profile.power_distribution or DefaultPowerDistribution
	local power_distribution_near = target_settings.power_distribution_near or damage_profile.power_distribution_near
	local power_distribution_far = target_settings.power_distribution_far or damage_profile.power_distribution_far
	local power_multiplier = nil

	if power_distribution_near and power_distribution_far and dropoff_scalar then
		local power_near = power_distribution_near[power_type]
		local power_far = power_distribution_far[power_type]
		power_multiplier = math.lerp(power_near, power_far, dropoff_scalar)
	else
		power_multiplier = power_distribution[power_type]
	end

	local scaled_power_level = ActionUtils.scale_power_levels(power_level, power_type, attacker_unit, difficulty_level)

	return scaled_power_level * power_multiplier
end

ActionUtils.get_power_level_for_target = function (original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, hit_zone_name, armor_type_override, damage_source, breed, dummy_unit_armor, dropoff_scalar, difficulty_level, target_unit_armor, target_unit_primary_armor)
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local critical_strike_settings = is_critical_strike and damage_profile.critical_strike
	local attack_armor_power_modifer, impact_armor_power_modifer = nil
	local power_level = original_power_level
	local is_enemy_target = breed or dummy_unit_armor
	local target_unit_armor_attack = target_unit_armor
	local target_unit_armor_impact = target_unit_armor
	local target_unit_primary_armor_attack = target_unit_primary_armor
	local target_unit_primary_armor_impact = target_unit_primary_armor

	if armor_type_override then
		target_unit_armor_attack = armor_type_override
		target_unit_armor_impact = armor_type_override
		target_unit_primary_armor_attack = armor_type_override
		target_unit_primary_armor_impact = armor_type_override
	end

	attack_armor_power_modifer = ActionUtils.get_armor_power_modifier("attack", damage_profile, target_settings, target_unit_armor_attack, target_unit_primary_armor_attack, critical_strike_settings, dropoff_scalar)
	impact_armor_power_modifer = ActionUtils.get_armor_power_modifier("impact", damage_profile, target_settings, target_unit_armor_impact, target_unit_primary_armor_impact, critical_strike_settings, dropoff_scalar)
	local lord_armor = breed and breed.lord_armor

	if lord_armor and target_unit_primary_armor_attack == 6 and attack_armor_power_modifer == 0 then
		local new_armor_power_modifer = ActionUtils.get_armor_power_modifier("attack", damage_profile, target_settings, target_unit_armor_attack, nil, critical_strike_settings, dropoff_scalar)
		attack_armor_power_modifer = attack_armor_power_modifer + new_armor_power_modifer * lord_armor
	end

	local attack_power = ActionUtils.get_power_level("attack", power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar, attacker_unit, difficulty_level)
	local impact_power = ActionUtils.get_power_level("impact", power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar, attacker_unit, difficulty_level)

	if is_enemy_target then
		attack_power = ActionUtils.apply_buffs_to_power_level_on_hit(attacker_unit, attack_power, breed, damage_source, dummy_unit_armor)
		impact_power = ActionUtils.apply_buffs_to_power_level_on_hit(attacker_unit, impact_power, breed, damage_source, dummy_unit_armor)
	end

	attack_power = attack_power * attack_armor_power_modifer
	impact_power = impact_power * impact_armor_power_modifer

	return attack_power, impact_power
end

ActionUtils.apply_buffs_to_power_level = function (unit, power_level)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return power_level
	end

	power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL)

	return power_level
end

ActionUtils.apply_buffs_to_power_level_on_hit = function (unit, power_level, breed, damage_source, dummy_unit_armor)
	if not Unit.alive(unit) then
		return power_level
	end

	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return power_level
	end

	if damage_source then
		local item_data = rawget(ItemMasterList, damage_source)
		local weapon_template_name = item_data and item_data.template

		if weapon_template_name then
			local weapon_template = Weapons[weapon_template_name]
			local buff_type = weapon_template.buff_type
			local is_melee = MeleeBuffTypes[buff_type]
			local is_ranged = RangedBuffTypes[buff_type]

			if is_melee then
				power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_MELEE)
			elseif is_ranged then
				power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_RANGED)
			end
		end
	end

	local armor_category = (breed and breed.armor_category) or dummy_unit_armor or 1

	if armor_category == 2 then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_ARMOURED)
	elseif armor_category == 3 then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_LARGE)
	elseif armor_category == 5 then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_FRENZY)
	elseif armor_category == 1 then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_UNARMOURED)
	end

	local race = (breed and breed.race) or unit_get_data(unit, "race")

	if race == "chaos" then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_CHAOS)
	elseif race == "skaven" then
		power_level = buff_extension:apply_buffs_to_value(power_level, StatBuffIndex.POWER_LEVEL_SKAVEN)
	end

	return power_level
end

ActionUtils.scale_charged_projectile_power_level = function (power_level, action, charge_level)
	if action.scale_power_level then
		local projectile_power_level = math.max(action.scale_power_level, charge_level) * power_level

		return projectile_power_level
	end

	return power_level
end

ActionUtils.scale_geiser_power_level = function (power_level, charge_value)
	local scaled_power_level = (0.5 + 0.5 * charge_value) * power_level

	return scaled_power_level
end

ActionUtils.get_melee_boost = function (unit, melee_boost_override)
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local has_melee_boost = false
	local boost_curve_multiplier = 0

	if career_extension then
		has_melee_boost, boost_curve_multiplier = career_extension:has_melee_boost()
	end

	if has_melee_boost and melee_boost_override then
		boost_curve_multiplier = melee_boost_override
	end

	return has_melee_boost, boost_curve_multiplier
end

ActionUtils.get_ranged_boost = function (unit)
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local has_ranged_boost = false
	local boost_curve_multiplier = 0

	if career_extension then
		has_ranged_boost, boost_curve_multiplier = career_extension:has_ranged_boost()
	end

	return has_ranged_boost, boost_curve_multiplier
end

ActionUtils.spawn_flame_wave_projectile = function (owner_unit, scale, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed)
	scale = scale or 100
	local projectile_system = Managers.state.entity:system("projectile_system")

	projectile_system:spawn_flame_wave_projectile(owner_unit, scale, item_name, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed)
end

ActionUtils.spawn_player_projectile = function (owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, is_critical_strike, power_level, gaze_settings)
	scale = scale or 100
	local projectile_system = Managers.state.entity:system("projectile_system")
	local ping = 0

	projectile_system:spawn_player_projectile(owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, ping, is_critical_strike, power_level, gaze_settings)
end

ActionUtils.spawn_pickup_projectile = function (world, weapon_unit, projectile_unit_name, projectile_unit_template_name, current_action, owner_unit, position, rotation, velocity, angular_velocity, item_name, spawn_type)
	local projectile_info = current_action.projectile_info
	local pickup_name = projectile_info.pickup_name
	local projectile_unit_name_id = NetworkLookup.husks[projectile_unit_name]
	local projectile_unit_template_name_id = NetworkLookup.go_types[projectile_unit_template_name]
	local network_position = AiAnimUtils.position_network_scale(position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(velocity, true)
	local network_angular_velocity = AiAnimUtils.velocity_network_scale(angular_velocity, true)
	local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
	local spawn_type_id = NetworkLookup.pickup_spawn_types[spawn_type]
	local has_death_extension = ScriptUnit.has_extension(weapon_unit, "death_system")

	if has_death_extension then
		local health_extension = ScriptUnit.extension(weapon_unit, "health_system")
		health_extension.thrown = true
		local damage = health_extension.damage
		local explode_time = 0
		local fuse_time = 6

		if health_extension.ignited then
			local data = health_extension:health_data()
			explode_time = data.explode_time
			fuse_time = data.fuse_time
		end

		local item_name_id = NetworkLookup.item_names[item_name]

		if ScriptUnit.has_extension(weapon_unit, "limited_item_track_system") then
			local limited_item_extension = ScriptUnit.extension(weapon_unit, "limited_item_track_system")
			limited_item_extension.thrown = true
			local limited_item_id = limited_item_extension.id
			local spawner_unit = limited_item_extension.spawner_unit
			local level = LevelHelper:current_level(world)
			local spawner_unit_id = Level.unit_index(level, spawner_unit)
			projectile_unit_template_name_id = NetworkLookup.go_types.explosive_pickup_projectile_unit_limited

			Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_explosive_pickup_projectile_limited", projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, damage, explode_time, fuse_time, item_name_id, spawn_type_id)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_explosive_pickup_projectile", projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, damage, explode_time, fuse_time, item_name_id, spawn_type_id)
		end
	elseif ScriptUnit.has_extension(weapon_unit, "limited_item_track_system") then
		local limited_item_extension = ScriptUnit.extension(weapon_unit, "limited_item_track_system")
		limited_item_extension.thrown = true
		local limited_item_id = limited_item_extension.id
		local spawner_unit = limited_item_extension.spawner_unit
		local level = LevelHelper:current_level(world)
		local spawner_unit_id = Level.unit_index(level, spawner_unit)
		projectile_unit_template_name_id = NetworkLookup.go_types.pickup_projectile_unit_limited

		Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_pickup_projectile_limited", projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, spawn_type_id)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_pickup_projectile", projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawn_type_id)
	end
end

ActionUtils.spawn_true_flight_projectile = function (owner_unit, target_unit, true_flight_template_id, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
	local projectile_system = Managers.state.entity:system("projectile_system")
	local true_flight_template_name = TrueFlightTemplatesLookup[true_flight_template_id]
	scale = scale or 100

	projectile_system:spawn_true_flight_projectile(owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
end

ActionUtils.apply_attack_speed_buff = function (attack_speed_value, unit)
	local new_value = attack_speed_value

	if unit and Unit.alive(unit) and ScriptUnit.has_extension(unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		new_value = buff_extension:apply_buffs_to_value(attack_speed_value, StatBuffIndex.ATTACK_SPEED)
	end

	return new_value
end

ActionUtils.apply_charge_speed_buff_anim_scale = function (anim_time_scale, unit, action_settings)
	local new_anim_time_scale = anim_time_scale

	if not action_settings.scale_anim_by_charge_time_buff then
		return new_anim_time_scale
	end

	if unit and Unit.alive(unit) and ScriptUnit.has_extension(unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local charge_speed = buff_extension:apply_buffs_to_value(1, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
		new_anim_time_scale = anim_time_scale * 1 / charge_speed
	end

	return new_anim_time_scale
end

ActionUtils.apply_charge_speed_buff_chain_window = function (anim_time_scale, unit, action_settings)
	local new_anim_time_scale = anim_time_scale

	if not action_settings.scale_chain_window_by_charge_time_buff then
		return new_anim_time_scale
	end

	if unit and Unit.alive(unit) and ScriptUnit.has_extension(unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local charge_speed = buff_extension:apply_buffs_to_value(1, StatBuffIndex.REDUCED_RANGED_CHARGE_TIME)
		new_anim_time_scale = anim_time_scale * 1 / charge_speed
	end

	return new_anim_time_scale
end

ActionUtils.init_action_buff_data = function (action_buff_data, buff_data, t)
	local start_times = action_buff_data.buff_start_times
	local end_times = action_buff_data.buff_end_times
	local action_buffs_in_progress = action_buff_data.action_buffs_in_progress
	local buff_identifiers = action_buff_data.buff_identifiers

	for _, buff in ipairs(buff_data) do
		local start_time = t + (buff.start_time or 0)
		local end_time = buff.end_time or math.huge
		local buff_index = #start_times + 1
		start_times[buff_index] = start_time
		end_times[buff_index] = start_time + end_time
		action_buffs_in_progress[buff_index] = false
		buff_identifiers[buff_index] = ""
	end
end

local params = {}

ActionUtils.update_action_buff_data = function (action_buff_data, buff_data, owner_unit, t)
	local start_times = action_buff_data.buff_start_times
	local end_times = action_buff_data.buff_end_times
	local buff_identifiers = action_buff_data.buff_identifiers
	local action_buffs_in_progress = action_buff_data.action_buffs_in_progress

	for index, start_time in ipairs(start_times) do
		if start_time <= t then
			local buff = buff_data[index]
			local buff_template_name = buff.buff_name
			params.external_optional_bonus = buff.external_value
			params.external_optional_multiplier = buff.external_multiplier
			start_times[index] = math.huge
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			buff_identifiers[index] = buff_extension:add_buff(buff_template_name, params)
			action_buffs_in_progress[index] = true
		end
	end

	for index, end_time in ipairs(end_times) do
		if end_time <= t then
			end_times[index] = math.huge
			action_buffs_in_progress[index] = false
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local id = buff_identifiers[index]

			buff_extension:remove_buff(id)
		end
	end
end

ActionUtils.remove_action_buff_data = function (action_buff_data, buff_data, owner_unit)
	local action_buffs_in_progress = action_buff_data.action_buffs_in_progress
	local buff_identifiers = action_buff_data.buff_identifiers

	for index, buff_in_progress in ipairs(action_buffs_in_progress) do
		if buff_in_progress then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local id = buff_identifiers[index]

			buff_extension:remove_buff(id)
		end
	end
end

ActionUtils.start_charge_sound = function (wwise_world, weapon_unit, player_unit, action_settings)
	local charge_sound_switch = action_settings.charge_sound_switch
	local charge_sound_name = action_settings.charge_sound_name
	local charge_sound_parameter_name = action_settings.charge_sound_parameter_name

	if not action_settings.charge_sound_name then
		return
	end

	local wwise_source_id = WwiseWorld.make_auto_source(wwise_world, weapon_unit)

	if charge_sound_switch then
		local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")

		if overcharge_extension:above_overcharge_threshold() then
			WwiseWorld.set_switch(wwise_world, charge_sound_switch, "above_overcharge_threshold", wwise_source_id)
		else
			WwiseWorld.set_switch(wwise_world, charge_sound_switch, "below_overcharge_threshold", wwise_source_id)
		end
	end

	local wwise_playing_id = WwiseWorld.trigger_event(wwise_world, charge_sound_name, wwise_source_id)

	if charge_sound_parameter_name then
		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, charge_sound_parameter_name, 1)
	end

	return wwise_playing_id, wwise_source_id
end

ActionUtils.stop_charge_sound = function (wwise_world, wwise_playing_id, wwise_source_id, action_settings)
	local charge_sound_stop_event = action_settings.charge_sound_stop_event

	if not charge_sound_stop_event or not wwise_source_id then
		return
	end

	WwiseWorld.trigger_event(wwise_world, charge_sound_stop_event, wwise_source_id)
end

ActionUtils.play_husk_sound_event = function (wwise_world, sound_event, player_unit, is_bot)
	if not sound_event then
		return
	end

	if not Unit.alive(player_unit) then
		return
	end

	local is_server = Managers.player.is_server
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local go_id = network_manager:unit_game_object_id(player_unit)
	local event_id = NetworkLookup.sound_events[sound_event]
	local game = Managers.state.network:game()

	if not go_id then
		return
	end

	if is_server and is_bot then
		local wwise_source_id = WwiseWorld.make_auto_source(wwise_world, player_unit)

		WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)
	end

	if game then
		if is_server then
			network_transmit:send_rpc_clients("rpc_play_husk_sound_event", go_id, event_id)
		else
			network_transmit:send_rpc_server("rpc_play_husk_sound_event", go_id, event_id)
		end
	end
end

ActionUtils.get_critical_strike_chance = function (unit, action)
	local career_extension = ScriptUnit.extension(unit, "career_system")
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local base_crit_chance = career_extension:get_base_critical_strike_chance()
	local additional_crit_chance = action.additional_critical_strike_chance or 0
	local crit_chance = base_crit_chance + additional_crit_chance
	local action_type = action.kind
	local is_melee_action = action_type == "sweep" or action_type == "push_stagger"

	if is_melee_action then
		crit_chance = buff_extension:apply_buffs_to_value(crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE_MELEE)
	else
		crit_chance = buff_extension:apply_buffs_to_value(crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE_RANGED)
	end

	crit_chance = buff_extension:apply_buffs_to_value(crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE)

	return crit_chance
end

local last_attack_critical = false

ActionUtils.is_critical_strike = function (unit, action, t)
	if script_data.no_critical_strikes then
		return false
	end

	if script_data.always_critical_strikes then
		return true
	end

	if script_data.alternating_critical_strikes then
		if last_attack_critical == true then
			last_attack_critical = false

			return false
		elseif last_attack_critical == false then
			last_attack_critical = true

			return true
		end
	end

	local crit_chance = ActionUtils.get_critical_strike_chance(unit, action)
	local rand = Math.random()

	if rand < crit_chance then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local action_type = action.kind

		buff_extension:trigger_procs("on_critical_action", action_type)
	end

	return rand < crit_chance
end

ActionUtils.pitch_from_rotation = function (rotation)
	local forward = Vector3.normalize(Quaternion.forward(rotation))
	local forward_flat = Vector3.normalize(Vector3.flat(forward))
	local dot = Vector3.dot(forward, forward_flat)
	dot = math.clamp(dot, -1, 1)
	local angle = math.radians_to_degrees(math.acos(dot))
	local up_vector = Vector3(0, 0, 1)
	local up_dot = Vector3.dot(forward, up_vector)

	if up_dot < 0 then
		angle = -angle
	end

	return angle
end

ActionUtils.redirect_shield_hit = function (hit_unit, hit_actor)
	local potential_hit_unit_owner = unit_get_data(hit_unit, "shield_owner_unit")

	if potential_hit_unit_owner then
		local health_extension = ScriptUnit.extension(potential_hit_unit_owner, "health_system")

		if not health_extension:is_alive() then
			return hit_unit, hit_actor
		end

		local new_hit_actor = unit_actor(potential_hit_unit_owner, unit_find_actor(potential_hit_unit_owner, "c_leftforearm"))

		return potential_hit_unit_owner, new_hit_actor
	else
		return hit_unit, hit_actor
	end
end

return
