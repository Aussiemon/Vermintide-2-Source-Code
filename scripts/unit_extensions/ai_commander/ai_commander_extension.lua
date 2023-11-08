require("scripts/settings/dlcs/shovel/shovel_constants")

local EXPERIMENTAL_POSITION_OFFSET = true
local DETECTION_RADIUS = 7
local DETECTION_RADIUS_STICKY = 11
local MAX_FORMATION_UNITS = 4
local FALLBACK_FORMATION = {
	alternating = true,
	lead_dist_min = 2,
	lead_dist_max = 2,
	commander_avoid_radius = 1.2,
	dist = 4,
	formation_type = "circle",
	lead_dist_mult = math.huge,
	initial_angle_offset = math.pi * 0.5,
	angle_offset = math.pi * 0.05
}
AICommanderExtension = class(AICommanderExtension)

AICommanderExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.ai_commander_system = extension_init_context.owning_system
	self._controlled_units = {}
	self._controlled_units_n = 0
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._is_server = extension_init_context.is_server
	self._network_transmit = extension_init_context.network_transmit
	self._unit_storage = extension_init_context.unit_storage
	local player = extension_init_data.player

	if player then
		self._is_local = player and not player.remote
	end

	self._player = player
	self._last_reference_pos = Vector3Box()
	self._last_reference_rot = QuaternionBox(Quaternion.identity())
	self._last_point_match_rot = QuaternionBox(Quaternion.identity())

	if self._is_server then
		self._follow_indices = {}
		self._follow_datas = {}
		self._units_to_recalculate = {}
		self._follow_units = {}
		self._stored_fallback_positions = {}
		self._fallback_position_data = {
			n = 0,
			cell_width = 2,
			grid_width = 0
		}
		self._fallback_positions = {}
	end

	self._combat_units = {}
	self._stand_ground_queue = {}
	self._stand_ground_active = false
	self._detection_radius = DETECTION_RADIUS
	self._detection_source_pos = Vector3Box()
	self._command_buffs = {}
end

AICommanderExtension.extensions_ready = function (self, world, unit)
	self._locomotion_ext = ScriptUnit.has_extension(unit, "locomotion_system")
	self._buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._buff_system = Managers.state.entity:system("buff_system")
end

AICommanderExtension.destroy = function (self)
	return
end

AICommanderExtension._claim_follow_index = function (self, unit)
	local next_index = #self._follow_indices + 1
	self._follow_indices[next_index] = unit
	self._follow_datas[unit] = {
		undergoing_avoidance = false,
		follow_index = next_index,
		last_follow_position = Vector3Box(),
		lerped_follow_position = Vector3Box(POSITION_LOOKUP[unit]),
		target_follow_position = Vector3Box(),
		true_follow_position = Vector3Box(),
		unit = unit
	}
end

AICommanderExtension._free_follow_index = function (self, unit)
	local follow_data = self._follow_datas[unit]
	local index = follow_data.follow_index
	self._follow_datas[unit] = nil
	local follow_indices = self._follow_indices

	table.swap_delete(follow_indices, index)

	local swapped_unit = follow_indices[index]

	if swapped_unit then
		self._follow_datas[swapped_unit].follow_index = index
	end
end

AICommanderExtension.register_follow_node_update = function (self, unit)
	self._follow_units[unit] = true
	self._force_follow_update = true

	self._follow_datas[unit].lerped_follow_position:store(POSITION_LOOKUP[unit])
end

AICommanderExtension.unregister_follow_node_update = function (self, unit)
	self._follow_units[unit] = nil
	self._units_to_recalculate[unit] = nil
end

AICommanderExtension.follow_node_pending = function (self, blackboard)
	return blackboard.waiting_for_follow_node
end

AICommanderExtension.follow_node_position = function (self, unit)
	local follow_data = self._follow_datas[unit]

	return follow_data and follow_data.lerped_follow_position
end

AICommanderExtension.update = function (self, unit, input, dt, context, t)
	if self._is_server then
		self:_update_units(dt, t)
		self:_update_follow(dt, t)
	end

	self:_update_commands()

	self._cached_hovered_friendly_unit = false
	self._cached_hovered_fallback_unit = false
	self._cached_hovered_commanded_unit = false
end

AICommanderExtension._on_controlled_unit_destroyed = function (self, controlled_unit)
	self:remove_controlled_unit(controlled_unit)
end

AICommanderExtension.set_controlled_unit_template = function (self, controlled_unit, template_name, re_initialize, optional_t)
	if re_initialize then
		self._controlled_units[controlled_unit] = {
			start_t = optional_t,
			command_state = CommandStates.Following
		}
	end

	local template = ControlledUnitTemplates[template_name]
	self._controlled_units[controlled_unit].template = template
end

AICommanderExtension.controlled_unit_template = function (self, controlled_unit)
	local data = self._controlled_units[controlled_unit]

	return data and data.template
end

