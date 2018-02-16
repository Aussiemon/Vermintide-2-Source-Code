-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HordeSpawner = class(HordeSpawner)
local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS
local horde_sectors = {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{}
}
local cover_sectors = {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{}
}
local num_sectors = #horde_sectors
local found_cover_points = {}
local temp_horde_spawners = {}
local temp_hidden_spawners = {}
local player_positions = PLAYER_POSITIONS
HordeSpawner.init = function (self, world, cover_points_broadphase)
	self.cover_broadphase = cover_points_broadphase
	self.hordes = {}
	self.lookup_horde = {}
	self.conflict_director = Managers.state.conflict
	self.spawner_system = Managers.state.entity:system("spawner_system")
	self.num_paced_hordes = 0
	self.world = world
	self.physics_world = World.physics_world(world)

	return 
end

local function remove_index_from_array(array, index)
	local end_index = #array
	array[index] = array[end_index]
	array[end_index] = nil

	return 
end

local function copy_array(a, b)
	local source_size = #a
	local dest_size = #b

	for i = 1, source_size, 1 do
		b[i] = a[i]
	end

	for i = source_size + 1, dest_size, 1 do
		b[i] = nil
	end

	return 
end

HordeSpawner.horde = function (self, horde_type, extra_data)
	Profiler.start("horde_spawner")

	if not horde_type then
		if CurrentHordeSettings.mix_paced_hordes then
			if self.num_paced_hordes%2 == 0 then
				if math.random() < CurrentHordeSettings.chance_of_vector then
					horde_type = "vector"
				else
					horde_type = "ambush"
				end
			elseif self.last_paced_horde_type == "vector" then
				horde_type = "ambush"
			else
				horde_type = "vector"
			end
		elseif math.random() < CurrentHordeSettings.chance_of_vector then
			horde_type = "vector"
		else
			horde_type = "ambush"
		end

		if horde_type == "vector" and math.random() <= CurrentHordeSettings.chance_of_vector_blob then
			horde_type = "vector_blob"
		end
	end

	print("horde requested: ", horde_type)

	if horde_type == "vector" then
		self.execute_vector_horde(self, extra_data)
	elseif horde_type == "vector_blob" then
		self.execute_vector_blob_horde(self, extra_data)
	else
		self.execute_ambush_horde(self, extra_data)
	end

	Profiler.stop("horde_spawner")

	return 
end
HordeSpawner.execute_fallback = function (self, horde_type, fallback, reason, extra_data)
	if fallback then
		if script_data.debug_player_intensity then
			self.conflict_director.pacing:annotate_graph("Failed horde", "red")
		end

		print("Failed to start horde, all fallbacks failed at this place")

		return 
	end

	print(reason)

	if horde_type == "ambush" then
		self.execute_vector_horde(self, extra_data, "fallback")
	elseif horde_type == "vector" then
		self.execute_ambush_horde(self, extra_data, "fallback")
	end

	return 
end
HordeSpawner.execute_event_horde = function (self, t, terror_event_id, composition_type, limit_spawners, silent, group_template, strictly_not_close_to_players)
	local composition = CurrentHordeSettings.compositions[composition_type]
	local index = LoadedDice.roll_easy(composition.loaded_probs)
	local variant = composition[index]
	local horde_type = "event"
	local sound_settings = composition.sound_settings
	local horde = {
		composition_type = composition_type,
		limit_spawners = limit_spawners,
		terror_event_id = terror_event_id,
		start_time = t + (composition.start_time or 4),
		end_time = t + (composition.start_time or 4) + 20,
		horde_type = horde_type,
		silent = silent,
		group_template = group_template,
		strictly = strictly_not_close_to_players,
		variant = variant,
		sound_settings = sound_settings
	}
	local hordes = self.hordes
	local id = #hordes + 1
	hordes[id] = horde

	return horde
end
HordeSpawner.max_composition_size = function (self, composition_name)
	local max_size = 0
	local composition = CurrentHordeSettings.compositions[composition_name]

	for i = 1, #composition, 1 do
		local variant = composition[i]
		local breeds = variant.breeds
		local max_variant_size = 0

		for j = 1, #breeds, 2 do
			local breed_name = breeds[i]
			local amount = breeds[i + 1]
			local n = (type(amount) == "table" and math.max(amount[1], amount[2])) or amount
			max_variant_size = max_variant_size + n
		end

		if max_size < max_variant_size then
			max_size = max_variant_size
		end
	end

	return max_size
end
HordeSpawner.running_horde = function (self)
	return self._running_horde_type, self._running_horde_sound_settings
end

function random_array_insert(array, size, data)
	local swap = math.random(1, size)
	array[size + 1] = array[swap]
	array[swap] = data

	return 
end

