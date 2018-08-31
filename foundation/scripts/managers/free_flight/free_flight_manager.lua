require("foundation/scripts/managers/free_flight/free_flight_controller_settings")
require("foundation/scripts/managers/free_flight/control_points")

FreeFlightManager = class(FreeFlightManager)

FreeFlightManager.init = function (self)
	self.current_control_point = 1
	self._has_terrain = not not rawget(_G, "TerrainDecoration")
	self.data = {}

	self:_setup_data(self.data)

	self._frames_to_step = 1
	self._max_players = 4
	self._input_service_wrapper = {
		get = function (self, id)
			local platform = PLATFORM
			local filter = FreeFlightFilters[platform][id]

			if filter then
				if filter.filter_type == "virtual_axis" then
					return Vector3(0, 0, 0)
				else
					return false
				end
			else
				local func = FreeFlightKeymaps[platform][id].input_mappings[1][3]

				if func == "pressed" or func == "held" then
					return false
				elseif func == "soft_button" then
					return 0
				elseif func == "axis" or func == "filter" then
					return Vector3(0, 0, 0)
				end
			end
		end
	}
end

FreeFlightManager.register_input_manager = function (self, input_manager)
	self.input_manager = input_manager

	input_manager:create_input_service("FreeFlight", "FreeFlightKeymaps", "FreeFlightFilters")
	input_manager:map_device_to_service("FreeFlight", "keyboard")
	input_manager:map_device_to_service("FreeFlight", "mouse")
	input_manager:map_device_to_service("FreeFlight", "gamepad")
end

FreeFlightManager.unregister_input_manager = function (self)
	self.input_manager = nil
end

FreeFlightManager.destroy = function (self)
	self.input_manager = nil
	self.data = nil
end

FreeFlightManager.update = function (self, dt)
	if Development.parameter("gdc") or GameSettingsDevelopment.disable_free_flight then
		return
	end

	if self._paused then
		Debug.text("FreeFlightManager: game is paused")
	end

	self:_update_global(dt)

	local player_manager = Managers.player

	for local_player_id, data in pairs(self.data) do
		if local_player_id ~= "global" then
			local player = player_manager:local_player(local_player_id)

			self:_update_player(dt, player, data)
		end
	end
end

FreeFlightManager.set_teleport_override = function (self, cb)
	self._teleport_override = cb
end

FreeFlightManager._get_camera = function (self, local_player_id)
	if local_player_id then
		local data = self.data[local_player_id]
		local name = data.viewport_name

		if not name then
			printf("[FreeFlightManager] Free flight camera for local player id %i not active. Try pressing f8 first.", local_player_id)

			return false
		end

		local world = Managers.world:world(data.viewport_world_name)

		return ScriptViewport.camera(ScriptWorld.free_flight_viewport(world, name))
	else
		local name = self.data.global.viewport_world_name

		if not name then
			printf("[FreeFlightManager] Global free flight camera not active. Press F9 first.")

			return false
		end

		local world = Managers.world:world(name)

		return ScriptViewport.camera(ScriptWorld.global_free_flight_viewport(world))
	end
end

FreeFlightManager.teleport_camera = function (self, local_player_id, pos, rot)
	local cam = self:_get_camera(local_player_id)

	if not cam then
		return
	end

	if rot then
		local pose = Matrix4x4.from_quaternion_position(rot, pos)

		ScriptCamera.set_local_pose(cam, pose)
	else
		ScriptCamera.set_local_position(cam, pos)
	end
end

FreeFlightManager.camera_position_rotation = function (self, local_player_id)
	local cam = self:_get_camera(local_player_id)

	if not cam then
		return
	end

	local pose = Camera.local_pose(cam)
	local position = ScriptCamera.position(cam)
	local rotation = ScriptCamera.rotation(cam)

	return position, rotation
end

