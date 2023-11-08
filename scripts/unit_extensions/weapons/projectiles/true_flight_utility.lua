TrueFlightUtility = TrueFlightUtility or {}
local order_upvalue, reference_pos_upvalue = nil

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
