require("scripts/settings/patrol_formation_settings")
require("scripts/helpers/navigation_utils")

local POSITION_LOOKUP = POSITION_LOOKUP
local BLACKBOARDS = BLACKBOARDS
local Vector3_distance_squared = Vector3.distance_squared
local GwNavQueries_triangle_from_position = GwNavQueries.triangle_from_position
local GwNavQueries_raycast = GwNavQueries.raycast
local GwNavQueries_inside_position_from_outside_position = GwNavQueries.inside_position_from_outside_position

local function debug_print(...)
	if script_data.debug_patrols then
		print(...)
	end
end

local TURN_SPEED = math.pi * 0.7
local CONTROLLED_ADVANCE_SPEED = 2.77
local CONTROLLED_ADVANCE_TIME_LIMIT = 5
local COMBAT_RANGE_SQ = 25
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
local FORMATION_TIME = 8
local valid_players_and_bots = VALID_TARGETS_PLAYERS_AND_BOTS
local CIRCULAR_SPLINE_THRESHOLD = 5
local CIRCULAR_SPLINE_THRESHOLD_SQ = CIRCULAR_SPLINE_THRESHOLD^2
local play_sound, pick_sound_source_unit, update_animation_triggered_sounds, init_group, set_state, remove_dead_units, calculate_group_middle_position, change_path_direction, unit_animation_event, set_patrol_path_broken, enter_state_find_path_entry, set_path_direction, enter_state_forming, set_forming_positions, set_end_of_spline_positions, debug_draw_formation, check_is_in_formation, update_units, find_position_on_navmesh, enter_state_patrolling, update_spline_anchor_points, update_anchor_positions, update_anchor_direction, check_for_players, check_for_doors, check_prepare_for_combat, enter_state_opening_door, update_state_opening_door, enter_state_controlled_advance, acquire_targets, controlled_advance, prepare_for_combat, cleanup_after_combat, enter_state_combat = nil
AIGroupTemplates = AIGroupTemplates or {}
AIGroupTemplates.spline_patrol = {
	in_patrol = true,
	pre_unit_init = function (unit, group)
		local blackboard = BLACKBOARDS[unit]
		blackboard.ignore_interest_points = true
	end,
	init = function (world, nav_world, group, t)
		init_group(nav_world, group, world, t)
		enter_state_forming(nav_world, group, nil)
	end,
	destroy = function (world, nav_world, group, unit)
		local nav_data = group.nav_data

		GwNavTagLayerCostTable.destroy(nav_data.navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(nav_data.nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(nav_data.traverse_logic)

		if script_data.debug_patrols then
			Managers.state.debug:drawer({
				mode = "retained",
				name = "storm_vermin_patrol_targeting_retained"
			}):reset()
		end
	end,
	update = function (world, nav_world, group, t, dt)
		remove_dead_units(group)
		check_for_players(group, nav_world, t, dt)

		if group.num_indexed_members == 0 or group.patrol_path_broken then
			return
		end

		local state = group.state

		if state == "find_path_entry" then
		elseif state == "forming" then
			update_units(nav_world, group, t, dt)
			check_is_in_formation(group, dt)
			check_prepare_for_combat(group, t)
		elseif state == "patrolling" then
			local door_found = check_for_doors(group)

			if door_found then
				return
			end

			Profiler.start("update spline anchor points")
			update_spline_anchor_points(nav_world, group, dt)
			Profiler.stop("update spline anchor points")
			Profiler.start("update anchor direction")
			update_anchor_direction(nav_world, group, dt)
			Profiler.stop("update anchor direction")
			Profiler.start("update anchor positions")
			update_anchor_positions(nav_world, group)
			Profiler.stop("update anchor positions")
			Profiler.start("update units")
			update_units(nav_world, group, t, dt)
			Profiler.stop("update units")
			Profiler.start("update animation triggers")
			update_animation_triggered_sounds(group, t)
			Profiler.stop("update animation triggers")
			Profiler.start("update prepare for combat")
			check_prepare_for_combat(group, t)
			Profiler.stop("update prepare for combat")
		elseif state == "opening_door" then
			update_state_opening_door(group)
		elseif state == "controlled_advance" then
			update_animation_triggered_sounds(group, t)
			controlled_advance(nav_world, group, t, dt)
		elseif state == "in_combat" then
		end
	end,
	setup_group = function (world, nav_world, group, first_unit)
		group.target_units = {}
	end,
	BT_debug = function (group)
		return {
			"GROUP_SYSTEM:",
			tostring(group.template),
			"state:" .. (group.state or ""),
			"previous_state:" .. (group.previous_state or ""),
			"num members: " .. (group.members_n or 1)
		}
	end
}

function play_sound(group, event)
	pick_sound_source_unit(group)

	local audio_system = Managers.state.entity:system("audio_system")
	local sound_settings = group.formation_settings.sounds
	local sound_event = sound_settings[event]

	audio_system:play_audio_unit_event(sound_event, group.wwise_source_unit)
end

function pick_sound_source_unit(group)
	local wanted_unit_i = math.ceil(group.num_indexed_members * 0.5)
	local wanted_unit = group.indexed_members[wanted_unit_i]
	group.wwise_source_unit = wanted_unit
end

function update_animation_triggered_sounds(group, t)
	local source_unit = group.wwise_source_unit

	if not AiUtils.unit_alive(source_unit) then
		pick_sound_source_unit(group)

		source_unit = group.wwise_source_unit
	end

	local blackboard = BLACKBOARDS[source_unit]

	if group.patrol_sound_at_t < t then
		local audio_system = Managers.state.entity:system("audio_system")
		local sound_settings = group.formation_settings.sounds
		local foley_sound = sound_settings.FOLEY

		audio_system:play_audio_unit_event(foley_sound, source_unit)

		if group.has_extra_breed then
			local extra_foley_sound = sound_settings.FOLEY_EXTRA

			audio_system:play_audio_unit_event(extra_foley_sound, source_unit)
		end

		local patrol_voice_sound = sound_settings.VOICE

		audio_system:play_audio_unit_event(patrol_voice_sound, source_unit)

		group.patrol_sound_at_t = t + 0.5
	end
end

local function set_spline_speed(spline, speed, group)
	local nav_data = group.nav_data
	local direction = nav_data.node_direction
	local direction_modifier = (direction == "reversed" and -1) or 1
	local spline_speed = speed * direction_modifier
	local movement = spline:movement()

	movement:set_speed(spline_speed)
end

function set_state(group, state_name)
	debug_print("[Patrol] Entered state:", state_name)

	group.previous_state = group.state
	group.state = state_name
end

local dead_units = {}

function remove_dead_units(group)
	local units_has_died = false
	local killing_player = nil
	local Unit_alive = Unit.alive
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = num_indexed_members, 1, -1 do
		local unit = indexed_members[i]

		if not AiUtils.unit_alive(unit) then
			table.remove(indexed_members, i)

			num_indexed_members = num_indexed_members - 1
			dead_units[unit] = true
			units_has_died = true

			if not killing_player and Unit_alive(unit) then
				local blackboard = BLACKBOARDS[unit]
				local previous_attacker = blackboard.previous_attacker

				if AiUtils.unit_alive(previous_attacker) then
					killing_player = previous_attacker
				end
			end
		end
	end

	group.num_indexed_members = num_indexed_members

	if units_has_died then
		local anchors = group.anchors
		local num_anchors = #anchors

		for i = num_anchors, 1, -1 do
			local anchor = anchors[i]
			local anchor_units = anchor.units
			local all_units_dead = true

			for j, unit in pairs(anchor_units) do
				if dead_units[unit] then
					anchor_units[j] = nil
				else
					all_units_dead = false

					if killing_player then
						local blackboard = BLACKBOARDS[unit]
						blackboard.previous_attacker = killing_player
					end
				end
			end

			if all_units_dead then
				table.remove(anchors, i)
			end
		end

		table.clear(dead_units)
	end
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

function find_position_on_navmesh(nav_world, position, origin_position, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, direction)
	local found_position = nil
	local success, altitude = GwNavQueries_triangle_from_position(nav_world, origin_position, check1_up, check1_down)

	if success then
		origin_position = Vector3(origin_position.x, origin_position.y, altitude)
		local _, hit_position = GwNavQueries_raycast(nav_world, origin_position, position)
		found_position = hit_position
	else
		local nav_pos = nil
		local num_distance_checks = 12
		local direction_normalized = Vector3.normalize(Vector3.flat(direction))

		for i = 0, num_distance_checks - 1, 1 do
			local distance = 0.5 * i
			local offset_forward = direction_normalized * distance
			local offset_position = position + offset_forward
			local success, altitude = GwNavQueries_triangle_from_position(nav_world, offset_position, check1_up, check1_down)

			if success then
				nav_pos = Vector3(offset_position.x, offset_position.y, altitude)

				break
			else
				local inside_position = GwNavQueries_inside_position_from_outside_position(nav_world, offset_position, check2_up, check2_down, check2_side, check2_obstacle_distance)

				if inside_position then
					nav_pos = inside_position

					break
				end
			end
		end

		if nav_pos then
			found_position = nav_pos
		else
			found_position = origin_position
		end
	end

	if script_data.debug_patrols then
		if success then
			QuickDrawer:sphere(found_position, 0.1, Colors.get("green"))
			QuickDrawer:line(found_position, origin_position, Colors.get("green"))
		elseif found_position == origin_position then
			QuickDrawer:sphere(found_position, 0.1, Colors.get("red"))
		else
			QuickDrawer:sphere(found_position, 0.1, Colors.get("yellow"))
			QuickDrawer:line(found_position, origin_position, Colors.get("yellow"))
		end

		QuickDrawer:sphere(position, 0.05, Colors.get("orange"))
	end

	return found_position
end

function change_path_direction(group)
	local nav_data = group.nav_data
	local current_direction = nav_data.node_direction
	local new_direction = (current_direction == "reversed" and "forward") or "reversed"

	set_path_direction(group, new_direction, current_direction)
	debug_print("[Patrol] Changed path direction at spline_index:", group.anchors[1].spline:movement():current_spline_index(), "New direction:", new_direction)
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

	for i = 1, num_spline_points, 1 do
		local spline_point = spline_points[i]
		node_data.forward_list[i] = Vector3Box(spline_point)
		local reversed_index = num_spline_points - i + 1
		node_data.reversed_list[reversed_index] = Vector3Box(spline_point)
	end

	local start_position = spline_points[1]
	local end_position = spline_points[num_spline_points]
	local distance_sq = Vector3_distance_squared(start_position, end_position)
	local is_circular_spline = distance_sq < CIRCULAR_SPLINE_THRESHOLD_SQ
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
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

local function initialize_spline_to_anchor_start_positions(group)
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local anchor_position = anchor.point:unbox()
		local spline_curve = anchor.spline
		local spline_index, subdivision_index, t = NavigationUtils.get_position_on_interpolated_spline(spline_curve, anchor_position)
		local movement = spline_curve:movement()

		movement:set_spline_index(spline_index, subdivision_index, t)
	end
end

local function detect_jump_points(nav_world, group)
	local jump_points = {}
	local anchor = group.anchors[1]
	local spline_curve = anchor.spline
	local movement = spline_curve:movement()
	local start_index = 2
	local end_index = 3
	local above = 1
	local below = 1
	local splines = spline_curve:splines()
	local num_splines = #splines

	for i = 1, num_splines, 1 do
		local spline = splines[i]
		local points = spline.points
		local start_point = points[start_index]:unbox()
		local end_point = points[end_index]:unbox()
		local mid_point = (start_point + end_point) / 2
		local success = GwNavQueries_triangle_from_position(nav_world, mid_point, above, below)

		if not success then
			local num_subdivisions = #spline.subdivisions
			jump_points[i] = {
				forward = {
					next_t = 1,
					start_subdivision_index = 1,
					next_subdivsion_index = num_subdivisions
				},
				reversed = {
					next_t = 0,
					next_subdivsion_index = 1,
					start_subdivision_index = num_subdivisions
				}
			}
		end
	end

	group.jump_points = jump_points
end

function init_group(nav_world, group, world, t)
	fassert(group.members_n > 0, "Group was initialized with zero members!")

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
	local anchor_offset = formation_settings.offsets.ANCHOR_OFFSET
	local anchors = {}
	local num_anchors = #group.formation

	for i = 1, num_anchors, 1 do
		anchors[i] = {
			point = Vector3Box(),
			wanted_direction = Vector3Box(),
			current_direction = Vector3Box(),
			units = {}
		}
		local columns = group.formation[i]
		local num_columns = #columns
		local positions = {}
		local anchor_start_position = Vector3.zero()
		local anchor_start_direction = nil

		for c = 1, num_columns, 1 do
			local data = columns[c]
			local column_position = data.start_position
			positions[c] = column_position
			anchor_start_position = anchor_start_position + column_position:unbox()
			anchor_start_direction = anchor_start_direction or data.start_direction:unbox()
		end

		anchor_start_position = anchor_start_position / num_columns

		anchors[i].point:store(anchor_start_position)

		anchors[i].positions = positions

		anchors[i].current_direction:store(anchor_start_direction)
		anchors[i].wanted_direction:store(anchor_start_direction)

		local anchor_offset_y = anchor_offset.y * math.max(num_columns - 1, 1)
		anchors[i].wanted_offset = {
			anchor_offset_y,
			anchor_offset_y
		}
	end

	group.anchors = anchors
	local extra_breed_name = formation_settings.extra_breed_name
	local group_has_extra_breed = false
	local num_indexed_members = 0
	local indexed_members = {}
	local is_spline_patrol = group.group_type == "spline_patrol"

	for unit, _ in pairs(group.members) do
		if AiUtils.unit_alive(unit) then
			local blackboard = BLACKBOARDS[unit]
			blackboard.only_trust_your_own_eyes = is_spline_patrol
			local breed = blackboard.breed
			local breed_name = breed.name

			if breed_name == extra_breed_name then
				group_has_extra_breed = true
			end

			local navigation_extension = blackboard.navigation_extension

			navigation_extension:set_far_pathing_allowed(false)

			if breed.use_navigation_path_splines then
				GwNavBot.set_use_channel(navigation_extension._nav_bot, false)
			end

			local group_extension = ScriptUnit.extension(unit, "ai_group_system")
			local row = group_extension.group_row
			local column = group_extension.group_column
			local anchor = anchors[row]
			anchor.units[column] = unit
			group_extension.anchor = anchor
			num_indexed_members = num_indexed_members + 1
			indexed_members[num_indexed_members] = unit
			blackboard.preferred_door_action = "open"

			navigation_extension:allow_layer("planks", false)
			GwNavTagLayerCostTable.forbid_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)

			local use_patrol_perception = group_extension.use_patrol_perception

			if use_patrol_perception then
				local ai_extension = ScriptUnit.extension(unit, "ai_system")
				local breed = blackboard.breed
				local perception_func_name = breed.patrol_passive_perception
				local target_selection_func_name = breed.patrol_passive_target_selection

				fassert(perception_func_name, "Missing patrol passive perception!")
				fassert(target_selection_func_name, "Missing patrol passive target selection!")
				ai_extension:set_perception(perception_func_name, target_selection_func_name)
			end
		end
	end

	group.indexed_members = indexed_members
	group.num_indexed_members = num_indexed_members
	group.has_extra_breed = group_has_extra_breed
	group.attack_latest_t = 0
	group.controlled_advance_distance_check_t = 0
	group.door_unit = nil
	group.use_controlled_advance = formation_settings.use_controlled_advance
	group.patrol_sound_at_t = t
	group.end_of_spline_forming_positions_function = (is_spline_patrol and set_end_of_spline_positions) or set_forming_positions
	local node_data = find_patrol_spline(world, group)
	group.nav_data.node_data = node_data

	set_path_direction(group, "forward")
	initialize_spline_to_anchor_start_positions(group)
	detect_jump_points(nav_world, group)
end

function enter_state_find_path_entry(nav_world, group)
	set_state(group, "find_path_entry")

	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local middle_position = calculate_group_middle_position(group)
	local closest_node_index = MainPathUtils.closest_node_in_node_list(node_list, middle_position)
	local new_forming_positions = set_forming_positions(nav_world, group, closest_node_index)

	if new_forming_positions then
		initialize_spline_to_anchor_start_positions(group)
	end

	enter_state_patrolling(group)
end

function set_path_direction(group, direction, current_direction)
	local nav_data = group.nav_data
	local anchors = group.anchors
	local num_anchors = #anchors

	if direction == "forward" then
		nav_data.node_direction = "forward"
		nav_data.node_list = nav_data.node_data.forward_list

		if current_direction then
			for i = 1, num_anchors, 1 do
				local anchor = anchors[i]
				local spline = anchor.spline

				spline:movement():reset_to_start()
				set_spline_speed(spline, 0, group)
			end
		end
	else
		nav_data.node_direction = "reversed"
		nav_data.node_list = nav_data.node_data.reversed_list

		if current_direction then
			for i = 1, num_anchors, 1 do
				local anchor = anchors[i]
				local spline = anchor.spline

				spline:movement():reset_to_end()
				set_spline_speed(spline, 0, group)
			end
		end
	end
end

function enter_state_forming(nav_world, group, set_forming_positions_function)
	if script_data.debug_patrols then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "patrol_retained"
		})

		drawer:reset()
		Managers.state.debug_text:clear_world_text("patrol_world_text")
	end

	set_state(group, "forming")

	local nav_data = group.nav_data
	local end_node_index = #nav_data.node_list
	local goal_destination = nav_data.node_list[end_node_index]:unbox()
	local above = 1
	local below = 1
	local success, altitude = GwNavQueries_triangle_from_position(nav_world, goal_destination, above, below)

	if not success then
		debug_print("[Patrol] WARNING: Spawned patrol with invalid path marker in level")
		Debug.sticky_text("WARNING: Spawned patrol with invalid path marker in level")

		if script_data.debug_patrols then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "patrol_retained"
			})

			drawer:sphere(goal_destination, 0.5, Colors.get("yellow"))
			drawer:sphere(goal_destination, 0.4, Colors.get("red"))
		end

		return
	end

	goal_destination.z = altitude
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension
		local walk_speed = group.formation_settings.speeds.WALK_SPEED

		navigation_extension:set_max_speed(walk_speed)

		blackboard.goal_destination = nil
		blackboard.stored_goal_destination = Vector3Box(goal_destination)

		if script_data.debug_patrols then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "patrol_retained"
			})

			drawer:sphere(goal_destination, 0.5, Colors.get("yellow"))
			drawer:sphere(goal_destination, 0.4, Colors.get("green"))
		end
	end

	if set_forming_positions_function then
		local success, set_spline_positions = set_forming_positions_function(nav_world, group)

		if not success then
			set_patrol_path_broken(group)
		elseif set_spline_positions then
			initialize_spline_to_anchor_start_positions(group)
		end
	end

	play_sound(group, "FORMATE")
	play_sound(group, "FORMING")

	if script_data.debug_patrols then
		debug_draw_formation(group)
	end
