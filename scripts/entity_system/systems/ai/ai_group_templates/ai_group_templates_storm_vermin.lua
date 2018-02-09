local POSITION_LOOKUP = POSITION_LOOKUP
local BLACKBOARDS = BLACKBOARDS

local function debug_print(...)
	if script_data.debug_storm_vermin_patrol then
		print(...)
	end

	return 
end

local TURN_SPEED = math.pi*0.7
local ANTENNA_SPEED = 6
local ANTENNA_LOCK_DISTANCE = 1
local ANTENNA_WIDTH = 0.88
local MOVE_SPEED_BALANCER = 0.4
local WALK_SPEED = 2.12
local CONTROLLED_ADVANCE_SPEED = 2.77
local CONTROLLED_ADVANCE_TIME_LIMIT = 5
local STRAGGLER_DISTANCE = 4
local COMBAT_RANGE = 25
local PLAYER_ESCAPE_RANGE = 625
local NAV_TAG_ALLOWED_LAYERS = {
	planks = 10,
	ledges_with_fence = 10,
	doors = 10,
	jumps = 10,
	ledges = 10,
	bot_poison_wind = 15,
	fire_grenade = 15,
	bot_ratling_gun_fire = 15
}
local NAV_COST_MAP_ALLOWED_LAYERS = {
	plague_wave = 15,
	troll_bile = 15,
	lamp_oil_fire = 15,
	warpfire_thrower_warpfire = 15,
	stormfiend_warpfire = 20
}
local BREAK_NODE_MAX_DISTANCE = 20
local BREAK_NODE_ASTAR_BOX_EXTENTS = 14
local ANCHOR_OFFSET = {
	x = 1.4,
	y = 0.6
}
local FORMING_DEVIATION_X_MAX = 3
local FORMING_DEVIATION_Y_MAX = 3
local FORMATION_MAX_TIME = 20
local valid_players_and_bots = VALID_TARGETS_PLAYERS_AND_BOTS
local play_sound, pick_sound_source_unit, update_animation_triggered_sounds, init_group, set_state, remove_dead_units, calculate_group_middle_position, member_sorting_func, change_path_direction, unit_animation_event, enter_state_find_path_entry, pick_entry_node, set_path_direction, enter_state_forming, enter_formation, set_forming_positions, debug_draw_formation, check_is_in_formation, update_units, find_position_on_navmesh, enter_state_patrolling, update_anchor_position, update_anchor_direction, antennae_check, antenna_collision, is_valid_target_unit, check_for_players, check_for_doors, resycnc_anchor_indexes, enter_state_opening_door, update_state_opening_door, enter_state_break_node, update_break_node_astar, debug_break_node_astar, enter_state_controlled_advance, acquire_targets, controlled_advance, enter_state_combat, check_if_players_dead = nil
AIGroupTemplates = AIGroupTemplates or {}
AIGroupTemplates.storm_vermin_formation_patrol = {
	init = function (world, nav_world, group, t)
		init_group(nav_world, group)
		enter_state_find_path_entry(nav_world, group)

		group.resycnc_anchor_indexes_at = t + 5

		return 
	end,
	destroy = function (world, nav_world, group, unit)
		local nav_data = group.nav_data

		GwNavTagLayerCostTable.destroy(nav_data.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(nav_data.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(nav_data.traverse_logic)

		local astar = nav_data.astar_data.astar

		if not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
		end

		GwNavAStar.destroy(astar)

		if not AiUtils.unit_alive(unit) then
			group.killed_units = group.killed_units + 1
		end

		if script_data.debug_storm_vermin_patrol then
			local debug_manager = Managers.state.debug

			debug_manager.drawer(debug_manager, {
				mode = "retained",
				name = "storm_vermin_patrol_retained_until_destroy"
			}):reset()
			debug_manager.drawer(debug_manager, {
				mode = "retained",
				name = "storm_vermin_patrol_targeting_retained"
			}):reset()
		end

		return 
	end,
	update = function (world, nav_world, group, t, dt)
		remove_dead_units(group)

		if group.num_indexed_members == 0 then
			return 
		end

		if group.resycnc_anchor_indexes_at < t then
			resycnc_anchor_indexes(group)

			group.resycnc_anchor_indexes_at = t + 5
		end

		if script_data.debug_storm_vermin_patrol then
			Debug.text("patrol runs done: %d", Debug.storm_vermin_patrols_done or 0)
		end

		local state = group.state

		if state == "find_path_entry" then
		elseif state == "forming" then
			update_units(nav_world, group, t, dt)
			update_animation_triggered_sounds(group)
			check_is_in_formation(group, dt)
			check_for_players(nav_world, group, t, dt)
		elseif state == "patrolling" then
			local door_found = check_for_doors(group)

			if door_found then
				return 
			end

			update_anchor_position(nav_world, group, dt)
			update_anchor_direction(nav_world, group, dt)
			antennae_check(nav_world, group, dt)
			update_units(nav_world, group, t, dt)
			update_animation_triggered_sounds(group)
			check_for_players(nav_world, group, t, dt)
		elseif state == "opening_door" then
			update_state_opening_door(group)
		elseif state == "break_node" then
			update_break_node_astar(nav_world, group)
		elseif state == "controlled_advance" then
			update_animation_triggered_sounds(group)
			controlled_advance(nav_world, group, t, dt)
		elseif state == "in_combat" then
			check_if_players_dead(nav_world, group, t, dt)
		end

		return 
	end,
	BT_debug = function (group)
		return {
			"GROUP_SYSTEM:",
			tostring(group.template),
			"state:" .. group.state,
			"previous_state:" .. group.previous_state,
			"num members: " .. group.members_n
		}
	end
}

function play_sound(group, event)
	pick_sound_source_unit(group)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system.play_audio_unit_event(audio_system, event, group.wwise_source_unit)

	return 
end

function pick_sound_source_unit(group)
	local wanted_unit_i = math.ceil(group.num_indexed_members*0.5)
	local wanted_unit = group.indexed_members[wanted_unit_i]
	group.wwise_source_unit = wanted_unit

	return 
end

function update_animation_triggered_sounds(group)
	local source_unit = group.wwise_source_unit

	if not AiUtils.unit_alive(source_unit) then
		pick_sound_source_unit(group)

		source_unit = group.wwise_source_unit
	end

	local blackboard = BLACKBOARDS[source_unit]

	if blackboard.anim_cb_patrol_sound then
		blackboard.anim_cb_patrol_sound = nil
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system.play_audio_unit_event(audio_system, "Play_stormvermin_patrol_foley", source_unit)
	end

	return 
end

function set_state(group, state_name)
	debug_print("[StormVerminPatrol] Entered state:", state_name)

	group.previous_state = group.state
	group.state = state_name

	return 
end

local dead_units = {}

function remove_dead_units(group)
	local units_has_died = false
	local killing_player = nil
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = num_indexed_members, 1, -1 do
		local unit = indexed_members[i]

		if not AiUtils.unit_alive(unit) then
			table.remove(indexed_members, i)

			num_indexed_members = num_indexed_members - 1
			dead_units[unit] = true
			units_has_died = true
			group.killed_units = group.killed_units + 1

			if not killing_player and Unit.alive(unit) then
				local blackboard = BLACKBOARDS[unit]
				local previous_attacker = blackboard.previous_attacker

				if AiUtils.unit_alive(previous_attacker) then
					killing_player = previous_attacker
				end
			end

			group.animation_events[unit] = nil
		end
	end

	group.num_indexed_members = num_indexed_members

	if units_has_died then
		local anchors = group.anchors
		local num_anchors = #anchors

		for i = num_anchors, 1, -1 do
			local anchor = anchors[i]
			local anchor_units = anchor.units

			for j = #anchor_units, 1, -1 do
				local anchor_unit = anchor_units[j]

				if dead_units[anchor_unit] then
					table.remove(anchor_units, j)

					if #anchor_units == 0 then
						table.remove(anchors, i)
					end
				elseif killing_player then
					local blackboard = BLACKBOARDS[anchor_unit]
					blackboard.previous_attacker = killing_player
				end
			end
		end
	end

	for unit, _ in pairs(dead_units) do
		dead_units[unit] = nil
	end

	local group_targets = group.target_units

	for target_unit, _ in pairs(group_targets) do
		if not is_valid_target_unit(target_unit) then
			group_targets[target_unit] = nil
		end
	end

	return 
end

function calculate_group_middle_position(group)
	local middle_position = Vector3(0, 0, 0)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local pos = POSITION_LOOKUP[unit]
		middle_position = middle_position + pos
	end

	middle_position = middle_position/num_indexed_members

	return middle_position
end

function member_sorting_func(a, b)
	return b[2] < a[2]
end

function find_position_on_navmesh(nav_world, position, fallback_position, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, position, check1_up, check1_down)
	local found_position = nil

	if success then
		found_position = Vector3(position.x, position.y, altitude)
	else
		local nav_pos = GwNavQueries.inside_position_from_outside_position(nav_world, position, check2_up, check2_down, check2_side, check2_obstacle_distance)
		local difference = nil

		if nav_pos then
			found_position = nav_pos
		else
			found_position = fallback_position
		end
	end

	if script_data.debug_storm_vermin_patrol then
		local drawer = Managers.state.debug:drawer({
			mode = "immediate",
			name = "storm_vermin_patrol_immediate"
		})

		if success then
			drawer.sphere(drawer, found_position, 0.1, Colors.get("green"))
		elseif found_position == fallback_position then
			drawer.sphere(drawer, found_position, 0.1, Colors.get("red"))
		else
			drawer.sphere(drawer, found_position, 0.1, Colors.get("yellow"))
		end
	end

	return found_position
end

function antenna_collision(nav_world, position, mid_pos, side_direction)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, position, 0.2, 0.4)

	if success then
		position.z = altitude
	else
		local vertical_range = 0.4
		local horizontal_tolerance = 0.8
		local distance_from_obstacle = 0
		local nav_pos = GwNavQueries.inside_position_from_outside_position(nav_world, position, vertical_range, vertical_range, horizontal_tolerance, distance_from_obstacle)
		local distance = nil

		if nav_pos then
			distance = Vector3.dot(nav_pos - position, side_direction)
		else
			distance = 0
		end

		return distance
	end

	return 
end

function change_path_direction(group, current_node_index)
	local nav_data = group.nav_data
	local current_direction = nav_data.node_direction
	local new_direction = (current_direction == "reversed" and "forward") or "reversed"

	set_path_direction(group, new_direction)

	local num_nodes = #nav_data.node_list
	local new_node_index = num_nodes - current_node_index + 2
	local anchors = group.anchors

	for i = 1, #anchors, 1 do
		anchors[i].node_index = new_node_index
	end

	debug_print("[StormVerminPatrol] Changed path direction:", current_node_index, "New node:", new_node_index, "New direction:", new_direction)

	return 
end

function unit_animation_event(group, unit, event_name)
	Unit.animation_event(unit, event_name)

	group.animation_events[unit] = event_name

	return 
end

function init_group(nav_world, group)
	fassert(0 < group.members_n, "Group was initialized with zero members!")

	group.nav_data = {}
	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()

	table.merge(NAV_TAG_ALLOWED_LAYERS, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, NAV_TAG_ALLOWED_LAYERS)

	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, NAV_COST_MAP_ALLOWED_LAYERS)

	local traverse_logic = GwNavTraverseLogic.create(nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, navtag_layer_cost_table)

	group.nav_data.navtag_layer_cost_table = navtag_layer_cost_table
	group.nav_data.nav_cost_map_cost_table = nav_cost_map_cost_table
	group.nav_data.traverse_logic = traverse_logic
	group.nav_data.astar_data = {
		astar = GwNavAStar.create(nav_world),
		node_index = nil,
		path_found = false
	}
	local conflict_manager = Managers.state.conflict
	local node_data = conflict_manager.main_path_info.merged_main_paths
	group.nav_data.node_data = node_data
	group.nav_data.node_list = nil
	group.nav_data.node_break_list = nil
	group.nav_data.node_direction = nil
	local num_indexed_members = 0
	local indexed_members = {}

	for unit, _ in pairs(group.members) do
		if AiUtils.unit_alive(unit) then
			local blackboard = BLACKBOARDS[unit]
			blackboard.only_trust_your_own_eyes = true
			num_indexed_members = num_indexed_members + 1
			indexed_members[num_indexed_members] = unit
		end
	end

	group.indexed_members = indexed_members
	group.num_indexed_members = num_indexed_members
	local anchor = calculate_group_middle_position(group)
	group.anchors = {}
	group.target_units = {}
	group.attack_latest_t = 0
	group.controlled_advance_distance_check_t = 0
	group.animation_events = {}
	group.door_unit = nil
	group.killed_units = 0
	group.main_path_travel_dist = nil
	local num_anchors = math.ceil(group.num_indexed_members/2)

	for i = 1, num_anchors, 1 do
		group.anchors[i] = {
			point = Vector3Box(anchor)
		}
		group.anchors[i].point_on_path = group.anchors[i].point
		group.anchors[i].wanted_direction = nil
		group.anchors[i].current_direction = nil
		group.anchors[i].node_index = nil
		group.anchors[i].unit_distance = 0
		group.anchors[i].units = {}
		group.anchors[i].units_animation_event = {}
		group.anchors[i].antenna_distance = 0
		group.anchors[i].antenna_pos_on_path = group.anchors[i].point
		group.anchors[i].locked_antenna_target_on_path = nil
		group.anchors[i].antenna_target_pos = group.anchors[i].point
		group.anchors[i].antenna_x_displacement = 0
	end

	return 
