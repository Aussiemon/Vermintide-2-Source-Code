require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterDragAction = class(BTPackMasterDragAction, BTNode)
local DRAG_DESTINATIONS_N = 10
local DESTINATION_POS_I = 1
local DESTINATION_SCORE_I = 2
local script_data = script_data

BTPackMasterDragAction.init = function (self, ...)
	BTPackMasterDragAction.super.init(self, ...)

	self.navigation_group_manager = Managers.state.conflict.navigation_group_manager
end

BTPackMasterDragAction.name = "BTPackMasterDragAction"

BTPackMasterDragAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTPackMasterDragAction
	blackboard.drag_check_radius = 4
	blackboard.drag_check_index = 1
	blackboard.drag_check_time = 0
	blackboard.threatened = false
	blackboard.find_destination = true
	blackboard.hoist_time = t + action.force_hoist_time
	blackboard.hoist_pos = nil
	blackboard.time_to_damage = t + action.time_to_damage

	StatusUtils.set_grabbed_by_pack_master_network("pack_master_dragging", blackboard.drag_target_unit, true, unit)

	local walk_speed = blackboard.breed.walk_speed
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(action.override_movement_speed or walk_speed)
	AiUtils.allow_smart_object_layers(navigation_extension, false)

	blackboard.destination_test_astar = GwNavAStar.create()
	blackboard.packmaster_destinations = {}

	for i = 1, DRAG_DESTINATIONS_N do
		blackboard.packmaster_destinations[i] = {}
	end

	blackboard.last_path_direction = Vector3Box(Vector3.normalize(POSITION_LOOKUP[unit] - POSITION_LOOKUP[blackboard.drag_target_unit]))
	local success, destination = self:find_escape_destination(unit, blackboard)

	if success then
		navigation_extension:move_to(destination)
	end
end

BTPackMasterDragAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.drag_check_radius = nil
	blackboard.drag_check_index = nil
	blackboard.drag_check_time = nil
	blackboard.threatened = nil
	blackboard.find_destination = nil

	if reason ~= "done" then
		if Unit.alive(blackboard.drag_target_unit) then
			StatusUtils.set_grabbed_by_pack_master_network("pack_master_dragging", blackboard.drag_target_unit, false, unit)
		end

		blackboard.drag_target_unit = nil
		blackboard.target_unit = nil

		AiUtils.show_polearm(unit, true)
	end

	blackboard.packmaster_destinations = nil
	blackboard.destination_test_index = nil
	blackboard.test_destinations = nil
	blackboard.test_next_destination = nil
	blackboard.last_path_direction = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
	AiUtils.allow_smart_object_layers(navigation_extension, true)

	blackboard.attack_cooldown = t + blackboard.action.cooldown

	if not GwNavAStar.processing_finished(blackboard.destination_test_astar) then
		GwNavAStar.cancel(blackboard.destination_test_astar)
	end

	GwNavAStar.destroy(blackboard.destination_test_astar)
end

local function validate_pos(nav_world, pos)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, pos, 0.5, 0.5)

	if success then
		return Vector3(pos.x, pos.y, altitude)
	end
end

local DELTA_ANGLE = math.pi / 9

BTPackMasterDragAction.find_hoist_pos = function (self, nav_world, unit, blackboard)
	local rat_pos = POSITION_LOOKUP[unit]
	local player_pos = POSITION_LOOKUP[blackboard.drag_target_unit]
	local start_direction = Vector3.normalize(rat_pos - player_pos) * 2.26
	local new_pos = validate_pos(nav_world, player_pos + start_direction)

	if new_pos then
		return new_pos
	end

	local angle = 0

	for i = 1, 6 do
		angle = angle + DELTA_ANGLE
		local direction = Quaternion.rotate(Quaternion(Vector3.up(), angle), start_direction)
		new_pos = validate_pos(nav_world, player_pos + direction)

		if new_pos then
			break
		end

		direction = Quaternion.rotate(Quaternion(Vector3.up(), -angle), start_direction)
		new_pos = validate_pos(nav_world, player_pos + direction)

		if new_pos then
			break
		end
	end

	return new_pos
