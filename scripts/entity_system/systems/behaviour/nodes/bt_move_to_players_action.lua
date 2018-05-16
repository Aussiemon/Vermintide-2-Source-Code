require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTMoveToPlayersAction = class(BTMoveToPlayersAction, BTNode)
local EVALUATE_TIME = 0.25

BTMoveToPlayersAction.init = function (self, ...)
	BTMoveToPlayersAction.super.init(self, ...)
end

BTMoveToPlayersAction.name = "BTMoveToPlayersAction"

BTMoveToPlayersAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_state ~= "idle" then
		self:start_idle_animation(unit, blackboard)
	end

	local ai_navigation_extension = blackboard.navigation_extension
	local walk_speed = blackboard.breed.walk_speed

	ai_navigation_extension:set_max_speed(walk_speed)

	if blackboard.move_to_players_position then
		local move_to_players_position = blackboard.move_to_players_position:unbox()

		ai_navigation_extension:move_to(move_to_players_position)
	end

	local target_units = {}
	local move_to_players = {
		target_units = target_units
	}
	blackboard.move_to_players = move_to_players

	self:_init_targets(move_to_players, t)
end

BTMoveToPlayersAction._init_targets = function (self, data, t)
	data.index = 0
	data.eval_timer = t + EVALUATE_TIME
	data.find_move_position_attempts = 0

	table.merge(data.target_units, PLAYER_UNITS)
end

BTMoveToPlayersAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.move_to_players = nil
	local navigation_extension = blackboard.navigation_extension

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_to_players_position and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end

		blackboard.move_to_players_position = nil
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)

	navigation_extension:set_max_speed(default_move_speed)
end

BTMoveToPlayersAction.run = function (self, unit, blackboard, t, dt)
	local ai_navigation = blackboard.navigation_extension
	local data = blackboard.move_to_players
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]

	if not blackboard.move_to_players_position or Vector3.distance_squared(blackboard.move_to_players_position:unbox(), target_pos) > 9 then
		self:_update_move_to_players_position(blackboard, ai_navigation, target_pos, data)

		return "running"
	end

	local path_found = ai_navigation:is_following_path()

	if blackboard.move_to_players_position and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	local ret_value = self:_evalute_targets(unit, blackboard, data, t)

	return ret_value
end

BTMoveToPlayersAction._evalute_targets = function (self, unit, blackboard, data, t)
	local should_evaluate_next_player = data.eval_timer < t

	if should_evaluate_next_player then
		data.eval_timer = t + EVALUATE_TIME
	else
		return "running"
	end

	local next_index = data.index
	local next_target_unit = nil

	repeat
		next_index = next_index + 1
		next_target_unit = data.target_units[next_index]
	until next_target_unit == nil or Unit.alive(next_target_unit)

	if not next_target_unit then
		table.clear(data.target_units)
		self:_init_targets(data, t)

		return "running"
	else
		data.index = next_index
	end

	local action = blackboard.action
	local target_found = self[action.find_target_function_name](self, unit, blackboard, action, next_target_unit, t)

	return (target_found and "done") or "running"
end

BTMoveToPlayersAction._find_target_globadier = function (self, unit, blackboard, action, next_target_unit, t)
	local throw_globe_data = blackboard.throw_globe_data

	if throw_globe_data and throw_globe_data.next_throw_at and blackboard.target_dist < 4 then
		throw_globe_data.next_throw_at = -math.huge
	end

	if self:_valid_globadier_target(next_target_unit, blackboard.target_dist, action) and self:_has_line_of_sight(unit, next_target_unit, blackboard.world, t) then
		local has_trajectory, angle, speed, throw_from_pos, target_vector = self:_calculate_trajectory_to_target(unit, blackboard.world, next_target_unit, action.attack_throw_offset, blackboard.breed.max_globe_throw_speed)

		if has_trajectory then
			blackboard.has_thrown = true
			blackboard.move_to_players_position = nil

			if not blackboard.throw_globe_data then
				local throw_data = {
					throw_pos = Vector3Box(),
					target_direction = Vector3Box()
				}
			end

			throw_data.angle = angle
			throw_data.speed = speed

			throw_data.throw_pos:store(throw_from_pos)
			throw_data.target_direction:store(target_vector)

			blackboard.throw_globe_data = throw_data

			return true
		end
	end

	return false