end

function enter_state_find_path_entry(nav_world, group)
	set_state(group, "find_path_entry")
	pick_entry_node(nav_world, group)

	local nav_data = group.nav_data
	local node_index = group.anchors[1].node_index
	local node = nav_data.node_list[node_index - 1]
	local is_break_node = nav_data.node_break_list[node]

	if is_break_node then
		enter_state_break_node(nav_world, group, node_index - 1)
	else
		enter_state_forming(nav_world, group)
	end

	return 
end

function pick_entry_node(nav_world, group)
	local nav_data = group.nav_data
	local anchors = group.anchors
	local node_index, direction = nil
	local node_list = nav_data.node_data.forward_list
	local num_nodes = #node_list
	local middle_position = calculate_group_middle_position(group)
	local closest_node_index = MainPathUtils.closest_node_in_node_list(node_list, middle_position)

	if closest_node_index == 1 then
		direction = "forward"
		node_index = 2

		debug_print("[StormVerminPatrol] Entering path on first node")
	elseif closest_node_index == num_nodes then
		debug_print("[StormVerminPatrol] Entering path on end node")

		direction = "reversed"
		node_index = 2
	else
		local conflict_manager = Managers.state.conflict
		local player_unit = conflict_manager.main_path_info.ahead_unit
		local player_node_index = nil

		if player_unit and Unit.alive(player_unit) then
			local player_position = Unit.world_position(player_unit, 0)
			player_node_index = MainPathUtils.closest_node_in_node_list(node_list, player_position)
		end

		if not player_node_index or closest_node_index < player_node_index then
			direction = "forward"
			node_index = closest_node_index + 1

			debug_print("[StormVerminPatrol] Entering path on middle node, Direction: Forward, Closest node:", closest_node_index)
		else
			debug_print("[StormVerminPatrol] Entering path on middle node, Direction: Reversed, Closest node:", closest_node_index)

			direction = "reversed"
			node_index = num_nodes - closest_node_index + 2
		end
	end

	set_path_direction(group, direction)

	for i = 1, #anchors, 1 do
		anchors[i].node_index = node_index
	end

	return 
