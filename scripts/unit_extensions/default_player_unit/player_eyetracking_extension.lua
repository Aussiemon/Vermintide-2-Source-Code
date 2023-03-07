PlayerEyeTrackingExtension = class(PlayerEyeTrackingExtension)

PlayerEyeTrackingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.unit = unit
	self.current_gaze_forward = Vector3Box()

	self.current_gaze_forward:store(Vector3.forward())

	self.is_aiming = false
	self.is_aiming_cancelled = false
	self.extended_view = {
		pitch = 0,
		yaw = 0
	}
	self.aim_fade_out_time = 0.4
	self.current_fade_out_time = 0
	self.time_since_last_gaze_point = 100
	self.eyetracking_options_opened = false
	self.is_connected = true

	if rawget(_G, "Tobii") then
		local tobii_extended_view_sensitivity = Application.user_setting("tobii_extended_view_sensitivity")

		if tobii_extended_view_sensitivity ~= nil then
			Tobii.set_extended_view_responsiveness(tobii_extended_view_sensitivity / 100)
		end

		local tobii_extended_view_use_head_tracking = Application.user_setting("tobii_extended_view_use_head_tracking")

		if tobii_extended_view_use_head_tracking ~= nil then
			Tobii.set_extended_view_use_head_tracking(tobii_extended_view_use_head_tracking)
		end
	end
end

PlayerEyeTrackingExtension.update = function (self, unit, input, dt, context, t)
	if not rawget(_G, "Tobii") or not Application.user_setting("tobii_eyetracking") then
		return
	end

	self.is_connected = Tobii.get_is_connected()

	if not self.is_connected then
		return
	end

	self:update_extended_view(dt)
	self:update_forward_rayhit()
	self:calc_gaze_forward()
end

PlayerEyeTrackingExtension.set_eyetracking_options_opened = function (self, opened)
	self.eyetracking_options_opened = opened
end

PlayerEyeTrackingExtension.update_extended_view = function (self, dt)
	if self.is_aiming then
		self.current_fade_out_time = self.current_fade_out_time + dt

		if self.aim_fade_out_time < self.current_fade_out_time then
			self.current_fade_out_time = self.aim_fade_out_time
		end
	else
		self.current_fade_out_time = self.current_fade_out_time - dt

		if self.current_fade_out_time < 0 then
			self.current_fade_out_time = 0
		end

		local yaw, pitch = Tobii.get_extended_view()
		self.extended_view.yaw = yaw
		self.extended_view.pitch = pitch
	end

	self.extended_view.yaw = self.extended_view.yaw * (1 - self.current_fade_out_time / self.aim_fade_out_time)
	self.extended_view.pitch = self.extended_view.pitch * (1 - self.current_fade_out_time / self.aim_fade_out_time)
	local input_manager = Managers.input
	local player_input_service = input_manager:get_service("Player")
	local controlling_player = not player_input_service:is_blocked()
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	if not self.eyetracking_options_opened and (not controlling_player or cutscene_system and cutscene_system.active_camera and not cutscene_system.ingame_hud_enabled) then
		self.extended_view.yaw = 0.15 * self.extended_view.yaw
		self.extended_view.pitch = 0.15 * self.extended_view.pitch
	end

	if cutscene_system and cutscene_system.active_camera then
		self.extended_view.yaw = 0
		self.extended_view.pitch = 0
	end

	Managers.state.camera:set_tobii_extended_view(self.extended_view.yaw, self.extended_view.pitch)
end

PlayerEyeTrackingExtension.get_extended_view = function (self, rotation)
	return self.extended_view.yaw, self.extended_view.pitch
end

