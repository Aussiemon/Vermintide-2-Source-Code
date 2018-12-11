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
	self._item_info_by_slot = {}
	self._equipment_units = {}
	self._hidden_units = {}
	self._requested_mip_streaming_units = {}
	local player_manager = Managers.player
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.unique_id = unique_id
	self._equipment_units[InventorySettings.slots_by_name.slot_melee.slot_index] = {}
	self._equipment_units[InventorySettings.slots_by_name.slot_ranged.slot_index] = {}
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
end

MenuWorldPreviewer.destroy = function (self)
	self._session_id = self._session_id + 1

	Renderer.set_automatic_streaming(true)
	GarbageLeakDetector.register_object(self, "MenuWorldPreviewer")
end

MenuWorldPreviewer.on_enter = function (self, viewport_widget, hero_name)
	table.clear(self._requested_mip_streaming_units)
	table.clear(self._hidden_units)

	self.viewport_widget = viewport_widget
	local preview_pass_data = self.viewport_widget.element.pass_data[1]
	self.world = preview_pass_data.world
	self.level = preview_pass_data.level
	self.viewport = preview_pass_data.viewport
	self.camera = ScriptViewport.camera(self.viewport)
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
end

MenuWorldPreviewer.trigger_level_event = function (self, event_name)
	Level.trigger_event(self.level, event_name)
end

MenuWorldPreviewer.show_level_units = function (self, unit_indices, visibility)
	local level = self.level

	for _, unit_index in pairs(unit_indices) do
		local unit = Level.unit_by_index(level, unit_index)

		if Unit.alive(unit) then
			Unit.set_unit_visibility(unit, visibility)

			if visibility then
				Unit.flow_event(unit, "unit_object_set_enabled")
			else
				Unit.flow_event(unit, "unit_object_set_disabled")
			end
		end
	end
end

MenuWorldPreviewer.has_units_spawned = function (self)
	return self.character_unit ~= nil
end

MenuWorldPreviewer.prepare_exit = function (self)
	self:clear_units()
end

MenuWorldPreviewer.on_exit = function (self)
	self:_unload_all_packages()

	self._hero_loading_package_data = nil
	local max_shadow_casting_lights = Application.user_setting("render_settings", "max_shadow_casting_lights")

	Application.set_render_setting("max_shadow_casting_lights", max_shadow_casting_lights)

	local inventory_package_synchronizer = self.profile_synchronizer:inventory_package_synchronizer()
	self._session_id = self._session_id + 1

	Renderer.set_automatic_streaming(true)
end

MenuWorldPreviewer.update = function (self, dt, t, input_disabled)
	local character_unit = self.character_unit

	if character_unit then
		if self.camera_xy_angle_target > math.pi * 2 then
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

	self:_update_camera_animation_data(self._camera_position_animation_data, dt)
	self:_update_camera_animation_data(self._camera_rotation_animation_data, dt)
	self:_update_camera_animation_data(self._camera_character_position_animation_data, dt)

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

	if not input_disabled and self.character_unit_visible then
		self:handle_mouse_input(input_service, dt)
		self:handle_controller_input(input_service, dt)
	end
end

MenuWorldPreviewer.post_update = function (self, dt)
	self:_update_units_visibility(dt)
	self:_handle_hero_spawn_request()
	self:_poll_hero_package_loading()
	self:_poll_item_package_loading()
end

MenuWorldPreviewer.force_stream_highest_mip_levels = function (self)
	self._use_highest_mip_levels = true
end

MenuWorldPreviewer.force_hide_character = function (self)
	self._force_hide_character = true
end

MenuWorldPreviewer.force_unhide_character = function (self)
	self._force_hide_character = false
end

MenuWorldPreviewer._update_units_visibility = function (self, dt)
	local items_loaded = self:_is_all_items_loaded()

	if not items_loaded then
		return
	end

	local character_unit = self.character_unit

	if not Unit.alive(character_unit) then
		return
	end

	if self._force_hide_character then
		return
	end

	if self:_update_unit_mip_streaming() then
		return
	end

	if self._stored_character_animation then
		local force_play_animation = true

		self:play_character_animation(self._stored_character_animation, force_play_animation)

		self._stored_character_animation = nil

		return
	end

	if self.character_unit_hidden_after_spawn then
		self.character_unit_hidden_after_spawn = false

		Unit.flow_event(character_unit, "lua_spawn_attachments")

		if self._draw_character == false then
			self:_set_character_visibility(false)
		else
			self:_set_character_visibility(true)
		end

		table.clear(self._hidden_units)
	else
		for unit, _ in pairs(self._hidden_units) do
			if Unit.alive(unit) then
				Unit.set_unit_visibility(unit, true)
			end

			self._hidden_units[unit] = nil
		end
	end
