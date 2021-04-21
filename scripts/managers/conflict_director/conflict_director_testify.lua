local ConflictDirectorTestify = {
	total_main_path_distance = function ()
		return EngineOptimized.main_path_total_length()
	end,
	get_all_breeds = function ()
		local breeds = {}

		for breed_name, breed_data in pairs(Breeds) do
			if breed_data.is_always_spawnable and breed_data.allied ~= true then
				breeds[breed_name] = breed_data
			end
		end

		return breeds
	end,
	spawn_unit = function (unit_data, conflict_director)
		local boxed_spawn_rotation = QuaternionBox(Quaternion.identity())

		conflict_director:spawn_queued_unit(unit_data.breed_data, unit_data.boxed_spawn_position, boxed_spawn_rotation)
	end,
	get_unit_of_breed = function (breed_name, conflict_director)
		local _, unit = next(conflict_director:spawned_units_by_breed(breed_name))

		return unit
	end,
	destroy_all_units = function (_, conflict_director)
		conflict_director:destroy_all_units()
	end,
	peaks = function (_, conflict_director)
		return conflict_director:get_peaks()
	end,
	reset_terror_event_mixer = function ()
		TerrorEventMixer.reset()
	end,
	terror_event_finished = function (event_name, conflict_director)
		return conflict_director:terror_event_finished(event_name)
	end,
	start_terror_event = function (event_name, conflict_director)
		conflict_director:start_terror_event(event_name)
	end,
	kill_nearby_enemies = function (event_name, conflict_director)
		conflict_director:destroy_close_units(nil, 64)
	end
}

return ConflictDirectorTestify
