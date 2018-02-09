require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAlliedFollowAction = class(BTAlliedFollowAction, BTNode)
BTAlliedFollowAction.init = function (self, ...)
	BTAlliedFollowAction.super.init(self, ...)

	return 
end
BTAlliedFollowAction.name = "BTAlliedFollowAction"
BTAlliedFollowAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.target_status_extension = ScriptUnit.extension(blackboard.player_controller, "status_system")
	blackboard.teleport_timer = t + 1
	blackboard.follow_timer = t

	return 
end
BTAlliedFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil

	return 
end
BTAlliedFollowAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	self.follow(self, unit, t, dt, blackboard, locomotion_extension)

	return "running", "evaluate"
end
BTAlliedFollowAction._go_idle = function (self, unit, blackboard, locomotion_extension)
	blackboard.move_state = "idle"
	local action = blackboard.action

	Managers.state.network:anim_event(unit, action.idle_anim or "idle")

	local target_unit = blackboard.target_unit

	if target_unit then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		locomotion_extension.set_wanted_rotation(locomotion_extension, rot)
	end

	return 
end
BTAlliedFollowAction._go_moving = function (self, unit, t, blackboard, action)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, action.move_anim)

	return 
end
BTAlliedFollowAction._teleport_to = function (self, blackboard, t, pos)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.teleport_to(locomotion_extension, pos)

	return 
end
BTAlliedFollowAction._get_wanted_pos = function (self, unit, blackboard)
	local target_unit = blackboard.player_controller
	local target_position = POSITION_LOOKUP[target_unit]
	local wanted_position = target_position + Vector3.forward()*0.5 + Quaternion.right(Unit.local_rotation(target_unit, 0))*2
	local projected_pos = LocomotionUtils.pos_on_mesh(blackboard.nav_world, wanted_position, 1, 1)

	if projected_pos then
		return projected_pos
	else
		local p = GwNavQueries.inside_position_from_outside_position(blackboard.nav_world, wanted_position, 6, 6, 4, 0.5)

		if p then
			return p
		else
			return wanted_position
		end
	end

	return 
end
BTAlliedFollowAction.follow = function (self, unit, t, dt, blackboard, locomotion_extension)
	Profiler.start("allied_follow_action")

	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	if 1 < navigation_extension.number_failed_move_attempts(navigation_extension) then
		blackboard.remembered_threat_pos = false

		if blackboard.move_state ~= "idle" then
			self._go_idle(self, unit, blackboard, locomotion_extension)
		end
	end

	if blackboard.follow_timer < t then
		self._follow_target(self, unit, blackboard, t, dt)
	end

	local destination = navigation_extension.destination(navigation_extension)
	local to_vec = destination - POSITION_LOOKUP[unit]

	Vector3.set_z(to_vec, 0)

	local distance_sq = Vector3.length_squared(to_vec)
	local is_following_path = navigation_extension.is_following_path(navigation_extension)

	if blackboard.move_state ~= "moving" and is_following_path and 0.25 < distance_sq then
		self._go_moving(self, unit, t, blackboard, action)
	elseif not is_following_path and 7 < blackboard.target_dist and blackboard.teleport_timer < t then
		local nav_world = blackboard.nav_world
		local projected_pos = LocomotionUtils.pos_on_mesh(nav_world, POSITION_LOOKUP[blackboard.player_controller], 1, 1)

		if projected_pos then
			self._teleport_to(self, blackboard, t, projected_pos)
		end

		blackboard.teleport_timer = t + 0.5
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		self._go_idle(self, unit, blackboard, locomotion_extension)
	end

	local target_intensity = blackboard.target_status_extension and blackboard.target_status_extension:get_intensity()
	blackboard.target_is_in_combat = target_intensity and 0 < target_intensity

	Profiler.stop("allied_follow_action")

	return 
end
BTAlliedFollowAction._follow_target = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension
	local wanted_position = self._get_wanted_pos(self, unit, blackboard)

	navigation_extension.move_to(navigation_extension, wanted_position)

	blackboard.follow_timer = t + 0.1

	return 
end

return 
