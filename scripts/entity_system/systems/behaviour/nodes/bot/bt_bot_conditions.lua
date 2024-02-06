﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_conditions.lua

BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.reload_ability_weapon = BTConditions.reload_ability_weapon or {}
BTConditions.ability_check_categories = {
	activate_ability = {
		bw_adept = true,
		bw_unchained = true,
		dr_ironbreaker = true,
		dr_ranger = true,
		dr_slayer = true,
		es_huntsman = true,
		es_knight = true,
		es_mercenary = true,
		we_maidenguard = true,
		we_shade = true,
		wh_captain = true,
		wh_zealot = true,
	},
	shoot_ability = {
		bw_scholar = true,
		we_waywatcher = true,
		wh_bountyhunter = true,
	},
}

local ScriptUnit = ScriptUnit

BTConditions.can_activate.dr_ironbreaker = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_distance_sq = 64
	local threat_threshold = 15
	local total_threat_value = 0

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]
		local enemy_position = POSITION_LOOKUP[enemy_unit]

		if ALIVE[enemy_unit] and max_distance_sq >= Vector3.distance_squared(self_position, enemy_position) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed
			local is_targeting_bot = enemy_blackboard.target_unit == self_unit
			local threat_value = enemy_breed.threat_value * (is_targeting_bot and 1.25 or 1)

			total_threat_value = total_threat_value + threat_value

			if threat_threshold <= total_threat_value then
				return true
			end
		end
	end

	return false
end

BTConditions.can_activate.dr_slayer = function (blackboard)
	local locomotion_extension = blackboard.locomotion_extension
	local is_on_ground = locomotion_extension:is_on_ground()

	if not is_on_ground then
		return false
	end

	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local leap_target, leap_target_distance_sq

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook") then
		leap_target = target_ally_unit
		leap_target_distance_sq = blackboard.ally_distance^2
	elseif target_unit and target_threat_value >= 8 then
		local target_position = POSITION_LOOKUP[target_unit]

		leap_target = target_unit
		leap_target_distance_sq = Vector3.distance_squared(self_position, target_position)
	end

	local min_leap_distance_sq = 49
	local max_leap_distance_sq = 100

	if leap_target and min_leap_distance_sq < leap_target_distance_sq and leap_target_distance_sq < max_leap_distance_sq then
		local leap_target_position = POSITION_LOOKUP[leap_target]
		local leap_target_direction = Vector3.normalize(leap_target_position - self_position)
		local check_position = leap_target_position + leap_target_direction * 0.5
		local nav_world = blackboard.nav_world
		local success = LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, nil, 1, 1)

		if success then
			blackboard.activate_ability_data.aim_position:store(leap_target_position)

			return true
		end
	end

	return false
end

BTConditions.can_activate.dr_ranger = function (blackboard)
	local self_unit = blackboard.unit
	local target_ally_unit = blackboard.target_ally_unit
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local ally_distance = blackboard.ally_distance
	local self_position = POSITION_LOOKUP[self_unit]
	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_distance_sq = 25
	local total_threat_value = 0
	local threat_threshold = is_prioritized and ally_distance < 5 and 5 or 12
	local current_health_percent = blackboard.health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()
	local health_multiplier = 2 - (is_wounded and 0 or current_health_percent)

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]
		local enemy_position = POSITION_LOOKUP[enemy_unit]

		if ALIVE[enemy_unit] and max_distance_sq >= Vector3.distance_squared(self_position, enemy_position) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed
			local is_targeting_bot = enemy_blackboard.target_unit == self_unit
			local threat_value = enemy_breed.threat_value * (health_multiplier + (is_targeting_bot and 0.25 or 0))

			total_threat_value = total_threat_value + threat_value

			if threat_threshold <= total_threat_value then
				return true
			end
		end
	end

	return false
end

BTConditions.can_activate.es_mercenary = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local max_ally_distance_sq = 225
	local num_players_within_range = 0
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.PLAYER_AND_BOT_UNITS
	local num_players = #PLAYER_AND_BOT_UNITS

	for i = 1, num_players do
		local player_unit = PLAYER_AND_BOT_UNITS[i]
		local player_position = POSITION_LOOKUP[player_unit]
		local distance_squared = Vector3.distance_squared(self_position, player_position)

		if player_unit ~= self_unit and distance_squared < max_ally_distance_sq then
			num_players_within_range = num_players_within_range + 1
		end
	end

	local near_players_percentage
	local num_players_except_self = num_players - 1

	near_players_percentage = num_players_except_self == 0 and 0.5 or num_players_within_range / num_players_except_self

	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_threat_distance_sq = 49
	local total_threat_value = 0
	local threat_threshold = math.max(20 * (1 - near_players_percentage), 8)
	local current_health_percent = blackboard.health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()
	local health_multiplier = 2 - (is_wounded and 0 or current_health_percent)

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]
		local enemy_position = POSITION_LOOKUP[enemy_unit]

		if ALIVE[enemy_unit] and max_threat_distance_sq >= Vector3.distance_squared(self_position, enemy_position) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed
			local is_targeting_bot = enemy_blackboard.target_unit == self_unit
			local threat_value = enemy_breed.threat_value * (health_multiplier + (is_targeting_bot and 0.25 or 0))

			total_threat_value = total_threat_value + threat_value

			if threat_threshold <= total_threat_value then
				return true
			end
		end
	end

	return false
