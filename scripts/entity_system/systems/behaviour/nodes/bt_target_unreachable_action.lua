require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTargetUnreachableAction = class(BTTargetUnreachableAction, BTNode)

BTTargetUnreachableAction.init = function (self, ...)
	BTTargetUnreachableAction.super.init(self, ...)
end

BTTargetUnreachableAction.name = "BTTargetUnreachableAction"

BTTargetUnreachableAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.unreachable_timer = blackboard.chasing_timer or 0
end

BTTargetUnreachableAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTTargetUnreachableAction.run = function (self, unit, blackboard, t, dt)
	local position = POSITION_LOOKUP[unit]
	local target_unit = blackboard.target_unit

	if not target_unit then
		return "done"
	end

	local target_position = POSITION_LOOKUP[target_unit]
	local distance_target_sq = Vector3.distance_squared(target_position, position)
	local closest_position = nil
	local best_score = math.huge
	local reach_distance_squared = blackboard.breed.reach_distance^2
	local position_list, target_on_mesh = nil
	local whereabouts_extension = ScriptUnit.has_extension(target_unit, "whereabouts_system")

	if whereabouts_extension then
		position_list, target_on_mesh = whereabouts_extension:closest_positions_when_outside_navmesh()

		for i = 1, #position_list do
			local test_position = position_list[i]:unbox()
			local score = 0
			local distance_enemy_and_target_sq = Vector3.distance_squared(target_position, test_position)

			if distance_enemy_and_target_sq < reach_distance_squared * 4 then
				score = distance_enemy_and_target_sq
			else
				local distance_point_sq = Vector3.distance_squared(test_position, position)
				score = score + distance_point_sq + distance_target_sq
			end

			if best_score > score then
				closest_position = test_position
				best_score = score
			end
		end

		blackboard.target_outside_navmesh = not target_on_mesh
	end

	local navigation_extension = blackboard.navigation_extension

	if closest_position then
		navigation_extension:move_to(closest_position)
	end

	local locomotion_extension = blackboard.locomotion_extension

	self:move_closer(unit, blackboard, locomotion_extension, navigation_extension)

	blackboard.unreachable_timer = blackboard.unreachable_timer + dt

	return "running", "evaluate"
end

BTTargetUnreachableAction.move_closer = function (self, unit, blackboard, locomotion_extension, navigation_extension)
	local unit_position = POSITION_LOOKUP[unit]
	local distance_sq = navigation_extension:distance_to_destination_sq(unit_position)

	if distance_sq < 1 then
		navigation_extension:set_max_speed(blackboard.breed.walk_speed)
	elseif distance_sq > 4 then
		navigation_extension:set_max_speed(blackboard.breed.run_speed)
	end

	local is_following_path = navigation_extension:is_following_path()

	if blackboard.move_state ~= "moving" and is_following_path and distance_sq > 0.25 then
		print("GO TO UNREACHABLE MOVING, DIST_SQ=", distance_sq, unit)

		blackboard.move_state = "moving"
		local action = blackboard.action
		local start_anim, anim_driven = LocomotionUtils.get_start_anim(unit, blackboard, action.start_anims)

		Managers.state.network:anim_event(unit, start_anim or action.move_anim)
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		print("GO TO UNREACHABLE IDLE, DIST_SQ=", distance_sq, unit)

		blackboard.move_state = "idle"

		Managers.state.network:anim_event(unit, "idle")
	end

	if blackboard.move_state == "moving" then
		locomotion_extension:set_wanted_rotation(nil)
	else
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

		locomotion_extension:set_wanted_rotation(rot)
	end
end

BTTargetUnreachableAction._debug_distance_text = function (self, unit, navigation_extension)
	if script_data.debug_ai_movement then
		local unit_position = POSITION_LOOKUP[unit]
		local destination = navigation_extension:destination()
		local distance = navigation_extension:distance_to_destination(unit_position)
		local to_destination_flat = Vector3.flat(destination - unit_position)
		local flat_distance = Vector3.length(to_destination_flat)

		Debug.text("Unreachable distance to target: %.2f Flat: %.2f", distance, flat_distance)
	end
end
