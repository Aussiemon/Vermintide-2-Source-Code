DeathSystem = class(DeathSystem, ExtensionSystemBase)
local RPCS = {}
local extensions = {
	"GenericDeathExtension"
}
DeathReactions_profiler_names = DeathReactions_profiler_names or {
	unit = {},
	husk = {}
}
local profiler_names = DeathReactions_profiler_names
local BLACKBOARDS = BLACKBOARDS
DeathSystem.init = function (self, entity_system_creation_context, system_name)
	DeathSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.unit_extensions = {}
	self.death_reactions_to_start = {}
	self.active_reactions = {
		unit = {},
		husk = {}
	}

	return 
end
DeathSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
DeathSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, self.NAME, extension_init_data)
	self.unit_extensions[unit] = extension
	local template = extension.death_reaction_template
	local network_type = extension.network_type
	local active_reactions = self.active_reactions[network_type]
	active_reactions[template] = active_reactions[template] or {}
	profiler_names[network_type][template] = profiler_names[network_type][template] or {
		"start_" .. template,
		"update_" .. template
	}

	if not extension.is_alive and not extension.death_is_done then
		self.active_reactions[extension.network_type][extension.death_reaction_template][unit] = extension
	end

	return extension
end
DeathSystem.extensions_ready = function (self, world, unit, extension_name)
	local extension = self.unit_extensions[unit]
	local health_extension = ScriptUnit.extension(unit, "health_system")
	extension.health_extension = health_extension

	return 
end
DeathSystem.on_remove_extension = function (self, unit, extension_name)
	fassert(ScriptUnit.has_extension(unit, self.NAME), "Trying to remove non-existing extension %q from unit %s", extension_name, unit)
	ScriptUnit.remove_extension(unit, self.NAME)

	local extension = self.unit_extensions[unit]
	self.unit_extensions[unit] = nil
	self.death_reactions_to_start[unit] = nil
	self.active_reactions[extension.network_type][extension.death_reaction_template][unit] = nil

	return 
end
DeathSystem.hot_join_sync = function (self, sender)
	return 
end

local function start_death_reaction(unit, death_extension, killing_blow, active_reactions, t, context, is_server)
	local network_type = death_extension.network_type
	local death_reaction_template = death_extension.death_reaction_template
	local death_reaction = DeathReactions.templates[death_reaction_template][network_type]
	local death_reaction_data, death_is_done = death_reaction.start(unit, context, t, killing_blow, is_server)

	if death_is_done == DeathReactions.IS_DONE then
		Unit.flow_event(unit, "lua_dead")
	else
		active_reactions[network_type][death_reaction_template][unit] = death_extension
	end

	death_extension.death_reaction = death_reaction
	death_extension.death_reaction_data = death_reaction_data
	death_extension.death_is_done = death_is_done == DeathReactions.IS_DONE
	local blackboard = BLACKBOARDS[unit]

	if is_server and blackboard then
		local breed = blackboard.breed

		if breed.run_on_death then
			breed.run_on_death(unit, blackboard)
		end
	end

	return 
end

DeathSystem.update = function (self, context, t)
	local dt = context.dt
	local DeathReactions = DeathReactions
	local IS_DONE = DeathReactions.IS_DONE
	local profiler_names = profiler_names
	local active_reactions = self.active_reactions
	local death_reactions_to_start = self.death_reactions_to_start

	for unit, killing_blow in pairs(death_reactions_to_start) do
		local death_extension = self.unit_extensions[unit]

		start_death_reaction(unit, death_extension, killing_blow, active_reactions, t, context, self.is_server)

		death_reactions_to_start[unit] = nil
	end

	for network_type, templates in pairs(active_reactions) do
		for template, units in pairs(templates) do
			local death_reaction = DeathReactions.templates[template][network_type]

			for unit, extension in pairs(units) do
				local death_is_done = death_reaction.update(unit, dt, context, t, extension.death_reaction_data)

				if death_is_done == IS_DONE then
					Unit.flow_event(unit, "lua_dead")

					extension.death_is_done = true
					active_reactions[network_type][template][unit] = nil
				end
			end
		end
	end

	return 
end

local function is_hot_join_sync(killing_blow)
	local damage_type = killing_blow[DamageDataIndex.DAMAGE_TYPE]

	return damage_type == "sync_health"
end

DeathSystem.kill_unit = function (self, unit, killing_blow)
	local extension = self.unit_extensions[unit]

	if not extension then
		return 
	end

	if self.is_server then
		local ping_system = Managers.state.entity:system("ping_system")

		ping_system.remove_ping_from_unit(ping_system, unit)
	end

	local health_extension = extension.health_extension

	health_extension.set_dead(health_extension)

	if is_hot_join_sync(killing_blow) then
		extension.death_has_started = true
	end

	local death_reactions_to_start = self.death_reactions_to_start
	death_reactions_to_start[unit] = killing_blow

	return 
end

return 