FreeFlightManager._update_global = function (self, dt)
	local data = self.data.global
	local input_service = self:_resolve_input_service()
	local button_pressed = input_service:get("global_free_flight_toggle")
	local frustum_modifier = input_service:get("frustum_freeze_toggle")

	if data.active and not Managers.world:has_world(data.viewport_world_name) then
		self:_clear_global_free_flight(data)
	elseif data.active and frustum_modifier then
		local world = Managers.world:world(data.viewport_world_name)

		self:_toggle_frustum_freeze(dt, data, world, ScriptWorld.global_free_flight_viewport(world), true)
	elseif data.active and button_pressed then
		self:_exit_global_free_flight(data)
	elseif button_pressed then
		self:_enter_global_free_flight(data)
	elseif data.active then
		self:_update_global_free_flight(dt, data, input_service)
	end
end

FreeFlightManager._resolve_input_service = function (self)
	if self.input_manager then
		return self.input_manager:get_service("FreeFlight")
	else
		return self._input_service_wrapper
	end
end

FreeFlightManager._exit_frustum_freeze = function (self, data, world, viewport, destroy_camera)
	World.set_frustum_inspector_camera(world, nil)

	local camera = data.frustum_freeze_camera
	local camera_unit = Camera.get_data(camera, "unit")
	local cam = ScriptViewport.camera(viewport)
	local cam_unit = Camera.get_data(cam, "unit")
	local pose = Camera.local_pose(camera)

	Camera.set_local_pose(cam, cam_unit, pose)

	if destroy_camera then
		World.destroy_unit(world, camera_unit)
	end

	data.frustum_freeze_camera = nil
end

FreeFlightManager._enter_frustum_freeze = function (self, data, world, viewport, create_new_camera)
	local camera = nil
	local cam = ScriptViewport.camera(viewport)
	local cam_fov = Camera.vertical_fov(cam)

	if create_new_camera then
		local camera_unit = World.spawn_unit(world, "core/units/camera")
		camera = Unit.camera(camera_unit, "camera")

		Camera.set_data(camera, "unit", camera_unit)

		local pose = Camera.local_pose(cam)

		Camera.set_local_pose(camera, camera_unit, pose)
		Camera.set_vertical_fov(camera, cam_fov)
	else
		camera = cam
	end

	data.frustum_freeze_camera = camera

	World.set_frustum_inspector_camera(world, camera)
end

FreeFlightManager._toggle_frustum_freeze = function (self, dt, data, world, viewport, global)
	if data.frustum_freeze_camera then
		self:_exit_frustum_freeze(data, world, viewport, true)
	else
		self:_enter_frustum_freeze(data, world, viewport, true)
	end
end

FreeFlightManager.camera_pose = function (self, data)
	local world = Managers.world:world(data.viewport_world_name)
	local viewport = ScriptWorld.global_free_flight_viewport(world)
	local cam = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
	local cm = Camera.local_pose(cam)

	return cm
end

FreeFlightManager.set_pause_on_enter_freeflight = function (self, set)
	self._pause_on_enter_freeflight = set
end

FreeFlightManager.paused = function (self)
	return self._paused
end

FreeFlightManager._pause_game = function (self, set)
	self._paused = set
	local data = self.data.global
	local world = Managers.world:world(data.viewport_world_name)

	if set then
		ScriptWorld.pause(world)
	else
		ScriptWorld.unpause(world)
	end
end

