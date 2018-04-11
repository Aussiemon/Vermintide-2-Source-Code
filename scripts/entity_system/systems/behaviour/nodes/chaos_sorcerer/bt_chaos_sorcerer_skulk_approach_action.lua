require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosSorcererSkulkApproachAction = class(BTChaosSorcererSkulkApproachAction, BTNode)
local BTChaosSorcererSkulkApproachAction = BTChaosSorcererSkulkApproachAction
local Unit_alive = Unit.alive
local POSITION_LOOKUP = POSITION_LOOKUP
BTChaosSorcererSkulkApproachAction.init = function (self, ...)
	BTChaosSorcererSkulkApproachAction.super.init(self, ...)

	self.cover_points_broadphase = Managers.state.conflict.level_analysis.cover_points_broadphase

	return 
end
BTChaosSorcererSkulkApproachAction.name = "BTChaosSorcererSkulkApproachAction"
BTChaosSorcererSkulkApproachAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local breed = blackboard.breed
	local target_dist = blackboard.target_dist
	local skulk_data = blackboard.skulk_data or {}
	blackboard.skulk_data = skulk_data
	skulk_data.direction = skulk_data.direction or 1 - math.random(0, 1) * 2
	skulk_data.radius = skulk_data.radius or blackboard.target_dist
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		self.idle(self, unit, blackboard)
	end

	local ai_navigation = blackboard.navigation_extension

	ai_navigation.set_max_speed(ai_navigation, breed.run_speed)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		self.move_to(self, move_pos, unit, blackboard)
	end

	blackboard.ready_to_summon = false
	blackboard.num_summons = blackboard.num_summons or 0

	if action.sorcerer_type == "tentacle" then
		if not blackboard.portal_data then
			blackboard.portal_data = {
				chance_to_look_for_wall_spawn = 0.5,
				search_counter = 0,
				portal_spawn_type = "n/a",
				portal_search_timer = t + 3,
				cover_units = {},
				portal_spawn_pos = Vector3Box(),
				portal_spawn_rot = QuaternionBox(),
				physics_world = World.get_data(blackboard.world, "physics_world")
			}
			blackboard.spell = blackboard.portal_data
		end
	elseif action.sorcerer_type == "vortex" and not blackboard.vortex_data then
		self._initialize_vortex_data(self, blackboard, action)

		blackboard.spell = blackboard.vortex_data
	end

	if blackboard.teleport_health_percent == nil or blackboard.set_teleport_hp then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		blackboard.health_extension = health_extension
		blackboard.teleport_health_percent = health_extension.current_health_percent(health_extension) - action.part_hp_lost_to_teleport
		blackboard.set_teleport_hp = nil
	end

	blackboard.travel_teleport_timer = t + ConflictUtils.random_interval(action.teleport_cooldown)

	return 
end
local VORTEX_CHECK_ANGLE_INCREMENT = math.pi / 4
BTChaosSorcererSkulkApproachAction._initialize_vortex_data = function (self, blackboard, action)
	local vortex_template = VortexTemplates[action.vortex_template_name]
	local max_radius = vortex_template.full_inner_radius
	local start_check_direction = Vector3.forward() * max_radius
	local check_directions = {}

	for i = 1, 8, 1 do
		local current_rotation = Quaternion(Vector3.up(), VORTEX_CHECK_ANGLE_INCREMENT * (i - 1))
		local direction = Quaternion.rotate(current_rotation, start_check_direction)
		check_directions[i] = Vector3Box(direction)
	end

	blackboard.vortex_data = {
		spawn_timer = 3,
		physics_world = World.get_data(blackboard.world, "physics_world"),
		vortex_spawn_pos = Vector3Box(),
		vortex_units = {},
		radius_check_directions = check_directions,
		vortex_template = vortex_template
	}

	return 
end
BTChaosSorcererSkulkApproachAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local skulk_data = blackboard.skulk_data
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	if reason == "aborted" then
		local path_found = navigation_extension.is_following_path(navigation_extension)

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self.start_move_animation(self, unit, blackboard)
		end
	end

	skulk_data.animation_state = nil
	blackboard.action = nil

	return 