end

BTPackMasterDragAction.can_hoist = function (self, unit, blackboard)
	local max_height_differance = blackboard.action.safe_hoist_max_height_differance
	local rat_pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[blackboard.drag_target_unit]
	local z_dist = math.abs(target_pos.z - rat_pos.z)
	local result = z_dist <= max_height_differance

	return result
end

BTPackMasterDragAction.safe_to_hoist = function (self, unit, blackboard)
	local rat_pos = POSITION_LOOKUP[unit]
	local vector3_distance_squared = Vector3.distance_squared
	local side = blackboard.side
	local player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local safe_dist_squared = blackboard.action.safe_hoist_dist_squared_from_humans

	for k, enemy_unit in ipairs(player_and_bot_units) do
		if blackboard.drag_target_unit ~= enemy_unit and not ScriptUnit.extension(enemy_unit, "status_system"):is_disabled() then
			local ally_pos = player_and_bot_positions[k]
			local dist_squared = vector3_distance_squared(ally_pos, rat_pos)

			if dist_squared < safe_dist_squared then
				return false
			end
		end
	end

	return true
end

BTPackMasterDragAction.run = function (self, unit, blackboard, t, dt)
	local drag_target_unit = blackboard.drag_target_unit

	if not Unit.alive(drag_target_unit) then
		return "failed"
	end

	local player_center_pos = ConflictUtils.average_player_position(drag_target_unit)

	if player_center_pos == nil then
		return "failed"
	end

	local target_status_extension = ScriptUnit.extension(drag_target_unit, "status_system")

	if not target_status_extension:is_grabbed_by_pack_master() then
		return "failed"
	end

	if target_status_extension:is_dead() then
		return "failed"
	end

	if target_status_extension:is_knocked_down() then
		blackboard.hoist_time = 0
	end

	local position = POSITION_LOOKUP[unit]
	local nav_world = blackboard.nav_world

	if blackboard.hoist_time < t then
		if self:can_hoist(unit, blackboard) and self:safe_to_hoist(unit, blackboard) then
			if blackboard.hoist_pos then
				if Vector3.distance_squared(position, blackboard.hoist_pos:unbox()) < 0.1 then
					return "done"
				end

				return "running"
			else
				local hoist_pos = self:find_hoist_pos(nav_world, unit, blackboard)

				if hoist_pos then
					blackboard.hoist_pos = Vector3Box(hoist_pos)

					blackboard.navigation_extension:move_to(hoist_pos)
				end
			end
		else
			blackboard.hoist_pos = nil
		end
	end

	local locomotion_extension = blackboard.locomotion_extension
	local vel = Vector3.flat(-locomotion_extension:current_velocity())
	local rotation = Quaternion.look(vel, Vector3(0, 0, 1))

	blackboard.locomotion_extension:set_wanted_rotation(rotation)

	if blackboard.time_to_damage < t then
		local action = blackboard.action

		DamageUtils.add_damage_network(drag_target_unit, unit, action.damage_amount, action.hit_zone_name, action.damage_type, nil, Vector3.up(), blackboard.breed.name, nil, nil, nil, action.hit_react_type)

		blackboard.time_to_damage = t + action.time_to_damage
	end

	if blackboard.test_destinations then
		local valid_destinations = self:test_destinations(unit, blackboard)

		if not valid_destinations then
			-- Nothing
		end

		return "running"
	end

	if blackboard.navigation_extension:has_reached_destination(2) and not blackboard.test_destinations then
		blackboard.find_destination = true
	end

	local got_threat_pos = false

	if blackboard.drag_check_time < t then
		blackboard.drag_check_time = t + 1

		if not blackboard.threatened then
			blackboard.threatened = find_position_to_avoid(unit, blackboard)
			got_threat_pos = true

			if blackboard.threatened then
				blackboard.find_destination = true
			end
		end
	end

	if not blackboard.find_destination then
		return "running"
	end

	if not got_threat_pos then
		blackboard.threatened = find_position_to_avoid(unit, blackboard)
	end

	self:find_destinations(unit, blackboard, t, dt)

	blackboard.find_destination = false

	return "running"
