require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTMoveToGoalAction = class(BTMoveToGoalAction, BTNode)

BTMoveToGoalAction.init = function (self, ...)
	BTMoveToGoalAction.super.init(self, ...)
end

BTMoveToGoalAction.name = "BTMoveToGoalAction"

BTMoveToGoalAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.time_to_next_evaluate = t + 0.5
	blackboard.time_to_next_friend_alert = t + 0.3
	local goal_destination = blackboard.goal_destination:unbox()

	blackboard.navigation_extension:move_to(goal_destination)

	local network_manager = Managers.state.network
	local breed = blackboard.breed
	local passive_in_patrol = breed.passive_in_patrol == nil or breed.passive_in_patrol

	if passive_in_patrol then
		network_manager:anim_event(unit, "to_passive")
	else
		network_manager:anim_event(unit, "to_combat")
	end

	local wield_weapon = not breed.dont_wield_weapon_on_patrol

	if wield_weapon and ScriptUnit.has_extension(unit, "ai_inventory_system") then
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
	end

	local override_move_speed = blackboard.action.override_move_speed

	if override_move_speed then
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_max_speed(override_move_speed)
	end
end

BTMoveToGoalAction.leave = function (self, unit, blackboard, t, reason, destroy)
	self:toggle_start_move_animation_lock(unit, false, blackboard)

	blackboard.start_anim_locked = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.start_anim_done = nil
	blackboard.skip_move_rotation = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
end

BTMoveToGoalAction.run = function (self, unit, blackboard, t, dt)
	if not blackboard.start_anim_done then
		if not blackboard.start_anim_locked then
			self:start_move_animation(unit, blackboard)
		end

		if blackboard.anim_cb_rotation_start then
			self:start_move_rotation(unit, blackboard, t, dt)
		end

		if blackboard.anim_cb_move then
			blackboard.anim_cb_move = false
			blackboard.move_state = "moving"

			self:toggle_start_move_animation_lock(unit, false, blackboard)

			blackboard.start_anim_locked = nil
			blackboard.start_anim_done = true
		end
	else
		local in_patrol = false

		if ScriptUnit.has_extension(unit, "ai_group_system") then
			local ai_group_extension = ScriptUnit.extension(unit, "ai_group_system")
			in_patrol = ai_group_extension.in_patrol
		end

		if not in_patrol then
			local unit_position = POSITION_LOOKUP[unit]
			local goal_destination = blackboard.goal_destination:unbox()
			local distance_to_goal_sq = Vector3.distance_squared(unit_position, goal_destination)

			if distance_to_goal_sq < 0.0625 then
				blackboard.goal_destination = nil
			end
		end
	end

	local should_evaluate = nil
	local navigation_extension = blackboard.navigation_extension

	if blackboard.time_to_next_evaluate < t or navigation_extension:has_reached_destination() then
		should_evaluate = "evaluate"
		blackboard.time_to_next_evaluate = t + 0.5
	end

	return "running", should_evaluate
end

BTMoveToGoalAction.start_move_animation = function (self, unit, blackboard)
	self:toggle_start_move_animation_lock(unit, true, blackboard)

	local breed = blackboard.breed
	local passive_in_patrol = breed.passive_in_patrol == nil or breed.passive_in_patrol
	local animation_name = "move_start_fwd"
	local passive_in_patrol_start_anim = breed.passive_in_patrol_start_anim

	if passive_in_patrol and passive_in_patrol_start_anim then
		blackboard.anim_cb_move = true
		animation_name = (type(passive_in_patrol_start_anim) == "table" and passive_in_patrol_start_anim[math.random(1, #passive_in_patrol_start_anim)]) or passive_in_patrol_start_anim
		blackboard.skip_move_rotation = true
	end

	Managers.state.network:anim_event(unit, animation_name)

	blackboard.move_animation_name = animation_name
	blackboard.start_anim_locked = true
end

BTMoveToGoalAction.start_move_rotation = function (self, unit, blackboard, t, dt)
	if blackboard.move_animation_name == "move_start_fwd" or blackboard.skip_move_rotation then
		self:toggle_start_move_animation_lock(unit, false, blackboard)
	else
		blackboard.anim_cb_rotation_start = false
		local target_pos = POSITION_LOOKUP[blackboard.target_unit]

		if not target_pos and blackboard.goal_destination then
			target_pos = blackboard.goal_destination:unbox()
		end

		local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, blackboard.move_animation_name, blackboard.action.start_anims_data)

		LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)
	end
end

BTMoveToGoalAction.toggle_start_move_animation_lock = function (self, unit, should_lock_ani, blackboard)
	local locomotion_extension = blackboard.locomotion_extension

	if should_lock_ani then
		locomotion_extension:use_lerp_rotation(false)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	else
		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)
	end
end

return
