local DEFAULT_ANGLE = 0
UIUnitPreviewer = class(UIUnitPreviewer)

UIUnitPreviewer.init = function (self, unit_name, package_name, spawn_position, background_world, background_viewport, unique_id)
	self._background_world = background_world
	self._background_viewport = background_viewport
	self._unique_id = unique_id
	self._loaded_packages = {}
	self._packages_to_load = {}
	self._camera_xy_angle_target = DEFAULT_ANGLE
	self._camera_xy_angle_current = DEFAULT_ANGLE
	self._spawn_position = spawn_position
	self._unit_to_spawn = unit_name
	self._package_name = package_name

	self:_load_package(package_name)
end

UIUnitPreviewer.register_spawn_callback = function (self, callback)
	self._spawn_callback = callback
end

UIUnitPreviewer.activate_auto_spin = function (self)
	self._auto_spin_random_seed = math.random(5, 30000)
end

UIUnitPreviewer.destroy = function (self)
	self:_destroy_unit()
	self:_unload_package()
	table.clear(self._loaded_packages)
	table.clear(self._packages_to_load)

	self._background_viewport = nil
	self._background_world = nil
end

UIUnitPreviewer._destroy_unit = function (self)
	local world = self._background_world
	local spawned_unit = self._spawned_unit

	if spawned_unit then
		World.destroy_unit(world, spawned_unit)

		self._spawned_unit = nil
	end
end

UIUnitPreviewer.update = function (self, dt, t, input_service)
	if self._unit_spawned then
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

		local unit_xy_angle_new = math.lerp(self._camera_xy_angle_current, self._camera_xy_angle_target, 0.1)
		self._camera_xy_angle_current = unit_xy_angle_new
		local auto_tilt_angle, auto_turn_angle = self:_auto_spin_values(dt, t)
		local rotation = Quaternion.axis_angle(Vector3(0, auto_tilt_angle, 1), -(unit_xy_angle_new + auto_turn_angle))
		local unit = self._spawned_unit

		Unit.set_local_rotation(unit, 0, rotation)

		if self._zoom_dirty then
			local zoom_fraction = self._zoom_fraction or 0
			local unit_start_position = self._unit_start_position_boxed:unbox()
			unit_start_position[1] = unit_start_position[1] * (1 - zoom_fraction)
			unit_start_position[2] = unit_start_position[2] * (1 - zoom_fraction)

			Unit.set_local_position(unit, 0, unit_start_position)

			self._zoom_dirty = nil
		end
	end
end

UIUnitPreviewer.set_zoom_fraction = function (self, fraction)
	self._zoom_fraction = math.clamp(fraction, 0, 1)
	self._zoom_dirty = true
end

UIUnitPreviewer.set_zoom_fraction_unclamped = function (self, fraction)
	self._zoom_fraction = fraction
	self._zoom_dirty = true
end

UIUnitPreviewer.zoom_fraction = function (self)
	return self._zoom_fraction or 0
end

UIUnitPreviewer._auto_spin_values = function (self, dt, t)
	local start_seed = self._auto_spin_random_seed

	if not start_seed then
		return 0, 0
	end

	local progress_speed = 0.2
	local progress_range = 0.3
	local progress = math.sin((start_seed + t) * progress_speed) * progress_range
	local auto_tilt_angle = -(progress * 0.5)
	local auto_turn_angle = -((progress * math.pi) / 2)

	return auto_tilt_angle, auto_turn_angle
end

local mouse_pos_temp = {}

UIUnitPreviewer._handle_mouse_input = function (self, input_service, dt)
	local mouse = input_service:get("cursor")

	if not mouse then
		return
	end

	if input_service:get("left_press") then
		self._is_moving_camera = true
		self._last_mouse_position = nil
	elseif input_service:get("right_press") then
		self._camera_xy_angle_target = DEFAULT_ANGLE
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

UIUnitPreviewer._handle_controller_input = function (self, input_service, dt)
	local camera_move = input_service:get("gamepad_right_axis")

	if camera_move and Vector3.length(camera_move) > 0.01 then
		self._camera_xy_angle_target = self._camera_xy_angle_target + -camera_move.x * dt * 5
	end
end

UIUnitPreviewer.post_update = function (self, dt, t)
	if self._spawn_callback and self._unit_spawned then
		self._spawn_callback()

		self._spawn_callback = nil
	end
end

UIUnitPreviewer._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

UIUnitPreviewer._get_world = function (self)
	return self._background_world, self._background_viewport
end

UIUnitPreviewer._get_camera_position = function (self)
	local background_viewport = self._background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.position(camera)
end

UIUnitPreviewer._get_camera_rotation = function (self)
	local background_viewport = self._background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.rotation(camera)
end

UIUnitPreviewer._packages_loaded = function (self)
	local units_to_spawn = self.units_to_spawn
	local loaded_packages = self._loaded_packages

	for package_index, package_list in ipairs(units_to_spawn) do
		for index, package_data in ipairs(package_list) do
			if not loaded_packages[package_data.unit_name] then
				return false
			end
		end
	end

	return true
end

UIUnitPreviewer._load_package = function (self, package_name)
	local package_manager = Managers.package
	local cb = callback(self, "_on_load_complete", package_name)
	local reference_name = "UIUnitPreviewer"

	if self._unique_id then
		reference_name = reference_name .. tostring(self._unique_id)
	end

	package_manager:load(package_name, reference_name, cb, true)
end

UIUnitPreviewer._on_load_complete = function (self, package_name)
	self._package_loaded = true

	if self._unit_to_spawn and self._background_viewport then
		self._spawned_unit = self:_spawn_unit(self._unit_to_spawn, true)
		self._unit_to_spawn = nil
		self._unit_spawned = true
	end
end

UIUnitPreviewer._unload_package = function (self)
	local package_name = self._package_name
	local reference_name = "UIUnitPreviewer"

	if self._unique_id then
		reference_name = reference_name .. tostring(self._unique_id)
	end

	local package_manager = Managers.package

	package_manager:unload(package_name, reference_name)
end

UIUnitPreviewer._spawn_unit = function (self, unit_name, visible)
	local camera_rotation = self:_get_camera_rotation()
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), 0)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local spawn_position = self._spawn_position
	local camera_position = self:_get_camera_position()
	local unit_spawn_position = camera_position + camera_forward_vector
	unit_spawn_position = unit_spawn_position + Vector3(spawn_position[1], spawn_position[2], spawn_position[3])
	local world = self._background_world
	local unit = World.spawn_unit(world, unit_name, unit_spawn_position, unit_spawn_rotation)

	Unit.set_unit_visibility(unit, visible)

	local unit_start_position = Unit.world_position(unit, 0)
	self._unit_start_position_boxed = Vector3Box(unit_start_position)

	return unit
end

return
