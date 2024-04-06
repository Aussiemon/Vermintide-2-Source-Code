-- chunkname: @scripts/unit_extensions/human/ai_player_unit/target_selection_utils.lua

local HEALTH_ALIVE = HEALTH_ALIVE
local unit_knocked_down = AiUtils.unit_knocked_down
local vector3_distance = Vector3.distance
local POSITION_LOOKUP = POSITION_LOOKUP
local AI_TARGET_UNITS = AI_TARGET_UNITS
local AI_UTILS = AI_UTILS
local ScriptUnit_extension = ScriptUnit.extension
local result_table = {}

function get_ai_vs_ai_target(pos, side, breed)
	local radius = breed.minion_detection_radius or breed.detection_radius or 7
	local num_ai_units = AiUtils.broadphase_query(pos, radius, result_table, side.enemy_broadphase_categories)

	if num_ai_units > 0 then
		local target_unit = result_table[1]
		local wanted_dist = vector3_distance(pos, POSITION_LOOKUP[target_unit])

		return target_unit, wanted_dist
	end
end

PerceptionUtils.pick_closest_target = function (ai_unit, blackboard, breed)
	local ai_pos = POSITION_LOOKUP[ai_unit]
	local closest_enemy
	local closest_dist = math.huge
	local side = blackboard.side
	local enemy_player_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local ENEMY_PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for k, player_unit in ipairs(enemy_player_units) do
		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] then
			local player_pos = ENEMY_PLAYER_AND_BOT_POSITIONS[k]
			local dist = Vector3.distance(ai_pos, player_pos)

			if dist < breed.detection_radius and dist < closest_dist then
				closest_dist = dist
				closest_enemy = player_unit
			end
		end
	end

	return closest_enemy, closest_dist
end

PerceptionUtils.pick_closest_target_with_filter = function (ai_unit, blackboard, breed)
	local ai_pos = POSITION_LOOKUP[ai_unit]
	local closest_enemy
	local closest_dist = math.huge
	local is_of_interest_func = AiUtils[breed.is_of_interest_func]
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #PLAYER_AND_BOT_UNITS do
		local player_unit = PLAYER_AND_BOT_UNITS[i]

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] and is_of_interest_func(player_unit, ai_unit) then
			local player_pos = PLAYER_AND_BOT_POSITIONS[i]
			local dist = Vector3.distance(ai_pos, player_pos)

			if dist < breed.detection_radius and dist < closest_dist then
				closest_dist = dist
				closest_enemy = player_unit
			end
		end
	end

	return closest_enemy, closest_dist
end

local dummy_vortex_table = {}

PerceptionUtils.pick_closest_vortex_target = function (ai_unit, blackboard, breed)
	local ai_pos = POSITION_LOOKUP[ai_unit]
	local closest_enemy
	local closest_dist = math.huge
	local vortex_data = blackboard.vortex_data
	local players_ejected = vortex_data and vortex_data.players_ejected or dummy_vortex_table
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #PLAYER_AND_BOT_UNITS do
		local player_unit = PLAYER_AND_BOT_UNITS[i]

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] and not players_ejected[player_unit] and AiUtils.is_of_interest_to_vortex(player_unit) then
			local player_position = PLAYER_AND_BOT_POSITIONS[i]
			local dist = Vector3.distance(ai_pos, player_position)

			if dist < breed.detection_radius and dist < closest_dist then
				closest_dist = dist
				closest_enemy = player_unit
			end
		end
	end

	return closest_enemy, closest_dist
end

PerceptionUtils.pick_boss_sorcerer_target = function (ai_unit, blackboard, breed)
	local ai_pos = POSITION_LOOKUP[ai_unit]
	local closest_enemy
	local closest_dist = math.huge
	local side = blackboard.side
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local recent_attacker_unit = blackboard.recent_attacker_unit

	if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[recent_attacker_unit] then
		local enemy_pos = POSITION_LOOKUP[recent_attacker_unit]
		local dist = Vector3.distance(ai_pos, enemy_pos)

		return recent_attacker_unit, dist
	end

	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local is_of_interest_func = AiUtils[breed.is_of_interest_func]

	for k, player_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] and is_of_interest_func(player_unit) then
			local player_pos = PLAYER_AND_BOT_POSITIONS[k]
			local dist = Vector3.distance(ai_pos, player_pos)

			if dist < breed.detection_radius and dist < closest_dist then
				closest_dist = dist
				closest_enemy = player_unit
			end
		end
	end

	return closest_enemy, closest_dist
end

PerceptionUtils.pick_closest_target_infinte_range = function (ai_unit, blackboard, breed)
	local ai_pos = POSITION_LOOKUP[ai_unit]
	local closest_enemy
	local closest_dist = math.huge
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for k, player_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] then
			local player_pos = PLAYER_AND_BOT_POSITIONS[k]
			local dist = Vector3.distance(ai_pos, player_pos)

			if dist < closest_dist then
				closest_dist = dist
				closest_enemy = player_unit
			end
		end
	end

	return closest_enemy, closest_dist
end

PerceptionUtils.healthy_players = function (unit, blackboard, breed)
	local special_targets = blackboard.group_blackboard.special_targets
	local vector3_distance = Vector3.distance
	local best_score = -1000
	local best_unit
	local pos = POSITION_LOOKUP[unit]
	local weights = breed.perception_weights
	local max_distance = weights.max_distance
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #PLAYER_AND_BOT_UNITS do
		local player_unit = PLAYER_AND_BOT_UNITS[i]
		local score = 0

		if AiUtils.is_of_interest_to_gutter_runner(unit, player_unit, blackboard) then
			local special_target = special_targets[player_unit]

			if special_target then
				if special_target == unit then
					score = score + weights.sticky_bonus
				else
					score = score + weights.dog_pile_penalty
				end
			end

			local dist = vector3_distance(PLAYER_AND_BOT_POSITIONS[i], pos)

			if dist < max_distance then
				local inv_radius = math.clamp(1 - dist / max_distance, 0, 1)

				score = score + inv_radius * weights.distance_weight
			end

			if best_score < score then
				best_unit = player_unit
				best_score = score
			end
		end
	end

	return best_unit
end

PerceptionUtils.pick_ninja_skulking_target = function (unit, blackboard, breed)
	return PerceptionUtils.pick_solitary_target(unit, blackboard, breed)
end

PerceptionUtils.pick_ninja_approach_target = function (unit, blackboard, breed)
	local target_unit = blackboard.target_unit

	if blackboard.jump_data and blackboard.jump_data.target_unit then
		return blackboard.jump_data.target_unit, blackboard.target_dist, 100
	end

	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local closest_enemy
	local closest_dist = math.huge
	local urgency_to_engage = 0
	local special_targets = blackboard.group_blackboard.special_targets
	local pos = POSITION_LOOKUP[unit]

	for i = 1, #PLAYER_AND_BOT_UNITS do
		local player_unit = PLAYER_AND_BOT_UNITS[i]
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] and not status_extension:is_disabled() then
			local player_pos = PLAYER_AND_BOT_POSITIONS[i]
			local dist = Vector3.distance(pos, player_pos)

			if dist < closest_dist then
				if not target_unit or target_unit == player_unit or dist < breed.approaching_switch_radius then
					closest_dist = dist
					closest_enemy = player_unit
					urgency_to_engage = 10
				end
			elseif special_targets[player_unit] then
				blackboard.secondary_target = player_unit
			end
		else
			blackboard.secondary_target = player_unit
		end
	end

	return closest_enemy, closest_dist, urgency_to_engage
end

PerceptionUtils.pick_solitary_target = function (unit, blackboard, breed)
	local pos = POSITION_LOOKUP[unit]
	local closest_enemy
	local closest_dist = math.huge
	local urgency_to_engage = 0

	if blackboard.jump_data and blackboard.jump_data.target_unit then
		return blackboard.jump_data.target_unit, blackboard.target_dist, 100
	end

	local target_unit = blackboard.target_unit

	if ALIVE[target_unit] then
		local status_extension = ScriptUnit.extension(target_unit, "status_system")
		local is_pounced_by_me = status_extension:is_pounced_down() and status_extension:get_pouncer_unit() == unit

		if is_pounced_by_me then
			return target_unit, blackboard.target_dist, 100
		end
	end

	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local enemy_unit
	local num_enemies = #PLAYER_AND_BOT_UNITS

	if num_enemies == 1 then
		enemy_unit = PLAYER_AND_BOT_UNITS[1]
		urgency_to_engage = 5
	elseif num_enemies <= 2 then
		enemy_unit = PerceptionUtils.healthy_players(unit, blackboard, breed)

		if enemy_unit then
			urgency_to_engage = 5
		end
	else
		local side = blackboard.side
		local loneliness_value, dummy

		dummy, dummy, loneliness_value, enemy_unit = Managers.state.conflict:get_cluster_and_loneliness(10, side.ENEMY_PLAYER_POSITIONS, side.ENEMY_PLAYER_UNITS)

		if loneliness_value > 4 and AiUtils.is_of_interest_to_gutter_runner(unit, enemy_unit, blackboard) then
			if loneliness_value > 15 then
				urgency_to_engage = 10
			elseif loneliness_value > 10 and blackboard.total_slots_count >= 3 then
				urgency_to_engage = 5
			elseif loneliness_value > 4 and blackboard.total_slots_count >= 6 then
				urgency_to_engage = 5
			else
				urgency_to_engage = 1
			end
		else
			enemy_unit = PerceptionUtils.healthy_players(unit, blackboard, breed)

			if enemy_unit then
				urgency_to_engage = 5
			end
		end
	end

	if enemy_unit then
		closest_dist = Vector3.distance(pos, POSITION_LOOKUP[enemy_unit])
		closest_enemy = enemy_unit

		if closest_dist < 10 then
			urgency_to_engage = 10
		end
	end

	return closest_enemy, closest_dist, urgency_to_engage
