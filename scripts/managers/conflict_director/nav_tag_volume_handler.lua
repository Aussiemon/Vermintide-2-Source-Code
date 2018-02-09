NavTagVolumeHandler = class(NavTagVolumeHandler)
NavTagVolumeHandler.init = function (self, world, nav_world)
	self.world = world
	self.nav_world = nav_world
	self.mappings_available = false
	self.created_tag_volumes = {}
	self.level_volumes_by_layer = {}
	self.mapping_lookup_table = {}
	self._runtime_volume_index = 1
	self._volume_lookup_id = 1
	self.mappings = {}
	local level_settings = LevelHelper:current_level_settings(world)
	local file_path = level_settings.level_name .. "_nav_tag_volumes"

	if Application.can_get("lua", file_path) then
		local mappings = require(file_path)
		self.mappings = table.clone(mappings.nav_tag_volumes)
		self.mappings_available = true

		for level_volume_name, tag_volume_data in pairs(self.mappings) do
			self.mapping_lookup_table[self._volume_lookup_id] = level_volume_name
			self.mapping_lookup_table[level_volume_name] = self._volume_lookup_id
			self._volume_lookup_id = self._volume_lookup_id + 1

			if tag_volume_data.layer_name ~= "undefined" then
				self.create_tag_volume_from_mappings(self, level_volume_name)
			end
		end
	end

	return 
