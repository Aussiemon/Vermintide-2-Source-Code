require("scripts/network/peer_states")

PeerStateMachine = {}

local function network_printf(format, ...)
	if script_data.network_debug_connections then
		printf("[PeerSM] " .. format, ...)
	end

	return 
end

PeerStateMachine.create = function (server, peer_id, xb1_preconnect)
	local state_data = {
		server = server,
		peer_id = peer_id
	}
	local function_memoize = {}
	local state_machine = {
		state_data = state_data,
		current_state = PeerStates.Connecting,
		function_memoize = function_memoize
	}
	state_data.change_state = function (_, new_state)
		network_printf("%s :: on_exit %s", peer_id, tostring(state_machine.current_state))
		state_machine.current_state.on_exit(state_data, new_state)

		local old_state = state_machine.current_state
		state_machine.current_state = new_state

		network_printf("%s :: on_enter %s", peer_id, tostring(new_state))
		new_state.on_enter(state_data, old_state)

		return 
	end

	network_printf("%s :: on_enter %s", peer_id, tostring(state_machine.current_state))
	state_machine.current_state.on_enter(state_data)

	local state_machine_meta_table = {
		__newindex = function (t, k, v)
			assert(false)

			return 
		end,
		__index = function (self, k)
			local state_machine_member = PeerStateMachine[k]

			if not state_machine_member then
				local fetched_function = function_memoize[k]

				if not fetched_function then
					local function new_function(...)
						local current_function = self.current_state[k]
						slot1 = assert

						if current_function then
							slot2 = type(current_function == "function")
						end

						slot1(slot2, "Could not find function %q in state %q", k, tostring(self.current_state))
						current_function(state_data, ...)

						return 
					end

					function_memoize[k] = new_function

					return new_function
				else
					return fetched_function
				end
			else
				return state_machine_member
			end

			return 
		end
	}

	setmetatable(state_machine, state_machine_meta_table)

	return state_machine
end
PeerStateMachine.has_function = function (self, function_name)
	return not not self.current_state[function_name]
end
PeerStateMachine.update = function (self, dt)
	local state_data = self.state_data

	if script_data.debug_peers then
		Debug.text("Peer %s State %s", self.state_data.peer_id, tostring(self.current_state))
	end

	local new_state = self.current_state.update(state_data, dt)

	if new_state then
		state_data.change_state(state_data, new_state)
	end

	return 
end

return 
