local extensions = {
	"GenericDialogueContextExtension"
}
DialogueContextSystem = class(DialogueContextSystem, ExtensionSystemBase)
DialogueContextSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.entity_manager = entity_manager
	self.unit_extension_data = {}

	GarbageLeakDetector.register_object(self, "dialogue_context_system")

	return 
end
DialogueContextSystem.destroy = function (self)
	self.unit_extension_data = nil

	return 
end
DialogueContextSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local status_extension = ScriptUnit.extension(unit, "status_system")
	local proximity_extension = ScriptUnit.extension(unit, "proximity_system")
	local context = ScriptUnit.extension(unit, "dialogue_system").context
	local extension = {
		health_extension = health_extension,
		status_extension = status_extension,
		proximity_extension = proximity_extension,
		context = context
	}

	assert(extension_init_data.profile)

	context.player_profile = extension_init_data.profile.character_vo

	ScriptUnit.set_extension(unit, "dialogue_context_system", extension, {})

	self.unit_extension_data[unit] = extension

	return extension
end
DialogueContextSystem.on_remove_extension = function (self, unit, extension_name)
	self.unit_extension_data[unit] = nil

	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
DialogueContextSystem.update = function (self, system_context, t)
	for unit, extension in pairs(self.unit_extension_data) do
		local context = extension.context
		context.health = extension.health_extension:current_health_percent()
		local status_extension = extension.status_extension
		context.is_pounced_down = not not status_extension.is_pounced_down(status_extension)
		context.is_knocked_down = not not status_extension.is_knocked_down(status_extension)
		context.intensity = status_extension.get_intensity(status_extension)
		context.pacing_state = Managers.state.conflict.pacing.pacing_state
		local proximity_extension = extension.proximity_extension
		local proximity_types = proximity_extension.proximity_types
		context.friends_close = proximity_types.friends_close.num
		context.friends_distant = proximity_types.friends_distant.num
		context.enemies_close = proximity_types.enemies_close.num
		context.enemies_distant = proximity_types.enemies_distant.num
		local new_foe = status_extension.primary_foe

		if context.primary_foe ~= new_foe then
			context.primary_foe = status_extension.new_foe
			context.primary_foe_name = (context.primary_foe and Unit.get_data(context.primary_foe, "breed").name) or nil
		end
	end

	return 
end
DialogueContextSystem.hot_join_sync = function (self, sender)
	return 
end

return 
