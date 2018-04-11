require("scripts/entity_system/systems/animation/animation_callback_templates")

AnimationSystem = class(AnimationSystem, ExtensionSystemBase)
local position_lookup = POSITION_LOOKUP
local RPCS = {
	"rpc_sync_anim_state_1",
	"rpc_sync_anim_state_2",
	"rpc_sync_anim_state_3",
	"rpc_sync_anim_state_4",
	"rpc_sync_anim_state_5",
	"rpc_sync_anim_state_6",
	"rpc_sync_anim_state_7",
	"rpc_sync_anim_state_8",
	"rpc_sync_anim_state_9",
	"rpc_sync_anim_state_10",
	"rpc_sync_anim_state_11",
	"rpc_sync_anim_state_12",
	"rpc_anim_event",
	"rpc_anim_event_variable_float",
	"rpc_anim_set_variable_float",
	"rpc_link_unit",
	"rpc_anim_set_variable_by_distance",
	"rpc_anim_set_variable_by_time",
	"rpc_update_anim_variable_done"
}
local extensions = {}
AnimationSystem.init = function (self, entity_system_creation_context, system_name)
	AnimationSystem.super.init(self, entity_system_creation_context, system_name, extensions)
	Managers.state.event:register(self, "animation_callback", "animation_callback")

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.anim_variable_update_list = {}

	return 
end
AnimationSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
AnimationSystem.animation_callback = function (self, unit, callback, param)
	local cb = nil

	if self.is_server then
		cb = AnimationCallbackTemplates.server[callback]

		if cb then
			cb(unit, param)
		end
	end

	cb = AnimationCallbackTemplates.client[callback]

	if cb then
		cb(unit, param)
	end

	return 
end
AnimationSystem.update = function (self, context, t)
	self.update_anim_variables(self, t)

	return 
end
AnimationSystem.update_anim_variables = function (self, t)
	local position_lookup = position_lookup
	local vector3_length = Vector3.length
	local unit_alive = Unit.alive
	local s = 0
	local math_clamp = math.clamp
	local animation_set_variable = Unit.animation_set_variable

	for unit, data in pairs(self.anim_variable_update_list) do
		local pos = position_lookup[unit]

		if pos then
			local anim_value = nil

			if data.goal_pos then
				local pos = position_lookup[unit]
				local to_target = data.goal_pos:unbox() - pos

				if data.flat_distance then
					to_target = Vector3.flat(to_target)
				end

				local distance = vector3_length(to_target)
				local scale = data.scale
				anim_value = math_clamp(scale - (scale * distance) / data.initial_distance, 0, scale)
			else
				local jump_time = t - data.start_time
				local scale = data.scale
				anim_value = math_clamp((scale * jump_time) / data.duration, 0, scale)
			end

			animation_set_variable(unit, data.anim_variable_index, anim_value)

			s = s + 1
		else
			self.anim_variable_update_list[unit] = nil
		end
	end

	return 
end
AnimationSystem.rpc_sync_anim_state = function (self, sender, go_id, ...)
	local unit = self.unit_storage:unit(go_id)

	Unit.animation_set_state(unit, ...)

	return 