end

BTMoveToPlayersAction._find_target_ratling_gunner = function (self, unit, blackboard, action, next_target_unit, t)
	local closest_enemy, visible_node_name, old_target_visible = PerceptionUtils.pick_ratling_gun_target(unit, blackboard, nil)

	if closest_enemy then
		local data = blackboard.attack_pattern_data or {}
		data.target_unit = closest_enemy
		data.target_node_name = visible_node_name
		blackboard.attack_pattern_data = data

		return true
	else
		return false
	end
end

BTMoveToPlayersAction._update_move_to_players_position = function (self, blackboard, navigation_extension, wanted_position, data)
	local attempts = data.find_move_position_attempts
	local above = 0.7 + attempts * 0.2
	local below = 2 + attempts * 0.2
	local goal_pos = nil
	local traverse_logic = navigation_extension:traverse_logic()
	local nav_world = navigation_extension:nav_world()
	local found_nav_mesh, z = GwNavQueries.triangle_from_position(nav_world, wanted_position, above, below, traverse_logic)

	if found_nav_mesh then
		goal_pos = Vector3(wanted_position.x, wanted_position.y, z)
	else
		local distance_from_nav_mesh = 0
		local lateral = attempts * 0.5
		goal_pos = GwNavQueries.inside_position_from_outside_position(nav_world, wanted_position, below, above, lateral, distance_from_nav_mesh, traverse_logic)
	end

	if goal_pos then
		navigation_extension:move_to(goal_pos)

		local pos_box = blackboard.move_to_players_position or Vector3Box()

		pos_box:store(goal_pos)

		blackboard.move_to_players_position = pos_box
		data.find_move_position_attempts = 0
	else
		data.find_move_position_attempts = attempts + 1
	end
end

BTMoveToPlayersAction._calculate_trajectory_to_target = function (self, unit, world, target_unit, attack_throw_offset, max_speed)
	local curr_pos = Vector3.copy(POSITION_LOOKUP[unit])
	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	local x, y, z = unpack(attack_throw_offset)
	local pos = Vector3(x, y, z)
	local throw_offset = Quaternion.rotate(rot, pos)
	local throw_pos = curr_pos + throw_offset
	curr_pos.z = throw_pos.z
	local root_to_throw = throw_pos - curr_pos
	local direction = Vector3.normalize(root_to_throw)
	local length = Vector3.length(root_to_throw)
	local physics_world = World.get_data(world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, curr_pos, direction, length, "closest", "collision_filter", "filter_enemy_ray_projectile")

	if result then
		return false
	end

	local target_position = POSITION_LOOKUP[target_unit]
	local target_vector = Vector3.normalize(target_position - throw_pos)
	local hit, angle, speed = WeaponHelper:calculate_trajectory(world, throw_pos, target_position, ProjectileGravitySettings.default, max_speed)

	return hit, angle, speed, throw_pos, target_vector
end

BTMoveToPlayersAction._valid_globadier_target = function (self, target_unit, target_distance, action)
	return VALID_TARGETS_PLAYERS_AND_BOTS[target_unit] and target_distance < action.attack_distance
end

BTMoveToPlayersAction._has_line_of_sight = function (self, unit, target_unit, world, t)
	local start_pos = POSITION_LOOKUP[unit] + Vector3.up()
	local end_pos = POSITION_LOOKUP[target_unit] + Vector3.up() * 1.75
	local look_vector = end_pos - start_pos
	local direction = Vector3.normalize(look_vector)
	local length = Vector3.length(look_vector)
	local hit, position1, distance1, normal, actor1 = PhysicsWorld.immediate_raycast(World.get_data(world, "physics_world"), start_pos, direction, length, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	return not hit
end

BTMoveToPlayersAction.start_idle_animation = function (self, unit, blackboard)
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_passive")
	network_manager:anim_event(unit, "idle")

	blackboard.move_state = "idle"
end

BTMoveToPlayersAction.start_move_animation = function (self, unit, blackboard)
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")
	network_manager:anim_event(unit, "move_fwd")

	blackboard.move_state = "moving"
end

return