end

BTPackMasterDragAction.find_destinations = function (self, unit, blackboard, t, dt)
	local position = POSITION_LOOKUP[unit]
	local found_interest_points = false
	local found_nav_group_destination = false
	local threat_pos = blackboard.threat_pos:unbox()
	local wanted_direction = Vector3.normalize(position - threat_pos)
	local take_cover = blackboard.threatened

	if not take_cover then
		found_interest_points = self:find_valid_interest_points(position, blackboard.packmaster_destinations, wanted_direction)

		if not found_interest_points then
			found_nav_group_destination = self:find_nav_group_neighbour(blackboard, position, wanted_direction, threat_pos)

			if not found_nav_group_destination then
				take_cover = true
			end
		end
	end

	if take_cover then
		self:find_valid_covers(position, blackboard.packmaster_destinations, wanted_direction, threat_pos)
	end

	self:setup_destination_test(unit, blackboard)

	if script_data.debug_ai_movement then
		QuickDrawerStay:vector(position, blackboard.last_path_direction:unbox() * 2, Colors.get("purple"))
		QuickDrawerStay:sphere(position + Vector3.up() * 1.7, 0.5, blackboard.threatened and Colors.get("red") or Colors.get("yellow"))
	end
end

function find_position_to_avoid(unit, blackboard, test)
	local max_distance_sq = blackboard.action.safe_hoist_dist_squared_from_humans
	local position = POSITION_LOOKUP[unit]
	local threat_vec = Vector3(0, 0, 0)
	local threatening_players_n = 0
	local side = blackboard.side
	local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS
	local ENEMY_PLAYER_AND_BOT_POSITIONS = side.ENEMY_PLAYER_AND_BOT_POSITIONS

	for idx, enemy_unit in pairs(ENEMY_PLAYER_AND_BOT_UNITS) do
		if blackboard.drag_target_unit ~= enemy_unit and not ScriptUnit.extension(enemy_unit, "status_system"):is_disabled() then
			threatening_players_n = threatening_players_n + 1
			local enemy_pos = ENEMY_PLAYER_AND_BOT_POSITIONS[idx]
			local distance_sq = Vector3.distance_squared(enemy_pos, position)

			if distance_sq > 0 and distance_sq < max_distance_sq then
				local dir = enemy_pos - position
				local normalized_dir = Vector3.normalize(dir)
				normalized_dir = normalized_dir / math.sqrt(distance_sq)
				threat_vec = threat_vec - normalized_dir
			end
		end
	end

	blackboard.threat_pos = Vector3Box(position - threat_vec)

	if script_data.debug_ai_movement then
		QuickDrawer:sphere(position - threat_vec * 4, 1, Color(0, 255, 0))
	end

	return threatening_players_n > 0
end

local function sorting_function(a, b)
	return b[DESTINATION_SCORE_I] < a[DESTINATION_SCORE_I]
end

