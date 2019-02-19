LootItemUnitPreviewer = class(LootItemUnitPreviewer)

LootItemUnitPreviewer.init = function (self, reward, spawn_position, background_world, background_viewport, unique_id)
	self.background_world = background_world
	self.background_viewport = background_viewport
	self.unique_id = unique_id
	self.loaded_packages = {}
	self.packages_to_load = {}
	self.spawn_position = spawn_position
	self.reward = reward
	self._link_units = self:spawn_link_units(reward)
	self.units_to_spawn = self:load_reward_units(reward)
end

LootItemUnitPreviewer.register_spawn_callback = function (self, callback)
	self._spawn_callback = callback
end

LootItemUnitPreviewer.destroy = function (self)
	self:_destroy_units()
	self:_unload_packages()
	table.clear(self.loaded_packages)
	table.clear(self.packages_to_load)
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
end

LootItemUnitPreviewer.update = function (self, dt, t)
	return
end

LootItemUnitPreviewer.post_update = function (self, dt, t)
	if not self._items_spawned and self:_packages_loaded() then
		self:_spawn_items()

		self._items_spawned = true

		if self._spawn_callback then
			self._spawn_callback()

			self._spawn_callback = nil
		end
	end
end

LootItemUnitPreviewer.load_reward_units = function (self, reward)
	if not reward then
		return
	end

	local reward_units_to_spawn = {}
	local reward_data = reward.data
	local backend_id = reward.backend_id
	local item_skin = reward.skin
	local item_key = reward_data.key
	local item_data = ItemMasterList[item_key]
	local item_template = nil
	local item_type = item_data.item_type

	if item_type == "rune" or item_type == "material" or item_type == "ring" or item_type == "necklace" then
		item_key = "trinket_reduce_activated_ability_cooldown"
		item_data = ItemMasterList[item_key]
	elseif item_type == "weapon_skin" then
		local matching_item_key = item_data.matching_item_key
		item_template = ItemHelper.get_template_by_item_name(matching_item_key)
	end

	item_template = item_template or ItemHelper.get_template_by_item_name(item_key)
	local item_units = BackendUtils.get_item_units(item_data, backend_id, item_skin)
	local units_to_spawn_data = {}
	local slot_type = item_data.slot_type

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local material_settings = item_units.material_settings

		if left_hand_unit then
			local left_unit = left_hand_unit .. "_3p"

			self:load_package(left_unit)

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = left_unit,
				unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person.display,
				material_settings = material_settings
			}
		end

		if right_hand_unit then
			local right_unit = right_hand_unit .. "_3p"

			if right_hand_unit ~= left_hand_unit then
				self:load_package(right_unit)
			end

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = right_unit,
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person.display,
				material_settings = material_settings
			}
		end
	else
		local unit = item_units.unit

		if unit then
			self:load_package(unit)

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = unit,
				unit_attachment_node_linking = (slot_type == "trinket" and item_template.attachment_node_linking.slot_trinket_1) or item_template.attachment_node_linking.slot_hat
			}
		end
	end

	reward_units_to_spawn[1] = units_to_spawn_data

	return reward_units_to_spawn
end

LootItemUnitPreviewer._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
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

	package_manager:load(package_name, reference_name, cb, true)
end

LootItemUnitPreviewer._on_load_complete = function (self, package_name)
	self.loaded_packages[package_name] = true
	self.packages_to_load[package_name] = false
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
			package_manager:unload(package_name, reference_name)
		end
	end
end

LootItemUnitPreviewer.link_units = function (self)
	return self._link_units
end

LootItemUnitPreviewer.reward_units = function (self)
	return self._spawned_units
end

LootItemUnitPreviewer.spawn_link_units = function (self, reward)
	local link_units = {}
	local reward_data = reward.data
	local item_key = reward_data.key
	local backend_id = reward.backend_id
	local item_skin = reward.skin or item_key
	local spawn_position = self.spawn_position
	local item_data = ItemMasterList[item_key]
	local item_type = item_data.item_type

	if item_type == "rune" or item_type == "material" or item_type == "ring" or item_type == "necklace" then
		item_key = "trinket_reduce_activated_ability_cooldown"
	end

	local unit_name = item_data.display_unit

	if item_type == "weapon_skin" then
		local skin_template = WeaponSkins.skins[item_skin]
		unit_name = skin_template.display_unit
	elseif not unit_name then
		local item_template = ItemHelper.get_template_by_item_name(item_key)
		unit_name = item_template.display_unit
	end

	local camera_rotation = self:_get_camera_rotation()
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), math.pi * 1)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local camera_position = self:_get_camera_position()
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
			local scale_fraction = 1 - diff / largest_value
			local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

			Unit.set_local_scale(link_unit, 0, scale)

			offset = offset * scale_fraction
		end

		local display_position = unit_spawn_position - offset

		Unit.set_local_position(link_unit, 0, display_position)

		link_units[item_key] = link_unit
	end

	return link_units
end

LootItemUnitPreviewer._spawn_items = function (self)
	local reward = self.reward
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
			local item_data = reward.data
			local item_key = item_data.key
			local units = self:spawn_units(item_key, units_data)
			spawned_units[i] = units
			units_by_item_key[item_key] = units
		end
	end

	self._spawned_units = spawned_units
	self._units_by_item_key = units_by_item_key
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
			local material_settings = spawn_unit_data.material_settings
			local reward_unit = World.spawn_unit(world, unit_name)

			Unit.set_unit_visibility(reward_unit, false)

			units[#units + 1] = reward_unit

			GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, link_unit, reward_unit)

			if material_settings then
				GearUtils.apply_material_settings(reward_unit, material_settings)
			end
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

				self:_trigger_unit_flow_event(unit, reward_unit_event)
			end
		end

		Unit.flow_event(link_unit, "lua_spin_no_fx")
	end
end

LootItemUnitPreviewer._enable_reward_units_visibility = function (self)
	local spawned_units = self._spawned_units

	for _, unit in ipairs(spawned_units) do
		if unit and Unit.alive(unit) then
			Unit.set_unit_visibility(unit, true)

			local reward_unit_event = "lua_presentation"

			self:_trigger_unit_flow_event(unit, reward_unit_event)
		end
	end
end

return
