local DEFAULT_ANGLE = math.degrees_to_radians(0)
MenuWorldPreviewer = class(MenuWorldPreviewer)
local camera_position_by_character = {
	witch_hunter = {
		z = 0.4,
		x = 0,
		y = 0.8
	},
	bright_wizard = {
		z = 0.2,
		x = 0,
		y = 0.4
	},
	dwarf_ranger = {
		z = 0,
		x = 0,
		y = 0
	},
	wood_elf = {
		z = 0.16,
		x = 0,
		y = 0.45
	},
	empire_soldier = {
		z = 0.4,
		x = 0,
		y = 1
	},
	empire_soldier_tutorial = {
		z = 0.4,
		x = 0,
		y = 1
	}
}
MenuWorldPreviewer.init = function (self, ingame_ui_context, optional_camera_character_positions, unique_id)
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.input_manager = ingame_ui_context.input_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.character_unit = nil
	self._character_camera_positions = optional_camera_character_positions or camera_position_by_character
	self.item_info_by_slot = {}
	self.equipment_units = {}
	self._hidden_units = {}
	local player_manager = Managers.player
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.unique_id = unique_id
	self.equipment_units[InventorySettings.slots_by_name.slot_melee.slot_index] = {}
	self.equipment_units[InventorySettings.slots_by_name.slot_ranged.slot_index] = {}
	self._camera_default_position = {
		z = 0.9,
		x = 0,
		y = 2.8
	}
	self._default_animation_data = {
		x = {
			value = 0
		},
		y = {
			value = 0
		},
		z = {
			value = 0
		}
	}
	self._camera_position_animation_data = table.clone(self._default_animation_data)
	self._camera_character_position_animation_data = table.clone(self._default_animation_data)
	self._camera_rotation_animation_data = table.clone(self._default_animation_data)
	self._camera_gamepad_offset_data = {
		0,
		0,
		0
	}

	return 
end
MenuWorldPreviewer.destroy = function (self)
	self._session_id = self._session_id + 1

	GarbageLeakDetector.register_object(self, "MenuWorldPreviewer")

	return 
end
MenuWorldPreviewer.on_enter = function (self, viewport_widget, hero_name)
	self.viewport_widget = viewport_widget
	local preview_pass_data = self.viewport_widget.element.pass_data[1]
	self.world = preview_pass_data.world
	self.viewport = preview_pass_data.viewport
	self.camera = ScriptViewport.camera(self.viewport)
	self.item_spawn_data = {}
	self.loaded_packages = {}
	self.packages_to_load = {}
	self.character_camera_position_adjustments = {}
	self.hero_name = hero_name
	self.character_look_current = {
		0,
		3,
		1
	}
	self.character_look_target = {
		0,
		3,
		1
	}

	Application.set_render_setting("max_shadow_casting_lights", 16)

	self.camera_xy_angle_current = DEFAULT_ANGLE
	self.camera_xy_angle_target = DEFAULT_ANGLE
	self._session_id = self._session_id or 0

	return 
end
MenuWorldPreviewer.has_units_spawned = function (self)
	return self.character_unit ~= nil
end
MenuWorldPreviewer.prepare_exit = function (self)
	self.clear_units(self)

	return 
end
MenuWorldPreviewer.on_exit = function (self)
	local max_shadow_casting_lights = Application.user_setting("render_settings", "max_shadow_casting_lights")

	Application.set_render_setting("max_shadow_casting_lights", max_shadow_casting_lights)

	local inventory_package_synchronizer = self.profile_synchronizer:inventory_package_synchronizer()
	local loaded_packages = self.loaded_packages
	local package_manager = Managers.package
	local reference_name = "MenuWorldPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	for package_name, _ in pairs(self.packages_to_load) do
		package_manager.unload(package_manager, package_name, reference_name)

		self.packages_to_load[package_name] = nil
	end

	for package_name, _ in pairs(self.loaded_packages) do
		package_manager.unload(package_manager, package_name, reference_name)

		self.loaded_packages[package_name] = nil
	end

	self.items_loaded = nil
	self._session_id = self._session_id + 1

	return 