end
BTChaosSorcererSkulkApproachAction.run = function (self, unit, blackboard, t, dt)
	local ai_navigation = blackboard.navigation_extension
	local path_found = ai_navigation.is_following_path(ai_navigation)
	local failed_attempts = ai_navigation.number_failed_move_attempts(ai_navigation)
	local action = blackboard.action

	if self[action.search_func_name](self, unit, blackboard, t, blackboard.spell) then
		return "done"
	end

	local skulk_data = blackboard.skulk_data

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self.start_move_animation(self, unit, blackboard)
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()

	if current_health_percent < blackboard.teleport_health_percent then
		local unit_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_unit]
		local center_pos = unit_pos
		local target_dist_sq = Vector3.distance_squared(unit_pos, target_pos)

		if action.far_away_from_target_sq < target_dist_sq then
			center_pos = target_pos
		end

		local spread = math.random() * 5 + math.random() * 5 + math.random() * 5
		local dist = spread * 0.5 + action.preferred_distance
		local tries = 5
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(blackboard.nav_world, unit_pos, dist, spread, tries)

		if teleport_pos then
			blackboard.set_teleport_hp = true
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			skulk_data.direction = nil
			blackboard.move_pos = nil

			return "done"
		end
	elseif blackboard.travel_teleport_timer < t then
		local teleport_pos = self.get_skulk_target(self, unit, blackboard, true)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil

			return "done"
		end
	end

	local position = blackboard.move_pos

	if position then
		local at_goal = self.at_goal(self, unit, blackboard)

		if at_goal or 0 < failed_attempts then
			blackboard.move_pos = nil
		end

		return "running"
	end

	local position = self.get_skulk_target(self, unit, blackboard)

	if position then
		self.move_to(self, position, unit, blackboard)

		return "running"
	end

	if blackboard.move_state ~= "idle" then
		self.idle(self, unit, blackboard)
	end

	return "running"
end
BTChaosSorcererSkulkApproachAction.at_goal = function (self, unit, blackboard)
	local skulk_data = blackboard.skulk_data
	local position_boxed = blackboard.move_pos

	if not position_boxed then
		return false
	end

	local position = position_boxed.unbox(position_boxed)
	local distance = Vector3.distance_squared(position, POSITION_LOOKUP[unit])

	if distance < 0.25 then
		return true
	end

	return 
end
BTChaosSorcererSkulkApproachAction.move_to = function (self, position, unit, blackboard)
	local ai_navigation = blackboard.navigation_extension

	ai_navigation.move_to(ai_navigation, position)

	blackboard.move_pos = Vector3Box(position)

	return 
end
BTChaosSorcererSkulkApproachAction.idle = function (self, unit, blackboard)
	self.anim_event(self, unit, blackboard, "idle")

	blackboard.move_state = "idle"

	return 
end
BTChaosSorcererSkulkApproachAction.start_move_animation = function (self, unit, blackboard)
	local move_animation = blackboard.action.move_animation

	self.anim_event(self, unit, blackboard, move_animation)

	blackboard.move_state = "moving"

	return 
end
BTChaosSorcererSkulkApproachAction.anim_event = function (self, unit, blackboard, anim)
	local skulk_data = blackboard.skulk_data

	if skulk_data.animation_state ~= anim then
		Managers.state.network:anim_event(unit, anim)

		skulk_data.animation_state = anim
	end

	return 
