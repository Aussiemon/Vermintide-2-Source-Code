require("scripts/ui/views/world_hero_previewer")

local DEFAULT_ANGLE = math.degrees_to_radians(0)
MenuWorldPreviewer = class(MenuWorldPreviewer, HeroPreviewer)
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
	},
	default = {
		z = 0.4,
		x = 0,
		y = 1
	}
}

MenuWorldPreviewer.init = function (self, ingame_ui_context, optional_camera_character_positions, unique_id, delayed_spawn)
	MenuWorldPreviewer.super.init(self, ingame_ui_context, unique_id, delayed_spawn)

	self.input_manager = ingame_ui_context.input_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._character_camera_positions = optional_camera_character_positions or camera_position_by_character
	local player_manager = Managers.player
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
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
	self._units = {}
	self._requested_unit_spawn_queue = {}
end

MenuWorldPreviewer.destroy = function (self)
	MenuWorldPreviewer.super.destroy(self)
	Renderer.set_automatic_streaming(true)
	GarbageLeakDetector.register_object(self, "MenuWorldPreviewer")
end

MenuWorldPreviewer.on_enter = function (self, viewport_widget, hero_name)
	MenuWorldPreviewer.super.on_enter(self)
	self:setup_viewport(viewport_widget, hero_name)
end

MenuWorldPreviewer.setup_viewport = function (self, viewport_widget, hero_name)
	self.viewport_widget = viewport_widget
	local preview_pass_data = viewport_widget.element.pass_data[1]
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
	self.camera_xy_angle_current = DEFAULT_ANGLE
	self.camera_xy_angle_target = DEFAULT_ANGLE
	self._requested_unit_spawn_queue = {}
	self._units = {}
end

local EMPTY_TABLE = {}

MenuWorldPreviewer.activate = function (self, activate, viewport_widget, hero_name)
	if not self._delayed_spawn then
		return
	end

	if self._activated == activate then
		return
	end

	if activate then
		self:setup_viewport(viewport_widget, hero_name)

		self._requested_hero_spawn_data = self._delayed_hero_spawn_data or EMPTY_TABLE
		self._requested_unit_spawn_queue = self._delayed_unit_spawn_queue or EMPTY_TABLE
	else
		local reset_camera = true

		self:clear_units(reset_camera)

		self.world = nil
	end

	self._activated = activate
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

MenuWorldPreviewer.on_exit = function (self)
	MenuWorldPreviewer.super.on_exit(self)
	Renderer.set_automatic_streaming(true)
end

MenuWorldPreviewer.update = function (self, dt, t, input_disabled)
	self._requested_unit_spawn_queue = self._delayed_unit_spawn_queue or EMPTY_TABLE

	MenuWorldPreviewer.super.update(self, dt, t)

	if not self._activated then
		return
	end

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
	self:_handle_unit_spawn_request()
	MenuWorldPreviewer.super.post_update(self, dt)
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
	if self._force_hide_character then
		return
	end

	MenuWorldPreviewer.super._update_units_visibility(self, dt)
end

MenuWorldPreviewer._set_character_visibility = function (self, visible, camera_move_duration, disable_camera_position_update)
	MenuWorldPreviewer.super._set_character_visibility(self, visible)

	if disable_camera_position_update then
		return
	end

	local camera_move_duration = camera_move_duration or self._camera_move_duration

	if camera_move_duration then
		local x = 0
		local y = 0
		local z = 0

		if visible then
			local profile_name = self._current_profile_name

			if profile_name then
				local character_camera_positions = self._character_camera_positions
				local new_character_position = character_camera_positions[profile_name] or character_camera_positions.default
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

MenuWorldPreviewer._update_camera_animation_data = function (self, animation_data, dt)
	for axis, data in pairs(animation_data) do
		if data.total_time then
			local old_time = data.time
			data.time = math.min(old_time + dt, data.total_time)
			local progress = math.min(1, data.time / data.total_time)
			local func = data.func
			data.value = (data.to - data.from) * (func and func(progress) or progress) + data.from

			if progress == 1 then
				data.total_time = nil
			end
		end
	end
end

MenuWorldPreviewer.set_camera_axis_offset = function (self, axis, value, animation_time, func_ptr, fixed_position)
	local data = self._camera_position_animation_data[axis]
	local camera_default_position = self._camera_default_position
	data.from = animation_time and data.value or value
	data.to = fixed_position and value + -camera_default_position[axis] or value
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
	data.from = animation_time and data.value or value
	data.to = value
	data.total_time = animation_time
	data.time = 0
	data.func = func_ptr
	data.value = data.from
end

MenuWorldPreviewer.set_character_axis_offset = function (self, axis, value, animation_time, func_ptr)
	local data = self._camera_character_position_animation_data[axis]
	data.from = animation_time and data.value or value
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

	if self._delayed_spawn then
		self._delayed_hero_spawn_data = table.clone(self._requested_hero_spawn_data)
	end

	self:clear_units(reset_camera)

	self._draw_character = true
end