end

local DOGPILE_SCORE = 2.5
local DISABLED_SLOT_SCORE = 2.5
local ALL_SLOTS_DISABLED_SCORE = 600
local STICKY_AGGRO_RANGE_SQUARED = 5.0625
local HIGHER_STICKINESS_RANGE_SQUARED = 4
local DISTANCE_SCORE = 0.25
local COMBO_TARGET_SCORE = 5

local function _calculate_horde_pick_closest_target_with_spillover_score(target_unit, target_current, previous_attacker, ai_unit_position, breed, perception_previous_attacker_stickyness_value)
	local target_type = Unit.get_data(target_unit, "target_type")
	local exceptions = target_type and breed.perception_exceptions and breed.perception_exceptions[target_type]

	if exceptions then
		return
	end

	local dogpile_count = 0
	local disabled_slots_count = 0
	local all_slots_disabled = false
	local is_previous_attacker = previous_attacker and previous_attacker == target_unit

	if ScriptUnit.has_extension(target_unit, "ai_slot_system") then
		local target_slot_extension = ScriptUnit.extension(target_unit, "ai_slot_system")

		if not target_slot_extension.valid_target then
			return
		end

		local slot_type = breed.use_slot_type
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")
		local total_slots_count = ai_slot_system:total_slots_count(target_unit, slot_type)

		dogpile_count = ai_slot_system:slots_count(target_unit, slot_type)
		disabled_slots_count = ai_slot_system:disabled_slots_count(target_unit, slot_type)
		all_slots_disabled = disabled_slots_count == total_slots_count

		local status_ext = ScriptUnit.has_extension(target_unit, "status_system")
		local on_ladder = status_ext and status_ext:get_is_on_ladder()

		if on_ladder then
			local max_allowed = is_previous_attacker and total_slots_count or total_slots_count - 1

			if max_allowed < dogpile_count then
				all_slots_disabled = true
			end
		end
	end

	local target_unit_position = POSITION_LOOKUP[target_unit]

	if not target_unit_position then
		return
	end

	local distance_sq = Vector3.distance_squared(ai_unit_position, target_unit_position)
	local aggro_extension = ScriptUnit.extension(target_unit, "aggro_system")
	local aggro_modifier = aggro_extension.aggro_modifier
	local is_knocked_down = unit_knocked_down(target_unit)

	if distance_sq < STICKY_AGGRO_RANGE_SQUARED and not is_knocked_down then
		dogpile_count = math.max(dogpile_count - 4, 0)
	end

	local stickyness_modifier = breed.target_stickyness_modifier or -5

	if distance_sq > HIGHER_STICKINESS_RANGE_SQUARED then
		stickyness_modifier = stickyness_modifier * 0.5
	end

	local score_dogpile = dogpile_count * DOGPILE_SCORE
	local score_distance = distance_sq * DISTANCE_SCORE
	local score_stickyness = target_unit == target_current and stickyness_modifier or 0
	local knocked_down_modifer = is_knocked_down and 5 or 0
	local previous_attacker_stickyness_value = is_previous_attacker and perception_previous_attacker_stickyness_value or 0
	local score_disabled_slots = disabled_slots_count * DISABLED_SLOT_SCORE
	local score_all_slots_disabled = all_slots_disabled and ALL_SLOTS_DISABLED_SCORE or 0
	local score = score_dogpile + score_distance + score_disabled_slots + score_all_slots_disabled + score_stickyness + previous_attacker_stickyness_value + knocked_down_modifer + aggro_modifier

	return score, distance_sq
end

local dogpile_score = {
	[0] = 0,
	4,
	9,
	16,
	25,
	36,
}

local function get_lean_score(blackboard, position, ai_unit, target_unit)
	local lean_dogpile = blackboard.lean_dogpile
	local dogpiled_attackers

	if USE_ENGINE_SLOID_SYSTEM then
		dogpiled_attackers = Managers.state.conflict.dogpiled_attackers_on_unit[target_unit]
	else
		dogpiled_attackers = Managers.state.conflict.gathering.dogpiled_attackers_on_unit[target_unit]
	end

	local already_attacking = dogpiled_attackers and dogpiled_attackers[ai_unit]

	if already_attacking then
		lean_dogpile = lean_dogpile - 1
	end

	local dogpile_score = dogpile_score[lean_dogpile] or 64
	local target_position = POSITION_LOOKUP[target_unit]
	local dist_sq = Vector3.distance_squared(position, target_position)
	local target_score = dogpile_score + dist_sq

	return target_score, dist_sq
end

local LEAN_TARGET_STICKYNESS = 0.5

function tprint(unit, s, ...)
	if unit == script_data.debug_unit then
		printf(s, ...)
	end
end

local function get_lean_target(blackboard, position, side, ai_unit, check_for_walls, t, ignored_breed_filter)
	local breed = blackboard.breed
	local radius = blackboard.override_detection_radius or blackboard.detection_radius or breed.minion_detection_radius or breed.detection_radius or 7
	local num_ai_units, target_unit
	local lean_unit_list = blackboard.lean_unit_list
	local unit_index, time_index, score_index
	local next_lean_index = blackboard.next_lean_index

	if blackboard.next_lean_index <= 0 then
		num_ai_units = AiUtils.broadphase_query(position, radius, result_table, side.enemy_broadphase_categories)

		if num_ai_units > 0 then
			local max_iterations

			if math.random() < 0.9 then
				max_iterations = math.min(num_ai_units, 5)
			else
				max_iterations = math.min(num_ai_units, 12)
			end

			for i = 1, max_iterations do
				lean_unit_list[i] = result_table[i]
			end

			blackboard.next_lean_index = 1
			lean_unit_list.size = max_iterations
			target_unit = lean_unit_list[1]
		end
	else
		target_unit = lean_unit_list[next_lean_index]
		next_lean_index = next_lean_index + 1
		blackboard.next_lean_index = next_lean_index >= lean_unit_list.size and 0 or next_lean_index
	end

	local best_score = math.huge
	local target_blackboard, best_target_unit
	local previous_target = blackboard.target_unit

	if HEALTH_ALIVE[previous_target] then
		local prev_target_blackboard = BLACKBOARDS[previous_target]

		if prev_target_blackboard and prev_target_blackboard.lean_dogpile then
			local target_score = get_lean_score(prev_target_blackboard, position, ai_unit, previous_target)

			best_score = target_score * LEAN_TARGET_STICKYNESS
			best_target_unit = previous_target
		end
	end

	if not HEALTH_ALIVE[target_unit] or target_unit == best_target_unit then
		-- Nothing
	else
		target_blackboard = BLACKBOARDS[target_unit]

		local target_breed_name = target_blackboard.breed.name

		if ignored_breed_filter[target_breed_name] then
			-- Nothing
		else
			local dogpile = target_blackboard.lean_dogpile

			if dogpile >= target_blackboard.crowded_slots then
				-- Nothing
			else
				local target_position = POSITION_LOOKUP[target_unit]
				local target_score = get_lean_score(target_blackboard, position, ai_unit, target_unit)

				if target_score < best_score then
					if check_for_walls then
						local node = Unit.node(ai_unit, "j_head")
						local from_pos = Unit.world_position(ai_unit, node)

						if not AiUtils.line_of_sight_from_random_point(from_pos, target_unit) then
							goto label_1_0
						end
					end

					best_score = target_score
					best_target_unit = target_unit
				end
			end
		end
	end

	::label_1_0::

	if best_target_unit then
		return best_target_unit, best_score * 0.95
	else
		return nil, math.huge
	end
end

