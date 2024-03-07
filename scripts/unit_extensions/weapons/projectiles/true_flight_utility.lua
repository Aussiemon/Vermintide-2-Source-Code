-- chunkname: @scripts/unit_extensions/weapons/projectiles/true_flight_utility.lua

TrueFlightUtility = TrueFlightUtility or {}

local order_upvalue, reference_pos_upvalue

local function _prioritize_specials(unit_a, unit_b)
	local breed_a = Unit.get_data(unit_a, "breed")
	local breed_b = Unit.get_data(unit_b, "breed")

	if not breed_b or not breed_a then
		return breed_a or not breed_b and order_upvalue[unit_a] < order_upvalue[unit_b]
	end

	local special_a = breed_a.special
	local special_b = breed_b.special

	if special_a ~= special_b then
		return special_a
	end

	local elite_a = breed_a.elite
	local elite_b = breed_b.elite

	if elite_a ~= elite_b then
		return elite_a
	end

	local a_pos = POSITION_LOOKUP[unit_a]
	local b_pos = POSITION_LOOKUP[unit_b]

	if not a_pos or not b_pos then
		return a_pos
	end

	if reference_pos_upvalue then
		local diff = Vector3.distance_squared(a_pos, reference_pos_upvalue) - Vector3.distance_squared(b_pos, reference_pos_upvalue)

		if math.abs(diff) < math.epsilon then
			local a_closer = diff < 0

			return a_closer
		end
	end

	return order_upvalue[unit_a] < order_upvalue[unit_b]
end

local function _prioritize_elites(unit_a, unit_b)
	local breed_a = Unit.get_data(unit_a, "breed")
	local breed_b = Unit.get_data(unit_b, "breed")

	if not breed_b or not breed_a then
		return breed_a or not breed_b and order_upvalue[unit_a] < order_upvalue[unit_b]
	end

	local elite_a = breed_a.elite
	local elite_b = breed_b.elite

	if elite_a ~= elite_b then
		return elite_a
	end

	local special_a = breed_a.special
	local special_b = breed_b.special

	if special_a ~= special_b then
		return special_a
	end

	local a_pos = POSITION_LOOKUP[unit_a]
	local b_pos = POSITION_LOOKUP[unit_b]

	if not a_pos or not b_pos then
		return a_pos
	end

	if reference_pos_upvalue then
		local diff = Vector3.distance_squared(a_pos, reference_pos_upvalue) - Vector3.distance_squared(b_pos, reference_pos_upvalue)

		if math.abs(diff) < math.epsilon then
			local a_closer = diff < 0

			return a_closer
		end
	end

	return order_upvalue[unit_a] < order_upvalue[unit_b]
end

local function _prioritize_bosses(unit_a, unit_b)
	local breed_a = Unit.get_data(unit_a, "breed")
	local breed_b = Unit.get_data(unit_b, "breed")

	if not breed_b or not breed_a then
		return breed_a or not breed_b and order_upvalue[unit_a] < order_upvalue[unit_b]
	end

	local boss_a = breed_a.boss
	local boss_b = breed_b.boss

	if boss_a ~= boss_b then
		return boss_a
	end

	return _prioritize_elites(unit_a, unit_b)
end

TrueFlightUtility.sort_prioritize_specials = function (targets, optional_reference_pos)
	order_upvalue = table.mirror_array(targets, FrameTable.alloc_table())
	reference_pos_upvalue = optional_reference_pos

	table.sort(targets, _prioritize_specials)

	return targets
end

TrueFlightUtility.sort_prioritize_elites = function (targets, optional_reference_pos)
	order_upvalue = table.mirror_array(targets, FrameTable.alloc_table())
	reference_pos_upvalue = optional_reference_pos

	table.sort(targets, _prioritize_elites)

	return targets
end

TrueFlightUtility.sort_prioritize_bosses = function (targets, optional_reference_pos)
	order_upvalue = table.mirror_array(targets, FrameTable.alloc_table())
	reference_pos_upvalue = optional_reference_pos

	table.sort(targets, _prioritize_bosses)

	return targets
end

local function _calculate_sort_score(target, source_pos, look_direction, boss_weight, special_weight, elite_weight, max_distance, distance_weight, angle_weight, player_weight)
	local target_breed = Unit.get_data(target, "breed")

	if not target_breed then
		return 0
	end

	local target_pos = POSITION_LOOKUP[target]
	local height = target_breed.height or 2
	local neck_height = height * 0.75
	local tag_radius = neck_height * 1.5

	target_pos = target_pos + Vector3(0, 0, neck_height)

	local diff = target_pos - source_pos
	local distance = Vector3.length(diff)
	local hypothenuse = math.sqrt(distance * distance + tag_radius * tag_radius)
	local max_angle = distance / hypothenuse

	look_direction = Vector3.normalize(look_direction)

	local angle = Vector3.dot(Vector3.normalize(diff), look_direction)

	if angle < max_angle then
		return 0
	end

	local angle_score = math.inv_lerp(math.acos(1 - max_angle), 0, math.acos(angle))^2 * angle_weight
	local dist = Vector3.length(diff)

	if max_distance < dist then
		return 0
	end

	local dist_score = math.inv_lerp(max_distance, 0, dist) * distance_weight
	local score = angle_score + dist_score

	if target_breed.is_player then
		score = score * player_weight
	elseif target_breed.elite then
		score = score * elite_weight
	elseif target_breed.special then
		score = score * special_weight
	elseif target_breed.boss then
		score = score * boss_weight
	end

	return score
end

local SCORES = {}

local function _sort_func(target_a, target_b)
	return SCORES[target_a] > SCORES[target_b]
end

TrueFlightUtility.sort = function (targets, source_pos, look_direction, boss_weight, special_weight, elite_weight, max_distance, distance_weight, angle_weight, player_weight)
	table.clear(SCORES)

	for i = 1, #targets do
		local target = targets[i]

		SCORES[target] = _calculate_sort_score(target, source_pos, look_direction, boss_weight, special_weight, elite_weight, max_distance, distance_weight, angle_weight, player_weight)
	end

	table.sort(targets, _sort_func)

	return SCORES
end
