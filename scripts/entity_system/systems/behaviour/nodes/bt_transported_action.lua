require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTransportedAction = class(BTTransportedAction, BTNode)

BTTransportedAction.init = function (self, ...)
	BTTransportedAction.super.init(self, ...)
end

BTTransportedAction.name = "BTTransportedAction"

BTTransportedAction.enter = function (self, unit, blackboard, t, dt)
	local action = self._tree_node.action_data
	blackboard.action = action
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:set_movement_type("script_driven")
	navigation_extension:set_enabled(false)
	LocomotionUtils.set_animation_driven_movement(unit, false, false, false, true)

	local transport_ext = blackboard.is_transported
	local transport_slot_id = blackboard.transport_slot_id
	local position = transport_ext:get_ai_slot(transport_slot_id)

	navigation_extension:set_navbot_position(position)
	locomotion_extension:teleport_to(position)

	local animation = "idle"
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, animation)

	blackboard.move_state = "idle"
end

BTTransportedAction.leave = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension
	local position = POSITION_LOOKUP[unit] or Unit.local_position(unit, 0)

	locomotion_extension:teleport_to(position)
	navigation_extension:set_navbot_position(position)
	navigation_extension:set_enabled(true)
	navigation_extension:reset_destination(position)
	locomotion_extension:set_movement_type("snap_to_navmesh")
	LocomotionUtils.set_animation_driven_movement(unit, false)
end

BTTransportedAction.run = function (self, unit, blackboard, t, dt, bt_name)
	return "running"
end
