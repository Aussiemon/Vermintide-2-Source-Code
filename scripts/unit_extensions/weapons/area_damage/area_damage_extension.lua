AreaDamageExtension = class(AreaDamageExtension)
script_data.debug_area_damage = script_data.debug_area_damage or Development.parameter("debug_area_damage")

AreaDamageExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.aoe_dot_damage = extension_init_data.aoe_dot_damage or Unit.get_data(unit, "aoe_dot_damage")
	self.aoe_init_damage = extension_init_data.aoe_init_damage or Unit.get_data(unit, "aoe_init_damage")
	self.aoe_dot_damage_interval = extension_init_data.aoe_dot_damage_interval or Unit.get_data(unit, "aoe_dot_damage_interval")
	self.damage_ramping_function = extension_init_data.damage_ramping_function
	self.radius = extension_init_data.radius or Unit.get_data(unit, "radius")
	self.initial_radius = extension_init_data.initial_radius or extension_init_data.radius or Unit.get_data(unit, "radius")
	self.life_time = extension_init_data.life_time or Unit.get_data(unit, "life_time")
	self.player_screen_effect_name = extension_init_data.player_screen_effect_name or Unit.get_data(unit, "player_screen_effect_name")
	self.dot_effect_name = extension_init_data.dot_effect_name or Unit.get_data(unit, "dot_effect_name")
	self.extra_dot_effect_name = extension_init_data.extra_dot_effect_name or Unit.get_data(unit, "extra_dot_effect_name")
	self.nav_mesh_effect = extension_init_data.nav_mesh_effect
	self.area_damage_template = extension_init_data.area_damage_template or Unit.get_data(unit, "area_damage_template")
	self.area_ai_random_death_template = extension_init_data.area_ai_random_death_template or Unit.get_data(unit, "area_ai_random_death_template")
	self.invisible_unit = extension_init_data.invisible_unit or Unit.get_data(unit, "invisible_unit")
	self.damage_players = T(extension_init_data.damage_players, T(Unit.get_data(unit, "damage_players"), true))
	self.damage_source = extension_init_data.damage_source or "n/a"
	self.create_nav_tag_volume = extension_init_data.create_nav_tag_volume or Unit.get_data(unit, "create_nav_tag_volume")
	self.nav_tag_volume_layer = extension_init_data.nav_tag_volume_layer or Unit.get_data(unit, "nav_tag_volume_layer")
	self.explosion_template_name = extension_init_data.explosion_template_name
	self.owner_player = extension_init_data.owner_player
	self.effect_size = self.radius * 1.5
	self.damage_timer = 0
	self.life_timer = 0
	self.is_server = Managers.player.is_server
	self.enabled = false
	self.ai_system = Managers.state.entity:system("ai_system")
	self.player_unit_particles = {}
	self._current_damage_buffer_index = 1
	self._damage_buffer = {}

	if self.owner_player then
		Managers.player:assign_unit_ownership(self.unit, self.owner_player)
	end

	if self.invisible_unit then
		Unit.set_unit_visibility(unit, false)
	end
end

AreaDamageExtension.destroy = function (self)
	Unit.flow_event(self.unit, "lua_projectile_end")

	if not self.area_damage_started then
		return
	end

	local world = self.world
	local area_damage = AreaDamageTemplates.get_template(self.area_damage_template)

	if self.is_server and area_damage.server.destroy then
		area_damage.server.destroy()
	end

	if area_damage.client.destroy then
		area_damage.client.destroy()
	end

	if self.effect_id then
		World.stop_spawning_particles(world, self.effect_id)
	end

	local ids = self.nav_mesh_effect_ids

	if ids then
		for i = 1, #ids, 1 do
			local id = ids[i]

			World.stop_spawning_particles(world, id)
		end
	end

	if self.extra_effect_id then
		World.stop_spawning_particles(world, self.extra_effect_id)
	end

	for player_unit, data in pairs(self.player_unit_particles) do
		World.stop_spawning_particles(world, data.particle_id)
	end

	table.clear(self.player_unit_particles)

	if self.nav_tag_volume_id then
		local volume_system = Managers.state.entity:system("volume_system")

		volume_system:destroy_nav_tag_volume(self.nav_tag_volume_id)
	end
end

