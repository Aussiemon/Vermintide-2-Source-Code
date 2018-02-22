EnemyRecycler = class(EnemyRecycler)
local InterestPointUnits = InterestPointUnits
local position_lookup = POSITION_LOOKUP
local unit_alive = Unit.alive
local U_UNIT = 1
local U_BREED_NAME = 2
local U_POSITION = 3
local U_ROTATION = 4
local U_OPTIONAL_DATA = 5
local AREA_PACK_SIZE_OR_EVENT_NAME = 5
local AREA_ROTATION = 8
local AREA_PACK_TYPE = 9
local ZONE_DATA = 10
local MP_TRAVEL_DIST = 1
local MP_BOXED_POS = 2
local MP_TERROR_EVENT_NAME = 3
local MP_EVENT_DATA = 4

local function fast_array_remove(array, index)
	local value = array[index]
	local size = #array
	array[index] = array[size]
	array[size] = nil

	return value
end

EnemyRecycler.init = function (self, world, nav_world, pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list)
	self.world = world
	self.nav_world = nav_world
	self.conflict_director = Managers.state.conflict
	self.group_manager = self.conflict_director.navigation_group_manager
	self.areas = {}
	self.shutdown_areas = {}
	self.inside_areas = {}
	self.main_path_events = {}
	self.current_main_path_event_id = 1
	self.current_main_path_event_activation_dist = 999999
	self.main_path_info = self.conflict_director.main_path_info
	self._roaming_ai = 0
	self.group_id = 0
	self.visible = 0
	self.level = LevelHelper:current_level(world)
	self.ai_group_system = Managers.state.entity:system("ai_group_system")
	self.patrol_analysis = self.conflict_director.patrol_analysis

	self.setup(self, pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list)

	return 
end
EnemyRecycler.setup_forbidden_zones = function (self, pos)
	self.forbidden_zones = {}
	local forbidden_zones = self.forbidden_zones

	for i = 1, 9, 1 do
		local zone_name = "forbidden_zone" .. i

		if Level.has_volume(self.level, zone_name) then
			forbidden_zones[#forbidden_zones + 1] = zone_name
		end
	end

	local checkpoint_data = Managers.state.spawn:checkpoint_data()

	if checkpoint_data then
		forbidden_zones[#forbidden_zones + 1] = checkpoint_data.no_spawn_volume
	end

	for layer_id = 20, 29, 1 do
		local layer_name = LAYER_ID_MAPPING[layer_id]

		if layer_name then
			local cost = NAV_TAG_VOLUME_LAYER_COST_AI[layer_name]

			if cost == 0 then
				print("Layer named:", layer_name, ", id:", layer_id, " has cost 0 --> removed all roaming spawns found inside")

				forbidden_zones[#forbidden_zones + 1] = layer_name
			end
		end
	end

	self.has_forbidden_zones = 0 < #forbidden_zones

	return 
end

local function is_allowed_spawn(level, volume_list, volume_list_size, pos)
	for i = 1, volume_list_size, 1 do
		if Level.is_point_inside_volume(level, volume_list[i], pos) then
			return false
		end
	end

	return true
end

EnemyRecycler.add_critters = function (self)
	local level_key = Managers.state.game_mode:level_key()
	local level_name = LevelSettings[level_key].level_name
	local unit_ind = LevelResource.unit_indices(level_name, "units/hub_elements/critter_spawner")

	for _, id in ipairs(unit_ind) do
		local pos = LevelResource.unit_position(level_name, id)
		local unit_data = LevelResource.unit_data(level_name, id)
		local breed_name = DynamicData.get(unit_data, "breed")

		assert(Breeds[breed_name], "Level '%s' has placed a 'critter_spawner' unit, with a bad breed-name: '%s'", level_name, breed_name)

		local boxed_rot = QuaternionBox(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))))
		local boxed_pos = Vector3Box(pos)

		self.add_breed(self, breed_name, boxed_pos, boxed_rot)
	end

	return 