AICommanderExtension.add_controlled_unit = function (self, controlled_unit, template_name, t, skip_sync)
	if not ALIVE[controlled_unit] then
		return
	end

	self:set_controlled_unit_template(controlled_unit, template_name, true, t)

	local commander_unit = self._unit
	self._controlled_units_n = self._controlled_units_n + 1

	self.ai_commander_system:register_commander_unit(commander_unit, controlled_unit)

	if self._is_server then
		self:_claim_follow_index(controlled_unit)

		self._command_buffs[controlled_unit] = {}
		local blackboard = BLACKBOARDS[controlled_unit]

		if not blackboard.ability_spawned then
			blackboard.detection_radius = DETECTION_RADIUS
		end

		blackboard.detection_source_pos = Vector3Box()
		blackboard.max_combat_range = DETECTION_RADIUS
		blackboard.max_combat_range_sq = blackboard.max_combat_range * blackboard.max_combat_range
		blackboard.max_combat_range_sticky = DETECTION_RADIUS_STICKY
		blackboard.max_combat_range_sticky_sq = blackboard.max_combat_range_sticky * blackboard.max_combat_range_sticky
		blackboard.dist_to_commander = 0
		blackboard.commander_unit = commander_unit
		blackboard.commander_extension = self
		blackboard.command_state = CommandStates.Following
		local event_manager = Managers.state.event

		event_manager:register_referenced(controlled_unit, self, "on_ai_unit_destroyed", "_on_controlled_unit_destroyed")
	end

	if self._is_local then
		self:_set_command_state(controlled_unit, CommandStates.Following)
		Managers.state.achievement:trigger_event("on_controlled_unit_added", controlled_unit, self._unit, self)
	end

	local owner_buff_extension = self._buff_extension

	if owner_buff_extension then
		owner_buff_extension:trigger_procs("on_controlled_unit_added", controlled_unit)
	end

	Managers.state.event:trigger_referenced(commander_unit, "on_controlled_unit_added", controlled_unit)

	if not skip_sync then
		local commander_unit_id = self._unit_storage:go_id(commander_unit)
		local controlled_unit_id = self._unit_storage:go_id(controlled_unit)
		local controlled_unit_template_id = NetworkLookup.controlled_unit_templates[template_name]

		if self._is_server then
			local commanding_player = Managers.player:owner(commander_unit)

			if commanding_player and commanding_player.remote then
				self._network_transmit:send_rpc("rpc_add_controlled_unit", commanding_player.peer_id, commander_unit_id, controlled_unit_id, controlled_unit_template_id)
			end
		else
			self._network_transmit:send_rpc_server("rpc_add_controlled_unit", commander_unit_id, controlled_unit_id, controlled_unit_template_id)
		end
	end
end

AICommanderExtension.remove_controlled_unit = function (self, controlled_unit, skip_sync)
	local controlled_units = self._controlled_units

	if not controlled_units[controlled_unit] then
		return
	end

	self._combat_units[controlled_unit] = nil
	controlled_units[controlled_unit] = nil
	self._controlled_units_n = self._controlled_units_n - 1

	if self._is_local and Managers.player:local_player() then
		Managers.state.achievement:trigger_event("on_controlled_unit_removed", controlled_unit, self._unit, self)
	end

	local owner_buff_extension = self._buff_extension

	if owner_buff_extension then
		owner_buff_extension:trigger_procs("on_controlled_unit_removed", controlled_unit)

		if not HEALTH_ALIVE[controlled_unit] then
			owner_buff_extension:trigger_procs("on_controlled_unit_death", controlled_unit)
		end
	end

	self.ai_commander_system:clear_commander_unit(controlled_unit)

	if self._is_server then
		self:_free_follow_index(controlled_unit)
		self:unregister_follow_node_update(controlled_unit)
		self:_store_fallback_position(controlled_unit)

		local blackboard = BLACKBOARDS[controlled_unit]

		if blackboard then
			blackboard.max_combat_range = nil
			blackboard.max_combat_range_sq = nil
			blackboard.max_combat_range_sticky = nil
			blackboard.dist_to_commander = nil
			blackboard.commander_unit = nil
			blackboard.commander_extension = nil
			blackboard.waiting_for_follow_node = nil
		end

		self:_cleanup_command_buffs(controlled_unit, false)

		self._command_buffs[controlled_unit] = nil

		Managers.state.event:unregister_referenced("on_ai_unit_destroyed", controlled_unit, self)
	end

	if not skip_sync then
		local commander_unit = self._unit
		local commander_unit_id = self._unit_storage:go_id(commander_unit)
		local controlled_unit_id = self._unit_storage:go_id(controlled_unit)

		if commander_unit_id and controlled_unit_id then
			if self._is_server then
				local commanding_player = Managers.player:owner(commander_unit)

				if commanding_player and commanding_player.remote then
					self._network_transmit:send_rpc("rpc_remove_controlled_unit", commanding_player.peer_id, commander_unit_id, controlled_unit_id)
				end
			else
				self._network_transmit:send_rpc_server("rpc_remove_controlled_unit", commander_unit_id, controlled_unit_id)
			end
		end
	end
end

AICommanderExtension.get_controlled_units = function (self)
	return self._controlled_units
end

AICommanderExtension.get_controlled_units_count = function (self)
	return self._controlled_units_n
end

local min_dist_to_new_move = 0.5
local min_dist_to_new_move_sq = min_dist_to_new_move * min_dist_to_new_move