end

MenuWorldPreviewer._update_unit_mip_streaming = function (self)
	local mip_streaming_completed = true
	local num_units_handled = 0
	local requested_mip_streaming_units = self._requested_mip_streaming_units

	for unit, _ in pairs(requested_mip_streaming_units) do
		local unit_mip_streaming_completed = Renderer.is_all_mips_loaded_for_unit(unit)

		if unit_mip_streaming_completed then
			requested_mip_streaming_units[unit] = nil
		else
			mip_streaming_completed = false
		end

		num_units_handled = num_units_handled + 1
	end

	if not mip_streaming_completed then
		return true
	elseif num_units_handled > 0 then
		Renderer.set_automatic_streaming(true)
	end
end

MenuWorldPreviewer._request_mip_streaming_for_unit = function (self, unit)
	local requested_mip_streaming_units = self._requested_mip_streaming_units
	requested_mip_streaming_units[unit] = true

	Renderer.set_automatic_streaming(false)

	for unit, _ in pairs(requested_mip_streaming_units) do
		Renderer.request_to_stream_all_mips_for_unit(unit)
	end
end

MenuWorldPreviewer._set_character_visibility = function (self, visible)
	self._draw_character = visible

	if self.character_unit_hidden_after_spawn then
		return
	end

	local character_unit = self.character_unit

	if Unit.alive(character_unit) then
		Unit.set_unit_visibility(character_unit, visible)

		local flow_unit_attachments = Unit.get_data(character_unit, "flow_unit_attachments") or {}

		for _, unit in pairs(flow_unit_attachments) do
			Unit.set_unit_visibility(unit, visible)
		end

		local slots_by_slot_index = InventorySettings.slots_by_slot_index
		local attachment_lua_event = (visible and "lua_attachment_unhidden") or "lua_attachment_hidden"

		Unit.flow_event(character_unit, attachment_lua_event)

		local equipment_units = self._equipment_units

		for slot_index, data in pairs(equipment_units) do
			local slot = slots_by_slot_index[slot_index]
			local category = slot.category
			local slot_type = slot.type
			local is_weapon = category == "weapon"
			local show_unit = nil

			if is_weapon then
				show_unit = visible and slot_type == self._wielded_slot_type
			else
				show_unit = visible
			end

			local weapon_lua_event = (show_unit and "lua_wield") or "lua_unwield"

			if type(data) == "table" then
				local left_unit = data.left
				local right_unit = data.right

				if Unit.alive(left_unit) then
					Unit.flow_event(left_unit, weapon_lua_event)
					Unit.set_unit_visibility(left_unit, show_unit)
				end

				if Unit.alive(right_unit) then
					Unit.flow_event(right_unit, weapon_lua_event)
					Unit.set_unit_visibility(right_unit, show_unit)
				end
			elseif Unit.alive(data) then
				if not is_weapon then
					local attachment_lua_event = (show_unit and "lua_attachment_unhidden") or "lua_attachment_hidden"

					Unit.flow_event(data, attachment_lua_event)
				end

				Unit.flow_event(data, weapon_lua_event)
				Unit.set_unit_visibility(data, show_unit)
			end
		end

		if visible then
			local skin_data = self.character_unit_skin_data
			local material_changes = skin_data.material_changes

			if material_changes then
				local third_person_changes = material_changes.third_person

				for slot_name, material_name in pairs(third_person_changes) do
					for _, unit in pairs(flow_unit_attachments) do
						Unit.set_material(unit, slot_name, material_name)
					end
				end
			end

			for slot_name, data in pairs(self._item_info_by_slot) do
				if data.loaded then
					local item_name = data.name
					local item_template = ItemHelper.get_template_by_item_name(item_name)
					local show_attachments_event = item_template.show_attachments_event

					if show_attachments_event then
						Unit.flow_event(character_unit, show_attachments_event)
					end
				end
			end
		end

		self.character_unit_visible = visible
	end

	local camera_move_duration = self._camera_move_duration

	if camera_move_duration then
		local x = 0
		local y = 0
		local z = 0

		if visible then
			local profile_name = self._current_profile_name

			if profile_name then
				local character_camera_positions = self._character_camera_positions
				local new_character_position = character_camera_positions[profile_name]
				x = new_character_position.x
				y = new_character_position.y
				z = new_character_position.z
			end
		end

		self:set_character_axis_offset("x", x, camera_move_duration, math.easeOutCubic)
		self:set_character_axis_offset("y", y, camera_move_duration, math.easeOutCubic)
		self:set_character_axis_offset("z", z, camera_move_duration, math.easeOutCubic)
	end
