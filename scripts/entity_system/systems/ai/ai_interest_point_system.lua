-- chunkname: @scripts/entity_system/systems/ai/ai_interest_point_system.lua

local broadphase_radius = 20
local broadphase_num_objects = 128
local script_data = script_data

AIInterestPointSystem = class(AIInterestPointSystem, ExtensionSystemBase)

local extensions = {
	"AIInterestPointExtension",
	"AIInterestPointHuskExtension",
}
local broadphase_race_filters = {
	skaven = {
		"skaven",
	},
	human = {
		"human",
	},
	all = {
		"skaven",
		"human",
	},
}

local function ipprintf(...)
	if script_data.ai_interest_point_debug then
		printf(...)
	end
end

AIInterestPointSystem.init = function (self, context, name)
	AIInterestPointSystem.super.init(self, context, name, extensions)

	self.wwise_world = Managers.world:wwise_world(self.world)
	self.network_manager = context.network_manager
	self.is_server = context.is_server
	self.network_transmit = context.network_transmit
	self.system_api = context.system_api
	self.system_api[name] = {
		start_async_claim_request = function (claim_unit, position, min_range, max_range, current_request_id)
			return self:api_start_async_claim_request(claim_unit, position, min_range, max_range, current_request_id)
		end,
		get_claim = function (request_id)
			return self:api_get_claim(request_id)
		end,
		release_claim = function (request_id)
			return self:api_release_claim(request_id)
		end,
	}
	self.requests = {}
	self.current_request_index = 0
	self.last_request_index = 0
	self.interest_points = {}
	self.interest_points_to_spawn = {}
	self.reachable_interest_points = {}

	local ai_system = Managers.state.entity:system("ai_system")
	local nav_world = ai_system:nav_world()

	self.nav_world = nav_world
	self.astar = GwNavAStar.create(nav_world)
	self.processing_astar = false

	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()
	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()
	local layer_costs = {
		jumps = 1,
		ledges = 1,
		ledges_with_fence = 1,
	}

	table.merge(layer_costs, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, layer_costs)

	self.navtag_layer_cost_table = navtag_layer_cost_table

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	self.nav_cost_map_cost_table = nav_cost_map_cost_table

	local traverse_logic = GwNavTraverseLogic.create(nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, navtag_layer_cost_table)

	self.traverse_logic = traverse_logic
	self.broadphase_radius = broadphase_radius
	self.broadphase = Broadphase(self.broadphase_radius, broadphase_num_objects, broadphase_race_filters.all)

	local network_event_delegate = context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_interest_point_chatter_update")

	local level_seed = Managers.mechanism:get_level_seed()

	self._seed = level_seed

	print("[AIInterestPointSystem] Level Seed: ", level_seed)

	self.current_obsolete_request = nil
end

AIInterestPointSystem._random = function (self, ...)
	local seed, value = Math.next_random(self._seed, ...)

	self._seed = seed

	return value
end

AIInterestPointSystem.set_seed = function (self, seed)
	fassert(seed and type(seed) == "number", "Bad seed input!")

	self._seed = seed
end

AIInterestPointSystem.destroy = function (self)
	local clear_table = table.clear

	self.system_api[self.name] = nil
	self.system_api = nil

	for key, value in pairs(self.requests) do
		clear_table(value.failed_interest_points)

		self.requests[key] = nil
	end

	clear_table(self.interest_points_to_spawn)
	clear_table(self.interest_points)

	local traverse_logic = self.traverse_logic

	GwNavTagLayerCostTable.destroy(self.navtag_layer_cost_table)
	GwNavCostMap.destroy_tag_cost_table(self.nav_cost_map_cost_table)
	GwNavTraverseLogic.destroy(traverse_logic)

	local astar = self.astar

	if not GwNavAStar.processing_finished(astar) then
		GwNavAStar.cancel(astar)
	end

	GwNavAStar.destroy(astar)
	table.for_each(self.reachable_interest_points, clear_table)
	self.network_event_delegate:unregister(self)