end

function set_path_direction(group, direction)
	local nav_data = group.nav_data

	if direction == "forward" then
		nav_data.node_direction = "forward"
		nav_data.node_list = nav_data.node_data.forward_list
		nav_data.node_break_list = nav_data.node_data.forward_break_list
	else
		nav_data.node_direction = "reversed"
		nav_data.node_list = nav_data.node_data.reversed_list
		nav_data.node_break_list = nav_data.node_data.reversed_break_list
	end

	return 
end

function enter_state_forming(nav_world, group)
	if script_data.debug_storm_vermin_patrol then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "storm_vermin_patrol_retained"
		})

		drawer.reset(drawer)
		Managers.state.debug_text:clear_world_text("storm_vermin_patrol_world_text")
	end

	set_state(group, "forming")

	local nav_data = group.nav_data
	local end_node_index = #nav_data.node_list
	local goal_destination = nav_data.node_list[end_node_index]:unbox()
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, goal_destination, 3, 3)

	if not success then
		debug_print("[StormVerminPatrol] WARNING: Spawned patrol with invalid path marker in level")
		Debug.sticky_text("WARNING: Spawned patrol with invalid path marker in level")

		if script_data.debug_storm_vermin_patrol then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "storm_vermin_patrol_retained"
			})

			drawer.sphere(drawer, goal_destination, 0.5, Colors.get("yellow"))
			drawer.sphere(drawer, goal_destination, 0.4, Colors.get("red"))
		end

		return 
	end

	goal_destination.z = altitude
	group.destination = Vector3Box(goal_destination)
	local network_manager = Managers.state.network
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]

		if not blackboard.climb_state then
			network_manager.anim_event(network_manager, unit, "to_passive")
			unit_animation_event(group, unit, "move_fwd")
		end

		local navigation_extension = blackboard.navigation_extension

		navigation_extension.set_max_speed(navigation_extension, WALK_SPEED)

		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system.do_slot_search(ai_slot_system, unit, false)

		local ai_extension = ScriptUnit.extension(unit, "ai_system")
		local perception_func_name = nil
		local target_selection_func_name = "patrol_passive_target_selection"

		ai_extension.set_perception(ai_extension, perception_func_name, target_selection_func_name)

		blackboard.SVP_target_unit = nil
		local member_goal_destination = goal_destination
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, member_goal_destination, 3, 3)

		if success then
			member_goal_destination.z = altitude
		else
			local nav_pos = GwNavQueries.inside_position_from_outside_position(nav_world, member_goal_destination, 1, 1, 3, 0.38)

			if nav_pos then
				member_goal_destination = nav_pos
			end
		end

		blackboard.goal_destination = Vector3Box(member_goal_destination)
		blackboard.preferred_door_action = "open"

		navigation_extension.allow_layer(navigation_extension, "planks", false)
		GwNavTagLayerCostTable.forbid_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)

		if script_data.debug_storm_vermin_patrol then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "storm_vermin_patrol_retained"
			})

			drawer.sphere(drawer, member_goal_destination, 0.5, Colors.get("yellow"))
			drawer.sphere(drawer, member_goal_destination, 0.4, Colors.get("green"))
		end
	end

	set_forming_positions(nav_world, group)
	play_sound(group, "storm_vermin_patrol_formate")
	play_sound(group, "Play_stormvermin_patrol_forming")

	if script_data.debug_storm_vermin_patrol then
		debug_draw_formation(group)
	end

	return 
end

