local density_multiplier_steps_per_difficulty_tweak = {
	{
		-10,
		1
	},
	{
		0,
		1.15
	},
	{
		10,
		1.3
	}
}
local min_override_chance_per_difficulty_tweak = {
	{
		-10,
		0.1
	},
	{
		0,
		0.4
	},
	{
		10,
		0.8
	}
}
local max_override_chance_per_difficulty_tweak = {
	{
		-10,
		0.3
	},
	{
		0,
		0.6
	},
	{
		10,
		1
	}
}
local BOSS_BUFF = "deus_difficulty_tweak_boss_buff"

local function get_lerped_value_for_difficulty(steps, current_difficulty_tweak)
	fassert(#steps >= 1, "need at least one step for the difficulty lerp to work.")

	local selected_pre_step, selected_post_step = nil

	for i = 1, #density_multiplier_steps_per_difficulty_tweak do
		local step = density_multiplier_steps_per_difficulty_tweak[i]

		if current_difficulty_tweak <= step[1] then
			local step_before = density_multiplier_steps_per_difficulty_tweak[i - 1]
			local step_after = density_multiplier_steps_per_difficulty_tweak[i + 1]
			selected_pre_step = step_before or step
			selected_post_step = step_before and step or step_after

			break
		end
	end

	if selected_pre_step then
		local step_range = selected_post_step[1] - selected_pre_step[1]
		local difficulty_val = current_difficulty_tweak - selected_pre_step[1]
		local ratio = difficulty_val / step_range
		local value = math.lerp(selected_pre_step[2], selected_post_step[2], ratio)

		return value
	end
end

return {
	hide_from_player_ui = true,
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		local _, difficulty_tweak = Managers.state.difficulty:get_difficulty()
		local density_multiplier = get_lerped_value_for_difficulty(density_multiplier_steps_per_difficulty_tweak, difficulty_tweak)

		MutatorUtils.tweak_pack_spawning_settings_density_multiplier(pack_spawning_settings, density_multiplier)

		local min_override_chance = get_lerped_value_for_difficulty(min_override_chance_per_difficulty_tweak, difficulty_tweak)
		local max_override_chance = get_lerped_value_for_difficulty(max_override_chance_per_difficulty_tweak, difficulty_tweak)

		MutatorUtils.tweak_pack_spawning_settings_override_chance(pack_spawning_settings, min_override_chance, max_override_chance)
	end,
	server_ai_spawned_function = function (context, data, unit)
		local breed = Unit.get_data(unit, "breed")

		if breed.boss then
			local _, difficulty_tweak = Managers.state.difficulty:get_difficulty()
			local range = DifficultyTweak.range
			local offset_difficulty_tweak_value = difficulty_tweak + range
			local normalized_difficulty_value = offset_difficulty_tweak_value / (range * 2)
			local params = {
				variable_value = normalized_difficulty_value
			}
			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:add_buff(BOSS_BUFF, params)
		end
	end
}
