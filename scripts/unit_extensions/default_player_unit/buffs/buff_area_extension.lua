-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/buff_area_extension.lua

BuffAreaExtension = class(BuffAreaExtension)

BuffAreaExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local unit_spawner = Managers.state.unit_spawner

	self._unit_spawner = unit_spawner
	self._world = world
	self._unit = unit

	Unit.set_unit_visibility(self._unit, false)

	local t = Managers.time:time("game")
	local template = extension_init_data.sub_buff_template

	self._duration = t + (template.duration or math.huge)
	self.sub_buff_id = extension_init_data.sub_buff_id
	self.template = template

	local radius = extension_init_data.radius

	self.owner_unit = extension_init_data.owner_unit
	self.source_unit = extension_init_data.source_unit
	self.radius = radius
	self.radius_squared = radius * radius
	self._buff_area_system = extension_init_context.owning_system
	self._unlimited = self.template.unlimited

	local side_by_unit = Managers.state.side.side_by_unit

	self.side = side_by_unit[self.source_unit] or side_by_unit[self.owner_unit]
	self._buff_allies = template.buff_allies
	self._buff_enemies = template.buff_enemies
	self._buff_self = template.buff_self
	self._wwise_world = Managers.world:wwise_world(world)
	self._area_start_sfx = template.area_start_sfx
	self._area_end_sfx = template.area_end_sfx
	self._enter_area_sfx = template.enter_area_sfx
	self._leave_area_sfx = template.leave_area_sfx

	if template.area_start_sfx then
		self:_play_unit_audio()
	end

	self:_spawn_particles()

	self._is_server = Managers.state.network.is_server

	if self._is_server then
		self:_spawn_los_blocker()
	end

	self._buff_ids = {}
end

BuffAreaExtension.game_object_initialized = function (self, unit, go_id)
	self._is_owner = GameSession.game_object_owned(Managers.state.network:game(), go_id)
end

BuffAreaExtension.destroy = function (self)
	if self._is_server and Unit.alive(self._los_blocker_unit) then
		self._unit_spawner:mark_for_deletion(self._los_blocker_unit)

		self._los_blocker_unit = nil
	end

	if self._is_owner then
		local game = Managers.state.network:game()

		if game then
			self:_cleanup_inside_units()
		end
	end

	if self._leave_area_sfx then
		self:play_leave_buff_zone_sfx()
	end

	if self._area_end_sfx then
		self:_stop_unit_audio()
	end

	self:_destroy_particles()
end

BuffAreaExtension._cleanup_inside_units = function (self)
	local inside = self._buff_area_system:inside_by_area(self)
	local by_position = inside.by_position

	for inside_unit in pairs(by_position) do
		self:_set_not_inside(by_position, inside_unit)
	end

	local by_broadphase = inside.by_broadphase

	for inside_unit in pairs(by_broadphase) do
		self:_set_not_inside(by_broadphase, inside_unit)
	end
end

BuffAreaExtension.update = function (self, unit, input, dt, context, t)
	if not self._is_owner then
		return
	end

	if self._duration and t > self._duration then
		self:_remove_unit()
		self:_cleanup_inside_units()

		return
	end

	local position = POSITION_LOOKUP[unit]
	local radius = self.radius

	if self._buff_allies or self._buff_enemies then
		self:_check_ai(position, radius)
	end

	self:_check_players(position, radius)
end

BuffAreaExtension._check_ai = function (self, position, radius)
	local source_unit = self.source_unit or self.owner_unit
	local inside = self._buff_area_system:inside_by_area(self).by_broadphase
	local buff_allies = self._buff_allies
	local buff_enemies = self._buff_enemies
	local side_manager = Managers.state.side
	local ai_units = FrameTable.alloc_table()
	local inside_this_frame = FrameTable.alloc_table()
	local num_ai = AiUtils.broadphase_query(position, radius, ai_units)

	for i = 1, num_ai do
		local ai_unit = ai_units[i]

		inside_this_frame[ai_unit] = true

		local already_inside = inside[ai_unit]

		if not already_inside then
			local should_buff = buff_allies and side_manager:is_ally(source_unit, ai_unit) or buff_enemies and side_manager:is_enemy(source_unit, ai_unit)

			if should_buff then
				self:_set_inside(inside, ai_unit)
			end
		end
	end

	for ai_unit in pairs(inside) do
		if not inside_this_frame[ai_unit] then
			self:_set_not_inside(inside, ai_unit)
		end
	end
end

BuffAreaExtension._check_players = function (self, position)
	local inside_this_frame = FrameTable.alloc_table()

	if self._buff_self then
		local unit = self.source_unit or self.owner_unit

		inside_this_frame[unit] = self:_update_by_position(unit)
	end

	local side = self.side

	if self._buff_allies then
		local player_units = side.PLAYER_AND_BOT_UNITS

		for i = 1, #player_units do
			local unit = player_units[i]

			inside_this_frame[unit] = self:_update_by_position(unit)
		end
	end

	if self._buff_enemies then
		local player_units = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #player_units do
			local unit = player_units[i]

			inside_this_frame[unit] = self:_update_by_position(unit)
		end
	end

	local inside = self._buff_area_system:inside_by_area(self).by_position

	for unit in pairs(inside) do
		if not inside_this_frame[unit] then
			self:_set_not_inside(inside, unit)
		end
	end
end