FreeFlightManager._update_global_free_flight = function (self, dt, data, input_service)
	local world = Managers.world:world(data.viewport_world_name)
	local viewport = ScriptWorld.global_free_flight_viewport(world)
	local cam = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
	local projection_mode_swap = input_service:get("projection_mode")

	if projection_mode_swap and data.projection_type == Camera.PERSPECTIVE then
		data.projection_type = Camera.ORTHOGRAPHIC
	elseif projection_mode_swap and data.projection_type == Camera.ORTHOGRAPHIC then
		data.projection_type = Camera.PERSPECTIVE
	end

	Camera.set_projection_type(cam, data.projection_type)

	local translation_change_speed = data.translation_speed * 0.5
	local speed_change = Vector3.y(input_service:get("speed_change"))
	data.translation_speed = data.translation_speed + speed_change * translation_change_speed

	if data.translation_speed < 0.001 then
		data.translation_speed = 0.001
	end

	local cm = Camera.local_pose(cam)
	local trans = Matrix4x4.translation(cm)
	local mouse = input_service:get("look")

	if data.projection_type == Camera.ORTHOGRAPHIC then
		local ortho_data = data.orthographic_data
		ortho_data.yaw = (ortho_data.yaw or 0) - Vector3.x(mouse) * data.rotation_speed
		local q1 = Quaternion(Vector3(0, 0, 1), ortho_data.yaw)
		local q2 = Quaternion(Vector3.right(), -math.half_pi)
		local q = Quaternion.multiply(q1, q2)
		local x_trans = (input_service:get("move_right") - input_service:get("move_left")) * dt * 250
		local y_trans = (input_service:get("move_forward") - input_service:get("move_back")) * dt * 250
		local pos = trans + Quaternion.up(q) * y_trans + Quaternion.right(q) * x_trans
		cm = Matrix4x4.from_quaternion_position(q, pos)
		local size = ortho_data.size
		size = size - speed_change * size * dt
		ortho_data.size = size

		Camera.set_orthographic_view(cam, -size, size, -size, size)
	else
		Matrix4x4.set_translation(cm, Vector3(0, 0, 0))

		local q1 = Quaternion(Vector3(0, 0, 1), -Vector3.x(mouse) * data.rotation_speed)
		local q2 = Quaternion(Matrix4x4.x(cm), -Vector3.y(mouse) * data.rotation_speed)
		local q = Quaternion.multiply(q1, q2)
		cm = Matrix4x4.multiply(cm, Matrix4x4.from_quaternion(q))
		local x_trans = input_service:get("move_right") - input_service:get("move_left")
		local y_trans = input_service:get("move_forward") - input_service:get("move_back")

		if PLATFORM == "xb1" then
			local move = input_service:get("move")
			x_trans = move.x * 2
			y_trans = move.y * 2
		end

		local z_trans = input_service:get("move_up") - input_service:get("move_down")
		local offset = Matrix4x4.transform(cm, Vector3(x_trans, y_trans, z_trans) * data.translation_speed)
		trans = Vector3.add(trans, offset)

		Matrix4x4.set_translation(cm, trans)
	end

	if self._frames_until_pause then
		self._frames_until_pause = self._frames_until_pause - 1

		if self._frames_until_pause <= 0 then
			self._frames_until_pause = nil

			self:_pause_game(true)
		end
	elseif input_service:get("step_frame") then
		self:_pause_game(false)

		self._frames_until_pause = self._frames_to_step
	end

	if input_service:get("play_pause") then
		self:_pause_game(not self._paused)
	end

	if input_service:get("decrease_frame_step") then
		self._frames_to_step = (self._frames_to_step > 1 and self._frames_to_step - 1) or 1

		print("Frame step:", self._frames_to_step)
	elseif input_service:get("increase_frame_step") then
		self._frames_to_step = self._frames_to_step + 1

		print("Frame step:", self._frames_to_step)
	end

	local rot = Matrix4x4.rotation(cm)
	local wwise_world = Managers.world:wwise_world(world)

	WwiseWorld.set_listener(wwise_world, 0, cm)

	if self._has_terrain then
		TerrainDecoration.move_observer(world, data.terrain_decoration_observer, trans)
	end

	ScatterSystem.move_observer(World.scatter_system(world), data.scatter_system_observer, trans, rot)

	if input_service:get("mark") then
		print("Camera at: " .. tostring(cm))
	end

	if input_service:get("toggle_control_points") then
		cm = FreeFlightControlPoints[self.current_control_point]:unbox()
		self.current_control_point = self.current_control_point % #FreeFlightControlPoints + 1

		print("Control Point: " .. tostring(self.current_control_point))
	end

	if input_service:get("set_drop_position") then
		self:drop_player_at_camera_pos(cam)
	end

	ScriptCamera.set_local_pose(cam, cm)
