-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/patrol_formation_settings")
require("scripts/helpers/navigation_utils")

local POSITION_LOOKUP = POSITION_LOOKUP
local BLACKBOARDS = BLACKBOARDS

local function debug_print(...)
	if script_data.debug_storm_vermin_patrol then
		print(...)
	end

	return 
end

local TURN_SPEED = math.pi * 0.7
local CONTROLLED_ADVANCE_SPEED = 2.77
local CONTROLLED_ADVANCE_TIME_LIMIT = 5
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
local FORMATION_MAX_TIME = 20
local valid_players_and_bots = VALID_TARGETS_PLAYERS_AND_BOTS
local CIRCULAR_SPLINE_THRESHOLD = 5
local play_sound, pick_sound_source_unit, update_animation_triggered_sounds, init_group, set_state, remove_dead_units, calculate_group_middle_position, member_sorting_func, change_path_direction, unit_animation_event, set_patrol_path_broken, enter_state_find_path_entry, pick_entry_node, set_path_direction, enter_state_forming, enter_formation, set_forming_positions, debug_draw_formation, check_is_in_formation, update_units, find_position_on_navmesh, enter_state_patrolling, update_anchor_position, update_spline_anchor_points, update_anchor_positions, update_anchor_direction, is_valid_target_unit, check_for_players, check_for_doors, enter_state_opening_door, update_state_opening_door, enter_state_controlled_advance, acquire_targets, controlled_advance, enter_state_combat, check_if_players_dead, switch_perception, create_spline_path = nil
AIGroupTemplates = AIGroupTemplates or {}
AIGroupTemplates.spline_patrol = {
	in_patrol = true,
	init = function (world, nav_world, group, t)
		init_group(nav_world, group, world)
		enter_state_find_path_entry(nav_world, group)

		group.resycnc_anchor_indexes_at = t + 5

		return 
	end,
	destroy = function (world, nav_world, group, unit)
		local nav_data = group.nav_data

		GwNavTagLayerCostTable.destroy(nav_data.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(nav_data.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(nav_data.traverse_logic)

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

		if group.num_indexed_members == 0 or group.patrol_path_broken then
			return 
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

			update_spline_anchor_points(nav_world, group, dt)
			update_anchor_direction(nav_world, group, dt)
			update_anchor_positions(nav_world, group, dt)
			update_units(nav_world, group, t, dt)
			update_animation_triggered_sounds(group)
			check_for_players(nav_world, group, t, dt)
		elseif state == "opening_door" then
			update_state_opening_door(group)
		elseif state == "controlled_advance" then
			update_animation_triggered_sounds(group)
			controlled_advance(nav_world, group, t, dt)
		elseif state == "in_combat" then
			check_if_players_dead(nav_world, group, t, dt)
		end

		return 
	end,
	setup_group = function (world, nav_world, group, first_unit)
		group.target_units = {}

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
	local sound_settings = group.formation_settings.sounds
	local sound_event = sound_settings[event]

	audio_system.play_audio_unit_event(audio_system, sound_event, group.wwise_source_unit)

	return 
end

function pick_sound_source_unit(group)
	local wanted_unit_i = math.ceil(group.num_indexed_members * 0.5)
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
		local sound_settings = group.formation_settings.sounds
		local foley_sound = sound_settings.FOLEY

		audio_system.play_audio_unit_event(audio_system, foley_sound, source_unit)

		if group.has_extra_breed then
			local extra_foley_sound = sound_settings.FOLEY_EXTRA

			audio_system.play_audio_unit_event(audio_system, extra_foley_sound, source_unit)
		end

		local patrol_voice_sound = sound_settings.VOICE

		audio_system.play_audio_unit_event(audio_system, patrol_voice_sound, source_unit)
	end

	return 
end

local function set_spline_speed(spline, speed, group)
	local nav_data = group.nav_data
	local direction = nav_data.node_direction
	local direction_modifier = (direction == "reversed" and -1) or 1
	local spline_speed = speed * direction_modifier
	local movement = spline.movement(spline)

	movement.set_speed(movement, spline_speed)

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

			for j, unit in pairs(anchor_units) do
				if dead_units[unit] then
					anchor_units[j] = nil
				elseif killing_player then
					local blackboard = BLACKBOARDS[unit]
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

	middle_position = middle_position / num_indexed_members

	return middle_position
end

function member_sorting_func(a, b)
	return b[2] < a[2]
end

function find_position_on_navmesh(nav_world, position, fallback_position, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, direction)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, position, check1_up, check1_down)
	local found_position = nil

	if success then
		position = Vector3(position.x, position.y, altitude)
	end

	local pos = nil
	local _, hit_position = GwNavQueries.raycast(nav_world, fallback_position, position)
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, hit_position, check1_up, check1_down)

	if success then
		pos = Vector3(hit_position.x, hit_position.y, altitude)
	end

	if pos then
		found_position = pos
	else
		local num_distance_checks = 12
		local nav_pos = nil
		local direction_normalized = Vector3.normalize(Vector3.flat(direction))

		for i = 1, num_distance_checks, 1 do
			local distance = 0.5 + i * 0.5
			local offset_forward = direction_normalized * distance
			local offset_position = position + offset_forward

			if script_data.debug_storm_vermin_patrol then
				QuickDrawer:sphere(offset_position, 0.3, Colors.get("orange"))
			end

			local pos = GwNavQueries.inside_position_from_outside_position(nav_world, offset_position, check2_up, check2_down, check2_side, check2_obstacle_distance)

			if pos then
				nav_pos = pos

				break
			end
		end

		if nav_pos then
			found_position = nav_pos

			if script_data.debug_storm_vermin_patrol then
				QuickDrawer:sphere(nav_pos, 0.25, Colors.get("green"))
			end
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
			drawer.line(drawer, found_position, fallback_position, Colors.get("green"))
		elseif found_position == fallback_position then
			drawer.sphere(drawer, found_position, 0.1, Colors.get("red"))
		else
			drawer.sphere(drawer, found_position, 0.1, Colors.get("yellow"))
			drawer.line(drawer, found_position, fallback_position, Colors.get("yellow"))
		end

		drawer.sphere(drawer, position, 0.05, Colors.get("orange"))
	end

	return found_position
end

function change_path_direction(group, current_node_index)
	local nav_data = group.nav_data
	local current_direction = nav_data.node_direction
	local new_direction = (current_direction == "reversed" and "forward") or "reversed"

	set_path_direction(group, new_direction, current_direction)

	local num_nodes = #nav_data.node_list
	local new_node_index = num_nodes - current_node_index + 2
	local anchors = group.anchors

	for i = 1, #anchors, 1 do
		anchors[i].node_index = new_node_index
		anchors[i].start_timer = i - 1
	end

	debug_print("[StormVerminPatrol] Changed path direction:", current_node_index, "New node:", new_node_index, "New direction:", new_direction)

	return 
end

local function find_patrol_spline(world, group)
	local spline_name = group.spline_name
	local level = LevelHelper:current_level(world)
	local use_way_points = group.spline_points
	local spline_points = nil

	if use_way_points then
		local source_points = group.spline_points
		spline_points = AiUtils.remove_bad_boxed_spline_points(source_points, spline_name)
	else
		local source_points = Level.spline(level, spline_name)
		spline_points = AiUtils.remove_bad_spline_points(source_points, spline_name)
	end

	local num_spline_points = #spline_points

	if num_spline_points == 0 then
		return false
	end

	local node_data = {
		forward_list = {},
		reversed_list = {}
	}

	for i, spline_point in ipairs(spline_points) do
		node_data.forward_list[i] = Vector3Box(spline_point)
		local reversed_index = num_spline_points - i + 1
		node_data.reversed_list[reversed_index] = Vector3Box(spline_point)
	end

	local start_position = spline_points[1]
	local end_position = spline_points[num_spline_points]
	local distance = Vector3.distance(start_position, end_position)
	local is_circular_spline = distance < CIRCULAR_SPLINE_THRESHOLD

	for i, anchor in ipairs(group.anchors) do
		local spline_name = spline_name .. ":" .. i

		if use_way_points then
			anchor.spline = SplineCurve:new(spline_points, "Hermite", "SplineMovementHermiteInterpolatedMetered", spline_name, 3)
		else
			anchor.spline = SplineCurve:new(spline_points, "Bezier", "SplineMovementHermiteInterpolatedMetered", spline_name, 10)
		end

		anchor.is_circular_spline = is_circular_spline
	end

	return node_data
end

function init_group(nav_world, group, world)
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
	local formation_settings = group.formation_settings
	local extra_breed_name = formation_settings.extra_breed_name
	local group_has_extra_breed = false
	local num_indexed_members = 0
	local indexed_members = {}
	local group_members_positions = {}
	local is_spline_patrol = group.group_type == "spline_patrol"

	for unit, _ in pairs(group.members) do
		if AiUtils.unit_alive(unit) then
			local blackboard = BLACKBOARDS[unit]
			blackboard.only_trust_your_own_eyes = is_spline_patrol
			local breed_name = blackboard.breed.name

			if breed_name == extra_breed_name then
				group_has_extra_breed = true
			end

			local navigation_extension = blackboard.navigation_extension

			navigation_extension.set_far_pathing_allowed(navigation_extension, false)

			local group_extension = ScriptUnit.extension(unit, "ai_group_system")
			local row = group_extension.group_row
			local column = group_extension.group_column
			group_members_positions[unit] = {
				row = row,
				column = column
			}
			num_indexed_members = num_indexed_members + 1
			indexed_members[num_indexed_members] = unit
		end
	end

	group.indexed_members = indexed_members
	group.num_indexed_members = num_indexed_members
	group.has_extra_breed = group_has_extra_breed
	local group_start_position = group.group_start_position:unbox()
	local anchor = group_start_position
	group.anchors = {}
	group.attack_latest_t = 0
	group.controlled_advance_distance_check_t = 0
	group.animation_events = {}
	group.door_unit = nil
	group.killed_units = 0
	group.main_path_travel_dist = nil
	group.use_controlled_advance = formation_settings.use_controlled_advance
	local spline_name = group.spline_name
	local num_anchors = #group.formation

	for i = 1, num_anchors, 1 do
		group.anchors[i] = {
			point = Vector3Box(anchor)
		}
		group.anchors[i].point_on_path = group.anchors[i].point
		group.anchors[i].previous_position = Vector3Box(anchor)
		group.anchors[i].wanted_direction = nil
		group.anchors[i].current_direction = nil
		group.anchors[i].node_index = nil
		group.anchors[i].unit_distance = 0
		group.anchors[i].units = {}
		local row = i
		local columns = group.formation[row]
		local num_positions = #columns
		local positions = {}

		for column, data in ipairs(columns) do
			positions[column] = data.start_position or group.anchors[i].point
		end

		group.anchors[i].positions = positions
		local anchor_offset = formation_settings.offsets.ANCHOR_OFFSET
		local anchor_offset_y = (2 < num_positions and anchor_offset.y * (num_positions - 1)) or anchor_offset.y
		group.anchors[i].wanted_offset = {
			anchor_offset_y,
			anchor_offset_y
		}
	end

	local node_data = find_patrol_spline(world, group)
	local node_data_debug = Managers.state.conflict.main_path_info.merged_main_paths
	node_data = node_data or Managers.state.conflict.main_path_info.merged_main_paths
	group.nav_data.node_data = node_data
	group.nav_data.node_list = nil
	group.nav_data.node_direction = nil

	return 
end

function enter_state_find_path_entry(nav_world, group)
	set_state(group, "find_path_entry")
	pick_entry_node(nav_world, group)

	local nav_data = group.nav_data
	local node_data = nav_data.node_data
	local group_start_position = group.group_start_position:unbox()

	debug_print("[Patrol] group_start_position", group_start_position)

	for i, anchor in ipairs(group.anchors) do
		local spline = anchor.spline
		local closest_spline_index = NavigationUtils.get_closest_index_on_spline(spline, group_start_position)
		local movement = spline.movement(spline)

		movement.set_current_spline_index(movement, closest_spline_index)
	end

	enter_state_forming(nav_world, group)

	return 
end

function pick_entry_node(nav_world, group)
	local start_forward = group.start_forward
	local nav_data = group.nav_data
	local anchors = group.anchors
	local node_index, direction = nil
	local node_list = nav_data.node_data.forward_list
	local num_nodes = #node_list
	local middle_position = calculate_group_middle_position(group)
	local closest_node_index = MainPathUtils.closest_node_in_node_list(node_list, middle_position)

	if start_forward then
		direction = "forward"
		node_index = 2

		debug_print("[StormVerminPatrol] start forward")
	elseif closest_node_index == 1 then
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

function set_path_direction(group, direction, current_direction)
	local nav_data = group.nav_data
	local spline_speed = group.formation_settings.speeds.SPLINE_SPEED

	if direction == "forward" then
		nav_data.node_direction = "forward"
		nav_data.node_list = nav_data.node_data.forward_list

		for i, anchor in ipairs(group.anchors) do
			local spline = anchor.spline

			if current_direction then
				spline.movement(spline):reset_to_start()
				set_spline_speed(spline, spline_speed, group)
			end
		end
	else
		nav_data.node_direction = "reversed"
		nav_data.node_list = nav_data.node_data.reversed_list

		for i, anchor in ipairs(group.anchors) do
			local spline = anchor.spline

			if current_direction then
				spline.movement(spline):reset_to_end()
				set_spline_speed(spline, spline_speed, group)
			end
		end
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
		local navigation_extension = blackboard.navigation_extension
		local walk_speed = group.formation_settings.speeds.WALK_SPEED

		navigation_extension.set_max_speed(navigation_extension, walk_speed)

		if ScriptUnit.has_extension(unit, "ai_slot_system") then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system.do_slot_search(ai_slot_system, unit, false)
		end

		local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")
		local use_patrol_perception = ai_group_extension.use_patrol_perception

		if use_patrol_perception then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_extension.breed(ai_extension)
			local perception_func_name = breed.patrol_passive_perception
			local target_selection_func_name = breed.patrol_passive_target_selection

			ai_extension.set_perception(ai_extension, perception_func_name, target_selection_func_name)
		end

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

	local sound_settings = group.formation_settings.sounds
	local formate_sound = sound_settings.formate
	local forming_sound = sound_settings.forming

	play_sound(group, "FORMATE")
	play_sound(group, "FORMING")

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

	for i = 1, #node_list, 1 do
		local node = node_list[i]
		local node_position = node.unbox(node)

		drawer.sphere(drawer, node_position, 0.1, Colors.get("yellow"))
		debug_text_manager.output_world_text(debug_text_manager, i, 0.3, node_position + Vector3(0, 0, 0.3), nil, "storm_vermin_patrol_world_text", Vector3(255, 255, 0))

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

		local offset_y = Vector3(0, 0, 0.2 + i * 0.04)

		drawer.sphere(drawer, anchor_position, 0.08, Colors.get("pink"))
		drawer.line(drawer, anchor_position, anchor_position + offset_y, Colors.get("pink"))
		drawer.line(drawer, anchor_position + offset_y, target_node_position + offset_y, Colors.get("pink"))
		drawer.vector(drawer, anchor_position + offset_y, anchor.wanted_direction:unbox() * 0.2, Colors.get("pink"))
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
	local anchor_offset = group.formation_settings.offsets.ANCHOR_OFFSET
	local wanted_distance = (num_anchors - 1) * anchor_offset.x
	local backward_distance = MainPathUtils.ray_along_node_list(nav_world, node_list, start_node_index, -1, wanted_distance)
	local anchor_offset_x, node_list_direction = nil

	if backward_distance == wanted_distance then
		anchor_offset_x = anchor_offset.x
		node_list_direction = -1
	else
		local forward_distance = MainPathUtils.ray_along_node_list(nav_world, node_list, start_node_index, 1, wanted_distance)

		if forward_distance <= backward_distance then
			anchor_offset_x = backward_distance / wanted_distance * anchor_offset.x
			node_list_direction = -1
		else
			anchor_offset_x = forward_distance / wanted_distance * anchor_offset.x
			node_list_direction = 1
		end
	end

	local NODE_LIST_DIRECTION = 1
	local points = MainPathUtils.find_equidistant_points_in_node_list(node_list, start_node_index, NODE_LIST_DIRECTION, anchor_offset_x, num_anchors)
	local num_points = #points
	local invalid_path = num_points < num_anchors

	if invalid_path then
		set_patrol_path_broken(group)

		return 
	end

	table.reverse(points)

	for i = 1, num_anchors, 1 do
		local point = points[i]
		local point_position = point[1]
		local point_forward = point[2]
		local segment_start_node = point[3]
		local anchor = anchors[i]
		anchor.point = Vector3Box(point_position)
		anchor.point_on_path = anchor.point
		anchor.wanted_direction = Vector3Box(point_forward)
		anchor.current_direction = anchor.wanted_direction
		anchor.node_index = segment_start_node + 1
	end

	if script_data.debug_storm_vermin_patrol then
		Debug.storm_vermin_patrols_done = Debug.storm_vermin_patrols_done or -1
		Debug.storm_vermin_patrols_done = Debug.storm_vermin_patrols_done + 1
	end

	return 
end

function update_units(nav_world, group, t, dt)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members
	local far_away_threshold = 10
	local any_unit_lagging_behind = false
	local all_units_caught_up = true
	local anchors = group.anchors
	local anchor = anchors[1]
	local spline = anchor.spline
	local movement = spline.movement(spline)
	local spline_speed = movement.speed(movement)
	local slow_mode = spline_speed == group.formation_settings.speeds.SLOW_SPLINE_SPEED

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]

		if blackboard.patrol_start_delay_timer then
			blackboard.patrol_start_delay_timer = blackboard.patrol_start_delay_timer - dt

			if blackboard.patrol_start_delay_timer < 0 then
				blackboard.patrol_start_delay_timer = nil
				blackboard.goal_destination = blackboard.stored_goal_destination
				blackboard.patrolling = true
			end
		else
			local unit_pos = POSITION_LOOKUP[unit]
			local breed = blackboard.breed
			local navigation_extension = blackboard.navigation_extension
			local group_extension = ScriptUnit.extension(unit, "ai_group_system")
			local row = group_extension.group_row
			local anchor_index = row
			local anchor = group.anchors[anchor_index]
			local anchor_point = Vector3Box.unbox(anchor.point)
			local anchor_dir = Vector3Box.unbox(anchor.current_direction)
			local dir_normal = Vector3(anchor_dir.y, -anchor_dir.x, 0)
			local anchor_unit_index = group_extension.group_column
			anchor.units[anchor_unit_index] = unit
			local anchor_position = anchor.positions[anchor_unit_index]
			local destination = anchor_position.unbox(anchor_position)
			local unit_to_formation_pos_distance = Vector3.distance(unit_pos, destination)

			if 1 < unit_to_formation_pos_distance then
				local fast_walk_speed = group.formation_settings.speeds.FAST_WALK_SPEED

				navigation_extension.set_max_speed(navigation_extension, fast_walk_speed)
			elseif 0.5 < unit_to_formation_pos_distance then
				local medium_walk_speed = group.formation_settings.speeds.MEDIUM_WALK_SPEED

				navigation_extension.set_max_speed(navigation_extension, medium_walk_speed)
			else
				local walk_speed = group.formation_settings.speeds.WALK_SPEED

				navigation_extension.set_max_speed(navigation_extension, walk_speed)
			end

			if far_away_threshold < unit_to_formation_pos_distance then
				any_unit_lagging_behind = true
			end

			if far_away_threshold / 2 < unit_to_formation_pos_distance then
				all_units_caught_up = false
			end

			if unit_to_formation_pos_distance < 0.25 and slow_mode then
				blackboard.goal_destination = nil
			end

			local success, altitude = GwNavQueries.triangle_from_position(nav_world, destination, 1, 10)

			if success then
				navigation_extension.move_to(navigation_extension, destination)
			end
		end
	end

	if any_unit_lagging_behind then
		spline_speed = group.formation_settings.speeds.SLOW_SPLINE_SPEED
	elseif all_units_caught_up then
		spline_speed = group.formation_settings.speeds.SPLINE_SPEED

		for i = 1, num_indexed_members, 1 do
			local unit = indexed_members[i]
			local blackboard = BLACKBOARDS[unit]

			if blackboard.patrolling then
				blackboard.goal_destination = blackboard.stored_goal_destination
			end
		end
	end

	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local spline = anchor.spline

		set_spline_speed(spline, spline_speed, group)
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

			for j, unit in pairs(anchor_units) do
				local blackboard = BLACKBOARDS[unit]
				local navigation_extension = blackboard.navigation_extension
				local reached_start_position = navigation_extension.has_reached_destination(navigation_extension, 0.3)
				in_formation = reached_start_position and not blackboard.climb_state
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
		local walk_speed = group.formation_settings.speeds.WALK_SPEED

		navigation_extension.set_max_speed(navigation_extension, walk_speed)

		local num_anchors = #group.anchors
		local spline_speed = group.formation_settings.speeds.SPLINE_SPEED
		local patrol_start_delay_timer = ((num_anchors - 1) * spline_speed) / 2
		local is_roaming_patrol = group.group_type == "roaming_patrol"
		local random_delay = (is_roaming_patrol and math.random() * 1 - 0.5) or 0
		blackboard.stored_goal_destination = blackboard.goal_destination
		blackboard.goal_destination = nil
		blackboard.patrol_start_delay_timer = patrol_start_delay_timer + random_delay
		blackboard.patrolling = false
	end

	for i, anchor in ipairs(group.anchors) do
		anchor.start_timer = i - 1
	end

	play_sound(group, "FORMATED")

	return 
