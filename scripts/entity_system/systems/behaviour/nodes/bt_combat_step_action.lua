require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCombatStepAction = class(BTCombatStepAction, BTNode)

BTCombatStepAction.init = function (self, ...)
	BTCombatStepAction.super.init(self, ...)
end

BTCombatStepAction.name = "BTCombatStepAction"

BTCombatStepAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.active_node = BTCombatStepAction
	blackboard.start_finished = nil
	local navigation_extension = blackboard.navigation_extension
	local target_unit = blackboard.target_unit
	local locomotion_extension = blackboard.locomotion_extension
	local rotation_to_target = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	local direction = navigation_extension:desired_velocity()
	local move_animation = self:_get_animation(rotation_to_target, direction)
	local new_speed = blackboard.action.move_speed

	if new_speed then
		navigation_extension:set_max_speed(new_speed)
	end

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "to_combat")
	network_manager:anim_event(unit, move_animation)

	blackboard.move_state = "moving"
end

BTCombatStepAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.start_finished = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	blackboard.active_node = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTCombatStepAction.run = function (self, unit, blackboard, t, dt)
	Profiler.start("BTCombatStepAction")

	if blackboard.start_finished then
		Profiler.stop("BTCombatStepAction")

		return "done"
	end

	Profiler.stop("BTCombatStepAction")

	return "running"
end

BTCombatStepAction.anim_cb_combat_step_stop = function (self, unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	if navigation_extension:is_following_path() then
		navigation_extension:stop()
	end

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)
end

BTCombatStepAction._get_animation = function (self, rotation, direction)
	local right_vector = Quaternion.right(rotation)
	local right_dot = Vector3.dot(right_vector, direction)
	local abs_right = math.abs(right_dot)
	local forward_vector = Quaternion.forward(rotation)
	local fwd_dot = Vector3.dot(forward_vector, direction)
	local abs_fwd = math.abs(fwd_dot)
	local anim = nil

	if abs_fwd < abs_right and right_dot > 0 then
		anim = "combat_step_right"
	elseif abs_fwd < abs_right then
		anim = "combat_step_left"
	elseif fwd_dot > 0 then
		anim = "combat_step_fwd"
	else
		anim = "combat_step_bwd"
	end

	return anim
end

return
