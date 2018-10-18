require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVortexFlyAction = class(BTVortexFlyAction, BTNode)

BTVortexFlyAction.init = function (self, ...)
	BTVortexFlyAction.super.init(self, ...)
end

BTVortexFlyAction.name = "BTVortexFlyAction"

BTVortexFlyAction.enter = function (self, unit, blackboard, t)
	local next_smart_object_data = blackboard.next_smart_object_data
	local entrance_pos = next_smart_object_data.entrance_pos:unbox()
	local exit_pos = next_smart_object_data.exit_pos:unbox()
	blackboard.fly_entrance_pos = Vector3Box(entrance_pos)
	blackboard.fly_exit_pos = Vector3Box(exit_pos)
	local smart_object_data = next_smart_object_data.smart_object_data
	local ledge_position = smart_object_data.ledge_position and Vector3Aux.unbox(smart_object_data.ledge_position)

	if ledge_position then
		blackboard.fly_middle_pos = Vector3Box(ledge_position)
	end

	blackboard.fly_state = "moving_to_within_smartobject_range"
end

BTVortexFlyAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.fly_entrance_pos = nil
	blackboard.fly_middle_pos = nil
	blackboard.fly_exit_pos = nil
	blackboard.fly_state = nil
	blackboard.is_smart_objecting = nil
	blackboard.is_flying = nil
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("snap_to_navmesh")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	slot8 = navigation_extension:is_using_smart_object() and navigation_extension:use_smart_object(false)
end

BTVortexFlyAction._move_to_destination = function (self, current_position, destination, locomotion_extension, dt, max_speed)
	local destination_vector = destination - current_position
	local destination_distance = Vector3.length(destination_vector)

	if destination_distance > 0.1 then
		local speed = max_speed

		if destination_distance < speed * dt then
			speed = destination_distance / dt
		end

		local destination_direction = Vector3.normalize(destination_vector)
		local wanted_velocity = destination_direction * speed

		locomotion_extension:set_wanted_velocity(wanted_velocity)

		return false
	else
		locomotion_extension:teleport_to(destination)

		return true
	end
end

BTVortexFlyAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local max_speed = blackboard.breed.run_speed
	local unit_position = POSITION_LOOKUP[unit]

	if blackboard.fly_state == "moving_to_within_smartobject_range" then
		local entrance_position = blackboard.fly_entrance_pos:unbox()

		if Vector3.distance_squared(entrance_position, unit_position) < 1 then
			locomotion_extension:set_wanted_velocity(Vector3.zero())
			locomotion_extension:set_movement_type("script_driven")

			local navigation_extension = blackboard.navigation_extension

			navigation_extension:set_enabled(false)

			if navigation_extension:use_smart_object(true) then
				blackboard.is_smart_objecting = true
				blackboard.is_flying = true
				blackboard.fly_state = "moving_towards_entrance_pos"
			else
				print("BTVortexFlyAction - Failing to use smart object")

				return "failed"
			end
		end
	elseif blackboard.fly_state == "moving_towards_entrance_pos" then
		local entrance_position = blackboard.fly_entrance_pos:unbox()
		local destination_reached = self:_move_to_destination(unit_position, entrance_position, locomotion_extension, dt, max_speed)

		if destination_reached then
			if blackboard.fly_middle_pos then
				blackboard.fly_state = "moving_towards_middle_pos"
			else
				blackboard.fly_state = "moving_towards_exit_pos"
			end
		end
	elseif blackboard.fly_state == "moving_towards_middle_pos" then
		local middle_position = blackboard.fly_middle_pos:unbox()
		local destination_reached = self:_move_to_destination(unit_position, middle_position, locomotion_extension, dt, max_speed)

		if destination_reached then
			blackboard.fly_state = "moving_towards_exit_pos"
		end
	elseif blackboard.fly_state == "moving_towards_exit_pos" then
		local exit_position = blackboard.fly_exit_pos:unbox()
		local destination_reached = self:_move_to_destination(unit_position, exit_position, locomotion_extension, dt, max_speed)

		if destination_reached then
			blackboard.fly_state = "done"
		end
	end

	if script_data.ai_debug_smartobject then
		local drawer = Managers.state.debug:drawer({
			mode = "immediate",
			name = "BTVortexFlyAction"
		})

		drawer:sphere(blackboard.fly_entrance_pos:unbox(), 0.3, Colors.get("green"))
		drawer:sphere(unit_position, 0.3, Colors.get("blue"))
		drawer:sphere(blackboard.fly_exit_pos:unbox(), 0.3, Colors.get("red"))
	end

	if blackboard.fly_state == "done" then
		return "done"
	else
		return "running"
	end
end

return