AreaDamageExtension.enable = function (self, enable)
	if enable then
		self.enabled = true

		self:start()
	else
		self.enabled = false
		self.area_damage_started = false

		if self.effect_id then
			World.stop_spawning_particles(self.world, self.effect_id)

			if self.extra_effect_id then
				World.stop_spawning_particles(self.world, self.extra_effect_id)
			end
		end

		local ids = self.nav_mesh_effect_ids

		if ids then
			for i = 1, #ids, 1 do
				local id = ids[i]

				World.stop_spawning_particles(world, id)
			end
		end

		for player_unit, data in pairs(self.player_unit_particles) do
			World.stop_spawning_particles(self.world, data.particle_id)
		end

		table.clear(self.player_unit_particles)
	end
end

AreaDamageExtension.start = function (self)
	self.area_damage_started = true
	local area_damage = AreaDamageTemplates.get_template(self.area_damage_template)

	if self.is_server and self.aoe_init_damage then
		local updated, damage_buffer = area_damage.server.update(self.damage_source, self.unit, self.initial_radius, self.aoe_init_damage, 0, 0, 0, 0, self.damage_players, self.explosion_template_name)

		if script_data.debug_ai_attack then
			QuickDrawerStay:sphere(Unit.world_position(self.unit, 0), self.initial_radius, Color(255, 0, 0))
			QuickDrawerStay:sphere(Unit.world_position(self.unit, 0), self.radius, Color(0, 255, 0))
		end

		if updated then
			self:_add_to_damage_buffer(damage_buffer)
		end
	end

	local particle_var_table = {
		{
			particle_variable = "pool_size",
			value = Vector3(self.effect_size, self.effect_size, 1)
		}
	}

	if self.dot_effect_name then
		self.effect_id = area_damage.client.spawn_effect(self.world, self.unit, self.dot_effect_name, particle_var_table)
	end

	if self.extra_dot_effect_name then
		self.extra_effect_id = area_damage.client.spawn_effect(self.world, self.unit, self.extra_dot_effect_name)
	end

	local nav_mesh_effect = self.nav_mesh_effect

	if nav_mesh_effect then
		local unit_pos = Unit.world_position(self.unit, 0)
		local radius = self.radius
		local debug = script_data.debug_nav_mesh_vfx

		if debug then
			QuickDrawerStay:circle(unit_pos, radius, Vector3.up(), Color(255, 255, 255), 24)
		end

		local pi = math.pi
		local ids = {}
		local num_particles = 0
		self.nav_mesh_effect_ids = ids
		local particle_radius = nav_mesh_effect.particle_radius
		local particle_spacing = nav_mesh_effect.particle_spacing
		local particle_name = nav_mesh_effect.particle_name
		local particle_diameter = 2 * particle_radius
		local particle_space_diameter = 2 * particle_spacing
		local layers = (radius - particle_radius) / particle_space_diameter
		local floored_layers = math.floor(layers)
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()

		if debug then
			QuickDrawerStay:circle(unit_pos, particle_spacing, Vector3.up(), Color(255, 255, 255), 32)
			QuickDrawerStay:circle(unit_pos, particle_radius, Vector3.up(), Color(255, 0, 255), 32)
		end

		local id = area_damage.client.spawn_effect(self.world, self.unit, particle_name, nil, unit_pos)
		num_particles = num_particles + 1
		ids[num_particles] = id

		for i = 1, floored_layers, 1 do
			local current_radius = radius - (floored_layers - i) * particle_space_diameter - particle_radius
			local circumference = current_radius * 2 * pi
			local particles_in_layer = math.floor(circumference / particle_space_diameter)
			local particle_radial_spacing = (2 * pi) / particles_in_layer

			for j = 1, particles_in_layer, 1 do
				local angle = j * particle_radial_spacing
				local particle_pos = unit_pos + current_radius * Vector3(math.cos(angle), math.sin(angle), 0)
				local success, z = GwNavQueries.triangle_from_position(nav_world, particle_pos, 1.5, 2)

				if success then
					particle_pos.z = z

					if debug then
						QuickDrawerStay:circle(particle_pos, particle_spacing, Vector3.up(), Color(255, 255, 255), 32)
						QuickDrawerStay:circle(particle_pos, particle_radius, Vector3.up(), Color(255, 0, 255), 32)
					end

					local id = area_damage.client.spawn_effect(self.world, self.unit, particle_name, nil, particle_pos)
					num_particles = num_particles + 1
					ids[num_particles] = id
				elseif debug then
					QuickDrawerStay:circle(particle_pos, particle_spacing, Vector3.up(), Color(125, 125, 125), 32)
					QuickDrawerStay:circle(particle_pos, particle_radius, Vector3.up(), Color(125, 125, 125), 32)
				end
			end
		end
	end

	if self.explosion_template_name then
		local area_damage_position = Unit.local_position(self.unit, 0)
		local explosion_template = ExplosionTemplates[self.explosion_template_name]
		local sound_event_name = explosion_template.aoe.sound_event_name

		if sound_event_name then
			WwiseUtils.trigger_position_event(self.world, sound_event_name, area_damage_position)
		end
	end

	if self.is_server and self.create_nav_tag_volume then
		if self.nav_tag_volume_layer then
			local volume_system = Managers.state.entity:system("volume_system")
			local pos = Unit.world_position(self.unit, 0)
			self.nav_tag_volume_id = volume_system:create_nav_tag_volume_from_data(pos, self.radius, self.nav_tag_volume_layer)
		else
			Application.warning(string.format("[AreaDamageExtension] create_nav_tag_volume is set but there are no nav_tag_volume_template set for unit %s", self.unit))
		end
	end
