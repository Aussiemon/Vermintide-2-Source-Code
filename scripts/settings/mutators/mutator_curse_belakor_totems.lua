local TOTEM_STATES = {
	COOLDOWN = "COOLDOWN",
	ACTIVE = "ACTIVE",
	READY = "READY"
}
script_data.belakor_totems_debug = true
local TIME_BETWEEN_SPAWNS = 0.5
local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[MutatorCurseBelakorTotems] %s", message)
end

local function dprintf(...)
	if script_data.belakor_totems_debug then
		local message = sprintf(...)

		global_printf("[MutatorCurseBelakorTotems] %s", message)
	end
end

local RELOCATE_COOLDOWN = 0
local MIN_COOLDOWN = 25
local MAX_COOLDOWN = 35
local MIN_DISTANCE = 10
local MAX_DISTANCE = 15
local DISTANCE_TO_FORBIDDEN_POSITION_LIST = 10
local AHEAD_SPAWN_MAIN_PATH_DISTANCE = 5
local Totem = class(Totem)

Totem.init = function (self, logging_prefix)
	self._logging_prefix = logging_prefix

	dprintf("-%s- init", logging_prefix)

	self._active_totem_data = nil
	self._state = TOTEM_STATES.COOLDOWN
end

Totem.destroy = function (self)
	dprintf("-%s- destroy", self._logging_prefix)

	if self._active_totem_data then
		self:_clear_active_totem()
	end
end

Totem.update = function (self, dt, t)
	if self._state == TOTEM_STATES.COOLDOWN then
		if not self._cooldown_end_t then
			self._cooldown_end_t = t + Math.random_range(MIN_COOLDOWN, MAX_COOLDOWN)
			self._state = TOTEM_STATES.READY
		elseif self._cooldown_end_t < t then
			self._state = TOTEM_STATES.READY

			dprintf("-%s- new state %s", self._logging_prefix, self._state)
		end
	elseif self._state == TOTEM_STATES.READY then
	elseif self._state == TOTEM_STATES.ACTIVE then
		local unit = self._active_totem_data.unit

		if unit then
			if self._active_totem_data.totem_ext:is_despawned() then
				local blackboard = BLACKBOARDS[unit]

				Managers.state.conflict:destroy_unit(unit, blackboard, "far_off_despawn")
			end

			if not Unit.alive(unit) then
				if self._active_totem_data.totem_ext:is_despawned() then
					self._cooldown_end_t = t + RELOCATE_COOLDOWN
				else
					self._cooldown_end_t = t + Math.random_range(MIN_COOLDOWN, MAX_COOLDOWN)
				end

				self._state = TOTEM_STATES.COOLDOWN

				dprintf("-%s- new state %s", self._logging_prefix, self._state)
				self:_clear_active_totem()
			else
				self._active_totem_data.latest_position = Unit.local_position(unit, 0)
			end
		end
	else
		ferror("unknown state %d", self._state or "nil")
	end
end

Totem.spawn = function (self, spawn_position)
	fassert(self._state == TOTEM_STATES.READY, "prepare_spawn can only be called when the state of the totem is READY")
	dprintf("-%s- spawn", self._logging_prefix)

	if self._active_totem_data then
		self:_clear_active_totem()
	end

	local optional_data = {
		prepare_func = function (breed, extension_init_data)
			local is_husk = false

			breed:modify_extension_init_data(is_husk, extension_init_data)
		end
	}
	local _self = self

	optional_data.spawned_func = function (unit, breed, optional_data)
		_self._active_totem_data.unit = unit
		_self._active_totem_data.queue_id = nil
		_self._active_totem_data.totem_ext = ScriptUnit.has_extension(unit, "deus_belakor_totem_system")
	end

	local rotation = Quaternion.identity()
	local queue_id = Managers.state.conflict:spawn_queued_unit(Breeds.shadow_totem, Vector3Box(spawn_position), QuaternionBox(rotation), "mutator", "spawn_idle", "terror_event", optional_data)
	self._active_totem_data = {
		queue_id = queue_id,
		starting_position = Vector3Box(spawn_position)
	}
	self._state = TOTEM_STATES.ACTIVE

	dprintf("-%s- new state %s", self._logging_prefix, self._state)
end

Totem.get_state = function (self)
	return self._state
end

Totem.get_position = function (self)
	local active_totem_data = self._active_totem_data

	if not active_totem_data then
		return nil
	end

	return active_totem_data.starting_position:unbox()
end

Totem.get_unit = function (self)
	local active_totem_data = self._active_totem_data

	return active_totem_data and active_totem_data.unit
end

Totem._clear_active_totem = function (self)
	local active_totem_data = self._active_totem_data
	local queue_id = active_totem_data.queue_id

	if queue_id then
		Managers.state.conflict:remove_queued_unit(queue_id)
	end

	self._active_totem_data = nil
end

local TOTEM_COUNT = 1

return {
	description = "curse_belakor_totems_desc",
	package_name = "resource_packages/mutators/mutator_curse_belakor_totems",
	display_name = "curse_belakor_totems_name",
	icon = "deus_curse_belakor_01",
	server_start_function = function (context, data)
		local totems = {}

		for i = 1, TOTEM_COUNT, 1 do
			totems[#totems + 1] = Totem:new(i)
		end

		data.totems = totems
		data.conflict_director = Managers.state.conflict
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

		local totems = data.totems

		for totem_index = 1, #totems, 1 do
			local totem = totems[totem_index]

			totem:update(dt, t)
		end

		local conflict_director = data.conflict_director

		if conflict_director.pacing:horde_population() < 1 and conflict_director.pacing:get_state() ~= "pacing_frozen" then
			return
		end

		for totem_index = 1, #totems, 1 do
			local totem = totems[totem_index]
			local state = totem:get_state()

			if state == TOTEM_STATES.READY then
				local main_path_info = Managers.state.conflict.main_path_info
				local random_player = main_path_info.ahead_unit

				if ALIVE[random_player] then
					local travel_dist = main_path_info.ahead_travel_dist
					local main_path_ahead_pos = MainPathUtils.point_on_mainpath(nil, travel_dist + AHEAD_SPAWN_MAIN_PATH_DISTANCE)
					local player_pos = POSITION_LOOKUP[random_player]
					local center_position = player_pos + Vector3.normalize(main_path_ahead_pos - player_pos) * AHEAD_SPAWN_MAIN_PATH_DISTANCE
					local forbidden_position_list = {}
					local side = Managers.state.side:get_side_from_name("heroes")
					local players = side.PLAYER_AND_BOT_UNITS

					for player_index = 1, #players, 1 do
						local unit = players[player_index]
						forbidden_position_list[#forbidden_position_list + 1] = POSITION_LOOKUP[unit]
					end

					for i = 1, #totems, 1 do
						local other_totem = totems[i]
						forbidden_position_list[#forbidden_position_list + 1] = other_totem:get_position()
					end

					local nav_world = Managers.state.entity:system("ai_system"):nav_world()
					local output_position_list = {}

					ConflictUtils.find_positions_around_position(center_position, output_position_list, nav_world, MIN_DISTANCE, MAX_DISTANCE, 1, forbidden_position_list, DISTANCE_TO_FORBIDDEN_POSITION_LIST)

					local position_found = output_position_list[1]

					if position_found then
						local bot_traverse_logic = Managers.state.bot_nav_transition:traverse_logic()

						if GwNavQueries.raycango(nav_world, center_position, position_found, bot_traverse_logic) then
							totem:spawn(position_found)
						end
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