local ok_spawner_breeds = {
	skaven_clan_rat = true,
	skaven_slave = true
}
local spawn_list_a = {}
local spawn_list_b = {}
HordeSpawner.compose_horde_spawn_list = function (self, variant)
	local i = 1

	table.clear_array(spawn_list_a, #spawn_list_a)
	table.clear_array(spawn_list_b, #spawn_list_b)

	local breeds = variant.breeds

	for i = 1, #breeds, 2 do
		local breed_name = breeds[i]
		local amount = breeds[i + 1]
		local num_to_spawn = ConflictUtils.random_interval(amount)
		local spawn_list = (ok_spawner_breeds[breed_name] and spawn_list_a) or spawn_list_b
		local start = #spawn_list + 1

		for j = start, start + num_to_spawn, 1 do
			spawn_list[j] = breed_name
		end
	end

	table.shuffle(spawn_list_a)
	table.shuffle(spawn_list_b)

	if script_data.ai_horde_logging then
		table.dump(spawn_list_a, "AAA")
		table.dump(spawn_list_b, "BBB")
	end

	local sum_a = #spawn_list_a
	local sum_b = #spawn_list_b
	local sum = sum_a + sum_b

	return sum, sum_a, sum_b
end
HordeSpawner.compose_blob_horde_spawn_list = function (self, composition_type)
	local composition = CurrentHordeSettings.compositions[composition_type]
	local index = LoadedDice.roll_easy(composition.loaded_probs)
	local variant = composition[index]
	local i = 1
	local spawn_list = spawn_list_a

	table.clear_array(spawn_list_a, #spawn_list_a)

	local breeds = variant.breeds

	for i = 1, #breeds, 2 do
		local breed_name = breeds[i]
		local amount = breeds[i + 1]
		local num_to_spawn = ConflictUtils.random_interval(amount)
		local start = #spawn_list + 1

		for j = start, start + num_to_spawn, 1 do
			spawn_list[j] = breed_name
		end
	end

	table.shuffle(spawn_list)

	return spawn_list, #spawn_list
end

local function pop_array(array)
	local size = #array

	if 0 < size then
		local breed_name = array[size]
		array[size] = nil

		return breed_name
	end

	return 
end

local use_horde = false
HordeSpawner.pop_random_any_breed = function (self)
	use_horde = not use_horde
	local breed = nil

	if use_horde then
		breed = pop_array(spawn_list_a) or pop_array(spawn_list_b)
	else
		breed = pop_array(spawn_list_b) or pop_array(spawn_list_a)
	end

	return breed
end
HordeSpawner.pop_random_horde_breed_only = function (self)
	local breed = pop_array(spawn_list_a)

	return breed
end
HordeSpawner.execute_ambush_horde = function (self, extra_data, fallback, override_epicenter_pos)
	print("setting up ambush-horde")

	local settings = CurrentHordeSettings.ambush
	local max_spawners = settings.max_spawners
	local min_dist = settings.min_horde_spawner_dist
	local max_dist = settings.max_horde_spawner_dist
	local hidden_min_dist = settings.min_hidden_spawner_dist
	local hidden_max_dist = settings.max_hidden_spawner_dist
	local start_delay = settings.start_delay
	local composition_type = nil
	composition_type = CurrentHordeSettings.ambush_composition or "medium"

	assert(composition_type, "Ambush Horde missing composition_type")

	local composition = CurrentHordeSettings.compositions[composition_type]
	local index = LoadedDice.roll_easy(composition.loaded_probs)
	local variant = composition[index]

	print("Composing horde '" .. composition_type .. "' .. using variant '" .. variant.name .. "'")

	local epicenter_pos, main_target_pos = nil

	if override_epicenter_pos then
		main_target_pos = override_epicenter_pos
		epicenter_pos = override_epicenter_pos
	else
		local clusters, clusters_sizes = ConflictUtils.cluster_positions(player_and_bot_positions, 7)
		local biggest_cluster = ConflictUtils.get_biggest_cluster(clusters_sizes)
		main_target_pos = clusters[biggest_cluster]
		epicenter_pos = main_target_pos
	end

	local all_spawners = self.spawner_system:enabled_spawners()
	local hidden_lookup = self.spawner_system:hidden_spawners_lookup()
	local horde_spawners, horde_spawners_hidden = ConflictUtils.filter_horde_spawners(player_and_bot_positions, all_spawners, hidden_lookup, min_dist, max_dist)

	self.reset_sectors(self, horde_sectors)
	self.calc_sectors(self, epicenter_pos, horde_spawners, horde_sectors)

	if script_data.debug_hordes then
		self.render_sectors(self, horde_sectors)
	end

	local n_horde_spawners = #horde_spawners
	local n_horde_spawners_hidden = #horde_spawners_hidden

	table.clear_array(found_cover_points, #found_cover_points)
	self.hidden_cover_points(self, self.cover_broadphase, epicenter_pos, player_and_bot_positions, found_cover_points, hidden_min_dist, hidden_max_dist)
	self.reset_sectors(self, cover_sectors)
	self.calc_sectors(self, epicenter_pos, found_cover_points, cover_sectors)

	if script_data.debug_hordes then
		self.render_sectors(self, cover_sectors)
	end

	local n_cover_spawners = #found_cover_points

	if n_cover_spawners <= 0 then
		if n_horde_spawners <= 0 then
			self.execute_fallback(self, "ambush", fallback, "ambush horde failed to find spawners, starts a vector-horde instead")

			return 
		end

		if n_horde_spawners_hidden <= 0 and variant.must_use_hidden_spawners then
			self.execute_fallback(self, "ambush", fallback, "ambush horde failed to find any kind of hidden spawners for their none-horde compatable units, starts a vector-horde instead")

			return 
		end
	end

	local num_to_spawn = self.compose_horde_spawn_list(self, variant)

	print("-> spawning:", num_to_spawn)

	local group_template = {
		template = "horde",
		id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
		size = num_to_spawn,
		group_data = extra_data
	}
	local t = Managers.time:time("game")
	local sound_settings = composition.sound_settings
	local horde = {
		horde_type = "ambush",
		spawned = 0,
		num_to_spawn = num_to_spawn,
		main_target_pos = Vector3Box(main_target_pos),
		start_time = t + start_delay,
		group_template = group_template,
		sound_settings = sound_settings
	}

	if 0 < #horde_spawners then
		horde.horde_spawns = {}
	end

	if 0 < #found_cover_points then
		horde.cover_spawns = {}
	end

	if num_to_spawn < max_spawners then
		max_spawners = num_to_spawn
	end

	local spawner_count = 0
	local last_spawner_count = -1
	local sector_index = 1

	while last_spawner_count ~= spawner_count and spawner_count < num_to_spawn do
		last_spawner_count = spawner_count
		local spawn_time = t - 0.05

		for i = 1, num_sectors, 1 do
			local horde_sector = horde_sectors[i]
			local spawner = horde_sector[sector_index]

			if spawner then
				local hidden = hidden_lookup[spawner]
				local breed_name = (hidden and self.pop_random_any_breed(self)) or self.pop_random_horde_breed_only(self)

				if breed_name then
					horde.horde_spawns[#horde.horde_spawns + 1] = {
						num_to_spawn = 1,
						spawner = spawner,
						spawn_list = {
							breed_name
						},
						hidden = hidden
					}
					spawner_count = spawner_count + 1
				end
			end

			local cover_sector = cover_sectors[i]
			local cover_point_unit = cover_sector[sector_index]

			if cover_point_unit then
				local breed_name = self.pop_random_any_breed(self)

				if breed_name then
					horde.cover_spawns[#horde.cover_spawns + 1] = {
						num_to_spawn = 1,
						next_spawn_time = spawn_time,
						cover_point_unit = cover_point_unit,
						spawn_list = {
							breed_name
						}
					}
					spawner_count = spawner_count + 1
					spawn_time = spawn_time + 0.1
				end
			end
		end

		sector_index = sector_index + 1
	end

	if spawner_count < num_to_spawn then
		local missing = num_to_spawn - spawner_count
		local horde_spawner_index = 1
		local num_horde_spawns = (horde.horde_spawns and #horde.horde_spawns) or 0
		local num_cover_spawns = (horde.cover_spawns and #horde.cover_spawns) or 0
		local hidden_spawner_index = 1

		while 0 < missing do
			local spawner, breed_name = nil

			if 0 < num_horde_spawns then
				spawner = horde.horde_spawns[horde_spawner_index]
				local breed_name = (spawner.hidden and self.pop_random_any_breed(self)) or self.pop_random_horde_breed_only(self)

				if breed_name then
					spawner.num_to_spawn = spawner.num_to_spawn + 1
					spawner.spawn_list[#spawner.spawn_list + 1] = breed_name
					horde_spawner_index = horde_spawner_index%num_horde_spawns + 1
					missing = missing - 1

					if missing <= 0 then
						break
					end
				else
					horde_spawner_index = horde_spawner_index%num_horde_spawns + 1
				end
			end

			if 0 < num_cover_spawns then
				breed_name = self.pop_random_any_breed(self)

				if breed_name then
					spawner = horde.cover_spawns[hidden_spawner_index]
					hidden_spawner_index = hidden_spawner_index%num_cover_spawns + 1
					spawner.num_to_spawn = spawner.num_to_spawn + 1
					spawner.spawn_list[#spawner.spawn_list + 1] = breed_name
					missing = missing - 1

					if missing <= 0 then
						break
					end
				end
			end
		end
	end

	if script_data.debug_player_intensity then
		self.conflict_director.pacing:annotate_graph("(A)Horde:" .. num_to_spawn, "lime")
	end

	local hordes = self.hordes
	local id = #hordes + 1
	hordes[id] = horde
	self.last_paced_horde_type = "ambush"
	self.num_paced_hordes = self.num_paced_hordes + 1

	return 
end
HordeSpawner.replace_hidden_spawners = function (self, hidden_spawners, spawner_in_sight, offending_player_pos)
	if spawner_in_sight.dont_move then
		return 
	end

	local epicenter_pos = Unit.local_position(spawner_in_sight.cover_point_unit, 0)
	local hidden_min_dist = 10
	local hidden_max_dist = 20
	local main_target_pos = offending_player_pos
	local found_cover_points = found_cover_points

	table.clear_array(found_cover_points, #found_cover_points)
	self.hidden_cover_points(self, self.cover_broadphase, epicenter_pos, {
		epicenter_pos
	}, found_cover_points, hidden_min_dist, hidden_max_dist, main_target_pos)

	local num_found = #found_cover_points

	print("replace_hidden_spawners -> first try found:", num_found, "cover points")

	if num_found <= 0 then
		hidden_min_dist = 0
		hidden_max_dist = 30
		local distance_ahead = 20
		epicenter_pos = self.get_point_on_main_path(self, main_target_pos, distance_ahead)

		if not epicenter_pos then
			print("replace_hidden_spawners -> no alternate epicenter_pos found. failed! pos:", main_target_pos)

			spawner_in_sight.dont_move = true

			return 
		end

		table.clear_array(found_cover_points, #found_cover_points)
		self.hidden_cover_points(self, self.cover_broadphase, epicenter_pos, {
			epicenter_pos
		}, found_cover_points, hidden_min_dist, hidden_max_dist, main_target_pos)

		num_found = #found_cover_points

		print("replace_hidden_spawners -> second try try found:", num_found, "cover points")
	end

	if num_found <= 0 then
		print("replace_hidden_spawners -> no alternate cover found. failed!")

		spawner_in_sight.dont_move = true

		return 
	end

	print("replace_hidden_spawners -> replacing hidden spawners!")

	local count = 1

	for i = 1, #hidden_spawners, 1 do
		local spawner = hidden_spawners[i]

		if 0 < spawner.num_to_spawn then
			local index = (count - 1)%num_found + 1
			spawner.cover_point_unit = found_cover_points[index]
			count = count + 1

			if script_data.debug_terror then
				local p = Unit.local_position(spawner.cover_point_unit, 0)

				QuickDrawerStay:sphere(p, 2, Color(0, 255, 9))
				QuickDrawerStay:line(p, p + Vector3(0, 0, 10), Color(0, 255, 9))
			end

			print("->moving spawner")
		end
	end

	return true
end
HordeSpawner.find_vector_horde_spawners = function (self, epicenter_pos, main_target_pos)
	local settings = CurrentHordeSettings.vector
	local min_dist = settings.min_horde_spawner_dist
	local max_dist = settings.max_horde_spawner_dist
	local hidden_min_dist = settings.min_hidden_spawner_dist
	local hidden_max_dist = settings.max_hidden_spawner_dist

	if script_data.debug_hordes then
		QuickDrawerStay:sphere(epicenter_pos, 4, Color(240, 208, 100, 240))
	end

	local horde_spawners = self.spawner_system:enabled_spawners()
	horde_spawners = ConflictUtils.filter_positions(epicenter_pos, main_target_pos, horde_spawners, min_dist, max_dist)

	table.clear_array(found_cover_points, #found_cover_points)
	self.hidden_cover_points(self, self.cover_broadphase, epicenter_pos, {
		epicenter_pos
	}, found_cover_points, hidden_min_dist, hidden_max_dist, main_target_pos)

	if #horde_spawners <= 0 and #found_cover_points <= 0 then
		return 
	end

	return "success", horde_spawners, found_cover_points
end
HordeSpawner.find_good_vector_horde_pos = function (self, main_target_pos, distance, check_reachable)
	local success, horde_spawners, found_cover_points = nil
	local epicenter_pos = self.get_point_on_main_path(self, main_target_pos, distance, check_reachable)

	if epicenter_pos then
		success, horde_spawners, found_cover_points = self.find_vector_horde_spawners(self, epicenter_pos, main_target_pos)

		if not success then
			epicenter_pos = self.get_point_on_main_path(self, main_target_pos, distance + 10, check_reachable)

			if epicenter_pos then
				success, horde_spawners, found_cover_points = self.find_vector_horde_spawners(self, epicenter_pos, main_target_pos)
			end
		end
	else
		epicenter_pos = self.get_point_on_main_path(self, main_target_pos, distance + 10, check_reachable)

		if epicenter_pos then
			success, horde_spawners, found_cover_points = self.find_vector_horde_spawners(self, epicenter_pos, main_target_pos)
		end
	end

	return success, horde_spawners, found_cover_points, epicenter_pos
end
HordeSpawner.execute_vector_horde = function (self, extra_data, fallback)
	local settings = CurrentHordeSettings.vector
	local max_spawners = settings.max_spawners
	local start_delay = settings.start_delay

	print("setting up vector-horde")

	local clusters, clusters_sizes = ConflictUtils.cluster_positions(player_and_bot_positions, 7)
	local biggest_cluster = ConflictUtils.get_biggest_cluster(clusters_sizes)
	local main_target_pos = clusters[biggest_cluster]
	local success, horde_spawners, found_cover_points = nil
	local composition_type = CurrentHordeSettings.vector_composition or "medium"

	assert(composition_type, "Vector Horde missing composition_type")

	local composition = CurrentHordeSettings.compositions[composition_type]
	local index = LoadedDice.roll_easy(composition.loaded_probs)
	local variant = composition[index]

	print("Composing horde '" .. composition_type .. "' .. using variant '" .. variant.name .. "'")

	local epicenter_pos = nil

	if not main_target_pos then
		self.execute_fallback(self, "vector", fallback, "WARNING: vector horde could not find an main_target_pos, use fallback instead")

		return 
	end

	local roll = math.random()
	local spawn_horde_ahead = roll <= settings.main_path_chance_spawning_ahead
	local check_reachable = true
	local distance_from_players = settings.main_path_dist_from_players

	if not spawn_horde_ahead then
		distance_from_players = -distance_from_players
	end

	print("--> horde wants to " .. ((spawn_horde_ahead and "spawn ahead of players") or "spawn behind players") .. " (" .. roll .. "/" .. settings.main_path_chance_spawning_ahead)

	success, horde_spawners, found_cover_points, epicenter_pos = self.find_good_vector_horde_pos(self, main_target_pos, distance_from_players, check_reachable)

	if not success then
		spawn_horde_ahead = not spawn_horde_ahead

		print("--> can't find spawners in this direction, switching to " .. ((spawn_horde_ahead and "ahead") or "behind"))

		success, horde_spawners, found_cover_points, epicenter_pos = self.find_good_vector_horde_pos(self, main_target_pos, -distance_from_players, check_reachable)
	end

	if not success then
		self.execute_fallback(self, "vector", fallback, "vector horde could not find an epicenter or spawners, use fallback instead")

		return 
	end

	local num_to_spawn, num_horde_breed, num_hidden_breed = self.compose_horde_spawn_list(self, variant)

	print("-> spawning:", num_to_spawn)

	local group_template = {
		template = "horde",
		id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
		size = num_to_spawn,
		sneaky = spawn_horde_ahead,
		group_data = extra_data
	}
	local t = Managers.time:time("game")
	local sound_settings = composition.sound_settings
	local horde = {
		horde_type = "vector",
		spawned = 0,
		num_to_spawn = num_to_spawn,
		main_target_pos = Vector3Box(main_target_pos),
		epicenter_pos = Vector3Box(epicenter_pos),
		start_time = t + start_delay,
		group_template = group_template,
		sound_settings = sound_settings
	}
	local n_horde_spawners = #horde_spawners
	local n_cover_spawners = #found_cover_points

	if 0 < n_horde_spawners then
		horde.horde_spawns = {}

		copy_array(horde_spawners, temp_horde_spawners)
	end

	if 0 < n_cover_spawners then
		horde.cover_spawns = {}

		copy_array(found_cover_points, temp_hidden_spawners)
	end

	if num_to_spawn < max_spawners then
		max_spawners = num_to_spawn
	end

	local n_found_spawners = n_horde_spawners + n_cover_spawners

	if n_found_spawners < max_spawners then
		max_spawners = n_found_spawners
	end

	local hidden_lookup = self.spawner_system:hidden_spawners_lookup()
	local spawner_count = 0
	local f_amount_per_spawner = num_to_spawn/max_spawners
	local amount_per_spawner = math.floor(f_amount_per_spawner)
	local bucket = f_amount_per_spawner
	local spawn_counter = 0
	local last_spawn_counter = nil
	local horde_spawns = horde.horde_spawns

	for i = 1, n_horde_spawners, 1 do
		local spawner = temp_horde_spawners[i]
		local hidden = hidden_lookup[spawner]
		local breed_name = (hidden and self.pop_random_any_breed(self)) or self.pop_random_horde_breed_only(self)
		horde_spawns[#horde_spawns + 1] = {
			num_to_spawn = 1,
			spawner = spawner,
			spawn_list = {
				breed_name
			},
			hidden = hidden
		}
		spawn_counter = spawn_counter + 1
	end

	local spawn_time = t - 0.05
	local cover_spawns = horde.cover_spawns

	for i = 1, n_cover_spawners, 1 do
		local spawner = temp_hidden_spawners[i]
		local breed_name = self.pop_random_any_breed(self)
		cover_spawns[#cover_spawns + 1] = {
			num_to_spawn = 1,
			next_spawn_time = spawn_time,
			cover_point_unit = spawner,
			spawn_list = {
				breed_name
			}
		}
		spawn_counter = spawn_counter + 1
		spawn_time = spawn_time + 0.1
	end

	while spawn_counter < num_to_spawn do
		for i = 1, n_horde_spawners, 1 do
			local spawn = horde_spawns[i]
			local breed_name = (spawn.hidden and self.pop_random_any_breed(self)) or self.pop_random_horde_breed_only(self)

			if not breed_name then
				break
			end

			local list = spawn.spawn_list
			spawn.num_to_spawn = spawn.num_to_spawn + 1
			list[#list + 1] = breed_name
			spawn_counter = spawn_counter + 1
		end

		for i = 1, n_cover_spawners, 1 do
			local breed_name = self.pop_random_any_breed(self)

			if not breed_name then
				break
			end

			local spawn = cover_spawns[i]
			local list = spawn.spawn_list
			list[#list + 1] = breed_name
			spawn.num_to_spawn = spawn.num_to_spawn + 1
			spawn_counter = spawn_counter + 1
		end

		if spawn_counter == last_spawn_counter then
			if spawn_counter == 0 then
				self.execute_fallback(self, "vector", fallback, "Vector horde spawn failed - no matching spawners found!")

				return 
			end

			break
		end

		last_spawn_counter = spawn_counter
	end

	local conflict_director = self.conflict_director

	if script_data.debug_player_intensity then
		conflict_director.pacing:annotate_graph("(V)Horde:" .. num_to_spawn, "lime")
	end

	local hordes = self.hordes
	local id = #hordes + 1
	hordes[id] = horde
	local is_running_multiple_horde, is_first_multiple_horde = conflict_director.is_running_multiple_horde(conflict_director)

	if not is_running_multiple_horde or is_first_multiple_horde then
		local stinger_name = sound_settings.stinger_sound_event or "enemy_horde_stinger"

		self.play_sound(self, stinger_name, horde.epicenter_pos:unbox())
	end

	self.last_paced_horde_type = "vector"
	self.num_paced_hordes = self.num_paced_hordes + 1

	return 
end
HordeSpawner.get_pos_ahead_or_behind_players_on_mainpath = function (self, check_ahead, dist)
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local player_unit = (check_ahead and main_path_info.ahead_unit) or main_path_info.behind_unit

	if player_unit then
		local player_info = conflict_director.main_path_player_info[player_unit]
		local dist = player_info.travel_dist + dist*((check_ahead and 1) or -1)

		if dist < 0 then
			return false
		end

		local path_pos, path_index = MainPathUtils.point_on_mainpath(nil, dist)

		if path_pos then
			local to_player_dir = POSITION_LOOKUP[player_unit] - path_pos

			return true, path_pos, to_player_dir
		end
	end

	return false
end
HordeSpawner.execute_vector_blob_horde = function (self, extra_data, fallback)
	local settings = CurrentHordeSettings.vector_blob
	local roll = math.random()
	local spawn_horde_ahead = roll <= settings.main_path_chance_spawning_ahead

	print("wants to spawn " .. ((spawn_horde_ahead and "ahead") or "behind"))

	local success, blob_pos, to_player_dir = self.get_pos_ahead_or_behind_players_on_mainpath(self, spawn_horde_ahead, settings.main_path_dist_from_players)

	if not success then
		print("\tcould not, tries to spawn" .. ((not spawn_horde_ahead and "ahead") or "behind"))

		success, blob_pos, to_player_dir = self.get_pos_ahead_or_behind_players_on_mainpath(self, not spawn_horde_ahead, settings.main_path_dist_from_players)
	end

	if not blob_pos then
		print("\no spawn position found at all, failing horde")

		return 
	end

	local composition_type = CurrentHordeSettings.vector_blob_composition or "medium"

	assert(composition_type, "Vector Blob Horde missing composition_type")

	local composition = CurrentHordeSettings.compositions[composition_type]
	local spawn_list, num_to_spawn = self.compose_blob_horde_spawn_list(self, composition_type)
	local group_template = {
		template = "horde",
		id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
		size = num_to_spawn,
		sneaky = spawn_horde_ahead,
		group_data = extra_data
	}
	local t = Managers.time:time("game")
	local sound_settings = composition.sound_settings
	local horde = {
		horde_type = "vector_blob",
		spawned = 0,
		num_to_spawn = num_to_spawn,
		epicenter_pos = Vector3Box(blob_pos),
		start_time = t + settings.start_delay,
		group_template = group_template,
		sound_settings = sound_settings
	}
	local num_columns = 6
	local group_size = 0
	local rot = Quaternion.look(Vector3(to_player_dir.x, to_player_dir.y, 1))
	local max_attempts = 8
	local conflict_director = self.conflict_director
	local nav_world = conflict_director.nav_world

	for i = 1, num_to_spawn, 1 do
		local spawn_pos = nil

		for j = 1, max_attempts, 1 do
			local offset = nil

			if j == 1 then
				offset = Vector3(-num_columns/2 + i%num_columns, -num_columns/2 + math.floor(i/num_columns), 0)
			else
				offset = Vector3(math.random()*4 - 2, math.random()*4 - 2, 0)
			end

			spawn_pos = LocomotionUtils.pos_on_mesh(nav_world, blob_pos + offset)

			if spawn_pos then
				local breed = Breeds[spawn_list[i]]

				conflict_director.spawn_queued_unit(conflict_director, breed, Vector3Box(spawn_pos), QuaternionBox(rot), "hidden_spawn", nil, "horde_hidden", nil, group_template)

				group_size = group_size + 1

				break
			end
		end
	end

	conflict_director.add_horde(conflict_director, group_size)

	horde.spawned = group_size

	print("managed to spawn " .. tostring(group_size) .. "/" .. tostring(num_to_spawn) .. " horde enemies")

	local is_running_multiple_horde, is_first_multiple_horde = conflict_director.is_running_multiple_horde(conflict_director)

	if not is_running_multiple_horde or is_first_multiple_horde then
		local stinger_name = sound_settings.stinger_sound_event or "enemy_horde_stinger"

		self.play_sound(self, stinger_name, blob_pos)
	end

	local hordes = self.hordes
	local id = #hordes + 1
	hordes[id] = horde
	self.last_paced_horde_type = "vector_blob"
	self.num_paced_hordes = self.num_paced_hordes + 1

	return 
end
HordeSpawner.spawn_unit = function (self, hidden_spawn, breed_name, goal_pos, horde)
	local cover_point_unit = hidden_spawn.cover_point_unit
	local pos = Unit.local_position(cover_point_unit, 0)
	local dir = goal_pos - pos
	local spawn_rot = Quaternion.look(Vector3(dir.x, dir.y, 1))
	local spawn_type = "horde_hidden"
	local spawn_category = "hidden_spawn"
	local breed = Breeds[breed_name]
	local spawn_animation = nil

	self.conflict_director:spawn_queued_unit(breed, Vector3Box(pos), QuaternionBox(spawn_rot), spawn_category, spawn_animation, spawn_type, nil, horde.group_template)
	self.conflict_director:add_horde(1)

	return 
end
HordeSpawner.play_sound = function (self, stinger_name, pos)
	local wwise_world = Managers.world:wwise_world(self.world)
	local wwise_playing_id, wwise_source_id = WwiseWorld.trigger_event(wwise_world, stinger_name, pos)

	Managers.state.network.network_transmit:send_rpc_clients("rpc_server_audio_event_at_pos", NetworkLookup.sound_events[stinger_name], pos)

	return 
end
HordeSpawner.create_event_horde_no_horde_spawners = function (self, horde, variant, t)
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local behind_unit = main_path_info.behind_unit

	if behind_unit then
		local count = 0
		local player_info = conflict_director.main_path_player_info[behind_unit]
		local behind_dist = player_info.travel_dist - 45
		local path_pos, path_index = MainPathUtils.point_on_mainpath(nil, behind_dist)
		local spawn_pos = nil
		local num_found, hidden_cover_units = ConflictUtils.hidden_cover_points(path_pos, player_positions, 0, 10)

		if 0 < num_found then
			local cover_point_unit = hidden_cover_units[math.random(1, num_found)]
			local spawn_list = {}
			horde.cover_spawns = {
				num_to_spawn = 0,
				next_spawn_time = t,
				cover_point_unit = cover_point_unit,
				spawn_list = spawn_list
			}
			local breed_list = variant.breeds

			for i = 1, #breed_list, 2 do
				local breed_name = breed_list[i]
				local amount = breed_list[i + 1]
				local num_to_spawn = (type(amount) == "table" and Math.random(amount[1], amount[2])) or amount

				for j = 1, num_to_spawn, 1 do
					spawn_list[#spawn_list + 1] = breed_name
				end

				count = count + num_to_spawn
			end

			horde.num_to_spawn = count
			horde.spawned = 0

			return true, count
		end
	end

	return false
end
HordeSpawner.update_event_horde_no_horde_spawners = function (self, horde, t)
	if not horde.started then
		if horde.start_time < t then
			local success, amount = self.create_event_horde_no_horde_spawners(self, horde, horde.variant, t)

			if success then
				horde.started = true
				horde.amount = amount
			else
				horde.failed = true

				print("event horde failed")

				return true
			end
		end
	else
		return self.update_horde(self, horde, t)
	end

	return false
end
HordeSpawner.update_event_horde = function (self, horde, t)
	if not horde.started then
		if horde.start_time < t then
			local success, amount = self.spawner_system:spawn_horde_from_terror_event_id(horde.terror_event_id, horde.variant, horde.limit_spawners, horde.group_template, horde.strictly, horde.composition_type)

			if success then
				horde.started = true
				horde.amount = amount
			else
				horde.failed = true

				print("event horde failed")

				return true
			end
		end
	elseif horde.end_time < t then
		print("event horde ends!")

		return true
	end

	return false
end
HordeSpawner.spawner_in_view_of_players = function (self, spawner)
	local spawner_pos = Unit.local_position(spawner.cover_point_unit, 0) + Vector3(0, 0, 1)

	for i = 1, #player_and_bot_positions, 1 do
		local player_pos = player_and_bot_positions[i] + Vector3(0, 0, 1)
		local to_player = player_pos - spawner_pos
		local distance = Vector3.length(to_player)

		if distance < 3 then
			QuickDrawerStay:sphere(spawner_pos, 3)

			return player_pos
		end

		if distance < 20 then
			local direction = Vector3.normalize(to_player)
			local hit, hit_pos, _, _, actor = PhysicsWorld.immediate_raycast(self.physics_world, spawner_pos, direction, distance, "collision_filter", "filter_ai_line_of_sight_check")

			if script_data.debug_terror then
				QuickDrawerStay:line(spawner_pos, player_pos, (hit and Color(255, 255, 255)) or Color(255, 0, 0))
			end

			if not hit then
				return player_pos
			end
		end
	end

	return 
end
HordeSpawner.update_horde = function (self, horde, t)
	if not horde.started then
		if horde.start_time < t then
			local horde_spawns = horde.horde_spawns

			if horde_spawns then
				local breeds = CurrentHordeSettings.breeds

				for i = 1, #horde_spawns, 1 do
					local horde_spawn = horde_spawns[i]
					local spawn_rate = self.spawner_system:spawn_horde(horde_spawn.spawner, horde_spawn.num_to_spawn, breeds, horde_spawn.spawn_list, horde.group_template)
					horde_spawn.all_done_spawned_time = t + spawn_rate/1*horde_spawn.num_to_spawn
				end
			end

			horde.started = true
		else
			if script_data.debug_terror then
				Debug.text("Horde in: %.2f", horde.start_time - t)
			end

			return 
		end
	end

	local horde_spawns = horde.horde_spawns

	if horde_spawns then
		for j = 1, #horde_spawns, 1 do
			local horde_spawn = horde_spawns[j]

			if not horde_spawn.done and horde_spawn.all_done_spawned_time < t then
				horde_spawn.done = true
				horde.spawned = horde.spawned + horde_spawn.num_to_spawn
			end
		end
	end

	local cover_spawns = horde.cover_spawns

	if cover_spawns then
		for j = 1, #cover_spawns, 1 do
			local hidden_spawn = cover_spawns[j]

			if 0 < hidden_spawn.num_to_spawn and hidden_spawn.next_spawn_time < t then
				local seen_from_this_pos = self.spawner_in_view_of_players(self, hidden_spawn)

				if seen_from_this_pos and self.replace_hidden_spawners(self, cover_spawns, hidden_spawn, seen_from_this_pos) then
					break
				end

				local breed_name = pop_array(hidden_spawn.spawn_list)

				self.spawn_unit(self, hidden_spawn, breed_name, horde.main_target_pos:unbox(), horde)

				horde.spawned = horde.spawned + 1
				hidden_spawn.num_to_spawn = hidden_spawn.num_to_spawn - 1
				hidden_spawn.next_spawn_time = hidden_spawn.next_spawn_time + 1
			end
		end
	end

	if script_data.debug_terror then
		Debug.text("HORDE spawned: %d", horde.spawned)
	end

	if horde.num_to_spawn <= horde.spawned then
		return true
	end

	return 
end
HordeSpawner.update = function (self, t, dt)
	local hordes = self.hordes
	local num_hordes = #hordes
	self._running_horde_type = nil
	self._running_horde_sound_settings = nil
	local i = 1

	while i <= num_hordes do
		local horde = hordes[i]
		local done = nil

		if horde.horde_type == "vector_blob" then
			self._running_horde_type = horde.horde_type
			self._running_horde_sound_settings = horde.sound_settings
			done = true
		elseif horde.horde_type == "vector" or horde.horde_type == "ambush" then
			self._running_horde_type = horde.horde_type
			self._running_horde_sound_settings = horde.sound_settings
			done = self.update_horde(self, horde, t)
		elseif horde.horde_type == "event" then
			done = self.update_event_horde(self, horde, t)

			if not horde.silent then
				self._running_horde_type = "event"
				self._running_horde_sound_settings = horde.sound_settings
			end
		else
			done = self.update_event_horde_no_horde_spawners(self, horde, t)

			if not horde.silent then
				self._running_horde_type = "event"
				self._running_horde_sound_settings = horde.sound_settings
			end
		end

		if done then
			hordes[i] = hordes[num_hordes]
			hordes[num_hordes] = nil
			num_hordes = num_hordes - 1
		else
			i = i + 1
		end
	end

	if script_data.debug_hordes then
		self.debug_hordes(self, t)
	end

	return 
end
HordeSpawner.debug_hordes = function (self, t)
	local s = "Hordes - now: " .. self.conflict_director:horde_size() .. " (" .. tostring(self._running_horde_type or "none") .. ") "
	local hordes = self.hordes

	for i = 1, #hordes, 1 do
		local horde = hordes[i]
		local horde_type = horde.horde_type
		local silent = horde.silent
		s = s .. "| " .. horde_type .. ((horde.silent and "(silent), ") or "") .. " |"
	end

	Debug.text(s)

	return 
end
local found_units = {}
HordeSpawner.hidden_cover_points = function (self, broadphase, epicenter_pos, player_pos_list, found_cover_points, min_rad, max_rad, main_target_pos)
	local distance_squared = Vector3.distance_squared
	local vector3_normalize = Vector3.normalize
	local vector3_dot = Vector3.dot
	local quaternion_forward = Quaternion.forward
	local unit_local_position = Unit.local_position
	local unit_local_rotation = Unit.local_rotation

	table.clear_array(found_units, #found_units)

	local num_source_pos = #player_pos_list
	local num_found_points = 0
	local num_cover_points = Broadphase.query(broadphase, epicenter_pos, max_rad, found_units)
	local min_long_dist_squared = main_target_pos and distance_squared(player_pos_list[1], main_target_pos)
	local green = Color(255, 0, 240, 0)
	local red = Color(255, 240, 0, 0)
	min_rad = min_rad*min_rad
	max_rad = max_rad*max_rad

	for i = 1, num_cover_points, 1 do
		local cover_unit = found_units[i]
		local pos = unit_local_position(cover_unit, 0)
		local long_dist_ok = true

		if main_target_pos then
			local long_dist_squared = distance_squared(pos, main_target_pos)

			if long_dist_squared < min_long_dist_squared then
				long_dist_ok = false
			end
		end

		if long_dist_ok then
			for j = 1, num_source_pos, 1 do
				local h_pos = player_pos_list[j]
				local dist_squared = distance_squared(pos, h_pos)

				if min_rad <= dist_squared and dist_squared <= max_rad then
					local rot = unit_local_rotation(cover_unit, 0)
					local to_cover_point = vector3_normalize(pos - epicenter_pos)
					local dot = (dist_squared < 625 and -0.9) or -0.6
					local valid = vector3_dot(quaternion_forward(rot), to_cover_point) < dot

					if valid then
						num_found_points = num_found_points + 1
						found_cover_points[num_found_points] = cover_unit

						if script_data.debug_hordes then
							QuickDrawerStay:sphere(pos, 1, green)
							QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot)*2 + Vector3(0, 0, 1), green)
						end
					elseif script_data.debug_hordes then
						QuickDrawerStay:sphere(pos, 1, red)
						QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot)*2 + Vector3(0, 0, 1), red)
					end
				end
			end
		end
	end

	return 
end
HordeSpawner.calc_sectors = function (self, center_pos, list, sectors)
	local unit_local_position = Unit.local_position
	local vector3_normalize = Vector3.normalize
	local math_atan2 = math.atan2
	local pi = math.pi

	for i = 1, #list, 1 do
		local unit = list[i]
		local pos = unit_local_position(unit, 0)
		local dir_to_center = vector3_normalize(pos - center_pos)
		local angle = math_atan2(dir_to_center.y, dir_to_center.x)
		local sector_index = math.max(1, math.ceil((angle + pi)/(pi*2)*num_sectors))
		local sector = sectors[sector_index]
		sector[#sector + 1] = unit
	end

	return 
end
HordeSpawner.render_sectors = function (self, sectors)
	local unit_local_position = Unit.local_position
	local sector_colors = {
		Color(255, 255, 0, 0),
		Color(255, 255, 128, 0),
		Color(255, 0, 255, 0),
		Color(255, 128, 255, 0),
		Color(255, 0, 0, 255),
		Color(255, 0, 128, 255),
		Color(255, 0, 255, 255),
		Color(255, 255, 0, 255)
	}

	for i = 1, num_sectors, 1 do
		local sector = sectors[i]
		local sector_color = sector_colors[i]

		print("Sector:", i, "size:", #sector)

		for j = 1, #sector, 1 do
			local unit = sector[j]
			local pos = unit_local_position(unit, 0)

			QuickDrawerStay:sphere(pos, 2, sector_color)
		end
	end

	return 
end
HordeSpawner.reset_sectors = function (self, sectors)
	for i = 1, num_sectors, 1 do
		local sector = sectors[i]

		for j = 1, #sector, 1 do
			sector[j] = nil
		end
	end

	return 
end

function test_sectors()
	local unit_local_position = Unit.local_position
	local vector3_normalize = Vector3.normalize
	local center_pos = unit_local_position(PLAYER_UNITS[1], 0)
	local sector_colors = {
		Color(255, 255, 0, 0),
		Color(255, 255, 128, 0),
		Color(255, 0, 255, 0),
		Color(255, 128, 255, 0),
		Color(255, 0, 0, 255),
		Color(255, 0, 128, 255),
		Color(255, 0, 255, 255),
		Color(255, 255, 0, 255)
	}
	local pi = math.pi

	for i = 1, 300, 1 do
		local p = Vector3(math.random(-30, 30), math.random(-30, 30), 1)

		print("xapa:", i, p, center_pos)

		local pos = center_pos + p
		local dir_to_center = vector3_normalize(pos - center_pos)
		local angle = math.atan2(dir_to_center.y, dir_to_center.x)
		local sector_index = math.max(1, math.ceil((angle + pi)/(pi*2)*num_sectors))

		if sector_index <= num_sectors then
			QuickDrawerStay:sphere(pos, 1.2, sector_colors[sector_index])
		else
			print("BAd sector index: ", sector_index)
		end
	end

	return 
end

HordeSpawner.filter_dist = function (self, center_pos, list, min_rad_squared, max_rad_squared)
	local distance_squared = Vector3.distance_squared
	local size = #list
	local i = 1

	while i <= size do
		local pos = list[i]
		local dist_squared = distance_squared(center_pos, pos)

		if min_rad_squared <= dist_squared and dist_squared <= max_rad_squared then
			i = i + 1
		else
			list[i] = list[size]
			size = size - 1
		end
	end

	return 
end
HordeSpawner.filter_angle = function (self, center_pos, pos_list, dot_angle)
	dot_angle = dot_angle or -0.9
	local vector3_normalize = Vector3.normalize
	local vector3_dot = Vector3.dot
	local quaternion_forward = Quaternion.forward
	local size = #pos_list
	local i = 1

	while i <= size do
		local cover_unit = pos_list[i]
		local rot = Unit.local_rotation(cover_unit, 0)
		local to_cover_point = vector3_normalize(pos - center_pos)

		if vector3_dot(quaternion_forward(rot), to_cover_point) < dot_angle then
			i = i + 1
		else
			pos_list[i] = pos_list[size]
			size = size - 1
		end
	end

	return 
end
HordeSpawner.get_point_on_main_path = function (self, pos, distance, confirm_with_far_astar)

	-- decompilation error in this vicinity
	local level_analysis = self.conflict_director.level_analysis
	local main_paths = level_analysis.get_main_paths(level_analysis)
	local path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, pos)
	local behind_pos = MainPathUtils.point_on_mainpath(main_paths, travel_dist + distance)

	return behind_pos
end

return 