end

FreeFlightManager.cleanup_free_flight = function (self)
	local global_data = self.data.global

	if global_data.active then
		self:_exit_global_free_flight(global_data)
	end

	local player_manager = Managers.player

	for local_player_id, data in pairs(self.data) do
		if local_player_id ~= "global" and data.active then
			local player = player_manager:local_player(local_player_id)

			self:_exit_free_flight(player, data)
		end
	end
end

FreeFlightManager._enter_global_free_flight = function (self, data)
	local world = Application.main_world()

	if not world then
		return
	end

	local viewport = ScriptWorld.create_global_free_flight_viewport(world, "default")

	if not viewport then
		return
	end

	data.active = true
	data.viewport_world_name = ScriptWorld.name(world)
	local cam = ScriptViewport.camera(viewport)
	local tm = Camera.local_pose(cam)
	local position = Matrix4x4.translation(tm)
	local rotation = Matrix4x4.rotation(tm)

	if self._has_terrain then
		data.terrain_decoration_observer = TerrainDecoration.create_observer(world, position)
	end

	data.scatter_system_observer = ScatterSystem.make_observer(World.scatter_system(world), position, rotation)

	if self._pause_on_enter_freeflight then
		self:_pause_game(true)
	end

	self.input_manager:block_device_except_service("FreeFlight", "keyboard", nil, "free_flight")
	self.input_manager:block_device_except_service("FreeFlight", "mouse", nil, "free_flight")
	self.input_manager:block_device_except_service("FreeFlight", "gamepad", nil, "free_flight")
	self.input_manager:device_unblock_service("keyboard", 1, "DebugMenu")
	self.input_manager:device_unblock_service("mouse", 1, "DebugMenu")
	self.input_manager:device_unblock_service("gamepad", 1, "DebugMenu")
	self.input_manager:device_unblock_service("keyboard", 1, "Debug")
	self.input_manager:device_unblock_service("mouse", 1, "Debug")
	self.input_manager:device_unblock_service("gamepad", 1, "Debug")
end

FreeFlightManager._exit_global_free_flight = function (self, data)
	local world = Managers.world:world(data.viewport_world_name)

	if data.frustum_freeze_camera then
		self:_exit_frustum_freeze(data, world, ScriptWorld.global_free_flight_viewport(world), true)
	end

	local world_name = data.viewport_world_name

	if self._has_terrain then
		TerrainDecoration.destroy_observer(world, data.terrain_decoration_observer)
	end

	ScatterSystem.destroy_observer(World.scatter_system(world), data.scatter_system_observer)

	if self._paused then
		self:_pause_game(false)
	end

	data.active = false
	data.viewport_world_name = nil

	ScriptWorld.destroy_global_free_flight_viewport(Managers.world:world(world_name))
	self.input_manager:device_unblock_all_services("keyboard")
	self.input_manager:device_unblock_all_services("mouse")
	self.input_manager:device_unblock_all_services("gamepad")
end

FreeFlightManager._clear_global_free_flight = function (self, data)
	data.active = false
	data.viewport_world_name = nil
end

FreeFlightManager._update_player = function (self, dt, player, data)
	local input_service = data.input_service
	local frustum_freeze_toggle = input_service:get("frustum_freeze_toggle")
	local free_flight_toggle = input_service:get("free_flight_toggle")

	if data.active and not Managers.world:has_world(data.viewport_world_name) then
		self:_clear_free_flight(data)
	elseif data.active and frustum_freeze_toggle then
		local world = Managers.world:world(data.viewport_world_name)

		self:_toggle_frustum_freeze(dt, data, world, ScriptWorld.free_flight_viewport(world, data.viewport_name))
	elseif data.active and free_flight_toggle then
		self:_exit_free_flight(player, data)
	elseif free_flight_toggle then
		self:_enter_free_flight(player, data)
	elseif data.active and not self.data.global.active then
		self:_update_free_flight(dt, player, data)
	end
