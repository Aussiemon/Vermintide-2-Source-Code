-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_interest_point_choose_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTInterestPointChooseAction = class(BTInterestPointChooseAction, BTNode)
BTInterestPointChooseAction.name = "BTInterestPointChooseAction"

BTInterestPointChooseAction.init = function (self, ...)
	BTInterestPointChooseAction.super.init(self, ...)
end

BTInterestPointChooseAction.enter = function (self, unit, blackboard, t)
	local interest_point_system_api = blackboard.system_api.ai_interest_point_system

	if blackboard.ip_request_id == nil then
		if blackboard.ip_root_pos == nil then
			blackboard.ip_root_pos = Vector3Box(POSITION_LOOKUP[unit])
		end

		local action = self._tree_node.action_data
		local position = blackboard.ip_root_pos:unbox()
		local min_range = 0
		local max_range = action.max_range

		blackboard.ip_request_id = interest_point_system_api.start_async_claim_request(unit, position, min_range, max_range)
	end

	if false then
		-- Nothing
	end
end

BTInterestPointChooseAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if (reason == "failed" or reason == "aborted") and HEALTH_ALIVE[unit] then
		local interest_point_system_api = blackboard.system_api.ai_interest_point_system

		interest_point_system_api.release_claim(blackboard.ip_request_id, unit)

		blackboard.ip_request_id = nil
		blackboard.ignore_interest_points = true
	end
end

BTInterestPointChooseAction.run = function (self, unit, blackboard, t, dt)
	local ip_request_id = blackboard.ip_request_id
	local interest_point_system_api = blackboard.system_api.ai_interest_point_system
	local request = interest_point_system_api.get_claim(ip_request_id)

	if request.result == nil then
		return "running"
	elseif request.result == "failed" then
		return "failed"
	else
		return "done"
	end
end