end

local dummy_input = {}

AIInterestPointSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}
	local _, is_level_unit = self.network_manager:game_object_or_level_id(unit)

	if not extension_init_data.recycler and is_level_unit and not script_data.ai_dont_randomize_interest_points then
		local random_float = self:_random()

		if random_float < InterestPointSettings.interest_point_spawn_chance then
			if script_data.ai_interest_point_debug then
				local pos = Unit.local_position(unit, 0)

				QuickDrawerStay:line(pos, pos + Vector3(0, 0, 4), Color(255, 0, 0))
			end

			ScriptUnit.set_extension(unit, self.name, extension, dummy_input)

			return extension
		end
	end

	ScriptUnit.set_extension(unit, self.name, extension, dummy_input)

	if extension_name == "AIInterestPointExtension" then
		local enabled = Unit.get_data(unit, "interest_point", "enabled")

		if enabled then
			local anim_lookup = NetworkLookup.interest_point_anims
			local anim_lookup_n = #anim_lookup
			local nav_world = self.nav_world
			local unit_position = Unit.local_position(unit, 0)

			self.interest_points[unit] = extension

			if script_data.ai_interest_point_debug then
				QuickDrawerStay:line(unit_position, unit_position + Vector3(0, 0, 4), Color(255, 255, 0))
			end

			extension.wwise_event = Unit.get_data(unit, "interest_point", "wwise_event") or "enemy_skaven_idle_chatter"
			extension.wwise_minimum_needed = Unit.get_data(unit, "interest_point", "wwise_minimum_needed") or 2

			local filter_string = Unit.get_data(unit, "interest_point", "race_filter")

			if filter_string then
				fassert(broadphase_race_filters[filter_string], "Badly named race filter '%s' for interest-point. See 'broadphase_race_filters' ", filter_string)
			else
				filter_string = "skaven"
			end

			extension.race_filter = broadphase_race_filters[filter_string]

			local num_valid_to_spawn = 0

			extension.num_claimed_points = 0
			extension.points = {}
			extension.duration = Unit.get_data(unit, "interest_point", "duration")

			local point_i = 0

			while Unit.has_data(unit, "interest_point", "points", point_i) do
				local node_name = Unit.get_data(unit, "interest_point", "points", point_i, "node")
				local node = Unit.node(unit, node_name)
				local point_position = Unit.world_position(unit, node)
				local point_rotation = Unit.world_rotation(unit, node)
				local animations = {}
				local anim_i = 0
				local x, y, z = point_position.x, point_position.y, point_position.z
				local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, point_position, 0.3, 0.3)

				if is_position_on_navmesh then
					z = altitude

					for i = 1, anim_lookup_n do
						local anim_name = anim_lookup[i]
						local anim_enabled = Unit.get_data(unit, "interest_point", "points", point_i, "animation_map", anim_name)

						if anim_enabled then
							fassert(anim_name ~= nil, "No animation name in interest point unit %q for point %d", tostring(unit), point_i)

							anim_i = anim_i + 1
							animations[anim_i] = anim_name
						end
					end

					num_valid_to_spawn = num_valid_to_spawn + 1
				end

				local point = {
					position = {
						x,
						y,
						z,
					},
					animations = animations,
					animations_n = anim_i,
					is_position_on_navmesh = is_position_on_navmesh,
					rotation = QuaternionBox(point_rotation),
				}

				fassert(not is_position_on_navmesh or point.animations_n > 0, "There is an interest point %q (point index=%d, node name=%s) on the level with no valid animations at position=%s", tostring(unit), point_i + 1, node_name, tostring(point_position))

				extension.points[point_i + 1] = point
				point_i = point_i + 1
			end

			local radius = 4

			extension.broadphase_id = Broadphase.add(self.broadphase, unit, unit_position, radius, extension.race_filter)
			extension.num_valid_to_spawn = num_valid_to_spawn

			if num_valid_to_spawn == 0 then
				extension.points_n = 0
			else
				extension.points_n = point_i
				extension.pack_members = extension_init_data.pack_members
				extension.zone_data = extension_init_data.zone_data

				if extension_init_data.do_spawn then
					self.interest_points_to_spawn[unit] = extension
				end
			end
		end
	elseif extension_name == "AIInterestPointHuskExtension" then
		local enabled = Unit.get_data(unit, "interest_point", "enabled")

		if enabled then
			if script_data.ai_interest_point_debug then
				local unit_position = Unit.local_position(unit, 0)

				QuickDrawerStay:line(unit_position, unit_position + Vector3(0, 0, 4), Color(255, 255, 0))
			end

			self.interest_points[unit] = extension
			extension.wwise_event = Unit.get_data(unit, "interest_point", "sound_event") or "enemy_skaven_idle_chatter"
		end
	end

	return extension