end

BTConditions.can_activate.es_huntsman = function (blackboard)
	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local target_unit = blackboard.target_unit

	if num_proximite_enemies == 0 and target_unit == nil then
		return false
	end

	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local health_extension = blackboard.health_extension
	local current_health_percent = health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook" or target_ally_need_type == "ledge") then
		return true
	elseif current_health_percent < 0.4 or is_wounded then
		return true
	elseif target_unit and target_threat_value >= 8 then
		return true
	end

	return false
end

BTConditions.can_activate.es_knight = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local charge_target, charge_target_distance_sq

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook") then
		charge_target = target_ally_unit
		charge_target_distance_sq = blackboard.ally_distance^2
	elseif target_unit and target_threat_value >= 5 then
		local target_position = POSITION_LOOKUP[target_unit]

		charge_target = target_unit
		charge_target_distance_sq = Vector3.distance_squared(self_position, target_position)
	end

	local min_distance_sq = 81
	local max_distance = 12
	local max_distance_sq = 144

	if charge_target and min_distance_sq < charge_target_distance_sq and charge_target_distance_sq < max_distance_sq then
		local charge_target_position = POSITION_LOOKUP[charge_target]
		local charge_target_direction = Vector3.normalize(charge_target_position - self_position)
		local check_position = self_position + charge_target_direction * (max_distance + 2)
		local nav_world = blackboard.nav_world
		local success = LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, nil, 1, 1)

		if success then
			blackboard.activate_ability_data.aim_position:store(charge_target_position)

			return true
		end
	end

	return false
end

BTConditions.can_activate.we_waywatcher = function (blackboard)
	local target = blackboard.target_unit

	if not ALIVE[target] then
		return false
	end

	if not BLACKBOARDS[target] then
		return false
	end

	local max_distance = 30
	local is_range_ok = target == blackboard.priority_target_enemy and max_distance >= blackboard.priority_target_distance or target == blackboard.urgent_target_enemy and max_distance >= blackboard.urgent_target_distance or target == blackboard.opportunity_target_enemy and max_distance >= blackboard.opportunity_target_distance

	if is_range_ok then
		local obstruction = blackboard.ranged_obstruction_by_static
		local t = Managers.time:time("game")
		local obstructed = obstruction and obstruction.unit == target and t <= obstruction.timer + 3

		return not obstructed
	else
		return false
	end
end

BTConditions.can_activate.we_maidenguard = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local dash_target, dash_target_distance_sq

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook") then
		dash_target = target_ally_unit
		dash_target_distance_sq = blackboard.ally_distance^2
	elseif target_unit and target_threat_value >= 5 then
		local target_position = POSITION_LOOKUP[target_unit]

		dash_target = target_unit
		dash_target_distance_sq = Vector3.distance_squared(self_position, target_position)
	end

	local min_distance_sq = 81
	local max_distance = 12
	local max_distance_sq = 144

	if dash_target and min_distance_sq < dash_target_distance_sq and dash_target_distance_sq < max_distance_sq then
		local dash_target_position = POSITION_LOOKUP[dash_target]
		local dash_target_direction = Vector3.normalize(dash_target_position - self_position)
		local check_position = self_position + dash_target_direction * (max_distance + 2)
		local nav_world = blackboard.nav_world
		local success = LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, nil, 1, 1)

		if success then
			blackboard.activate_ability_data.aim_position:store(dash_target_position)

			return true
		end
	end

	return false
end

BTConditions.can_activate.we_shade = function (blackboard)
	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local target_unit = blackboard.target_unit

	if num_proximite_enemies == 0 and target_unit == nil then
		return false
	end

	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local health_extension = blackboard.health_extension
	local current_health_percent = health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook" or target_ally_need_type == "ledge") then
		return true
	elseif current_health_percent < 0.4 or is_wounded then
		return true
	elseif target_unit and target_threat_value >= 8 then
		return true
	end

	return false
end