end

function update_spline_anchor_points(nav_world, group, dt)
	local nav_data = group.nav_data
	local node_data = nav_data.node_data
	local main_spline_status = nil
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "storm_vermin_patrol_immidiate"
	})
	local num_anchors = #group.anchors

	for i = 1, num_anchors, 1 do
		local anchor = group.anchors[i]

		if anchor.start_timer then
			anchor.start_timer = anchor.start_timer - dt

			if anchor.start_timer < 0 then
				anchor.start_timer = nil
			end
		else
			local previous_anchor = group.anchors[i - 1]
			local previous_position = anchor.point:unbox()
			local spline = anchor.spline
			local movement = spline.movement(spline)
			local status = movement.update(movement, dt)

			if not previous_anchor then
				main_spline_status = status
			end

			fassert(movement._t == movement._t, "Nan in spline %s", spline._name)

			local position = movement.current_position(movement)
			local direction = position - previous_position

			anchor.point:store(position)
			anchor.point_on_path:store(position)

			anchor.wanted_direction = Vector3Box(direction)
			local is_circular_spline = anchor.is_circular_spline

			if status == "end" and is_circular_spline then
				movement.reset_to_start(movement)
			end

			if script_data.debug_storm_vermin_patrol then
				drawer.sphere(drawer, position, 0.1, Colors.get("cadet_blue"))
			end
		end
	end

	local main_spline = group.anchors[1].spline

	if script_data.debug_storm_vermin_patrol then
		main_spline.draw(main_spline, 10, drawer, 1, Colors.get("blue"))
	end

	if main_spline_status == "start" then
		local last_node = #nav_data.node_list

		change_path_direction(group, last_node)
		enter_state_patrolling(group)

		return 
	end

	local is_circular_spline = group.anchors[1].is_circular_spline

	if main_spline_status == "end" and not is_circular_spline then
		local despawn_at_end = group.despawn_at_end

		if despawn_at_end then
			local indexed_members = group.indexed_members
			local num_indexed_members = group.num_indexed_members

			for i = 1, num_indexed_members, 1 do
				local unit = indexed_members[i]
				local blackboard = BLACKBOARDS[unit]

				Managers.state.conflict:destroy_unit(unit, blackboard, "patrol_finished")
			end
		else
			local last_node = #nav_data.node_list

			change_path_direction(group, last_node)
			enter_state_patrolling(group)
		end
	end

	return 