end

AreaDamageExtension.update = function (self, unit, input, dt, context, t)
	self:_update_damage_buffer()

	if not self.area_damage_started then
		return
	end

	local area_damage = AreaDamageTemplates.get_template(self.area_damage_template)

	if self.is_server then
		local updated, damage_buffer = area_damage.server.update(self.damage_source, self.unit, self.radius, self.aoe_dot_damage, self.life_time, self.life_timer, self.aoe_dot_damage_interval, self.damage_timer, self.damage_players, self.explosion_template_name)

		if updated then
			self:_add_to_damage_buffer(damage_buffer)
		end

		if self.area_ai_random_death_template then
			local ai_random_die = AreaDamageTemplates.get_template(self.area_ai_random_death_template)
			local updated, damage_buffer = ai_random_die.server.update(self.damage_source, self.unit, self.radius, self.aoe_dot_damage_interval, self.damage_timer)

			if updated then
				self:_add_to_damage_buffer(damage_buffer)
			end
		end

		if updated then
			self.damage_timer = 0
		end
	end

	area_damage.client.update(self.world, self.radius, self.unit, self.player_screen_effect_name, self.player_unit_particles, self.damage_players, self.explosion_template_name)

	self.damage_timer = self.damage_timer + dt
	self.life_timer = self.life_timer + dt

	if script_data.debug_area_damage then
		QuickDrawer:sphere(Unit.local_position(self.unit, 0), self.radius, Colors.get("hot_pink"))
	end
end

local NUM_UNITS_PER_FRAME = 1

AreaDamageExtension._update_damage_buffer = function (self)
	if not self.is_server then
		return
	end

	local damage_buffer = self._damage_buffer

	if #damage_buffer == 0 then
		return
	end

	local current_damage_buffer_index = self._current_damage_buffer_index
	local num_units_this_frame = (current_damage_buffer_index + NUM_UNITS_PER_FRAME) - 1
	local reset = false

	for i = current_damage_buffer_index, num_units_this_frame, 1 do
		local damage_data = damage_buffer[i]

		if not damage_data then
			reset = true

			break
		end

		local unit = damage_data.unit

		if Unit.alive(unit) then
			local area_damage = AreaDamageTemplates.get_template(damage_data.area_damage_template)

			area_damage.server.do_damage(damage_data, self.unit)
		end
	end

	if reset then
		self._current_damage_buffer_index = 1

		table.clear(damage_buffer)
	else
		self._current_damage_buffer_index = num_units_this_frame + 1
	end
end

AreaDamageExtension._add_to_damage_buffer = function (self, temp_damage_buffer)
	local damage_buffer = self._damage_buffer
	local num_units_in_buffer = #self._damage_buffer
	local num_units_in_temp_buffer = #temp_damage_buffer

	for i = 1, num_units_in_temp_buffer, 1 do
		damage_buffer[num_units_in_buffer + i] = temp_damage_buffer[i]
	end
end

AreaDamageExtension.hot_join_sync = function (self, sender)
	if self.enabled then
		local level_index = Managers.state.network:level_object_id(self.unit)

		RPC.rpc_enable_area_damage(sender, level_index, true)
	end
end

return
