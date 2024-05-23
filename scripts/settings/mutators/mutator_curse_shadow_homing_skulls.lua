-- chunkname: @scripts/settings/mutators/mutator_curse_shadow_homing_skulls.lua

require("scripts/settings/dlcs/belakor/belakor_balancing")

script_data.shadow_homing_skulls_debug = false

local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[MutatorCurseShadowHomingSkulls] %s", message)
end

local function dprintf(...)
	if script_data.belakor_shooters_debug then
		local message = sprintf(...)

		global_printf("[MutatorCurseShadowHomingSkulls] %s", message)
	end
end

local function find_positions(physics_world, random_player, shooter_count)
	local forbidden_position_list = {}
	local side = Managers.state.side:get_side_from_name("heroes")
	local players = side.PLAYER_AND_BOT_UNITS

	for player_index = 1, #players do
		local unit = players[player_index]

		forbidden_position_list[#forbidden_position_list + 1] = POSITION_LOOKUP[unit]
	end

	local cluster_center_positions = ConflictUtils.find_visible_positions_in_sphere_around_player(physics_world, shooter_count, random_player, BelakorBalancing.homing_skulls_radius, BelakorBalancing.homing_skulls_min_pitch, BelakorBalancing.homing_skulls_max_pitch, BelakorBalancing.homing_skulls_pitch_delta, 0, 2 * math.pi, BelakorBalancing.homing_skulls_yaw_delta, forbidden_position_list, BelakorBalancing.homing_skulls_radius, BelakorBalancing.homing_skulls_distance_between_skulls, BelakorBalancing.homing_skulls_min_distance_above_ground)

	return cluster_center_positions
end

local STATES = {
	DISABLED = "DISABLED",
	SPAWNING = "SPAWNING",
	WAITING_TO_SPAWN = "WAITING_TO_SPAWN",
}

return {
	description = "curse_shadow_homing_skulls_desc",
	display_name = "curse_shadow_homing_skulls_name",
	icon = "deus_curse_belakor_01",
	packages = {
		"resource_packages/mutators/mutator_curse_shadow_homing_skulls",
	},
	server_start_function = function (context, data)
		data.conflict_director = Managers.state.conflict
		data.physics_world = World.physics_world(context.world)
		data.state = STATES.WAITING_TO_SPAWN
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

		local current_state = data.state
		local conflict_director = data.conflict_director
		local pacing_disabled = conflict_director.pacing:horde_population() < 1 and conflict_director.pacing:get_state() ~= "pacing_frozen"

		if current_state == STATES.WAITING_TO_SPAWN then
			if not data.next_spawn_t then
				local next_delta = Math.random_range(BelakorBalancing.homing_skulls_min_time_between_spawns, BelakorBalancing.homing_skulls_max_time_between_spawns)

				data.next_spawn_t = t + next_delta
				data.state = STATES.WAITING_TO_SPAWN
			end

			if not data.next_spawn_t or t > data.next_spawn_t then
				data.state = STATES.SPAWNING
			elseif pacing_disabled then
				data.state = STATES.DISABLED
			end
		elseif current_state == STATES.DISABLED then
			if not pacing_disabled then
				local next_delta = Math.random_range(BelakorBalancing.homing_skulls_min_time_between_spawns, BelakorBalancing.homing_skulls_max_time_between_spawns)

				data.next_spawn_t = t + next_delta
				data.state = STATES.WAITING_TO_SPAWN
			end
		elseif current_state == STATES.SPAWNING then
			local random_player = PlayerUtils.get_random_alive_hero()

			if not random_player then
				data.next_spawn_t = t + BelakorBalancing.homing_skulls_retry_time_on_spawn_failure
				data.state = STATES.WAITING_TO_SPAWN
			else
				local physics_world = data.physics_world
				local shooter_count = BelakorBalancing.homing_skulls_maximum_count
				local positions_found = find_positions(physics_world, random_player, shooter_count)

				if positions_found and #positions_found >= BelakorBalancing.homing_skulls_minimum_count then
					for i = 1, #positions_found do
						local position = positions_found[i]
						local with_physics = false
						local rotation = Quaternion.identity()
						local spawn_type = "mutator"
						local pickup_name = "deus_04"
						local pickup_system = Managers.state.entity:system("pickup_system")

						pickup_system:spawn_pickup(pickup_name, position, rotation, with_physics, spawn_type)
					end

					local audio_system = Managers.state.entity:system("audio_system")

					audio_system:play_2d_audio_event("Play_curse_shadow_skulls_spawn")

					local next_delta = Math.random_range(BelakorBalancing.homing_skulls_min_time_between_spawns, BelakorBalancing.homing_skulls_max_time_between_spawns)

					data.next_spawn_t = t + next_delta
					data.state = STATES.WAITING_TO_SPAWN
				else
					data.next_spawn_t = t + BelakorBalancing.homing_skulls_retry_time_on_spawn_failure
					data.state = STATES.WAITING_TO_SPAWN
				end
			end
		end

		if script_data.shadow_homing_skulls_debug then
			Debug.text("homing skulls state state: %s - %s", data.state, data.next_spawn_t and data.next_spawn_t - t or 0)
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		return
	end,
}
