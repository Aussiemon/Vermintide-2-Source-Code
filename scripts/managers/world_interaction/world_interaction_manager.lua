-- chunkname: @scripts/managers/world_interaction/world_interaction_manager.lua

require("scripts/managers/world_interaction/world_interaction_settings")

WorldInteractionManager = class(WorldInteractionManager)

local ENEMIES = {}

WorldInteractionManager.init = function (self, world)
	self._world = world
	self._water_timer = 0
	self._water_ripples = {}
	self._units = {}

	self:_setup_gui()
end

WorldInteractionManager._setup_gui = function (self)
	self._gui = World.create_screen_gui(self._world, "material", "materials/world_interaction/world_interaction", "immediate")
end

WorldInteractionManager.add_world_interaction = function (self, material, unit)
	self:remove_world_interaction(unit, material)

	self._units[material] = self._units[material] or {}
	self._units[material][unit] = self._units[material][unit] or Managers.time:time("game")
end

WorldInteractionManager.remove_world_interaction = function (self, unit, material_to_ignore)
	for material, units in pairs(self._units) do
		if not material_to_ignore or material_to_ignore ~= material then
			units[unit] = nil
		end
	end
end

WorldInteractionManager._add_water_ripple = function (self, pos, angle, material, random_size_diff, stretch_multiplier, ref_time, size, multiplier)
	local water_settings = WorldInteractionSettings.water
	local random_ripple_size_diff = water_settings.random_ripple_size_diff

	self._water_ripples[#self._water_ripples + 1] = {
		timer = 0,
		pos = Vector3Box(pos),
		size_variable = 1 - random_ripple_size_diff * 0.5 + Math.random() * random_ripple_size_diff,
		angle = angle,
		material = material or water_settings.default_ripple_material,
		stretch_multiplier = stretch_multiplier,
		ref_time = ref_time,
		default_size = size,
		multiplier = multiplier,
	}
end

WorldInteractionManager.add_simple_effect = function (self, material, unit, position)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local player_unit = local_player and local_player.player_unit

	if Unit.alive(player_unit) then
		local material_settings = WorldInteractionSettings[material]
		local window_size = math.clamp(material_settings.window_size, 1, 100)
		local window_distance = window_size * 0.5
		local player_pos = POSITION_LOOKUP[player_unit]

		if Vector3.distance_squared(player_pos, position) < window_distance * window_distance then
			self["_add_simple_" .. material .. "_effect"](self, unit, position)
		end
	end
end

WorldInteractionManager._add_simple_water_effect = function (self, unit, position)
	local water_settings = WorldInteractionSettings.water
	local water_splash_settings = water_settings.splash
	local material = water_splash_settings.default_material
	local window_size = math.clamp(water_settings.window_size, 1, 100)
	local stretch_multiplier = water_splash_settings.stretch_multiplier
	local multiplier = water_splash_settings.multiplier
	local timer_ref = water_splash_settings.timer_ref
	local random_size_diff = water_splash_settings.random_size_diff
	local local_player = Managers.player:local_player()
	local player_unit = local_player and local_player.player_unit

	if Unit.alive(player_unit) then
		local window_distance = window_size * 0.5
		local player_pos = POSITION_LOOKUP[player_unit]
		local start_size = water_splash_settings.start_size

		if Vector3.distance_squared(position, player_pos) < window_distance * window_distance then
			self:_add_water_ripple(position, 0, material, random_size_diff, stretch_multiplier, timer_ref, start_size, multiplier)
		end
	end
end

WorldInteractionManager.update = function (self, dt, t)
	if Managers.state.network:game() then
		self:_update_water(dt, t)
		self:_update_foliage(dt, t)
	end
end