end
local TRIES = 15
BTChaosSorcererSkulkApproachAction.get_skulk_target = function (self, unit, blackboard, teleporting)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local skulk_data = blackboard.skulk_data
	local direction = skulk_data.direction
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local dist = blackboard.target_dist
	local to_target = unit_position - target_position
	local to_target_dir = Vector3.normalize(to_target)
	local preferred_distance = action.preferred_distance

	if blackboard.is_close then
		if dist < preferred_distance then
			to_target = to_target + to_target_dir * (1 + math.random())
		else
			blackboard.is_close = false
			to_target = to_target + to_target_dir
		end
	elseif dist < action.close_distance then
		blackboard.is_close = true
		to_target = to_target + to_target_dir
	end

	local cross_dir = Vector3(0, 0, direction)
	local mod = 0.1
	local alpha = math.pi * math.clamp((mod * 20) / dist, 0.01, 0.15)

	if teleporting then
		alpha = alpha * 1.5
	end

	for i = 1, TRIES, 1 do
		local rot_vec = to_target - to_target_dir * 0.5

		if blackboard.num_summons and (action.teleport_closer_summon_limit or 3) <= blackboard.num_summons then
			rot_vec = Vector3.normalize(target_position - unit_position) * action.teleport_closer_range
		end

		local pos = target_position + Quaternion.rotate(Quaternion(cross_dir, alpha * i), rot_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos then
			return pos
		end
	end

	skulk_data.direction = skulk_data.direction * -1

	return 
end
BTChaosSorcererSkulkApproachAction.debug_show_skulk_circle = function (self, unit, blackboard)
	local action = blackboard.action
	local skulk_data = blackboard.skulk_data
	local radius = skulk_data.radius
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local offset = Vector3.up() * 0.2

	QuickDrawer:circle(target_position + offset, blackboard.target_dist, Vector3.up(), Colors.get("light_green"))
	QuickDrawer:circle(target_position + offset, skulk_data.radius, Vector3.up(), Colors.get("light_green"))

	skulk_data.radius = blackboard.target_dist

	return 
end
BTChaosSorcererSkulkApproachAction.update_dummie = function (self, unit, blackboard, t)
	return false
end
BTChaosSorcererSkulkApproachAction._update_vortex_search = function (self, unit, blackboard, t, vortex_data)
	if vortex_data.spawn_timer < t then
		Profiler.start("_update_vortex_search")

		local vortex_units = vortex_data.vortex_units
		local num_vortex_units = #vortex_units
		local i = 1

		while i <= num_vortex_units do
			local vortex_unit = vortex_units[i]

			if not Unit_alive(vortex_unit) then
				vortex_units[i] = vortex_units[num_vortex_units]
				vortex_units[num_vortex_units] = nil
				num_vortex_units = num_vortex_units - 1
			else
				i = i + 1
			end
		end

		local action = blackboard.action
		local target_distance = blackboard.target_dist
		local target_within_reach = target_distance and action.min_cast_vortex_distance < target_distance and target_distance < action.max_cast_vortex_distance

		if not blackboard.freeze_spell_casting and num_vortex_units < blackboard.max_vortex_units and target_within_reach then
			local target_unit = blackboard.target_unit
			local head_node = Unit.node(unit, "j_head")
			local head_position = Unit.world_position(unit, head_node)
			local target_node = Unit.node(target_unit, "j_head")
			local target_node_position = Unit.world_position(target_unit, target_node)
			local physics_world = vortex_data.physics_world
			local target_line_of_sight, hit_position = PerceptionUtils.is_position_in_line_of_sight(unit, head_position, target_node_position, physics_world)

			if not target_line_of_sight then
				vortex_data.spawn_timer = t + action.vortex_check_timer

				Profiler.stop("_update_vortex_search")

				return false
			end

			local vortex_cast_position, min_radius = BTChaosSorcererSkulkApproachAction._get_vortex_cast_position(unit, blackboard, vortex_data, physics_world)

			if not vortex_cast_position then
				vortex_data.spawn_timer = t + action.vortex_check_timer

				Profiler.stop("_update_vortex_search")

				return false
			end

			blackboard.ready_to_summon = true
			blackboard.num_summons = blackboard.num_summons + 1

			vortex_data.vortex_spawn_pos:store(vortex_cast_position)

			vortex_data.vortex_spawn_radius = min_radius
			vortex_data.spawn_timer = t + action.vortex_spawn_timer

			Profiler.stop("_update_vortex_search")

			return true
		else
			vortex_data.spawn_timer = t + action.vortex_check_timer

			Profiler.stop("_update_vortex_search")
		end
	end

	return 
end
BTChaosSorcererSkulkApproachAction._get_vortex_cast_position = function (unit, blackboard, vortex_data, physics_world)
	local action = blackboard.action
	local params = FrameTable.alloc_table()
	local target_distance = blackboard.target_dist
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension.traverse_logic(navigation_extension)
	params.nav_world = blackboard.nav_world
	params.physics_world = physics_world
	params.from_unit = unit
	params.from_node_name = "j_head"
	params.to_unit = blackboard.target_unit
	params.to_node_name = "j_head"
	params.min_distance = action.min_player_vortex_distance
	params.max_distance = math.min(target_distance, action.max_player_vortex_distance)
	params.max_tries = 3
	params.outside_goal_tries = 3
	params.above = 15
	params.below = 15
	params.min_angle_step = 4
	params.max_angle_step = 8
	params.traverse_logic = traverse_logic
	local vortex_template = VortexTemplates[action.vortex_template_name]
	local min_wanted_radius = vortex_template.min_inner_radius
	params.min_wanted_radius = min_wanted_radius
	params.radius_check_directions = vortex_data.radius_check_directions
	local cast_position, min_radius = LocomotionUtils.pick_visible_outside_goal(params)

	return cast_position, min_radius
end
local min_dist_to_target = 7
local mean_spawn_distance = 20
local portal_radius = 1.5
local debug_floor = false
local debug_wall = false
BTChaosSorcererSkulkApproachAction.update_portal_search = function (self, unit, blackboard, t, portal_data)
	if blackboard.target_unit and not Unit_alive(blackboard.portal_unit) then
		if portal_data.portal_search_active then
			local target_pos = POSITION_LOOKUP[blackboard.target_unit]
			local found_location = BTChaosSorcererSkulkApproachAction.try_next_portal_location(portal_data, blackboard.nav_world, target_pos)

			if found_location == "success" then
				blackboard.ready_to_summon = true
				portal_data.portal_search_active = false

				return "done"
			elseif found_location == "failed" then
				portal_data.portal_search_timer = 0
				portal_data.portal_search_active = false
				portal_data.portal_search_timer = t + 1
			end
		elseif portal_data.portal_search_timer < t and not blackboard.portal_unit then
			local target_position = POSITION_LOOKUP[blackboard.target_unit]
			local success = BTChaosSorcererSkulkApproachAction.get_portal_location_list(portal_data, target_position)
			portal_data.search_counter = (not success or 0) and portal_data.search_counter + 1
			portal_data.portal_search_active = success
			portal_data.portal_search_timer = t + 1
		end
	end

	return 
end
BTChaosSorcererSkulkApproachAction.get_portal_location_list = function (portal_data, center_position)
	if math.random() <= portal_data.chance_to_look_for_wall_spawn then
		local success = BTChaosSorcererSkulkApproachAction.prepare_wall_search(portal_data, center_position)

		if success then
			portal_data.placement = "wall"

			return true
		else
			portal_data.floor_search_count = 0
			portal_data.placement = "floor"

			return true
		end
	else
		portal_data.floor_search_count = 0
		portal_data.placement = "floor"

		return true
	end

	return false
end
BTChaosSorcererSkulkApproachAction.prepare_wall_search = function (portal_data, center_position)
	local bp = Managers.state.conflict.level_analysis.cover_points_broadphase
	local radius = 30
	local cover_units = portal_data.cover_units
	local num_cover_points = Broadphase.query(bp, center_position, radius, cover_units)

	if num_cover_points <= 0 then
		return false
	end

	portal_data.num_cover_points = num_cover_points
	portal_data.cover_point_index = 1
	portal_data.placement = "wall"

	if debug_wall then
		local unit_local_rotation = Unit.local_rotation
		local unit_local_position = Unit.local_position
		local col = Color(255, 255, 0)
		local col_c = Color(70, 255, 0)
		local up = Vector3(0, 0, 1)

		for i = 1, num_cover_points, 1 do
			local cover_unit = cover_units[i]
			local pos_c = unit_local_position(cover_unit, 0)
			local pos = pos_c + up
			local rot = unit_local_rotation(cover_unit, 0)
			local to_wall = Quaternion.forward(rot)
			local to_right = -Quaternion.right(rot) * 0.85
			local to_up = -Quaternion.up(rot) * 0.85

			QuickDrawerStay:sphere(pos_c, 0.15, col_c)
			QuickDrawerStay:sphere(pos, 0.1, col)
			QuickDrawerStay:line(pos, pos + to_wall, col)
			QuickDrawerStay:line(pos + to_right, pos + to_right + to_wall, col)
			QuickDrawerStay:line(pos - to_right, pos - to_right + to_wall, col)
			QuickDrawerStay:line(pos + to_up, pos + to_up + to_wall, col)
			QuickDrawerStay:line(pos - to_up, pos - to_up + to_wall, col)
		end
	end

	return true
end

local function get_random_pos_on_circle(center_pos, dist, spread)
	local add_vec = Vector3(dist + (math.random() - 0.5) * spread, 0, 1)
	local pos = center_pos + Quaternion.rotate(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))), add_vec)

	return pos
