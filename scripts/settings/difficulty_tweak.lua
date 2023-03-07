local tweak_range = 10

local function get_value_for_difficulty(difficulty, value_table)
	local index = table.index_of(Difficulties, difficulty)

	for i = index, 1, -1 do
		local value = value_table[Difficulties[i]]

		if value then
			return value
		end
	end
end

local function offset_difficulty(difficulty, max_steps, tweak)
	local index = table.index_of(Difficulties, difficulty)

	fassert(index ~= -1, "need an existing difficulty")
	fassert(max_steps > 0, "need at least one step")
	fassert(tweak >= -tweak_range and tweak <= tweak_range, "tweak needs to be an integer from -" .. tweak_range .. " to " .. tweak_range)

	local index_offset = math.round(math.lerp(-max_steps, max_steps, (tweak + tweak_range) / (tweak_range * 2)))
	local new_index = math.clamp(index + index_offset, 1, #Difficulties)

	return Difficulties[new_index]
end

local function offset_difficulty_rank(difficulty_rank, max_steps, tweak)
	fassert(max_steps > 0, "need at least one step")
	fassert(tweak >= -tweak_range and tweak <= tweak_range, "tweak needs to be an integer from -" .. tweak_range .. " to " .. tweak_range)

	local rank_offset = math.round(math.lerp(-max_steps, max_steps, (tweak + tweak_range) / (tweak_range * 2)))

	return math.clamp(difficulty_rank + rank_offset, MinimumDifficultyRank, MaximumDifficultyRank)
end

local function nearest_lerp_table(difficulty, tweak, table)
	local base_value = get_value_for_difficulty(difficulty, table)

	fassert(base_value, "Value doesn't exist for difficulty " .. difficulty .. " or for lower difficulties, config needs to be added.")

	if tweak == 0 then
		return base_value
	end

	local next_difficulty = offset_difficulty(difficulty, 1, tweak)
	local next_value = get_value_for_difficulty(next_difficulty, table)

	fassert(next_value, "Value doesn't exist for difficulty " .. next_difficulty .. " or for lower difficulties, config needs to be added.")

	local coeff = math.abs(tweak / tweak_range)

	return math.lerp(base_value, next_value, coeff)
end

local function nearest_table_value(difficulty, difficulty_tweak, table)
	fassert(difficulty_tweak >= -tweak_range and difficulty_tweak <= tweak_range, "tweak needs to be an integer from -" .. tweak_range .. " to " .. tweak_range)

	local difficulty_table = table[difficulty]

	if difficulty_table then
		for i = difficulty_tweak, -tweak_range, -1 do
			local val = difficulty_table[i]

			if val then
				return val
			end
		end
	end

	return nil
end

DifficultyTweak = DifficultyTweak or {
	range = tweak_range,
	converters = {
		composition = function (difficulty, tweak)
			return offset_difficulty(difficulty, 2, tweak)
		end,
		composition_rank = function (difficulty_rank, tweak)
			return offset_difficulty_rank(difficulty_rank, 2, tweak)
		end,
		pacing = function (difficulty, tweak)
			return offset_difficulty(difficulty, 2, tweak)
		end,
		intensity = function (difficulty, tweak)
			return offset_difficulty(difficulty, 2, tweak)
		end,
		tweaked_delay_threat_value = function (difficulty, tweak, table)
			return nearest_lerp_table(difficulty, tweak, table)
		end,
		closest_tweak_match = function (difficulty, tweak, table)
			return nearest_table_value(difficulty, tweak, table)
		end
	}
}