end

AIInterestPointSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	local extension = self.interest_points[unit]

	if not extension then
		return
	end

	if unit == self.processing_best_ip_unit then
		self.processing_astar = false
		self.processing_best_point = nil
		self.processing_best_ip_unit = nil
		self.processing_best_point_extension = nil

		local astar = self.astar

		if not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
		end
	end

	if extension.broadphase_id ~= nil then
		Broadphase.remove(self.broadphase, extension.broadphase_id)
	end

	self.interest_points[unit] = nil

	if extension.wwise_playing_id then
		WwiseWorld.stop_event(self.wwise_world, extension.wwise_playing_id)
		WwiseWorld.destroy_manual_source(self.wwise_world, extension.wwise_source_id)
	end
end

AIInterestPointSystem.update = function (self, context, t)
	if self.is_server then
		self:debug_draw(t, context.dt)
		self:spawn_interest_points()
		self:release_obsolete_requests(t)
		self:resolve_requests()
	end

	local dt = context.dt

	if not script_data.navigation_thread_disabled then
		GwNavWorld.kick_async_update(self.nav_world, dt)

		NAVIGATION_RUNNING_IN_THREAD = true
	else
		GwNavWorld.update(self.nav_world, dt)
	end
end

AIInterestPointSystem.breed_spawned_callback = function (ai_unit, breed, optional_data)
	local point = optional_data.dead_breed_data

	BREED_DIE_LOOKUP[ai_unit] = {
		AIInterestPointSystem.cleanup_dead_breed,
		point,
	}
end

AIInterestPointSystem.cleanup_dead_breed = function (ai_unit, point)
	point[1] = false
end

local spawned_interest_points = {}
local spawned_interest_points_n = 0

AIInterestPointSystem.spawn_interest_points = function (self)
	local conflict = Managers.state.conflict
	local num_to_spawn = 8
	local interest_points_to_spawn = self.interest_points_to_spawn
	local interest_point_unit = next(interest_points_to_spawn)
	local breed_override_lookup = self._breed_override_lookup

	while num_to_spawn > 0 and interest_point_unit ~= nil do
		local point_extension = interest_points_to_spawn[interest_point_unit]
		local members = point_extension.pack_members
		local points_n = point_extension.points_n

		for i = 1, points_n do
			local point = point_extension.points[i]

			if point.is_position_on_navmesh then
				local breed = members[i]
				local optional_data = {
					ignore_event_counter = true,
				}
				local spawn_category = "enemy_recycler"
				local spawn_animation
				local spawn_type = "roam"
				local group_data
				local spawn_position = Vector3Aux.unbox(point.position)

				if breed_override_lookup and breed_override_lookup[breed.name] then
					breed = Breeds[breed_override_lookup[breed.name]]
				end

				local id = conflict:spawn_queued_unit(breed, Vector3Box(spawn_position), point.rotation, spawn_category, spawn_animation, spawn_type, optional_data, group_data, point)

				point[1] = id
			else
				print("FAIL INTEREST POINT SPAWN UNIT")
			end
		end

		spawned_interest_points_n = spawned_interest_points_n + 1
		spawned_interest_points[spawned_interest_points_n] = interest_point_unit
		num_to_spawn = num_to_spawn - 1
		interest_point_unit = next(interest_points_to_spawn, interest_point_unit)
	end

	for i = 1, spawned_interest_points_n do
		local unit = spawned_interest_points[i]

		interest_points_to_spawn[unit] = nil
	end

	spawned_interest_points_n = 0