BTConditions.can_activate.wh_captain = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local max_ally_distance_sq = 100
	local num_players_within_range = 0
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.PLAYER_AND_BOT_UNITS
	local num_players = #PLAYER_AND_BOT_UNITS

	for i = 1, num_players do
		local player_unit = PLAYER_AND_BOT_UNITS[i]
		local player_status_extension = ScriptUnit.extension(player_unit, "status_system")
		local player_position = POSITION_LOOKUP[player_unit]
		local distance_squared = Vector3.distance_squared(self_position, player_position)

		if player_unit ~= self_unit and not player_status_extension:is_disabled() and distance_squared < max_ally_distance_sq then
			num_players_within_range = num_players_within_range + 1
		end
	end

	local near_players_percentage
	local num_players_except_self = num_players - 1

	near_players_percentage = num_players_except_self == 0 and 0.5 or num_players_within_range / num_players_except_self

	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_threat_distance_sq = 49
	local total_threat_value = 0
	local threat_threshold = math.max(20 * (1 - near_players_percentage), 8)
	local current_health_percent = blackboard.health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()
	local health_multiplier = 2 - (is_wounded and 0 or current_health_percent)

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]
		local enemy_position = POSITION_LOOKUP[enemy_unit]

		if ALIVE[enemy_unit] and max_threat_distance_sq >= Vector3.distance_squared(self_position, enemy_position) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed
			local is_targeting_bot = enemy_blackboard.target_unit == self_unit
			local threat_value = enemy_breed.threat_value * (health_multiplier + (is_targeting_bot and 0.25 or 0))

			total_threat_value = total_threat_value + threat_value

			if threat_threshold <= total_threat_value then
				return true
			end
		end
	end

	return false
end

BTConditions.can_activate.wh_bountyhunter = function (blackboard)
	local target = blackboard.target_unit

	if not ALIVE[target] then
		return false
	end

	if not BLACKBOARDS[target] then
		return false
	end

	local max_distance = 15
	local is_range_ok = target == blackboard.priority_target_enemy and max_distance >= blackboard.priority_target_distance or target == blackboard.urgent_target_enemy and max_distance >= blackboard.urgent_target_distance or target == blackboard.opportunity_target_enemy and max_distance >= blackboard.opportunity_target_distance

	if is_range_ok then
		local obstruction = blackboard.ranged_obstruction_by_static
		local t = Managers.time:time("game")
		local obstructed = obstruction and obstruction.unit == target and t <= obstruction.timer + 3

		return not obstructed
	else
		return false
	end
end

BTConditions.can_activate.wh_zealot = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local run_target, run_target_distance_sq

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook") then
		run_target = target_ally_unit
		run_target_distance_sq = blackboard.ally_distance^2
	elseif target_unit and target_threat_value >= 8 then
		local target_position = POSITION_LOOKUP[target_unit]

		run_target = target_unit
		run_target_distance_sq = Vector3.distance_squared(self_position, target_position)
	end

	local min_distance_sq = 81
	local max_distance_sq = 144

	if run_target and min_distance_sq < run_target_distance_sq and run_target_distance_sq < max_distance_sq then
		local run_target_position = POSITION_LOOKUP[run_target]
		local run_target_direction = Vector3.normalize(run_target_position - self_position)
		local check_position = run_target_position + run_target_direction * 0.5
		local nav_world = blackboard.nav_world
		local success = LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, nil, 1, 1)

		if success then
			blackboard.activate_ability_data.aim_position:store(run_target_position)

			return true
		end
	end

	return false
end

BTConditions.can_activate.bw_adept = function (blackboard)
	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local target_breed = target_blackboard and target_blackboard.breed
	local target_threat_value = target_breed and target_breed.threat_value or 0
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, target_ally_unit)
	local fire_walk_target, fire_walk_target_distance_sq

	if is_prioritized and (target_ally_need_type == "knocked_down" or target_ally_need_type == "hook") then
		fire_walk_target = target_ally_unit
		fire_walk_target_distance_sq = blackboard.ally_distance^2
	elseif target_unit and target_threat_value >= 8 then
		local target_position = POSITION_LOOKUP[target_unit]

		fire_walk_target = target_unit
		fire_walk_target_distance_sq = Vector3.distance_squared(self_position, target_position)
	end

	local min_distance_sq = 25
	local max_distance_sq = 100

	if fire_walk_target and min_distance_sq < fire_walk_target_distance_sq and fire_walk_target_distance_sq < max_distance_sq then
		local fire_walk_target_position = POSITION_LOOKUP[fire_walk_target]
		local fire_walk_target_direction = Vector3.normalize(fire_walk_target_position - self_position)
		local check_position = fire_walk_target_position + fire_walk_target_direction * 0.5
		local nav_world = blackboard.nav_world
		local success = LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, nil, 1, 1)

		if success then
			blackboard.activate_ability_data.aim_position:store(fire_walk_target_position)

			return true
		end
	end

	return false
