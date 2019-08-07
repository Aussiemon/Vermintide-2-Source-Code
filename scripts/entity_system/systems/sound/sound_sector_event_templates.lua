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

		local unit, death_extension = nil
		local iterate_first_unit = not last_horde_unit or not Unit.alive(last_horde_unit) or not sector[last_horde_unit]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_horde_unit)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension:breed()
			local is_skaven = breed.race == "skaven"

			if is_skaven and entities[unit].has_target and not death_extension:has_death_started() then
				local contains_this_unit = horde_units[unit]

				if not contains_this_unit then
					num_horde_units = num_horde_units + 1
				end

				local position = POSITION_LOOKUP[unit]
				horde_units[unit] = death_extension
				horde_positions[unit] = Vector3Box(position)
			end
		end

		local units_center = Vector3.zero()

		for horde_unit, horde_unit_death_extension in pairs(horde_units) do
			local position = horde_positions[horde_unit]:unbox()

			if not Unit.alive(horde_unit) or horde_unit_death_extension:has_death_started() or not sector[horde_unit] or not entities[horde_unit].has_target then
				horde_units[horde_unit] = nil
				horde_positions[horde_unit] = nil
				num_horde_units = num_horde_units - 1
			elseif position then
				units_center = units_center + position
			end
		end

		last_horde_unit = unit
		local min_units = 7

		if num_horde_units < min_units then
			return false
		end

		local min_distance_sq = 25
		local max_distance_sq = 1600
		units_center = units_center / num_horde_units
		local distance_sq = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance_sq <= distance_sq and distance_sq <= max_distance_sq

		return is_within_distance, units_center, num_horde_units
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

		local unit, death_extension = nil
		local iterate_first_unit = not last_horde_unit_marauder or not Unit.alive(last_horde_unit_marauder) or not sector[last_horde_unit_marauder]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_horde_unit_marauder)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension:breed()
			local is_chaos = breed.race == "chaos"

			if is_chaos and entities[unit].has_target and not death_extension:has_death_started() then
				local contains_this_unit = horde_units_marauder[unit]

				if not contains_this_unit then
					num_horde_units_marauder = num_horde_units_marauder + 1
				end

				local position = POSITION_LOOKUP[unit]
				horde_units_marauder[unit] = death_extension
				horde_positions_marauder[unit] = Vector3Box(position)
			end
		end

		local units_center = Vector3.zero()

		for horde_unit, horde_unit_death_extension in pairs(horde_units_marauder) do
			local position = horde_positions_marauder[horde_unit]:unbox()

			if not Unit.alive(horde_unit) or horde_unit_death_extension:has_death_started() or not sector[horde_unit] or not entities[horde_unit].has_target then
				horde_units_marauder[horde_unit] = nil
				horde_positions_marauder[horde_unit] = nil
				num_horde_units_marauder = num_horde_units_marauder - 1
			elseif position then
				units_center = units_center + position
			end
		end

		last_horde_unit_marauder = unit
		local min_units = 7

		if num_horde_units_marauder < min_units then
			return false
		end

		local min_distance_sq = 4
		local max_distance_sq = 1600
		units_center = units_center / num_horde_units_marauder
		local distance_sq = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance_sq <= distance_sq and distance_sq <= max_distance_sq

		return is_within_distance, units_center, num_horde_units_marauder
	end
}
local last_horde_unit_gor = nil
local horde_units_gor = {}
local horde_positions_gor = {}
local num_horde_units_gor = 0
SoundSectorEventTemplates.distant_horde_beastmen = {
	sound_event_stop = "stop_distant_horde_beastmen",
	sound_event_start = "distant_horde_beastmen",
	evaluate = function (sectors, sector_index, t, entities, camera_position)
		local sector = sectors[sector_index]

		if not sector then
			return false
		end

		local unit, death_extension = nil
		local iterate_first_unit = not last_horde_unit_gor or not Unit.alive(last_horde_unit_gor) or not sector[last_horde_unit_gor]

		if iterate_first_unit then
			unit, death_extension = next(sector, nil)
		else
			unit, death_extension = next(sector, last_horde_unit_gor)
		end

		if unit then
			local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_base_extension:breed()
			local is_beastmen = breed.race == "beastmen"

			if is_beastmen and entities[unit].has_target and not death_extension:has_death_started() then
				local contains_this_unit = horde_units_gor[unit]

				if not contains_this_unit then
					num_horde_units_gor = num_horde_units_gor + 1
				end

				local position = POSITION_LOOKUP[unit]
				horde_units_gor[unit] = death_extension
				horde_positions_gor[unit] = Vector3Box(position)
			end
		end

		local units_center = Vector3.zero()

		for horde_unit, horde_unit_death_extension in pairs(horde_units_gor) do
			local position = horde_positions_gor[horde_unit]:unbox()

			if not Unit.alive(horde_unit) or horde_unit_death_extension:has_death_started() or not sector[horde_unit] or not entities[horde_unit].has_target then
				horde_units_gor[horde_unit] = nil
				horde_positions_gor[horde_unit] = nil
				num_horde_units_gor = num_horde_units_gor - 1
			elseif position then
				units_center = units_center + position
			end
		end

		last_horde_unit_gor = unit
		local min_units = 7

		if num_horde_units_gor < min_units then
			return false
		end

		local min_distance_sq = 4
		local max_distance_sq = 1600
		units_center = units_center / num_horde_units_gor
		local distance_sq = Vector3.distance_squared(camera_position, units_center)
		local is_within_distance = min_distance_sq <= distance_sq and distance_sq <= max_distance_sq

		return is_within_distance, units_center, num_horde_units_gor
	end
}

return
