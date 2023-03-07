require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTargetRageAction = class(BTTargetRageAction, BTNode)

BTTargetRageAction.init = function (self, ...)
	BTTargetRageAction.super.init(self, ...)
end

local POSITION_LOOKUP = POSITION_LOOKUP

local function debug3d(unit, text, color_name)
	if script_data.debug_ai_movement then
		Debug.world_sticky_text(POSITION_LOOKUP[unit] + Vector3.up(), text, color_name)
	end
end

BTTargetRageAction.name = "BTTargetRageAction"

BTTargetRageAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = self
	local start_anims = nil
	local is_close = action.close_anims_name and blackboard.target_dist < action.close_anims_dist

	if is_close then
		blackboard.anim_locked = t + action.close_rage_time
		start_anims = action.close_anims_name
	else
		blackboard.anim_locked = t + action.rage_time
		start_anims = action.start_anims_name
	end

	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local rage_anim = action.rage_anim or AiAnimUtils.get_start_move_animation(unit, target_pos, start_anims)

	if rage_anim == nil then
		blackboard.anim_locked = 0

		return
	end

	local anim_driven = false

	if start_anims then
		anim_driven = rage_anim ~= start_anims.fwd
		blackboard.attack_anim_driven = anim_driven
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:use_lerp_rotation(not anim_driven)

	if action.rotation_speed then
		locomotion_extension:set_rotation_speed(action.rotation_speed)
	end

	LocomotionUtils.set_animation_driven_movement(unit, anim_driven, false, false)

	if anim_driven then
		blackboard.move_animation_name = rage_anim
	elseif action.change_target_fwd_close_anims and blackboard.target_dist < action.change_target_fwd_close_dist then
		rage_anim = AiAnimUtils.cycle_anims(blackboard, action.change_target_fwd_close_anims, "cycle_rage_anim_index")
	end

	blackboard.navigation_extension:stop()

	blackboard.move_state = "attacking"
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, rage_anim)

	if blackboard.target_dist > 7 then
		blackboard.chasing_timer = 25
	end
end

BTTargetRageAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_cb_move = nil
	blackboard.anim_locked = nil
	blackboard.target_changed = nil
	blackboard.move_animation_name = nil

	if not destroy then
		blackboard.locomotion_extension:use_lerp_rotation(true)
		blackboard.locomotion_extension:set_rotation_speed(nil)
		LocomotionUtils.set_animation_driven_movement(unit, false)
	end
end

BTTargetRageAction.run = function (self, unit, blackboard, t, dt)
	if t < blackboard.anim_locked then
		if blackboard.attack_anim_driven then
			if blackboard.anim_cb_rotation_start then
				local target_pos = POSITION_LOOKUP[blackboard.target_unit]
				local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, blackboard.move_animation_name, blackboard.action.start_anims_data)

				LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)

				blackboard.anim_cb_rotation_start = nil
			end
		else
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

			blackboard.locomotion_extension:set_wanted_rotation(rot)
		end

		return "running"
	end

	return "done"
end

BTTargetRageAction.anim_cb_move = function (self, unit, blackboard, action)
	blackboard.move_state = "moving"
end
