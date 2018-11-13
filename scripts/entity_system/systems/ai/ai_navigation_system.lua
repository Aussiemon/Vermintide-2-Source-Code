local WAIT_TIMER_MAX = 5
local WAIT_TIMER_INCREMENT = 1
local Unit_alive = Unit.alive
local extensions = {
	"AINavigationExtension",
	"PlayerBotNavigation"
}
AINavigationSystem = class(AINavigationSystem, ExtensionSystemBase)

AINavigationSystem.init = function (self, entity_system_creation_context, system_name)
	AINavigationSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.unit_extension_data = {}
	self.frozen_unit_extension_data = {}
	self.enabled_units = {}
	self.delayed_units = {}
	self.navbots_to_release = {}
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.nav_world = nav_world
end

AINavigationSystem.destroy = function (self)
	AINavigationSystem.super.destroy(self)
end

AINavigationSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = AINavigationSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	if extension_name == "AINavigationExtension" then
		self.unit_extension_data[unit] = extension
	end

	return extension
end

AINavigationSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	AINavigationSystem.super.on_remove_extension(self, unit, extension_name)
end

AINavigationSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit] or self.delayed_units[unit]

	fassert(extension, "Unit was already frozen.")

	if extension == nil then
		return
	end

	self.frozen_unit_extension_data[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

AINavigationSystem._cleanup_extension = function (self, unit, extension_name)
	self.unit_extension_data[unit] = nil
	self.enabled_units[unit] = nil

	if self.delayed_unit == unit then
		self.delayed_unit = next(self.delayed_units, unit)
	end

	self.delayed_units[unit] = nil
end

AINavigationSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit] or self.delayed_units[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self.unit_extension_data[unit] = nil
	frozen_extensions[unit] = extension

	extension:freeze()
end

AINavigationSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension

	extension:unfreeze()
end

AINavigationSystem.simulate_dummy_target = function (self, t)
	local local_player_unit = Managers.player:local_player().player_unit

	if not local_player_unit then
		return
	end

	local player_position = POSITION_LOOKUP[local_player_unit]
	local dummy_pos_on_mesh = ConflictUtils.simulate_dummy_target(self.nav_world, player_position, t)

	if dummy_pos_on_mesh then
		QuickDrawer:sphere(dummy_pos_on_mesh, 1)

		for unit, extension in pairs(self.unit_extension_data) do
			extension._blackboard.goal_destination = Vector3Box(dummy_pos_on_mesh)

			extension:move_to(dummy_pos_on_mesh)
		end
	end
end

AINavigationSystem.update = function (self, context, t)
	local dt = context.dt

	self:update_extension("PlayerBotNavigation", dt, context, t)
	self:update_navbots_to_release()
	self:update_enabled()
	self:update_destination(t)
	self:update_desired_velocity(t, dt)
	self:update_next_smart_object(t, dt)

	if not script_data.disable_crowd_dispersion then
		self:update_dispersion()
	end
end

AINavigationSystem.post_update = function (self, context, t)
	local dt = context.dt

	self:update_position()
end

AINavigationSystem.add_navbot_to_release = function (self, unit)
	local extension = self.unit_extension_data[unit] or self.delayed_units[unit]
	self.navbots_to_release[unit] = extension
end

AINavigationSystem.update_navbots_to_release = function (self)
	for unit, extension in pairs(self.navbots_to_release) do
		extension:release_bot()

		self.navbots_to_release[unit] = nil
		self.enabled_units[unit] = nil

		if self.delayed_unit == unit then
			self.delayed_unit = next(self.delayed_units, unit)
		end

		self.delayed_units[unit] = nil
	end
end

AINavigationSystem.update_enabled = function (self)
	for unit, extension in pairs(self.unit_extension_data) do
		local enabled = extension._nav_bot ~= nil and extension._enabled
		self.enabled_units[unit] = (enabled and extension) or nil
	end

	for unit, extension in pairs(self.delayed_units) do
		local enabled = extension._nav_bot ~= nil and extension._enabled
		self.enabled_units[unit] = (enabled and extension) or nil
	end
end

AINavigationSystem.update_destination = function (self, t)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local Vec3_dist_sq = Vector3.distance_squared
	local navigation_group_manager = Managers.state.conflict.navigation_group_manager

	for unit, extension in pairs(self.enabled_units) do
		local nav_bot = extension._nav_bot
		local is_computing_path = false
		local is_navbot_following_path = false

		if nav_bot then
			is_navbot_following_path = GwNavBot.is_following_path(nav_bot)
			is_computing_path = GwNavBot.is_computing_new_path(nav_bot)
		end

		local blackboard = extension._blackboard
		blackboard.is_navbot_following_path = is_navbot_following_path
		extension._is_computing_path = is_computing_path
		extension._is_navbot_following_path = is_navbot_following_path

		if nav_bot and not is_computing_path and extension._wait_timer < t then
			local position_unit = POSITION_LOOKUP[unit]
			local position_current_destination = extension._destination:unbox()
			local position_wanted_destination = extension._wanted_destination:unbox()
			local repath_allowed = true
			local did_pathfind_just_finish = extension._has_started_pathfind

			if did_pathfind_just_finish then
				extension._has_started_pathfind = nil
				local already_at_current_destination = Vec3_dist_sq(position_unit, position_current_destination) < 0.01
				local pathfind_was_successful = is_navbot_following_path or already_at_current_destination

				if pathfind_was_successful then
					blackboard.no_path_found = nil
					extension._failed_move_attempts = 0
				else
					repath_allowed = false
					blackboard.no_path_found = true
					extension._failed_move_attempts = extension._failed_move_attempts + 1
					extension._wait_timer = t + math.min(WAIT_TIMER_MAX, WAIT_TIMER_INCREMENT * extension._failed_move_attempts)

					if extension._far_pathing_allowed and not self:setup_far_astar(position_unit, position_wanted_destination, extension, blackboard, nav_bot) then
						extension._failed_move_attempts = extension._failed_move_attempts + 1

						extension._wanted_destination:store(position_current_destination)

						blackboard.target_outside_navmesh = true

						if RecycleSettings.destroy_no_path_found_time then
							self.delayed_units[unit] = extension
							self.unit_extension_data[unit] = nil
							extension.delayed_check_time = t + 1.5

							if not extension.delayed_max_time then
								extension.delayed_max_time = t + RecycleSettings.destroy_no_path_found_time
							end
						end
					end
				end
			end

			if blackboard.far_path and is_navbot_following_path then
				local perform_new_path_attempt = false
				local path_node_count = extension:get_path_node_count()

				if path_node_count > 0 then
					local distance_to_end = extension:get_remaining_distance_from_progress_to_end_of_path()
					perform_new_path_attempt = distance_to_end and distance_to_end < 1
				end

				if perform_new_path_attempt then
					repath_allowed = false
					local backup_destination = extension._backup_destination:unbox()
					local original_backup_destination = extension._original_backup_destination:unbox()
					local new_group = navigation_group_manager:get_group_from_position(backup_destination)
					local old_group = navigation_group_manager:get_group_from_position(original_backup_destination)
					local far_path_index = blackboard.current_far_path_index
					local num_far_path_nodes = blackboard.num_far_path_nodes
					local next_path_pos = nil

					if new_group == old_group and far_path_index < num_far_path_nodes - 1 then
						local far_path = blackboard.far_path
						local next_far_path_index = far_path_index + 1
						local next_nav_group = far_path[next_far_path_index]
						next_path_pos = next_nav_group:get_group_center():unbox()
						blackboard.current_far_path_index = next_far_path_index
					else
						blackboard.far_path = nil
						blackboard.current_far_path_index = nil
						blackboard.num_far_path_nodes = nil
						next_path_pos = backup_destination
					end

					GwNavBot.compute_new_path(nav_bot, next_path_pos)
					extension._wanted_destination:store(next_path_pos)
					extension._destination:store(next_path_pos)

					extension._is_computing_path = true
					extension._has_started_pathfind = true
					blackboard.next_smart_object_data.next_smart_object_id = nil
				end
			end

			if repath_allowed then
				local breed = blackboard.breed
				local far_away_distance_sq = breed.navigation_far_away_distance_sq or 36
				local destination_change = Vec3_dist_sq(position_current_destination, position_wanted_destination)
				local dist_to_destination = Vec3_dist_sq(position_unit, position_wanted_destination)
				local destination_far_away = far_away_distance_sq < dist_to_destination
				local change_large_enough = (destination_far_away and destination_change > 9) or (not destination_far_away and destination_change > 0.01)
				local already_at_wanted_destination = dist_to_destination < 0.01
				local is_path_recomputation_needed = GwNavBot.is_path_recomputation_needed(nav_bot)
				local should_start_new_pathfind = is_path_recomputation_needed or (not already_at_wanted_destination and (not is_navbot_following_path or change_large_enough))

				if should_start_new_pathfind then
					GwNavBot.compute_new_path(nav_bot, position_wanted_destination)
					extension._destination:store(position_wanted_destination)

					extension._is_computing_path = true
					extension._has_started_pathfind = true
					extension._wait_timer = 0
					blackboard.next_smart_object_data.next_smart_object_id = nil
				end
			end
		end
	end

	self:update_delayed_units(t)
end

AINavigationSystem.update_delayed_units = function (self, t)
	local delayed_units = self.delayed_units
	local unit = self.delayed_unit

	if Unit_alive(unit) then
		local extension = delayed_units[unit]

		if extension.delayed_check_time < t then
			self.unit_extension_data[unit] = extension
			self.delayed_unit = next(delayed_units, unit)
			delayed_units[unit] = nil
			local nav_bot = extension._nav_bot

			if nav_bot and GwNavBot.is_following_path(nav_bot) then
				extension.delayed_max_time = nil

				return
			end

			if extension.delayed_max_time < t then
				if RecycleSettings.destroy_no_path_only_behind then
					local conflict_director = Managers.state.conflict
					local main_path_info = conflict_director.main_path_info

					if Unit_alive(main_path_info.behind_unit) then
						local info = conflict_director.main_path_player_info[main_path_info.behind_unit]
						local _, _, _, _, my_path_index = MainPathUtils.closest_pos_at_main_path(nil, POSITION_LOOKUP[unit])
						local behind_a_break = my_path_index < info.path_index

						if behind_a_break then
							Managers.state.conflict:destroy_unit(unit, extension._blackboard, "main_path_blocked")
						end
					end
				else
					Managers.state.conflict:destroy_unit(unit, extension._blackboard, "no_path_found")
				end
			end
		end
	end

	if self.delayed_unit == unit then
		self.delayed_unit = next(delayed_units, unit)
	end
end

AINavigationSystem.setup_far_astar = function (self, p1, p2, extension, blackboard, nav_bot)
	if blackboard.far_path then
		blackboard.far_path = nil
		blackboard.current_far_path_index = nil
		blackboard.num_far_path_nodes = nil
	end

	local found_path, next_path_pos, path, num_nodes = self:far_astar(p1, p2)

	if found_path then
		extension:move_to(next_path_pos)
		extension._backup_destination:store(p2)
		extension._original_backup_destination:store(p2)

		blackboard.far_path = path
		blackboard.current_far_path_index = 2
		blackboard.num_far_path_nodes = num_nodes

		GwNavBot.compute_new_path(nav_bot, next_path_pos)
		extension._destination:store(next_path_pos)

		extension._is_computing_path = true
		extension._has_started_pathfind = true
		extension._wait_timer = 0
		blackboard.next_smart_object_data.next_smart_object_id = nil

		return true
	end
end

AINavigationSystem.far_astar = function (self, p1, p2)
	local navigation_group_manager = Managers.state.conflict.navigation_group_manager
	local path, total_path_length = navigation_group_manager:a_star_cached_between_positions(p1, p2)

	if not path then
		return false
	end

	local num_nodes = #path

	if num_nodes <= 1 then
		return false
	end

	if script_data.ai_debug_failed_pathing then
		navigation_group_manager:draw_group_path(path)
	end

	local nav_group = path[2]
	local goal_pos = nav_group:get_group_center():unbox()

	return true, goal_pos, path, num_nodes
end

local SPEED_EPSILON_SQ = 0.0001

AINavigationSystem.update_desired_velocity = function (self, t, dt)
	local raycasts_done = 0
	local nav_world = self.nav_world

	for unit, extension in pairs(self.enabled_units) do
		local blackboard = extension._blackboard
		local navbot_velocity = nil

		if blackboard.move_state ~= "idle" then
			navbot_velocity = GwNavBot.output_velocity(extension._nav_bot)
		else
			navbot_velocity = Vector3.zero()
		end

		local desired_velocity = navbot_velocity
		local pos = POSITION_LOOKUP[unit]
		local wanted_destination = extension._wanted_destination:unbox()
		local distance_sq_to_destination = Vector3.distance_squared(pos, wanted_destination)
		local at_destination = distance_sq_to_destination < 0.010000000000000002
		local navbot_speed_sq = Vector3.length_squared(navbot_velocity)
		local locomotion_extension = blackboard.locomotion_extension
		local locomotion_speed_sq = Vector3.length_squared(locomotion_extension:current_velocity())

		if locomotion_speed_sq == 0 then
			extension._interpolating = false
		end

		local is_computing_path = extension._is_computing_path
		local is_navbot_following_path = extension._is_navbot_following_path
		local need_to_interpolate = navbot_speed_sq < SPEED_EPSILON_SQ and not at_destination and is_computing_path and is_navbot_following_path

		if need_to_interpolate or extension._interpolating then
			extension._interpolating = is_computing_path

			if is_computing_path then
				local wanted_rotation = Quaternion.look(Vector3.flat(wanted_destination - pos), Vector3.up())
				local speed = extension._max_speed

				if raycasts_done < 1 and extension._raycast_timer < t then
					extension._raycast_timer = t + 1
					raycasts_done = raycasts_done + 1
					local target_position = pos + Quaternion.forward(wanted_rotation) * 2
					local result = GwNavQueries.raycango(nav_world, pos, target_position, extension._traverse_logic)

					if not result then
						blackboard.no_path_found = true
						extension._interpolating = nil
						speed = 0
					end
				end

				local rotation_speed = locomotion_extension:get_rotation_speed() * locomotion_extension:get_rotation_speed_modifier() * dt

				if distance_sq_to_destination < 9 then
					rotation_speed = math.min(1, rotation_speed * 2)
					speed = speed * 0.5
				end

				local current_rotation = Unit.world_rotation(unit, 0)
				local new_rotation = Quaternion.lerp(current_rotation, wanted_rotation, rotation_speed)

				locomotion_extension:set_wanted_rotation(new_rotation)

				desired_velocity = Quaternion.forward(new_rotation) * speed
			end
		end

		desired_velocity.z = 0
		local desired_speed = Vector3.length(desired_velocity)
		extension._current_speed = math.min(desired_speed, extension._max_speed, extension._current_speed + dt * 3 * extension._max_speed)
		desired_velocity = Vector3.normalize(desired_velocity) * extension._current_speed

		locomotion_extension:set_wanted_velocity_flat(desired_velocity)
	end
end

AINavigationSystem.update_next_smart_object = function (self, t, dt)
	for unit, extension in pairs(self.enabled_units) do
		local data = extension._blackboard.next_smart_object_data
		local GNSMOI = GwNavSmartObjectInterval
		local next_smartobject_interval = extension._next_smartobject_interval
		local next_smartobject_max_distance = 2

		if GwNavBot.current_or_next_smartobject_interval(extension._nav_bot, next_smartobject_interval, next_smartobject_max_distance) then
			local entrance_pos, entrance_is_at_bot_progress_on_path = GNSMOI.entrance_position(next_smartobject_interval)
			local exit_pos, exit_is_at_the_end_of_path = GNSMOI.exit_position(next_smartobject_interval)
			local next_smart_object_id = GNSMOI.smartobject_id(next_smartobject_interval)
			local nav_graph_system = Managers.state.entity:system("nav_graph_system")

			if next_smart_object_id ~= -1 and nav_graph_system:get_smart_object_type(next_smart_object_id) then
				data.next_smart_object_id = next_smart_object_id

				data.entrance_pos:store(entrance_pos)
				data.exit_pos:store(exit_pos)

				data.entrance_is_at_bot_progress_on_path = entrance_is_at_bot_progress_on_path
				data.exit_is_at_the_end_of_path = exit_is_at_the_end_of_path

				fassert(data.next_smart_object_id)

				data.smart_object_type = nav_graph_system:get_smart_object_type(data.next_smart_object_id)
				data.smart_object_data = nav_graph_system:get_smart_object_data(data.next_smart_object_id)

				fassert(LAYER_ID_MAPPING[data.smart_object_type] ~= nil, "Invalid smart object type %s", data.smart_object_type)
			end
		else
			data.next_smart_object_id = nil
		end

		if data.next_smart_object_id then
			local dist_sq = Vector3.distance_squared(data.entrance_pos:unbox(), Unit.local_position(extension._unit, 0))
			extension._blackboard.is_in_smartobject_range = dist_sq < 4
		end
	end
end

AINavigationSystem.update_dispersion = function (self, t, dt)
	for unit, extension in pairs(self.enabled_units) do
		local action = GwNavBot.update_logic_for_crowd_dispersion(extension._nav_bot)

		if action == 1 then
		elseif action == 2 then
		end
	end
end

AINavigationSystem.update_position = function (self, t, dt)
	for unit, extension in pairs(self.enabled_units) do
		if extension._nav_bot then
			local position = Unit.local_position(extension._unit, 0)

			GwNavBot.update_position(extension._nav_bot, position)
		end
	end
end

AINavigationSystem.update_debug_draw = function (self, t)
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "AINavigationExtension"
	})
	local enabled_color = Colors.get("pink")
	local disabled_color = Colors.get("purple")
	local offset = Vector3(0, 0, 0.01)

	for unit, extension in pairs(self.unit_extension_data) do
		local pos = Unit.local_position(unit, 0)
		local enabled = self.enabled_units[unit]
		local color = (enabled and enabled_color) or disabled_color
		local wanted_destination = extension._wanted_destination:unbox()
		local destination = extension._destination:unbox()

		drawer:sphere(pos, 0.1, color)
		drawer:sphere(wanted_destination, 0.2, color)
		drawer:vector(pos, wanted_destination - pos, color)

		if Vector3.distance_squared(wanted_destination, destination) > 0.1 then
			drawer:vector(pos + offset, destination - pos, Colors.get("green"))
		end

		if enabled then
			local velocity = GwNavBot.velocity(extension._nav_bot)

			if Vector3.length(velocity) > 0 then
				drawer:vector(pos + Vector3.up(), Vector3.normalize(velocity), color)
			end
		end

		local blackboard = extension._blackboard
		local data = blackboard.next_smart_object_data

		if data.next_smart_object_id then
			local entrance_pos = data.entrance_pos:unbox()
			local exit_pos = data.exit_pos:unbox()

			drawer:sphere(entrance_pos, 0.3, (data.entrance_is_at_bot_progress_on_path and Colors.get("pink")) or Colors.get("red"))
			drawer:sphere(exit_pos, 0.3, (data.exit_is_at_the_end_of_path and Colors.get("pink")) or Colors.get("red"))
			drawer:vector(entrance_pos, exit_pos - entrance_pos, (data.next_smart_object_id and Colors.get("pink")) or Colors.get("red"))
		end
	end

	local debug_unit = script_data.debug_unit
	local navigation_extension = self.unit_extension_data[debug_unit] or self.delayed_units[debug_unit]

	if Unit_alive(debug_unit) and navigation_extension then
		local blackboard = navigation_extension._blackboard

		if script_data.debug_ai_movement == "text_and_graphics" then
			self:_debug_draw_text(debug_unit, blackboard, navigation_extension, t)
		end

		self:_debug_draw_nav_path(drawer, navigation_extension)
		self:_debug_draw_far_path(drawer, debug_unit, blackboard, navigation_extension)
	end