end

function debug_draw_formation(group)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "patrol_retained"
	})
	local debug_text_manager = Managers.state.debug_text
	local nav_data = group.nav_data
	local node_list = nav_data.node_list

	for i = 1, #node_list, 1 do
		local node = node_list[i]
		local node_position = node:unbox()

		drawer:sphere(node_position, 0.1, Colors.get("yellow"))
		debug_text_manager:output_world_text(i, 0.3, node_position + Vector3(0, 0, 0.3), nil, "patrol_world_text", Vector3(255, 255, 0))

		local next_node = nav_data.node_list[i + 1]

		if next_node then
			next_node = next_node:unbox()

			drawer:line(node_position, next_node, Colors.get("yellow"))
		end
	end

	local anchors = group.anchors

	for i = 1, #anchors, 1 do
		local anchor = anchors[i]
		local anchor_position = anchor.point:unbox()
		local offset_y = Vector3(0, 0, 0.2 + i * 0.04)

		drawer:sphere(anchor_position, 0.08, Colors.get("pink"))
		drawer:line(anchor_position, anchor_position + offset_y, Colors.get("pink"))
		drawer:vector(anchor_position + offset_y, anchor.wanted_direction:unbox() * 0.2, Colors.get("pink"))
	end
end

function set_end_of_spline_positions(nav_world, group)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local anchors = group.anchors
	local num_anchors = #anchors
	local first_node = node_list[1]:unbox()
	local second_node = node_list[2]:unbox()
	local direction = Vector3.normalize(second_node - first_node)

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]

		anchor.point:store(first_node)
		anchor.wanted_direction:store(direction)
		anchor.current_direction:store(direction)
	end

	return true, false
