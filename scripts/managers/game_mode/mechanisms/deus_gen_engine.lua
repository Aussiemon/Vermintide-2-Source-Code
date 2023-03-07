local function find_next_action(action_list)
	for i = #action_list, 1, -1 do
		local action = action_list[i]

		if action._next_action_generators then
			for index, next_action in pairs(action._next_actions) do
				if not next_action then
					local new_action = action._next_action_generators[index]()
					new_action._parent = action
					action._next_actions[index] = new_action

					return new_action
				end
			end
		end
	end
end

local function cancel_action(action)
	if not action._parent then
		return
	end

	for index, next_action in pairs(action._parent._next_actions) do
		if next_action == action then
			action._parent._next_actions[index] = false
		end
	end
end

local function handle_success(action, next_action_generators)
	action._next_action_generators = next_action_generators

	if next_action_generators then
		action._next_actions = {}

		for index, _ in ipairs(next_action_generators) do
			action._next_actions[index] = false
		end
	end
end

DeusGenEngine = {
	get_generator = function (action_list, per_action_callback)
		local retrying = false

		return function ()
			if #action_list > 0 then
				local action = action_list[#action_list]

				if per_action_callback then
					per_action_callback(action_list, action)
				end

				local result, next_action_generators = nil

				if not retrying then
					result, next_action_generators = action.run()
				else
					result, next_action_generators = action.retry()
				end

				if result then
					retrying = false

					handle_success(action, next_action_generators)

					local next_action = find_next_action(action_list)

					if next_action then
						action_list[#action_list + 1] = next_action
					else
						return true
					end
				else
					retrying = true

					cancel_action(action)

					action_list[#action_list] = nil
				end

				return false
			else
				return true, "Gen Failed"
			end
		end
	end
}
