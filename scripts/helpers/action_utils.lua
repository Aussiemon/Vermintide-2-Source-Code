-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ActionUtils = ActionUtils or {}
script_data.no_critical_strikes = script_data.no_critical_strikes or Development.parameter("no_critical_strikes")
script_data.always_critical_strikes = script_data.always_critical_strikes or Development.parameter("always_critical_strikes")
script_data.alternating_critical_strikes = script_data.alternating_critical_strikes or Development.parameter("alternating_critical_strikes")
local attack_settings = {}
ActionUtils.get_target_armor = function (breed, hit_zone_name, unit)
	local target_unit_armor_attack = 1
	local target_unit_armor_impact = 1
	local target_unit_armor = 1
	local target_unit_primary_armor_attack, target_unit_primary_armor_impact = nil

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
	else
		target_unit_armor = Unit.get_data(unit, "armor")
		target_unit_armor_attack = target_unit_armor
		target_unit_armor_impact = target_unit_armor
	end

	return target_unit_armor_attack, target_unit_armor_impact, target_unit_primary_armor_attack, target_unit_primary_armor_impact
end
ActionUtils.get_dropoff_scalar = function (damage_profile, target_settings, attacker_unit, target_unit)
	local range_dropoff_settings = target_settings.range_dropoff_settings or damage_profile.range_dropoff_settings

	if not range_dropoff_settings then
		return 
	end

	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension.has_buff_perk(buff_extension, "no_damage_dropoff") then
		return 0
	end

	local attacker_position = POSITION_LOOKUP[attacker_unit] or Unit.world_position(attacker_unit, 0)
	local target_position = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)
	local distance = Vector3.distance(target_position, attacker_position)
	local dropoff_start = range_dropoff_settings.dropoff_start
	local dropoff_end = range_dropoff_settings.dropoff_end
	local dropoff_scale = dropoff_end - dropoff_start
	local dropoff_distance = math.clamp(distance - dropoff_start, 0, dropoff_scale)
	local dropoff_scalar = dropoff_distance/dropoff_scale

	return dropoff_scalar
end
ActionUtils.get_armor_power_modifier = function (power_type, damage_profile, target_settings, target_unit_armor, target_unit_primary_armor, critical_strike_settings, dropoff_scalar)
	local armor_modifier = target_settings.armor_modifier or damage_profile.armor_modifier or DefaultArmorPowerModifier
	local armor_modifier_near = target_settings.armor_modifier_near or damage_profile.armor_modifier_near
	local armor_modifier_far = target_settings.armor_modifier_far or damage_profile.armor_modifier_far
	local armor_power_modifier = nil

	if critical_strike_settings then
		local critical_armor_power_modifier = critical_strike_settings[power_type .. "_armor_power_modifer"] or DefaultCriticalArmorPowerModifier
		armor_power_modifier = critical_armor_power_modifier[target_unit_armor] or 1
	else

		-- decompilation error in this vicinity
		armor_power_modifier_near = (target_unit_primary_armor and armor_modifier_near[power_type][target_unit_primary_armor]) or armor_modifier_near[power_type][target_unit_armor] or 1
		local armor_power_modifier_far = (target_unit_primary_armor and armor_modifier_far[power_type][target_unit_primary_armor]) or armor_modifier_far[power_type][target_unit_armor] or 1
		armor_power_modifier = math.lerp(armor_power_modifier_near, armor_power_modifier_far, dropoff_scalar) and ((target_unit_primary_armor and armor_modifier[power_type][target_unit_primary_armor]) or armor_modifier[power_type][target_unit_armor] or 1)
	end

	return armor_power_modifier
end
ActionUtils.scale_powerlevels = function (power_level, power_type)
	local min_cap_powerlevel = 200
	local powerlevel_diff_ratio = {
		impact = 2,
		attack = 3,
		cleave = 3
	}
	local native_diff_ratio = 5
	local scaled_powerlevel_section = (power_level - min_cap_powerlevel)*powerlevel_diff_ratio[power_type]/native_diff_ratio
	local scaled_powerlevel = min_cap_powerlevel + scaled_powerlevel_section

	return scaled_powerlevel
end
ActionUtils.get_power_level = function (power_type, power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar)

	-- decompilation error in this vicinity
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

	local scaled_powerlevel = ActionUtils.scale_powerlevels(power_level, power_type)

	return scaled_powerlevel*power_multiplier
