-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_allied_avoid_combat_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAlliedAvoidCombatAction = class(BTAlliedAvoidCombatAction, BTNode)

BTAlliedAvoidCombatAction.init = function (self, ...)
	BTAlliedAvoidCombatAction.super.init(self, ...)
end

BTAlliedAvoidCombatAction.name = "BTAlliedAvoidCombatAction"

BTAlliedAvoidCombatAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.target_status_extension = ScriptUnit.extension(blackboard.player_controller_unit, "status_system")

	local self_pos = POSITION_LOOKUP[unit]
	local wanted_position = POSITION_LOOKUP[blackboard.player_controller_unit]
	local pos_on_nav_mesh = LocomotionUtils.pos_on_mesh(blackboard.nav_world, wanted_position, 1, 1)
	local final_pos = pos_on_nav_mesh or self_pos

	blackboard.wanted_flee_pos = Vector3Box(final_pos)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(blackboard.breed.run_speed)
end

BTAlliedAvoidCombatAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)
	Unit.set_unit_visibility(unit, true)

	if blackboard.player_controller_unit then
		local wanted_position = POSITION_LOOKUP[blackboard.player_controller_unit]
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:teleport_to(wanted_position)
	end

	blackboard.wanted_flee_pos = nil
end

BTAlliedAvoidCombatAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	self:flee(unit, t, dt, blackboard, locomotion_extension)

	return "running", "evaluate"
end

BTAlliedAvoidCombatAction._go_idle = function (self, unit, blackboard, locomotion_extension)
	blackboard.move_state = "idle"

	local action = blackboard.action

	Managers.state.network:anim_event(unit, action.idle_anim or "idle")
	Unit.set_unit_visibility(unit, false)
end

BTAlliedAvoidCombatAction._go_moving = function (self, unit, blackboard, action)
	blackboard.move_state = "moving"

	Managers.state.network:anim_event(unit, action.move_anim)
end

BTAlliedAvoidCombatAction.flee = function (self, unit, t, dt, blackboard, locomotion_extension)
	local action = blackboard.action
	local navigation_extension = blackboard.navigation_extension

	self:_move_to_flee_location(unit, blackboard, t, dt)

	local destination = navigation_extension:destination()
	local to_vec = destination - POSITION_LOOKUP[unit]

	Vector3.set_z(to_vec, 0)

	local distance_sq = Vector3.length_squared(to_vec)
	local is_following_path = navigation_extension:is_following_path()

	if blackboard.move_state ~= "moving" and is_following_path and distance_sq > 0.25 then
		self:_go_moving(unit, blackboard, action)
	elseif blackboard.move_state ~= "idle" and (not is_following_path or distance_sq < 0.04000000000000001) then
		self:_go_idle(unit, blackboard, locomotion_extension)
	end

	local target_intensity = blackboard.target_status_extension and blackboard.target_status_extension:get_pacing_intensity()

	blackboard.target_is_in_combat = target_intensity and target_intensity > 0
end

BTAlliedAvoidCombatAction._move_to_flee_location = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension
	local wanted_position = blackboard.wanted_flee_pos:unbox()

	navigation_extension:move_to(wanted_position)
end