end

MenuWorldPreviewer.character_visible = function (self)
	return self.character_unit_visible and Unit.alive(self.character_unit)
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
end

MenuWorldPreviewer.set_camera_gamepad_offset = function (self, value)
	self._camera_gamepad_offset_data = value
end

MenuWorldPreviewer.set_camera_rotation_axis_offset = function (self, axis, value, animation_time, func_ptr)
	local data = self._camera_rotation_animation_data[axis]
	data.from = (animation_time and data.value) or value
	data.to = value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from
end

MenuWorldPreviewer.set_character_axis_offset = function (self, axis, value, animation_time, func_ptr)
	local data = self._camera_character_position_animation_data[axis]
	data.from = (animation_time and data.value) or value
	data.to = value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from
end

local mouse_pos_temp = {}

MenuWorldPreviewer.handle_mouse_input = function (self, input_service, dt)
	local character_unit = self.character_unit

	if character_unit == nil then
		return
	end

	if not self.input_manager:is_device_active("mouse") then
		return
	end

	local mouse = input_service:get("cursor")

	if not mouse then
		return
	end

	local viewport_widget = self.viewport_widget
	local content = viewport_widget.content
	local button_hotspot = content.button_hotspot
	local is_hover = button_hotspot and button_hotspot.is_hover

	if is_hover then
		if input_service:get("left_press") then
			self.is_moving_camera = true
			self.last_mouse_position = nil
		elseif input_service:get("right_press") then
			self.camera_xy_angle_target = DEFAULT_ANGLE
		end
	end

	local is_moving_camera = self.is_moving_camera
	local mouse_hold = input_service:get("left_hold")

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
end

MenuWorldPreviewer.handle_controller_input = function (self, input_service, dt)
	local character_unit = self.character_unit

	if character_unit == nil then
		return
	end

	if not self.input_manager:is_device_active("gamepad") then
		return
	end

	local camera_move = input_service:get("gamepad_right_axis")

	if camera_move and Vector3.length(camera_move) > 0.01 then
		self.camera_xy_angle_target = self.camera_xy_angle_target + -camera_move.x * dt * 5
	end
end

MenuWorldPreviewer.start_character_rotation = function (self, direction)
	if direction then
		self.rotation_direction = direction
	end
end

MenuWorldPreviewer.end_character_rotation = function (self)
	print("end_character_rotation", self.rotation_direction)
end

MenuWorldPreviewer.play_character_animation = function (self, animation_event, force_play_animation)
	local character_unit = self.character_unit

	if character_unit == nil then
		return
	end

	if not self.character_unit_visible and not force_play_animation then
		self._stored_character_animation = animation_event
	else
		Unit.animation_event(character_unit, animation_event)
	end
end

MenuWorldPreviewer.request_spawn_hero_unit = function (self, profile_name, career_index, state_character, callback, optional_scale, camera_move_duration, optional_skin, reset_camera)
	self._requested_hero_spawn_data = {
		frame_delay = 1,
		profile_name = profile_name,
		career_index = career_index,
		state_character = state_character,
		callback = callback,
		optional_scale = optional_scale,
		camera_move_duration = camera_move_duration,
		optional_skin = optional_skin
	}

	self:clear_units(reset_camera)
end

