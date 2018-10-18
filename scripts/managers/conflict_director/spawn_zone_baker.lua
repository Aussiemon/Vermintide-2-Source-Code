SpawnZoneBaker = class(SpawnZoneBaker)
local InterestPointUnits = InterestPointUnits
local PackSpawningSettings = PackSpawningSettings
local DOOR_SEARCH_RADIUS = 1.5

SpawnZoneBaker.init = function (self, world, nav_world, level_analyzer)
	self.world = world
	self.nav_world = nav_world
	self.level_analyzer = level_analyzer
	self.spawn_zones_available = false

	if not InterestPointUnitsLookup then
		ConflictUtils.generate_spawn_point_lookup(world)
	end

	local level_settings = LevelHelper:current_level_settings(self.world)

	if level_settings.level_name then
		local patrol_waypoints_path = level_settings.level_name .. "_patrol_waypoints"

		if Application.can_get("lua", patrol_waypoints_path) then
			local waypoints_data = require(patrol_waypoints_path)
			local patrol_waypoints = waypoints_data.patrol_waypoints
			local boss_waypoints = table.clone(waypoints_data.boss_waypoints)
			local event_waypoints = waypoints_data.event_waypoints

			self.level_analyzer:store_patrol_waypoints(boss_waypoints, patrol_waypoints, event_waypoints)
		end

		local spawn_zone_path = level_settings.level_name .. "_spawn_zones"

		if Application.can_get("lua", spawn_zone_path) then
			self.last_loaded_zone_package = spawn_zone_path
			local spawn_data = require(spawn_zone_path)
			self.zones = spawn_data.zones
			self.num_main_zones = spawn_data.num_main_zones
			self.spawn_pos_lookup = spawn_data.position_lookup
			self.total_main_path_length_unmodified = spawn_data.total_main_path_length
			local main_paths = spawn_data.main_paths
			self.main_paths = main_paths
			self.zone_convert = {}
			local path_markers = spawn_data.path_markers

			for i = 1, #path_markers, 1 do
				local marker = path_markers[i]
				local p = marker.pos
				marker.pos = Vector3Box(p[1], p[2], p[3])
			end

			self.path_markers = path_markers
			local crossroads = spawn_data.crossroads
			local mainpath_was_changed, altered_amount_num_main_zones = self.level_analyzer:remove_crossroads_extra_path_branches(main_paths, crossroads, self.total_main_path_length_unmodified, self.zones, self.num_main_zones, path_markers)

			if mainpath_was_changed then
				self.num_main_zones = altered_amount_num_main_zones
			end

			local door_system = Managers.state.entity:system("door_system")
			local door_broadphase_query_result = {}
			local total_main_path_length = 0

			for i = 1, #main_paths, 1 do
				local path = main_paths[i]
				local nodes = path.nodes

				for j = 1, #nodes, 1 do
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

			self.level_analyzer.inject_travel_dists(main_paths, mainpath_was_changed)
			self.level_analyzer:store_path_markers(path_markers)

			self.total_main_path_length = total_main_path_length

			self.level_analyzer:store_main_paths(main_paths)
			self.level_analyzer:brute_force_calc_zone_distances(self.zones, self.num_main_zones, self.spawn_pos_lookup)

			if mainpath_was_changed then
				Managers.state.spawn.respawn_handler:recalc_respawner_dist_due_to_crossroads()
			end

			self:create_cover_points(spawn_data.cover_points, self.level_analyzer.cover_points_broadphase)

			self.spawn_zones_available = true
		else
			ferror("Cant get %s, make sure this is added to the \\resource_packages\\level_scripts.package file. Or have you forgotten to run generate_resource_packages.bat?", spawn_zone_path)
		end
	end
end

local function debug_text(...)
	if script_data.debug_zone_baker then
		print(string.format(...))
	end
end

SpawnZoneBaker.reset = function (self)
	if self.last_loaded_zone_package then
		package.loaded[self.last_loaded_zone_package] = nil
	end
end

SpawnZoneBaker.loaded_spawn_zones_available = function (self)
	return self.spawn_zones_available
end

