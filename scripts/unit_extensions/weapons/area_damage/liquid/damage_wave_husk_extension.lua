DamageWaveHuskExtension = class(DamageWaveHuskExtension)
local position_lookup = POSITION_LOOKUP
DamageWaveHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local entity_manager = Managers.state.entity
	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	self.nav_world = entity_manager.system(entity_manager, "ai_system"):nav_world()
	local unit_storage = Managers.state.unit_storage
	self.go_id = unit_storage.go_id(unit_storage, unit)
	self.fx_list = {}
	local buff_system = entity_manager.system(entity_manager, "buff_system")
	self.buff_system = buff_system
	self.source_unit = extension_init_data.source_unit
	local template_name = extension_init_data.damage_wave_template_name
	local template = DamageWaveTemplates.templates[template_name]
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_running = template.fx_name_running
	self.fx_name_impact = template.fx_name_impact
	self.fx_name_arrived = template.fx_name_impact
	local fx_name_init = template.fx_name_init
	local init_effect_id = World.create_particles(world, fx_name_init, position_lookup[unit], Unit.local_rotation(unit, 0))

	World.link_particles(world, init_effect_id, unit, 0, Matrix4x4.identity(), template.particle_arrived_stop_mode)

	self.init_effect_id = init_effect_id
	self.particle_arrived_stop_mode = template.particle_arrived_stop_mode
	self.launch_wave_sound = template.launch_wave_sound
	self.impact_wave_sound = template.impact_wave_sound
	self.running_wave_sound = template.running_wave_sound
	self.stop_running_wave_sound = template.stop_running_wave_sound
	self.blob_separation_dist = template.blob_separation_dist
	self.fx_separation_dist = template.fx_separation_dist
	self.max_height = template.max_height
	self.overflow_dist = template.overflow_dist

	return 
end
DamageWaveHuskExtension.destroy = function (self)
	local world = self.world
	local fx_list = self.fx_list
	local num_fx = #fx_list

	for i = 1, num_fx, 1 do
		local fx_id = fx_list[i]

		World.stop_spawning_particles(world, fx_id)
	end

	return 
end
DamageWaveHuskExtension.update = function (self, unit, input, dt, context, t)
	local lerp_value = math.min(dt*10, 1)
	local current_pos = position_lookup[unit]
	local wanted_pos = GameSession.game_object_field(self.game, self.go_id, "position")
	local pos = Vector3.lerp(current_pos, wanted_pos, lerp_value)

	Unit.set_local_position(unit, 0, pos)

	local rot = GameSession.game_object_field(self.game, self.go_id, "rotation")

	Unit.set_local_rotation(unit, 0, rot)

	if script_data.debug_damage_wave then
		local travel_dir = Quaternion.forward(rot)
		local height_percentage = GameSession.game_object_field(self.game, self.go_id, "height_percentage")
		local height = height_percentage*self.max_height
		local pos = Unit.local_position(unit, 0)

		self.debug_render_wave(self, t, dt, pos, travel_dir, height)
	end

	return 
end
DamageWaveHuskExtension.add_damage_wave_fx = function (self, position)
	local unit = self.unit
	local rotation = Unit.local_rotation(unit, 0)
	local fx_list = self.fx_list
	local fx_id = World.create_particles(self.world, self.fx_name_filled, position, rotation)
	fx_list[#fx_list + 1] = fx_id

	return 
end
DamageWaveHuskExtension.set_running_wave = function (self, unit)
	local world = self.world
	local position = position_lookup[unit]
	local rotation = Unit.local_rotation(unit, 0)
	local fx_id = World.create_particles(world, self.fx_name_running, position, rotation)

	World.link_particles(world, fx_id, unit, 0, Matrix4x4.identity(), self.particle_arrived_stop_mode)

	self.running_wave_fx_id = fx_id

	WwiseUtils.trigger_position_event(world, self.launch_wave_sound, position)

	local id, source = WwiseUtils.trigger_unit_event(world, self.running_wave_sound, unit)
	self.running_source_id = source

	return 
end
DamageWaveHuskExtension.hide_wave = function (self, unit)
	local world = self.world

	Unit.set_unit_visibility(unit, false)
	World.stop_spawning_particles(world, self.init_effect_id)

	return 
end
DamageWaveHuskExtension.set_wave_arrived = function (self, unit)
	self.hide_wave(self, unit)

	local world = self.world
	local running_source_id = self.running_source_id
	local wwise_world = Managers.world:wwise_world(world)

	if WwiseWorld.has_source(wwise_world, running_source_id) then
		WwiseWorld.trigger_event(wwise_world, self.stop_running_wave_sound, running_source_id)
	end

	self.running_source_id = nil

	WwiseUtils.trigger_unit_event(world, self.impact_wave_sound, unit)

	local rotation = Unit.local_rotation(unit, 0)

	World.stop_spawning_particles(world, self.running_wave_fx_id)
	World.create_particles(world, self.fx_name_arrived, position_lookup[unit], rotation)

	return 
end
DamageWaveHuskExtension.on_wavefront_impact = function (self, unit)
	local world = self.world
	local normal_rotation = Quaternion.look(Vector3.forward(), Vector3.up())

	World.create_particles(world, self.fx_name_impact, position_lookup[unit], normal_rotation)
	WwiseUtils.trigger_unit_event(world, self.impact_wave_sound, unit)

	return 
end
local segments = 20
local half_segments = segments/2
local wave_length = 1
DamageWaveHuskExtension.debug_render_wave = function (self, t, dt, pos, travel_dir, height)
	local k = 0

	for i = -half_segments, half_segments - 1, 1 do
		local size = math.sin(-math.pi + k/segments*math.pi)*self.max_height
		local p = (pos + travel_dir*i/segments*wave_length) - size*Vector3(0, 0, 1) - Vector3(0, 0, height*2)

		QuickDrawer:circle(p, self.max_height, travel_dir, Colors.get("lime_green"))

		k = k + 1
	end

	return 
end

return 
