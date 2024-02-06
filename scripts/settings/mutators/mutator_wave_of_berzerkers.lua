﻿-- chunkname: @scripts/settings/mutators/mutator_wave_of_berzerkers.lua

return {
	description = "description_mutator_wave_of_berzerkers",
	display_name = "display_name_mutator_wave_of_berzerkers",
	icon = "mutator_icon_powerful_elites",
	server_initialize_function = function (context, data)
		local current_difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local base_amount = 5
		local difficulty_amount_modifier = 2
		local num_to_spawn = base_amount + current_difficulty_rank * difficulty_amount_modifier
		local spawn_list = {}

		for i = 1, num_to_spawn do
			spawn_list[i] = "chaos_berzerker"
		end

		local t = Managers.time:time("game")

		data.spawn_list = spawn_list
		data.spawn_at = t + math.random(30, 50)
		data.current_difficulty_rank = current_difficulty_rank
		BreedActions.chaos_berzerker.frenzy_attack.attack_intensity = 0

		local old_threat_value = Breeds.chaos_berzerker.threat_value

		data.old_threat_value = old_threat_value

		Managers.state.conflict:set_threat_value("chaos_berzerker", 1)

		local side = Managers.state.side:get_side_from_name("dark_pact")

		data.side_id = side.side_id
	end,
	server_update_function = function (context, data)
		local t = Managers.time:time("game")

		if t > data.spawn_at then
			local spawn_list = data.spawn_list
			local horde_spawner = Managers.state.conflict.horde_spawner
			local only_ahead = false
			local side_id = data.side_id

			horde_spawner:execute_custom_horde(spawn_list, only_ahead, side_id)

			local difficulty_rank = data.current_difficulty_rank
			local spawn_frequency_modifier = 80 - difficulty_rank * 5

			data.spawn_at = t + math.random(40, spawn_frequency_modifier)
		end
	end,
	server_stop_function = function (context, data)
		BreedActions.chaos_berzerker.frenzy_attack.attack_intensity = nil

		Managers.state.conflict:set_threat_value("chaos_berzerker", data.old_threat_value)
	end,
}
