-- chunkname: @scripts/ui/views/hero_view/loot_item_unit_previewer.lua

local DEFAULT_ANGLE = 0

LootItemUnitPreviewer = class(LootItemUnitPreviewer)

LootItemUnitPreviewer.init = function (self, item, spawn_position, background_world, background_viewport, unique_id, invert_start_rotation, display_unit_key, use_highest_mip_levels, delayed_spawn, career_name_override)
	self._unique_id = unique_id
	self._loaded_packages = {}
	self._packages_to_load = {}
	self._requested_all_mips_units = {}
	self._camera_xy_angle_target = DEFAULT_ANGLE
	self._camera_xy_angle_current = DEFAULT_ANGLE
	self._invert_start_rotation = invert_start_rotation
	self._display_unit_key = display_unit_key
	self._spawn_position = spawn_position
	self._item = item
	self._use_highest_mip_levels = use_highest_mip_levels
	self._career_name_override = career_name_override
	self._delayed_spawn = delayed_spawn

	if not self._delayed_spawn then
		self._background_world = background_world
		self._background_viewport = background_viewport
		self._link_unit = self:_spawn_link_unit(item)
	end

	self._activated = not self._delayed_spawn
	self._units_to_spawn = self:_load_item_units(item)
end

LootItemUnitPreviewer.activate = function (self, activate, background_world, background_viewport, force_present)
	if not self._delayed_spawn then
		return
	end

	if activate == self._activated then
		return
	end

	if activate then
		self._background_world = background_world
		self._background_viewport = background_viewport
		self._link_unit = self:_spawn_link_unit(self._item)
	else
		self:_destroy_units()

		self._background_world = nil
		self._background_viewport = nil
	end

	self._activated = activate
	self._force_present = force_present
end

LootItemUnitPreviewer.activate_auto_spin = function (self)
	self._auto_spin_random_seed = math.random(5, 30000)
end

LootItemUnitPreviewer.register_spawn_callback = function (self, callback)
	self._spawn_callback = callback
end

LootItemUnitPreviewer.destroy = function (self)
	self:_destroy_units()
	self:_unload_packages()
	table.clear(self._loaded_packages)
	table.clear(self._packages_to_load)
	Renderer.set_automatic_streaming(true)
end

LootItemUnitPreviewer._destroy_units = function (self)
	local world = self._background_world
	local spawned_units = self._spawned_units

	if spawned_units then
		for _, unit in ipairs(spawned_units) do
			World.destroy_unit(world, unit)
		end

		self._spawned_units = nil
	end

	local link_unit = self._link_unit

	if link_unit then
		World.destroy_unit(world, link_unit)
	end

	self._link_unit = nil
	self.units_spawned = nil
	self._items_spawned = nil
end

LootItemUnitPreviewer.update = function (self, dt, t, input_service)
	if not self._activated then
		return
	end

	if self._items_spawned then
		if self._request_show_settings and self:_update_manual_mip_streaming() then
			local request_show_settings = self._request_show_settings
			local item_key = request_show_settings.item_key
			local ignore_spin = request_show_settings.ignore_spin
			local visible = true

			self:_enable_item_units_visibility(item_key, ignore_spin, visible)

			self._request_show_settings = nil
		elseif self._force_present then
			local item = self._item
			local item_key = item.key

			self:present_item(item_key, true)

			self._force_present = false
		end

		if input_service then
			local input_manager = Managers.input

			if input_manager:is_device_active("mouse") then
				self:_handle_mouse_input(input_service, dt)
			elseif input_manager:is_device_active("gamepad") then
				self:_handle_controller_input(input_service, dt)
			end
		end

		if self._camera_xy_angle_target > math.pi * 2 then
			self._camera_xy_angle_current = self._camera_xy_angle_current - math.pi * 2
			self._camera_xy_angle_target = self._camera_xy_angle_target - math.pi * 2
		end

		local character_xy_angle_new = math.lerp(self._camera_xy_angle_current, self._camera_xy_angle_target, 0.1)

		self._camera_xy_angle_current = character_xy_angle_new

		local auto_tilt_angle, auto_turn_angle = self:_auto_spin_values(dt, t)
		local start_angle = self._invert_start_rotation and 0 or math.pi
		local rotation = Quaternion.axis_angle(Vector3(0, auto_tilt_angle, 1), -(character_xy_angle_new + auto_turn_angle + start_angle))
		local link_unit = self._link_unit

		if link_unit then
			Unit.set_local_rotation(link_unit, 0, rotation)
		end

		if self._zoom_dirty then
			local zoom_fraction = self._zoom_fraction or 0
			local unit_start_position = self._unit_start_position_boxed:unbox()

			unit_start_position[1] = unit_start_position[1] * (1 - zoom_fraction)
			unit_start_position[2] = unit_start_position[2] * (1 - zoom_fraction)

			Unit.set_local_position(link_unit, 0, unit_start_position)

			self._zoom_dirty = nil
		end
	end