end

AIInterestPointSystem.release_obsolete_requests = function (self, t)
	if self.requests[self.current_obsolete_request] == nil then
		self.current_obsolete_request = nil
	end

	local request_id = next(self.requests, self.current_obsolete_request)

	if request_id == nil then
		self.current_obsolete_request = nil

		return
	end

	local release_claim = false
	local request = self.requests[request_id]
	local claim_unit = request.claim_unit
	local blackboard = BLACKBOARDS[claim_unit]

	release_claim = not HEALTH_ALIVE[claim_unit] and true or blackboard.confirmed_player_sighting

	if release_claim then
		self.current_obsolete_request = nil

		self:api_release_claim(request_id)

		if blackboard then
			blackboard.ip_request_id = nil
		end
	else
		self.current_obsolete_request = request_id
	end
end

local function _get_next_request(requests, start_i, end_i)
	local request, request_index

	for r_i = start_i, end_i do
		request = requests[r_i]

		if request ~= nil then
			request_index = r_i

			break
		end
	end

	return request, request_index
end

AIInterestPointSystem._update_astar_result = function (self, current_request_point_unit, request, best_unit, astar)
	self.processing_astar = false
	self.processing_best_point = nil
	self.processing_best_ip_unit = nil
	self.processing_best_point_extension = nil

	local path_found = GwNavAStar.path_found(astar)

	if not path_found then
		request.failed_interest_points[best_unit] = true
	end

	if current_request_point_unit then
		if not self.reachable_interest_points[current_request_point_unit] then
			self.reachable_interest_points[current_request_point_unit] = {}
		end

		self.reachable_interest_points[current_request_point_unit][best_unit] = path_found
	end

	return path_found
end

local interest_points_result = {}

local function _get_best_interest_point(broadphase, request, claim_unit_position, current_request_point_unit, reachable_interest_points)
	local ScriptUnit_Extension = ScriptUnit.extension
	local path_found, perform_astar, best_unit, best_point, best_point_extension
	local min_range_sq = request.min_range * request.min_range
	local max_range_sq = request.max_range * request.max_range
	local request_position = Vector3Aux.unbox(request.position)
	local min_dist_sq = math.huge
	local blackboard = BLACKBOARDS[request.claim_unit]
	local filter = broadphase_race_filters[blackboard.breed.race]
	local interest_points_result_n = Broadphase.query(broadphase, request_position, request.max_range, interest_points_result, filter)

	for bp_i = 1, interest_points_result_n do
		local point_unit = interest_points_result[bp_i]
		local point_extension = ScriptUnit_Extension(point_unit, "ai_interest_point_system")
		local current_request_extension = request.current_request and request.current_request.point_extension
		local stored_reachable_result = current_request_point_unit and reachable_interest_points[current_request_point_unit] and reachable_interest_points[current_request_point_unit][point_unit]

		if current_request_point_unit and stored_reachable_result == nil then
			stored_reachable_result = reachable_interest_points[point_unit] and reachable_interest_points[point_unit][current_request_point_unit]
		end

		local point_unit_is_reachable

		if stored_reachable_result == nil then
			local is_failed_interest_point = request.failed_interest_points[point_unit]

			point_unit_is_reachable = is_failed_interest_point and not is_failed_interest_point
		else
			point_unit_is_reachable = stored_reachable_result
		end

		if current_request_extension ~= point_extension and (point_unit_is_reachable or point_unit_is_reachable == nil) then
			for p_i = 1, point_extension.points_n do
				local point = point_extension.points[p_i]

				if not point.claimed and point.is_position_on_navmesh and point_extension then
					local point_position = Vector3Aux.unbox(point.position)
					local dist_sq = Vector3.distance_squared(point_position, claim_unit_position)

					if min_range_sq <= dist_sq and dist_sq < max_range_sq and dist_sq < min_dist_sq then
						best_unit = point_unit
						best_point = point
						best_point_extension = point_extension
						min_dist_sq = dist_sq
						perform_astar = not point_unit_is_reachable
						path_found = not perform_astar
					end
				end
			end
		end
	end

	return best_unit, best_point, best_point_extension, path_found, perform_astar