end
MenuWorldPreviewer.update = function (self, dt)
	local character_unit = self.character_unit

	if character_unit then
		if math.pi * 2 < self.camera_xy_angle_target then
			self.camera_xy_angle_current = self.camera_xy_angle_current - math.pi * 2
			self.camera_xy_angle_target = self.camera_xy_angle_target - math.pi * 2
		end

		local character_xy_angle_new = math.lerp(self.camera_xy_angle_current, self.camera_xy_angle_target, 0.1)
		self.camera_xy_angle_current = character_xy_angle_new
		local player_rotation = Quaternion.axis_angle(Vector3(0, 0, 1), -character_xy_angle_new)

		Unit.set_local_rotation(character_unit, 0, player_rotation)

		local look_current = Vector3Aux.unbox(self.character_look_current)
		local aim_constraint_anim_var = Unit.animation_find_constraint_target(character_unit, "aim_constraint_target")
		local rotated_constraint_position = Quaternion.rotate(player_rotation, look_current)

		Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, rotated_constraint_position)
	end

	self._update_camera_animation_data(self, self._camera_position_animation_data, dt)
	self._update_camera_animation_data(self, self._camera_rotation_animation_data, dt)
	self._update_camera_animation_data(self, self._camera_character_position_animation_data, dt)

	local camera_default_position = self._camera_default_position
	local camera_position_new = Vector3.zero()
	camera_position_new.x = camera_default_position.x
	camera_position_new.y = camera_default_position.y
	camera_position_new.z = camera_default_position.z
	local lookat_target = Vector3(0, 0, 0.9)
	local direction = Vector3.normalize(lookat_target - camera_position_new)
	local camera_rotation_animation_data = self._camera_rotation_animation_data
	direction.x = direction.x + camera_rotation_animation_data.x.value
	direction.y = direction.y + camera_rotation_animation_data.y.value
	direction.z = direction.z + camera_rotation_animation_data.z.value
	local rotation = Quaternion.look(direction)

	ScriptCamera.set_local_rotation(self.camera, rotation)

	local camera_position_animation_data = self._camera_position_animation_data
	local camera_character_position_animation_data = self._camera_character_position_animation_data
	local camera_gamepad_offset_data = self._camera_gamepad_offset_data
	camera_position_new.x = camera_position_new.x + camera_position_animation_data.x.value + camera_character_position_animation_data.x.value + camera_gamepad_offset_data[1]
	camera_position_new.y = camera_position_new.y + camera_position_animation_data.y.value + camera_character_position_animation_data.y.value + camera_gamepad_offset_data[2]
	camera_position_new.z = camera_position_new.z + camera_position_animation_data.z.value + camera_character_position_animation_data.z.value + camera_gamepad_offset_data[3]

	ScriptCamera.set_local_position(self.camera, camera_position_new)

	local input_service = self.input_manager:get_service("hero_view")

	self.handle_mouse_input(self, input_service, dt)
	self.handle_controller_input(self, input_service, dt)

	return 
end
MenuWorldPreviewer.post_update = function (self, dt)
	self._update_units_visibility(self, dt)

	return 
end
MenuWorldPreviewer.force_unhide_character = function (self)
	self._force_unhide_character = true

	return 
end
MenuWorldPreviewer.wait_for_force_unhide = function (self)
	self._wait_for_force_unhide = true

	return 