function debug_draw_formation(group)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "storm_vermin_patrol_retained"
	})
	local debug_text_manager = Managers.state.debug_text
	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local node_break_list = nav_data.node_break_list

	for i = 1, #node_list, 1 do
		local node = node_list[i]
		local node_position = node.unbox(node)

		if node_break_list[node] then
			drawer.sphere(drawer, node_position, 0.1, Colors.get("red"))
			debug_text_manager.output_world_text(debug_text_manager, i, 0.3, node_position + Vector3(0, 0, 0.3), nil, "storm_vermin_patrol_world_text", Vector3(255, 0, 0))
		else
			drawer.sphere(drawer, node_position, 0.1, Colors.get("yellow"))
			debug_text_manager.output_world_text(debug_text_manager, i, 0.3, node_position + Vector3(0, 0, 0.3), nil, "storm_vermin_patrol_world_text", Vector3(255, 255, 0))
		end

		local next_node = nav_data.node_list[i + 1]

		if next_node then
			next_node = next_node.unbox(next_node)

			drawer.line(drawer, node_position, next_node, Colors.get("yellow"))
		end
	end

	local anchors = group.anchors

	for i = 1, #anchors, 1 do
		local anchor = anchors[i]
		local target_node_position = nav_data.node_list[anchor.node_index]:unbox()
		local entry_node_position = nav_data.node_list[anchor.node_index - 1]:unbox()
		local anchor_position = anchor.point:unbox()

		drawer.sphere(drawer, entry_node_position, 0.05, Colors.get("blue"))

		local offset_y = Vector3(0, 0, i*0.04 + 0.2)

		drawer.sphere(drawer, anchor_position, 0.08, Colors.get("pink"))
		drawer.line(drawer, anchor_position, anchor_position + offset_y, Colors.get("pink"))
		drawer.line(drawer, anchor_position + offset_y, target_node_position + offset_y, Colors.get("pink"))
		drawer.vector(drawer, anchor_position + offset_y, anchor.wanted_direction:unbox()*0.2, Colors.get("pink"))
		drawer.line(drawer, target_node_position + offset_y, target_node_position, Colors.get("pink"))
	end

	return 
end

function set_forming_positions(nav_world, group)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local num_nodes = #node_list
	local anchors = group.anchors
	local num_anchors = #anchors
	local target_node_index = anchors[1].node_index
	local start_node_index = math.max(target_node_index - 1, 2)
	local wanted_distance = (num_anchors - 1)*ANCHOR_OFFSET.x
	local backward_distance = MainPathUtils.ray_along_node_list(nav_world, node_list, start_node_index, -1, wanted_distance)
	local anchor_offset, node_list_direction = nil

	if backward_distance == wanted_distance then
		anchor_offset = ANCHOR_OFFSET.x
		node_list_direction = -1
	else
		local forward_distance = MainPathUtils.ray_along_node_list(nav_world, node_list, start_node_index, 1, wanted_distance)

		if forward_distance <= backward_distance then
			anchor_offset = backward_distance/wanted_distance*ANCHOR_OFFSET.x
			node_list_direction = -1
		else
			anchor_offset = forward_distance/wanted_distance*ANCHOR_OFFSET.x
			node_list_direction = 1
		end
	end

	local points = MainPathUtils.find_equidistant_points_in_node_list(node_list, start_node_index, node_list_direction, anchor_offset, num_anchors)

	for i = 1, num_anchors, 1 do
		local point = points[i]
		local point_position = point[1]
		local point_forward = point[2]
		local segment_start_node = point[3]
		local anchor = anchors[i]
		anchor.point = Vector3Box(point_position)
		anchor.point_on_path = anchor.point
		anchor.antenna_target_pos = anchor.point
		anchor.antenna_pos_on_path = anchor.point
		anchor.wanted_direction = Vector3Box(point_forward)
		anchor.current_direction = anchor.wanted_direction
		anchor.node_index = segment_start_node + 1
	end

	resycnc_anchor_indexes(group)

	if script_data.debug_storm_vermin_patrol then
		Debug.storm_vermin_patrols_done = Debug.storm_vermin_patrols_done or -1
		Debug.storm_vermin_patrols_done = Debug.storm_vermin_patrols_done + 1
	end

	return 
end

function update_units(nav_world, group, t, dt)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local unit_pos = POSITION_LOOKUP[unit]
		local blackboard = BLACKBOARDS[unit]
		local breed = blackboard.breed
		local navigation_extension = blackboard.navigation_extension
		local anchor_index = math.ceil(i*0.5)
		local anchor = group.anchors[anchor_index]
		local anchor_point = Vector3Box.unbox(anchor.point)
		local anchor_unit_index = (i - 1)%2 + 1
		anchor.units[anchor_unit_index] = unit
		local anchor_dir = Vector3Box.unbox(anchor.current_direction)
		local dir_normal = Vector3(anchor_dir.y, -anchor_dir.x, 0)
		local multiplier = (i - 1)%2*2 - 1
		local offset = ANCHOR_OFFSET.y*dir_normal*multiplier
		local wanted_destination = anchor_point + offset
		local check1_up = 0.6
		local check1_down = 0.6
		local check2_up = 1.2
		local check2_down = 1.2
		local check2_side = 1.2
		local check2_obstacle_distance = 0
		local destination = find_position_on_navmesh(nav_world, wanted_destination, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance)
		local unit_to_formation_pos_distance = Vector3.distance(unit_pos, destination)

		if i%2 == 1 then
			anchor.unit_distance = unit_to_formation_pos_distance
		else
			local previous_distance = anchor.unit_distance
			anchor.unit_distance = math.max(unit_to_formation_pos_distance, previous_distance)
		end

		navigation_extension.move_to(navigation_extension, destination)
	end

	return 
end

local in_formation_check_timer = 0

function check_is_in_formation(group, dt)
	in_formation_check_timer = in_formation_check_timer + dt
	local in_formation = true

	if in_formation_check_timer < FORMATION_MAX_TIME then
		local anchors = group.anchors
		local num_anchors = #anchors

		for i = 1, num_anchors, 1 do
			local anchor = anchors[i]
			local anchor_units = anchor.units

			for j = 1, #anchor_units, 1 do
				local unit = anchor_units[j]
				local blackboard = BLACKBOARDS[unit]
				local navigation_extension = blackboard.navigation_extension
				local reached_start_position = navigation_extension.has_reached_destination(navigation_extension, 0.3)

				if reached_start_position and not blackboard.climb_state then
					if group.animation_events[unit] ~= "idle" then
						unit_animation_event(group, unit, "idle")
					end

					local wanted_direction = anchor.wanted_direction:unbox()
					local current_direction = Quaternion.forward(Unit.world_rotation(unit, 0))
					local has_wanted_rotation = 0.8 < Vector3.dot(wanted_direction, current_direction)

					if not has_wanted_rotation then
						local wanted_rotation = Quaternion.look(wanted_direction)

						blackboard.locomotion_extension:set_wanted_rotation(wanted_rotation)

						in_formation = false
					end
				else
					in_formation = false
				end
			end
		end
	end

	if in_formation then
		enter_state_patrolling(group)
	end

	return 
end

