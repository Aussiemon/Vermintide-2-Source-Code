require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTLootRatFleeAction = class(BTLootRatFleeAction, BTNode)

BTLootRatFleeAction.init = function (self, ...)
	BTLootRatFleeAction.super.init(self, ...)
end

BTLootRatFleeAction.name = "BTLootRatFleeAction"
local CHECK_ESCAPED_PLAYERS_INTERVAL = 2
local BREAK_NODE_MAX_DISTANCE_SQ = 400
local BREAK_NODE_ASTAR_BOX_EXTENTS = 14

BTLootRatFleeAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.is_fleeing = true
	blackboard.check_escaped_players_time = t + CHECK_ESCAPED_PLAYERS_INTERVAL

	if not blackboard.flee_node_data then
		local conflict_manager = Managers.state.conflict
		local node_data = conflict_manager.main_path_info.merged_main_paths
		blackboard.flee_node_data = {
			direction = "fwd",
			nodes = {
				fwd = node_data.forward_list,
				bwd = node_data.reversed_list
			},
			break_nodes = {
				fwd = node_data.forward_break_list,
				bwd = node_data.reversed_break_list
			}
		}
	end

	if not blackboard.flee_astar_data then
		local astar = GwNavAStar.create()
		local navigation_extension = blackboard.navigation_extension
		local traverse_logic = navigation_extension:traverse_logic()
		blackboard.flee_astar_data = {
			doing_astar = false,
			astar = astar,
			traverse_logic = traverse_logic
		}
	end

	self:enter_state_moving_to_level_end(unit, blackboard)
end

BTLootRatFleeAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.spawn_to_running then
		blackboard.spawn_to_running = nil
		blackboard.start_anim_done = true
		blackboard.move_state = "moving"
		blackboard.start_anim_locked = nil

		self:toggle_start_move_animation_lock(unit, false, blackboard)
	elseif not blackboard.movement_inited then
		blackboard.spawn_to_running = nil
		blackboard.start_anim_done = true
		blackboard.move_state = "moving"
		blackboard.start_anim_locked = nil
		blackboard.movement_inited = true
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "move_fwd")
		self:toggle_start_move_animation_lock(unit, false, blackboard)
	end

	local state = blackboard.flee_state

	if state == "moving_to_level_end" then
		self:update_state_moving_to_level_end(unit, blackboard, t)
	end

	if blackboard.check_escaped_players_time < t then
		if self:has_escaped_players(unit, blackboard) then
			self:despawn(unit, blackboard, "escaped_players")
		end

		blackboard.check_escaped_players_time = t + CHECK_ESCAPED_PLAYERS_INTERVAL
	end

	return "running"
end

BTLootRatFleeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local astar_data = blackboard.flee_astar_data

	if not GwNavAStar.processing_finished(astar_data.astar) then
		GwNavAStar.cancel(astar_data.astar)
	end

	blackboard.action = nil
	blackboard.check_escaped_players_time = nil

	if not destroy then
		self:toggle_start_move_animation_lock(unit, false, blackboard)
	end

	blackboard.start_anim_locked = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.start_anim_done = nil
	blackboard.movement_inited = nil
end

BTLootRatFleeAction.enter_state_moving_to_level_end = function (self, unit, blackboard)
	self:set_state(blackboard, "moving_to_level_end")

	local unit_position = POSITION_LOOKUP[unit]
	local node_data = blackboard.flee_node_data
	local nodes = node_data.nodes[node_data.direction]
	local node_index = nil

	if node_data.target_node_index then
		node_index = node_data.target_node_index
	else
		node_index = MainPathUtils.closest_node_in_node_list(nodes, unit_position)
	end

	self:move_to_main_path_node(blackboard, node_index)
end