PlayerEyeTrackingExtension.get_direction_without_extended_view = function (self, rotation)
	if not Application.user_setting("tobii_extended_view") then
		return rotation
	end

	local yaw_offset = Quaternion(Vector3.up(), self.extended_view.yaw)
	yaw_offset = Quaternion.multiply(Quaternion.inverse(rotation), yaw_offset)
	yaw_offset = Quaternion.multiply(yaw_offset, rotation)
	local pitch_offset = Quaternion(Vector3.right(), -self.extended_view.pitch)
	local total_offset = Quaternion.multiply(yaw_offset, pitch_offset)

	return Quaternion.multiply(rotation, total_offset)
end

PlayerEyeTrackingExtension.update_forward_rayhit = function (self)
	local first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	local cam_position = first_person_extension:current_position()
	local cam_rotation = first_person_extension:current_rotation()
	local cam_forward = Quaternion.forward(cam_rotation)
	local found_collision, world_pos = self.physics_world:immediate_raycast(cam_position + cam_forward, cam_forward, 100, "closest", "collision_filter", "filter_ray_ping")

	if not found_collision then
		world_pos = cam_position + cam_forward * 100
	end

	if self.forward_rayhit_position then
		self.forward_rayhit_position:store(world_pos)
	else
		self.forward_rayhit_position = Vector3Box(world_pos)
	end
end

PlayerEyeTrackingExtension.update_gaze_rayhit = function (self)
	local first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	local position = first_person_extension:current_position()
	local forward = self:gaze_forward()
	local found_collision, world_pos = self.physics_world:immediate_raycast(position + forward, forward, 100, "closest", "collision_filter", "filter_ray_ping")

	if not found_collision then
		world_pos = position + forward * 100
	end

	if self.gaze_rayhit_position then
		self.gaze_rayhit_position:store(world_pos)
	else
		self.gaze_rayhit_position = Vector3Box(world_pos)
	end
end

PlayerEyeTrackingExtension.calc_gaze_forward = function (self)
	local first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	local gaze_point_x, gaze_point_y = Tobii.get_gaze_point()
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local gaze_x = screen_width * (1 + gaze_point_x) * 0.5
	local gaze_y = screen_height * (1 + gaze_point_y) * 0.5
	local player = Managers.player:owner(self.unit)
	local viewport_name = player.viewport_name
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local gaze_in_world = Camera.screen_to_world(camera, Vector3(gaze_x, gaze_y, 0), 0.1)
	local current_position = first_person_extension:current_position()
	local forward = Vector3.normalize(gaze_in_world - current_position)

	self.current_gaze_forward:store(forward)
end

PlayerEyeTrackingExtension.gaze_forward = function (self)
	return self.current_gaze_forward:unbox()
end

PlayerEyeTrackingExtension.gaze_rotation = function (self)
	local forward = self:gaze_forward()

	return Quaternion.look(forward, Vector3.up())
end

PlayerEyeTrackingExtension.get_forward_rayhit = function (self)
	return self.forward_rayhit_position and self.forward_rayhit_position:unbox() or nil
end

PlayerEyeTrackingExtension.get_gaze_rayhit = function (self)
	self:update_gaze_rayhit()

	return self.gaze_rayhit_position and self.gaze_rayhit_position:unbox() or nil
end

PlayerEyeTrackingExtension.get_is_aiming = function (self)
	return self.is_aiming
end

PlayerEyeTrackingExtension.set_is_aiming = function (self, is_aiming)
	self.is_aiming = is_aiming
end

PlayerEyeTrackingExtension.get_aim_at_gaze_cancelled = function (self)
	return self.is_aiming_cancelled
end

PlayerEyeTrackingExtension.set_aim_at_gaze_cancelled = function (self, is_cancelled)
	self.is_aiming_cancelled = is_cancelled
end

PlayerEyeTrackingExtension.get_is_feature_enabled = function (self, feature)
	local HAS_TOBII = rawget(_G, "Tobii") and Application.user_setting("tobii_eyetracking")

	return HAS_TOBII and self.is_connected and Application.user_setting(feature) and Tobii.get_time_since_last_gaze_point() < 5
end

PlayerEyeTrackingExtension.get_is_connected = function (self)
	return self.is_connected
end