AICommanderExtension._update_follow = function (self, dt, t)
	local is_on_navmesh = self:_commander_is_on_navmesh()

	if not is_on_navmesh then
		return
	end

	local unit = self._unit
	local position = POSITION_LOOKUP[unit]
	local rotation = nil

	if self._first_person_extension then
		rotation = self._first_person_extension:current_rotation()
		rotation = Quaternion.flat_no_roll(rotation)
	else
		local game_object_id = self._unit_storage:go_id(unit)
		local game = Managers.state.network:game()
		local aim_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")
		rotation = Quaternion.flat_no_roll(Quaternion.look(aim_direction))
	end

	local update_all = self._force_follow_update
	local last_check = false
	local update_some = not table.is_empty(self._units_to_recalculate)
	self._force_follow_update = nil

	if not update_all then
		local last_ref_pos = self._last_reference_pos:unbox()
		local dist_sq = Vector3.distance_squared(position, last_ref_pos)

		if min_dist_to_new_move_sq < dist_sq then
			update_all = min_dist_to_new_move_sq < dist_sq
		end

		last_check = not update_all and dist_sq > 0.001

		if last_check then
			local commander_velocity = self._locomotion_ext:current_velocity()
			local commander_standing_still = Vector3.length_squared(commander_velocity) < NetworkConstants.VELOCITY_EPSILON * NetworkConstants.VELOCITY_EPSILON
			last_check = commander_standing_still
		end
	end

	if update_all or update_some or last_check then
		if update_all or last_check then
			self._last_reference_rot:store(rotation)
			self._last_reference_pos:store(position)

			for follow_unit in pairs(self._follow_units) do
				self._units_to_recalculate[follow_unit] = true
			end
		end

		self:_update_follow_nodes(dt, t)

		local last_point_match_rot = self._last_point_match_rot
		local point_match_angle = Quaternion.angle(rotation, last_point_match_rot:unbox())

		if point_match_angle > math.pi * 0.25 or last_check then
			last_point_match_rot:store(rotation)
			self:_pair_best_follow_nodes()
		end
	end

	self:_lerp_follow_positions(dt)
end

AICommanderExtension._update_follow_nodes = function (self, dt, t)
	if script_data.bots_dont_follow then
		return
	end

	local unit = self._unit
	local nav_world = self._nav_world
	local commander_unit_pos = POSITION_LOOKUP[unit]
	local commander_velocity = self._locomotion_ext:current_velocity()
	local commander_speed, commander_move_dir = nil

	if Vector3.length_squared(commander_velocity) < NetworkConstants.VELOCITY_EPSILON * NetworkConstants.VELOCITY_EPSILON then
		commander_speed = 0
		commander_move_dir = Quaternion.forward(Quaternion.flat_no_roll(self._last_reference_rot:unbox()))
	else
		commander_speed = Vector3.length(commander_velocity)
		commander_move_dir = commander_velocity / commander_speed
	end

	local nav_above = 30
	local nav_below = 30
	local nav_horizontal = 5

	for controlled_unit in pairs(self._units_to_recalculate) do
		repeat
			self._units_to_recalculate[controlled_unit] = nil
			local follow_data = self._follow_datas[controlled_unit]
			follow_data.undergoing_avoidance = false
			local controlled_unit_pos = POSITION_LOOKUP[controlled_unit]

			if not controlled_unit_pos then
				break
			end

			local blackboard = BLACKBOARDS[controlled_unit]
			local breed = blackboard.breed
			local formation_data = breed.commander_formation
			local use_fallback_formation = MAX_FORMATION_UNITS < follow_data.follow_index
			local formation_pos = nil

			if use_fallback_formation then
				local grid_width = self._fallback_position_data.grid_width
				local grid_offset = Vector3(0, -3 - grid_width * 0.5, 0)
				local pos_data = self:_get_fallback_position(controlled_unit)
				formation_pos = grid_offset + pos_data.pos:unbox()
				formation_pos = Quaternion.rotate(Quaternion.look(Vector3.flat(commander_move_dir)), formation_pos)
			else
				local angle_offset = formation_data.angle_offset
				local initial_angle_offset = formation_data.initial_angle_offset or angle_offset
				local alternating = formation_data.alternating
				local unit_index = follow_data.follow_index
				local step_index = unit_index - 1

				if alternating then
					step_index = math.floor(step_index * 0.5) or step_index
				end

				local formation_angle = initial_angle_offset + step_index * angle_offset

				if alternating and unit_index % 2 > 0 then
					formation_angle = formation_angle * -1
				end

				local formation_rot_offset = Quaternion.axis_angle(Vector3.up(), formation_angle)
				formation_pos = Quaternion.rotate(formation_rot_offset, Vector3.forward() * formation_data.dist)
				formation_pos = Quaternion.rotate(Quaternion.look(Vector3.flat(commander_move_dir)), formation_pos)
				local formation_pos_offset = formation_data.offset and Vector3(formation_data.offset[1], formation_data.offset[2], 0) or Vector3.zero()
				formation_pos = formation_pos + formation_pos_offset
			end

			local lead_distance = commander_move_dir * (commander_speed == 0 and 0 or math.clamp(commander_speed * formation_data.lead_dist_mult, formation_data.lead_dist_min, formation_data.lead_dist_max))
			local raw_follow_pos = commander_unit_pos + formation_pos + lead_distance
			local true_follow_pos = self:_navify_follow_pos(raw_follow_pos, nav_world, commander_unit_pos, lead_distance, blackboard)

			follow_data.true_follow_position:store(true_follow_pos)

			local follow_pos = true_follow_pos
			local commander_avoid_radius = commander_speed > 0 and formation_data.commander_avoid_radius or 0
			follow_pos = self:_avoid_unit(unit, controlled_unit, follow_pos, commander_avoid_radius, blackboard, nav_world, nav_above, nav_below, dt, t)

			for other_controlled_unit in pairs(self._follow_datas) do
				if other_controlled_unit ~= controlled_unit then
					local bb = BLACKBOARDS[other_controlled_unit]

					if bb and bb.command_state == CommandStates.Following then
						local pet_avoid_radius = commander_speed > 0 and (self:_unit_arrived_at_follow_node(other_controlled_unit) and 0.25 or 1) or 0
						follow_pos = self:_avoid_unit(other_controlled_unit, controlled_unit, follow_pos, pet_avoid_radius, blackboard, nav_world, nav_above, nav_below, dt, t)
					end
				end
			end

			if follow_pos ~= true_follow_pos then
				follow_pos = self:_navify_follow_pos(follow_pos, nav_world, commander_unit_pos, lead_distance, blackboard)
			end

			local node_position = follow_data.lerped_follow_position

			if Vector3.distance_squared(node_position:unbox(), follow_pos) > 0.09 then
				local unit_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, follow_pos, nav_above, nav_below)

				if unit_is_on_navmesh then
					follow_pos.z = z
				else
					follow_pos = GwNavQueries.inside_position_from_outside_position(nav_world, follow_pos, nav_above, nav_below, nav_horizontal, 0.5)
				end

				if follow_pos then
					follow_data.target_follow_position:store(follow_pos)
				end
			end
		until true
	end
