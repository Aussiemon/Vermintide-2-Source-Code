local ACTIVE_ENEMIES_TO_SPAWN_HORDE = 10
local compositions = {
	chaos = {
		"event_large_chaos",
		"event_large"
	},
	beastmen = {
		"event_large_beastmen",
		"event_large"
	},
	skaven = {
		"event_large"
	}
}

local function get_compatible_faction(factions)
	local faction = nil

	for _, possible_faction in ipairs(factions) do
		if compositions[possible_faction] then
			faction = possible_faction
		end
	end

	return faction
end

local function get_random_composition_type(faction, seed)
	local compositions_for_faction = compositions[faction]
	local index = nil
	seed, index = Math.next_random(seed, 1, #compositions_for_faction)
	local composition_name = compositions_for_faction[index]

	return seed, composition_name
end

return {
	hide_from_player_ui = true,
	server_update_function = function (context, data)
		local conflict_director = Managers.state.conflict

		if not conflict_director then
			return
		end

		if not data.setup_done then
			conflict_director.pacing:disable()
			conflict_director.pacing:disable_roamers()

			data.seed = Managers.mechanism:get_level_seed("mutator")
			local mission_system = Managers.state.entity:system("mission_system")

			mission_system:request_mission("mutator_escape")

			data.setup_done = true
		end

		local t = Managers.time:time("game")

		if not data.check_at or data.check_at < t then
			local active_enemies = Managers.state.performance:num_active_enemies()

			if active_enemies < ACTIVE_ENEMIES_TO_SPAWN_HORDE then
				local factions = ConflictDirectors[conflict_director.current_conflict_settings].factions
				local faction = factions and get_compatible_faction(factions)

				if faction then
					local side_manager = Managers.state.side
					local enemy_side_id = side_manager:get_side_from_name("dark_pact").side_id
					local composition_type = nil
					data.seed, composition_type = get_random_composition_type(faction, data.seed)
					local extra_data = {
						start_delay = 0,
						only_behind = true,
						silent = true,
						override_composition_type = composition_type
					}
					local horde_spawner = conflict_director.horde_spawner

					horde_spawner:horde("vector", extra_data, enemy_side_id)
				end
			end

			data.check_at = t + 5
		end
	end
}
