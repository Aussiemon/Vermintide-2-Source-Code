require("scripts/settings/unit_spawner_settings")

local unit_templates = require("scripts/network/unit_extension_templates")

local function call_destroy_listener(unit_destroy_listeners, unit)
	local listeners = unit_destroy_listeners[unit]

	if not listeners then
		return
	end

	for _, listener in pairs(listeners) do
		listener(unit)
	end

	unit_destroy_listeners[unit] = nil
end

local Unit_alive = Unit.alive
UnitSpawner = class(UnitSpawner)

UnitSpawner.init = function (self, world, entity_manager, is_server)
	self.world = world
	self.entity_manager = entity_manager
	self.unit_storage = nil
	self.is_server = is_server
	self.unit_deletion_information = {}
	self.deletion_queue = GrowQueue:new()
	self.temp_deleted_units_list = {}
	self.unit_unique_id = 0
	self.game_session = nil
	self.unit_synchronizer = nil
	self.own_peer_id = nil
	self.gameobject_functor_context = nil
	self.gameobject_initializers = nil
	self.gameobject_extractors = nil
	self.pending_extension_adds_map = {}
	self.pending_extension_adds_list = {}
	self.pending_extension_adds_list_n = 0
	self.unit_destroy_listeners = {}
	self.unit_destroy_listeners_post_cleanup = {}
	self.unit_death_watch_list = {}
	self.unit_death_watch_lookup = {}
	self.unit_death_watch_list_n = 0
	self.unit_death_watch_list_dirty = false
end

UnitSpawner.destroy = function (self)
	GarbageLeakDetector.register_object(self, "UnitSpawner")

	self.unit_destroy_listeners = nil
	self.entity_manager = nil
end

UnitSpawner.set_gameobject_initializer_data = function (self, initializer_function_table, extraction_function_table, gameobject_context)
	self.game_session = Network.game_session()

	fassert(self.game_session, "No game session when initializing game object")

	self.own_peer_id = Network.peer_id()

	fassert(self.own_peer_id, "No own peer id when initializing game object")

	self.gameobject_functor_context = gameobject_context
	self.gameobject_initializers = initializer_function_table
	self.gameobject_extractors = extraction_function_table
end

UnitSpawner.set_unit_storage = function (self, unit_storage)
	self.unit_storage = unit_storage
end

UnitSpawner.set_gameobject_to_unit_creator_function = function (self, func)
	self.create_unit_from_gameobject_function = func
end

UnitSpawner.set_unit_template_lookup_table = function (self, template_lut)
	self.unit_template_lut = template_lut
end

UnitSpawner.push_unit_to_death_watch_list = function (self, unit, t, data)
	self:freeze_unit_extensions(unit, t, data)

	self.unit_death_watch_list_n = self.unit_death_watch_list_n + 1
	self.unit_death_watch_list[self.unit_death_watch_list_n] = {
		unit = unit,
		t = t,
		data = data
	}
	self.unit_death_watch_lookup[unit] = self.unit_death_watch_list[self.unit_death_watch_list_n]
end

UnitSpawner.freeze_unit_extensions = function (self, unit, t, data)
	local is_husk = NetworkUnit.is_husk_unit(unit)
	local extensions_to_remove_on_death = unit_templates.extensions_to_remove_on_death(data.breed.unit_template, is_husk, self.is_server)

	if extensions_to_remove_on_death then
		self.entity_manager:freeze_extensions(unit, extensions_to_remove_on_death)
	end
end

UnitSpawner.prioritize_death_watch_unit = function (self, unit, t)
	local death_data = self.unit_death_watch_lookup[unit]

	if death_data then
		death_data.t = t
		self.unit_death_watch_list_dirty = true
	end
end

UnitSpawner.breed_in_death_watch = function (self, breed_name)
	local unit_death_watch_list = self.unit_death_watch_list

	for i = 1, self.unit_death_watch_list_n, 1 do
		local death_data = unit_death_watch_list[i]

		if breed_name == BLACKBOARDS[death_data.unit].breed.name then
			return true
		end
	end