end
ActionUtils.get_power_level_for_target = function (original_power_level, damage_profile, target_index, is_critical_strike, attacker_unit, target_unit, hit_zone_name, armortype_override)
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local critical_strike_settings = is_critical_strike and damage_profile.critical_strike
	local dropoff_scalar = ActionUtils.get_dropoff_scalar(damage_profile, target_settings, attacker_unit, target_unit)
	local attack_armor_power_modifer = 1
	local impact_armor_power_modifer = 1
	local power_level = original_power_level
	local target_breed = target_unit and Unit.get_data(target_unit, "breed")
	local is_valid_target = target_breed or (target_unit and Unit.get_data(target_unit, "is_dummy"))

	if is_valid_target then
		local target_unit_armor_attack, target_unit_armor_impact, target_unit_primary_armor_attack, target_unit_primary_armor_impact = ActionUtils.get_target_armor(target_breed, hit_zone_name, target_unit)

		if armortype_override then
			target_unit_armor_attack = armortype_override
			target_unit_armor_impact = armortype_override
			target_unit_primary_armor_attack = armortype_override
			target_unit_primary_armor_impact = armortype_override
		end

		attack_armor_power_modifer = ActionUtils.get_armor_power_modifier("attack", damage_profile, target_settings, target_unit_armor_attack, target_unit_primary_armor_attack, critical_strike_settings, dropoff_scalar)
		impact_armor_power_modifer = ActionUtils.get_armor_power_modifier("impact", damage_profile, target_settings, target_unit_armor_impact, target_unit_primary_armor_impact, critical_strike_settings, dropoff_scalar)
		power_level = ActionUtils.apply_buffs_to_power_level_on_hit(attacker_unit, power_level, target_breed, target_unit)
	end

	local attack_power = ActionUtils.get_power_level("attack", power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar)
	local impact_power = ActionUtils.get_power_level("impact", power_level, damage_profile, target_settings, critical_strike_settings, dropoff_scalar)
	attack_power = attack_power*attack_armor_power_modifer
	impact_power = impact_power*impact_armor_power_modifer

	return attack_power, impact_power
end
ActionUtils.apply_buffs_to_power_level = function (unit, power_level)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return power_level
	end

	power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL)

	return power_level
end
ActionUtils.apply_buffs_to_power_level_on_hit = function (unit, power_level, breed, target_unit)
	if not Unit.alive(unit) then
		return power_level
	end

	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	if not buff_extension then
		return power_level
	end

	local armor_category = (breed and breed.armor_category) or Unit.get_data(target_unit, "armor") or 1

	if armor_category == 2 then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_ARMOURED)
	elseif armor_category == 3 then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_LARGE)
	elseif armor_category == 5 then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_FRENZY)
	elseif armor_category == 1 then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_UNARMOURED)
	end

	local race = (breed and breed.race) or Unit.get_data(target_unit, "race") or "skaven"

	if race == "chaos" then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_CHAOS)
	elseif race == "skaven" then
		power_level = buff_extension.apply_buffs_to_value(buff_extension, power_level, StatBuffIndex.POWER_LEVEL_SKAVEN)
	end

	return power_level
end
ActionUtils.spawn_flame_wave_projectile = function (owner_unit, scale, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed)
	scale = scale or 100
	local projectile_system = Managers.state.entity:system("projectile_system")

	projectile_system.spawn_flame_wave_projectile(projectile_system, owner_unit, scale, item_name, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed)

	return 
end
ActionUtils.spawn_player_projectile = function (owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, is_critical_strike, power_level, gaze_settings)
	scale = scale or 100
	local projectile_system = Managers.state.entity:system("projectile_system")
	local ping = 0

	projectile_system.spawn_player_projectile(projectile_system, owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, ping, is_critical_strike, power_level, gaze_settings)

	return 
end
ActionUtils.spawn_pickup_projectile = function (world, weapon_unit, projectile_unit_name, projectile_unit_template_name, current_action, owner_unit, position, rotation, velocity, angular_velocity, item_name, spawn_type)
	local lookup_data = current_action.lookup_data
	local projectile_info = current_action.projectile_info
	local pickup_name = projectile_info.pickup_name
	local projectile_unit_name_id = NetworkLookup.husks[projectile_unit_name]
	local projectile_unit_template_name_id = NetworkLookup.go_types[projectile_unit_template_name]
	local owner_unit_id = Managers.state.network:unit_game_object_id(owner_unit)
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
			local data = health_extension.health_data(health_extension)
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

	return 
