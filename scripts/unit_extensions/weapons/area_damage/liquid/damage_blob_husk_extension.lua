DamageBlobHuskExtension = class(DamageBlobHuskExtension)
DamageBlobHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._source_unit = extension_init_data.source_unit
	local unit_storage = Managers.state.unit_storage
	self.go_id = unit_storage.go_id(unit_storage, unit)
	self.fx_list = {}
	self.sfx_list = {}
	local template_name = extension_init_data.damage_blob_template_name
	local template = DamageBlobTemplates.templates[template_name]
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_rim = template.fx_name_rim
	self.fx_size_variable = template.fx_size_variable
	self.fx_max_height = template.fx_max_height
	self.fx_max_radius = template.fx_max_radius
	self.blob_life_time = template.blob_life_time
	self._sfx_name_stop = template.sfx_name_stop
	self._sfx_name_start_remains = template.sfx_name_start_remains
	self._sfx_name_stop_remains = template.sfx_name_stop_remains
	local init_function = template.init_function

	if init_function then
		local t = Managers.time:time("game")

		DamageBlobTemplates[init_function](self, t)
	end

	local update_function = template.update_function

	if update_function then
		self._blob_update_function = DamageBlobTemplates[update_function]
	end

	local sfx_name_start = template.sfx_name_start

	if sfx_name_start then
		WwiseUtils.trigger_unit_event(world, sfx_name_start, unit, 0)
	end

	return 
end
DamageBlobHuskExtension.destroy = function (self)
	local world = self.world
	local fx_list = self.fx_list

	for i = 1, #fx_list, 1 do
		local fx_id = fx_list[i].id

		World.stop_spawning_particles(world, fx_id)

		fx_list[i] = nil
	end

	local unit = self.unit
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop and Unit.alive(unit) then
		WwiseUtils.trigger_unit_event(world, sfx_name_stop, unit, 0)
	end

	local wwise_world = Managers.world:wwise_world(world)
	local sfx_list = self.sfx_list

	for i = 1, #sfx_list, 1 do
		local sfx_id = sfx_list[i].source
		local has_source = WwiseWorld.has_source(wwise_world, sfx_id)

		if has_source then
			WwiseWorld.trigger_event(wwise_world, self._sfx_name_stop_remains, sfx_id)
		end

		sfx_list[i] = nil
	end

	self.aborted = true

	return 
end
DamageBlobHuskExtension.update = function (self, unit, input, dt, context, t)
	local game = self.game
	local go_id = self.go_id
	local position = GameSession.game_object_field(game, go_id, "position")

	Unit.set_local_position(unit, 0, position)

	local rotation = GameSession.game_object_field(game, go_id, "rotation")

	Unit.set_local_rotation(unit, 0, rotation)
	self.update_blobs_fx_and_sfx(self, t, dt)

	local blob_update_function = self._blob_update_function

	if blob_update_function then
		local result = self._blob_update_function(self, t, dt, unit)

		if not result then
			self._blob_update_function = nil
		end
	end

	return 
end
DamageBlobHuskExtension.update_blobs_fx_and_sfx = function (self, t, dt)
	local world = self.world
	local fx_name_filled = self.fx_name_filled
	local fx_size_variable = self.fx_size_variable
	local fx_max_radius = self.fx_max_radius
	local fx_max_height = self.fx_max_height
	local fx_list = self.fx_list

	for i = 1, #fx_list, 1 do
		local fx_entry = fx_list[i]
		local fx_id = fx_entry.id
		local fx_size = fx_entry.size

		if fx_size then
			local particle_size = fx_size.unbox(fx_size)
			particle_size[1] = math.min(particle_size[1] + dt * 1.5, fx_max_radius)
			particle_size[2] = math.min(particle_size[2] + dt * 2, fx_max_height)
			local effect_variable_id = World.find_particles_variable(world, fx_name_filled, fx_size_variable)

			World.set_particles_variable(world, fx_id, effect_variable_id, particle_size)
			fx_size.store(fx_size, particle_size)
		end

		local fx_time = fx_entry.time

		if fx_time < t then
			World.stop_spawning_particles(world, fx_id)
		end
	end

	local sfx_list = self.sfx_list
	local sfx_name_stop_remains = self._sfx_name_stop_remains
	local wwise_world = Managers.world:wwise_world(self.world)

	for i = 1, #sfx_list, 1 do
		local sfx_entry = sfx_list[i]
		local sfx_source = sfx_entry.source
		local has_source = WwiseWorld.has_source(wwise_world, sfx_source)
		local sfx_time = sfx_entry.time

		if sfx_time < t and has_source then
			WwiseWorld.trigger_event(wwise_world, sfx_name_stop_remains, sfx_source)
		end
	end

	return 
end
DamageBlobHuskExtension.add_damage_blob_fx = function (self, position, life_time_percentage)
	local unit = self.unit
	local world = self.world
	local rotation = Unit.local_rotation(unit, 0)
	local t = Managers.time:time("game")
	local blob_full_life_time = self.blob_life_time
	local blob_life_time = life_time_percentage * blob_full_life_time
	local time_past = math.max(blob_full_life_time - blob_life_time, 0)
	local blob_death_time = t + blob_life_time
	local particle_size = Vector3Box(0.6, 1.2, 0)
	local fx_max_radius = self.fx_max_radius
	local fx_max_height = self.fx_max_height
	particle_size[1] = math.min(particle_size[1] + time_past * 1.5, fx_max_radius)
	particle_size[2] = math.min(particle_size[2] + time_past * 2, fx_max_height)

	print(life_time_percentage, blob_life_time)

	local fx_list = self.fx_list
	local fx_id_filled = World.create_particles(world, self.fx_name_filled, position, rotation)
	fx_list[#fx_list + 1] = {
		id = fx_id_filled,
		time = blob_death_time,
		size = particle_size
	}
	local fx_id_rim = World.create_particles(world, self.fx_name_rim, position, rotation)
	fx_list[#fx_list + 1] = {
		id = fx_id_rim,
		time = blob_death_time
	}
	local id, source = WwiseUtils.trigger_position_event(world, self._sfx_name_start_remains, position)
	local sfx_list = self.sfx_list
	sfx_list[#sfx_list + 1] = {
		source = source,
		time = blob_death_time
	}

	return 
end
DamageBlobHuskExtension.abort = function (self)
	local unit = self.unit
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop and Unit.alive(unit) then
		WwiseUtils.trigger_unit_event(self.world, sfx_name_stop, unit, 0)
	end

	self.aborted = true

	return 
end

return 
