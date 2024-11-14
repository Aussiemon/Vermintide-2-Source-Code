-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_interest_point_use_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTInterestPointUseAction = class(BTInterestPointUseAction, BTNode)

BTInterestPointUseAction.init = function (self, ...)
	BTInterestPointUseAction.super.init(self, ...)
end

BTInterestPointUseAction.name = "BTInterestPointUseAction"
BTInterestPointUseAction.action_setup = {
	idle_hammer_low = {
		to_passive = true,
		wield = true,
	},
}

BTInterestPointUseAction.enter = function (self, unit, blackboard, t)
	local interest_point_system_api = blackboard.system_api.ai_interest_point_system
	local request = interest_point_system_api.get_claim(blackboard.ip_request_id)
	local point = request.point
	local animations = point.animations
	local animations_n = point.animations_n
	local animation_index = math.random(1, animations_n)
	local animation = animations[animation_index]
	local action_setup = BTInterestPointUseAction.action_setup[animation]

	if action_setup then
		if action_setup.to_passive then
			AiUtils.enter_passive(unit, blackboard)
		end

		if action_setup.wield then
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
		end
	end

	Managers.state.network:anim_event(unit, animation)

	blackboard.move_state = "idle"

	local duration = request.point_extension.duration

	if duration and duration > 0 then
		local duration_multiplier = 0.8 + math.random() * 0.4

		blackboard.ip_end_time = t + duration * duration_multiplier
	end

	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)
end

BTInterestPointUseAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local interest_point_system_api = blackboard.system_api.ai_interest_point_system

	if HEALTH_ALIVE[unit] then
		interest_point_system_api.release_claim(blackboard.ip_request_id)

		blackboard.ip_request_id = nil
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	blackboard.ip_end_time = nil

	if blackboard.ip_next_request_id ~= nil and HEALTH_ALIVE[unit] then
		if reason == "aborted" then
			interest_point_system_api.release_claim(blackboard.ip_next_request_id, unit)

			blackboard.ip_next_request_id = nil
		else
			blackboard.ip_request_id = blackboard.ip_next_request_id
		end

		blackboard.ip_next_request_id = nil
	end
end

BTInterestPointUseAction.run = function (self, unit, blackboard, t, dt)
	if script_data.ai_interest_point_debug then
		Debug.text("BTInterestPointApproachAction state = %s", blackboard.ip_state)
		QuickDrawer:circle(blackboard.ip_root_pos:unbox(), 10, Vector3.up())
	end

	if blackboard.ip_end_time ~= nil and t >= blackboard.ip_end_time then
		local moving_to_ip = blackboard.group_blackboard.rats_currently_moving_to_ip
		local max_moving = InterestPointSettings.max_rats_currently_moving_to_ip

		if max_moving < moving_to_ip then
			blackboard.ip_end_time = t + 1 + math.random() * 2

			return "running"
		end

		local interest_point_system_api = blackboard.system_api.ai_interest_point_system

		if blackboard.ip_next_request_id == nil then
			local action = self._tree_node.action_data

			blackboard.ip_next_request_id = interest_point_system_api.start_async_claim_request(unit, blackboard.ip_root_pos:unbox(), action.min_range, action.max_range, blackboard.ip_request_id)
		else
			local next_request = interest_point_system_api.get_claim(blackboard.ip_next_request_id)

			if next_request.result == "success" then
				return "done"
			elseif next_request.result == "failed" then
				local current_request = interest_point_system_api.get_claim(blackboard.ip_request_id)
				local duration_multiplier = 0.8 + math.random() * 0.4
				local duration = current_request.point_extension.duration * duration_multiplier

				blackboard.ip_end_time = blackboard.ip_end_time + duration

				interest_point_system_api.release_claim(blackboard.ip_next_request_id)

				blackboard.ip_next_request_id = nil
			end
		end
	end

	return "running"
end