PerceptionUtils.horde_pick_closest_target_with_spillover = function (ai_unit, blackboard, breed, t)
	fassert(ScriptUnit.has_extension(ai_unit, "ai_slot_system"), "Error! Trying to use slot_system perception for non-slot system unit!")

	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local target_current = blackboard.target_unit
	local best_target_unit
	local best_score = math.huge
	local side = blackboard.side
	local targets = side.AI_TARGET_UNITS
	local perception_previous_attacker_stickyness_value = breed.perception_previous_attacker_stickyness_value
	local previous_attacker = blackboard.previous_attacker
	local distance_to_target_sq
	local using_override_target = false
	local override_targets = blackboard.override_targets
	local valid_players = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local enemy_units = side.enemy_units_lookup

	for target_unit, end_of_override_t in pairs(override_targets) do
		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
		local is_player = status_extension
		local is_valid

		if is_player then
			is_valid = valid_players[target_unit]
		else
			is_valid = enemy_units[target_unit] and HEALTH_ALIVE[target_unit]
		end

		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

		if not is_valid or end_of_override_t < t or status_extension and status_extension:is_disabled() then
			override_targets[target_unit] = nil
		else
			local score, distance_sq

			if is_player then
				score, distance_sq = _calculate_horde_pick_closest_target_with_spillover_score(target_unit, target_current, previous_attacker, ai_unit_position, breed, perception_previous_attacker_stickyness_value)
			else
				local target_blackboard = BLACKBOARDS[target_unit]

				score, distance_sq = get_lean_score(target_blackboard, ai_unit_position, ai_unit, target_unit)
			end

			if score and score < best_score then
				best_score = score
				best_target_unit = target_unit
				distance_to_target_sq = distance_sq
				using_override_target = true
			end
		end
	end

	blackboard.using_override_target = using_override_target

	if not using_override_target then
		best_target_unit, best_score = get_lean_target(blackboard, ai_unit_position, side, ai_unit, false, t, breed.infighting.ignored_breed_filter)

		for i_target, target_unit in ipairs(targets) do
			local score, distance_sq = _calculate_horde_pick_closest_target_with_spillover_score(target_unit, target_current, previous_attacker, ai_unit_position, breed, perception_previous_attacker_stickyness_value)
			local is_unwanted = AiUtils.is_unwanted_target(side, target_unit)
			local is_best_target = not is_unwanted and score and score < best_score

			if is_best_target then
				best_score = score
				best_target_unit = target_unit
				distance_to_target_sq = distance_sq
			end
		end
	end

	return best_target_unit, distance_to_target_sq
end

PerceptionUtils.pick_closest_target_near_detection_source_position = function (ai_unit, blackboard, breed, t)
	local side = blackboard.side
	local source_position
	local detection_pos = blackboard.detection_source_pos

	if detection_pos then
		source_position = detection_pos:unbox()
	else
		source_position = POSITION_LOOKUP[ai_unit]
	end

	local best_target_unit = get_lean_target(blackboard, source_position, side, ai_unit, true, t, breed.infighting.ignored_breed_filter)
	local best_target_position = POSITION_LOOKUP[best_target_unit]
	local dist_to_target_sq = best_target_position and Vector3.distance_squared(source_position, best_target_position)

	return best_target_unit, dist_to_target_sq
end

PerceptionUtils.pick_best_target_near_commander_target = function (ai_unit, blackboard, breed, t)
	local commander_target = blackboard.commander_target

	if not HEALTH_ALIVE[commander_target] then
		blackboard.override_target_selection_name = nil

		return
	end

	local side = blackboard.side
	local source_position = POSITION_LOOKUP[commander_target]
	local best_target_unit = get_lean_target(blackboard, source_position, side, ai_unit, true, t, breed.infighting.ignored_breed_filter)
	local best_target_position = POSITION_LOOKUP[best_target_unit]
	local dist_to_target_sq = best_target_position and Vector3.distance_squared(source_position, best_target_position)

	return best_target_unit, dist_to_target_sq
end

PerceptionUtils.attack_commander_target_with_fallback = function (ai_unit, blackboard, breed, t)
	local commander_target = blackboard.commander_target

	if not HEALTH_ALIVE[commander_target] then
		blackboard.override_target_selection_name = nil

		return
	end

	local bb = BLACKBOARDS[commander_target]
	local has_dogpile = bb.lean_dogpile

	if has_dogpile then
		local dogpile = bb.lean_dogpile - (blackboard.target_unit == commander_target and 1 or 0)

		if dogpile >= bb.crowded_slots then
			return PerceptionUtils.pick_best_target_near_commander_target(ai_unit, blackboard, breed, t)
		end
	end

	return commander_target
end

local function _calculate_closest_target_with_spillover_score(ai_unit, target_unit, target_current, previous_attacker, ai_unit_position, raycast_pos, breed, detection_radius_sq, perception_previous_attacker_stickyness_value, is_horde, group_targets)
	local target_type = Unit.get_data(target_unit, "target_type")
	local exceptions = target_type and breed.perception_exceptions and breed.perception_exceptions[target_type]

	if exceptions then
		return
	end

	local target_unit_position = POSITION_LOOKUP[target_unit]

	if not target_unit_position then
		return
	end

	local distance_sq = Vector3.distance_squared(ai_unit_position, target_unit_position)
	local should_check_los = not target_current or group_targets and not group_targets[target_unit]

	if should_check_los then
		if target_unit ~= target_current and detection_radius_sq < distance_sq then
			return
		end

		if not is_horde then
			local has_los = AiUtils.line_of_sight_from_random_point(raycast_pos, target_unit)

			if not has_los then
				return
			end
		end
	end

	local dogpile_count = 0
	local disabled_slots_count = 0
	local all_slots_disabled = false
	local is_previous_attacker = previous_attacker and previous_attacker == target_unit
	local target_of_combo_score = 0
	local target_slot_extension = ScriptUnit.has_extension(target_unit, "ai_slot_system")

	if target_slot_extension then
		local target_blackboard = BLACKBOARDS[target_unit]
		local target_is_player = target_blackboard and target_blackboard.is_player

		if target_is_player and not target_slot_extension.valid_target then
			return
		end

		local slot_type = breed.use_slot_type
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")
		local total_slots_count = ai_slot_system:total_slots_count(target_unit, slot_type)

		dogpile_count = ai_slot_system:slots_count(target_unit, slot_type)
		disabled_slots_count = ai_slot_system:disabled_slots_count(target_unit, slot_type)
		all_slots_disabled = disabled_slots_count == total_slots_count

		local status_ext = ScriptUnit.has_extension(target_unit, "status_system")
		local on_ladder = status_ext and status_ext:get_is_on_ladder()

		if on_ladder then
			local max_allowed = is_previous_attacker and total_slots_count or total_slots_count - 1

			if max_allowed < dogpile_count then
				all_slots_disabled = true
			end
		end

		target_of_combo_score = (status_ext and status_ext:get_combo_target_count() or 0) * COMBO_TARGET_SCORE
	end

	local aggro_extension = ScriptUnit.has_extension(target_unit, "aggro_system")
	local aggro_modifier = aggro_extension and aggro_extension.aggro_modifier or 0
	local is_knocked_down = unit_knocked_down(target_unit)

	if distance_sq < STICKY_AGGRO_RANGE_SQUARED and not is_knocked_down then
		dogpile_count = math.max(dogpile_count - 4, 0)
	end

	local stickyness_modifier = breed.target_stickyness_modifier or -5

	if distance_sq > HIGHER_STICKINESS_RANGE_SQUARED then
		stickyness_modifier = stickyness_modifier * 0.5
	end

	local score_dogpile = dogpile_count * DOGPILE_SCORE
	local score_distance = distance_sq * DISTANCE_SCORE
	local score_stickyness = target_unit == target_current and stickyness_modifier or 0
	local knocked_down_modifer = is_knocked_down and 5 or 0
	local previous_attacker_stickyness_value = is_previous_attacker and perception_previous_attacker_stickyness_value or 0
	local score_disabled_slots = disabled_slots_count * DISABLED_SLOT_SCORE
	local score_all_slots_disabled = all_slots_disabled and ALL_SLOTS_DISABLED_SCORE or 0
	local score = score_dogpile + score_disabled_slots + score_all_slots_disabled + score_distance + score_stickyness + previous_attacker_stickyness_value + knocked_down_modifer + aggro_modifier + target_of_combo_score

	return score, distance_sq
end

