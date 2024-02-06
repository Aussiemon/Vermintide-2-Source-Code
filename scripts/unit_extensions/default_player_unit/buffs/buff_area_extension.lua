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

	self.removal_proc_function_name = extension_init_data.removal_proc_function_name
	self.add_proc_function_name = extension_init_data.add_proc_function_name
	self._duration = t + (extension_init_data.duration or math.huge)

	local template = extension_init_data.sub_buff_template

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

	self:_spawn_los_blocker()
end

BuffAreaExtension.destroy = function (self)
	if Unit.alive(self._los_blocker_unit) then
		self._unit_spawner:mark_for_deletion(self._los_blocker_unit)

		self._los_blocker_unit = nil
	end

	local game = Managers.state.network:game()

	if game then
		self:_cleanup_inside_units()
	end
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

BuffAreaExtension._leave_func = function (self, unit)
	if not self._unlimited then
		ProcFunctions[self.removal_proc_function_name](unit, self.owner_unit, self.template, self._unit, self.source_unit)
	end
end

BuffAreaExtension._enter_func = function (self, unit)
	ProcFunctions[self.add_proc_function_name](unit, self.owner_unit, self.template, self._unit, self.source_unit)
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