end
AnimationSystem.rpc_sync_anim_state_1 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_2 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_3 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_4 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_5 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_6 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_7 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_8 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_9 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_10 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_11 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_sync_anim_state_12 = AnimationSystem.rpc_sync_anim_state
AnimationSystem.rpc_anim_event_variable_float = function (self, sender, anim_id, go_id, variable_id, variable_value)
	local unit = self.unit_storage:unit(go_id)

	if not unit or not Unit.alive(unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_anim_event_variable_float", sender, anim_id, go_id, variable_id, variable_value)
	end

	if Unit.has_animation_state_machine(unit) then
		local event = NetworkLookup.anims[anim_id]

		assert(event, "[GameNetworkManager] Lookup missing for event_id", anim_id)

		local variable_name = NetworkLookup.anims[variable_id]
		local variable_index = Unit.animation_find_variable(unit, variable_name)

		Unit.animation_set_variable(unit, variable_index, variable_value)
		Unit.animation_event(unit, event)
	end

	return 
end
AnimationSystem.rpc_anim_set_variable_float = function (self, sender, go_id, variable_id, variable_value)
	local unit = self.unit_storage:unit(go_id)

	if not unit or not Unit.alive(unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_anim_set_variable_float", sender, go_id, variable_id, variable_value)
	end

	if Unit.has_animation_state_machine(unit) then
		local variable_name = NetworkLookup.anims[variable_id]
		local variable_index = Unit.animation_find_variable(unit, variable_name)

		Unit.animation_set_variable(unit, variable_index, variable_value)
	end

	return 
end
AnimationSystem.rpc_anim_event = function (self, sender, anim_id, go_id)
	local unit = self.unit_storage:unit(go_id)

	if not unit or not Unit.alive(unit) then
		return 
	end

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_anim_event", sender, anim_id, go_id)
	end

	if Unit.has_animation_state_machine(unit) then
		local event = NetworkLookup.anims[anim_id]

		assert(event, "[GameNetworkManager] Lookup missing for event_id", anim_id)
		Unit.animation_event(unit, event)
	end

	return 
end
AnimationSystem.rpc_link_unit = function (self, sender, child_unit_id, child_node, parent_unit_id, parent_node)
	local child_unit = self.unit_storage:unit(child_unit_id)
	local parent_unit = self.unit_storage:unit(parent_unit_id)
	local world = Unit.world(parent_unit)

	World.link_unit(world, child_unit, child_node, parent_unit, parent_node)

	return 
end
AnimationSystem.rpc_anim_set_variable_by_distance = function (self, sender, unit_id, anim_variable_index, goal_pos, scale, flat_distance)
	local unit = self.unit_storage:unit(unit_id)

	self._set_variable_by_distance(self, unit, anim_variable_index, goal_pos, scale, flat_distance)

	return 
end
AnimationSystem._set_variable_by_distance = function (self, unit, anim_variable_index, goal_pos, scale, flat_distance)
	local pos = position_lookup[unit]
	local to_target = goal_pos - pos

	if flat_distance then
		to_target = Vector3.flat(to_target)
	end

	local initial_distance = Vector3.length(to_target)

	if initial_distance < 0.001 then
		initial_distance = 0.001
	end

	local data = self.anim_variable_update_list[unit]

	if data then
		data.goal_pos = Vector3Box(goal_pos)
		data.initial_distance = initial_distance
		data.scale = scale
		data.anim_variable_index = anim_variable_index
	else
		self.anim_variable_update_list[unit] = {
			unit = unit,
			goal_pos = Vector3Box(goal_pos),
			anim_variable_index = anim_variable_index,
			initial_distance = initial_distance,
			scale = scale,
			flat_distance = flat_distance
		}
	end

	return 
end
AnimationSystem.rpc_anim_set_variable_by_time = function (self, sender, unit_id, anim_variable_index, int_16bit_duration, scale)
	local unit = self.unit_storage:unit(unit_id)
	local duration = int_16bit_duration * 0.00390625

	self._set_variable_by_time(self, unit, anim_variable_index, duration, scale)

	return 
end
AnimationSystem._set_variable_by_time = function (self, unit, anim_variable_index, duration, scale)
	local data = self.anim_variable_update_list[unit]
	local t = Managers.time:time("game")

	if data then
		data.start_time = t
		data.duration = duration
		data.scale = scale
		data.anim_variable_index = anim_variable_index
	else
		self.anim_variable_update_list[unit] = {
			unit = unit,
			start_time = t,
			duration = duration,
			anim_variable_index = anim_variable_index,
			scale = scale
		}
	end

	return 
end
AnimationSystem.rpc_update_anim_variable_done = function (self, sender, unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if self.anim_variable_update_list[unit] then
		self.anim_variable_update_list[unit] = nil
	end

	return 
end
AnimationSystem.set_update_anim_variable_done = function (self, unit)
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	self.network_transmit:send_rpc_clients("rpc_update_anim_variable_done", unit_id)

	self.anim_variable_update_list[unit] = nil

	return 
end
AnimationSystem.start_anim_variable_update_by_distance = function (self, unit, anim_variable_index, goal_pos, scale, flat_distance)
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	self.network_transmit:send_rpc_clients("rpc_anim_set_variable_by_distance", unit_id, anim_variable_index, goal_pos, scale, flat_distance)
	self._set_variable_by_distance(self, unit, anim_variable_index, goal_pos, scale, flat_distance)

	return 
end
AnimationSystem.start_anim_variable_update_by_time = function (self, unit, anim_variable_index, duration, scale)
	local int_16bit_duration = math.clamp(duration * 256, 0, 65535)
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	self.network_transmit:send_rpc_clients("rpc_anim_set_variable_by_time", unit_id, anim_variable_index, int_16bit_duration, scale)
	self._set_variable_by_time(self, unit, anim_variable_index, duration, scale)

	return 
end

return 