end

local INTEREST_POINT_ASTAR_BOX_EXTENTS = 15

AIInterestPointSystem._start_astar_query = function (self, astar, start_position, end_position, nav_world, traverse_logic, best_unit, best_point, best_point_extension)
	GwNavAStar.start_with_propagation_box(astar, nav_world, start_position, end_position, INTEREST_POINT_ASTAR_BOX_EXTENTS, traverse_logic)

	self.processing_astar = true
	self.processing_best_ip_unit = best_unit
	self.processing_best_point = best_point
	self.processing_best_point_extension = best_point_extension
end

local function _check_and_update_request_result(request, best_unit, best_point, best_point_extension, path_found, network_manager, network_transmit)
	if best_point == nil then
		request.result = "failed"
		request.current_request = nil

		return true
	elseif path_found then
		best_point_extension.num_claimed_points = best_point_extension.num_claimed_points + 1
		best_point.claimed = true
		best_point.claim_unit = request.claim_unit
		request.interest_point_unit = best_unit
		request.point = best_point
		request.point_extension = best_point_extension
		request.result = "success"
		request.current_request = nil

		local chatter_number = best_point_extension.num_claimed_points / best_point_extension.points_n

		if best_point_extension.wwise_minimum_needed > best_point_extension.num_claimed_points then
			chatter_number = 0
		end

		local go_id, is_level_unit = network_manager:game_object_or_level_id(best_unit)

		network_transmit:send_rpc_all("rpc_interest_point_chatter_update", go_id, is_level_unit, chatter_number)

		return true
	else
		return false
	end
end

AIInterestPointSystem.resolve_requests = function (self)
	if next(self.interest_points_to_spawn) ~= nil then
		return
	end

	local request, request_index = _get_next_request(self.requests, self.current_request_index, self.last_request_index)

	if request ~= nil then
		self.current_request_index = request_index

		local astar = self.astar
		local processing_astar = self.processing_astar
		local path_check_done, path_found = false, false
		local best_unit, best_point, best_point_extension
		local current_request_point_unit = request.current_request and request.current_request.interest_point_unit

		if not processing_astar then
			local perform_astar = false
			local claim_unit = request.claim_unit
			local claim_unit_position = POSITION_LOOKUP[claim_unit]

			if claim_unit_position then
				best_unit, best_point, best_point_extension, path_found, perform_astar = _get_best_interest_point(self.broadphase, request, claim_unit_position, current_request_point_unit, self.reachable_interest_points)

				if best_point and perform_astar then
					local start_position = claim_unit_position
					local end_position = Vector3Aux.unbox(best_point.position)

					self:_start_astar_query(astar, start_position, end_position, self.nav_world, self.traverse_logic, best_unit, best_point, best_point_extension)

					path_check_done = false
				else
					path_check_done = true
				end
			else
				path_check_done = true
			end
		elseif GwNavAStar.processing_finished(astar) then
			best_unit = self.processing_best_ip_unit
			best_point = self.processing_best_point
			best_point_extension = self.processing_best_point_extension
			path_check_done = true
			path_found = self:_update_astar_result(current_request_point_unit, request, best_unit, astar)
		end

		if path_check_done then
			local is_request_done = _check_and_update_request_result(request, best_unit, best_point, best_point_extension, path_found, self.network_manager, self.network_transmit)

			if is_request_done then
				self.current_request_index = self.current_request_index + 1
			end
		end
	end