PerceptionUtils.pick_closest_target_with_spillover = function (ai_unit, blackboard, breed, t)
	fassert(ScriptUnit.has_extension(ai_unit, "ai_slot_system"), "Error! Trying to use slot_system perception for non-slot system unit!")

	local detection_radius
	local during_horde_detection_radius = breed.during_horde_detection_radius
	local is_horde = false

	if during_horde_detection_radius and Managers.state.conflict:has_horde() then
		detection_radius = 45
		is_horde = true
	else
		detection_radius = breed.detection_radius
	end

	local POSITION_LOOKUP = POSITION_LOOKUP
	local detection_radius_sq = detection_radius * detection_radius
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local target_current = blackboard.target_unit
	local best_target_unit
	local best_score = math.huge
	local distance_to_target_sq
	local side = blackboard.side
	local enemy_player_targets = side.AI_TARGET_UNITS
	local perception_previous_attacker_stickyness_value = breed.perception_previous_attacker_stickyness_value
	local previous_attacker = blackboard.previous_attacker
	local raycast_pos = Unit.world_position(ai_unit, Unit.node(ai_unit, "j_head"))
	local using_override_target = false
	local override_targets = blackboard.override_targets
	local valid_players = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local enemy_units = side.enemy_units_lookup

	for target_unit, end_of_override_t in pairs(override_targets) do
		local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
		local is_player = status_extension
		local is_valid

		if is_player then
			is_valid = valid_players[target_unit]
		else
			is_valid = enemy_units[target_unit] and HEALTH_ALIVE[target_unit]
		end

		if not is_valid or end_of_override_t < t or status_extension and status_extension:is_disabled() then
			override_targets[target_unit] = nil
		else
			local score, distance_sq

			if is_player then
				score, distance_sq = _calculate_closest_target_with_spillover_score(ai_unit, target_unit, target_current, previous_attacker, ai_unit_position, raycast_pos, breed, detection_radius_sq, perception_previous_attacker_stickyness_value, is_horde)
			else
				local target_blackboard = BLACKBOARDS[target_unit]

				score, distance_sq = get_lean_score(target_blackboard, ai_unit_position, ai_unit, target_unit)
			end

			if score and score < best_score then
				best_score = score
				best_target_unit = target_unit
				distance_to_target_sq = distance_sq
				using_override_target = true
			end
		end
	end

	blackboard.using_override_target = using_override_target

	if not using_override_target then
		best_target_unit, best_score = get_lean_target(blackboard, ai_unit_position, side, ai_unit, true, t, breed.infighting.ignored_breed_filter)

		local num_player_targets = #enemy_player_targets
		local group_extension = ScriptUnit.has_extension(ai_unit, "ai_group_system")
		local group_targets

		if group_extension and group_extension.use_patrol_perception then
			local group = group_extension.group

			group_targets = group.target_units
		end

		for i = 1, num_player_targets do
			local target_unit = enemy_player_targets[i]
			local is_unwanted = AiUtils.is_unwanted_target(side, target_unit)

			if not is_unwanted then
				local score, distance_sq = _calculate_closest_target_with_spillover_score(ai_unit, target_unit, target_current, previous_attacker, ai_unit_position, raycast_pos, breed, detection_radius_sq, perception_previous_attacker_stickyness_value, is_horde, group_targets)

				if score and score < best_score then
					best_score = score
					best_target_unit = target_unit
					distance_to_target_sq = distance_sq
				end
			end
		end
	end

	return best_target_unit, distance_to_target_sq
end

local storm_patrol_debug_draw_count = 0

PerceptionUtils.patrol_passive_target_selection = function (ai_unit, blackboard, breed, t)
	local detection_radius_sqr = breed.patrol_detection_radius * breed.patrol_detection_radius
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local last_attacker = blackboard.previous_attacker
	local blackboard_target = blackboard.target_unit or last_attacker
	local best_target_unit
	local best_score = math.huge
	local distance_to_target_sq = 0
	local side = blackboard.side
	local global_targets = side.ENEMY_PLAYER_AND_BOT_UNITS
	local num_global_targets = #global_targets
	local group_extension = ScriptUnit.extension(ai_unit, "ai_group_system")
	local group = group_extension.group
	local group_targets = group.target_units
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local VALID_ENEMY_PLAYERS_AND_BOTS = side.VALID_ENEMY_PLAYERS_AND_BOTS

	if blackboard_target and HEALTH_ALIVE[blackboard_target] and (not VALID_ENEMY_PLAYERS_AND_BOTS[blackboard_target] or VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[blackboard_target]) then
		group_targets[blackboard_target] = true

		local attacker_pos = POSITION_LOOKUP[blackboard_target]

		for i = 1, num_global_targets do
			repeat
				local target_unit = global_targets[i]

				if not VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[target_unit] then
					break
				end

				if ScriptUnit.has_extension(target_unit, "ai_slot_system") then
					local target_slot_extension = ScriptUnit.extension(target_unit, "ai_slot_system")

					if not target_slot_extension.valid_target then
						break
					end
				else
					break
				end

				local target_unit_position = POSITION_LOOKUP[target_unit]
				local distance_sq = Vector3.distance_squared(attacker_pos, target_unit_position)

				if distance_sq < detection_radius_sqr then
					group_targets[target_unit] = true
				end
			until true
		end
	end

	for i = 1, num_global_targets do
		repeat
			local target_unit = global_targets[i]

			if not VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[target_unit] then
				break
			end

			if ScriptUnit.has_extension(target_unit, "ai_slot_system") then
				local target_slot_extension = ScriptUnit.extension(target_unit, "ai_slot_system")

				if not target_slot_extension.valid_target then
					break
				end
			else
				break
			end

			local target_unit_position = POSITION_LOOKUP[target_unit]
			local is_bot = Managers.player:owner(target_unit).bot_player
			local distance_sq = Vector3.distance_squared(ai_unit_position, target_unit_position)
			local view_cone_dot = 0.5

			if distance_sq < detection_radius_sqr then
				local anchor_direction = blackboard.anchor_direction
				local ai_unit_rotation = anchor_direction and anchor_direction:unbox() or Quaternion.forward(Unit.world_rotation(ai_unit, 0))
				local ai_unit_direction = Vector3.normalize(ai_unit_rotation)
				local ai_unit_to_target_dir = Vector3.normalize(target_unit_position - ai_unit_position)
				local dot = Vector3.dot(ai_unit_to_target_dir, ai_unit_direction)

				if view_cone_dot < dot and not is_bot or distance_sq < breed.panic_close_detection_radius_sq then
					local physics_world = World.get_data(Unit.world(target_unit), "physics_world")
					local see_you = PerceptionUtils.raycast_spine_to_spine(ai_unit, target_unit, physics_world)

					if see_you then
						group_targets[target_unit] = true
						best_target_unit = target_unit
						distance_to_target_sq = distance_sq
					end
				end
			end
		until true
	end

	if group.in_combat and not next(group_targets) then
		local detection_radius = group.patrol_detection_radius or 1.5

		best_target_unit, best_score = get_lean_target(blackboard, ai_unit_position, side, ai_unit, false, t, breed.infighting.ignored_breed_filter)

		if best_target_unit then
			group_targets[best_target_unit] = true
		end
	end

	return nil
end

PerceptionUtils.storm_patrol_death_squad_target_selection = function (ai_unit, blackboard, breed, t)
	fassert(ScriptUnit.has_extension(ai_unit, "ai_slot_system"), "Error! Trying to use slot_system perception for non-slot system unit!")

	local detection_radius = breed.detection_radius
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local raycast_pos = Unit.world_position(ai_unit, Unit.node(ai_unit, "j_head"))
	local target_current = blackboard.target_unit
	local last_attacker = blackboard.previous_attacker
	local best_target_unit
	local best_score = math.huge
	local distance_to_target_sq
	local side = blackboard.side
	local global_targets = side.ENEMY_PLAYER_AND_BOT_UNITS
	local valid_players_and_bots = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local group_extension = ScriptUnit.extension(ai_unit, "ai_group_system")
	local group = group_extension.group
	local group_targets = group.target_units
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	if last_attacker and not group_targets[last_attacker] and HEALTH_ALIVE[last_attacker] then
		group_targets[last_attacker] = true
	end

	local num_global_targets = #global_targets

	for i = 1, num_global_targets do
		local target_unit = global_targets[i]

		if not group_targets[target_unit] then
			local target_slot_extension = ScriptUnit.has_extension(target_unit, "ai_slot_system")

			if target_slot_extension and target_slot_extension.valid_target then
				local target_unit_position = POSITION_LOOKUP[target_unit]
				local distance_sq = Vector3.distance_squared(ai_unit_position, target_unit_position)

				if distance_sq < detection_radius * detection_radius and AiUtils.line_of_sight_from_random_point(raycast_pos, target_unit) then
					group_targets[target_unit] = true
				end
			end
		end
	end

	for target_unit, _ in pairs(group_targets) do
		repeat
			local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
			local is_player = status_extension
			local aggro_modifier = 0
			local knocked_down_modifer = 0
			local score_dogpile = 0

			if is_player then
				if not valid_players_and_bots[target_unit] then
					group_targets[target_unit] = nil

					break
				end

				if status_extension.using_transport or status_extension.spawn_grace then
					group_targets[target_unit] = nil

					break
				end

				if ScriptUnit.has_extension(target_unit, "ai_slot_system") then
					local target_slot_extension = ScriptUnit.extension(target_unit, "ai_slot_system")

					if not target_slot_extension.valid_target then
						break
					end

					score_dogpile = ai_slot_system:slots_count(target_unit) * DOGPILE_SCORE
				end

				local aggro_extension = ScriptUnit.extension(target_unit, "aggro_system")

				aggro_modifier = aggro_extension.aggro_modifier
				knocked_down_modifer = status_extension:is_knocked_down() and 5 or 0
			elseif not HEALTH_ALIVE[target_unit] then
				group_targets[target_unit] = nil

				break
			end

			local target_unit_position = POSITION_LOOKUP[target_unit]
			local distance_sq = Vector3.distance_squared(ai_unit_position, target_unit_position)
			local score_distance = distance_sq * 0.1
			local score_stickyness = target_unit == target_current and -5 or 0
			local score = score_dogpile + score_distance + score_stickyness + knocked_down_modifer + aggro_modifier

			if score < best_score then
				best_score = score
				best_target_unit = target_unit
			end
		until true
	end

	if group.in_combat and not next(group_targets) then
		best_target_unit, best_score = get_lean_target(blackboard, ai_unit_position, side, ai_unit, false, t, breed.infighting.ignored_breed_filter)

		if best_target_unit then
			group_targets[best_target_unit] = true
		end
	end

	return best_target_unit