WorldInteractionManager._update_water = function (self, dt, t)
	local available_units = self._units.water
	local local_player = Managers.player:local_player()
	local player_unit = local_player and local_player.player_unit

	if Unit.alive(player_unit) and (#self._water_ripples > 0 or available_units and next(available_units)) then
		self:_cleanup_removed_units()
		self:_update_water_data(dt, t)
		self:_update_water_ripples(dt, t)
	end
end

local UNITS_TO_REMOVE = {}

WorldInteractionManager._cleanup_removed_units = function (self)
	local spawn_manager = Managers.state.spawn
	local unit_spawner = spawn_manager.unit_spawner
	local death_watch_lookup = unit_spawner.unit_death_watch_lookup

	table.clear(UNITS_TO_REMOVE)

	for material, units in pairs(self._units) do
		for unit, _ in pairs(units) do
			if not Unit.alive(unit) or death_watch_lookup[unit] then
				UNITS_TO_REMOVE[#UNITS_TO_REMOVE + 1] = unit
			end
		end
	end

	for material, units in pairs(self._units) do
		for _, unit in ipairs(UNITS_TO_REMOVE) do
			units[unit] = nil
		end
	end
end

local COLLECTED_UNITS = {}

WorldInteractionManager._update_water_data = function (self, dt, t)
	local water_settings = WorldInteractionSettings.water
	local window_size = math.clamp(water_settings.window_size, 1, 100)
	local speed_limit = water_settings.water_speed_limit
	local ripple_time_step = water_settings.ripple_time_step
	local max_contributing_units = water_settings.max_contributing_units

	self._water_timer = self._water_timer or 0

	local current_index = 1

	if ripple_time_step <= self._water_timer then
		local available_units = self._units.water
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit
		local window_distance = window_size * 0.5
		local player_pos = Vector3.flat(POSITION_LOOKUP[player_unit])

		if Unit.alive(player_unit) and available_units and next(available_units) then
			local players = Managers.player:players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if available_units[unit] then
					local unit_pos = Unit.local_position(unit, 0)

					if Vector3.distance_squared(unit_pos, player_pos) < window_distance * window_distance then
						COLLECTED_UNITS[current_index] = unit
						current_index = current_index + 1
					end
				end
			end

			local ai_broadphase = Managers.state.entity:system("ai_system").broadphase
			local num_enemies = Broadphase.query(ai_broadphase, player_pos, window_size * 0.5, ENEMIES)

			for i = 1, num_enemies do
				local unit = ENEMIES[i]

				if available_units[unit] then
					COLLECTED_UNITS[current_index] = unit
					current_index = current_index + 1
				end
			end

			local origo = Vector3(0, 0, 0)
			local speed_limit_squared = speed_limit * speed_limit
			local contributing_units = 0

			for i = 1, current_index - 1 do
				local unit = COLLECTED_UNITS[i]

				if Unit.alive(unit) then
					local locomotion_ext = ScriptUnit.has_extension(unit, "locomotion_system")

					if locomotion_ext then
						local dir = locomotion_ext.current_velocity and locomotion_ext:current_velocity()

						if dir and speed_limit_squared < Vector3.distance_squared(Vector3.flat(dir), origo) then
							local flat_dir = Vector3.normalize(Vector3(dir[1], dir[2], 0))
							local dot_value = Vector3.dot(flat_dir, Vector3(0, 1, 0))
							local safe_dot_value = math.clamp(dot_value, -1, 1)
							local angle = math.acos(safe_dot_value) * (flat_dir[1] < 0 and 1 or -1)
							local pos = POSITION_LOOKUP[unit]

							if angle == angle then
								self:_add_water_ripple(pos, angle)

								contributing_units = contributing_units + 1

								if max_contributing_units <= contributing_units then
									break
								elseif t > available_units[unit] then
									local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(self._world, pos)

									WwiseWorld.trigger_event(wwise_world, water_settings.ripple_sound_event, wwise_source_id)

									available_units[unit] = Managers.time:time("game") + water_settings.ripple_sound_event_delay
								end
							end
						end
					end
				end
			end

			self._water_timer = 0
		end
	end

	self._water_timer = self._water_timer + dt
end

local DATA_TO_REMOVE = {}

WorldInteractionManager._update_water_ripples = function (self, dt, t)
	table.clear(DATA_TO_REMOVE)

	local water_settings = WorldInteractionSettings.water
	local default_ripple_material = water_settings.default_ripple_material
	local default_ripple_start_size = water_settings.default_ripple_start_size
	local default_ripple_multiplier = water_settings.default_ripple_multiplier
	local default_ripple_timer = water_settings.default_ripple_timer
	local duplicate_edge_cases = water_settings.duplicate_edge_cases
	local ripple_stretch_multiplier = water_settings.ripple_stretch_multiplier
	local w, h = Gui.resolution()
	local window_size = math.clamp(water_settings.window_size, 1, 100)
	local counter = 0
	local water_data
	local num_water_data = #self._water_ripples

	for idx = 1, num_water_data do
		water_data = self._water_ripples[idx]

		local ref_time = water_data.ref_time or default_ripple_timer
		local pos = water_data.pos:unbox()
		local stretch_multiplier = water_data.stretch_multiplier or ripple_stretch_multiplier
		local multiplier = water_data.multiplier or default_ripple_multiplier
		local default_size = water_data.default_size or default_ripple_start_size
		local start_size = default_size[1] * (water_data.size_variable or 0)
		local t = math.easeOutCubic(water_data.timer / ref_time)
		local size = math.lerp(start_size, start_size * multiplier, t)
		local relative_world_pos = Vector2(pos[1] % window_size, pos[2] % window_size)
		local relative_texture_pos = Vector2(relative_world_pos[1] / window_size, relative_world_pos[2] / window_size)
		local relative_screen_pos = Vector3(relative_texture_pos[1] * w, h - relative_texture_pos[2] * h, 0)
		local relative_texture_size = Vector2(size * stretch_multiplier[1] / window_size * w, size * stretch_multiplier[2] / window_size * h)
		local layer = 50
		local angle = water_data.angle
		local realtive_start_pos = relative_screen_pos - relative_texture_size * 0.5
		local tm = Rotation2D(Vector3(0, 0, 0), angle, realtive_start_pos + relative_texture_size * 0.5)
		local value = 1 - math.pow(water_data.timer / ref_time, 3)

		value = 1 - t

		local alpha = value * 255

		Gui.bitmap_3d(self._gui, water_data.material, tm, realtive_start_pos, layer, relative_texture_size, Color(alpha, 255, 255, 255))

		counter = counter + 1

		if duplicate_edge_cases then
			if realtive_start_pos.x < 0 then
				local offset = realtive_start_pos + Vector3(w, 0, 0)
				local tm = Rotation2D(Vector3(0, 0, 0), angle, offset + relative_texture_size * 0.5)

				Gui.bitmap_3d(self._gui, water_data.material, tm, offset, layer, relative_texture_size, Color(alpha, 255, 255, 255))

				counter = counter + 1
			elseif w < realtive_start_pos.x + relative_texture_size.x then
				local offset = realtive_start_pos + Vector3(-w, 0, 0)
				local tm = Rotation2D(Vector3(0, 0, 0), angle, offset + relative_texture_size * 0.5)

				Gui.bitmap_3d(self._gui, water_data.material, tm, offset, layer, relative_texture_size, Color(alpha, 255, 255, 255))

				counter = counter + 1
			end

			if realtive_start_pos.y < 0 then
				local offset = realtive_start_pos + Vector3(0, h, 0)
				local tm = Rotation2D(Vector3(0, 0, 0), angle, offset + relative_texture_size * 0.5)

				Gui.bitmap_3d(self._gui, water_data.material, tm, offset, layer, relative_texture_size, Color(alpha, 255, 255, 255))

				counter = counter + 1
			elseif h < realtive_start_pos.y + relative_texture_size.x then
				local offset = realtive_start_pos + Vector3(0, -h, 0)
				local tm = Rotation2D(Vector3(0, 0, 0), angle, offset + relative_texture_size * 0.5)

				Gui.bitmap_3d(self._gui, water_data.material, tm, offset, layer, relative_texture_size, Color(alpha, 255, 255, 255))

				counter = counter + 1
			end
		end

		water_data.timer = water_data.timer + dt

		if ref_time <= water_data.timer then
			DATA_TO_REMOVE[#DATA_TO_REMOVE + 1] = idx
		end
	end

	for i = #DATA_TO_REMOVE, 1, -1 do
		local idx = DATA_TO_REMOVE[i]

		table.remove(self._water_ripples, idx)
	end
end

WorldInteractionManager._update_foliage = function (self, dt, t)
	local local_player = Managers.player:local_player()
	local local_player_unit = local_player and local_player.player_unit

	if Unit.alive(local_player_unit) then
		self:_update_foliage_players(dt, t)
		self:_update_foliage_ai(local_player_unit, dt, t)
	end
end

local TEXTURE_SIZE = {}

WorldInteractionManager._update_foliage_players = function (self, dt, t)
	local foliage_settings = WorldInteractionSettings.foliage
	local material_name = foliage_settings.default_foliage_material
	local window_size = math.clamp(foliage_settings.window_size, 1, 100)
	local texture_world_size = foliage_settings.default_texture_world_size
	local duplicate_edge_cases = foliage_settings.duplicate_edge_cases
	local local_player_multiplier = foliage_settings.local_player_multiplier
	local players = Managers.player:players()
	local w, h = Gui.resolution()

	for _, player in pairs(players) do
		local player_unit = player.player_unit
		local unit_pos = POSITION_LOOKUP[player_unit]

		if unit_pos then
			local mover = Unit.mover(player_unit)

			if Mover.collides_down(mover) then
				local texture_size

				if player.local_player then
					TEXTURE_SIZE[1] = texture_world_size[1] * local_player_multiplier
					TEXTURE_SIZE[2] = texture_world_size[2] * local_player_multiplier
					texture_size = TEXTURE_SIZE
				else
					texture_size = texture_world_size
				end

				local relative_world_pos = Vector2(unit_pos[1] % window_size, unit_pos[2] % window_size)
				local relative_texture_pos = Vector2(relative_world_pos[1] / window_size, relative_world_pos[2] / window_size)
				local relative_screen_pos = Vector3(relative_texture_pos[1] * w, h - relative_texture_pos[2] * h, 0)
				local relative_texture_size = Vector2(texture_size[1] / window_size * w, texture_size[2] / window_size * h)
				local realtive_start_pos = relative_screen_pos - relative_texture_size * 0.5

				Gui.bitmap(self._gui, material_name, realtive_start_pos, relative_texture_size, Color(255, 255, 255, 255))

				if duplicate_edge_cases then
					if realtive_start_pos.x < 0 then
						local offset = realtive_start_pos + Vector3(w, 0, 0)

						Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
					elseif w < realtive_start_pos.x + relative_texture_size.x then
						local offset = realtive_start_pos + Vector3(-w, 0, 0)

						Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
					end

					if realtive_start_pos.y < 0 then
						local offset = realtive_start_pos + Vector3(0, h, 0)

						Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
					elseif h < realtive_start_pos.y + relative_texture_size.x then
						local offset = realtive_start_pos + Vector3(0, -h, 0)

						Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
					end
				end
			end
		end
	end
end

WorldInteractionManager._update_foliage_ai = function (self, local_player_unit, dt, t)
	local foliage_settings = WorldInteractionSettings.foliage
	local material_name = foliage_settings.default_foliage_material
	local window_size = math.clamp(foliage_settings.window_size, 1, 100)
	local texture_world_size = foliage_settings.default_texture_world_size
	local duplicate_edge_cases = foliage_settings.duplicate_edge_cases
	local w, h = Gui.resolution()
	local player_pos = Unit.local_position(local_player_unit, 0)
	local ai_broadphase = Managers.state.entity:system("ai_system").broadphase
	local ai_unit
	local num_enemies = Broadphase.query(ai_broadphase, player_pos, window_size * 0.5, ENEMIES)

	for i = 1, num_enemies do
		ai_unit = ENEMIES[i]

		if Unit.alive(ai_unit) then
			local unit_pos = POSITION_LOOKUP[ai_unit]
			local relative_world_pos = Vector2(unit_pos[1] % window_size, unit_pos[2] % window_size)
			local relative_texture_pos = Vector2(relative_world_pos[1] / window_size, relative_world_pos[2] / window_size)
			local relative_screen_pos = Vector3(relative_texture_pos[1] * w, h - relative_texture_pos[2] * h, 0)
			local relative_texture_size = Vector2(texture_world_size[1] / window_size * w, texture_world_size[2] / window_size * h)
			local realtive_start_pos = relative_screen_pos - relative_texture_size * 0.5

			Gui.bitmap(self._gui, material_name, realtive_start_pos, relative_texture_size, Color(255, 255, 255, 255))

			if duplicate_edge_cases then
				if realtive_start_pos.x < 0 then
					local offset = realtive_start_pos + Vector3(w, 0, 0)

					Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
				elseif w < realtive_start_pos.x + relative_texture_size.x then
					local offset = realtive_start_pos + Vector3(-w, 0, 0)

					Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
				end

				if realtive_start_pos.y < 0 then
					local offset = realtive_start_pos + Vector3(0, h, 0)

					Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
				elseif h < realtive_start_pos.y + relative_texture_size.x then
					local offset = realtive_start_pos + Vector3(0, -h, 0)

					Gui.bitmap(self._gui, material_name, offset, relative_texture_size, Color(255, 255, 255, 255))
				end
			end
		end
	end
end

WorldInteractionManager.destory = function (self)
	return
end