end

BTChaosSorcererSkulkApproachAction.evaluate_floor = function (portal_data, nav_world, center_pos, num_tries)
	local pos = get_random_pos_on_circle(center_pos, mean_spawn_distance, 10)
	local result, hit_pos, disk_pos, spawn_pos_found, floor_normal = nil

	if pos then
		result, hit_pos = GwNavQueries.raycast(nav_world, center_pos, pos)
		disk_pos = GwNavQueries.inside_position_from_outside_position(nav_world, hit_pos, 1, 1, 5, portal_radius)

		if disk_pos then
			local to_disk_pos = disk_pos - center_pos
			local dist = Vector3.length(to_disk_pos)

			if min_dist_to_target < dist then
				local triangle = GwNavTraversal.get_seed_triangle(nav_world, disk_pos)
				local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
				floor_normal = Vector3.normalize(Vector3.cross(p2 - p1, p3 - p1))
				local floor_rot = Quaternion.look(floor_normal, Vector3.normalize(to_disk_pos))

				if portal_data.portal_spawn_pos then
					portal_data.portal_spawn_pos:store(disk_pos)
					portal_data.portal_spawn_rot:store(floor_rot)
				end

				portal_data.portal_spawn_type = "floor"
				portal_data.portal_search_active = false
				spawn_pos_found = "success"

				Debug.sticky_text("Found floor pos")
			end
		end
	end

	if debug_floor and pos then
		QuickDrawer:sphere(pos, 0.25, Color(0, 200, 200))
		QuickDrawer:line(pos, center_pos, Color(0, 200, 125))

		if hit_pos then
			QuickDrawerStay:sphere(hit_pos, 0.5, Color(20, 200, 70))
		end

		if spawn_pos_found then
			QuickDrawer:line(hit_pos, disk_pos, Color(20, 200, 70))
			QuickDrawer:sphere(disk_pos, portal_radius, Color(20, 200, 70))
			QuickDrawer:line(disk_pos, disk_pos + floor_normal, Color(20, 200, 70))
		else
			Debug.sticky_text("no random floor pick pos found")
		end
	end

	return spawn_pos_found
