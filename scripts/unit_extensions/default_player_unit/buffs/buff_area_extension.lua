BuffAreaExtension = class(BuffAreaExtension)

BuffAreaExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local entity_manager = extension_init_context.entity_manager
	local world = extension_init_context.world
	local unit_spawner = Managers.state.unit_spawner
	self._unit_spawner = unit_spawner
	self._world = world
	self._unit = unit

	Unit.set_unit_visibility(self._unit, false)

	local t = Managers.time:time("game")
	local life_time = extension_init_data.life_time
	self.life_time = life_time
	self._time_to_remove = t + extension_init_data.life_time
	self.removal_proc_function_name = extension_init_data.removal_proc_function_name
	local position = Unit.world_position(unit, 0)
	local radius = extension_init_data.radius
	self.position = Vector3Box(position)
	self.owner_player = extension_init_data.owner_player
	self.radius = radius
	self.radius_squared = radius * radius

	self:_spawn_los_blocker()
end

BuffAreaExtension.destroy = function (self)
	self:_remove_buff_area()
end

BuffAreaExtension.update = function (self, unit, input, dt, context, t)
	local player = self.owner_player
	local player_unit = player.player_unit
	local duration_ended = false
	local within_distance = false

	if player_unit then
		local player_position = POSITION_LOOKUP[player_unit]
		local distance_squared = Vector3.length_squared(player_position - self.position:unbox())
		duration_ended = self._time_to_remove <= t
		within_distance = distance_squared <= self.radius_squared
	end

	if duration_ended or not within_distance or not player_unit then
		self:_remove_buff_area()
	end
end

BuffAreaExtension._remove_buff_area = function (self)
	ProcFunctions[self.removal_proc_function_name](self.owner_player)

	if Unit.alive(self._unit) then
		self._unit_spawner:mark_for_deletion(self._unit)
	end

	if Unit.alive(self._los_blocker_unit) then
		self._unit_spawner:mark_for_deletion(self._los_blocker_unit)
	end
end

BuffAreaExtension._spawn_los_blocker = function (self)
	local position = self.position:unbox()
	local radius = self.radius
	local unit_name = "units/gameplay/line_of_sight_blocker/hemisphere_los_blocker"
	local unit_template_name = "network_synched_dummy_unit"
	local los_blocker_unit, los_blocker_unit_go_id = self._unit_spawner:spawn_network_unit(unit_name, unit_template_name, nil, position, Quaternion.identity(), nil)

	Unit.set_local_scale(los_blocker_unit, 0, Vector3(radius, radius, radius))

	self._los_blocker_unit = los_blocker_unit
end

return
