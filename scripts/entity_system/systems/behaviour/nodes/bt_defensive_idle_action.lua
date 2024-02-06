-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_defensive_idle_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTDefensiveIdleAction = class(BTDefensiveIdleAction, BTNode)

BTDefensiveIdleAction.init = function (self, ...)
	BTDefensiveIdleAction.super.init(self, ...)
end

BTDefensiveIdleAction.name = "BTDefensiveIdleAction"

BTDefensiveIdleAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTDefensiveIdleAction

	local animation = action.animation

	network_manager:anim_event(unit, animation)

	blackboard.move_state = "idle"

	if action.sound_event then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(action.sound_event, unit)
	end

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.idle_end_time = t + action.duration
end

BTDefensiveIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)
end

BTDefensiveIdleAction.run = function (self, unit, blackboard, t, dt)
	if t > blackboard.idle_end_time then
		return "done"
	end

	return "running"
end
