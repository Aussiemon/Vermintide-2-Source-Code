-- chunkname: @scripts/managers/conflict_director/weave_spawner.lua

require("scripts/settings/weave_spawning_settings")

WeaveSpawner = class(WeaveSpawner)

WeaveSpawner.init = function (self, world)
	self.main_path_spawning_index = 1
	self.started_trickle = false
	self.players_has_left_safe_zone = false
end

WeaveSpawner.players_left_safe_zone = function (self)
	self.players_has_left_safe_zone = true
end

local DO_RELOAD = true

WeaveSpawner.update = function (self, t, dt, objective_template)
	local spawning_settings = objective_template.spawning_settings

	if not spawning_settings or spawning_settings.disabled then
		return
	end

	local terror_event_trickle = spawning_settings.terror_event_trickle
	local main_path_spawning_settings = spawning_settings.main_path_spawning

	self:_update_terror_event_trickle(t, dt, terror_event_trickle)
	self:_update_main_path_spawning(t, dt, main_path_spawning_settings)
end

WeaveSpawner.start_terror_event_from_template = function (self, event_template_name, spawner_id)
	local seed = self.original_seed

	Managers.state.conflict:start_terror_event_from_template(event_template_name, spawner_id, seed)
end

WeaveSpawner._update_terror_event_trickle = function (self, t, dt, terror_event_trickle)
	if self.players_has_left_safe_zone and not self.started_trickle and terror_event_trickle and self.conflict_director_setup_done then
		local all_players_spawned = Managers.matchmaking:are_all_players_spawned()

		if all_players_spawned then
			self.started_trickle = true

			TerrorEventMixer.start_event(terror_event_trickle)
		end
	end
end

WeaveSpawner._update_main_path_spawning = function (self, t, dt, main_path_spawning_settings)
	if self.players_has_left_safe_zone and self.conflict_director_setup_done then
		local main_path_spawning_index = self.main_path_spawning_index
		local main_path_spawning_setting = main_path_spawning_settings and main_path_spawning_settings[main_path_spawning_index]

		if main_path_spawning_setting then
			local conflict_director = Managers.state.conflict
			local level_analysis = conflict_director.level_analysis
			local main_path_data = level_analysis.main_path_data
			local ahead_travel_dist = conflict_director.main_path_info.ahead_travel_dist
			local total_travel_dist = main_path_data.total_dist
			local travel_percentage = ahead_travel_dist / total_travel_dist * 100
			local percentage_threshold = main_path_spawning_setting.percentage
			local terror_event = main_path_spawning_setting.terror_event_name

			if percentage_threshold <= travel_percentage then
				local main_path_trigger_distance = total_travel_dist * (percentage_threshold * 0.01)
				local percentage_spawn_offset = main_path_spawning_setting.percentage_spawn_offset
				local offset_distance = 0

				if percentage_spawn_offset then
					offset_distance = total_travel_dist * (percentage_spawn_offset * 0.01)
				end

				local data = {
					main_path_trigger_distance = main_path_trigger_distance + offset_distance,
					seed = self.original_seed,
				}

				TerrorEventMixer.start_event(terror_event, data)

				self.main_path_spawning_index = self.main_path_spawning_index + 1
			end
		end
	end
end

WeaveSpawner.set_seed = function (self, seed)
	fassert(seed and type(seed) == "number", "Bad seed input!")

	self.seed = seed
	self.original_seed = seed
end

WeaveSpawner._random = function (self, ...)
	fassert(self.seed, "No seed set for weave spawning!")

	local seed, value = Math.next_random(self.seed, ...)

	self.seed = seed

	return value
end

WeaveSpawner.get_hidden_spawn_pos_from_position_seeded = function (self, epicenter)
	fassert(epicenter ~= nil, "Need to supply position when triggering get_hidden_spawn_pos_from_position_seeded")

	local conflict_director = Managers.state.conflict
	local world = conflict_director._world
	local side = Managers.state.side:get_side_from_name("heroes")
	local avoid_positions = side.PLAYER_POSITIONS
	local h = Vector3(0, 0, 1)
	local radius = 30
	local radius_spread = 10
	local max_tries = 10
	local ignore_umbra = not World.umbra_available(world)
	local hidden_spawn_pos

	for i = 1, max_tries do
		local check_pos

		for j = 1, max_tries do
			local add_vec = Vector3(radius + (self:_random() - 0.5) * radius_spread, 0, 1)
			local pos = epicenter + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(self:_random(1, 360))), add_vec)
			local circle_pos = ConflictUtils.find_center_tri(conflict_director.nav_world, pos)

			if circle_pos then
				check_pos = circle_pos
			end
		end

		if check_pos then
			local hidden = true

			for j = 1, #avoid_positions do
				local avoid_pos = avoid_positions[j]
				local los = ignore_umbra or World.umbra_has_line_of_sight(world, check_pos + h, avoid_pos + h)

				if los then
					hidden = false

					break
				end
			end

			if hidden then
				hidden_spawn_pos = check_pos
			end
		end
	end

	if not hidden_spawn_pos then
		return
	end

	return hidden_spawn_pos
end