end

AICommanderExtension._lerp_follow_positions = function (self, dt)
	local nav_world = self._nav_world

	for unit in pairs(self._follow_units) do
		local blackboard = BLACKBOARDS[unit]
		local follow_data = self._follow_datas[unit]
		local position_boxed = follow_data.lerped_follow_position
		local current_pos = position_boxed:unbox()
		local target_position = follow_data.target_follow_position:unbox()
		local sqr_dist = Vector3.distance_squared(current_pos, target_position)

		if math.epsilon < sqr_dist then
			local min_speed = blackboard.navigation_extension:get_max_speed() * 2
			local direction, length = Vector3.direction_length(target_position - current_pos)
			local wanted_pos = current_pos + direction * math.max(min_speed, length) * dt
			wanted_pos = Geometry.closest_point_on_line(wanted_pos, current_pos, target_position)
			local traverse_logic = blackboard.navigation_extension:traverse_logic()

			if traverse_logic then
				local _, end_pos = GwNavQueries.raycast(nav_world, target_position, wanted_pos, traverse_logic)

				position_boxed:store(end_pos)

				local last_follow_position = follow_data.last_follow_position

				if Vector3.distance_squared(last_follow_position:unbox(), end_pos) > 0.09 then
					last_follow_position:store(end_pos)

					blackboard.goal_destination = Vector3Box(end_pos)
					blackboard.new_move_to_goal = true
					self._units_to_recalculate[unit] = true
				end
			end
		end

		blackboard.waiting_for_follow_node = nil
	end
end

AICommanderExtension._unit_arrived_at_follow_node = function (self, controlled_unit)
	local position = POSITION_LOOKUP[controlled_unit]
	local follow_data = self._follow_datas[controlled_unit]

	return Vector3.distance_squared(position, follow_data.target_follow_position:unbox()) < 0.25
end

AICommanderExtension._avoid_unit = function (self, avoid_unit, controlled_unit, follow_pos, avoid_radius, blackboard, nav_world, nav_above, nav_below, dt, t)
	local position_to_avoid = POSITION_LOOKUP[avoid_unit]
	local controlled_unit_pos = POSITION_LOOKUP[controlled_unit]

	if not position_to_avoid then
		return follow_pos
	end

	if math.abs(position_to_avoid.z - controlled_unit_pos.z) > 1 then
		return follow_pos
	end

	local avoid_follow_data = self._follow_datas[avoid_unit]

	if avoid_follow_data and avoid_follow_data.undergoing_avoidance == controlled_unit then
		return follow_pos
	end

	local avoid_pos_to_follow = Vector3.flat(follow_pos - position_to_avoid)
	local avoid_pos_to_controlled = Vector3.flat(controlled_unit_pos - position_to_avoid)

	if Vector3.length_squared(avoid_pos_to_follow) < avoid_radius * avoid_radius then
		return follow_pos
	end

	local avoid_unit_is_between = Vector3.dot(avoid_pos_to_follow, avoid_pos_to_controlled) < 0

	if avoid_unit_is_between then
		local flip_attempt_t = blackboard.flip_attempt_t
		local flip = flip_attempt_t and t - flip_attempt_t < 2
		local side = flip and blackboard.flip_dir or Vector3.cross(avoid_pos_to_controlled, avoid_pos_to_follow).z < 0 and -1 or 1
		local dist_to_avoid_unit = math.max(Vector3.length(avoid_pos_to_controlled), math.epsilon)
		local controlled_unit_inside_avoid_radius = dist_to_avoid_unit < avoid_radius
		local follow_data = self._follow_datas[controlled_unit]
		local avoiding_something_else = follow_data.undergoing_avoidance

		if controlled_unit_inside_avoid_radius then
			follow_data.undergoing_avoidance = avoid_unit
			self._units_to_recalculate[controlled_unit] = true

			if avoiding_something_else then
				return Vector3.copy(controlled_unit_pos)
			end

			local perpendicular = Vector3.cross(Vector3.normalize(avoid_pos_to_controlled), -Vector3.up()) * side
			perpendicular = Quaternion.rotate(Quaternion.axis_angle(Vector3(0, 0, side), -math.pi * dt), perpendicular)
			follow_pos = controlled_unit_pos + perpendicular * 2
		else
			local controlled_to_follow_dir = Vector3.normalize(Vector3.flat(follow_pos - controlled_unit_pos))
			local projected_distance = Vector3.dot(-avoid_pos_to_controlled, controlled_to_follow_dir)
			local projected_position = controlled_unit_pos + controlled_to_follow_dir * projected_distance
			local running_through = Vector3.length_squared(Vector3.flat(position_to_avoid) - Vector3.flat(projected_position)) < avoid_radius * avoid_radius - math.epsilon

			if running_through then
				follow_data.undergoing_avoidance = avoid_unit
				self._units_to_recalculate[controlled_unit] = true

				if avoiding_something_else then
					local self_pos_flat = Vector3.flat(controlled_unit_pos)
					local edge_pos1, edge_pos2 = Intersect.ray_circle(self_pos_flat, controlled_to_follow_dir, Vector3.flat(position_to_avoid), avoid_radius)
					local first_edge_closer = Vector3.distance_squared(edge_pos1, self_pos_flat) < Vector3.distance_squared(edge_pos2, self_pos_flat)
					local edge_pos = first_edge_closer and edge_pos1 or edge_pos2

					if not flip then
						blackboard.flip_attempt_t = t
						blackboard.flip_dir = -side
					end

					edge_pos.z = follow_pos.z

					return edge_pos
				end

				local dot = math.clamp01(avoid_radius / dist_to_avoid_unit)
				local pos_on_circle = position_to_avoid + Quaternion.rotate(Quaternion.axis_angle(Vector3(0, 0, side), math.acos(dot)), Vector3.normalize(avoid_pos_to_controlled) * avoid_radius)
				local circle_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, pos_on_circle, nav_above, nav_below)

				if circle_is_on_navmesh then
					pos_on_circle.z = z
				elseif not flip then
					blackboard.flip_attempt_t = t
					blackboard.flip_dir = -side
				else
					return projected_position
				end

				local dist_to_follow = Vector3.length(follow_pos - controlled_unit_pos)
				follow_pos = controlled_unit_pos + Vector3.normalize(pos_on_circle - controlled_unit_pos) * dist_to_follow
			end
		end
	end

	return follow_pos