SpawnZoneBaker.create_cover_points = function (self, cover_points, broad_phase)
	if not cover_points then
		print("No cover points found")

		return
	end

	local show_hidden = script_data.show_hidden_cover_points
	local ok_color = Color(0, 255, 0)
	local bad_color = Color(200, 75, 0)
	local nav_world = self.nav_world
	local numbers = #cover_points
	local up = Vector3.up()

	for i = 1, numbers, 5 do
		local a, b, c = Script.temp_count()
		local x = cover_points[i]
		local y = cover_points[i + 1]
		local z = cover_points[i + 2]
		local pos = Vector3(x, y, z)

		if show_hidden then
			local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, pos, 0.5, 0.5)

			if is_position_on_navmesh then
				QuickDrawerStay:sphere(pos, 0.5, ok_color)
			else
				QuickDrawerStay:capsule(pos, pos + Vector3(0, 0, 20), 0.5, bad_color)
				print("bad cover point outside nav-mesh", pos)
			end
		end

		local nx = cover_points[i + 3]
		local ny = cover_points[i + 4]
		local rot = Quaternion.look(Vector3(nx, ny, 0), up)
		local unit = World.spawn_unit(self.world, "units/hub_elements/empty", pos, rot)

		Broadphase.add(broad_phase, unit, pos, 1)
		Script.set_temp_count(a, b, c)
	end
end

SpawnZoneBaker.periodical = function (self, hi, dist_data)
	local len, density = nil

	if hi then
		len = math.random(dist_data.min_low_dist, dist_data.max_low_dist)
		density = dist_data.min_low_density + math.random() * (dist_data.max_low_density - dist_data.min_low_density)
		hi = false
	else
		len = math.random(dist_data.min_hi_dist, dist_data.max_hi_dist)
		density = dist_data.min_hi_density + math.random() * (dist_data.max_hi_density - dist_data.min_hi_density)
		hi = true
	end

	return len, density, hi
end

local function array_copy(source, dest, size)
	for i = 1, size, 1 do
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