end

local end_points = {}

function update_anchor_positions(nav_world, group, dt)
	local end_points = end_points
	local num_anchors = #group.anchors

	for i = 1, num_anchors, 1 do
		local anchor = group.anchors[i]
		local anchor_point = Vector3Box.unbox(anchor.point)
		local anchor_dir = Vector3Box.unbox(anchor.current_direction)
		local dir_normal = Vector3(anchor_dir.y, -anchor_dir.x, 0)
		local num_positions = #anchor.positions
		local anchor_offset = group.formation_settings.offsets.ANCHOR_OFFSET
		local anchor_offset_y = (2 < num_positions and anchor_offset.y * (num_positions - 1)) or anchor_offset.y
		local offset_1, offset_2 = nil
		local wanted_offset_1 = anchor.wanted_offset[1]
		local wanted_offset_2 = anchor.wanted_offset[2]

		if wanted_offset_1 < 0.5 then
			offset_1 = wanted_offset_1
			offset_2 = (anchor_offset_y + anchor_offset_y) - wanted_offset_1
		elseif wanted_offset_2 < 0.5 then
			offset_2 = wanted_offset_2
			offset_1 = (anchor_offset_y + anchor_offset_y) - wanted_offset_2
		else
			offset_1 = anchor_offset_y
			offset_2 = anchor_offset_y
		end

		local wanted_destination_1 = anchor_point - wanted_offset_1 * dir_normal
		local wanted_destination_2 = anchor_point + wanted_offset_2 * dir_normal
		local check1_up = 0.6
		local check1_down = 10
		local check2_up = 1.2
		local check2_down = 10
		local check2_side = 5
		local check2_obstacle_distance = 1
		local end_point_1 = find_position_on_navmesh(nav_world, wanted_destination_1, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)
		local end_point_2 = find_position_on_navmesh(nav_world, wanted_destination_2, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)
		end_points[1] = end_point_1
		end_points[2] = end_point_2
		local distance_1 = Vector3.distance(end_points[1], anchor_point)
		local distance_2 = Vector3.distance(end_points[2], anchor_point)
		local total_distance = distance_1 + distance_2

		if 0 < total_distance then
			local distance_1_percent = distance_1 / total_distance
			local distance_2_percent = distance_2 / total_distance
			local distributed_distance_1 = distance_1_percent * anchor_offset_y * 2
			local distributed_distance_2 = distance_2_percent * anchor_offset_y * 2
			anchor.wanted_offset[1] = distributed_distance_1
			anchor.wanted_offset[2] = distributed_distance_2
		else
			anchor.wanted_offset[1] = anchor_offset_y
			anchor.wanted_offset[2] = anchor_offset_y
		end

		for j = 1, num_positions, 1 do
			if num_positions == 1 then
				local offset = (wanted_offset_1 - wanted_offset_2) / 2
				local wanted_destination = anchor_point + offset * dir_normal
				local position = find_position_on_navmesh(nav_world, wanted_destination, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)

				anchor.positions[j]:store(position)
			elseif j == 1 then
				anchor.positions[j]:store(end_points[1])
			elseif j == num_positions then
				anchor.positions[j]:store(end_points[2])
			else
				local offset = wanted_offset_1 - (anchor_offset_y * 2 * (j - 1)) / (num_positions - 1)
				local wanted_destination = anchor_point - offset * dir_normal
				local position = find_position_on_navmesh(nav_world, wanted_destination, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)

				anchor.positions[j]:store(position)
			end
		end
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

		if script_data.debug_storm_vermin_patrol then
			QuickDrawer:vector(anchor_position_on_path + Vector3.up() * 0.25, Vector3.normalize(wanted_face_dir) * 2, Colors.get("sea_green"))
		end

		local previous_anchor = group.anchors[i - 1]

		if not previous_anchor then
			local anchor_offset = group.formation_settings.offsets.ANCHOR_OFFSET
			local face_position = anchor_position_on_path
			local length_along_path = anchor_offset.x
			local distance_to_next_node = nil
			local target_node = node_list[target_node_index]

			if not target_node then
				break
			end

			target_node = target_node.unbox(target_node)
			local search_node_dir = wanted_face_dir
			local search_node_index = target_node_index
			face_position = face_position + search_node_dir * length_along_path

			if script_data.debug_storm_vermin_patrol then
				local drawer = Managers.state.debug:drawer({
					mode = "immediate",
					name = "storm_vermin_patrol_immidiate"
				})

				drawer.sphere(drawer, face_position, 0.15, Colors.get("cyan"))
				drawer.line(drawer, anchor_position_on_path, face_position, Colors.get("cyan"))
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
		local testproduct = wanted_rad * previous_face_rad
		wanted_rad = (wanted_rad + previous_face_rad) / 2

		if math.pi < testsum and testproduct < 0 then
			if wanted_rad < 0 then
				wanted_rad = wanted_rad + math.pi
			else
				wanted_rad = wanted_rad - math.pi
			end
		end

		local difference = wanted_rad - face_rad

		if 0.0001 < math.abs(difference) then
			local movement = TURN_SPEED * dt

			if math.pi < difference then
				difference = difference - math.pi * 2
			elseif difference < -math.pi then
				difference = difference + math.pi * 2
			end

			if difference < 0 then
				movement = movement * -1
			end

			face_rad = face_rad + movement

			if math.abs(difference) <= math.abs(movement) then
				face_rad = wanted_rad
			end

			face_dir.x = math.cos(face_rad)
			face_dir.y = math.sin(face_rad)
		end

		anchor.current_direction:store(face_dir)

		if script_data.debug_storm_vermin_patrol then
			QuickDrawer:vector(anchor_position_on_path + Vector3.up() * 0.3, Vector3.normalize(face_dir) * 2.5, Colors.get("purple"))
		end

		local anchor_units = anchor.units

		for j, unit in pairs(anchor_units) do
			local blackboard = BLACKBOARDS[unit]
			blackboard.anchor_direction = anchor.current_direction
		end
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
	local is_roaming_patrol = group.group_type == "roaming_patrol"
	local use_controlled_advance = group.use_controlled_advance
	local someone_is_climbing = false

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local target_unit = blackboard.target_unit

		if use_controlled_advance and blackboard.climb_state then
			someone_is_climbing = true
		end

		local valid_players = valid_players_and_bots
		local valid_player = valid_players[target_unit]

		if valid_player then
			group_targets[target_unit] = true
			blackboard.target_unit = nil
		elseif target_unit then
			group_targets[target_unit] = nil
			blackboard.target_unit = nil
		end
	end

	local has_targets = next(group_targets) ~= nil

	if has_targets then
		if use_controlled_advance and not is_roaming_patrol and not someone_is_climbing then
			enter_state_controlled_advance(nav_world, group, t)
		else
			switch_perception(group, "patrol_active_perception", "patrol_active_target_selection")
			acquire_targets(group)
			enter_state_combat(group)
		end
	end

	return 