BTLootRatFleeAction.update_state_moving_to_level_end = function (self, unit, blackboard, t)
	local astar_data = blackboard.flee_astar_data

	if astar_data.doing_astar then
		local astar = astar_data.astar

		if GwNavAStar.processing_finished(astar) then
			astar_data.doing_astar = false
			local node_data = blackboard.flee_node_data
			local target_node_index = node_data.target_node_index
			local next_node_index = nil

			if GwNavAStar.path_found(astar) and GwNavAStar.node_count(astar) > 0 then
				next_node_index = target_node_index + 1
			else
				node_data.direction = node_data.direction == "fwd" and "bwd" or "fwd"
				next_node_index = #node_data.nodes[node_data.direction] - target_node_index + 2
			end

			self:move_to_main_path_node(blackboard, next_node_index)
		else
			return
		end
	end

	local unit_position = POSITION_LOOKUP[unit]
	local node_data = blackboard.flee_node_data
	local target_node_index = node_data.target_node_index
	local nodes = node_data.nodes[node_data.direction]
	local break_nodes = node_data.break_nodes[node_data.direction]
	local target_node = nodes[target_node_index]

	if script_data.ai_loot_rat_behavior then
		self:debug_draw_path_nodes(blackboard.nav_world, nodes, break_nodes, target_node_index, t)
	end

	local distance_to_target_node_sq = Vector3.length_squared(unit_position - target_node:unbox())

	if distance_to_target_node_sq < 0.25 then
		local next_node_index = target_node_index + 1
		local next_node = nodes[next_node_index]

		if next_node then
			if break_nodes[target_node] then
				local next_node_position = next_node:unbox()
				local distance_to_next_node_sq = Vector3.length_squared(unit_position - next_node_position)

				if distance_to_next_node_sq < BREAK_NODE_MAX_DISTANCE_SQ then
					self:do_astar_to_between_main_path_nodes(blackboard, target_node_index)

					return
				else
					node_data.direction = node_data.direction == "fwd" and "bwd" or "fwd"
					next_node_index = #node_data.nodes[node_data.direction] - target_node_index + 2
				end
			end
		else
			node_data.direction = node_data.direction == "fwd" and "bwd" or "fwd"
			next_node_index = 2
		end

		self:move_to_main_path_node(blackboard, next_node_index)
	end
end

BTLootRatFleeAction.move_to_main_path_node = function (self, blackboard, node_index)
	local node_data = blackboard.flee_node_data
	local nodes = node_data.nodes[node_data.direction]
	local node = nodes[node_index]
	node_data.target_node_index = node_index

	blackboard.navigation_extension:move_to(node:unbox())
end

BTLootRatFleeAction.do_astar_to_between_main_path_nodes = function (self, blackboard, from_node_index)
	local node_data = blackboard.flee_node_data
	local nodes = node_data.nodes[node_data.direction]
	local from_position = nodes[from_node_index]:unbox()
	local to_position = nodes[from_node_index + 1]:unbox()
	local astar_data = blackboard.flee_astar_data
	astar_data.doing_astar = true

	GwNavAStar.start_with_propagation_box(astar_data.astar, blackboard.nav_world, from_position, to_position, BREAK_NODE_ASTAR_BOX_EXTENTS, astar_data.traverse_logic)
end

BTLootRatFleeAction.has_escaped_players = function (self, unit, blackboard)
	local action_data = blackboard.action
	local escape_distance_sq = action_data.escaped_players_distance_sq
	local unit_position = POSITION_LOOKUP[unit]
	local side = blackboard.side
	local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #ENEMY_PLAYER_AND_BOT_UNITS do
		local player_unit = ENEMY_PLAYER_AND_BOT_UNITS[i]
		local player_position = POSITION_LOOKUP[player_unit]
		local distance_to_player_sq = Vector3.distance_squared(unit_position, player_position)

		if distance_to_player_sq < escape_distance_sq then
			return false
		end
	end

	return true
end

BTLootRatFleeAction.despawn = function (self, unit, blackboard, reason)
	local conflict = Managers.state.conflict

	conflict:destroy_unit(unit, blackboard, reason)
end

BTLootRatFleeAction.set_state = function (self, blackboard, new_state)
	blackboard.flee_state = new_state
end

BTLootRatFleeAction.toggle_start_move_animation_lock = function (self, unit, should_lock_ani, blackboard)
	local locomotion_extension = blackboard.locomotion_extension

	if should_lock_ani then
		locomotion_extension:use_lerp_rotation(false)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	else
		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)
	end
end

BTLootRatFleeAction.debug_draw_path_nodes = function (self, nav_world, nodes, break_nodes, target_node_index, t)
	for i = 1, #nodes do
		local node = nodes[i]
		local node_position = node:unbox()

		if i == target_node_index then
			if break_nodes[node] then
				QuickDrawer:sphere(node_position, 0.25 + math.sin(t) * 0.15, Colors.get("dark_blue"))
			else
				local success = GwNavQueries.triangle_from_position(nav_world, node_position, 1, 1)

				if success then
					QuickDrawer:sphere(node_position, 0.25 + math.sin(t) * 0.15, Colors.get("pink"))
				else
					QuickDrawer:sphere(node_position, 0.25 + math.sin(t) * 0.15, Colors.get("dark_red"))
				end
			end
		elseif break_nodes[node] then
			QuickDrawer:sphere(node_position, 0.25, Colors.get("orange"))
		else
			QuickDrawer:sphere(node_position, 0.25, Colors.get("dark_green"))
		end
	end
end
