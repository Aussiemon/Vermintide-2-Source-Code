-- chunkname: @scripts/managers/conflict_director/spawn_zone_baker.lua

require("scripts/managers/conflict_director/main_path_spawning_generator")

SpawnZoneBaker = class(SpawnZoneBaker)

local InterestPointUnits = InterestPointUnits
local DOOR_SEARCH_RADIUS = 1.5

SpawnZoneBaker.init = function (self, world, nav_world, level_analyzer, level_seed)
	self.world = world
	self.nav_world = nav_world
	self.level_analyzer = level_analyzer
	self.spawn_zones_available = false

	self:set_seed(level_seed)

	if not InterestPointUnitsLookup then
		ConflictUtils.generate_spawn_point_lookup(world)
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_path = level_settings.level_name

	if level_path then
		local num_nested_levels = LevelResource.nested_level_count(level_path)

		if num_nested_levels > 0 then
			level_path = LevelResource.nested_level_resource_name(level_path, 0)
		end

		local patrol_waypoints_path = level_path .. "_patrol_waypoints"

		if Application.can_get("lua", patrol_waypoints_path) then
			local waypoints_data = require(patrol_waypoints_path)
			local patrol_waypoints = waypoints_data.patrol_waypoints
			local boss_waypoints = table.clone(waypoints_data.boss_waypoints)
			local event_waypoints = waypoints_data.event_waypoints

			self.level_analyzer:store_patrol_waypoints(boss_waypoints, patrol_waypoints, event_waypoints)
		end

		local spawn_data = level_analyzer.spawn_zone_data

		if spawn_data then
			self.zone_convert = {}
			self.zones = spawn_data.zones
			self.spawn_pos_lookup = spawn_data.position_lookup
			self.num_main_zones = spawn_data.num_main_zones
			self.total_main_path_length_unmodified = spawn_data.total_main_path_length

			local main_paths = spawn_data.main_paths

			self.main_paths = main_paths

			local path_markers = spawn_data.path_markers

			self.path_markers = path_markers

			local crossroads = spawn_data.crossroads
			local mainpath_was_changed, altered_amount_num_main_zones = level_analyzer:remove_crossroads_extra_path_branches(main_paths, crossroads, self.total_main_path_length_unmodified, self.zones, self.num_main_zones, path_markers)

			if mainpath_was_changed then
				self.num_main_zones = altered_amount_num_main_zones
			end

			local door_system = Managers.state.entity:system("door_system")
			local door_broadphase_query_result = {}
			local total_main_path_length = 0

			for i = 1, #main_paths do
				local path = main_paths[i]
				local nodes = path.nodes

				for j = 1, #nodes do
					local p = nodes[j]
					local node_position = Vector3(p[1], p[2], p[3])
					local num_doors = door_system:get_doors(node_position, DOOR_SEARCH_RADIUS, door_broadphase_query_result)

					if num_doors > 0 then
						local door_unit = door_broadphase_query_result[1]
						local result_position = MainPathUtils.resolve_node_in_door(nav_world, node_position, door_unit)

						if result_position then
							node_position = result_position
						else
							print("MainPathUtils.resolve_node_in_door: Error - was unable to resolve node in door at position", node_position)
						end
					end

					nodes[j] = Vector3Box(node_position)
				end

				total_main_path_length = total_main_path_length + path.path_length
			end

			MainPathSpawningGenerator.inject_travel_dists(main_paths, mainpath_was_changed)
			level_analyzer:store_path_markers(path_markers)

			self.total_main_path_length = total_main_path_length

			level_analyzer:store_main_paths(main_paths)
			level_analyzer:brute_force_calc_zone_distances(self.zones, self.num_main_zones, self.spawn_pos_lookup)

			if mainpath_was_changed then
				Managers.state.game_mode:recalc_respawner_dist_due_to_crossroads()
			end

			self:create_cover_points(spawn_data.cover_points, level_analyzer.cover_points_broadphase)

			self.spawn_zones_available = true
		end
	end
end

SpawnZoneBaker._random = function (self, ...)
	local seed, value = Math.next_random(self.seed, ...)

	self.seed = seed

	return value
end

SpawnZoneBaker._random_dice_roll = function (self, prob, alias)
	local seed, value = LoadedDice.roll_seeded(prob, alias, self.seed)

	self.seed = seed

	return value
end

SpawnZoneBaker.set_seed = function (self, seed)
	fassert(seed and type(seed) == "number", "Bad seed input!")

	self.seed = seed
	self._initial_seed = seed
end

SpawnZoneBaker._random_interval = function (self, numbers)
	if type(numbers) == "table" then
		return self:_random(numbers[1], numbers[2])
	else
		return numbers
	end
end

local random_indices = {}
local all = {}

SpawnZoneBaker._get_random_array_indices = function (self, size, num_picks)
	fassert(num_picks <= size, "Can't pick more elements than the size of the")
	fassert(size < 128, "Don't use this for large arrays, since it will be inefficient. It creates large tables then.")

	for i = 1, size do
		all[i] = i
	end

	for i = 1, num_picks do
		local random_index = self:_random(1, size)

		random_indices[i] = all[random_index]
		all[random_index] = all[size]
		size = size - 1
	end

	return random_indices
end

SpawnZoneBaker.loaded_spawn_zones_available = function (self)
	return self.spawn_zones_available