end

PerceptionUtils.pick_encampment_target_idle = function (unit, blackboard, breed, t)
	local attacker = blackboard.previous_attacker

	if attacker or blackboard.confirmed_player_sighting then
		local group_extension = ScriptUnit.extension(unit, "ai_group_system")

		AIGroupTemplates.encampment.wake_up_encampment(group_extension.group)

		if attacker then
			local enemy_dist = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[attacker])
			local urgency_to_engage = 100

			return attacker, enemy_dist, urgency_to_engage
		end
	end
end

PerceptionUtils.pick_closest_target_with_spillover_wakeup_group = function (unit, blackboard, breed, t)
	local attacker = blackboard.previous_attacker

	if attacker or blackboard._was_attacked then
		blackboard._was_attacked = true

		local group_extension = ScriptUnit.extension(unit, "ai_group_system")
		local group_template = group_extension.template

		AIGroupTemplates[group_template].wake_up_group(group_extension.group, attacker)

		return PerceptionUtils.pick_closest_target_with_spillover(unit, blackboard, breed, t)
	end
end

PerceptionUtils.pick_no_targets = function ()
	return
end

PerceptionUtils.pick_player_controller_allied = function (unit, blackboard, breed, t)
	local player_controller = blackboard.player_controller

	if player_controller and ALIVE[player_controller] then
		local ai_unit_position = POSITION_LOOKUP[unit]
		local target_unit_position = POSITION_LOOKUP[player_controller]
		local distance = Vector3.distance(ai_unit_position, target_unit_position)

		return player_controller, distance
	end
end

PerceptionUtils.pick_rat_ogre_target_idle = function (unit, blackboard, breed, t)
	local w = blackboard.waiting
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_PLAYERS_AND_BOTS = side.VALID_ENEMY_PLAYERS_AND_BOTS

	if t > w.next_update_time then
		local num_players = #PLAYER_AND_BOT_UNITS

		if num_players <= 0 then
			return
		end

		w.next_player_unit_index = w.next_player_unit_index + 1

		if num_players < w.next_player_unit_index then
			w.next_player_unit_index = 1
		end

		local enemy_unit = PLAYER_AND_BOT_UNITS[w.next_player_unit_index]
		local enemy_pos = POSITION_LOOKUP[enemy_unit]
		local ogre_pos = POSITION_LOOKUP[unit]
		local dist_squared = Vector3.distance_squared(ogre_pos, enemy_pos)

		if VALID_PLAYERS_AND_BOTS[enemy_unit] and dist_squared < breed.distance_sq_can_detect_target then
			local in_view_cone = true
			local view_cone_dot = w.view_cone_dot

			if view_cone_dot then
				local ogre_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				local to_target_dir = Vector3.normalize(enemy_pos - ogre_pos)
				local dot = Vector3.dot(to_target_dir, ogre_direction)

				in_view_cone = dot > w.view_cone_dot or dist_squared < breed.distance_sq_idle_auto_detect_target
			end

			if in_view_cone then
				local physics_world = World.get_data(Unit.world(enemy_unit), "physics_world")
				local los = PerceptionUtils.raycast_spine_to_spine(unit, enemy_unit, physics_world)

				if los then
					local ai_simple = ScriptUnit_extension(unit, "ai_system")

					ai_simple:set_perception(breed.perception, breed.target_selection_angry)
					Managers.state.conflict:add_angry_boss(1)

					blackboard.is_angry = true

					local urgency_to_engage = 100
					local enemy_dist = math.sqrt(dist_squared)

					return enemy_unit, enemy_dist, urgency_to_engage
				end
			end
		end

		if w.awake_on_players_passing then
			local conflict_director = Managers.state.conflict
			local ahead_unit = conflict_director.main_path_info.ahead_unit

			if ahead_unit and ALIVE[ahead_unit] and VALID_PLAYERS_AND_BOTS[ahead_unit] then
				local info = conflict_director.main_path_player_info[ahead_unit]

				if info.travel_dist >= w.travel_dist then
					local enemy_dist = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[ahead_unit])
					local urgency_to_engage = 100

					AiUtils.activate_unit(blackboard)

					return ahead_unit, enemy_dist, urgency_to_engage
				end
			end
		end

		local attacker = blackboard.previous_attacker

		if attacker and VALID_PLAYERS_AND_BOTS[attacker] or blackboard.is_angry then
			local ai_simple = ScriptUnit_extension(unit, "ai_system")

			ai_simple:set_perception(breed.perception, breed.target_selection_angry)
			Managers.state.conflict:add_angry_boss(1)

			blackboard.is_angry = true

			local enemy_dist = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[attacker])
			local urgency_to_engage = 100

			return attacker, enemy_dist, urgency_to_engage
		end

		w.next_update_time = t + 0.5
	end
end

local function reset_aggro(aggro_list)
	for enemy_unit, aggro in pairs(aggro_list) do
		aggro_list[enemy_unit] = 0
	end
end

local score_table = {}

PerceptionUtils.pick_rat_ogre_target_with_weights = function (unit, blackboard, breed, t)
	local vector3_distance = Vector3.distance
	local wanted_enemy
	local wanted_dist = math.huge
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local is_valid_target_func = blackboard.valid_target_func or GenericStatusExtension.is_ogre_target
	local num_enemies = #PLAYER_AND_BOT_UNITS
	local best_score = -1000
	local group_blackboard = blackboard.group_blackboard
	local is_horde = blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden"
	local pos = POSITION_LOOKUP[unit]

	for i = 1, num_enemies do
		local enemy_unit = PLAYER_AND_BOT_UNITS[i]
		local score = 0
		local dist = math.huge
		local status_extension = ScriptUnit.extension(enemy_unit, "status_system")

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] and is_valid_target_func(status_extension) then
			local weights = breed.perception_weights

			if blackboard.target_unit == enemy_unit then
				local sticky_time = t - blackboard.target_unit_found_time

				if sticky_time < weights.target_stickyness_duration_a then
					score = score + weights.target_stickyness_bonus_a
				elseif sticky_time < weights.target_stickyness_duration_b then
					score = score + (1 - sticky_time / weights.target_stickyness_duration_b) * weights.target_stickyness_bonus_b
				end
			elseif group_blackboard.special_targets[enemy_unit] then
				blackboard.secondary_target = enemy_unit
				score = score + weights.targeted_by_other_special
			end

			local enemy_pos = POSITION_LOOKUP[enemy_unit]

			dist = vector3_distance(pos, enemy_pos)

			local distance_valid_target = dist < breed.detection_radius

			if distance_valid_target then
				local inv_radius = math.clamp(1 - dist / weights.max_distance, 0, 1)

				score = score + inv_radius * inv_radius * weights.distance_weight
			end

			if is_horde or not breed.ignore_targets_outside_detection_radius or blackboard.target_unit or distance_valid_target then
				if weights.target_staggered_you_bonus and blackboard.pushing_unit and blackboard.pushing_unit == enemy_unit then
					score = score + weights.target_staggered_you_bonus
					blackboard.target_unit_found_time = t

					reset_aggro(blackboard.aggro_list)
				end

				local aggro = blackboard.aggro_list[enemy_unit] or 0
				local enemy_disabled = status_extension:is_disabled()

				if enemy_disabled then
					aggro = aggro * weights.target_disabled_aggro_mul
					blackboard.aggro_list[enemy_unit] = aggro
				end

				score = score + aggro

				if enemy_disabled then
					score = score * weights.target_disabled_mul
				end

				if t - status_extension.last_catapulted_time < 5 then
					score = score * weights.target_catapulted_mul
				end

				if blackboard.target_outside_navmesh then
					score = score * weights.target_outside_navmesh_mul
				end

				if best_score < score then
					wanted_enemy = enemy_unit
					wanted_dist = dist
					best_score = score
				end
			end
		end
	end

	local infighting = breed.infighting

	if best_score < infighting.trigger_minion_target_search then
		local infight_wanted_enemy = get_lean_target(blackboard, pos, side, unit, true, t, breed.infighting.ignored_breed_filter)

		if infight_wanted_enemy then
			wanted_enemy, wanted_dist = infight_wanted_enemy, vector3_distance(pos, POSITION_LOOKUP[infight_wanted_enemy])
		end
	end

	return wanted_enemy, wanted_dist
end