end

function set_forming_positions(nav_world, group, target_node_index)
	local nav_data = group.nav_data
	local node_list = nav_data.node_list
	local anchors = group.anchors
	local num_anchors = #anchors
	local target_node_index = target_node_index or 2
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
	local points = FrameTable.alloc_table()

	MainPathUtils.find_equidistant_points_in_node_list(node_list, start_node_index, NODE_LIST_DIRECTION, anchor_offset_x, num_anchors, points)

	local num_points = #points
	local invalid_path = num_anchors > num_points

	if invalid_path then
		debug_print("[Patrol] Failed finding forming positions around node index", target_node_index)

		return false, false
	else
		table.reverse(points)

		for i = 1, num_anchors, 1 do
			local point = points[i]
			local point_position = point[1]
			local point_forward = point[2]
			local anchor = anchors[i]

			anchor.point:store(point_position)
			anchor.wanted_direction:store(point_forward)
			anchor.current_direction:store(point_forward)
		end

		return true, true
	end
end

local FAST_WALK_SPEED_THRESHOLD_SQ = 1
local MEDIUM_WALK_SPEED_THRESHOLD_SQ = 0.25
local ANCHOR_WANTED_DISTANCE = PatrolFormationSettings.default_settings.speeds.SPLINE_SPEED
local ANCHOR_LAGGING_BEHIND_THRESHOLD = ANCHOR_WANTED_DISTANCE + 1.5
local ANCHOR_TOO_CLOSE_THRESHOLD = ANCHOR_WANTED_DISTANCE / 2
local LAGGING_BEHIND_THRESHOLD_SQ = (ANCHOR_WANTED_DISTANCE * 0.5)^2