end
EnemyRecycler.boxify_waypoint_table = function (self, waypoint_table)
	local waypoints = {}

	for i = 1, #waypoint_table, 1 do
		local w = waypoint_table[i]
		waypoints[i] = Vector3Box(w[1], w[2], w[3])
	end

	return waypoints
end
EnemyRecycler.draw_roaming_splines = function (self)
	local used_color = Color(75, 200, 200)
	local not_used_color = Color(200, 75, 0)
	local drawer = QuickDrawerStay
	local roaming_splines = self.ai_group_system._roaming_splines

	for spline_id, spline in pairs(roaming_splines) do
		local is_roaming = spline.has_party

		if is_roaming then
			QuickDrawerStay:sphere(spline.has_party:unbox(), 1, Color(0, 255, 0))
			print("FOUND ROAMING!")
		end

		local color = (is_roaming and used_color) or not_used_color

		self.ai_group_system:draw_spline(spline.spline_points, drawer, color)
	end

	return 
end
local SizeOfInterestPoint = SizeOfInterestPoint
local min_roaming_patrol_size = 3
EnemyRecycler.inject_roaming_patrol = function (self, area_position, area_rot, pack_type, pack_size_ip_unit_name)
	local amount = SizeOfInterestPoint[pack_size_ip_unit_name]

	if amount < min_roaming_patrol_size then
		return 
	end

	local ptrl = BreedPacks[pack_type].patrol_overrides

	if ptrl and math.random() < ptrl.patrol_chance then
		local use_any_pos_on_spline = false
		local spline_name, spline_data, start_pos = self.conflict_director.level_analysis:get_closest_roaming_spline(area_position.unbox(area_position), use_any_pos_on_spline)

		if not spline_name then
			return false
		end

		local spline = self.ai_group_system:spline(spline_name)

		if spline then
			start_pos = self.patrol_analysis:get_path_point(spline.spline_points, nil, math.random()*0.9)
		end

		local zone = self.group_manager:get_group_from_position(start_pos)
		local pack_data = BreedPacksBySize[pack_type][amount]
		local prob = pack_data.prob
		local alias = pack_data.alias
		local pack_index = LoadedDice.roll(prob, alias)
		local pack = pack_data.packs[pack_index]
		local spline_start_position = Vector3Box(start_pos)
		local waypoints = spline_data.waypoints

		if spline then
			spline.has_party = spline_start_position
		end

		local spline_waypoints = (not spline and self.boxify_waypoint_table(self, waypoints)) or nil
		local event_data = {
			spline_type = "roaming",
			optional_pos = spline_start_position,
			pack_type = pack_type,
			spline_name = spline_name,
			pack = pack,
			spline_way_points = spline_waypoints
		}
		local area = {
			spline_start_position,
			false,
			0,
			0,
			"roaming_patrol",
			zone,
			"event",
			event_data,
			pack_type
		}

		return area
	end

	return false
end
EnemyRecycler.setup = function (self, pos_list, pack_sizes, pack_rotations, pack_types, zone_data_list)
	self.unique_area_id = 0

	self.reset_areas(self)
	self.setup_forbidden_zones(self)

	local areas = self.areas
	local level_settings = LevelHelper:current_level_settings()
	local k = 1
	local volume_list = self.forbidden_zones
	local volume_list_size = #self.forbidden_zones
	local level = self.level
	local nav_world = self.nav_world
	local nav_tag_volume_handler = self.conflict_director.nav_tag_volume_handler
	local roaming_patrols_allowed = not script_data.ai_roaming_patrols_disabled and self.conflict_director.level_analysis.patrol_waypoints

	if not CurrentConflictSettings.roaming.disabled then
		for i = 1, #pos_list, 1 do
			local area_position = pos_list[i]
			local pack_size = pack_sizes[i]
			local area_rot = pack_rotations[i]
			local pack_type = pack_types[i]
			local zone_data = zone_data_list[i]
			local pos = area_position.unbox(area_position)
			local spawn = true
			local zone = self.group_manager:get_group_from_position(pos)

			if not is_allowed_spawn(level, volume_list, volume_list_size, pos) then
				spawn = false
			elseif NavTagVolumeUtils.inside_level_volume_layer(level, nav_tag_volume_handler, pos, "NO_SPAWN") then
				spawn = false
			elseif roaming_patrols_allowed then
				local area = self.inject_roaming_patrol(self, area_position, area_rot, pack_type, pack_size)

				if area then
					areas[k] = area
					k = k + 1
					spawn = false
				end
			end

			assert(pack_size, "Fatal error, missing interest point unit")

			if spawn then
				areas[k] = {
					area_position,
					false,
					0,
					0,
					pack_size,
					zone,
					"pack",
					area_rot,
					pack_type,
					zone_data
				}
				k = k + 1
			end
		end

		self.unique_area_id = k

		if script_data.debug_group_recycling then
			self.draw_roaming_splines(self)
		end
	end

	if not CurrentConflictSettings.roaming.disabled and not script_data.ai_critter_spawning_disabled then
		self.add_critters(self)
	end

	return 
