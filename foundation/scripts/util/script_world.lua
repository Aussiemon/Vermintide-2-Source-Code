ScriptWorld = ScriptWorld or {}

ScriptWorld.name = function (world)
	return World.get_data(world, "name")
end

ScriptWorld.activate = function (world)
	World.set_data(world, "active", true)
end

ScriptWorld.deactivate = function (world)
	World.set_data(world, "active", false)
end

ScriptWorld.pause = function (world)
	World.set_data(world, "paused", true)
end

ScriptWorld.unpause = function (world)
	World.set_data(world, "paused", false)
end

ScriptWorld.create_viewport = function (world, name, template, layer, position, rotation, add_shadow_cull_camera, force_no_scaling)
	local viewports = World.get_data(world, "viewports")

	fassert(viewports[name] == nil, "Viewport %q already exists", name)

	local viewport = Application.create_viewport(world, template)

	Viewport.set_data(viewport, "layer", layer or 1)
	Viewport.set_data(viewport, "active", true)
	Viewport.set_data(viewport, "name", name)

	viewports[name] = viewport

	if force_no_scaling then
		Viewport.set_data(viewport, "no_scaling", true)
	end

	local splitscreen = Managers.splitscreen and Managers.splitscreen:active()

	if splitscreen and not force_no_scaling then
		Viewport.set_data(viewport, "rect", {
			SPLITSCREEN_OFFSET_X,
			SPLITSCREEN_OFFSET_Y,
			SPLITSCREEN_WIDTH,
			SPLITSCREEN_HEIGHT
		})
	else
		Viewport.set_data(viewport, "rect", {
			0,
			0,
			1,
			1
		})
	end

	Viewport.set_rect(viewport, unpack(Viewport.get_data(viewport, "rect")))

	local camera_unit = nil

	if position and rotation then
		camera_unit = World.spawn_unit(world, "core/units/camera", position, rotation)
	elseif position then
		camera_unit = World.spawn_unit(world, "core/units/camera", position)
	else
		camera_unit = World.spawn_unit(world, "core/units/camera")
	end

	local camera = Unit.camera(camera_unit, "camera")

	Camera.set_data(camera, "unit", camera_unit)
	Viewport.set_data(viewport, "camera", camera)

	if add_shadow_cull_camera then
		local shadow_cull_camera = Unit.camera(camera_unit, "shadow_cull_camera")

		Camera.set_data(shadow_cull_camera, "unit", camera_unit)
		Viewport.set_data(viewport, "shadow_cull_camera", shadow_cull_camera)
	end

	ScriptWorld._update_render_queue(world)

	return viewport
end

ScriptWorld.render = function (world)
	local shading_env = World.get_data(world, "shading_environment")

	if not shading_env then
		return
	end

	local global_free_flight_viewport = World.get_data(world, "global_free_flight_viewport")

	if global_free_flight_viewport then
		ShadingEnvironment.blend(shading_env, World.get_data(world, "shading_settings"))
		ShadingEnvironment.apply(shading_env)

		if World.has_data(world, "shading_callback") and not Viewport.get_data(global_free_flight_viewport, "avoid_shading_callback") then
			local callback = World.get_data(world, "shading_callback")

			callback(world, shading_env, World.get_data(world, "render_queue")[1])
		end

		local camera = ScriptViewport.camera(global_free_flight_viewport)

		Application.render_world(world, camera, global_free_flight_viewport, shading_env)
	else
		local render_queue = World.get_data(world, "render_queue")

		if table.is_empty(render_queue) then
			Application.update_render_world(world)

			return
		end

		for _, viewport in ipairs(render_queue) do
			if not World.get_data(world, "avoid_blend") then
				ShadingEnvironment.blend(shading_env, World.get_data(world, "shading_settings"), World.get_data(world, "override_shading_settings"))
			end

			if World.has_data(world, "shading_callback") and not Viewport.get_data(viewport, "avoid_shading_callback") then
				local callback = World.get_data(world, "shading_callback")

				callback(world, shading_env, viewport)
			end

			if not World.get_data(world, "avoid_blend") then
				ShadingEnvironment.apply(shading_env)
			end

			local camera = ScriptViewport.camera(viewport)

			Application.render_world(world, camera, viewport, shading_env)
		end
	end