MenuWorldPreviewer.request_spawn_unit = function (self, unit_name, unit_type, cb)
	local queue = self._requested_unit_spawn_queue
	queue[#queue + 1] = {
		frame_delay = 1,
		unit_name = unit_name,
		unit_type = unit_type,
		callback = cb
	}

	if self._delayed_spawn then
		self._delayed_unit_spawn_queue = table.clone(queue)
	end
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

MenuWorldPreviewer._handle_unit_spawn_request = function (self)
	if #self._requested_unit_spawn_queue < 1 then
		return
	end

	local unit_data = self._requested_unit_spawn_queue[1]
	local frame_delay = unit_data.frame_delay

	if frame_delay == 0 then
		self:_spawn_unit(unit_data.unit_name, unit_data)
		table.remove(self._requested_unit_spawn_queue, 1)
	else
		unit_data.frame_delay = frame_delay - 1
	end
end

MenuWorldPreviewer._load_hero_unit = function (self, profile_name, career_index, state_character, callback, optional_scale, camera_move_duration, optional_skin)
	self.camera_xy_angle_target = DEFAULT_ANGLE

	if not self._delayed_spawn then
		self:_unload_all_packages()
	end

	camera_move_duration = camera_move_duration or 0.01
	local character_camera_positions = self._character_camera_positions
	local new_character_position = character_camera_positions[profile_name] or character_camera_positions.default

	self:set_character_axis_offset("x", new_character_position.x, camera_move_duration, math.easeOutCubic)
	self:set_character_axis_offset("y", new_character_position.y, camera_move_duration, math.easeOutCubic)
	self:set_character_axis_offset("z", new_character_position.z, camera_move_duration, math.easeOutCubic)

	self._camera_move_duration = camera_move_duration
	self._current_profile_name = profile_name
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local item_data = skin_item and skin_item.data
	local skin_name = optional_skin or item_data and item_data.name or career.base_skin

	if state_character then
		skin_name = career.base_skin
	end

	self._current_career_name = career_name
	self.character_unit_skin_data = nil
	local package_names = CosmeticsUtils.retrieve_skin_packages_for_preview(skin_name)
	local skin_data = Cosmetics[skin_name]
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

MenuWorldPreviewer._spawn_hero_unit = function (self, skin_data, optional_scale, career_index)
	MenuWorldPreviewer.super._spawn_hero_unit(self, skin_data, optional_scale, career_index)

	if self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_character then
		self:_request_mip_streaming_for_unit(self.character_unit)
	end
end

MenuWorldPreviewer.respawn_hero_unit = function (self, profile_name, career_index, state_character, callback, camera_move_duration)
	local reset_camera = true

	self:request_spawn_hero_unit(profile_name, career_index, state_character, callback, nil, camera_move_duration, nil, reset_camera)
end

MenuWorldPreviewer._spawn_item = function (self, item_name, spawn_data)
	local hero_material_changed = MenuWorldPreviewer.super._spawn_item(self, item_name, spawn_data)

	if hero_material_changed and (self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_character) then
		self:_request_mip_streaming_for_unit(self.character_unit)
	end
end

MenuWorldPreviewer._spawn_item_unit = function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
	MenuWorldPreviewer.super._spawn_item_unit(self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)

	if self._use_highest_mip_levels or UISettings.wait_for_mip_streaming_items then
		self:_request_mip_streaming_for_unit(unit)
	end
end

MenuWorldPreviewer._spawn_unit = function (self, unit_name, item_data)
	local unit = World.spawn_unit(self.world, unit_name)
	self._units[#self._units + 1] = unit
	self._hidden_units[unit] = true

	Unit.set_unit_visibility(unit, false)

	local cb = item_data.callback

	if cb then
		cb(unit)
	end
end

MenuWorldPreviewer.set_unit_location = function (self, unit, location)
	if location and unit and Unit.alive(unit) then
		Unit.set_local_position(unit, 0, Vector3Aux.unbox(location))
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

MenuWorldPreviewer._reference_name = function (self)
	local reference_name = "MenuWorldPreviewer"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	return reference_name
end

MenuWorldPreviewer.clear_units = function (self, reset_camera)
	MenuWorldPreviewer.super.clear_units(self)

	if reset_camera then
		local default_animation_data = self._default_animation_data

		self:set_character_axis_offset("x", default_animation_data.x.value, 0.5, math.easeOutCubic)
		self:set_character_axis_offset("y", default_animation_data.y.value, 0.5, math.easeOutCubic)
		self:set_character_axis_offset("z", default_animation_data.z.value, 0.5, math.easeOutCubic)
	end

	local units = self._units

	if units then
		for i = 1, #units do
			World.destroy_unit(self.world, units[i])
		end
	end

	self._units = {}
end

MenuWorldPreviewer.hide_character = function (self)
	self._draw_character = false
end

MenuWorldPreviewer.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

MenuWorldPreviewer.trigger_level_flow_event = function (self, event_name)
	return Level.trigger_event(self.level, event_name)
end