MenuWorldPreviewer._handle_hero_spawn_request = function (self)
	if self._requested_hero_spawn_data then
		local requested_hero_spawn_data = self._requested_hero_spawn_data
		local frame_delay = requested_hero_spawn_data.frame_delay

		if frame_delay == 0 then
			local profile_name = requested_hero_spawn_data.profile_name
			local career_index = requested_hero_spawn_data.career_index
			local state_character = requested_hero_spawn_data.state_character
			local callback = requested_hero_spawn_data.callback
			local optional_scale = requested_hero_spawn_data.optional_scale
			local camera_move_duration = requested_hero_spawn_data.camera_move_duration
			local optional_skin = requested_hero_spawn_data.optional_skin

			self:_load_hero_unit(profile_name, career_index, state_character, callback, optional_scale, camera_move_duration, optional_skin)

			self._requested_hero_spawn_data = nil
		else
			requested_hero_spawn_data.frame_delay = frame_delay - 1
		end
	end
end

MenuWorldPreviewer._load_hero_unit = function (self, profile_name, career_index, state_character, callback, optional_scale, camera_move_duration, optional_skin)
	self.camera_xy_angle_target = DEFAULT_ANGLE

	self:_unload_all_packages()

	camera_move_duration = camera_move_duration or 0.01
	local character_camera_positions = self._character_camera_positions
	local new_character_position = character_camera_positions[profile_name]

	self:set_character_axis_offset("x", new_character_position.x, camera_move_duration, math.easeOutCubic)
	self:set_character_axis_offset("y", new_character_position.y, camera_move_duration, math.easeOutCubic)
	self:set_character_axis_offset("z", new_character_position.z, camera_move_duration, math.easeOutCubic)

	self._camera_move_duration = camera_move_duration
	self._current_profile_name = profile_name
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
		career_index = career_index,
		optional_scale = optional_scale,
		package_names = package_names,
		num_packages = #package_names,
		callback = callback
	}

	self:_load_packages(package_names)

	self._hero_loading_package_data = data
end

MenuWorldPreviewer._poll_hero_package_loading = function (self)
	local data = self._hero_loading_package_data

	if not data or data.loaded then
		return
	end

	local requested_hero_spawn_data = self._requested_hero_spawn_data

	if requested_hero_spawn_data then
		return
	end

	local reference_name = self:_reference_name()
	local package_manager = Managers.package
	local package_names = data.package_names
	local all_packages_loaded = true

	for i = 1, #package_names, 1 do
		local package_name = package_names[i]

		if not package_manager:has_loaded(package_name, reference_name) then
			all_packages_loaded = false

			break
		end
	end

	local career_name = data.career_name

	if all_packages_loaded then
		local skin_data = data.skin_data
		local optional_scale = data.optional_scale
		local career_index = data.career_index

		self:_spawn_hero_unit(skin_data, optional_scale, career_index)

		local callback = data.callback

		if callback then
			callback()
		end

		data.loaded = true
	end
end

MenuWorldPreviewer._spawn_hero_unit = function (self, skin_data, optional_scale, career_index)
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

		CosmeticUtils.color_tint_unit(character_unit, self._current_profile_name, gradient_variation, gradient_value)
	end

	Unit.set_unit_visibility(character_unit, false)

	self.character_unit = character_unit
	self.character_unit_hidden_after_spawn = true
	self.character_unit_visible = false
	self.character_unit_skin_data = skin_data
	self._stored_character_animation = nil

	if Unit.has_lod_object(character_unit, "lod") then
		local lod_object = Unit.lod_object(character_unit, "lod")

		LODObject.set_static_height(lod_object, 1)
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

	if self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_character then
		self:_request_mip_streaming_for_unit(character_unit)
	end

	if Unit.animation_has_variable(character_unit, "career_index") then
		local variable_index = Unit.animation_find_variable(character_unit, "career_index")

		Unit.animation_set_variable(character_unit, variable_index, career_index)
	end
end

MenuWorldPreviewer.respawn_hero_unit = function (self, profile_name, career_index, state_character, callback, camera_move_duration)
	local reset_camera = true

	self:request_spawn_hero_unit(profile_name, career_index, state_character, callback, nil, camera_move_duration, nil, reset_camera)
end