end

BTConditions.can_activate.bw_scholar = function (blackboard)
	local target = blackboard.target_unit

	if not ALIVE[target] then
		return false
	end

	if not BLACKBOARDS[target] then
		return false
	end

	local max_distance = 20
	local is_range_ok = target == blackboard.priority_target_enemy and max_distance >= blackboard.priority_target_distance or target == blackboard.urgent_target_enemy and max_distance >= blackboard.urgent_target_distance or target == blackboard.opportunity_target_enemy and max_distance >= blackboard.opportunity_target_distance

	if is_range_ok then
		local obstruction = blackboard.ranged_obstruction_by_static
		local t = Managers.time:time("game")
		local obstructed = obstruction and obstruction.unit == target and t <= obstruction.timer + 3

		return not obstructed
	else
		return false
	end
end

BTConditions.can_activate.bw_unchained = function (blackboard)
	local overcharge_extension = blackboard.overcharge_extension
	local is_above_critical_limit = overcharge_extension:is_above_critical_limit()

	if is_above_critical_limit then
		return true
	end

	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_distance_sq = 16
	local total_threat_value = 0
	local threat_threshold = 10

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]
		local enemy_position = POSITION_LOOKUP[enemy_unit]

		if ALIVE[enemy_unit] and max_distance_sq >= Vector3.distance_squared(self_position, enemy_position) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed
			local is_targeting_bot = enemy_blackboard.target_unit == self_unit
			local threat_value = enemy_breed.threat_value * (is_targeting_bot and 1.25 or 1)

			total_threat_value = total_threat_value + threat_value

			if threat_threshold <= total_threat_value then
				return true
			end
		end
	end

	return false
end

BTConditions.can_activate_ability = function (blackboard, args)
	local career_extension = blackboard.career_extension
	local is_using_ability = blackboard.activate_ability_data.is_using_ability
	local career_name = career_extension:career_name()
	local ability_check_category_name = args[1]
	local ability_check_category = BTConditions.ability_check_categories[ability_check_category_name]

	if not ability_check_category or not ability_check_category[career_name] then
		return false
	end

	if ability_check_category_name == "shoot_ability" and (not ALIVE[blackboard.target_unit] or not Unit.has_data(blackboard.target_unit, "breed")) then
		return false
	end

	local condition_function = BTConditions.can_activate[career_name]

	if ability_check_category_name == "ranged_weapon" or ability_check_category_name == "melee_weapon" then
		return condition_function and condition_function(blackboard)
	end

	return is_using_ability or career_extension:can_use_activated_ability() and condition_function and condition_function(blackboard)
end

BTConditions.should_reload_ability_weapon = function (blackboard, args)
	if blackboard.reloading and blackboard.reloading_slot ~= args.wanted_slot then
		return false
	end

	local career_extension = blackboard.career_extension
	local career_name = career_extension:career_name()
	local condition_function = BTConditions.reload_ability_weapon[career_name]

	return condition_function and condition_function(blackboard, args)
end

BTConditions.is_disabled = function (blackboard)
	return blackboard.is_knocked_down or blackboard.is_grabbed_by_pack_master or blackboard.is_pounced_down or blackboard.is_hanging_from_hook or blackboard.is_ledge_hanging or blackboard.is_grabbed_by_chaos_spawn
end

local PUSHED_COOLDOWN = 2
local BLOCK_BROKEN_COOLDOWN = 4
local BOT_INTERACT_DIST = 2.4
local BOT_INTERACT_DIST_SQ = BOT_INTERACT_DIST * BOT_INTERACT_DIST

local function is_safe_to_block_interact(status_extension, interaction_extension, wanted_interaction_type)
	local t = Managers.time:time("game")
	local pushed_t = status_extension.pushed_at_t
	local block_broken_t = status_extension.block_broken_at_t
	local enough_fatigue = true
	local is_interacting, interaction_type = interaction_extension:is_interacting()

	if not is_interacting or interaction_type ~= wanted_interaction_type then
		local current_fatigue, max_fatigue = status_extension:current_fatigue_points()
		local stamina_left = max_fatigue - current_fatigue
		local blocked_attack_cost = PlayerUnitStatusSettings.fatigue_point_costs.blocked_attack

		enough_fatigue = current_fatigue == 0 or blocked_attack_cost < stamina_left
	end

	if enough_fatigue and t > pushed_t + PUSHED_COOLDOWN and t > block_broken_t + BLOCK_BROKEN_COOLDOWN then
		return true
	else
		return false
	end
end

local function is_there_threat_to_aid(self_unit, proximite_enemies, force_aid)
	local num_proximite_enemies = #proximite_enemies

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]

		if ALIVE[enemy_unit] then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed

			if enemy_blackboard.target_unit == self_unit and (not force_aid or enemy_breed.is_bot_aid_threat) then
				return true
			end
		end
	end

	return false