end

UnitSpawner.update_death_watch_list = function (self)
	if self.unit_death_watch_list_dirty then
		table.sort(self.unit_death_watch_list, function (a, b)
			return a.t < b.t
		end)

		self.unit_death_watch_list_dirty = false
	end

	local num_alive_and_dead_units = #Managers.state.conflict:spawned_units() + self.unit_death_watch_list_n

	if RagdollSettings.max_num_ragdolls < num_alive_and_dead_units then
		local units_to_remove = math.min(num_alive_and_dead_units - RagdollSettings.max_num_ragdolls, self.unit_death_watch_list_n)

		if self.unit_death_watch_list_n - units_to_remove < RagdollSettings.min_num_ragdolls then
			units_to_remove = units_to_remove - RagdollSettings.min_num_ragdolls
		end

		for idx = 1, units_to_remove, 1 do
			local my_death_data = nil

			if idx < self.unit_death_watch_list_n then
				my_death_data = self.unit_death_watch_list[idx]
				local swap_death_data = self.unit_death_watch_list[self.unit_death_watch_list_n]
				self.unit_death_watch_list[idx] = swap_death_data
				self.unit_death_watch_lookup[swap_death_data.unit] = self.unit_death_watch_list[idx]
				self.unit_death_watch_list[self.unit_death_watch_list_n] = nil
				self.unit_death_watch_lookup[my_death_data.unit] = nil
			else
				my_death_data = self.unit_death_watch_list[self.unit_death_watch_list_n]
				self.unit_death_watch_list[self.unit_death_watch_list_n] = nil
				self.unit_death_watch_lookup[my_death_data.unit] = nil
			end

			self.unit_death_watch_list_n = math.max(self.unit_death_watch_list_n - 1, 0)
			my_death_data.data.remove = true
		end

		self.unit_death_watch_list_dirty = true
	end
end

UnitSpawner.mark_for_deletion = function (self, unit)
	fassert(Unit_alive(unit), "Tried to destroy a unit (%s) that was already destroyed.", tostring(unit))
	self.deletion_queue:push_back(unit)

	local my_death_data = self.unit_death_watch_lookup[unit]

	if my_death_data then
		local idx = table.find(self.unit_death_watch_list, my_death_data)
		local swap_death_data = self.unit_death_watch_list[self.unit_death_watch_list_n]
		self.unit_death_watch_list[idx] = swap_death_data
		self.unit_death_watch_lookup[swap_death_data.unit] = self.unit_death_watch_list[idx]
		self.unit_death_watch_list[self.unit_death_watch_list_n] = nil
		self.unit_death_watch_lookup[my_death_data.unit] = nil
		self.unit_death_watch_list_n = math.max(self.unit_death_watch_list_n - 1, 0)
		self.unit_death_watch_list_dirty = true
	end
end

UnitSpawner.is_marked_for_deletion = function (self, unit)
	local deletion_queue = self.deletion_queue
	local is_marked = deletion_queue:contains(unit)

	return is_marked
end

UnitSpawner.commit_and_remove_pending_units = function (self)
	local n_commited = 0
	local n_removed = 0

	repeat
		n_commited = self:commit_pending_unit_system_registrations()
		n_removed = self:remove_units_marked_for_deletion()
	until n_commited + n_removed == 0
end

UnitSpawner.commit_pending_unit_system_registrations = function (self)
	fassert(not self.locked)

	local num_pending_units = self.pending_extension_adds_list_n

	if num_pending_units == 0 then
		return 0
	end

	local pending_extension_adds_map = self.pending_extension_adds_map
	local pending_extension_adds_list = self.pending_extension_adds_list
	local count = 0

	for unit, _ in pairs(pending_extension_adds_map) do
		pending_extension_adds_map[unit] = nil
		count = count + 1
		pending_extension_adds_list[count] = unit
	end

	fassert(count == num_pending_units)
	self.entity_manager:register_units_extensions(pending_extension_adds_list, num_pending_units)

	self.pending_extension_adds_list_n = 0

	return num_pending_units
end