end
MenuWorldPreviewer._update_units_visibility = function (self, dt)
	self.items_loaded = self.update_package_loaded_status(self)

	if self.items_loaded and Unit.alive(self.character_unit) and (not self._wait_for_force_unhide or self._force_unhide_character) then
		local unit_visibility_frame_delay = self.unit_visibility_frame_delay

		if unit_visibility_frame_delay and 0 < unit_visibility_frame_delay then
			self.unit_visibility_frame_delay = unit_visibility_frame_delay - 1

			return 
		end

		local peer_id = self.peer_id
		local player = self.player_manager:player_from_peer_id(peer_id)

		for unit, _ in pairs(self._hidden_units) do
			if Unit.alive(unit) then
				Unit.set_unit_visibility(unit, true)
			end

			self._hidden_units[unit] = nil
		end

		if self.character_unit_hidden and Unit.alive(self.character_unit) then
			Unit.flow_event(self.character_unit, "lua_spawn_attachments")

			local skin_data = self.character_unit_skin_data
			local material_changes = skin_data.material_changes

			if material_changes then
				local third_person_changes = material_changes.third_person
				local flow_unit_attachments = Unit.get_data(self.character_unit, "flow_unit_attachments") or {}

				for slot_name, material_name in pairs(third_person_changes) do
					for _, unit in pairs(flow_unit_attachments) do
						Unit.set_material(unit, slot_name, material_name)
					end
				end
			end

			self.character_unit_hidden = false
		end

		self._force_unhide_character = false
	end

	return 
end
MenuWorldPreviewer._update_camera_animation_data = function (self, animation_data, dt)
	for axis, data in pairs(animation_data) do
		if data.total_time then
			local old_time = data.time
			data.time = math.min(old_time + dt, data.total_time)
			local progress = math.min(1, data.time / data.total_time)
			local func = data.func
			data.value = (data.to - data.from) * ((func and func(progress)) or progress) + data.from

			if progress == 1 then
				data.total_time = nil
			end
		end
	end

	return 
end
MenuWorldPreviewer.set_camera_axis_offset = function (self, axis, value, animation_time, func_ptr, fixed_position)
	local data = self._camera_position_animation_data[axis]
	local camera_default_position = self._camera_default_position
	data.from = (animation_time and data.value) or value
	data.to = (fixed_position and value + -camera_default_position[axis]) or value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from

	return 
end
MenuWorldPreviewer.set_camera_gamepad_offset = function (self, value)
	self._camera_gamepad_offset_data = value

	return 
end
MenuWorldPreviewer.set_camera_rotation_axis_offset = function (self, axis, value, animation_time, func_ptr)
	local data = self._camera_rotation_animation_data[axis]
	data.from = (animation_time and data.value) or value
	data.to = value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from

	return 
end
MenuWorldPreviewer.set_character_axis_offset = function (self, axis, value, animation_time, func_ptr)
	local data = self._camera_character_position_animation_data[axis]
	data.from = (animation_time and data.value) or value
	data.to = value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from

	return 
end
local mouse_pos_temp = {}
MenuWorldPreviewer.handle_mouse_input = function (self, input_service, dt)
	local character_unit = self.character_unit

	if character_unit == nil or self.character_unit_hidden then
		return 
	end

	if not self.input_manager:is_device_active("mouse") then
		return 
	end

	local mouse = input_service.get(input_service, "cursor")

	if not mouse then
		return 
	end

	local viewport_widget = self.viewport_widget
	local content = viewport_widget.content
	local button_hotspot = content.button_hotspot
	local is_hover = button_hotspot and button_hotspot.is_hover

	if is_hover then
		if input_service.get(input_service, "left_press") then
			self.is_moving_camera = true
			self.last_mouse_position = nil
		elseif input_service.get(input_service, "right_press") then
			self.camera_xy_angle_target = DEFAULT_ANGLE
		end
	end

	local is_moving_camera = self.is_moving_camera
	local mouse_hold = input_service.get(input_service, "left_hold")

	if is_moving_camera and mouse_hold then
		if self.last_mouse_position then
			self.camera_xy_angle_target = self.camera_xy_angle_target - (mouse.x - self.last_mouse_position[1]) * 0.01
		end

		mouse_pos_temp[1] = mouse.x
		mouse_pos_temp[2] = mouse.y
		self.last_mouse_position = mouse_pos_temp
	elseif is_moving_camera then
		self.is_moving_camera = false
	end

	return 
end
MenuWorldPreviewer.handle_controller_input = function (self, input_service, dt)
	local character_unit = self.character_unit

	if character_unit == nil then
		return 
	end

	if not self.input_manager:is_device_active("gamepad") then
		return 
	end

	local camera_move = input_service.get(input_service, "gamepad_right_axis")

	if camera_move and 0.01 < Vector3.length(camera_move) then
		self.camera_xy_angle_target = self.camera_xy_angle_target + -camera_move.x * dt * 5
	end

	return 