end

local function can_interact_with_ally(self_unit, target_ally_unit)
	local interactable_extension = ScriptUnit.extension(target_ally_unit, "interactable_system")
	local interactor_unit = interactable_extension:is_being_interacted_with()
	local can_interact_with_ally = interactor_unit == nil or interactor_unit == self_unit

	return can_interact_with_ally
end

local FLAT_MOVE_TO_EPSILON_SQ = BotConstants.default.FLAT_MOVE_TO_EPSILON^2
local Z_MOVE_TO_EPSILON = BotConstants.default.Z_MOVE_TO_EPSILON

local function has_reached_ally_aid_destination(self_position, blackboard)
	local navigation_extension = blackboard.navigation_extension
	local destination = navigation_extension:destination()
	local target_ally_aid_destination = blackboard.target_ally_aid_destination:unbox()
	local has_target_ally_aid_destination = Vector3.equal(destination, target_ally_aid_destination)

	if has_target_ally_aid_destination then
		return navigation_extension:destination_reached()
	elseif navigation_extension:destination_reached() then
		local bot_ai_extension = blackboard.ai_extension
		local is_near = not bot_ai_extension:new_destination_distance_check(self_position, destination, target_ally_aid_destination, navigation_extension)

		return is_near
	else
		local offset = target_ally_aid_destination - self_position

		return math.abs(offset.z) <= Z_MOVE_TO_EPSILON and Vector3.length_squared(Vector3.flat(offset)) <= FLAT_MOVE_TO_EPSILON_SQ
	end
end

BTConditions.can_revive = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "knocked_down" then
		local interaction_extension = blackboard.interaction_extension

		if not is_safe_to_block_interact(blackboard.status_extension, interaction_extension, "revive") then
			return false
		end

		local self_unit = blackboard.unit
		local health = ScriptUnit.extension(target_ally_unit, "health_system"):current_health_percent()

		if health > 0.3 and is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local ally_distance = blackboard.ally_distance
		local is_interacting, interaction_type = interaction_extension:is_interacting()

		if is_interacting and interaction_type == "revive" and ally_distance <= BOT_INTERACT_DIST then
			return true
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard) or blackboard.is_transported
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end
end

BTConditions.is_there_threat_to_aid = function (self_unit, proximite_enemies, force_aid)
	return is_there_threat_to_aid(self_unit, proximite_enemies, force_aid)
end

BTConditions.can_heal_player = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "in_need_of_heal" then
		local interaction_extension = blackboard.interaction_extension
		local is_interacting, interaction_type = interaction_extension:is_interacting()

		if is_interacting and interaction_type == "heal" then
			return true
		end

		if #blackboard.proximite_enemies > 0 then
			return false
		end

		local self_unit = blackboard.unit
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_locomotion_extension = ScriptUnit.extension(target_ally_unit, "locomotion_system")
		local ally_velocity = ally_locomotion_extension:current_velocity()
		local ally_speed_sq = Vector3.length_squared(ally_velocity)
		local ally_distance = blackboard.ally_distance

		if can_interact_with_ally and (ally_destination_reached or ally_speed_sq > 0.04000000000000001 and ally_distance <= BOT_INTERACT_DIST) then
			return true
		end
	end
end

BTConditions.can_help_in_need_player = function (blackboard, args)
	local need_type = args[1]
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == need_type then
		local self_unit = blackboard.unit
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_locomotion_extension = ScriptUnit.extension(target_ally_unit, "locomotion_system")
		local ally_velocity = ally_locomotion_extension:current_velocity()
		local ally_speed_sq = Vector3.length_squared(ally_velocity)
		local ally_distance = blackboard.ally_distance

		if can_interact_with_ally and (ally_destination_reached or ally_speed_sq > 0.04000000000000001 and ally_distance <= BOT_INTERACT_DIST) then
			return true
		end
	end
end

BTConditions.can_rescue_hanging_from_hook = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "hook" then
		if not is_safe_to_block_interact(blackboard.status_extension, blackboard.interaction_extension, "release_from_hook") then
			return false
		end

		local self_unit = blackboard.unit

		if is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end
end

BTConditions.can_rescue_ledge_hanging = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "ledge" then
		if not is_safe_to_block_interact(blackboard.status_extension, blackboard.interaction_extension, "pull_up") then
			return false
		end

		local self_unit = blackboard.unit

		if is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end
end