function enter_state_patrolling(group)
	set_state(group, "patrolling")

	in_formation_check_timer = 0
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension.set_max_speed(navigation_extension, WALK_SPEED)

		if not blackboard.climb_state then
			unit_animation_event(group, unit, "move_fwd")
		end
	end

	play_sound(group, "Play_stormvemin_patrol_formated")

	return 
end

function update_anchor_position(nav_world, group, dt)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local node_break_list = nav_data.node_break_list
	local astar_data = nav_data.astar_data

	for i = 1, #group.anchors, 1 do
		local anchor = group.anchors[i]
		local anchor_position = Vector3Box.unbox(anchor.point)
		local anchor_on_path = Vector3Box.unbox(anchor.point_on_path)
		local target_node_index = anchor.node_index
		local previous_node_index = target_node_index - 1
		local target_node = node_list[target_node_index]

		if not target_node then
			change_path_direction(group, previous_node_index)
			enter_state_forming(nav_world, group)

			return 
		end

		local target_node_position = target_node.unbox(target_node)
		local previous_node_position = node_list[previous_node_index]:unbox()
		local node_diff = target_node_position - previous_node_position
		local dir = Vector3.normalize(node_diff)
		local antenna_target = Vector3Box.unbox(anchor.antenna_target_pos)
		local dir_to_antenna_target = Vector3.normalize(antenna_target - anchor_position)
		local distance = Vector3.length(target_node_position - anchor_on_path)
		local max_anchor_speed = WALK_SPEED*1.2
		local distance_to_previous_anchor = ANCHOR_OFFSET.x
		local previous_anchor = group.anchors[i - 1]

		if previous_anchor then
			local previous_anchor_position = Vector3Box.unbox(previous_anchor.point)
			local previous_anchor_on_path = Vector3Box.unbox(previous_anchor.point_on_path)
			local dot_to_previous_anchor = Vector3.dot(dir, previous_anchor_position - anchor_position)

			if 0 < dot_to_previous_anchor or anchor.node_index < previous_anchor.node_index then
				distance_to_previous_anchor = Vector3.distance(anchor_position, previous_anchor_position)
			end
		end

		local distance_to_next_anchor = ANCHOR_OFFSET.x
		local next_anchor = group.anchors[i + 1] or group.anchors[1]

		if next_anchor then
			local next_anchor_position = Vector3Box.unbox(next_anchor.point)
			local dot_to_next_anchor = Vector3.dot(dir_to_antenna_target, next_anchor_position - anchor_position)

			if dot_to_next_anchor < 0 or next_anchor.node_index < anchor.node_index then
				distance_to_next_anchor = Vector3.distance(anchor_position, next_anchor_position)
			end
		end

		distance_to_previous_anchor = math.max(distance_to_previous_anchor, 0.001)
		distance_to_next_anchor = math.max(distance_to_next_anchor, 0.001)
		local multiplier = 1
		multiplier = multiplier*distance_to_previous_anchor/ANCHOR_OFFSET.x
		multiplier = multiplier*ANCHOR_OFFSET.x/distance_to_next_anchor
		local unit_distance = math.max(0.001, anchor.unit_distance)
		multiplier = multiplier*MOVE_SPEED_BALANCER/unit_distance

		if STRAGGLER_DISTANCE < unit_distance then
			multiplier = 0
		end

		local speed = max_anchor_speed*multiplier
		local movement = dir_to_antenna_target*speed*dt
		local anchor_on_path_dot = Vector3.dot(dir, anchor_on_path - previous_node_position)
		local target_node_dot = Vector3.dot(dir, node_diff)
		anchor.path_percentage = anchor_on_path_dot/target_node_dot

		if script_data.debug_storm_vermin_patrol then
			local category = "anchor_index_" .. i
			local text_size = 0.4
			local color_table = Colors.get_table("white")
			local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
			local z = Vector3.up()*0.4

			Managers.state.debug_text:clear_world_text(category)
			Managers.state.debug_text:output_world_text(i, text_size, anchor_position + z, nil, category, color_vector)
		end

		if target_node_dot - anchor_on_path_dot < 0.25 then
			if node_break_list[target_node] and (astar_data.node_index ~= target_node_index or not astar_data.path_found) then
				enter_state_break_node(nav_world, group, target_node_index)

				return 
			end

			anchor_on_path = target_node_position
			anchor.node_index = target_node_index + 1

			if script_data.debug_storm_vermin_patrol then
				local drawer = Managers.state.debug:drawer({
					mode = "retained",
					name = "storm_vermin_patrol_retained"
				})

				drawer.sphere(drawer, target_node_position, 0.1, Colors.get("green"))
			end
		end

		local new_anchor_position = anchor_position + movement
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, new_anchor_position, 0.5, 0.5)

		if success then
			new_anchor_position.z = altitude
		end

		local success, altitude = GwNavQueries.triangle_from_position(nav_world, anchor_on_path, 0.5, 0.5)

		if not success then
			if script_data.debug_storm_vermin_patrol then
				local drawer = Managers.state.debug:drawer({
					mode = "retained",
					name = "storm_vermin_patrol_retained"
				})

				drawer.sphere(drawer, anchor_on_path, 0.25, Colors.get("red"))
				drawer.sphere(drawer, anchor_on_path, 0.2, Colors.get("blue"))
			end

			new_anchor_position = target_node_position
		end

		target_node_index = anchor.node_index
		target_node = node_list[target_node_index]

		if target_node then
			target_node_position = target_node.unbox(target_node)
			previous_node_position = node_list[target_node_index - 1]:unbox()
			node_diff = target_node_position - previous_node_position
			dir = Vector3.normalize(node_diff)
		end

		local anchor_dot = Vector3.dot(dir, new_anchor_position - previous_node_position)
		anchor_on_path = previous_node_position + dir*anchor_dot
		anchor.point_on_path = Vector3Box(anchor_on_path)
		anchor.point = Vector3Box(new_anchor_position)
		anchor.wanted_direction = Vector3Box(dir)
		local free_movement = anchor.free_movement
		anchor.last_free_movement = free_movement

		if script_data.debug_storm_vermin_patrol then
			local drawer = Managers.state.debug:drawer({
				mode = "immediate",
				name = "storm_vermin_patrol_immidiate"
			})

			drawer.sphere(drawer, new_anchor_position, 0.3, Colors.get("white"))
		end
	end

	local anchor_1 = group.anchors[1]
	local point = anchor_1 and anchor_1.point

	if point then
		local main_paths = Managers.state.conflict.level_analysis:get_main_paths()
		local path_pos, travel_dist, move_percent = MainPathUtils.closest_pos_at_main_path(main_paths, point.unbox(point))
		group.main_path_travel_dist = travel_dist
	end

	return 
