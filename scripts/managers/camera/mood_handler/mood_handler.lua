-- chunkname: @scripts/managers/camera/mood_handler/mood_handler.lua

require("scripts/settings/mood_settings")

MoodHandler = class(MoodHandler)

MoodHandler.init = function (self, world)
	self.world = world
	self.playing_particles = {}
	self.current_mood = "default"
	self.mood_blends = nil
	self.mood_weights = {}

	local environment = require("scripts/settings/lua_environments/moods")
	local env_vars, type_map = self:parse_environment_settings(environment)

	self.environment_variables = env_vars
	self.environment_variables_type_map = type_map
	self.environment_variables_to_set = {}
	self.environment_weight_remainder = 1
	self._local_moods = {}
	self._mood_timers = {}

	for mood, _ in pairs(MoodSettings) do
		self._local_moods[mood] = {}
		self._mood_timers[mood] = {}
	end
end

MoodHandler.destroy = function (self)
	local world = self.world
	local playing_particles = self.playing_particles

	for _, particle_id in pairs(playing_particles) do
		if World.are_particles_playing(world, particle_id) then
			World.destroy_particles(world, particle_id)
		end
	end

	self.playing_particles = nil
	self.world = nil
	self.environment_variables = nil
	self.mood_blends = nil
	self.environment_variables_to_set = nil
	self.mood_weights = nil
end

MoodHandler.parse_environment_settings = function (self, environment)
	local environment_settings = environment.settings
	local variables = {}
	local type_map = {}

	for env_setting_name, env_setting in pairs(environment_settings) do
		if env_setting_name ~= "default" then
			variables[env_setting_name] = {}

			local var_n = 1

			for var_name, var_value in pairs(env_setting.variables) do
				local weight = env_setting.variable_weights[var_name]

				if weight == 1 then
					local var_type

					if type(var_value) == "string" then
						var_type = "texture"
					elseif type(var_value) == "number" then
						var_type = "scalar"
					elseif type(var_value) == "table" then
						if #var_value == 2 then
							var_type = "vector2"
							var_value = Vector3Box(var_value[1], var_value[2], 0)
						elseif #var_value == 3 then
							var_type = "vector3"
							var_value = Vector3Box(var_value[1], var_value[2], var_value[3])
						elseif #var_value == 4 then
							var_type = "vector4"
						end
					end

					if var_type then
						variables[env_setting_name][var_n] = {
							name = var_name,
							value = var_value,
						}
						type_map[var_name] = type_map[var_name] or var_type
						var_n = var_n + 1
					end
				end
			end
		end
	end

	return variables, type_map
end

MoodHandler._set_active_mood = function (self, next_mood)
	if Development.parameter("screen_space_player_camera_reactions") == false then
		return
	end

	fassert(next_mood and (next_mood == "default" or MoodSettings[next_mood]), "Mood %q not defined in MoodSettings.lua", next_mood)

	local current_mood = self.current_mood

	if next_mood == current_mood then
		return
	end

	self:add_mood_blend(current_mood, next_mood)
	self:handle_particles(current_mood, next_mood)

	self.current_mood = next_mood
end

MoodHandler.add_mood_blend = function (self, current_mood, next_mood)
	if Development.parameter("screen_space_player_camera_reactions") == false then
		return
	end

	local blend_time

	if next_mood == "default" then
		blend_time = MoodSettings[current_mood].blend_out_time
	else
		blend_time = MoodSettings[next_mood].blend_in_time
	end

	if blend_time == 0 then
		self.mood_blends = nil
	else
		self.mood_blends = {
			value = 0,
			mood = current_mood,
			speed = 1 / blend_time,
			blends = self.mood_blends,
		}
	end
end

