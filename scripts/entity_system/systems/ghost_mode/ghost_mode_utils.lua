-- chunkname: @scripts/entity_system/systems/ghost_mode/ghost_mode_utils.lua

GhostModeUtils = GhostModeUtils or {}

GhostModeUtils.in_line_of_sight_of_enemies = function (unit, enemy_positions, physics_world)
	local pos = POSITION_LOOKUP[unit]
	local z_offset = Vector3(0, 0, 1)
	local num_enemy_positions = #enemy_positions

	for i = 1, num_enemy_positions do
		local target_pos = enemy_positions[i]
		local in_los = PerceptionUtils.is_position_in_line_of_sight(nil, pos + z_offset, target_pos + z_offset, physics_world)

		if in_los then
			return true
		end
	end

	return false
end

GhostModeUtils.in_range_of_enemies = function (position, side, is_boss)
	local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local in_range = false
	local min_dist = is_boss and GameModeSettings.versus.boss_minimum_spawn_distance or GameModeSettings.versus.dark_pact_minimum_spawn_distance
	local min_dist_vertical = GameModeSettings.versus.dark_pact_minimum_spawn_distance_vertical
	local min_dist_sq = min_dist^2

	for i = 1, #enemy_positions do
		local enemy_position = enemy_positions[i]
		local diff = enemy_position - position
		local height_diff = math.abs(diff[3])

		if height_diff < min_dist_vertical then
			local dist_sq = Vector3.length_squared(Vector3.flat(diff))

			if dist_sq < min_dist_sq then
				in_range = true

				break
			end
		end
	end

	return in_range
end

GhostModeUtils.in_safe_zone = function (unit)
	local in_safe_zone
	local level = LevelHelper:current_level(Managers.world:world("level_world"))
	local versus_safe_zone_name = "versus_activator"

	if Level.has_volume(level, versus_safe_zone_name) then
		local pos = POSITION_LOOKUP[unit]

		in_safe_zone = Level.is_point_inside_volume(level, versus_safe_zone_name, pos)
	end

	return in_safe_zone
end

GhostModeUtils.pact_sworn_round_started = function (pact_sworn_unit)
	local heroes_started, time_since_round_started = Managers.state.game_mode:is_round_started()

	if not heroes_started then
		return false
	end

	local pact_sworn_spawn_delay = GameModeSettings.versus.round_start_pact_sworn_spawn_delay
	local side = Managers.state.side.side_by_unit[pact_sworn_unit]

	if side then
		local any_left = false
		local enemy_player_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #enemy_player_units do
			local enemy_unit = enemy_player_units[i]

			if not GhostModeUtils.in_safe_zone(enemy_unit) then
				any_left = true

				break
			end
		end

		if any_left then
			pact_sworn_spawn_delay = GameModeSettings.versus.round_start_heroes_left_safe_zone_spawn_delay
		end
	end

	return pact_sworn_spawn_delay < time_since_round_started
end

GhostModeUtils.enemy_players_using_transport = function (unit)
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_units = side.ENEMY_PLAYER_UNITS

	for _, enemy_unit in ipairs(enemy_units) do
		if HEALTH_ALIVE[enemy_unit] then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if not status_extension:is_disabled() and status_extension:is_using_transport() then
				return true
			end
		end
	end

	return false
end

GhostModeUtils.far_enough_to_enter_ghost_mode = function (unit)
	local unit_pos = POSITION_LOOKUP[unit]
	local allowed_enter_ghost_dist = GameModeSettings.versus.dark_pact_catch_up_distance
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_units = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #enemy_units do
		local enemy_unit = enemy_units[i]
		local status_extension = ScriptUnit.has_extension(enemy_unit, "status_system")

		if not status_extension or not status_extension:is_disabled() then
			local target_pos = POSITION_LOOKUP[enemy_unit]
			local distance_to_hero = Vector3.distance(target_pos, unit_pos)

			if distance_to_hero < allowed_enter_ghost_dist then
				return false
			end
		end
	end

	return true
end