end

function update_anchor_direction(nav_world, group, dt)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list

	for i = 1, #group.anchors, 1 do
		local anchor = group.anchors[i]
		local anchor_position_on_path = Vector3Box.unbox(anchor.point_on_path)
		local wanted_face_dir = Vector3Box.unbox(anchor.wanted_direction)
		local target_node_index = anchor.node_index
		local previous_anchor = group.anchors[i - 1]

		if not previous_anchor then
			local face_position = anchor_position_on_path
			local length_along_path = ANCHOR_OFFSET.x
			local distance_to_next_node = nil
			local target_node = node_list[target_node_index]

			if not target_node then
				break
			end

			target_node = target_node.unbox(target_node)
			local search_node_dir = wanted_face_dir
			local search_node_index = target_node_index

			while 0 < length_along_path do
				distance_to_next_node = Vector3.distance(face_position, target_node)

				if length_along_path < distance_to_next_node then
					face_position = face_position + search_node_dir*length_along_path
				else
					face_position = target_node
					search_node_index = search_node_index + 1
					target_node = node_list[search_node_index]

					if not target_node then
						face_position = anchor_position_on_path + search_node_dir

						break
					end

					target_node = target_node.unbox(target_node)
					search_node_dir = Vector3.normalize(target_node - face_position)
				end

				if script_data.debug_storm_vermin_patrol then
					local drawer = Managers.state.debug:drawer({
						mode = "immediate",
						name = "storm_vermin_patrol_immidiate"
					})

					drawer.sphere(drawer, face_position, 0.15, Colors.get("cyan"))
					drawer.line(drawer, anchor_position_on_path, face_position, Colors.get("cyan"))
				end

				length_along_path = length_along_path - distance_to_next_node
			end

			wanted_face_dir = Vector3.normalize(face_position - anchor_position_on_path)
		end

		local face_dir = Vector3Box.unbox(anchor.current_direction)
		local wanted_rad = math.atan2(wanted_face_dir.y, wanted_face_dir.x)
		local face_rad = math.atan2(face_dir.y, face_dir.x)
		local previous_face_rad = wanted_rad

		if previous_anchor then
			local previous_face_dir = nil
			previous_face_dir = Vector3Box.unbox(previous_anchor.current_direction)
			previous_face_rad = math.atan2(previous_face_dir.y, previous_face_dir.x)
		end

		local testsum = math.abs(wanted_rad) + math.abs(previous_face_rad)
		local testproduct = wanted_rad*previous_face_rad
		wanted_rad = (wanted_rad + previous_face_rad)/2

		if math.pi < testsum and testproduct < 0 then
			if wanted_rad < 0 then
				wanted_rad = wanted_rad + math.pi
			else
				wanted_rad = wanted_rad - math.pi
			end
		end

		local difference = wanted_rad - face_rad

		if 0.0001 < math.abs(difference) then
			local movement = TURN_SPEED*dt

			if math.pi < difference then
				difference = difference - math.pi*2
			elseif difference < -math.pi then
				difference = difference + math.pi*2
			end

			if difference < 0 then
				movement = movement*-1
			end

			face_rad = face_rad + movement

			if math.abs(difference) <= math.abs(movement) then
				face_rad = wanted_rad
			end

			face_dir.x = math.cos(face_rad)
			face_dir.y = math.sin(face_rad)
		end

		anchor.current_direction:store(face_dir)

		local anchor_units = anchor.units

		for j = 1, #anchor_units, 1 do
			local unit = anchor_units[j]
			local blackboard = BLACKBOARDS[unit]
			blackboard.anchor_direction = anchor.current_direction
		end
	end

	return 
end

function antennae_check(nav_world, group, dt)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list

	for i = 1, #group.anchors, 1 do
		local anchor = group.anchors[i]
		local target_node_index = anchor.node_index
		local target_node = node_list[target_node_index]

		if not target_node then
			break
		end

		target_node = target_node.unbox(target_node)
		local anchor_position = Vector3Box.unbox(anchor.point)
		local anchor_on_path = Vector3Box.unbox(anchor.point_on_path)
		local wanted_face_dir = Vector3Box.unbox(anchor.wanted_direction)
		local antenna_on_path = Vector3Box.unbox(anchor.antenna_pos_on_path)
		local antenna_target = Vector3Box.unbox(anchor.antenna_target_pos)
		local movement_dir = Vector3.normalize(target_node - antenna_on_path)

		if script_data.debug_storm_vermin_patrol then
			local drawer = Managers.state.debug:drawer({
				mode = "immediate",
				name = "storm_vermin_patrol_immidiate"
			})

			drawer.sphere(drawer, antenna_on_path, 0.2, Colors.get("orange"))
		end

		local antenna_x_offset = anchor.antenna_x_displacement
		local antenna_lock = anchor.antenna_lock
		local move_antenna = true
		local allow_lock = false

		if anchor.locked_antenna_target_on_path then
			local antenna_on_path2 = Vector3Box.unbox(anchor.locked_antenna_target_on_path)
			local atp_to_atp2 = Vector3.distance_squared(antenna_on_path, antenna_on_path2)

			if ANTENNA_LOCK_DISTANCE < atp_to_atp2 then
				move_antenna = false
				allow_lock = true
			end
		end

		if move_antenna then
			local distance_to_next_node = Vector3.dot(target_node - antenna_on_path, wanted_face_dir)
			local antenna_change = ANTENNA_SPEED*dt

			if antenna_change < distance_to_next_node then
				antenna_on_path = antenna_on_path + antenna_change*movement_dir
			else
				antenna_on_path = target_node
			end

			anchor.antenna_pos_on_path = Vector3Box(antenna_on_path)
		end

		local anchor_to_target_dot = Vector3.dot(antenna_target - anchor_position, wanted_face_dir)

		if anchor_to_target_dot < ANTENNA_LOCK_DISTANCE then
			antenna_lock = false
			allow_lock = false
			anchor.locked_antenna_target_on_path = nil
		end

		local wanted_dir_normal = Vector3(-wanted_face_dir.y, wanted_face_dir.x, 0)
		local antenna_mid_position = antenna_on_path + wanted_dir_normal*antenna_x_offset
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, antenna_mid_position, 0.5, 0.5)

		if success then
			antenna_mid_position.z = altitude
		end

		local total_distance = 0
		local total_difference = Vector3(0, 0, 0)
		local multiplier = 1
		local rotated_offset, antenna_position = nil

		for j = 1, 2, 1 do
			local other_normal = wanted_dir_normal*multiplier
			multiplier = multiplier*-1
			antenna_position = antenna_mid_position + other_normal*ANTENNA_WIDTH

			if script_data.debug_storm_vermin_patrol then
				local drawer = Managers.state.debug:drawer({
					mode = "immediate",
					name = "storm_vermin_patrol_immidiate"
				})

				drawer.sphere(drawer, antenna_position, 0.25, Colors.get("orange"))
				drawer.line(drawer, antenna_position, antenna_mid_position, Colors.get("orange"))

				if antenna_lock then
					slot38 = Managers.state.debug:drawer({
						mode = "retained",
						name = "storm_vermin_patrol_retained"
					})
				end
			end

			local distance = antenna_collision(nav_world, antenna_position, antenna_mid_position, wanted_dir_normal)

			if distance then
				total_distance = total_distance + distance
			end
		end

		antenna_x_offset = antenna_x_offset + total_distance
		anchor.antenna_x_displacement = math.max(-ANTENNA_WIDTH, math.min(ANTENNA_WIDTH, antenna_x_offset))

		if total_distance == 0 or antenna_x_offset*total_distance < 0 then
			if allow_lock then
				antenna_lock = true
			end
		elseif not anchor.locked_antenna_target_on_path then
			anchor.locked_antenna_target_on_path = Vector3Box(antenna_on_path)
		end

		anchor.antenna_lock = antenna_lock

		if antenna_lock then
			local antenna_on_path2 = Vector3Box.unbox(anchor.locked_antenna_target_on_path)
			antenna_target = antenna_on_path2 + wanted_dir_normal*antenna_x_offset
		else
			antenna_target = antenna_on_path + wanted_dir_normal*antenna_x_offset
		end

		if script_data.debug_storm_vermin_patrol and antenna_lock then
			slot32 = Managers.state.debug:drawer({
				mode = "retained",
				name = "storm_vermin_patrol_retained"
			})
		end

		anchor.antenna_target_pos = Vector3Box(antenna_target)
	end

	return 
