require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormVerminPushAction = class(BTStormVerminPushAction, BTNode)
BTStormVerminPushAction.init = function (self, ...)
	BTStormVerminPushAction.super.init(self, ...)

	return 
end
BTStormVerminPushAction.name = "BTStormVerminPushAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end

	return 
end

BTStormVerminPushAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTStormVerminPushAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.has_engaged = true
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)
	local target_unit_id = network_manager.unit_game_object_id(network_manager, blackboard.target_unit)

	network_manager.network_transmit:send_rpc_all("rpc_enemy_has_target", unit_id, target_unit_id)

	local navigation_extension = blackboard.navigation_extension

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local target_unit = blackboard.target_unit
	blackboard.attacking_target = target_unit
	blackboard.move_state = "attacking"

	network_manager.anim_event(network_manager, unit, "to_combat")

	local attack_anim = randomize(action.attack_anim)

	network_manager.anim_event(network_manager, unit, attack_anim)

	blackboard.spawn_to_running = nil
	blackboard.wake_up_push = 0

	return 
end
BTStormVerminPushAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.move_state = nil

	blackboard.navigation_extension:set_enabled(true)

	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attacking_target = nil
	blackboard.attack_anim = nil

	return 
end
BTStormVerminPushAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted then
		local network_manager = Managers.state.network

		network_manager.anim_event(network_manager, unit, "idle")

		return "done"
	elseif blackboard.attack_finished then
		return "done"
	else
		self.attack(self, unit, t, dt, blackboard)

		return "running"
	end

	return 
end
BTStormVerminPushAction.attack = function (self, unit, t, dt, blackboard)
	local locomotion = blackboard.locomotion_extension
	local attacking_target = blackboard.attacking_target
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, attacking_target)

	locomotion.set_wanted_rotation(locomotion, rotation)

	return 
end
BTStormVerminPushAction.anim_cb_stormvermin_push = function (self, unit, blackboard, target_unit)
	if not DamageUtils.check_distance(blackboard.action, blackboard, unit, target_unit) or not DamageUtils.check_infront(unit, target_unit) then
		return 
	end

	local action = blackboard.action
	local status_extension = ScriptUnit.extension(target_unit, "status_system")

	AiUtils.damage_target(target_unit, unit, action, action.damage)

	if not status_extension.is_disabled(status_extension) then
		StatusUtils.set_pushed_network(target_unit, true)

		local velocity = Quaternion.forward(Unit.local_rotation(unit, 0))*action.impact_push_speed
		local locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")

		locomotion_extension.add_external_velocity(locomotion_extension, velocity, action.max_impact_push_speed)
	end

	return 
end

return 
