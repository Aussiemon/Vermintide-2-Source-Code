-- chunkname: @foundation/scripts/util/visual_state_machine.lua

VisualStateMachine = class(VisualStateMachine)
VisualStateMachine.DEBUG = false

local function debug_print(format, ...)
	if VisualStateMachine.DEBUG then
		printf("[VisualStateMachine] " .. format, ...)
	end
end

VisualStateMachine.init = function (self, name, parent, ...)
	assert(type(name) == "string", "state machine name must be specified and be a string")

	self._name = name
	self._global_args = {
		...,
	}
	self._events = {}
	self._pending_event = nil
	self._pending_args = nil

	if parent then
		self._root_state_machine = parent._root_state_machine
	else
		self._root_state_machine = self
	end

	if parent ~= nil then
		local parent_stack = parent._root_state_machine._state_machine_stack

		assert(parent_stack[#parent_stack] == parent, "the parent must be last in the stack")

		self._state_machine_stack = parent_stack
		parent_stack[#parent_stack + 1] = self
	else
		self._state_machine_stack = {
			self,
		}
	end

	self._current_state = nil
	self._transitions = {}

	Managers.state_machine:_register_state_machine(self)
end

VisualStateMachine.destroy = function (self)
	local state = self._current_state

	self._current_state = nil

	if state ~= nil then
		if state.leave ~= nil then
			state:leave()
		end

		if state.destroy ~= nil then
			state:destroy()
		end
	end

	local stack = self._state_machine_stack

	assert(stack[#stack] == self, "state machines must be destroyed in reversed creation order")
	table.remove(stack, #stack)

	self._root_state_machine = nil
	self._state_machine_stack = nil

	Managers.state_machine:_unregister_state_machine(self)
end

VisualStateMachine.add_transition = function (self, source_class_name, event_name, target_class)
	local transitions = self._transitions

	if transitions[source_class_name] == nil then
		transitions[source_class_name] = {}
	end

	local target_transitions = transitions[source_class_name]

	assert(target_transitions[event_name] == nil, "the event " .. event_name .. " already has a transition to " .. tostring(target_transitions[event_name]))

	target_transitions[event_name] = target_class
end

VisualStateMachine.remove_transition = function (self, source_class_name, event_name)
	local transitions = self._transitions[source_class_name]

	if transitions == nil then
		return
	end

	transitions[event_name] = nil
end

VisualStateMachine.set_transitions = function (self, source_class_name, transitions)
	self._transitions[source_class_name] = transitions
end

VisualStateMachine.set_initial_state = function (self, state_class, ...)
	assert(self._current_state == nil, "it is not allowed to set initial state twice")

	self._current_state = self:_enter_state(state_class, {
		...,
	})
end

VisualStateMachine.update = function (self, dt, t)
	if self._root_state_machine ~= self then
		return
	end

	local stack = self._state_machine_stack
	local leaf_index = #self._state_machine_stack

	for ii, state_machine in ipairs(self._state_machine_stack) do
		local state = state_machine._current_state
		local update_func

		if ii == leaf_index then
			if state ~= nil and state.update ~= nil then
				update_func = state.update
			end
		elseif state ~= nil and state.parent_update ~= nil then
			update_func = state.parent_update
		end

		if update_func ~= nil then
			local args = {
				update_func(state, dt, t),
			}
			local event_name = args[1]

			table.remove(args, 1)

			local root_state_machine = self._root_state_machine

			if root_state_machine._pending_event ~= nil then
				event_name = root_state_machine._pending_event
				args = root_state_machine._pending_args
				root_state_machine._pending_event = nil
				root_state_machine._pending_args = nil
			end

			if event_name ~= nil then
				local state_machine_index = self:_received_event(event_name, args)

				if state_machine_index <= ii then
					break
				end
			end
		end
	end
end

VisualStateMachine.event = function (self, event_name, ...)
	local root = self._root_state_machine

	root._pending_event = event_name
	root._pending_args = {
		...,
	}
end

VisualStateMachine.state_report = function (self)
	local s = ""
	local stack = self._state_machine_stack
	local start_index = self.find_in_table(stack, self)

	assert(start_index ~= nil, "to make a state report the state machine itself must be on the stack")

	for ii = start_index, #stack do
		local state_machine = stack[ii]

		s = s .. string.format("State %q waits for:\n", self._current_state_name(state_machine))

		local transitions = state_machine:_transitions_from_state()
		local had_transitions = false

		for kk, vv in pairs(transitions) do
			had_transitions = true
			s = s .. string.format("  %q => %s\n", kk, vv.NAME)
		end

		if not had_transitions then
			s = s .. "  <nothing>\n"
		end
	end

	return s
end

VisualStateMachine._transitions_from_state = function (self)
	if self._current_state == nil then
		return {}
	end

	local transitions = self._transitions[self._current_state.NAME]

	if transitions == nil then
		return {}
	end

	return transitions
end

VisualStateMachine._current_state_name = function (state_machine)
	local state_machine_name = state_machine._name
	local state_name = "<no state>"

	if state_machine._current_state ~= nil then
		state_name = state_machine._current_state.NAME

		if state_machine._current_state.name ~= nil then
			state_name = state_name .. ":" .. state_machine._current_state.name
		end
	end

	return state_machine_name .. ":" .. state_name
end

VisualStateMachine._handle_event = function (self, event_name, args)
	local state = self._current_state

	if state ~= nil then
		local transitions = self._transitions[state.NAME]

		if transitions ~= nil then
			local target_class = transitions[event_name]

			if target_class ~= nil then
				self:_leave_state()
				self:_enter_state(target_class, args)

				return true
			end
		end
	end

	return false
end

VisualStateMachine._received_event = function (self, event_name, args)
	local stack = self._state_machine_stack

	for ii = #stack, 1, -1 do
		local state_machine = stack[ii]

		if state_machine:_handle_event(event_name, args) then
			return ii
		end
	end

	local state_names = {}

	for _, state_machine in ipairs(self._state_machine_stack) do
		state_names[#state_names + 1] = self._current_state_name(state_machine)
	end

	local report = string.format("none of the active states (%s) handled the event %q\n", table.concat(state_names, ", "), event_name)

	report = report .. self._root_state_machine:state_report()

	assert(false, report)
end

VisualStateMachine.find_in_table = function (t, value)
	for ii, vv in ipairs(t) do
		if vv == value then
			return ii
		end
	end
end

VisualStateMachine._leave_state = function (self)
	local stack = self._state_machine_stack
	local stack_index = self.find_in_table(stack, self)

	assert(stack_index ~= nil, "leaving a state requires the state machine to be in the state machine stack")

	for ii = #stack, stack_index, -1 do
		local state_machine = stack[ii]
		local state = state_machine._current_state

		if state.leave then
			state:leave()
		end

		state_machine._current_state = nil

		if state.destroy ~= nil then
			state:destroy()
		end
	end
end

VisualStateMachine._enter_state = function (self, state_class, args)
	assert(self._current_state == nil, "entering a state twice is not allowed")
	assert(type(state_class.NAME) == "string", "States must have a class variable NAME set to a string value")

	local state = state_class:new(self, unpack(self._global_args))

	self._current_state = state

	if state.enter then
		state:enter(unpack(args))
	end

	return state
end
