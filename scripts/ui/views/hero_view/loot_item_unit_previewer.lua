LootItemUnitPreviewer = class(LootItemUnitPreviewer)
LootItemUnitPreviewer.init = function (self, rewards, spawn_positions, background_world, background_viewport, unique_id)
	self.background_world = background_world
	self.background_viewport = background_viewport
	self.unique_id = unique_id
	self.loaded_packages = {}
	self.packages_to_load = {}
	self.spawn_positions = spawn_positions
	self.rewards = rewards
	self._link_units = self.spawn_link_units(self, rewards)
	self.units_to_spawn = self.load_reward_units(self, rewards)

	return 
end
LootItemUnitPreviewer.destroy = function (self)
	self._destroy_units(self)
	self._unload_packages(self)
	table.clear(self.loaded_packages)
	table.clear(self.packages_to_load)

	return 
end
LootItemUnitPreviewer._destroy_units = function (self)
	local world = self.background_world
	local spawned_units = self._spawned_units

	if spawned_units then
		for _, units in ipairs(spawned_units) do
			for _, unit in ipairs(units) do
				World.destroy_unit(world, unit)
			end
		end

		table.clear(spawned_units)
	end

	local link_units = self._link_units

	for _, link_unit in pairs(link_units) do
		World.destroy_unit(world, link_unit)
	end

	table.clear(link_units)

	self.units_spawned = nil

	return 
end
LootItemUnitPreviewer.update = function (self, dt, t)
	return 
end
LootItemUnitPreviewer.post_update = function (self, dt, t)
	if not self._items_spawned and self._packages_loaded(self) then
		self._present_items(self)

		self._items_spawned = true
	end

	return 
end
LootItemUnitPreviewer.load_reward_units = function (self, rewards)
	if not rewards then
		return 
	end

	local reward_units_to_spawn = {}

	for index, reward_data in ipairs(rewards) do
		local item_key = reward_data.key
		local item_data = ItemMasterList[item_key]
		local item_type = item_data.item_type

		if item_type == "rune" or item_type == "material" or item_type == "ring" or item_type == "necklace" then
			item_key = "trinket_reduce_activated_ability_cooldown"
			item_data = ItemMasterList[item_key]
		end

		local item_template = ItemHelper.get_template_by_item_name(item_key)
		local units_to_spawn_data = {}
		local slot_type = item_data.slot_type

		if slot_type == "melee" or slot_type == "ranged" then
			local left_hand_unit = item_data.left_hand_unit
			local right_hand_unit = item_data.right_hand_unit

			if left_hand_unit then
				local left_unit = left_hand_unit .. "_3p"

				self.load_package(self, left_unit)

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = left_unit,
					unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person.display
				}
			end

			if right_hand_unit then
				local right_unit = right_hand_unit .. "_3p"

				if right_hand_unit ~= left_hand_unit then
					self.load_package(self, right_unit)
				end

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = right_unit,
					unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person.display
				}
			end
		else
			local unit = item_data.unit

			if unit then
				self.load_package(self, unit)

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = unit,
					unit_attachment_node_linking = (slot_type == "trinket" and item_template.attachment_node_linking.slot_trinket_1) or item_template.attachment_node_linking.slot_hat
				}
			end
		end

		reward_units_to_spawn[index] = units_to_spawn_data
	end

	return reward_units_to_spawn
end
LootItemUnitPreviewer._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end

	return 
end
LootItemUnitPreviewer._get_world = function (self)
	return self.background_world, self.background_viewport
end
LootItemUnitPreviewer._get_camera_position = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.position(camera)
end
LootItemUnitPreviewer._get_camera_rotation = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.rotation(camera)
end
LootItemUnitPreviewer._packages_loaded = function (self)
	local units_to_spawn = self.units_to_spawn
	local loaded_packages = self.loaded_packages

	for package_index, package_list in ipairs(units_to_spawn) do
		for index, package_data in ipairs(package_list) do
			if not loaded_packages[package_data.unit_name] then
				return false
			end
		end
	end

	return true
end
LootItemUnitPreviewer.load_package = function (self, package_name)
	if self.packages_to_load[package_name] ~= nil then
		return 
	end

	self.packages_to_load[package_name] = true
	local package_manager = Managers.package
	local cb = callback(self, "_on_load_complete", package_name)
	local reference_name = "LootItemUnitPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	package_manager.load(package_manager, package_name, reference_name, cb, true)

	return 
end
LootItemUnitPreviewer._on_load_complete = function (self, package_name)
	self.loaded_packages[package_name] = true
	self.packages_to_load[package_name] = false

	return 