SpawnZoneBaker.generate_spawns = function (self, spawn_cycle_length, goal_density, area_density_coefficient, length_density_coefficient, conflict_director_name)
	if not InterestPointUnitsLookup then
		ConflictUtils.generate_spawn_point_lookup(self.world)
	end

	if not self.spawn_zones_available then
		print("No spawn zones where found, can't generate spawns")
	end

	if self.graph then
		self.graph:reset()
	end

	self._all_hi_data = {}
	self._count_up = 0
	self.difficulty = Managers.state.difficulty:get_difficulty()
	local great_cycles = {}
	local island_zones = {}
	local zones = self.zones
	local spawn_pos_lookup = self.spawn_pos_lookup
	local num_main_zones = self.num_main_zones
	local zone_convert = self.zone_convert
	conflict_director_name = conflict_director_name or "default"
	local conflict_director = ConflictDirectors[conflict_director_name]
	local pack_spawning_setting = conflict_director.pack_spawning
	local initial_roaming_set = pack_spawning_setting.roaming_set

	if script_data.debug_zone_baker then
		print("Baker: Initial conflict_director:" .. conflict_director.name .. ", pack_spawning:", pack_spawning_setting.name, " initial_roaming_set=", initial_roaming_set.name)
	end

	local cycle_length = 0
	local cycle_zones = {}

	for i = 1, num_main_zones, 1 do
		local zone_layer = zones[i]
		local override_conflict_setting = zone_layer.roaming_set

		if override_conflict_setting then
			local director_set = ConflictDirectorSets[override_conflict_setting]
			local director = nil

			if director_set then
				debug_text("Baker: director_set OVERRIDE at unique_zone_id: '%d' with a director_set: '%s'", zone_layer.unique_zone_id, override_conflict_setting)

				local pick_random = director_set.pick_random

				if pick_random then
					local row = LoadedDice.roll_easy(director_set.loaded_easy_dice)
					override_conflict_setting = pick_random[row * 2 - 1]
				end
			end

			debug_text("Baker: conflict_setting OVERRIDE at unique_zone_id: '%d' conflict_setting: '%s'", zone_layer.unique_zone_id, override_conflict_setting)

			conflict_director = ConflictDirectors[override_conflict_setting]
			local pack_spawning = conflict_director.pack_spawning

			if pack_spawning then
				pack_spawning_setting = pack_spawning
			end
		end

		local outer = {}
		local total_zone_area = zone_layer.sub_areas[1]
		local pack_type = pack_spawning_setting.roaming_set.breed_packs
		local zone = {
			total_area = 0,
			nodes = zone_layer.sub[1],
			area = zone_layer.sub_areas[1],
			outer = outer,
			pack_type = pack_type,
			pack_spawning_setting = pack_spawning_setting,
			conflict_setting = conflict_director,
			unique_zone_id = zone_layer.unique_zone_id
		}

		for j = 2, #zone_layer.sub, 1 do
			local area = zone_layer.sub_areas[j]
			total_zone_area = total_zone_area + (area or 0)
			outer[#outer + 1] = {
				nodes = zone_layer.sub[j],
				area = area
			}
		end

		zone.total_area = total_zone_area
		cycle_length = cycle_length + zone_layer.sub_zone_length
		cycle_zones[#cycle_zones + 1] = zone
		zone_convert[i] = zone

		if spawn_cycle_length <= cycle_length or i == num_main_zones then
			great_cycles[#great_cycles + 1] = {
				zones = cycle_zones,
				length = cycle_length
			}
			cycle_length = cycle_length - spawn_cycle_length
			cycle_zones = {}
		end
	end

	local num_great_cycles = #great_cycles
	local spawns = {}
	local pack_sizes = {}
	local pack_rotations = {}
	local pack_types = {}
	local zone_data_list = {}
	local spawn_pos_lookup = self.spawn_pos_lookup
	local distribution = PackSpawningDistribution.standard.distribution_method
	local dist_data = PackDistributions[distribution]

	for i = 1, num_great_cycles, 1 do
		local cycle = great_cycles[i]
		local cycle_zones = cycle.zones
		local num_cycle_zones = #cycle_zones
		local sum_density = 0
		local num_hi = 0
		local zone = nil

		if distribution == "random" then
			for j = 1, num_cycle_zones, 1 do
				zone = cycle_zones[j]
				local density = Math.random()
				zone.density = density
				sum_density = sum_density + density
			end
		elseif distribution == "periodical" then
			local len, density, period_end = nil
			local hi = Math.random() > 0.5
			len, density, hi = self:periodical(hi, dist_data)
			zone = cycle_zones[1]
			zone.period_length = len
			zone.hi = hi
			local hi_data = self:create_hi_data(zone, zone.pack_type)
			period_end = len

			if hi then
				num_hi = 1
			else
				num_hi = 0
			end

			local period_counter, second_part = nil

			for j = 1, num_cycle_zones, 1 do
				zone = cycle_zones[j]
				zone.hi_data = hi_data

				if period_end < j then
					len, density, hi = self:periodical(hi, dist_data)
					second_part = false
					period_end = (j + len) - 1

					if num_cycle_zones < period_end then
						len = num_cycle_zones - j
						period_end = num_cycle_zones
					end

					zone.period_length = len
					zone.hi_data = hi_data
					zone.hi = hi
					hi_data = self:create_hi_data(zone, zone.pack_type)
					num_hi = num_hi + ((hi and 1) or 0)
				elseif dist_data.random_distribution then
					if hi then
						density = dist_data.min_hi_density + math.random() * (dist_data.max_hi_density - dist_data.min_hi_density)
					else
						density = dist_data.min_low_density + math.random() * (dist_data.max_low_density - dist_data.min_low_density)
					end
				elseif period_counter == dist_data.zero_clamp_max_dist and not hi then
					second_part = true
					density = dist_data.min_low_density + math.random() * (dist_data.max_low_density - dist_data.min_low_density)
				end

				if zone.period_length then
					period_counter = 1
				else
					period_counter = period_counter + 1
				end

				if density < dist_data.zero_density_below and not second_part then
					density = 0
				end

				zone.density = density
				zone.hi = hi
				sum_density = sum_density + density
			end
		end

		local average_goal_density = 0
		local pack_spawning_setting, goal_density = nil

		for j = 1, num_cycle_zones, 1 do
			local zone = cycle_zones[j]

			if pack_spawning_setting ~= zone.pack_spawning_setting then
				goal_density = zone.pack_spawning_setting.basics.goal_density
			end

			average_goal_density = average_goal_density + goal_density
		end

		if sum_density > 0 then
			local normalizer = average_goal_density / sum_density
			local remainder = 0

			print("-------------> JOW Perfect-density", average_goal_density, "Sum density", sum_density, "Normalized coefficient:", normalizer)

			for j = 1, num_cycle_zones, 1 do
				local zone = cycle_zones[j]
				zone.density = zone.density * normalizer

				if remainder > 0 then
					zone.density = zone.density + remainder
					remainder = 0
				end

				if zone.density > 1 then
					remainder = (remainder + zone.density) - 1
					zone.density = 1
				end
			end

			if distribution == "periodical" then
				self:inject_special_packs(num_hi, cycle_zones)
			end

			local kept = 1

			for j = 1, num_cycle_zones, 1 do
				local center_zone = cycle_zones[j]
				local center_density = center_zone.density
				local outer = center_zone.outer
				local density = center_density

				for k = 1, #outer, 1 do
					local zone = outer[k]
					local density = math.clamp(density * kept + (1 - kept) * (2 * math.random() - 1), 0, 1)
					zone.density = density
					zone.hi_data = center_zone.hi_data
					zone.hi = center_zone.hi
				end
			end

			self:populate_spawns_by_rats(pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, cycle_zones, pack_spawning_setting, length_density_coefficient, nil, true, nil)

			for j = 1, num_cycle_zones, 1 do
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

						for i = 1, num_to_remove, 1 do
							array_remove_element(work_list, math.random(1, work_list_size), work_list_size)

							work_list_size = work_list_size - 1
						end

						outer_zones = work_list
					end
				end

				self:populate_spawns_by_rats(pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, outer_zones, area_density_coefficient, 0, center_zone.pack_type, nil, center_zone)
			end
		else
			print(sprintf("Spawn density in great_cycle %d is 0, num cycle zones: %d ", i, num_cycle_zones))
		end
	end

	local calculate_nearby_islands = PackSpawningSettings.default.basics.calculate_nearby_islands

	for i = num_main_zones + 1, #zones, 1 do
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

			if script_data.debug_zone_baker then
				print("Island zone", i, "has parent zone:", parent_zone_index)
			end

			local ok_to_spawn = not zone.on_roof or BreedPacks[pack_type].roof_spawning_allowed

			if ok_to_spawn then
				local sub_zones = zone.sub
				local sub_areas = zone.sub_areas

				for j = 1, #sub_zones, 1 do
					local nodes = sub_zones[j]
					local area = sub_areas[j]
					local density = math.random()
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
						period_length = 1,
						hi = false,
						island = true,
						density = density,
						parent_zone = parent_zone
					}

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
						self:spawn_amount_rats(spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, nodes, num_wanted_rats, pack_type, area, island_zone)
					end
				end
			elseif script_data.debug_zone_baker then
				print("Zone " .. i .. " is tagged as roof, so no '" .. pack_type .. "' will spawn there.")
			end
		elseif script_data.debug_zone_baker then
			print("Island zone", i, " is missing a parent zone")
		end
	end

	assert(#spawns == #pack_sizes)

	self.great_cycles = great_cycles
	self.island_zones = island_zones

	table.clear(lookup)

	return spawns, pack_sizes, pack_rotations, pack_types, zone_data_list
end

SpawnZoneBaker.inject_special_packs = function (self, total_peaks, cycle_zones)
	local roaming_set = cycle_zones[1].pack_spawning_setting.roaming_set
	local c = roaming_set.breed_packs_peeks_overide_chance

	if not c then
		return
	end

	local percent_overridden = Math.random() * (c[2] - c[1]) + c[1]
	local picked_peaks = math.floor(total_peaks * percent_overridden)

	if picked_peaks <= 0 or total_peaks <= 0 then
		return
	end

	if script_data.debug_zone_baker then
		print("Overriding " .. picked_peaks .. " peaks, override chance: " .. tostring(percent_overridden))
	end

	local random_peaks = table.get_random_array_indices(total_peaks, picked_peaks)
	local lookup = {}

	for i = 1, picked_peaks, 1 do
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
				local loaded_dice = roaming_set.breed_packs_override_loaded_dice
				local prob = loaded_dice[1]
				local alias = loaded_dice[2]
				local pack_type_index = LoadedDice.roll(prob, alias)
				local pack_type = breed_packs_override[pack_type_index][1]
				local pack_density = breed_packs_override[pack_type_index][3]
				local hi_data = self:create_hi_data(zone, pack_type)

				for k = zone_index, (zone_index + period_length) - 1, 1 do
					zone = cycle_zones[k]
					zone.pack_type = pack_type
					zone.density_coefficient = pack_density
					zone.hi_data = hi_data
				end

				zone_index = (zone_index + period_length) - 1
			end

			peak_index = peak_index + 1
		end

		zone_index = zone_index + 1
	end
end

SpawnZoneBaker.create_hi_data = function (self, zone, pack_type_name)
	local hi_data = nil
	local breed_packs = BreedPacks[pack_type_name]
	local zone_checks = breed_packs.zone_checks

	if zone_checks then
		self._count_up = self._count_up + 1
		hi_data = {
			id = self._count_up
		}
		zone.hi_data = hi_data
		local clamp_breeds = (zone.hi and zone_checks.clamp_breeds_hi) or zone_checks.clamp_breeds_low
		local random_interval = ConflictUtils.random_interval

		print("HIDATA: section_id=", hi_data.id, zone.hi, clamp_breeds, (zone.island and "ISLAND") or "")

		if clamp_breeds then
			local difficulty_overrides = clamp_breeds[self.difficulty]

			if difficulty_overrides then
				local breed_count = {}

				for i = 1, #difficulty_overrides, 1 do
					local c = difficulty_overrides[i]
					local max_amount = random_interval(c[1])
					local check_breed_name = c[2]
					local switch_breed = c[3]
					breed_count[check_breed_name] = {
						switch_count = 0,
						count = 0,
						max_amount = max_amount,
						switch_breed = switch_breed,
						hi = zone.hi
					}
				end

				hi_data.breed_count = breed_count
			end
		end

		self._all_hi_data[#self._all_hi_data + 1] = hi_data
	end

	return hi_data
end

SpawnZoneBaker.populate_spawns_by_rats = function (self, global_pack_spawning_setting, spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, zone_list, global_area_density_coefficient, global_length_density_coefficient, pack_type_override, is_main_zone, parent_zone)
	local num_zones = #zone_list
	local area_bucket = 0
	local dist_bucket = 0
	local zone_length = 10

	for j = 1, num_zones, 1 do
		local zone = zone_list[j]
		local pack_spawning_setting = zone.pack_spawning_setting or global_pack_spawning_setting
		local basics = pack_spawning_setting.basics
		local area_density_coefficient = (is_main_zone and zone.density_coefficient) or pack_spawning_setting.area_density_coefficient or global_area_density_coefficient
		local length_density_coefficient = (is_main_zone and basics.length_density_coefficient) or global_length_density_coefficient
		local clamp_area = is_main_zone and basics.clamp_main_path_zone_area
		local nodes = zone.nodes

		if nodes then
			local area = (is_main_zone and zone.area < clamp_area and clamp_area) or zone.area
			local num_area_spawns_f = area * zone.density * area_density_coefficient + area_bucket
			local num_area_spawns = math.floor(num_area_spawns_f)
			area_bucket = num_area_spawns_f - num_area_spawns
			local num_dist_spawns_f = zone_length * zone.density * length_density_coefficient + dist_bucket
			local num_dist_spawns = math.floor(num_dist_spawns_f)
			dist_bucket = num_dist_spawns_f - num_dist_spawns
			local num_wanted_rats = num_area_spawns + num_dist_spawns

			if num_wanted_rats > 0 then
				local a, b, c = Script.temp_count()
				local num_spawns = self:spawn_amount_rats(spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, nodes, num_wanted_rats, pack_type_override or zone.pack_type, area, parent_zone or zone)
				zone.wanted_spawns = num_spawns

				Script.set_temp_count(a, b, c)
			end
		else
			print("Warning: missing nodes! in zones")
		end
	end
end

local max_pack_size = #InterestPointUnits

SpawnZoneBaker.spawn_amount_rats = function (self, spawns, pack_sizes, pack_rotations, pack_types, zone_data_list, nodes, num_wanted_rats, pack_type, area, zone)
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
		local pack_size = InterestPointPickList[math.random(index_max)]
		local variants = InterestPointUnits[pack_size]
		local num_variants = #variants
		local ip_unit_index = (num_variants == 1 and 1) or Math.random(num_variants)
		local ip_unit_name = variants[ip_unit_index]

		for i = 1, 10, 1 do
			local a, b, c = Script.temp_count()
			local node_index = math.random(num_nodes)
			local tri_index = nodes[node_index]

			if not lookup[tri_index] then
				local p = spawn_pos_lookup[nodes[node_index]]
				local pos = Vector3(p[1], p[2], p[3])
				local angle = math.random() * 2 * math.pi
				local rot = Quaternion(Vector3.up(), angle)
				local outside_navmesh_pos = ConflictUtils.interest_point_outside_nav_mesh(nav_world, ip_unit_name, pos, rot)
				local move_tries = 0

				while outside_navmesh_pos and move_tries < 3 do
					move_tries = move_tries + 1
					local move_vec = vector3_normalize(pos - outside_navmesh_pos) * 1
					pos = pos + move_vec
					outside_navmesh_pos = ConflictUtils.interest_point_outside_nav_mesh(nav_world, ip_unit_name, pos, rot)
				end

				if not outside_navmesh_pos then
					amount = amount + 1
					spawns[amount] = Vector3Box(pos)

					assert(ip_unit_name, "what the hell no spawn point unit name?")

					pack_sizes[amount] = ip_unit_name
					pack_rotations[amount] = angle
					pack_types[amount] = pack_type
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

local heatmap_colors_lookup = {}

for i = 1, 16, 1 do
	heatmap_colors_lookup[i] = {
		math.floor((1 - i / 16) * 255),
		0,
		math.floor(i / 16 * 255)
	}
end

SpawnZoneBaker.get_zone_segment_from_travel_dist = function (self, travel_dist)
	local zones = self.zones
	local num_zones = self.num_main_zones

	for i = 1, num_zones, 1 do
		local zone = zones[i]
		local zone_travel_dist = zone.travel_dist - 5

		if travel_dist < zone_travel_dist then
			local zone_index = (i > 1 and i - 1) or i
			local closest_zone = zones[zone_index]
			local closest_zone_conv = self.zone_convert[zone_index]

			return zone_index, closest_zone, closest_zone_conv
		end
	end

	return num_zones, zones[num_zones], self.zone_convert[num_zones]
end

SpawnZoneBaker.draw_zones = function (self, nav_world, draw_only_one_zone_index)
	local show_spawn_density = false
	local show_zone_text = true

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
		for i = 1, 16, 1 do
			local c = heatmap_colors_lookup[i]
			heatmap_colors[i] = Color(200, c[1], c[2], c[3])
		end
	end

	local start = math.clamp(draw_only_one_zone_index or 1, 1, #zones)

	for i = start, #zones, 1 do
		local zone = zones[i]
		local sub_zones = zone.sub
		local colors, density = nil

		if show_spawn_density then
			density = math.floor(((zone_convert[i] and zone_convert[i].density) or 1) * 16)
		else
			local f = 92 + 63 * i % 3
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
				Color(alpha, g, 0, f)
			}
		end

		if show_zone_text then
			local triangle_index = sub_zones[1][1]
			local p = spawn_pos_lookup[triangle_index]
			local text = string.format("%d %.1f <- %.1f", i, zone.travel_dist or 0, zone.old_travel_dist or 0)

			Debug.world_sticky_text(p, text, colors[1])
		end

		local h = Vector3(0, 0, 0.1)

		for j = 1, #sub_zones, 1 do
			local sub_zone = sub_zones[j]

			if sub_zone then
				for k = 1, #sub_zone, 1 do
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

SpawnZoneBaker.toggle_graph = function (self)
	if self.graph then
		self.graph:set_active(not self.graph.active)
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
	Managers.state.conflict:respawn_level()

	self.plain_zone_list = nil
	self._breed_pack_legend = nil
end

function PRINT_ZONE_DATA()
	Managers.state.conflict.spawn_zone_baker:debug_print_zones()
end

function print_zone_list(cycle_zones)
	for j = 1, #cycle_zones, 1 do
		local zone = cycle_zones[j]
		local area = math.clamp(zone.area * 0.5, 0, 100)

		if zone.hi_data then
			local hi_data_id = zone.hi_data.id

			print(string.format("Zone: %d, hi: %s, hi-id: %d, Density: %.1f, Area: %.1f", j, tostring(zone.hi), hi_data_id, zone.density, area), "con:", zone.conflict_setting.name, "period_len:", zone.period_length or "--", "data:", (zone.hi_data and "Y") or "N", string.format("Director / Packtype: %s / %s ", zone.conflict_setting.name, zone.pack_type))

			local outer_zones = zone.outer

			for k = 1, #outer_zones, 1 do
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
			print(string.format("Zone: %d, hi: %s, hi-id: --, Density: %.1f, Area: %.1f", j, tostring(zone.hi), zone.density, area), "con:", zone.conflict_setting.name, "period_len:", zone.period_length or "--", "data:", (zone.hi_data and "Y") or "N", string.format("Director / Packtype: %s / %s ", zone.conflict_setting.name, zone.pack_type))
		end
	end
end

SpawnZoneBaker.debug_print_zones = function (self)
	local great_cycles = self.great_cycles

	for i = 1, #great_cycles, 1 do
		local great_cycle = great_cycles[i]

		print("Great Cycle", i, "------------")

		local cycle_zones = great_cycle.zones

		print_zone_list(cycle_zones)
	end

	local island_zones = self.island_zones

	print("\n\nIsland Zones:")
	print_zone_list(island_zones)
end

function PRINT_HI_DATA()
	Managers.state.conflict.spawn_zone_baker:debug_print_hi_data()
end

SpawnZoneBaker.debug_print_hi_data = function (self)
	local old_hi_data = nil
	local great_cycles = self.great_cycles

	for i = 1, #great_cycles, 1 do
		local great_cycle = great_cycles[i]

		print("Great Cycle", i, "-------------")

		local cycle_zones = great_cycle.zones

		for j = 1, #cycle_zones, 1 do
			local zone = cycle_zones[j]
			local hi_data = zone.hi_data

			if hi_data ~= old_hi_data then
				local period = (zone.hi and "Hi") or "Low"
				local s = period .. "-data for zone:" .. tostring(j) .. " -> " .. (j + zone.period_length) - 1

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

	for i = 1, #self._all_hi_data, 1 do
		local hi_data = self._all_hi_data[i]
		local breed_count = hi_data.breed_count

		if breed_count then
			for check_breed_name, data in pairs(breed_count) do
				print("Hidata id:", hi_data.id, (data.hi and "HI") or "LOW", "count:", data.count, "switched:", data.switch_count, "max:", data.max_amount, "breed:", check_breed_name, "switched to:", data.switch_breed.name)
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
			"density"
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

	local current_conflict_setting = nil
	local current_pack_type = great_cycles[1].zones[1].conflict_setting.pack_spawning.roaming_set.breed_packs

	for i = 1, num_great_cycles, 1 do
		local cycle = great_cycles[i]
		local cycle_zones = cycle.zones

		if i > 1 then
			self.graph:add_annotation({
				text = "Cycle",
				live = true,
				y = 105,
				color = "green",
				x = dist
			})
		end

		for j = 1, #cycle_zones, 1 do
			local zone = cycle_zones[j]
			local density = zone.density
			local area = math.clamp(zone.area * 0.5, 0, 100)

			if current_pack_type ~= zone.pack_type then
				self.graph:add_annotation({
					text = "O",
					live = true,
					color = "lawn_green",
					x = dist,
					y = density * 100
				})
			elseif zone.hi then
				self.graph:add_annotation({
					text = "H",
					live = true,
					color = "lawn_green",
					x = dist,
					y = density * 100
				})
			end

			if current_conflict_setting ~= zone.conflict_setting then
				current_conflict_setting = zone.conflict_setting
				current_pack_type = current_conflict_setting.pack_spawning.roaming_set.breed_packs

				self.graph:add_annotation({
					live = true,
					y = 110,
					color = "orange",
					x = dist,
					text = current_conflict_setting.name
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

	local rares = self.level_analyzer.boss_event_list
	local y = 60

	for k = 1, #rares, 1 do
		local rare = rares[k]
		local path_dist = rare[3]
		local event_name = rare[2]
		local color = rare[4].debug_color

		if script_data.debug_zone_baker then
			print("PATH DIST:", event_name, path_dist)
		end

		self.graph:add_annotation({
			live = true,
			x = path_dist,
			y = y,
			text = event_name,
			color = color
		})

		y = y + 7

		if y > 70 then
			y = 30
		end
	end

	local player_annotation = {
		text = "PLAYER",
		live = true,
		y = 50,
		color = "green",
		x = 0
	}

	self.graph:add_annotation(player_annotation)

	self.player_annotation = player_annotation
end

SpawnZoneBaker.draw_player_in_density_graph = function (self, travel_dist)
	if self.graph then
		if not self.player_annotation then
			local player_annotation = {
				text = "PLAYER",
				live = true,
				y = 50,
				color = "green",
				x = 0
			}

			self.graph:add_annotation(player_annotation)

			self.player_annotation = player_annotation
		end

		self.graph:move_annotation(self.player_annotation, travel_dist)
	end
end

SpawnZoneBaker.draw_func1 = function (self, zone, zone_list_index, row, left, row_y)
	local zone_type = (zone.island and "ISLAND") or "MAIN"
	local row_text = string.format("%d %s: %d %s", row, zone_type, zone_list_index, zone.pack_spawning_setting.name or "?")

	Gui.text(self._gui, row_text, "core/editor_slave/gui/arial", 14, "core/editor_slave/gui/arial", Vector3(left + 200, row_y, 1000))
end

SpawnZoneBaker._draw_zone = function (self, zone, color)
	local up = Vector3(0, 0, 1.5)
	local nodes = zone.nodes

	for i = 1, #nodes, 1 do
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

	for i = 1, #outer, 1 do
		s = s .. " " .. legend[zone.pack_type] .. "(" .. zone.hi_data.id .. ") "
	end

	local islands = zone.islands

	if islands then
		s = s .. " <--- "

		for i = 1, #islands, 1 do
			local island_id = islands[i]
			local island = self.island_zones[island_id]
			s = s .. " " .. legend[island.pack_type] .. "(" .. island.hi_data.id .. ") "
		end
	end

	local color = (is_closest and Color(200, 200, 0)) or (zone.hi and Color(255, 255, 255)) or Color(175, 175, 175)

	if draw_zones and is_closest then
		self:_draw_zone(zone, color)

		if zone.islands then
			for i = 1, #zone.islands, 1 do
				local island_zone = self.island_zones[islands[i]]

				if island_zone then
					self:_draw_zone(island_zone, Color(255, 0, 128))
				end
			end
		end

		local outer = zone.outer

		for i = 1, #outer, 1 do
			self:_draw_zone(outer[i], Color(55, 200 - (i - 1) * 24, (i - 1) * 24))
		end

		local spawned_units_by_breed = Managers.state.conflict._spawned_units_by_breed
		s = s .. ConflictUtils.display_number_of_breeds_in_segment("BREEDS: ", spawned_units_by_breed, zone)
	end

	local zone_type = (zone.island and "ISLAND") or "MAIN"
	local row_text = string.format("%s: %d %s", zone_type, zone_list_index, s)

	Gui.text(self._gui, row_text, "core/editor_slave/gui/arial", 14, "core/editor_slave/gui/arial", Vector3(left + 200, row_y, 1000), color)
end

SpawnZoneBaker._draw_legend = function (self, legend, x, y)
	Gui.text(self._gui, string.format("LEGEND OF PACK-TYPES"), "core/editor_slave/gui/arial", 14, "core/editor_slave/gui/arial", Vector3(x, y, 1000))

	y = y - 30

	for key, code in pairs(legend) do
		Gui.text(self._gui, string.format("%s = %s", key, code), "core/editor_slave/gui/arial", 14, "core/editor_slave/gui/arial", Vector3(x, y, 1000))

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
		local cycle_zones = nil

		for ci = 1, #great_cycles, 1 do
			local cycle = great_cycles[ci]
			local zones = cycle.zones

			for z = 1, #zones, 1 do
				local zone = zones[z]
				plain_zone_list[#plain_zone_list + 1] = zone
			end
		end

		local island_zones = self.island_zones

		for ci = 1, #island_zones, 1 do
			local zone = island_zones[ci]
			plain_zone_list[#plain_zone_list + 1] = zone
		end

		self.plain_zone_list = plain_zone_list
	end

	if not self._breed_pack_legend then
		local breed_pack_legend = {}
		local i = 1

		for key, data in pairs(BreedPacks) do
			local c = string.char(65 + i)
			breed_pack_legend[key] = c .. c .. c
			i = i + 1
		end

		self._breed_pack_legend = breed_pack_legend
	end

	local w, h = nil

	if Application.screen_resolution then
		w, h = Application.screen_resolution()
	else
		w, h = Application.resolution()
	end

	local plain_zone_list = self.plain_zone_list
	local num_zones = #plain_zone_list
	local alpha = 60
	local win_x1 = 640
	local win_y1 = 40
	local win_x2 = w - 100
	local win_y2 = h - 100
	local left = 40
	local top = h - 40

	Gui.rect(self._gui, Vector3(win_x1, win_y1, UILayer.transition), Vector2(win_x2, win_y2), Color(alpha, 40, 40, 40))
	self:_draw_legend(self._breed_pack_legend, w - 450, top - 40)
	Gui.text(self._gui, string.format("Spawn Zone Baker. #zones=%d", num_zones), "core/editor_slave/gui/arial", 14, "core/editor_slave/gui/arial", Vector3(left + 15, top - 40, 1000))

	local max_rows_shown = 40
	local mid_row = math.floor(max_rows_shown / 2)
	local start_index = 1
	local conflict_director = Managers.state.conflict
	local main_path_info = conflict_director.main_path_info
	local zone_index, editor_zone, near_zone = self:get_zone_segment_from_travel_dist(main_path_info.ahead_travel_dist)

	Debug.text("zone:%d, unique_id %d %s", zone_index, near_zone.unique_zone_id, near_zone.pack_type)

	local zone_list_index = (zone_index <= mid_row and 1) or zone_index - mid_row
	local row_y = top - 40
	local i = 1

	while max_rows_shown > i and zone_list_index <= num_zones do
		local zone = plain_zone_list[zone_list_index]

		if zone then
			self:draw_func2(zone, zone_list_index, i, left, row_y, near_zone == zone)

			row_y = row_y - 20
			i = i + 1
		end

		zone_list_index = zone_list_index + 1
	end
end

return