local function get_spline_distance_between_anchors(from_anchor, to_anchor)
	local from_spline = from_anchor.spline
	local to_spline = to_anchor.spline
	local from_spline_movement = from_anchor.spline:movement()
	local to_spline_movement = to_anchor.spline:movement()
	local from_spline_distance = from_spline_movement:current_spline_curve_distance()
	local to_spline_distance = to_spline_movement:current_spline_curve_distance()
	local delta = math.abs(from_spline_distance - to_spline_distance)

	return delta
end

function update_units(nav_world, group, t, dt)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members
	local anchors = group.anchors

	for i = 1, num_indexed_members, 1 do
		repeat
			local unit = indexed_members[i]
			local blackboard = BLACKBOARDS[unit]
			local unit_pos = POSITION_LOOKUP[unit]
			local navigation_extension = blackboard.navigation_extension
			local group_extension = ScriptUnit.extension(unit, "ai_group_system")
			local anchor = group_extension.anchor
			local anchor_unit_index = group_extension.group_column
			local anchor_position = anchor.positions[anchor_unit_index]
			local destination = anchor_position:unbox()
			local unit_to_formation_pos_distance_sq = Vector3_distance_squared(unit_pos, destination)

			if FAST_WALK_SPEED_THRESHOLD_SQ < unit_to_formation_pos_distance_sq then
				local fast_walk_speed = group.formation_settings.speeds.FAST_WALK_SPEED

				navigation_extension:set_max_speed(fast_walk_speed)
			elseif MEDIUM_WALK_SPEED_THRESHOLD_SQ < unit_to_formation_pos_distance_sq then
				local medium_walk_speed = group.formation_settings.speeds.MEDIUM_WALK_SPEED

				navigation_extension:set_max_speed(medium_walk_speed)
			else
				local walk_speed = group.formation_settings.speeds.WALK_SPEED

				navigation_extension:set_max_speed(walk_speed)
			end

			if LAGGING_BEHIND_THRESHOLD_SQ < unit_to_formation_pos_distance_sq then
				anchor.unit_is_lagging_behind = true
			end

			local anchor_is_in_slow_mode = anchor.spline:movement():speed() == 0

			if anchor_is_in_slow_mode and navigation_extension:has_reached_destination() then
				blackboard.goal_destination = nil
			elseif not blackboard.goal_destination then
				blackboard.goal_destination = blackboard.stored_goal_destination
			end

			local success, altitude = GwNavQueries_triangle_from_position(nav_world, destination, 1, 1)

			if success then
				navigation_extension:move_to(destination)
			end
		until true
	end

	local num_anchors = #anchors
	local nav_data = group.nav_data
	local current_direction = nav_data.node_direction

	if group.state == "patrolling" then
		for i = 1, num_anchors, 1 do
			local anchor = anchors[i]
			local anchor_spline_index = anchor.spline:movement():current_spline_index()
			local anchor_position = anchor.point:unbox()
			local behind_anchor = anchors[i + 1]
			local spline = anchor.spline
			local slow_down_needed = false

			if anchor.unit_is_lagging_behind then
				slow_down_needed = true
				anchor.unit_is_lagging_behind = false
			end

			if behind_anchor then
				local behind_anchor_spline_index = behind_anchor.spline:movement():current_spline_index()
				local is_foward_direction = current_direction == "forward"

				if (is_foward_direction and behind_anchor_spline_index <= anchor_spline_index) or (not is_foward_direction and anchor_spline_index <= behind_anchor_spline_index) then
					local distance = get_spline_distance_between_anchors(anchor, behind_anchor)

					if ANCHOR_LAGGING_BEHIND_THRESHOLD < distance or (anchor.behind_slow_mode and ANCHOR_WANTED_DISTANCE < distance) then
						slow_down_needed = true
						anchor.behind_slow_mode = true
					else
						anchor.behind_slow_mode = false
					end
				end
			end

			local ahead_anchor = anchors[i - 1]

			if ahead_anchor and not slow_down_needed then
				local distance = get_spline_distance_between_anchors(anchor, ahead_anchor)

				if distance < ANCHOR_TOO_CLOSE_THRESHOLD or (anchor.ahead_slow_mode and distance < ANCHOR_WANTED_DISTANCE) then
					slow_down_needed = true
					anchor.ahead_slow_mode = true
				else
					anchor.ahead_slow_mode = false
				end
			end

			if slow_down_needed then
				set_spline_speed(spline, 0, group)
			else
				set_spline_speed(spline, group.formation_settings.speeds.SPLINE_SPEED, group)
			end
		end
	end
