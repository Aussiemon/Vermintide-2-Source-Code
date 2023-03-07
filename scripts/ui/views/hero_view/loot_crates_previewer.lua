LootCratesPreviewer = class(LootCratesPreviewer)

LootCratesPreviewer.init = function (self, rewards, units, spawn_positions, end_positions, background_world, background_viewport)
	self.background_world = background_world
	self.background_viewport = background_viewport
	self.spawn_positions = spawn_positions
	self.end_positions = end_positions
	self.units = units
	self._rewards = rewards
	self._spawned_units = self:spawn_units(units)
	local item_key_by_unit = {}

	for index, item_data in ipairs(rewards) do
		local item_key = item_data.key
		local unit = self._spawned_units[index]
		item_key_by_unit[unit] = item_key
	end

	self._item_key_by_unit = item_key_by_unit
end

LootCratesPreviewer.destroy = function (self)
	self:_destroy_units()
end

LootCratesPreviewer._destroy_units = function (self)
	local world = self.background_world
	local spawned_units = self._spawned_units

	if spawned_units then
		for _, unit in ipairs(spawned_units) do
			World.destroy_unit(world, unit)
		end
	end

	self.units_spawned = nil
end

LootCratesPreviewer.update = function (self, dt, t)
	return
end

LootCratesPreviewer.post_update = function (self, dt, t)
	if not self._entry_animation_complete then
		self:_animate_entry_positions(dt, t)
	end
end

LootCratesPreviewer._animate_entry_positions = function (self, dt, t)
	local spawn_positions = self.spawn_positions
	local end_positions = self.end_positions
	local progress_multiplier = 1
	local entry_progress = self._entry_progress or 0
	entry_progress = math.min(entry_progress + dt * progress_multiplier, 1)
	local anim_progress = math.easeInCubic(entry_progress)
	local world = self.background_world
	local spawned_units = self._spawned_units
	local entry_animation_complete = true

	for index, unit in ipairs(spawned_units) do
		local end_position = end_positions[index]
		local spawn_position = spawn_positions[index]
		local unit_position = Unit.local_position(unit, 0)
		local distance_total = spawn_position[3] - end_position[3]
		local distance_left = unit_position[3] - end_position[3]
		local new_position_y = spawn_position[3] - anim_progress * distance_total
		unit_position[3] = new_position_y

		Unit.set_local_position(unit, 0, unit_position)
	end

	if entry_progress == 1 then
		self._entry_animation_complete = true
	end

	self._entry_progress = entry_progress
end

LootCratesPreviewer._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

LootCratesPreviewer._get_world = function (self)
	return self.background_world, self.background_viewport
end

LootCratesPreviewer._get_camera_position = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.position(camera)
end

LootCratesPreviewer._get_camera_rotation = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.rotation(camera)
end

LootCratesPreviewer.get_units = function (self)
	return self._spawned_units
end

LootCratesPreviewer.has_units = function (self)
	local units_left = self._spawned_units and #self._spawned_units > 0

	return units_left
end

LootCratesPreviewer.get_item_key_by_unit = function (self, unit)
	return self._item_key_by_unit[unit]
end

LootCratesPreviewer.delete_unit = function (self, unit)
	local world = self.background_world
	local spawned_units = self._spawned_units

	for index, spawned_unit in ipairs(spawned_units) do
		if unit == spawned_unit then
			table.remove(spawned_units, index)
			World.destroy_unit(world, spawned_unit)

			return
		end
	end
end

LootCratesPreviewer.spawn_units = function (self, units_name)
	local units = {}
	local spawn_positions = self.spawn_positions

	if units_name then
		local scene_graph_links = {}
		local world = self.background_world

		for i = 1, #units_name do
			local spawn_position = spawn_positions[i]
			local unit_name = units_name[i]
			local unit = World.spawn_unit(world, unit_name)
			local camera_rotation = self:_get_camera_rotation()
			local camera_forward_vector = Quaternion.forward(camera_rotation)
			local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
			local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), math.pi * 1)
			local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
			local camera_position = self:_get_camera_position()
			local unit_spawn_position = Vector3(spawn_position[1], spawn_position[2], spawn_position[3])
			local unit_box, box_dimension = Unit.box(unit)
			local unit_center_position = Matrix4x4.translation(unit_box)
			local unit_root_position = Unit.world_position(unit, 0)
			local offset = unit_center_position - unit_root_position

			if box_dimension then
				local max_value = 0.3
				local largest_value = 0

				if largest_value < box_dimension.x then
					largest_value = box_dimension.x
				end

				if largest_value < box_dimension.z then
					largest_value = box_dimension.z
				end

				if largest_value < box_dimension.y then
					largest_value = box_dimension.y
				end

				if max_value < largest_value then
					local diff = largest_value - max_value
					local scale_fraction = 1 - diff / largest_value
					local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

					Unit.set_local_scale(unit, 0, scale)

					offset = offset * scale_fraction
				end

				local display_position = unit_spawn_position - offset

				Unit.set_local_position(unit, 0, display_position)
			end

			Unit.set_unit_visibility(unit, true)

			units[#units + 1] = unit
		end

		self.units_spawned = true
	end

	return units
end

LootCratesPreviewer._enable_units_visibility = function (self)
	local spawned_units = self._spawned_units

	for _, unit in ipairs(spawned_units) do
		if unit and Unit.alive(unit) then
			Unit.set_unit_visibility(unit, true)

			local unit_event = "lua_presentation"

			self:_trigger_unit_flow_event(unit, unit_event)
		end
	end
end
