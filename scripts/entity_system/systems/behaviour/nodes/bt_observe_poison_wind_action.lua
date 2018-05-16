require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTObservePoisonWind = class(BTObservePoisonWind, BTNode)
BTObservePoisonWind.name = "BTObservePoisonWind"

BTObservePoisonWind.init = function (self, ...)
	BTObservePoisonWind.super.init(self, ...)
end

BTObservePoisonWind.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.explosion_impact = nil
	blackboard.observe_poison_wind = {}

	Managers.state.network:anim_event(unit, "attack_throw_look")
end

BTObservePoisonWind.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.observe_poison_wind = nil
	blackboard.action = nil

	blackboard.navigation_extension:set_enabled(true)
end

BTObservePoisonWind.run = function (self, unit, blackboard, t, dt)
	local throw_globe_data = blackboard.throw_globe_data

	if not throw_globe_data then
		return "done"
	end

	if blackboard.target_dist < 5 then
		return "done"
	end

	local next_throw_at = throw_globe_data.next_throw_at or -math.huge

	if t > next_throw_at then
		return "done"
	end

	local locomotion_extension = blackboard.locomotion_extension
	local throw_position = blackboard.throw_globe_data.throw_pos:unbox()
	local rotation = LocomotionUtils.look_at_position_flat(unit, throw_position)

	locomotion_extension:set_wanted_rotation(rotation)

	local poison_globe_impact = blackboard.explosion_impact

	if poison_globe_impact then
		Managers.state.network:anim_event(unit, "attack_throw_score")

		blackboard.observe_poison_wind.score_anim = true
		blackboard.explosion_impact = nil
	end

	if blackboard.observe_poison_wind.score_anim then
		local score_done = blackboard.anim_cb_attack_throw_score_finished

		if score_done then
			blackboard.anim_cb_attack_throw_score_finished = nil

			return "done"
		end
	end

	return "running"
end

return