MenuWorldPreviewer.get_equipped_item_info = function (self, slot)
	local item_slot_type = slot.type
	local item_info_by_slot = self._item_info_by_slot

	return item_info_by_slot[item_slot_type]
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

	local item_slot_type = slot.type
	local slot_index = slot.slot_index
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data, backend_id)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local spawn_data = {}
	local package_names = {}

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		local left_hand_unit = item_units.left_hand_unit
		local right_hand_unit = item_units.right_hand_unit
		local material_settings = item_units.material_settings
		local despawn_both_hands_units = right_hand_unit == nil or left_hand_unit == nil

		if left_hand_unit then
			local left_unit = left_hand_unit .. "_3p"
			spawn_data[#spawn_data + 1] = {
				left_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = left_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person,
				material_settings = material_settings
			}
			package_names[#package_names + 1] = left_unit
		end

		if right_hand_unit then
			local right_unit = right_hand_unit .. "_3p"
			spawn_data[#spawn_data + 1] = {
				right_hand = true,
				despawn_both_hands_units = despawn_both_hands_units,
				unit_name = right_unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person,
				material_settings = material_settings
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
			local character_material_changes = item_template.character_material_changes
			spawn_data[#spawn_data + 1] = {
				unit_name = unit,
				item_slot_type = item_slot_type,
				slot_index = slot_index,
				unit_attachment_node_linking = item_template.attachment_node_linking[attachment_slot_name],
				character_material_changes = character_material_changes
			}
			package_names[#package_names + 1] = unit

			if character_material_changes then
				package_names[#package_names + 1] = character_material_changes.package_name
			end
		end
	end

	if #package_names > 0 then
		local item_info_by_slot = self._item_info_by_slot
		local previous_slot_data = item_info_by_slot[item_slot_type]

		if previous_slot_data then
			self:_destroy_item_units_by_slot(item_slot_type)
			self:_unload_item_packages_by_slot(item_slot_type)
		end

		item_info_by_slot[item_slot_type] = {
			name = item_name,
			backend_id = backend_id,
			package_names = package_names,
			spawn_data = spawn_data
		}

		self:_load_packages(package_names)
	end
end

MenuWorldPreviewer._poll_item_package_loading = function (self)
	local character_unit = self.character_unit

	if not Unit.alive(character_unit) then
		return
	end

	local requested_hero_spawn_data = self._requested_hero_spawn_data

	if requested_hero_spawn_data then
		return
	end

	local reference_name = self:_reference_name()
	local package_manager = Managers.package
	local item_info_by_slot = self._item_info_by_slot

	for slot_name, data in pairs(item_info_by_slot) do
		if not data.loaded then
			local package_names = data.package_names
			local all_packages_loaded = true

			for i = 1, #package_names, 1 do
				local package_name = package_names[i]

				if not package_manager:has_loaded(package_name, reference_name) then
					all_packages_loaded = false

					break
				end
			end

			if all_packages_loaded then
				data.loaded = true
				local item_name = data.name
				local spawn_data = data.spawn_data

				self:_spawn_item(item_name, spawn_data)
			end
		end
	end
end

MenuWorldPreviewer._is_all_items_loaded = function (self)
	local item_info_by_slot = self._item_info_by_slot
	local all_loaded = true

	for slot_name, data in pairs(item_info_by_slot) do
		if not data.loaded then
			all_loaded = false

			break
		end
	end

	return all_loaded
end

MenuWorldPreviewer._spawn_item = function (self, item_name, spawn_data)
	local world = self.world
	local character_unit = self.character_unit
	local scene_graph_links = {}
	local item_data = ItemMasterList[item_name]
	local item_units = BackendUtils.get_item_units(item_data)
	local item_template = ItemHelper.get_template_by_item_name(item_name)
	local hero_material_changed = false
	local character_visible = self:character_visible()

	for _, unit_spawn_data in ipairs(spawn_data) do
		local unit_name = unit_spawn_data.unit_name
		local item_slot_type = unit_spawn_data.item_slot_type
		local slot_index = unit_spawn_data.slot_index
		local unit_attachment_node_linking = unit_spawn_data.unit_attachment_node_linking
		local character_material_changes = unit_spawn_data.character_material_changes
		local material_settings = unit_spawn_data.material_settings

		if item_slot_type == "melee" or item_slot_type == "ranged" then
			local unit = World.spawn_unit(world, unit_name)

			self:_spawn_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)

			if unit_spawn_data.right_hand then
				self._equipment_units[slot_index].right = unit
			elseif unit_spawn_data.left_hand then
				self._equipment_units[slot_index].left = unit
			end
		else
			local unit = World.spawn_unit(world, unit_name)
			self._equipment_units[slot_index] = unit

			self:_spawn_item_unit(unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links)
		end

		local show_attachments_event = item_template.show_attachments_event

		if show_attachments_event and self.character_unit_visible then
			Unit.flow_event(character_unit, show_attachments_event)
		end

		if character_material_changes then
			local third_person_changes = character_material_changes.third_person
			local flow_unit_attachments = Unit.get_data(character_unit, "flow_unit_attachments") or {}

			for slot_name, material_name in pairs(third_person_changes) do
				for _, unit in pairs(flow_unit_attachments) do
					Unit.set_material(unit, slot_name, material_name)
				end

				Unit.set_material(character_unit, slot_name, material_name)

				hero_material_changed = true
			end
		end
	end

	if hero_material_changed and (self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_character) then
		self:_request_mip_streaming_for_unit(character_unit)
	end
end

MenuWorldPreviewer._spawn_item_unit = function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
	local world = self.world
	local character_unit = self.character_unit
	local character_visible = self:character_visible()

	if item_slot_type == "melee" or item_slot_type == "ranged" then
		if self._wielded_slot_type == item_slot_type then
			unit_attachment_node_linking = unit_attachment_node_linking.wielded

			if item_template.wield_anim then
				Unit.animation_event(character_unit, item_template.wield_anim)
			end

			self._hidden_units[unit] = true
			local flow_event = (character_visible and "lua_wield") or "lua_unwield"

			Unit.flow_event(unit, flow_event)
		else
			unit_attachment_node_linking = unit_attachment_node_linking.unwielded

			Unit.flow_event(unit, "lua_unwield")
		end
	else
		local attachment_lua_event = (character_visible and "lua_attachment_unhidden") or "lua_attachment_hidden"

		Unit.flow_event(unit, attachment_lua_event)

		self._hidden_units[unit] = true
	end

	Unit.set_unit_visibility(unit, false)

	if Unit.has_lod_object(unit, "lod") then
		local lod_object = Unit.lod_object(unit, "lod")

		LODObject.set_static_height(lod_object, 1)
	end

	GearUtils.link(world, unit_attachment_node_linking, scene_graph_links, character_unit, unit)

	if material_settings then
		GearUtils.apply_material_settings(unit, material_settings)
	end

	if self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_items then
		self:_request_mip_streaming_for_unit(unit)
	end
end

MenuWorldPreviewer._destroy_item_units_by_slot = function (self, slot_type)
	local world = self.world
	local hidden_units = self._hidden_units
	local requested_mip_streaming_units = self._requested_mip_streaming_units
	local item_info_by_slot = self._item_info_by_slot
	local data = item_info_by_slot[slot_type]
	local spawn_data = data.spawn_data

	if spawn_data then
		for _, unit_spawn_data in ipairs(spawn_data) do
			local item_slot_type = unit_spawn_data.item_slot_type
			local slot_index = unit_spawn_data.slot_index

			if item_slot_type == "melee" or item_slot_type == "ranged" then
				if unit_spawn_data.right_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_right = self._equipment_units[slot_index].right

					if old_unit_right ~= nil then
						hidden_units[old_unit_right] = nil
						requested_mip_streaming_units[old_unit_right] = nil

						World.destroy_unit(world, old_unit_right)

						self._equipment_units[slot_index].right = nil
					end
				end

				if unit_spawn_data.left_hand or unit_spawn_data.despawn_both_hands_units then
					local old_unit_left = self._equipment_units[slot_index].left

					if old_unit_left ~= nil then
						hidden_units[old_unit_left] = nil
						requested_mip_streaming_units[old_unit_left] = nil

						World.destroy_unit(world, old_unit_left)

						self._equipment_units[slot_index].left = nil
					end
				end
			else
				local old_unit = self._equipment_units[slot_index]

				if old_unit ~= nil then
					hidden_units[old_unit] = nil
					requested_mip_streaming_units[old_unit] = nil

					World.destroy_unit(world, old_unit)

					self._equipment_units[slot_index] = nil
				end
			end
		end
	end
end

MenuWorldPreviewer.wield_weapon_slot = function (self, slot_type)
	self._wielded_slot_type = slot_type
	local melee_slot_info = self._item_info_by_slot.melee

	if melee_slot_info then
		local item_name = melee_slot_info.name
		local backend_id = melee_slot_info.backend_id

		self:equip_item(item_name, InventorySettings.slots_by_name.slot_melee, backend_id)
	elseif slot_type == "melee" then
	end

	local ranged_slot_info = self._item_info_by_slot.ranged

	if ranged_slot_info then
		local item_name = ranged_slot_info.name
		local backend_id = ranged_slot_info.backend_id

		self:equip_item(item_name, InventorySettings.slots_by_name.slot_ranged, backend_id)
	elseif slot_type == "ranged" then
	end
end

MenuWorldPreviewer.item_name_by_slot_type = function (self, item_slot_type)
	local item_info = self._item_info_by_slot[item_slot_type]

	return item_info and item_info.name
end

MenuWorldPreviewer.wielded_slot_type = function (self)
	return self._wielded_slot_type
end

MenuWorldPreviewer._reference_name = function (self)
	local reference_name = "MenuWorldPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	return reference_name
end

MenuWorldPreviewer._load_packages = function (self, package_names)
	local reference_name = self:_reference_name()
	local package_manager = Managers.package

	for index, package_name in ipairs(package_names) do
		package_manager:load(package_name, reference_name, nil, true)
	end
end

MenuWorldPreviewer._unload_all_packages = function (self)
	self:_unload_hero_packages()
	self:_unload_all_items()
end

MenuWorldPreviewer._unload_hero_packages = function (self)
	local data = self._hero_loading_package_data

	if not data then
		return
	end

	local package_names = data.package_names
	local package_manager = Managers.package
	local reference_name = self:_reference_name()

	for _, package_name in pairs(package_names) do
		package_manager:unload(package_name, reference_name)
	end

	self._hero_loading_package_data = nil
end

MenuWorldPreviewer._unload_all_items = function (self)
	local item_info_by_slot = self._item_info_by_slot

	for slot_type, data in pairs(item_info_by_slot) do
		self:_unload_item_packages_by_slot(slot_type)
	end
end

MenuWorldPreviewer._unload_item_packages_by_slot = function (self, slot_type)
	local item_info_by_slot = self._item_info_by_slot

	if item_info_by_slot[slot_type] then
		local slot_type_data = item_info_by_slot[slot_type]
		local package_names = slot_type_data.package_names
		local package_manager = Managers.package
		local reference_name = self:_reference_name()

		for _, package_name in ipairs(package_names) do
			package_manager:unload(package_name, reference_name)
		end

		item_info_by_slot[slot_type] = nil
	end
end

MenuWorldPreviewer.clear_units = function (self, reset_camera)
	table.clear(self._requested_mip_streaming_units)

	local world = self.world

	for i = 1, 6, 1 do
		if type(self._equipment_units[i]) == "table" then
			if self._equipment_units[i].left then
				World.destroy_unit(world, self._equipment_units[i].left)

				self._equipment_units[i].left = nil
			end

			if self._equipment_units[i].right then
				World.destroy_unit(world, self._equipment_units[i].right)

				self._equipment_units[i].right = nil
			end
		elseif self._equipment_units[i] then
			World.destroy_unit(world, self._equipment_units[i])

			self._equipment_units[i] = nil
		end
	end

	if self.character_unit ~= nil then
		World.destroy_unit(world, self.character_unit)

		self.character_unit = nil

		if reset_camera then
			local default_animation_data = self._default_animation_data

			self:set_character_axis_offset("x", default_animation_data.x.value, 0.5, math.easeOutCubic)
			self:set_character_axis_offset("y", default_animation_data.y.value, 0.5, math.easeOutCubic)
			self:set_character_axis_offset("z", default_animation_data.z.value, 0.5, math.easeOutCubic)
		end
	end
end

MenuWorldPreviewer.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

return
