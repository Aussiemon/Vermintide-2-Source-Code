require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTFallbackIdleAction = class(BTFallbackIdleAction, BTNode)
BTFallbackIdleAction.init = function (self, ...)
	BTFallbackIdleAction.super.init(self, ...)

	return 
end
BTFallbackIdleAction.name = "BTFallbackIdleAction"
BTFallbackIdleAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.spawn_to_running = nil
	local animation = "idle"

	if action and action.idle_animation then
		animation = action.idle_animation
	elseif action and action.combat_animations then
		local anims = action.combat_animations
		local index = action.anim_cycle_index%#anims + 1
		animation = anims[index]
		action.anim_cycle_index = index
	end

	if blackboard.move_state ~= "idle" or (action and action.force_idle_animation) then
		local network_manager = Managers.state.network

		network_manager.anim_event(network_manager, unit, animation)

		blackboard.move_state = "idle"
	end

	return 
end
BTFallbackIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return 
end
local Unit_alive = Unit.alive
BTFallbackIdleAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.target_unit

	if Unit_alive(target_unit) then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	return "running"
end

return 
