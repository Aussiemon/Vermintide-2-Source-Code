local MIN_TIME_BETWEEN_SPAWNS = 20
local MAX_TIME_BETWEEN_SPAWNS = 50
local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[MutatorCurseGreyWings] %s", message)
end

local function dprintf(...)
	if script_data.belakor_grey_wings_debug then
		local message = sprintf(...)

		global_printf("[MutatorCurseGreyWings] %s", message)
	end
end

local MIN_DISTANCE = 10
local MAX_DISTANCE = 20
local DISTANCE_TO_FORBIDDEN_POSITION_LIST = 10

return {
	description = "curse_grey_wings_desc",
	package_name = "resource_packages/mutators/mutator_curse_grey_wings",
	display_name = "curse_grey_wings_name",
	icon = "deus_curse_belakor_01",
	server_start_function = function (context, data)
		data.conflict_director = Managers.state.conflict
		data.seed = Managers.mechanism:get_level_seed("mutator")
	end,
	server_players_left_safe_zone = function (context, data)
		data.started = true
	end,
	server_pre_update_function = function (context, data, dt, t)
		if Managers.state.unit_spawner.game_session == nil or global_is_inside_inn then
			return
		end

		if not data.started then
			return
		end

		if TerrorEventMixer.is_event_id_active_or_pending(data.active_terror_event_id) then
			data.next_spawn_t = nil

			return
		end

		local conflict_director = data.conflict_director

		if conflict_director.pacing:horde_population() < 1 or conflict_director.pacing:get_state() == "pacing_frozen" then
			data.next_spawn_t = nil

			return
		end

		if not data.next_spawn_t then
			local seed = data.seed
			local new_seed, time_between_spawn = Math.next_random(seed, MIN_TIME_BETWEEN_SPAWNS, MAX_TIME_BETWEEN_SPAWNS)
			data.seed = new_seed
			data.next_spawn_t = t + time_between_spawn
		end

		if t < data.next_spawn_t then
			return
		end

		local random_player = PlayerUtils.get_random_alive_hero()

		if random_player then
			local center_position = POSITION_LOOKUP[random_player]
			local forbidden_position_list = {}
			local side = Managers.state.side:get_side_from_name("heroes")
			local players = side.PLAYER_AND_BOT_UNITS

			for player_index = 1, #players do
				local unit = players[player_index]
				forbidden_position_list[#forbidden_position_list + 1] = POSITION_LOOKUP[unit]
			end

			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local output_position_list = {}

			ConflictUtils.find_positions_around_position(center_position, output_position_list, nav_world, MIN_DISTANCE, MAX_DISTANCE, 1, forbidden_position_list, DISTANCE_TO_FORBIDDEN_POSITION_LIST)

			local position_found = output_position_list[1]

			if position_found then
				local seed = data.seed
				local unit = nil
				data.active_terror_event_id = Managers.state.conflict:start_terror_event("grey_wings_spawns", seed, unit, position_found)
				local new_seed = Math.next_random(seed)
				data.seed = new_seed
				data.next_spawn_t = nil
			end
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		return
	end
}
