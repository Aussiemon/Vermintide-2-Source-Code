local DIFFICULTY_POWER_LEVEL = {
	harder = 60,
	hard = 45,
	normal = 30,
	hardest = 80,
	cataclysm = 100,
	cataclysm_3 = 130,
	cataclysm_2 = 110,
	easy = 20
}
local STORM_STATES = {
	COOLDOWN = "COOLDOWN",
	ACTIVE = "ACTIVE",
	READY = "READY"
}
script_data.blood_storm_debug = true
local global_printf = printf

local function printf(...)
	local message = sprintf(...)

	global_printf("[MutatorCurseBloodStorm] %s", message)
end

local function dprintf(...)
	if script_data.blood_storm_debug then
		local message = sprintf(...)

		global_printf("[MutatorCurseBloodStorm] %s", message)
	end
end

local Storm = class(Storm)

Storm.init = function (self, vortex_template_name, inner_decal_unit_name, outer_decal_unit_name, min_cooldown, max_cooldown, logging_prefix)
	self._logging_prefix = logging_prefix

	dprintf("-%s- init", logging_prefix)

	self._vortex_template_name = vortex_template_name
	self._inner_decal_unit_name = inner_decal_unit_name
	self._outer_decal_unit_name = outer_decal_unit_name
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
		local unit = self._active_storm_data.summoned_vortex_unit

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

	local vortex_template_name = self._vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	local spawn_radius = 2
	local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)
	local inner_decal_unit_name = self._inner_decal_unit_name
	local inner_decal_unit = nil

	if inner_decal_unit_name then
		local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_position)
		local inner_radius = math.max(vortex_template.min_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

		Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

		inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
	end

	local outer_decal_unit_name = self._outer_decal_unit_name
	local outer_decal_unit = nil

	if outer_decal_unit_name then
		local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_position)
		local outer_radius = math.max(vortex_template.min_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

		Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

		outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
	end

	local storm_instance = self
	local optional_data = {
		prepare_func = function (breed, extension_init_data)
			extension_init_data.ai_supplementary_system = {
				vortex_template_name = vortex_template_name,
				inner_decal_unit = inner_decal_unit,
				outer_decal_unit = outer_decal_unit
			}
		end,
		spawned_func = function (vortex_unit, breed, optional_data)
			storm_instance._active_storm_data.summoned_vortex_unit = vortex_unit
			storm_instance._active_storm_data.vortex_extension = ScriptUnit.has_extension(vortex_unit, "ai_supplementary_system")
		end
	}
	local spawn_pos = spawn_position
	local breed_name = vortex_template.breed_name
	local breed = Breeds[breed_name]
	local spawn_category = "vortex"
	local queue_id = Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion.identity()), spawn_category, nil, nil, optional_data)
	self._active_storm_data = {
		queue_id = queue_id,
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

	local vortex_unit = active_storm_data.summoned_vortex_unit

	if not vortex_unit then
		return nil
	end

	if not Unit.alive(vortex_unit) then
		return nil
	end

	local latest_position = active_storm_data.latest_position

	if not latest_position then
		local starting_position = active_storm_data.starting_position

		return starting_position:unbox()
	else
		return latest_position
	end
end

Storm.get_vortex_unit = function (self)
	local active_storm_data = self._active_storm_data

	return active_storm_data and active_storm_data.summoned_vortex_unit
end

Storm.get_vortex_extension = function (self)
	local active_storm_data = self._active_storm_data

	return active_storm_data and active_storm_data.vortex_extension
end

Storm._clear_active_storm = function (self)
	local active_storm_data = self._active_storm_data
	local summoned_vortex_unit = active_storm_data.summoned_vortex_unit

	if not summoned_vortex_unit then
		local queue_id = active_storm_data.queue_id

		if queue_id then
			Managers.state.conflict:remove_queued_unit(queue_id)
		end
	end

	self._active_storm_data = nil
end

local BLEED_RATE = 0.2
local BLEED_BUFF = "curse_blood_storm_dot"
local BLEED_BUFF_BOTS = "curse_blood_storm_dot_bots"
local STORM_COUNT = 3
local VORTEX_TEMPLATE_NAME = "blood_storm"
local INNER_DECAL_UNIT_NAME = "units/decals/deus_decal_bloodstorm_inner"
local OUTER_DECAL_UNIT_NAME = "units/decals/deus_decal_bloodstorm_outer"
local MIN_COOLDOWN = 15
local MAX_COOLDOWN = 20
local MIN_DISTANCE = 10
local MAX_DISTANCE = 30
local DISTANCE_TO_FORBIDDEN_POSITION_LIST = 10

return {
	description = "curse_blood_storm_desc",
	curse_package_name = "resource_packages/mutators/mutator_curse_blood_storm",
	display_name = "curse_blood_storm_name",
	icon = "deus_curse_khorne_01",
	server_start_function = function (context, data)
		local storms = {}

		for i = 1, STORM_COUNT do
			storms[#storms + 1] = Storm:new(VORTEX_TEMPLATE_NAME, INNER_DECAL_UNIT_NAME, OUTER_DECAL_UNIT_NAME, MIN_COOLDOWN, MAX_COOLDOWN, i)
		end

		data.storms = storms
		data.next_bleed_time = 0
	end,
	server_pre_update_function = function (context, data, dt, t)
		if Managers.state.unit_spawner.game_session == nil or global_is_inside_inn then
			return
		end

		local should_bleed = false

		if data.next_bleed_time < t then
			should_bleed = true
			data.next_bleed_time = t + BLEED_RATE
		end

		local storms = data.storms

		for storm_index = 1, #storms do
			local storm = storms[storm_index]

			storm:update(dt, t)
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
					end
				end
			elseif state == STORM_STATES.ACTIVE and should_bleed then
				local vortex_extension = storm:get_vortex_extension()
				local vortex_unit = storm:get_vortex_unit()

				if vortex_extension then
					local players = Managers.player:players()

					for _, player in pairs(players) do
						local player_unit = player.player_unit

						if ALIVE[player_unit] then
							local position = POSITION_LOOKUP[player_unit]
							local is_inside = vortex_extension:is_position_inside(position)

							if is_inside then
								local buff_system = Managers.state.entity:system("buff_system")
								local difficulty = Managers.state.difficulty:get_difficulty()
								local power_level = DIFFICULTY_POWER_LEVEL[difficulty]
								local buff = player.bot_player and BLEED_BUFF_BOTS or BLEED_BUFF

								buff_system:add_buff(player_unit, buff, vortex_unit, false, power_level)
							end
						end
					end
				end
			end
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local damage_type = hit_data[2]

		if damage_type == "blood_storm" then
			local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("curse_damage_taken", event_data)
		end
	end
}