BTPackMasterDragAction.find_valid_covers = function (self, position, destinations, wanted_direction, player_aggro_pos)
	local unit_position = Unit.local_position
	local distance_squared = Vector3.distance_squared
	local distance = Vector3.distance
	local normalize = Vector3.normalize
	local dot = Vector3.dot
	local max = math.max
	local found_cover_units = FrameTable.alloc_table()
	local distance_to_players = distance(player_aggro_pos, position)
	local max_rad = 19
	local min_rad = 3
	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	local found_cover_units_n = Broadphase.query(bp, position, max_rad, found_cover_units)
	min_rad = min_rad * min_rad
	max_rad = max_rad * max_rad

	if script_data.debug_ai_movement then
		QuickDrawerStay:sphere(player_aggro_pos, 2, Colors.get("deep_sky_blue"))
	end

	local cover_index = 1

	for i = 1, found_cover_units_n do
		local unit = found_cover_units[i]
		local pos = unit_position(unit, 0)
		local dist_squared = distance_squared(pos, position)

		if min_rad <= dist_squared and dist_squared < max_rad then
			local rot = Unit.local_rotation(unit, 0)
			local pm_to_cover_point = pos - position
			local players_to_cover = normalize(pos - player_aggro_pos)
			local direction_dot = dot(normalize(pm_to_cover_point), wanted_direction)
			local hidden_dot = dot(Quaternion.forward(rot), -players_to_cover)
			local distance_to_players = distance(pos, player_aggro_pos)
			local direction_score_modifier = max(0, direction_dot)
			local hidden_score_modifier = max(0, hidden_dot) + 1
			local score = distance_to_players * direction_score_modifier * hidden_score_modifier

			if script_data.debug_ai_movement then
				local color = Color(255, 255 * max(-direction_dot, 0), 255 * max(direction_dot, 0), 255 * max(0, hidden_dot))

				QuickDrawerStay:sphere(pos, 1, color)
				QuickDrawerStay:line(pos + Vector3(0, 0, 1), pos + Quaternion.forward(rot) * 2 + Vector3(0, 0, 1), color)
			end

			destinations[cover_index][1] = Vector3Box(pos)
			destinations[cover_index][2] = score
			cover_index = cover_index + 1

			if DRAG_DESTINATIONS_N < cover_index then
				break
			end
		end
	end

	for i = cover_index, DRAG_DESTINATIONS_N do
		destinations[i][2] = -math.huge
	end
end

BTPackMasterDragAction.find_valid_interest_points = function (self, position, destinations, wanted_direction)
	local found_interest_points = {}
	local max_rad = 19
	local min_rad = 5
	local bp = Managers.state.entity:system("ai_interest_point_system").broadphase
	local found_interest_points_n = Broadphase.query(bp, position, max_rad, found_interest_points)
	local unit_position = Unit.local_position
	local distance = Vector3.distance
	local normalize = Vector3.normalize
	local dot = Vector3.dot
	local ip_index = 1

	for i = 1, found_interest_points_n do
		local interest_point_unit = found_interest_points[i]

		if Unit.alive(interest_point_unit) then
			local enabled = Unit.get_data(interest_point_unit, "interest_point", "enabled")

			if enabled then
				local interest_point_extension = ScriptUnit.extension(interest_point_unit, "ai_interest_point_system")

				if interest_point_extension.num_claimed_points > 0 then
					local ip_pos = unit_position(interest_point_unit, 0)
					local dist = distance(ip_pos, position)

					if min_rad < dist and dist < max_rad then
						local to_interest_point = ip_pos - position
						local direction_dot = dot(normalize(to_interest_point), wanted_direction)
						local direction_score_modifier = direction_dot * 2 + 2
						local distance_score = max_rad - dist
						local score = distance_score * direction_score_modifier

						if script_data.debug_ai_movement then
							QuickDrawerStay:sphere(ip_pos, 1, Colors.get("pink"))
						end

						destinations[ip_index][1] = Vector3Box(ip_pos)
						destinations[ip_index][2] = score
						ip_index = ip_index + 1

						if DRAG_DESTINATIONS_N < ip_index then
							break
						end
					end
				end
			end
		end
	end

	for i = ip_index, DRAG_DESTINATIONS_N do
		destinations[i][2] = -math.huge
	end

	return ip_index > 1
end