end

ScriptWorld.create_global_free_flight_viewport = function (world, template)
	fassert(not World.has_data(world, "global_free_flight_viewport"), "Trying to spawn global freeflight viewport when one already exists.")

	local viewports = World.get_data(world, "viewports")

	if table.is_empty(viewports) then
		return nil
	end

	local bottom_layer = math.huge
	local bottom_layer_vp = nil

	for key, vp in pairs(viewports) do
		local layer = Viewport.get_data(vp, "layer")

		if layer < bottom_layer then
			bottom_layer_vp = vp
			bottom_layer = layer
		end
	end

	local free_flight_viewport = Application.create_viewport(world, template)

	Viewport.set_data(free_flight_viewport, "layer", Viewport.get_data(bottom_layer_vp, "layer"))
	World.set_data(world, "global_free_flight_viewport", free_flight_viewport)

	local camera_unit = World.spawn_unit(world, "core/units/camera")
	local camera = Unit.camera(camera_unit, "camera")

	Camera.set_data(camera, "unit", camera_unit)

	local bottom_layer_camera = ScriptViewport.camera(bottom_layer_vp)
	local pose = Camera.local_pose(bottom_layer_camera)

	ScriptCamera.set_local_pose(camera, pose)

	local vertical_fov = Camera.vertical_fov(bottom_layer_camera)

	Camera.set_vertical_fov(camera, vertical_fov)
	Viewport.set_data(free_flight_viewport, "camera", camera)

	return free_flight_viewport
end

ScriptWorld.destroy_global_free_flight_viewport = function (world)
	local viewport = World.get_data(world, "global_free_flight_viewport")

	fassert(viewport, "Trying to destroy global free flight viewport when none exists.")

	local camera = Viewport.get_data(viewport, "camera")
	local camera_unit = Camera.get_data(camera, "unit")

	World.destroy_unit(world, camera_unit)
	Application.destroy_viewport(world, viewport)
	World.set_data(world, "global_free_flight_viewport", nil)
end

ScriptWorld.global_free_flight_viewport = function (world)
	return World.get_data(world, "global_free_flight_viewport")
end

ScriptWorld.create_free_flight_viewport = function (world, overridden_viewport_name, template)
	local overridden_viewport = ScriptWorld.viewport(world, overridden_viewport_name)
	local free_flight_viewport = Application.create_viewport(world, template)

	Viewport.set_data(free_flight_viewport, "layer", Viewport.get_data(overridden_viewport, "layer"))

	local free_flight_viewports = World.get_data(world, "free_flight_viewports")

	fassert(free_flight_viewports[overridden_viewport_name] == nil, "Free flight viewport %q already exists", overridden_viewport_name)

	free_flight_viewports[overridden_viewport_name] = free_flight_viewport
	local camera_unit = World.spawn_unit(world, "core/units/camera")
	local camera = Unit.camera(camera_unit, "camera")

	Camera.set_data(camera, "unit", camera_unit)

	local overridden_viewport_camera = ScriptViewport.camera(overridden_viewport)
	local pose = Camera.local_pose(overridden_viewport_camera)

	ScriptCamera.set_local_pose(camera, pose)
	Viewport.set_data(free_flight_viewport, "camera", camera)
	Viewport.set_data(free_flight_viewport, "overridden_viewport", overridden_viewport)
	ScriptWorld._update_render_queue(world)

	return free_flight_viewport
end