UnitSpawner.remove_units_marked_for_deletion = function (self)
	fassert(not self.locked)

	local pending_extension_adds_map = self.pending_extension_adds_map
	local pending_extension_adds_list_n = self.pending_extension_adds_list_n
	local total_number_of_deleted_units = 0
	local entity_manager = self.entity_manager
	local world = self.world
	local world_delete_units_function = self.world_delete_units
	local temp_deleted_units_list = self.temp_deleted_units_list
	local unit_storage = self.unit_storage
	local unit_destroy_listeners = self.unit_destroy_listeners
	local unit_destroy_listeners_post_cleanup = self.unit_destroy_listeners_post_cleanup
	local unit = self.deletion_queue:pop_first()

	if Unit_alive(unit) then
		local number_of_deleted_units = 0

		call_destroy_listener(unit_destroy_listeners, unit)
		Unit.flow_event(unit, "cleanup_before_destroy")

		number_of_deleted_units = number_of_deleted_units + 1
		temp_deleted_units_list[number_of_deleted_units] = unit

		if pending_extension_adds_list_n > 0 and pending_extension_adds_map[unit] then
			pending_extension_adds_map[unit] = nil
			pending_extension_adds_list_n = pending_extension_adds_list_n - 1
		end

		entity_manager:unregister_units(temp_deleted_units_list, number_of_deleted_units)

		for i = 1, number_of_deleted_units, 1 do
			call_destroy_listener(unit_destroy_listeners_post_cleanup, temp_deleted_units_list[i])
		end

		world_delete_units_function(self, world, temp_deleted_units_list, number_of_deleted_units)

		total_number_of_deleted_units = total_number_of_deleted_units + number_of_deleted_units
	end

	self.pending_extension_adds_list_n = pending_extension_adds_list_n

	return total_number_of_deleted_units
end

UnitSpawner.spawn_local_unit = function (self, unit_name, position, rotation, material)
	local unit = World.spawn_unit(self.world, unit_name, position, rotation, material)
	local unit_unique_id = self.unit_unique_id
	self.unit_unique_id = unit_unique_id + 1

	Unit.set_data(unit, "unique_id", unit_unique_id)
	Unit.set_data(unit, "unit_name", unit_name)

	POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)

	return unit
end

local TEMP_SINGLE_UNIT_ARRAY = {}

UnitSpawner.create_unit_extensions = function (self, world, unit, unit_template_name, extension_init_data)
	local any_extensions_added = self.entity_manager:add_unit_extensions(world, unit, unit_template_name, extension_init_data)

	if any_extensions_added then
		local register_to_systems = not self.locked

		if register_to_systems then
			TEMP_SINGLE_UNIT_ARRAY[1] = unit

			self.entity_manager:register_units_extensions(TEMP_SINGLE_UNIT_ARRAY, 1)
		else
			self.pending_extension_adds_list_n = self.pending_extension_adds_list_n + 1
			self.pending_extension_adds_map[unit] = true
		end
	end
end

UnitSpawner.spawn_local_unit_with_extensions = function (self, unit_name, unit_template_name, extension_init_data, position, rotation, material)
	local unit = self:spawn_local_unit(unit_name, position, rotation, material)
	unit_template_name = unit_template_name or Unit.get_data(unit, "unit_template")

	self:create_unit_extensions(self.world, unit, unit_template_name, extension_init_data)

	return unit, unit_template_name
end

UnitSpawner.spawn_network_unit = function (self, unit_name, unit_template_name, extension_init_data, position, rotation, material)
	local unit, final_unit_template_name = self:spawn_local_unit_with_extensions(unit_name, unit_template_name, extension_init_data, position, rotation, material)
	local unit_template = self.unit_template_lut[final_unit_template_name]

	NetworkUnit.add_unit(unit)
	NetworkUnit.set_is_husk_unit(unit, false)

	local go_type = unit_template.go_type
	local go_initializer_function = self.gameobject_initializers[go_type]
	local go_init_data = go_initializer_function(unit, unit_name, unit_template, self.gameobject_functor_context)
	local go_id = GameSession.create_game_object(self.game_session, go_type, go_init_data)

	self.unit_storage:add_unit_info(unit, go_id, go_type, self.own_peer_id)
	self.entity_manager:sync_unit_extensions(unit, go_id)

	return unit, go_id
