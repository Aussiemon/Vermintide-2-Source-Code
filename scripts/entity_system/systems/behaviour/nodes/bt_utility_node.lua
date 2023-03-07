require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTUtilityNode = class(BTUtilityNode, BTNode)

BTUtilityNode.init = function (self, ...)
	BTUtilityNode.super.init(self, ...)

	self._children = {}
	self.fail_cooldown_name = self._identifier .. "_fail_cooldown"
end

BTUtilityNode.name = "BTUtilityNode"

BTUtilityNode.ready = function (self, lua_node)
	for name, child in pairs(self._children) do
		self._action_list = self._action_list or {}
		self._action_list[#self._action_list + 1] = child._tree_node.action_data
	end
end

BTUtilityNode.enter = function (self, unit, blackboard, t)
	return
end

BTUtilityNode.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.running_attack_action = nil

	self:set_running_child(unit, blackboard, t, nil, reason)
end

local function swap(t, i, j)
	local temp = t[i]
	t[i] = t[j]
	t[j] = temp
end

local function randomize_actions(unit, actions, blackboard, t, node_children)
	local num_actions = #actions
	local total_utility_score = 0

	for i = 1, num_actions do
		local action = actions[i]
		local action_name = action.name
		local node = node_children[action_name]
		local score = 0

		if node:condition(blackboard) then
			score = Utility.get_action_utility(action, action_name, blackboard, t)
		end

		actions[i].utility_score = score
		total_utility_score = total_utility_score + score
	end

	for i = 1, num_actions do
		local picked_index = nil
		local random_utility_score = math.random() * total_utility_score

		for j = i, num_actions do
			local action_utility_score = actions[j].utility_score

			if random_utility_score < action_utility_score then
				picked_index = j

				break
			end

			random_utility_score = random_utility_score - action_utility_score
		end

		if not picked_index then
			num_actions = i - 1

			return num_actions
		end

		total_utility_score = total_utility_score - actions[picked_index].utility_score

		if picked_index ~= i then
			swap(actions, picked_index, i)
		end
	end

	return num_actions
end

BTUtilityNode.run = function (self, unit, blackboard, t, dt)
	local action_data = self._tree_node.action_data
	local fail_cooldown_t = blackboard[self.fail_cooldown_name]

	if fail_cooldown_t then
		if t < fail_cooldown_t then
			return "failed"
		end

		blackboard[self.fail_cooldown_name] = nil
	end

	local running_node = self:current_running_child(blackboard)
	local result = "failed"
	local evaluate_next_frame = nil

	if running_node and not blackboard.evaluate then
		local running_node_id = running_node._identifier
		result, evaluate_next_frame = running_node:evaluate(unit, blackboard, t, dt)

		if result == "done" then
			local utility_data = blackboard.utility_actions[running_node_id]
			utility_data.last_done_time = t
		end

		if result ~= "failed" then
			blackboard.evaluate = evaluate_next_frame

			return result
		end
	end

	local actions = self._action_list
	local num_actions = randomize_actions(unit, actions, blackboard, t, self._children)

	for i = 1, num_actions do
		local action = actions[i]
		local action_name = action.name
		local node = self._children[action_name]

		if node ~= running_node then
			self:set_running_child(unit, blackboard, t, node, "aborted")

			running_node = node
		end

		local utility_data = blackboard.utility_actions[action_name]
		utility_data.last_time = t
		local node_id = node._identifier
		result, evaluate_next_frame = node:evaluate(unit, blackboard, t, dt)

		if result ~= "running" then
			if result == "done" then
				utility_data.last_done_time = t
			end

			self:set_running_child(unit, blackboard, t, nil, result)

			running_node = nil
		end

		if result ~= "failed" then
			blackboard.evaluate = evaluate_next_frame

			break
		end
	end

	if result == "running" or result == "done" then
		return result
	end

	local fail_cooldown_blackboard_identifier = action_data and action_data.fail_cooldown_blackboard_identifier
	fail_cooldown_t = fail_cooldown_blackboard_identifier and blackboard[fail_cooldown_blackboard_identifier]

	if fail_cooldown_t == nil then
		fail_cooldown_t = t + (action_data and action_data.fail_cooldown or 0.5)
	end

	blackboard[self.fail_cooldown_name] = fail_cooldown_t

	return result
end

BTUtilityNode.add_child = function (self, node)
	self._children[node._identifier] = node
end
