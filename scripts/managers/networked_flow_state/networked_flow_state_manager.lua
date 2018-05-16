NetworkedFlowStateManager = class(NetworkedFlowStateManager)
local STORY_FRAMES_PER_SECOND = 30
local FLOW_STATE_TYPES = {
	boolean = {
		rpcs = {
			change = "rpc_flow_state_bool_changed"
		}
	},
	number = {
		network_constant = "number",
		rpcs = {
			change = "rpc_flow_state_number_changed"
		}
	}
}
local LOOP_MODE_LOOKUP = {
	"none",
	"loop",
	"ping_pong"
}

for k, v in ipairs(LOOP_MODE_LOOKUP) do
	LOOP_MODE_LOOKUP[v] = k
end

local RPCS = {
	"rpc_flow_state_story_played",
	"rpc_flow_state_story_stopped"
}

for _, config in pairs(FLOW_STATE_TYPES) do
	for _, rpc_name in pairs(config.rpcs) do
		RPCS[#RPCS + 1] = rpc_name
	end
end

script_data.networked_flow_state_debug = false

local function debug_print(str, ...)
	if script_data.networked_flow_state_debug then
		print("[NetworkedFlowStateManager]", string.format(str, ...))
	end
end

NetworkedFlowStateManager.init = function (self, world, is_server, network_event_delegate)
	self._level = nil
	self._story_lookup = {}
	self._playing_stories = {}
	self._object_states = {}
	self._num_states = 0
	self._max_states = 256

	if is_server then
		self._is_client = false
		self._storyteller = World.storyteller(world)
	else
		self._is_client = true

		network_event_delegate:register(self, unpack(RPCS))

		self._network_event_delegate = network_event_delegate
	end
end

NetworkedFlowStateManager.create_checkpoint_data = function (self)
	local object_states = {}

	for unit, unit_states in pairs(self._object_states) do
		local unit_level_id = Level.unit_index(self._level, unit)
		object_states[unit_level_id] = table.clone(unit_states)
	end

	local playing_stories = {}
	local storyteller = self._storyteller

	for client_call_event_name, story_data in pairs(self._playing_stories) do
		local checkpoint_story_data = table.clone(story_data)

		if not story_data.stopped then
			checkpoint_story_data.current_time = storyteller:time(story_data.id)
		end

		playing_stories[client_call_event_name] = checkpoint_story_data
	end

	local checkpoint_data = {
		object_states = object_states,
		playing_stories = playing_stories
	}

	return checkpoint_data
end

NetworkedFlowStateManager.load_checkpoint_data = function (self, checkpoint_data)
	for unit_level_id, unit_states in pairs(checkpoint_data.object_states) do
		for state_name, state_table in pairs(unit_states.states) do
			local value = state_table.value

			if value ~= state_table.default_value then
				local state_network_id = unit_states.lookup[state_name]

				self:client_flow_state_changed(unit_level_id, state_network_id, value, true)
			end
		end
	end

	local playing_stories = self._playing_stories

	for client_call_event_name, checkpoint_story_data in pairs(checkpoint_data.playing_stories) do
		local story_data = table.clone(checkpoint_story_data)
		playing_stories[client_call_event_name] = story_data

		if story_data.stopped then
			debug_print("Story %q has_stopped (checkpoint).", client_call_event_name)

			local stop_time = story_data.stop_time or story_data.length
			self._client_call_data = {
				stop_out = true
			}

			Level.trigger_event(self._level, client_call_event_name)

			self._client_call_data = {
				play_out = true,
				time_out = stop_time
			}

			Level.trigger_event(self._level, client_call_event_name)

			self._client_call_data = {
				stop_out = true
			}

			Level.trigger_event(self._level, client_call_event_name)
		else
			local start_time = story_data.current_time
			self._client_call_data = {
				play_out = true,
				time_out = start_time
			}

			debug_print("Story %q played (checkpoint) start_time: %2.2f,", client_call_event_name, start_time)
			Level.trigger_event(self._level, client_call_event_name)

			story_data.current_time = nil
		end
	end
end

NetworkedFlowStateManager.destroy = function (self)
	if self._is_client then
		self._network_event_delegate:unregister(self)
	end
end

NetworkedFlowStateManager.flow_cb_create_story = function (self, params)
	local lookup = self._story_lookup
	local client_call_event_name = params.client_call_event_name

	debug_print("Story %q created", client_call_event_name)

	if not lookup[client_call_event_name] then
		local index = #lookup + 1
		lookup[client_call_event_name] = index
		lookup[index] = client_call_event_name
	end
end

NetworkedFlowStateManager.flow_cb_play_networked_story = function (self, params)
	if self._is_client then
		return nil
	end

	local client_call_event_name = params.client_call_event_name

	fassert(self._story_lookup[client_call_event_name], "[NetworkedFlowStateManager] Trying to play networked story with client call event name %q that hasn't been created", client_call_event_name)
	fassert(self._playing_stories[client_call_event_name] == nil or self._playing_stories[client_call_event_name].stopped, "Tried to play networked story with client call event name %q, but it is already playing.", client_call_event_name)

	local story = self._playing_stories[client_call_event_name]
	local start_time = params.start_time or (params.start_from_stop_time and story and story.stop_time) or 0

	Managers.state.network.network_transmit:send_rpc_clients("rpc_flow_state_story_played", self._story_lookup[client_call_event_name], start_time, false)

	self._playing_stories[client_call_event_name] = {
		start_time = start_time
	}

	debug_print("Story %q played (server) start_time: %2.2f", client_call_event_name, start_time)

	return {
		play_out = true,
		time_out = start_time
	}
end

NetworkedFlowStateManager.rpc_flow_state_story_played = function (self, sender, client_call_event_name_id, start_time)
	local client_call_event_name = self._story_lookup[client_call_event_name_id]
	self._client_call_data = {
		play_out = true,
		time_out = start_time
	}

	debug_print("Story %q played (client) start_time: %2.2f,", client_call_event_name, start_time)
	Level.trigger_event(self._level, client_call_event_name)
end

NetworkedFlowStateManager.flow_cb_networked_story_client_call = function (self, params)
	local ret = self._client_call_data
	self._client_call_data = nil

	debug_print("Story %q client call (client).", params.client_call_event_name)

	return ret
end

NetworkedFlowStateManager.flow_cb_stop_networked_story = function (self, params)
	if self._is_client then
		return nil
	end

	local client_call_event_name = params.client_call_event_name

	debug_print("Stopping story %q (server).", client_call_event_name)

	local story = self._playing_stories[client_call_event_name]
	local stop_time = self._storyteller:time(story.id)
	story.stop_time = stop_time

	Managers.state.network.network_transmit:send_rpc_clients("rpc_flow_state_story_stopped", self._story_lookup[client_call_event_name], stop_time)

	return {
		stop_out = true
	}
end

NetworkedFlowStateManager.rpc_flow_state_story_stopped = function (self, sender, client_call_event_name_id, stop_time)
	local client_call_event_name = self._story_lookup[client_call_event_name_id]

	debug_print("Story %q has_stopped via rpc (client).", client_call_event_name)

	self._client_call_data = {
		stop_out = true
	}

	Level.trigger_event(self._level, client_call_event_name)

	self._client_call_data = {
		play_out = true,
		time_out = stop_time
	}

	Level.trigger_event(self._level, client_call_event_name)

	self._client_call_data = {
		stop_out = true
	}

	Level.trigger_event(self._level, client_call_event_name)
end

NetworkedFlowStateManager.flow_cb_has_stopped_networked_story = function (self, params)
	if self._is_client then
		return nil
	end

	local client_call_event_name = params.client_call_event_name
	local stories = self._playing_stories
	local story = stories[client_call_event_name]

	fassert(story, "[NetworkedFlowStateManager] Networked story with client call event name %q which is not running is reported as stopped.", client_call_event_name)

	story.stopped = true

	debug_print("Story %q has_stopped (server).", client_call_event_name)
end

NetworkedFlowStateManager.flow_cb_has_played_networked_story = function (self, params)
	if self._is_client then
		return nil
	end

	local client_call_event_name = params.client_call_event_name
	local story = self._playing_stories[client_call_event_name]

	fassert(story, "[NetworkedFlowStateManager] Networked story with client call event name %q which is not running is reported as running.", client_call_event_name)
	debug_print("Story %q has_played (server).", client_call_event_name)

	local id = params.story_id
	story.id = id
	story.length = self._storyteller:length(id)
end

NetworkedFlowStateManager.hot_join_sync = function (self, peer)
	self:_sync_states(peer)
	self:_sync_stories(peer)
end

NetworkedFlowStateManager._sync_stories = function (self, peer)
	local storyteller = self._storyteller

	debug_print("Hot join syncing peer %s", peer)

	for client_call_event_name, story_data in pairs(self._playing_stories) do
		local start_time = nil
		local stopped = story_data.stopped
		local story_time_constant = NetworkConstants.story_time

		if stopped then
			RPC.rpc_flow_state_story_stopped(peer, self._story_lookup[client_call_event_name], math.clamp(story_data.stop_time or story_data.length, story_time_constant.min, story_time_constant.max))
		else
			RPC.rpc_flow_state_story_played(peer, self._story_lookup[client_call_event_name], math.clamp(storyteller:time(story_data.id), story_time_constant.min, story_time_constant.max))
		end

		debug_print("Story %q being hot join synced to peer %s (server).", client_call_event_name, peer)
	end
end

NetworkedFlowStateManager._sync_states = function (self, peer)
	for unit, unit_states in pairs(self._object_states) do
		fassert(Unit.alive(unit), "[NetworkedFlowStateManager] Trying to hot join sync state variable for destroyed unit.")

		local unit_level_id = Level.unit_index(self._level, unit)

		for state_name, state_table in pairs(unit_states.states) do
			local value = state_table.value

			if value ~= state_table.default_value then
				local state_network_id = unit_states.lookup[state_name]
				local type_data = FLOW_STATE_TYPES[type(value)]
				value = self:_clamp_state(state_name, type_data, value)

				RPC[type_data.rpcs.change](peer, unit_level_id, state_network_id, value, true)
			end
		end
	end
end

NetworkedFlowStateManager.set_level = function (self, level)
	self._level = level
end

NetworkedFlowStateManager.flow_cb_create_state = function (self, unit, state_name, default_value, client_data_changed_event, hot_join_sync_event)
	fassert(Unit.alive(unit), "[NetworkedFlowStateManager] Passing destroyed unit into create flow state for state_name %q", state_name)
	fassert(self._num_states < self._max_states, "[NetworkedFlowStateManager] Too many object states(%i).", self._max_states)

	local states = self._object_states

	if not states[unit] then
		local unit_states = {
			lookup = {},
			states = {}
		}
	end

	fassert(not unit_states[state_name], "[NetworkedFlowStateManager] State %s already exists in unit %s", state_name, Unit.debug_name(unit))

	local state_network_id = #unit_states.lookup + 1
	unit_states.lookup[state_name] = state_network_id
	unit_states.lookup[state_network_id] = state_name
	unit_states.states[state_name] = {
		value = default_value,
		default_value = default_value,
		client_state_changed_event = client_data_changed_event,
		client_state_set_event = hot_join_sync_event,
		state_network_id = state_network_id
	}
	states[unit] = unit_states
	self._num_states = self._num_states + 1

	return true, default_value
end

NetworkedFlowStateManager.flow_cb_get_state = function (self, unit, state_name)
	local unit_states = self._object_states[unit]
	local state = unit_states and unit_states.states[state_name]

	fassert(state ~= nil, "[NetworkedFlowStateManager] State %s doesn't exists in unit %s", state_name, Unit.debug_name(unit))

	return state.value
end

NetworkedFlowStateManager.flow_cb_change_state = function (self, unit, state_name, new_state)
	if self._is_client then
		return
	end

	local level = self._level

	fassert(level, "[NetworkedFlowStateManager] Trying to change state %q to %s before level has been created. Feed correct setting on create instead of changing during level spawn.", state_name, tostring(new_state))
	fassert(Unit.alive(unit), "[NetworkedFlowStateManager] Passing destroyed unit into change state for state_name %q", state_name)

	local unit_states = self._object_states[unit]
	local current_state = unit_states and unit_states.states[state_name]

	fassert(current_state ~= nil, "[NetworkedFlowStateManager] State %q unit %q is being changed but has not yet been created.", state_name, Unit.debug_name(unit))

	current_state.value = new_state
	local unit_level_id = Level.unit_index(level, unit)
	local state_network_id = current_state.state_network_id
	local changed = current_state ~= new_state

	if changed then
		local type_data = FLOW_STATE_TYPES[type(new_state)]
		new_state = self:_clamp_state(state_name, type_data, new_state)

		Managers.state.network.network_transmit:send_rpc_clients(type_data.rpcs.change, unit_level_id, state_network_id, new_state, false)
	end

	return changed, new_state
end

NetworkedFlowStateManager._clamp_state = function (self, state_name, type_data, new_state)
	local network_constant = type_data.network_constant and NetworkConstants[type_data.network_constant]

	if network_constant and (new_state < network_constant.min or network_constant.max < new_state) then
		new_state = math.max(network_constant.min, math.min(network_constant.max, new_state))

		Application.warning("[NetworkedFlowStateManager] Networked Flow State %q value %f out of bounds [%f..%f]", state_name, new_state, network_constant.min, network_constant.max)
	end

	return new_state
end

NetworkedFlowStateManager.client_flow_state_changed = function (self, unit_level_id, state_network_id, new_state, only_set)
	local unit = Level.unit_by_index(self._level, unit_level_id)
	local states = self._object_states
	local unit_states = states[unit]

	fassert(unit_states, "[NetworkedFlowStateManager] Trying to change state for unit %q on client despite network flow state node not having been created on client.", tostring(unit))

	local state_name = unit_states.lookup[state_network_id]
	local state = unit_states.states[state_name]

	if script_data.debug_client_flow_state then
		printf("client flow state %q changed, old value: %s, new value: %s", state_name, tostring(state.value), tostring(new_state))
	end

	state.value = new_state
	local flow_event = (only_set and state.client_state_set_event) or state.client_state_changed_event

	Unit.flow_event(unit, flow_event)
end

NetworkedFlowStateManager.rpc_flow_state_bool_changed = function (self, sender, unit_level_id, state_network_id, new_state, only_set)
	self:client_flow_state_changed(unit_level_id, state_network_id, new_state, only_set)
end

NetworkedFlowStateManager.rpc_flow_state_number_changed = function (self, sender, unit_level_id, state_network_id, new_state, only_set)
	self:client_flow_state_changed(unit_level_id, state_network_id, new_state, only_set)
end

return
