require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTFollowCommanderAction = class(BTFollowCommanderAction, BTNode)

BTFollowCommanderAction.init = function (self, ...)
	BTFollowCommanderAction.super.init(self, ...)
end

BTFollowCommanderAction.name = "BTFollowCommanderAction"

BTFollowCommanderAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.time_to_next_evaluate = t + 0.5
	blackboard.time_to_next_friend_alert = t + 0.3
	local commander_extension = blackboard.commander_extension

	commander_extension:register_follow_node_update(unit)

	local follow_node_position = commander_extension:follow_node_position(unit)
	blackboard.commander_extension = commander_extension
	blackboard.follow_node_position = follow_node_position
	blackboard.new_follow_node_pos = true
	local network_manager = Managers.state.network
	local breed = blackboard.breed
	local passive_in_patrol = breed.passive_in_patrol == nil or breed.passive_in_patrol and not blackboard.ignore_passive_on_patrol

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

	blackboard.speed_animation_variable = blackboard.speed_animation_variable or Unit.animation_has_variable(unit, "move_speed") and Unit.animation_find_variable(unit, "move_speed")
end

BTFollowCommanderAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		self:toggle_start_move_animation_lock(unit, false, blackboard)
	end

	if blackboard.commander_extension then
		blackboard.commander_extension:unregister_follow_node_update(unit)
	end

	blackboard.start_anim_locked = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.start_anim_done = nil
	blackboard.skip_move_rotation = nil
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if blackboard.speed_animation_variable then
		Unit.animation_set_variable(unit, blackboard.speed_animation_variable, default_move_speed)

		blackboard.speed_animation_variable = nil
	end
end

BTFollowCommanderAction.run = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension

	if blackboard.commander_extension:follow_node_pending(blackboard) then
		return "running"
	end

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
		local goal_destination = blackboard.follow_node_position:unbox()
		local unit_position = POSITION_LOOKUP[unit]

		if blackboard.new_follow_node_pos then
			navigation_extension:move_to(goal_destination)

			blackboard.new_follow_node_pos = nil
			blackboard.finalized_new_follow_node_pos = nil
		end

		if navigation_extension:has_reached_destination() then
			blackboard.follow_node_position = nil

			return "done"
		end

		local commander_speed = 0
		local commander_locomotion = ScriptUnit.has_extension(blackboard.commander_unit, "locomotion_system")

		if commander_locomotion then
			commander_speed = Vector3.length(commander_locomotion:current_velocity())
		end

		local distance_to_goal = Vector3.distance(unit_position, goal_destination)
		local max_speed = math.max(blackboard.breed.run_speed, commander_speed)
		local min_speed = math.max(blackboard.breed.min_run_speed, commander_speed)
		local max_speed_dist = blackboard.breed.run_max_speed_distance
		local min_speed_dist = blackboard.breed.run_min_speed_distance
		local speed = math.lerp(min_speed, max_speed, math.clamp01((distance_to_goal - min_speed_dist) / max_speed_dist))

		navigation_extension:set_max_speed(speed)

		if blackboard.speed_animation_variable then
			Unit.animation_set_variable(unit, blackboard.speed_animation_variable, speed)
		end
	end

	local should_evaluate = nil

	if blackboard.time_to_next_evaluate < t or not blackboard.new_follow_node_pos and navigation_extension:has_reached_destination() then
		should_evaluate = "evaluate"
		blackboard.time_to_next_evaluate = t + 0.5
	end

	return "running", should_evaluate
end

BTFollowCommanderAction.start_move_animation = function (self, unit, blackboard)
	self:toggle_start_move_animation_lock(unit, true, blackboard)

	local breed = blackboard.breed
	local passive_in_patrol = breed.passive_in_patrol == nil or breed.passive_in_patrol
	local animation_name = "move_start_fwd"
	local passive_in_patrol_start_anim = breed.passive_in_patrol_start_anim

	if passive_in_patrol and passive_in_patrol_start_anim then
		blackboard.anim_cb_move = true
		animation_name = type(passive_in_patrol_start_anim) == "table" and passive_in_patrol_start_anim[math.random(1, #passive_in_patrol_start_anim)] or passive_in_patrol_start_anim
		blackboard.skip_move_rotation = true
	end

	Managers.state.network:anim_event(unit, animation_name)

	blackboard.move_animation_name = animation_name
	blackboard.start_anim_locked = true
end

BTFollowCommanderAction.start_move_rotation = function (self, unit, blackboard, t, dt)
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

BTFollowCommanderAction.toggle_start_move_animation_lock = function (self, unit, should_lock_ani, blackboard)
	local locomotion_extension = blackboard.locomotion_extension

	if not locomotion_extension._engine_extension_id then
		return
	end

	if should_lock_ani then
		locomotion_extension:use_lerp_rotation(false)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	else
		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)
	end
end