end

function check_for_doors(group)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
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

function enter_state_opening_door(group, door_unit)
	set_state(group, "opening_door")

	group.door_unit = door_unit
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		blackboard.goal_destination = nil
		local navigation_extension = blackboard.navigation_extension

		navigation_extension.reset_destination(navigation_extension)
	end

	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local spline = anchor.spline
		local spline_speed = group.formation_settings.speeds.SLOW_SPLINE_SPEED

		set_spline_speed(spline, spline_speed, group)
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
		end

		local anchors = group.anchors
		local num_anchors = #anchors

		for i = 1, num_anchors, 1 do
			local anchor = anchors[i]
			local spline = anchor.spline
			local spline_speed = group.formation_settings.speeds.SPLINE_SPEED

			set_spline_speed(spline, spline_speed, group)
		end

		set_state(group, "patrolling")
	end

	return 
end

function enter_state_controlled_advance(nav_world, group, t)
	acquire_targets(group)

	group.attack_latest_t = t + CONTROLLED_ADVANCE_TIME_LIMIT
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
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

		if ScriptUnit.has_extension(unit, "ai_slot_system") then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system.do_slot_search(ai_slot_system, unit, true)
		end

		local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")
		local use_patrol_perception = ai_group_extension.use_patrol_perception

		if use_patrol_perception then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = ai_extension.breed(ai_extension)
			local perception_func_name = breed.patrol_active_perception
			local target_selection_func_name = breed.patrol_active_target_selection

			ai_extension.set_perception(ai_extension, perception_func_name, target_selection_func_name)
		end

		blackboard.preferred_door_action = "smash"

		navigation_extension.allow_layer(navigation_extension, "planks", true)
		GwNavTagLayerCostTable.allow_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)
	end

	set_state(group, "controlled_advance")
	play_sound(group, "PLAYER_SPOTTED")

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
	local anchors_to_targets_ratio = math.max(1, num_anchors / target_count)

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local target_unit_index = math.ceil(i / anchors_to_targets_ratio)
		local current_index = 1
		local selected_target_unit = nil

		for target_unit, _ in pairs(group_targets) do
			if target_unit_index <= current_index then
				selected_target_unit = target_unit

				break
			end

			current_index = current_index + 1
		end

		fassert(selected_target_unit, "No target from aquire_targets")

		anchor.target_unit = selected_target_unit
		local anchor_units = anchor.units

		for j, unit in pairs(anchor_units) do
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