end

AICommanderExtension._pair_best_follow_nodes = function (self)
	local follow_indices = self._follow_indices
	local follow_datas = self._follow_datas
	local source_positions = FrameTable.alloc_table()
	local target_positions = FrameTable.alloc_table()
	local num_units = #follow_indices

	for i = 1, num_units do
		local unit = follow_indices[i]
		local unit_pos = POSITION_LOOKUP[unit]
		local target_pos = follow_datas[unit].true_follow_position:unbox()
		source_positions[i] = unit_pos
		target_positions[i] = target_pos
	end

	local out_indices = FrameTable.alloc_table()

	math.distributed_point_matching(source_positions, target_positions, out_indices, true)

	for i = 1, num_units do
		local wanted_index = out_indices[i]
		local unit = follow_indices[i]

		if follow_datas[unit].follow_index ~= wanted_index then
			follow_datas[unit].follow_index = wanted_index
			self._units_to_recalculate[unit] = true
		end
	end

	for unit, data in pairs(follow_datas) do
		follow_indices[data.follow_index] = unit
	end
end

AICommanderExtension._navify_follow_pos = function (self, follow_pos, nav_world, commander_unit_pos, lead_distance, blackboard)
	local traverse_logic = blackboard.navigation_extension:traverse_logic()

	if traverse_logic then
		local reference_clear_path, reference_pos = GwNavQueries.raycast(nav_world, commander_unit_pos, commander_unit_pos + lead_distance, traverse_logic)

		if not reference_clear_path then
			reference_pos = reference_pos + Vector3.normalize(commander_unit_pos - reference_pos) * 1.5
		end

		local clear_path, end_pos = GwNavQueries.raycast(nav_world, reference_pos, follow_pos, traverse_logic)

		if not clear_path then
			follow_pos = end_pos
		end
	end

	return follow_pos
end

AICommanderExtension._update_units = function (self, dt, t)
	local commander_unit_pos = POSITION_LOOKUP[self._unit]
	local controlled_units = self._controlled_units
	local detection_radius = table.is_empty(self._combat_units) and DETECTION_RADIUS or DETECTION_RADIUS_STICKY
	local half_detection_radius = detection_radius * 0.5
	local avg_velocity = self._locomotion_ext:average_velocity()

	if Vector3.length_squared(avg_velocity) > half_detection_radius * half_detection_radius then
		avg_velocity = Vector3.normalize(avg_velocity) * half_detection_radius
	end

	local detection_source_pos = commander_unit_pos + avg_velocity

	for controlled_unit in pairs(controlled_units) do
		local blackboard = BLACKBOARDS[controlled_unit]
		local controlled_unit_pos = POSITION_LOOKUP[controlled_unit]

		if not controlled_unit_pos then
			self:remove_controlled_unit(controlled_unit)

			return
		end

		local health_extension = ScriptUnit.extension(controlled_unit, "health_system")

		if health_extension:is_dead() then
			self:remove_controlled_unit(controlled_unit)

			return
		end

		local data = self._controlled_units[controlled_unit]
		local template = data.template

		if template.duration then
			local end_t = data.start_t + template.duration

			if t > end_t then
				self:remove_controlled_unit(controlled_unit)

				if template.disband_type == ControlledUnitDisbandType.kill then
					AiUtils.kill_unit(controlled_unit)
				end

				return
			end
		end

		if not blackboard.ability_spawned then
			blackboard.detection_radius = detection_radius
		end

		blackboard.dist_to_commander = Vector3.distance(commander_unit_pos, controlled_unit_pos)

		if blackboard.command_state == CommandStates.StandingGround then
			blackboard.detection_source_pos:store(blackboard.stand_ground_position:unbox())
		else
			blackboard.detection_source_pos:store(detection_source_pos)
		end

		AiBreedSnippets.update_enemy_sighting_within_commander_sticky(blackboard)
	end
