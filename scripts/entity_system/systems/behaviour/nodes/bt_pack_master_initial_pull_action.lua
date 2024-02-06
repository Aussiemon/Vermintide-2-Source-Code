-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_pack_master_initial_pull_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterInitialPullAction = class(BTPackMasterInitialPullAction, BTNode)

BTPackMasterInitialPullAction.init = function (self, ...)
	BTPackMasterInitialPullAction.super.init(self, ...)
end

BTPackMasterInitialPullAction.name = "BTPackMasterInitialPullAction"

BTPackMasterInitialPullAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action

	local navigation_extension = blackboard.navigation_extension

	AiUtils.allow_smart_object_layers(navigation_extension, false)
	self:_find_pull_position(unit, blackboard, t)

	if blackboard.pull_position_end then
		Unit.set_local_rotation(unit, 0, Quaternion.look(blackboard.pull_position_start:unbox() - blackboard.pull_position_end:unbox(), Vector3.up()))
		StatusUtils.set_grabbed_by_pack_master_network("pack_master_pulling", blackboard.drag_target_unit, true, unit)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	end

	AiUtils.show_polearm(unit, false)
end

BTPackMasterInitialPullAction._find_pull_position = function (self, unit, blackboard, t)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local position = POSITION_LOOKUP[unit]
	local drag_target_unit = blackboard.drag_target_unit
	local position_target = POSITION_LOOKUP[drag_target_unit]
	local direction_to_pull = Vector3.normalize(position - position_target)
	local angle_towards_pull = math.atan2(direction_to_pull.y, direction_to_pull.x, 0)
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension:traverse_logic()
	local num_segments = 10

	for i = 1, num_segments do
		local angle = math.degrees_to_radians(45 * i / num_segments)
		local angle_cw = angle_towards_pull + angle
		local offset_cw = action.pull_distance * Vector3(math.cos(angle_cw), math.sin(angle_cw), 0)
		local position_end_cw = position + offset_cw
		local success_cw, altitude_cw = GwNavQueries.triangle_from_position(nav_world, position_end_cw, 0.5, 0.5)
		local raycango_success = GwNavQueries.raycango(nav_world, position, position_end_cw, traverse_logic)

		if success_cw and raycango_success then
			position_end_cw.z = altitude_cw
			blackboard.pull_position_end = Vector3Box(position_end_cw)

			break
		else
			local angle_ccw = angle_towards_pull - angle
			local offset_ccw = action.pull_distance * Vector3(math.cos(angle_ccw), math.sin(angle_ccw), 0)
			local position_target_ccw = position + offset_ccw
			local success_ccw, altitude_ccw = GwNavQueries.triangle_from_position(nav_world, position_target_ccw, 0.5, 0.5)
			local raycango_success_ccw = GwNavQueries.raycango(nav_world, position, position_target_ccw, traverse_logic)

			if success_ccw and raycango_success_ccw then
				position_target_ccw.z = altitude_ccw
				blackboard.pull_position_end = Vector3Box(position_target_ccw)

				break
			end
		end
	end

	blackboard.pull_position_start = Vector3Box(position)
	blackboard.pull_t_end = t + action.pull_time
end

BTPackMasterInitialPullAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.pull_position_start = nil
	blackboard.pull_position_end = nil
	blackboard.pull_t_end = nil

	if reason ~= "done" and Unit.alive(blackboard.drag_target_unit) then
		StatusUtils.set_grabbed_by_pack_master_network("pack_master_pulling", blackboard.drag_target_unit, false, unit)

		blackboard.target_unit = nil
		blackboard.drag_target_unit = nil

		AiUtils.show_polearm(unit, true)
	end

	local navigation_extension = blackboard.navigation_extension

	AiUtils.allow_smart_object_layers(navigation_extension, true)

	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_movement_type("snap_to_navmesh")
	end

	blackboard.attack_cooldown = t + blackboard.action.cooldown
end

BTPackMasterInitialPullAction.run = function (self, unit, blackboard, t, dt)
	if not AiUtils.is_of_interest_to_packmaster(unit, blackboard.drag_target_unit) then
		return "failed"
	end

	if blackboard.pull_position_end == nil then
		return "done"
	end

	if t > blackboard.pull_t_end then
		return "done"
	end

	return "running"
end