end
EnemyRecycler.reset_areas = function (self)
	local areas = self.areas

	for i = 1, #areas, 1 do
		areas[i] = nil
	end

	local shutdown_areas = self.shutdown_areas

	for i = 1, #shutdown_areas, 1 do
		shutdown_areas[i] = nil
	end

	local inside_areas = self.inside_areas

	for i = 1, #inside_areas, 1 do
		inside_areas[i] = nil
	end

	table.clear(self.main_path_events)

	return 
end
EnemyRecycler.update = function (self, t, dt, player_positions, threat_population, player_areas, use_player_areas)
	self._update_roaming_spawning(self, t, player_positions, threat_population, player_areas, use_player_areas)
	self.ai_group_system:prepare_update_recycler(player_positions, player_areas, use_player_areas)

	if script_data.debug_ai_recycler then
		self.draw_debug(self, player_positions)
	end

	return 
end
EnemyRecycler.update_main_path_events = function (self, t)
	if not self.current_main_path_event_id or script_data.ai_boss_spawning_disabled then
		return 
	end

	if self.current_main_path_event_activation_dist <= self.main_path_info.ahead_travel_dist then
		local id = self.current_main_path_event_id
		local events = self.main_path_events
		local event = events[id]
		local event_name = event[MP_TERROR_EVENT_NAME]
		local pos = event[MP_BOXED_POS]
		local event_data = event[MP_EVENT_DATA]
		local map_section = nil

		if event_data then
			local gizmo_unit = event_data.gizmo_unit

			if gizmo_unit then
				map_section = Unit.get_data(gizmo_unit, "map_section")
			end

			event_data.optional_pos = pos
			event_data.map_section = map_section
		end

		TerrorEventMixer.start_event(event_name, event_data)

		id = id + 1
		event = events[id]

		if event then
			self.current_main_path_event_id = id
			self.current_main_path_event_activation_dist = event[MP_TRAVEL_DIST]
		else
			self.current_main_path_event_id = nil
		end
	end

	return 
end
EnemyRecycler.spawn_interest_point = function (self, unit_name, position, do_spawn, angle, pack_type, zone_data)
	local extension_init_data = {
		ai_interest_point_system = {
			recycler = true,
			do_spawn = do_spawn,
			pack_type = pack_type,
			zone_data = zone_data
		}
	}
	local rot = Quaternion(Vector3.up(), angle)
	local unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "interest_point", extension_init_data, position.unbox(position), rot)

	assert(unit, "Bad interest point, not found")

	return unit
end
EnemyRecycler.add_breed = function (self, breed_name, boxed_pos, boxed_rot)
	self.unique_area_id = self.unique_area_id + 1
	local unit_data = {
		[2] = breed_name,
		[3] = boxed_pos,
		[4] = boxed_rot
	}
	local unit_list = {
		unit_data
	}
	local zone = self.group_manager:get_group_from_position(boxed_pos.unbox(boxed_pos))
	self.areas[#self.areas + 1] = {
		boxed_pos,
		unit_list,
		0,
		0,
		false,
		zone,
		"breed",
		self.unique_area_id
	}

	return 