MoodHandler.handle_particles = function (self, current_mood, next_mood)
	local playing_particles = self.playing_particles
	local world = self.world

	for _, particle_id in pairs(playing_particles) do
		if World.are_particles_playing(world, particle_id) then
			World.stop_spawning_particles(world, particle_id)
		end
	end

	table.clear(playing_particles)

	if current_mood ~= "default" then
		local on_exit_particles = MoodSettings[current_mood].particle_effects_on_exit

		if on_exit_particles then
			for _, particle_name in pairs(on_exit_particles) do
				playing_particles[#playing_particles + 1] = World.create_particles(world, particle_name, Vector3.zero())
			end
		end
	end

	if next_mood ~= "default" then
		local next_mood_settings = MoodSettings[next_mood]
		local no_particles_on_enter_from = next_mood_settings.no_particles_on_enter_from
		local play_particles = not no_particles_on_enter_from or not table.find(no_particles_on_enter_from, current_mood)

		if play_particles then
			local on_enter_particles = next_mood_settings.particle_effects_on_enter

			if on_enter_particles then
				local playing_particles = self.playing_particles
				local world = self.world

				for _, particle_name in pairs(on_enter_particles) do
					playing_particles[#playing_particles + 1] = World.create_particles(world, particle_name, Vector3.zero())
				end
			end
		end
	end
end

MoodHandler.update = function (self, dt)
	self:_update_mood_timers()
	self:update_mood_blends(dt)
	self:update_environment_variables()
end

MoodHandler.update_mood_blends = function (self, dt)
	local mood_weights = self.mood_weights

	table.clear(mood_weights)

	mood_weights[1] = self.current_mood

	self:set_mood_weights(dt, self.mood_blends, mood_weights, 1)
end

MoodHandler.set_mood_weights = function (self, dt, blend, mood_weights, weight)
	if blend then
		blend.value = blend.value + blend.speed * dt

		if blend.value >= 1 then
			blend.blends = nil
			mood_weights[#mood_weights + 1] = weight
		else
			mood_weights[#mood_weights + 1] = blend.value * weight
			mood_weights[#mood_weights + 1] = blend.mood

			return self:set_mood_weights(dt, blend.blends, mood_weights, weight * (1 - blend.value))
		end
	else
		mood_weights[#mood_weights + 1] = weight
	end
end

MoodHandler.update_environment_variables = function (self)
	local variables_to_set = self.environment_variables_to_set

	table.clear(variables_to_set)

	local mood_weights = self.mood_weights
	local environment_vars = self.environment_variables
	local type_map = self.environment_variables_type_map
	local weight_remainder = 1

	for i = 1, #mood_weights, 2 do
		local mood_name = mood_weights[i]

		if mood_name ~= "default" then
			local env_setting = MoodSettings[mood_name].environment_setting
			local variables = environment_vars[env_setting]
			local mood_weight = mood_weights[i + 1]

			for i = 1, #variables do
				local var = variables[i]
				local var_name = var.name
				local var_value = var.value
				local var_type = type_map[var_name]
				local value_to_set = variables_to_set[var_name]

				if var_type == "texture" then
					value_to_set = value_to_set or var_value
				elseif var_type == "scalar" then
					value_to_set = value_to_set or 0
					value_to_set = value_to_set + var_value * mood_weight
				elseif var_type == "vector2" or var_type == "vector3" then
					value_to_set = value_to_set or Vector3(0, 0, 0)
					value_to_set = value_to_set + var_value:unbox() * mood_weight
				elseif var_type == "vector4" then
					value_to_set = value_to_set or {
						0,
						0,
						0,
						0,
					}
					value_to_set[1] = value_to_set[1] + var_value[1] * mood_weight
					value_to_set[2] = value_to_set[2] + var_value[2] * mood_weight
					value_to_set[3] = value_to_set[3] + var_value[3] * mood_weight
					value_to_set[4] = value_to_set[4] + var_value[4] * mood_weight
				end

				variables_to_set[var_name] = value_to_set
			end

			weight_remainder = weight_remainder - mood_weight
		end
	end

	for var_name, var_value in pairs(variables_to_set) do
		local var_type = type_map[var_name]

		if var_type == "vector2" or var_type == "vector3" then
			variables_to_set[var_name] = Vector3Box(var_value)
		end
	end

	self.environment_weight_remainder = math.max(weight_remainder, 0)
end

MoodHandler.apply_environment_variables = function (self, shading_environment)
	local type_map = self.environment_variables_type_map
	local weight_remainder = self.environment_weight_remainder

	for var_name, var_value in pairs(self.environment_variables_to_set) do
		local var_type = type_map[var_name]

		if weight_remainder == 0 then
			if var_type == "texture" then
				ShadingEnvironment.set_texture(shading_environment, var_name, var_value)
			elseif var_type == "scalar" then
				ShadingEnvironment.set_scalar(shading_environment, var_name, var_value)
			elseif var_type == "vector2" then
				ShadingEnvironment.set_vector2(shading_environment, var_name, var_value:unbox())
			elseif var_type == "vector3" then
				ShadingEnvironment.set_vector3(shading_environment, var_name, var_value:unbox())
			elseif var_type == "vector4" then
				ShadingEnvironment.set_vector4(shading_environment, var_name, var_value[1], var_value[2], var_value[3], var_value[4])
			end
		elseif var_type == "texture" then
			ShadingEnvironment.set_texture(shading_environment, var_name, var_value)
		elseif var_type == "scalar" then
			local default_value = ShadingEnvironment.scalar(shading_environment, var_name) * weight_remainder
			local set_value = var_value + default_value

			ShadingEnvironment.set_scalar(shading_environment, var_name, set_value)
		elseif var_type == "vector2" then
			local default_value = ShadingEnvironment.vector2(shading_environment, var_name) * weight_remainder
			local set_value = var_value:unbox() + default_value

			ShadingEnvironment.set_vector2(shading_environment, var_name, set_value)
		elseif var_type == "vector3" then
			local default_value = ShadingEnvironment.vector3(shading_environment, var_name) * weight_remainder
			local set_value = var_value:unbox() + default_value

			ShadingEnvironment.set_vector3(shading_environment, var_name, set_value)
		elseif var_type == "vector4" then
			local default_x, default_y, default_z, default_w = Quaternion.to_elements(ShadingEnvironment.vector4(shading_environment, var_name))

			default_x = default_x * weight_remainder
			default_y = default_y * weight_remainder
			default_z = default_z * weight_remainder
			default_w = default_w * weight_remainder

			local set_x = var_value[1] + default_x
			local set_y = var_value[2] + default_y
			local set_z = var_value[3] + default_z
			local set_w = var_value[4] + default_w

			ShadingEnvironment.set_vector4(shading_environment, var_name, set_x, set_y, set_z, set_w)
		end
	end
end

MoodHandler.set_mood = function (self, mood_name, reason, value)
	local had_mood = self:has_mood(mood_name)

	if not value and not had_mood then
		return
	end

	self:_set_mood_internal(mood_name, reason, value)

	if value and had_mood then
		return
	end

	self:_update_mood_priority()
end

MoodHandler._set_mood_internal = function (self, mood_name, reason, value)
	self._local_moods[mood_name][reason] = value or nil

	if mood_name ~= "default" then
		local mood_template = MoodSettings[mood_name]

		if mood_template.hold_time then
			if value then
				local t = Managers.time:time("game")

				self._mood_timers[mood_name][reason] = t + mood_template.hold_time
			else
				self._mood_timers[mood_name][reason] = nil
			end
		end
	end
end

MoodHandler.clear_mood = function (self, mood_name)
	local had_mood = self:has_mood(mood_name)

	if not had_mood then
		return
	end

	table.clear(self._local_moods[mood_name])
	table.clear(self._mood_timers[mood_name])
	self:_update_mood_priority()
end

MoodHandler.has_mood = function (self, mood_name)
	return not table.is_empty(self._local_moods[mood_name])
end

MoodHandler._update_mood_timers = function (self)
	local dirty = false
	local t = Managers.time:time("game")

	for mood_name, timers in pairs(self._mood_timers) do
		for reason, end_t in pairs(timers) do
			if end_t < t then
				self:set_mood(mood_name, reason, false)

				dirty = dirty or table.is_empty(timers)
			end
		end
	end

	if dirty then
		self:_update_mood_priority()
	end
end

MoodHandler._update_mood_priority = function (self)
	local mood_priority = MoodPriority
	local wanted_mood

	for i = 1, #mood_priority do
		local mood = mood_priority[i]

		if self:has_mood(mood) then
			wanted_mood = mood

			break
		end
	end

	wanted_mood = wanted_mood or "default"

	if wanted_mood ~= self.current_mood then
		self:_set_active_mood(wanted_mood)
	end
end
