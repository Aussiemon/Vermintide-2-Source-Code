require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local function get_fall_animation(unit, blackboard)
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local vel_x = velocity.x
	local vel_y = velocity.y

	if vel_x * vel_x + vel_y * vel_y < 1e-07 then
		return "falling_fwd"
	end

	local unit_rotation = Unit.local_rotation(unit, 0)
	local unit_direction = Quaternion.forward(unit_rotation)
	local flat_dot = vel_x * unit_direction.x + vel_y * unit_direction.y

	if flat_dot >= 0 then
		return "falling_fwd"
	end

	return "falling_bwd"
end

BTFallAction = class(BTFallAction, BTNode)

BTFallAction.init = function (self, ...)
	BTFallAction.super.init(self, ...)
end

BTFallAction.name = "BTFallAction"

BTFallAction.enter = function (self, unit, blackboard, t)
	local fall_animation = get_fall_animation(unit, blackboard)

	Managers.state.network:anim_event(unit, fall_animation)
	LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

	local breed = blackboard.breed
	local override_mover_move_distance = breed.override_mover_move_distance
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_affected_by_gravity(true)
	locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	blackboard.fall_state = "waiting_to_stop_freefall"
	blackboard.fall_failsafe_timer = t + 0
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("falling", event_data)

	local shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

	if shield_extension then
		shield_extension:set_is_blocking(false)
	end
end

BTFallAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_affected_by_gravity(false)
		locomotion_extension:set_movement_type("snap_to_navmesh")
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	blackboard.jump_climb_finished = nil
	blackboard.fall_state = nil
	local shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

	if shield_extension then
		shield_extension:set_is_blocking(true)
	end
end

BTFallAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.fall_state == "waiting_to_stop_freefall" then
		local is_in_freefall = blackboard.locomotion_extension:is_falling()
		local has_waited_a_little = blackboard.fall_failsafe_timer <= t

		if not is_in_freefall and has_waited_a_little then
			blackboard.fall_state = "waiting_to_collide_down"
		end
	elseif blackboard.fall_state == "waiting_to_collide_down" then
		local mover = Unit.mover(unit)
		local mover_collides_down = Mover.collides_down(mover)

		if mover_collides_down then
			local nav_world = blackboard.nav_world
			local position = POSITION_LOOKUP[unit]
			local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, 1, 1)

			if nav_position == nil then
				local vertical_range = 0.5
				local horizontal_tolerance = 0.5
				local distance_from_obstacle = 0.5
				nav_position = GwNavQueries.inside_position_from_outside_position(nav_world, position, vertical_range, vertical_range, horizontal_tolerance, distance_from_obstacle)

				if nav_position == nil then
					local damage_type = "forced"
					local damage_direction = Vector3(0, 0, -1)

					AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)

					return "failed"
				end
			end

			Unit.set_local_position(unit, 0, nav_position)
			Managers.state.network:anim_event(unit, "jump_down_land")

			blackboard.fall_state = "waiting_to_land"
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("landing", event_data)
		end
	elseif blackboard.fall_state == "waiting_to_land" and blackboard.jump_climb_finished then
		return "done"
	end

	return "running"
end

return
