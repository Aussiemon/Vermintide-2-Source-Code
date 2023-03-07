local STORM_STATES = {
	COOLDOWN = "COOLDOWN",
	ACTIVE = "ACTIVE",
	READY = "READY"
}
script_data.shadow_daggers_debug = true
local TIME_BETWEEN_SPAWNS = 5
local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[MutatorCurseShadowDaggers] %s", message)
end

local function dprintf(...)
	if script_data.shadow_daggers_debug then
		local message = sprintf(...)

		global_printf("[MutatorCurseShadowDaggers] %s", message)
	end
end

local Storm = class(Storm)

Storm.init = function (self, unit_name, min_cooldown, max_cooldown, logging_prefix)
	self._logging_prefix = logging_prefix

	dprintf("-%s- init", logging_prefix)

	self._unit_name = unit_name
	self._max_cooldown = max_cooldown
	self._min_cooldown = min_cooldown
	self._active_storm_data = nil
	self._state = STORM_STATES.COOLDOWN
	self._cooldown_end_t = Math.random_range(min_cooldown, max_cooldown)
end

Storm.destroy = function (self)
	dprintf("-%s- destroy", self._logging_prefix)

	if self._active_storm_data then
		self:_clear_active_storm()
	end
end

Storm.update = function (self, dt, t)
	if self._state == STORM_STATES.COOLDOWN then
		if self._cooldown_end_t < t then
			self._state = STORM_STATES.READY

			dprintf("-%s- new state %s", self._logging_prefix, self._state)
		end
	elseif self._state == STORM_STATES.READY then
		-- Nothing
	elseif self._state == STORM_STATES.ACTIVE then
		local unit = self._active_storm_data.unit

		if unit then
			if not Unit.alive(unit) then
				local min_cooldown = self._min_cooldown
				local max_cooldown = self._max_cooldown
				self._cooldown_end_t = Math.random_range(min_cooldown, max_cooldown)
				self._state = STORM_STATES.COOLDOWN

				dprintf("-%s- new state %s", self._logging_prefix, self._state)
				self:_clear_active_storm()
			else
				self._active_storm_data.latest_position = Unit.local_position(unit, 0)
			end
		end
	else
		ferror("unknown state %d", self._state or "nil")
	end
end

Storm.spawn = function (self, spawn_position)
	fassert(self._state == STORM_STATES.READY, "prepare_spawn can only be called when the state of the storm is READY")
	dprintf("-%s- spawn", self._logging_prefix)

	if self._active_storm_data then
		self:_clear_active_storm()
	end

	local unit_name = self._unit_name
	local spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_position)
	local extension_init_data = {
		shadow_dagger_spawner_system = {
			limitted_spawner = true
		}
	}
	local spawned_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "shadow_dagger_spawner", extension_init_data, spawn_pose)
	self._active_storm_data = {
		unit = spawned_unit,
		starting_position = Vector3Box(spawn_position)
	}
	self._state = STORM_STATES.ACTIVE

	dprintf("-%s- new state %s", self._logging_prefix, self._state)
end

Storm.get_state = function (self)
	return self._state
end

Storm.get_position = function (self)
	local active_storm_data = self._active_storm_data

	if not active_storm_data then
		return nil
	end

	return active_storm_data.starting_position:unbox()
end

Storm.get_unit = function (self)
	local active_storm_data = self._active_storm_data

	return active_storm_data and active_storm_data.unit
end

Storm._clear_active_storm = function (self)
	local active_storm_data = self._active_storm_data
	local unit = active_storm_data.unit

	if unit and Unit.alive(unit) then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	self._active_storm_data = nil
end

local STORM_COUNT = 3
local UNIT_NAME = "units/props/blk/blk_curse_shadow_dagger_spawner_01"
local MIN_COOLDOWN = 10
local MAX_COOLDOWN = 10
local MIN_DISTANCE = 10
local MAX_DISTANCE = 30
local DISTANCE_TO_FORBIDDEN_POSITION_LIST = 10

return {
	description = "curse_shadow_daggers_desc",
	package_name = "resource_packages/mutators/mutator_curse_shadow_daggers",
	display_name = "curse_shadow_daggers_name",
	icon = "deus_curse_khorne_01",
	server_start_function = function (context, data)
		local storms = {}

		for i = 1, STORM_COUNT do
			storms[#storms + 1] = Storm:new(UNIT_NAME, MIN_COOLDOWN, MAX_COOLDOWN, i)
		end

		data.storms = storms
		data.next_bleed_time = 0
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

		local storms = data.storms

		for storm_index = 1, #storms do
			local storm = storms[storm_index]

			storm:update(dt, t)
		end

		if data.next_spawn_t and t < data.next_spawn_t then
			return
		end

		for storm_index = 1, #storms do
			local storm = storms[storm_index]
			local state = storm:get_state()

			if state == STORM_STATES.READY then
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

					for i = 1, #storms do
						local other_storm = storms[i]
						forbidden_position_list[#forbidden_position_list + 1] = other_storm:get_position()
					end

					local nav_world = Managers.state.entity:system("ai_system"):nav_world()
					local output_position_list = {}

					ConflictUtils.find_positions_around_position(center_position, output_position_list, nav_world, MIN_DISTANCE, MAX_DISTANCE, 1, forbidden_position_list, DISTANCE_TO_FORBIDDEN_POSITION_LIST)

					local position_found = output_position_list[1]

					if position_found then
						storm:spawn(position_found)

						data.next_spawn_t = t + TIME_BETWEEN_SPAWNS
					end
				end

				return
			end
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		return
	end
}