end

local formation_timer = 0

function check_is_in_formation(group, dt)
	formation_timer = formation_timer + dt
	local in_formation = true

	if formation_timer < FORMATION_MAX_TIME then
		local indexed_members = group.indexed_members
		local num_indexed_members = group.num_indexed_members

		for i = 1, num_indexed_members, 1 do
			local unit = indexed_members[i]
			local blackboard = BLACKBOARDS[unit]
			local navigation_extension = blackboard.navigation_extension
			local has_reached_destination = navigation_extension:has_reached_destination()
			in_formation = has_reached_destination and not blackboard.climb_state

			if not in_formation then
				break
			end
		end
	end

	local first_formation_done = group.first_formation_done

	if not first_formation_done or (FORMATION_TIME <= formation_timer and in_formation) then
		enter_state_patrolling(group)

		group.first_formation_done = true
	end
end

function enter_state_patrolling(group)
	set_state(group, "patrolling")

	formation_timer = 0
	local anchors = group.anchors
	local num_anchors = #anchors
	local walk_speed = group.formation_settings.speeds.WALK_SPEED
	local is_roaming_patrol = group.group_type == "roaming_patrol"
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_max_speed(walk_speed)

		blackboard.stored_goal_destination = blackboard.goal_destination or blackboard.stored_goal_destination
		blackboard.goal_destination = blackboard.stored_goal_destination
		blackboard.patrolling = true
	end

	play_sound(group, "FORMATED")