end

AICommanderExtension.pet_ui_data = function (self, unit)
	local data = self._controlled_units[unit]

	if not data then
		return nil, nil, nil
	end

	local template = data.template
	local pet_ui_type = template.pet_ui_type

	if pet_ui_type == "health" then
		local health_extension = ScriptUnit.has_extension(unit, "health_system")

		if health_extension then
			local current_health = health_extension:current_health()
			local max_health = health_extension:get_max_health()

			return template, current_health, max_health
		end
	elseif pet_ui_type == "duration" then
		local duration = data.template.duration

		if duration then
			local t = Managers.time:time("game")
			local start_t = data.start_t

			return template, t - start_t, duration
		end
	end

	return nil, nil, nil
end

AICommanderExtension.controlled_units_in_combat = function (self)
	return self._combat_units
end

AICommanderExtension.set_in_combat = function (self, controlled_unit, is_in_combat)
	self._combat_units[controlled_unit] = is_in_combat or nil
end

AICommanderExtension._calculate_hovered_friendly_unit = function (self)
	local radius = 1
	local fp_extension = self._first_person_extension
	local position = fp_extension:current_position()
	local look_direction = Quaternion.forward(fp_extension:current_rotation())
	local pets = self:get_controlled_units()
	local hovered_pet, fallback_pet, commanded_unit = nil
	local best_angle = math.huge

	for pet_unit in pairs(pets) do
		repeat
			if not ALIVE[pet_unit] then
				break
			end

			local pet_position = Unit.has_node(pet_unit, "j_spine") and Unit.world_position(pet_unit, Unit.node(pet_unit, "j_spine")) or POSITION_LOOKUP[pet_unit]

			if pet_position then
				local to_pet_dir, to_pet_len = Vector3.direction_length(pet_position - position)
				local max_angle_rad = math.atan(radius / to_pet_len)
				local dot_angle = Vector3.dot(look_direction, to_pet_dir)
				local angle_to_pet = math.acos(dot_angle)

				if angle_to_pet < best_angle then
					fallback_pet = pet_unit
					best_angle = angle_to_pet

					if angle_to_pet <= max_angle_rad then
						hovered_pet = pet_unit

						if self:command_state(pet_unit) ~= CommandStates.Following then
							commanded_unit = pet_unit
						end
					end
				end
			end
		until true
	end

	self._cached_hovered_fallback_unit = fallback_pet
	self._cached_hovered_friendly_unit = hovered_pet
	self._cached_hovered_commanded_unit = commanded_unit
end

AICommanderExtension._set_command_state = function (self, controlled_unit, command_state)
	fassert(self._is_local, "[AICommanderExtension] Local only function")

	local data = self._controlled_units[controlled_unit]

	if data then
		data.command_state = command_state
	end
end

AICommanderExtension.command_state = function (self, controlled_unit)
	local data = self._controlled_units[controlled_unit]

	return data and data.command_state
end

AICommanderExtension.cancel_current_command = function (self, controlled_unit, ignore_attacking_units)
	if ignore_attacking_units and self:command_state(controlled_unit) == CommandStates.Attacking then
		return
	end

	if self._is_local then
		self:_set_command_state(controlled_unit, CommandStates.Following)
	end

	if not self._is_server then
		local controlled_unit_id = self._unit_storage:go_id(controlled_unit)

		self._network_transmit:send_rpc_server("rpc_cancel_current_command", controlled_unit_id)

		return
	end

	self:_cleanup_command_buffs(controlled_unit, true)

	local blackboard = BLACKBOARDS[controlled_unit]
	blackboard.command_state = CommandStates.Following
	blackboard.override_target_selection_name = nil
	blackboard.override_detection_radius = nil
	blackboard.fallback_rotation = nil
	blackboard.commander_target = nil
	blackboard.new_command_attack = nil
	blackboard.charge_target = nil
	blackboard.target_unit = nil
end