end

function is_valid_target_unit(target_unit)
	return valid_players_and_bots[target_unit]
end

function check_for_players(nav_world, group, t, dt)
	local group_targets = group.target_units
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local target_unit = blackboard.target_unit

		if blackboard.climb_state then
			return 
		end

		if is_valid_target_unit(target_unit) then
			group_targets[target_unit] = true
			blackboard.target_unit = nil
		elseif target_unit then
			group_targets[target_unit] = nil
			blackboard.target_unit = nil
		end
	end

	local has_targets = next(group_targets) ~= nil

	if has_targets then
		enter_state_controlled_advance(nav_world, group, t)
	end

	return 
end

function check_for_doors(group)
	local anchor = group.anchors[1]
	local anchor_units = anchor.units

	for i = 1, #anchor_units, 1 do
		local unit = anchor_units[i]
		local blackboard = BLACKBOARDS[unit]

		if blackboard.is_opening_door then
			local door_unit = blackboard.smash_door.target_unit

			enter_state_opening_door(group, door_unit)

			return true
		end
	end

	return 
end

local function sort_anchors_asc(anchor_a, anchor_b)
	local node_index_a = anchor_a.node_index
	local node_index_b = anchor_b.node_index
	local path_percentage_a = anchor_a.path_percentage or 0
	local path_percentage_b = anchor_b.path_percentage or 0

	if node_index_a ~= node_index_b then
		return node_index_b < node_index_a
	else
		return path_percentage_b < path_percentage_a
	end

	return 
end

function resycnc_anchor_indexes(group)
	local anchors = group.anchors

	table.sort(anchors, sort_anchors_asc)

	local temp_debug_stopper = math.random()

	return 
end

function enter_state_opening_door(group, door_unit)
	set_state(group, "opening_door")

	group.door_unit = door_unit
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		blackboard.stored_goal_destination = blackboard.goal_destination
		blackboard.goal_destination = nil
	end

	return 
end

function update_state_opening_door(group)
	local door_extension = ScriptUnit.extension(group.door_unit, "door_system")

	if not door_extension.is_opening(door_extension) then
		group.door_unit = nil
		local indexed_members = group.indexed_members
		local num_indexed_members = group.num_indexed_members

		for i = 1, num_indexed_members, 1 do
			local unit = indexed_members[i]
			local blackboard = BLACKBOARDS[unit]
			blackboard.goal_destination = blackboard.stored_goal_destination
			blackboard.stored_goal_destination = nil
		end

		enter_state_patrolling(group)
	end

	return 
end

function enter_state_break_node(nav_world, group, break_node_index)
	local nav_data = group.nav_data
	local astar_data = nav_data.astar_data
	local traverse_logic = nav_data.traverse_logic
	local node_list = nav_data.node_list
	local from_position = node_list[break_node_index]:unbox()
	local to_position = node_list[break_node_index + 1]:unbox()
	local node_distance = Vector3.length(to_position - from_position)
	astar_data.node_index = break_node_index
	astar_data.path_found = false

	if node_distance < BREAK_NODE_MAX_DISTANCE then
		GwNavAStar.start_with_propagation_box(astar_data.astar, nav_world, from_position, to_position, BREAK_NODE_ASTAR_BOX_EXTENTS, traverse_logic)
		set_state(group, "break_node")
	else
		if script_data.debug_storm_vermin_patrol then
			debug_break_node_astar(group, astar_data, Colors.get("orange"))
			debug_print("[StormVerminPatrol] Distance between break node and next node to large:", node_distance)
		end

		change_path_direction(group, astar_data.node_index)
		enter_state_forming(nav_world, group)
	end

	return 
end

function update_break_node_astar(nav_world, group)
	local astar_data = group.nav_data.astar_data
	local astar = astar_data.astar

	if GwNavAStar.processing_finished(astar) then
		if GwNavAStar.path_found(astar) and 0 < GwNavAStar.node_count(astar) then
			if script_data.debug_storm_vermin_patrol then
				debug_break_node_astar(group, astar_data, Colors.get("green"))
				debug_print("[StormVerminPatrol] Found path from break node to next node. Path distance:", GwNavAStar.path_distance(astar))
			end

			astar_data.path_found = true
			local previous_state = group.previous_state

			if previous_state == "find_path_entry" then
				enter_state_forming(nav_world, group)
			elseif previous_state == "patrolling" then
				set_state(group, "patrolling")
			else
				assert(false, "[StormVerminPatrol] Break node astar finished, tried to continue to illegal state: " .. tostring(previous_state))
			end
		else
			if script_data.debug_storm_vermin_patrol then
				debug_break_node_astar(group, astar_data, Colors.get("red"))
				debug_print("[StormVerminPatrol] No path found from break node to next node")
			end

			change_path_direction(group, astar_data.node_index)
			enter_state_forming(nav_world, group)
		end
	end

	return 
