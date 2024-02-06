-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_critter_rat_scurry_under_door_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCritterRatScurryUnderDoorAction = class(BTCritterRatScurryUnderDoorAction, BTNode)

BTCritterRatScurryUnderDoorAction.init = function (self, ...)
	BTCritterRatScurryUnderDoorAction.super.init(self, ...)
end

BTCritterRatScurryUnderDoorAction.name = "BTCritterRatScurryUnderDoorAction"

BTCritterRatScurryUnderDoorAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data

	local next_smart_object_data = blackboard.next_smart_object_data
	local entrance_pos = next_smart_object_data.entrance_pos:unbox()
	local exit_pos = next_smart_object_data.exit_pos:unbox()

	blackboard.scurry_under_entrance_pos = Vector3Box(entrance_pos)
	blackboard.scurry_under_exit_pos = Vector3Box(exit_pos)
	blackboard.scurry_under_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(exit_pos - entrance_pos)))

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("snap_to_navmesh")

	if blackboard.move_state ~= "moving" then
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.move_state = "moving"
	end

	blackboard.scurry_state = "moving_to_door"
end

BTCritterRatScurryUnderDoorAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.scurry_under_entrance_pos = nil
	blackboard.scurry_under_exit_pos = nil
	blackboard.scurry_state = nil
	blackboard.scurry_under_lookat_direction = nil
	blackboard.is_scurrying_under_door = nil
	blackboard.anim_cb_scurry_under_finished = nil
	blackboard.is_smart_objecting = nil

	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_movement_type("snap_to_navmesh")
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	if navigation_extension:is_using_smart_object() then
		local success = navigation_extension:use_smart_object(false)

		if not success and not blackboard.exit_last_action then
			print("Could not release smart object, since nav mesh was not found. Killing AI", unit)

			local damage_type = "forced"
			local damage_direction = Vector3(0, 0, -1)

			AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)
		end
	end
end

BTCritterRatScurryUnderDoorAction.run = function (self, unit, blackboard, t, dt)
	local unit_position = POSITION_LOOKUP[unit]
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension

	if blackboard.next_smart_object_data.next_smart_object_id == nil then
		aiprint("Critter rat lost smart object during door action")

		return "failed"
	end

	if blackboard.scurry_state == "moving_to_door" and not self:_moving_to_door_update(unit, blackboard) then
		return "failed"
	end

	if blackboard.scurry_state == "moving_towards_smartobject_entrance" then
		self:_move_towards_smartobject_entrance_update(unit, blackboard, dt)
	end

	if blackboard.scurry_state == "waiting_to_reach_end" then
		self:_waiting_to_reach_end_update(unit, blackboard)
	end

	if blackboard.scurry_state == "done" then
		blackboard.scurry_state = "done_for_reals"
	elseif blackboard.scurry_state == "done_for_reals" then
		blackboard.scurry_state = "done_for_reals2"
	elseif blackboard.scurry_state == "done_for_reals2" then
		return "done"
	end

	return "running"
end

BTCritterRatScurryUnderDoorAction._moving_to_door_update = function (self, unit, blackboard)
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_pos = blackboard.scurry_under_entrance_pos:unbox()
	local entrance_distance = Vector3.distance(entrance_pos, unit_position)

	if entrance_distance < 1 then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_movement_type("script_driven")

		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(false)

		if navigation_extension:use_smart_object(true) then
			blackboard.is_smart_objecting = true
			blackboard.is_scurrying_under_door = true
			blackboard.scurry_state = "moving_towards_smartobject_entrance"
		else
			print("BTCritterRatScurryUnderDoorAction - failing to use smart object")

			return false
		end
	end

	return true
end

BTCritterRatScurryUnderDoorAction._move_towards_smartobject_entrance_update = function (self, unit, blackboard, dt)
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_pos = blackboard.scurry_under_entrance_pos:unbox()
	local look_direction_wanted = blackboard.scurry_under_lookat_direction:unbox()
	local wanted_rotation = Quaternion.look(look_direction_wanted)
	local vector_to_target = entrance_pos - unit_position
	local distance_to_target = Vector3.length(vector_to_target)
	local locomotion_extension = blackboard.locomotion_extension

	if distance_to_target > 0.1 then
		local speed = blackboard.breed.run_speed

		if distance_to_target < speed * dt then
			speed = dt == 0 and 0 or distance_to_target / dt
		end

		local direction_to_target = Vector3.normalize(vector_to_target)

		locomotion_extension:set_wanted_velocity(direction_to_target * speed)
		locomotion_extension:set_wanted_rotation(wanted_rotation)
	else
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
		locomotion_extension:teleport_to(entrance_pos, wanted_rotation)
		Managers.state.network:anim_event(unit, "dig_door")

		blackboard.scurry_state = "waiting_to_reach_end"
	end
end

BTCritterRatScurryUnderDoorAction._waiting_to_reach_end_update = function (self, unit, blackboard)
	if blackboard.anim_cb_scurry_under_finished then
		local exit_pos = blackboard.scurry_under_exit_pos:unbox()
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_navbot_position(exit_pos)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:teleport_to(exit_pos)
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.spawn_to_running = true
		blackboard.scurry_state = "done"
	end
end
