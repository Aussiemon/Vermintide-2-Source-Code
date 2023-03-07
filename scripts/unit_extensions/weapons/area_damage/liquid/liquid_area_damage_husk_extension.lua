LiquidAreaDamageHuskExtension = class(LiquidAreaDamageHuskExtension)

LiquidAreaDamageHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self._unit = unit
	self._blobs = {}
	self._world = world
	self._source_attacker_unit = extension_init_data.source_unit
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local template_name = extension_init_data.liquid_template
	local template = LiquidAreaDamageTemplates.templates[template_name]
	self._fx_name_filled = template.fx_name_filled
	self._fx_name_rim = template.fx_name_rim
	self._liquid_area_damage_template = template_name
	self.source_attacker_unit_data = {}
	local source_attacker_unit_data = self.source_attacker_unit_data
	local source_attacker_unit = self._source_attacker_unit

	if source_attacker_unit then
		source_attacker_unit_data.breed = Unit.get_data(source_attacker_unit, "breed")
		local player = Managers.player:owner(source_attacker_unit)

		if player then
			source_attacker_unit_data.attacker_unique_id = player:unique_id()
			source_attacker_unit_data.attacker_side = Managers.state.side.side_by_unit[source_attacker_unit]
		else
			source_attacker_unit_data.attacker_unique_id = nil
			source_attacker_unit_data.attacker_side = nil
		end
	end

	Unit.set_unit_visibility(self._unit, false)

	local sfx_name_start = template.sfx_name_start
	self._sfx_name_start = sfx_name_start
	self._sfx_name_stop = template.sfx_name_stop

	if sfx_name_start then
		WwiseUtils.trigger_unit_event(world, sfx_name_start, unit, 0)
	end

	local init_function = template.init_function

	if init_function then
		local t = Managers.time:time("game")

		LiquidAreaDamageTemplates[init_function](self, t)
	end

	local update_function = template.update_function

	if update_function then
		self._liquid_update_function = LiquidAreaDamageTemplates[update_function]
	end
end

LiquidAreaDamageHuskExtension._get_rotation_from_navmesh = function (self, position)
	local nav_world = self._nav_world
	local success, z, vertex_1, vertex_2, vertex_3 = GwNavQueries.triangle_from_position(nav_world, position, 2, 2)
	local rotation = nil

	if success then
		local v1_to_v2 = Vector3.normalize(vertex_2 - vertex_1)
		local v1_to_v3 = Vector3.normalize(vertex_3 - vertex_1)
		local normal = Vector3.normalize(Vector3.cross(v1_to_v2, v1_to_v3))
		rotation = Quaternion.look(v1_to_v2, normal)
	else
		rotation = Quaternion.identity()
	end

	return rotation
end

LiquidAreaDamageHuskExtension.add_damage_blob = function (self, blob_id, position, is_filled)
	local fx_id = nil
	local fx_name_rim = self._fx_name_rim

	if not script_data.debug_liquid_system and fx_name_rim then
		local rotation = self:_get_rotation_from_navmesh(position)
		fx_id = World.create_particles(self._world, fx_name_rim, position, rotation)
	end

	self._blobs[blob_id] = {
		fx_id = fx_id,
		position = Vector3Box(position),
		full = is_filled
	}

	if is_filled then
		self:set_damage_blob_filled(blob_id)
	end
end

LiquidAreaDamageHuskExtension.set_damage_blob_filled = function (self, blob_id)
	local blob = self._blobs[blob_id]
	local fx_id = blob.fx_id
	local world = self._world

	if fx_id then
		World.stop_spawning_particles(world, fx_id)
	end

	local fx_name_filled = self._fx_name_filled

	if not script_data.debug_liquid_system and fx_name_filled then
		local position = blob.position:unbox()
		local rotation = self:_get_rotation_from_navmesh(position)
		blob.fx_id = World.create_particles(world, fx_name_filled, position, rotation)
	else
		blob.fx_id = nil
	end

	blob.full = true
end

LiquidAreaDamageHuskExtension.remove_damage_blob = function (self, blob_id)
	return
end

LiquidAreaDamageHuskExtension.update = function (self, unit, input, dt, context, t)
	local liquid_update_function = self._liquid_update_function

	if liquid_update_function then
		local result = self:_liquid_update_function(t, dt)

		if not result then
			self._liquid_update_function = nil
		end
	end
end

LiquidAreaDamageHuskExtension.destroy = function (self)
	local world = self._world
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop then
		local liquid_unit = self._unit

		WwiseUtils.trigger_unit_event(world, sfx_name_stop, liquid_unit, 0)
	end

	for blob_id, blob in pairs(self._blobs) do
		local fx_id = blob.fx_id

		if fx_id then
			World.stop_spawning_particles(world, fx_id)
		end
	end
end

LiquidAreaDamageHuskExtension.get_source_attacker_unit = function (self)
	return self._source_attacker_unit
end