end
LootItemUnitPreviewer._unload_packages = function (self)
	local reference_name = "LootItemUnitPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	local loaded_packages = self.loaded_packages

	if loaded_packages then
		local package_manager = Managers.package

		for package_name, _ in pairs(loaded_packages) do
			package_manager.unload(package_manager, package_name, reference_name)
		end
	end

	return 
end
LootItemUnitPreviewer.link_units = function (self)
	return self._link_units
end
LootItemUnitPreviewer.reward_units = function (self)
	return self._spawned_units
end
LootItemUnitPreviewer.spawn_link_units = function (self, rewards)
	local link_units = {}
	local spawn_positions = self.spawn_positions

	for index, reward_data in ipairs(rewards) do
		local spawn_position = spawn_positions[index]
		local item_key = reward_data.key
		local item_data = ItemMasterList[item_key]
		local item_type = item_data.item_type

		if item_type == "rune" or item_type == "material" or item_type == "ring" or item_type == "necklace" then
			item_key = "trinket_reduce_activated_ability_cooldown"
		end

		local unit_name = item_data.display_unit

		if not unit_name then
			local item_template = ItemHelper.get_template_by_item_name(item_key)
			unit_name = item_template.display_unit
		end

		local camera_rotation = self._get_camera_rotation(self)
		local camera_forward_vector = Quaternion.forward(camera_rotation)
		local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
		local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), math.pi*1)
		local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
		local camera_position = self._get_camera_position(self)
		local unit_spawn_position = camera_position + camera_forward_vector
		local world = self.background_world
		local link_unit = World.spawn_unit(world, unit_name, unit_spawn_position, unit_spawn_rotation)
		local unit_box, box_dimension = Unit.box(link_unit)
		local unit_center_position = Matrix4x4.translation(unit_box)
		local unit_root_position = Unit.world_position(link_unit, 0)
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
				local scale_fraction = diff/largest_value - 1
				local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

				Unit.set_local_scale(link_unit, 0, scale)

				offset = offset*scale_fraction
			end

			local display_position = unit_spawn_position - offset

			Unit.set_local_position(link_unit, 0, display_position)

			link_units[reward_data.key] = link_unit
		end
	end

	return link_units
end
LootItemUnitPreviewer._present_items = function (self)
	local rewards = self.rewards
	local units_to_spawn = self.units_to_spawn
	local spawned_units = {}
	local units_by_item_key = {}

	for i = 1, #units_to_spawn, 1 do
		local units_data = units_to_spawn[i]
		local units_loaded = true

		for _, data in ipairs(units_data) do
			local unit_name = data.unit_name

			if not self.loaded_packages[unit_name] then
				units_loaded = false

				break
			end
		end

		if units_loaded then
			local item_data = rewards[i]
			local item_key = item_data.key
			local units = self.spawn_units(self, item_key, units_data)
			spawned_units[i] = units
			units_by_item_key[item_key] = units
		end
	end

	self._spawned_units = spawned_units
	self._units_by_item_key = units_by_item_key

	return 
end
LootItemUnitPreviewer.spawn_units = function (self, item_key, spawn_data)
	local units = {}
	local link_unit = self._link_units[item_key]

	if spawn_data and link_unit then
		local scene_graph_links = {}
		local world = self.background_world

		for i = 1, #spawn_data, 1 do
			local spawn_unit_data = spawn_data[i]
			local unit_name = spawn_unit_data.unit_name
			local unit_attachment_node_linking = spawn_unit_data.unit_attachment_node_linking
			local reward_unit = World.spawn_unit(world, unit_name)

			Unit.set_unit_visibility(reward_unit, false)

			units[#units + 1] = reward_unit

			GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, link_unit, reward_unit)
		end

		self.units_spawned = true
	end

	return units
end
LootItemUnitPreviewer.present_item = function (self, item_key)
	local units_by_item_key = self._units_by_item_key

	if units_by_item_key then
		local link_unit = self._link_units[item_key]
		local units = units_by_item_key[item_key]

		for _, unit in ipairs(units) do
			if unit and Unit.alive(unit) then
				Unit.set_unit_visibility(unit, true)

				local reward_unit_event = "lua_presentation"

				self._trigger_unit_flow_event(self, unit, reward_unit_event)
			end
		end

		Unit.flow_event(link_unit, "lua_spin_no_fx")
	end

	return 
end
LootItemUnitPreviewer._enable_reward_units_visibility = function (self)
	local spawned_units = self._spawned_units

	for _, unit in ipairs(spawned_units) do
		if unit and Unit.alive(unit) then
			Unit.set_unit_visibility(unit, true)

			local reward_unit_event = "lua_presentation"

			self._trigger_unit_flow_event(self, unit, reward_unit_event)
		end
	end

	return 
end

return 