end

function update_spline_anchor_points(nav_world, group, dt)
	local nav_data = group.nav_data
	local main_spline_status = nil
	local Vector3_length_squared = Vector3.length_squared
	local is_circular_spline = group.anchors[1].is_circular_spline
	local current_direction = nav_data.node_direction
	local despawn_at_end = group.despawn_at_end
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		repeat
			local anchor = anchors[i]
			local previous_anchor = group.anchors[i - 1]
			local previous_position = anchor.point:unbox()
			local spline = anchor.spline
			local movement = spline:movement()
			local status = movement:update(dt)

			if not previous_anchor then
				main_spline_status = status
			end

			local position = movement:current_position()
			local direction = position - previous_position

			anchor.point:store(position)

			if Vector3_length_squared(direction) > 0 then
				anchor.wanted_direction:store(direction)
			end

			if status == "end" then
				if is_circular_spline then
					movement:reset_to_start()
				elseif despawn_at_end then
					local anchor_units = anchor.units
					local conflict_director = Managers.state.conflict

					for j, unit in pairs(anchor_units) do
						local blackboard = BLACKBOARDS[unit]

						conflict_director:destroy_unit(unit, blackboard, "patrol_finished")
					end
				end
			end

			if script_data.debug_patrols then
				QuickDrawer:sphere(position, 0.1, Colors.get("cadet_blue"))
			end
		until true
	end

	if script_data.debug_patrols then
		local main_spline = anchors[1].spline

		main_spline:draw(10, QuickDrawer, 1, Colors.get("blue"))
	end

	if ((current_direction == "forward" and main_spline_status == "end") or (current_direction == "reversed" and main_spline_status == "start")) and not despawn_at_end and not is_circular_spline then
		change_path_direction(group)
		enter_state_forming(nav_world, group, group.end_of_spline_forming_positions_function)
	end
end