PerceptionUtils.pick_bestigor_target_with_weights = function (unit, blackboard, breed, t)
	local vector3_distance = Vector3.distance
	local wanted_enemy
	local wanted_dist = math.huge
	local is_valid_target_func = blackboard.valid_target_func or GenericStatusExtension.is_ogre_target
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local num_enemies = #PLAYER_AND_BOT_UNITS
	local best_score = -1000
	local group_blackboard = blackboard.group_blackboard
	local line_of_sight_system = ScriptUnit.extension(unit, "ai_line_of_sight_system")
	local los_check
	local confirmed_player_sighting = blackboard.confirmed_player_sighting
	local pos = POSITION_LOOKUP[unit]

	if not confirmed_player_sighting and (not blackboard.next_los_check or blackboard.next_los_check and t > blackboard.next_los_check) then
		los_check = FrameTable.alloc_table()

		for i = 1, num_enemies do
			local enemy_unit = PLAYER_AND_BOT_UNITS[i]
			local has_los = line_of_sight_system:has_line_of_sight(unit, blackboard, enemy_unit, breed.detection_radius * breed.detection_radius)

			blackboard.next_los_check = t + 0.5
			los_check[enemy_unit] = has_los
		end
	end

	for i = 1, num_enemies do
		repeat
			local enemy_unit = PLAYER_AND_BOT_UNITS[i]

			if not confirmed_player_sighting and (not blackboard.previous_attacker or blackboard.previous_attacker ~= enemy_unit) then
				if los_check and not los_check[enemy_unit] then
					break
				elseif not los_check then
					break
				end
			end

			local score = 0
			local dist = math.huge
			local status_extension = ScriptUnit.extension(enemy_unit, "status_system")

			if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] and is_valid_target_func(status_extension) then
				local weights = breed.perception_weights

				if blackboard.target_unit == enemy_unit then
					local sticky_time = t - blackboard.target_unit_found_time

					if sticky_time < weights.target_stickyness_duration_a then
						score = score + weights.target_stickyness_bonus_a
					elseif sticky_time < weights.target_stickyness_duration_b then
						score = score + (1 - sticky_time / weights.target_stickyness_duration_b) * weights.target_stickyness_bonus_b
					end
				end

				local enemy_pos = POSITION_LOOKUP[enemy_unit]

				dist = vector3_distance(pos, enemy_pos)

				local distance_valid_target = dist < breed.detection_radius

				if distance_valid_target then
					local inv_radius = math.clamp(1 - dist / weights.max_distance, 0, 1)

					score = score + inv_radius * inv_radius * weights.distance_weight
				end

				if not breed.ignore_targets_outside_detection_radius or blackboard.target_unit or distance_valid_target then
					local aggro = blackboard.aggro_list[enemy_unit] or 0
					local enemy_disabled = status_extension:is_disabled()

					if enemy_disabled then
						aggro = aggro * weights.target_disabled_aggro_mul
						blackboard.aggro_list[enemy_unit] = aggro
					end

					score = score + aggro

					if enemy_disabled then
						score = score * weights.target_disabled_mul
					end

					if t - status_extension.last_catapulted_time < 5 then
						score = score * weights.target_catapulted_mul
					end

					local num_charges_targeting_player = status_extension.num_charges_targeting_player

					if weights.target_targeted_by_other_charge and num_charges_targeting_player and num_charges_targeting_player > 0 and enemy_unit ~= blackboard.attacking_target then
						score = score * weights.target_targeted_by_other_charge
					end

					if status_extension:is_charged() and blackboard.target_unit ~= enemy_unit then
						score = score * weights.target_is_charged
					end

					if blackboard.target_outside_navmesh then
						score = score * weights.target_outside_navmesh_mul
					end

					if best_score < score then
						wanted_enemy = enemy_unit
						wanted_dist = dist
						best_score = score
					end
				end
			end
		until true
	end

	local infighting = breed.infighting

	if best_score < infighting.trigger_minion_target_search then
		local infight_wanted_enemy = get_lean_target(blackboard, pos, side, unit, true, t, infighting.ignored_breed_filter)

		if infight_wanted_enemy then
			wanted_enemy, wanted_dist = infight_wanted_enemy, vector3_distance(pos, POSITION_LOOKUP[infight_wanted_enemy])
		end
	end

	return wanted_enemy, wanted_dist
end

PerceptionUtils.pick_chaos_troll_target_with_weights = function (unit, blackboard, breed, t)
	if blackboard.keep_target then
		return
	end

	local vector3_distance = Vector3.distance
	local wanted_enemy
	local wanted_dist = math.huge
	local is_valid_target_func = blackboard.valid_target_func or GenericStatusExtension.is_ogre_target
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local num_enemies = #PLAYER_AND_BOT_UNITS
	local best_score = -1000
	local group_blackboard = blackboard.group_blackboard
	local pos = POSITION_LOOKUP[unit]

	for i = 1, num_enemies do
		local enemy_unit = PLAYER_AND_BOT_UNITS[i]
		local score = 0
		local buff_extension = ScriptUnit.extension(enemy_unit, "buff_system")
		local dist = math.huge
		local status_extension = ScriptUnit.extension(enemy_unit, "status_system")

		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] and is_valid_target_func(status_extension) then
			local weights = breed.perception_weights

			if blackboard.target_unit == enemy_unit then
				local sticky_time = t - blackboard.target_unit_found_time

				if sticky_time < weights.target_stickyness_duration_a then
					score = score + weights.target_stickyness_bonus_a
				elseif sticky_time < weights.target_stickyness_duration_b then
					score = score + (1 - sticky_time / weights.target_stickyness_duration_b) * weights.target_stickyness_bonus_b
				end
			elseif group_blackboard.special_targets[enemy_unit] then
				blackboard.secondary_target = enemy_unit
				score = score + weights.targeted_by_other_special
			end

			local enemy_pos = POSITION_LOOKUP[enemy_unit]

			dist = vector3_distance(pos, enemy_pos)

			local distance_valid_target = dist < breed.detection_radius

			if distance_valid_target then
				local inv_radius = math.clamp(1 - dist / weights.max_distance, 0, 1)

				score = score + inv_radius * inv_radius * weights.distance_weight
			end

			if not breed.ignore_targets_outside_detection_radius or blackboard.target_unit or distance_valid_target then
				if weights.target_staggered_you_bonus and blackboard.pushing_unit and blackboard.pushing_unit == enemy_unit then
					score = score + weights.target_staggered_you_bonus
					blackboard.target_unit_found_time = t

					reset_aggro(blackboard.aggro_list)
				end

				local aggro = blackboard.aggro_list[enemy_unit] or 0
				local enemy_disabled = status_extension.is_ledge_hanging or status_extension.knocked_down

				if enemy_disabled then
					aggro = aggro * weights.target_disabled_aggro_mul
					blackboard.aggro_list[enemy_unit] = aggro
				end

				score = score + aggro

				if buff_extension:has_buff_type("troll_bile_face") then
					score = score * weights.target_is_in_vomit_multiplier
				end

				if enemy_disabled then
					score = score * weights.target_disabled_mul
				end

				if t - status_extension.last_catapulted_time < 5 then
					score = score * weights.target_catapulted_mul
				end

				if blackboard.target_outside_navmesh then
					score = score * weights.target_outside_navmesh_mul
				end

				if best_score < score then
					wanted_enemy = enemy_unit
					wanted_dist = dist
					best_score = score
				end
			end
		end
	end

	local infighting = breed.infighting

	if best_score < infighting.trigger_minion_target_search then
		local infight_wanted_enemy = get_lean_target(blackboard, pos, side, unit, true, t, breed.infighting.ignored_breed_filter)

		if infight_wanted_enemy then
			wanted_enemy, wanted_dist = infight_wanted_enemy, vector3_distance(pos, POSITION_LOOKUP[infight_wanted_enemy])
		end
	end

	return wanted_enemy, wanted_dist
end

PerceptionUtils.debug_ai_perception = function (unit, ai_ext, blackboard, t, gui, x1, y1)
	local tiny_font_size = 16
	local tiny_font = "arial"
	local tiny_font_mtrl = "materials/fonts/" .. tiny_font
	local resx, resy = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local borderx, bordery = 20, y1 + 20
	local left_padding_x = 100
	local debug_win_width = 330
	local layer = 900

	x1 = x1 + borderx + 20 + left_padding_x
	y1 = y1 + bordery + 20

	local y2 = y1
	local running_color = Colors.get_color_with_alpha("lavender", 255)
	local header_color = Color(255, 245, 100, 0)
	local selection_name = ai_ext._target_selection_func_name
	local perception_name = ai_ext._perception_func_name
	local unit_name = "client"
	local target_unit = blackboard.target_unit

	if ALIVE[target_unit] then
		local target_player = Managers.player:owner(target_unit)

		if target_player then
			local profile_index = target_player:profile_index()
			local profile = SPProfiles[profile_index]

			unit_name = profile and profile.unit_name or "client"
		else
			unit_name = "AI"
		end
	end

	ScriptGUI.ictext(gui, resx, resy, "Perception: " .. blackboard.breed.name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, header_color)

	y2 = y2 + 20

	ScriptGUI.ictext(gui, resx, resy, "target_unit: " .. unit_name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, running_color)

	y2 = y2 + 20

	ScriptGUI.ictext(gui, resx, resy, "perception func: " .. perception_name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, running_color)

	y2 = y2 + 20

	ScriptGUI.ictext(gui, resx, resy, "selection func: " .. selection_name, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, running_color)

	y2 = y2 + 20

	ScriptGUI.icrect(gui, resx, resy, borderx, bordery, x1 + debug_win_width, y2, layer - 1, Color(200, 20, 20, 20))

	return y2
end