end

AIInterestPointSystem.debug_draw = function (self, t, dt)
	if not script_data.ai_interest_point_debug then
		return
	end

	local QuickDrawer = QuickDrawer

	self.debug_anim_t = (self.debug_anim_t or 0) + dt

	if self.debug_anim_t > 1 then
		self.debug_anim_t = 0
	end

	for unit, extension in pairs(self.interest_points) do
		for p_i = 1, extension.points_n do
			local a, b, c = Script.temp_count()
			local point = extension.points[p_i]
			local position = Vector3Aux.unbox(point.position)
			local forward = Quaternion.forward(point.rotation:unbox())

			if not point.is_position_on_navmesh then
				QuickDrawer:cylinder(position, position + Vector3.up(), 0.25, Colors.get("dark_red"), 5)
				QuickDrawer:cone(position + Vector3.up() * 1.3 + forward * 0.25, position + Vector3.up() * 1.3 - forward * 0.25, 0.1, Colors.get("dark_red"), 8, 8)
			elseif point.claimed then
				local offset = Vector3.up() * (self.debug_anim_t * 0.2)

				QuickDrawer:circle(position + Vector3.up() * 0.8, 0.25, Vector3.up(), Colors.get("lime_green"))
				QuickDrawer:cylinder(position - offset, position + Vector3.up() * 1 - offset, 0.25, Colors.get("lime_green"), 5)
				QuickDrawer:cone(position + Vector3.up() * 1.3 + forward * 0.25, position + Vector3.up() * 1.3 - forward * 0.25, 0.1, Colors.get("lime_green"), 8, 8)
			else
				QuickDrawer:cylinder(position, position + Vector3.up(), 0.25, Colors.get("dark_green"), 5)
				QuickDrawer:cone(position + Vector3.up() * 1.3 + forward * 0.25, position + Vector3.up() * 1.3 - forward * 0.25, 0.1, Colors.get("dark_green"), 8, 8)
			end

			Script.set_temp_count(a, b, c)
		end
	end

	for request_id, request in pairs(self.requests) do
		local claim_unit = request.claim_unit

		if HEALTH_ALIVE[claim_unit] then
			local ip_end_time = BLACKBOARDS[claim_unit].ip_end_time

			if ip_end_time then
				local end_position = POSITION_LOOKUP[claim_unit] + Vector3.up() * (ip_end_time - t) + Vector3.up()

				QuickDrawer:cylinder(POSITION_LOOKUP[claim_unit], end_position, 0.25, Colors.get("dark_red"), 5)
			end
		end
	end
end

AIInterestPointSystem.api_start_async_claim_request = function (self, claim_unit, position, min_range, max_range, current_request_id)
	self.last_request_index = self.last_request_index + 1

	local request_id = self.last_request_index
	local request = {}

	request.claim_unit = claim_unit
	request.position = Vector3Aux.box(nil, position)
	request.min_range = min_range
	request.max_range = max_range
	request.failed_interest_points = {}

	if current_request_id ~= nil then
		local current_request = self.requests[current_request_id]

		request.current_request = current_request
	end

	self.requests[request_id] = request

	return request_id
end

AIInterestPointSystem.api_get_claim = function (self, request_id)
	fassert(request_id, "Tried to get claim with no request_id")

	return self.requests[request_id]
end