end

SpawnZoneBaker.create_cover_points = function (self, cover_points, broad_phase)
	if not cover_points then
		print("No cover points found")

		return
	end

	local numbers = #cover_points
	local up = Vector3.up()

	for i = 1, numbers, 5 do
		local a, b, c = Script.temp_count()
		local x = cover_points[i]
		local y = cover_points[i + 1]
		local z = cover_points[i + 2]
		local pos = Vector3(x, y, z)
		local nx = cover_points[i + 3]
		local ny = cover_points[i + 4]
		local rot = Quaternion.look(Vector3(nx, ny, 0), up)
		local unit = World.spawn_unit(self.world, "units/hub_elements/empty", pos, rot)

		Broadphase.add(broad_phase, unit, pos, 1)
		Script.set_temp_count(a, b, c)
	end
end

SpawnZoneBaker.periodical = function (self, hi, dist_data)
	local len, density

	if hi then
		len = self:_random(dist_data.min_low_dist, dist_data.max_low_dist)
		density = dist_data.min_low_density + self:_random() * (dist_data.max_low_density - dist_data.min_low_density)
		hi = false
	else
		len = self:_random(dist_data.min_hi_dist, dist_data.max_hi_dist)
		density = dist_data.min_hi_density + self:_random() * (dist_data.max_hi_density - dist_data.min_hi_density)
		hi = true
	end

	return len, density, hi
end

local function array_copy(source, dest, size)
	for i = 1, size do
		dest[i] = source[i]
	end
end

local function array_remove_element(array, index, size)
	local element = array[index]

	array[index] = array[size]
	array[size] = nil

	return element
end

local work_list = {}
local lookup = {}