end

function debug_break_node_astar(group, astar_data, color)
	local node_index = astar_data.node_index
	local from_position = group.nav_data.node_list[node_index]:unbox()
	local to_position = group.nav_data.node_list[node_index + 1]:unbox()
	local node_distance = Vector3.length(to_position - from_position)
	local box_forward = Vector3.normalize(to_position - from_position)
	local box_up = Vector3.up()
	local box_right = Vector3.cross(box_forward, box_up)
	local box_center = from_position + box_forward*node_distance*0.5
	local box_pose = Matrix4x4.identity()

	Matrix4x4.set_forward(box_pose, box_forward)
	Matrix4x4.set_right(box_pose, box_right)
	Matrix4x4.set_up(box_pose, box_up)
	Matrix4x4.set_translation(box_pose, box_center)

	local box_extents = Vector3(BREAK_NODE_ASTAR_BOX_EXTENTS, node_distance/2 + BREAK_NODE_ASTAR_BOX_EXTENTS, 0.1)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "storm_vermin_patrol_retained_until_destroy"
	})

	drawer.box(drawer, box_pose, box_extents, color)

	return 
end

function enter_state_controlled_advance(nav_world, group, t)
	acquire_targets(group)

	group.attack_latest_t = t + CONTROLLED_ADVANCE_TIME_LIMIT
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local anchor_i = math.ceil(i*0.5)
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension.set_max_speed(navigation_extension, CONTROLLED_ADVANCE_SPEED)

		local SVP_target_unit = blackboard.SVP_target_unit
		local target_position = POSITION_LOOKUP[SVP_target_unit]
		local goal_destination = target_position + Vector3(0, 0, 0)
		local success, altitude = GwNavQueries.triangle_from_position(nav_world, target_position, 3, 3)

		if success then
			goal_destination.z = altitude
		else
			goal_destination = nil
		end

		if goal_destination then
			blackboard.goal_destination = Vector3Box(goal_destination)
			local network_manager = Managers.state.network

			if not blackboard.climb_state then
				network_manager.anim_event(network_manager, unit, "to_combat")
				unit_animation_event(group, unit, "move_fwd_walk")
			end
		else
			blackboard.goal_destination = nil

			navigation_extension.stop(navigation_extension)

			if not blackboard.climb_state then
				unit_animation_event(group, unit, "idle")
			end
		end

		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system.do_slot_search(ai_slot_system, unit, true)

		local ai_extension = ScriptUnit.extension(unit, "ai_system")
		local perception_func_name = nil
		local target_selection_func_name = "storm_patrol_death_squad_target_selection"

		ai_extension.set_perception(ai_extension, perception_func_name, target_selection_func_name)

		blackboard.preferred_door_action = "smash"

		navigation_extension.allow_layer(navigation_extension, "planks", true)
		GwNavTagLayerCostTable.allow_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)
	end

	set_state(group, "controlled_advance")
	play_sound(group, "storm_vermin_patrol_player_spotted")

	return 
end

function acquire_targets(group)
	local group_targets = group.target_units
	local target_count = 0

	for _, _ in pairs(group_targets) do
		target_count = target_count + 1
	end

	local anchors = group.anchors
	local num_anchors = #anchors
	local anchors_to_targets_ratio = math.max(1, num_anchors/target_count)

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local target_unit_index = math.ceil(i/anchors_to_targets_ratio)
		local current_index = 1
		local selected_target_unit = nil

		for target_unit, _ in pairs(group_targets) do
			if target_unit_index <= current_index then
				selected_target_unit = target_unit

				break
			end

			current_index = current_index + 1
		end

		anchor.target_unit = selected_target_unit
		local anchor_units = anchor.units

		for j = 1, #anchor_units, 1 do
			local unit = anchor_units[j]
			local blackboard = BLACKBOARDS[unit]
			blackboard.SVP_target_unit = selected_target_unit
		end
	end

	return 
end

function controlled_advance(nav_world, group, t, dt)
	local should_attack = false

	if group.controlled_advance_distance_check_t < t then
		group.controlled_advance_distance_check_t = t + 0.5
		local indexed_members = group.indexed_members
		local num_indexed_members = group.num_indexed_members

		for i = 1, num_indexed_members, 1 do
			local unit = indexed_members[i]
			local unit_pos = POSITION_LOOKUP[unit]
			local group_targets = group.target_units

			for target_unit, _ in pairs(group_targets) do
				if AiUtils.unit_alive(target_unit) then
					local target_pos = POSITION_LOOKUP[target_unit]
					local distance2 = Vector3.distance_squared(unit_pos, target_pos)

					if distance2 < COMBAT_RANGE then
						should_attack = true

						break
					end
				else
					group_targets[target_unit] = nil
				end
			end

			if should_attack then
				break
			end
		end
	end

	if should_attack or group.attack_latest_t < t then
		enter_state_combat(group)
	end

	return 
end

function enter_state_combat(group)
	set_state(group, "in_combat")

	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local target_unit = anchor.target_unit

		if AiUtils.unit_alive(target_unit) then
			local anchor_units = anchor.units

			for j = 1, #anchor_units, 1 do
				local unit = anchor_units[j]
				local blackboard = BLACKBOARDS[unit]
				blackboard.goal_destination = nil
				blackboard.target_unit = target_unit

				AiUtils.activate_unit(blackboard)
			end
		end

		anchor.target_unit = nil
	end

	play_sound(group, "storm_vermin_patrol_charge")

	return 
end

function check_if_players_dead(nav_world, group, t, dt)
	if group.controlled_advance_distance_check_t < t then
		local indexed_members = group.indexed_members
		local num_indexed_members = group.num_indexed_members
		local all_dead = true
		local group_targets = group.target_units
		group.controlled_advance_distance_check_t = t + 0.5

		for target_unit, _ in pairs(group_targets) do
			local target_escaped = true

			if AiUtils.unit_alive(target_unit) then
				all_dead = false
				local target_pos = POSITION_LOOKUP[target_unit]

				for i = 1, num_indexed_members, 1 do
					local unit = indexed_members[i]
					local unit_pos = POSITION_LOOKUP[unit]
					local distance2 = Vector3.distance_squared(unit_pos, target_pos)

					if distance2 < PLAYER_ESCAPE_RANGE then
						target_escaped = false

						break
					end
				end
			end

			if target_escaped then
				group_targets[target_unit] = nil
			end
		end

		if all_dead then
			enter_state_find_path_entry(nav_world, group)
		end
	end

	return 
end

return 