end

FreeFlightManager._clear_free_flight = function (self, data)
	data.active = false
	data.viewport_world_name = nil
	data.viewport_name = nil
end

FreeFlightManager.register_player = function (self, local_player_id)
	local input_service = self.input_manager:get_service("FreeFlight")
	self.data[local_player_id] = {
		mode = "paused",
		current_translation_max_speed = 10,
		dof_focal_distance = 10,
		acceleration = 10,
		dof_focal_region_end = 4,
		dof_focal_near_scale = 1,
		rotation_speed = 0.003,
		dof_focal_far_scale = 1,
		dof_focal_region_start = 4,
		dof_enabled = 0,
		active = false,
		dof_focal_region = 8,
		input_service = input_service,
		rotation_accumulation = Vector3Box(),
		current_translation_speed = Vector3Box()
	}
end

FreeFlightManager.unregister_player = function (self, local_player_id)
	local data = self.data[local_player_id]

	fassert(data, "Trying to unregister player %i not registered", local_player_id)

	if data.active then
		self:_clear_free_flight(data)
	end

	self.data[local_player_id] = nil
end

FreeFlightManager._setup_data = function (self, data)
	data.global = {
		translation_speed = 0.05,
		rotation_speed = 0.003,
		mode = "paused",
		active = false,
		projection_type = Camera.PERSPECTIVE,
		orthographic_data = {
			size = 100
		}
	}
end

FreeFlightManager._enter_free_flight = function (self, player, data)
	local world_name = player.viewport_world_name
	local viewport_name = player.viewport_name
	local world = Managers.world:world(world_name)
	data.active = true
	data.viewport_name = player.viewport_name
	data.viewport_world_name = world_name
	local viewport = ScriptWorld.create_free_flight_viewport(world, viewport_name, "default")
	local cam = ScriptViewport.camera(viewport)
	local tm = Camera.local_pose(cam)
	local position = Matrix4x4.translation(tm)
	local rotation = Matrix4x4.rotation(tm)

	if self._has_terrain then
		data.terrain_decoration_observer = TerrainDecoration.create_observer(world, position)
	end

	data.scatter_system_observer = ScatterSystem.make_observer(World.scatter_system(world), position, rotation)

	self.input_manager:block_device_except_service("FreeFlight", "keyboard", nil, "free_flight")
	self.input_manager:block_device_except_service("FreeFlight", "mouse", nil, "free_flight")
	self.input_manager:block_device_except_service("FreeFlight", "gamepad", nil, "free_flight")
end

FreeFlightManager._exit_free_flight = function (self, player, data)
	local world = Managers.world:world(data.viewport_world_name)

	if data.frustum_freeze_camera then
		self:_exit_frustum_freeze(data, world, ScriptWorld.viewport(world, data.viewport_name))
	end

	local viewport_name = data.viewport_name
	data.active = false
	data.viewport_name = nil
	data.viewport_world_name = nil

	if self._has_terrain then
		TerrainDecoration.destroy_observer(world, data.terrain_decoration_observer)
	end

	ScatterSystem.destroy_observer(World.scatter_system(world), data.scatter_system_observer)

	data.terrain_decoration_observer = nil
	data.scatter_system_observer = nil

	ScriptWorld.destroy_free_flight_viewport(world, viewport_name)
	self.input_manager:device_unblock_all_services("keyboard")
	self.input_manager:device_unblock_all_services("mouse")
	self.input_manager:device_unblock_all_services("gamepad")
end

FreeFlightManager.active = function (self, player_index)
	return self.data[player_index] and self.data[player_index].active
end

FreeFlightManager.mode = function (self, player_index)
	return self.data[player_index].mode
end

