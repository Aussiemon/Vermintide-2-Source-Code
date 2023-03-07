return {
	description = "description_skulking_sorcerer",
	display_name = "display_name_skulking_sorcerer",
	icon = "mutator_icon_skulking_sorcerer",
	server_start_function = function (context, data)
		data.breed_name = "chaos_mutator_sorcerer"

		data.cb_mutator_sorcerer_spawned = function (unit, breed, optional_data)
			optional_data.mutator_data.sorcerer_unit = unit
			optional_data.mutator_data.has_spawned_mutator_sorcerer = true
		end

		data.wanted_spawn_distance_behind = 0
		data.respawn_times = {
			8,
			15
		}
		data.initial_spawn_time = 45
		data.despawn_distance_sq = 3600
		data.wanted_respawn_main_path_distance = {
			35,
			45
		}
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
		data.is_initial_spawn = true
		data.initial_spawn_time = 5
	end,
	server_update_function = function (context, data)
		if not data.has_left_safe_zone then
			return
		end

		local t = Managers.time:time("game")
		local conflict_director = Managers.state.conflict
		local breed_name = data.breed_name

		if not data.spawn_queue_id then
			if not data.has_wanted_position then
				local wanted_position = MainPathUtils.point_on_mainpath(nil, data.wanted_spawn_distance_behind)
				data.wanted_position = Vector3Box(wanted_position)
				local respawn_time = math.random(data.respawn_times[1], data.respawn_times[2])
				data.spawn_at_time = data.is_initial_spawn and t + data.initial_spawn_time or t + respawn_time
				data.has_wanted_position = true
				data.is_initial_spawn = nil
			elseif data.spawn_at_time < t then
				local breed = Breeds[breed_name]
				local spawn_category = "misc"
				local optional_data = {
					spawned_func = data.cb_mutator_sorcerer_spawned,
					mutator_data = data
				}
				local spawn_queue_id = conflict_director:spawn_queued_unit(breed, data.wanted_position, QuaternionBox(Quaternion.identity()), spawn_category, nil, nil, optional_data)
				data.spawn_queue_id = spawn_queue_id
			end
		elseif data.has_spawned_mutator_sorcerer then
			if AiUtils.unit_alive(data.sorcerer_unit) then
				local blackboard = BLACKBOARDS[data.sorcerer_unit]

				if blackboard.closest_enemy_dist_sq and data.despawn_distance_sq <= blackboard.closest_enemy_dist_sq then
					conflict_director:destroy_unit(data.sorcerer_unit, blackboard, "debug")

					data.sorcerer_unit = nil
					data.spawn_queue_id = nil
					data.has_spawned_mutator_sorcerer = false
					data.has_wanted_position = false
					local wanted_distance_behind = math.random(data.wanted_respawn_main_path_distance[1], data.wanted_respawn_main_path_distance[2])
					data.wanted_spawn_distance_behind = math.max(conflict_director.main_path_info.ahead_travel_dist - wanted_distance_behind, 0)
				end
			else
				data.sorcerer_unit = nil
				data.spawn_queue_id = nil
				data.has_spawned_mutator_sorcerer = false
				data.has_wanted_position = false
				local wanted_distance_behind = math.random(data.wanted_respawn_main_path_distance[1], data.wanted_respawn_main_path_distance[2])
				data.wanted_spawn_distance_behind = math.max(conflict_director.main_path_info.ahead_travel_dist - wanted_distance_behind, 0)
			end
		end
	end
}
