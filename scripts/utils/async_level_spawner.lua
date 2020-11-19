AsyncLevelSpawner = class(AsyncLevelSpawner)

AsyncLevelSpawner.init = function (self, world_name, level_name, spawned_object_sets, frame_time_budget)
	local world = self:_setup_world(world_name)
	self._world = world
	self._level_name = level_name
	self._level_spawn_time_budget = frame_time_budget
	local position, rotation, mood_setting, shading_callback = nil
	local time_sliced_spawn = true
	local _, level = ScriptWorld.spawn_level(world, level_name, spawned_object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)
	self._level = level
end

AsyncLevelSpawner.destroy = function (self)
	if self._level then
		ScriptWorld.destroy_level(self._world, self._level_name)

		self._level = nil
	end

	if self._world then
		Managers.world:destroy_world(self._world)

		self._world = nil
	end
end

AsyncLevelSpawner.update = function (self)
	local done = Level.update_spawn_time_sliced(self._level, self._level_spawn_time_budget)

	if done then
		local world, level = nil
		self._world = world
		world = self._world
		self._level = level
		level = self._level

		return done, world, level
	end

	return done
end

AsyncLevelSpawner._setup_world = function (self, world_name)
	local layer = 1
	local flags = {
		Application.ENABLE_UMBRA,
		Application.ENABLE_VOLUMETRICS
	}

	if Application.user_setting("disable_apex_cloth") then
		table.insert(flags, Application.DISABLE_APEX_CLOTH)
	else
		table.insert(flags, Application.APEX_LOD_RESOURCE_BUDGET)
		table.insert(flags, Application.user_setting("apex_lod_resource_budget") or ApexClothQuality.high.apex_lod_resource_budget)
	end

	local shading_environment, shading_callback = nil
	local world = Managers.world:create_world(world_name, shading_environment, shading_callback, layer, unpack(flags))

	ScriptWorld.deactivate(world)

	return world
end

return