end
MenuWorldPreviewer.start_character_rotation = function (self, direction)
	if direction then
		self.rotation_direction = direction
	end

	return 
end
MenuWorldPreviewer.end_character_rotation = function (self)
	print("end_character_rotation", self.rotation_direction)

	return 
end
MenuWorldPreviewer.play_character_animation = function (self, animation_event)
	local character_unit = self.character_unit

	if character_unit == nil then
		return 
	end

	Unit.animation_event(character_unit, animation_event)

	return 
end
MenuWorldPreviewer.spawn_hero_unit = function (self, profile_name, career_index, state_character, callback, optional_scale, camera_move_duration, optional_skin)
	self.camera_xy_angle_target = DEFAULT_ANGLE
	local ignore_camera_reset = true

	self.clear_units(self, ignore_camera_reset)

	camera_move_duration = camera_move_duration or 0.01
	local character_camera_positions = self._character_camera_positions
	local new_character_position = character_camera_positions[profile_name]

	self.set_character_axis_offset(self, "x", new_character_position.x, camera_move_duration, math.easeOutCubic)
	self.set_character_axis_offset(self, "y", new_character_position.y, camera_move_duration, math.easeOutCubic)
	self.set_character_axis_offset(self, "z", new_character_position.z, camera_move_duration, math.easeOutCubic)

	local world = self.world
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local item_data = skin_item and skin_item.data
	local skin_name = optional_skin or (item_data and item_data.name) or career.base_skin

	if state_character then
		skin_name = career.base_skin
	end

	self._current_career_name = career_name
	self.character_unit_skin_data = nil
	local package_names = {}
	local skin_data = Cosmetics[skin_name]
	local unit_name = skin_data.third_person
	local material_changes = skin_data.material_changes
	package_names[#package_names + 1] = unit_name

	if material_changes then
		local material_package = material_changes.package_name
		package_names[#package_names + 1] = material_package
	end

	local data = {
		num_loaded_packages = 0,
		career_name = career_name,
		skin_data = skin_data,
		optional_scale = optional_scale,
		package_names = package_names,
		num_packages = #package_names,
		callback = callback
	}

	self.load_hero_packages(self, package_names, data)

	return 
end
MenuWorldPreviewer._spawn_hero_unit = function (self, skin_data, optional_scale)
	local world = self.world
	local unit_name = skin_data.third_person
	local tint_data = skin_data.color_tint
	local character_unit = World.spawn_unit(world, unit_name)
	local material_changes = skin_data.material_changes

	if material_changes then
		local third_person_changes = material_changes.third_person

		for slot_name, material_name in pairs(third_person_changes) do
			Unit.set_material(character_unit, slot_name, material_name)
		end
	end

	if tint_data then
		local gradient_variation = tint_data.gradient_variation
		local gradient_value = tint_data.gradient_value

		CosmeticUtils.color_tint_unit(character_unit, self.hero_name, gradient_variation, gradient_value)
	end

	Unit.set_unit_visibility(character_unit, false)

	self._hidden_units[character_unit] = true
	self.character_unit = character_unit
	self.character_unit_hidden = true
	self.character_unit_skin_data = skin_data
	self.unit_visibility_frame_delay = 3

	if Unit.has_lod_object(character_unit, "lod") then
		local lod_object = Unit.lod_object(character_unit, "lod")

		LODObject.set_static_select(lod_object, 0)
	end

	self.character_look_target = {
		0,
		3,
		1
	}
	self.character_look_current = self.character_look_target
	local look_target = Vector3Aux.unbox(self.character_look_target)
	local aim_constraint_anim_var = Unit.animation_find_constraint_target(character_unit, "aim_constraint_target")
	local look_direction_anim_var = Unit.animation_find_variable(character_unit, "aim_direction")
	local aim_direction_pitch_var = Unit.animation_find_variable(character_unit, "aim_direction_pitch")

	Unit.animation_set_constraint_target(character_unit, aim_constraint_anim_var, look_target)

	local unit_box, box_dimension = Unit.box(character_unit)

	if box_dimension then
		local default_unit_height_dimension = 1.7
		local default_diff = box_dimension.z - default_unit_height_dimension
		self.unit_max_look_height = (default_unit_height_dimension < box_dimension.z and 1.5) or 0.9
	else
		self.unit_max_look_height = 0.9
	end

	if optional_scale then
		local scale = Vector3(optional_scale, optional_scale, optional_scale)

		Unit.set_local_scale(character_unit, 0, scale)
	end

	return 
end
MenuWorldPreviewer.respawn_hero_unit = function (self, profile_name, career_index, state_character, callback)
	self.clear_units(self)
	self.spawn_hero_unit(self, profile_name, career_index, state_character, callback)

	return 
end
MenuWorldPreviewer.wield_weapon_slot = function (self, slot_type)
	self._wielded_slot_type = slot_type
	local melee_slot_info = self.item_info_by_slot.melee

	if melee_slot_info then
		local item_name = melee_slot_info.name
		local backend_id = melee_slot_info.backend_id

		self.equip_item(self, item_name, InventorySettings.slots_by_name.slot_melee, backend_id)
	elseif slot_type == "melee" then
	end

	local ranged_slot_info = self.item_info_by_slot.ranged

	if ranged_slot_info then
		local item_name = ranged_slot_info.name
		local backend_id = ranged_slot_info.backend_id

		self.equip_item(self, item_name, InventorySettings.slots_by_name.slot_ranged, backend_id)
	elseif slot_type == "ranged" then
	end

	return 
end
MenuWorldPreviewer.item_name_by_slot_type = function (self, item_slot_type)
	local item_info = self.item_info_by_slot[item_slot_type]

	return item_info and item_info.name
end
MenuWorldPreviewer.wielded_slot_type = function (self)
	return self._wielded_slot_type
end
MenuWorldPreviewer.unequip_item_in_slot = function (self, item_slot_type, slot_index)
	local world = self.world

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		local old_unit_right = self.equipment_units[slot_index].right

		if old_unit_right ~= nil then
			World.destroy_unit(world, old_unit_right)

			self.equipment_units[slot_index].right = nil
		end

		local old_unit_left = self.equipment_units[slot_index].left

		if old_unit_left ~= nil then
			World.destroy_unit(world, old_unit_left)

			self.equipment_units[slot_index].left = nil
		end
	else
		local old_unit = self.equipment_units[slot_index]

		if old_unit ~= nil then
			World.destroy_unit(world, old_unit)

			self.equipment_units[slot_index] = nil
		end
	end

	self.item_info_by_slot[item_slot_type] = nil

	return 
end
MenuWorldPreviewer.equip_item = function (self, item_name, slot, backend_id)
	local skin_data = self.character_unit_skin_data

	if skin_data and skin_data.always_hide_attachment_slots then
		local hide_slot = false

		for _, slot_name in ipairs(skin_data.always_hide_attachment_slots) do
			if slot.name == slot_name then
				printf("[MenuWorldPreviewer]:equip_item() - Skipping equipping of item(%s), because equipped skin(%s) wants to hide it", item_name, skin_data.name)

				hide_slot = true

				break
			end
		end

		if hide_slot then
			return 
		end
	end

	self.items_loaded = nil
	local item_slot_type = slot.type
	local slot_index = slot.slot_index
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data, backend_id)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local units_to_spawn_data = {}
	local package_names = {}

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local despawn_both_hands_units = right_hand_unit == nil or left_hand_unit == nil

		if left_hand_unit then
			local left_unit = left_hand_unit .. "_3p"
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				left_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = left_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person
			}
			package_names[#package_names + 1] = left_unit
		end

		if right_hand_unit then
			local right_unit = right_hand_unit .. "_3p"
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				right_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = right_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person
			}

			if right_hand_unit ~= left_hand_unit then
				package_names[#package_names + 1] = right_unit
			end
		end
	elseif item_slot_type == "hat" then
		local unit = item_units.unit

		if unit then
			local attachment_slot_lookup_index = 3

			if item_slot_type == "hat" then
				attachment_slot_lookup_index = 1
			end

			local attachment_slot_name = item_template.slots[attachment_slot_lookup_index]
			units_to_spawn_data[#units_to_spawn_data + 1] = {
				unit_name = unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.attachment_node_linking[attachment_slot_name]
			}
			package_names[#package_names + 1] = unit
		end
	end

	if 0 < #package_names then
		self.item_spawn_data[item_name] = units_to_spawn_data
		self.item_info_by_slot[item_slot_type] = {
			name = item_name,
			backend_id = backend_id
		}

		self.load_item_packages(self, package_names, item_name)
	end

	return 
end
MenuWorldPreviewer.load_hero_packages = function (self, package_names, data)
	local package_names_to_load = {}

	for index, package_name in ipairs(package_names) do
		if not self.packages_to_load[package_name] then
			self.packages_to_load[package_name] = true
			package_names_to_load[#package_names_to_load + 1] = package_name
		end
	end

	local reference_name = "MenuWorldPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	for index, package_name in ipairs(package_names_to_load) do
		local package_manager = Managers.package
		local cb = callback(self, "on_hero_load_complete", package_name, data, self._session_id)

		package_manager.load(package_manager, package_name, reference_name, cb, true)
	end

	return 
end
MenuWorldPreviewer.on_hero_load_complete = function (self, package_name, data, session_id)
	if session_id ~= self._session_id then
		return 
	end

	local loaded_packages = self.loaded_packages
	loaded_packages[package_name] = true
	self.packages_to_load[package_name] = nil
	local package_names = data.package_names

	for i = 1, #package_names, 1 do
		local package_name = package_names[i]

		if not loaded_packages[package_name] then
			return 
		end

		data.num_loaded_packages = data.num_loaded_packages + 1

		if data.num_loaded_packages < data.num_packages then
			return 
		end
	end

	local career_name = data.career_name

	if career_name == self._current_career_name then
		local skin_data = data.skin_data
		local optional_scale = data.optional_scale

		self._spawn_hero_unit(self, skin_data, optional_scale)

		local callback = data.callback

		if callback then
			callback()
		end
	end

	return 
end
MenuWorldPreviewer.load_item_packages = function (self, package_names, item_name)
	local package_names_to_load = {}

	for index, package_name in ipairs(package_names) do
		if not self.packages_to_load[package_name] then
			self.packages_to_load[package_name] = true
			package_names_to_load[#package_names_to_load + 1] = package_name
		end
	end

	local reference_name = "MenuWorldPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	for index, package_name in ipairs(package_names_to_load) do
		local package_manager = Managers.package
		local cb = callback(self, "on_item_load_complete", package_name, item_name)

		package_manager.load(package_manager, package_name, reference_name, cb, true)
	end

	return 
end
MenuWorldPreviewer.on_item_load_complete = function (self, package_name, item_name)
	local loaded_packages = self.loaded_packages
	loaded_packages[package_name] = true
	self.packages_to_load[package_name] = nil
	local item_info_by_slot = self.item_info_by_slot
	local spawn_data = self.item_spawn_data[item_name]

	for _, unit_spawn_data in ipairs(spawn_data) do
		local item_slot_type = unit_spawn_data.item_slot_type
		local item_info = item_info_by_slot[item_slot_type]

		if not item_info or item_info.name ~= item_name then
			return 
		end

		local unit_name = unit_spawn_data.unit_name

		if not loaded_packages[unit_name] then
			return 
		end
	end

	self._spawn_item(self, item_name)

	return 
end
MenuWorldPreviewer.update_package_loaded_status = function (self)
	for package_name, _ in pairs(self.packages_to_load) do
		return 
	end

	return true
end
MenuWorldPreviewer.items_spawned = function (self)
	return self.items_loaded
end
MenuWorldPreviewer._spawn_item = function (self, item_name)
	local world = self.world
	local character_unit = self.character_unit
	local scene_graph_links = {}
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local item_spawn_data = self.item_spawn_data
	local spawn_data = item_spawn_data[item_name]

	if spawn_data then
		for _, unit_spawn_data in ipairs(spawn_data) do
			local unit_name = unit_spawn_data.unit_name
			local item_slot_type = unit_spawn_data.item_slot_type
			local slot_index = unit_spawn_data.slot_index
			local unit_attachment_node_linking = unit_spawn_data.unit_attachment_node_linking

			if item_slot_type == "melee" or item_slot_type == "ranged" then
				if unit_spawn_data.right_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_right = self.equipment_units[slot_index].right

					if old_unit_right ~= nil then
						World.destroy_unit(world, old_unit_right)

						self.equipment_units[slot_index].right = nil
					end
				end

				if unit_spawn_data.left_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_left = self.equipment_units[slot_index].left

					if old_unit_left ~= nil then
						World.destroy_unit(world, old_unit_left)

						self.equipment_units[slot_index].left = nil
					end
				end

				local unit = World.spawn_unit(world, unit_name)

				self.equip_item_unit(self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)

				if unit_spawn_data.right_hand then
					self.equipment_units[slot_index].right = unit
				elseif unit_spawn_data.left_hand then
					self.equipment_units[slot_index].left = unit
				end
			else
				local old_unit = self.equipment_units[slot_index]

				if old_unit ~= nil then
					World.destroy_unit(world, old_unit)

					self.equipment_units[slot_index] = nil
				end

				local unit = World.spawn_unit(world, unit_name)
				self.equipment_units[slot_index] = unit

				self.equip_item_unit(self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)
			end

			local show_attachments_event = item_template.show_attachments_event

			if show_attachments_event then
				Unit.flow_event(character_unit, show_attachments_event)
			end
		end
	end

	return 
end
MenuWorldPreviewer.equip_item_unit = function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)
	local world = self.world
	local character_unit = self.character_unit

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		if self._wielded_slot_type == item_slot_type then
			unit_attachment_node_linking = unit_attachment_node_linking.wielded

			Unit.flow_event(unit, "lua_wield")

			if item_template.wield_anim then
				Unit.animation_event(character_unit, item_template.wield_anim)
			end

			self._hidden_units[unit] = true
		else
			unit_attachment_node_linking = unit_attachment_node_linking.unwielded

			Unit.flow_event(unit, "lua_unwield")
		end
	else
		self._hidden_units[unit] = true
	end

	Unit.set_unit_visibility(unit, false)

	if Unit.has_lod_object(unit, "lod") then
		local lod_object = Unit.lod_object(unit, "lod")

		LODObject.set_static_select(lod_object, 0)
	end

	GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, character_unit, unit)

	return 
end
MenuWorldPreviewer.clear_units = function (self, ignore_camera_reset)
	local world = self.world

	for i = 1, 6, 1 do
		if type(self.equipment_units[i]) == "table" then
			if self.equipment_units[i].left then
				World.destroy_unit(world, self.equipment_units[i].left)

				self.equipment_units[i].left = nil
			end

			if self.equipment_units[i].right then
				World.destroy_unit(world, self.equipment_units[i].right)

				self.equipment_units[i].right = nil
			end
		elseif self.equipment_units[i] then
			World.destroy_unit(world, self.equipment_units[i])

			self.equipment_units[i] = nil
		end
	end

	table.clear(self.item_info_by_slot)

	if self.character_unit ~= nil then
		World.destroy_unit(world, self.character_unit)

		self.character_unit = nil

		if not ignore_camera_reset then
			local default_animation_data = self._default_animation_data

			self.set_character_axis_offset(self, "x", default_animation_data.x.value, 0.5, math.easeOutCubic)
			self.set_character_axis_offset(self, "y", default_animation_data.y.value, 0.5, math.easeOutCubic)
			self.set_character_axis_offset(self, "z", default_animation_data.z.value, 0.5, math.easeOutCubic)
		end
	end

	return 
end
MenuWorldPreviewer.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end

	return 
end

return 