AICommanderExtension.command_attack = function (self, controlled_unit, target_unit)
	if self._is_server then
		self:cancel_current_command(controlled_unit)

		local blackboard = BLACKBOARDS[controlled_unit]
		blackboard.target_unit = target_unit
		blackboard.commander_target = target_unit
		blackboard.override_target_selection_name = "attack_commander_target_with_fallback"
		blackboard.command_state = CommandStates.Attacking
		blackboard.new_command_attack = true

		self:_add_command_buffs(controlled_unit, CommandStates.Attacking)
	else
		local controlled_unit_id = self._unit_storage:go_id(controlled_unit)
		local target_unit_id = self._unit_storage:go_id(target_unit)

		self._network_transmit:send_rpc_server("rpc_command_attack", controlled_unit_id, target_unit_id)
	end

	if self._is_local then
		Managers.state.achievement:trigger_event("command_attack_unit", controlled_unit, target_unit)
		self:_set_command_state(controlled_unit, CommandStates.Attacking)

		self._controlled_units[controlled_unit].commander_target = target_unit
		local dialogue_input = ScriptUnit.extension_input(self._unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("minion_command_attack", event_data)
	end
end

AICommanderExtension.command_stand_ground = function (self, controlled_unit, position, fallback_rotation)
	if self._is_server then
		self:cancel_current_command(controlled_unit)

		local blackboard = BLACKBOARDS[controlled_unit]
		blackboard.target_unit = nil
		blackboard.command_state = CommandStates.StandingGround
		blackboard.override_detection_radius = 3
		blackboard.stand_ground_position = Vector3Box(position)
		blackboard.goal_destination = Vector3Box(position)
		blackboard.new_move_to_goal = true
		blackboard.fallback_rotation = QuaternionBox(fallback_rotation)

		self:_add_command_buffs(controlled_unit, CommandStates.StandingGround)
	else
		local controlled_unit_id = self._unit_storage:go_id(controlled_unit)

		self._network_transmit:send_rpc_server("rpc_command_stand_ground", controlled_unit_id, position, fallback_rotation)
	end

	if self._is_local then
		self:_set_command_state(controlled_unit, CommandStates.StandingGround)

		self._stand_ground_active = true
		local dialogue_input = ScriptUnit.extension_input(self._unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("minion_command_defend", event_data)
	end
end

AICommanderExtension.hovered_friendly_unit = function (self)
	if not self._cached_hovered_fallback_unit then
		self:_calculate_hovered_friendly_unit()
	end

	return self._cached_hovered_friendly_unit, self._cached_hovered_fallback_unit
end

AICommanderExtension.hovered_commanded_unit = function (self)
	if not self._cached_hovered_commanded_unit then
		self:_calculate_hovered_friendly_unit()
	end

	return self._cached_hovered_commanded_unit
end

AICommanderExtension._update_command_stand_ground = function (self)
	if self._stand_ground_active then
		local cancel_stand_ground = false

		for controlled_unit in pairs(self._controlled_units) do
			local position = POSITION_LOOKUP[controlled_unit]
			local necromancer_position = POSITION_LOOKUP[self._unit]
			local dist_sq = Vector3.distance_squared(position, necromancer_position)
			local max_range = NecromancerConstants.max_range

			if dist_sq > max_range * max_range then
				cancel_stand_ground = true

				break
			end
		end

		if cancel_stand_ground then
			for controlled_unit in pairs(self._controlled_units) do
				if self:command_state(controlled_unit) == CommandStates.StandingGround then
					self:cancel_current_command(controlled_unit)
				end
			end

			self._stand_ground_active = false
		end
	end

	local stand_ground_queue = self._stand_ground_queue

	for i = 1, #stand_ground_queue do
		local entry = stand_ground_queue[i]

		self:_command_stand_ground_group(entry.units, entry.target_position:unbox(), entry.fallback_rotation:unbox())

		stand_ground_queue[i] = nil
	end
end

AICommanderExtension._update_commands = function (self)
	if self._is_local then
		local has_stand_ground = false

		for controlled_unit, controlled_data in pairs(self._controlled_units) do
			local command_state = self:command_state(controlled_unit)

			if command_state == CommandStates.Attacking and not HEALTH_ALIVE[controlled_data.commander_target] then
				self:cancel_current_command(controlled_unit)
			else
				has_stand_ground = has_stand_ground or controlled_data.command_state == CommandStates.StandingGround
			end
		end
	end

	self:_update_command_stand_ground()
end

AICommanderExtension.command_stand_ground_group = function (self, units, target_position, fallback_rotation)
	local stand_ground_queue = self._stand_ground_queue
	stand_ground_queue[#stand_ground_queue + 1] = {
		units = units,
		target_position = Vector3Box(target_position),
		fallback_rotation = QuaternionBox(fallback_rotation)
	}
end

AICommanderExtension._command_stand_ground_group = function (self, units, target_position, fallback_rotation)
	table.array_remove_if(units, function (unit)
		return not self._controlled_units[unit]
	end)

	local num_pets = #units

	if num_pets <= 0 then
		return
	end

	local positions = ActionCareerBwNecromancerCommandStandTargetingUtility.generate_positions(target_position, fallback_rotation, num_pets)
	local num_pairs = math.min(num_pets, #positions)
	local pet_positions = FrameTable.alloc_table()
	local target_positions = FrameTable.alloc_table()

	for i = 1, num_pairs do
		pet_positions[i] = POSITION_LOOKUP[units[i]]
		target_positions[i] = positions[i]:unbox()
	end

	local out_indices = FrameTable.alloc_table()
	local num_matches = math.distributed_point_matching(pet_positions, target_positions, out_indices)

	if not num_matches then
		return
	end

	for i = 1, num_matches do
		local pet_unit = units[i]
		local pos_index = out_indices[i]
		local position = target_positions[pos_index]

		self:command_stand_ground(pet_unit, position, fallback_rotation)
	end
end

AICommanderExtension._commander_is_on_navmesh = function (self)
	local pos = POSITION_LOOKUP[self._unit]

	if not pos then
		self._is_on_navmesh = false

		return
	end

	local above = 0.5
	local below = 2
	local success = GwNavQueries.triangle_from_position(self._nav_world, pos, above, below)

	return success
end

AICommanderExtension._cleanup_command_buffs = function (self, controlled_unit, only_remove_on_command)
	local buff_system = self._buff_system
	local command_buffs = self._command_buffs[controlled_unit]

	for i = #command_buffs, 1, -1 do
		local buff_data = command_buffs[i]
		local remove_on_command = buff_data.remove_on_command

		if not only_remove_on_command or remove_on_command then
			local buff_id = buff_data.id

			buff_system:remove_buff_synced(controlled_unit, buff_id)
			table.swap_delete(command_buffs, i)
		end
	end
end

AICommanderExtension._add_command_buffs = function (self, controlled_unit, command_state)
	local unit_data = self._controlled_units[controlled_unit]
	local controlled_unit_template = unit_data.template
	local buff_on_command = controlled_unit_template.buff_on_command
	local buffs_to_add = buff_on_command and buff_on_command[command_state]

	if not buffs_to_add then
		return
	end

	local command_buffs = self._command_buffs[controlled_unit]
	local buff_system = self._buff_system

	for i = 1, #buffs_to_add do
		local buff_to_add = buffs_to_add[i]
		local id = buff_system:add_buff_synced(controlled_unit, buff_to_add.name, BuffSyncType.Local)
		command_buffs[#command_buffs + 1] = {
			id = id,
			remove_on_command = buff_to_add.remove_on_command
		}
	end
end

AICommanderExtension._get_fallback_position = function (self, controlled_unit)
	local fallback_positions = self._fallback_positions
	local stored_positions = self._stored_fallback_positions
	local fallback_data = self._fallback_position_data

	if fallback_positions[controlled_unit] then
		return fallback_positions[controlled_unit]
	end

	local num_stored = #stored_positions

	if num_stored == 0 then
		local cell_width = fallback_data.cell_width
		local current_pow_of = fallback_data.grid_width
		local wanted_pow_of = current_pow_of + 1
		fallback_data.grid_width = wanted_pow_of

		for unit, pos_data in pairs(fallback_positions) do
			local pos_boxed = pos_data.pos
			local pos = pos_boxed:unbox()
			local offset = cell_width * 0.5
			pos[1] = pos[1] - offset
			pos[2] = pos[2] - offset

			pos_boxed:store(pos)
		end

		local random_margin = fallback_data.cell_width

		for i = 1, wanted_pow_of do
			local pos_x = (i - 1 - (wanted_pow_of - 1) * 0.5) * cell_width + math.random() * random_margin - random_margin * 0.5
			local pos_y = (wanted_pow_of - 1) * 0.5 * cell_width + math.random() * random_margin - random_margin * 0.5
			stored_positions[i] = {
				pos = Vector3Box(Vector3(pos_x, pos_y, 0)),
				grid_pow_of = wanted_pow_of
			}
			num_stored = num_stored + 1

			if i ~= wanted_pow_of then
				local pos_x = (wanted_pow_of - 1) * 0.5 * cell_width + math.random() * random_margin - random_margin * 0.5
				local pos_y = (i - 1 - (wanted_pow_of - 1) * 0.5) * cell_width + math.random() * random_margin - random_margin * 0.5
				stored_positions[wanted_pow_of + i] = {
					pos = Vector3Box(Vector3(pos_x, pos_y, 0)),
					grid_pow_of = wanted_pow_of
				}
				num_stored = num_stored + 1
			end
		end
	end

	local idx = Math.random(1, num_stored)
	local pos_data = stored_positions[idx]

	table.swap_delete(stored_positions, idx)

	fallback_positions[controlled_unit] = pos_data
	fallback_data.n = fallback_data.n + 1

	return pos_data
end

AICommanderExtension._store_fallback_position = function (self, controlled_unit)
	local fallback_positions = self._fallback_positions

	if fallback_positions[controlled_unit] then
		local stored_positions = self._stored_fallback_positions
		local fallback_data = self._fallback_position_data
		local pos = fallback_positions[controlled_unit]
		fallback_positions[controlled_unit] = nil
		fallback_data.n = fallback_data.n - 1
		stored_positions[#stored_positions + 1] = pos
		local num_positions = fallback_data.n
		local wanted_pow_of = num_positions > 0 and math.ceil(math.sqrt(num_positions)) or 0
		local current_pow_of = fallback_data.grid_width
		fallback_data.grid_width = wanted_pow_of

		if wanted_pow_of ~= current_pow_of then
			local cell_width = fallback_data.cell_width

			for unit, pos_data in pairs(fallback_positions) do
				local grid_pow_of = pos_data.grid_pow_of

				if wanted_pow_of < grid_pow_of then
					fallback_positions[unit] = nil
					fallback_data.n = fallback_data.n - 1
				else
					local pos_boxed = pos_data.pos
					local pos = pos_boxed:unbox()
					local offset = cell_width * 0.5
					pos[1] = pos[1] + offset
					pos[2] = pos[2] + offset

					pos_boxed:store(pos)
				end
			end

			num_positions = fallback_data.n
			wanted_pow_of = num_positions > 0 and math.ceil(math.sqrt(num_positions)) or 0

			for i = #stored_positions, 1, -1 do
				local pos_data = stored_positions[i]

				if wanted_pow_of < pos_data.grid_pow_of then
					table.swap_delete(stored_positions, i)
				else
					local pos_boxed = pos_data.pos
					local pos = pos_boxed:unbox()
					local offset = cell_width * 0.5
					pos[1] = pos[1] + offset
					pos[2] = pos[2] + offset

					pos_boxed:store(pos)
				end
			end
		end
	end
end
