require("scripts/settings/dialogue_settings")

HealthTriggerSystem = class(HealthTriggerSystem, ExtensionSystemBase)
local extensions = {
	"HealthTriggerExtension"
}

HealthTriggerSystem.init = function (self, entity_system_creation_context, system_name)
	HealthTriggerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.unit_extensions = {}
end

HealthTriggerSystem.destroy = function (self)
	assert(not next(self.unit_extensions), "Found at least one unit that hasn't been unregistered for health trigger system.")

	self.unit_extensions = nil
end

HealthTriggerSystem.on_add_extension = function (self, world, unit, extension_name, ...)
	local extension = {}

	ScriptUnit.set_extension(unit, "health_trigger_system", extension)

	self.unit_extensions[unit] = extension
	extension.health_extension = ScriptUnit.extension(unit, "health_system")

	assert(extension.health_extension)

	extension.last_health_percent = extension.health_extension:current_health_percent()
	extension.last_health_tick_percent = extension.health_extension:current_health_percent()
	extension.dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	extension.tick_time = 0

	GarbageLeakDetector.register_object(extension, "health_trigger_extension")

	return extension
end

HealthTriggerSystem.on_remove_extension = function (self, unit, extension_name)
	assert(ScriptUnit.has_extension(unit, "health_trigger_system"), "Trying to remove non-existing extension %q from unit %s", extension_name, unit)
	ScriptUnit.remove_extension(unit, "health_trigger_system")

	self.unit_extensions[unit] = nil
end

local health_trigger_levels = HealthTriggerSettings.levels
local rapid_health_loss = HealthTriggerSettings.rapid_health_loss

HealthTriggerSystem.update = function (self, context, t)
	for unit, extension in pairs(self.unit_extensions) do
		local last_health_percent = extension.last_health_percent
		local health_extension = extension.health_extension
		local current_health_percent = health_extension:current_health_percent()

		if last_health_percent ~= current_health_percent then
			extension.last_health_percent = current_health_percent

			for _, amount in ipairs(health_trigger_levels) do
				if amount < last_health_percent and current_health_percent <= amount then
					local event_data = FrameTable.alloc_table()
					event_data.trigger_type = "decreasing"
					event_data.current_amount = current_health_percent
					event_data.last_amount = last_health_percent

					extension.dialogue_input:trigger_dialogue_event("health_trigger", event_data)

					local target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

					SurroundingAwareSystem.add_event(unit, "enemy_health_trigger", DialogueSettings.default_view_distance, "trigger_type", "decreasing", "current_amount", event_data.current_amount, "last_amount", event_data.last_amount, "target_name", target_name)
				elseif last_health_percent < amount and amount <= current_health_percent then
					local event_data = FrameTable.alloc_table()
					event_data.trigger_type = "increasing"
					event_data.current_amount = current_health_percent
					event_data.last_amount = last_health_percent

					extension.dialogue_input:trigger_dialogue_event("health_trigger", event_data)

					local target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile

					SurroundingAwareSystem.add_event(unit, "enemy_health_trigger", DialogueSettings.default_view_distance, "trigger_type", "increasing", "current_amount", event_data.current_amount, "last_amount", event_data.last_amount, "target_name", target_name)
				end
			end
		end

		if t > extension.tick_time + rapid_health_loss.tick_time then
			extension.tick_time = t
			local last_health_tick_percent = extension.last_health_tick_percent
			extension.last_health_tick_percent = current_health_percent
			local health_loss = last_health_tick_percent - current_health_percent
			local health_loss_threshold = rapid_health_loss.tick_loss_threshold
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if health_loss_threshold < health_loss and not status_extension:is_wounded() then
				local target_name = ScriptUnit.extension(unit, "dialogue_system").context.player_profile
				local event_data = FrameTable.alloc_table()
				event_data.trigger_type = "losing_rapidly"
				event_data.target_name = target_name

				extension.dialogue_input:trigger_dialogue_event("health_trigger", event_data)

				local has_shield = DialogueSystem:PlayerShieldCheck(unit, "slot_melee")

				SurroundingAwareSystem.add_event(unit, "health_trigger", DialogueSettings.default_view_distance, "trigger_type", "losing_rapidly", "has_shield", has_shield, "target_name", target_name)
			end
		end
	end
end

return