PerceptionUtils.debug_rat_ogre_perception = function (gui, t, x1, y1, blackboard)
	local tiny_font_size = 16
	local tiny_font = "arial"
	local tiny_font_mtrl = "materials/fonts/" .. tiny_font
	local resx, resy = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local borderx, bordery = 20, y1 + 10
	local debug_win_width = 530
	local layer = 900

	x1 = x1 + borderx + 20
	y1 = bordery + 20

	local y2 = y1
	local running_color = Colors.get_color_with_alpha("lavender", 255)
	local header_color = Colors.get_color_with_alpha("orange", 255)

	ScriptGUI.ictext(gui, resx, resy, "Continious perception:", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, header_color)

	y2 = y2 + 20

	for unit, player_scores in pairs(score_table) do
		if ALIVE[unit] then
			local target_player = Managers.player:owner(unit)
			local profile_index = target_player:profile_index()
			local profile = SPProfiles[profile_index]
			local unit_name = profile and profile.unit_name or "client"
			local text

			if player_scores["NOT VALID"] then
				text = string.format("%s: NOT VALID TARGET", unit_name)
			else
				local s = ""

				for k, v in pairs(player_scores) do
					if k ~= "SUM" then
						s = s .. string.format("%s=%.1f, ", k, v)
					end
				end

				text = string.format("%s:[%.1f] %s", unit_name, player_scores.SUM or 0, s)
			end

			ScriptGUI.ictext(gui, resx, resy, text, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, running_color)

			y2 = y2 + 20
		else
			score_table[unit] = nil
		end
	end

	ScriptGUI.icrect(gui, resx, resy, borderx, bordery, x1 + debug_win_width, y2, layer - 1, Color(200, 20, 20, 20))
end

PerceptionUtils.pick_pack_master_target = function (unit, blackboard, breed)
	local is_of_interest_to_packmaster = AiUtils.is_of_interest_to_packmaster
	local pos = POSITION_LOOKUP[unit]
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local closest_enemy
	local closest_dist_sq = math.huge
	local closest_distance_score = math.huge

	for k, player_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if is_of_interest_to_packmaster(unit, player_unit) then
			local enemy_pos = PLAYER_AND_BOT_POSITIONS[k]
			local dist_sq = Vector3.distance_squared(pos, enemy_pos)
			local score = dist_sq

			if player_unit == blackboard.target_unit then
				score = dist_sq * 0.8
			end

			if score < closest_distance_score then
				closest_dist_sq = dist_sq
				closest_enemy = player_unit
				closest_distance_score = score
			end
		end
	end

	local closest_dist = math.sqrt(closest_dist_sq)

	return closest_enemy, closest_dist
end

PerceptionUtils.pick_mutator_sorcerer_target = function (unit, blackboard, breed)
	local is_of_interest_to_corruptor = AiUtils.is_of_interest_to_corruptor
	local pos = POSITION_LOOKUP[unit]
	local closest_enemy
	local closest_dist_sq = math.huge
	local closest_distance_score = math.huge
	local t = Managers.time:time("game")
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	if is_of_interest_to_corruptor(unit, blackboard.target_unit) and blackboard.target_stickyness_duration and t < blackboard.target_stickyness_duration then
		local closest_distance = Vector3.distance(POSITION_LOOKUP[blackboard.target_unit], pos)

		return blackboard.target_unit, closest_distance
	end

	for k, player_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if is_of_interest_to_corruptor(unit, player_unit) then
			local enemy_pos = PLAYER_AND_BOT_POSITIONS[k]
			local dist_sq = Vector3.distance_squared(pos, enemy_pos)
			local score = dist_sq

			if blackboard.corruptor_target and blackboard.corruptor_target == player_unit then
				local dist = math.sqrt(dist_sq)

				return blackboard.corruptor_target, dist
			end

			if score < closest_distance_score then
				closest_dist_sq = dist_sq
				closest_distance_score = score
				closest_enemy = player_unit
			end
		end
	end

	blackboard.closest_enemy_dist_sq = closest_dist_sq

	if closest_enemy ~= blackboard.target_unit then
		blackboard.target_stickyness_duration = t + 2
	end

	local closest_dist = math.sqrt(closest_dist_sq)

	return closest_enemy, closest_dist
end

PerceptionUtils.pick_corruptor_target = function (unit, blackboard, breed)
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_TARGETS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local is_of_interest_to_corruptor = AiUtils.is_of_interest_to_corruptor
	local pos = POSITION_LOOKUP[unit]
	local closest_enemy
	local closest_dist_sq = math.huge
	local closest_distance_score = math.huge

	for k, player_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if VALID_TARGETS[player_unit] and is_of_interest_to_corruptor(unit, player_unit) then
			local enemy_pos = PLAYER_AND_BOT_POSITIONS[k]
			local dist_sq = Vector3.distance_squared(pos, enemy_pos)
			local score = dist_sq

			if player_unit == blackboard.target_unit then
				score = dist_sq * 0.8
			end

			if blackboard.corruptor_target and blackboard.corruptor_target == player_unit then
				local dist = math.sqrt(dist_sq)

				return blackboard.corruptor_target, dist
			end

			if score < closest_distance_score then
				closest_dist_sq = dist_sq
				closest_enemy = player_unit
				closest_distance_score = score
			end
		end
	end

	local closest_dist = math.sqrt(closest_dist_sq)

	return closest_enemy, closest_dist
end

function double_raycast(blackboard, from, cast_template, enemy_unit, physics_world)
	if not blackboard.line_of_sight_casts then
		blackboard.line_of_sight_casts = {}
	end

	local cast_table = blackboard.line_of_sight_casts[enemy_unit]

	if not cast_table then
		cast_table = table.clone(cast_template)
		blackboard.line_of_sight_casts[enemy_unit] = cast_table
	end

	local cast_table_size = #cast_table
	local cast_index = cast_table.current_index % cast_table_size + 1

	cast_table.current_index = cast_index

	local target_node_name = cast_table[cast_index]
	local target_node = Unit.node(enemy_unit, target_node_name)
	local target_unit_position = Unit.world_position(enemy_unit, target_node)
	local direction = target_unit_position - from
	local normalized_direction = Vector3.normalize(direction)
	local distance = Vector3.length(direction)
	local filter = "filter_ai_line_of_sight_check"
	local is_hit, hit_pos = PhysicsWorld.immediate_raycast(physics_world, from, normalized_direction, distance, "closest", "collision_filter", filter)

	if is_hit then
		cast_table[target_node_name] = false
	else
		is_hit, hit_pos = PhysicsWorld.immediate_raycast(physics_world, target_unit_position, -normalized_direction, distance, "closest", "collision_filter", filter)

		if is_hit then
			cast_table[target_node_name] = false
		else
			cast_table[target_node_name] = true
		end
	end

	for i = 1, cast_table_size do
		local node_name = cast_table[(cast_index - i) % cast_table_size + 1]

		if cast_table[node_name] then
			return true, node_name
		end
	end

	return false
end

local function target_allowed_for_ratling(unit)
	local status_ext = ScriptUnit.extension(unit, "status_system")

	return not status_ext:is_knocked_down() and not status_ext:get_is_ledge_hanging() and not status_ext:is_ready_for_assisted_respawn() and not status_ext:is_hanging_from_hook()
end

PerceptionUtils.pick_ratling_gun_target = function (unit, blackboard, old_target, view_cone_dot_product, forward_direction)
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local target_unit = blackboard.target_unit
	local hardcoded_matrix = Matrix4x4(0.73776, -0.374671, 0.561545, 0.655785, 0.59515, -0.464481, -0.160177, 0.710927, 0.684781, 0.203595, -0.422035, 0.525395)
	local self_pos = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local closest_enemy
	local closest_distance_sq = math.huge
	local visible_node_name, old_target_visible_node_name
	local old_target_visible = false
	local old_target_distance_sq = math.huge
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	for k, enemy_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] and target_allowed_for_ratling(enemy_unit) then
			local enemy_position = POSITION_LOOKUP[enemy_unit]
			local offset = enemy_position - self_pos
			local distance_sq = Vector3.length_squared(offset)
			local is_old_target = old_target == enemy_unit
			local is_taunt_target = blackboard.taunt_unit == enemy_unit

			if is_taunt_target then
				distance_sq = 0
			end

			local is_closest = distance_sq < closest_distance_sq

			if is_closest and (is_taunt_target or not view_cone_dot_product or view_cone_dot_product < Vector3.dot(forward_direction, Vector3.normalize(offset))) or is_old_target then
				local rot = Quaternion.look(Vector3.flat(offset), Vector3.up())
				local self_pose = Matrix4x4.from_quaternion_position(rot, self_pos)
				local from = Matrix4x4.translation(Matrix4x4.multiply(hardcoded_matrix, self_pose))
				local visible, node_name = double_raycast(blackboard, from, breed.line_of_sight_cast_template, enemy_unit, physics_world)

				if is_old_target then
					old_target_visible = visible
					old_target_visible_node_name = node_name
					old_target_distance_sq = distance_sq
				end

				if visible and is_closest then
					closest_distance_sq = distance_sq
					closest_enemy = enemy_unit
					visible_node_name = node_name
				end
			end
		end
	end

	return closest_enemy, visible_node_name, old_target_visible, old_target_visible_node_name, closest_distance_sq, old_target_distance_sq