ScriptWorld.destroy_free_flight_viewport = function (world, name)
	local viewports = World.get_data(world, "free_flight_viewports")

	fassert(viewports[name], "Viewport %q doesn't exist", name)

	local viewport = viewports[name]
	viewports[name] = nil
	local camera = Viewport.get_data(viewport, "camera")
	local camera_unit = Camera.get_data(camera, "unit")

	World.destroy_unit(world, camera_unit)
	Application.destroy_viewport(world, viewport)
	ScriptWorld._update_render_queue(world)
end

ScriptWorld.destroy_viewport = function (world, name)
	local viewports = World.get_data(world, "viewports")

	fassert(viewports[name], "Viewport %q doesn't exist", name)

	local viewport = viewports[name]
	viewports[name] = nil
	local camera = Viewport.get_data(viewport, "camera")
	local camera_unit = Camera.get_data(camera, "unit")

	World.destroy_unit(world, camera_unit)
	Application.destroy_viewport(world, viewport)
	ScriptWorld._update_render_queue(world)
end

ScriptWorld.activate_viewport = function (world, viewport)
	Viewport.set_data(viewport, "active", true)
	ScriptWorld._update_render_queue(world)
end

ScriptWorld.deactivate_viewport = function (world, viewport)
	Viewport.set_data(viewport, "active", false)
	ScriptWorld._update_render_queue(world)
end

ScriptWorld.has_viewport = function (world, name)
	local viewports = World.get_data(world, "viewports")

	return (viewports[name] and true) or false
end

ScriptWorld.viewport = function (world, name, return_free_flight_viewport)
	local viewport = nil

	if return_free_flight_viewport then
		viewport = World.get_data(world, "free_flight_viewports")[name] or World.get_data(world, "viewports")[name]
	else
		viewport = World.get_data(world, "viewports")[name]
	end

	fassert(viewport, "Viewport %q doesn't exist", name)

	return viewport
end

ScriptWorld.free_flight_viewport = function (world, name)
	local viewports = World.get_data(world, "free_flight_viewports")

	fassert(viewports[name], "Free flight viewport %q doesn't exists", name)

	return viewports[name]
end

ScriptWorld.update = function (world, dt, anim_callback, scene_callback)
	if World.get_data(world, "active") then
		if World.get_data(world, "paused") then
			dt = 0
		end

		Profiler.start(ScriptWorld.name(world))

		if anim_callback then
			World.update_animations_with_callback(world, dt, anim_callback)
		else
			World.update_animations(world, dt)
		end

		if scene_callback then
			World.update_scene_with_callback(world, dt, scene_callback)
		else
			World.update_scene(world, dt)
		end

		Profiler.stop(ScriptWorld.name(world))
	else
		World.update_timer(world, dt)
	end
end