FreeFlightManager._update_free_flight = function (self, dt, player, data)
	local world = Managers.world:world(data.viewport_world_name)
	local viewport = ScriptWorld.free_flight_viewport(world, data.viewport_name)
	local cam = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
	local input = self.input_manager:get_service("FreeFlight")
	local translation_change_speed = data.current_translation_max_speed * 0.5
	local speed_change = Vector3.y(input:get("speed_change") or Vector3(0, 0, 0))
	data.current_translation_max_speed = math.max(data.current_translation_max_speed + speed_change * translation_change_speed, 0.01)
	local cm = Camera.local_pose(cam)
	local trans = Matrix4x4.translation(cm)

	Matrix4x4.set_translation(cm, Vector3(0, 0, 0))

	local mouse = input:get("look")
	local rotation_accumulation = data.rotation_accumulation:unbox() + mouse
	local rotation = rotation_accumulation * math.min(dt, 1) * (player.free_flight_movement_filter_speed or 15)

	data.rotation_accumulation:store(rotation_accumulation - rotation)

	local q1 = Quaternion(Vector3(0, 0, 1), -Vector3.x(rotation) * data.rotation_speed)
	local q2 = Quaternion(Matrix4x4.x(cm), -Vector3.y(rotation) * data.rotation_speed)
	local q = Quaternion.multiply(q1, q2)
	cm = Matrix4x4.multiply(cm, Matrix4x4.from_quaternion(q))
	local wanted_speed = input:get("move") * data.current_translation_max_speed
	local current_speed = data.current_translation_speed:unbox()
	local speed_difference = wanted_speed - current_speed
	local speed_distance = Vector3.length(speed_difference)
	local speed_difference_direction = Vector3.normalize(speed_difference)

	if speed_change ~= 0 then
		data.acceleration = (player.free_flight_acceleration_factor or 5) * Vector3.length(speed_difference)
	end

	local acceleration = data.acceleration
	local new_speed = current_speed + speed_difference_direction * math.min(speed_distance, acceleration * dt)

	if not Vector3.equal(new_speed, current_speed) then
	end

	data.current_translation_speed:store(new_speed)

	local rot = Matrix4x4.rotation(cm)
	local offset = (Quaternion.forward(rot) * new_speed.y + Quaternion.right(rot) * new_speed.x + Quaternion.up(rot) * new_speed.z) * dt
	trans = Vector3.add(trans, offset)

	Matrix4x4.set_translation(cm, trans)
	ScriptCamera.set_local_pose(cam, cm)

	local wwise_world = Managers.world:wwise_world(world)

	WwiseWorld.set_listener(wwise_world, 0, cm)

	if self._has_terrain then
		TerrainDecoration.move_observer(world, data.terrain_decoration_observer, trans)
	end

	ScatterSystem.move_observer(World.scatter_system(world), data.scatter_system_observer, trans, rot)

	if input:get("set_drop_position") then
		self:drop_player_at_camera_pos(cam, player)
	end

	if input:get("increase_fov") then
		local old_fov = Camera.vertical_fov(cam)

		Camera.set_vertical_fov(cam, old_fov + math.pi / 72)
	end

	if input:get("decrease_fov") then
		local old_fov = Camera.vertical_fov(cam)

		Camera.set_vertical_fov(cam, old_fov - math.pi / 72)
	end

	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		if input:get("toggle_dof") and not input:get("dof_reset") then
			data.dof_enabled = 1 - data.dof_enabled
		end

		if input:get("inc_dof_distance") and not input:get("inc_dof_region") and not input:get("inc_dof_padding") and not input:get("inc_dof_scale") then
			data.dof_focal_distance = data.dof_focal_distance + 0.2

			print("Dof Focal Distance: ", data.dof_focal_distance)
		end

		if input:get("dec_dof_distance") and not input:get("dec_dof_region") and not input:get("dec_dof_padding") and not input:get("dec_dof_scale") then
			data.dof_focal_distance = data.dof_focal_distance - 0.2

			if data.dof_focal_distance < 0 then
				data.dof_focal_distance = 0
			end

			print("Dof Focal Distance: ", data.dof_focal_distance)
		end

		if input:get("inc_dof_region") then
			data.dof_focal_region = data.dof_focal_region + 0.2

			print("Dof Focal Region: ", data.dof_focal_region)
		end

		if input:get("dec_dof_region") then
			data.dof_focal_region = data.dof_focal_region - 0.2

			if data.dof_focal_region < 0 then
				data.dof_focal_region = 0
			end

			print("Dof Focal Region: ", data.dof_focal_region)
		end

		if input:get("inc_dof_padding") then
			data.dof_focal_region_start = data.dof_focal_region_start + 0.1
			data.dof_focal_region_end = data.dof_focal_region_end + 0.1

			print("Dof Focal Padding: ", data.dof_focal_region_start)
		end

		if input:get("dec_dof_padding") then
			data.dof_focal_region_start = data.dof_focal_region_start - 0.1
			data.dof_focal_region_end = data.dof_focal_region_end - 0.1

			if data.dof_focal_region_start < 0 then
				data.dof_focal_region_start = 0
			end

			if data.dof_focal_region_end < 0 then
				data.dof_focal_region_end = 0
			end

			print("Dof Focal Padding: ", data.dof_focal_region_start)
		end

		if input:get("inc_dof_scale") then
			data.dof_focal_near_scale = data.dof_focal_near_scale + 0.02
			data.dof_focal_far_scale = data.dof_focal_far_scale + 0.02

			if data.dof_focal_near_scale > 1 then
				data.dof_focal_near_scale = 1
			end

			if data.dof_focal_far_scale > 1 then
				data.dof_focal_far_scale = 1
			end

			print("Dof Focal Scale: ", data.dof_focal_near_scale)
		end

		if input:get("dec_dof_scale") then
			data.dof_focal_near_scale = data.dof_focal_near_scale - 0.02
			data.dof_focal_far_scale = data.dof_focal_far_scale - 0.02

			if data.dof_focal_near_scale < 0 then
				data.dof_focal_near_scale = 0
			end

			if data.dof_focal_far_scale < 0 then
				data.dof_focal_far_scale = 0
			end

			print("Dof Focal Scale: ", data.dof_focal_near_scale)
		end

		if input:get("dof_reset") then
			data.dof_focal_distance = 10
			data.dof_focal_region = 8
			data.dof_focal_region_start = 3
			data.dof_focal_region_end = 3
			data.dof_focal_near_scale = 1
			data.dof_focal_far_scale = 1

			print("Dof Focal Distance: ", data.dof_focal_distance)
			print("Dof Focal Region: ", data.dof_focal_region)
			print("Dof Focal Padding: ", data.dof_focal_region_start)
			print("Dof Focal Scale: ", data.dof_focal_near_scale)
		end

		ShadingEnvironment.set_scalar(shading_env, "dof_enabled", data.dof_enabled)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_distance", data.dof_focal_distance)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_region", data.dof_focal_region)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_region_start", data.dof_focal_region_start)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_region_end", data.dof_focal_region_end)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_near_scale", data.dof_focal_near_scale)
		ShadingEnvironment.set_scalar(shading_env, "dof_focal_far_scale", data.dof_focal_far_scale)

		if ShadingEnvironment.scalar(shading_env, "dof_enabled") then
			ShadingEnvironment.apply(shading_env)
		end
	end
end

FreeFlightManager.drop_player_at_camera_pos = function (self, cam, player)
	local pos = Camera.local_position(cam)
	local rot = Camera.local_rotation(cam)

	if self._teleport_override then
		self._teleport_override(pos, rot)
	elseif player and player.camera_follow_unit then
		Unit.set_local_position(player.camera_follow_unit, 0, pos)

		local mover = Unit.mover(player.camera_follow_unit)

		if mover then
			Mover.set_position(mover, pos)
		end
	end
end

return