end

LootItemUnitPreviewer.set_zoom_fraction = function (self, fraction)
	self._zoom_fraction = math.clamp(fraction, 0, 1)
	self._zoom_dirty = true
end

LootItemUnitPreviewer.zoom_fraction = function (self)
	return self._zoom_fraction or 0
end

LootItemUnitPreviewer._auto_spin_values = function (self, dt, t)
	local start_seed = self._auto_spin_random_seed

	if not start_seed then
		return 0, 0
	end

	local progress_speed = 0.2
	local progress_range = 0.3
	local progress = math.sin((start_seed + t) * progress_speed) * progress_range
	local auto_tilt_angle = -(progress * 0.5)
	local auto_turn_angle = -(progress * math.pi / 2)

	return auto_tilt_angle, auto_turn_angle
end

local mouse_pos_temp = {}

LootItemUnitPreviewer._handle_mouse_input = function (self, input_service, dt)
	local mouse = input_service:get("cursor")

	if not mouse then
		return
	end

	local is_hover = true

	if is_hover then
		if input_service:get("left_press") then
			self._is_moving_camera = true
			self._last_mouse_position = nil
		elseif input_service:get("right_press") then
			self._camera_xy_angle_target = DEFAULT_ANGLE
		end
	end

	local is_moving_camera = self._is_moving_camera
	local mouse_hold = input_service:get("left_hold")

	if is_moving_camera and mouse_hold then
		if self._last_mouse_position then
			self._camera_xy_angle_target = self._camera_xy_angle_target - (mouse.x - self._last_mouse_position[1]) * 0.01
		end

		mouse_pos_temp[1] = mouse.x
		mouse_pos_temp[2] = mouse.y
		self._last_mouse_position = mouse_pos_temp
	elseif is_moving_camera then
		self._is_moving_camera = false
	end
end

LootItemUnitPreviewer._handle_controller_input = function (self, input_service, dt)
	local camera_move = input_service:get("gamepad_right_axis")

	if camera_move and Vector3.length(camera_move) > 0.01 then
		self._camera_xy_angle_target = self._camera_xy_angle_target + -camera_move.x * dt * 5
	end
end

LootItemUnitPreviewer.post_update = function (self, dt, t)
	if not self._activated then
		return
	end

	if self._spawn_callback and self._items_spawned then
		self._spawn_callback()

		self._spawn_callback = nil
	end

	if not self._items_spawned and self:_packages_loaded() then
		self._items_spawned = self:_spawn_items()
	end
end

