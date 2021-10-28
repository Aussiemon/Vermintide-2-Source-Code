require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCombatStepAction = class(BTCombatStepAction, BTNode)

BTCombatStepAction.init = function (self, ...)
	BTCombatStepAction.super.init(self, ...)
end

BTCombatStepAction.name = "BTCombatStepAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTCombatStepAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.active_node = BTCombatStepAction
	blackboard.start_finished = nil
	blackboard.start_started_since = t
	local navigation_extension = blackboard.navigation_extension
	local target_unit = blackboard.target_unit
	local rotation_to_target = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	local rotation = Unit.local_rotation(unit, 0)
	local direction = Quaternion.forward(rotation)
	local action = blackboard.action
	local move_animation = action.force_combat_step_animation or self:_get_animation(rotation_to_target, direction)
	local new_speed = action.move_speed

	if new_speed then
		navigation_extension:set_max_speed(new_speed)
	end

	local animation = randomize(move_animation)
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, animation)

	blackboard.move_state = "moving"
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)

	local nav_world = blackboard.nav_world
	local ray_can_go = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit], nil, 1, 1)

	if move_animation ~= "combat_step_fwd" and ray_can_go then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:use_lerp_rotation(false)
		LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

		local target_pos = POSITION_LOOKUP[target_unit]
		local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, move_animation, action.start_anims_data)

		LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)

		blackboard.is_not_forward_combat_step = true
	else
		local locomotion_extension = blackboard.locomotion_extension
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		locomotion_extension:set_wanted_rotation(rot)
	end
end

BTCombatStepAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.start_finished = nil
	blackboard.start_started_since = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	blackboard.active_node = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if blackboard.is_not_forward_combat_step then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)

		blackboard.is_not_forward_combat_step = nil

		locomotion_extension:set_rotation_speed(10)
		locomotion_extension:set_wanted_rotation(nil)
		locomotion_extension:set_movement_type("snap_to_navmesh")
	end
end

BTCombatStepAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.start_finished or t - blackboard.start_started_since > 10 then
		return "done"
	end

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
		anim = "combat_step_left"
	elseif abs_fwd < abs_right then
		anim = "combat_step_right"
	elseif fwd_dot >= 0 then
		anim = "combat_step_fwd"
	else
		anim = "combat_step_bwd"
	end

	return anim
end

return
