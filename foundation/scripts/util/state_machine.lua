local profiler_names = {}

local function profiler_scope(state_name, scope_type)
	assert(state_name, "State without name not allowed.")

	local scope = profiler_names[state_name]

	if scope == nil then
		scope = {
			create = state_name .. ":new",
			enter = state_name .. ":on_enter",
			exit = state_name .. ":on_exit"
		}
		profiler_names[state_name] = scope
	end

	local scope_name = scope[scope_type]

	assert(scope_name)

	return scope_name
end

StateMachine = class(StateMachine)
StateMachine.DEBUG = false

local function debug_print(format, ...)
	if script_data.network_debug or StateMachine.DEBUG then
		printf("[StateMachine] " .. format, ...)
	end
end

StateMachine.init = function (self, parent, start_state, params, profiling_debugging_enabled)
	self._parent = parent
	self._params = params
	self._profiling_debugging_enabled = profiling_debugging_enabled

	debug_print("Init %-30s", start_state.NAME)
	self:_change_state(start_state, params)
end

StateMachine._change_state = function (self, new_state, params)
	if self._state then
		if self._state.on_exit and self._profiling_debugging_enabled then
			debug_print("Exiting  %-30s with on_exit()", self._state.NAME)

			local scope_name = profiler_scope(self._state.NAME, "exit")

			Profiler.start(scope_name)
			self._state:on_exit()
			Profiler.stop(scope_name)
		elseif self._state.on_exit then
			self._state:on_exit()
		else
			debug_print("Exiting  %-30s", tostring(self._state.NAME))
		end
	end

	if self._profiling_debugging_enabled then
		local scope_name = profiler_scope(new_state.NAME, "create")

		Profiler.start(scope_name)

		self._state = new_state:new()

		Profiler.stop(scope_name)
	else
		self._state = new_state:new()
	end

	self._state.parent = self._parent

	if self._state.on_enter and self._profiling_debugging_enabled then
		debug_print("Entering %-30s with on_enter()", new_state.NAME)

		local scope_name = profiler_scope(self._state.NAME, "enter")

		Profiler.start(scope_name)
		self._state:on_enter(params)
		Profiler.stop(scope_name)
	elseif self._state.on_enter then
		self._state:on_enter(params)
	else
		debug_print("Entering %-30s", new_state.NAME)
	end
end

StateMachine.state = function (self)
	return self._state
end

StateMachine.update = function (self, dt, t)
	local new_state = self._state:update(dt, t)

	if new_state then
		self:_change_state(new_state, self._params)
	end
end

StateMachine.destroy = function (self, ...)
	debug_print("destroying")

	if self._state and self._state.on_exit then
		debug_print("Exiting %-30s with on_exit()", self._state.NAME)
		self._state:on_exit(...)
	end
end

return