SpawnZoneBaker.generate_spawns = function (self, spawn_cycle_length, goal_density, area_density_coefficient, length_density_coefficient, conflict_director_name, mutator_list)
	if not InterestPointUnitsLookup then
		ConflictUtils.generate_spawn_point_lookup(self.world)
	end

	if not self.spawn_zones_available then
		print("No spawn zones where found, can't generate spawns")
	end

	self._all_hi_data = {}
	self._count_up = 0

	local difficulty, difficulty_tweak = Managers.state.difficulty:get_difficulty()

	self.composition_difficulty = DifficultyTweak.converters.composition(difficulty, difficulty_tweak)

	local zones = self.zones
	local num_main_zones = self.num_main_zones
	local zone_convert = self.zone_convert

	conflict_director_name = conflict_director_name or "default"

	local conflict_director = ConflictDirectors[conflict_director_name]
	local seed = self._initial_seed
	local great_cycles = MainPathSpawningGenerator.generate_great_cycles(conflict_director, mutator_list, zones, zone_convert, num_main_zones, spawn_cycle_length, seed)
	local spawns, pack_sizes, pack_rotations, pack_members, zone_data_list = {}, {}, {}, {}, {}
	local distribution = PackSpawningDistribution.standard.distribution_method
	local dist_data = PackDistributions[distribution]
	local num_great_cycles = #great_cycles

	for i = 1, num_great_cycles do
		local cycle = great_cycles[i]
		local cycle_zones = cycle.zones
		local num_cycle_zones = #cycle_zones
		local sum_density, num_hi = 0, 0
		local zone

		if distribution == "random" then
			for j = 1, num_cycle_zones do
				zone = cycle_zones[j]

				local density = self:_random()

				zone.density = density
				sum_density = sum_density + density
			end
		elseif distribution == "periodical" then
			local len, density, period_end
			local hi = self:_random() > 0.5

			len, density, hi = self:periodical(hi, dist_data)
			zone = cycle_zones[1]
			zone.period_length = len
			zone.hi = hi

			local hi_data = self:create_hi_data(zone, zone.pack_type)

			period_end = len
			num_hi = hi and 1 or 0

			local period_counter, second_part

			for j = 1, num_cycle_zones do
				zone = cycle_zones[j]
				zone.hi_data = hi_data

				if period_end < j then
					len, density, hi = self:periodical(hi, dist_data)
					second_part = false
					period_end = j + len - 1

					if num_cycle_zones < period_end then
						len = num_cycle_zones - j
						period_end = num_cycle_zones
					end

					zone.period_length = len
					zone.hi_data = hi_data
					zone.hi = hi
					hi_data = self:create_hi_data(zone, zone.pack_type)
					num_hi = num_hi + (hi and 1 or 0)
				elseif dist_data.random_distribution then
					if hi then
						density = dist_data.min_hi_density + self:_random() * (dist_data.max_hi_density - dist_data.min_hi_density)
					else
						density = dist_data.min_low_density + self:_random() * (dist_data.max_low_density - dist_data.min_low_density)
					end
				elseif period_counter == dist_data.zero_clamp_max_dist and not hi then
					second_part = true
					density = dist_data.min_low_density + self:_random() * (dist_data.max_low_density - dist_data.min_low_density)
				end

				period_counter = zone.period_length and 1 or period_counter + 1

				if density < dist_data.zero_density_below and not second_part then
					density = 0
				end

				zone.density = density
				zone.hi = hi
				sum_density = sum_density + density
			end
		end

		local average_goal_density, pack_spawning_setting, goal_density = 0

		for j = 1, num_cycle_zones do
			local cycle_zone = cycle_zones[j]

			if pack_spawning_setting ~= cycle_zone.pack_spawning_setting then
				goal_density = cycle_zone.pack_spawning_setting.basics.goal_density
			end

			average_goal_density = average_goal_density + goal_density
		end

		if sum_density > 0 then
			local normalizer = average_goal_density / sum_density
			local remainder = 0

			print("-------------> JOW Perfect-density", average_goal_density, "Sum density", sum_density, "Normalized coefficient:", normalizer)

			for j = 1, num_cycle_zones do
				local cycle_zone = cycle_zones[j]

				cycle_zone.density = cycle_zone.density * normalizer

				if remainder > 0 then
					cycle_zone.density = cycle_zone.density + remainder
					remainder = 0
				end

				if cycle_zone.density > 1 then
					remainder = remainder + cycle_zone.density - 1
					cycle_zone.density = 1
				end
			end

			if distribution == "periodical" then
				self:inject_special_packs(num_hi, cycle_zones)
			end

			local kept = 1

			for j = 1, num_cycle_zones do
				local center_zone = cycle_zones[j]
				local center_density = center_zone.density
				local outer = center_zone.outer
				local density = center_density

				for k = 1, #outer do
					local cycle_zone = outer[k]

					density = math.clamp(density * kept + (1 - kept) * (2 * self:_random() - 1), 0, 1)
					cycle_zone.density = density
					cycle_zone.hi_data = center_zone.hi_data
					cycle_zone.hi = center_zone.hi
				end
			end

			self:populate_spawns_by_rats(pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, cycle_zones, pack_spawning_setting, length_density_coefficient, nil, true, nil)

			for j = 1, num_cycle_zones do
				local center_zone = cycle_zones[j]
				local outer_zones = center_zone.outer
				local pack_spawning_setting = center_zone.pack_spawning_setting
				local num_zones_to_clamp = pack_spawning_setting.basics.clamp_outer_zones_used

				if num_zones_to_clamp then
					local num_zones = #outer_zones
					local num_to_remove = num_zones - num_zones_to_clamp

					if num_to_remove > 0 then
						array_copy(outer_zones, work_list, num_zones)

						local work_list_size = #outer_zones

						for k = 1, num_to_remove do
							array_remove_element(work_list, self:_random(1, work_list_size), work_list_size)

							work_list_size = work_list_size - 1
						end

						outer_zones = work_list
					end
				end

				self:populate_spawns_by_rats(pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, outer_zones, area_density_coefficient, 0, center_zone.pack_type, nil, center_zone)
			end
		else
			print(sprintf("Spawn density in great_cycle %d is 0, num cycle zones: %d ", i, num_cycle_zones))
		end
	end

	local island_zones = {}

	for i = num_main_zones + 1, #zones do
		local zone = zones[i]
		local parent_zone_index = zone.parent_zone_id

		if not parent_zone_index then
			print("Missing parent zone id for island-zone", i)
			table.dump(zone, "ISLAND ZONE", 2)
		end

		local parent_zone = parent_zone_index and self.level_analyzer:get_zone_from_unique_id(zone_convert, parent_zone_index)

		if parent_zone then
			local conflict_setting = parent_zone.conflict_setting
			local pack_spawning_setting = parent_zone.pack_spawning_setting
			local pack_type = parent_zone.pack_type
			local area_density_coefficient = pack_spawning_setting.area_density_coefficient
			local ok_to_spawn = not zone.on_roof or BreedPacks[pack_type].roof_spawning_allowed

			if ok_to_spawn then
				local sub_zones = zone.sub
				local sub_areas = zone.sub_areas

				for j = 1, #sub_zones do
					local nodes = sub_zones[j]
					local area = sub_areas[j]
					local density = self:_random()
					local num_wanted_rats = math.floor(area * density * area_density_coefficient)
					local island_zone = {
						total_area = 0,
						nodes = nodes,
						area = area,
						outer = {},
						pack_type = pack_type,
						pack_spawning_setting = pack_spawning_setting,
						conflict_setting = conflict_setting,
						unique_zone_id = zone.unique_zone_id,
					}

					island_zone.period_length = 1
					island_zone.hi = false
					island_zone.island = true
					island_zone.density = density
					island_zone.parent_zone = parent_zone

					self:create_hi_data(island_zone, pack_type)

					island_zones[#island_zones + 1] = island_zone
					island_zone.unique_zone_id = #island_zones

					local child_islands = parent_zone.islands

					if not child_islands then
						child_islands = {}
						parent_zone.islands = child_islands
					end

					child_islands[#child_islands + 1] = island_zone.unique_zone_id

					if num_wanted_rats > 0 then
						self:spawn_amount_rats(spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, nodes, num_wanted_rats, pack_type, area, island_zone)
					end
				end
			end
		end
	end

	fassert(#spawns == #pack_sizes, "Mismatching sizes!")

	self.great_cycles = great_cycles
	self.island_zones = island_zones

	table.clear(lookup)

	return spawns, pack_sizes, pack_rotations, pack_members, zone_data_list
end

SpawnZoneBaker.inject_special_packs = function (self, total_peaks, cycle_zones)
	local roaming_set = cycle_zones[1].pack_spawning_setting.roaming_set
	local c = roaming_set.breed_packs_peeks_overide_chance

	if not c then
		return
	end

	local percent_overridden = self:_random() * (c[2] - c[1]) + c[1]
	local picked_peaks = math.floor(total_peaks * percent_overridden)

	if picked_peaks <= 0 or total_peaks <= 0 then
		return
	end

	local random_peaks = self:_get_random_array_indices(total_peaks, picked_peaks)
	local lookup = {}

	for i = 1, picked_peaks do
		lookup[random_peaks[i]] = true
	end

	local num_cycle_zones = #cycle_zones
	local zone_index = 1
	local peak_index = 1

	while zone_index < num_cycle_zones do
		local zone = cycle_zones[zone_index]
		local period_length = zone.period_length

		if period_length and zone.hi then
			if lookup[peak_index] then
				local pack_spawning_setting = zone.pack_spawning_setting
				local roaming_set = pack_spawning_setting.roaming_set
				local breed_packs_override = roaming_set.breed_packs_override

				if breed_packs_override then
					local loaded_dice = roaming_set.breed_packs_override_loaded_dice
					local prob, alias = loaded_dice[1], loaded_dice[2]
					local pack_type_index = self:_random_dice_roll(prob, alias)
					local pack_type = breed_packs_override[pack_type_index][1]
					local pack_density = breed_packs_override[pack_type_index][3]
					local hi_data = self:create_hi_data(zone, pack_type)

					for k = zone_index, zone_index + period_length - 1 do
						zone = cycle_zones[k]
						zone.pack_type = pack_type
						zone.density_coefficient = pack_density
						zone.hi_data = hi_data
					end
				end

				zone_index = zone_index + period_length - 1
			end

			peak_index = peak_index + 1
		end

		zone_index = zone_index + 1
	end
end

SpawnZoneBaker.create_hi_data = function (self, zone, pack_type_name)
	local hi_data
	local breed_packs = BreedPacks[pack_type_name]
	local zone_checks = breed_packs.zone_checks

	if zone_checks then
		self._count_up = self._count_up + 1
		hi_data = {
			id = self._count_up,
		}
		zone.hi_data = hi_data

		local clamp_breeds = zone.hi and zone_checks.clamp_breeds_hi or zone_checks.clamp_breeds_low

		if clamp_breeds then
			local difficulty_overrides = clamp_breeds[self.composition_difficulty]

			if difficulty_overrides then
				local breed_count = {}

				for i = 1, #difficulty_overrides do
					local c = difficulty_overrides[i]
					local max_amount = self:_random_interval(c[1])
					local check_breed_name = c[2]
					local switch_breed = c[3]

					breed_count[check_breed_name] = {
						count = 0,
						switch_count = 0,
						max_amount = max_amount,
						switch_breed = switch_breed,
						hi = zone.hi,
					}
				end

				hi_data.breed_count = breed_count
			end
		end

		self._all_hi_data[#self._all_hi_data + 1] = hi_data
	end

	return hi_data
end

SpawnZoneBaker.populate_spawns_by_rats = function (self, global_pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, zone_list, global_area_density_coefficient, global_length_density_coefficient, pack_type_override, is_main_zone, parent_zone)
	local num_zones = #zone_list
	local area_bucket = 0
	local dist_bucket = 0
	local zone_length = 10

	for j = 1, num_zones do
		local zone = zone_list[j]
		local pack_spawning_setting = zone.pack_spawning_setting or global_pack_spawning_setting
		local basics = pack_spawning_setting.basics
		local area_density_coefficient = is_main_zone and zone.density_coefficient or pack_spawning_setting.area_density_coefficient or global_area_density_coefficient
		local length_density_coefficient = is_main_zone and basics.length_density_coefficient or global_length_density_coefficient
		local clamp_area = is_main_zone and basics.clamp_main_path_zone_area
		local nodes = zone.nodes

		if nodes then
			local area = is_main_zone and clamp_area > zone.area and clamp_area or zone.area
			local num_area_spawns_f = area * zone.density * area_density_coefficient + area_bucket
			local num_area_spawns = math.floor(num_area_spawns_f)

			area_bucket = num_area_spawns_f - num_area_spawns

			local num_dist_spawns_f = zone_length * zone.density * length_density_coefficient + dist_bucket
			local num_dist_spawns = math.floor(num_dist_spawns_f)

			dist_bucket = num_dist_spawns_f - num_dist_spawns

			local num_wanted_rats = num_area_spawns + num_dist_spawns

			if num_wanted_rats > 0 then
				local a, b, c = Script.temp_count()
				local num_spawns = self:spawn_amount_rats(spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, nodes, num_wanted_rats, pack_type_override or zone.pack_type, area, parent_zone or zone)

				zone.wanted_spawns = num_spawns

				Script.set_temp_count(a, b, c)
			end
		else
			print("Warning: missing nodes! in zones")
		end
	end
end

SpawnZoneBaker._generate_pack_members = function (self, pack_type, pack_size, zone, ip_unit_name, center_position)
	local pack_type_by_size = BreedPacksBySize[pack_type]
	local pack_by_size = pack_type_by_size[pack_size]
	local prob, alias = pack_by_size.prob, pack_by_size.alias
	local pack_index = self:_random_dice_roll(prob, alias)
	local pack = pack_by_size.packs[pack_index]
	local pack_members = table.clone(pack.members)

	pack_members.type = pack_type

	local hi_data = zone and zone.hi_data

	if hi_data and hi_data.breed_count then
		local breed_count = hi_data.breed_count

		for i = 1, pack_size do
			local breed = pack_members[i]
			local data = breed_count[breed.name]

			if data then
				data.count = data.count + 1

				if data.count > data.max_amount then
					pack_members[i] = data.switch_breed
					data.switch_count = data.switch_count + 1
				end
			end
		end
	end

	return pack_members
end

local max_pack_size = #InterestPointUnits

SpawnZoneBaker.spawn_amount_rats = function (self, spawns, pack_sizes, pack_rotations, pack_members, zone_data_list, nodes, num_wanted_rats, pack_type, area, zone)
	local vector3_normalize = Vector3.normalize
	local InterestPointUnits = InterestPointUnits
	local InterestPointPickListIndexLookup = InterestPointPickListIndexLookup
	local nav_world = self.nav_world
	local spawn_pos_lookup = self.spawn_pos_lookup
	local amount = #spawns
	local tries = 0
	local num_nodes = #nodes
	local num_packs = 0

	while num_wanted_rats > 0 do
		num_packs = num_packs + 1

		local max_num_rats = math.min(num_wanted_rats, max_pack_size)
		local index_max = InterestPointPickListIndexLookup[max_num_rats]
		local pack_size = InterestPointPickList[self:_random(index_max)]
		local variants = InterestPointUnits[pack_size]
		local num_variants = #variants
		local ip_unit_index = num_variants == 1 and 1 or self:_random(num_variants)
		local ip_unit_name = variants[ip_unit_index]

		for i = 1, 10 do
			local a, b, c = Script.temp_count()
			local node_index = self:_random(num_nodes)
			local tri_index = nodes[node_index]

			if not lookup[tri_index] then
				local p = spawn_pos_lookup[nodes[node_index]]
				local pos = Vector3(p[1], p[2], p[3])
				local angle = self:_random() * 2 * math.pi
				local rot = Quaternion(Vector3.up(), angle)
				local outside_navmesh_pos = ConflictUtils.interest_point_outside_nav_mesh(nav_world, ip_unit_name, pos, rot)
				local move_tries = 0

				while outside_navmesh_pos and move_tries < 3 do
					move_tries = move_tries + 1

					local move_vec = vector3_normalize(pos - outside_navmesh_pos)

					pos = pos + move_vec
					outside_navmesh_pos = ConflictUtils.interest_point_outside_nav_mesh(nav_world, ip_unit_name, pos, rot)
				end

				if not outside_navmesh_pos then
					fassert(ip_unit_name, "what the - no spawn point unit name?")

					local members = self:_generate_pack_members(pack_type, pack_size, zone, ip_unit_name, pos)

					amount = amount + 1
					spawns[amount] = Vector3Box(pos)
					pack_sizes[amount] = ip_unit_name
					pack_rotations[amount] = angle
					pack_members[amount] = members
					zone_data_list[amount] = zone
					num_wanted_rats = num_wanted_rats - pack_size
					lookup[tri_index] = true

					break
				end
			end

			Script.set_temp_count(a, b, c)
		end

		tries = tries + 1

		if tries > 100 then
			print("cannot find place to spawn rats")

			break
		end
	end

	table.clear(lookup)

	return num_packs
end

SpawnZoneBaker.get_zone_segment_from_travel_dist = function (self, travel_dist)
	local zones = self.zones
	local num_zones = self.num_main_zones

	for i = 1, num_zones do
		local zone = zones[i]
		local zone_travel_dist = zone.travel_dist - 5

		if travel_dist < zone_travel_dist then
			local zone_index = i > 1 and i - 1 or i
			local closest_zone = zones[zone_index]
			local closest_zone_conv = self.zone_convert[zone_index]

			return zone_index, closest_zone, closest_zone_conv
		end
	end

	return num_zones, zones[num_zones], self.zone_convert[num_zones]
end

SpawnZoneBaker.draw_zones = function (self, nav_world, draw_only_one_zone_index)
	local show_spawn_density, show_zone_text = false, true

	if self.gui then
		World.destroy_gui(self.world, self.gui)

		self.gui = nil

		return
	else
		self.gui = World.create_world_gui(self.world, Matrix4x4.identity(), 1, 1)
	end

	local zone_convert = self.zone_convert
	local gui = self.gui
	local alpha = 64
	local zones = self.zones
	local spawn_pos_lookup = self.spawn_pos_lookup
	local heatmap_colors = {}

	if show_spawn_density then
		for i = 1, 16 do
			local c = heatmap_colors_lookup[i]

			heatmap_colors[i] = Color(200, c[1], c[2], c[3])
		end
	end

	local start = math.clamp(draw_only_one_zone_index or 1, 1, #zones)

	for i = start, #zones do
		local zone = zones[i]
		local sub_zones = zone.sub
		local colors, density

		if show_spawn_density then
			density = math.floor((zone_convert[i] and zone_convert[i].density or 1) * 16)
		else
			local f = 92 + 63 * (i % 3)
			local g = f / 2

			colors = {
				Color(alpha, 0, f, 0),
				Color(alpha, 0, 0, f),
				Color(alpha, f, 0, 0),
				Color(alpha, f, f, 0),
				Color(alpha, 0, f, f),
				Color(alpha, f, 0, f),
				Color(alpha, f, g, 0),
				Color(alpha, f, 0, g),
				Color(alpha, 0, g, f),
				Color(alpha, g, 0, f),
			}
		end

		if show_zone_text then
			local triangle_index = sub_zones[1][1]
			local p = spawn_pos_lookup[triangle_index]
			local text = string.format("%d %.1f <- %.1f", i, zone.travel_dist or 0, zone.old_travel_dist or 0)

			Debug.world_sticky_text(p, text, colors[1])
		end

		local h = Vector3(0, 0, 0.1)

		for j = 1, #sub_zones do
			local sub_zone = sub_zones[j]

			if sub_zone then
				for k = 1, #sub_zone do
					local triangle_index = sub_zone[k]
					local a, b, c = Script.temp_count()
					local p = spawn_pos_lookup[triangle_index]
					local triangle = GwNavTraversal.get_seed_triangle(nav_world, Vector3(p[1], p[2], p[3]), 0.5, 0.5)

					if triangle then
						local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)

						if show_spawn_density then
							Gui.triangle(gui, p1 + h, p2 + h, p3 + h, 2, heatmap_colors[density])
						else
							local col = colors[j] or Colors.get_indexed((i * 7 + j + 5) % 32 + 1)

							Gui.triangle(gui, p1 + h, p2 + h, p3 + h, 2, col)
						end
					end

					Script.set_temp_count(a, b, c)
				end
			end
		end

		if draw_only_one_zone_index then
			break
		end
	end
end

SpawnZoneBaker.show_debug = function (self, show)
	if show then
		if not self.graph then
			self:draw_pack_density_graph()
		end

		self.graph:set_active(true)
	elseif self.graph then
		self.graph:set_active(false)
	end

	return true
end

SpawnZoneBaker.execute_debug = function (self)
	QuickDrawerStay:reset()
	Managers.state.conflict:respawn_level(script_data.debug_pacing_seed)

	self.plain_zone_list = nil
	self._breed_pack_legend = nil
end

function print_zone_list(cycle_zones)
	for j = 1, #cycle_zones do
		local zone = cycle_zones[j]
		local area = math.clamp(zone.area * 0.5, 0, 100)

		if zone.hi_data then
			local hi_data_id = zone.hi_data.id

			print(string.format("Zone: %d, hi: %s, hi-id: %d, Density: %.1f, Area: %.1f", j, tostring(zone.hi), hi_data_id, zone.density, area), "con:", zone.conflict_setting.name, "period_len:", zone.period_length or "--", "data:", zone.hi_data and "Y" or "N", string.format("Director / Packtype: %s / %s ", zone.conflict_setting.name, zone.pack_type))

			local outer_zones = zone.outer

			for k = 1, #outer_zones do
				local outer_zone = outer_zones[k]

				if outer_zone.hi_data then
					if hi_data_id ~= outer_zone.hi_data.id then
						print(string.format("BAD OUTER=%d hi-id: %d != %d", k, hi_data_id, outer_zone.hi_data.id))
					else
						print(string.format("outer=%d hi=%s hi-id: %d ", k, tostring(outer_zone.hi), hi_data_id))
					end
				else
					print(string.format("outer=%d hi=-- hi-id: -- NO CLAMPING IN PACK_TYPE %s", k, tostring(outer_zone.pack_type)))
				end
			end
		else
			print(string.format("Zone: %d, hi: %s, hi-id: --, Density: %.1f, Area: %.1f", j, tostring(zone.hi), zone.density, area), "con:", zone.conflict_setting.name, "period_len:", zone.period_length or "--", "data:", zone.hi_data and "Y" or "N", string.format("Director / Packtype: %s / %s ", zone.conflict_setting.name, zone.pack_type))
		end
	end
end

SpawnZoneBaker.debug_print_hi_data = function (self)
	local old_hi_data
	local great_cycles = self.great_cycles

	for i = 1, #great_cycles do
		local great_cycle = great_cycles[i]

		print("Great Cycle", i, "-------------")

		local cycle_zones = great_cycle.zones

		for j = 1, #cycle_zones do
			local zone = cycle_zones[j]
			local hi_data = zone.hi_data

			if hi_data ~= old_hi_data then
				local period = zone.hi and "Hi" or "Low"
				local s = period .. "-data for zone:" .. tostring(j) .. " -> " .. j + zone.period_length - 1

				if hi_data then
					local breed_count = hi_data.breed_count

					if breed_count then
						table.dump(breed_count, s, 1)
					end
				end
			end

			old_hi_data = hi_data
		end
	end

	for i = 1, #self._all_hi_data do
		local hi_data = self._all_hi_data[i]
		local breed_count = hi_data.breed_count

		if breed_count then
			for check_breed_name, data in pairs(breed_count) do
				print("Hidata id:", hi_data.id, data.hi and "HI" or "LOW", "count:", data.count, "switched:", data.switch_count, "max:", data.max_amount, "breed:", check_breed_name, "switched to:", data.switch_breed.name)
			end
		else
			print("Hidata id:", hi_data.id, " (no breed_count)")
		end
	end
end

SpawnZoneBaker.draw_pack_density_graph = function (self)
	if not self.graph then
		self.graph = Managers.state.debug.graph_drawer:create_graph("spawn density", {
			"distance",
			"density",
		})
		self.graph.visual_frame.y_max = 100
		self.graph.scroll_lock.vertical = false
		self.graph.scroll_lock.left = false
	end

	local g = self.graph

	if not g.active then
		g:set_active(true)
	end

	local zones = self.zones
	local sub_zone_length = zones[1].sub_zone_length
	local dist = 0
	local great_cycles = self.great_cycles
	local num_great_cycles = #great_cycles

	if script_data.debug_zone_baker then
		self:debug_print_zones()
	end

	g:set_plot_color("density", "maroon", "crimson")

	if num_great_cycles > 0 then
		local current_conflict_setting
		local current_pack_type = great_cycles[1].zones[1].conflict_setting.pack_spawning.roaming_set.breed_packs

		for i = 1, num_great_cycles do
			local cycle = great_cycles[i]
			local cycle_zones = cycle.zones

			if i > 1 then
				self.graph:add_annotation({
					color = "green",
					live = true,
					text = "Cycle",
					y = 105,
					x = dist,
				})
			end

			for j = 1, #cycle_zones do
				local zone = cycle_zones[j]
				local density = zone.density

				if current_pack_type ~= zone.pack_type then
					self.graph:add_annotation({
						color = "lawn_green",
						live = true,
						text = "O",
						x = dist,
						y = density * 100,
					})
				elseif zone.hi then
					self.graph:add_annotation({
						color = "lawn_green",
						live = true,
						text = "H",
						x = dist,
						y = density * 100,
					})
				end

				if current_conflict_setting ~= zone.conflict_setting then
					current_conflict_setting = zone.conflict_setting
					current_pack_type = current_conflict_setting.pack_spawning.roaming_set.breed_packs

					self.graph:add_annotation({
						color = "orange",
						live = true,
						y = 110,
						x = dist,
						text = current_conflict_setting.name,
					})
				end

				g:add_point(dist, density * 100, "density")

				local p = self.spawn_pos_lookup[zone.nodes[1]]
				local pos = Vector3(p[1], p[2], p[3])
				local width = math.sqrt(zone.total_area) / 5
				local box_extents = Vector3(width, width, width)
				local pose = Matrix4x4.from_quaternion_position(Quaternion.look(Vector3.up()), pos)

				QuickDrawerStay:box(pose, box_extents, Color(255, 0, 200, 0))
				QuickDrawerStay:sphere(pos, 7 * density)

				dist = dist + sub_zone_length
			end
		end
	end

	local rares = self.level_analyzer.boss_event_list
	local y = 60

	for k = 1, #rares do
		local rare = rares[k]
		local path_dist = rare[3]
		local event_name = rare[2]
		local color = rare[4]

		self.graph:add_annotation({
			live = true,
			x = path_dist,
			y = y,
			text = event_name,
			color = color,
		})

		y = y + 7

		if y > 70 then
			y = 30
		end
	end

	local player_annotation = {
		color = "green",
		live = true,
		text = "PLAYER",
		x = 0,
		y = 50,
	}

	self.graph:add_annotation(player_annotation)

	self.player_annotation = player_annotation
end

SpawnZoneBaker.draw_player_in_density_graph = function (self, travel_dist)
	if self.graph then
		if not self.player_annotation then
			local player_annotation = {
				color = "green",
				live = true,
				text = "PLAYER",
				x = 0,
				y = 50,
			}

			self.graph:add_annotation(player_annotation)

			self.player_annotation = player_annotation
		end

		self.graph:move_annotation(self.player_annotation, travel_dist)
	end
end

SpawnZoneBaker.draw_func1 = function (self, zone, zone_list_index, row, left, row_y)
	local zone_type = zone.island and "ISLAND" or "MAIN"
	local row_text = string.format("%d %s: %d %s", row, zone_type, zone_list_index, zone.pack_spawning_setting.name or "?")

	Gui.text(self._gui, row_text, "materials/fonts/arial", 14, "materials/fonts/arial", Vector3(left + 200, row_y, 1000))
end

SpawnZoneBaker._draw_zone = function (self, zone, color)
	local up = Vector3(0, 0, 1.5)
	local nodes = zone.nodes

	for i = 1, #nodes do
		local node = nodes[i]
		local p = self.spawn_pos_lookup[node]
		local pos = Vector3(p[1], p[2], p[3])

		QuickDrawer:circle(pos + up, 0.5, up, color)
	end
end

local draw_zones = true

SpawnZoneBaker.draw_func2 = function (self, zone, zone_list_index, row, left, row_y, is_closest)
	local legend = self._breed_pack_legend
	local hi_data = zone.hi_data
	local s = legend[zone.pack_type] .. "(" .. hi_data.id .. ")"
	local outer = zone.outer

	for i = 1, #outer do
		s = s .. " " .. legend[zone.pack_type] .. "(" .. zone.hi_data.id .. ") "
	end

	local islands = zone.islands

	if islands then
		s = s .. " <--- "

		for i = 1, #islands do
			local island_id = islands[i]
			local island = self.island_zones[island_id]

			s = s .. " " .. legend[island.pack_type] .. "(" .. island.hi_data.id .. ") "
		end
	end

	local color = is_closest and Color(200, 200, 0) or zone.hi and Color(255, 255, 255) or Color(175, 175, 175)

	if draw_zones and is_closest then
		self:_draw_zone(zone, color)

		if zone.islands then
			for i = 1, #zone.islands do
				local island_zone = self.island_zones[islands[i]]

				if island_zone then
					self:_draw_zone(island_zone, Color(255, 0, 128))
				end
			end
		end

		local outer = zone.outer

		for i = 1, #outer do
			self:_draw_zone(outer[i], Color(55, 200 - (i - 1) * 24, (i - 1) * 24))
		end

		local spawned_units_by_breed = Managers.state.conflict:spawned_units_by_breed_table()

		s = s .. ConflictUtils.display_number_of_breeds_in_segment("BREEDS: ", spawned_units_by_breed, zone)
	end

	local zone_type = zone.island and "ISLAND" or "MAIN"
	local row_text = string.format("%s: %d %s", zone_type, zone_list_index, s)

	Gui.text(self._gui, row_text, "materials/fonts/arial", 14, "materials/fonts/arial", Vector3(left + 200, row_y, 1000), color)
end

SpawnZoneBaker._draw_legend = function (self, legend, x, y)
	Gui.text(self._gui, string.format("LEGEND OF PACK-TYPES"), "materials/fonts/arial", 14, "materials/fonts/arial", Vector3(x, y, 1000))

	y = y - 30

	for key, code in pairs(legend) do
		Gui.text(self._gui, string.format("%s = %s", key, code), "materials/fonts/arial", 14, "materials/fonts/arial", Vector3(x, y, 1000))

		y = y - 20
	end
end

SpawnZoneBaker.draw_zone_info_on_screen = function (self)
	if not self._gui then
		self._gui = World.create_screen_gui(self.world, "immediate")
	end

	if not self.plain_zone_list then
		local plain_zone_list = {}
		local great_cycles = self.great_cycles

		for ci = 1, #great_cycles do
			local cycle = great_cycles[ci]
			local zones = cycle.zones

			for z = 1, #zones do
				local zone = zones[z]

				plain_zone_list[#plain_zone_list + 1] = zone
			end
		end

		local island_zones = self.island_zones

		for ci = 1, #island_zones do
			local zone = island_zones[ci]

			plain_zone_list[#plain_zone_list + 1] = zone
		end

		self.plain_zone_list = plain_zone_list
	end

	if not self._breed_pack_legend then
		local breed_pack_legend = {}
		local i = 1

		for key, _ in pairs(BreedPacks) do
			local c = string.char(65 + i)

			breed_pack_legend[key] = c .. c .. c
			i = i + 1
		end

		self._breed_pack_legend = breed_pack_legend
	end

	local w, h

	if Application.screen_resolution then
		w, h = Application.screen_resolution()
	else
		w, h = Application.resolution()
	end

	local plain_zone_list = self.plain_zone_list
	local num_zones = #plain_zone_list
	local alpha = 60
	local win_x1, win_y1 = 640, 40
	local win_x2, win_y2 = w - 100, h - 100
	local left = 40
	local top = h - 40

	Gui.rect(self._gui, Vector3(win_x1, win_y1, UILayer.transition), Vector2(win_x2, win_y2), Color(alpha, 40, 40, 40))
	self:_draw_legend(self._breed_pack_legend, w - 450, top - 40)
	Gui.text(self._gui, string.format("Spawn Zone Baker. #zones=%d", num_zones), "materials/fonts/arial", 14, "arial", Vector3(left + 15, top - 40, 1000))

	local max_rows_shown = 40
	local mid_row = math.floor(max_rows_shown / 2)
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local zone_index, _, near_zone = self:get_zone_segment_from_travel_dist(main_path_info.ahead_travel_dist)

	Debug.text("zone:%d, unique_id %d %s", zone_index, near_zone.unique_zone_id, near_zone.pack_type)

	local zone_list_index = zone_index <= mid_row and 1 or zone_index - mid_row
	local row_y = top - 40
	local i = 1

	while i < max_rows_shown and zone_list_index <= num_zones do
		local zone = plain_zone_list[zone_list_index]

		if zone then
			self:draw_func2(zone, zone_list_index, i, left, row_y, near_zone == zone)

			row_y = row_y - 20
			i = i + 1
		end

		zone_list_index = zone_list_index + 1
	end
end

SpawnZoneBaker._debug_draw_baker_data = function (self, hi_data, data, breed_name, position)
	if data.count > data.max_amount then
		local c = Colors.distinct_colors_lookup[hi_data.id] or Colors.distinct_colors_lookup[1]
		local color = Color(c[1], c[2], c[3])

		QuickDrawerStay:sphere(Vector3Aux.unbox(position), 0.5, color)
		print(string.format("SPAWN SWITCH breed %s -> %s, hidata-id: %s count: %d/%d", breed_name, data.switch_breed.name, hi_data.id, data.switch_count, data.max_amount))
	else
		local c = Colors.distinct_colors_lookup[hi_data.id] or Colors.distinct_colors_lookup[1]
		local color = Color(c[1], c[2], c[3])

		QuickDrawerStay:sphere(Vector3Aux.unbox(position), 0.1, color)
		print(string.format("SPAWN NORMAL breed %s, hidata-id: %s count: %d/%d", breed_name, hi_data.id, data.switch_count, data.max_amount))
	end
end