end
local min_spawn_dist_sqr = 25
BTChaosSorcererSkulkApproachAction.evaluate_wall = function (portal_data, nav_world, center_pos, num_tries)
	local index = portal_data.cover_point_index
	local num_cover_points = portal_data.num_cover_points
	local exit_index = index + num_tries
	local cover_units = portal_data.cover_units
	local unit_local_rotation = Unit.local_rotation
	local unit_local_position = Unit.local_position
	local traverse_logic = nil

	while index < exit_index do
		if num_cover_points < index then
			portal_data.portal_search_active = false

			return "failed"
		end

		local cover_unit = cover_units[index]
		local pos = unit_local_position(cover_unit, 0)

		if min_spawn_dist_sqr < Vector3.distance_squared(pos, center_pos) then
			local rot = unit_local_rotation(cover_unit, 0)
			local wall_normal = Quaternion.forward(rot)
			local result = true

			if result then
				local hit_wall, hit_position, dist, normal, actor = PhysicsWorld.immediate_raycast(portal_data.physics_world, pos + Vector3(0, 0, 1), wall_normal, 1.5, "closest", "collision_filter", "filter_ai_mover")

				if hit_wall then
					if portal_data.portal_spawn_pos then
						local wall_rot = Quaternion.look(normal, Vector3.up())

						portal_data.portal_spawn_pos:store(hit_position)
						portal_data.portal_spawn_rot:store(wall_rot)
					end

					portal_data.portal_spawn_type = "wall"
					portal_data.portal_search_active = false

					if debug_wall then
						QuickDrawerStay:cylinder(hit_position, hit_position + normal, portal_radius, Color(220, 60, 70), 10)
						QuickDrawerStay:sphere(hit_position, portal_radius * 0.5, Color(220, 30, 30))
					end

					return "success"
				end
			end
		end

		index = index + 1
	end

	portal_data.cover_point_index = index

	return 
end
BTChaosSorcererSkulkApproachAction.try_next_portal_location = function (portal_data, nav_world, center_pos)
	local placement = portal_data.placement
	local target_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, center_pos, 3, 3)

	if target_on_navmesh then
		center_pos = Vector3.copy(center_pos)

		Vector3.set_z(center_pos, altitude)
	end

	local success = nil

	if placement == "floor" then
		local num_tries = 3

		for i = 1, num_tries, 1 do
			local result = BTChaosSorcererSkulkApproachAction.evaluate_floor(portal_data, nav_world, center_pos)

			if result then
				return result
			end
		end

		portal_data.floor_search_count = portal_data.floor_search_count + num_tries

		if 30 < portal_data.floor_search_count then
			return "failed"
		end
	elseif placement == "wall" then
		local num_tries = 3

		return BTChaosSorcererSkulkApproachAction.evaluate_wall(portal_data, nav_world, center_pos, num_tries)
	end

	return 
end

return 