end

UnitSpawner.world_delete_units = function (self, world, units_list, units_list_n)
	local game_session = self.game_session
	local unit_storage = self.unit_storage

	if game_session then
		for i = 1, units_list_n, 1 do
			local unit = units_list[i]
			local unit_is_alive, unit_alive_name = Unit_alive(unit)
			local go_id_to_remove = unit_storage:go_id(unit)

			if not unit_is_alive then
				fassert(false)
			end

			if go_id_to_remove then
				GameSession.destroy_game_object(game_session, go_id_to_remove)
				unit_storage:remove(unit, go_id_to_remove)
				NetworkUnit.remove_unit(unit)
			end

			POSITION_LOOKUP[unit] = nil

			Unit.flow_event(unit, "unit_despawned")
			World.destroy_unit(world, unit)
		end
	else
		for i = 1, units_list_n, 1 do
			local unit = units_list[i]
			local unit_is_alive, unit_alive_name = Unit_alive(unit)

			if not unit_is_alive then
				fassert(false)
			end

			local go_id_to_remove = unit_storage:go_id(unit)

			if go_id_to_remove then
				unit_storage:remove(unit, go_id_to_remove)
				NetworkUnit.remove_unit(unit)
			end

			POSITION_LOOKUP[unit] = nil

			Unit.flow_event(unit, "unit_despawned")
			World.destroy_unit(world, unit)
		end
	end
end

UnitSpawner.spawn_unit_from_game_object = function (self, go_id, owner_id, go_template)
	local unit = self:create_unit_from_gameobject_function(self.game_session, go_id, go_template)

	NetworkUnit.add_unit(unit)
	NetworkUnit.set_is_husk_unit(unit, true)

	local go_type = go_template.go_type

	self.unit_storage:add_unit_info(unit, go_id, go_type, owner_id)

	local go_extract_functor = self.gameobject_extractors[go_type]

	fassert(type(go_extract_functor) == "function")

	local unit_template_name, extension_init_data = go_extract_functor(self.game_session, go_id, owner_id, unit, self.gameobject_functor_context)
	local is_husk = true

	self:create_unit_extensions(self.world, unit, unit_template_name, extension_init_data, is_husk)
end

UnitSpawner.destroy_game_object_unit = function (self, go_id, owner_id)
	local unit_storage = self.unit_storage
	local unit = unit_storage:units()[go_id]

	fassert(unit, "Couldn't find unit with go_id %d", go_id)

	if Unit.is_frozen(unit) then
		Unit.set_frozen(unit, false)
	end

	self.entity_manager:game_object_unit_destroyed(unit)
	self:mark_for_deletion(unit)
	unit_storage:remove(unit, go_id)
end

UnitSpawner.add_destroy_listener = function (self, unit, identifier, callback, post_cleanup_listener)
	local destroy_listeners = (post_cleanup_listener and self.unit_destroy_listeners_post_cleanup) or self.unit_destroy_listeners
	local listeners = destroy_listeners[unit]

	if not listeners then
		listeners = {}
		destroy_listeners[unit] = listeners
	end

	fassert(listeners[identifier] == nil, "Tried to register a unit destroy listener identifier (%s) twice for the same unit %s", tostring(identifier), tostring(unit))

	listeners[identifier] = callback
end

UnitSpawner.remove_destroy_listener = function (self, unit, identifier, post_cleanup_listener)
	local destroy_listeners = (post_cleanup_listener and self.unit_destroy_listeners_post_cleanup) or self.unit_destroy_listeners
	local listeners = destroy_listeners[unit]

	if listeners then
		listeners[identifier] = nil
	else
		printf("[UnitSpawner] [%s] failed to remove listener [%s] from unit [%s]", self.identifier_tag, tostring(identifier), tostring(unit))
	end
end

return
