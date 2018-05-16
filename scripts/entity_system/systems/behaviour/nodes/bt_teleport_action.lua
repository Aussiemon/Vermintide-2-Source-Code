require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTeleportAction = class(BTTeleportAction, BTNode)

BTTeleportAction.init = function (self, ...)
	BTTeleportAction.super.init(self, ...)
end

BTTeleportAction.name = "BTTeleportAction"

BTTeleportAction.enter = function (self, unit, blackboard, t)
	local unit_position = POSITION_LOOKUP[unit]
	local next_smart_object_data = blackboard.next_smart_object_data
	local entrance_pos = next_smart_object_data.entrance_pos:unbox()
	local exit_pos = next_smart_object_data.exit_pos:unbox()
	local smart_object_data = next_smart_object_data.smart_object_data
	blackboard.smart_object_data = smart_object_data
	blackboard.teleport_position = Vector3Box(exit_pos)
	blackboard.entrance_position = Vector3Box(entrance_pos)
end

BTTeleportAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.teleport_position = nil
	blackboard.entrance_position = nil
	blackboard.teleport_timeout = nil
	local navigation_extension = blackboard.navigation_extension
	slot7 = navigation_extension:is_using_smart_object() and navigation_extension:use_smart_object(false)
end

BTTeleportAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.smart_object_data ~= blackboard.next_smart_object_data.smart_object_data then
		return "failed"
	end

	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension
	local unit_position = POSITION_LOOKUP[unit]
	local target_offset = blackboard.entrance_position:unbox() - unit_position
	local target_dir = Vector3.normalize(navigation_extension:desired_velocity())

	if Vector3.length(Vector3.flat(target_dir)) < 0.05 and Vector3.dot(target_dir, Vector3.normalize(target_offset)) > 0.99 then
		blackboard.teleport_timeout = blackboard.teleport_timeout or t + 0.3
	else
		blackboard.teleport_timeout = nil
	end

	local dist_sq = target_offset.x + target_offset.y + target_offset.z

	if dist_sq < 1 or (blackboard.teleport_timeout and blackboard.teleport_timeout < t) then
		local teleport_position = blackboard.teleport_position:unbox()

		navigation_extension:set_navbot_position(teleport_position)
		locomotion_extension:teleport_to(teleport_position)
		locomotion_extension:set_wanted_velocity(Vector3.zero())

		return "done"
	else
		return "running"
	end
end

return