end
EnemyRecycler.activate_area = function (self, area, threat_population)
	local INDEX_UNITLIST = 2
	local INDEX_TYPE = 7
	local units_in_area = area[2]
	local area_type = area[INDEX_TYPE]

	if not units_in_area then
		if area_type == "pack" then
			if threat_population == 0 then
				return true
			else
				local unit_name = area[AREA_PACK_SIZE_OR_EVENT_NAME]
				local pack_type = area[AREA_PACK_TYPE]
				local zone_data = area[ZONE_DATA]
				local position = area[1]
				local do_spawn_yes = true
				local interest_point_unit = self.spawn_interest_point(self, unit_name, position, do_spawn_yes, area[AREA_ROTATION], pack_type, zone_data)
				local units_in_area = {
					{
						interest_point_unit,
						unit_name,
						position
					}
				}
				area[INDEX_UNITLIST] = units_in_area
			end
		elseif area_type == "event" then
			local boxed_pos = area[1]
			local event_data = area[8]
			local event_name = area[AREA_PACK_SIZE_OR_EVENT_NAME]
			local event_data = area[AREA_ROTATION]

			if not event_data then
				local data = {
					optional_pos = boxed_pos
				}
			end

			TerrorEventMixer.start_event(event_name, data)

			return true
		end
	elseif area_type == "pack" then
		local interest_point_unit = units_in_area[1][1]
		local interest_point_unit_name = units_in_area[1][2]
		local interest_point_position = units_in_area[1][3]

		assert(interest_point_unit == nil, "lolwut")

		local do_spawn_no = false
		interest_point_unit = self.spawn_interest_point(self, interest_point_unit_name, interest_point_position, do_spawn_no, area[AREA_ROTATION])
		units_in_area[1][1] = interest_point_unit

		for i = 2, #units_in_area, 1 do
			local unit_data = units_in_area[i]
			local breed_name = unit_data[U_BREED_NAME]
			local spawn_pos = unit_data[U_POSITION]
			local spawn_rot = unit_data[U_ROTATION]
			local optional_data = unit_data[U_OPTIONAL_DATA]
			local breed = Breeds[breed_name]
			local spawn_category = "enemy_recycler"
			local spawn_type = "roam"
			local id = self.conflict_director:spawn_queued_unit(breed, spawn_pos, spawn_rot, spawn_category, nil, spawn_type, optional_data, nil, unit_data)
			unit_data[U_UNIT] = id
			self._roaming_ai = self._roaming_ai + 1
		end
	elseif area_type == "breed" then
		local unit_data = units_in_area[1]
		local breed_name = unit_data[U_BREED_NAME]
		local spawn_pos = unit_data[U_POSITION]
		local spawn_rot = unit_data[U_ROTATION]
		local optional_data = unit_data[U_OPTIONAL_DATA]
		local breed = Breeds[breed_name]
		local spawn_category = "enemy_recycler"
		local spawn_type = "roam"
		local id = self.conflict_director:spawn_queued_unit(breed, spawn_pos, spawn_rot, spawn_category, nil, spawn_type, optional_data, nil, unit_data)
		unit_data[U_UNIT] = id
		self._roaming_ai = self._roaming_ai + 1
	end

	return false