LootItemUnitPreviewer._load_item_units = function (self, item)
	if not item then
		return
	end

	local item_data = item.data
	local backend_id = item.backend_id
	local item_skin = item.skin
	local item_key = item_data.key or item.key
	local item_data = ItemMasterList[item_key]
	local item_template
	local item_type = item_data.item_type

	if item_type == "rune" or item_type == "material" or item_type == "ring" or item_type == "necklace" then
		item_data = ItemMasterList[item_key]
	elseif item_type == "weapon_skin" then
		local matching_item_key = item_data.matching_item_key

		item_template = ItemHelper.get_template_by_item_name(matching_item_key)
		item_skin = item_skin or item_key
	end

	item_template = item_template or ItemHelper.get_template_by_item_name(item_key)

	local item_units = BackendUtils.get_item_units(item_data, backend_id, item_skin, self._career_name_override)
	local units_to_spawn_data = {}
	local slot_type = item_data.slot_type

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local ammo_unit = item_units.ammo_unit
		local is_ammo_weapon = item_units.is_ammo_weapon
		local material_settings = item_units.material_settings

		if left_hand_unit then
			if is_ammo_weapon then
				left_hand_unit = ammo_unit
			end

			local left_unit = left_hand_unit .. "_3p"

			self:load_package(left_unit)

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = left_unit,
				unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person.display,
				material_settings = material_settings,
			}
		end

		if right_hand_unit then
			if is_ammo_weapon then
				right_hand_unit = ammo_unit
			end

			local right_unit = right_hand_unit .. "_3p"

			if right_hand_unit ~= left_hand_unit then
				self:load_package(right_unit)
			end

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = right_unit,
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person.display,
				material_settings = material_settings,
			}
		end
	elseif slot_type == "frame" or slot_type == "chips" then
		local unit = item_template.attachment_node.unit

		if unit then
			self:load_package(unit)
		end

		if item_template.texture_package_name then
			local package_available = Application.can_get("package", item_template.texture_package_name)

			if package_available then
				self:load_package(item_template.texture_package_name)
			end
		end

		local material_settings = item_template.material_settings

		units_to_spawn_data[#units_to_spawn_data + 1] = {
			unit_name = unit,
			unit_attachment_node_linking = item_template.attachment_node.attachment_node,
			material_settings = material_settings,
			additional_packages = {
				item_template.texture_package_name,
			},
		}
	else
		local unit = item_units.unit

		if unit then
			self:load_package(unit)

			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = unit,
				unit_attachment_node_linking = slot_type == "trinket" and item_template.attachment_node_linking.slot_trinket_1 or item_template.attachment_node_linking.slot_hat,
			}
		end
	end

	return units_to_spawn_data
end

LootItemUnitPreviewer._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

LootItemUnitPreviewer._get_world = function (self)
	return self._background_world, self._background_viewport
end

LootItemUnitPreviewer._get_camera_position = function (self)
	local background_viewport = self._background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.position(camera)
end

LootItemUnitPreviewer._get_camera_rotation = function (self)
	local background_viewport = self._background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.rotation(camera)
end

LootItemUnitPreviewer._packages_loaded = function (self)
	local units_to_spawn = self._units_to_spawn
	local loaded_packages = self._loaded_packages

	for index, package_data in ipairs(units_to_spawn) do
		if not loaded_packages[package_data.unit_name] then
			return false
		end

		if package_data.additional_packages then
			for _, package in ipairs(package_data.additional_packages) do
				if not loaded_packages[package] then
					return false
				end
			end
		end
	end

	return true
end

LootItemUnitPreviewer.load_package = function (self, package_name)
	if self._packages_to_load[package_name] ~= nil then
		return
	end

	self._packages_to_load[package_name] = true

	local package_manager = Managers.package
	local cb = callback(self, "_on_load_complete", package_name)
	local reference_name = "LootItemUnitPreviewer"

	if self._unique_id then
		reference_name = reference_name .. tostring(self._unique_id)
	end

	package_manager:load(package_name, reference_name, cb, true)
end

LootItemUnitPreviewer._on_load_complete = function (self, package_name)
	self._loaded_packages[package_name] = true
	self._packages_to_load[package_name] = false
end

LootItemUnitPreviewer._unload_packages = function (self)
	local reference_name = "LootItemUnitPreviewer"

	if self._unique_id then
		reference_name = reference_name .. tostring(self._unique_id)
	end

	local loaded_packages = self._loaded_packages

	if loaded_packages then
		local package_manager = Managers.package

		for package_name, _ in pairs(loaded_packages) do
			package_manager:unload(package_name, reference_name)
		end
	end

	local packages_to_load = self._packages_to_load

	if packages_to_load then
		local package_manager = Managers.package

		for package_name, unload in pairs(packages_to_load) do
			if unload then
				package_manager:unload(package_name, reference_name)
			end
		end
	end
end

