ThornSisterWallExtension = class(ThornSisterWallExtension)
local DESPAWN_ANIM_TIME = 1

ThornSisterWallExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._is_server = Managers.state.network.is_server
	self._unit = unit
	self._life_time = extension_init_data.life_time
	self._owner_peer = extension_init_data.owner
	self._owner_unit = extension_init_data.owner_unit
	self._despawn_sound_event = extension_init_data.despawn_sound_event
	self.wall_index = extension_init_data.wall_index
	self.group_spawn_index = extension_init_data.group_spawn_index
	self._despawning = false
	self._initialized = false
	self.owner_buff_id = nil
	self.world = extension_init_context.world
	self._area_damage_extension = ScriptUnit.extension(self._unit, "area_damage_system")
	local source_talent_extension = ScriptUnit.has_extension(self._owner_unit, "talent_system")

	if source_talent_extension and source_talent_extension:has_talent("kerillian_thorn_sister_debuff_wall") then
		self._is_explosive_wall = true
		local career_extension = ScriptUnit.has_extension(self._owner_unit, "career_system")
		self._owner_career_power_level = career_extension and career_extension:get_career_power_level() or 100
	end

	self._original_rotation = QuaternionBox(Unit.local_rotation(unit, 0))
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[self._owner_unit]
	local side_id = side.side_id

	side_manager:add_unit_to_side(unit, side_id)
end

ThornSisterWallExtension.update = function (self, unit, input, dt, context, t)
	if not self._initialized then
		local life_time = self._life_time
		self._despawn_t = t + life_time
		self._despawn_anim_start_t = t + math.max(life_time - DESPAWN_ANIM_TIME, 0)
		self._initialized = true

		self:trigger_area_damage()
	end

	if not self._despawning and self._despawn_anim_start_t <= t then
		self:despawn()
	end

	if self._is_server and self._despawn_t <= t then
		Managers.state.side:remove_unit_from_side(self._unit)
		Managers.state.unit_spawner:mark_for_deletion(self._unit)
	end
end

ThornSisterWallExtension.trigger_area_damage = function (self)
	self._area_damage_extension:enable(true)

	if self._is_server then
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(self._unit)

		network_manager.network_transmit:send_rpc_clients("rpc_thorn_bush_trigger_area_damage", unit_id)
	end
end

ThornSisterWallExtension.despawn = function (self)
	local owner_unit = self._owner_unit
	local segment_count = 1
	local average_position = Vector3.zero()
	average_position = average_position + POSITION_LOOKUP[self._unit]
	local all_thorn_walls = Managers.state.entity:get_entities("ThornSisterWallExtension")

	if all_thorn_walls then
		local wall_index = self.wall_index
		local death_system = Managers.state.entity:system("death_system")
		local damage_table = {}

		for unit, extension in pairs(all_thorn_walls) do
			if extension.wall_index == wall_index and extension._owner_unit == owner_unit then
				extension._chain_kill = true

				death_system:kill_unit(unit, damage_table)

				average_position = average_position + POSITION_LOOKUP[unit]
				segment_count = segment_count + 1
			end
		end
	end

	if self._is_server and self._despawn_sound_event and (not self.group_spawn_index or self.group_spawn_index == 1) then
		Managers.state.entity:system("audio_system"):play_audio_position_event(self._despawn_sound_event, average_position / segment_count)
	end

	if self._is_server and not self._despawning then
		if self.owner_buff_id then
			local owner_unit = self._owner_unit

			if ALIVE[owner_unit] then
				local owner_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

				if owner_buff_extension then
					owner_buff_extension:remove_buff(self.owner_buff_id)
				end
			end
		end

		self._area_damage_extension:enable(false)
	end

	Unit.flow_event(self._unit, "despawn")

	self._despawning = true
end

ThornSisterWallExtension.die = function (self)
	if not self._despawning then
		self:despawn()

		local t = Managers.time:time("game")
		self._despawn_t = t + DESPAWN_ANIM_TIME
	end
end

ThornSisterWallExtension.owner = function (self)
	return self._owner_unit
end