end

PerceptionUtils.pick_warpfire_thrower_target = function (unit, blackboard, old_target)
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local target_unit = blackboard.target_unit
	local hardcoded_matrix = Matrix4x4(0.73776, -0.374671, 0.561545, 0.655785, 0.59515, -0.464481, -0.160177, 0.710927, 0.684781, 0.203595, -0.422035, 0.525395)
	local self_pos = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local closest_enemy
	local closest_distance = math.huge
	local visible_node_name, old_target_visible_node_name
	local old_target_visible = false
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	for k, enemy_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] and target_allowed_for_ratling(enemy_unit) then
			local enemy_position = POSITION_LOOKUP[enemy_unit]
			local offset = enemy_position - self_pos
			local distance = Vector3.length_squared(offset)
			local is_old_target = old_target == enemy_unit

			if distance < breed.detection_radius and (distance < closest_distance or is_old_target) and distance < breed.switch_target_radius * breed.switch_target_radius then
				local rot = Quaternion.look(Vector3.flat(offset), Vector3.up())
				local self_pose = Matrix4x4.from_quaternion_position(rot, self_pos)
				local from = Matrix4x4.translation(Matrix4x4.multiply(hardcoded_matrix, self_pose))
				local visible, node_name = double_raycast(blackboard, from, breed.line_of_sight_cast_template, enemy_unit, physics_world)

				if is_old_target then
					old_target_visible = visible
					old_target_visible_node_name = node_name
				end

				if visible and distance < closest_distance then
					closest_distance = distance
					closest_enemy = enemy_unit
					visible_node_name = node_name
				end
			end
		end
	end

	return closest_enemy, visible_node_name, old_target_visible, old_target_visible_node_name
end

PerceptionUtils.raycast_spine_to_spine = function (from_unit, to_unit, physics_world)
	local is_creature = ScriptUnit.has_extension(to_unit, "locomotion_system")

	if not is_creature then
		return true
	end

	local unit_node = Unit.has_node(from_unit, "camera_attach") and Unit.node(from_unit, "camera_attach") or Unit.node(from_unit, "c_spine")
	local target_node = Unit.has_node(to_unit, "camera_attach") and Unit.node(to_unit, "camera_attach") or Unit.node(to_unit, "c_spine")
	local unit_position = Unit.world_position(from_unit, unit_node)
	local target_unit_position = Unit.world_position(to_unit, target_node)
	local direction = target_unit_position - unit_position
	local normalized_direction = Vector3.normalize(direction)
	local distance = Vector3.length(direction) + 2
	local result, hit_position, _, _, actor = PhysicsWorld.immediate_raycast(physics_world, unit_position, normalized_direction, distance, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	if actor then
		local hit_unit = Actor.unit(actor)

		return hit_unit == to_unit
	else
		return true
	end
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4

PerceptionUtils.is_position_in_line_of_sight = function (unit, from_position, target_position, physics_world, collision_filter)
	collision_filter = collision_filter or "filter_ai_line_of_sight_check"

	local to_target = target_position - from_position
	local direction = Vector3.normalize(to_target)
	local distance = Vector3.length(to_target)

	if Vector3.length(direction) <= 0 then
		return false
	end

	local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, distance, "closest", "collision_filter", collision_filter)
	local no_hit = not result

	return no_hit, hit_position
end

PerceptionUtils.has_line_of_sight_to_any_player = function (unit, optional_z_offset)
	local self_position = POSITION_LOOKUP[unit]
	local blackboard = BLACKBOARDS[unit]
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local z_offset = Vector3(0, 0, optional_z_offset or 1)
	local side = blackboard.side
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #PLAYER_AND_BOT_POSITIONS do
		local target_position = PLAYER_AND_BOT_POSITIONS[i]
		local has_los = PerceptionUtils.is_position_in_line_of_sight(nil, self_position + z_offset, target_position + z_offset, physics_world)

		if has_los then
			return true
		end
	end

	return false
end

PerceptionUtils.position_has_line_of_sight_to_any_player = function (position)
	local world_manager = Managers.world
	local world_name = "level_world"
	local world = world_manager:world(world_name)
	local physics_world = World.get_data(world, "physics_world")
	local z_offset = Vector3(0, 0, 1)
	local side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for i = 1, #PLAYER_AND_BOT_POSITIONS do
		local target_position = PLAYER_AND_BOT_POSITIONS[i]
		local has_los = PerceptionUtils.is_position_in_line_of_sight(nil, position, target_position + z_offset, physics_world)

		if has_los then
			return true
		end
	end

	return false
end

PerceptionUtils.pick_area_target = function (unit, blackboard, breed, radius, max_distance)
	local target
	local enemies_in_area = 0
	local circles = {}
	local side = blackboard.side
	local positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	if #positions > 1 then
		circles = PerceptionUtils._find_circles(unit, positions, radius, max_distance)
	end

	if #circles > 0 then
		local best_circle = PerceptionUtils._pick_best_circle(circles, positions, radius)

		target = best_circle.pos
		enemies_in_area = best_circle.targets
	else
		target = POSITION_LOOKUP[blackboard.target_unit]
		enemies_in_area = 1
	end

	if Development.parameter("ai_debug_aoe_targeting") then
		PerceptionUtils.debug_draw_pick_area_target(circles, target, radius, positions)
	end

	return target, enemies_in_area
end

PerceptionUtils._find_circles = function (unit, target_positions, radius, max_distance)
	local unit_position = POSITION_LOOKUP[unit]
	local circles = {}
	local positions = {}
	local num_positions = #target_positions

	for i = 1, num_positions do
		local position = target_positions[i]
		local distance = Vector3.distance(unit_position, position)

		if distance <= max_distance then
			positions[#positions + 1] = position
		end
	end

	for i = 1, #positions - 1 do
		for j = 2, #positions do
			if i < j then
				local p1 = positions[i]
				local p2 = positions[j]
				local distance = Vector3.distance(p1, p2)

				if distance < radius * 2 then
					local midpoint = p1 + (p2 - p1) * 0.5
					local d = distance / 2
					local r = radius
					local length = math.sqrt(radius^2 - d^2)
					local dx = p2.x - p1.x
					local dy = p2.y - p1.y
					local n1 = midpoint + Vector3.normalize(Vector3(-dy, dx, 0)) * length
					local n2 = midpoint + Vector3.normalize(Vector3(dy, -dx, 0)) * length

					circles[#circles + 1] = {
						targets = 0,
						pos = n1,
						distance = Vector3.distance(n1, unit_position),
					}
					circles[#circles + 1] = {
						targets = 0,
						pos = n2,
						distance = Vector3.distance(n2, unit_position),
					}
				end
			end
		end
	end

	return circles
end

PerceptionUtils._pick_best_circle = function (circles, positions, radius)
	for _, c in ipairs(circles) do
		for _, enemy_pos in pairs(positions) do
			local distance = math.round_with_precision(Vector3.distance(c.pos, enemy_pos), 2)

			if distance <= radius then
				c.targets = c.targets + 1
			end
		end
	end

	local best_target = 1

	for i = 2, #circles do
		if circles[i].targets > circles[best_target].targets then
			best_target = i
		elseif circles[i].targets == circles[best_target].targets and circles[i].distance < circles[best_target].distance then
			best_target = i
		end
	end

	return circles[best_target]
end

PerceptionUtils.debug_draw_pick_area_target = function (circles, target, radius, positions)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "pick_area_target",
	})
	local z_offset = Vector3.up() * 0.3

	drawer:reset()

	for i = 1, #circles, 2 do
		local circle_1 = circles[i]
		local circle_2 = circles[i + 1]
		local color1 = math.random(155)
		local color2 = math.random(255)
		local color3 = math.random(255)

		drawer:circle(circle_1.pos + z_offset, radius, Vector3.up(), Color(255, color1, color2, color3), 100)
		drawer:circle(circle_2.pos + z_offset, radius, Vector3.up(), Color(255, color1, color2, color3), 100)

		for i = 1, circle_1.targets do
			drawer:circle(circle_1.pos + z_offset, 0.5 + i * 0.1, Vector3.up(), Color(255, color1, color2, color3), 100)
		end

		for i = 1, circle_2.targets do
			drawer:circle(circle_2.pos + z_offset, 0.5 + i * 0.1, Vector3.up(), Color(255, color1, color2, color3), 100)
		end
	end

	for _, p in pairs(positions) do
		drawer:sphere(p + z_offset, 0.1, Color(255, 230, 83, 230))
	end

	if target then
		drawer:sphere(target + z_offset, 0.2, Color(255, 255, 0, 0))
		drawer:circle(target + z_offset, radius, Vector3.up(), Color(255, 255, 0, 0), 20)
	end
end

PerceptionUtils.debug_draw_throw_trajectory = function (points)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "projectile_unit_debug",
	})

	for i = 1, #points do
		drawer:sphere(points[i], 0.05, Color(255, 255, 255, 255))
	end
end
