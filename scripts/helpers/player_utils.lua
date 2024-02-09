﻿-- chunkname: @scripts/helpers/player_utils.lua

PlayerUtils = {}

PlayerUtils.unique_player_id = function (peer_id, local_player_id)
	return peer_id .. ":" .. local_player_id
end

PlayerUtils.split_unique_player_id = function (unique_player_id)
	local result = string.split(unique_player_id, ":")

	return result[1], tonumber(result[2])
end

PlayerUtils.get_random_alive_hero = function ()
	local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:sides()[1]
	local players = side.PLAYER_AND_BOT_UNITS
	local unit_list = {}
	local unit_list_n = 0

	for i = 1, #players do
		local unit = players[i]

		if HEALTH_ALIVE[unit] then
			unit_list_n = unit_list_n + 1
			unit_list[unit_list_n] = unit
		end
	end

	if unit_list_n > 0 then
		local unit = unit_list[math.random(1, unit_list_n)]

		return unit
	end

	return nil
end

PlayerUtils.is_career_available = function (career_name)
	local override_career_availability = Managers.mechanism:mechanism_setting_for_title("override_career_availability")

	if not override_career_availability then
		return true
	end

	return override_career_availability[career_name] ~= false
end

PlayerUtils.get_enabled_career_index_by_profile = function (profile_index)
	local careers = SPProfiles[profile_index].careers

	for i = 1, #careers do
		if PlayerUtils.is_career_available(careers[i].display_name) then
			return i
		end
	end
end

PlayerUtils.get_random_enabled_career_index_by_profile = function (profile_index)
	local careers = table.shallow_copy(SPProfiles[profile_index].careers)
	local career

	repeat
		local idx = math.random(1, #careers)

		if PlayerUtils.is_career_available(careers[idx].display_name) then
			career = idx
		else
			table.remove(careers, idx)
		end
	until career or table.is_empty(careers)

	return career
end

PlayerUtils.get_talent_overrides_by_career = function (career_name)
	local override_career_talents = Managers.mechanism:mechanism_setting_for_title("override_career_talents")

	if not override_career_talents then
		return
	end

	return override_career_talents[career_name]
end

PlayerUtils.broadphase_query = function (position, radius, result_table, broadphase_categories)
	fassert(result_table, "No result_table given to PlayerUtils.broadphase_query")

	local proximity_system = Managers.state.entity:system("proximity_system")
	local broadphase = proximity_system.player_units_broadphase
	local num_hits = Broadphase.query(broadphase, position, radius, result_table, broadphase_categories)

	return num_hits
end