BuffAreaExtension._update_by_position = function (self, unit)
	local inside = self._buff_area_system:inside_by_area(self).by_position
	local within_distance = false
	local unit_pos = POSITION_LOOKUP[unit]

	if unit_pos then
		local own_pos = POSITION_LOOKUP[self._unit]
		local distance_squared = Vector3.length_squared(own_pos - unit_pos)

		within_distance = distance_squared <= self.radius_squared
	end

	if within_distance then
		self:_set_inside(inside, unit)
	else
		self:_set_not_inside(inside, unit)
	end

	return within_distance
end

BuffAreaExtension.set_unit_position = function (self, position)
	Unit.set_local_position(self._unit, 0, position)
end

BuffAreaExtension.set_duration = function (self, duration)
	local t = Managers.time:time("game")

	self._duration = t + duration
end

BuffAreaExtension._leave_func = function (self, leaving_unit)
	if not self._unlimited then
		local buff_system = Managers.state.entity:system("buff_system")
		local area_buff_id = self._buff_ids[leaving_unit]

		buff_system:remove_buff_synced(leaving_unit, area_buff_id)

		self._buff_ids[leaving_unit] = nil
	end

	local player_owner = Managers.player:owner(leaving_unit)
	local peer_id = player_owner and player_owner:network_id()
	local go_id = self._unit and Managers.state.unit_storage:go_id(self._unit)

	if self._leave_area_sfx and peer_id and go_id then
		Managers.state.network.network_transmit:send_rpc("rpc_play_leave_buff_zone_sfx", peer_id, go_id)
	end
end

BuffAreaExtension._enter_func = function (self, entering_unit)
	local buff_system = Managers.state.entity:system("buff_system")
	local template = self.template
	local buff_name = template.buff_area_buff
	local sync_type = template.buff_sync_type or BuffSyncType.Local
	local params = FrameTable.alloc_table()
	local source_unit = self.source_unit

	params.attacker_unit = source_unit
	params.source_attacker_unit = source_unit

	local player_owner = Managers.player:owner(entering_unit)
	local peer_id = player_owner and player_owner:network_id()
	local go_id = self._unit and Managers.state.unit_storage:go_id(self._unit)

	if self._leave_area_sfx and peer_id and go_id then
		Managers.state.network.network_transmit:send_rpc("rpc_play_enter_buff_zone_sfx", peer_id, go_id)
	end

	if (sync_type == BuffSyncType.Client or sync_type == BuffSyncType.ClientAndServer) and not peer_id then
		return
	end

	self._buff_ids[entering_unit] = buff_system:add_buff_synced(entering_unit, buff_name, sync_type, params, peer_id)
end

BuffAreaExtension._remove_unit = function (self)
	if ALIVE[self._unit] then
		self._unit_spawner:mark_for_deletion(self._unit)

		self._unit = nil
	end
end

BuffAreaExtension._spawn_los_blocker = function (self)
	local position = Unit.world_position(self._unit, 0)
	local radius = self.radius
	local unit_name = "units/gameplay/line_of_sight_blocker/hemisphere_los_blocker"
	local unit_template_name = "network_synched_dummy_unit"
	local los_blocker_unit, los_blocker_unit_go_id = self._unit_spawner:spawn_network_unit(unit_name, unit_template_name, nil, position, Quaternion.identity(), nil)

	Unit.set_local_scale(los_blocker_unit, 0, Vector3(radius, radius, radius))

	self._los_blocker_unit = los_blocker_unit
end

BuffAreaExtension._set_inside = function (self, inside_table, unit)
	local refs = inside_table[unit] or {}

	inside_table[unit] = refs

	local first_ref = table.is_empty(refs)

	refs[self] = true

	if first_ref then
		self:_enter_func(unit)
	end
end

BuffAreaExtension._set_not_inside = function (self, inside_table, unit)
	local refs = inside_table[unit]

	if refs and refs[self] then
		refs[self] = nil

		if table.is_empty(refs) then
			inside_table[unit] = nil

			self:_leave_func(unit)
		end
	end
end

BuffAreaExtension._spawn_particles = function (self)
	local template = self.template
	local particles = template.buff_area_particles

	if not particles then
		return
	end

	local is_first_person = false

	self._particle_datas = BuffUtils.create_attached_particles(self._world, particles, self._unit, is_first_person)
end

BuffAreaExtension._destroy_particles = function (self)
	local particle_datas = self._particle_data

	if not particle_datas then
		return
	end

	BuffUtils.destroy_attached_particles(self._world, particle_datas)
end

BuffAreaExtension._play_unit_audio = function (self)
	self._unit_source_id = WwiseWorld.make_manual_source(self._wwise_world, POSITION_LOOKUP[self._unit])

	WwiseWorld.trigger_event(self._wwise_world, self._area_start_sfx, self._unit_source_id)
end

BuffAreaExtension._stop_unit_audio = function (self)
	if self._unit_source_id then
		WwiseWorld.trigger_event(self._wwise_world, self._area_end_sfx, true, self._unit_source_id)
		WwiseWorld.destroy_manual_source(self._wwise_world, self._unit_source_id)
	end
end

BuffAreaExtension.play_enter_buff_zone_sfx = function (self)
	self._inside_zone_audio_id = WwiseUtils.make_unit_auto_source(self._world, self._unit)

	WwiseWorld.trigger_event(self._wwise_world, self._enter_area_sfx, true, self._inside_zone_audio_id)
end

BuffAreaExtension.play_leave_buff_zone_sfx = function (self)
	if self._inside_zone_audio_id then
		WwiseWorld.trigger_event(self._wwise_world, self._leave_area_sfx, true, self._inside_zone_audio_id)

		self._inside_zone_audio_id = nil
	end
end