function update_anchor_positions(nav_world, group)
	local anchor_offset = group.formation_settings.offsets.ANCHOR_OFFSET
	local check1_up = 0.6
	local check1_down = 1
	local check2_up = 1.2
	local check2_down = 1
	local check2_side = 1
	local check2_obstacle_distance = 1
	local anchors = group.anchors
	local num_anchors = #anchors
	local nav_data = group.nav_data
	local current_direction = nav_data.node_direction
	local jump_points = group.jump_points

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local spline = anchor.spline
		local movement = spline:movement()
		local current_spline_index = movement:current_spline_index()
		local current_subdivision_index = movement:current_subdivision_index()
		local jump_data = jump_points[current_spline_index]
		local jump_data_direction = jump_data and jump_data[current_direction]

		if jump_data_direction and jump_data_direction.start_subdivision_index == current_subdivision_index then
			local next_subdivsion_index = jump_data_direction.next_subdivsion_index
			local next_t = jump_data_direction.next_t

			movement:set_spline_index(current_spline_index, next_subdivsion_index, next_t)
		else
			local anchor_point = anchor.point:unbox()
			local anchor_dir = anchor.current_direction:unbox()
			local dir_normal = Vector3(anchor_dir.y, -anchor_dir.x, 0)
			local num_positions = #anchor.positions
			local anchor_offset_y = anchor_offset.y * math.max(num_positions - 1, 1)
			local wanted_offset_1 = anchor.wanted_offset[1]
			local wanted_destination_1 = anchor_point - wanted_offset_1 * dir_normal
			local wanted_offset_2 = anchor.wanted_offset[2]
			local wanted_destination_2 = anchor_point + wanted_offset_2 * dir_normal
			local end_point_1 = find_position_on_navmesh(nav_world, wanted_destination_1, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)
			local end_point_2 = find_position_on_navmesh(nav_world, wanted_destination_2, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)
			local distance_1 = math.sqrt((end_point_1.x - anchor_point.x)^2 + (end_point_1.y - anchor_point.y)^2)
			local distance_2 = math.sqrt((end_point_2.x - anchor_point.x)^2 + (end_point_2.y - anchor_point.y)^2)
			local total_distance = distance_1 + distance_2

			if total_distance > 0 then
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

			if num_positions == 1 then
				local offset = (wanted_offset_1 - wanted_offset_2) / 2
				local wanted_destination = anchor_point + offset * dir_normal
				local position = find_position_on_navmesh(nav_world, wanted_destination, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)

				anchor.positions[1]:store(position)
			else
				for j = 1, num_positions, 1 do
					if j == 1 then
						anchor.positions[j]:store(end_point_1)
					elseif j == num_positions then
						anchor.positions[j]:store(end_point_2)
					else
						local offset = wanted_offset_1 - (anchor_offset_y * 2 * (j - 1)) / (num_positions - 1)
						local wanted_destination = anchor_point - offset * dir_normal
						local position = find_position_on_navmesh(nav_world, wanted_destination, anchor_point, check1_up, check1_down, check2_up, check2_down, check2_side, check2_obstacle_distance, anchor_dir)

						anchor.positions[j]:store(position)
					end
				end
			end
		end
	end
end

function update_anchor_direction(nav_world, group, dt)
	local nav_data = group.nav_data
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local wanted_face_dir = anchor.wanted_direction:unbox()
		local wanted_rad = math.atan2(wanted_face_dir.y, wanted_face_dir.x)
		local previous_face_rad = nil
		local previous_anchor = group.anchors[i - 1]

		if previous_anchor then
			local previous_face_dir = previous_anchor.current_direction:unbox()
			previous_face_rad = math.atan2(previous_face_dir.y, previous_face_dir.x)
		else
			previous_face_rad = wanted_rad
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

		local current_direction = anchor.current_direction
		local face_dir = current_direction:unbox()
		local face_rad = math.atan2(face_dir.y, face_dir.x)
		local difference = wanted_rad - face_rad

		if math.abs(difference) > 0.0001 then
			local movement = TURN_SPEED * dt

			if math.pi < difference then
				difference = difference - math.pi * 2
			elseif difference < -math.pi then
				difference = difference + math.pi * 2
			end

			if difference < 0 then
				movement = -movement
			end

			face_rad = face_rad + movement

			if math.abs(difference) <= math.abs(movement) then
				face_rad = wanted_rad
			end

			face_dir.x = math.cos(face_rad)
			face_dir.y = math.sin(face_rad)
		end

		current_direction:store(face_dir)

		if script_data.debug_patrols then
			local anchor_position_on_path = anchor.point:unbox()

			QuickDrawer:vector(anchor_position_on_path + Vector3.up() * 0.25, Vector3.normalize(wanted_face_dir) * 2, Colors.get("sea_green"))
			QuickDrawer:vector(anchor_position_on_path + Vector3.up() * 0.3, Vector3.normalize(face_dir) * 2.5, Colors.get("purple"))
		end

		local anchor_units = anchor.units

		for j, unit in pairs(anchor_units) do
			local blackboard = BLACKBOARDS[unit]
			blackboard.anchor_direction = current_direction
		end
	end
end

function check_for_players(group, nav_world, t, dt)
	local group_targets = group.target_units
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members
	local use_controlled_advance = group.use_controlled_advance
	local someone_is_climbing = false

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local target_unit = blackboard.target_unit or blackboard.previous_attacker

		if use_controlled_advance and blackboard.climb_state then
			someone_is_climbing = true
		end

		local valid_player = valid_players_and_bots[target_unit]

		if valid_player then
			group_targets[target_unit] = true
		elseif target_unit then
			group_targets[target_unit] = nil
			blackboard.target_unit = nil
			blackboard.previous_attacker = nil
		end
	end

	local has_targets = next(group_targets) ~= nil

	if group.has_targets and not has_targets then
		cleanup_after_combat(group)
		enter_state_find_path_entry(nav_world, group)
	end

	group.someone_is_climbing = someone_is_climbing
	group.has_targets = has_targets