end
ActionUtils.spawn_true_flight_projectile = function (owner_unit, target_unit, true_flight_template_id, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
	local projectile_system = Managers.state.entity:system("projectile_system")
	local true_flight_template_name = TrueFlightTemplatesLookup[true_flight_template_id]
	scale = scale or 100

	projectile_system.spawn_true_flight_projectile(projectile_system, owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)

	return 
end
ActionUtils.apply_attack_speed_buff = function (attack_speed_value, unit)
	local new_value = attack_speed_value

	if unit and Unit.alive(unit) and ScriptUnit.has_extension(unit, "buff_system") then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		new_value = buff_extension.apply_buffs_to_value(buff_extension, attack_speed_value, StatBuffIndex.ATTACK_SPEED)
	end

	return new_value
end
ActionUtils.init_action_buff_data = function (action_buff_data, buff_data, t)
	local start_times = action_buff_data.buff_start_times
	local end_times = action_buff_data.buff_end_times
	local action_buffs_in_progress = action_buff_data.action_buffs_in_progress
	local buff_identifiers = action_buff_data.buff_identifiers

	for index, buff in ipairs(buff_data) do
		local start_time = t + (buff.start_time or 0)
		local end_time = buff.end_time or math.huge
		local buff_index = #start_times + 1
		start_times[buff_index] = start_time
		end_times[buff_index] = start_time + end_time
		action_buffs_in_progress[buff_index] = false
		buff_identifiers[buff_index] = ""
	end

	return 
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
			buff_identifiers[index] = buff_extension.add_buff(buff_extension, buff_template_name, params)
			action_buffs_in_progress[index] = true
		end
	end

	for index, end_time in ipairs(end_times) do
		if end_time <= t then
			end_times[index] = math.huge
			action_buffs_in_progress[index] = false
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local id = buff_identifiers[index]

			buff_extension.remove_buff(buff_extension, id)
		end
	end

	return 
end
ActionUtils.remove_action_buff_data = function (action_buff_data, buff_data, owner_unit)
	local action_buffs_in_progress = action_buff_data.action_buffs_in_progress
	local buff_identifiers = action_buff_data.buff_identifiers

	for index, buff_in_progress in ipairs(action_buffs_in_progress) do
		if buff_in_progress then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local id = buff_identifiers[index]

			buff_extension.remove_buff(buff_extension, id)
		end
	end

	return 
end
ActionUtils.start_charge_sound = function (wwise_world, weapon_unit, player_unit, action_settings)
	local wwise_source_id = WwiseWorld.make_auto_source(wwise_world, weapon_unit)
	local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")
	local charge_sound_switch = action_settings.charge_sound_switch

	if charge_sound_switch then
		if overcharge_extension.above_overcharge_threshold(overcharge_extension) then
			WwiseWorld.set_switch(wwise_world, charge_sound_switch, "above_overcharge_threshold", wwise_source_id)
		else
			WwiseWorld.set_switch(wwise_world, charge_sound_switch, "below_overcharge_threshold", wwise_source_id)
		end
	end

	local charge_sound_name = action_settings.charge_sound_name
	local wwise_playing_id = WwiseWorld.trigger_event(wwise_world, charge_sound_name, wwise_source_id)
	local charge_sound_parameter_name = action_settings.charge_sound_parameter_name

	if charge_sound_parameter_name then
		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, charge_sound_parameter_name, 1)
	end

	return wwise_playing_id, wwise_source_id
end
ActionUtils.stop_charge_sound = function (wwise_world, wwise_playing_id, wwise_source_id, action_settings)
	local charge_sound_stop_event = action_settings.charge_sound_stop_event

	if charge_sound_stop_event then
		WwiseWorld.trigger_event(wwise_world, charge_sound_stop_event, wwise_source_id)
	end

	return 
end
ActionUtils.play_husk_sound_event = function (sound_event, player_unit)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local go_id = network_manager.unit_game_object_id(network_manager, player_unit)
	local event_id = NetworkLookup.sound_events[sound_event]

	if Managers.player.is_server then
		network_transmit.send_rpc_clients(network_transmit, "rpc_play_husk_sound_event", go_id, event_id)
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_play_husk_sound_event", go_id, event_id)
	end

	return 
end
local last_attack_critical = false
ActionUtils.is_critical_strike = function (owner_unit, new_action, t)
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

	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local base_critical_strike_chance = career_extension.get_base_critical_strike_chance(career_extension)
	local additional_critical_strike_chance = new_action.additional_critical_strike_chance or 0
	local crit_chance = base_critical_strike_chance + additional_critical_strike_chance
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local action_type = new_action.kind
	local melee_action = action_type == "sweep" or action_type == "push_stagger"

	if melee_action then
		crit_chance = buff_extension.apply_buffs_to_value(buff_extension, crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE_MELEE)
	else
		crit_chance = buff_extension.apply_buffs_to_value(buff_extension, crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE_RANGED)
	end

	crit_chance = buff_extension.apply_buffs_to_value(buff_extension, crit_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE)
	local rand = Math.random()

	if rand < crit_chance then
		buff_extension.trigger_procs(buff_extension, "on_critical_action", action_type)
	end

	return rand < crit_chance
end

return 