LootItemUnitPreviewer._spawn_link_unit = function (self, item)
	local item_data = item.data
	local item_key = item.key or item_data.key
	local item_skin = item.skin or item_key
	local spawn_position = self._spawn_position
	local item_data = ItemMasterList[item_key]
	local item_type = item_data.item_type

	if item_type ~= "rune" and item_type ~= "material" and item_type ~= "ring" and item_type == "necklace" then
		-- Nothing
	end

	local display_unit_key = self._display_unit_key
	local default_display_unit_key = "display_unit"
	local unit_name = item_data[display_unit_key] or item_data[default_display_unit_key]

	if item_type == "weapon_skin" then
		local skin_template = WeaponSkins.skins[item_skin]

		unit_name = skin_template[display_unit_key] or skin_template[default_display_unit_key] or unit_name
	elseif not unit_name then
		local item_template = ItemHelper.get_template_by_item_name(item_key)

		unit_name = item_template[display_unit_key] or item_template[default_display_unit_key]
	end

	if not unit_name or unit_name == "" then
		Application.warning(string.format("[LootItemUnitPreviewer] Couldn't find any display unit for item %q", item_key))

		return nil
	end

	local camera_rotation = self:_get_camera_rotation()
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), 0)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local camera_position = self:_get_camera_position()
	local unit_spawn_position = camera_position + camera_forward_vector

	unit_spawn_position = unit_spawn_position + Vector3(spawn_position[1], spawn_position[2], spawn_position[3])

	local world = self._background_world
	local link_unit = World.spawn_unit(world, unit_name, unit_spawn_position, unit_spawn_rotation)
	local unit_start_position = Unit.world_position(link_unit, 0)

	self._unit_start_position_boxed = Vector3Box(unit_start_position)

	return link_unit
end

LootItemUnitPreviewer._spawn_items = function (self)
	local units_loaded = true
	local units_to_spawn = self._units_to_spawn

	for _, data in ipairs(units_to_spawn) do
		local unit_name = data.unit_name

		if not self._loaded_packages[unit_name] then
			units_loaded = false

			break
		end
	end

	if units_loaded then
		local item = self._item
		local item_data = item.data
		local item_key = item_data.key
		local units = self:spawn_units(units_to_spawn)

		if self._use_highest_mip_levels then
			for i = 1, #units do
				local spawned_unit = units[i]

				self:_request_all_mips_for_unit(spawned_unit)
			end
		end

		self._spawned_units = units
	end

	return units_loaded
end

LootItemUnitPreviewer.spawn_units = function (self, spawn_data)
	local units = {}
	local link_unit = self._link_unit

	if spawn_data and link_unit then
		local scene_graph_links = {}
		local world = self._background_world

		for i = 1, #spawn_data do
			local spawn_unit_data = spawn_data[i]
			local unit_name = spawn_unit_data.unit_name
			local unit_attachment_node_linking = spawn_unit_data.unit_attachment_node_linking
			local material_settings = spawn_unit_data.material_settings
			local unit = World.spawn_unit(world, unit_name)

			Unit.set_unit_visibility(unit, false)

			units[#units + 1] = unit

			GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, link_unit, unit)

			if material_settings then
				GearUtils.apply_material_settings(unit, material_settings)
			end
		end

		self.units_spawned = true
	end

	return units
end

LootItemUnitPreviewer.present_item = function (self, item_key, ignore_spin)
	if self._use_highest_mip_levels and not self:_update_manual_mip_streaming() then
		self._request_show_settings = {
			item_key = item_key,
			ignore_spin = ignore_spin,
		}
	else
		self:_enable_item_units_visibility(item_key, ignore_spin, true)
	end
end

LootItemUnitPreviewer._enable_item_units_visibility = function (self, item_key, ignore_spin, visible)
	local spawned_units = self._spawned_units

	if spawned_units then
		local link_unit = self._link_unit

		for _, unit in ipairs(spawned_units) do
			if unit and Unit.alive(unit) then
				Unit.set_unit_visibility(unit, visible)

				if visible then
					self:_trigger_unit_flow_event(unit, "lua_presentation")
					self:_trigger_unit_flow_event(unit, "lua_wield")
				end
			end
		end

		if not ignore_spin and visible and link_unit then
			Unit.flow_event(link_unit, "lua_spin_no_fx")
		end
	end
end

LootItemUnitPreviewer._request_all_mips_for_unit = function (self, unit)
	local requested_units = self._requested_all_mips_units

	requested_units[#requested_units + 1] = unit

	Renderer.request_to_stream_all_mips_for_unit(unit)
	Renderer.set_automatic_streaming(false)
end

LootItemUnitPreviewer._update_manual_mip_streaming = function (self)
	local mip_streaming_completed = true
	local requested_units = self._requested_all_mips_units
	local num_units_left = #requested_units

	for i = num_units_left, 1, -1 do
		local unit = requested_units[i]
		local unit_mip_streaming_completed = Renderer.is_all_mips_loaded_for_unit(unit)

		if unit_mip_streaming_completed then
			table.swap_delete(requested_units, i)
		else
			mip_streaming_completed = false
		end
	end

	if mip_streaming_completed then
		Renderer.set_automatic_streaming(true)
	end

	return mip_streaming_completed
end