BTConditions.can_loot = function (blackboard)
	local play_go_system = Managers.state.entity:system("play_go_tutorial_system")

	if play_go_system and not play_go_system:bot_loot_enabled() then
		return false
	end

	local max_dist = 3.2
	local is_forced_pickup = blackboard.forced_pickup_unit == blackboard.interaction_unit
	local loot_health = blackboard.health_pickup and blackboard.allowed_to_take_health_pickup and blackboard.health_pickup == blackboard.interaction_unit and (is_forced_pickup or max_dist > blackboard.health_dist)
	local loot_ammo = blackboard.ammo_pickup and blackboard.has_ammo_missing and blackboard.ammo_pickup == blackboard.interaction_unit and (is_forced_pickup or max_dist > blackboard.ammo_dist)
	local loot_mule = blackboard.mule_pickup and blackboard.mule_pickup == blackboard.interaction_unit and (is_forced_pickup or blackboard.mule_pickup_dist_squared < max_dist^2)

	return loot_health or loot_ammo or loot_mule
end

BTConditions.bot_should_heal = function (blackboard)
	local self_unit = blackboard.unit
	local inventory_extension = blackboard.inventory_extension
	local health_slot_data = inventory_extension:get_slot_data("slot_healthkit")
	local template = health_slot_data and inventory_extension:get_item_template(health_slot_data)
	local can_heal_self = template and template.can_heal_self

	if not can_heal_self then
		return false
	end

	local buff_extension = ScriptUnit.extension(self_unit, "buff_system")
	local has_no_permanent_health_from_item_buff = buff_extension:has_buff_type("trait_necklace_no_healing_health_regen")
	local wounded = blackboard.status_extension:is_wounded()
	local force_use_health_pickup = blackboard.force_use_health_pickup

	if has_no_permanent_health_from_item_buff and not wounded and not force_use_health_pickup then
		return false
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()
	local hurt = current_health_percent <= template.bot_heal_threshold
	local perma_health_percent = blackboard.health_extension:current_permanent_health_percent()
	local low_on_perma_health = perma_health_percent <= template.bot_heal_threshold
	local heavy_curse = blackboard.health_extension:get_max_health() <= 75
	local target_unit = blackboard.target_unit
	local is_safe = not target_unit or not (not template.fast_heal and not blackboard.is_healing_self) and #blackboard.proximite_enemies == 0 or target_unit ~= blackboard.priority_target_enemy and target_unit ~= blackboard.urgent_target_enemy and target_unit ~= blackboard.proximity_target_enemy and target_unit ~= blackboard.slot_target_enemy

	return is_safe and (force_use_health_pickup or not has_no_permanent_health_from_item_buff and (hurt or wounded and (low_on_perma_health or heavy_curse)) or has_no_permanent_health_from_item_buff and hurt and wounded)
end

BTConditions.is_slot_not_wielded = function (blackboard, args)
	local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot
	local wanted_slot = args[1]
	local exception_slot = args[2]

	if exception_slot and exception_slot == wielded_slot then
		return false
	else
		return wielded_slot ~= wanted_slot
	end
end

BTConditions.is_wanted_slot_not_wielded = function (blackboard, args)
	local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot
	local wanted_slot = blackboard[args[1]]
	local only_wanted_slot = args[2]

	if only_wanted_slot and wanted_slot ~= only_wanted_slot then
		return false
	else
		return wanted_slot ~= wielded_slot
	end
end

BTConditions.has_double_weapon_slots = function (blackboard, args)
	return blackboard.double_weapons == args[1]
end

BTConditions.has_better_alt_weapon = function (blackboard, args)
	local main_slot = args[1]

	if blackboard.double_weapons == main_slot then
		local weapon_scores = blackboard.weapon_scores

		if weapon_scores then
			local alt_slot = args[2]
			local main_weapon_score = weapon_scores[main_slot].score or -1
			local alt_weapon_score = weapon_scores[alt_slot].score or -1

			return main_weapon_score < alt_weapon_score
		end
	end

	return false
end

BTConditions.needs_weapon_swap = function (blackboard, args)
	if BTConditions.has_double_weapon_slots(blackboard, args) and BTConditions.has_better_alt_weapon(blackboard, args) then
		return BTConditions.is_slot_not_wielded(blackboard, {
			args[2],
		})
	end

	return BTConditions.is_slot_not_wielded(blackboard, {
		args[1],
	})
end

BTConditions.has_priority_or_opportunity_target = function (blackboard)
	local target = blackboard.target_unit

	if not ALIVE[target] then
		return false
	end

	local dist = 40
	local result = target == blackboard.priority_target_enemy and dist > blackboard.priority_target_distance or not blackboard.revive_with_urgent_target and target == blackboard.urgent_target_enemy and dist > blackboard.urgent_target_distance or target == blackboard.opportunity_target_enemy and dist > blackboard.opportunity_target_distance

	return result
end

