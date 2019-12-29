CameraStateInteraction = class(CameraStateInteraction, CameraState)

CameraStateInteraction.init = function (self, camera_state_init_context)
	CameraState.init(self, camera_state_init_context, "camera_state_interaction")
end

CameraStateInteraction.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	local camera_interaction_name = params.camera_interaction_name
	local world_manager = Managers.world

	if world_manager:has_world("level_world") then
		local camera_target_unit = nil
		local world = world_manager:world("level_world")
		local mechanism = Managers.mechanism:game_mechanism()
		local inn_level_name = mechanism:get_hub_level_key()
		local level_settings = LevelSettings[inn_level_name]
		local level_name = level_settings.level_name
		local level = ScriptWorld.level(world, level_name)

		if level then
			local units = Level.units(level)

			for i, level_unit in ipairs(units) do
				if Unit.has_data(level_unit, "camera_interaction_name") and Unit.get_data(level_unit, "camera_interaction_name") == camera_interaction_name then
					camera_target_unit = level_unit

					break
				end
			end
		end

		self.camera_target_unit = camera_target_unit
		self.total_lerp_time = UISettings.map.camera_time_enter
		self.lerp_time = 0
		self.progress = 0
		self.calculate_lerp = true
		self.camera_start_pose = Matrix4x4Box(Unit.world_pose(unit, 0))
	end
end

CameraStateInteraction.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.camera_target_unit = nil
end

CameraStateInteraction.update = function (self, unit, input, dt, context, t)
	local csm = self.csm
	local unit = self.unit
	local camera_extension = self.camera_extension
	local camera_target_unit = self.camera_target_unit

	if not Unit.alive(camera_target_unit) then
		csm:change_state("idle")

		return
	end

	local external_state_change = camera_extension.external_state_change
	local external_state_change_params = camera_extension.external_state_change_params

	if external_state_change and external_state_change ~= self.name then
		csm:change_state(external_state_change, external_state_change_params)
		camera_extension:set_external_state_change(nil)

		return
	end

	if self.calculate_lerp and camera_target_unit then
		local total_lerp_time = self.total_lerp_time
		local lerp_time = self.lerp_time
		local progress = self.progress
		local current_lerp_time = math.min(lerp_time + dt, total_lerp_time)
		local current_progress = current_lerp_time / total_lerp_time
		local smoothstep = math.smoothstep(current_progress, 0, 1)
		local camera_target_pose = Unit.world_pose(camera_target_unit, 0)
		local camera_pose = self.camera_start_pose:unbox()
		local lerp_pose = Matrix4x4.lerp(camera_pose, camera_target_pose, smoothstep)

		assert(Matrix4x4.is_valid(lerp_pose), "Camera lerp pose invalid.")
		Unit.set_local_pose(unit, 0, lerp_pose)

		if progress == 1 then
			self.calculate_lerp = nil
			self.camera_start_pose = nil
			self.total_lerp_time = nil
			self.lerp_time = nil
			self.progress = nil
		else
			self.progress = current_progress
			self.lerp_time = current_lerp_time
		end
	end
end

return
