DamageWaveHuskExtension = class(DamageWaveHuskExtension)
local position_lookup = POSITION_LOOKUP

DamageWaveHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local entity_manager = Managers.state.entity
	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	self.nav_world = entity_manager:system("ai_system"):nav_world()
	local unit_storage = Managers.state.unit_storage
	self.go_id = unit_storage:go_id(unit)
	self.fx_list = {}
	local buff_system = entity_manager:system("buff_system")
	self.buff_system = buff_system
	self.source_unit = extension_init_data.source_unit
	local template_name = extension_init_data.damage_wave_template_name
	local template = DamageWaveTemplates.templates[template_name]
	self.template = template
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_running = template.fx_name_running
	self.fx_name_impact = template.fx_name_impact
	self.fx_name_arrived = template.fx_name_arrived

	if template.running_spawn_config then
		self._running_spawn_configs = template.running_spawn_config
		self._local_units = {}
	end

	local fx_name_init = template.fx_name_init

	if fx_name_init then
		local unit_rotation = Unit.local_rotation(unit, 0)
		local init_effect_id = World.create_particles(world, fx_name_init, position_lookup[unit], unit_rotation)

		World.link_particles(world, init_effect_id, unit, 0, Matrix4x4.identity(), template.particle_arrived_stop_mode)

		self.init_effect_id = init_effect_id
	end

	self.particle_arrived_stop_mode = template.particle_arrived_stop_mode
	self.launch_wave_sound = template.launch_wave_sound
	self.impact_wave_sound = template.impact_wave_sound
	self.running_wave_sound = template.running_wave_sound
	self.stop_running_wave_sound = template.stop_running_wave_sound
	self.blob_separation_dist = template.blob_separation_dist
	self.fx_separation_dist = template.fx_separation_dist
	self.max_height = template.max_height
	self.overflow_dist = template.overflow_dist
	self._init_position = Vector3Box(position_lookup[unit])
	self._init_wave_direction = true
	self._update_func = template.update_func
end

DamageWaveHuskExtension.destroy = function (self)
	local world = self.world
	local fx_list = self.fx_list
	local num_fx = #fx_list

	for i = 1, num_fx do
		local fx_id = fx_list[i].id

		World.stop_spawning_particles(world, fx_id)
	end

	local local_units = self._local_units

	if local_units then
		for i = 1, #local_units do
			World.destroy_unit(world, local_units[i])

			local_units[i] = nil
		end
	end
end

DamageWaveHuskExtension.update = function (self, unit, input, dt, context, t)
	local lerp_value = math.min(dt * 10, 1)
	local current_pos = position_lookup[unit]
	local wanted_pos = GameSession.game_object_field(self.game, self.go_id, "position")
	local pos = Vector3.lerp(current_pos, wanted_pos, lerp_value)

	Unit.set_local_position(unit, 0, pos)

	local rot = GameSession.game_object_field(self.game, self.go_id, "rotation")

	Unit.set_local_rotation(unit, 0, rot)

	if self.state == "running" then
		if self._init_wave_direction and Vector3.distance_squared(wanted_pos, self._init_position:unbox()) >= 0.1 then
			self._init_wave_direction = nil
			self._init_position = nil
			self.wave_direction = Vector3Box(Vector3.normalize(wanted_pos - current_pos))
		end

		if self._update_func then
			self:_update_func(unit, pos, t, dt)
		end
	end
end

DamageWaveHuskExtension.add_damage_wave_fx = function (self, position, rotation, fx_idx, name_idx)
	local name, config = nil

	if fx_idx == 0 then
		name = self.fx_name_filled
	else
		config = self._running_spawn_configs[fx_idx]
		name = config.names[name_idx]
	end

	local unit_or_id = nil

	if fx_idx == 0 or config.spawn_type == "effect" then
		unit_or_id = World.create_particles(self.world, name, position, rotation)
		local fx_list = self.fx_list
		fx_list[#fx_list + 1] = {
			id = unit_or_id,
			position = Vector3Box(position),
			rotation = QuaternionBox(rotation),
			index = fx_idx
		}
	elseif config.spawn_type == "unit" then
		unit_or_id = World.spawn_unit(self.world, name, position, rotation)
		self._local_units[#self._local_units + 1] = unit_or_id
	end

	if fx_idx > 0 and config.on_spawn then
		config.on_spawn(self, config, name, unit_or_id, self.world)
	end
end

DamageWaveHuskExtension.set_running_wave = function (self, unit)
	local world = self.world
	local position = position_lookup[unit]
	local rotation = Unit.local_rotation(unit, 0)
	local fx_id = World.create_particles(world, self.fx_name_running, position, rotation)

	World.link_particles(world, fx_id, unit, 0, Matrix4x4.identity(), self.particle_arrived_stop_mode)

	self.running_wave_fx_id = fx_id
	local launch_wave_sound = self.launch_wave_sound

	if launch_wave_sound then
		WwiseUtils.trigger_position_event(world, launch_wave_sound, position)
	end

	local id, source = nil
	local running_wave_sound = self.running_wave_sound

	if running_wave_sound then
		local id, source = WwiseUtils.trigger_unit_event(world, running_wave_sound, unit)
		self.running_source_id = source
	end

	self.state = "running"
end

DamageWaveHuskExtension.hide_wave = function (self, unit)
	local world = self.world

	Unit.set_unit_visibility(unit, false)

	if self.init_effect_id then
		World.stop_spawning_particles(world, self.init_effect_id)
	end

	self.state = "hide"
end

DamageWaveHuskExtension.set_wave_arrived = function (self, unit)
	self:hide_wave(unit)

	local world = self.world
	local wwise_world = Managers.world:wwise_world(world)
	local running_source_id = self.running_source_id
	local stop_running_wave_sound = self.stop_running_wave_sound

	if WwiseWorld.has_source(wwise_world, running_source_id) and stop_running_wave_sound then
		WwiseWorld.trigger_event(wwise_world, stop_running_wave_sound, running_source_id)
	end

	self.running_source_id = nil
	local impact_wave_sound = self.impact_wave_sound

	if impact_wave_sound then
		WwiseUtils.trigger_unit_event(world, impact_wave_sound, unit)
	end

	local rotation = Unit.local_rotation(unit, 0)

	World.stop_spawning_particles(world, self.running_wave_fx_id)

	if self.fx_name_arrived then
		World.create_particles(world, self.fx_name_arrived, position_lookup[unit], rotation)
	end

	self.state = "arrived"
end

DamageWaveHuskExtension.on_wavefront_impact = function (self, unit)
	local world = self.world

	if self.fx_name_impact then
		local normal_rotation = Quaternion.look(Vector3.forward(), Vector3.up())

		World.create_particles(world, self.fx_name_impact, position_lookup[unit], normal_rotation)
	end

	local impact_wave_sound = self.impact_wave_sound

	if impact_wave_sound then
		WwiseUtils.trigger_unit_event(world, impact_wave_sound, unit)
	end

	self.state = "impact"
end

local segments = 20
local half_segments = segments / 2
local wave_length = 1

DamageWaveHuskExtension.debug_render_wave = function (self, t, dt, pos, travel_dir, height)
	local k = 0

	for i = -half_segments, half_segments - 1 do
		local size = math.sin(-math.pi + k / segments * math.pi) * self.max_height
		local p = pos + travel_dir * i / segments * wave_length - size * Vector3(0, 0, 1) - Vector3(0, 0, height * 2)

		QuickDrawer:circle(p, self.max_height, travel_dir, Colors.get("lime_green"))

		k = k + 1
	end
end