AIInterestPointSystem.api_release_claim = function (self, request_id)
	local request = self.requests[request_id]

	assert(request)

	if request.result == "success" and Unit.alive(request.interest_point_unit) then
		local extension = request.point_extension

		extension.num_claimed_points = extension.num_claimed_points - 1
		request.point.claimed = nil
		request.point.claim_unit = nil

		local chatter_number = extension.num_claimed_points / extension.points_n

		if extension.wwise_minimum_needed > extension.num_claimed_points then
			chatter_number = 0
		end

		local interest_point_unit = request.interest_point_unit
		local go_id, is_level_unit = self.network_manager:game_object_or_level_id(interest_point_unit)

		assert(go_id)

		if self.network_manager:in_game_session() then
			Managers.state.network.network_transmit:send_rpc_all("rpc_interest_point_chatter_update", go_id, is_level_unit, chatter_number)
		end
	end

	if self.current_request_index == request_id and self.processing_astar then
		local astar = self.astar

		if not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
		end

		self.processing_astar = false
		self.processing_best_point = nil
		self.processing_best_ip_unit = nil
		self.processing_best_point_extension = nil
	end

	table.clear(request.failed_interest_points)

	request.current_request = nil
	self.requests[request_id] = nil
end

AIInterestPointSystem.rpc_interest_point_chatter_update = function (self, channel_id, go_id, is_level_unit, percent_claimed)
	local unit = self.network_manager:game_object_or_level_unit(go_id, is_level_unit)

	if unit == nil then
		return
	end

	local extension = self.interest_points[unit]

	if not extension then
		print("Missing interest_point should not happen?")

		return
	end

	local wwise_world = self.wwise_world
	local percent_claimed_old = extension.percent_claimed or 0

	if percent_claimed == percent_claimed_old then
		return
	elseif percent_claimed_old > 0 and percent_claimed == 0 then
		ipprintf("AIInterestPointSystem stopping event")

		if not extension.wwise_source_id or not WwiseWorld.has_source(wwise_world, extension.wwise_source_id) then
			print("[AIInterestPointExtension] Trying to stop event on non-existing wwise_source_id", extension.wwise_source_id)

			extension.percent_claimed = 0
			extension.wwise_source_id = nil
			extension.wwise_playing_id = nil

			return
		end

		WwiseWorld.stop_event(wwise_world, extension.wwise_playing_id)
		WwiseWorld.destroy_manual_source(wwise_world, extension.wwise_source_id)

		extension.wwise_source_id = nil
		extension.wwise_playing_id = nil
	elseif percent_claimed_old == 0 and percent_claimed > 0 then
		ipprintf("AIInterestPointSystem starting event %f", percent_claimed)

		local wwise_event = extension.wwise_event
		local use_occlusion = true
		local wwise_source_id = WwiseWorld.make_manual_source(wwise_world, unit)
		local wwise_playing_id = WwiseWorld.trigger_event(wwise_world, wwise_event, use_occlusion, wwise_source_id)

		extension.wwise_source_id = wwise_source_id
		extension.wwise_playing_id = wwise_playing_id

		WwiseWorld.set_source_parameter(wwise_world, extension.wwise_source_id, "chatter_number", percent_claimed)
	elseif percent_claimed < 0 then
		fassert(false, "[AIInterestPointExtension] percent_claimed can never be a negative value")
	else
		if not extension.wwise_source_id or not WwiseWorld.has_source(wwise_world, extension.wwise_source_id) then
			print("[AIInterestPointExtension] Trying to set parameter on non-existing wwise_source_id", extension.wwise_source_id)

			extension.percent_claimed = 0
			extension.wwise_source_id = nil
			extension.wwise_playing_id = nil

			return
		end

		ipprintf("AIInterestPointSystem setting percent_claimed %f", percent_claimed)
		WwiseWorld.set_source_parameter(wwise_world, extension.wwise_source_id, "chatter_number", percent_claimed)
	end

	extension.percent_claimed = percent_claimed
end

AIInterestPointSystem.set_breed_override_lookup = function (self, breed_override_lookup)
	self._breed_override_lookup = breed_override_lookup
end