end
local REFREEZE_DISTANCE_SQUARED = 25
EnemyRecycler.deactivate_area = function (self, area)
	local INDEX_TYPE = 7
	local units_in_area = area[2]
	local area_type = area[INDEX_TYPE]
	local BLACKBOARDS = BLACKBOARDS

	if area_type == "pack" then
		if units_in_area then
			local interest_point_unit = units_in_area[1][1]
			local extension = ScriptUnit.extension(interest_point_unit, "ai_interest_point_system")
			local points = extension.points
			local points_n = extension.points_n
			local units_in_area_n = 1
			local sleepy = nil

			for i = 2, #units_in_area, 1 do
				local unit_data = units_in_area[i]
				local queue_id = unit_data[1]

				if type(queue_id) == "number" then
					local d = self.conflict_director:remove_queued_unit(queue_id)
					self._roaming_ai = self._roaming_ai - 1
					units_in_area_n = units_in_area_n + 1
					units_in_area[units_in_area_n] = {
						[2] = d[1].name,
						[3] = d[2],
						[4] = d[3],
						[5] = d[7]
					}
					sleepy = true
				elseif Unit.alive(queue_id) then
					local unit = queue_id
					local blackboard = BLACKBOARDS[unit]

					if not blackboard.target_unit_found_time then
						local position = position_lookup[unit]

						if blackboard.next_smart_object_data.next_smart_object_id ~= nil then
							position = blackboard.next_smart_object_data.entrance_pos:unbox()
						end

						units_in_area_n = units_in_area_n + 1
						units_in_area[units_in_area_n] = {
							[2] = Unit.get_data(unit, "breed").name,
							[3] = Vector3Box(position),
							[4] = QuaternionBox(Unit.local_rotation(unit, 0)),
							[5] = blackboard.optional_spawn_data
						}

						self.conflict_director:destroy_unit(unit, blackboard, "deactivate_area")

						self._roaming_ai = self._roaming_ai - 1
					end

					sleepy = true
				end
			end

			if not sleepy then
				for i = 1, points_n, 1 do
					local point = points[i]

					if type(point[1]) == "number" then
						local d = self.conflict_director:remove_queued_unit(point[1])
						self._roaming_ai = self._roaming_ai - 1
						units_in_area_n = units_in_area_n + 1
						units_in_area[units_in_area_n] = {
							[2] = d[1].name,
							[3] = d[2],
							[4] = d[3],
							[5] = d[7]
						}
					end

					claim_unit = point.claim_unit or (type(point[1]) ~= "number" and point[1])

					if claim_unit and unit_alive(claim_unit) then
						local blackboard = BLACKBOARDS[claim_unit]

						if not blackboard.target_unit_found_time then
							local position = position_lookup[claim_unit]

							if blackboard.next_smart_object_data.next_smart_object_id ~= nil then
								position = blackboard.next_smart_object_data.entrance_pos:unbox()
							end

							units_in_area_n = units_in_area_n + 1
							units_in_area[units_in_area_n] = {
								[2] = Unit.get_data(claim_unit, "breed").name,
								[3] = Vector3Box(position),
								[4] = QuaternionBox(Unit.local_rotation(claim_unit, 0)),
								[5] = blackboard.optional_spawn_data
							}

							self.conflict_director:destroy_unit(claim_unit, blackboard, "deactivate_area")

							self._roaming_ai = self._roaming_ai - 1
						end
					end
				end
			end

			for i = units_in_area_n + 1, #units_in_area, 1 do
				assert(i ~= 1)

				units_in_area[i] = nil
			end

			Managers.state.unit_spawner:mark_for_deletion(interest_point_unit)

			units_in_area[1][1] = nil

			if units_in_area_n == 1 then
				return false
			end
		end
	elseif area_type == "breed" then
		local unit_data = units_in_area[1]
		local unit = unit_data[U_UNIT]

		if type(unit) == "number" then
			self.conflict_director:remove_queued_unit(unit)

			self._roaming_ai = self._roaming_ai - 1

			return true
		end

		local alive = unit_alive(unit) and ScriptUnit.extension(unit, "health_system"):is_alive()
		local sleep_unit = false
		local blackboard = nil

		if alive then
			blackboard = BLACKBOARDS[unit]

			if not blackboard.target_unit_found_time then
				local position = position_lookup[unit]

				if blackboard.next_smart_object_data.next_smart_object_id ~= nil then
					position = blackboard.next_smart_object_data.entrance_pos:unbox()
				end

				unit_data[U_POSITION] = Vector3Box(position)
				unit_data[U_ROTATION] = QuaternionBox(Unit.local_rotation(unit, 0))
				unit_data[U_BREED_NAME] = blackboard.breed.name
				sleep_unit = true
			end
		end

		if sleep_unit then
			self.conflict_director:destroy_unit(unit, blackboard, "deactivate_area")

			self._roaming_ai = self._roaming_ai - 1
		else
			return false
		end
	end

	return true