end
NavTagVolumeHandler.create_tag_volume_from_mappings = function (self, level_volume_name)
	if self.created_tag_volumes[level_volume_name] then
		return 
	end

	local a, b, c = Script.temp_count()

	assert(self.mappings_available, "[NavTagVolumeHandler] Current level requires world_nav_tag_volumes.lua to be located in the level directory. Run SpawnGenerator in the level editor to export it!")

	local mapping = self.mappings[level_volume_name]

	fassert(mapping, "[NavTagVolumeHandler] Level volume %q could not be found in world_nav_tag_volumes.lua. Run SpawnGenerator in the level editor to export it!", level_volume_name)

	local bottom_points = mapping.bottom_points
	local point_table = {}

	for i = 1, #bottom_points, 1 do
		local point = bottom_points[i]
		point_table[i] = Vector3(point[1], point[2], point[3])
	end

	local color = Color(mapping.color[1], mapping.color[2], mapping.color[3], mapping.color[4])
	local layer_id = LAYER_ID_MAPPING[mapping.layer_name]
	local tag_volume = GwNavTagVolume.create(self.nav_world, point_table, mapping.alt_min, mapping.alt_max, false, color, layer_id, -1, self.mapping_lookup_table[level_volume_name])

	GwNavTagVolume.add_to_world(tag_volume)

	self.created_tag_volumes[level_volume_name] = tag_volume
	local volumes = self.level_volumes_by_layer[mapping.layer_name] or {}
	volumes[#volumes + 1] = level_volume_name
	self.level_volumes_by_layer[mapping.layer_name] = volumes

	Script.set_temp_count(a, b, c)

	return 
end
NavTagVolumeHandler.create_mapping = function (self, pos, size, layer_name)
	local volume_name = "runtime_volume_" .. self._runtime_volume_index

	assert(not self.mappings[volume_name], string.format("[NavTagVolumeHandler] There is already a nav tag volume called %s registered", volume_name))

	local mapping = {}
	local left = pos + Vector3(-size, 0, 0)
	local left_down = pos + Vector3.normalize(Vector3(-size, -size, 0))*size
	local down = pos + Vector3(0, -size, 0)
	local down_right = pos + Vector3.normalize(Vector3(size, -size, 0))*size
	local right = pos + Vector3(size, 0, 0)
	local up_right = pos + Vector3.normalize(Vector3(size, size, 0))*size
	local up = pos + Vector3(0, size, 0)
	local up_left = pos + Vector3.normalize(Vector3(-size, size, 0))*size
	mapping.bottom_points = {
		{
			left[1],
			left[2],
			left[3]
		},
		{
			left_down[1],
			left_down[2],
			left_down[3]
		},
		{
			down[1],
			down[2],
			down[3]
		},
		{
			down_right[1],
			down_right[2],
			down_right[3]
		},
		{
			right[1],
			right[2],
			right[3]
		},
		{
			up_right[1],
			up_right[2],
			up_right[3]
		},
		{
			up[1],
			up[2],
			up[3]
		},
		{
			up_left[1],
			up_left[2],
			up_left[3]
		}
	}
	mapping.color = {
		255,
		255,
		255,
		255
	}
	mapping.layer_name = layer_name
	mapping.alt_min = pos[3] - size
	mapping.alt_max = pos[3] + size
	self.mappings[volume_name] = mapping
	self.mapping_lookup_table[self._volume_lookup_id] = volume_name
	self.mapping_lookup_table[volume_name] = self._volume_lookup_id

	if script_data.debug_volume then
		QuickDrawerStay:reset()

		for i = 1, #mapping.bottom_points, 1 do
			if i == #mapping.bottom_points then
				local pos1 = Vector3(mapping.bottom_points[i][1], mapping.bottom_points[i][2], mapping.bottom_points[i][3] + 0.05)
				local pos2 = Vector3(mapping.bottom_points[1][1], mapping.bottom_points[1][2], mapping.bottom_points[1][3] + 0.05)

				QuickDrawerStay:line(pos1, pos2, Color(0, 255, 0))
			else
				local pos1 = Vector3(mapping.bottom_points[i][1], mapping.bottom_points[i][2], mapping.bottom_points[i][3] + 0.05)
				local pos2 = Vector3(mapping.bottom_points[i + 1][1], mapping.bottom_points[i + 1][2], mapping.bottom_points[i + 1][3] + 0.05)

				QuickDrawerStay:line(pos1, pos2, Color(0, 255, 0))
			end
		end
	end

	self._runtime_volume_index = self._runtime_volume_index + 1
	self._volume_lookup_id = self._volume_lookup_id + 1

	return volume_name
end
NavTagVolumeHandler.get_mapping_from_lookup_id = function (self, lookup_id)
	local volume_name = self.mapping_lookup_table[lookup_id]

	return volume_name and self.mappings[volume_name]
end
NavTagVolumeHandler.destroy_nav_tag_volume = function (self, volume_name)
	assert(self.mappings[volume_name], string.format("[NavTagVolumeHandler] There is not nav tag volume MAPPING with that name (%s)", volume_name))
	assert(self.created_tag_volumes[volume_name], string.format("[NavTagVolumeHandler] There is not NAV TAG VOLUME with that name (%s)", volume_name))

	local lookup_id = self.mapping_lookup_table[volume_name]
	local tag_volume = self.created_tag_volumes[volume_name]

	GwNavTagVolume.destroy(tag_volume)

	self.mappings[volume_name] = nil
	self.created_tag_volumes[volume_name] = nil
	self.mapping_lookup_table[volume_name] = nil
	self.mapping_lookup_table[lookup_id] = nil

	return 
end
NavTagVolumeHandler.set_mapping_layer_name = function (self, level_volume_name, layer_name)
	assert(self.mappings_available, "[NavTagVolumeHandler] Current level requires world_nav_tag_volumes.lua to be located in the level directory. Run SpawnGenerator in the level editor to export it!")

	local mapping = self.mappings[level_volume_name]

	fassert(mapping, "[NavTagVolumeHandler] Level volume %q could not be found in world_nav_tag_volumes.lua. Run SpawnGenerator in the level editor to export it!", level_volume_name)

	mapping.layer_name = layer_name

	return 
end
NavTagVolumeHandler.destroy = function (self)
	for _, tag_volume in pairs(self.created_tag_volumes) do
		GwNavTagVolume.destroy(tag_volume)
	end

	self.created_tag_volumes = nil
	self.level_volumes_by_layer = nil

	return 
end

return 
