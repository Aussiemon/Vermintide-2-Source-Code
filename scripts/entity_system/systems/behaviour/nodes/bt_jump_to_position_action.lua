require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTJumpToPositionAction = class(BTJumpToPositionAction, BTNode)

BTJumpToPositionAction.init = function (self, ...)
	BTJumpToPositionAction.super.init(self, ...)
end

BTJumpToPositionAction.name = "BTJumpToPositionAction"

BTJumpToPositionAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "BTJumpToPositionAction"
	})

	drawer:reset()
	assert(blackboard.jump_from_pos and blackboard.exit_pos, "BTJumpToPositionAction needs jump_from_pos and exit_pos defined in blackboard.")

	local entrance_pos = blackboard.jump_from_pos:unbox()
	local exit_pos = blackboard.exit_pos:unbox()
	blackboard.jump_entrance_pos = Vector3Box(entrance_pos)
	blackboard.jump_exit_pos = Vector3Box(exit_pos)
	blackboard.jump_ledge_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(exit_pos - entrance_pos)))
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_affected_by_gravity(false)
	locomotion_extension:set_movement_type("snap_to_navmesh")
	locomotion_extension:set_rotation_speed(10)

	blackboard.jump_state = "moving_to_ledge"
end

BTJumpToPositionAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.jump_spline_ground = nil
	blackboard.jump_spline_ledge = nil
	blackboard.jump_entrance_pos = nil
	blackboard.jump_state = nil
	blackboard.is_jumping = nil
	blackboard.jump_ledge_lookat_direction = nil
	blackboard.jump_entrance_pos = nil
	blackboard.jump_exit_pos = nil
	blackboard.is_smart_objecting = nil
	blackboard.jump_start_finished = nil
	blackboard.jump_from_pos = nil
	blackboard.exit_pos = nil

	LocomotionUtils.set_animation_driven_movement(unit, false, true)
	LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("snap_to_navmesh")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil
end

BTJumpToPositionAction.run = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_pos = blackboard.jump_entrance_pos:unbox()
	local exit_pos = blackboard.jump_exit_pos:unbox()

	if blackboard.jump_state == "moving_to_ledge" and Vector3.distance_squared(entrance_pos, unit_position) < 1 then
		LocomotionUtils.set_animation_driven_movement(unit, false)
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_movement_type("script_driven")
		navigation_extension:set_enabled(false)

		blackboard.is_jumping = true
		blackboard.jump_state = "moving_towards_smartobject_entrance"
	end

	if blackboard.jump_state == "moving_towards_smartobject_entrance" then
		local move_target = entrance_pos
		local look_direction_wanted = blackboard.jump_ledge_lookat_direction:unbox()
		local wanted_rotation = Quaternion.look(look_direction_wanted)
		local vector_to_target = move_target - unit_position
		local distance_to_target = Vector3.length(vector_to_target)

		if distance_to_target > 0.1 then
			local speed = blackboard.breed.run_speed

			if distance_to_target < speed * dt then
				speed = distance_to_target / dt
			end

			local direction_to_target = Vector3.normalize(vector_to_target)
			local wanted_velocity = direction_to_target * speed

			locomotion_extension:set_wanted_velocity(wanted_velocity)
			locomotion_extension:set_wanted_rotation(wanted_rotation)
		else
			locomotion_extension:teleport_to(move_target, wanted_rotation)
			LocomotionUtils.set_animation_driven_movement(unit, true)
			Managers.state.network:anim_event(unit, blackboard.action.jump_animation)

			local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
			hit_reaction_extension.force_ragdoll_on_death = true
			local jump_vector = exit_pos - entrance_pos
			local horizontal_length = Vector3.length(Vector3.flat(jump_vector))
			local animation_distance = blackboard.action.horizontal_length
			local forward_factor = horizontal_length / animation_distance
			local height_factor = jump_vector.z
			blackboard.jump_state = "waiting_to_reach_end"
		end
	end

	if blackboard.jump_state == "waiting_to_reach_end" and blackboard.jump_start_finished then
		navigation_extension:set_navbot_position(exit_pos)
		locomotion_extension:teleport_to(exit_pos)
		Managers.state.network:anim_event(unit, blackboard.action.land_animation)

		blackboard.spawn_to_running = true
		blackboard.jump_state = "waiting_for_landing_finished"
	end

	if blackboard.jump_state == "waiting_for_landing_finished" and blackboard.landing_finished then
		blackboard.jump_state = "done"
	end

	if blackboard.jump_state == "done" then
		blackboard.jump_state = "done_for_reals"
	elseif blackboard.jump_state == "done_for_reals" then
		blackboard.jump_state = "done_for_reals2"
	elseif blackboard.jump_state == "done_for_reals2" then
		return "done"
	end

	return "running"
end

return
