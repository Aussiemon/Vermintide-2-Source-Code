SoundSectorEventTemplates = SoundSectorEventTemplates or {}
local last_horde_unit = nil
local horde_units = {}
local horde_positions = {}
local num_horde_units = 0
SoundSectorEventTemplates.distant_horde = {
	sound_event_stop = "stop_distant_horde",
	sound_event_start = "distant_horde",
	evaluate = function (sectors, sector_index, t, entities, camera_position)
		local sector = sectors[sector_index]

		if not sector then
			return false
		end

		local min_units = 7
		local min_distance = 25
		local max_distance = 1600
		local units_center = Vector3.zero()
		local unit, death_extension = nil
		local iterate_first_unit = not last_horde_unit or not Unit.alive(last_horde_unit) or not sector[last_horde_unit]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_horde_unit)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension.breed(ai_base_extension)
			local is_slave = breed.behavior == "pack_rat"

			if is_slave and entities[unit].has_target and not death_extension.has_death_started(death_extension) then
				local contains_this_unit = horde_units[unit]

				if not contains_this_unit then
					num_horde_units = num_horde_units + 1
				end

				local position = POSITION_LOOKUP[unit]
				horde_units[unit] = death_extension
				horde_positions[unit] = Vector3Box(position)
			end
		end

		for horde_unit, death_extension in pairs(horde_units) do
			local position = horde_positions[horde_unit]:unbox()

			if not Unit.alive(horde_unit) or death_extension.has_death_started(death_extension) or not sector[horde_unit] then
				horde_units[horde_unit] = nil
				horde_positions[horde_unit] = nil
				num_horde_units = num_horde_units - 1
			elseif position then
				units_center = units_center + position
			end
		end

		last_horde_unit = unit

		if num_horde_units < min_units then
			return false
		end

		units_center = units_center/num_horde_units
		local distance = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance <= distance and distance <= max_distance

		if is_within_distance then
			return true, units_center, num_horde_units
		end

		return false, units_center, num_horde_units
	end
}
local last_horde_unit_marauder = nil
local horde_units_marauder = {}
local horde_positions_marauder = {}
local num_horde_units_marauder = 0
SoundSectorEventTemplates.distant_horde_marauder = {
	sound_event_stop = "stop_distant_horde_marauder",
	sound_event_start = "distant_horde_marauder",
	evaluate = function (sectors, sector_index, t, entities, camera_position)
		local sector = sectors[sector_index]

		if not sector then
			return false
		end

		local min_units = 7
		local min_distance = 4
		local max_distance = 1600
		local units_center = Vector3.zero()
		local unit, death_extension = nil
		local iterate_first_unit = not last_horde_unit_marauder or not Unit.alive(last_horde_unit_marauder) or not sector[last_horde_unit_marauder]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_horde_unit_marauder)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension.breed(ai_base_extension)
			local is_slave = breed.behavior == "marauder"

			if is_slave and entities[unit].has_target and not death_extension.has_death_started(death_extension) then
				local contains_this_unit = horde_units_marauder[unit]

				if not contains_this_unit then
					num_horde_units_marauder = num_horde_units_marauder + 1
				end

				local position = POSITION_LOOKUP[unit]
				horde_units_marauder[unit] = death_extension
				horde_positions_marauder[unit] = Vector3Box(position)
			end
		end

		for horde_unit, death_extension in pairs(horde_units_marauder) do
			local position = horde_positions_marauder[horde_unit]:unbox()

			if not Unit.alive(horde_unit) or death_extension.has_death_started(death_extension) or not sector[horde_unit] then
				horde_units_marauder[horde_unit] = nil
				horde_positions_marauder[horde_unit] = nil
				num_horde_units_marauder = num_horde_units_marauder - 1
			elseif position then
				units_center = units_center + position
			end
		end

		last_horde_unit_marauder = unit

		if num_horde_units_marauder < min_units then
			return false
		end

		units_center = units_center/num_horde_units_marauder
		local distance = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance <= distance and distance <= max_distance

		if is_within_distance then
			return true, units_center, num_horde_units_marauder
		end

		return false, units_center, num_horde_units_marauder
	end
}
local should_play_marauder_mass_idle = true
local marauder_units = {}
local num_marauder_units = 0
local total_length = 0
local marauders_center = Vector3Box()
local prev_pos = Vector3Box()
local last_marauder_unit = nil
local first_check = true
SoundSectorEventTemplates.marauder_mass_idle = {
	particle_effect = "fx/chr_marauder_pack",
	sound_event_stop = "Stop_marauder_crowd_loop",
	particle_value_name = "spawn_radius",
	sound_event_start = "Play_marauder_crowd_loop",
	evaluate = function (sectors, sector_index, t, entities, camera_position)
		local sector = sectors[sector_index]

		if not sector then
			return false
		end

		local min_units = 10
		local min_distance = 25
		local max_distance = 1600
		local max_particle_length = 10
		local Vector3_distance = Vector3.distance

		if not should_play_marauder_mass_idle then
			return false
		end

		local unit, death_extension = nil
		local iterate_first_unit = not last_marauder_unit or not Unit.alive(last_marauder_unit) or not sector[last_marauder_unit]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_marauder_unit)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension.breed(ai_base_extension)

			if breed.behavior == "marauder" and not death_extension.has_death_started(death_extension) then
				local contains_this_unit = marauder_units[unit]

				if not contains_this_unit then
					local position = POSITION_LOOKUP[unit]

					if not first_check then
						local length = Vector3_distance(position, prev_pos:unbox())
						total_length = total_length + length
					end

					local old_pos = marauders_center:unbox()

					marauders_center:store(old_pos + position)

					num_marauder_units = num_marauder_units + 1

					prev_pos:store(position)

					marauder_units[unit] = death_extension
				end
			end
		end

		for marauder_unit, death_extension in pairs(marauder_units) do
			if (death_extension and death_extension.has_death_started(death_extension)) or not Unit.alive(marauder_unit) or not sector[marauder_unit] then
				local position = POSITION_LOOKUP[marauder_unit]

				if position then
					local old_pos = marauders_center:unbox()

					marauders_center:store(old_pos - position)
				end

				marauder_units[marauder_unit] = nil
				num_marauder_units = num_marauder_units - 1
			end
		end

		first_check = false
		last_marauder_unit = unit

		if num_marauder_units < min_units then
			if num_marauder_units == 0 then
				first_check = true
			end

			return false
		end

		local units_center = marauders_center:unbox()
		units_center = units_center/num_marauder_units
		local distance = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance <= distance and distance <= max_distance

		if is_within_distance then
			local particle_value = Vector2(1, 1)

			if total_length then
				total_length = total_length/num_marauder_units

				if total_length < max_particle_length then
					particle_value[2] = total_length
				else
					particle_value[2] = max_particle_length
				end
			end

			total_length = 0

			return true, units_center, num_marauder_units, particle_value
		end

		return false, units_center, num_marauder_units
	end
}

return 
