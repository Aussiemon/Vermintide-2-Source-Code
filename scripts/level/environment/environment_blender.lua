require("scripts/level/environment/environment_handler")

EnvironmentBlender = class(EnvironmentBlender)
EnvironmentBlender.init = function (self, world, viewport)
	self.world = world
	self.environment_handler = EnvironmentHandler:new()
	self.shading_settings = {}
	self.viewport = viewport
	self.particle_light_intensity = nil

	self.environment_handler:add_blend_group("volumes")

	local blend_data = {
		volume_name = "world",
		environment = "default",
		always_inside = true,
		override_sun_snap = false,
		particle_light_intensity = 1,
		viewport = self.viewport
	}

	self.environment_handler:add_blend("EnvironmentBlendVolume", "volumes", -1, blend_data)

	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "register_environment_volume", "event_register_environment_volume")
	event_manager.register(event_manager, self, "unregister_environment_volume", "event_unregister_environment_volume")

	return 
end
EnvironmentBlender.event_register_environment_volume = function (self, volume_name, environment_name, priority, blend_time, override_sun_snap, particle_light_intensity, sphere_pos, sphere_radius, specified_id)
	local blend_data = {
		always_inside = false,
		level = LevelHelper:current_level(self.world),
		viewport = self.viewport,
		environment = environment_name,
		volume_name = volume_name,
		blend_time = blend_time,
		override_sun_snap = override_sun_snap,
		particle_light_intensity = particle_light_intensity,
		is_sphere = sphere_pos and sphere_radius,
		sphere_pos = sphere_pos and Vector3Box(sphere_pos),
		sphere_radius = sphere_radius
	}

	self.environment_handler:add_blend("EnvironmentBlendVolume", "volumes", priority, blend_data, specified_id)

	return 
end
EnvironmentBlender.event_unregister_environment_volume = function (self, id)
	self.environment_handler:remove_blend(id)

	return 
end
EnvironmentBlender.update = function (self, dt, t)
	self.environment_handler:update(dt, t)
	self.update_shading_settings(self)

	return 
end
EnvironmentBlender.update_shading_settings = function (self)
	local environment_handler = self.environment_handler
	local volume_weights = environment_handler.weights(environment_handler, "volumes")
	local shading_settings = self.shading_settings

	table.clear(shading_settings)

	local particle_light_intensity = 0

	for _, volume in ipairs(volume_weights) do
		if 0 < volume.weight then
			local weight = volume.weight
			shading_settings[#shading_settings + 1] = volume.environment
			shading_settings[#shading_settings + 1] = weight
			particle_light_intensity = particle_light_intensity + weight * volume.particle_light_intensity
		end
	end

	if particle_light_intensity ~= self.particle_light_intensity then
		World.set_particles_light_intensity(self.world, particle_light_intensity)

		self.particle_light_intensity = particle_light_intensity
	end

	World.set_data(self.world, "override_shading_settings", environment_handler.override_settings(environment_handler))
	World.set_data(self.world, "shading_settings", shading_settings)

	if script_data.debug_environment_blend then
		self.debug_draw(self, shading_settings)
	end

	return 
end
EnvironmentBlender.destroy = function (self)
	self.environment_handler:destroy()

	self.environment_handler = nil

	return 
end
local debug_colors = {
	{
		255,
		100,
		100,
		200
	},
	{
		255,
		100,
		200,
		100
	},
	{
		255,
		200,
		100,
		100
	},
	{
		255,
		200,
		200,
		100
	}
}
EnvironmentBlender.debug_color = function (self)
	return table.remove(debug_colors)
end
EnvironmentBlender.debug_draw = function (self, shading_settings)
	local w, h = Gui.resolution()
	local x = w * 0.01
	local y = h * 0.95
	local spacing = 5
	local size = 36
	local offset_y = 0

	for i = 1, #shading_settings, 2 do
		local env_name = shading_settings[i]
		local weight = shading_settings[i + 1]
		local text = string.format("%.2f", weight) .. " " .. env_name

		Managers.state.debug:draw_screen_text(x, y + offset_y, 999, text, size, Color(255, 255, 255, 255))
		Managers.state.debug:draw_screen_text(x + 2, (y + offset_y) - 2, 998, text, size, Color(255, 0, 0, 0))

		offset_y = offset_y - size - spacing
	end

	return 
end

return 
