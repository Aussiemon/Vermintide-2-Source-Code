DeathSystem = class(DeathSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_forced_kill"
}
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

	network_event_delegate:register(self, unpack(RPCS))

	self.unit_extensions = {}
	self.frozen_unit_extensions = {}
	self.death_reactions_to_start = {}
	self.active_reactions = {
		unit = {},
		husk = {}
	}
end

DeathSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
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
end

DeathSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extensions[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

DeathSystem.on_freeze_extension = function (self, unit, extension_name)
	ferror("Shouldn't get called, should run during death until unspawned/frozen.")
end

DeathSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self.unit_extensions[unit]

	if extension == nil then
		return
	end

	extension.death_has_started = false
	self.unit_extensions[unit] = nil
	self.death_reactions_to_start[unit] = nil
	self.active_reactions[extension.network_type][extension.death_reaction_template][unit] = nil
end

DeathSystem.freeze = function (self, unit, extension_name, reason)
	fassert(self.frozen_unit_extensions[unit] == nil, "Extension shouldn't be frozen on death")

	local extension = self.unit_extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self.unit_extensions[unit] = nil
	self.frozen_unit_extensions[unit] = extension
end

DeathSystem.unfreeze = function (self, unit, extension_name)
	local extension = self.frozen_unit_extensions[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extensions[unit] = nil
	self.unit_extensions[unit] = extension
end

DeathSystem.hot_join_sync = function (self, sender)
	return
end

local function start_death_reaction(unit, death_extension, killing_blow, active_reactions, t, context, is_server)
	local network_type = death_extension.network_type
	local death_reaction_template = death_extension.death_reaction_template
	local death_reaction = DeathReactions.templates[death_reaction_template][network_type]

	Profiler.start(profiler_names[network_type][death_reaction_template][1])

	local death_reaction_data, death_is_done = death_reaction.start(unit, context, t, killing_blow, is_server)

	Profiler.stop(profiler_names[network_type][death_reaction_template][1])

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
			Profiler.start("run_on_death")
			breed.run_on_death(unit, blackboard)
			Profiler.stop("run_on_death")
		end
	end
end

DeathSystem.update = function (self, context, t)
	local dt = context.dt
	local DeathReactions = DeathReactions
	local IS_DONE = DeathReactions.IS_DONE
	local profiler_names = profiler_names
	local active_reactions = self.active_reactions
	local death_reactions_to_start = self.death_reactions_to_start

	Profiler.start("start_death_reactions")

	for unit, killing_blow in pairs(death_reactions_to_start) do
		local death_extension = self.unit_extensions[unit]

		start_death_reaction(unit, death_extension, killing_blow, active_reactions, t, context, self.is_server)

		death_reactions_to_start[unit] = nil
	end

	Profiler.stop("start_death_reactions")
	Profiler.start("active_reactions")

	for network_type, templates in pairs(active_reactions) do
		for template, units in pairs(templates) do
			local death_reaction = DeathReactions.templates[template][network_type]

			for unit, extension in pairs(units) do
				Profiler.start(profiler_names[network_type][template][2])

				local death_is_done = death_reaction.update(unit, dt, context, t, extension.death_reaction_data)

				Profiler.stop(profiler_names[network_type][template][2])

				if death_is_done == IS_DONE then
					Unit.flow_event(unit, "lua_dead")

					extension.death_is_done = true
					active_reactions[network_type][template][unit] = nil
				end
			end
		end
	end

	Profiler.stop("active_reactions")
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

		ping_system:remove_ping_from_unit(unit)
	end

	local health_extension = extension.health_extension

	health_extension:set_dead()

	if is_hot_join_sync(killing_blow) then
		extension.death_has_started = true
	end

	local death_reactions_to_start = self.death_reactions_to_start
	death_reactions_to_start[unit] = killing_blow
end

DeathSystem._create_dummy_killing_blow = function (self, unit, damage_type)
	local killing_blow = FrameTable.alloc_table()
	local hit_position = Unit.world_position(unit, 0)
	local hit_position_table = hit_position and Vector3Aux.box(nil, hit_position)
	local hit_zone_name = "full"
	local damage_direction = Vector3.up()
	local damage_direction_table = Vector3Aux.box(nil, damage_direction)
	killing_blow[1] = NetworkConstants.damage.max
	killing_blow[2] = damage_type
	killing_blow[3] = unit
	killing_blow[4] = hit_zone_name
	killing_blow[5] = hit_position_table
	killing_blow[6] = damage_direction_table
	killing_blow[7] = "n/a"
	killing_blow[8] = "n/a"
	killing_blow[9] = "n/a"

	return killing_blow
end

DeathSystem.forced_kill = function (self, unit, damage_type)
	fassert(Managers.player:is_player_unit(unit), "Tried to perform forced_kill on non-player unit, ONLY USE THIS FOR PLAYERS!")
	fassert(self.is_server, "Do not call forced_kill on clients. Death should always occur on the server first, so call it on the server and it will sync out to clients.")

	local killing_blow = self:_create_dummy_killing_blow(unit, damage_type)

	self:kill_unit(unit, killing_blow)

	local go_id = self.unit_storage:go_id(unit)
	local damage_type_id = NetworkLookup.damage_types[damage_type]

	self.network_transmit:send_rpc_clients("rpc_forced_kill", go_id, damage_type_id)
end

DeathSystem.rpc_forced_kill = function (self, sender, unit_go_id, damage_type_id)
	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_go_id)
	local damage_type = NetworkLookup.damage_types[damage_type_id]

	if Unit.alive(unit) then
		if self.is_server then
			self:forced_kill(unit, damage_type)
		else
			local killing_blow = self:_create_dummy_killing_blow(unit, damage_type)

			self:kill_unit(unit, killing_blow)
		end
	end
end

return
