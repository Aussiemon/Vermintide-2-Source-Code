require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStormVerminPushAction = class(BTStormVerminPushAction, BTNode)

BTStormVerminPushAction.init = function (self, ...)
	BTStormVerminPushAction.super.init(self, ...)
end

BTStormVerminPushAction.name = "BTStormVerminPushAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTStormVerminPushAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTStormVerminPushAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.attack_token = true
	local network_manager = Managers.state.network
	local navigation_extension = blackboard.navigation_extension

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local target_unit = blackboard.target_unit
	blackboard.attacking_target = target_unit
	blackboard.move_state = "attacking"
	local attack_anim = randomize(action.attack_anim)

	network_manager:anim_event(unit, attack_anim)

	blackboard.spawn_to_running = nil
	blackboard.wake_up_push = 0

	if action.attack_finished_duration then
		local difficulty = Managers.state.difficulty:get_difficulty()
		local attack_finished_duration = action.attack_finished_duration[difficulty]

		if attack_finished_duration then
			blackboard.attack_finished_t = t + Math.random_range(attack_finished_duration[1], attack_finished_duration[2])
		end
	end

	AiUtils.add_attack_intensity(target_unit, action, blackboard)
end

BTStormVerminPushAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attacking_target = nil
	blackboard.attack_finished = nil
	blackboard.attack_anim = nil
	blackboard.attack_finished_t = nil
	blackboard.attack_token = nil
end

BTStormVerminPushAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted then
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "idle")

		return "done"
	elseif blackboard.attack_finished_t and blackboard.attack_finished_t < t and blackboard.attack_finished or not blackboard.attack_finished_t and blackboard.attack_finished then
		return "done"
	else
		self:attack(unit, t, dt, blackboard)

		return "running"
	end
end

BTStormVerminPushAction.attack = function (self, unit, t, dt, blackboard)
	local locomotion = blackboard.locomotion_extension
	local attacking_target = blackboard.attacking_target

	if Unit.alive(attacking_target) then
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, attacking_target)

		locomotion:set_wanted_rotation(rotation)
	end
end

BTStormVerminPushAction.anim_cb_stormvermin_push = function (self, unit, blackboard, target_unit)
	if not DamageUtils.check_distance(blackboard.action, blackboard, unit, target_unit) or not DamageUtils.check_infront(unit, target_unit) then
		return
	end

	local action = blackboard.action

	AiUtils.damage_target(target_unit, unit, action, action.damage)

	local status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if status_extension and not status_extension:is_disabled() then
		StatusUtils.set_pushed_network(target_unit, true)

		local velocity = Quaternion.forward(Unit.local_rotation(unit, 0)) * action.impact_push_speed
		local locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")

		locomotion_extension:add_external_velocity(velocity, action.max_impact_push_speed)
	end
end

BTStormVerminPushAction.anim_cb_attack_finished = function (self, unit, blackboard)
	blackboard.attack_finished = true
end