BTConditions.bot_in_melee_range = function (blackboard)
	local target_unit = blackboard.target_unit

	if not ALIVE[target_unit] then
		return false
	end

	local self_unit = blackboard.unit
	local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot
	local melee_range
	local breed = Unit.get_data(target_unit, "breed")
	local party_danger = AiUtils.get_party_danger()

	if blackboard.urgent_target_enemy == target_unit or blackboard.opportunity_target_enemy == target_unit or Vector3.is_valid(blackboard.taking_cover.cover_position:unbox()) then
		melee_range = breed and breed.bot_opportunity_target_melee_range or 3

		if wielded_slot == "slot_ranged" then
			melee_range = breed and breed.bot_opportunity_target_melee_range_while_ranged or 2
		end
	elseif wielded_slot == "slot_ranged" then
		melee_range = math.lerp(10, 3.5, party_danger)
	else
		melee_range = math.lerp(12, 5, party_danger)
	end

	local target_aim_position
	local override_aim_node_name = breed and breed.bot_melee_aim_node

	if override_aim_node_name then
		local override_aim_node = Unit.node(target_unit, override_aim_node_name)

		target_aim_position = Unit.world_position(target_unit, override_aim_node)
	else
		target_aim_position = POSITION_LOOKUP[target_unit]
	end

	local offset = target_aim_position - POSITION_LOOKUP[self_unit]
	local distance_squared = Vector3.length_squared(offset)
	local in_range = distance_squared < melee_range^2
	local z_offset = offset.z

	return in_range and z_offset > -1.5 and z_offset < 2
end

BTConditions.has_target_and_ammo_greater_than = function (blackboard, args)
	local target_unit = blackboard.target_unit

	if not ALIVE[target_unit] then
		return false
	end

	local breed = Unit.get_data(target_unit, "breed")

	if breed == nil then
		return false
	end

	local inventory_extension = blackboard.inventory_extension
	local ranged_slot_data = inventory_extension:get_slot_data("slot_ranged")
	local ranged_slot_template = inventory_extension:get_item_template(ranged_slot_data)
	local ranged_slot_buff_type = ranged_slot_template and ranged_slot_template.buff_type
	local is_ranged = RangedBuffTypes[ranged_slot_buff_type]

	if not is_ranged then
		return false
	end

	local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

	if target_buff_extension and target_buff_extension:has_buff_perk("invulnerable_ranged") then
		return false
	end

	local current, max = inventory_extension:current_ammo_status("slot_ranged")
	local ammo_ok = not current or current / max > args.ammo_percentage
	local overcharge_extension = blackboard.overcharge_extension
	local overcharge_limit_type = args.overcharge_limit_type
	local current_oc, threshold_oc, max_oc = overcharge_extension:current_overcharge_status()
	local overcharge_ok = current_oc == 0 or overcharge_limit_type == "threshold" and current_oc / threshold_oc < args.overcharge_limit or overcharge_limit_type == "maximum" and current_oc / max_oc < args.overcharge_limit
	local obstruction = blackboard.ranged_obstruction_by_static
	local t = Managers.time:time("game")
	local obstructed = obstruction and obstruction.unit == blackboard.target_unit and t <= obstruction.timer + 3
	local effective_target = AiUtils.has_breed_categories(breed.category_mask, ranged_slot_template.attack_meta_data.effective_against_combined)

	return ammo_ok and overcharge_ok and not obstructed and effective_target
end

BTConditions.should_vent_overcharge = function (blackboard, args)
	local overcharge_extension = blackboard.overcharge_extension
	local overcharge_limit_type = args.overcharge_limit_type
	local current_oc, threshold_oc, max_oc = overcharge_extension:current_overcharge_status()
	local overcharge_percentage = 0

	if overcharge_limit_type == "threshold" then
		overcharge_percentage = current_oc / threshold_oc
	elseif overcharge_limit_type == "maximum" then
		overcharge_percentage = current_oc / max_oc
	end

	local should_vent

	if blackboard.reloading then
		should_vent = overcharge_percentage >= args.stop_percentage
	else
		should_vent = overcharge_percentage >= args.start_min_percentage and overcharge_percentage <= args.start_max_percentage
	end

	return should_vent
end

BTConditions.should_recall_unique_ammo = function (blackboard, args)
	local inventory_extension = blackboard.inventory_extension

	if not inventory_extension:has_unique_ammo_type_weapon_equipped() then
		return false
	end

	local current, max = inventory_extension:current_ammo_status("slot_ranged")

	if not current or not max then
		return false
	end

	local ammo_percentage = current / max
	local should_recall

	if blackboard.reloading then
		should_recall = current ~= max
	else
		should_recall = ammo_percentage <= args.ammo_percentage_threshold
	end

	return should_recall
end

