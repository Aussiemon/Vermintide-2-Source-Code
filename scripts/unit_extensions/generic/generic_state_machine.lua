script_data.debug_state_machines = script_data.debug_state_machines or Development.parameter("debug_state_machines")
local no_write_meta = {
	__index = function (t, k)
		return nil
	end,
	__newindex = function (t, k, v)
		error("FAIL : tried to set [" .. k .. "] to [" .. tostring(v) .. "]")

		return 
	end
}
GenericStateMachine = class(GenericStateMachine)
GenericStateMachine.init = function (self, extension_init_context, unit, states, start_state)
	self.unit = unit
	self.debugging = false

	return 
end
GenericStateMachine.post_init = function (self, states, start_state)
	self.states = states
	self.dummy_params = setmetatable({}, no_write_meta)
	self.dummy_state = setmetatable({
		name = "dummy",
		update = function ()
			return 
		end,
		on_exit = function ()
			return 
		end
	}, no_write_meta)
	self.state_current = self.dummy_state
	self.state_next = start_state
	self.state_next_params = {}

	return 
end
GenericStateMachine.update = function (self, unit, input, dt, context, t)
	if self.state_current ~= nil then
		Profiler.start(self.state_current.name)
		self.state_current:update(unit, input, dt, context, t)
		Profiler.stop(self.state_current.name)
	end

	if script_data.debug_state_machines then
		if self.state_next ~= nil then
			printf("Changing state from %s to %s on unit %s", self.state_current.name, self.state_next, self.unit)
			Debug.text("State: %s -> %s", self.state_current.name, self.state_next)
		else
			Debug.text("State: %s", self.state_current.name)
		end
	end

	if self.state_next ~= nil then
		self.state_current:on_exit(unit, input, dt, context, t, self.state_next)

		local state = self.states[self.state_next]

		state.on_enter(state, unit, input, dt, context, t, self.state_current.name, self.state_next_params or self.dummy_params)

		self.state_current = state
		self.state_next = nil
		self.state_next_params = nil
	end

	if self.debugging ~= script_data.debug_state_machines then
		self.debugging = not not script_data.debug_state_machines
	end

	return 
end
GenericStateMachine.change_state = function (self, state_next, state_next_params)
	assert(self.state_next == nil, "next state is already set ")

	self.state_next = state_next
	self.state_next_params = state_next_params

	return 
end
GenericStateMachine.exit_current_state = function (self)
	if self.state_current then
		local t = Managers.time:time("game")
		local input, context, next_state, dt = nil

		self.state_current:on_exit(self.unit, input, dt, context, t, next_state)

		self.state_current = nil
	end

	return 
end
GenericStateMachine.current_state = function (self)
	return (self.state_current and self.state_current.name) or "none"
end

return 