BTPackMasterDragAction.find_nav_group_neighbour = function (self, blackboard, position, wanted_direction, avoid_pos)
	local destinations = blackboard.packmaster_destinations
	local navigation_group_manager = Managers.state.conflict.navigation_group_manager
	local nav_group = navigation_group_manager:get_group_from_position(position)

	if not nav_group then
		print("Packmaster was not on nav_group")

		if script_data.debug_ai_movement then
			QuickDrawerStay:sphere(position, 0.5, Colors.get("red"))
		end

		return false
	end

	local neighbours = nav_group:get_group_neighbours()
	local destination_index = 1

	for neighbour, _ in pairs(neighbours) do
		local nav_group_position = neighbour:get_group_center():unbox()
		local diff = nav_group_position - position
		local dir = Vector3.normalize(diff)
		local dir_dot = Vector3.dot(dir, wanted_direction)
		local dir_score_modifier = math.max(0, dir_dot)

		if script_data.debug_ai_movement then
			QuickDrawerStay:sphere(nav_group_position, 3, dir_dot > -0.25 and Colors.get("yellow") or Colors.get("red"))
			QuickDrawerStay:line(nav_group_position, position, dir_dot > -0.25 and Colors.get("yellow") or Colors.get("red"))
		end

		if dir_dot > -0.25 then
			local distance = Vector3.distance_squared(avoid_pos, nav_group_position)
			local score = distance * dir_score_modifier
			local success, altitude = GwNavQueries.triangle_from_position(blackboard.nav_world, nav_group_position, 1.5, 1.5)

			if success then
				nav_group_position.z = altitude
			else
				local nav_pos = GwNavQueries.inside_position_from_outside_position(blackboard.nav_world, nav_group_position, 4, 4, 2.5, 0.38)

				if nav_pos then
					nav_group_position = nav_pos
				elseif script_data.debug_ai_movement then
					QuickDrawerStay:sphere(nav_group_position, 2, Colors.get("purple"))
					QuickDrawerStay:sphere(nav_group_position, 4, Colors.get("purple"))
				end
			end

			destinations[destination_index][DESTINATION_POS_I] = Vector3Box(nav_group_position)
			destinations[destination_index][DESTINATION_SCORE_I] = score
			destination_index = destination_index + 1

			if DRAG_DESTINATIONS_N < destination_index then
				break
			end
		end
	end

	for i = destination_index, DRAG_DESTINATIONS_N do
		destinations[i][DESTINATION_SCORE_I] = -math.huge
	end

	return destination_index > 1
end

BTPackMasterDragAction.find_escape_destination = function (self, unit, blackboard)
	local last_path_direction = blackboard.last_path_direction:unbox()
	local escape_point = POSITION_LOOKUP[unit] + Vector3(0, 0, 0.5)
	local found_destination_point = false
	local destination = nil
	local angle_towards_pull = math.atan2(last_path_direction.y, last_path_direction.x, 0)
	local num_segments = 5
	local angle_per_segment = math.pi / (num_segments - 1)
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension:traverse_logic()
	local nav_world = blackboard.nav_world

	for i = 1, num_segments do
		local angle_modifier = math.ceil((i - 1) * 0.5) * (i % 2 * 2 - 1)
		local angle = angle_modifier * angle_per_segment
		local angle_cw = angle_towards_pull + angle
		local offset_cw = Vector3(math.cos(angle_cw), math.sin(angle_cw), 0)
		local position_end_cw = escape_point + offset_cw * 3
		local success_cw, altitude_cw = GwNavQueries.triangle_from_position(nav_world, position_end_cw, 0.5, 1)

		if success_cw then
			local raycango_success = GwNavQueries.raycango(nav_world, escape_point, position_end_cw, traverse_logic)

			if raycango_success then
				position_end_cw.z = altitude_cw
				destination = position_end_cw
				local position_end_cw = escape_point + offset_cw * 5
				local success_cw, altitude_cw = GwNavQueries.triangle_from_position(nav_world, position_end_cw, 0.5, 1)

				if success_cw then
					local raycango_success = GwNavQueries.raycango(nav_world, escape_point, position_end_cw, traverse_logic)

					if raycango_success then
						position_end_cw.z = altitude_cw
						destination = position_end_cw

						if script_data.debug_ai_movement then
							QuickDrawerStay:vector(escape_point, position_end_cw - escape_point, Colors.get("gold"))
						end
					end
				end

				found_destination_point = true

				break
			end
		end

		if script_data.debug_ai_movement then
			QuickDrawerStay:vector(escape_point, position_end_cw - escape_point, Colors.get("orange"))
		end
	end

	return found_destination_point, destination
end

BTPackMasterDragAction.setup_destination_test = function (self, unit, blackboard)
	blackboard.destination_test_index = 0
	blackboard.test_destinations = true
	blackboard.test_next_destination = true
	blackboard.best_destination = nil
	blackboard.best_destination_score = -math.huge

	table.sort(blackboard.packmaster_destinations, sorting_function)

	local last_path_direction = Vector3.normalize(POSITION_LOOKUP[unit] - POSITION_LOOKUP[blackboard.drag_target_unit])
	blackboard.last_path_direction = Vector3Box(last_path_direction)