function switch_perception(group, breed_perception_name, breed_target_selection_name)
	local network_manager = Managers.state.network
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]

		if ScriptUnit.has_extension(unit, "ai_inventory_system") then
			local unit_id = network_manager.unit_game_object_id(network_manager, unit)

			network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
		end

		local blackboard = BLACKBOARDS[unit]
		local breed = blackboard.breed
		local perception_name = breed[breed_perception_name]
		local target_selection_name = breed[breed_target_selection_name]
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		ai_extension.set_perception(ai_extension, perception_name, target_selection_name)
	end

	return 
end

function enter_state_combat(group)
	set_state(group, "in_combat")

	group.patrol_in_combat = true
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local target_unit = anchor.target_unit

		print("enter_state_combat", i, target_unit, "alive:", AiUtils.unit_alive(target_unit))

		if AiUtils.unit_alive(target_unit) then
			local anchor_units = anchor.units

			for j, unit in pairs(anchor_units) do
				local blackboard = BLACKBOARDS[unit]
				blackboard.goal_destination = nil
				blackboard.target_unit = target_unit
				blackboard.target_unit_found_time = Managers.time:time("game")

				AiUtils.activate_unit(blackboard)
				print("\tactivated", j)

				if ScriptUnit.has_extension(unit, "ai_slot_system") then
					local ai_slot_system = Managers.state.entity:system("ai_slot_system")

					ai_slot_system.do_slot_search(ai_slot_system, unit, true)
				end
			end
		end

		anchor.target_unit = nil
	end

	play_sound(group, "CHARGE")

	if group.has_extra_breed then
		play_sound(group, "CHARGE_EXTRA")
	end

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

			group.patrol_in_combat = false
		end
	end

	return 
end

function set_patrol_path_broken(group)
	group.patrol_path_broken = true
	local spline_name = group.spline_name or ""

	print("Broken patrol path, spline_name", spline_name)

	local members = group.indexed_members

	for i, unit in ipairs(members) do
		local blackboard = BLACKBOARDS[unit]

		Managers.state.conflict:destroy_unit(unit, blackboard, "patrol_path_broken")
	end

	return 
end

return 
