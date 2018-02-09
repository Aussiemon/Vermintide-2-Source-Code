require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAlliedAvoidCombatAction = class(BTAlliedAvoidCombatAction, BTNode)
BTAlliedAvoidCombatAction.init = function (self, ...)
	BTAlliedAvoidCombatAction.super.init(self, ...)

	return 
end
BTAlliedAvoidCombatAction.name = "BTAlliedAvoidCombatAction"
BTAlliedAvoidCombatAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.target_status_extension = ScriptUnit.extension(blackboard.player_controller, "status_system")
	local self_pos = POSITION_LOOKUP[unit]
	local flee_dir = self_pos - POSITION_LOOKUP[blackboard.player_controller]
	local wanted_position = self_pos + flee_dir
	local pos_on_nav_mesh = GwNavQueries.inside_position_from_outside_position(blackboard.nav_world, wanted_position, 6, 6, 4, 0.5)
	local final_pos = pos_on_nav_mesh or self_pos
	blackboard.wanted_flee_pos = Vector3Box(final_pos)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, blackboard.breed.run_speed)

	return 
end
BTAlliedAvoidCombatAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_max_speed(navigation_extension, default_move_speed)

	blackboard.wanted_flee_pos = nil

	return 
end
BTAlliedAvoidCombatAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	self.flee(self, unit, t, dt, blackboard, locomotion_extension)

	return "running", "evaluate"
end
BTAlliedAvoidCombatAction._go_idle = function (self, unit, blackboard, locomotion_extension)
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
BTAlliedAvoidCombatAction._go_moving = function (self, unit, blackboard, action)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, action.move_anim)

	return 
end
BTAlliedAvoidCombatAction.flee = function (self, unit, t, dt, blackboard, locomotion_extension)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	self._move_to_flee_location(self, unit, blackboard, t, dt)

	local destination = navigation_extension.destination(navigation_extension)
	local to_vec = destination - POSITION_LOOKUP[unit]

	Vector3.set_z(to_vec, 0)

	local distance_sq = Vector3.length_squared(to_vec)
	local is_following_path = navigation_extension.is_following_path(navigation_extension)

	if blackboard.move_state ~= "moving" and is_following_path and 0.25 < distance_sq then
		self._go_moving(self, unit, blackboard, action)
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		self._go_idle(self, unit, blackboard, locomotion_extension)
	end

	local target_intensity = blackboard.target_status_extension and blackboard.target_status_extension:get_intensity()
	blackboard.target_is_in_combat = target_intensity and 0 < target_intensity

	return 
end
BTAlliedAvoidCombatAction._move_to_flee_location = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension
	local wanted_position = blackboard.wanted_flee_pos:unbox()

	navigation_extension.move_to(navigation_extension, wanted_position)

	return 
end

return 