end

AINavigationSystem._debug_draw_text = function (self, debug_unit, blackboard, navigation_extension, t)
	Debug.text("AI NAVIGATION DEBUG")
	Debug.text("  enabled = %s", tostring(self.enabled_units[debug_unit] ~= nil))
	Debug.text("  using far-path = %s", (blackboard.far_path and "YES") or "NO")
	Debug.text("  has_reached = %s", tostring(navigation_extension:has_reached_destination()))
	Debug.text("  remaining path distance = %.2f", navigation_extension:get_remaining_distance_from_progress_to_end_of_path() or 0)
	Debug.text("  dist to dest = %.2f", tostring(navigation_extension:distance_to_destination()))
	Debug.text("  current_speed = %.2f", navigation_extension._current_speed)
	Debug.text("  desired_velocity = %s", (navigation_extension._nav_bot and tostring(GwNavBot.output_velocity(navigation_extension._nav_bot))) or "?")
	Debug.text("  failed_move_attempts = %d", navigation_extension._failed_move_attempts)
	Debug.text("  no_path_found = %s", tostring(blackboard.no_path_found))
	Debug.text("  is_computing_path = %s", tostring(navigation_extension._is_computing_path))
	Debug.text("  is_following_path = %s", tostring(navigation_extension:is_following_path()))
	Debug.text("  interpolating = %s", tostring(navigation_extension._interpolating))
	Debug.text("  move_state = %s", tostring(navigation_extension._blackboard.move_state or "nil"))
	Debug.text("  btnode = %s", tostring(blackboard.btnode_name))
	Debug.text("  wait_timer = %.1f", math.max(-1, navigation_extension._wait_timer - t))
