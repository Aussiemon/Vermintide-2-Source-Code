TargetOverrideSystem = class(TargetOverrideSystem, ExtensionSystemBase)
TargetOverrideSystem.init = function (self, entity_system_creation_context, system_name, extension_list)
	TargetOverrideSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self._network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, "rpc_taunt")

	return 
end
TargetOverrideSystem.destroy = function (self)
	TargetOverrideSystem.super.destroy(self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
TargetOverrideSystem.rpc_taunt = function (self, sender, game_object_id, radius, duration, stagger, taunt_bosses)
	local unit = self.unit_storage:unit(game_object_id)

	ScriptUnit.extension(unit, "target_override_system"):taunt(radius, duration, stagger, taunt_bosses)

	return 
end

return 
