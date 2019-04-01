return {
	description = "description_explosive_loot_rats",
	icon = "mutator_icon_explosive_loot_rats",
	display_name = "display_name_explosive_loot_rats",
	server_initialize_function = function (context, data)
		data.amount_of_rats_per_difficulty = {
			normal = {
				3,
				5
			},
			hard = {
				4,
				7
			},
			harder = {
				6,
				9
			},
			hardest = {
				7,
				11
			}
		}
		data.spawn_frequency_per_difficulty = {
			normal = {
				34,
				40
			},
			hard = {
				30,
				36
			},
			harder = {
				28,
				35
			},
			hardest = {
				24,
				32
			}
		}
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
		data.spawn_loot_rats_at = Managers.time:time("game") + 5
	end,
	server_update_function = function (context, data)
		if not data.has_left_safe_zone then
			return
		end

		local t = Managers.time:time("game")

		if not global_is_inside_inn and data.spawn_loot_rats_at < t then
			local difficulty = Managers.state.difficulty:get_difficulty()
			local num_rats_range = data.amount_of_rats_per_difficulty[difficulty]
			local spawn_frequency_range = data.spawn_frequency_per_difficulty[difficulty]
			local amount_of_rats = math.random(num_rats_range[1], num_rats_range[2])
			local spawn_frequency = math.random(spawn_frequency_range[1], spawn_frequency_range[2])
			local spawn_list = {}

			for i = 1, amount_of_rats, 1 do
				spawn_list[#spawn_list + 1] = "skaven_explosive_loot_rat"
			end

			local conflict_director = Managers.state.conflict
			local main_path_info = conflict_director.main_path_info

			if (main_path_info.ahead_unit and Unit.alive(main_path_info.ahead_unit)) or (main_path_info.behind_unit and Unit.alive(main_path_info.behind_unit)) then
				conflict_director.horde_spawner:execute_custom_horde(spawn_list)

				data.spawn_loot_rats_at = t + spawn_frequency
			end
		end
	end,
	server_stop_function = function (context, data)
		return
	end
}