end

AINavigationSystem._debug_draw_nav_path = function (self, drawer, navigation_extension)
	local nav_bot = navigation_extension._nav_bot

	if nav_bot == nil then
		return
	end

	local following_path = navigation_extension._is_navbot_following_path

	if not following_path then
		return
	end

	local node_count = GwNavBot.get_path_nodes_count(nav_bot)

	if node_count > 0 then
		local previous_node_position = nil
		local current_node_index = GwNavBot.get_path_current_node_index(nav_bot)
		local offset = Vector3.up() * 0.05

		for i = 0, node_count - 1, 1 do
			local position = GwNavBot.get_path_node_pos(nav_bot, i)
			local color = (current_node_index == i and Colors.get("green")) or Colors.get("powder_blue")

			drawer:sphere(position + offset, 0.1, color)

			if previous_node_position then
				drawer:line(position + offset, previous_node_position + offset, Colors.get("powder_blue"))
			end

			previous_node_position = position
		end
	end
end

AINavigationSystem._debug_draw_far_path = function (self, drawer, debug_unit, blackboard, navigation_extension)
	local far_path = blackboard.far_path

	if far_path then
		local position_unit = POSITION_LOOKUP[debug_unit]
		local num_far_path_nodes = blackboard.num_far_path_nodes
		local current_far_path_index = blackboard.current_far_path_index
		local previous_node_pos = nil

		for i = 1, num_far_path_nodes, 1 do
			local group = far_path[i]
			local node_pos = group:get_group_center():unbox()
			local node_color = i < current_far_path_index and Colors.get("yellow")
			local node_size = 0.1

			if i < current_far_path_index then
				node_color = Colors.get("orange")
			elseif i == current_far_path_index then
				node_color = Colors.get("green")
				node_size = node_size + math.random() * 0.1
			elseif i < num_far_path_nodes then
				node_color = Colors.get("yellow")
			else
				node_color = Colors.get("black")
			end

			if previous_node_pos then
				drawer:line(previous_node_pos, node_pos, node_color)
			end

			drawer:sphere(node_pos, node_size, node_color)

			previous_node_pos = node_pos
		end

		local real_destination = navigation_extension._backup_destination:unbox()

		drawer:sphere(real_destination, 0.1, Colors.get("yellow"))
		drawer:sphere(real_destination, 0.2, Colors.get("yellow"))
		drawer:vector(position_unit, real_destination - position_unit, Colors.get("yellow"))
	end
end

NAVIGATION_RUNNING_IN_THREAD = false

AINavigationSystem.override_nav_funcs = function (self)
	local patch_list = {
		"GwNavWorld",
		"GwNavBot",
		"GwNavQueries",
		"GwNavSmartObjectInterval",
		"GwNavTagLayerCostTable",
		"GwNavTraverseLogic",
		"GwNavBoxObstacle",
		"GwNavAStar",
		"GwNavCylinderObstacle",
		"GwNavTagVolume"
	}

	for i = 1, #patch_list, 1 do
		local engine_plugin_name = patch_list[i]
		local engine_plugin = _G[engine_plugin_name]

		for func_name, func in pairs(engine_plugin) do
			if func_name ~= "join_async_update" and func_name ~= "kick_async_update" then
				engine_plugin[func_name] = function (...)
					fassert(not NAVIGATION_RUNNING_IN_THREAD, "%s.%s() function was run during navigation running on other thread", engine_plugin_name, func_name)

					return func(...)
				end
			end
		end
	end
end

return