BTConditions.should_reload_weapon = function (blackboard, args)
	local inventory_extension = blackboard.inventory_extension
	local ranged_slot_data = inventory_extension:get_slot_data("slot_ranged")
	local right_unit_1p = ranged_slot_data and ranged_slot_data.right_unit_1p
	local left_unit_1p = ranged_slot_data and ranged_slot_data.left_unit_1p
	local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

	if not ammo_extension then
		return false
	end

	local should_reload

	if blackboard.reloading then
		should_reload = ammo_extension:remaining_ammo() > 0 and not ammo_extension:clip_full() and blackboard.reloading_slot == args[1]
	else
		should_reload = ammo_extension:can_reload()
	end

	return should_reload
end

BTConditions.wants_to_reload_weapon = function (blackboard, args)
	return blackboard.wanted_slot_to_reload ~= nil
end

BTConditions.can_open_door = function (blackboard)
	local can_interact = false

	if blackboard.interaction_type == "door" then
		local interaction_unit = blackboard.interaction_unit
		local door_extension = Unit.alive(interaction_unit) and ScriptUnit.has_extension(interaction_unit, "door_system")

		if door_extension then
			can_interact = door_extension:get_current_state() == "closed"
		end
	end

	return can_interact
end

BTConditions.bot_at_breakable = function (blackboard)
	local navigation_extension = blackboard.navigation_extension

	return navigation_extension:is_in_transition() and navigation_extension:transition_type() == "planks"
end

BTConditions.cant_reach_ally = function (blackboard)
	local follow_unit = blackboard.ai_bot_group_extension.data.follow_unit

	if not ALIVE[follow_unit] or blackboard.has_teleported then
		return false
	end

	local self_unit = blackboard.unit
	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check
	local is_forwards

	if not disable_bot_main_path_teleport_check then
		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director:get_player_unit_segment(self_unit)
		local target_segment = conflict_director:get_player_unit_segment(follow_unit)

		if not self_segment or not target_segment then
			return false
		end

		local is_backwards = target_segment < self_segment

		if is_backwards then
			return false
		end

		is_forwards = self_segment < target_segment
	end

	local bot_whereabouts_extension = ScriptUnit.extension(self_unit, "whereabouts_system")
	local follow_unit_whereabouts_extension = ScriptUnit.extension(follow_unit, "whereabouts_system")
	local self_position = bot_whereabouts_extension:last_position_on_navmesh()
	local follow_unit_position = follow_unit_whereabouts_extension:last_position_on_navmesh()

	if not self_position or not follow_unit_position then
		return false
	end

	local t = Managers.time:time("game")
	local navigation_extension = blackboard.navigation_extension
	local fails, last_success = navigation_extension:successive_failed_paths()

	return blackboard.moving_toward_follow_position and fails > (not (not disable_bot_main_path_teleport_check and not is_forwards) and 1 or 5) and t - last_success > 5
end

local FOLLOW_TELEPORT_DISTANCE_SQ = 1600

BTConditions.should_teleport = function (blackboard)
	local follow_unit = blackboard.ai_bot_group_extension.data.follow_unit

	if not ALIVE[follow_unit] or blackboard.has_teleported then
		return false
	end

	local self_unit = blackboard.unit
	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check

	if not disable_bot_main_path_teleport_check then
		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director:get_player_unit_segment(self_unit) or 1
		local target_segment = conflict_director:get_player_unit_segment(follow_unit)

		if not target_segment or target_segment < self_segment then
			return false
		end
	end

	local has_priority_target = blackboard.target_unit and blackboard.target_unit == blackboard.priority_target_enemy

	if blackboard.target_ally_need_type or has_priority_target then
		return false
	end

	local bot_whereabouts_extension = ScriptUnit.extension(self_unit, "whereabouts_system")
	local follow_unit_whereabouts_extension = ScriptUnit.extension(follow_unit, "whereabouts_system")
	local self_position = bot_whereabouts_extension:last_position_on_navmesh()
	local follow_unit_position = follow_unit_whereabouts_extension:last_position_on_navmesh()

	if not self_position or not follow_unit_position then
		return false
	end

	local distance_squared = Vector3.distance_squared(self_position, follow_unit_position)

	return distance_squared >= FOLLOW_TELEPORT_DISTANCE_SQ
end

BTConditions.should_drop_grimoire = function (blackboard)
	local inventory_extension = blackboard.inventory_extension
	local slot_name = "slot_potion"
	local slot_data = inventory_extension:get_slot_data(slot_name)

	if slot_data then
		local item_template = inventory_extension:get_item_template(slot_data)
		local is_grimoire = item_template.is_grimoire
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
		local order = ai_bot_group_system:get_pickup_order(blackboard.unit, slot_name)

		return is_grimoire and (order == nil or order.pickup_name ~= "grimoire")
	end

	return false
end

DLCUtils.require_list("bot_conditions")
