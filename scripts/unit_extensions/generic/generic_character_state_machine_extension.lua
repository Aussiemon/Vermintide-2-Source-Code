require("scripts/unit_extensions/generic/generic_state_machine")

GenericCharacterStateMachineExtension = class(GenericCharacterStateMachineExtension)
GenericCharacterStateMachineExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.network_transmit = extension_init_context.network_transmit
	self.unit_storage = extension_init_context.unit_storage
	self.unit = unit
	self.player = extension_init_data.player
	self.start_state = extension_init_data.start_state
	self.character_state_class_list = extension_init_data.character_state_class_list
	self.nav_world = extension_init_data.nav_world
	self.state_machine = GenericStateMachine:new(self.world, self.unit)

	return 
end
GenericCharacterStateMachineExtension.extensions_ready = function (self)
	local character_state_init_context = {
		world = self.world,
		unit = self.unit,
		player = self.player,
		csm = self.state_machine,
		network_transmit = self.network_transmit,
		unit_storage = self.unit_storage,
		nav_world = self.nav_world
	}
	local states = {}
	local character_state_class_list = self.character_state_class_list

	for i = 1, #character_state_class_list, 1 do
		local state_instance = character_state_class_list[i]:new(character_state_init_context)
		local name = state_instance.name

		assert(name and states[name] == nil)

		states[name] = state_instance
	end

	local start_state = self.start_state

	self.state_machine:post_init(states, start_state)

	return 
end
GenericCharacterStateMachineExtension.destroy = function (self)
	self.state_machine:exit_current_state()

	return 
end
GenericCharacterStateMachineExtension.reset = function (self)
	self.state_machine:reset()

	return 
end
GenericCharacterStateMachineExtension.update = function (self, unit, input, dt, context, t)
	self.state_machine:update(unit, input, dt, context, t)

	return 
end
GenericCharacterStateMachineExtension.current_state = function (self)
	return self.state_machine:current_state()
end

return 