end

BTPackMasterDragAction.test_destinations = function (self, unit, blackboard)
	local astar = blackboard.destination_test_astar
	local nav_world = blackboard.nav_world
	local destinations = blackboard.packmaster_destinations
	local destination_test_index = blackboard.destination_test_index
	local test_next_destination = blackboard.test_next_destination
	local packmaster_position = POSITION_LOOKUP[unit]
	local last_path_direction = Vector3Box.unbox(blackboard.last_path_direction)
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension:traverse_logic()

	if test_next_destination then
		destination_test_index = destination_test_index + 1
		blackboard.destination_test_index = destination_test_index

		if destinations[destination_test_index] and destinations[destination_test_index][DESTINATION_SCORE_I] ~= -math.huge then
			local current_destination = destinations[destination_test_index][1]:unbox()

			GwNavAStar.start(astar, nav_world, packmaster_position, current_destination, traverse_logic)
		else
			blackboard.test_destinations = false
			blackboard.test_next_destination = false
			local best_score = blackboard.best_destination_score
			local found_destination = true

			if best_score < 0.01 then
				local escape_destination = nil
				found_destination, escape_destination = self:find_escape_destination(unit, blackboard)

				if found_destination then
					blackboard.best_destination = Vector3Box(escape_destination)
				end
			end

			if not found_destination then
				return false
			end

			navigation_extension:move_to(blackboard.best_destination:unbox())

			return true
		end
	end

	if GwNavAStar.processing_finished(astar) then
		if GwNavAStar.path_found(astar) then
			local path_length = GwNavAStar.path_distance(astar)

			fassert(path_length > 0, "Path length is 0, this will cause div by 0")

			path_length = path_length * path_length
			local current_destination = destinations[destination_test_index][1]:unbox()
			local destination_score = destinations[destination_test_index][2]
			local diff = current_destination - packmaster_position
			local distance2 = Vector3.length_squared(diff)
			local first_dir = GwNavAStar.node_at_index(astar, 2) - GwNavAStar.node_at_index(astar, 1)
			first_dir = Vector3.normalize(first_dir)
			local reverse_dot = Vector3.dot(last_path_direction, first_dir)
			local reverse_score_modifier = reverse_dot * 0.75 + 0.25
			local path_length_ratio = distance2 / path_length
			local final_score = path_length_ratio * reverse_score_modifier
			local new_destination_score = destination_score * final_score
			destinations[destination_test_index][2] = new_destination_score
			local good_path = path_length_ratio > 0.4444444444444444 and reverse_score_modifier > 0

			if good_path then
				for i = 2, GwNavAStar.node_count(astar) do
					local last = GwNavAStar.node_at_index(astar, i - 1)
					local new = GwNavAStar.node_at_index(astar, i)
					local success = GwNavQueries.raycango(nav_world, last, new, traverse_logic)

					if not success then
						good_path = false

						break
					end
				end
			end

			if good_path then
				blackboard.test_destinations = false
				blackboard.test_next_destination = false

				navigation_extension:move_to(current_destination)
			else
				blackboard.test_next_destination = true

				if blackboard.best_destination_score < new_destination_score then
					blackboard.best_destination_score = new_destination_score
					blackboard.best_destination = Vector3Box(current_destination)
				end
			end

			if script_data.debug_ai_movement then
				local count = GwNavAStar.node_count(astar)

				for i = 1, count do
					local node = GwNavAStar.node_at_index(astar, i)

					QuickDrawerStay:sphere(node, 0.1, good_path and Colors.get("yellow") or Colors.get("red"))

					local next_node = GwNavAStar.node_at_index(astar, i + 1)

					if next_node then
						QuickDrawerStay:line(node, next_node, good_path and Colors.get("yellow") or Colors.get("red"))
					end
				end
			end
		else
			blackboard.test_next_destination = true
		end
	else
		blackboard.test_next_destination = false
	end

	return true
end