end

function check_prepare_for_combat(group, t)
	if group.has_targets then
		prepare_for_combat(group)

		local is_roaming_patrol = group.group_type == "roaming_patrol"
		local use_controlled_advance = group.use_controlled_advance

		if use_controlled_advance and not is_roaming_patrol and not group.someone_is_climbing then
			enter_state_controlled_advance(group, t)
		else
			enter_state_combat(group, t)
		end
	end
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

		navigation_extension:reset_destination()
	end

	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local spline = anchor.spline
		local spline_speed = group.formation_settings.speeds.SLOW_SPLINE_SPEED

		set_spline_speed(spline, spline_speed, group)
	end
end

function update_state_opening_door(group)
	local door_extension = ScriptUnit.extension(group.door_unit, "door_system")

	if not door_extension:is_opening() then
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
end

function enter_state_controlled_advance(group, t)
	group.attack_latest_t = t + CONTROLLED_ADVANCE_TIME_LIMIT
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members
	local network_manager = Managers.state.network

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_max_speed(CONTROLLED_ADVANCE_SPEED)
		network_manager:anim_event(unit, "to_combat")
	end

	set_state(group, "controlled_advance")
	play_sound(group, "PLAYER_SPOTTED")
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
	end
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
					local distance_sq = Vector3_distance_squared(unit_pos, target_pos)

					if distance_sq < COMBAT_RANGE_SQ then
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
		enter_state_combat(group, t)
	end
end

function prepare_for_combat(group)
	acquire_targets(group)

	local network_manager = Managers.state.network
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]

		if ScriptUnit.has_extension(unit, "ai_inventory_system") then
			local unit_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
		end

		if ScriptUnit.has_extension(unit, "ai_slot_system") then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system:do_slot_search(unit, true)
		end

		local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")
		local use_patrol_perception = ai_group_extension.use_patrol_perception

		if use_patrol_perception then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = blackboard.breed
			local perception_func_name = breed.patrol_active_perception
			local target_selection_func_name = breed.patrol_active_target_selection

			ai_extension:set_perception(perception_func_name, target_selection_func_name)
		end

		blackboard.preferred_door_action = "smash"

		blackboard.navigation_extension:allow_layer("planks", true)
		GwNavTagLayerCostTable.allow_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)
	end
end

function cleanup_after_combat(group)
	local indexed_members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = indexed_members[i]
		local blackboard = BLACKBOARDS[unit]

		AiUtils.deactivate_unit(blackboard)

		if ScriptUnit.has_extension(unit, "ai_slot_system") then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system:do_slot_search(unit, false)
		end

		local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")
		local use_patrol_perception = ai_group_extension.use_patrol_perception

		if use_patrol_perception then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local breed = blackboard.breed
			local perception_func_name = breed.patrol_passive_perception
			local target_selection_func_name = breed.patrol_passive_target_selection

			ai_extension:set_perception(perception_func_name, target_selection_func_name)
		end

		if blackboard.breed.use_navigation_path_splines then
			GwNavBot.set_use_channel(blackboard.navigation_extension._nav_bot, false)
		end

		blackboard.preferred_door_action = "open"

		blackboard.navigation_extension:allow_layer("planks", false)
		GwNavTagLayerCostTable.forbid_layer(group.nav_data.navtag_layer_cost_table, LAYER_ID_MAPPING.planks)
	end

	group.patrol_in_combat = false
end

function enter_state_combat(group, t)
	set_state(group, "in_combat")

	group.patrol_in_combat = true
	local anchors = group.anchors
	local num_anchors = #anchors

	for i = 1, num_anchors, 1 do
		local anchor = anchors[i]
		local target_unit = anchor.target_unit

		debug_print("enter_state_combat", i, target_unit, "alive:", AiUtils.unit_alive(target_unit))

		if AiUtils.unit_alive(target_unit) then
			local anchor_units = anchor.units

			for j, unit in pairs(anchor_units) do
				local blackboard = BLACKBOARDS[unit]
				blackboard.goal_destination = nil
				blackboard.target_unit = target_unit
				blackboard.target_unit_found_time = t

				AiUtils.activate_unit(blackboard)
				debug_print("\tactivated", j)

				if blackboard.breed.use_navigation_path_splines then
					GwNavBot.set_use_channel(blackboard.navigation_extension._nav_bot, true)
				end
			end
		end

		anchor.target_unit = nil
	end

	play_sound(group, "CHARGE")

	if group.has_extra_breed then
		play_sound(group, "CHARGE_EXTRA")
	end
end

function set_patrol_path_broken(group)
	group.patrol_path_broken = true
	local spline_name = group.spline_name or ""

	print("[Patrol] Broken patrol path, spline_name", spline_name)

	local members = group.indexed_members
	local num_indexed_members = group.num_indexed_members

	for i = 1, num_indexed_members, 1 do
		local unit = members[i]
		local blackboard = BLACKBOARDS[unit]

		Managers.state.conflict:destroy_unit(unit, blackboard, "patrol_path_broken")
	end
end

return