end
local area_checks_per_frame = 20
local remove_zones = {}
EnemyRecycler._update_roaming_spawning = function (self, t, player_positions, threat_population, player_zones, use_player_zones)
	Profiler.start("recycler - pack spawning")

	local INDEX_SEEN = 3
	local INDEX_SEEN_LAST_FRAME = 4
	local INDEX_ZONE = 6
	local roaming = CurrentRoamingSettings
	local astar_checks = 0
	local astar_cached_checks = 0
	local wakeup_distance = roaming.despawn_distance
	local wakeup_distance_z = roaming.despawn_distance_z or 30
	local sleep_distance = wakeup_distance + 5
	local math_abs = math.abs
	local areas = self.areas
	local shutdown_areas = self.shutdown_areas
	local players = #player_positions
	local path_distance_threshold = CurrentRoamingSettings.despawn_path_distance
	local index = self.remembered_area_index or 1
	local size = #areas
	local checks = area_checks_per_frame

	if size < checks then
		checks = size
		index = 1
	end

	local num_to_remove = 0
	local add_visible = 0
	local start_index = index
	local i = 1

	while i <= checks do
		if size < index then
			index = 1
		end

		local area = areas[index]
		area[INDEX_SEEN_LAST_FRAME] = area[INDEX_SEEN]
		area[INDEX_SEEN] = 0
		local pos = area[1]:unbox()

		for j = 1, players, 1 do
			local to_dir = pos - player_positions[j]
			local h = to_dir.z

			Vector3.set_z(to_dir, 0)

			local dist = Vector3.length(to_dir)

			if dist < wakeup_distance and math_abs(h) < wakeup_distance_z then
				local zone = player_zones[j]

				if use_player_zones and zone and area[INDEX_ZONE] then
					local _, path_dist, cached = self.group_manager:a_star_cached(zone, area[INDEX_ZONE])
					astar_checks = astar_checks + ((not cached or 0) and 1)
					astar_cached_checks = astar_cached_checks + ((cached and 1) or 0)

					if not path_dist or path_dist < path_distance_threshold then
						area[INDEX_SEEN] = area[INDEX_SEEN] + 1
					end
				else
					area[INDEX_SEEN] = area[INDEX_SEEN] + 1
				end
			end
		end

		local s1 = area[INDEX_SEEN]
		local s2 = area[INDEX_SEEN_LAST_FRAME]

		if s1 ~= s2 then
			if 0 < s1 then
				if s2 == 0 then
					local shutdown_area = self.activate_area(self, area, threat_population)

					if shutdown_area then
						num_to_remove = num_to_remove + 1
						remove_zones[num_to_remove] = index
					else
						add_visible = add_visible + 1
						self.inside_areas[area] = true
					end
				end
			elseif 0 < s2 then
				if not self.deactivate_area(self, area) then
					num_to_remove = num_to_remove + 1
					remove_zones[num_to_remove] = index
				end

				add_visible = add_visible - 1
			end
		end

		index = index + 1
		i = i + 1
	end

	if 0 < num_to_remove then
		local function sort_func(a, b)
			return b < a
		end

		table.sort(remove_zones, sort_func)

		for i = 1, num_to_remove, 1 do
			shutdown_areas[#shutdown_areas + 1] = fast_array_remove(areas, remove_zones[i])
			remove_zones[i] = nil
		end
	end

	self.remembered_area_index = math.clamp(index - num_to_remove, 1, #areas)
	self.visible = self.visible + add_visible

	if script_data.debug_ai_recycler then
		Debug.text("Recycler a-star checks/frame cached:" .. tostring(astar_cached_checks) .. " real:" .. tostring(astar_checks))
	end

	Profiler.stop("recycler - pack spawning")

	return 
end
EnemyRecycler.add_terror_event_in_area = function (self, boxed_pos, terror_event_name, event_data)
	local nav_group = self.group_manager:get_group_from_position(boxed_pos.unbox(boxed_pos))
	self.areas[#self.areas + 1] = {
		boxed_pos,
		nil,
		0,
		0,
		terror_event_name,
		nav_group,
		"event",
		event_data or false
	}

	return 
end
EnemyRecycler.add_main_path_terror_event = function (self, boxed_pos, terror_event_name, activation_dist, event_data)
	print("Adding main path event:", boxed_pos, terror_event_name, activation_dist, event_data)

	local main_path_events = self.main_path_events
	local path_pos, travel_dist, move_percent, path_index, sub_index = MainPathUtils.closest_pos_at_main_path(nil, boxed_pos.unbox(boxed_pos))
	travel_dist = math.max(0, travel_dist - (activation_dist or 45))

	if script_data.debug_ai_recycler then
		local trigger_pos = MainPathUtils.point_on_mainpath(nil, travel_dist)

		QuickDrawerStay:sphere(trigger_pos + Vector3(0, 0, 2), 1, Color(255, 0, 0))
	end

	local num_events = #main_path_events
	main_path_events[num_events + 1] = {
		travel_dist,
		boxed_pos,
		terror_event_name,
		event_data
	}

	if #main_path_events == 1 then
		self.current_main_path_event_id = 1
		self.current_main_path_event_activation_dist = travel_dist
	end

	table.sort(main_path_events, function (a, b)
		return a[1] < b[1]
	end)

	return 
end
EnemyRecycler.draw_main_path_events = function (self, drawer)
	local events = self.main_path_events

	for i = 1, #events, 1 do
		local main_event_data = events[i]
		local event_data = main_event_data[4]
		local event_kind = event_data.event_kind

		if event_kind == "event_spline_patrol" then
			self.conflict_director.patrol_analysis:draw_spline_path(event_data.spline_way_points, QuickDrawerStay)
		end
	end

	return 
end
EnemyRecycler.draw_debug = function (self, player_positions)
	Profiler.start("recycler - debug")

	local shutdown = self.shutdown_areas
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "ai_recycler"
	})
	local inside_color = Color(255, 140, 255, 200)
	local outside_color = Color(255, 255, 40, 100)
	local shutdown_color = Color(128, 30, 40, 230)
	local yellow = Color(255, 255, 200, 0)
	local roaming_color = Color(255, 0, 200, 100)
	local cone_height = Vector3(0, 0, 12)
	local cone_height2 = Vector3(0, 0, 9.5)
	local cone_height3 = Vector3(0, 0, 8.5)
	local roaming = CurrentRoamingSettings
	local pos = player_positions[1]

	if not pos then
		return 
	end

	local z_dist = roaming.despawn_distance_z
	local r = roaming.despawn_distance

	drawer.cylinder(drawer, pos + Vector3(0, 0, -z_dist), pos + Vector3(0, 0, z_dist), r, inside_color, 8)
	drawer.cylinder(drawer, pos + Vector3(0, 0, -z_dist), pos + Vector3(0, 0, z_dist), r, inside_color, 8)
	drawer.line(drawer, pos + Vector3(r, 0, -z_dist), pos + Vector3(-r, 0, -z_dist), inside_color, 8)
	drawer.line(drawer, pos + Vector3(0, r, -z_dist), pos + Vector3(0, -r, -z_dist), inside_color, 8)
	drawer.line(drawer, pos + Vector3(r, 0, z_dist), pos + Vector3(-r, 0, z_dist), inside_color, 8)
	drawer.line(drawer, pos + Vector3(0, r, z_dist), pos + Vector3(0, -r, z_dist), inside_color, 8)

	local areas = self.areas
	local visible = self.visible
	local not_visible = #areas - visible

	Debug.text("Areas: " .. #areas .. ", visible: " .. visible .. ", not visible: " .. not_visible)

	local s = ""
	local t = ""

	for i = 1, #areas, 1 do
		local area = areas[i]
		local pos = area[1]:unbox()
		local seen = area[3]

		if area[7] == "event" then
			if area[5] == "roaming_patrol" then
				drawer.sphere(drawer, pos + cone_height, 0.7, roaming_color)
				drawer.sphere(drawer, pos + cone_height2, 0.7, roaming_color)
				drawer.sphere(drawer, pos + cone_height3, 0.7, roaming_color)
			else
				drawer.sphere(drawer, pos + cone_height, 2, yellow)
				drawer.sphere(drawer, pos + cone_height2, 1, yellow)
				drawer.sphere(drawer, pos + cone_height3, 0.5, yellow)
			end
		end

		if 0 < seen then
			t = t .. " I " .. i .. "= " .. seen

			drawer.line(drawer, pos, pos + cone_height, inside_color)
		else
			s = s .. " I " .. i .. "= " .. seen

			drawer.line(drawer, pos, pos + cone_height, outside_color)
		end
	end

	for i = 1, #shutdown, 1 do
		local pos = shutdown[i][1]:unbox()

		drawer.line(drawer, pos, pos + cone_height, shutdown_color)
	end

	local local_player_unit = Managers.player:local_player().player_unit

	if Unit.alive(local_player_unit) then
		local main_path_player_info = self.conflict_director.main_path_player_info
		local info = main_path_player_info[local_player_unit]

		if info then
			Debug.text("travel-dist: %.1fm, move_percent: %.1f%%, path-index: %d, sub-index: %d", info.travel_dist, info.move_percent*100, info.path_index, info.sub_index)
		end
	end

	Profiler.stop("recycler - debug")

	return 
end
local NUM_FAR_OFF_CHECKS = 6
EnemyRecycler.far_off_despawn = function (self, t, dt, player_positions, spawned)
	Profiler.start("recycler  far off despawn")

	local index = self.far_off_index or 1
	local size = #spawned
	local num = NUM_FAR_OFF_CHECKS

	if size < num then
		num = size
		index = 1
	end

	local destroy_los_distance_squared = LevelHelper:current_level_settings().destroy_los_distance_squared or RecycleSettings.destroy_los_distance_squared
	local nav_world = self.nav_world
	local num_players = #player_positions

	if num_players == 0 then
		return 
	end

	local i = 1

	while i <= num do
		if size < index then
			index = 1
		end

		local destroy_distance_squared = destroy_los_distance_squared
		local ai_stuck = false
		local unit = spawned[index]
		local pos = position_lookup[unit]
		local ai_extension = ScriptUnit.has_extension(unit, "ai_system")
		local blackboard = ai_extension._blackboard

		if blackboard.stuck_check_time < t then
			if not blackboard.far_off_despawn_immunity then
				local navigation_extension = blackboard.navigation_extension

				if navigation_extension._enabled then
					local distance_squared = Vector3.distance_squared(navigation_extension.destination(navigation_extension), pos)

					if 5 < distance_squared then
						local velocity = ScriptUnit.extension(unit, "locomotion_system"):current_velocity()

						if Vector3.distance_squared(velocity, Vector3.zero()) == 0 then
							ai_stuck = true
							destroy_distance_squared = RecycleSettings.destroy_stuck_distance_squared
						end
					end
				end
			end

			blackboard.stuck_check_time = t + 3 + i*dt
		end

		local num_players_far_away = 0

		for j = 1, num_players, 1 do
			local player_pos = player_positions[j]
			local dist_squared = Vector3.distance_squared(pos, player_pos)

			if destroy_distance_squared < dist_squared then
				num_players_far_away = num_players_far_away + 1
			end
		end

		if num_players_far_away == num_players then
			if ai_stuck then
				print("Destroying unit - ai got stuck", blackboard.breed.name, i, index, size)
				self.conflict_director:destroy_unit(unit, blackboard, "stuck")
			elseif not blackboard.far_off_despawn_immunity then
				print("Destroying unit - ai too far away from all players. ", blackboard.breed.name, i, index, size)
				self.conflict_director:destroy_unit(unit, blackboard, "far_away")
			end

			size = #spawned

			if size == 0 then
				break
			end
		end

		index = index + 1
		i = i + 1
	end

	self.far_off_index = index

	Profiler.stop("recycler  far off despawn")

	return 
end

return 