ScriptWorld._update_render_queue = function (world)
	local render_queue = {}
	local viewports = World.get_data(world, "viewports")
	local free_flight_viewports = World.get_data(world, "free_flight_viewports")

	for name, viewport in pairs(viewports) do
		if ScriptViewport.active(viewport) then
			render_queue[#render_queue + 1] = free_flight_viewports[name] or viewport
		end
	end

	local function comparator(v1, v2)
		return Viewport.get_data(v1, "layer") < Viewport.get_data(v2, "layer")
	end

	table.sort(render_queue, comparator)
	World.set_data(world, "render_queue", render_queue)
end

ScriptWorld.create_shading_environment = function (world, shading_environment_name, shading_callback, mood_setting)
	local shading_env = World.create_shading_environment(world, shading_environment_name)

	World.set_data(world, "shading_environment", shading_env)
	World.set_data(world, "shading_callback", shading_callback)
	World.set_data(world, "shading_settings", {
		mood_setting,
		1
	})

	return shading_env
end

ScriptWorld.spawn_level = function (world, name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)
	local levels = World.get_data(world, "levels")

	fassert(levels[name] == nil, "Level %q already loaded", name)

	local spawn_non_background_units = true
	local level = nil

	if time_sliced_spawn then
		level = World.spawn_level_time_sliced(world, name, position or Vector3.zero(), rotation or Quaternion.identity(), Vector3(1, 1, 1), object_sets or {})
	else
		level = World.spawn_level(world, name, position or Vector3.zero(), rotation or Quaternion.identity(), Vector3(1, 1, 1), object_sets or {})
	end

	local nested_levels = Level.nested_levels(level)
	local logic_level = nested_levels[1] or level
	levels[name] = {
		level = level,
		nested_levels = nested_levels,
		spawning = time_sliced_spawn
	}

	Profiler.start("shading_env_name")

	local shading_env_name = Level.get_data(level, "shading_environment")

	if shading_env_name:len() > 0 then
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			World.set_shading_environment(world, shading_env, shading_env_name)

			if shading_callback then
				World.set_data(world, "shading_callback", shading_callback)
			end

			if mood_setting then
				World.set_data(world, "shading_settings", {
					mood_setting,
					1
				})
			end
		else
			shading_env = ScriptWorld.create_shading_environment(world, shading_env_name, shading_callback, mood_setting or "default")
		end
	end

	Profiler.stop("shading_env_name")

	return logic_level, level
end

ScriptWorld.level = function (world, name)
	local levels = World.get_data(world, "levels")
	local level_data = levels[name]

	fassert(level_data, "Level %q doesn't exist", name)

	local nested_levels = level_data.nested_levels
	local logic_level = nested_levels[1] or level_data.level

	return logic_level
end

ScriptWorld.nested_levels = function (world, name)
	local levels = World.get_data(world, "levels")
	local level_data = levels[name]

	fassert(level_data, "Level %q doesn't exist", name)

	return level_data.nested_levels
end

ScriptWorld.destroy_level = function (world, name)
	local levels = World.get_data(world, "levels")
	local level_data = levels[name]

	fassert(level_data, "Level %q doesn't exist", name)
	World.destroy_level(world, level_data.level)

	levels[name] = nil
end

ScriptWorld.destroy_level_from_reference = function (world, level)
	local levels = World.get_data(world, "levels")
	local removed_level_name = nil

	for level_name, level_data in pairs(levels) do
		local base_level = level_data.level
		local nested_levels = level_data.nested_levels

		if base_level == level or table.contains(nested_levels, level) then
			World.destroy_level(world, base_level)

			removed_level_name = level_name

			break
		end
	end

	if removed_level_name then
		levels[removed_level_name] = nil
	else
		fassert(false, "Level doesn't exist")
	end
end

ScriptWorld.optimize_level_units = function (world, name)
	local levels = World.get_data(world, "levels")
	local level_data = levels[name]
	local base_level = level_data.level
	local nested_levels = level_data.nested_levels

	for i = 1, #nested_levels, 1 do
		local nested_level = nested_levels[i]
		local level_units = Level.units(nested_level)

		for _, unit in ipairs(level_units) do
			ScriptUnit.optimize(unit)
		end
	end

	local level_units = Level.units(base_level)

	for _, unit in ipairs(level_units) do
		ScriptUnit.optimize(unit)
	end
end

ScriptWorld.trigger_level_loaded = function (world, name)
	local levels = World.get_data(world, "levels")
	local level_data = levels[name]
	local base_level = level_data.level
	local nested_levels = level_data.nested_levels

	for i = 1, #nested_levels, 1 do
		local nested_level = nested_levels[i]

		Level.trigger_level_loaded(nested_level)
	end

	Level.trigger_level_loaded(base_level)
end

ScriptWorld.create_particles_linked = function (world, effect_name, unit, node, policy, pose)
	local id = World.create_particles(world, effect_name, Vector3(0, 0, 0))
	pose = pose or Matrix4x4.identity()

	World.link_particles(world, id, unit, node, pose, policy)

	return id
end

return
